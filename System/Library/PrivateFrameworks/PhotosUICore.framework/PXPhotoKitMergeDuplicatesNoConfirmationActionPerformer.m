@interface PXPhotoKitMergeDuplicatesNoConfirmationActionPerformer
- (BOOL)shouldSkipUserConfirmation;
@end

@implementation PXPhotoKitMergeDuplicatesNoConfirmationActionPerformer

- (BOOL)shouldSkipUserConfirmation
{
  return 1;
}

@end