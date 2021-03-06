BEGIN TRANSACTION

BEGIN TRY

	DECLARE @UserId INT = 0

	INSERT INTO [Users]
	(
		[EmailConfirmed],
		[LockoutEnabled],
		[PasswordHash],
		[SecurityStamp],
		[UserName],
		[Email],
		[FullName],
		[CultureId],
		[UICultureId]
	)
		VALUES
	(
		1,
		0,
		'AINCgbCLUSYjSnDrVGtCJCNphNWOAtcGScdSIOXYpGoezJoyFBEuZ7cTq3jpdVCEwg==', /*password*/
		'79df49ad-983c-4680-8cd7-15c2058fd8e3',
		'admin',
		'admin@yourdomain.com',
		'Administrator [Super User]',
		'en-US',
		'en-US'
	)

	SET @UserId = SCOPE_IDENTITY()

	INSERT INTO UserRealms ([UserId], [Realm]) Values (@UserId, 1)

	INSERT INTO UserRoles ([UserId], [Role]) Values (@UserId, 'SuperUser')

	COMMIT

END TRY
BEGIN CATCH
	  
	ROLLBACK

	SELECT ERROR_MESSAGE()
	  
END CATCH  