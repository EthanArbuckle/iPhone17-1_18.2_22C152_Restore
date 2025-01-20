@interface CACDisambiguationPresentationManager
- (BOOL)isOverlay;
- (void)dialDiambiguationPresentationViewController:(id)a3 hideWithCompletion:(id)a4;
- (void)showWithDisambiguationItems:(id)a3;
- (void)showWithDisambiguationItems:(id)a3 alertTitle:(id)a4;
- (void)showWithDisambiguationItems:(id)a3 alertTitle:(id)a4 alertMessage:(id)a5;
@end

@implementation CACDisambiguationPresentationManager

- (void)showWithDisambiguationItems:(id)a3
{
}

- (void)showWithDisambiguationItems:(id)a3 alertTitle:(id)a4
{
}

- (void)showWithDisambiguationItems:(id)a3 alertTitle:(id)a4 alertMessage:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __92__CACDisambiguationPresentationManager_showWithDisambiguationItems_alertTitle_alertMessage___block_invoke;
  v14[3] = &unk_264D11A18;
  v14[4] = self;
  id v15 = v9;
  id v16 = v10;
  id v17 = v8;
  id v11 = v8;
  id v12 = v10;
  id v13 = v9;
  dispatch_async(MEMORY[0x263EF83A0], v14);
}

void __92__CACDisambiguationPresentationManager_showWithDisambiguationItems_alertTitle_alertMessage___block_invoke(uint64_t a1)
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __92__CACDisambiguationPresentationManager_showWithDisambiguationItems_alertTitle_alertMessage___block_invoke_2;
  v7[3] = &unk_264D119C8;
  v2 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v4;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __92__CACDisambiguationPresentationManager_showWithDisambiguationItems_alertTitle_alertMessage___block_invoke_3;
  v5[3] = &unk_264D119F0;
  id v6 = *(id *)(a1 + 56);
  [v2 showViewControllerWithCreationHandler:v7 updateHandler:v5];
}

CACDisambiguationPresentationViewController *__92__CACDisambiguationPresentationManager_showWithDisambiguationItems_alertTitle_alertMessage___block_invoke_2(void *a1)
{
  v2 = [[CACDisambiguationPresentationViewController alloc] initWithTitle:a1[4] message:a1[5]];
  [(CACDisambiguationPresentationViewController *)v2 setContactDisambiguationDelegate:a1[6]];
  return v2;
}

uint64_t __92__CACDisambiguationPresentationManager_showWithDisambiguationItems_alertTitle_alertMessage___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setDisambiguationItems:*(void *)(a1 + 32)];
}

- (BOOL)isOverlay
{
  return 0;
}

- (void)dialDiambiguationPresentationViewController:(id)a3 hideWithCompletion:(id)a4
{
}

@end