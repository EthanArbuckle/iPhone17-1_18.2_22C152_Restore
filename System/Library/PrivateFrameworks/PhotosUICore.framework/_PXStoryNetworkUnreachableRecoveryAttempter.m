@interface _PXStoryNetworkUnreachableRecoveryAttempter
- (BOOL)attemptRecoveryFromError:(id)a3 optionIndex:(unint64_t)a4;
- (NSArray)recoveryOptions;
@end

@implementation _PXStoryNetworkUnreachableRecoveryAttempter

- (BOOL)attemptRecoveryFromError:(id)a3 optionIndex:(unint64_t)a4
{
  return 1;
}

- (NSArray)recoveryOptions
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = PXLocalizedStringFromTable(@"InteractiveMemoryNetworkUnreachable_Settings_AlertAction", @"PhotosUICore");
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return (NSArray *)v3;
}

@end