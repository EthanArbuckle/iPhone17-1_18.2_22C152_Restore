@interface MLSyncAssetRequest
- (ATAsset)asset;
- (ATAsset)downloadAsset;
- (BOOL)finished;
- (NSError)error;
- (double)timestamp;
- (id)completion;
- (void)setAsset:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setDownloadAsset:(id)a3;
- (void)setError:(id)a3;
- (void)setFinished:(BOOL)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation MLSyncAssetRequest

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_downloadAsset, 0);

  objc_storeStrong((id *)&self->_asset, 0);
}

- (void)setCompletion:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (BOOL)finished
{
  return self->_finished;
}

- (void)setDownloadAsset:(id)a3
{
}

- (ATAsset)downloadAsset
{
  return self->_downloadAsset;
}

- (void)setAsset:(id)a3
{
}

- (ATAsset)asset
{
  return self->_asset;
}

@end