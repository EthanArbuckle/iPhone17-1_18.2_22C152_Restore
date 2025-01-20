@interface BSUIUbiquityDownloadProgress
- (NSNumber)progress;
- (NSString)assetIdentifier;
- (void)setAssetIdentifier:(id)a3;
- (void)setProgress:(id)a3;
@end

@implementation BSUIUbiquityDownloadProgress

- (NSString)assetIdentifier
{
  return self->_assetIdentifier;
}

- (void)setAssetIdentifier:(id)a3
{
}

- (NSNumber)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progress, 0);

  objc_storeStrong((id *)&self->_assetIdentifier, 0);
}

@end