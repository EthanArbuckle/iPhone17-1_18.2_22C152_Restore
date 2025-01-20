@interface FinishDownloadResponse
- (DownloadHandle)downloadHandle;
- (DownloadHandlerSession)downloadHandlerSession;
- (NSError)error;
- (NSString)mediaAssetInstallPath;
- (int64_t)assetBlockedReason;
- (int64_t)downloadIdentifier;
- (int64_t)mediaAssetIdentifier;
- (int64_t)result;
- (void)setAssetBlockedReason:(int64_t)a3;
- (void)setDownloadHandle:(id)a3;
- (void)setDownloadHandlerSession:(id)a3;
- (void)setDownloadIdentifier:(int64_t)a3;
- (void)setError:(id)a3;
- (void)setMediaAssetIdentifier:(int64_t)a3;
- (void)setMediaAssetInstallPath:(id)a3;
- (void)setResult:(int64_t)a3;
@end

@implementation FinishDownloadResponse

- (int64_t)assetBlockedReason
{
  return self->_assetBlockedReason;
}

- (void)setAssetBlockedReason:(int64_t)a3
{
  self->_assetBlockedReason = a3;
}

- (DownloadHandle)downloadHandle
{
  return self->_downloadHandle;
}

- (void)setDownloadHandle:(id)a3
{
}

- (DownloadHandlerSession)downloadHandlerSession
{
  return self->_downloadHandlerSession;
}

- (void)setDownloadHandlerSession:(id)a3
{
}

- (int64_t)downloadIdentifier
{
  return self->_downloadID;
}

- (void)setDownloadIdentifier:(int64_t)a3
{
  self->_downloadID = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (int64_t)mediaAssetIdentifier
{
  return self->_assetID;
}

- (void)setMediaAssetIdentifier:(int64_t)a3
{
  self->_assetID = a3;
}

- (NSString)mediaAssetInstallPath
{
  return self->_mediaAssetInstallPath;
}

- (void)setMediaAssetInstallPath:(id)a3
{
}

- (int64_t)result
{
  return self->_result;
}

- (void)setResult:(int64_t)a3
{
  self->_result = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaAssetInstallPath, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_downloadHandlerSession, 0);

  objc_storeStrong((id *)&self->_downloadHandle, 0);
}

@end