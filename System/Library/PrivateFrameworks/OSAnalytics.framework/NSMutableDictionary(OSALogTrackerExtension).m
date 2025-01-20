@interface NSMutableDictionary(OSALogTrackerExtension)
- (uint64_t)osa_logTracker_getForSubtype:()OSALogTrackerExtension forOwner:;
- (uint64_t)osa_logTracker_isLog:()OSALogTrackerExtension byKey:count:withinLimit:withOptions:errorDescription:;
- (uint64_t)osa_logTracker_recordNixedDuplicate:()OSALogTrackerExtension;
- (uint64_t)osa_logTracker_shouldRotateLog:()OSALogTrackerExtension;
- (void)osa_logTracker_incrementForSubtype:()OSALogTrackerExtension signature:filepath:;
- (void)osa_logTracker_incrementForSubtype_internal:()OSALogTrackerExtension signature:filepath:scan:;
- (void)osa_logTracker_trackLogTypes_internal:()OSALogTrackerExtension forOwner:rescan:;
@end

@implementation NSMutableDictionary(OSALogTrackerExtension)

- (void)osa_logTracker_incrementForSubtype_internal:()OSALogTrackerExtension signature:filepath:scan:
{
  v38[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  v12 = [a1 objectForKey:v10];
  if (v12)
  {
    v13 = v12;
    objc_msgSend(v12, "setCount:", objc_msgSend(v12, "count") + 1);
  }
  else
  {
    v13 = +[OSALogTrackerObject tracker];
    [a1 setObject:v13 forKey:v10];
  }
  v14 = [NSString stringWithUTF8String:a5];
  v15 = [MEMORY[0x1E4F1C9C8] date];
  if (a6)
  {
    v16 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v36 = 0;
    v17 = [v16 attributesOfItemAtPath:v14 error:&v36];
    id v18 = v36;

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      -[NSMutableDictionary(OSALogTrackerExtension) osa_logTracker_incrementForSubtype_internal:signature:filepath:scan:].cold.4((uint64_t)v14);
    }
    uint64_t v19 = [v17 objectForKey:*MEMORY[0x1E4F282C0]];

    v15 = (void *)v19;
  }
  if (v13)
  {
    v20 = [v13 oldestDate];
    if (!v20) {
      goto LABEL_12;
    }
    v21 = v20;
    if (!v15)
    {

      goto LABEL_14;
    }
    v22 = [v13 oldestDate];
    uint64_t v23 = [v22 compare:v15];

    if (v23 == 1)
    {
LABEL_12:
      [v13 setOldestDate:v15];
      [v13 setOldestLogPath:v14];
    }
  }
LABEL_14:
  uint64_t v24 = [v11 length];
  if (a5 && v24)
  {
    if (!v13) {
      -[NSMutableDictionary(OSALogTrackerExtension) osa_logTracker_incrementForSubtype_internal:signature:filepath:scan:]();
    }
    v25 = [v13 signatures];
    v26 = [v25 objectForKeyedSubscript:v11];

    if (v26)
    {
      v27 = [v26 objectForKeyedSubscript:@"dupes"];
      v28 = [NSString stringWithUTF8String:a5];
      v29 = (void *)[v28 copy];
      [v27 addObject:v29];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
        -[NSMutableDictionary(OSALogTrackerExtension) osa_logTracker_incrementForSubtype_internal:signature:filepath:scan:]();
      }
    }
    else
    {
      v37[0] = @"original";
      v35 = [NSString stringWithUTF8String:a5];
      v34 = (void *)[v35 copy];
      v37[1] = @"dupes";
      v38[0] = v34;
      v33 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
      v38[1] = v33;
      v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:2];
      v31 = (void *)[v30 mutableCopy];
      v32 = [v13 signatures];
      [v32 setObject:v31 forKeyedSubscript:v11];

      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
        -[NSMutableDictionary(OSALogTrackerExtension) osa_logTracker_incrementForSubtype_internal:signature:filepath:scan:]();
      }
    }
  }
}

- (uint64_t)osa_logTracker_isLog:()OSALogTrackerExtension byKey:count:withinLimit:withOptions:errorDescription:
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  v16 = [v15 objectForKeyedSubscript:@"file-owner"];
  v83 = a1;
  unint64_t v85 = objc_msgSend(a1, "osa_logTracker_getForSubtype:forOwner:", v14, v16);
  id v17 = v13;
  id v18 = v15;
  uint64_t v19 = [v18 objectForKeyedSubscript:@"set-log-limit"];
  v20 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.osanalytics"];
  v21 = [NSString stringWithFormat:@"%@_CountLimit", v17];
  v22 = [v20 objectForKey:v21];

  v84 = v18;
  if (([v17 isEqualToString:@"210"] & 1) == 0)
  {
    v79 = v16;
    uint64_t v24 = a5;
    id v25 = v14;
    v26 = a6;
    v27 = v17;
    v28 = [v18 objectForKeyedSubscript:@"override-limit"];
    char v29 = [v28 BOOLValue];

    if (v29)
    {
      unint64_t v23 = -1;
    }
    else
    {
      if (!v22)
      {
        id v17 = v27;
        if (!v19)
        {
          char v42 = [v27 isEqualToString:@"288"];
          a6 = v26;
          if ((v42 & 1) == 0)
          {
            id v14 = v25;
            if (([v17 isEqualToString:@"187"] & 1) == 0)
            {
              a5 = v24;
              if ([v17 hasPrefix:@"211"])
              {
                unint64_t v23 = 30;
              }
              else if ([v17 hasPrefix:@"328"])
              {
                unint64_t v23 = 250;
              }
              else
              {
                unint64_t v23 = 25;
              }
              goto LABEL_11;
            }
            unint64_t v23 = 100;
LABEL_10:
            a5 = v24;
LABEL_11:
            v16 = v79;
            goto LABEL_12;
          }
          unint64_t v23 = 100;
LABEL_9:
          id v14 = v25;
          goto LABEL_10;
        }
        unint64_t v23 = [v19 unsignedIntegerValue];
LABEL_8:
        a6 = v26;
        goto LABEL_9;
      }
      unint64_t v23 = [v22 integerValue];
    }
    id v17 = v27;
    goto LABEL_8;
  }
  unint64_t v23 = -1;
LABEL_12:

  unint64_t v30 = v85;
  unint64_t v31 = v23;
  if (v85 < v23
    || (unint64_t v82 = v23,
        objc_msgSend(v83, "osa_logTracker_trackLogTypes_internal:forOwner:rescan:", v14, v16, osa_logTracker_isLog_byKey_count_withinLimit_withOptions_errorDescription__rescanOldFiles), unint64_t v30 = objc_msgSend(v83, "osa_logTracker_getForSubtype:forOwner:", v14, v16), v31 = v23, v30 < v23))
  {
    uint64_t v32 = 1;
    if (!a5) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  unint64_t v86 = v30;
  v78 = [v18 objectForKeyedSubscript:@"Signature"];
  if (v78)
  {
    v34 = sAccountingSemaphore;
    dispatch_time_t v35 = dispatch_time(0, 1000000000);
    if (!dispatch_semaphore_wait(v34, v35))
    {
      id v36 = [v83 objectForKey:v14];
      if (!v36) {
        -[NSMutableDictionary(OSALogTrackerExtension) osa_logTracker_isLog:byKey:count:withinLimit:withOptions:errorDescription:]();
      }
      v37 = v36;
      v38 = [v36 signatures];
      v39 = [v38 objectForKeyedSubscript:v78];

      v40 = v39;
      if (v39)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "known duplicate signature", buf, 2u);
        }
        id v41 = [v39 objectForKeyedSubscript:@"original"];
        objc_msgSend(v83, "osa_logTracker_recordNixedDuplicate:", objc_msgSend(v41, "fileSystemRepresentation"));

        v40 = v39;
        goto LABEL_55;
      }
      id v74 = v17;
      v75 = a5;
      v80 = v16;
      id v76 = v14;
      v77 = a6;
      long long v92 = 0u;
      long long v93 = 0u;
      long long v90 = 0u;
      long long v91 = 0u;
      v43 = [v37 signatures];
      uint64_t v89 = [v43 countByEnumeratingWithState:&v90 objects:v96 count:16];
      if (v89)
      {
        v44 = 0;
        id obj = v43;
        uint64_t v88 = *(void *)v91;
        do
        {
          for (uint64_t i = 0; i != v89; ++i)
          {
            if (*(void *)v91 != v88) {
              objc_enumerationMutation(obj);
            }
            uint64_t v46 = *(void *)(*((void *)&v90 + 1) + 8 * i);
            v47 = [v37 signatures];
            v48 = [v47 objectForKeyedSubscript:v46];
            v49 = [v48 objectForKeyedSubscript:@"dupes"];
            v50 = v37;
            unint64_t v51 = [v49 count];
            v52 = [v44 objectForKeyedSubscript:@"dupes"];
            v53 = v44;
            unint64_t v54 = [v52 count];

            if (v51 <= v54)
            {
              v37 = v50;
              v44 = v53;
            }
            else
            {
              v55 = [v50 signatures];
              v44 = [v55 objectForKeyedSubscript:v46];

              v37 = v50;
            }
          }
          uint64_t v89 = [obj countByEnumeratingWithState:&v90 objects:v96 count:16];
        }
        while (v89);

        v40 = 0;
        if (v44)
        {
          id v14 = v76;
          a6 = v77;
          a5 = v75;
          v16 = v80;
          do
          {
            v56 = [v44 objectForKeyedSubscript:@"dupes"];
            unint64_t v57 = [v56 count];

            if (v57 < 2) {
              break;
            }
            v58 = [v44 objectForKeyedSubscript:@"dupes"];
            v59 = [v58 objectAtIndex:0];

            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v95 = v59;
              _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "new signature found -- prioritizing over duplicate (removing %@)", buf, 0xCu);
            }
            v60 = [v44 objectForKeyedSubscript:@"dupes"];
            [v60 removeObjectAtIndex:0];

            id v61 = [v44 objectForKeyedSubscript:@"original"];
            objc_msgSend(v83, "osa_logTracker_recordNixedDuplicate:", objc_msgSend(v61, "fileSystemRepresentation"));

            id v62 = v59;
            v63 = (const std::__fs::filesystem::path *)[v62 fileSystemRepresentation];
            remove(v63, v64);
            objc_msgSend(v37, "setCount:", objc_msgSend(v37, "count") - 1);

            --v86;
            v40 = 0;
          }
          while (v86 >= v82);

LABEL_54:
          id v17 = v74;
LABEL_55:
          dispatch_semaphore_signal((dispatch_semaphore_t)sAccountingSemaphore);

          goto LABEL_56;
        }
      }
      else
      {
      }
      id v14 = v76;
      a6 = v77;
      a5 = v75;
      v16 = v80;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "new signature found -- but no room available", buf, 2u);
      }
      goto LABEL_54;
    }
  }
LABEL_56:
  if (osa_logTracker_isLog_byKey_count_withinLimit_withOptions_errorDescription__rescanOldFiles == 1) {
    osa_logTracker_isLog_byKey_count_withinLimit_withOptions_errorDescription__rescanOldFiles = 0;
  }
  if (v86 >= v82)
  {
    if (objc_msgSend(v83, "osa_logTracker_shouldRotateLog:", v17))
    {
      v65 = a6;
      id v66 = v17;
      v67 = +[OSALogTrackerObject sharedTrackers];
      v68 = [v67 objectForKey:v14];

      v69 = [v68 oldestLogPath];
      v70 = [MEMORY[0x1E4F28CB8] defaultManager];
      v71 = v70;
      if (v69
        && [v70 fileExistsAtPath:v69]
        && ([MEMORY[0x1E4F28CB8] defaultManager],
            v72 = objc_claimAutoreleasedReturnValue(),
            int v73 = [v72 removeItemAtPath:v69 error:0],
            v72,
            !v73))
      {
        uint64_t v32 = 0;
        if (a8) {
          *a8 = @"Delete oldest file failed";
        }
      }
      else
      {
        uint64_t v32 = 1;
        osa_logTracker_isLog_byKey_count_withinLimit_withOptions_errorDescription__rescanOldFiles = 1;
      }

      id v17 = v66;
      a6 = v65;
    }
    else
    {
      uint64_t v32 = 0;
      if (a8) {
        *a8 = @"Log limit exceeded";
      }
    }
  }
  else
  {
    uint64_t v32 = 1;
  }

  unint64_t v30 = v86;
  unint64_t v31 = v82;
  if (a5) {
LABEL_15:
  }
    *a5 = v30;
LABEL_16:
  if (a6) {
    *a6 = v31;
  }

  return v32;
}

- (void)osa_logTracker_incrementForSubtype:()OSALogTrackerExtension signature:filepath:
{
  id v11 = a3;
  id v8 = a4;
  v9 = sAccountingSemaphore;
  dispatch_time_t v10 = dispatch_time(0, 1000000000);
  if (!dispatch_semaphore_wait(v9, v10))
  {
    objc_msgSend(a1, "osa_logTracker_incrementForSubtype_internal:signature:filepath:scan:", v11, v8, a5, 0);
    dispatch_semaphore_signal((dispatch_semaphore_t)sAccountingSemaphore);
  }
}

- (uint64_t)osa_logTracker_getForSubtype:()OSALogTrackerExtension forOwner:
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__NSMutableDictionary_OSALogTrackerExtension__osa_logTracker_getForSubtype_forOwner___block_invoke;
  block[3] = &unk_1E5D20610;
  block[4] = a1;
  id v8 = v6;
  id v15 = v8;
  id v9 = v7;
  id v16 = v9;
  if (osa_logTracker_getForSubtype_forOwner__onceToken != -1) {
    dispatch_once(&osa_logTracker_getForSubtype_forOwner__onceToken, block);
  }
  dispatch_time_t v10 = [a1 objectForKey:v8];
  id v11 = v10;
  if (v10) {
    uint64_t v12 = [v10 count];
  }
  else {
    uint64_t v12 = 0;
  }

  return v12;
}

- (void)osa_logTracker_trackLogTypes_internal:()OSALogTrackerExtension forOwner:rescan:
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  dispatch_time_t v10 = sAccountingSemaphore;
  dispatch_time_t v11 = dispatch_time(0, 1000000000);
  if (!dispatch_semaphore_wait(v10, v11))
  {
    memset(&v34, 0, sizeof(v34));
    if (osa_logTracker_trackLogTypes_internal_forOwner_rescan__rescanSentinel)
    {
      if (stat((const char *)[(id)osa_logTracker_trackLogTypes_internal_forOwner_rescan__rescanSentinel UTF8String], &v34) == -1)
      {
        if (*__error() != 2 && (a5 & 1) == 0) {
          goto LABEL_15;
        }
      }
      else if (!a5)
      {
LABEL_15:
        dispatch_semaphore_signal((dispatch_semaphore_t)sAccountingSemaphore);
        goto LABEL_16;
      }
    }
    uint64_t v12 = (void *)osa_logTracker_trackLogTypes_internal_forOwner_rescan__rescanSentinel;
    osa_logTracker_trackLogTypes_internal_forOwner_rescan__rescanSentinel = 0;

    id v13 = (void *)MEMORY[0x1AD0D8030]([a1 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_52]);
    uint64_t v30 = 0;
    unint64_t v31 = &v30;
    uint64_t v32 = 0x2020000000;
    uint64_t v33 = 0;
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2020000000;
    uint64_t v29 = 0;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
      -[NSMutableDictionary(OSALogTrackerExtension) osa_logTracker_trackLogTypes_internal:forOwner:rescan:]();
    }
    v43 = @"exclude-retired";
    uint64_t v44 = MEMORY[0x1E4F1CC38];
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
    id v15 = (void *)[v14 mutableCopy];

    if (v9) {
      [v15 setObject:v9 forKeyedSubscript:@"file-owner"];
    }
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __101__NSMutableDictionary_OSALogTrackerExtension__osa_logTracker_trackLogTypes_internal_forOwner_rescan___block_invoke_54;
    v21[3] = &unk_1E5D205E8;
    id v25 = &v45;
    unint64_t v23 = &v30;
    v21[4] = a1;
    id v22 = v8;
    uint64_t v24 = &v26;
    +[OSALog iterateLogsWithOptions:v15 usingBlock:v21];
    id v16 = MEMORY[0x1E4F14500];
    id v17 = MEMORY[0x1E4F14500];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = v31[3];
      uint64_t v19 = [a1 count];
      uint64_t v20 = v27[3];
      *(_DWORD *)buf = 134218754;
      uint64_t v36 = v18;
      __int16 v37 = 2048;
      uint64_t v38 = v19;
      __int16 v39 = 2048;
      uint64_t v40 = v20;
      __int16 v41 = 2112;
      uint64_t v42 = osa_logTracker_trackLogTypes_internal_forOwner_rescan__rescanSentinel;
      _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "scanned %zu logs with %lu types and %zu unknowns (sentinel is %@)", buf, 0x2Au);
    }

    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(&v30, 8);
    goto LABEL_15;
  }
LABEL_16:
}

- (uint64_t)osa_logTracker_recordNixedDuplicate:()OSALogTrackerExtension
{
  __int16 value = 0;
  getxattr(path, "Multiple", &value, 2uLL, 0, 0);
  ++value;
  setxattr(path, "Multiple", &value, 2uLL, 0, 0);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
    -[NSMutableDictionary(OSALogTrackerExtension) osa_logTracker_recordNixedDuplicate:]();
  }
  return utimes(path, 0);
}

- (uint64_t)osa_logTracker_shouldRotateLog:()OSALogTrackerExtension
{
  return [a3 hasPrefix:@"211"];
}

- (void)osa_logTracker_incrementForSubtype_internal:()OSALogTrackerExtension signature:filepath:scan:.cold.1()
{
}

- (void)osa_logTracker_incrementForSubtype_internal:()OSALogTrackerExtension signature:filepath:scan:.cold.2()
{
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x16u);
}

- (void)osa_logTracker_incrementForSubtype_internal:()OSALogTrackerExtension signature:filepath:scan:.cold.3()
{
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0xCu);
}

- (void)osa_logTracker_incrementForSubtype_internal:()OSALogTrackerExtension signature:filepath:scan:.cold.4(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v2 = *__error();
  v3 = __error();
  v4 = strerror(*v3);
  int v5 = 138412802;
  uint64_t v6 = a1;
  __int16 v7 = 1024;
  int v8 = v2;
  __int16 v9 = 2080;
  dispatch_time_t v10 = v4;
  _os_log_error_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to retrieve file attributes at path %@. Error: %d %s", (uint8_t *)&v5, 0x1Cu);
}

- (void)osa_logTracker_trackLogTypes_internal:()OSALogTrackerExtension forOwner:rescan:.cold.1()
{
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 2u);
}

- (void)osa_logTracker_recordNixedDuplicate:()OSALogTrackerExtension .cold.1()
{
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x12u);
}

- (void)osa_logTracker_isLog:()OSALogTrackerExtension byKey:count:withinLimit:withOptions:errorDescription:.cold.1()
{
}

@end