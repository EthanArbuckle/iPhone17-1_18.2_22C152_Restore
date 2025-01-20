@interface SearchUICollectionPeekDelegate
+ (id)menuConfigurationForCommandHandler:(id)a3;
+ (void)contextMenuInteractionWillDisplayMenuForCommandHandler:(id)a3 animator:(id)a4;
+ (void)contextMenuInteractionWillEndForCommandHandler:(id)a3 animator:(id)a4;
+ (void)contextMenuInteractionWillPerformPreviewActionForMenuWithCommandHandler:(id)a3 animator:(id)a4;
- (SearchUICollectionPeekDelegate)initWithViewController:(id)a3;
- (SearchUICollectionViewController)collectionViewController;
- (SearchUICommandHandler)commandHandler;
- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 dismissalPreviewForItemWithIdentifier:(id)a5;
- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)generateTargetPreviewForInteraction:(id)a3 forItemWithIdentifier:(id)a4;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)setCollectionViewController:(id)a3;
- (void)setCommandHandler:(id)a3;
@end

@implementation SearchUICollectionPeekDelegate

- (SearchUICollectionPeekDelegate)initWithViewController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SearchUICollectionPeekDelegate;
  v5 = [(SearchUICollectionPeekDelegate *)&v8 init];
  v6 = v5;
  if (v5) {
    [(SearchUICollectionPeekDelegate *)v5 setCollectionViewController:v4];
  }

  return v6;
}

- (void)setCollectionViewController:(id)a3
{
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  v7 = [(SearchUICollectionPeekDelegate *)self collectionViewController];
  objc_super v8 = [v7 collectionView];
  v9 = objc_msgSend(v8, "indexPathForItemAtPoint:", x, y);
  if (!v9
    || !+[SearchUIUtilities deviceIsAuthenticatedForView:v8])
  {
    v16 = 0;
    goto LABEL_22;
  }
  v10 = objc_msgSend(v8, "hitTest:withEvent:", 0, x, y);
  v11 = [v7 dataSource];
  v12 = [v11 itemIdentifierForIndexPath:v9];

  v13 = [v12 identifyingResult];
  v14 = [v13 applicationBundleIdentifier];
  if (+[SearchUIUtilities bundleIdentifierIsBlockedForScreenTimeExpiration:](SearchUIUtilities, "bundleIdentifierIsBlockedForScreenTimeExpiration:", v14)|| (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && ([v10 isThreeDTouchEnabled] & 1) != 0)
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  v17 = [v8 cellForItemAtIndexPath:v9];
  if (v17
    && [v10 isDescendantOfView:v17]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v18 = objc_msgSend(v17, "searchui_focusStyle");
    v19 = [v7 commandEnvironmentForIndexPath:v9];
    if (v18 == 7) {
      goto LABEL_15;
    }
  }
  else
  {
    v19 = [v7 commandEnvironmentForIndexPath:v9];
    if (isKindOfClass) {
      goto LABEL_15;
    }
  }
  if (+[SearchUICommandHandler hasValidHandlerForRowModel:v12 environment:v19])
  {
    goto LABEL_19;
  }
  v20 = [v12 cardSection];
  v21 = [v20 previewButtonItems];
  if (v21)
  {

    goto LABEL_19;
  }
  if ([v12 supportsCustomUserReportRequestAfforance])
  {
    v16 = 0;
    goto LABEL_20;
  }
  v25 = [v12 cardSection];
  v26 = [v25 userReportRequest];

  if (v26)
  {
LABEL_19:
    v22 = +[SearchUICommandHandler previewHandlerForRowModel:v12 environment:v19];
    [(SearchUICollectionPeekDelegate *)self setCommandHandler:v22];

    v23 = objc_opt_class();
    v20 = [(SearchUICollectionPeekDelegate *)self commandHandler];
    v16 = [v23 menuConfigurationForCommandHandler:v20];
LABEL_20:

    goto LABEL_21;
  }
LABEL_15:
  v16 = 0;
LABEL_21:

LABEL_22:
  return v16;
}

+ (id)menuConfigurationForCommandHandler:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4FB1678];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__SearchUICollectionPeekDelegate_menuConfigurationForCommandHandler___block_invoke;
  v9[3] = &unk_1E6E73090;
  id v10 = v3;
  id v5 = v3;
  v6 = [v5 actionProvider];
  v7 = [v4 configurationWithIdentifier:0 previewProvider:v9 actionProvider:v6];

  return v7;
}

id __69__SearchUICollectionPeekDelegate_menuConfigurationForCommandHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) viewController];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    [*(id *)(a1 + 32) prepareViewController:v2 forTriggerEvent:5];
    if (!+[SearchUIUtilities canShowViewController:v2]
      || (objc_opt_class(), char isKindOfClass = objc_opt_isKindOfClass(), v5 = v2, (isKindOfClass & 1) != 0))
    {
      +[SearchUIUtilities requestDeviceUnlock:0];
      id v5 = 0;
    }
    id v3 = v5;
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  return [(SearchUICollectionPeekDelegate *)self generateTargetPreviewForInteraction:a3 forItemWithIdentifier:a5];
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 dismissalPreviewForItemWithIdentifier:(id)a5
{
  return [(SearchUICollectionPeekDelegate *)self generateTargetPreviewForInteraction:a3 forItemWithIdentifier:a5];
}

- (id)generateTargetPreviewForInteraction:(id)a3 forItemWithIdentifier:(id)a4
{
  id v5 = a3;
  v6 = [(SearchUICollectionPeekDelegate *)self collectionViewController];
  v7 = [v6 collectionView];

  [v5 locationInView:v7];
  double v9 = v8;
  double v11 = v10;

  v12 = 0;
  if (objc_msgSend(v7, "pointInside:withEvent:", 0, v9, v11))
  {
    v13 = objc_msgSend(v7, "indexPathForItemAtPoint:", v9, v11);
    if (!v13)
    {
      v12 = 0;
LABEL_20:

      goto LABEL_21;
    }
    v14 = [v7 cellForItemAtIndexPath:v13];
    if (!v14 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v12 = 0;
LABEL_19:

      goto LABEL_20;
    }
    id v15 = v14;
    uint64_t v16 = [v15 highlightReferenceView];
    v17 = (void *)v16;
    if (v16) {
      uint64_t v18 = (void *)v16;
    }
    else {
      uint64_t v18 = v15;
    }
    id v19 = v18;

    v20 = objc_opt_new();
    v21 = [v15 backgroundView];
    if (v21)
    {
    }
    else
    {
      v22 = [(SearchUICollectionPeekDelegate *)self commandHandler];
      v23 = [v22 viewController];

      if (!v23) {
        goto LABEL_14;
      }
    }
    v24 = [MEMORY[0x1E4FB1618] clearColor];
    [v20 setBackgroundColor:v24];

LABEL_14:
    v25 = [v15 rowModel];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v26 = [v15 rowModel];
      int v27 = [v26 supportsCustomHighlightBehavior];

      if (!v27)
      {
LABEL_18:
        v12 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:v19 parameters:v20];

        goto LABEL_19;
      }
      uint64_t v28 = [v15 contentView];

      v29 = (void *)MEMORY[0x1E4FB14C0];
      [v15 highlightFrame];
      double v31 = v30;
      double v33 = v32;
      double v35 = v34;
      double v37 = v36;
      [v15 highlightFrameCornerRadius];
      v25 = objc_msgSend(v29, "bezierPathWithRoundedRect:cornerRadius:", v31, v33, v35, v37, v38);
      [v20 setVisiblePath:v25];
      id v19 = (id)v28;
    }

    goto LABEL_18;
  }
LABEL_21:

  return v12;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v6 = a5;
  v7 = objc_opt_class();
  id v8 = [(SearchUICollectionPeekDelegate *)self commandHandler];
  [v7 contextMenuInteractionWillDisplayMenuForCommandHandler:v8 animator:v6];
}

+ (void)contextMenuInteractionWillDisplayMenuForCommandHandler:(id)a3 animator:(id)a4
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __98__SearchUICollectionPeekDelegate_contextMenuInteractionWillDisplayMenuForCommandHandler_animator___block_invoke;
  v7[3] = &unk_1E6E72730;
  id v8 = v5;
  id v6 = v5;
  [a4 addAnimations:v7];
  [v6 didPreview];
}

void __98__SearchUICollectionPeekDelegate_contextMenuInteractionWillDisplayMenuForCommandHandler_animator___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) environment];
  v1 = [v3 presentingViewController];
  v2 = [v1 view];
  [v2 setAlpha:0.75];
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v6 = a5;
  v7 = objc_opt_class();
  id v8 = [(SearchUICollectionPeekDelegate *)self commandHandler];
  [v7 contextMenuInteractionWillPerformPreviewActionForMenuWithCommandHandler:v8 animator:v6];
}

+ (void)contextMenuInteractionWillPerformPreviewActionForMenuWithCommandHandler:(id)a3 animator:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 viewController];
  [v6 setPreferredCommitStyle:v7 != 0];

  id v8 = [v5 rowModel];
  double v9 = [v8 cardSection];
  double v10 = [v9 previewCommand];
  if (v10)
  {
    double v11 = [v9 command];
    if ([v10 isEqual:v11])
    {
      char v12 = [v5 prefersModalPresentation];

      if ((v12 & 1) == 0) {
        goto LABEL_9;
      }
    }
    else
    {
    }
  }
  else if (![v5 prefersModalPresentation])
  {
    goto LABEL_9;
  }
  v13 = [v5 rowModel];
  v14 = [v5 environment];
  uint64_t v15 = +[SearchUICommandHandler handlerForRowModel:v13 environment:v14];

  id v5 = (id)v15;
LABEL_9:
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __115__SearchUICollectionPeekDelegate_contextMenuInteractionWillPerformPreviewActionForMenuWithCommandHandler_animator___block_invoke;
  v17[3] = &unk_1E6E72730;
  id v18 = v5;
  id v16 = v5;
  [v6 addAnimations:v17];
}

uint64_t __115__SearchUICollectionPeekDelegate_contextMenuInteractionWillPerformPreviewActionForMenuWithCommandHandler_animator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) executeWithTriggerEvent:6];
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v6 = a5;
  v7 = objc_opt_class();
  id v8 = [(SearchUICollectionPeekDelegate *)self commandHandler];
  [v7 contextMenuInteractionWillEndForCommandHandler:v8 animator:v6];

  [(SearchUICollectionPeekDelegate *)self setCommandHandler:0];
}

+ (void)contextMenuInteractionWillEndForCommandHandler:(id)a3 animator:(id)a4
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __90__SearchUICollectionPeekDelegate_contextMenuInteractionWillEndForCommandHandler_animator___block_invoke;
  v7[3] = &unk_1E6E72730;
  id v8 = v5;
  id v6 = v5;
  [a4 addAnimations:v7];
}

void __90__SearchUICollectionPeekDelegate_contextMenuInteractionWillEndForCommandHandler_animator___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) environment];
  v1 = [v3 presentingViewController];
  v2 = [v1 view];
  [v2 setAlpha:1.0];
}

- (SearchUICollectionViewController)collectionViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionViewController);
  return (SearchUICollectionViewController *)WeakRetained;
}

- (SearchUICommandHandler)commandHandler
{
  return self->_commandHandler;
}

- (void)setCommandHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandHandler, 0);
  objc_destroyWeak((id *)&self->_collectionViewController);
}

@end