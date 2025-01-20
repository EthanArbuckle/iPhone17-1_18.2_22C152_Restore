@interface DMDSUStatus
- (BOOL)isDownloadComplete;
- (BOOL)isDownloading;
- (BOOL)isInstalling;
- (NSString)productBuildVersion;
- (SUAutoInstallOperation)autoInstallOperation;
- (SUDownload)download;
- (SUInstallPolicy)installPolicy;
- (double)downloadPercentComplete;
- (void)setAutoInstallOperation:(id)a3;
- (void)setDownload:(id)a3;
- (void)setInstallPolicy:(id)a3;
@end

@implementation DMDSUStatus

- (BOOL)isInstalling
{
  v2 = [(DMDSUStatus *)self autoInstallOperation];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isDownloading
{
  v2 = [(DMDSUStatus *)self download];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isDownloadComplete
{
  BOOL v3 = [(DMDSUStatus *)self download];
  if (v3)
  {
    v4 = [(DMDSUStatus *)self download];
    v5 = [v4 progress];
    unsigned __int8 v6 = [v5 isDone];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (double)downloadPercentComplete
{
  BOOL v3 = [(DMDSUStatus *)self download];
  if (v3)
  {
    v4 = [(DMDSUStatus *)self download];
    v5 = [v4 progress];
    [v5 normalizedPercentComplete];
    double v7 = v6;
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

- (NSString)productBuildVersion
{
  v2 = [(DMDSUStatus *)self download];
  BOOL v3 = [v2 descriptor];
  v4 = [v3 productBuildVersion];

  return (NSString *)v4;
}

- (SUDownload)download
{
  return self->_download;
}

- (void)setDownload:(id)a3
{
}

- (SUInstallPolicy)installPolicy
{
  return self->_installPolicy;
}

- (void)setInstallPolicy:(id)a3
{
}

- (SUAutoInstallOperation)autoInstallOperation
{
  return self->_autoInstallOperation;
}

- (void)setAutoInstallOperation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoInstallOperation, 0);
  objc_storeStrong((id *)&self->_installPolicy, 0);

  objc_storeStrong((id *)&self->_download, 0);
}

@end