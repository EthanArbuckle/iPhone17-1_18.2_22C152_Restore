@interface MSDFileDownloadInfo
- (BOOL)entitlementCheckForFile:(id)a3;
- (BOOL)hashCheckForFile:(id)a3;
- (BOOL)skipHashCheck;
- (MSDDemoManifestCheck)checker;
- (MSDFileDownloadInfo)init;
- (NSString)file;
- (NSString)fileHash;
- (void)setChecker:(id)a3;
- (void)setFile:(id)a3;
- (void)setFileHash:(id)a3;
- (void)setSkipHashCheck:(BOOL)a3;
@end

@implementation MSDFileDownloadInfo

- (MSDFileDownloadInfo)init
{
  v7.receiver = self;
  v7.super_class = (Class)MSDFileDownloadInfo;
  v2 = [(MSDFileDownloadInfo *)&v7 init];
  v3 = v2;
  if (v2)
  {
    [(MSDFileDownloadInfo *)v2 setFile:0];
    [(MSDFileDownloadInfo *)v3 setFileHash:0];
    v4 = +[MSDDemoManifestCheck sharedInstance];
    [(MSDFileDownloadInfo *)v3 setChecker:v4];

    [(MSDFileDownloadInfo *)v3 setSkipHashCheck:0];
    v5 = v3;
  }

  return v3;
}

- (BOOL)entitlementCheckForFile:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MSDFileDownloadInfo *)self checker];
  if (!v5
    || (v6 = (void *)v5,
        [(MSDFileDownloadInfo *)self file],
        objc_super v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        !v7))
  {
    v12 = sub_100068600();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_1000CFE24((uint64_t)v4, v12);
    }
    BOOL v11 = 1;
    goto LABEL_11;
  }
  v8 = [(MSDFileDownloadInfo *)self checker];
  v9 = [(MSDFileDownloadInfo *)self file];
  unsigned __int8 v10 = [v8 checkFileForEntitlements:v4 forCorrespondingManifestEntry:v9];

  if ((v10 & 1) == 0)
  {
    v12 = sub_100068600();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000CFE9C((uint64_t)v4, v12);
    }
    BOOL v11 = 0;
LABEL_11:

    goto LABEL_12;
  }
  BOOL v11 = 1;
LABEL_12:

  return v11;
}

- (BOOL)hashCheckForFile:(id)a3
{
  id v4 = a3;
  if ([(MSDFileDownloadInfo *)self skipHashCheck])
  {
    v6 = sub_100068600();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543362;
      id v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Skipping file hash check for: %{public}@", (uint8_t *)&v12, 0xCu);
    }
    unsigned __int8 v8 = 1;
  }
  else
  {
    if (!v4)
    {
      unsigned __int8 v8 = 1;
      goto LABEL_9;
    }
    uint64_t v5 = +[MSDFileMetadata fileHashWithPath:v4];
    v6 = [v5 hexStringRepresentation];

    objc_super v7 = [(MSDFileDownloadInfo *)self fileHash];
    unsigned __int8 v8 = [v7 isEqualToString:v6];

    if ((v8 & 1) == 0)
    {
      v9 = sub_100068600();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        BOOL v11 = [(MSDFileDownloadInfo *)self fileHash];
        int v12 = 138543874;
        id v13 = v4;
        __int16 v14 = 2114;
        v15 = v6;
        __int16 v16 = 2114;
        v17 = v11;
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "The file (%{public}@) is corrupted - File hash:  %{public}@ - Expected:  %{public}@", (uint8_t *)&v12, 0x20u);
      }
    }
  }

LABEL_9:
  return v8;
}

- (NSString)fileHash
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFileHash:(id)a3
{
}

- (NSString)file
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFile:(id)a3
{
}

- (MSDDemoManifestCheck)checker
{
  return (MSDDemoManifestCheck *)objc_getProperty(self, a2, 32, 1);
}

- (void)setChecker:(id)a3
{
}

- (BOOL)skipHashCheck
{
  return self->_skipHashCheck;
}

- (void)setSkipHashCheck:(BOOL)a3
{
  self->_skipHashCheck = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checker, 0);
  objc_storeStrong((id *)&self->_file, 0);

  objc_storeStrong((id *)&self->_fileHash, 0);
}

@end