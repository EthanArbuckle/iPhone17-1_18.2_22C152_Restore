@interface TSActivationPolicyMismatchFlow
- (TSActivationPolicyMismatchFlow)init;
- (TSActivationPolicyMismatchFlow)initWithPlanItemError:(id)a3;
- (id)firstViewController;
- (id)nextViewControllerFrom:(id)a3;
- (void)firstViewController:(id)a3;
@end

@implementation TSActivationPolicyMismatchFlow

- (TSActivationPolicyMismatchFlow)init
{
  v3.receiver = self;
  v3.super_class = (Class)TSActivationPolicyMismatchFlow;
  return [(TSSIMSetupFlow *)&v3 init];
}

- (TSActivationPolicyMismatchFlow)initWithPlanItemError:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TSActivationPolicyMismatchFlow;
  v6 = [(TSSIMSetupFlow *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_planItemError, a3);
  }

  return v7;
}

- (id)firstViewController
{
  objc_super v3 = [[TSMidOperationFailureViewController alloc] initWithPlanItemError:self->_planItemError updatePlanItem:0 withBackButton:0 forCarrier:0 withCarrierErrorCode:0];
  [(TSMidOperationFailureViewController *)v3 setDelegate:self];
  return v3;
}

- (void)firstViewController:(id)a3
{
  id v5 = a3;
  id v6 = [(TSActivationPolicyMismatchFlow *)self firstViewController];
  (*((void (**)(id, id))a3 + 2))(v5, v6);
}

- (id)nextViewControllerFrom:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
}

@end