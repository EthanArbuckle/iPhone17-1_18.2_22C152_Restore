@interface PLDemoContentResults
- (NSArray)assetIDsToDelete;
- (NSArray)assetsToRevert;
- (void)setAssetIDsToDelete:(id)a3;
- (void)setAssetsToRevert:(id)a3;
@end

@implementation PLDemoContentResults

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsToRevert, 0);
  objc_storeStrong((id *)&self->_assetIDsToDelete, 0);
}

- (void)setAssetsToRevert:(id)a3
{
}

- (NSArray)assetsToRevert
{
  return self->_assetsToRevert;
}

- (void)setAssetIDsToDelete:(id)a3
{
}

- (NSArray)assetIDsToDelete
{
  return self->_assetIDsToDelete;
}

@end