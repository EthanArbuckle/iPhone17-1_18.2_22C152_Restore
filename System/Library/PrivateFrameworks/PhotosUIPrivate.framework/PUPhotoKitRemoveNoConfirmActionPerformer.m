@interface PUPhotoKitRemoveNoConfirmActionPerformer
- (BOOL)shouldShowConfirmation;
@end

@implementation PUPhotoKitRemoveNoConfirmActionPerformer

- (BOOL)shouldShowConfirmation
{
  return 0;
}

@end