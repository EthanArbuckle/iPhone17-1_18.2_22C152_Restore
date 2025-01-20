@interface PUCurationActionAssetContainer
- (PHAsset)asset;
- (double)score;
- (void)setAsset:(id)a3;
- (void)setScore:(double)a3;
@end

@implementation PUCurationActionAssetContainer

- (void).cxx_destruct
{
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (double)score
{
  return self->_score;
}

- (void)setAsset:(id)a3
{
}

- (PHAsset)asset
{
  return self->_asset;
}

@end