@interface MBFileOperation
+ (BOOL)clone:(int)a3 sourceRpath:(id)a4 destinationBasePath:(id)a5 destinationBaseFD:(int)a6 destinationRpath:(id)a7 error:(id *)a8;
+ (BOOL)closeFD:(int)a3 path:(id)a4 error:(id *)a5;
+ (BOOL)createDirectories:(int)a3 destinationBasePath:(id)a4 destinationRpath:(id)a5 permissions:(unsigned __int16)a6 error:(id *)a7;
+ (BOOL)crossVolumeCopyFrom:(const char *)a3 toDestination:(const char *)a4 shouldDeleteSource:(BOOL)a5 error:(id *)a6;
+ (BOOL)crossVolumeCopyFromSource:(id)a3 toDestination:(id)a4 shouldDeleteSource:(BOOL)a5 error:(id *)a6;
+ (BOOL)crossVolumeMoveFrom:(id)a3 intoDir:(id)a4 toFileNamed:(id)a5 error:(id *)a6;
+ (BOOL)exists:(BOOL *)a3 atBasePath:(id)a4 baseFD:(int)a5 rpath:(id)a6 error:(id *)a7;
+ (BOOL)hardlink:(int)a3 sourceRpath:(id)a4 destinationBasePath:(id)a5 destinationBaseFD:(int)a6 destinationRpath:(id)a7 error:(id *)a8;
+ (BOOL)openFD:(int *)a3 baseFD:(int)a4 rpath:(id)a5 flags:(int)a6 error:(id *)a7;
+ (BOOL)openFD:(int *)a3 path:(id)a4 flags:(int)a5 error:(id *)a6;
+ (BOOL)rename:(int)a3 sourceRpath:(id)a4 destinationBasePath:(id)a5 destinationBaseFD:(int)a6 destinationRpath:(id)a7 flags:(int)a8 error:(id *)a9;
+ (BOOL)unlink:(int)a3 targetBasePath:(id)a4 targetRpath:(id)a5 error:(id *)a6;
+ (id)createPathInDirectory:(id)a3 fileName:(id)a4;
+ (id)symbolicLinkTargetWithPath:(id)a3 error:(id *)a4;
+ (id)symbolicLinkTargetWithPathFSR:(const char *)a3 error:(id *)a4;
@end

@implementation MBFileOperation

+ (BOOL)openFD:(int *)a3 baseFD:(int)a4 rpath:(id)a5 flags:(int)a6 error:(id *)a7
{
  id v11 = a5;
  if (!a3) {
    sub_10009941C();
  }
  if (a4 == -1) {
    sub_100099448();
  }
  if (!v11) {
    sub_100099474();
  }
  if (!a6) {
    sub_1000994A0();
  }
  id v12 = v11;
  int v13 = openat(a4, (const char *)[v12 fileSystemRepresentation], a6);
  int v14 = v13;
  if (v13 < 0)
  {
    v15 = __error();
    if (a7)
    {
      +[MBError errorWithErrno:path:format:](MBError, "errorWithErrno:path:format:", *v15);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    *a3 = v13;
  }

  return v14 >= 0;
}

+ (BOOL)openFD:(int *)a3 path:(id)a4 flags:(int)a5 error:(id *)a6
{
  id v9 = a4;
  if (!a3) {
    sub_1000994CC();
  }
  if (!v9) {
    sub_1000994F8();
  }
  if (!a5) {
    sub_100099524();
  }
  id v10 = v9;
  int v11 = open((const char *)[v10 fileSystemRepresentation], a5);
  int v12 = v11;
  if (v11 < 0)
  {
    int v13 = __error();
    if (a6)
    {
      +[MBError errorWithErrno:path:format:](MBError, "errorWithErrno:path:format:", *v13);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    *a3 = v11;
  }

  return v12 >= 0;
}

+ (BOOL)closeFD:(int)a3 path:(id)a4 error:(id *)a5
{
  id v7 = a4;
  if (a3 == -1) {
    sub_100099550();
  }
  v8 = v7;
  int v9 = close(a3);
  if (v9)
  {
    id v10 = __error();
    if (a5)
    {
      +[MBError errorWithErrno:path:format:](MBError, "errorWithErrno:path:format:", *v10);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v9 == 0;
}

+ (BOOL)exists:(BOOL *)a3 atBasePath:(id)a4 baseFD:(int)a5 rpath:(id)a6 error:(id *)a7
{
  id v11 = a4;
  id v12 = a6;
  if (!a3) {
    sub_10009957C();
  }
  if (!v11) {
    sub_1000995A8();
  }
  if (a5 == -1) {
    sub_1000995D4();
  }
  if (!v12) {
    sub_100099600();
  }
  id v13 = v12;
  if (faccessat(a5, (const char *)[v13 fileSystemRepresentation], 0, 32))
  {
    uint64_t v14 = *__error();
    if (v14 == 2)
    {
      *a3 = 0;
      LOBYTE(a7) = 1;
    }
    else if (a7)
    {
      v15 = [v11 stringByAppendingPathComponent:v13];
      *a7 = +[MBError errorWithErrno:v14, v15, @"faccessat() failure %d", v14 path format];

      LOBYTE(a7) = 0;
    }
  }
  else
  {
    LOBYTE(a7) = 1;
    *a3 = 1;
  }

  return (char)a7;
}

+ (BOOL)rename:(int)a3 sourceRpath:(id)a4 destinationBasePath:(id)a5 destinationBaseFD:(int)a6 destinationRpath:(id)a7 flags:(int)a8 error:(id *)a9
{
  uint64_t v9 = *(void *)&a8;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  if (a3 == -1) {
    sub_10009962C();
  }
  if (!v14) {
    sub_100099658();
  }
  if (!v15) {
    sub_100099684();
  }
  if (a6 == -1) {
    sub_1000996B0();
  }
  v17 = v16;
  if (!v16) {
    sub_1000996DC();
  }
  id v18 = v14;
  v19 = (const char *)[v18 fileSystemRepresentation];
  id v20 = v17;
  int v21 = renameatx_np(a3, v19, a6, (const char *)[v20 fileSystemRepresentation], v9);
  int v22 = v21;
  if (a9 && v21)
  {
    uint64_t v23 = *__error();
    v24 = [v15 stringByAppendingPathComponent:v20];
    *a9 = +[MBError errorWithErrno:v23, v24, @"renameatx_np() flags:0x%x failure %d", v9, v23 path format];
  }
  return v22 == 0;
}

+ (BOOL)hardlink:(int)a3 sourceRpath:(id)a4 destinationBasePath:(id)a5 destinationBaseFD:(int)a6 destinationRpath:(id)a7 error:(id *)a8
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if (a3 == -1) {
    sub_100099708();
  }
  if (!v13) {
    sub_100099734();
  }
  if (!v14) {
    sub_100099760();
  }
  if (a6 == -1) {
    sub_10009978C();
  }
  id v16 = v15;
  if (!v15) {
    sub_1000997B8();
  }
  id v17 = v13;
  id v18 = (const char *)[v17 fileSystemRepresentation];
  id v19 = v16;
  int v20 = linkat(a3, v18, a6, (const char *)[v19 fileSystemRepresentation], 0);
  int v21 = v20;
  if (a8 && v20)
  {
    uint64_t v22 = *__error();
    uint64_t v23 = [v14 stringByAppendingPathComponent:v19];
    *a8 = +[MBError errorWithErrno:v22, v23, @"linkat() failure %d", v22 path format];
  }
  return v21 == 0;
}

+ (BOOL)clone:(int)a3 sourceRpath:(id)a4 destinationBasePath:(id)a5 destinationBaseFD:(int)a6 destinationRpath:(id)a7 error:(id *)a8
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if (a3 == -1) {
    sub_1000997E4();
  }
  if (!v13) {
    sub_100099810();
  }
  if (!v14) {
    sub_10009983C();
  }
  if (a6 == -1) {
    sub_100099868();
  }
  id v16 = v15;
  if (!v15) {
    sub_100099894();
  }
  id v17 = v13;
  id v18 = (const char *)[v17 fileSystemRepresentation];
  id v19 = v16;
  int v20 = clonefileat(a3, v18, a6, (const char *)[v19 fileSystemRepresentation], 0);
  int v21 = v20;
  if (a8 && v20)
  {
    uint64_t v22 = *__error();
    uint64_t v23 = [v14 stringByAppendingPathComponent:v19];
    *a8 = +[MBError errorWithErrno:v22, v23, @"clonefileat() failure %d", v22 path format];
  }
  return v21 == 0;
}

+ (BOOL)createDirectories:(int)a3 destinationBasePath:(id)a4 destinationRpath:(id)a5 permissions:(unsigned __int16)a6 error:(id *)a7
{
  int v8 = a6;
  id v11 = a4;
  id v12 = a5;
  if (a3 == 1) {
    sub_1000998C0();
  }
  if (!v11) {
    sub_1000998EC();
  }
  if (!v12) {
    sub_100099918();
  }
  if (!v8) {
    sub_100099944();
  }
  id v13 = v12;
  uint64_t v14 = mkpathat_np(a3, (const char *)[v13 fileSystemRepresentation], v8);
  uint64_t v15 = v14;
  if (v14 && v14 != 17 && a7)
  {
    id v16 = [v11 stringByAppendingPathComponent:v13];
    *a7 = +[MBError errorWithErrno:v15, v16, @"mkpathat_np() failure %d", v15 path format];
  }
  if (v15) {
    BOOL v17 = v15 == 17;
  }
  else {
    BOOL v17 = 1;
  }
  BOOL v18 = v17;

  return v18;
}

+ (BOOL)unlink:(int)a3 targetBasePath:(id)a4 targetRpath:(id)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a5;
  if (a3 == 1) {
    sub_100099970();
  }
  if (!v10) {
    sub_10009999C();
  }
  id v11 = v10;
  int v12 = unlinkat(a3, (const char *)[v11 fileSystemRepresentation], 0);
  int v13 = v12;
  if (a6 && v12)
  {
    uint64_t v14 = *__error();
    uint64_t v15 = [v9 stringByAppendingPathComponent:v11];
    *a6 = +[MBError errorWithErrno:v14, v15, @"unlinkat() failure %d", v14 path format];
  }
  return v13 == 0;
}

+ (id)createPathInDirectory:(id)a3 fileName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v5) {
    sub_1000999C8();
  }
  id v7 = v6;
  if (qword_100112EF8 != -1) {
    dispatch_once(&qword_100112EF8, &stru_1000F1700);
  }
  id v8 = v5;
  id v9 = [v8 fileSystemRepresentation];
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = sub_100035628;
  v27 = sub_100035638;
  id v28 = 0;
  id v10 = qword_100112EF0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100035640;
  block[3] = &unk_1000F1728;
  id v22 = v9;
  id v11 = v8;
  id v19 = v11;
  id v12 = v7;
  id v20 = v12;
  int v21 = &v23;
  dispatch_sync(v10, block);
  int v13 = (void *)v24[5];
  if (!v13)
  {
    id v16 = +[NSAssertionHandler currentHandler];
    BOOL v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[MBFileOperation createPathInDirectory:fileName:]");
    [v16 handleFailureInFunction:v17, @"MBFileOperation.m", 219, @"Unable to create temporary path in: %@", v11 file lineNumber description];

    int v13 = (void *)v24[5];
  }
  id v14 = v13;

  _Block_object_dispose(&v23, 8);

  return v14;
}

+ (BOOL)crossVolumeCopyFromSource:(id)a3 toDestination:(id)a4 shouldDeleteSource:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  if (!v10) {
    sub_1000999F4();
  }
  id v12 = v11;
  if (!v11) {
    sub_100099A20();
  }
  if (!a6) {
    sub_100099A4C();
  }
  id v13 = v10;
  id v14 = [v13 fileSystemRepresentation];
  id v15 = v12;
  unsigned __int8 v16 = [a1 crossVolumeCopyFrom:v14 toDestination:[v15 fileSystemRepresentation] shouldDeleteSource:v7 error:a6];

  return v16;
}

+ (BOOL)crossVolumeCopyFrom:(const char *)a3 toDestination:(const char *)a4 shouldDeleteSource:(BOOL)a5 error:(id *)a6
{
  if (!a3) {
    sub_100099A78();
  }
  if (!a4) {
    sub_100099AA4();
  }
  if (!a6) {
    sub_100099AD0();
  }
  if (a5) {
    copyfile_flags_t v9 = 1179662;
  }
  else {
    copyfile_flags_t v9 = 131086;
  }
  id v10 = copyfile_state_alloc();
  int v11 = copyfile(a3, a4, v10, v9);
  int v12 = *__error();
  copyfile_state_free(v10);
  if (v11) {
    BOOL v13 = v12 == 17;
  }
  else {
    BOOL v13 = 1;
  }
  BOOL v14 = v13;
  if (!v13)
  {
    id v15 = +[NSString mb_stringWithFileSystemRepresentation:a3];
    *a6 = +[MBError posixErrorWithPath:v15 format:@"copyfile failed"];

    unsigned __int8 v16 = MBGetDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      id v19 = a3;
      __int16 v20 = 2080;
      int v21 = a4;
      __int16 v22 = 1024;
      int v23 = v11;
      __int16 v24 = 1024;
      int v25 = v12;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "copyfile(%s, %s) failed (%d): %{errno}d", buf, 0x22u);
      _MBLog();
    }
  }
  return v14;
}

+ (BOOL)crossVolumeMoveFrom:(id)a3 intoDir:(id)a4 toFileNamed:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v10) {
    sub_100099AFC();
  }
  if (!v11) {
    sub_100099B28();
  }
  BOOL v13 = v12;
  if (!v12) {
    sub_100099B54();
  }
  if (!a6) {
    sub_100099B80();
  }
  BOOL v14 = [v11 stringByAppendingPathComponent:@"cross_volume_copy"];
  id v15 = [a1 createPathInDirectory:v14 fileName:0];

  id v16 = v10;
  id v17 = [v16 fileSystemRepresentation];
  id v18 = v15;
  id v19 = (const char *)[v18 fileSystemRepresentation];
  if ([a1 crossVolumeCopyFrom:v17 toDestination:v19 shouldDeleteSource:1 error:a6])
  {
    id v20 = [a1 createPathInDirectory:v11 fileName:v13];
    int v21 = (const char *)[v20 fileSystemRepresentation];
    int v22 = renamex_np(v19, v21, 4u);
    BOOL v23 = v22 == 0;
    if (v22)
    {
      unsigned int v28 = *__error();
      +[NSString stringWithUTF8String:v17];
      __int16 v24 = v29 = v13;
      *a6 = +[MBError errorWithErrno:v28, v24, @"renamex_np() from %s to %s failed", v17, v21 path format];

      BOOL v13 = v29;
    }
  }
  else
  {
    int v25 = MBGetDefaultLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      id v26 = *a6;
      *(_DWORD *)buf = 136315650;
      id v31 = v17;
      __int16 v32 = 2080;
      v33 = v19;
      __int16 v34 = 2112;
      id v35 = v26;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "could not copy across volumes from %s to %s: %@", buf, 0x20u);
      _MBLog();
    }

    BOOL v23 = 0;
  }

  return v23;
}

+ (id)symbolicLinkTargetWithPath:(id)a3 error:(id *)a4
{
  id v6 = [a3 fileSystemRepresentation];

  return [a1 symbolicLinkTargetWithPathFSR:v6 error:a4];
}

+ (id)symbolicLinkTargetWithPathFSR:(const char *)a3 error:(id *)a4
{
  ssize_t v7 = readlink(a3, v17, 0x400uLL);
  if (v7 < 0)
  {
    if (*__error() == 2 || *__error() == 22)
    {
      if (a4)
      {
        id v12 = [a1 description];
        uint64_t v13 = 4;
LABEL_13:
        *a4 = +[MBError posixErrorWithCode:v13 path:v12 format:@"readlink error"];
      }
    }
    else if (a4)
    {
      id v12 = [a1 description];
      uint64_t v13 = 101;
      goto LABEL_13;
    }
    id v10 = 0;
    goto LABEL_15;
  }
  ssize_t v8 = v7;
  copyfile_flags_t v9 = +[NSFileManager defaultManager];
  id v10 = [v9 stringWithFileSystemRepresentation:v17 length:v8];

  if (!v10)
  {
    id v11 = MBGetDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v16 = a3;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to convert filesystem representation %s", buf, 0xCu);
      _MBLog();
    }

    if (a4)
    {
      *a4 = +[MBError errorWithCode:7 format:@"Failed to convert filesystem representation"];
    }
  }
LABEL_15:

  return v10;
}

@end