@interface SKUIReviewInAppController
- (BOOL)composeReviewViewController:(id)a3 shouldSubmitReview:(id)a4;
- (SKUIComposeReviewViewController)composeViewController;
- (SKUIProductReviewURLProvider)reviewURLProvider;
- (SKUIReviewInAppConfiguration)configuration;
- (SKUIReviewInAppController)init;
- (SKUIReviewInAppController)initWithConfiguration:(id)a3;
- (SKUIReviewInAppRatingViewController)ratingViewController;
- (SKUIStarRatingQueue)starRatingQueue;
- (SKUIStoreDialogController)dialogController;
- (id)completion;
- (void)_composeReviewViewControllerDidFinish:(id)a3 result:(unint64_t)a4;
- (void)_finishWithResult:(unint64_t)a3 error:(id)a4;
- (void)_presentAlertForDialog:(id)a3;
- (void)_presentRatingPrompt;
- (void)_presentReviewComposer;
- (void)_presentWriteReview;
- (void)_promptForStarRatingDuringCompose:(id)a3;
- (void)_submitRating:(int64_t)a3 completion:(id)a4;
- (void)composeReviewViewController:(id)a3 didFailWithDialog:(id)a4;
- (void)composeReviewViewController:(id)a3 presentDialog:(id)a4;
- (void)composeReviewViewControllerDidCancel:(id)a3;
- (void)composeReviewViewControllerDidSubmit:(id)a3;
- (void)presentReviewComposerRedesign:(id)a3 appID:(id)a4 completion:(id)a5;
- (void)setCompletion:(id)a3;
- (void)setComposeViewController:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDialogController:(id)a3;
- (void)setRatingViewController:(id)a3;
- (void)setReviewURLProvider:(id)a3;
- (void)setStarRatingQueue:(id)a3;
- (void)start;
@end

@implementation SKUIReviewInAppController

- (SKUIReviewInAppController)init
{
  v3 = objc_alloc_init(SKUIReviewInAppConfiguration);
  v4 = [(SKUIReviewInAppController *)self initWithConfiguration:v3];

  return v4;
}

- (SKUIReviewInAppController)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKUIReviewInAppController;
  v6 = [(SKUIReviewInAppController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_configuration, a3);
  }

  return v7;
}

- (void)start
{
  objc_initWeak(&location, self);
  v3 = [SKUIProductReviewURLProvider alloc];
  v4 = [(SKUIReviewInAppController *)self configuration];
  id v5 = [v4 clientContext];
  v6 = [(SKUIReviewInAppController *)self configuration];
  v7 = [v6 itemID];
  v8 = [(SKUIProductReviewURLProvider *)v3 initWithClientContext:v5 itemID:v7];
  [(SKUIReviewInAppController *)self setReviewURLProvider:v8];

  objc_super v9 = [(SKUIReviewInAppController *)self reviewURLProvider];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __34__SKUIReviewInAppController_start__block_invoke;
  v10[3] = &unk_1E6428518;
  objc_copyWeak(&v11, &location);
  [v9 fetchURLsWithCompletion:v10];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __34__SKUIReviewInAppController_start__block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__SKUIReviewInAppController_start__block_invoke_2;
  v4[3] = &unk_1E6427D08;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  char v6 = a3;
  dispatch_async(MEMORY[0x1E4F14428], v4);
  objc_destroyWeak(&v5);
}

void __34__SKUIReviewInAppController_start__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (*(unsigned char *)(a1 + 40)) {
    [WeakRetained _presentRatingPrompt];
  }
  else {
    [WeakRetained _finishWithResult:0 error:0];
  }
}

- (void)composeReviewViewController:(id)a3 didFailWithDialog:(id)a4
{
}

- (void)composeReviewViewController:(id)a3 presentDialog:(id)a4
{
}

- (BOOL)composeReviewViewController:(id)a3 shouldSubmitReview:(id)a4
{
  id v6 = a3;
  [a4 rating];
  float v8 = v7;
  if (v7 < 0.00000011921) {
    [(SKUIReviewInAppController *)self _promptForStarRatingDuringCompose:v6];
  }

  return v8 >= 0.00000011921;
}

- (void)composeReviewViewControllerDidCancel:(id)a3
{
}

- (void)composeReviewViewControllerDidSubmit:(id)a3
{
}

- (void)_composeReviewViewControllerDidFinish:(id)a3 result:(unint64_t)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__SKUIReviewInAppController__composeReviewViewControllerDidFinish_result___block_invoke;
  v8[3] = &unk_1E64250B0;
  objc_copyWeak(v9, &location);
  v9[1] = (id)a4;
  [v6 dismissViewControllerAnimated:1 completion:v8];
  composeViewController = self->_composeViewController;
  self->_composeViewController = 0;

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

void __74__SKUIReviewInAppController__composeReviewViewControllerDidFinish_result___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _finishWithResult:*(void *)(a1 + 40) error:0];
}

- (void)_finishWithResult:(unint64_t)a3 error:(id)a4
{
  id v8 = a4;
  id v6 = [(SKUIReviewInAppController *)self completion];

  if (v6)
  {
    float v7 = [(SKUIReviewInAppController *)self completion];
    ((void (**)(void, unint64_t, id))v7)[2](v7, a3, v8);
  }
}

- (void)_presentRatingPrompt
{
  id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v4 = NSString;
  id v5 = [v3 localizedStringForKey:@"IN_APP_REVIEW_RATE_TITLE" value:&stru_1F1C879E8 table:0];
  id v6 = [(SKUIReviewInAppController *)self configuration];
  float v7 = [v6 title];
  v29 = objc_msgSend(v4, "stringWithFormat:", v5, v7);

  id v8 = [v3 localizedStringForKey:@"IN_APP_REVIEW_RATE_MESSAGE" value:&stru_1F1C879E8 table:0];
  objc_super v9 = [(SKUIReviewInAppController *)self configuration];
  v10 = [v9 customDescription];
  v27 = v8;
  if (v10)
  {
    id v11 = NSString;
    v12 = [(SKUIReviewInAppController *)self configuration];
    v13 = [v12 customDescription];
    id v28 = [v11 stringWithFormat:@"%@\n%@", v13, v8, v8];
  }
  else
  {
    id v28 = v8;
  }

  v14 = [(SKUIReviewInAppController *)self configuration];
  v15 = [v14 icon];

  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__SKUIReviewInAppController__presentRatingPrompt__block_invoke;
  aBlock[3] = &unk_1E6428540;
  objc_copyWeak(&v33, &location);
  v16 = _Block_copy(aBlock);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __49__SKUIReviewInAppController__presentRatingPrompt__block_invoke_2;
  v30[3] = &unk_1E6428568;
  objc_copyWeak(&v31, &location);
  v17 = _Block_copy(v30);
  v18 = [[SKUIReviewInAppRatingViewController alloc] initWithTitle:v29 message:v28 icon:v15];
  [(SKUIReviewInAppController *)self setRatingViewController:v18];

  v19 = [(SKUIReviewInAppController *)self configuration];
  uint64_t v20 = [v19 isSandboxed];
  v21 = [(SKUIReviewInAppController *)self ratingViewController];
  [v21 setDisableSubmit:v20];

  v22 = [(SKUIReviewInAppController *)self ratingViewController];
  [v22 setRatingHandler:v16];

  v23 = [(SKUIReviewInAppController *)self ratingViewController];
  [v23 setCompletion:v17];

  v24 = [(SKUIReviewInAppController *)self configuration];
  v25 = [v24 viewController];
  v26 = [(SKUIReviewInAppController *)self ratingViewController];
  [v25 presentViewController:v26 animated:1 completion:0];

  objc_destroyWeak(&v31);
  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);
}

void __49__SKUIReviewInAppController__presentRatingPrompt__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _submitRating:a2 completion:v5];
}

void __49__SKUIReviewInAppController__presentRatingPrompt__block_invoke_2(uint64_t a1, uint64_t a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  switch(a2)
  {
    case 0:
      id v5 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v9 = *MEMORY[0x1E4F28568];
      v10[0] = @"An error occurred while submitting an in app rating.";
      id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
      float v7 = [v5 errorWithDomain:0x1F1C99E48 code:0 userInfo:v6];

      [v4 _finishWithResult:0 error:v7];
      break;
    case 1:
      uint64_t v8 = 1;
      goto LABEL_5;
    case 2:
      uint64_t v8 = 2;
LABEL_5:
      [WeakRetained _finishWithResult:v8 error:0];
      break;
    case 3:
      [WeakRetained _presentReviewComposer];
      break;
    default:
      break;
  }
}

- (void)_presentReviewComposer
{
  objc_initWeak(&location, self);
  id v3 = [(SKUIReviewInAppConfiguration *)self->_configuration viewController];
  v4 = [(SKUIReviewInAppConfiguration *)self->_configuration itemID];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__SKUIReviewInAppController__presentReviewComposer__block_invoke;
  v5[3] = &unk_1E6428590;
  objc_copyWeak(&v6, &location);
  [(SKUIReviewInAppController *)self presentReviewComposerRedesign:v3 appID:v4 completion:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __51__SKUIReviewInAppController__presentReviewComposer__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _finishWithResult:a2 error:v5];
}

- (void)_submitRating:(int64_t)a3 completion:(id)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  float v7 = [(SKUIReviewInAppController *)self starRatingQueue];

  if (!v7)
  {
    uint64_t v8 = [SKUIReviewConfiguration alloc];
    v29 = @"inlineRatingUrl";
    uint64_t v9 = [(SKUIReviewInAppController *)self reviewURLProvider];
    v10 = [v9 rateURL];
    id v11 = [v10 absoluteString];
    v30[0] = v11;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
    v13 = [(SKUIReviewConfiguration *)v8 initWithConfigurationDictionary:v12];

    v14 = [SKUIStarRatingQueue alloc];
    v15 = [(SKUIReviewInAppController *)self configuration];
    v16 = [v15 clientContext];
    v17 = [(SKUIStarRatingQueue *)v14 initWithClientContext:v16 reviewConfiguration:v13];
    [(SKUIReviewInAppController *)self setStarRatingQueue:v17];

    v18 = [(SKUIReviewInAppController *)self configuration];
    v19 = [v18 viewController];
    uint64_t v20 = [v19 view];
    v21 = [v20 window];
    v22 = [(SKUIReviewInAppController *)self starRatingQueue];
    [v22 setWindow:v21];
  }
  v23 = [(SKUIReviewInAppController *)self starRatingQueue];
  v24 = [(SKUIReviewInAppController *)self configuration];
  v25 = [v24 itemID];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __54__SKUIReviewInAppController__submitRating_completion___block_invoke;
  v27[3] = &unk_1E64285B8;
  id v28 = v6;
  id v26 = v6;
  [v23 setRating:a3 forItemID:v25 completionBlock:v27];
}

void __54__SKUIReviewInAppController__submitRating_completion___block_invoke(uint64_t a1, char a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54__SKUIReviewInAppController__submitRating_completion___block_invoke_2;
  v3[3] = &unk_1E64254E0;
  id v4 = *(id *)(a1 + 32);
  char v5 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

uint64_t __54__SKUIReviewInAppController__submitRating_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  }
  return result;
}

- (void)_presentWriteReview
{
  p_composeViewController = &self->_composeViewController;
  if (!self->_composeViewController)
  {
    id v4 = objc_alloc_init(SKUIComposeReviewViewController);
    [(SKUIComposeReviewViewController *)v4 setDelegate:self];
    objc_storeStrong((id *)p_composeViewController, v4);
    objc_initWeak(&location, self);
    char v5 = [(SKUIReviewInAppController *)self reviewURLProvider];
    id v6 = [v5 writeReviewURL];
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    id v11 = __48__SKUIReviewInAppController__presentWriteReview__block_invoke;
    v12 = &unk_1E6424270;
    objc_copyWeak(&v13, &location);
    [(SKUIComposeReviewViewController *)v4 loadReviewWithURL:v6 completionBlock:&v9];

    float v7 = [(SKUIReviewInAppController *)self configuration];
    uint64_t v8 = [v7 viewController];
    [v8 presentViewController:v4 animated:1 completion:0];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __48__SKUIReviewInAppController__presentWriteReview__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if ((a2 & 1) == 0) {
    [WeakRetained _finishWithResult:0 error:v7];
  }
}

- (void)_presentAlertForDialog:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v10 = v4;
    dialogController = self->_dialogController;
    if (!dialogController)
    {
      id v6 = objc_alloc_init(SKUIStoreDialogController);
      id v7 = self->_dialogController;
      self->_dialogController = v6;

      dialogController = self->_dialogController;
    }
    uint64_t v8 = [(SKUIReviewInAppController *)self configuration];
    uint64_t v9 = [v8 viewController];
    [(SKUIStoreDialogController *)dialogController presentDialog:v10 fromViewController:v9];

    id v4 = v10;
  }
}

- (void)_promptForStarRatingDuringCompose:(id)a3
{
  id v3 = a3;
  objc_initWeak(&location, v3);
  id v4 = [MEMORY[0x1E4F3C2F0] starRatingAlertController];
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  id v7 = __63__SKUIReviewInAppController__promptForStarRatingDuringCompose___block_invoke;
  uint64_t v8 = &unk_1E64285E0;
  objc_copyWeak(&v9, &location);
  [v4 setCompletion:&v5];
  objc_msgSend(v3, "presentViewController:animated:completion:", v4, 1, 0, v5, v6, v7, v8);
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

void __63__SKUIReviewInAppController__promptForStarRatingDuringCompose___block_invoke(uint64_t a1, int a2, float a3)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    *(float *)&double v4 = a3;
    [WeakRetained setRating:v4];
    [WeakRetained submitReview];
  }
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (SKUIReviewInAppConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (SKUIReviewInAppRatingViewController)ratingViewController
{
  return self->_ratingViewController;
}

- (void)setRatingViewController:(id)a3
{
}

- (SKUIComposeReviewViewController)composeViewController
{
  return self->_composeViewController;
}

- (void)setComposeViewController:(id)a3
{
}

- (SKUIStoreDialogController)dialogController
{
  return self->_dialogController;
}

- (void)setDialogController:(id)a3
{
}

- (SKUIProductReviewURLProvider)reviewURLProvider
{
  return self->_reviewURLProvider;
}

- (void)setReviewURLProvider:(id)a3
{
}

- (SKUIStarRatingQueue)starRatingQueue
{
  return self->_starRatingQueue;
}

- (void)setStarRatingQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_starRatingQueue, 0);
  objc_storeStrong((id *)&self->_reviewURLProvider, 0);
  objc_storeStrong((id *)&self->_dialogController, 0);
  objc_storeStrong((id *)&self->_composeViewController, 0);
  objc_storeStrong((id *)&self->_ratingViewController, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong(&self->_completion, 0);
}

- (void)presentReviewComposerRedesign:(id)a3 appID:(id)a4 completion:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  if (a4)
  {
    uint64_t v9 = sub_1C1C9A488();
    a4 = v10;
  }
  else
  {
    uint64_t v9 = 0;
  }
  _Block_copy(v8);
  id v11 = a3;
  v12 = self;
  sub_1C1C5451C(a3, v9, (uint64_t)a4, v12, (void (**)(void, void, void))v8);
  _Block_release(v8);

  swift_bridgeObjectRelease();
}

@end