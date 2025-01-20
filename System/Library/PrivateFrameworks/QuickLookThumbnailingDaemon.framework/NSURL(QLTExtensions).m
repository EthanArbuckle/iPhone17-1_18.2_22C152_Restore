@interface NSURL(QLTExtensions)
- (BOOL)qlt_getDeviceIdentifier:()QLTExtensions;
- (BOOL)qlt_getVolumeUUID:()QLTExtensions;
- (uint64_t)qlt_getDocumentIdentifier:()QLTExtensions;
@end

@implementation NSURL(QLTExtensions)

- (BOOL)qlt_getVolumeUUID:()QLTExtensions
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  memset(&v14, 0, 512);
  id v4 = a1;
  if (statfs((const char *)[v4 fileSystemRepresentation], &v14))
  {
    v5 = _log_2();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[NSURL(QLTExtensions) qlt_getVolumeUUID:]((uint64_t)v4, v5);
    }

    return 0;
  }
  else
  {
    memset(v13, 0, sizeof(v13));
    long long v11 = xmmword_1DDCB95F8;
    uint64_t v12 = 0;
    int v7 = getattrlist(v14.f_mntonname, &v11, v13, 0x14uLL, 0);
    BOOL v6 = v7 == 0;
    if (v7)
    {
      int v8 = v7;
      v9 = _log_2();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[NSURL(QLTExtensions) qlt_getVolumeUUID:](v8, v9);
      }
    }
    else
    {
      *a3 = *(_OWORD *)&v13[4];
    }
  }
  return v6;
}

- (uint64_t)qlt_getDocumentIdentifier:()QLTExtensions
{
  id v12 = 0;
  uint64_t v5 = *MEMORY[0x1E4F1C550];
  id v11 = 0;
  uint64_t v6 = [a1 getResourceValue:&v12 forKey:v5 error:&v11];
  id v7 = v12;
  id v8 = v11;
  if (v6)
  {
    if (a3) {
      *a3 = [v7 unsignedIntegerValue];
    }
  }
  else
  {
    v9 = _log_2();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      [(NSURL(QLTExtensions) *)(uint64_t)v8 qlt_getDocumentIdentifier:v9];
    }
  }
  return v6;
}

- (BOOL)qlt_getDeviceIdentifier:()QLTExtensions
{
  memset(&v6, 0, sizeof(v6));
  int v4 = stat((const char *)[a1 fileSystemRepresentation], &v6);
  if (a3 && !v4) {
    *a3 = v6.st_dev;
  }
  return v4 == 0;
}

- (void)qlt_getDocumentIdentifier:()QLTExtensions .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1DDC5E000, log, OS_LOG_TYPE_ERROR, "Got error %@ trying to find docid for %@", (uint8_t *)&v3, 0x16u);
}

- (void)qlt_getVolumeUUID:()QLTExtensions .cold.1(int a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v4 = *__error();
  v5[0] = 67109376;
  v5[1] = a1;
  __int16 v6 = 1024;
  int v7 = v4;
  _os_log_error_impl(&dword_1DDC5E000, a2, OS_LOG_TYPE_ERROR, "getattrlist returned %d %{errno}d", (uint8_t *)v5, 0xEu);
}

- (void)qlt_getVolumeUUID:()QLTExtensions .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DDC5E000, a2, OS_LOG_TYPE_ERROR, "statfs on \"%@\" failed", (uint8_t *)&v2, 0xCu);
}

@end