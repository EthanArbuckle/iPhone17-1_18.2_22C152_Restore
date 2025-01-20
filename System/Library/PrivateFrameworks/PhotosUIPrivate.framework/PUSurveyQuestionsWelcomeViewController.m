@interface PUSurveyQuestionsWelcomeViewController
+ (void)presentIfNecessaryFromViewController:(id)a3 presentationHandler:(id)a4 completionHandler:(id)a5;
+ (void)resetLastPresentationInfo;
- (PUSurveyQuestionsWelcomeViewController)initWithCompletionHandler:(id)a3;
- (id)_completionHandler;
- (void)_handleContinueButton:(id)a3;
- (void)_setCompletionHandler:(id)a3;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
@end

@implementation PUSurveyQuestionsWelcomeViewController

- (void).cxx_destruct
{
}

- (void)_setCompletionHandler:(id)a3
{
}

- (id)_completionHandler
{
  return self->__completionHandler;
}

- (void)_handleContinueButton:(id)a3
{
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __83__PUSurveyQuestionsWelcomeViewController_dismissViewControllerAnimated_completion___block_invoke;
  v9[3] = &unk_1E5F2EA60;
  v9[4] = self;
  id v10 = v6;
  v8.receiver = self;
  v8.super_class = (Class)PUSurveyQuestionsWelcomeViewController;
  id v7 = v6;
  [(PUSurveyQuestionsWelcomeViewController *)&v8 dismissViewControllerAnimated:v4 completion:v9];
}

void __83__PUSurveyQuestionsWelcomeViewController_dismissViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v2 setInteger:1 forKey:@"LastSurveyQuestionsWelcomeShown"];

  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  BOOL v4 = [*(id *)(a1 + 32) _completionHandler];

  if (v4)
  {
    v5 = [*(id *)(a1 + 32) _completionHandler];
    v5[2](v5, 1);

    id v6 = *(void **)(a1 + 32);
    [v6 _setCompletionHandler:0];
  }
}

- (PUSurveyQuestionsWelcomeViewController)initWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = PXLocalizedString();
  id v6 = PXLocalizedString();
  id v7 = objc_msgSend(MEMORY[0x1E4FB1818], "px_imageNamed:", @"Photos_GettingStarted");
  v15.receiver = self;
  v15.super_class = (Class)PUSurveyQuestionsWelcomeViewController;
  objc_super v8 = [(PUSurveyQuestionsWelcomeViewController *)&v15 initWithTitle:v5 detailText:v6 icon:v7];
  if (v8)
  {
    v9 = [MEMORY[0x1E4F83A80] boldButton];
    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v10 = PULocalizedString(@"WHATS_NEW_WELCOME_CONTINUE");
    [v9 setTitle:v10 forState:0];

    [v9 addTarget:v8 action:sel__handleContinueButton_ forControlEvents:0x2000];
    v11 = [(PUSurveyQuestionsWelcomeViewController *)v8 buttonTray];
    [v11 addButton:v9];

    v12 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:@"\r" modifierFlags:0 action:sel__handleContinueButton_];
    [(PUSurveyQuestionsWelcomeViewController *)v8 addKeyCommand:v12];

    [(PUSurveyQuestionsWelcomeViewController *)v8 setModalPresentationStyle:2];
    v13 = (void *)[v4 copy];
    [(PUSurveyQuestionsWelcomeViewController *)v8 _setCompletionHandler:v13];
  }
  return v8;
}

+ (void)resetLastPresentationInfo
{
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v2 removeObjectForKey:@"LastSurveyQuestionsWelcomeShown"];
}

+ (void)presentIfNecessaryFromViewController:(id)a3 presentationHandler:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __117__PUSurveyQuestionsWelcomeViewController_presentIfNecessaryFromViewController_presentationHandler_completionHandler___block_invoke;
  block[3] = &unk_1E5F2E958;
  id v15 = v7;
  id v16 = v9;
  id v17 = v8;
  id v11 = v8;
  id v12 = v7;
  id v13 = v9;
  dispatch_async(v10, block);
}

void __117__PUSurveyQuestionsWelcomeViewController_presentIfNecessaryFromViewController_presentationHandler_completionHandler___block_invoke(id *a1)
{
  id v2 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  uint64_t v3 = [v2 librarySpecificFetchOptions];

  [v3 setShouldPrefetchCount:1];
  id v4 = [MEMORY[0x1E4F39250] fetchUnansweredQuestionsWithOptions:v3 validQuestionsOnly:0];
  uint64_t v5 = [v4 count];

  if (v5
    && ([MEMORY[0x1E4F1CB18] standardUserDefaults],
        id v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 integerForKey:@"LastSurveyQuestionsWelcomeShown"],
        v6,
        v7 <= 0))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __117__PUSurveyQuestionsWelcomeViewController_presentIfNecessaryFromViewController_presentationHandler_completionHandler___block_invoke_2;
    block[3] = &unk_1E5F2E958;
    id v10 = a1[5];
    id v9 = a1[4];
    id v11 = a1[6];
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    (*((void (**)(void))a1[5] + 2))();
  }
}

void __117__PUSurveyQuestionsWelcomeViewController_presentIfNecessaryFromViewController_presentationHandler_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [[PUSurveyQuestionsWelcomeViewController alloc] initWithCompletionHandler:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) presentViewController:v2 animated:1 completion:0];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

@end