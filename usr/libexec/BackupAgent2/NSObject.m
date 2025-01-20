@interface NSObject
- (BOOL)removeFailedAssetFromDestination:(id)a3 withError:(id *)a4;
- (BOOL)restoreAttributesToDestination:(id)a3 error:(id *)a4;
- (BOOL)restoreAttributesToDestination:(id)a3 withUserID:(unsigned int)a4 groupID:(unsigned int)a5 permissions:(unsigned __int16)a6 error:(id *)a7;
- (BOOL)restoreOwnershipToDestination:(id)a3 withUserID:(unsigned int)a4 withGroupID:(unsigned int)a5 withError:(id *)a6;
- (BOOL)restoreProtectionClassToDestination:(id)a3 unspecifiedDirectoryProtectionClass:(unsigned __int8)a4 logger:(id)a5 error:(id *)a6;
- (id)_setProtectionClassWithFD:(int)a3;
- (id)_setProtectionClassWithPathFSR:(const char *)a3;
- (id)moveFileFromSource:(id)a3 destination:(id)a4 destinationSize:(unint64_t)a5 conflictResolution:(int64_t)a6 error:(id *)a7;
- (id)restoreDirectoryAtPath:(id)a3 settingDataProtection:(BOOL)a4 settingOwnershipAndFlags:(BOOL)a5;
- (id)restoreEmptyRegularFileAtPath:(id)a3 settingAttributes:(BOOL)a4;
- (id)restoreLastModifiedWithFD:(int)a3;
- (id)restoreRegularFileAtPath:(id)a3 settingAttributes:(BOOL)a4;
- (id)restoreSymbolicLinkAtPath:(id)a3 withTarget:(id)a4 settingOwnershipAndFlags:(BOOL)a5;
- (void)getNode:(id *)a3;
@end

@implementation NSObject

- (void)getNode:(id *)a3
{
}

- (BOOL)removeFailedAssetFromDestination:(id)a3 withError:(id *)a4
{
  id v7 = a3;
  if (([self conformsToProtocol:&OBJC_PROTOCOL___MBRestorable] & 1) == 0)
  {
    v19 = +[NSAssertionHandler currentHandler];
    v20 = (objc_class *)objc_opt_class();
    [v19 handleFailureInMethod:a2 object:self file:@"MBRestorable.m" lineNumber:102 description:@"%s is not MBRestorable", class_getName(v20)];
  }
  id v8 = v7;
  v9 = (const char *)[v8 fileSystemRepresentation];
  v10 = MBGetDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    buf.st_dev = 138412290;
    *(void *)&buf.st_mode = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Removing staged item at %@", (uint8_t *)&buf, 0xCu);
    _MBLog();
  }

  memset(&buf, 0, sizeof(buf));
  if (lstat(v9, &buf))
  {
    if (*__error() != 2)
    {
      if (a4)
      {
        *a4 = +[MBError posixErrorWithCode:101 path:v8 format:@"lstat error"];
      }
      v11 = MBGetDefaultLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v12 = *__error();
        *(_DWORD *)v22 = 138412546;
        id v23 = v8;
        __int16 v24 = 1024;
        int v25 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "lstat failed at %@: %{errno}d", v22, 0x12u);
        __error();
        _MBLog();
      }

LABEL_24:
      BOOL v17 = 0;
      goto LABEL_25;
    }
  }
  else if ((buf.st_mode & 0xF000) == 0x4000)
  {
    if (rmdir(v9))
    {
      if (*__error() != 66)
      {
        if (a4)
        {
          +[MBError posixErrorWithCode:102 path:v8 format:@"rmdir error"];
          BOOL v17 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_25;
        }
        goto LABEL_24;
      }
      v13 = MBGetDefaultLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v22 = 138412290;
        id v23 = v8;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Leaving non-empty staged directory at %@", v22, 0xCu);
        _MBLog();
      }
    }
  }
  else
  {
    v14 = +[NSFileManager defaultManager];
    id v21 = 0;
    unsigned __int8 v15 = [v14 removeItemAtPath:v8 error:&v21];
    id v16 = v21;

    if ((v15 & 1) == 0)
    {
      if (a4)
      {
        *a4 = +[MBError errorWithCode:102, v16, v8, @"Error removing existing item at %@", v8 error path format];
      }

      goto LABEL_24;
    }
  }
  BOOL v17 = 1;
LABEL_25:

  return v17;
}

- (BOOL)restoreOwnershipToDestination:(id)a3 withUserID:(unsigned int)a4 withGroupID:(unsigned int)a5 withError:(id *)a6
{
  id v11 = a3;
  if (([self conformsToProtocol:&OBJC_PROTOCOL___MBRestorable] & 1) == 0)
  {
    BOOL v17 = +[NSAssertionHandler currentHandler];
    v18 = (objc_class *)objc_opt_class();
    [v17 handleFailureInMethod:a2 object:self file:@"MBRestorable.m" lineNumber:136 description:@"%s is not MBRestorable", class_getName(v18)];
  }
  int v12 = MBGetDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)stat buf = 138412290;
    id v20 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Restoring ownership at %@", buf, 0xCu);
    _MBLog();
  }

  id v13 = v11;
  int v14 = lchown((const char *)[v13 fileSystemRepresentation], a4, a5);
  int v15 = v14;
  if (a6 && v14)
  {
    *a6 = +[MBError posixErrorWithCode:102 path:v13 format:@"lchown error"];
  }

  return v15 == 0;
}

- (BOOL)restoreAttributesToDestination:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if (([self conformsToProtocol:&OBJC_PROTOCOL___MBRestorable] & 1) == 0)
  {
    __int16 v24 = +[NSAssertionHandler currentHandler];
    int v25 = (objc_class *)objc_opt_class();
    [v24 handleFailureInMethod:a2 object:self file:@"MBRestorable.m" lineNumber:149 description:@"%s is not MBRestorable", class_getName(v25)];
  }
  id v8 = self;
  uint64_t v29 = 0;
  memset(v28, 0, sizeof(v28));
  [v8 getNode:v28];
  v9 = [v8 domain];
  if (!v9)
  {
    v26 = +[NSAssertionHandler currentHandler];
    [v26 handleFailureInMethod:a2 object:v8 file:@"MBRestorable.m" lineNumber:155 description:@"Null domain"];
  }
  if ([v9 adjustNodeOwnershipAndPermissionsForDataMigratorPlugIn:v28 path:v7])
  {
    v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)stat buf = 138412290;
      *(void *)v31 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Fixing ownership at %@", buf, 0xCu);
      id v27 = v7;
      _MBLog();
    }
  }
  uint64_t v11 = DWORD1(v28[0]);
  uint64_t v12 = DWORD2(v28[0]);
  uint64_t v13 = sub_10008F450((uint64_t)v28);
  uint64_t v14 = sub_10007CA5C((uint64_t)v28);
  if (!v14) {
    goto LABEL_24;
  }
  uint64_t v15 = v14;
  id v16 = MBGetDefaultLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)stat buf = 67109120;
    *(_DWORD *)v31 = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Restoring BSD flags: 0x%x", buf, 8u);
    id v27 = (id)v15;
    _MBLog();
  }

  id v17 = v7;
  if (lchflags((const char *)[v17 fileSystemRepresentation], v15))
  {
    int v18 = *__error();
    v19 = MBGetDefaultLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)stat buf = 67109634;
      *(_DWORD *)v31 = v15;
      *(_WORD *)&v31[4] = 2112;
      *(void *)&v31[6] = v17;
      __int16 v32 = 1024;
      int v33 = v18;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to restore BSD flags (0x%x) at %@: %{errno}d", buf, 0x18u);
      _MBLog();
    }

    if (a4)
    {
      +[MBError posixErrorWithCode:102 path:v17 format:@"lchflags error"];
      unsigned __int8 v20 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      unsigned __int8 v20 = 0;
    }
  }
  else
  {
LABEL_24:
    if (sub_10008F3CC((uint64_t)v28))
    {
      id v21 = [v8 extendedAttributes];
      v22 = [v21 objectForKeyedSubscript:@"com.apple.decmpfs"];

      sub_10007CAC8(v7, v22, 0);
    }
    unsigned __int8 v20 = -[NSObject restoreAttributesToDestination:withUserID:groupID:permissions:error:](v8, "restoreAttributesToDestination:withUserID:groupID:permissions:error:", v7, v11, v12, v13, a4, v27);
  }

  return v20;
}

- (BOOL)restoreAttributesToDestination:(id)a3 withUserID:(unsigned int)a4 groupID:(unsigned int)a5 permissions:(unsigned __int16)a6 error:(id *)a7
{
  int v7 = a6;
  id v12 = a3;
  if (([self conformsToProtocol:&OBJC_PROTOCOL___MBRestorable] & 1) == 0)
  {
    id v21 = +[NSAssertionHandler currentHandler];
    v22 = (objc_class *)objc_opt_class();
    [v21 handleFailureInMethod:a2 object:self file:@"MBRestorable.m" lineNumber:197 description:@"%s is not MBRestorable", class_getName(v22)];
  }
  uint64_t v33 = 0;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  [self getNode:&v29];
  v28[1] = 0;
  v28[2] = 0;
  v28[0] = 0x39E0000000005;
  long long v13 = v30;
  v24[0] = v30;
  v24[1] = 0;
  v24[2] = *((void *)&v30 + 1);
  v24[3] = 0;
  uint64_t v14 = v31;
  v24[4] = v31;
  v24[5] = 0;
  time_t v15 = time(0);
  v24[6] = v15;
  v24[7] = 0;
  unsigned int v25 = a4;
  unsigned int v26 = a5;
  uint64_t v27 = (unsigned __int16)v7;
  id v16 = MBGetDefaultLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)stat buf = 67110914;
    unsigned int v35 = a4;
    __int16 v36 = 1024;
    unsigned int v37 = a5;
    __int16 v38 = 2048;
    uint64_t v39 = v13;
    __int16 v40 = 2048;
    uint64_t v41 = *((void *)&v13 + 1);
    __int16 v42 = 2048;
    uint64_t v43 = v14;
    __int16 v44 = 2048;
    time_t v45 = v15;
    __int16 v46 = 1024;
    int v47 = v7;
    __int16 v48 = 2112;
    id v49 = v12;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Restoring attributes u/gid %d/%d, b/m/c/atime %ld/%ld/%ld/%ld, permissions 0%o to %@", buf, 0x46u);
    _MBLog();
  }

  id v17 = v12;
  int v18 = setattrlist((const char *)[v17 fileSystemRepresentation], v28, v24, 0x50uLL, 3u);
  int v19 = v18;
  if (a7 && v18 < 0)
  {
    *a7 = +[MBError posixErrorWithPath:v17 format:@"setattrlist() failed"];
  }

  return v19 >= 0;
}

- (id)moveFileFromSource:(id)a3 destination:(id)a4 destinationSize:(unint64_t)a5 conflictResolution:(int64_t)a6 error:(id *)a7
{
  id v13 = a3;
  id v14 = a4;
  if (([self conformsToProtocol:&OBJC_PROTOCOL___MBRestorable] & 1) == 0)
  {
    time_t v45 = +[NSAssertionHandler currentHandler];
    __int16 v46 = (objc_class *)objc_opt_class();
    [v45 handleFailureInMethod:a2 object:self file:@"MBRestorable.m" lineNumber:234 description:@"%s is not MBRestorable", class_getName(v46)];
  }
  time_t v15 = self;
  if (!_os_feature_enabled_impl())
  {
    id v21 = 0;
    goto LABEL_56;
  }
  if (!a6) {
    sub_10009A838();
  }
  uint64_t v57 = 0;
  long long v55 = 0u;
  long long v56 = 0u;
  memset(v54, 0, sizeof(v54));
  [v15 getNode:v54];
  if (*((void *)&v55 + 1) == a5)
  {
    id v16 = +[MBDigest sha256];
    id v17 = [v16 digestForFileAtPath:v14 error:0];

    int v18 = +[MBDigest sha256];
    int v19 = [v18 digestForFileAtPath:v13 error:0];

    if (v17 && v19 && [v17 isEqualToData:v19])
    {
      unsigned __int8 v20 = MBGetDefaultLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)stat buf = 138412290;
        id v59 = v14;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "The hashes of existing file and restoring file are the same. Skip re-restoring On My iPhone file at %@", buf, 0xCu);
        _MBLog();
      }

      id v21 = v14;
      goto LABEL_55;
    }
  }
  v50 = a7;
  v51 = v15;
  int v19 = [v14 pathExtension];
  v52 = +[NSFileManager defaultManager];
  int v22 = 0;
  id v17 = 0;
  while (1)
  {
    if (objc_msgSend(v19, "length", v47, v48))
    {
      id v23 = [v14 stringByDeletingPathExtension];
      __int16 v24 = +[NSString stringWithFormat:@"%@ %d", v23, (v22 + 2)];
      uint64_t v25 = [v24 stringByAppendingPathExtension:v19];

      id v17 = (void *)v25;
    }
    else
    {
      +[NSString stringWithFormat:@"%@ %d", v14, (v22 + 2)];
      id v17 = v23 = v17;
    }

    if (a6 == 3) {
      break;
    }
    if (a6 == 2)
    {
      id v38 = v13;
      uint64_t v39 = (const char *)[v38 fileSystemRepresentation];
      id v40 = v17;
      if (!link(v39, (const char *)[v40 fileSystemRepresentation])) {
        goto LABEL_45;
      }
      unint64_t v29 = *__error();
      uint64_t v41 = MBGetDefaultLog();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)stat buf = 138412802;
        id v59 = v13;
        __int16 v60 = 2112;
        id v61 = v40;
        __int16 v62 = 1024;
        LODWORD(v63) = v29;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "Failed to hardlink from %@ to %@: %{errno}d", buf, 0x1Cu);
        id v48 = v40;
        id v49 = (id)v29;
        id v47 = v38;
        _MBLog();
      }

      unint64_t v31 = v29;
      CFStringRef v32 = @"Failed to hardlink file";
    }
    else
    {
      if (a6 != 1) {
        goto LABEL_45;
      }
      id v26 = v13;
      uint64_t v27 = (const char *)[v26 fileSystemRepresentation];
      id v28 = v17;
      if (!clonefile(v27, (const char *)[v28 fileSystemRepresentation], 0)) {
        goto LABEL_45;
      }
      unint64_t v29 = *__error();
      long long v30 = MBGetDefaultLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)stat buf = 138412802;
        id v59 = v13;
        __int16 v60 = 2112;
        id v61 = v28;
        __int16 v62 = 1024;
        LODWORD(v63) = v29;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Failed to clone from %@ to %@: %{errno}d", buf, 0x1Cu);
        id v48 = v28;
        id v49 = (id)v29;
        id v47 = v26;
        _MBLog();
      }

      unint64_t v31 = v29;
      CFStringRef v32 = @"Failed to clone file";
    }
    +[MBError errorWithErrno:format:](MBError, "errorWithErrno:format:", v31, v32, v47, v48, v49);
    id v34 = (id)objc_claimAutoreleasedReturnValue();
    if (!v34) {
      goto LABEL_45;
    }
LABEL_42:
    if (v29 != 17)
    {
      if (v50) {
        id *v50 = v34;
      }
      uint64_t v43 = MBGetDefaultLog();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)stat buf = 138413058;
        id v59 = v13;
        __int16 v60 = 2112;
        id v61 = v14;
        __int16 v62 = 2048;
        int64_t v63 = a6;
        __int16 v64 = 2112;
        id v65 = v34;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "Failed to resolve On My iPhone file conflict from %@ to %@(%ld): %@", buf, 0x2Au);
        _MBLog();
      }

LABEL_53:
      id v21 = 0;
      goto LABEL_54;
    }

    if (++v22 == 2147483645) {
      goto LABEL_53;
    }
  }
  id v53 = 0;
  unsigned __int8 v33 = [v52 moveItemAtPath:v13 toPath:v17 error:&v53];
  id v34 = v53;
  if (v33)
  {
LABEL_41:
    LODWORD(v29) = 0;
    if (!v34) {
      goto LABEL_45;
    }
    goto LABEL_42;
  }
  unsigned int v35 = MBGetDefaultLog();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)stat buf = 138412802;
    id v59 = v13;
    __int16 v60 = 2112;
    id v61 = v17;
    __int16 v62 = 2112;
    int64_t v63 = (int64_t)v34;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Failed to move from %@ to %@: %@", buf, 0x20u);
    id v48 = v17;
    id v49 = v34;
    id v47 = v13;
    _MBLog();
  }

  __int16 v36 = [v34 domain];
  if (![v36 isEqualToString:NSCocoaErrorDomain])
  {

    goto LABEL_41;
  }
  id v37 = [v34 code];

  if (v37 == (id)516) {
    LODWORD(v29) = 17;
  }
  else {
    LODWORD(v29) = 0;
  }
  if (v34) {
    goto LABEL_42;
  }
LABEL_45:
  __int16 v42 = MBGetDefaultLog();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)stat buf = 138412802;
    id v59 = v13;
    __int16 v60 = 2112;
    id v61 = v17;
    __int16 v62 = 2048;
    int64_t v63 = a6;
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Successfully resolved On My iPhone file conflict from %@ to %@(%ld)", buf, 0x20u);
    _MBLog();
  }

  id v21 = v17;
LABEL_54:
  time_t v15 = v51;

LABEL_55:
LABEL_56:

  return v21;
}

- (BOOL)restoreProtectionClassToDestination:(id)a3 unspecifiedDirectoryProtectionClass:(unsigned __int8)a4 logger:(id)a5 error:(id *)a6
{
  uint64_t v8 = a4;
  id v11 = a3;
  id v12 = a5;
  if (([self conformsToProtocol:&OBJC_PROTOCOL___MBRestorable] & 1) == 0)
  {
    unsigned int v35 = +[NSAssertionHandler currentHandler];
    __int16 v36 = (objc_class *)objc_opt_class();
    [v35 handleFailureInMethod:a2 object:self file:@"MBRestorable.m" lineNumber:308 description:@"%s is not MBRestorable", class_getName(v36)];
  }
  id v13 = self;
  uint64_t v43 = 0;
  memset(v42, 0, sizeof(v42));
  [v13 getNode:v42];
  BOOL v14 = sub_10008F414((uint64_t)v42);
  BOOL v15 = sub_10008F428((uint64_t)v42);
  uint64_t v16 = BYTE6(v43);
  if (v14 && BYTE6(v43) == 255)
  {
    id v17 = MBGetDefaultLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)stat buf = 138412546;
      *(void *)time_t v45 = v13;
      *(_WORD *)&v45[8] = 1024;
      *(_DWORD *)&v45[10] = v8;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Unspecified data class for %@ -> defaulting to %d", buf, 0x12u);
      uint64_t v37 = (uint64_t)v13;
      unint64_t v38 = v8;
      _MBLog();
    }

    BYTE6(v43) = v8;
    uint64_t v16 = v8;
  }
  char v18 = v16 != 255 || v14;
  if ((v18 & 1) == 0)
  {
    uint64_t v16 = 4;
    BYTE6(v43) = 4;
  }
  if (!v15 && !v14)
  {
    id v23 = MBGetDefaultLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)stat buf = 138412290;
      *(void *)time_t v45 = v11;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "Not restoring protection class for symlink at %@", buf, 0xCu);
      _MBLog();
    }
    goto LABEL_38;
  }
  if ((v16 & 0xFFFFFFFB) != 0)
  {
    int v19 = MBGetDefaultLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)stat buf = 67109378;
      *(_DWORD *)time_t v45 = v16;
      *(_WORD *)&v45[4] = 2112;
      *(void *)&v45[6] = v11;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Restoring protection class %d at %@", buf, 0x12u);
      uint64_t v37 = v16;
      unint64_t v38 = (unint64_t)v11;
      _MBLog();
    }
  }
  if (v15) {
    unsigned int v20 = 4;
  }
  else {
    unsigned int v20 = 0;
  }
  if (v16) {
    uint64_t v21 = v16;
  }
  else {
    uint64_t v21 = v20;
  }
  id v41 = 0;
  unsigned int v22 = +[MBProtectionClassUtils setWithPath:value:error:](MBProtectionClassUtils, "setWithPath:value:error:", v11, v21, &v41, v37, v38);
  id v23 = v41;
  if (!v22)
  {
    if ((+[MBError isError:v23 withCode:208] & 1) == 0)
    {
      if (!sub_100092304()) {
        goto LABEL_38;
      }
      __int16 v24 = MBGetDefaultLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)stat buf = 67109634;
        *(_DWORD *)time_t v45 = v21;
        *(_WORD *)&v45[4] = 2112;
        *(void *)&v45[6] = v11;
        *(_WORD *)&v45[14] = 2112;
        *(void *)&v45[16] = v23;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_FAULT, "Failed to set protection class %d at %@: %@", buf, 0x1Cu);
        goto LABEL_36;
      }
LABEL_37:

      goto LABEL_38;
    }
    if (+[MBProtectionClassUtils canOpenWhenLocked:v21])
    {
      if (!sub_100092304()) {
        goto LABEL_38;
      }
      __int16 v24 = MBGetDefaultLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)stat buf = 67109120;
        *(_DWORD *)time_t v45 = v21;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_FAULT, "Unexpected device lock error for pc:%d", buf, 8u);
LABEL_36:
        _MBLog();
        goto LABEL_37;
      }
      goto LABEL_37;
    }
    id v40 = 0;
    uint64_t v27 = +[MBProtectionClassUtils getWithPath:v11 error:&v40];
    id v28 = v40;
    unint64_t v29 = v28;
    if (v27 == 255)
    {
      if (a6) {
        *a6 = v28;
      }
      if (sub_100092304())
      {
        unsigned __int8 v33 = MBGetDefaultLog();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)stat buf = 138412546;
          *(void *)time_t v45 = v11;
          *(_WORD *)&v45[8] = 2112;
          *(void *)&v45[10] = v29;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_FAULT, "Failed to fetch the protection class for %@: %@", buf, 0x16u);
          _MBLog();
        }
      }
    }
    else if (+[MBProtectionClassUtils canOpenWhenLocked:v27])
    {
      long long v30 = MBGetDefaultLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)stat buf = 67109634;
        *(_DWORD *)time_t v45 = 2;
        *(_WORD *)&v45[4] = 1024;
        *(_DWORD *)&v45[6] = v21;
        *(_WORD *)&v45[10] = 2112;
        *(void *)&v45[12] = v11;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Restoring protection class %d instead of %d for: %@", buf, 0x18u);
        _MBLog();
      }

      id v39 = v29;
      unsigned __int8 v31 = +[MBProtectionClassUtils setWithPath:v11 value:2 error:&v39];
      id v32 = v39;

      if (v31)
      {
        [v12 logSetClassForRestorable:v13 state:5 absolutePath:v11 value:2];
        BOOL v25 = 1;
      }
      else
      {
        if (a6) {
          *a6 = v32;
        }
        id v34 = MBGetDefaultLog();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)stat buf = 67109890;
          *(_DWORD *)time_t v45 = 2;
          *(_WORD *)&v45[4] = 1024;
          *(_DWORD *)&v45[6] = v21;
          *(_WORD *)&v45[10] = 2112;
          *(void *)&v45[12] = v11;
          *(_WORD *)&v45[20] = 2112;
          *(void *)&v45[22] = v32;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Failed to restore protection class %d instead of %d at %@: %@", buf, 0x22u);
          _MBLog();
        }

        BOOL v25 = 0;
      }
      unint64_t v29 = v32;
      goto LABEL_59;
    }
    BOOL v25 = 1;
LABEL_59:

    goto LABEL_39;
  }
  [v12 logSetClassForRestorable:v13 state:5 absolutePath:v11 value:v21];
LABEL_38:
  BOOL v25 = 1;
LABEL_39:

  return v25;
}

- (id)restoreLastModifiedWithFD:(int)a3
{
  if (([self conformsToProtocol:&OBJC_PROTOCOL___MBRestorable] & 1) == 0)
  {
    id v12 = +[NSAssertionHandler currentHandler];
    id v13 = (objc_class *)objc_opt_class();
    [v12 handleFailureInMethod:a2 object:self file:@"MBRestorable.m" lineNumber:381 description:@"%s is not MBRestorable", class_getName(v13)];
  }
  v6 = self;
  uint64_t v19 = 0;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  [v6 getNode:&v15];
  int v7 = MBGetDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = +[NSDate dateWithTimeIntervalSince1970:(double)*((uint64_t *)&v16 + 1)];
    *(_DWORD *)stat buf = 138412546;
    *(void *)&uint8_t buf[4] = v8;
    __int16 v21 = 2112;
    *(void *)unsigned int v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Restoring last modified time (%@) for %@", buf, 0x16u);

    BOOL v14 = +[NSDate dateWithTimeIntervalSince1970:(double)*((uint64_t *)&v16 + 1)];
    _MBLog();
  }
  *(void *)stat buf = time(0);
  *(_DWORD *)&buf[8] = 0;
  *(void *)&v22[2] = *((void *)&v16 + 1);
  int v23 = 0;
  if (futimes(a3, (const timeval *)buf))
  {
    v9 = [v6 description];
    v10 = +[MBError posixErrorWithCode:102 path:v9 format:@"futimes error"];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_setProtectionClassWithPathFSR:(const char *)a3
{
  if (([self conformsToProtocol:&OBJC_PROTOCOL___MBRestorable] & 1) == 0)
  {
    id v13 = +[NSAssertionHandler currentHandler];
    BOOL v14 = (objc_class *)objc_opt_class();
    [v13 handleFailureInMethod:a2 object:self file:@"MBRestorable.m" lineNumber:398 description:@"%s is not MBRestorable", class_getName(v14)];
  }
  uint64_t v17 = 0;
  memset(v16, 0, sizeof(v16));
  [self getNode:v16];
  if (BYTE6(v17))
  {
    v6 = MBGetDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)stat buf = 67109378;
      int v19 = BYTE6(v17);
      __int16 v20 = 2080;
      __int16 v21 = a3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Restoring protection class: %d for path: %s", buf, 0x12u);
      _MBLog();
    }

    id v15 = 0;
    unsigned __int8 v7 = +[MBProtectionClassUtils setWithPathFSR:a3 value:BYTE6(v17) error:&v15];
    id v8 = v15;
    v9 = v8;
    if ((v7 & 1) == 0 && [v8 code] != (id)208)
    {
      id v10 = +[MBError errorWithCode:102 error:v9 format:@"fcntl error"];
      goto LABEL_11;
    }
  }
  else
  {
    v9 = 0;
  }
  id v10 = v9;
  v9 = v10;
LABEL_11:
  id v11 = v10;

  return v11;
}

- (id)_setProtectionClassWithFD:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (([self conformsToProtocol:&OBJC_PROTOCOL___MBRestorable] & 1) == 0)
  {
    id v12 = +[NSAssertionHandler currentHandler];
    id v13 = (objc_class *)objc_opt_class();
    [v12 handleFailureInMethod:a2 object:self file:@"MBRestorable.m" lineNumber:420 description:@"%s is not MBRestorable", class_getName(v13)];
  }
  uint64_t v16 = 0;
  memset(v15, 0, sizeof(v15));
  [self getNode:v15];
  if (BYTE6(v16))
  {
    v6 = MBGetDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)stat buf = 67109120;
      int v18 = BYTE6(v16);
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Restoring protection class: %d", buf, 8u);
      _MBLog();
    }

    id v14 = 0;
    unsigned __int8 v7 = +[MBProtectionClassUtils setWithFD:v3 value:BYTE6(v16) error:&v14];
    id v8 = v14;
    if ((v7 & 1) == 0
      && !+[MBError isError:v8 withCode:208])
    {
      id v9 = +[MBError errorWithCode:102 error:v8 format:@"fcntl error"];
      goto LABEL_11;
    }
  }
  else
  {
    id v8 = 0;
  }
  id v9 = v8;
  id v8 = v9;
LABEL_11:
  id v10 = v9;

  return v10;
}

- (id)restoreSymbolicLinkAtPath:(id)a3 withTarget:(id)a4 settingOwnershipAndFlags:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  if (([self conformsToProtocol:&OBJC_PROTOCOL___MBRestorable] & 1) == 0)
  {
    unsigned int v22 = +[NSAssertionHandler currentHandler];
    int v23 = (objc_class *)objc_opt_class();
    [v22 handleFailureInMethod:a2 object:self file:@"MBRestorable.m" lineNumber:442 description:@"%s is not MBRestorable", class_getName(v23)];
  }
  id v11 = self;
  uint64_t v46 = 0;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  [v11 getNode:&v42];
  if (!v9)
  {
    __int16 v24 = +[NSAssertionHandler currentHandler];
    [v24 handleFailureInMethod:a2 object:v11 file:@"MBRestorable.m" lineNumber:447 description:@"Null path"];
  }
  if (sub_10008F43C((uint64_t)&v42))
  {
    if (v10) {
      goto LABEL_7;
    }
  }
  else
  {
    BOOL v25 = +[NSAssertionHandler currentHandler];
    [v25 handleFailureInMethod:a2 object:v11 file:@"MBRestorable.m" lineNumber:448 description:@"Not a symbolic link"];

    if (v10) {
      goto LABEL_7;
    }
  }
  id v26 = +[NSAssertionHandler currentHandler];
  [v26 handleFailureInMethod:a2 object:v11 file:@"MBRestorable.m" lineNumber:449 description:@"Target not set for symbolic link"];

LABEL_7:
  id v12 = [v11 domain];
  if (!v12)
  {
    uint64_t v27 = +[NSAssertionHandler currentHandler];
    [v27 handleFailureInMethod:a2 object:v11 file:@"MBRestorable.m" lineNumber:452 description:@"Null domain"];
  }
  if ([v12 adjustNodeOwnershipAndPermissionsForDataMigratorPlugIn:&v42 path:v9])
  {
    id v13 = MBGetDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)stat buf = 138412290;
      id v48 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Fixing ownership at %@", buf, 0xCu);
      _MBLog();
    }
  }
  id v41 = 0;
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_10007E7C8;
  v38[3] = &unk_1000F2358;
  id v39 = v9;
  id v14 = v10;
  id v40 = v14;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  long long v33 = v43;
  long long v34 = v44;
  long long v35 = v45;
  v28[2] = sub_10007EAE8;
  void v28[3] = &unk_1000F2380;
  BOOL v37 = a5;
  uint64_t v36 = v46;
  long long v32 = v42;
  id v15 = v39;
  id v29 = v15;
  uint64_t v16 = v11;
  long long v30 = v16;
  id v31 = 0;
  unsigned __int8 v17 = [v15 mb_openatWithFlags:0x200000 error:&v41 setupDir:v38 itemAccessor:v28];
  id v18 = v41;
  int v19 = v18;
  id v20 = 0;
  if ((v17 & 1) == 0) {
    id v20 = v18;
  }

  return v20;
}

- (id)restoreDirectoryAtPath:(id)a3 settingDataProtection:(BOOL)a4 settingOwnershipAndFlags:(BOOL)a5
{
  id v9 = a3;
  if (([self conformsToProtocol:&OBJC_PROTOCOL___MBRestorable] & 1) == 0)
  {
    id v20 = +[NSAssertionHandler currentHandler];
    __int16 v21 = (objc_class *)objc_opt_class();
    [v20 handleFailureInMethod:a2 object:self file:@"MBRestorable.m" lineNumber:530 description:@"%s is not MBRestorable", class_getName(v21)];
  }
  id v10 = self;
  if (!v9)
  {
    unsigned int v22 = +[NSAssertionHandler currentHandler];
    [v22 handleFailureInMethod:a2 object:v10 file:@"MBRestorable.m" lineNumber:531 description:@"Null path"];
  }
  uint64_t v48 = 0;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  [v10 getNode:&v44];
  if (!sub_10008F414((uint64_t)&v44))
  {
    int v23 = +[NSAssertionHandler currentHandler];
    [v23 handleFailureInMethod:a2 object:v10 file:@"MBRestorable.m" lineNumber:535 description:@"Not a directory"];
  }
  id v11 = [v10 domain];
  if (!v11)
  {
    __int16 v24 = +[NSAssertionHandler currentHandler];
    [v24 handleFailureInMethod:a2 object:v10 file:@"MBRestorable.m" lineNumber:538 description:@"Null domain"];
  }
  if ([v11 adjustNodeOwnershipAndPermissionsForDataMigratorPlugIn:&v44 path:v9])
  {
    id v12 = MBGetDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)stat buf = 138412290;
      id v50 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Fixing ownership at %@", buf, 0xCu);
      _MBLog();
    }
  }
  id v43 = 0;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  long long v39 = v45;
  long long v40 = v46;
  long long v41 = v47;
  v36[2] = sub_10007F2C0;
  v36[3] = &unk_1000F23A8;
  uint64_t v42 = v48;
  long long v38 = v44;
  id v37 = v9;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  long long v30 = v45;
  long long v31 = v46;
  long long v32 = v47;
  v25[2] = sub_10007F730;
  v25[3] = &unk_1000F23D0;
  uint64_t v33 = v48;
  long long v29 = v44;
  BOOL v34 = a5;
  id v13 = v37;
  id v26 = v13;
  id v14 = v10;
  BOOL v35 = a4;
  uint64_t v27 = v14;
  id v28 = v14;
  unsigned __int8 v15 = [v13 mb_openatWithFlags:256 error:&v43 setupDir:v36 itemAccessor:v25];
  id v16 = v43;
  unsigned __int8 v17 = v16;
  id v18 = 0;
  if ((v15 & 1) == 0) {
    id v18 = v16;
  }

  return v18;
}

- (id)restoreEmptyRegularFileAtPath:(id)a3 settingAttributes:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (([self conformsToProtocol:&OBJC_PROTOCOL___MBRestorable] & 1) == 0)
  {
    id v14 = +[NSAssertionHandler currentHandler];
    unsigned __int8 v15 = (objc_class *)objc_opt_class();
    [v14 handleFailureInMethod:a2 object:self file:@"MBRestorable.m" lineNumber:650 description:@"%s is not MBRestorable", class_getName(v15)];
  }
  id v8 = self;
  if (!v7)
  {
    id v16 = +[NSAssertionHandler currentHandler];
    [v16 handleFailureInMethod:a2 object:v8 file:@"MBRestorable.m" lineNumber:651 description:@"Null path"];
  }
  uint64_t v22 = 0;
  long long v20 = 0u;
  long long v21 = 0u;
  memset(v19, 0, sizeof(v19));
  [v8 getNode:v19];
  if (!sub_10008F428((uint64_t)v19))
  {
    unsigned __int8 v17 = +[NSAssertionHandler currentHandler];
    [v17 handleFailureInMethod:a2 object:v8 file:@"MBRestorable.m" lineNumber:655 description:@"Not a regular file"];
  }
  if (*((void *)&v20 + 1))
  {
    id v18 = +[NSAssertionHandler currentHandler];
    [v18 handleFailureInMethod:a2 object:v8 file:@"MBRestorable.m" lineNumber:656 description:@"Not empty"];
  }
  id v9 = MBGetDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)stat buf = 138412290;
    id v24 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Creating empty file at %@", buf, 0xCu);
    _MBLog();
  }

  id v10 = v7;
  int v11 = open_dprotected_np((const char *)[v10 fileSystemRepresentation], 1793, 4, 0);
  if (v11 < 0)
  {
    +[MBError errorWithErrno:*__error() path:v10 format:@"open_dprotected_np error"];
  }
  else
  {
    close(v11);
    [v8 restoreRegularFileAtPath:v10 settingAttributes:v4];
  id v12 = };

  return v12;
}

- (id)restoreRegularFileAtPath:(id)a3 settingAttributes:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (([self conformsToProtocol:&OBJC_PROTOCOL___MBRestorable] & 1) == 0)
  {
    long long v38 = +[NSAssertionHandler currentHandler];
    long long v39 = (objc_class *)objc_opt_class();
    [v38 handleFailureInMethod:a2 object:self file:@"MBRestorable.m" lineNumber:677 description:@"%s is not MBRestorable", class_getName(v39)];
  }
  id v8 = self;
  if (!v7)
  {
    long long v40 = +[NSAssertionHandler currentHandler];
    [v40 handleFailureInMethod:a2 object:v8 file:@"MBRestorable.m" lineNumber:678 description:@"Null path"];
  }
  uint64_t v55 = 0;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  [v8 getNode:&v51];
  if (!sub_10008F428((uint64_t)&v51))
  {
    long long v41 = +[NSAssertionHandler currentHandler];
    [v41 handleFailureInMethod:a2 object:v8 file:@"MBRestorable.m" lineNumber:682 description:@"Not a regular file"];
  }
  id v9 = v7;
  id v10 = (const char *)[v9 fileSystemRepresentation];
  if (v4)
  {
    id v11 = [v8 domain];
    if (!v11)
    {
      uint64_t v42 = +[NSAssertionHandler currentHandler];
      [v42 handleFailureInMethod:a2 object:v8 file:@"MBRestorable.m" lineNumber:688 description:@"Null domain"];
    }
    if ([v11 adjustNodeOwnershipAndPermissionsForDataMigratorPlugIn:&v51 path:v9])
    {
      id v12 = MBGetDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)stat buf = 138412290;
        *(void *)&uint8_t buf[4] = v9;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Fixing ownership at %@", buf, 0xCu);
        id v43 = v9;
        _MBLog();
      }
    }
    id v13 = (void *)DWORD1(v51);
    uint64_t v14 = DWORD2(v51);
    unsigned __int8 v15 = MBGetDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)stat buf = 67109634;
      *(_DWORD *)&uint8_t buf[4] = v13;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v14;
      *(_WORD *)&buf[14] = 2112;
      *(void *)&buf[16] = v9;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Restoring regular file ownership: %d:%d at %@", buf, 0x18u);
      uint64_t v45 = v14;
      id v47 = v9;
      id v43 = v13;
      _MBLog();
    }

    if (lchown(v10, (uid_t)v13, v14))
    {
      id v16 = +[MBError posixErrorWithCode:102 path:v9 format:@"lchown error"];
      goto LABEL_56;
    }
  }
  unsigned __int8 v17 = [v8 extendedAttributes];
  if (!v17)
  {
    long long v20 = 0;
    id v11 = 0;
    goto LABEL_30;
  }
  id v18 = MBGetDefaultLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    id v19 = [v17 count];
    *(_DWORD *)stat buf = 134218242;
    *(void *)&uint8_t buf[4] = v19;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v9;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Restoring regular file extended attributes (%ld) at %@", buf, 0x16u);
    uint64_t v44 = (uint64_t)[v17 count];
    id v46 = v9;
    _MBLog();
  }

  if (sub_10008F3CC((uint64_t)&v51))
  {
    long long v20 = [v17 objectForKeyedSubscript:@"com.apple.decmpfs"];
    if (v20)
    {
      long long v21 = MBGetDefaultLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)stat buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Not re-applying the com.apple.decmpfs xattr yet.", buf, 2u);
        _MBLog();
      }

      id v22 = [v17 mutableCopy];
      [v22 removeObjectForKey:@"com.apple.decmpfs"];

      unsigned __int8 v17 = v22;
    }
  }
  else
  {
    long long v20 = 0;
  }
  id v50 = 0;
  unsigned __int8 v23 = +[MBExtendedAttributes setAttributes:forPathFSR:error:](MBExtendedAttributes, "setAttributes:forPathFSR:error:", v17, v10, &v50, v44, v46);
  id v11 = v50;
  if (v23)
  {
LABEL_30:
    if (v4)
    {
      uint64_t v24 = sub_10007CA5C((uint64_t)&v51);
      if (v24)
      {
        uint64_t v25 = v24;
        id v26 = MBGetDefaultLog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)stat buf = 67109378;
          *(_DWORD *)&uint8_t buf[4] = v25;
          *(_WORD *)&buf[8] = 2112;
          *(void *)&buf[10] = v9;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Restoring regular file BSD flags: 0x%x at %@", buf, 0x12u);
          uint64_t v44 = v25;
          id v46 = v9;
          _MBLog();
        }

        if (lchflags(v10, v25))
        {
          uint64_t v27 = *__error();
          id v28 = MBGetDefaultLog();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)stat buf = 67109634;
            *(_DWORD *)&uint8_t buf[4] = v25;
            *(_WORD *)&buf[8] = 2112;
            *(void *)&buf[10] = v9;
            *(_WORD *)&buf[18] = 1024;
            *(_DWORD *)&buf[20] = v27;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Failed to restore regular file BSD flags (0x%x) at %@: %{errno}d", buf, 0x18u);
            id v46 = v9;
            uint64_t v48 = v27;
            uint64_t v44 = v25;
            _MBLog();
          }

          CFStringRef v29 = @"lchflags error";
          goto LABEL_50;
        }
      }
      if (sub_10008F3CC((uint64_t)&v51))
      {
        id v49 = v11;
        BOOL v31 = sub_10007CAC8(v9, v20, &v49);
        id v32 = v49;

        if (!v31)
        {
          id v30 = v32;
LABEL_53:
          id v11 = v30;
          goto LABEL_54;
        }
        id v11 = v32;
      }
      unsigned int v33 = sub_10008F450((uint64_t)&v51);
      BOOL v34 = MBGetDefaultLog();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)stat buf = 67109378;
        *(_DWORD *)&uint8_t buf[4] = v33;
        *(_WORD *)&buf[8] = 2112;
        *(void *)&buf[10] = v9;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "Restoring regular file permissions: 0%3o at %@", buf, 0x12u);
        uint64_t v44 = v33;
        id v46 = v9;
        _MBLog();
      }

      if (lchmod(v10, v33))
      {
        CFStringRef v29 = @"lchmod error";
LABEL_50:
        +[MBError posixErrorWithCode:path:format:](MBError, "posixErrorWithCode:path:format:", 102, v9, v29, v44, v46, v48);
        id v30 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_54;
      }
      BOOL v35 = MBGetDefaultLog();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        uint64_t v36 = +[NSDate dateWithTimeIntervalSince1970:(double)*((uint64_t *)&v52 + 1)];
        *(_DWORD *)stat buf = 138412546;
        *(void *)&uint8_t buf[4] = v36;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v9;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "Restoring last modified time (%@) at %@", buf, 0x16u);

        uint64_t v44 = +[NSDate dateWithTimeIntervalSince1970:(double)*((uint64_t *)&v52 + 1)];
        id v46 = v9;
        _MBLog();
      }
      *(void *)stat buf = time(0);
      *(_DWORD *)&buf[8] = 0;
      *(void *)&buf[16] = *((void *)&v52 + 1);
      int v57 = 0;
      if (lutimes(v10, (const timeval *)buf))
      {
        CFStringRef v29 = @"lutimes error";
        goto LABEL_50;
      }
    }
    id v16 = -[NSObject _setProtectionClassWithPathFSR:](v8, "_setProtectionClassWithPathFSR:", v10, v44, v46);

    if (!v16)
    {
      id v11 = 0;
      goto LABEL_55;
    }
    id v30 = v16;
    goto LABEL_53;
  }
  id v30 = +[MBError errorWithCode:102 error:v11 format:@"setxattr error"];
LABEL_54:
  id v16 = v30;
LABEL_55:

LABEL_56:

  return v16;
}

@end