@interface MSXPCAppRemovalService
- (id)_deleteAllUserDefaults;
- (void)removeAppWithReply:(id)a3;
@end

@implementation MSXPCAppRemovalService

- (void)removeAppWithReply:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  v5 = OS_LOG_XPCAPPREMOVAL();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_1000036A8(v5, v6, v7, v8, v9, v10, v11, v12);
  }

  v13 = [(MSXPCAppRemovalService *)self _deleteAllUserDefaults];
  v14 = OS_LOG_XPCAPPREMOVAL();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
  if (v13)
  {
    if (v15) {
      sub_10000363C((uint64_t)v13, v14, v17, v18, v19, v20, v21, v22);
    }
  }
  else if (v15)
  {
    sub_1000035C4(v14, v16, v17, v18, v19, v20, v21, v22);
  }

  v4[2](v4, v13);
}

- (id)_deleteAllUserDefaults
{
  v2 = +[NSUserDefaults standardUserDefaults];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v3 = [v2 dictionaryRepresentation];
  v4 = [v3 allKeys];

  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v8);
        uint64_t v10 = OS_LOG_XPCAPPREMOVAL();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v21 = v9;
          _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Removing user default key: %@", buf, 0xCu);
        }

        [v2 removeObjectForKey:v9];
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v6);
  }

  if ([v2 synchronize])
  {
    uint64_t v11 = 0;
  }
  else
  {
    NSErrorUserInfoKey v18 = NSLocalizedDescriptionKey;
    CFStringRef v19 = @"Unable to synchronize NSUserDefaults for AppRemoval.";
    uint64_t v12 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    uint64_t v11 = +[NSError errorWithDomain:@"com.apple.MobileStore.appremoval.errorDomain" code:-1 userInfo:v12];
  }

  return v11;
}

@end