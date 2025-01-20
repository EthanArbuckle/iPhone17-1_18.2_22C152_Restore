@interface NEHelperSettingsManager
- (NEHelperSettingsManager)initWithFirstMessage:(id)a3;
- (void)handleMessage:(id)a3;
@end

@implementation NEHelperSettingsManager

- (void)handleMessage:(id)a3
{
  id v3 = a3;
  string = xpc_dictionary_get_string(v3, "setting-name");
  int64_t int64 = xpc_dictionary_get_int64(v3, "setting-type");
  if (string) {
    BOOL v6 = strcmp(string, "CriticalDomains") == 0;
  }
  else {
    BOOL v6 = 0;
  }
  v7 = ne_log_obj();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = string;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Handling a Settings message with setting name %s", buf, 0xCu);
  }

  v8 = SCPreferencesCreate(kCFAllocatorDefault, @"nehelper", @"/Library/Preferences/com.apple.networkextension.control.plist");
  if (v8)
  {
    v9 = v8;
    if (SCPreferencesLock(v8, 1u))
    {
      CFStringRef v10 = CFStringCreateWithCString(kCFAllocatorDefault, string, 0x600u);
      switch(int64)
      {
        case 1:
          BOOL v11 = xpc_dictionary_get_BOOL(v3, "setting-value");
          v12 = (CFPropertyListRef *)&kCFBooleanTrue;
          if (!v11) {
            v12 = (CFPropertyListRef *)&kCFBooleanFalse;
          }
          SCPreferencesSetValue(v9, v10, *v12);
          goto LABEL_39;
        case 2:
          *(void *)buf = xpc_dictionary_get_int64(v3, "setting-value");
          CFNumberRef v33 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, buf);
          SCPreferencesSetValue(v9, v10, v33);
          myCFRelease();
          goto LABEL_39;
        case 3:
          v15 = xpc_dictionary_get_value(v3, "setting-value");
          v16 = v15;
          if (v15 && xpc_get_type(v15) == (xpc_type_t)&_xpc_type_array)
          {
            Error = SCPreferencesGetValue(v9, v10);
            v22 = (void *)_CFXPCCreateCFObjectFromXPCObject();
            v23 = sub_10000F23C((uint64_t)NEHelperSettingsManager, Error, v22);
            if (v6)
            {
              v24 = ne_log_large_obj();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315394;
                *(void *)&buf[4] = string;
                __int16 v35 = 2112;
                CFErrorRef v36 = (CFErrorRef)v22;
                _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Saving new %s: %@", buf, 0x16u);
              }
            }
            SCPreferencesSetValue(v9, v10, v23);

            goto LABEL_37;
          }
          v17 = ne_log_obj();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Setting value is not a valid array", buf, 2u);
          }

LABEL_29:
          goto LABEL_45;
        case 4:
          int v18 = SCPreferencesRemoveValue(v9, v10);
          v19 = ne_log_obj();
          v16 = v19;
          if (v18)
          {
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&buf[4] = v10;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Removed %@ setting", buf, 0xCu);
            }
          }
          else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            Error = SCCopyLastError();
            *(_DWORD *)buf = 138412546;
            *(void *)&buf[4] = v10;
            __int16 v35 = 2112;
            CFErrorRef v36 = (CFErrorRef)Error;
            _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to remove %@ setting: %@", buf, 0x16u);
LABEL_37:
          }
LABEL_39:
          if (SCPreferencesCommitChanges(v9))
          {
            sub_100001CA0((uint64_t)NEHelperServer, v3, 0, 0);
            if (v6)
            {
              uint32_t v25 = notify_post("com.apple.neconfigurationchanged");
              if (v25)
              {
                uint32_t v26 = v25;
                v27 = ne_log_obj();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315394;
                  *(void *)&buf[4] = "com.apple.neconfigurationchanged";
                  __int16 v35 = 1024;
                  LODWORD(v36) = v26;
                  _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Failed to post %s: %d", buf, 0x12u);
                }
              }
            }
          }
          else
          {
LABEL_45:
            v28 = ne_log_obj();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              CFErrorRef v31 = SCCopyLastError();
              *(_DWORD *)buf = 136315394;
              *(void *)&buf[4] = string;
              __int16 v35 = 2112;
              CFErrorRef v36 = v31;
              _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Failed to change %s: %@", buf, 0x16u);
            }
            sub_100001CA0((uint64_t)NEHelperServer, v3, 22, 0);
          }
          myCFRelease();
          if (!SCPreferencesUnlock(v9))
          {
            v29 = ne_log_obj();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              CFErrorRef v32 = SCCopyLastError();
              *(_DWORD *)buf = 136315394;
              *(void *)&buf[4] = "/Library/Preferences/com.apple.networkextension.control.plist";
              __int16 v35 = 2112;
              CFErrorRef v36 = v32;
              _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Failed to unlock preferences for %s: %@", buf, 0x16u);
            }
          }
          break;
        default:
          v16 = ne_log_obj();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134217984;
            *(void *)&buf[4] = int64;
            _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Invalid setting type: %lld", buf, 0xCu);
          }
          goto LABEL_29;
      }
    }
    else
    {
      v14 = ne_log_obj();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        CFErrorRef v30 = SCCopyLastError();
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "/Library/Preferences/com.apple.networkextension.control.plist";
        __int16 v35 = 2112;
        CFErrorRef v36 = v30;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to lock SCPreferences for %s: %@", buf, 0x16u);
      }
      sub_100001CA0((uint64_t)NEHelperServer, v3, 22, 0);
    }
    CFRelease(v9);
  }
  else
  {
    v13 = ne_log_obj();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      CFErrorRef v21 = SCCopyLastError();
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "/Library/Preferences/com.apple.networkextension.control.plist";
      __int16 v35 = 2112;
      CFErrorRef v36 = v21;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to create SCPreferences for %s: %@", buf, 0x16u);
    }
    sub_100001CA0((uint64_t)NEHelperServer, v3, 22, 0);
  }
}

- (NEHelperSettingsManager)initWithFirstMessage:(id)a3
{
  v4 = xpc_dictionary_get_remote_connection(a3);
  if (sub_10000E810((uint64_t)NEHelperServer, v4))
  {
    v9.receiver = self;
    v9.super_class = (Class)NEHelperSettingsManager;
    self = [(NEHelperSettingsManager *)&v9 init];
    v5 = self;
  }
  else
  {
    BOOL v6 = ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = sub_10000E870((uint64_t)NEHelperServer, v4);
      *(_DWORD *)buf = 138412546;
      id v11 = v8;
      __int16 v12 = 2080;
      v13 = "com.apple.private.networkextension.configuration";
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Denying settings manager connection because %@ does not have the %s entitlement", buf, 0x16u);
    }
    v5 = 0;
  }

  return v5;
}

@end