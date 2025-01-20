@interface BRCVolume
- (BOOL)setupWithError:(id *)a3;
- (NSString)fsTypeName;
- (NSString)mountPath;
- (id)description;
- (int)_setUpForStatfs:(statfs *)a3;
- (int)deviceID;
@end

@implementation BRCVolume

- (NSString)mountPath
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"%s", self->_stfs.f_mntonname);
}

- (int)_setUpForStatfs:(statfs *)a3
{
  uint64_t v10 = 0;
  long long v9 = xmmword_23FD341D0;
  int v8 = 0;
  memset(v7, 0, sizeof(v7));
  if (getattrlist(a3->f_mntonname, &v9, v7, 0x24uLL, 0x21u) < 0) {
    return *__error();
  }
  if (strcmp(a3->f_fstypename, "hfs") && (~DWORD1(v7[0]) & 0x180000) != 0) {
    return 19;
  }
  uint32_t f_flags = a3->f_flags;
  if ((f_flags & 0x1001) == 0x1000)
  {
    memcpy(&self->_stfs, a3, sizeof(self->_stfs));
    return 0;
  }
  else if (f_flags)
  {
    return 30;
  }
  else
  {
    return 19;
  }
}

- (NSString)fsTypeName
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"%s", self->_stfs.f_fstypename);
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t deviceID = self->_deviceID;
  v6 = BRCPrettyPrintBitmap();
  v7 = [v3 stringWithFormat:@"<%@:%p>, deviceID:%d device:'%s' mounted-on:'%s' fstype:%s(%@)", v4, self, deviceID, self->_stfs.f_mntfromname, self->_stfs.f_mntonname, self->_stfs.f_fstypename, v6];

  return v7;
}

- (BOOL)setupWithError:(id *)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  self->_uint64_t deviceID = 0;
  memset(&__src, 0, 512);
  v5 = objc_msgSend(NSString, "br_currentHomeDir");
  v6 = NSURL;
  v7 = objc_msgSend(v5, "br_realpath");
  int v8 = [v6 fileURLWithPath:v7];
  long long v9 = [v8 URLByAppendingPathComponent:*MEMORY[0x263F32358] isDirectory:1];

  id v10 = v9;
  if (statfs((const char *)[v10 fileSystemRepresentation], &__src) < 0)
  {
    int v16 = *__error();
    v17 = brc_bread_crumbs();
    v18 = brc_default_log();
    if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
    {
      *(_DWORD *)__dst = 136315650;
      *(void *)&__dst[4] = [v10 fileSystemRepresentation];
      *(_WORD *)&__dst[12] = 1024;
      *(_DWORD *)&__dst[14] = v16;
      *(_WORD *)&__dst[18] = 2112;
      *(void *)&__dst[20] = v17;
      _os_log_error_impl(&dword_23FA42000, v18, (os_log_type_t)0x90u, "[ERROR] statfs for %s failed %{errno}d%@", __dst, 0x1Cu);
    }

    *__error() = v16;
    v12 = objc_msgSend(MEMORY[0x263F087E8], "br_errorFromErrno");
    if (!v12) {
      goto LABEL_13;
    }
    v13 = brc_bread_crumbs();
    v14 = brc_default_log();
    if (!os_log_type_enabled(v14, (os_log_type_t)0x90u)) {
      goto LABEL_12;
    }
    v15 = "(passed to caller)";
    *(_DWORD *)__dst = 136315906;
    *(void *)&__dst[4] = "-[BRCVolume setupWithError:]";
    *(_WORD *)&__dst[12] = 2080;
    if (!a3) {
      v15 = "(ignored by caller)";
    }
    goto LABEL_30;
  }
  memcpy(__dst, &__src, sizeof(__dst));
  uint64_t v11 = [(BRCVolume *)self _setUpForStatfs:__dst];
  if (v11)
  {
    v12 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithPOSIXCode:", v11);
    if (v12)
    {
      v13 = brc_bread_crumbs();
      v14 = brc_default_log();
      if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
      {
        v15 = "(passed to caller)";
        *(_DWORD *)__dst = 136315906;
        *(void *)&__dst[4] = "-[BRCVolume setupWithError:]";
        *(_WORD *)&__dst[12] = 2080;
        if (!a3) {
          v15 = "(ignored by caller)";
        }
LABEL_30:
        *(void *)&__dst[14] = v15;
        *(_WORD *)&__dst[22] = 2112;
        *(void *)&__dst[24] = v12;
        *(_WORD *)&__dst[32] = 2112;
        *(void *)&__dst[34] = v13;
        v28 = __dst;
LABEL_31:
        _os_log_error_impl(&dword_23FA42000, v14, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", v28, 0x2Au);
      }
LABEL_12:
    }
  }
  else
  {
    memset(__dst, 0, 144);
    id v23 = v10;
    if ((stat((const char *)[v23 fileSystemRepresentation], (stat *)__dst) & 0x80000000) == 0)
    {
      self->_uint64_t deviceID = *(_DWORD *)__dst;
      goto LABEL_16;
    }
    int v24 = *__error();
    v25 = brc_bread_crumbs();
    v26 = brc_default_log();
    if (os_log_type_enabled(v26, (os_log_type_t)0x90u))
    {
      int v29 = 136315650;
      v30 = (const char *)[v23 fileSystemRepresentation];
      __int16 v31 = 1024;
      *(_DWORD *)v32 = v24;
      *(_WORD *)&v32[4] = 2112;
      *(void *)&v32[6] = v25;
      _os_log_error_impl(&dword_23FA42000, v26, (os_log_type_t)0x90u, "[ERROR] stat for %s failed %{errno}d%@", (uint8_t *)&v29, 0x1Cu);
    }

    *__error() = v24;
    v12 = objc_msgSend(MEMORY[0x263F087E8], "br_errorFromErrno");
    if (v12)
    {
      v13 = brc_bread_crumbs();
      v14 = brc_default_log();
      if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
      {
        v27 = "(passed to caller)";
        int v29 = 136315906;
        v30 = "-[BRCVolume setupWithError:]";
        __int16 v31 = 2080;
        if (!a3) {
          v27 = "(ignored by caller)";
        }
        *(void *)v32 = v27;
        *(_WORD *)&v32[8] = 2112;
        *(void *)&v32[10] = v12;
        __int16 v33 = 2112;
        v34 = v13;
        v28 = (uint8_t *)&v29;
        goto LABEL_31;
      }
      goto LABEL_12;
    }
  }
LABEL_13:
  if (a3) {
    *a3 = v12;
  }

LABEL_16:
  v19 = brc_bread_crumbs();
  v20 = brc_default_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__dst = 138412546;
    *(void *)&__dst[4] = self;
    *(_WORD *)&__dst[12] = 2112;
    *(void *)&__dst[14] = v19;
    _os_log_impl(&dword_23FA42000, v20, OS_LOG_TYPE_DEFAULT, "[NOTICE] on device: %@%@", __dst, 0x16u);
  }

  BOOL v21 = self->_deviceID != 0;
  return v21;
}

- (int)deviceID
{
  return self->_deviceID;
}

@end