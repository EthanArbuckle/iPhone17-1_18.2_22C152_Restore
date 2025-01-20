@interface MBSQLiteFileHandle
+ (BOOL)compactSQLiteDatabaseAtPath:(id)a3 toPath:(id)a4 error:(id *)a5;
+ (BOOL)copySQLiteFileAtPath:(id)a3 toPath:(id)a4 error:(id *)a5;
+ (BOOL)copySQLiteFileAtPath:(id)a3 toPath:(id)a4 timeout:(double)a5 error:(id *)a6;
+ (BOOL)isSQLiteFileAtPath:(id)a3 result:(BOOL *)a4 error:(id *)a5;
+ (BOOL)isSQLiteFileHandle:(id)a3 result:(BOOL *)a4 error:(id *)a5;
+ (BOOL)lastModifiedForSQLiteFileAtPath:(id)a3 time:(int64_t *)a4 error:(id *)a5;
+ (BOOL)removeJournalsForSQLiteFileAtPath:(id)a3 error:(id *)a4;
+ (BOOL)removeSQLiteFileAtPath:(id)a3 error:(id *)a4;
+ (BOOL)setAttributes:(id)a3 ofSQLiteFileAtPath:(id)a4 error:(id *)a5;
+ (id)SQLiteFileHandleWithOriginalFileHandle:(id)a3 copiedFileHandle:(id)a4;
+ (id)executePragma:(id)a3 withDatabase:(sqlite3 *)a4;
+ (void)removeAllSQLiteFilesAtPath:(id)a3;
- (BOOL)closeWithError:(id *)a3;
- (BOOL)isSQLiteFile;
- (BOOL)statWithBuffer:(stat *)a3 error:(id *)a4;
- (MBSQLiteFileHandle)initWithOriginalFileHandle:(id)a3 copiedFileHandle:(id)a4;
@end

@implementation MBSQLiteFileHandle

+ (BOOL)isSQLiteFileAtPath:(id)a3 result:(BOOL *)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = [v7 length];
  id v9 = [@"/private" length];
  if ((unint64_t)v8 > 1024
                            - ((unint64_t)[@"-journal" length]
                             + (unint64_t)v9))
  {
    v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "File path too long to handle as a SQLite file: %@", buf, 0xCu);
      _MBLog();
    }

    if (!a4) {
      goto LABEL_6;
    }
LABEL_5:
    *a4 = 0;
LABEL_6:
    BOOL v11 = 1;
    goto LABEL_14;
  }
  if (IsDatalessFaultWithPath(v7))
  {
    if (!a4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v12 = +[MBBasicFileHandle basicFileHandleWithPath:v7 flags:256 mode:0 error:a5];
  if (v12)
  {
    BOOL v11 = +[MBSQLiteFileHandle isSQLiteFileHandle:v12 result:a4 error:a5];
    [v12 closeWithError:0];
  }
  else
  {
    BOOL v11 = 0;
  }

LABEL_14:
  return v11;
}

+ (BOOL)isSQLiteFileHandle:(id)a3 result:(BOOL *)a4 error:(id *)a5
{
  id v7 = a3;
  *a4 = 0;
  long long v28 = xmmword_1003B3718;
  uint64_t v29 = 0;
  uint64_t v27 = 0;
  int v8 = [v7 fd];
  if (fgetattrlist(v8, &v28, &v27, 8uLL, 0))
  {
    id v9 = [v7 path];
    v10 = +[MBError posixErrorWithPath:v9 format:@"fgetattrlist failed"];

    BOOL v11 = MBGetDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = [v7 path];
      *(_DWORD *)buf = 138412546;
      v33 = v12;
      __int16 v34 = 2112;
      v35 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "fgetattrlist failed at %@: %@", buf, 0x16u);

      v25 = [v7 path];
      _MBLog();
    }
    if (a5) {
      *a5 = v10;
    }

    BOOL v13 = 0;
  }
  else if (HIDWORD(v27) == 1)
  {
    uint64_t __buf = 0;
    uint64_t v31 = 0;
    ssize_t v14 = pread(v8, &__buf, 0x10uLL, 0);
    BOOL v13 = v14 >= 0;
    if (v14 < 0)
    {
      uint64_t v19 = *__error();
      v20 = [v7 path];
      v21 = MBGetDefaultLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v33 = v20;
        __int16 v34 = 1024;
        LODWORD(v35) = v19;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "pread failed at %@: %{errno}d", buf, 0x12u);
        _MBLog();
      }

      v22 = +[MBError errorWithErrno:v19 path:v20 format:@"pread error"];
      v23 = v22;
      if (a5) {
        *a5 = v22;
      }
      if ((v19 - 34) <= 0x3A && ((1 << (v19 - 34)) & 0x400000000000801) != 0
        || v19 == 22)
      {
        MBDiagnoseiCloudBackupFileAtPath(v20);
        MBDiagnoseiTunesBackupFileAtPath(v20);
      }
    }
    else if (v14 == 16 && __buf == 0x66206574694C5153 && v31 == 0x332074616D726FLL)
    {
      *a4 = 1;
    }
  }
  else
  {
    v16 = MBGetDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v17 = (void *)HIDWORD(v27);
      v18 = [v7 path];
      *(_DWORD *)buf = 134218242;
      v33 = v17;
      __int16 v34 = 2112;
      v35 = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Not a regular file (%ld) at %@", buf, 0x16u);

      v26 = [v7 path];
      _MBLog();
    }
    BOOL v13 = 1;
  }

  return v13;
}

+ (BOOL)compactSQLiteDatabaseAtPath:(id)a3 toPath:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if (!a5) {
    __assert_rtn("+[MBSQLiteFileHandle compactSQLiteDatabaseAtPath:toPath:error:]", "MBSQLiteFileHandle.m", 116, "errorPtr");
  }
  id v9 = v8;
  id v10 = v7;
  BOOL v11 = (const char *)[v10 fileSystemRepresentation];
  double v12 = COERCE_DOUBLE(v9);
  BOOL v13 = (const char *)[*(id *)&v12 fileSystemRepresentation];
  ppDb = 0;
  memset(&v71, 0, sizeof(v71));
  p_superclass = MBServiceRestoreEngine.superclass;
  if (stat(v11, &v71))
  {
    *(void *)&double v15 = *__error();
    double v16 = +[MBError posixErrorWithPath:v10 format:@"stat error"];
    v17 = MBGetDefaultLog();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    *(_DWORD *)buf = 138412546;
    *(void *)v74 = v10;
    *(_WORD *)&v74[8] = 1024;
    *(_DWORD *)&v74[10] = LODWORD(v15);
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "stat failed at %@: %{errno}d", buf, 0x12u);
    id v62 = v10;
    double v63 = v15;
    goto LABEL_5;
  }
  off_t st_size = v71.st_size;
  v30 = MBGetDefaultLog();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)v74 = v10;
    *(_WORD *)&v74[8] = 2112;
    *(double *)&v74[10] = v12;
    *(_WORD *)&v74[18] = 2048;
    *(void *)&v74[20] = st_size;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Compacting SQLite database at %@ to %@ (%lld bytes)", buf, 0x20u);
    double v63 = v12;
    id v64 = (id)st_size;
    id v62 = v10;
    _MBLog();
  }

  uint64_t v31 = (void **)ATClientController_ptr;
  +[NSDate timeIntervalSinceReferenceDate];
  double v33 = v32;
  uint64_t v34 = sqlite3_open_v2(v11, &ppDb, 1, 0);
  if (v34)
  {
    uint64_t v35 = v34;
    v36 = ppDb;
    if (ppDb) {
      v36 = (void *)sqlite3_errmsg(ppDb);
    }
    *(double *)&uint64_t v37 = +[MBError errorWithCode:16, v10, @"Error opening SQLite file: %s (%d)", v36, v35, v64 path format];
LABEL_28:
    double v16 = *(double *)&v37;
    if (*(double *)&v37 != 0.0) {
      goto LABEL_7;
    }
    goto LABEL_29;
  }
  v65 = a5;
  +[NSDate timeIntervalSinceReferenceDate];
  double v41 = v40;
  +[MBSQLiteFileHandle removeAllSQLiteFilesAtPath:*(void *)&v12];
  *(double *)&uint64_t v42 = COERCE_DOUBLE(_sqlite3_db_copy_compact());
  if (v42)
  {
    uint64_t v43 = v42;
    while (1)
    {
      v44 = v31;
      v45 = p_superclass;
      v46 = (void *)sqlite3_extended_errcode(ppDb);
      v47 = MBGetDefaultLog();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)v74 = v10;
        *(_WORD *)&v74[8] = 1024;
        *(_DWORD *)&v74[10] = v43;
        *(_WORD *)&v74[14] = 1024;
        *(_DWORD *)&v74[16] = v46;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "_sqlite3_db_copy_compact failed at %@: %d/0x%x", buf, 0x18u);
        double v63 = *(double *)&v43;
        id v64 = v46;
        id v62 = v10;
        _MBLog();
      }

      if (v43 != 5) {
        break;
      }
      uint64_t v31 = v44;
      [v44[105] timeIntervalSinceReferenceDate];
      if (v48 - v41 >= 1.0)
      {
        double v16 = +[MBError errorWithCode:13 path:v10 format:@"SQLite file is locked"];
        goto LABEL_58;
      }
      v49 = MBGetDefaultLog();
      p_superclass = v45;
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v74 = v10;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "Waiting for busy SQLite database at %@", buf, 0xCu);
        id v62 = v10;
        _MBLog();
      }

      +[NSThread sleepForTimeInterval:0.1];
      [v45 + 379 removeAllSQLiteFilesAtPath:*(void *)&v12];
      *(double *)&uint64_t v43 = COERCE_DOUBLE(_sqlite3_db_copy_compact());
      if (!v43) {
        goto LABEL_43;
      }
    }
    if (v43 == 14)
    {
      CFStringRef v52 = @"Can't open SQLite file";
      uint64_t v53 = 100;
    }
    else
    {
      id v62 = (id)v43;
      CFStringRef v52 = @"Can't compact SQLite file (%d)";
      uint64_t v53 = 16;
    }
    +[MBError errorWithCode:path:format:](MBError, "errorWithCode:path:format:", v53, v10, v52, v62, *(void *)&v63, v64);
    double v16 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
LABEL_58:
    p_superclass = v45;
    a5 = v65;
    if (v16 != 0.0) {
      goto LABEL_7;
    }
    goto LABEL_29;
  }
LABEL_43:
  v50 = MBGetDefaultLog();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)v74 = v10;
    *(_WORD *)&v74[8] = 2112;
    *(double *)&v74[10] = v12;
    _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEBUG, "Created compacted SQLite file from %@ to %@", buf, 0x16u);
    id v62 = v10;
    double v63 = v12;
    _MBLog();
  }

  memset(&v70, 0, sizeof(v70));
  a5 = v65;
  if (!lstat(v13, &v70) && ((v70.st_mode & 0xF000) != 0x8000 || v70.st_nlink >= 2u))
  {
    *(double *)&uint64_t v37 = +[MBError errorWithCode:1, @"not a regular file", v62, *(void *)&v63, v64 format];
    goto LABEL_28;
  }
  if (lchown(v13, v71.st_uid, v71.st_gid))
  {
    CFStringRef v51 = @"chown error";
LABEL_54:
    +[MBError posixErrorWithPath:format:](MBError, "posixErrorWithPath:format:", *(void *)&v12, v51, v62, *(void *)&v63, v64);
    *(double *)&uint64_t v37 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    goto LABEL_28;
  }
  if (lchmod(v13, v71.st_mode))
  {
    CFStringRef v51 = @"chmod error";
    goto LABEL_54;
  }
  id v69 = 0;
  v54 = (void *)+[MBProtectionClassUtils getWithPathFSR:v11 error:&v69];
  double v16 = COERCE_DOUBLE(v69);
  if (((_BYTE)v54 + 1) <= 1u)
  {
    v17 = MBGetDefaultLog();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
LABEL_6:

      if (v16 != 0.0)
      {
LABEL_7:
        v18 = MBGetDefaultLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)v74 = v10;
          *(_WORD *)&v74[8] = 2112;
          *(double *)&v74[10] = v16;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to compact SQLite database at %@: %@", buf, 0x16u);
          id v62 = v10;
          double v63 = v16;
          _MBLog();
        }

        id v19 = *(id *)&v16;
        BOOL v20 = 0;
        *a5 = v19;
        goto LABEL_10;
      }
LABEL_29:
      __assert_rtn("+[MBSQLiteFileHandle compactSQLiteDatabaseAtPath:toPath:error:]", "MBSQLiteFileHandle.m", 209, "error");
    }
    *(_DWORD *)buf = 138412546;
    *(void *)v74 = v10;
    *(_WORD *)&v74[8] = 2112;
    *(double *)&v74[10] = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to fetch the protection class for %@: %@", buf, 0x16u);
    id v62 = v10;
    double v63 = v16;
LABEL_5:
    _MBLog();
    goto LABEL_6;
  }
  double v68 = v16;
  unsigned __int8 v55 = +[MBProtectionClassUtils setWithPathFSR:v13 value:v54 error:&v68];
  id v19 = *(id *)&v68;

  if ((v55 & 1) == 0)
  {
    v56 = MBGetDefaultLog();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v74 = v54;
      *(_WORD *)&v74[4] = 2112;
      *(double *)&v74[6] = v12;
      *(_WORD *)&v74[14] = 2112;
      *(void *)&v74[16] = v19;
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "Failed to set the protection class (%d) for %@: %@", buf, 0x1Cu);
      double v63 = v12;
      id v64 = v19;
      id v62 = v54;
      _MBLog();
    }
  }
  +[NSDate timeIntervalSinceReferenceDate];
  double v58 = v57;
  off_t v59 = v70.st_size;
  v60 = MBGetDefaultLog();
  if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
  {
    double v61 = v58 - v33;
    *(_DWORD *)buf = 138412802;
    *(void *)v74 = v10;
    *(_WORD *)&v74[8] = 2048;
    *(double *)&v74[10] = v61;
    *(_WORD *)&v74[18] = 2048;
    *(void *)&v74[20] = v59;
    _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_INFO, "Finished compacting SQLite database at %@ in %0.3fs (%lld bytes)", buf, 0x20u);
    id v64 = (id)v59;
    double v63 = v61;
    id v62 = v10;
    _MBLog();
  }

  BOOL v20 = 1;
LABEL_10:
  if (ppDb)
  {
    *(void *)&double v21 = sqlite3_close(ppDb);
    if (LODWORD(v21))
    {
      double v22 = v21;
      v23 = MBGetDefaultLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)v74 = v10;
        *(_WORD *)&v74[8] = 1024;
        *(_DWORD *)&v74[10] = LODWORD(v22);
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to close SQLite database at %@: %d", buf, 0x12u);
        id v62 = v10;
        double v63 = v22;
        _MBLog();
      }
    }
  }
  id v67 = v19;
  unsigned __int8 v24 = objc_msgSend(p_superclass + 379, "removeJournalsForSQLiteFileAtPath:error:", *(void *)&v12, &v67, v62, *(void *)&v63, v64);
  id v25 = v67;

  if ((v24 & 1) == 0)
  {
    v26 = MBGetDefaultLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(double *)v74 = v12;
      *(_WORD *)&v74[8] = 2112;
      *(void *)&v74[10] = v25;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Failed to remove SQLite files for %@: %@", buf, 0x16u);
      _MBLog();
    }

    id v25 = 0;
  }
  if (!v20)
  {
    id v66 = v25;
    unsigned __int8 v27 = [p_superclass + 379 removeSQLiteFileAtPath:*(void *)&v12 error:&v66];
    id v28 = v66;

    if (v27)
    {
      id v25 = v28;
    }
    else
    {
      v38 = MBGetDefaultLog();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(double *)v74 = v12;
        *(_WORD *)&v74[8] = 2112;
        *(void *)&v74[10] = v28;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Failed to remove SQLite database at %@: %@", buf, 0x16u);
        _MBLog();
      }

      id v25 = 0;
    }
  }

  return v20;
}

+ (BOOL)copySQLiteFileAtPath:(id)a3 toPath:(id)a4 error:(id *)a5
{
  return [a1 copySQLiteFileAtPath:a3 toPath:a4 timeout:a5 error:1.0];
}

+ (BOOL)copySQLiteFileAtPath:(id)a3 toPath:(id)a4 timeout:(double)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = v9;
  double v12 = (const char *)[v11 fileSystemRepresentation];
  double v13 = COERCE_DOUBLE(v10);
  ssize_t v14 = (const char *)[*(id *)&v13 fileSystemRepresentation];
  v84 = 0;
  ppDb = 0;
  memset(&v83, 0, sizeof(v83));
  if (stat(v12, &v83))
  {
    if (a6)
    {
      *a6 = +[MBError posixErrorWithPath:v11 format:@"stat error"];
    }
    double v15 = MBGetDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v16 = *__error();
      *(_DWORD *)buf = 138412546;
      double v87 = *(double *)&v11;
      __int16 v88 = 1024;
      *(_DWORD *)v89 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "stat failed at %@: %{errno}d", buf, 0x12u);
      double v77 = *(double *)&v11;
      *(void *)&double v78 = *__error();
      _MBLog();
    }

    goto LABEL_7;
  }
  off_t st_size = v83.st_size;
  uint64_t v31 = MBGetDefaultLog();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    double v87 = *(double *)&v11;
    __int16 v88 = 2112;
    *(double *)v89 = v13;
    *(_WORD *)&v89[8] = 2048;
    off_t v90 = st_size;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Copying SQLite database at %@ to %@ (%lld bytes)", buf, 0x20u);
    double v78 = v13;
    off_t v79 = st_size;
    double v77 = *(double *)&v11;
    _MBLog();
  }

  uint64_t v32 = +[MBProtectionClassUtils getWithPath:v11 error:a6];
  if ((v32 + 1) < 2u)
  {
    id v25 = 0;
LABEL_36:
    BOOL v27 = 0;
    goto LABEL_37;
  }
  uint64_t v36 = v32;
  +[NSDate timeIntervalSinceReferenceDate];
  double v38 = v37;
  *(void *)&double v39 = sqlite3_open_v2(v12, &ppDb, 1, 0);
  if (LODWORD(v39))
  {
    if (a6)
    {
      double v40 = v39;
      double v41 = ppDb;
      if (ppDb) {
        double v41 = (void *)sqlite3_errmsg(ppDb);
      }
      double v77 = *(double *)&v41;
      double v78 = v40;
      CFStringRef v42 = @"Error opening SQLite file: %s (%d)";
LABEL_43:
      uint64_t v43 = 16;
LABEL_44:
      double v44 = *(double *)&v11;
      goto LABEL_52;
    }
LABEL_7:
    char v17 = 0;
    goto LABEL_8;
  }
  v45 = MBGetDefaultLog();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    double v87 = *(double *)&v11;
    _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEBUG, "Opened SQLite database at %@", buf, 0xCu);
    double v77 = *(double *)&v11;
    _MBLog();
  }

  *(void *)&double v46 = +[MBProtectionClassUtils sqliteOpenFlagForProtectionClass:v36] | 6;
  *(void *)&double v47 = sqlite3_open_v2(v14, &v84, SLODWORD(v46), 0);
  if (LODWORD(v47))
  {
    if (a6)
    {
      double v48 = v47;
      v49 = v84;
      if (v84) {
        v49 = (void *)sqlite3_errmsg(v84);
      }
      double v77 = *(double *)&v49;
      double v78 = v48;
      CFStringRef v42 = @"Error opening SQLite file: %s (%d)";
      uint64_t v43 = 16;
      double v44 = v13;
LABEL_52:
      v50 = +[MBError errorWithCode:path:format:](MBError, "errorWithCode:path:format:", v43, *(void *)&v44, v42, *(void *)&v77, *(void *)&v78, v79);
LABEL_53:
      char v17 = 0;
      *a6 = v50;
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  CFStringRef v51 = MBGetDefaultLog();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    double v87 = v13;
    __int16 v88 = 1024;
    *(_DWORD *)v89 = LODWORD(v46);
    _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEBUG, "Opened SQLite file for copying at %@ with flags 0x%x", buf, 0x12u);
    double v77 = v13;
    double v78 = v46;
    _MBLog();
  }

  memset(&v82, 0, sizeof(v82));
  if (!lstat(v14, &v82) && ((v82.st_mode & 0xF000) != 0x8000 || v82.st_nlink >= 2u))
  {
    if (a6)
    {
      v50 = +[MBError errorWithCode:1 format:@"not a regular file"];
      goto LABEL_53;
    }
    goto LABEL_7;
  }
  if (lchown(v14, v83.st_uid, v83.st_gid))
  {
    if (!a6) {
      goto LABEL_7;
    }
    CFStringRef v52 = @"chown error";
LABEL_65:
    v50 = +[MBError posixErrorWithPath:format:](MBError, "posixErrorWithPath:format:", *(void *)&v13, v52, *(void *)&v77, *(void *)&v78, v79);
    goto LABEL_53;
  }
  if (lchmod(v14, v83.st_mode))
  {
    if (!a6) {
      goto LABEL_7;
    }
    CFStringRef v52 = @"chmod error";
    goto LABEL_65;
  }
  +[NSDate timeIntervalSinceReferenceDate];
  double v54 = v53;
  *(void *)&double v55 = sqlite3_file_control(v84, 0, 102, ppDb);
  if (LODWORD(v55))
  {
    double v56 = v55;
    while (1)
    {
      off_t v57 = sqlite3_extended_errcode(v84);
      double v58 = MBGetDefaultLog();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        double v87 = *(double *)&v11;
        __int16 v88 = 1024;
        *(_DWORD *)v89 = LODWORD(v56);
        *(_WORD *)&v89[4] = 1024;
        *(_DWORD *)&v89[6] = v57;
        _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "sqlite3_file_control(SQLITE_REPLACE_DATABASE) failed at %@: %d/0x%x", buf, 0x18u);
        double v78 = v56;
        off_t v79 = v57;
        double v77 = *(double *)&v11;
        _MBLog();
      }

      if (LODWORD(v56) != 5) {
        break;
      }
      +[NSDate timeIntervalSinceReferenceDate];
      if (v59 - v54 >= a5)
      {
        if (!a6) {
          goto LABEL_7;
        }
        CFStringRef v42 = @"SQLite file is locked";
        uint64_t v43 = 13;
        goto LABEL_44;
      }
      v60 = MBGetDefaultLog();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        double v87 = *(double *)&v11;
        _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEBUG, "Waiting for busy SQLite database at %@", buf, 0xCu);
        double v77 = *(double *)&v11;
        _MBLog();
      }

      +[NSThread sleepForTimeInterval:0.1];
      *(void *)&double v56 = sqlite3_file_control(v84, 0, 102, ppDb);
      if (!LODWORD(v56)) {
        goto LABEL_77;
      }
    }
    if (LODWORD(v56) == 14)
    {
      if (!a6) {
        goto LABEL_7;
      }
      CFStringRef v42 = @"Can't open SQLite file";
      uint64_t v43 = 100;
      goto LABEL_44;
    }
    if (!a6) {
      goto LABEL_7;
    }
    CFStringRef v42 = @"Can't copy SQLite file";
    goto LABEL_43;
  }
LABEL_77:
  double v61 = MBGetDefaultLog();
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    double v87 = *(double *)&v11;
    __int16 v88 = 2112;
    *(double *)v89 = v13;
    _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEBUG, "Copied SQLite file from %@ to %@", buf, 0x16u);
    double v77 = *(double *)&v11;
    double v78 = v13;
    _MBLog();
  }

  *(void *)&double v62 = sqlite3_wal_checkpoint_v2(v84, 0, 2, 0, 0);
  if (LODWORD(v62))
  {
    double v63 = v62;
    off_t v64 = sqlite3_extended_errcode(v84);
    v65 = MBGetDefaultLog();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      double v87 = *(double *)&v11;
      __int16 v88 = 1024;
      *(_DWORD *)v89 = LODWORD(v63);
      *(_WORD *)&v89[4] = 1024;
      *(_DWORD *)&v89[6] = v64;
      _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, "Failed to checkpoint copied SQLite database at %@ (%d/0x%x)", buf, 0x18u);
      double v78 = v63;
      off_t v79 = v64;
      double v77 = *(double *)&v11;
      _MBLog();
    }

    if (!a6) {
      goto LABEL_7;
    }
    CFStringRef v42 = @"Can't checkpoint copied SQLite file";
    goto LABEL_43;
  }
  id v66 = MBGetDefaultLog();
  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    double v87 = *(double *)&v11;
    __int16 v88 = 2112;
    *(double *)v89 = v13;
    _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEBUG, "Checkpointed copied SQLite file from %@ to %@", buf, 0x16u);
    double v77 = *(double *)&v11;
    double v78 = v13;
    _MBLog();
  }

  *(void *)&double v67 = sqlite3_close(v84);
  v84 = 0;
  if (LODWORD(v67))
  {
    double v68 = v67;
    id v69 = MBGetDefaultLog();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      double v87 = v13;
      __int16 v88 = 1024;
      *(_DWORD *)v89 = LODWORD(v68);
      _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_ERROR, "Failed to close copied SQLite database at %@: %d", buf, 0x12u);
      double v77 = v13;
      double v78 = v68;
      _MBLog();
    }

    if (!a6) {
      goto LABEL_7;
    }
    CFStringRef v42 = @"Can't close copied SQLite file";
    goto LABEL_43;
  }
  +[NSDate timeIntervalSinceReferenceDate];
  double v71 = v70;
  int v72 = lstat(v14, &v82);
  off_t v73 = v82.st_size;
  v74 = MBGetDefaultLog();
  if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
  {
    if (v72) {
      uint64_t v75 = -1;
    }
    else {
      uint64_t v75 = v73;
    }
    *(_DWORD *)buf = 138412802;
    double v76 = v71 - v38;
    double v87 = *(double *)&v11;
    __int16 v88 = 2048;
    *(double *)v89 = v76;
    *(_WORD *)&v89[8] = 2048;
    off_t v90 = v75;
    _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_INFO, "Finished copying SQLite database at %@ in %0.3fs (%lld bytes)", buf, 0x20u);
    off_t v79 = v75;
    double v78 = v76;
    double v77 = *(double *)&v11;
    _MBLog();
  }

  char v17 = 1;
LABEL_8:
  if (ppDb)
  {
    *(void *)&double v18 = sqlite3_close(ppDb);
    if (LODWORD(v18))
    {
      double v19 = v18;
      BOOL v20 = MBGetDefaultLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        double v87 = *(double *)&v11;
        __int16 v88 = 1024;
        *(_DWORD *)v89 = LODWORD(v19);
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to close the SQLite database at %@: %d", buf, 0x12u);
        double v77 = *(double *)&v11;
        double v78 = v19;
        _MBLog();
      }
    }
  }
  if (v84)
  {
    *(void *)&double v21 = sqlite3_close(v84);
    if (LODWORD(v21))
    {
      double v22 = v21;
      v23 = MBGetDefaultLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        double v87 = v13;
        __int16 v88 = 1024;
        *(_DWORD *)v89 = LODWORD(v22);
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to close the SQLite database at %@: %d", buf, 0x12u);
        double v77 = v13;
        double v78 = v22;
        _MBLog();
      }
    }
  }
  id v81 = 0;
  unsigned __int8 v24 = +[MBSQLiteFileHandle removeJournalsForSQLiteFileAtPath:error:](MBSQLiteFileHandle, "removeJournalsForSQLiteFileAtPath:error:", *(void *)&v13, &v81, *(void *)&v77, *(void *)&v78, v79);
  id v25 = v81;
  if ((v24 & 1) == 0)
  {
    v26 = MBGetDefaultLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      double v87 = v13;
      __int16 v88 = 2112;
      *(void *)v89 = v25;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Failed to remove the journals for the database at %@: %@", buf, 0x16u);
      _MBLog();
    }

    id v25 = 0;
  }
  if ((v17 & 1) == 0)
  {
    id v80 = v25;
    unsigned __int8 v28 = +[MBSQLiteFileHandle removeSQLiteFileAtPath:*(void *)&v13 error:&v80];
    id v29 = v80;

    if (v28)
    {
      id v25 = v29;
    }
    else
    {
      double v33 = MBGetDefaultLog();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        double v87 = v13;
        __int16 v88 = 2112;
        *(void *)v89 = v29;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Failed to remove the SQLite database at %@: %@", buf, 0x16u);
        _MBLog();
      }

      id v25 = 0;
    }
    uint64_t v34 = MBGetDefaultLog();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      double v87 = *(double *)&v11;
      __int16 v88 = 2112;
      *(void *)v89 = v25;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Failed to copy SQLite database at %@: %@", buf, 0x16u);
      _MBLog();
    }

    goto LABEL_36;
  }
  BOOL v27 = 1;
LABEL_37:

  return v27;
}

+ (BOOL)lastModifiedForSQLiteFileAtPath:(id)a3 time:(int64_t *)a4 error:(id *)a5
{
  id v7 = a3;
  [v7 stringByAppendingString:@"-wal"];
  memset(&v23, 0, sizeof(v23));
  id v8 = objc_claimAutoreleasedReturnValue();
  if (!stat((const char *)[v8 fileSystemRepresentation], &v23))
  {
    if ((v23.st_mode & 0xF000) == 0x8000)
    {
      __darwin_time_t tv_sec = v23.st_mtimespec.tv_sec;
      double v13 = MBGetDefaultLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218242;
        __darwin_time_t v25 = tv_sec;
        __int16 v26 = 2112;
        id v27 = v8;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Using last modified time (%lu) of WAL at %@", buf, 0x16u);
        _MBLog();
      }

      *a4 = tv_sec;
      goto LABEL_23;
    }
    goto LABEL_12;
  }
  id v9 = [v8 lastPathComponent];
  size_t v10 = strlen((const char *)[v9 fileSystemRepresentation]);

  if (*__error() == 63 && v10 >= 0x100)
  {
    id v11 = MBGetDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      __darwin_time_t v25 = (__darwin_time_t)v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "WAL file name too long: %@", buf, 0xCu);
      _MBLog();
    }

    goto LABEL_12;
  }
  if (*__error() == 2)
  {
LABEL_12:
    id v14 = v7;
    if (stat((const char *)[v14 fileSystemRepresentation], &v23))
    {
      int v15 = *__error();
      int v16 = +[MBError posixErrorWithPath:v14 format:@"stat failed"];
      if (v15 != 2)
      {
        char v17 = MBGetDefaultLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          __darwin_time_t v25 = (__darwin_time_t)v14;
          __int16 v26 = 2112;
          id v27 = v16;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "stat failed at %@: %@", buf, 0x16u);
          _MBLog();
        }
      }
      if (!a5) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
    __darwin_time_t v19 = v23.st_mtimespec.tv_sec;
    BOOL v20 = MBGetDefaultLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      __darwin_time_t v25 = v19;
      __int16 v26 = 2112;
      id v27 = v14;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Using last modified time (%lu) of db at %@", buf, 0x16u);
      _MBLog();
    }

    *a4 = v19;
LABEL_23:
    BOOL v18 = 1;
    goto LABEL_24;
  }
  int v16 = +[MBError posixErrorWithPath:v8 format:@"stat failed"];
  double v22 = MBGetDefaultLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    __darwin_time_t v25 = (__darwin_time_t)v8;
    __int16 v26 = 2112;
    id v27 = v16;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "stat failed at %@: %@", buf, 0x16u);
    _MBLog();
  }

  if (!a5) {
    goto LABEL_19;
  }
LABEL_18:
  *a5 = v16;
LABEL_19:

  BOOL v18 = 0;
LABEL_24:

  return v18;
}

+ (id)executePragma:(id)a3 withDatabase:(sqlite3 *)a4
{
  ppStmt = 0;
  do
  {
    id v6 = +[NSString stringWithFormat:@"PRAGMA %@", a3];
    int v7 = sqlite3_prepare(a4, (const char *)[v6 UTF8String], -1, &ppStmt, 0);
  }
  while (v7 == 5);
  if (v7)
  {
    size_t v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "sqlite3_prepare returned %d!", buf, 8u);
      _MBLog();
    }

    id v9 = 0;
  }
  else
  {
    do
      int v8 = sqlite3_step(ppStmt);
    while (v8 == 5);
    if (v8 == 100)
    {
      id v9 = +[NSString stringWithFormat:@"%s", sqlite3_column_text(ppStmt, 0)];
      while (sqlite3_step(ppStmt) == 5)
        ;
    }
    else
    {
      id v9 = 0;
    }
    sqlite3_finalize(ppStmt);
  }
  return v9;
}

+ (BOOL)setAttributes:(id)a3 ofSQLiteFileAtPath:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v27 = +[NSFileManager defaultManager];
  id v9 = [v7 mutableCopy];
  size_t v10 = [v9 objectForKeyedSubscript:NSFileOwnerAccountID];
  uint64_t v11 = [v9 objectForKeyedSubscript:NSFileGroupOwnerAccountID];
  [v9 removeObjectForKey:NSFileOwnerAccountID];
  [v9 removeObjectForKey:NSFileGroupOwnerAccountID];
  id v29 = (void *)v11;
  v30 = v10;
  if (v10) {
    BOOL v12 = v11 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    double v13 = MBGetDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      buf.st_dev = 138412546;
      *(void *)&buf.st_mode = v10;
      WORD2(buf.st_ino) = 2112;
      *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "No uid or gid: %@, %@", (uint8_t *)&buf, 0x16u);
      _MBLog();
    }

    goto LABEL_9;
  }
  memset(&buf, 0, sizeof(buf));
  id v15 = v8;
  if (lstat((const char *)[v15 fileSystemRepresentation], &buf)
    || (buf.st_mode & 0xF000) == 0x8000 && buf.st_nlink < 2u)
  {
    id v16 = v15;
    if (lchown((const char *)[v16 fileSystemRepresentation], (uid_t)objc_msgSend(v10, "integerValue"), (gid_t)objc_msgSend(v29, "integerValue")))
    {
      if (a5)
      {
        +[MBError errorWithCode:1, @"chown error on %@", v16 format];
LABEL_38:
        LOBYTE(v14) = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_41;
      }
      goto LABEL_9;
    }
    if (([v27 setAttributes:v9 ofItemAtPath:v16 error:a5] & 1) == 0) {
      goto LABEL_9;
    }
    id v26 = v7;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    MBSQLiteJournalSuffixes();
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v17 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (!v17)
    {
      LOBYTE(v14) = 1;
      goto LABEL_40;
    }
    id v18 = v17;
    uint64_t v19 = *(void *)v33;
    int v14 = 1;
LABEL_19:
    uint64_t v20 = 0;
    while (1)
    {
      if (*(void *)v33 != v19) {
        objc_enumerationMutation(obj);
      }
      double v21 = [v16 stringByAppendingString:*(void *)(*((void *)&v32 + 1) + 8 * v20)];
      memset(&v31, 0, sizeof(v31));
      id v22 = v21;
      if (!lstat((const char *)[v22 fileSystemRepresentation], &v31)
        && ((v31.st_mode & 0xF000) != 0x8000 || v31.st_nlink >= 2u))
      {
        break;
      }
      id v23 = v22;
      if (lchown((const char *)[v23 fileSystemRepresentation], (uid_t)objc_msgSend(v30, "integerValue"), (gid_t)objc_msgSend(v29, "integerValue")))
      {
        if (!a5) {
          goto LABEL_32;
        }
        +[MBError errorWithCode:1, @"chown error: %@", v23 format];
LABEL_31:
        int v14 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_33;
      }
      v14 &= [v27 setAttributes:v9 ofItemAtPath:v23 error:a5];
LABEL_33:

      if (v18 == (id)++v20)
      {
        id v18 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (!v18)
        {
LABEL_40:

          id v7 = v26;
          goto LABEL_41;
        }
        goto LABEL_19;
      }
    }
    if (!a5)
    {
LABEL_32:
      int v14 = 0;
      goto LABEL_33;
    }
    +[MBError errorWithCode:1, @"not a regular file", v25 format];
    goto LABEL_31;
  }
  if (a5)
  {
    +[MBError errorWithCode:1, @"not a regular file", v25 format];
    goto LABEL_38;
  }
LABEL_9:
  LOBYTE(v14) = 0;
LABEL_41:

  return v14;
}

+ (BOOL)removeSQLiteFileAtPath:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = +[NSFileManager defaultManager];
  id v10 = 0;
  unsigned __int8 v7 = [v6 removeItemAtPath:v5 error:&v10];
  id v8 = v10;

  if (a4 && (v7 & 1) == 0)
  {
    *a4 = +[MBError errorForNSError:v8 path:v5 format:@"Error removing copied SQLite file"];
  }

  return v7;
}

+ (BOOL)removeJournalsForSQLiteFileAtPath:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = +[NSFileManager defaultManager];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  unsigned __int8 v7 = MBSQLiteJournalSuffixes();
  id v8 = [v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v20 = a4;
    id v10 = 0;
    uint64_t v11 = *(void *)v23;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v7);
        }
        double v13 = objc_msgSend(v5, "stringByAppendingString:", *(void *)(*((void *)&v22 + 1) + 8 * i), v19);
        if ([v6 fileExistsAtPath:v13])
        {
          id v21 = v10;
          unsigned int v14 = [v6 removeItemAtPath:v13 error:&v21];
          id v15 = v21;

          if (!v14)
          {
            if (v20)
            {
              id *v20 = +[MBError errorForNSError:v15 path:v13 format:@"Error removing copied SQLite file journal"];
            }

            BOOL v17 = 0;
            goto LABEL_18;
          }
          id v16 = MBGetDefaultLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)stat buf = 138412290;
            id v27 = v13;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Removed copied SQLite file journal at %@", buf, 0xCu);
            uint64_t v19 = v13;
            _MBLog();
          }

          id v10 = v15;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
      if (v9) {
        continue;
      }
      break;
    }
    BOOL v17 = 1;
    id v15 = v10;
  }
  else
  {
    id v15 = 0;
    BOOL v17 = 1;
  }
LABEL_18:

  return v17;
}

+ (void)removeAllSQLiteFilesAtPath:(id)a3
{
  id v3 = a3;
  +[MBSQLiteFileHandle removeJournalsForSQLiteFileAtPath:v3 error:0];
  +[MBSQLiteFileHandle removeSQLiteFileAtPath:v3 error:0];
}

+ (id)SQLiteFileHandleWithOriginalFileHandle:(id)a3 copiedFileHandle:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  unsigned __int8 v7 = [[MBSQLiteFileHandle alloc] initWithOriginalFileHandle:v6 copiedFileHandle:v5];

  return v7;
}

- (MBSQLiteFileHandle)initWithOriginalFileHandle:(id)a3 copiedFileHandle:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MBSQLiteFileHandle;
  id v8 = [(MBFileHandleProxy *)&v11 initWithFileHandle:a4];
  id v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_originalFileHandle, a3);
  }

  return v9;
}

- (BOOL)isSQLiteFile
{
  return 1;
}

- (BOOL)statWithBuffer:(stat *)a3 error:(id *)a4
{
  if (-[MBFileHandle statWithBuffer:error:](self->_originalFileHandle, "statWithBuffer:error:"))
  {
    __darwin_time_t v10 = 0;
    id v7 = [(MBFileHandle *)self->_originalFileHandle path];
    BOOL v8 = +[MBSQLiteFileHandle lastModifiedForSQLiteFileAtPath:v7 time:&v10 error:a4];

    if (v8)
    {
      a3->st_mtimespec.__darwin_time_t tv_sec = v10;
      a3->st_mtimespec.tv_nsec = 0;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (BOOL)closeWithError:(id *)a3
{
  unsigned int v5 = -[MBFileHandle closeWithError:](self->_originalFileHandle, "closeWithError:");
  v10.receiver = self;
  v10.super_class = (Class)MBSQLiteFileHandle;
  unsigned int v6 = [(MBFileHandleProxy *)&v10 closeWithError:a3];
  id v7 = [(MBFileHandleProxy *)self fileHandle];
  BOOL v8 = [v7 path];
  LODWORD(a3) = +[MBSQLiteFileHandle removeSQLiteFileAtPath:v8 error:a3] & v6 & v5;

  return (char)a3;
}

- (void).cxx_destruct
{
}

@end