@interface MBProtectionClassUtils
+ (BOOL)canOpenWhenLocked:(unsigned __int8)a3;
+ (BOOL)isContentUnavailableDueToCxExpiration:(id)a3 error:(id *)a4;
+ (BOOL)isProtected:(unsigned __int8)a3;
+ (BOOL)setWithFD:(int)a3 value:(unsigned __int8)a4 error:(id *)a5;
+ (BOOL)setWithPath:(id)a3 value:(unsigned __int8)a4 error:(id *)a5;
+ (BOOL)setWithPathFSR:(const char *)a3 value:(unsigned __int8)a4 error:(id *)a5;
+ (int)openRawEncryptedWithPath:(id)a3 error:(id *)a4;
+ (int)openRawEncryptedWithPathFSR:(const char *)a3 error:(id *)a4;
+ (int)sqliteOpenFlagForProtectionClass:(unsigned __int8)a3;
+ (unsigned)getWithFD:(int)a3 error:(id *)a4;
+ (unsigned)getWithPath:(id)a3 error:(id *)a4;
+ (unsigned)getWithPathFSR:(const char *)a3 error:(id *)a4;
@end

@implementation MBProtectionClassUtils

+ (BOOL)isProtected:(unsigned __int8)a3
{
  int v3 = a3;
  if (a3 < 8u && ((0x9Fu >> a3) & 1) != 0)
  {
    return (0x8Eu >> a3) & 1;
  }
  else
  {
    v4 = MBGetDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "=pc= +isProtected: Invalid protection class: %d", buf, 8u);
      _MBLog();
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

+ (BOOL)canOpenWhenLocked:(unsigned __int8)a3
{
  int v3 = a3;
  if (a3 < 8u && ((0x9Fu >> a3) & 1) != 0)
  {
    return (0xF9u >> a3) & 1;
  }
  else
  {
    v4 = MBGetDefaultLog();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_FAULT);
    if (v5)
    {
      *(_DWORD *)buf = 67109120;
      int v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "=pc= +canOpenWhenLocked: Invalid protection class: %d", buf, 8u);
      _MBLog();
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

+ (int)openRawEncryptedWithPath:(id)a3 error:(id *)a4
{
  id v5 = [a3 fileSystemRepresentation];
  return +[MBProtectionClassUtils openRawEncryptedWithPathFSR:v5 error:a4];
}

+ (unsigned)getWithPath:(id)a3 error:(id *)a4
{
  id v5 = [a3 fileSystemRepresentation];
  return +[MBProtectionClassUtils getWithPathFSR:v5 error:a4];
}

+ (BOOL)isContentUnavailableDueToCxExpiration:(id)a3 error:(id *)a4
{
  v7 = (const char *)[a3 fileSystemRepresentation];
  if ([a1 getWithPathFSR:v7 error:a4] != 7) {
    return 0;
  }
  int v8 = open(v7, 256);
  v9 = __error();
  if ((v8 & 0x80000000) == 0)
  {
    close(v8);
    return 0;
  }
  if (*v9 != 1) {
    return 0;
  }
  BOOL v10 = 1;
  if (a4) {
    *a4 = +[MBError errorWithErrno:1, 240, a3, @"File content unavailable with protection class %d", 7 code path format];
  }
  return v10;
}

+ (unsigned)getWithPathFSR:(const char *)a3 error:(id *)a4
{
  id v5 = objc_msgSend(a1, "openRawEncryptedWithPathFSR:error:", a3);
  if ((v5 & 0x80000000) != 0) {
    return -1;
  }
  int v6 = (int)v5;
  unsigned __int8 v7 = +[MBProtectionClassUtils getWithFD:v5 error:a4];
  close(v6);
  return v7;
}

+ (BOOL)setWithPath:(id)a3 value:(unsigned __int8)a4 error:(id *)a5
{
  uint64_t v6 = a4;
  id v7 = [a3 fileSystemRepresentation];
  return +[MBProtectionClassUtils setWithPathFSR:v7 value:v6 error:a5];
}

+ (BOOL)setWithPathFSR:(const char *)a3 value:(unsigned __int8)a4 error:(id *)a5
{
  uint64_t v6 = a4;
  uint64_t v8 = open(a3, 256);
  if ((v8 & 0x80000000) != 0)
  {
    if (a5)
    {
      if (a3) {
        CFStringRef v12 = (const __CFString *)+[NSString mb_stringWithFileSystemRepresentation:a3];
      }
      else {
        CFStringRef v12 = @"(null)";
      }
      if (*__error() == 1
        && !+[MBProtectionClassUtils canOpenWhenLocked:v6])
      {
        v13 = +[MBError errorWithCode:208 path:v12 format:@"open error setting protection class (device locked?)"];
      }
      else
      {
        v13 = (MBError *)+[MBError posixErrorWithPath:v12 format:@"open error setting protection class"];
      }
      *a5 = v13;
    }
    return 0;
  }
  else
  {
    int v9 = v8;
    BOOL v10 = +[MBProtectionClassUtils setWithFD:v8 value:v6 error:a5];
    close(v9);
    return v10;
  }
}

+ (int)openRawEncryptedWithPathFSR:(const char *)a3 error:(id *)a4
{
  int result = open_dprotected_np(a3, 256, 0, 1);
  if (result < 0)
  {
    uint64_t v7 = *__error();
    if (a4) {
      *a4 = +[MBError posixErrorWithPath:format:](MBError, "posixErrorWithPath:format:", +[NSString mb_stringWithFileSystemRepresentation:a3], @"open_dprotected_np error");
    }
    uint64_t v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      buf.st_dev = 136315394;
      *(void *)&buf.st_mode = a3;
      WORD2(buf.st_ino) = 1024;
      *(_DWORD *)((char *)&buf.st_ino + 6) = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "=pc= open_dprotected_np failed at %s: %{errno}d", (uint8_t *)&buf, 0x12u);
      CFStringRef v12 = a3;
      uint64_t v13 = v7;
      _MBLog();
    }
    if (v7 == 22)
    {
      if (!MBIsInternalInstall()) {
        return -1;
      }
    }
    else
    {
      if (v7 != 1) {
        return -1;
      }
      memset(&buf, 0, sizeof(buf));
      int v9 = lstat(a3, &buf);
      if (v9 | buf.st_flags & 0x20) {
        return -1;
      }
    }
    id v10 = +[NSString mb_stringWithFileSystemRepresentation:](NSString, "mb_stringWithFileSystemRepresentation:", a3, v12, v13);
    MBDiagnoseiCloudBackupFileAtPath(v10);
    v11 = MBGetDefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      buf.st_dev = 138412546;
      *(void *)&buf.st_mode = v10;
      WORD2(buf.st_ino) = 1024;
      *(_DWORD *)((char *)&buf.st_ino + 6) = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "=pc= open_dprotected_np failed at %@: %{errno}d", (uint8_t *)&buf, 0x12u);
      _MBLog();
    }
    return -1;
  }
  return result;
}

+ (unsigned)getWithFD:(int)a3 error:(id *)a4
{
  int v5 = fcntl(a3, 63);
  if (v5 < 0)
  {
    if (a4) {
      *a4 = +[MBError posixErrorWithFormat:@"fcntl error getting protection class"];
    }
    LOBYTE(v5) = -1;
  }
  return v5;
}

+ (BOOL)setWithFD:(int)a3 value:(unsigned __int8)a4 error:(id *)a5
{
  uint64_t v6 = a4;
  int v7 = fcntl(a3, 64, a4);
  int v8 = v7;
  if (a5 && v7)
  {
    if (*__error() == 1
      && !+[MBProtectionClassUtils canOpenWhenLocked:v6])
    {
      int v9 = +[MBError errorWithCode:208 format:@"fcntl permission error setting protection class (device locked?)"];
    }
    else
    {
      int v9 = (MBError *)+[MBError posixErrorWithFormat:@"fcntl error setting protection class"];
    }
    *a5 = v9;
  }
  return v8 == 0;
}

+ (int)sqliteOpenFlagForProtectionClass:(unsigned __int8)a3
{
  int v3 = a3;
  char v4 = a3 - 1;
  if (a3 - 1) < 7 && ((0x4Fu >> v4)) {
    return dword_1003B3908[v4];
  }
  int v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)stat buf = 67109120;
    int v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "=pc= No SQLite open flag known for protection class: %d", buf, 8u);
    _MBLog();
  }
  return 0x400000;
}

@end