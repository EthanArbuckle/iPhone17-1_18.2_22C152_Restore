@interface PXCMMAssetStatusBadgeTileUserData
- (int64_t)status;
- (void)setStatus:(int64_t)a3;
@end

@implementation PXCMMAssetStatusBadgeTileUserData

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (int64_t)status
{
  return self->_status;
}

@end