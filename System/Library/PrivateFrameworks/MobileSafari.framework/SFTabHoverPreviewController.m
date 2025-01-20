@interface SFTabHoverPreviewController
- (BOOL)isEnabled;
- (SFTabHoverPreviewController)init;
- (SFTabHoverPreviewControllerDelegate)delegate;
- (UIHoverGestureRecognizer)hoverRecognizer;
- (void)_cancelOrCloseHoverPreviewWithGracePeriod:(BOOL)a3;
- (void)_showHoverPreviewForItem:(id)a3;
- (void)_temporarilyDisableHover;
- (void)cancel;
- (void)dealloc;
- (void)dismiss;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHoverRecognizer:(id)a3;
- (void)setNeedsSnapshotUpdate;
- (void)updateWithItem:(id)a3 atLocation:(CGPoint)a4;
@end

@implementation SFTabHoverPreviewController

- (void)setHoverRecognizer:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (SFTabHoverPreviewController)init
{
  v10.receiver = self;
  v10.super_class = (Class)SFTabHoverPreviewController;
  v2 = [(SFTabHoverPreviewController *)&v10 init];
  v3 = v2;
  if (v2)
  {
    v2->_enabled = 1;
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F4F660]) initWithIdentifier:@"com.apple.mobilesafari.tabHoverPreviewShowTimer"];
    tabHoverPreviewShowTimer = v3->_tabHoverPreviewShowTimer;
    v3->_tabHoverPreviewShowTimer = (BSAbsoluteMachTimer *)v4;

    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F4F660]) initWithIdentifier:@"com.apple.mobilesafari.disableHoverTimer"];
    disableHoverTimer = v3->_disableHoverTimer;
    v3->_disableHoverTimer = (BSAbsoluteMachTimer *)v6;

    v8 = v3;
  }

  return v3;
}

- (void)setNeedsSnapshotUpdate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained tabHoverPreviewControllerNeedsSnapshotUpdate:self];
}

- (void)dealloc
{
  [(BSAbsoluteMachTimer *)self->_tabHoverPreviewShowTimer invalidate];
  [(BSAbsoluteMachTimer *)self->_disableHoverTimer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SFTabHoverPreviewController;
  [(SFTabHoverPreviewController *)&v3 dealloc];
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
  if (!a3) {
    [(SFTabHoverPreviewController *)self cancel];
  }
}

- (void)updateWithItem:(id)a3 atLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  v8 = (SFTabHoverPreviewItem *)a3;
  v9 = v8;
  if (self->_enabled)
  {
    if (v8)
    {
      if (self->_itemShowingPreview != v8
        && (self->_itemPendingPreview != v8
         || sqrt((x - self->_pendingHoverLocation.x) * (x - self->_pendingHoverLocation.x)+ (y - self->_pendingHoverLocation.y) * (y - self->_pendingHoverLocation.y)) >= 10.0))
      {
        double Current = CFAbsoluteTimeGetCurrent();
        if (self->_itemShowingPreview || (double Current = Current - self->_lastTimeHoverPreviewWasDismissed, Current < 0.5))
        {
          -[SFTabHoverPreviewController _showHoverPreviewForItem:](self, "_showHoverPreviewForItem:", v9, Current);
        }
        else
        {
          objc_storeStrong((id *)&self->_itemPendingPreview, a3);
          self->_pendingHoverLocation.double x = x;
          self->_pendingHoverLocation.double y = y;
          [(BSAbsoluteMachTimer *)self->_tabHoverPreviewShowTimer cancel];
          objc_initWeak(&location, self);
          tabHoverPreviewShowTimer = self->_tabHoverPreviewShowTimer;
          uint64_t v12 = MEMORY[0x1E4F14428];
          id v13 = MEMORY[0x1E4F14428];
          v14[0] = MEMORY[0x1E4F143A8];
          v14[1] = 3221225472;
          v14[2] = __57__SFTabHoverPreviewController_updateWithItem_atLocation___block_invoke;
          v14[3] = &unk_1E54EC6C0;
          objc_copyWeak(&v16, &location);
          v15 = v9;
          [(BSAbsoluteMachTimer *)tabHoverPreviewShowTimer scheduleWithFireInterval:v12 leewayInterval:v14 queue:0.6 handler:0.06];

          objc_destroyWeak(&v16);
          objc_destroyWeak(&location);
        }
      }
    }
    else
    {
      [(SFTabHoverPreviewController *)self _cancelOrCloseHoverPreviewWithGracePeriod:1];
    }
  }
}

void __57__SFTabHoverPreviewController_updateWithItem_atLocation___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _showHoverPreviewForItem:*(void *)(a1 + 32)];
}

- (void)dismiss
{
  [(SFTabHoverPreviewController *)self _cancelOrCloseHoverPreviewWithGracePeriod:0];

  [(SFTabHoverPreviewController *)self _temporarilyDisableHover];
}

- (void)cancel
{
}

- (void)_showHoverPreviewForItem:(id)a3
{
  uint64_t v4 = (SFTabHoverPreviewItem *)a3;
  [(BSAbsoluteMachTimer *)self->_tabHoverPreviewShowTimer cancel];
  itemPendingPreview = self->_itemPendingPreview;
  self->_itemPendingPreview = 0;

  itemShowingPreview = self->_itemShowingPreview;
  self->_itemShowingPreview = v4;
  v7 = v4;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained tabHoverPreviewController:self showPreviewForItem:v7];
}

- (void)_cancelOrCloseHoverPreviewWithGracePeriod:(BOOL)a3
{
  BOOL v3 = a3;
  [(BSAbsoluteMachTimer *)self->_tabHoverPreviewShowTimer cancel];
  CFAbsoluteTime Current = 0.0;
  if (v3 && self->_itemShowingPreview) {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  }
  self->_lastTimeHoverPreviewWasDismissed = Current;
  itemPendingPreview = self->_itemPendingPreview;
  self->_itemPendingPreview = 0;

  itemShowingPreview = self->_itemShowingPreview;
  self->_itemShowingPreview = 0;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained tabHoverPreviewControllerDismissPreview:self];
}

- (void)_temporarilyDisableHover
{
  if ([(BSAbsoluteMachTimer *)self->_disableHoverTimer isScheduled]) {
    [(BSAbsoluteMachTimer *)self->_disableHoverTimer cancel];
  }
  [(UIHoverGestureRecognizer *)self->_hoverRecognizer setEnabled:0];
  objc_initWeak(&location, self);
  disableHoverTimer = self->_disableHoverTimer;
  uint64_t v4 = MEMORY[0x1E4F14428];
  id v5 = MEMORY[0x1E4F14428];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__SFTabHoverPreviewController__temporarilyDisableHover__block_invoke;
  v6[3] = &unk_1E54EC6E8;
  objc_copyWeak(&v7, &location);
  [(BSAbsoluteMachTimer *)disableHoverTimer scheduleWithFireInterval:v4 leewayInterval:v6 queue:0.5 handler:0.05];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __55__SFTabHoverPreviewController__temporarilyDisableHover__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [WeakRetained[10] setEnabled:1];
    id WeakRetained = v2;
  }
}

- (SFTabHoverPreviewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFTabHoverPreviewControllerDelegate *)WeakRetained;
}

- (UIHoverGestureRecognizer)hoverRecognizer
{
  return self->_hoverRecognizer;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hoverRecognizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_disableHoverTimer, 0);
  objc_storeStrong((id *)&self->_tabHoverPreviewShowTimer, 0);
  objc_storeStrong((id *)&self->_itemPendingPreview, 0);

  objc_storeStrong((id *)&self->_itemShowingPreview, 0);
}

@end