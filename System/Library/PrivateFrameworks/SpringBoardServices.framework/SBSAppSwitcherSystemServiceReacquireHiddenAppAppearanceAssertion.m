@interface SBSAppSwitcherSystemServiceReacquireHiddenAppAppearanceAssertion
@end

@implementation SBSAppSwitcherSystemServiceReacquireHiddenAppAppearanceAssertion

void ____SBSAppSwitcherSystemServiceReacquireHiddenAppAppearanceAssertion_block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (v5 && v6)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = ____SBSAppSwitcherSystemServiceReacquireHiddenAppAppearanceAssertion_block_invoke_2;
    v14[3] = &unk_1E566BF30;
    id v15 = a1[4];
    [v5 addHandler:v14 forDeathOfServerPort:v7];
    id WeakRetained = v15;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 6);
    if ([WeakRetained isValid])
    {
      v9 = [a1[5] client];
      id v10 = a1[4];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = ____SBSAppSwitcherSystemServiceReacquireHiddenAppAppearanceAssertion_block_invoke_3;
      v11[3] = &unk_1E566BF58;
      id v12 = v10;
      objc_copyWeak(&v13, a1 + 6);
      [v9 requestAppSwitcherAppearanceForHiddenApplicationWithBundleIdentifier:v12 reacquiringExistingAssertion:WeakRetained completion:v11];

      objc_destroyWeak(&v13);
    }
  }
}

uint64_t ____SBSAppSwitcherSystemServiceReacquireHiddenAppAppearanceAssertion_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return __SBSAppSwitcherSystemServiceReacquireHiddenAppAppearanceAssertion(a2, *(void *)(a1 + 32));
}

void ____SBSAppSwitcherSystemServiceReacquireHiddenAppAppearanceAssertion_block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  if (a2 && a3)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = ____SBSAppSwitcherSystemServiceReacquireHiddenAppAppearanceAssertion_block_invoke_4;
    v6[3] = &unk_1E566BF30;
    id v7 = *(id *)(a1 + 32);
    [a2 addHandler:v6 forDeathOfServerPort:a3];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained invalidate];
  }
}

uint64_t ____SBSAppSwitcherSystemServiceReacquireHiddenAppAppearanceAssertion_block_invoke_4(uint64_t a1, uint64_t a2)
{
  return __SBSAppSwitcherSystemServiceReacquireHiddenAppAppearanceAssertion(a2, *(void *)(a1 + 32));
}

@end