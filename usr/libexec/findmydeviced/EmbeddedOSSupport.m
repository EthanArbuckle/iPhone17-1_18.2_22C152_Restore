@interface EmbeddedOSSupport
- (NSNumber)bioLockState;
- (id)disableBiometricID;
@end

@implementation EmbeddedOSSupport

- (id)disableBiometricID
{
  v2 = sub_100004238();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Disabling biometry devices...", buf, 2u);
  }

  if (objc_opt_class())
  {
    v3 = +[BKDeviceManager availableDevices];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v4 = [v3 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v4)
    {
      id v5 = v4;
      v6 = 0;
      uint64_t v7 = *(void *)v21;
      NSErrorUserInfoKey v18 = NSLocalizedDescriptionKey;
      NSErrorUserInfoKey v17 = NSUnderlyingErrorKey;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v21 != v7) {
            objc_enumerationMutation(v3);
          }
          v9 = +[BKDevice deviceWithDescriptor:error:](BKDevice, "deviceWithDescriptor:error:", *(void *)(*((void *)&v20 + 1) + 8 * i), 0, v17, v18);
          v10 = sub_100004238();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v27 = v9;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Disabling biometry device - %@", buf, 0xCu);
          }

          if (v9)
          {
            id v19 = v6;
            unsigned int v11 = [v9 forceBioLockoutForAllUsersWithError:&v19];
            id v12 = v19;

            v13 = sub_100004238();
            v14 = v13;
            if (v11)
            {
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Successfully disabled biometry", buf, 2u);
              }
              v6 = v12;
            }
            else
            {
              if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                id v27 = v12;
                _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Error disabling biometry: %@", buf, 0xCu);
              }

              v24[0] = v18;
              v24[1] = v17;
              v25[0] = @"Couldn't disable biometry";
              v25[1] = v12;
              v14 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
              v6 = +[NSError errorWithDomain:@"com.apple.icloud.FindMyDevice.EmbeddedOSSupport" code:3 userInfo:v14];
            }
          }
          else
          {
            v14 = sub_100004238();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Not a biometry capable device", buf, 2u);
            }
          }
        }
        id v5 = [v3 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v5);
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v15 = sub_100004238();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100243324(v15);
    }

    v6 = +[NSError errorWithDomain:@"com.apple.icloud.FindMyDevice.EmbeddedOSSupport" code:1 userInfo:0];
  }

  return v6;
}

- (NSNumber)bioLockState
{
  v2 = +[BiometricKit manager];
  v3 = [v2 identities:0];
  id v21 = [v3 copy];

  uint64_t v31 = 1;
  +[BKDeviceManager availableDevices];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = 0;
    uint64_t v22 = *(void *)v28;
    *(void *)&long long v5 = 138412290;
    long long v19 = v5;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v28 != v22) {
          objc_enumerationMutation(obj);
        }
        v9 = +[BKDevice deviceWithDescriptor:error:](BKDevice, "deviceWithDescriptor:error:", *(void *)(*((void *)&v27 + 1) + 8 * i), 0, v19);
        if (v9)
        {
          v10 = sub_100004238();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v19;
            v34 = v9;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Checking biometry device state - %@", buf, 0xCu);
          }

          long long v25 = 0u;
          long long v26 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          id v11 = v21;
          id v12 = [v11 countByEnumeratingWithState:&v23 objects:v32 count:16];
          if (v12)
          {
            id v13 = v12;
            uint64_t v14 = *(void *)v24;
LABEL_11:
            uint64_t v15 = 0;
            while (1)
            {
              if (*(void *)v24 != v14) {
                objc_enumerationMutation(v11);
              }
              if (objc_msgSend(v9, "bioLockoutState:forUser:error:", &v31, objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v15), "userID"), 0))
              {
                uint64_t v16 = +[NSNumber numberWithInteger:v31];

                uint64_t v7 = (void *)v16;
                if (v31 != 1) {
                  break;
                }
              }
              if (v13 == (id)++v15)
              {
                id v13 = [v11 countByEnumeratingWithState:&v23 objects:v32 count:16];
                uint64_t v16 = (uint64_t)v7;
                if (v13) {
                  goto LABEL_11;
                }
                break;
              }
            }
          }
          else
          {
            uint64_t v16 = (uint64_t)v7;
          }

          uint64_t v7 = (void *)v16;
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v17 = v7;

  return (NSNumber *)v17;
}

@end