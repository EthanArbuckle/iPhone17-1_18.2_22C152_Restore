@interface SearchUIStoreButtonItemViewController
+ (id)lockupCache;
+ (id)lockupViewGroup;
- (ASCLockupView)lockupView;
- (BOOL)startedInstalling;
- (NSString)adamID;
- (SearchUIStoreButtonItemViewController)init;
- (id)buttonItemView;
- (id)currentStoreButtonIdentifier;
- (id)environment;
- (id)metricsActivityForLockupView:(id)a3 toPerformActionOfOffer:(id)a4;
- (id)presentingViewControllerForLockupView:(id)a3;
- (id)storeButtonItem;
- (int)currentStoreButtonIdentifierType;
- (void)lockupView:(id)a3 appStateDidChange:(id)a4;
- (void)lockupView:(id)a3 didFailRequestWithError:(id)a4;
- (void)lockupViewDidFinishRequest:(id)a3;
- (void)lockupViewDidInvalidateIntrinsicContentSize:(id)a3;
- (void)setAdamID:(id)a3;
- (void)setLockupView:(id)a3;
- (void)setStartedInstalling:(BOOL)a3;
- (void)updateWithButtonItem:(id)a3 buttonItemViewType:(unint64_t)a4;
@end

@implementation SearchUIStoreButtonItemViewController

- (SearchUIStoreButtonItemViewController)init
{
  v7.receiver = self;
  v7.super_class = (Class)SearchUIStoreButtonItemViewController;
  v2 = [(SearchUIButtonItemViewController *)&v7 init];
  if (v2)
  {
    v3 = objc_opt_new();
    v4 = [(id)objc_opt_class() lockupViewGroup];
    [v3 setGroup:v4];

    [v3 setSize:*MEMORY[0x1E4F4BAA8]];
    [v3 setDelegate:v2];
    [(SearchUIStoreButtonItemViewController *)v2 setLockupView:v3];
    v5 = [[SearchUILockupViewContainer alloc] initWithLockupView:v3];
    [(SearchUIButtonItemViewController *)v2 setView:v5];
  }
  return v2;
}

- (void)updateWithButtonItem:(id)a3 buttonItemViewType:(unint64_t)a4
{
  id v5 = a3;
  v6 = [(SearchUIButtonItemViewController *)self buttonItem];
  char v7 = [v5 isEqual:v6];

  if ((v7 & 1) == 0)
  {
    [(SearchUIButtonItemViewController *)self setButtonItem:v5];
    v8 = [(SearchUIStoreButtonItemViewController *)self currentStoreButtonIdentifier];
    int v9 = [(SearchUIStoreButtonItemViewController *)self currentStoreButtonIdentifierType];
    if (!v8)
    {
      v16 = [(SearchUIStoreButtonItemViewController *)self lockupView];
      [v16 setAlpha:0.0];

LABEL_12:
      goto LABEL_13;
    }
    int v10 = v9;
    v11 = [(id)objc_opt_class() lockupCache];
    v12 = [(SearchUIStoreButtonItemViewController *)self storeButtonItem];
    v13 = [v11 objectForKey:v12];

    if (v13)
    {
      v14 = (void *)MEMORY[0x1E4FAE198];
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __81__SearchUIStoreButtonItemViewController_updateWithButtonItem_buttonItemViewType___block_invoke;
      v33[3] = &unk_1E6E72620;
      v33[4] = self;
      id v34 = v13;
      [v14 performWithoutAnimations:v33];
      v15 = v34;
    }
    else
    {
      v17 = [(SearchUIStoreButtonItemViewController *)self lockupView];
      [v17 setAlpha:0.0];

      v18 = [(SearchUIStoreButtonItemViewController *)self lockupView];
      [v18 setLockup:0];

      v19 = [(SearchUIStoreButtonItemViewController *)self lockupView];
      v20 = [v19 request];
      v21 = [v20 id];
      v22 = [v21 stringValue];
      char v23 = [v8 isEqualToString:v22];

      if (v23) {
        goto LABEL_11;
      }
      if (v10 != 1)
      {
        if (!v10)
        {
          v24 = (void *)[objc_alloc(MEMORY[0x1E4F4BAC0]) initWithStringValue:v8];
          [(SearchUIStoreButtonItemViewController *)self setAdamID:v8];
          id v25 = objc_alloc(MEMORY[0x1E4F4BB00]);
          v26 = (void *)[v25 initWithID:v24 kind:*MEMORY[0x1E4F4BA80] context:*MEMORY[0x1E4F4BA58]];
          v27 = [(SearchUIStoreButtonItemViewController *)self lockupView];
          [v27 setRequest:v26];
        }
        goto LABEL_11;
      }
      [(SearchUIStoreButtonItemViewController *)self setAdamID:0];
      v28 = [(id)objc_opt_class() lockupViewGroup];
      uint64_t v29 = *MEMORY[0x1E4F4BA58];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __81__SearchUIStoreButtonItemViewController_updateWithButtonItem_buttonItemViewType___block_invoke_2;
      v30[3] = &unk_1E6E74530;
      id v31 = v5;
      v32 = self;
      [v28 _lockupRequestForBundleID:v8 withContext:v29 completionBlock:v30];

      v15 = v31;
    }

LABEL_11:
    goto LABEL_12;
  }
LABEL_13:
}

void __81__SearchUIStoreButtonItemViewController_updateWithButtonItem_buttonItemViewType___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) lockupView];
  [v2 setRequest:0];

  uint64_t v3 = *(void *)(a1 + 40);
  v4 = [*(id *)(a1 + 32) lockupView];
  [v4 setLockup:v3];

  id v5 = [*(id *)(a1 + 32) lockupView];
  [v5 setAlpha:1.0];
}

void __81__SearchUIStoreButtonItemViewController_updateWithButtonItem_buttonItemViewType___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)MEMORY[0x1E4FAE198];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __81__SearchUIStoreButtonItemViewController_updateWithButtonItem_buttonItemViewType___block_invoke_3;
  v8[3] = &unk_1E6E72938;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v9 = v5;
  uint64_t v10 = v6;
  id v11 = v3;
  id v7 = v3;
  [v4 dispatchMainIfNecessary:v8];
}

void __81__SearchUIStoreButtonItemViewController_updateWithButtonItem_buttonItemViewType___block_invoke_3(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) buttonItem];
  LODWORD(v2) = [v2 isEqual:v3];

  if (v2)
  {
    v4 = [*(id *)(a1 + 48) id];
    id v5 = [v4 stringValue];
    [*(id *)(a1 + 40) setAdamID:v5];

    uint64_t v6 = *(void *)(a1 + 48);
    id v7 = [*(id *)(a1 + 40) lockupView];
    [v7 setRequest:v6];
  }
}

- (id)buttonItemView
{
  return 0;
}

- (id)storeButtonItem
{
  v2 = [(SearchUIButtonItemViewController *)self buttonItem];
  id v3 = [v2 sfButtonItem];

  return v3;
}

- (id)currentStoreButtonIdentifier
{
  v2 = [(SearchUIStoreButtonItemViewController *)self storeButtonItem];
  id v3 = [v2 identifier];

  return v3;
}

- (int)currentStoreButtonIdentifierType
{
  v2 = [(SearchUIStoreButtonItemViewController *)self storeButtonItem];
  int v3 = [v2 identifierType];

  return v3;
}

+ (id)lockupCache
{
  if (lockupCache_onceToken != -1) {
    dispatch_once(&lockupCache_onceToken, &__block_literal_global_42);
  }
  v2 = (void *)lockupCache_lockupCache;
  return v2;
}

uint64_t __52__SearchUIStoreButtonItemViewController_lockupCache__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = lockupCache_lockupCache;
  lockupCache_lockupCache = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)lockupViewGroup
{
  if (lockupViewGroup_onceToken[0] != -1) {
    dispatch_once(lockupViewGroup_onceToken, &__block_literal_global_44);
  }
  v2 = (void *)lockupViewGroup_group;
  return v2;
}

uint64_t __56__SearchUIStoreButtonItemViewController_lockupViewGroup__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F4BB10]) initWithName:@"com.apple.SearchUI.LockupViewGroup"];
  uint64_t v1 = lockupViewGroup_group;
  lockupViewGroup_group = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)presentingViewControllerForLockupView:(id)a3
{
  int v3 = [(SearchUIStoreButtonItemViewController *)self environment];
  v4 = [v3 presentingViewController];

  return v4;
}

- (id)environment
{
  v2 = [(SearchUIButtonItemViewController *)self feedbackDelegate];
  int v3 = +[SearchUIUtilities environmentForDelegate:v2];

  return v3;
}

- (void)lockupViewDidFinishRequest:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4FAE198];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__SearchUIStoreButtonItemViewController_lockupViewDidFinishRequest___block_invoke;
  v7[3] = &unk_1E6E72620;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [v5 dispatchMainIfNecessary:v7];
}

void __68__SearchUIStoreButtonItemViewController_lockupViewDidFinishRequest___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) lockup];
  int v3 = [v2 id];
  id v4 = [v3 stringValue];

  id v5 = [*(id *)(a1 + 40) adamID];
  LODWORD(v3) = [v4 isEqualToString:v5];

  if (v3)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __68__SearchUIStoreButtonItemViewController_lockupViewDidFinishRequest___block_invoke_2;
    v9[3] = &unk_1E6E72730;
    id v10 = *(id *)(a1 + 32);
    +[SearchUIUtilities performAnimatableChanges:v9];
    id v6 = [(id)objc_opt_class() lockupCache];
    id v7 = [*(id *)(a1 + 32) lockup];
    id v8 = [*(id *)(a1 + 40) storeButtonItem];
    [v6 setObject:v7 forKey:v8];
  }
}

uint64_t __68__SearchUIStoreButtonItemViewController_lockupViewDidFinishRequest___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (void)lockupViewDidInvalidateIntrinsicContentSize:(id)a3
{
  [a3 intrinsicContentSize];
  double v5 = v4;
  double v7 = v6;
  int v8 = [MEMORY[0x1E4FAE198] isMacOS];
  double v9 = 74.0;
  if (v5 >= 74.0) {
    double v9 = v5;
  }
  if (!v8) {
    double v5 = v9;
  }
  id v10 = [(SearchUIStoreButtonItemViewController *)self lockupView];
  LODWORD(v11) = 1148846080;
  objc_msgSend(v10, "setLayoutSize:withContentPriority:", v5, v7, v11);

  id v12 = [(SearchUIStoreButtonItemViewController *)self lockupView];
  objc_msgSend(v12, "setCustomAlignmentRectInsets:", 10.0, 0.0, 10.0, 0.0);
}

- (void)lockupView:(id)a3 didFailRequestWithError:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  double v7 = [(SearchUIButtonItemViewController *)self feedbackDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    double v9 = [(SearchUIButtonItemViewController *)self feedbackDelegate];
    id v10 = [v13 lockup];
    double v11 = [v10 id];
    id v12 = [v11 stringValue];
    [v9 lockupViewForAppIdentifier:v12 didFailRequestWithError:v6];
  }
}

- (id)metricsActivityForLockupView:(id)a3 toPerformActionOfOffer:(id)a4
{
  id v5 = a3;
  [(SearchUIButtonItemViewController *)self buttonPressed];
  id v6 = [(SearchUIButtonItemViewController *)self feedbackDelegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    char v8 = [(SearchUIButtonItemViewController *)self feedbackDelegate];
    double v9 = [v5 lockup];
    id v10 = [v9 id];
    double v11 = [v10 stringValue];
    [v8 lockupViewEngagedForAppIdentifier:v11];
  }
  id v12 = [(SearchUIStoreButtonItemViewController *)self lockupView];
  id v13 = [v12 appearMetricsActivity];

  return v13;
}

- (void)lockupView:(id)a3 appStateDidChange:(id)a4
{
  id v21 = a3;
  id v6 = a4;
  if ([v6 isEqualToString:*MEMORY[0x1E4F4B998]])
  {
    [(SearchUIStoreButtonItemViewController *)self setStartedInstalling:1];
  }
  else if ([(SearchUIStoreButtonItemViewController *)self startedInstalling])
  {
    if ([v6 isEqualToString:*MEMORY[0x1E4F4B9A0]])
    {
      char v7 = [(SearchUIStoreButtonItemViewController *)self storeButtonItem];
      int v8 = [v7 shouldOpenAppAfterInstallCompletes];

      if (v8)
      {
        id v9 = objc_alloc(MEMORY[0x1E4F223C8]);
        id v10 = [v21 lockup];
        double v11 = [v10 id];
        id v12 = objc_msgSend(v9, "initWithStoreItemIdentifier:error:", objc_msgSend(v11, "int64value"), 0);

        id v13 = [v12 bundleIdentifier];
        v14 = [(SearchUIStoreButtonItemViewController *)self environment];
        +[SearchUILaunchAppHandler openApplicationWithBundleIdentifier:v13 environment:v14];
      }
    }
  }
  v15 = [(SearchUIButtonItemViewController *)self feedbackDelegate];
  char v16 = objc_opt_respondsToSelector();

  if (v16)
  {
    v17 = [(SearchUIButtonItemViewController *)self feedbackDelegate];
    v18 = [v21 lockup];
    v19 = [v18 id];
    v20 = [v19 stringValue];
    [v17 lockupViewForAppIdentifier:v20 didChangeState:v6];
  }
}

- (ASCLockupView)lockupView
{
  return self->_lockupView;
}

- (void)setLockupView:(id)a3
{
}

- (BOOL)startedInstalling
{
  return self->_startedInstalling;
}

- (void)setStartedInstalling:(BOOL)a3
{
  self->_startedInstalling = a3;
}

- (NSString)adamID
{
  return self->_adamID;
}

- (void)setAdamID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adamID, 0);
  objc_storeStrong((id *)&self->_lockupView, 0);
}

@end