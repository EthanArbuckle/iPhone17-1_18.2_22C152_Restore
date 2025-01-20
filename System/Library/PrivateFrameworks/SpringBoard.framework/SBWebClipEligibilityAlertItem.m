@interface SBWebClipEligibilityAlertItem
- (BOOL)dismissOnLock;
- (BOOL)forcesModalAlertAppearance;
- (BOOL)shouldShowInLockScreen;
- (SBWebClipEligibilityAlertItem)initWithWebClip:(id)a3;
- (UIWebClip)webClip;
- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4;
@end

@implementation SBWebClipEligibilityAlertItem

- (SBWebClipEligibilityAlertItem)initWithWebClip:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBWebClipEligibilityAlertItem;
  v6 = [(SBAlertItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_webClip, a3);
  }

  return v7;
}

- (void)configure:(BOOL)a3 requirePasscodeForActions:(BOOL)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = [(SBAlertItem *)self alertController];
  objc_initWeak(&location, self);
  v6 = [(SBWebClipEligibilityAlertItem *)self webClip];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __69__SBWebClipEligibilityAlertItem_configure_requirePasscodeForActions___block_invoke;
  v21[3] = &unk_1E6AF7920;
  objc_copyWeak(&v23, &location);
  id v7 = v6;
  id v22 = v7;
  v8 = [v7 eligibilityAlert:v21];
  objc_super v9 = [v8 title];
  [v5 setTitle:v9];

  v10 = [v8 message];
  [v5 setMessage:v10];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v11 = objc_msgSend(v8, "actions", 0);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v11);
        }
        v15 = (void *)[*(id *)(*((void *)&v17 + 1) + 8 * v14) copy];
        [v5 addAction:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v12);
  }

  v16 = [v8 preferredAction];
  [v5 setPreferredAction:v16];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

void __69__SBWebClipEligibilityAlertItem_configure_requirePasscodeForActions___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained deactivateForReason:2];

  if (a2)
  {
    id v6 = [(id)SBApp webClipService];
    id v5 = [*(id *)(a1 + 32) identifier];
    [v6 launchWebClipWithIdentifier:v5 origin:&unk_1F3349380];
  }
}

- (BOOL)forcesModalAlertAppearance
{
  return 1;
}

- (BOOL)shouldShowInLockScreen
{
  return 0;
}

- (BOOL)dismissOnLock
{
  return 1;
}

- (UIWebClip)webClip
{
  return self->_webClip;
}

- (void).cxx_destruct
{
}

@end