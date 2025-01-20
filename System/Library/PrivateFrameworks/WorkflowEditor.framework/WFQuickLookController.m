@interface WFQuickLookController
- (BOOL)isEmbedded;
- (CGSize)preferredContentSize;
- (NSMutableIndexSet)indexesPendingRefresh;
- (NSTimer)indexTimer;
- (WFQuickLookController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)activityItemForDocumentInteractionController:(id)a3;
- (int64_t)lastIndex;
- (void)_updateAppearance:(BOOL)a3;
- (void)setEmbedded:(BOOL)a3;
- (void)setIndexTimer:(id)a3;
- (void)setIndexesPendingRefresh:(id)a3;
- (void)setLastIndex:(int64_t)a3;
- (void)updateCurrentIndex;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)wf_refreshPreviewItemAtIndex:(int64_t)a3;
@end

@implementation WFQuickLookController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexTimer, 0);
  objc_storeStrong((id *)&self->_indexesPendingRefresh, 0);
}

- (void)setLastIndex:(int64_t)a3
{
  self->_lastIndex = a3;
}

- (int64_t)lastIndex
{
  return self->_lastIndex;
}

- (void)setIndexTimer:(id)a3
{
}

- (NSTimer)indexTimer
{
  return self->_indexTimer;
}

- (void)setIndexesPendingRefresh:(id)a3
{
}

- (NSMutableIndexSet)indexesPendingRefresh
{
  return self->_indexesPendingRefresh;
}

- (void)setEmbedded:(BOOL)a3
{
  self->_embedded = a3;
}

- (BOOL)isEmbedded
{
  return self->_embedded;
}

- (id)activityItemForDocumentInteractionController:(id)a3
{
  id v4 = a3;
  if (objc_msgSend((id)-[WFQuickLookController superclass](self, "superclass"), "instancesRespondToSelector:", sel_activityItemForDocumentInteractionController_))
  {
    v15.receiver = self;
    v15.super_class = (Class)WFQuickLookController;
    v5 = [(QLPreviewController *)&v15 activityItemForDocumentInteractionController:v4];
    objc_opt_class();
    NSClassFromString(&cfstr_Qlactivityitem.isa);
    char isKindOfClass = objc_opt_isKindOfClass();
    id v7 = v5;
    if (isKindOfClass & 1) != 0 && (objc_opt_respondsToSelector())
    {
      v8 = [(QLPreviewController *)self currentPreviewItem];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = v8;
        v10 = [v9 originalItem];

        if (v10)
        {
          v11 = objc_opt_new();
          v12 = [v9 originalItem];
          [v11 setItem:v12];

          v13 = [MEMORY[0x263F16090] itemWithPreviewItem:v11];
          [v7 setActivityPreviewItem:v13];
        }
      }
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)wf_refreshPreviewItemAtIndex:(int64_t)a3
{
  if ([(QLPreviewController *)self currentPreviewItemIndex] == a3)
  {
    [(QLPreviewController *)self refreshCurrentPreviewItem];
  }
  else
  {
    id v5 = [(WFQuickLookController *)self indexesPendingRefresh];
    [v5 addIndex:a3];
  }
}

- (CGSize)preferredContentSize
{
  v10.receiver = self;
  v10.super_class = (Class)WFQuickLookController;
  [(WFQuickLookController *)&v10 preferredContentSize];
  double v4 = *MEMORY[0x263F001B0];
  double v5 = *(double *)(MEMORY[0x263F001B0] + 8);
  if (v2 != *MEMORY[0x263F001B0] || v3 != v5)
  {
    double v7 = fmax(400.0 / v2, 300.0 / v3);
    double v4 = v2;
    double v5 = v3;
    if (v7 > 1.0)
    {
      double v4 = v2 * v7;
      double v5 = v3 * v7;
    }
  }
  double v8 = v4;
  double v9 = v5;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)updateCurrentIndex
{
  int64_t v3 = [(QLPreviewController *)self currentPreviewItemIndex];
  if (self->_lastIndex != v3)
  {
    [(WFQuickLookController *)self willChangeValueForKey:@"currentPreviewItemIndex"];
    [(WFQuickLookController *)self didChangeValueForKey:@"currentPreviewItemIndex"];
    double v4 = [(WFQuickLookController *)self indexesPendingRefresh];
    if ([v4 containsIndex:v3])
    {
      [v4 removeAllIndexes];
      [(QLPreviewController *)self refreshCurrentPreviewItem];
    }
  }
  self->_lastIndex = v3;
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFQuickLookController;
  [(QLPreviewController *)&v5 viewWillDisappear:a3];
  double v4 = [(WFQuickLookController *)self indexTimer];
  [v4 invalidate];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFQuickLookController;
  [(QLPreviewController *)&v5 viewWillAppear:a3];
  double v4 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel_updateCurrentIndex selector:0 userInfo:1 repeats:0.100000001];
  [(WFQuickLookController *)self setIndexTimer:v4];
}

- (void)viewWillLayoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)WFQuickLookController;
  [(WFQuickLookController *)&v19 viewWillLayoutSubviews];
  if ([(WFQuickLookController *)self modalPresentationStyle] == 2)
  {
    int64_t v3 = [(WFQuickLookController *)self view];
    double v4 = [v3 superview];
    objc_super v5 = [(WFQuickLookController *)self view];
    v6 = [v5 superview];
    [v6 center];
    double v8 = v7;
    double v10 = v9;
    v11 = [(WFQuickLookController *)self view];
    v12 = [v11 superview];
    v13 = [v12 superview];
    objc_msgSend(v4, "convertPoint:fromView:", v13, v8, v10);
    double v15 = v14;
    double v17 = v16;
    v18 = [(WFQuickLookController *)self view];
    objc_msgSend(v18, "setCenter:", v15, v17);
  }
}

- (void)_updateAppearance:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(WFQuickLookController *)self isEmbedded])
  {
    v5.receiver = self;
    v5.super_class = (Class)WFQuickLookController;
    [(QLPreviewController *)&v5 _updateAppearance:v3];
  }
}

- (WFQuickLookController)initWithNibName:(id)a3 bundle:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)WFQuickLookController;
  double v4 = [(QLPreviewController *)&v9 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    indexesPendingRefresh = v4->_indexesPendingRefresh;
    v4->_indexesPendingRefresh = (NSMutableIndexSet *)v5;

    double v7 = v4;
  }

  return v4;
}

@end