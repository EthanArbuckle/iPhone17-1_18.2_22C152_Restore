@interface MSDHSnapshottedDataSaver
- (BOOL)adjustContentUnder:(id)a3 userHomePath:(id)a4;
- (BOOL)canDeviceHaveEnoughSpaceForItemDomainWithSize:(int64_t)a3;
- (BOOL)createIntermdediateDirectoriesInPathAndRestoreAttributes:(id)a3;
- (id)generateItemDomainsToBeSheltered;
- (id)originalPathFor:(id)a3;
- (int64_t)getFileSizeForItemAtPath:(id)a3;
- (void)moveBluetoothFilesToDataShelter;
- (void)movePreservedFilesToDataShelter:(id)a3 removeFilesOnSuccess:(BOOL)a4;
- (void)moveSecondPartyAppFilesToDataShelter;
- (void)rescueDataBasedOnItemDomains:(id)a3;
- (void)rescueDataToShelterFromSnapshottedVolumes;
@end

@implementation MSDHSnapshottedDataSaver

- (void)rescueDataToShelterFromSnapshottedVolumes
{
  id v3 = [(MSDHSnapshottedDataSaver *)self generateItemDomainsToBeSheltered];
  [(MSDHSnapshottedDataSaver *)self rescueDataBasedOnItemDomains:v3];
}

- (void)rescueDataBasedOnItemDomains:(id)a3
{
  id v45 = a3;
  v4 = +[NSFileManager defaultManager];
  v5 = sub_100027250();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    CFStringRef v77 = @"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/DataShelter";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Rescuing needed files to data shelter at %{public}@", buf, 0xCu);
  }

  if ([v4 fileExistsAtPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/DataShelter"])
  {
    id v74 = 0;
    unsigned __int8 v6 = [v4 removeItemAtPath:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/DataShelter" error:&v74];
    id v7 = v74;
    id v8 = v7;
    if ((v6 & 1) == 0)
    {
      obj = sub_100027250();
      if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
        sub_10002C488(v8, obj);
      }
      goto LABEL_73;
    }
    id v9 = v7;
  }
  else
  {
    id v9 = 0;
  }
  [(MSDHSnapshottedDataSaver *)self moveBluetoothFilesToDataShelter];
  [(MSDHSnapshottedDataSaver *)self moveSecondPartyAppFilesToDataShelter];
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  obj = v45;
  id v49 = [obj countByEnumeratingWithState:&v70 objects:v84 count:16];
  if (v49)
  {
    uint64_t v48 = *(void *)v71;
    v46 = self;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v71 != v48) {
          objc_enumerationMutation(obj);
        }
        uint64_t v50 = v10;
        v11 = *(void **)(*((void *)&v70 + 1) + 8 * v10);
        v52 = +[NSMutableArray array];
        long long v66 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        v53 = v11;
        id v12 = [v53 countByEnumeratingWithState:&v66 objects:v83 count:16];
        if (v12)
        {
          id v13 = v12;
          CFStringRef v14 = 0;
          uint64_t v15 = *(void *)v67;
          while (2)
          {
            for (i = 0; i != v13; i = (char *)i + 1)
            {
              if (*(void *)v67 != v15) {
                objc_enumerationMutation(v53);
              }
              CFStringRef v17 = *(const __CFString **)(*((void *)&v66 + 1) + 8 * i);
              if ([v4 fileExistsAtPath:v17])
              {
                int64_t v18 = [(MSDHSnapshottedDataSaver *)self getFileSizeForItemAtPath:v17];
                if (v18 < 0)
                {
                  v32 = sub_100027250();
                  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138543362;
                    CFStringRef v77 = v17;
                    _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Failed to get file size for item: %{public}@", buf, 0xCu);
                  }

                  goto LABEL_54;
                }
                CFStringRef v14 = (const __CFString *)((char *)v14 + v18);
              }
            }
            id v13 = [v53 countByEnumeratingWithState:&v66 objects:v83 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }
        else
        {
          CFStringRef v14 = 0;
        }

        v19 = sub_100027250();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134349056;
          CFStringRef v77 = v14;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Total free disk space needed for current item domain: %{public, iec-bytes}llu", buf, 0xCu);
        }

        if ([(MSDHSnapshottedDataSaver *)self canDeviceHaveEnoughSpaceForItemDomainWithSize:v14])
        {
          long long v63 = 0u;
          long long v61 = 0u;
          long long v62 = 0u;
          long long v60 = 0u;
          v53 = v53;
          id v20 = [v53 countByEnumeratingWithState:&v60 objects:v82 count:16];
          if (v20)
          {
            id v21 = v20;
            uint64_t v22 = *(void *)v61;
            v23 = v9;
            while (2)
            {
              for (j = 0; j != v21; j = (char *)j + 1)
              {
                if (*(void *)v61 != v22) {
                  objc_enumerationMutation(v53);
                }
                CFStringRef v25 = *(const __CFString **)(*((void *)&v60 + 1) + 8 * (void)j);
                v26 = [@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/DataShelter" stringByAppendingPathComponent:v25];
                v27 = [v26 stringByDeletingLastPathComponent];
                unsigned __int8 v28 = [v4 fileExistsAtPath:v25];
                v29 = sub_100027250();
                BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
                if (v28)
                {
                  if (v30)
                  {
                    *(_DWORD *)buf = 138543362;
                    CFStringRef v77 = v25;
                    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, ">>> Copying item from: '%{public}@'", buf, 0xCu);
                  }

                  id v59 = v23;
                  unsigned __int8 v31 = [v4 createDirectoryAtPath:v27 withIntermediateDirectories:1 attributes:0 error:&v59];
                  id v9 = v59;

                  if ((v31 & 1) == 0)
                  {
                    v33 = sub_100027250();
                    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                    {
                      v34 = [v9 localizedDescription];
                      *(_DWORD *)buf = 138543618;
                      CFStringRef v77 = v27;
                      __int16 v78 = 2114;
                      v79 = v34;
                      _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Failed to create parent folder %{public}@ with error - %{public}@", buf, 0x16u);
                    }
                    goto LABEL_52;
                  }
                  if (([v4 cloneFile:v25 to:v26 expectingHash:0 correctOwnership:0] & 1) == 0)
                  {
                    v33 = sub_100027250();
                    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                    {
                      v41 = [v9 localizedDescription];
                      *(_DWORD *)buf = 138543874;
                      CFStringRef v77 = v25;
                      __int16 v78 = 2114;
                      v79 = v26;
                      __int16 v80 = 2114;
                      v81 = v41;
                      _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Failed to copy item from %{public}@ to %{public}@ with error - %{public}@", buf, 0x20u);
                    }
LABEL_52:

LABEL_53:
                    self = v46;
                    goto LABEL_54;
                  }
                  [v52 addObject:v26];
                  if (!+[MSDXattr setContentRoot:v26]) {
                    goto LABEL_53;
                  }
                  v23 = v9;
                }
                else
                {
                  if (v30)
                  {
                    *(_DWORD *)buf = 138543362;
                    CFStringRef v77 = v25;
                    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, ">>> Skipping non-existent item: %{public}@", buf, 0xCu);
                  }
                }
              }
              id v21 = [v53 countByEnumeratingWithState:&v60 objects:v82 count:16];
              if (v21) {
                continue;
              }
              break;
            }
            id v9 = v23;
            self = v46;
          }
        }
        else
        {
          v53 = sub_100027250();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
            sub_10002C448(&v64, v65, v53);
          }
LABEL_54:

          long long v57 = 0u;
          long long v58 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          v53 = v52;
          id v35 = [v53 countByEnumeratingWithState:&v55 objects:v75 count:16];
          if (v35)
          {
            id v36 = v35;
            uint64_t v37 = *(void *)v56;
            while (2)
            {
              for (k = 0; k != v36; k = (char *)k + 1)
              {
                if (*(void *)v56 != v37) {
                  objc_enumerationMutation(v53);
                }
                CFStringRef v39 = *(const __CFString **)(*((void *)&v55 + 1) + 8 * (void)k);
                if ([v4 fileExistsAtPath:v39])
                {
                  id v54 = v9;
                  unsigned __int8 v40 = [v4 removeItemAtPath:v39 error:&v54];
                  id v8 = v54;

                  if ((v40 & 1) == 0)
                  {
                    v43 = sub_100027250();
                    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                    {
                      v44 = [v8 localizedDescription];
                      *(_DWORD *)buf = 138543618;
                      CFStringRef v77 = v39;
                      __int16 v78 = 2114;
                      v79 = v44;
                      _os_log_error_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "Failed to clean up item %{public}@ with error - %{public}@", buf, 0x16u);
                    }
                    goto LABEL_73;
                  }
                  id v9 = v8;
                }
              }
              id v36 = [v53 countByEnumeratingWithState:&v55 objects:v75 count:16];
              if (v36) {
                continue;
              }
              break;
            }
          }
        }

        uint64_t v10 = v50 + 1;
      }
      while ((id)(v50 + 1) != v49);
      id v42 = [obj countByEnumeratingWithState:&v70 objects:v84 count:16];
      id v49 = v42;
    }
    while (v42);
  }
  id v8 = v9;
LABEL_73:
}

- (id)generateItemDomainsToBeSheltered
{
  v2 = +[NSFileManager defaultManager];
  id v3 = +[NSMutableArray array];
  if ([&off_100052088 count]) {
    [v3 addObject:&off_100052088];
  }
  v4 = +[NSMutableArray array];
  [v4 addObject:@"/private/var/mobile/Library/Biome"];
  [v4 addObject:@"/private/var/db/biome"];
  [v3 addObject:v4];
  uint64_t v35 = 1;
  uint64_t v5 = container_system_group_path_for_identifier();
  if (v5)
  {
    unsigned __int8 v6 = (void *)v5;
    id v7 = +[NSMutableArray array];
    id v8 = +[NSString stringWithUTF8String:v6];
    id v9 = [v8 stringByAppendingPathComponent:@"Library"];

    [v7 addObject:v9];
    [v3 addObject:v7];
    free(v6);
  }
  else
  {
    id v7 = sub_100027250();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10002C514(&v35, v7, v10);
    }
  }

  v11 = +[NSArray arrayWithObject:@"/private/var/mobile/Library/AggregateDictionary"];
  [v3 addObject:v11];

  id v12 = [v2 contentsOfDirectoryAtPath:@"/private/var/mobile/Library/Logs/CrashReporter" error:0];
  id v13 = v12;
  if (v12 && [v12 count])
  {
    v29 = v4;
    BOOL v30 = v2;
    uint64_t v14 = +[NSPredicate predicateWithFormat:@"self BEGINSWITH 'log-aggregated-'"];
    v27 = +[NSPredicate predicateWithFormat:@"self CONTAINS 'Analytics-'"];
    unsigned __int8 v28 = (void *)v14;
    v37[0] = v14;
    v37[1] = v27;
    uint64_t v15 = +[NSArray arrayWithObjects:v37 count:2];
    v16 = +[NSCompoundPredicate orPredicateWithSubpredicates:v15];
    CFStringRef v17 = [v13 filteredArrayUsingPredicate:v16];

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v18 = v17;
    id v19 = [v18 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v32;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v32 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = [@"/private/var/mobile/Library/Logs/CrashReporter" stringByAppendingPathComponent:*(void *)(*((void *)&v31 + 1) + 8 * i)];
          v24 = +[NSArray arrayWithObject:v23];
          [v3 addObject:v24];
        }
        id v20 = [v18 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v20);
    }

    v4 = v29;
    v2 = v30;
  }
  CFStringRef v25 = +[NSMutableArray array];
  [v25 addObject:@"/private/var/db/diagnostics"];
  [v25 addObject:@"/private/var/db/uuidtext"];
  [v3 addObject:v25];

  return v3;
}

- (int64_t)getFileSizeForItemAtPath:(id)a3
{
  memset(&v9, 0, sizeof(v9));
  id v3 = a3;
  if (stat((const char *)[v3 fileSystemRepresentation], &v9))
  {
    unsigned __int8 v6 = sub_100027250();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10002C674();
    }
    goto LABEL_9;
  }
  int v4 = v9.st_mode & 0xF000;
  if (v4 == 0x8000)
  {
    off_t st_size = v9.st_size;
    goto LABEL_11;
  }
  if (v4 != 0x4000)
  {
    unsigned __int8 v6 = sub_100027250();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10002C588();
    }
LABEL_9:

LABEL_10:
    off_t st_size = -1;
    goto LABEL_11;
  }
  [v3 fileSystemRepresentation];
  if (dirstat_np())
  {
    id v8 = sub_100027250();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10002C5F4();
    }

    goto LABEL_10;
  }
  off_t st_size = 0;
LABEL_11:

  return st_size;
}

- (BOOL)canDeviceHaveEnoughSpaceForItemDomainWithSize:(int64_t)a3
{
  int v4 = (void *)MGCopyAnswer();
  uint64_t v5 = v4;
  if (!v4)
  {
    unsigned __int8 v6 = sub_100027250();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10002C6F4(v6);
    }
    goto LABEL_15;
  }
  unsigned __int8 v6 = [v4 objectForKey:kMGQDiskUsageAmountDataAvailable];
  id v7 = [v5 objectForKey:kMGQDiskUsageAmountDataReserved];
  id v8 = sub_100027250();
  stat v9 = v8;
  if (v6) {
    BOOL v10 = v7 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10002C738(v9);
    }

LABEL_15:
    BOOL v12 = 0;
    goto LABEL_9;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 134218496;
    id v15 = [v6 longLongValue];
    __int16 v16 = 2048;
    id v17 = [v7 longLongValue];
    __int16 v18 = 2048;
    int64_t v19 = a3;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "dataAvailable:  %lld - dataReserved:  %lld - itemDomainSize:  %lld", (uint8_t *)&v14, 0x20u);
  }

  v11 = (char *)[v6 longLongValue];
  BOOL v12 = (uint64_t)v11 > (uint64_t)((char *)[v7 longLongValue] + a3);

LABEL_9:
  return v12;
}

- (void)moveBluetoothFilesToDataShelter
{
}

- (void)moveSecondPartyAppFilesToDataShelter
{
}

- (void)movePreservedFilesToDataShelter:(id)a3 removeFilesOnSuccess:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = (char *)a3;
  unsigned __int8 v6 = +[NSFileManager defaultManager];
  id v7 = sub_100027250();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    long long v66 = v5;
    __int16 v67 = 1024;
    LODWORD(v68) = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Preserving files from %{public}@ - removeFilesOnSuccess:  %{BOOLean}d", buf, 0x12u);
  }
  BOOL v49 = v4;

  id v8 = +[NSURL fileURLWithPath:v5 isDirectory:1];
  v74[0] = NSURLIsRegularFileKey;
  v74[1] = NSURLIsDirectoryKey;
  stat v9 = +[NSArray arrayWithObjects:v74 count:2];
  BOOL v10 = [v6 enumeratorAtURL:v8 includingPropertiesForKeys:v9 options:0 errorHandler:&stru_10004CC38];

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id obj = v10;
  id v54 = [obj countByEnumeratingWithState:&v61 objects:v73 count:16];
  if (!v54)
  {
    int v35 = 0;
    id v12 = 0;
    goto LABEL_40;
  }
  uint64_t v50 = v5;
  id v12 = 0;
  v52 = v6;
  uint64_t v53 = *(void *)v62;
  *(void *)&long long v11 = 136315906;
  long long v48 = v11;
  do
  {
    id v13 = 0;
    do
    {
      if (*(void *)v62 != v53) {
        objc_enumerationMutation(obj);
      }
      int v14 = *(void **)(*((void *)&v61 + 1) + 8 * (void)v13);
      id v59 = 0;
      id v60 = 0;
      unsigned __int8 v15 = [v14 getResourceValue:&v60 forKey:NSURLIsRegularFileKey error:&v59];
      id v16 = v60;
      id v17 = v59;

      if ((v15 & 1) == 0)
      {
        long long v31 = sub_100027250();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          v38 = [v14 path];
          CFStringRef v39 = [v17 localizedDescription];
          *(_DWORD *)buf = 138543618;
          long long v66 = v38;
          __int16 v67 = 2114;
          long long v68 = v39;
          _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "getResourceValue NSURLIsRegularFileKey failed for %{public}@ with error %{public}@", buf, 0x16u);
        }
        v24 = 0;
        CFStringRef v25 = 0;
        v23 = 0;
        id v19 = 0;
        goto LABEL_33;
      }
      id v57 = 0;
      id v58 = 0;
      unsigned __int8 v18 = [v14 getResourceValue:&v58 forKey:NSURLIsDirectoryKey error:&v57];
      id v19 = v58;
      id v12 = v57;

      if (v18)
      {
        if (([v16 BOOLValue] & 1) == 0 && !objc_msgSend(v19, "BOOLValue")
          || ([v14 path],
              id v20 = objc_claimAutoreleasedReturnValue(),
              unsigned int v21 = +[MSDXattr isContentRoot:v20],
              v20,
              !v21))
        {
          v24 = 0;
          CFStringRef v25 = 0;
          v23 = 0;
LABEL_22:
          int v35 = 0;
          int v36 = 1;
          goto LABEL_23;
        }
        uint64_t v22 = [v14 path];
        v23 = [v22 substringFromIndex:[v50 length]];

        v24 = [@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/DataShelter" stringByAppendingPathComponent:v23];
        CFStringRef v25 = [v24 stringByDeletingLastPathComponent];
        if (([v52 fileExistsAtPath:v25] & 1) == 0)
        {
          id v56 = v12;
          unsigned __int8 v26 = [v52 createDirectoryAtPath:v25 withIntermediateDirectories:1 attributes:0 error:&v56];
          id v17 = v56;

          if ((v26 & 1) == 0)
          {
            long long v31 = sub_100027250();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              uint64_t v37 = [v17 localizedDescription];
              *(_DWORD *)buf = 138543618;
              long long v66 = v25;
              __int16 v67 = 2114;
              long long v68 = v37;
              _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Failed to create parent folder %{public}@. Error: %{public}@", buf, 0x16u);
            }
            goto LABEL_33;
          }
          id v12 = v17;
        }
        v27 = sub_100027250();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          unsigned __int8 v28 = [v14 path];
          *(_DWORD *)buf = 136315650;
          long long v66 = "-[MSDHSnapshottedDataSaver movePreservedFilesToDataShelter:removeFilesOnSuccess:]";
          __int16 v67 = 2114;
          long long v68 = v28;
          __int16 v69 = 2114;
          long long v70 = v24;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%s - Clone item %{public}@ ==> %{public}@", buf, 0x20u);
        }
        v29 = [v14 path];
        unsigned __int8 v30 = [v52 cloneFile:v29 to:v24 expectingHash:0 correctOwnership:0];

        if (v30) {
          goto LABEL_22;
        }
        long long v31 = sub_100027250();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          long long v32 = [v14 path];
          long long v33 = __error();
          long long v34 = strerror(*v33);
          *(_DWORD *)buf = v48;
          long long v66 = "-[MSDHSnapshottedDataSaver movePreservedFilesToDataShelter:removeFilesOnSuccess:]";
          __int16 v67 = 2114;
          long long v68 = v32;
          __int16 v69 = 2114;
          long long v70 = v24;
          __int16 v71 = 2080;
          long long v72 = v34;
          _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%s - Failed to clone item %{public}@ ==> %{public}@ - Error:  %s", buf, 0x2Au);
        }
      }
      else
      {
        long long v31 = sub_100027250();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          unsigned __int8 v40 = [v14 path];
          v41 = [v12 localizedDescription];
          *(_DWORD *)buf = 138543618;
          long long v66 = v40;
          __int16 v67 = 2114;
          long long v68 = v41;
          _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "getResourceValue NSURLIsDirectoryKey failed for %{public}@ with error %{public}@", buf, 0x16u);
        }
        v24 = 0;
        CFStringRef v25 = 0;
        v23 = 0;
      }
      id v17 = v12;
LABEL_33:

      int v36 = 0;
      int v35 = 6;
      id v12 = v17;
LABEL_23:

      if (!v36) {
        goto LABEL_38;
      }
      id v13 = (char *)v13 + 1;
    }
    while (v54 != v13);
    id v42 = [obj countByEnumeratingWithState:&v61 objects:v73 count:16];
    id v54 = v42;
  }
  while (v42);
  int v35 = 0;
LABEL_38:
  uint64_t v5 = v50;
  unsigned __int8 v6 = v52;
LABEL_40:

  if (v35 || !v49)
  {
    id v45 = v12;
  }
  else
  {
    v43 = sub_100027250();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      long long v66 = v5;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Remove preserved files from:  %{public}@", buf, 0xCu);
    }

    id v55 = v12;
    unsigned __int8 v44 = [v6 removeItemAtPath:v5 error:&v55];
    id v45 = v55;

    if ((v44 & 1) == 0)
    {
      v46 = sub_100027250();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        v47 = [v45 localizedDescription];
        *(_DWORD *)buf = 136315650;
        long long v66 = "-[MSDHSnapshottedDataSaver movePreservedFilesToDataShelter:removeFilesOnSuccess:]";
        __int16 v67 = 2114;
        long long v68 = v5;
        __int16 v69 = 2114;
        long long v70 = v47;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "%s - Failed to remove preserved files from:  %{public}@ - Error:  %{public}@", buf, 0x20u);
      }
    }
  }
}

- (BOOL)adjustContentUnder:(id)a3 userHomePath:(id)a4
{
  id v5 = a3;
  id v53 = a4;
  unsigned __int8 v6 = +[NSFileManager defaultManager];
  char v67 = 0;
  if ([v6 fileExistsAtPath:v5 isDirectory:&v67]) {
    BOOL v7 = v67 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  id v8 = &selRef_hasXattr_path_;
  id v55 = v6;
  if (v7)
  {
    stat v9 = 0;
    BOOL v10 = 0;
    long long v11 = 0;
    id v12 = 0;
    goto LABEL_40;
  }
  id v66 = 0;
  id v13 = [v6 contentsOfDirectoryAtPath:v5 error:&v66];
  id v14 = v66;
  id v15 = v14;
  if (!v13)
  {
    id v42 = sub_100027250();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      sub_10002C808();
    }
    v43 = 0;
    stat v9 = 0;
    id v20 = 0;
    long long v11 = 0;
    goto LABEL_76;
  }
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v16 = v13;
  id v17 = [v16 countByEnumeratingWithState:&v62 objects:v76 count:16];
  if (!v17)
  {
    stat v9 = 0;
    id v20 = 0;
    long long v11 = 0;
    goto LABEL_39;
  }
  id v19 = v17;
  stat v9 = 0;
  id v20 = 0;
  long long v11 = 0;
  uint64_t v54 = *(void *)v63;
  *(void *)&long long v18 = 136315906;
  long long v50 = v18;
  id obj = v16;
  do
  {
    unsigned int v21 = 0;
    do
    {
      uint64_t v22 = v11;
      v23 = v9;
      if (*(void *)v63 != v54) {
        objc_enumerationMutation(obj);
      }
      id v24 = v5;
      long long v11 = [v5 stringByAppendingPathComponent:*(void *)(*((void *)&v62 + 1) + 8 * (void)v21) v50];

      id v61 = v15;
      stat v9 = [v55 attributesOfItemAtPath:v11 error:&v61];
      id v25 = v61;

      if (!v9)
      {
        v47 = sub_100027250();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
          sub_10002C9C0();
        }
        goto LABEL_64;
      }
      unsigned __int8 v26 = [v9 fileType];
      unsigned int v27 = [v26 isEqualToString:NSFileTypeSymbolicLink];

      if (v27)
      {
        unsigned __int8 v28 = [@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/DataShelter" stringByAppendingPathComponent:v53];
        if (!v28 || [v11 caseInsensitiveCompare:v28])
        {

LABEL_32:
          id v15 = v25;
          goto LABEL_33;
        }
        v29 = sub_100027250();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          __int16 v69 = (const char *)v28;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Found wormhole in staging to user volume: %@", buf, 0xCu);
        }
      }
      if (!+[MSDXattr isNotExtracted:v11])
      {
        [(MSDHSnapshottedDataSaver *)self adjustContentUnder:v11 userHomePath:v53];
        goto LABEL_32;
      }
      uint64_t v30 = [(MSDHSnapshottedDataSaver *)self originalPathFor:v11];

      long long v31 = sub_100027250();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v69 = (const char *)v11;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%@ is not extracted (under a content root), should use the original content.", buf, 0xCu);
      }

      id v60 = v25;
      unsigned __int8 v32 = [v55 removeItemAtPath:v11 error:&v60];
      id v33 = v60;

      if ((v32 & 1) == 0)
      {
        v47 = sub_100027250();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
          sub_10002CA58();
        }
        id v20 = (void *)v30;
        id v25 = v33;
LABEL_64:
        id v42 = obj;

        v43 = 0;
        BOOL v44 = 0;
        id v15 = v25;
        id v5 = v24;
        goto LABEL_65;
      }
      if ([v55 fileExistsAtPath:v30])
      {
        id v59 = v33;
        unsigned __int8 v34 = [v55 moveItemAtPath:v30 toPath:v11 error:&v59];
        id v15 = v59;

        if ((v34 & 1) == 0)
        {
          int v35 = sub_100027250();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            int v36 = [v15 localizedDescription];
            *(_DWORD *)buf = v50;
            __int16 v69 = "-[MSDHSnapshottedDataSaver adjustContentUnder:userHomePath:]";
            __int16 v70 = 2112;
            uint64_t v71 = v30;
            __int16 v72 = 2112;
            long long v73 = v11;
            __int16 v74 = 2112;
            v75 = v36;
            _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%s: Could not move item %@ to %@.  Error:  %@", buf, 0x2Au);
          }
        }
        id v20 = (void *)v30;
      }
      else
      {
        id v20 = (void *)v30;
        id v15 = v33;
      }
LABEL_33:
      id v5 = v24;
      unsigned int v21 = (char *)v21 + 1;
    }
    while (v19 != v21);
    id v16 = obj;
    id v37 = [obj countByEnumeratingWithState:&v62 objects:v76 count:16];
    id v19 = v37;
  }
  while (v37);
LABEL_39:

  BOOL v10 = v20;
  id v12 = v15;
  unsigned __int8 v6 = v55;
  id v8 = &selRef_hasXattr_path_;
LABEL_40:
  if (![v8 + 470 isContentRoot:v5])
  {
    v43 = 0;
    BOOL v44 = 1;
    goto LABEL_67;
  }
  unsigned __int8 v38 = [v8 + 470 isContentRootToRemove:v5];
  [v8 + 470 removeXattr:v5];
  id v20 = [(MSDHSnapshottedDataSaver *)self originalPathFor:v5];

  if (![v6 fileExistsAtPath:v20]) {
    goto LABEL_44;
  }
  id v58 = v12;
  unsigned __int8 v39 = [v6 removeItemAtPath:v20 error:&v58];
  id v15 = v58;

  if ((v39 & 1) == 0)
  {
    id v42 = sub_100027250();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      sub_10002C930();
    }
    v43 = 0;
    goto LABEL_76;
  }
  id v12 = v15;
  unsigned __int8 v6 = v55;
LABEL_44:
  if ((v38 & 1) == 0)
  {
    id v45 = sub_100027250();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      __int16 v69 = (const char *)v5;
      __int16 v70 = 2112;
      uint64_t v71 = (uint64_t)v20;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Moving content root item %@ to %@.", buf, 0x16u);
    }

    v43 = [v20 stringByDeletingLastPathComponent];
    unsigned __int8 v6 = v55;
    if (([v55 fileExistsAtPath:v43 isDirectory:&v67] & 1) == 0
      && ![(MSDHSnapshottedDataSaver *)self createIntermdediateDirectoriesInPathAndRestoreAttributes:v43])
    {
      BOOL v44 = 0;
      BOOL v10 = v20;
      goto LABEL_67;
    }
    id v57 = v12;
    unsigned __int8 v46 = [v55 moveItemAtPath:v5 toPath:v20 error:&v57];
    id v15 = v57;

    if (v46)
    {
      BOOL v44 = 1;
      goto LABEL_66;
    }
    id v42 = sub_100027250();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      BOOL v49 = [v15 localizedDescription];
      *(_DWORD *)buf = 138412802;
      __int16 v69 = (const char *)v5;
      __int16 v70 = 2112;
      uint64_t v71 = (uint64_t)v20;
      __int16 v72 = 2112;
      long long v73 = v49;
      _os_log_error_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "Cannot move %@ to %@.  Error:  %@", buf, 0x20u);
    }
LABEL_76:
    BOOL v44 = 0;
    goto LABEL_65;
  }
  id v56 = v12;
  unsigned __int8 v40 = [v6 removeItemAtPath:v5 error:&v56];
  id v15 = v56;

  if ((v40 & 1) == 0)
  {
    v41 = sub_100027250();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      sub_10002C8A0();
    }
  }
  id v42 = sub_100027250();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v69 = (const char *)v20;
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Removed %@.", buf, 0xCu);
  }
  v43 = 0;
  BOOL v44 = 1;
LABEL_65:

LABEL_66:
  BOOL v10 = v20;
  id v12 = v15;
  unsigned __int8 v6 = v55;
LABEL_67:

  return v44;
}

- (BOOL)createIntermdediateDirectoriesInPathAndRestoreAttributes:(id)a3
{
  id v3 = a3;
  BOOL v4 = sub_100027250();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[MSDHSnapshottedDataSaver createIntermdediateDirectoriesInPathAndRestoreAttributes:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s - fullPath:  %@", buf, 0x16u);
  }

  id v5 = +[NSFileManager defaultManager];
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 1;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  long long v18 = sub_10000BF80;
  id v19 = sub_10000BF90;
  id v20 = +[NSString string];
  unsigned __int8 v6 = [v3 pathComponents];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000BF98;
  v9[3] = &unk_10004CBF8;
  long long v11 = buf;
  id v7 = v5;
  id v10 = v7;
  id v12 = &v13;
  [v6 enumerateObjectsUsingBlock:v9];

  LOBYTE(v6) = *((unsigned char *)v14 + 24) != 0;
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v13, 8);
  return (char)v6;
}

- (id)originalPathFor:(id)a3
{
  id v3 = a3;
  id v4 = [v3 rangeOfString:@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/DataShelter"];
  if (v4 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v6 = [@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/DataShelter" stringByStandardizingPath];
    id v7 = [v3 rangeOfString:v6];
    uint64_t v9 = v8;
  }
  else
  {
    id v7 = v4;
    uint64_t v9 = v5;
  }
  if (v7)
  {
    id v12 = sub_100027250();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10002CCDC();
    }

    id v10 = 0;
  }
  else
  {
    id v10 = [v3 substringFromIndex:v9];
  }

  return v10;
}

@end