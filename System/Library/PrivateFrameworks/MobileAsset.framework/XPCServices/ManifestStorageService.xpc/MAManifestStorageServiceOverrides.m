@interface MAManifestStorageServiceOverrides
- (NSDictionary)commitErrorsBySelector;
- (NSNumber)assetTypeSupportedResult;
- (NSNumber)infoPlistVerificationResult;
- (NSNumber)manifestVerificationResult;
- (NSString)repositoryPath;
- (void)setAssetTypeSupportedResult:(id)a3;
- (void)setCommitErrorsBySelector:(id)a3;
- (void)setInfoPlistVerificationResult:(id)a3;
- (void)setManifestVerificationResult:(id)a3;
- (void)setRepositoryPath:(id)a3;
@end

@implementation MAManifestStorageServiceOverrides

- (NSString)repositoryPath
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRepositoryPath:(id)a3
{
}

- (NSNumber)manifestVerificationResult
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setManifestVerificationResult:(id)a3
{
}

- (NSNumber)infoPlistVerificationResult
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setInfoPlistVerificationResult:(id)a3
{
}

- (NSNumber)assetTypeSupportedResult
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAssetTypeSupportedResult:(id)a3
{
}

- (NSDictionary)commitErrorsBySelector
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCommitErrorsBySelector:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commitErrorsBySelector, 0);
  objc_storeStrong((id *)&self->_assetTypeSupportedResult, 0);
  objc_storeStrong((id *)&self->_infoPlistVerificationResult, 0);
  objc_storeStrong((id *)&self->_manifestVerificationResult, 0);
  objc_storeStrong((id *)&self->_repositoryPath, 0);
}

@end