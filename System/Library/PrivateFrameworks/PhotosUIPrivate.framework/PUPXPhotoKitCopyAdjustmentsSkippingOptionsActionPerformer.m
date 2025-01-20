@interface PUPXPhotoKitCopyAdjustmentsSkippingOptionsActionPerformer
- (BOOL)shouldSkipUserConfirmation;
@end

@implementation PUPXPhotoKitCopyAdjustmentsSkippingOptionsActionPerformer

- (BOOL)shouldSkipUserConfirmation
{
  return 1;
}

@end