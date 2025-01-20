@interface PXMessagesDebugTapbackUserData
- (BOOL)shouldAnimate;
- (PXDisplayAsset)asset;
- (void)setAsset:(id)a3;
- (void)setShouldAnimate:(BOOL)a3;
@end

@implementation PXMessagesDebugTapbackUserData

- (void).cxx_destruct
{
}

- (void)setShouldAnimate:(BOOL)a3
{
  self->_shouldAnimate = a3;
}

- (BOOL)shouldAnimate
{
  return self->_shouldAnimate;
}

- (void)setAsset:(id)a3
{
}

- (PXDisplayAsset)asset
{
  return self->_asset;
}

@end