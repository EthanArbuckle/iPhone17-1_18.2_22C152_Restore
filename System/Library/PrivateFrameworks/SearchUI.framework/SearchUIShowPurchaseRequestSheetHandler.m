@interface SearchUIShowPurchaseRequestSheetHandler
- (unint64_t)destination;
- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5;
@end

@implementation SearchUIShowPurchaseRequestSheetHandler

- (void)performCommand:(id)a3 triggerEvent:(unint64_t)a4 environment:(id)a5
{
  v5 = (void *)MEMORY[0x1E4F4E1F8];
  id v6 = [a3 requestIdentifier];
  [v5 presentApprovalSheetWithRequestIdentifier:v6 completion:0];
}

- (unint64_t)destination
{
  return 8;
}

@end