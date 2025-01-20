@interface WBSTabDialogCancellationExemption
+ (id)committedNavigationExemption;
+ (id)provisionalNavigationExemption;
+ (id)sameOriginNavigationExemption:(id)a3;
- (BOOL)isExemptFromCancellationInContext:(id)a3;
- (WBSTabDialogCancellationExemption)init;
- (WBSTabDialogCancellationExemption)initWithCancellationHandler:(id)a3;
@end

@implementation WBSTabDialogCancellationExemption

- (WBSTabDialogCancellationExemption)init
{
  return 0;
}

- (WBSTabDialogCancellationExemption)initWithCancellationHandler:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSTabDialogCancellationExemption;
  v5 = [(WBSTabDialogCancellationExemption *)&v10 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x1AD0C4F80](v4);
    id cancellationExemptionHandler = v5->_cancellationExemptionHandler;
    v5->_id cancellationExemptionHandler = (id)v6;

    v8 = v5;
  }

  return v5;
}

- (BOOL)isExemptFromCancellationInContext:(id)a3
{
  return (*((uint64_t (**)(void))self->_cancellationExemptionHandler + 2))();
}

+ (id)provisionalNavigationExemption
{
  v2 = (void *)[objc_alloc((Class)a1) initWithCancellationHandler:&__block_literal_global_108];
  return v2;
}

uint64_t __67__WBSTabDialogCancellationExemption_provisionalNavigationExemption__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 reason];
  uint64_t v3 = [v2 isEqualToString:@"WBSTabDialogCancellationReasonProvisionalNavigation"];

  return v3;
}

+ (id)committedNavigationExemption
{
  v2 = (void *)[objc_alloc((Class)a1) initWithCancellationHandler:&__block_literal_global_2_0];
  return v2;
}

uint64_t __65__WBSTabDialogCancellationExemption_committedNavigationExemption__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 reason];
  uint64_t v3 = [v2 isEqualToString:@"WBSTabDialogCancellationReasonCommittedNavigation"];

  return v3;
}

+ (id)sameOriginNavigationExemption:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__WBSTabDialogCancellationExemption_sameOriginNavigationExemption___block_invoke;
  v9[3] = &unk_1E5CA0308;
  id v10 = v4;
  id v6 = v4;
  v7 = (void *)[v5 initWithCancellationHandler:v9];

  return v7;
}

uint64_t __67__WBSTabDialogCancellationExemption_sameOriginNavigationExemption___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 reason];
  int v5 = [v4 isEqualToString:@"WBSTabDialogCancellationReasonCommittedNavigation"];

  if (v5)
  {
    id v6 = [v3 userInfo];
    v7 = objc_msgSend(v6, "safari_URLForKey:", @"WBSTabDialogCancellationReasonCommittedNavigationCurrentURLKey");

    uint64_t v8 = objc_msgSend(v7, "safari_hasSameOriginAsURL:", *(void *)(a1 + 32));
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
}

@end