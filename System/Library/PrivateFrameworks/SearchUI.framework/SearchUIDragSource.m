@interface SearchUIDragSource
+ (id)dragSourceForView:(id)a3 dragObject:(id)a4 feedbackDelegate:(id)a5;
- (BOOL)_shouldPerformHitTestingForDragSessionInView:(id)a3;
- (BOOL)dragInteraction:(id)a3 sessionAllowsMoveOperation:(id)a4;
- (SearchUIDragSource)initWithView:(id)a3 dragObject:(id)a4 feedbackDelegate:(id)a5;
- (SearchUIFeedbackDelegateInternal)feedbackDelegate;
- (SearchUIRowModel)dragObject;
- (UIView)dragSourceView;
- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4;
- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5;
- (id)dragParametersForPreviewView:(id)a3;
- (int64_t)_dragInteraction:(id)a3 dataOwnerForSession:(id)a4;
- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4;
- (void)sendDragFeedback;
- (void)setDragObject:(id)a3;
- (void)setDragSourceView:(id)a3;
- (void)setFeedbackDelegate:(id)a3;
@end

@implementation SearchUIDragSource

+ (id)dragSourceForView:(id)a3 dragObject:(id)a4 feedbackDelegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([MEMORY[0x1E4FB1708] isEnabledByDefault]) {
    v11 = (void *)[objc_alloc((Class)a1) initWithView:v8 dragObject:v9 feedbackDelegate:v10];
  }
  else {
    v11 = 0;
  }

  return v11;
}

- (SearchUIDragSource)initWithView:(id)a3 dragObject:(id)a4 feedbackDelegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SearchUIDragSource;
  v11 = [(SearchUIDragSource *)&v16 init];
  v12 = v11;
  if (v11)
  {
    [(SearchUIDragSource *)v11 setDragSourceView:v8];
    [(SearchUIDragSource *)v12 setDragObject:v9];
    [(SearchUIDragSource *)v12 setFeedbackDelegate:v10];
    v13 = (void *)[objc_alloc(MEMORY[0x1E4FB1708]) initWithDelegate:v12];
    v14 = [(SearchUIDragSource *)v12 dragSourceView];
    [v14 addInteraction:v13];
  }
  return v12;
}

- (void)setFeedbackDelegate:(id)a3
{
}

- (void)setDragSourceView:(id)a3
{
}

- (void)setDragObject:(id)a3
{
}

- (UIView)dragSourceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dragSourceView);
  return (UIView *)WeakRetained;
}

- (id)dragParametersForPreviewView:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4FB1720];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v6 = (void *)MEMORY[0x1E4FB14C0];
  [v4 bounds];
  v7 = objc_msgSend(v6, "bezierPathWithRoundedRect:cornerRadius:");
  [v5 setVisiblePath:v7];

  id v8 = [MEMORY[0x1E4FAE060] bestAppearanceForView:v4];

  LODWORD(v4) = [v8 isDark];
  if (v4)
  {
    id v9 = [MEMORY[0x1E4FB1618] grayColor];
    [v5 setBackgroundColor:v9];
  }
  return v5;
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(SearchUIDragSource *)self feedbackDelegate];
  char v8 = objc_opt_respondsToSelector();
  if (v8)
  {
    id v4 = [(SearchUIDragSource *)self feedbackDelegate];
    if (([v4 dragInteractionEnabled] & 1) == 0)
    {

      goto LABEL_11;
    }
  }
  id v9 = [v6 view];
  BOOL v10 = +[SearchUIUtilities deviceIsAuthenticatedForView:v9];

  if ((v8 & 1) == 0)
  {

    if (v10) {
      goto LABEL_7;
    }
LABEL_11:
    objc_super v16 = 0;
    goto LABEL_18;
  }

  if (!v10) {
    goto LABEL_11;
  }
LABEL_7:
  v11 = [(SearchUIDragSource *)self dragObject];
  v12 = +[SearchUICommandHandler handlerForRowModel:v11 environment:0];

  v13 = [v12 itemProvider];
  v14 = [v13 suggestedName];

  if (!v14)
  {
    v17 = [(SearchUIDragSource *)self dragObject];
    v18 = [v17 identifyingResult];
    v19 = [v18 resultBundleId];
    v20 = +[SearchUIUtilities bundleIdentifierForApp:8];
    int v21 = [v19 isEqualToString:v20];

    v22 = [(SearchUIDragSource *)self dragObject];
    v23 = v22;
    if (v21) {
      [v22 dragSubtitle];
    }
    else {
    v24 = [v22 dragTitle];
    }
    [v13 setSuggestedName:v24];

    if (v13) {
      goto LABEL_9;
    }
LABEL_16:
    objc_super v16 = 0;
    goto LABEL_17;
  }
  if (!v13) {
    goto LABEL_16;
  }
LABEL_9:
  v15 = (void *)[objc_alloc(MEMORY[0x1E4FB1710]) initWithItemProvider:v13];
  v26[0] = v15;
  objc_super v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];

LABEL_17:
LABEL_18:

  return v16;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  id v6 = a3;
  v7 = [v6 view];
  char v8 = [(SearchUIDragSource *)self dragParametersForPreviewView:v7];

  id v9 = objc_alloc(MEMORY[0x1E4FB1D40]);
  BOOL v10 = [v6 view];

  v11 = (void *)[v9 initWithView:v10 parameters:v8];
  return v11;
}

- (void)sendDragFeedback
{
  id v6 = [(SearchUIDragSource *)self feedbackDelegate];
  v3 = [(SearchUIDragSource *)self dragObject];
  id v4 = [v3 identifyingResult];

  if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F9A340]) initWithResult:v4 triggerEvent:18 destination:0];
    [v6 didEngageResult:v5];
  }
}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
  id v5 = a4;
  [(SearchUIDragSource *)self sendDragFeedback];
  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:@"SearchUIWillInitiateDragNotification" object:0 userInfo:0];

  v7 = [v5 items];

  char v8 = [v7 firstObject];

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__SearchUIDragSource_dragInteraction_sessionWillBegin___block_invoke;
  v9[3] = &unk_1E6E73470;
  v9[4] = self;
  [v8 setPreviewProvider:v9];
}

id __55__SearchUIDragSource_dragInteraction_sessionWillBegin___block_invoke(uint64_t a1)
{
  v37[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) dragObject];
  v3 = +[SearchUICommandHandler handlerForRowModel:v2 environment:0];

  if ([v3 useSourceViewAsPreviewForDragging])
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1718]);
    id v5 = [*(id *)(a1 + 32) dragSourceView];
    id v6 = *(void **)(a1 + 32);
    v7 = [v6 dragSourceView];
    char v8 = [v6 dragParametersForPreviewView:v7];
    id v9 = (void *)[v4 initWithView:v5 parameters:v8];

    goto LABEL_9;
  }
  BOOL v10 = [*(id *)(a1 + 32) dragObject];
  uint64_t v11 = [v10 dragURL];
  if (!v11)
  {

    goto LABEL_7;
  }
  v12 = (void *)v11;
  v13 = [*(id *)(a1 + 32) dragObject];
  v14 = [v13 dragURL];
  char v15 = [v14 isFileURL];

  if (v15)
  {
LABEL_7:
    v22 = (void *)MEMORY[0x1E4FB1E88];
    v17 = [*(id *)(a1 + 32) dragObject];
    v18 = [v17 dragTitle];
    v19 = [*(id *)(a1 + 32) dragObject];
    v20 = [v19 dragSubtitle];
    uint64_t v21 = [v22 viewWithTitle:v18 URLText:v20];
    goto LABEL_8;
  }
  objc_super v16 = (void *)MEMORY[0x1E4FB1E88];
  v17 = [*(id *)(a1 + 32) dragObject];
  v18 = [v17 dragTitle];
  v19 = [*(id *)(a1 + 32) dragObject];
  v20 = [v19 dragURL];
  uint64_t v21 = [v16 viewWithTitle:v18 URL:v20];
LABEL_8:
  v23 = (void *)v21;

  id v24 = objc_alloc(MEMORY[0x1E4FB1720]);
  v25 = (void *)MEMORY[0x1E4F29238];
  [v23 bounds];
  v26 = objc_msgSend(v25, "valueWithCGRect:");
  v37[0] = v26;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
  v28 = (void *)[v24 initWithTextLineRects:v27];

  [v23 layoutBelowIfNeeded];
  [v23 frame];
  double v30 = v29;
  double v32 = v31;
  objc_msgSend(v23, "systemLayoutSizeFittingSize:", v33, 0.0);
  objc_msgSend(v23, "setFrame:", v30, v32, v34, v35);
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4FB1718]) initWithView:v23 parameters:v28];

LABEL_9:
  return v9;
}

- (BOOL)dragInteraction:(id)a3 sessionAllowsMoveOperation:(id)a4
{
  return 1;
}

- (int64_t)_dragInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  id v5 = [(SearchUIDragSource *)self dragObject];
  id v6 = [v5 identifyingResult];
  v7 = [v6 applicationBundleIdentifier];

  if (v7)
  {
    int v8 = [v7 hasPrefix:@"com.apple."];
    id v9 = [MEMORY[0x1E4F74230] sharedConnection];
    uint64_t v10 = [v9 dragDropSourceManagementStateForBundleID:v7];
    if (v8)
    {

      uint64_t v11 = [MEMORY[0x1E4F74230] sharedConnection];
      int v12 = [v11 isOpenInRestrictionInEffect];

      int64_t v13 = 0;
      if (v10 && v12)
      {
        v14 = [(SearchUIDragSource *)self dragObject];
        char v15 = [v14 identifyingResult];
        int64_t v13 = [v15 dataOwnerType];
      }
    }
    else
    {

      if (v10 == 1) {
        int64_t v13 = 2;
      }
      else {
        int64_t v13 = v10 == 0;
      }
    }
  }
  else
  {
    int64_t v13 = 0;
  }

  return v13;
}

- (BOOL)_shouldPerformHitTestingForDragSessionInView:(id)a3
{
  return 1;
}

- (SearchUIRowModel)dragObject
{
  return self->_dragObject;
}

- (SearchUIFeedbackDelegateInternal)feedbackDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_feedbackDelegate);
  return (SearchUIFeedbackDelegateInternal *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_feedbackDelegate);
  objc_destroyWeak((id *)&self->_dragSourceView);
  objc_storeStrong((id *)&self->_dragObject, 0);
}

@end