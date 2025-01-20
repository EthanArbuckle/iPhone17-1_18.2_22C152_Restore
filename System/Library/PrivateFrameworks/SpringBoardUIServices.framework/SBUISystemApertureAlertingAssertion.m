@interface SBUISystemApertureAlertingAssertion
@end

@implementation SBUISystemApertureAlertingAssertion

void __62___SBUISystemApertureAlertingAssertion_initWithElementSource___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = [WeakRetained alertingAction];
  int v6 = [v5 isValid];

  if (v6)
  {
    v7 = [WeakRetained alertingAction];
    [v7 invalidateWithReason:v8];
  }
}

void __58___SBUISystemApertureAlertingAssertion_setAlertingAction___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained isValid]) {
    [WeakRetained invalidateWithReason:@"alerting action annulled"];
  }
}

void __61___SBUISystemApertureAlertingAssertion_addInvalidationBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a3;
  uint64_t v8 = objc_opt_class();
  id v11 = v5;
  if (v8)
  {
    if (objc_opt_isKindOfClass()) {
      v9 = v11;
    }
    else {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }
  id v10 = v9;

  (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v10, v7);
}

@end