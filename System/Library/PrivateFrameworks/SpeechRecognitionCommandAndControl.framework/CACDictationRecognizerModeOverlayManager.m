@interface CACDictationRecognizerModeOverlayManager
- (BOOL)isOverlay;
- (CACDictationRecognizerModeOverlayManagerDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)showOverlayForDictiationRecognizerMode;
@end

@implementation CACDictationRecognizerModeOverlayManager

- (void)showOverlayForDictiationRecognizerMode
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __82__CACDictationRecognizerModeOverlayManager_showOverlayForDictiationRecognizerMode__block_invoke_2;
  v2[3] = &unk_264D11918;
  v2[4] = self;
  [(CACSimpleContentViewManager *)self showViewControllerWithCreationHandler:&__block_literal_global_1 updateHandler:v2];
}

CACDictationRecognizerModeOverlayViewController *__82__CACDictationRecognizerModeOverlayManager_showOverlayForDictiationRecognizerMode__block_invoke()
{
  v0 = objc_alloc_init(CACDictationRecognizerModeOverlayViewController);
  return v0;
}

void __82__CACDictationRecognizerModeOverlayManager_showOverlayForDictiationRecognizerMode__block_invoke_2(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 delegate];
  objc_msgSend(v4, "setDictationRecognizerMode:", objc_msgSend(v5, "modeForDictationRecognizerModeOverlayManager:", *(void *)(a1 + 32)));

  id v6 = [*(id *)(a1 + 32) delegate];
  [v6 imageRectForDictationRecognizerModeOverlayManager:*(void *)(a1 + 32)];
  objc_msgSend(v4, "setImageRect:");
}

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

- (BOOL)isOverlay
{
  return 1;
}

- (CACDictationRecognizerModeOverlayManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CACDictationRecognizerModeOverlayManagerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end