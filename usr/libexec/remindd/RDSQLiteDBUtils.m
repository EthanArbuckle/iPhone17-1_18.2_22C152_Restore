@interface RDSQLiteDBUtils
+ (BOOL)copySQLiteFileAtPath:(id)a3 toPath:(id)a4 timeout:(double)a5 error:(id *)a6;
@end

@implementation RDSQLiteDBUtils

+ (BOOL)copySQLiteFileAtPath:(id)a3 toPath:(id)a4 timeout:(double)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  v12 = v11;
  if (!v10)
  {
    if (a6)
    {
      v24 = (objc_class *)objc_opt_class();
      v25 = NSStringFromClass(v24);
      v26 = NSStringFromSelector(a2);
      v27 = +[NSString stringWithFormat:@"%@.%@", v25, v26];
      +[NSString stringWithFormat:@"[%@] fromPath is nil", v27];
      v29 = LABEL_12:;
      *a6 = +[REMError internalErrorWithDebugDescription:v29];
    }
LABEL_13:
    BOOL v23 = 0;
    goto LABEL_82;
  }
  if (!v11)
  {
    if (a6)
    {
      v28 = (objc_class *)objc_opt_class();
      v25 = NSStringFromClass(v28);
      v26 = NSStringFromSelector(a2);
      v27 = +[NSString stringWithFormat:@"%@.%@", v25, v26];
      +[NSString stringWithFormat:@"[%@] toPath is nil", v27];
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  id v13 = v10;
  id v14 = v12;
  v15 = +[NSFileManager defaultManager];
  id v128 = v13;
  v16 = (const char *)[v128 fileSystemRepresentation];
  id v17 = v14;
  v18 = (const char *)[v17 fileSystemRepresentation];
  db = 0;
  ppDb = 0;
  uint64_t v19 = sqlite3_open_v2(v16, &ppDb, 1, 0);
  v20 = INDateRelevanceProvider_ptr;
  v127 = v12;
  if (v19)
  {
    if (a6)
    {
      uint64_t v21 = v19;
      v22 = ppDb;
      if (ppDb) {
        v22 = (void *)sqlite3_errmsg(ppDb);
      }
      +[REMError sqliteErrorWithCode:-101, v128, @"Error opening SQLite file: %s (%d)", v22, v21 path format];
      BOOL v23 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_59;
    }
LABEL_23:
    BOOL v23 = 0;
    goto LABEL_59;
  }
  v30 = +[REMLogStore container];
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    v31 = (objc_class *)objc_opt_class();
    NSStringFromClass(v31);
    v33 = v32 = a2;
    v34 = NSStringFromSelector(v32);
    v35 = +[NSString stringWithFormat:@"%@.%@", v33, v34];
    *(_DWORD *)buf = 138543618;
    v137 = v35;
    __int16 v138 = 2114;
    id v139 = v128;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "[%{public}@] Opened SQLite file at %{public}@", buf, 0x16u);

    v20 = INDateRelevanceProvider_ptr;
    a2 = v32;
  }
  v36 = [v17 stringByDeletingLastPathComponent];
  unsigned __int8 v37 = [v15 createDirectoryAtPath:v36 withIntermediateDirectories:1 attributes:0 error:a6];

  if ((v37 & 1) == 0) {
    goto LABEL_23;
  }
  aSelector = a2;
  v38 = INDateRelevanceProvider_ptr;
  +[NSDate timeIntervalSinceReferenceDate];
  double v40 = v39;
  while (1)
  {
    uint64_t v41 = _sqlite3_db_clone();
    if (v41 != 5)
    {
      uint64_t v48 = v41;
      if (!v41)
      {
        v49 = [v20[202] container];
        if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
        {
          v50 = (objc_class *)objc_opt_class();
          v51 = NSStringFromClass(v50);
          v52 = NSStringFromSelector(aSelector);
          v53 = +[NSString stringWithFormat:@"%@.%@", v51, v52];
          *(_DWORD *)buf = 138543618;
          v137 = v53;
          __int16 v138 = 2114;
          id v139 = v17;
          _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "[%{public}@] Cloning SQLite file to %{public}@", buf, 0x16u);

          v20 = INDateRelevanceProvider_ptr;
        }

        uint64_t v54 = sqlite3_open_v2(v18, &db, 6, 0);
        if (!v54)
        {
          v62 = [v20[202] container];
          if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
          {
            v63 = (objc_class *)objc_opt_class();
            v64 = NSStringFromClass(v63);
            v65 = NSStringFromSelector(aSelector);
            v66 = +[NSString stringWithFormat:@"%@.%@", v64, v65];
            *(_DWORD *)buf = 138543874;
            v137 = v66;
            __int16 v138 = 2114;
            id v139 = v17;
            __int16 v140 = 1024;
            LODWORD(v141) = 6;
            _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_INFO, "[%{public}@] Opened SQLite file for copying at %{public}@ with flags 0x%x", buf, 0x1Cu);
          }
          uint64_t v67 = sqlite3_wal_checkpoint_v2(db, 0, 2, 0, 0);
          if (v67)
          {
            if (!a6) {
              goto LABEL_57;
            }
            uint64_t v68 = v67;
            v69 = sqlite3_errmsg(db);
            uint64_t v124 = sqlite3_extended_errcode(db);
            uint64_t v125 = v68;
            v123 = v69;
            CFStringRef v60 = @"Error checkpointing copied SQLite file: %s,%d (%d)";
            uint64_t v61 = -104;
          }
          else
          {
            v71 = [v20[202] container];
            if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
            {
              v72 = (objc_class *)objc_opt_class();
              v73 = NSStringFromClass(v72);
              v74 = NSStringFromSelector(aSelector);
              v75 = +[NSString stringWithFormat:@"%@.%@", v73, v74];
              *(_DWORD *)buf = 138543618;
              v137 = v75;
              __int16 v138 = 2114;
              id v139 = v128;
              _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_INFO, "[%{public}@] Checkpointed copied SQLite file at %{public}@", buf, 0x16u);
            }
            uint64_t v76 = sqlite3_close(db);
            db = 0;
            if (!v76)
            {
              v111 = [v20[202] container];
              if (os_log_type_enabled(v111, OS_LOG_TYPE_INFO))
              {
                v112 = (objc_class *)objc_opt_class();
                v113 = NSStringFromClass(v112);
                v114 = NSStringFromSelector(aSelector);
                v115 = +[NSString stringWithFormat:@"%@.%@", v113, v114];
                *(_DWORD *)buf = 138543618;
                v137 = v115;
                __int16 v138 = 2114;
                id v139 = v17;
                _os_log_impl((void *)&_mh_execute_header, v111, OS_LOG_TYPE_INFO, "[%{public}@] Closed SQLite file at %{public}@", buf, 0x16u);
              }
              +[NSDate timeIntervalSinceReferenceDate];
              double v117 = v116;
              v118 = [v20[202] container];
              if (os_log_type_enabled(v118, OS_LOG_TYPE_INFO))
              {
                v119 = (objc_class *)objc_opt_class();
                v120 = NSStringFromClass(v119);
                v121 = NSStringFromSelector(aSelector);
                v122 = +[NSString stringWithFormat:@"%@.%@", v120, v121];
                *(_DWORD *)buf = 138543874;
                v137 = v122;
                __int16 v138 = 2112;
                id v139 = v128;
                __int16 v140 = 2048;
                double v141 = v117 - v40;
                _os_log_impl((void *)&_mh_execute_header, v118, OS_LOG_TYPE_INFO, "[%{public}@] Finished copying SQLite database at %@ in %0.3fs", buf, 0x20u);
              }
              BOOL v23 = 1;
              goto LABEL_58;
            }
            if (!a6) {
              goto LABEL_57;
            }
            uint64_t v77 = v76;
            v78 = sqlite3_errmsg(0);
            uint64_t v124 = sqlite3_extended_errcode(db);
            uint64_t v125 = v77;
            v123 = v78;
            CFStringRef v60 = @"Error closing copied SQLite file: %s,%d (%d)";
            uint64_t v61 = -105;
          }
          goto LABEL_50;
        }
        if (!a6) {
          goto LABEL_57;
        }
        uint64_t v55 = v54;
        if (db)
        {
          v56 = sqlite3_errmsg(db);
          if (db)
          {
            uint64_t v57 = sqlite3_extended_errcode(db);
LABEL_49:
            uint64_t v124 = v57;
            uint64_t v125 = v55;
            v123 = v56;
            CFStringRef v60 = @"Error opening SQLite file: %s,%d (%d)";
            uint64_t v61 = -101;
LABEL_50:
            id v70 = v17;
            goto LABEL_51;
          }
        }
        else
        {
          v56 = 0;
        }
        uint64_t v57 = 0xFFFFFFFFLL;
        goto LABEL_49;
      }
      if (!a6) {
        goto LABEL_57;
      }
      if (ppDb)
      {
        v58 = sqlite3_errmsg(ppDb);
        if (ppDb)
        {
          uint64_t v59 = sqlite3_extended_errcode(ppDb);
          goto LABEL_45;
        }
      }
      else
      {
        v58 = 0;
      }
      uint64_t v59 = 0xFFFFFFFFLL;
LABEL_45:
      uint64_t v124 = v59;
      uint64_t v125 = v48;
      v123 = v58;
      CFStringRef v60 = @"Error cloning SQLite file: %s,%d (%d)";
      uint64_t v61 = -103;
LABEL_46:
      id v70 = v128;
LABEL_51:
      +[REMError sqliteErrorWithCode:path:format:](REMError, "sqliteErrorWithCode:path:format:", v61, v70, v60, v123, v124, v125);
      BOOL v23 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_58;
    }
    [v38[32] timeIntervalSinceReferenceDate];
    if (v42 - v40 >= a5) {
      break;
    }
    v43 = [v20[202] container];
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      v44 = (objc_class *)objc_opt_class();
      v45 = NSStringFromClass(v44);
      v46 = NSStringFromSelector(aSelector);
      v47 = +[NSString stringWithFormat:@"%@.%@", v45, v46];
      *(_DWORD *)buf = 138543618;
      v137 = v47;
      __int16 v138 = 2114;
      id v139 = v128;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "[%{public}@] Waiting for busy SQLite database at %{public}@", buf, 0x16u);

      v38 = INDateRelevanceProvider_ptr;
      v20 = INDateRelevanceProvider_ptr;
    }

    +[NSThread sleepForTimeInterval:0.1];
  }
  if (a6)
  {
    CFStringRef v60 = @"SQLite file is busy";
    uint64_t v61 = -102;
    goto LABEL_46;
  }
LABEL_57:
  BOOL v23 = 0;
LABEL_58:
  a2 = aSelector;
LABEL_59:
  if (ppDb)
  {
    int v79 = sqlite3_close(ppDb);
    v80 = [v20[202] container];
    v81 = v80;
    if (v79)
    {
      if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
      {
        v82 = (objc_class *)objc_opt_class();
        NSStringFromClass(v82);
        v84 = v83 = a2;
        v85 = NSStringFromSelector(v83);
        v86 = +[NSString stringWithFormat:@"%@.%@", v84, v85];
        *(_DWORD *)buf = 138543874;
        v137 = v86;
        __int16 v138 = 2114;
        id v139 = v128;
        __int16 v140 = 1024;
        LODWORD(v141) = v79;
        _os_log_error_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_ERROR, "[%{public}@] Warn: Error closing SQLite file at %{public}@: %d", buf, 0x1Cu);

        v20 = INDateRelevanceProvider_ptr;
        a2 = v83;
      }
    }
    else if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
    {
      v87 = (objc_class *)objc_opt_class();
      v88 = NSStringFromClass(v87);
      NSStringFromSelector(a2);
      v90 = v89 = a2;
      v91 = +[NSString stringWithFormat:@"%@.%@", v88, v90];
      *(_DWORD *)buf = 138543618;
      v137 = v91;
      __int16 v138 = 2114;
      id v139 = v128;
      _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_INFO, "[%{public}@] Closed SQLite file at %{public}@", buf, 0x16u);

      a2 = v89;
    }
  }
  if (db)
  {
    int v92 = sqlite3_close(db);
    v93 = [v20[202] container];
    v94 = v93;
    if (v92)
    {
      if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
      {
        v95 = (objc_class *)objc_opt_class();
        uint64_t v96 = NSStringFromClass(v95);
        v97 = a2;
        v98 = (void *)v96;
        v99 = NSStringFromSelector(v97);
        v100 = +[NSString stringWithFormat:@"%@.%@", v98, v99];
        *(_DWORD *)buf = 138543874;
        v137 = v100;
        __int16 v138 = 2114;
        id v139 = v17;
        __int16 v140 = 1024;
        LODWORD(v141) = v92;
        _os_log_error_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_ERROR, "[%{public}@] Warn: Error closing SQLite file at %{public}@: %d", buf, 0x1Cu);
      }
    }
    else if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO))
    {
      v101 = (objc_class *)objc_opt_class();
      v102 = NSStringFromClass(v101);
      v103 = NSStringFromSelector(a2);
      v104 = +[NSString stringWithFormat:@"%@.%@", v102, v103];
      *(_DWORD *)buf = 138543618;
      v137 = v104;
      __int16 v138 = 2114;
      id v139 = v17;
      _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_INFO, "[%{public}@] Closed SQLite file at %{public}@", buf, 0x16u);
    }
  }
  if (!v23)
  {
    [v15 removeItemAtPath:v17 error:0];
    long long v129 = 0u;
    long long v130 = 0u;
    long long v131 = 0u;
    long long v132 = 0u;
    id v105 = [&off_1008D7898 countByEnumeratingWithState:&v129 objects:v135 count:16];
    if (v105)
    {
      id v106 = v105;
      uint64_t v107 = *(void *)v130;
      do
      {
        for (i = 0; i != v106; i = (char *)i + 1)
        {
          if (*(void *)v130 != v107) {
            objc_enumerationMutation(&off_1008D7898);
          }
          v109 = [v17 stringByAppendingString:*(void *)(*((void *)&v129 + 1) + 8 * i)];
          [v15 removeItemAtPath:v109 error:0];
        }
        id v106 = [&off_1008D7898 countByEnumeratingWithState:&v129 objects:v135 count:16];
      }
      while (v106);
    }
  }

  v12 = v127;
LABEL_82:

  return v23;
}

@end