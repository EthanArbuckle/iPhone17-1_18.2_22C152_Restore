@interface PKPaymentCameraCaptureViewController
- (BOOL)hideSetupLaterButton;
- (BOOL)showTapToProvisionButton;
- (BOOL)showTypeCardNumberButton;
- (PKPaymentCameraCaptureViewController)initWithProvisioningController:(id)a3 context:(int64_t)a4;
- (PKPaymentCameraCaptureViewControllerDelegate)flowItemDelegate;
- (PKProvisioningAnalyticsSessionUIReporter)reporter;
- (void)setFlowItemDelegate:(id)a3;
- (void)setHideSetupLaterButton:(BOOL)a3;
- (void)setReporter:(id)a3;
- (void)setShowTapToProvisionButton:(BOOL)a3;
- (void)setShowTypeCardNumberButton:(BOOL)a3;
@end

@implementation PKPaymentCameraCaptureViewController

uint64_t __71___PKPaymentCameraCaptureViewController_cameraReader_didFailWithError___block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = *(void **)(*(void *)(a1 + 32) + 1576);
  uint64_t v7 = *MEMORY[0x1E4F86058];
  v8[0] = *MEMORY[0x1E4F85DE0];
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [v3 reportError:v2 context:v4];

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1568));
  [WeakRetained cameraCaptureViewControllerDidFail:*(void *)(a1 + 32)];

  return [*(id *)(*(void *)(a1 + 32) + 1552) setButtonsEnabled:1];
}

void __60___PKPaymentCameraCaptureViewController_cameraReaderDidEnd___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) loadViewIfNeeded];
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = *(id *)(*(void *)(a1 + 32) + 1504);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v14 + 1) + 8 * v8) type];
        [v3 addObject:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  if ([v3 containsObject:*MEMORY[0x1E4F5CD08]])
  {
    v10 = &stru_1EF1B5B50;
  }
  else
  {
    v10 = [&stru_1EF1B5B50 stringByAppendingFormat:@"%@,", *MEMORY[0x1E4F85DC8]];
  }
  if (([v3 containsObject:*MEMORY[0x1E4F5CD18]] & 1) == 0)
  {
    uint64_t v11 = [(__CFString *)v10 stringByAppendingFormat:@"%@,", *MEMORY[0x1E4F85DD8]];

    v10 = (__CFString *)v11;
  }
  if (([v3 containsObject:*MEMORY[0x1E4F5CD10]] & 1) == 0)
  {
    uint64_t v12 = [(__CFString *)v10 stringByAppendingString:*MEMORY[0x1E4F85DD0]];

    v10 = (__CFString *)v12;
  }
  if ([(__CFString *)v10 length]) {
    [v2 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F86058]];
  }
  [*(id *)(*(void *)(a1 + 32) + 1576) reportPageCompleted:1 context:v2];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1568));
  [WeakRetained cameraCaptureViewController:*(void *)(a1 + 32) didRecognizeObjects:*(void *)(*(void *)(a1 + 32) + 1504)];

  [*(id *)(*(void *)(a1 + 32) + 1552) setButtonsEnabled:1];
  [*(id *)(a1 + 32) cancel];
}

uint64_t __74___PKPaymentCameraCaptureViewController_cameraReader_didRecognizeObjects___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  if (*(void **)(v3 + 1504) != v2)
  {
    objc_storeStrong((id *)(v3 + 1504), v2);
    uint64_t v3 = *(void *)(a1 + 32);
  }
  id v4 = *(void **)(v3 + 1552);

  return [v4 setButtonsEnabled:0];
}

- (PKPaymentCameraCaptureViewController)initWithProvisioningController:(id)a3 context:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [[_PKPaymentCameraCaptureViewController alloc] initWithProvisioningController:v6 context:a4];

  return (PKPaymentCameraCaptureViewController *)v7;
}

- (BOOL)hideSetupLaterButton
{
  return self->_hideSetupLaterButton;
}

- (void)setHideSetupLaterButton:(BOOL)a3
{
  self->_hideSetupLaterButton = a3;
}

- (BOOL)showTapToProvisionButton
{
  return self->_showTapToProvisionButton;
}

- (void)setShowTapToProvisionButton:(BOOL)a3
{
  self->_showTapToProvisionButton = a3;
}

- (BOOL)showTypeCardNumberButton
{
  return self->_showTypeCardNumberButton;
}

- (void)setShowTypeCardNumberButton:(BOOL)a3
{
  self->_showTypeCardNumberButton = a3;
}

- (PKPaymentCameraCaptureViewControllerDelegate)flowItemDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowItemDelegate);

  return (PKPaymentCameraCaptureViewControllerDelegate *)WeakRetained;
}

- (void)setFlowItemDelegate:(id)a3
{
}

- (PKProvisioningAnalyticsSessionUIReporter)reporter
{
  return self->_reporter;
}

- (void)setReporter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reporter, 0);

  objc_destroyWeak((id *)&self->_flowItemDelegate);
}

@end