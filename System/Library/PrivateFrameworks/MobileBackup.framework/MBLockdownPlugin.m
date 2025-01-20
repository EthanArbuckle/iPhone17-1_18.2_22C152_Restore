@interface MBLockdownPlugin
- (id)_restoreLockdownKeysWithEngine:(id)a3;
- (id)_savePurpleBuddyRestoreState:(id)a3 persona:(id)a4;
- (id)_setLockdownValue:(id)a3 forDomain:(id)a4 key:(id)a5 connection:(id)a6;
- (id)_setPurpleBuddyRestoreState:(id)a3 withEngine:(id)a4;
- (id)endedBackupWithEngine:(id)a3 error:(id)a4;
- (id)endedRestoreWithPolicy:(id)a3 engine:(id)a4 error:(id)a5;
- (id)endingRestoreWithPolicy:(id)a3 engine:(id)a4;
- (id)preparingBackupWithEngine:(id)a3;
- (id)startingRestoreWithPolicy:(id)a3 engine:(id)a4;
@end

@implementation MBLockdownPlugin

- (id)preparingBackupWithEngine:(id)a3
{
  v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Backing up lockdown keys", buf, 2u);
    _MBLog();
  }
  v4 = MBGetDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Connecting to lockdown", buf, 2u);
    _MBLog();
  }
  id v59 = +[MBLockdown connect];
  if (v59)
  {
    v58 = +[NSMutableDictionary dictionaryWithCapacity:0];
    v5 = MBGetDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Copying lockdown keys", buf, 2u);
      _MBLog();
    }
    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    v6 = sub_10016CCB4();
    id v7 = [(NSDictionary *)v6 countByEnumeratingWithState:&v76 objects:v88 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v77;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v77 != v8) {
            objc_enumerationMutation(v6);
          }
          v10 = *(NSMutableDictionary **)(*((void *)&v76 + 1) + 8 * i);
          [(NSDictionary *)sub_10016CCB4() objectForKeyedSubscript:v10];
          uint64_t v11 = MBGetGestaltValueForKey();
          v12 = MBGetDefaultLog();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v85 = v10;
            __int16 v86 = 2112;
            uint64_t v87 = v11;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);
            v44 = v10;
            uint64_t v48 = v11;
            _MBLog();
          }
          if (v11) {
            [(NSMutableDictionary *)v58 setObject:v11 forKeyedSubscript:v10];
          }
        }
        id v7 = [(NSDictionary *)v6 countByEnumeratingWithState:&v76 objects:v88 count:16];
      }
      while (v7);
    }
    if (objc_msgSend(a3, "backsUpPrimaryAccount", v44, v48))
    {
      long long v74 = 0u;
      long long v75 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      v13 = +[NSSet setWithObjects:@"com.apple.Accessibility", @"com.apple.mobile.data_sync", @"com.apple.mobile.iTunes.accessories", @"com.apple.MobileDeviceCrashCopy", @"com.apple.TerminalFlashr", 0];
      id v14 = [(NSSet *)v13 countByEnumeratingWithState:&v72 objects:v83 count:16];
      if (v14)
      {
        uint64_t v52 = *(void *)v73;
        do
        {
          v15 = 0;
          id v51 = v14;
          do
          {
            if (*(void *)v73 != v52) {
              objc_enumerationMutation(v13);
            }
            v16 = *(NSMutableDictionary **)(*((void *)&v72 + 1) + 8 * (void)v15);
            v17 = MBGetDefaultLog();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v85 = v16;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Copying lockdown domain %{public}@", buf, 0xCu);
              v46 = v16;
              _MBLog();
            }
            id v18 = objc_msgSend(v59, "objectForDomain:andKey:", v16, 0, v46);
            v19 = v18;
            if (v18)
            {
              v54 = v16;
              v56 = v15;
              long long v70 = 0u;
              long long v71 = 0u;
              long long v68 = 0u;
              long long v69 = 0u;
              id v20 = [v18 countByEnumeratingWithState:&v68 objects:v82 count:16];
              if (v20)
              {
                uint64_t v21 = *(void *)v69;
                do
                {
                  for (j = 0; j != v20; j = (char *)j + 1)
                  {
                    if (*(void *)v69 != v21) {
                      objc_enumerationMutation(v19);
                    }
                    v23 = *(NSMutableDictionary **)(*((void *)&v68 + 1) + 8 * (void)j);
                    id v24 = objc_msgSend(v19, "objectForKeyedSubscript:", v23, v46, v49);
                    v25 = MBGetDefaultLog();
                    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412546;
                      v85 = v23;
                      __int16 v86 = 2112;
                      uint64_t v87 = (uint64_t)v24;
                      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);
                      v46 = v23;
                      id v49 = v24;
                      _MBLog();
                    }
                  }
                  id v20 = [v19 countByEnumeratingWithState:&v68 objects:v82 count:16];
                }
                while (v20);
              }
              -[NSMutableDictionary setObject:forKeyedSubscript:](v58, "setObject:forKeyedSubscript:", v19, v54, v46);
              id v14 = v51;
              v15 = v56;
            }
            else
            {
              if (MBIsInternalInstall())
              {
                if (!dword_10048258C && !atomic_fetch_add_explicit(&dword_10048258C, 1u, memory_order_relaxed))
                {
                  v26 = MBGetDefaultLog();
                  if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v85 = v16;
                    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_FAULT, "Failed to copy lockdown domain: %@", buf, 0xCu);
                    v46 = v16;
                    _MBLog();
                  }
                }
              }
              v27 = MBGetDefaultLog();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                v85 = v16;
                _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Failed to copy lockdown domain %{public}@", buf, 0xCu);
                v46 = v16;
                _MBLog();
              }
            }
            v15 = (char *)v15 + 1;
          }
          while (v15 != v14);
          id v14 = [(NSSet *)v13 countByEnumeratingWithState:&v72 objects:v83 count:16];
        }
        while (v14);
      }
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      id v28 = objc_msgSend(&off_10043B030, "countByEnumeratingWithState:objects:count:", &v64, v81, 16, v46);
      if (v28)
      {
        uint64_t v53 = *(void *)v65;
        do
        {
          uint64_t v29 = 0;
          id v55 = v28;
          do
          {
            if (*(void *)v65 != v53) {
              objc_enumerationMutation(&off_10043B030);
            }
            v30 = *(NSMutableDictionary **)(*((void *)&v64 + 1) + 8 * v29);
            v31 = MBGetDefaultLog();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v85 = v30;
              _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Copying keys from lockdown domain %{public}@", buf, 0xCu);
              v45 = v30;
              _MBLog();
            }
            id v32 = +[NSMutableDictionary dictionary];
            uint64_t v57 = v29;
            long long v62 = 0u;
            long long v63 = 0u;
            long long v60 = 0u;
            long long v61 = 0u;
            id v33 = [&off_10043B030 objectForKeyedSubscript:v30];
            id v34 = [v33 countByEnumeratingWithState:&v60 objects:v80 count:16];
            if (v34)
            {
              uint64_t v35 = *(void *)v61;
              do
              {
                for (k = 0; k != v34; k = (char *)k + 1)
                {
                  if (*(void *)v61 != v35) {
                    objc_enumerationMutation(v33);
                  }
                  v37 = *(NSMutableDictionary **)(*((void *)&v60 + 1) + 8 * (void)k);
                  id v38 = objc_msgSend(v59, "objectForDomain:andKey:", v30, v37, v47, v49);
                  v39 = MBGetDefaultLog();
                  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    v85 = v37;
                    __int16 v86 = 2112;
                    uint64_t v87 = (uint64_t)v38;
                    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);
                    v47 = v37;
                    id v49 = v38;
                    _MBLog();
                  }
                  if (v38)
                  {
                    [v32 setObject:v38 forKeyedSubscript:v37];
                  }
                }
                id v34 = [v33 countByEnumeratingWithState:&v60 objects:v80 count:16];
              }
              while (v34);
            }
            -[NSMutableDictionary setObject:forKeyedSubscript:](v58, "setObject:forKeyedSubscript:", v32, v30, v47);
            uint64_t v29 = v57 + 1;
          }
          while ((id)(v57 + 1) != v55);
          id v28 = [&off_10043B030 countByEnumeratingWithState:&v64 objects:v81 count:16];
        }
        while (v28);
      }
    }
    v42 = MBGetDefaultLog();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEBUG, "Disconnecting from lockdown", buf, 2u);
      _MBLog();
    }
    [v59 disconnect];
    v43 = MBGetDefaultLog();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v85 = v58;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "Saving lockdown keys in manifest properties: %@", buf, 0xCu);
      v45 = v58;
      _MBLog();
    }
    objc_msgSend(objc_msgSend(a3, "properties", v45), "setLockdownKeys:", v58);
    return 0;
  }
  else
  {
    if (MBIsInternalInstall())
    {
      if (!dword_100482588 && !atomic_fetch_add_explicit(&dword_100482588, 1u, memory_order_relaxed))
      {
        v40 = MBGetDefaultLog();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_FAULT, "Failed to connect to lockdown", buf, 2u);
          _MBLog();
        }
      }
    }
    return +[MBError errorWithCode:1 format:@"Unable to connect to lockdown to backup keys"];
  }
}

- (id)_setLockdownValue:(id)a3 forDomain:(id)a4 key:(id)a5 connection:(id)a6
{
  id result = a6;
  if (a6)
  {
    uint64_t v8 = 0;
    if (a3) {
      unsigned int v7 = [a6 setObject:a3 forDomain:a4 andKey:a5 withError:&v8];
    }
    else {
      unsigned int v7 = [a6 removeObjectWithDomain:a4 andKey:a5 withError:&v8];
    }
    if (v7) {
      return 0;
    }
    else {
      return v8;
    }
  }
  return result;
}

- (id)endedBackupWithEngine:(id)a3 error:(id)a4
{
  if (![a3 backsUpPrimaryAccount]
    || ([a3 isDeviceTransferEngine] & 1) != 0)
  {
    return 0;
  }
  v9 = MBGetDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Connecting to lockdown", buf, 2u);
    _MBLog();
  }
  id v10 = +[MBLockdown connect];
  if (!v10)
  {
    v13 = MBGetDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Unable to connect to lockdown to set PurpleBuddy keys", buf, 2u);
      _MBLog();
    }
    return 0;
  }
  *(void *)buf = 0;
  uint64_t v29 = buf;
  uint64_t v30 = 0x3052000000;
  v31 = sub_10016D47C;
  id v32 = sub_10016D48C;
  uint64_t v33 = 0;
  if (a4
    && (+[MBError isError:a4 withCode:500] & 1) == 0)
  {
    CFStringRef v7 = 0;
    goto LABEL_30;
  }
  uint64_t v11 = [+[NSTimeZone systemTimeZone] abbreviation];
  if ([a3 isCloudKitEngine])
  {
    v12 = MBGetDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v34 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Getting last backup date from the CloudKit engine", v34, 2u);
      _MBLog();
    }
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10016D498;
    v27[3] = &unk_100414CD8;
    v27[4] = buf;
    objc_msgSend(objc_msgSend(a3, "cache"), "enumerateSnapshots:", v27);
LABEL_20:
    CFStringRef v15 = @"LastCloudBackupTZ";
    CFStringRef v7 = @"LastCloudBackupDate";
    goto LABEL_25;
  }
  if ([a3 isServiceEngine])
  {
    id v14 = MBGetDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v34 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Getting last backup date from the service engine", v34, 2u);
      _MBLog();
    }
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10016D5B4;
    v26[3] = &unk_100414D00;
    v26[4] = buf;
    MBPerformWithCache((uint64_t)v26);
    goto LABEL_20;
  }
  v16 = MBGetDefaultLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v34 = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Using the current date as the last backup", v34, 2u);
    _MBLog();
  }
  [+[NSDate date] timeIntervalSinceReferenceDate];
  id v18 = +[NSNumber numberWithUnsignedLongLong:(unint64_t)v17];
  *((void *)v29 + 5) = v18;
  CFStringRef v15 = @"LastiTunesBackupTZ";
  CFStringRef v7 = @"LastiTunesBackupDate";
LABEL_25:
  if (!*((void *)v29 + 5)) {
    goto LABEL_31;
  }
  v19 = MBGetDefaultLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    uint64_t v20 = *((void *)v29 + 5);
    *(_DWORD *)id v34 = 138412802;
    uint64_t v35 = v20;
    __int16 v36 = 2112;
    v37 = v11;
    __int16 v38 = 2112;
    CFStringRef v39 = v7;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Setting last backup date to %@/%@ for key %@", v34, 0x20u);
    id v24 = v11;
    CFStringRef v25 = v7;
    uint64_t v23 = *((void *)v29 + 5);
    _MBLog();
  }
  CFStringRef v7 = [(MBLockdownPlugin *)self _setLockdownValue:*((void *)v29 + 5), @"com.apple.mobile.backup", v7, v10, v23, v24, v25 forDomain key connection];
  if (!v7)
  {
    CFStringRef v7 = [(MBLockdownPlugin *)self _setLockdownValue:v11 forDomain:@"com.apple.mobile.backup" key:v15 connection:v10];
    if (!v7)
    {
LABEL_31:
      int v21 = 0;
      goto LABEL_32;
    }
  }
LABEL_30:
  int v21 = 1;
LABEL_32:
  v22 = MBGetDefaultLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v34 = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "Disconnecting from lockdown", v34, 2u);
    _MBLog();
  }
  [v10 disconnect];

  if (!v21) {
    CFStringRef v7 = 0;
  }
  _Block_object_dispose(buf, 8);
  return (id)v7;
}

- (id)_savePurpleBuddyRestoreState:(id)a3 persona:(id)a4
{
  id v5 = objc_msgSend(objc_msgSend(a4, "userIncompleteRestoreDirectory"), "stringByAppendingPathComponent:", @"/var/mobile/Library/Preferences/com.apple.purplebuddy.plist");
  v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v18 = v5;
    __int16 v19 = 2114;
    id v20 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Saving the PurpleBuddy restore state at %{public}@: %{public}@", buf, 0x16u);
    id v12 = v5;
    id v14 = a3;
    _MBLog();
  }
  CFStringRef v7 = +[NSMutableDictionary dictionaryWithContentsOfFile:](NSMutableDictionary, "dictionaryWithContentsOfFile:", v5, v12, v14);
  if (!v7)
  {
    CFStringRef v7 = (NSMutableDictionary *)+[NSMutableDictionary dictionary];
    if (a3) {
      goto LABEL_5;
    }
LABEL_7:
    [(NSMutableDictionary *)v7 removeObjectForKey:@"SetupState"];
    [(NSMutableDictionary *)v7 removeObjectForKey:@"RestoreState"];
    goto LABEL_8;
  }
  if (!a3) {
    goto LABEL_7;
  }
LABEL_5:
  [(NSMutableDictionary *)v7 setObject:a3 forKeyedSubscript:@"SetupState"];
  [(NSMutableDictionary *)v7 setObject:a3 forKeyedSubscript:@"RestoreState"];
LABEL_8:
  id v8 = [v5 stringByDeletingLastPathComponent];
  v16 = 0;
  if (![+[NSFileManager defaultManager] createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:&v16])
  {
    v9 = MBGetDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v18 = v8;
      __int16 v19 = 2114;
      id v20 = v16;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to create the directory at %{public}@: %{public}@", buf, 0x16u);
      id v13 = v8;
      CFStringRef v15 = v16;
      _MBLog();
    }
  }
  if ([(NSMutableDictionary *)v7 writeToURL:+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v5, 0, v13, v15) error:&v16])return 0; {
  uint64_t v11 = MBGetDefaultLog();
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    id v18 = v5;
    __int16 v19 = 2114;
    id v20 = v16;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to saved the PurpleBuddy plist at %{public}@: %{public}@", buf, 0x16u);
    _MBLog();
  }
  return v16;
}

- (id)_setPurpleBuddyRestoreState:(id)a3 withEngine:(id)a4
{
  CFStringRef v7 = MBGetDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Connecting to lockdown", buf, 2u);
    _MBLog();
  }
  id v8 = +[MBLockdown connect];
  if (v8)
  {
    v9 = MBGetDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      CFStringRef v22 = @"com.apple.purplebuddy";
      __int16 v23 = 2112;
      CFStringRef v24 = @"SetupState";
      __int16 v25 = 2112;
      id v26 = a3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Setting %@ %@ to \"%@\"", buf, 0x20u);
      CFStringRef v17 = @"SetupState";
      id v19 = a3;
      CFStringRef v15 = @"com.apple.purplebuddy";
      _MBLog();
    }
    id v10 = [(MBLockdownPlugin *)self _setLockdownValue:a3, @"com.apple.purplebuddy", @"SetupState", v8, v15, v17, v19 forDomain key connection];
    if (!v10)
    {
      uint64_t v11 = MBGetDefaultLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        CFStringRef v22 = @"com.apple.purplebuddy";
        __int16 v23 = 2112;
        CFStringRef v24 = @"RestoreState";
        __int16 v25 = 2112;
        id v26 = a3;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Setting %@ %@ to \"%@\"", buf, 0x20u);
        CFStringRef v18 = @"RestoreState";
        id v20 = a3;
        CFStringRef v16 = @"com.apple.purplebuddy";
        _MBLog();
      }
      id v10 = [(MBLockdownPlugin *)self _setLockdownValue:a3, @"com.apple.purplebuddy", @"RestoreState", v8, v16, v18, v20 forDomain key connection];
      if (!v10
        && (![a4 isForegroundRestore]
         || (id v10 = -[MBLockdownPlugin _savePurpleBuddyRestoreState:persona:](self, "_savePurpleBuddyRestoreState:persona:", a3, [a4 persona])) == 0))
      {
        id v10 = 0;
      }
    }
    id v12 = MBGetDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Disconnecting from lockdown", buf, 2u);
      _MBLog();
    }
    [v8 disconnect];
  }
  else
  {
    id v13 = MBGetDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to connect to lockdown to set PurpleBuddy keys", buf, 2u);
      _MBLog();
    }
    return +[MBError errorWithCode:1 format:@"Unable to connect to lockdown to set PurpleBuddy keys"];
  }
  return v10;
}

- (id)startingRestoreWithPolicy:(id)a3 engine:(id)a4
{
  if (!objc_msgSend(a4, "restoresPrimaryAccount", a3)) {
    return 0;
  }
  if (([a4 isServiceEngine] & 1) == 0)
  {
    CFStringRef v16 = self;
    for (char i = 1; ; char i = 0)
    {
      char v7 = i;
      unsigned int v8 = [+[FMDFMIPManager sharedInstance] lockdownShouldDisableDeviceRestore];
      uint64_t v9 = fmdFMIPLastOperationResult;
      id v10 = MBGetDefaultLog();
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      if (!v9) {
        break;
      }
      if (v11)
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v18 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "-[FMDFMIPManager lockdownShouldDisableDeviceRestore] failed: %ld", buf, 0xCu);
        uint64_t v15 = v9;
        _MBLog();
      }
      if ((v7 & 1) == 0)
      {
        CFStringRef v12 = @"Failed to determine the Find My iPhone state";
        uint64_t v13 = 1;
        return +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", v13, v12, v15);
      }
    }
    self = v16;
    if (v11)
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v18) = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "-[FMDFMIPManager lockdownShouldDisableDeviceRestore] returned %d", buf, 8u);
      uint64_t v15 = v8;
      _MBLog();
    }
    if (v8)
    {
      CFStringRef v12 = @"Find My iPhone must be disabled before restoring";
      uint64_t v13 = 211;
      return +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", v13, v12, v15);
    }
  }
  if (objc_msgSend(a4, "isServiceEngine", v15)) {
    return [(MBLockdownPlugin *)self _setPurpleBuddyRestoreState:@"RestoringFromBackup" withEngine:a4];
  }
  else {
    return 0;
  }
}

- (id)endingRestoreWithPolicy:(id)a3 engine:(id)a4
{
  if (!objc_msgSend(a4, "restoresPrimaryAccount", a3)) {
    return 0;
  }
  if ([a4 isDeviceTransferEngine])
  {
    CFStringRef v6 = @"RestoredFromDevice";
    goto LABEL_9;
  }
  if ([a4 isDriveEngine])
  {
    CFStringRef v6 = @"RestoredFromiTunesBackup";
    goto LABEL_9;
  }
  if ([a4 isServiceEngine])
  {
    CFStringRef v6 = @"BackgroundRestoringFromiCloudBackup";
LABEL_9:
    id result = [(MBLockdownPlugin *)self _setPurpleBuddyRestoreState:v6 withEngine:a4];
    if (result) {
      return result;
    }
  }
  return [(MBLockdownPlugin *)self _restoreLockdownKeysWithEngine:a4];
}

- (id)_restoreLockdownKeysWithEngine:(id)a3
{
  if ((objc_msgSend(objc_msgSend(a3, "settingsContext"), "shouldRestoreSystemFiles") & 1) == 0)
  {
    v46 = MBGetDefaultLog();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "Not restoring lockdown keys since system files weren't restored", buf, 2u);
      _MBLog();
    }
    return 0;
  }
  id v4 = objc_msgSend(objc_msgSend(a3, "properties"), "lockdownKeys");
  if (v4)
  {
    id v5 = v4;
    CFStringRef v6 = MBGetDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Loaded saved lockdown keys: %@", buf, 0xCu);
      v50 = v5;
      _MBLog();
    }
    char v7 = MBGetDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Connecting to lockdown", buf, 2u);
      _MBLog();
    }
    id v8 = +[MBLockdown connect];
    if (!v8) {
      return +[MBError errorWithCode:1 format:@"Unable to connect to lockdown to restore keys"];
    }
    uint64_t v9 = MBGetDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Restoring lockdown domains", buf, 2u);
      _MBLog();
    }
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id v10 = +[NSSet setWithObjects:@"com.apple.Accessibility", @"com.apple.mobile.data_sync", @"com.apple.mobile.iTunes.accessories", @"com.apple.MobileDeviceCrashCopy", @"com.apple.TerminalFlashr", 0];
    id v11 = [(NSSet *)v10 countByEnumeratingWithState:&v79 objects:v90 count:16];
    long long v60 = v5;
    if (v11)
    {
      uint64_t v12 = *(void *)v80;
      uint64_t v54 = *(void *)v80;
      id v55 = v10;
      while (2)
      {
        uint64_t v13 = 0;
        id v57 = v11;
        do
        {
          if (*(void *)v80 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v59 = v13;
          uint64_t v14 = *(void *)(*((void *)&v79 + 1) + 8 * v13);
          uint64_t v15 = MBGetDefaultLog();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v14;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Restoring lockdown domain %@", buf, 0xCu);
            uint64_t v51 = v14;
            _MBLog();
          }
          CFStringRef v16 = MBGetDefaultLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v14;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Clearing lockdown domain %@", buf, 0xCu);
            uint64_t v51 = v14;
            _MBLog();
          }
          id v17 = objc_msgSend(v8, "objectForDomain:andKey:", v14, 0, v51);
          uint64_t v18 = v17;
          if (!v17)
          {
            uint64_t v48 = +[MBError errorWithCode:1, @"Error copying lockdown domain %@", v14 format];
LABEL_73:
            id v32 = v48;
            goto LABEL_74;
          }
          long long v77 = 0u;
          long long v78 = 0u;
          long long v75 = 0u;
          long long v76 = 0u;
          id v19 = [v17 countByEnumeratingWithState:&v75 objects:v89 count:16];
          if (v19)
          {
            uint64_t v20 = *(void *)v76;
            while (2)
            {
              for (char i = 0; i != v19; char i = (char *)i + 1)
              {
                if (*(void *)v76 != v20) {
                  objc_enumerationMutation(v18);
                }
                uint64_t v22 = *(void *)(*((void *)&v75 + 1) + 8 * i);
                __int16 v23 = MBGetDefaultLog();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)&uint8_t buf[4] = v22;
                  _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
                  uint64_t v52 = v22;
                  _MBLog();
                }
                *(void *)buf = 0;
                if ((objc_msgSend(v8, "removeObjectWithDomain:andKey:withError:", v14, v22, buf, v52) & 1) == 0)
                {

                  uint64_t v48 = +[MBError errorWithCode:1, @"Error clearing lockdown key %@ from domain %@: %@", v22, v14, *(void *)buf format];
                  goto LABEL_73;
                }
              }
              id v19 = [v18 countByEnumeratingWithState:&v75 objects:v89 count:16];
              if (v19) {
                continue;
              }
              break;
            }
          }

          id v5 = v60;
          CFStringRef v24 = MBGetDefaultLog();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v14;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Setting lockdown keys for domain %@", buf, 0xCu);
            uint64_t v52 = v14;
            _MBLog();
          }
          id v25 = objc_msgSend(v60, "objectForKeyedSubscript:", v14, v52);
          long long v73 = 0u;
          long long v74 = 0u;
          long long v71 = 0u;
          long long v72 = 0u;
          id v26 = [v25 countByEnumeratingWithState:&v71 objects:v88 count:16];
          if (v26)
          {
            uint64_t v27 = *(void *)v72;
LABEL_34:
            uint64_t v28 = 0;
            while (1)
            {
              if (*(void *)v72 != v27) {
                objc_enumerationMutation(v25);
              }
              uint64_t v29 = *(void *)(*((void *)&v71 + 1) + 8 * v28);
              id v30 = [v25 objectForKeyedSubscript:v29];
              v31 = MBGetDefaultLog();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                *(void *)&uint8_t buf[4] = v29;
                __int16 v86 = 2112;
                id v87 = v30;
                _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "%@: %@", buf, 0x16u);
                uint64_t v51 = v29;
                id v53 = v30;
                _MBLog();
              }
              id v32 = -[MBLockdownPlugin _setLockdownValue:forDomain:key:connection:](self, "_setLockdownValue:forDomain:key:connection:", v30, v14, v29, v8, v51, v53);
              if (v32) {
                goto LABEL_74;
              }
              if (v26 == (id)++v28)
              {
                id v26 = [v25 countByEnumeratingWithState:&v71 objects:v88 count:16];
                id v5 = v60;
                if (v26) {
                  goto LABEL_34;
                }
                break;
              }
            }
          }
          uint64_t v13 = v59 + 1;
          uint64_t v12 = v54;
          id v10 = v55;
        }
        while ((id)(v59 + 1) != v57);
        id v11 = [(NSSet *)v55 countByEnumeratingWithState:&v79 objects:v90 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v33 = [&off_10043B030 countByEnumeratingWithState:&v67 objects:v84 count:16];
    if (v33)
    {
      uint64_t v34 = *(void *)v68;
      uint64_t v56 = *(void *)v68;
      while (2)
      {
        uint64_t v35 = 0;
        id v58 = v33;
        do
        {
          if (*(void *)v68 != v34) {
            objc_enumerationMutation(&off_10043B030);
          }
          uint64_t v36 = *(void *)(*((void *)&v67 + 1) + 8 * v35);
          v37 = MBGetDefaultLog();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v36;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "Restoring lockdown keys for domain %@", buf, 0xCu);
            uint64_t v51 = v36;
            _MBLog();
          }
          uint64_t v61 = v35;
          id v38 = objc_msgSend(v5, "objectForKeyedSubscript:", v36, v51);
          long long v65 = 0u;
          long long v66 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          id v39 = [&off_10043B030 objectForKeyedSubscript:v36];
          id v40 = [v39 countByEnumeratingWithState:&v63 objects:v83 count:16];
          if (v40)
          {
            uint64_t v41 = *(void *)v64;
LABEL_53:
            uint64_t v42 = 0;
            while (1)
            {
              if (*(void *)v64 != v41) {
                objc_enumerationMutation(v39);
              }
              uint64_t v43 = *(void *)(*((void *)&v63 + 1) + 8 * v42);
              id v44 = [v38 objectForKeyedSubscript:v43];
              if (v44)
              {
                v45 = MBGetDefaultLog();
                if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  *(void *)&uint8_t buf[4] = v43;
                  __int16 v86 = 2112;
                  id v87 = v44;
                  _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "%@: %@", buf, 0x16u);
                  uint64_t v51 = v43;
                  id v53 = v44;
                  _MBLog();
                }
                id v32 = -[MBLockdownPlugin _setLockdownValue:forDomain:key:connection:](self, "_setLockdownValue:forDomain:key:connection:", v44, v36, v43, v8, v51, v53);
                if (v32) {
                  goto LABEL_74;
                }
              }
              if (v40 == (id)++v42)
              {
                id v40 = [v39 countByEnumeratingWithState:&v63 objects:v83 count:16];
                if (v40) {
                  goto LABEL_53;
                }
                break;
              }
            }
          }
          id v5 = v60;
          uint64_t v35 = v61 + 1;
          uint64_t v34 = v56;
        }
        while ((id)(v61 + 1) != v58);
        id v33 = [&off_10043B030 countByEnumeratingWithState:&v67 objects:v84 count:16];
        id v32 = 0;
        if (v33) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v32 = 0;
    }
LABEL_74:
    id v49 = MBGetDefaultLog();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEBUG, "Disconnecting from lockdown", buf, 2u);
      _MBLog();
    }
    [v8 disconnect];
    return v32;
  }
  return +[MBError errorWithCode:1 format:@"Saved lockdown keys not found in manifest properties"];
}

- (id)endedRestoreWithPolicy:(id)a3 engine:(id)a4 error:(id)a5
{
  if (!objc_msgSend(a4, "restoresPrimaryAccount", a3)) {
    return 0;
  }
  unsigned int v8 = [a4 isServiceEngine];
  if (!a5) {
    return 0;
  }
  if (!v8) {
    return 0;
  }
  id result = [(MBLockdownPlugin *)self _setPurpleBuddyRestoreState:0 withEngine:a4];
  if (!result) {
    return 0;
  }
  return result;
}

@end