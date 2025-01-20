@interface CACElementNamesOverlayManager
- (BOOL)isOverlay;
- (CACElementNamesOverlayManagerDelegate)delegate;
- (id)voiceOverDescriptions;
- (void)hide;
- (void)hideWithoutAnimation;
- (void)setDelegate:(id)a3;
- (void)showNamesForElements:(id)a3;
- (void)startDelayedDimmingOfNumbers;
- (void)stopDelayedDimmingOfNumbers;
@end

@implementation CACElementNamesOverlayManager

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    [(CACSimpleContentViewManager *)self setContentViewManagerDelegate:obj];
  }
}

- (void)showNamesForElements:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __54__CACElementNamesOverlayManager_showNamesForElements___block_invoke_2;
  v6[3] = &unk_264D12D08;
  id v7 = v4;
  id v5 = v4;
  [(CACSimpleContentViewManager *)self showViewControllerWithCreationHandler:&__block_literal_global_46 updateHandler:v6];
}

CACElementNamesOverlayViewController *__54__CACElementNamesOverlayManager_showNamesForElements___block_invoke()
{
  v0 = objc_alloc_init(CACElementNamesOverlayViewController);
  return v0;
}

uint64_t __54__CACElementNamesOverlayManager_showNamesForElements___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setItems:*(void *)(a1 + 32)];
}

- (id)voiceOverDescriptions
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(CACSimpleContentViewManager *)v2 viewController];
  id v4 = [v3 items];
  id v5 = (void *)[v4 copy];

  objc_sync_exit(v2);
  v6 = +[CACVoiceOverShortDescriptionGenerator sharedInstance];
  id v7 = [v6 shortDescriptionsForItems:v5 style:1];

  return v7;
}

- (BOOL)isOverlay
{
  return 1;
}

- (void)hide
{
  v2.receiver = self;
  v2.super_class = (Class)CACElementNamesOverlayManager;
  [(CACSimpleContentViewManager *)&v2 hide];
}

- (void)hideWithoutAnimation
{
  v2.receiver = self;
  v2.super_class = (Class)CACElementNamesOverlayManager;
  [(CACSimpleContentViewManager *)&v2 hideWithoutAnimation];
}

- (void)startDelayedDimmingOfNumbers
{
  [(CACSimpleContentViewManager *)self setPendingDimmingTransactionID:[(CACSimpleContentViewManager *)self pendingDimmingTransactionID] + 1];
  [(CACSimpleContentViewManager *)self setActiveDimmingTransactionID:[(CACSimpleContentViewManager *)self pendingDimmingTransactionID]];
  v3 = [(CACSimpleContentViewManager *)self viewController];
  id v4 = [v3 view];
  [v4 setAlpha:1.0];

  id v10 = [(CACElementNamesOverlayManager *)self delegate];
  if ([v10 isOverlayFadingEnabledForElementNamesOverlayManager:self])
  {
    id v5 = [(CACElementNamesOverlayManager *)self delegate];
    int v6 = [v5 isAlwaysShowingElementNamesOverlayManager:self];

    if (v6)
    {
      id v7 = [(CACElementNamesOverlayManager *)self delegate];
      [v7 overlayFadeDelayForElementNamesOverlayManager:self];
      dispatch_time_t v9 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __61__CACElementNamesOverlayManager_startDelayedDimmingOfNumbers__block_invoke;
      block[3] = &unk_264D115D0;
      block[4] = self;
      dispatch_after(v9, MEMORY[0x263EF83A0], block);
    }
  }
  else
  {
  }
}

uint64_t __61__CACElementNamesOverlayManager_startDelayedDimmingOfNumbers__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) activeDimmingTransactionID];
  uint64_t result = [*(id *)(a1 + 32) pendingDimmingTransactionID];
  if (v2 == result)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __61__CACElementNamesOverlayManager_startDelayedDimmingOfNumbers__block_invoke_2;
    v4[3] = &unk_264D115D0;
    v4[4] = *(void *)(a1 + 32);
    return [MEMORY[0x263F82E00] animateWithDuration:v4 animations:0 completion:1.0];
  }
  return result;
}

void __61__CACElementNamesOverlayManager_startDelayedDimmingOfNumbers__block_invoke_2(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) delegate];
  [v6 overlayFadeOpacityForElementNamesOverlayManager:*(void *)(a1 + 32)];
  double v3 = v2;
  id v4 = [*(id *)(a1 + 32) viewController];
  id v5 = [v4 view];
  [v5 setAlpha:v3];
}

- (void)stopDelayedDimmingOfNumbers
{
  [(CACSimpleContentViewManager *)self setPendingDimmingTransactionID:[(CACSimpleContentViewManager *)self pendingDimmingTransactionID] + 1];
  id v4 = [(CACSimpleContentViewManager *)self viewController];
  double v3 = [v4 view];
  [v3 setAlpha:1.0];
}

- (CACElementNamesOverlayManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CACElementNamesOverlayManagerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end