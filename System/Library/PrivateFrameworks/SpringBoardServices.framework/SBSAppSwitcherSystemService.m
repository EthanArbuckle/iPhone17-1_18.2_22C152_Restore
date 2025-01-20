@interface SBSAppSwitcherSystemService
- (void)requestAppSwitcherAppearanceForHiddenApplicationWithBundleIdentifier:(id)a3 completion:(id)a4;
@end

@implementation SBSAppSwitcherSystemService

- (void)requestAppSwitcherAppearanceForHiddenApplicationWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(SBSAbstractSystemService *)self client];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __111__SBSAppSwitcherSystemService_requestAppSwitcherAppearanceForHiddenApplicationWithBundleIdentifier_completion___block_invoke;
  v11[3] = &unk_1E566BFA8;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 requestAppSwitcherAppearanceForHiddenApplicationWithBundleIdentifier:v10 reacquiringExistingAssertion:0 completion:v11];
}

void __111__SBSAppSwitcherSystemService_requestAppSwitcherAppearanceForHiddenApplicationWithBundleIdentifier_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (v5 && a3)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __111__SBSAppSwitcherSystemService_requestAppSwitcherAppearanceForHiddenApplicationWithBundleIdentifier_completion___block_invoke_2;
    v6[3] = &unk_1E566BF30;
    id v7 = *(id *)(a1 + 32);
    [v5 addHandler:v6 forDeathOfServerPort:a3];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __111__SBSAppSwitcherSystemService_requestAppSwitcherAppearanceForHiddenApplicationWithBundleIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
}

@end