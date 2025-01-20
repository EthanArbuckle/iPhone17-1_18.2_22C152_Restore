@interface TLServiceAgent
- (BOOL)_connection:(id)a3 hasEntitlement:(id)a4;
- (BOOL)_connectionHasTonePreferencesReadAccessEntitlement:(id)a3;
- (BOOL)_connectionHasTonePreferencesWriteAccessEntitlement:(id)a3;
- (BOOL)_connectionHasUserGeneratedVibrationPatternsReadAccessEntitlement:(id)a3;
- (BOOL)_connectionHasUserGeneratedVibrationPatternsWriteAccessEntitlement:(id)a3;
- (BOOL)_ensureDirectoryContainingUserGeneratedVibrationStoreFileExistsWithError:(id *)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (void)_performBlockAffectingUserGeneratedVibrationPatterns:(id)a3 withCompletionHandler:(id)a4;
- (void)_postUserGeneratedVibrationPatternsDidChangeNotification;
- (void)removeAllUserGeneratedVibrationPatternsWithCompletionHandler:(id)a3;
- (void)retrieveCurrentTonePreferencesWithCompletionHandler:(id)a3;
- (void)retrieveUserGeneratedVibrationPatternsWithCompletionHandler:(id)a3;
- (void)setCurrentToneIdentifier:(id)a3 keyedByTopic:(id)a4 forPreferenceKey:(id)a5 completionHandler:(id)a6;
- (void)setUserGeneratedVibrationPatterns:(id)a3 withCompletionHandler:(id)a4;
@end

@implementation TLServiceAgent

- (BOOL)_connection:(id)a3 hasEntitlement:(id)a4
{
  v4 = [a3 valueForEntitlement:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v5 = [v4 BOOLValue];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)_connectionHasTonePreferencesReadAccessEntitlement:(id)a3
{
  return [(TLServiceAgent *)self _connection:a3 hasEntitlement:@"com.apple.system.get-alert-tone"];
}

- (BOOL)_connectionHasTonePreferencesWriteAccessEntitlement:(id)a3
{
  return [(TLServiceAgent *)self _connection:a3 hasEntitlement:@"com.apple.system.set-alert-tone"];
}

- (BOOL)_connectionHasUserGeneratedVibrationPatternsReadAccessEntitlement:(id)a3
{
  return 1;
}

- (BOOL)_connectionHasUserGeneratedVibrationPatternsWriteAccessEntitlement:(id)a3
{
  return 1;
}

- (void)retrieveCurrentTonePreferencesWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, id, void *))a3;
  unsigned __int8 v5 = +[NSXPCConnection currentConnection];
  LOBYTE(self) = [(TLServiceAgent *)self _connectionHasTonePreferencesReadAccessEntitlement:v5];

  if ((self & 1) == 0)
  {
    v9 = +[NSError tl_errorWithDomain:@"TLServiceAgentMissingEntitlement", @"Read access to tone preferences requires the entitlement %@.", @"com.apple.system.get-alert-tone" description];
    id v8 = 0;
    if (!v4) {
      goto LABEL_8;
    }
LABEL_7:
    v4[2](v4, v8, v9);
    goto LABEL_8;
  }
  CFPreferencesSynchronize(@"com.apple.ToneLibrary", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  CFDictionaryRef v6 = CFPreferencesCopyMultiple(0, @"com.apple.ToneLibrary", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100003930;
  v10[3] = &unk_1000082E8;
  id v11 = objc_alloc_init((Class)NSMutableDictionary);
  id v7 = v11;
  [(__CFDictionary *)v6 enumerateKeysAndObjectsUsingBlock:v10];
  if (v6) {
    CFRelease(v6);
  }
  id v8 = [v7 copy];

  v9 = 0;
  if (v4) {
    goto LABEL_7;
  }
LABEL_8:
}

- (void)setCurrentToneIdentifier:(id)a3 keyedByTopic:(id)a4 forPreferenceKey:(id)a5 completionHandler:(id)a6
{
  id value = a3;
  id v10 = a4;
  id v11 = (__CFString *)a5;
  v12 = (void (**)(id, BOOL, void *))a6;
  v13 = +[NSXPCConnection currentConnection];
  BOOL v14 = [(TLServiceAgent *)self _connectionHasTonePreferencesWriteAccessEntitlement:v13];

  if (v14)
  {
    if ([v10 length])
    {
      v15 = (void *)CFPreferencesCopyValue(v11, @"com.apple.ToneLibrary", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
      if (v15)
      {
        v16 = v15;
        id v17 = [v15 mutableCopy];
        CFRelease(v16);
      }
      else if ([value length])
      {
        id v17 = objc_alloc_init((Class)NSMutableDictionary);
      }
      else
      {
        id v17 = 0;
      }
      if ([value length])
      {
        [v17 setObject:value forKey:v10];
      }
      else
      {
        [v17 removeObjectForKey:v10];
        if (![v17 count])
        {

          id v17 = 0;
        }
      }
      CFPreferencesSetValue(v11, v17, @"com.apple.ToneLibrary", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
    }
    else
    {
      CFPreferencesSetValue(v11, value, @"com.apple.ToneLibrary", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
    }
    CFPreferencesSynchronize(@"com.apple.ToneLibrary", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
    v18 = 0;
    if (v12) {
      goto LABEL_17;
    }
  }
  else
  {
    v18 = +[NSError tl_errorWithDomain:@"TLServiceAgentMissingEntitlement", @"Write access to tone preferences requires the entitlement %@.", @"com.apple.system.set-alert-tone" description];
    if (v12) {
LABEL_17:
    }
      v12[2](v12, v14, v18);
  }
}

- (void)retrieveUserGeneratedVibrationPatternsWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, void *, id))a3;
  id v9 = 0;
  unsigned int v5 = [(TLServiceAgent *)self _ensureDirectoryContainingUserGeneratedVibrationStoreFileExistsWithError:&v9];
  id v6 = v9;
  id v7 = 0;
  if (v5)
  {
    id v8 = +[TLVibrationPersistenceUtilities userGeneratedVibrationStoreFileURL];
    id v7 = +[NSDictionary dictionaryWithContentsOfURL:v8];
    if (!v7)
    {
      id v7 = +[NSDictionary dictionary];
    }
  }
  v4[2](v4, v7, v6);
}

- (void)setUserGeneratedVibrationPatterns:(id)a3 withCompletionHandler:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100003EEC;
  v7[3] = &unk_100008310;
  id v8 = a3;
  id v6 = v8;
  [(TLServiceAgent *)self _performBlockAffectingUserGeneratedVibrationPatterns:v7 withCompletionHandler:a4];
}

- (void)removeAllUserGeneratedVibrationPatternsWithCompletionHandler:(id)a3
{
}

- (BOOL)_ensureDirectoryContainingUserGeneratedVibrationStoreFileExistsWithError:(id *)a3
{
  v4 = +[TLVibrationPersistenceUtilities userGeneratedVibrationStoreFileURL];
  unsigned int v5 = [v4 pathComponents];
  id v6 = (char *)[v5 count];
  if ((unint64_t)v6 >= 2)
  {
    uint64_t v7 = objc_msgSend(v5, "subarrayWithRange:", 0, v6 - 1);
    if (v7)
    {
      id v8 = (void *)v7;
      id v9 = +[NSString pathWithComponents:v7];

      if (v9)
      {
        id v10 = +[NSFileManager defaultManager];
        char v22 = 0;
        if ([v10 fileExistsAtPath:v9 isDirectory:&v22]) {
          BOOL v11 = v22 == 0;
        }
        else {
          BOOL v11 = 1;
        }
        if (!v11)
        {
          v18 = TLLogVibrationManagement();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "The directory containing user generated vibration store already exists.", buf, 2u);
          }
          goto LABEL_26;
        }
        id v20 = 0;
        unsigned int v12 = [v10 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:0 error:&v20];
        v13 = v20;
        v18 = v13;
        if (v12) {
          BOOL v14 = v13 == 0;
        }
        else {
          BOOL v14 = 0;
        }
        if (v14)
        {
          char v22 = 0;
          if ([v10 fileExistsAtPath:v9 isDirectory:&v22] && v22)
          {
LABEL_26:
            BOOL v16 = 1;
LABEL_30:

            goto LABEL_18;
          }
          v15 = TLLogVibrationManagement();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            sub_1000057D4(v15);
          }
        }
        else
        {
          v15 = TLLogVibrationManagement();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            sub_100005818((uint64_t)v18, v15);
          }
        }

        BOOL v16 = 0;
        goto LABEL_30;
      }
    }
  }
  id v9 = TLLogVibrationManagement();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_100005790(v9);
  }
  BOOL v16 = 0;
LABEL_18:

  if (a3 && !v16)
  {
    *a3 = +[NSError tl_errorWithDomain:@"TLServicePersistenceErrorDomain", @"Failed to create directory containing store file for user generated vibration: %@.", v4 description];
  }

  return v16;
}

- (void)_postUserGeneratedVibrationPatternsDidChangeNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"TLVibrationManagerUserGeneratedVibrationsDidChange", 0, 0, 1u);
}

- (void)_performBlockAffectingUserGeneratedVibrationPatterns:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = (uint64_t (**)(id, id *))a3;
  uint64_t v7 = (void (**)(id, uint64_t, void *))a4;
  id v15 = 0;
  unsigned int v8 = [(TLServiceAgent *)self _ensureDirectoryContainingUserGeneratedVibrationStoreFileExistsWithError:&v15];
  id v9 = v15;
  id v10 = v9;
  if (v8)
  {
    id v14 = v9;
    int v11 = v6[2](v6, &v14);
    id v12 = v14;

    if (v11)
    {
      [(TLServiceAgent *)self _postUserGeneratedVibrationPatternsDidChangeNotification];
      uint64_t v13 = 1;
    }
    else
    {
      uint64_t v13 = 0;
    }
    id v10 = v12;
  }
  else
  {
    uint64_t v13 = 0;
  }
  v7[2](v7, v13, v10);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  unsigned int v6 = [(TLServiceAgent *)self _connectionHasUserGeneratedVibrationPatternsReadAccessEntitlement:v5];
  unsigned int v7 = v6 | [(TLServiceAgent *)self _connectionHasUserGeneratedVibrationPatternsWriteAccessEntitlement:v5];
  unsigned int v8 = [(TLServiceAgent *)self _connectionHasTonePreferencesReadAccessEntitlement:v5];
  unsigned int v9 = v7 | v8 | [(TLServiceAgent *)self _connectionHasTonePreferencesWriteAccessEntitlement:v5];
  if (v9)
  {
    id v10 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___TLServiceAgentInterface];
    uint64_t v11 = objc_opt_class();
    id v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v11, objc_opt_class(), 0);
    [v10 setClasses:v12 forSelector:"retrieveCurrentTonePreferencesWithCompletionHandler:" argumentIndex:0 ofReply:1];

    [v5 setExportedInterface:v10];
    [v5 setExportedObject:self];
    [v5 resume];
  }
  else
  {
    uint64_t v13 = TLLogGeneral();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100005890(v5, v13);
    }
  }
  return v9;
}

@end