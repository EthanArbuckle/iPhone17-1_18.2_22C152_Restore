@interface PUPhotoEditIrisModelChange
- (BOOL)videoEnabledDidChange;
- (void)_setVideoEnabledDidChange:(BOOL)a3;
@end

@implementation PUPhotoEditIrisModelChange

- (void)_setVideoEnabledDidChange:(BOOL)a3
{
  *(&self->super._hasChanges + 1) = a3;
}

- (BOOL)videoEnabledDidChange
{
  return *(&self->super._hasChanges + 1);
}

@end