@interface PXDemoDynamicViewWidget
- (BOOL)hasContentForCurrentInput;
- (NSString)localizedTitle;
- (PXAnonymousView)contentView;
- (PXWidgetDelegate)widgetDelegate;
- (UIView)_view;
- (double)_preferredHeightPhase;
- (double)preferredContentHeightForWidth:(double)a3;
- (void)_heartBeatIncreaseHeightPhase:(BOOL)a3;
- (void)_loadView;
- (void)_setPreferredHeight:(double)a3;
- (void)_setPreferredHeightPhase:(double)a3;
- (void)setWidgetDelegate:(id)a3;
@end

@implementation PXDemoDynamicViewWidget

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__view, 0);
  objc_destroyWeak((id *)&self->_widgetDelegate);
}

- (void)_setPreferredHeight:(double)a3
{
  self->__preferredHeightPhase = a3;
}

- (double)_preferredHeightPhase
{
  return self->__preferredHeightPhase;
}

- (UIView)_view
{
  return self->__view;
}

- (void)setWidgetDelegate:(id)a3
{
}

- (PXWidgetDelegate)widgetDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_widgetDelegate);
  return (PXWidgetDelegate *)WeakRetained;
}

- (NSString)localizedTitle
{
  v2 = NSString;
  v3 = (void *)MEMORY[0x1E4F28C10];
  v4 = [MEMORY[0x1E4F1C9C8] date];
  v5 = [v3 localizedStringFromDate:v4 dateStyle:0 timeStyle:2];
  v6 = [v2 stringWithFormat:@"Dynamic (%@)", v5];

  return (NSString *)v6;
}

- (PXAnonymousView)contentView
{
  [(PXDemoDynamicViewWidget *)self _loadView];
  return (PXAnonymousView *)[(PXDemoDynamicViewWidget *)self _view];
}

- (double)preferredContentHeightForWidth:(double)a3
{
  return MEMORY[0x1AD10B020]([(PXDemoDynamicViewWidget *)self _preferredHeightPhase])
       * 100.0
       + 200.0;
}

- (BOOL)hasContentForCurrentInput
{
  v2 = +[PXPhotosDetailsSettings sharedInstance];
  char v3 = [v2 showDemoDynamicWidget];

  return v3;
}

- (void)_setPreferredHeightPhase:(double)a3
{
  if (self->__preferredHeightPhase != a3)
  {
    self->__preferredHeightPhase = a3;
    v4 = [(PXDemoDynamicViewWidget *)self widgetDelegate];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __52__PXDemoDynamicViewWidget__setPreferredHeightPhase___block_invoke;
    v6[3] = &unk_1E5DD32A8;
    id v7 = v4;
    v8 = self;
    id v5 = v4;
    [v5 widget:self animateChanges:v6 withAnimationOptions:0];
  }
}

uint64_t __52__PXDemoDynamicViewWidget__setPreferredHeightPhase___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) widgetPreferredContentHeightForWidthDidChange:*(void *)(a1 + 40)];
}

- (void)_heartBeatIncreaseHeightPhase:(BOOL)a3
{
  if (a3)
  {
    [(PXDemoDynamicViewWidget *)self _preferredHeightPhase];
    [(PXDemoDynamicViewWidget *)self _setPreferredHeightPhase:v4 + 1.0];
  }
  id v5 = [(PXDemoDynamicViewWidget *)self widgetDelegate];
  [v5 widgetLocalizedTitleDidChange:self];

  objc_initWeak(&location, self);
  dispatch_time_t v6 = dispatch_time(0, 1000000000);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__PXDemoDynamicViewWidget__heartBeatIncreaseHeightPhase___block_invoke;
  v7[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v8, &location);
  dispatch_after(v6, MEMORY[0x1E4F14428], v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __57__PXDemoDynamicViewWidget__heartBeatIncreaseHeightPhase___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _heartBeatIncreaseHeightPhase:1];
}

- (void)_loadView
{
  if (!self->__view)
  {
    char v3 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    view = self->__view;
    self->__view = v3;

    id v5 = self->__view;
    dispatch_time_t v6 = [MEMORY[0x1E4FB1618] orangeColor];
    [(UIView *)v5 setBackgroundColor:v6];

    [(PXDemoDynamicViewWidget *)self _heartBeatIncreaseHeightPhase:0];
  }
}

@end