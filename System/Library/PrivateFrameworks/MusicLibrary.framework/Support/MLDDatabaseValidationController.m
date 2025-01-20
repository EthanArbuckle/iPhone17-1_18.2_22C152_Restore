@interface MLDDatabaseValidationController
- (BOOL)isSuspended;
- (BOOL)isValidatedPath:(id)a3;
- (BOOL)shouldValidateDatabaseForLibrary:(id)a3;
- (MLDDatabaseValidationController)init;
- (NSMutableArray)suspendedValidations;
- (NSMutableSet)validatedDatabasePaths;
- (NSMutableSet)validatingDatabasePaths;
- (OS_dispatch_queue)validationQueue;
- (int)homeSharingCachesClearedNotificationToken;
- (int)languageChangeNotificationToken;
- (void)_exitForLocalizationChange;
- (void)_purgePendingDatabaseValidations;
- (void)_registerForLanguageChangeNotifications;
- (void)_tearDownLanguageChangeNotifications;
- (void)clearValidatedPaths;
- (void)dealloc;
- (void)resumeValidations;
- (void)setHomeSharingCachesClearedNotificationToken:(int)a3;
- (void)setLanguageChangeNotificationToken:(int)a3;
- (void)setSuspended:(BOOL)a3;
- (void)setSuspendedValidations:(id)a3;
- (void)setValidatedDatabasePaths:(id)a3;
- (void)setValidatingDatabasePaths:(id)a3;
- (void)setValidationQueue:(id)a3;
- (void)suspendValidations;
- (void)validateMusicLibrary:(id)a3 shouldTruncateDatabase:(BOOL)a4 completion:(id)a5;
@end

@implementation MLDDatabaseValidationController

- (BOOL)shouldValidateDatabaseForLibrary:(id)a3
{
  validationQueue = self->_validationQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(validationQueue);
  v6 = [v5 databasePath];

  if ([(MLDDatabaseValidationController *)self isSuspended])
  {
    v7 = os_log_create("com.apple.amp.medialibraryd", "Service");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543362;
      v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Validations are suspended: will require validation of library at - %{public}@", (uint8_t *)&v12, 0xCu);
    }

    goto LABEL_7;
  }
  v8 = +[NSFileManager defaultManager];
  unsigned int v9 = [v8 fileExistsAtPath:v6];

  if (!v9)
  {
LABEL_7:
    LOBYTE(v10) = 1;
    goto LABEL_8;
  }
  unsigned int v10 = [(NSMutableSet *)self->_validatedDatabasePaths containsObject:v6] ^ 1;
LABEL_8:

  return v10;
}

- (BOOL)isSuspended
{
  return self->_suspended;
}

- (void)validateMusicLibrary:(id)a3 shouldTruncateDatabase:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2020000000;
  char v38 = 1;
  validationQueue = self->_validationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004EBC;
  block[3] = &unk_10002D620;
  v34 = &v35;
  block[4] = self;
  id v11 = v8;
  id v33 = v11;
  dispatch_sync(validationQueue, block);
  if (v6 || *((unsigned char *)v36 + 24))
  {
    int v12 = [v11 databasePath];
    v13 = os_log_create("com.apple.amp.medialibraryd", "Service");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v40 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Enqueueing database validation for media library at path: %{public}@", buf, 0xCu);
    }

    v14 = self->_validationQueue;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10000D1BC;
    v30[3] = &unk_10002D8A8;
    v30[4] = self;
    id v15 = v12;
    id v31 = v15;
    dispatch_sync(v14, v30);
    id v16 = objc_alloc((Class)ML3DatabaseValidation);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10000D1C8;
    v27[3] = &unk_10002D300;
    v27[4] = self;
    id v17 = v15;
    id v28 = v17;
    id v29 = v9;
    id v18 = [v16 initWithLibrary:v11 delegate:self completion:v27];
    [v18 setTruncateBeforeValidating:v6];
    v19 = self->_validationQueue;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10000D330;
    v24[3] = &unk_10002D4E0;
    v24[4] = self;
    id v25 = v17;
    id v26 = v18;
    id v20 = v18;
    id v21 = v17;
    dispatch_sync(v19, v24);
  }
  else if (v9)
  {
    v22 = os_log_create("com.apple.amp.medialibraryd", "Service");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = [v11 databasePath];
      *(_DWORD *)buf = 138543362;
      v40 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Database at path %{public}@ already validated - Bypassing validation work", buf, 0xCu);
    }
    (*((void (**)(id, uint64_t, void))v9 + 2))(v9, 1, 0);
  }

  _Block_object_dispose(&v35, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validatingDatabasePaths, 0);
  objc_storeStrong((id *)&self->_validatedDatabasePaths, 0);
  objc_storeStrong((id *)&self->_suspendedValidations, 0);

  objc_storeStrong((id *)&self->_validationQueue, 0);
}

- (void)setSuspended:(BOOL)a3
{
  self->_suspended = a3;
}

- (void)setHomeSharingCachesClearedNotificationToken:(int)a3
{
  self->_homeSharingCachesClearedNotificationToken = a3;
}

- (int)homeSharingCachesClearedNotificationToken
{
  return self->_homeSharingCachesClearedNotificationToken;
}

- (void)setLanguageChangeNotificationToken:(int)a3
{
  self->_languageChangeNotificationToken = a3;
}

- (int)languageChangeNotificationToken
{
  return self->_languageChangeNotificationToken;
}

- (void)setValidatingDatabasePaths:(id)a3
{
}

- (NSMutableSet)validatingDatabasePaths
{
  return self->_validatingDatabasePaths;
}

- (void)setValidatedDatabasePaths:(id)a3
{
}

- (NSMutableSet)validatedDatabasePaths
{
  return self->_validatedDatabasePaths;
}

- (void)setSuspendedValidations:(id)a3
{
}

- (NSMutableArray)suspendedValidations
{
  return self->_suspendedValidations;
}

- (void)setValidationQueue:(id)a3
{
}

- (OS_dispatch_queue)validationQueue
{
  return self->_validationQueue;
}

- (void)_tearDownLanguageChangeNotifications
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:NSCurrentLocaleDidChangeNotification object:0];
  notify_cancel([(MLDDatabaseValidationController *)self languageChangeNotificationToken]);
}

- (void)_registerForLanguageChangeNotifications
{
  if ((MSVDeviceIsHomePod() & 1) == 0)
  {
    objc_initWeak(&location, self);
    id v3 = +[NSNotificationCenter defaultCenter];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000C8EC;
    v9[3] = &unk_10002CE68;
    objc_copyWeak(&v10, &location);
    id v4 = [v3 addObserverForName:NSCurrentLocaleDidChangeNotification object:0 queue:0 usingBlock:v9];

    p_languageChangeNotificationToken = &self->_languageChangeNotificationToken;
    BOOL v6 = dispatch_get_global_queue(25, 0);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10000C99C;
    handler[3] = &unk_10002CE90;
    objc_copyWeak(&v8, &location);
    notify_register_dispatch("com.apple.language.changed", p_languageChangeNotificationToken, v6, handler);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (void)_exitForLocalizationChange
{
  id v3 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[LanguageChange] Language change notification received. Preparing to exit...", buf, 2u);
  }

  validationQueue = self->_validationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000CAB4;
  block[3] = &unk_10002D170;
  block[4] = self;
  dispatch_sync(validationQueue, block);
}

- (void)_purgePendingDatabaseValidations
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_validationQueue);
  id v3 = [(MLDDatabaseValidationController *)self suspendedValidations];
  id v4 = [v3 copy];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_msgSend(v10, "runValidation", (void)v12);
        id v11 = [(MLDDatabaseValidationController *)self suspendedValidations];
        [v11 removeObject:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)resumeValidations
{
  validationQueue = self->_validationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000CD5C;
  block[3] = &unk_10002D170;
  block[4] = self;
  dispatch_async(validationQueue, block);
}

- (void)clearValidatedPaths
{
  id v3 = os_log_create("com.apple.amp.medialibraryd", "Service");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Lock: clearing previously validated databases", buf, 2u);
  }

  validationQueue = self->_validationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000CF08;
  block[3] = &unk_10002D170;
  block[4] = self;
  dispatch_sync(validationQueue, block);
}

- (void)suspendValidations
{
  validationQueue = self->_validationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000CFC0;
  block[3] = &unk_10002D170;
  block[4] = self;
  dispatch_sync(validationQueue, block);
}

- (BOOL)isValidatedPath:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  validationQueue = self->_validationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D16C;
  block[3] = &unk_10002D620;
  id v9 = v4;
  id v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(validationQueue, block);
  LOBYTE(validationQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)validationQueue;
}

- (void)dealloc
{
  [(MLDDatabaseValidationController *)self _tearDownLanguageChangeNotifications];
  v3.receiver = self;
  v3.super_class = (Class)MLDDatabaseValidationController;
  [(MLDDatabaseValidationController *)&v3 dealloc];
}

- (MLDDatabaseValidationController)init
{
  v12.receiver = self;
  v12.super_class = (Class)MLDDatabaseValidationController;
  v2 = [(MLDDatabaseValidationController *)&v12 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.medialibraryd.MLDDatabaseValidationController.SerialQueue", 0);
    validationQueue = v2->_validationQueue;
    v2->_validationQueue = (OS_dispatch_queue *)v3;

    id v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    suspendedValidations = v2->_suspendedValidations;
    v2->_suspendedValidations = v5;

    id v7 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    validatedDatabasePaths = v2->_validatedDatabasePaths;
    v2->_validatedDatabasePaths = v7;

    id v9 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    validatingDatabasePaths = v2->_validatingDatabasePaths;
    v2->_validatingDatabasePaths = v9;

    [(MLDDatabaseValidationController *)v2 _registerForLanguageChangeNotifications];
  }
  return v2;
}

@end