@interface PXSurveyQuestionsHorizontalGadget
- (BOOL)selectionFollowsFocus;
- (PXExpectation)nextViewLayoutExpectation;
- (PXProgrammaticNavigationDestination)px_navigationDestination;
- (id)accessoryButtonTitle;
- (id)alertControllerForHideAction;
- (id)alertControllerForInfoAction;
- (id)nextExistingParticipantOnRouteToDestination:(id)a3;
- (unint64_t)accessoryButtonType;
- (unint64_t)routingOptionsForDestination:(id)a3;
- (void)_checkCanNavigate:(BOOL *)a3 toDestination:(id)a4 iterator:(id)a5;
- (void)_hideSurveyQuestionsUntilDate:(id)a3;
- (void)_sendRequestConsentFormMail;
- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5;
- (void)navigateToDestination:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setNextViewLayoutExpectation:(id)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation PXSurveyQuestionsHorizontalGadget

- (void).cxx_destruct
{
}

- (void)setNextViewLayoutExpectation:(id)a3
{
}

- (PXExpectation)nextViewLayoutExpectation
{
  return self->_nextViewLayoutExpectation;
}

- (id)nextExistingParticipantOnRouteToDestination:(id)a3
{
  return 0;
}

- (PXProgrammaticNavigationDestination)px_navigationDestination
{
  return 0;
}

- (void)_checkCanNavigate:(BOOL *)a3 toDestination:(id)a4 iterator:(id)a5
{
  id v7 = a5;
  BOOL v8 = [(UIViewController *)self px_isVisible];
  *a3 = v8;
  if (v8)
  {
    [v7 stop];
  }
  else
  {
    v9 = [[PXExpectation alloc] initWithLabelFormat:@"%@'s next view layout", self];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __78__PXSurveyQuestionsHorizontalGadget__checkCanNavigate_toDestination_iterator___block_invoke;
    v10[3] = &unk_1E5DD3158;
    id v11 = v7;
    [(PXExpectation *)v9 performWhenFulfilled:v10 timeout:3.0];
    [(PXSurveyQuestionsHorizontalGadget *)self setNextViewLayoutExpectation:v9];
  }
}

uint64_t __78__PXSurveyQuestionsHorizontalGadget__checkCanNavigate_toDestination_iterator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) next];
}

- (void)navigateToDestination:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v9 = [(PXHorizontalCollectionGadget *)self horizontalGadgetDelegate];
  uint64_t v10 = [v9 radarConfigurationForHorizontalCollectionGadget:self];

  id v11 = [[PXSurveyRadarReporterViewController alloc] initWithConfiguration:v10 completionHandler:0];
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  char v16 = 0;
  objc_initWeak(&location, self);
  v12[1] = (id)MEMORY[0x1E4F143A8];
  v12[2] = (id)3221225472;
  v12[3] = __85__PXSurveyQuestionsHorizontalGadget_navigateToDestination_options_completionHandler___block_invoke;
  v12[4] = &unk_1E5DC6398;
  objc_copyWeak(&v13, &location);
  v12[6] = v15;
  v12[5] = v7;
  v8;
  objc_copyWeak(v12, &location);
  v11;
  PXIterateAsynchronously();
}

void __85__PXSurveyQuestionsHorizontalGadget_navigateToDestination_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _checkCanNavigate:*(void *)(*(void *)(a1 + 40) + 8) + 24 toDestination:*(void *)(a1 + 32) iterator:v4];
}

uint64_t __85__PXSurveyQuestionsHorizontalGadget_navigateToDestination_options_completionHandler___block_invoke_2(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained presentViewController:*(void *)(a1 + 32) animated:1 completion:0];

  v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

- (unint64_t)routingOptionsForDestination:(id)a3
{
  return 1;
}

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
}

- (void)_sendRequestConsentFormMail
{
  if ([getMFMailComposeViewControllerClass_213353() canSendMail])
  {
    id v5 = objc_alloc_init((Class)getMFMailComposeViewControllerClass_213353());
    [v5 setMailComposeDelegate:self];
    [v5 setSubject:@"Photos Challenge Informed Consent Agreement Request"];
    [v5 setToRecipients:&unk_1F02D4E70];
    [v5 setMessageBody:@"Photos Challenge Informed Consent Agreement Request" isHTML:0];
    [(PXSurveyQuestionsHorizontalGadget *)self presentViewController:v5 animated:1 completion:0];
  }
  else
  {
    v3 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"Unable to create email" message:@"You need to set up an account in Mail in order submit your request to obtain your agreed to informed consent form." preferredStyle:1];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __64__PXSurveyQuestionsHorizontalGadget__sendRequestConsentFormMail__block_invoke;
    v6[3] = &unk_1E5DD0030;
    v6[4] = self;
    id v4 = [MEMORY[0x1E4FB1410] actionWithTitle:@"OK" style:1 handler:v6];
    [v3 addAction:v4];
    [(PXSurveyQuestionsHorizontalGadget *)self presentViewController:v3 animated:1 completion:0];
  }
}

uint64_t __64__PXSurveyQuestionsHorizontalGadget__sendRequestConsentFormMail__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

- (void)_hideSurveyQuestionsUntilDate:(id)a3
{
  id v4 = a3;
  id v5 = [(PXHorizontalCollectionGadget *)self horizontalGadgetDelegate];
  [v5 horizontalCollectionGadget:self hideUntilDate:v4];
}

- (id)alertControllerForInfoAction
{
  char IsAppleInternal = PXSurveyQuestionIsAppleInternal();
  id v4 = [(PXHorizontalCollectionGadget *)self horizontalGadgetDelegate];
  id v5 = [v4 infoAlertTitleForHorizontalCollectionGadget:self];

  if (IsAppleInternal)
  {
    v6 = [(PXHorizontalCollectionGadget *)self horizontalGadgetDelegate];
    id v7 = [v6 infoAlertMessageForHorizontalCollectionGadget:self];

    id v8 = @"PXInternalPhotosChallengeInfoDonateDataButton";
  }
  else
  {
    id v7 = PXLocalizedStringFromTable(@"SURVEY_QUESTIONS_PHOTOS_WELCOME_BODY_PROFILE", @"PhotosUICore");
    id v8 = @"PXInternalPhotosChallengeInfoRequestConsentFormButton";
  }
  v9 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v5 message:v7 preferredStyle:0];
  uint64_t v10 = (void *)MEMORY[0x1E4FB1410];
  id v11 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeInfoCloseButton", @"PhotosUICore");
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __65__PXSurveyQuestionsHorizontalGadget_alertControllerForInfoAction__block_invoke;
  v25[3] = &unk_1E5DD0030;
  id v12 = v9;
  id v26 = v12;
  id v13 = [v10 actionWithTitle:v11 style:1 handler:v25];

  [v12 addAction:v13];
  v14 = PXLocalizedStringFromTable(v8, @"PhotosUICore");
  v15 = (void *)MEMORY[0x1E4FB1410];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __65__PXSurveyQuestionsHorizontalGadget_alertControllerForInfoAction__block_invoke_2;
  v21[3] = &unk_1E5DC5A20;
  id v16 = v12;
  char v24 = IsAppleInternal;
  id v22 = v16;
  v23 = self;
  v17 = [v15 actionWithTitle:v14 style:0 handler:v21];
  [v16 addAction:v17];
  v18 = [(PXHorizontalCollectionGadget *)self horizontalGadgetDelegate];
  [v18 horizontalCollectionGadget:self configureCustomInfoAlertActionsForAlertController:v16];

  id v19 = v16;
  return v19;
}

uint64_t __65__PXSurveyQuestionsHorizontalGadget_alertControllerForInfoAction__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

uint64_t __65__PXSurveyQuestionsHorizontalGadget_alertControllerForInfoAction__block_invoke_2(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __65__PXSurveyQuestionsHorizontalGadget_alertControllerForInfoAction__block_invoke_3;
  v3[3] = &unk_1E5DCFE98;
  char v4 = *(unsigned char *)(a1 + 48);
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 dismissViewControllerAnimated:1 completion:v3];
}

void __65__PXSurveyQuestionsHorizontalGadget_alertControllerForInfoAction__block_invoke_3(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    char v4 = [v3 horizontalGadgetDelegate];
    id v6 = [v4 radarConfigurationForHorizontalCollectionGadget:*(void *)(a1 + 32)];

    id v5 = [[PXSurveyRadarReporterViewController alloc] initWithConfiguration:v6 completionHandler:0];
    [*(id *)(a1 + 32) presentViewController:v5 animated:1 completion:0];
  }
  else
  {
    [v3 _sendRequestConsentFormMail];
  }
}

- (id)alertControllerForHideAction
{
  v3 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:0 preferredStyle:0];
  char v4 = (void *)MEMORY[0x1E4FB1410];
  id v5 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeHideCancel", @"PhotosUICore");
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __65__PXSurveyQuestionsHorizontalGadget_alertControllerForHideAction__block_invoke;
  v40[3] = &unk_1E5DD0030;
  id v6 = v3;
  id v41 = v6;
  id v7 = [v4 actionWithTitle:v5 style:1 handler:v40];

  id v8 = (void *)MEMORY[0x1E4FB1410];
  v9 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeHideForToday", @"PhotosUICore");
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __65__PXSurveyQuestionsHorizontalGadget_alertControllerForHideAction__block_invoke_2;
  v37[3] = &unk_1E5DD1068;
  id v10 = v6;
  id v38 = v10;
  v39 = self;
  id v11 = [v8 actionWithTitle:v9 style:0 handler:v37];

  id v12 = (void *)MEMORY[0x1E4FB1410];
  id v13 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeHideForAWeek", @"PhotosUICore");
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __65__PXSurveyQuestionsHorizontalGadget_alertControllerForHideAction__block_invoke_4;
  v34[3] = &unk_1E5DD1068;
  id v14 = v10;
  id v35 = v14;
  v36 = self;
  v15 = [v12 actionWithTitle:v13 style:0 handler:v34];

  char IsAppleInternal = PXSurveyQuestionIsAppleInternal();
  if (IsAppleInternal)
  {
    v17 = [(PXHorizontalCollectionGadget *)self horizontalGadgetDelegate];
    v18 = [v17 hideForeverAlertMessageForHorizontalCollectionGadget:self];
  }
  else
  {
    v18 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeHideForeverActionMessageProfile", @"PhotosUICore");
  }
  id v19 = (void *)MEMORY[0x1E4FB1410];
  v20 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeHideForever", @"PhotosUICore");
  uint64_t v26 = MEMORY[0x1E4F143A8];
  uint64_t v27 = 3221225472;
  v28 = __65__PXSurveyQuestionsHorizontalGadget_alertControllerForHideAction__block_invoke_6;
  v29 = &unk_1E5DC59F8;
  id v21 = v14;
  id v30 = v21;
  id v31 = v18;
  char v33 = IsAppleInternal;
  v32 = self;
  id v22 = v18;
  v23 = [v19 actionWithTitle:v20 style:2 handler:&v26];

  objc_msgSend(v21, "addAction:", v7, v26, v27, v28, v29);
  [v21 addAction:v11];
  [v21 addAction:v15];
  [v21 addAction:v23];
  id v24 = v21;

  return v24;
}

uint64_t __65__PXSurveyQuestionsHorizontalGadget_alertControllerForHideAction__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

uint64_t __65__PXSurveyQuestionsHorizontalGadget_alertControllerForHideAction__block_invoke_2(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __65__PXSurveyQuestionsHorizontalGadget_alertControllerForHideAction__block_invoke_3;
  v3[3] = &unk_1E5DD36F8;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 dismissViewControllerAnimated:1 completion:v3];
}

uint64_t __65__PXSurveyQuestionsHorizontalGadget_alertControllerForHideAction__block_invoke_4(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __65__PXSurveyQuestionsHorizontalGadget_alertControllerForHideAction__block_invoke_5;
  v3[3] = &unk_1E5DD36F8;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 dismissViewControllerAnimated:1 completion:v3];
}

void __65__PXSurveyQuestionsHorizontalGadget_alertControllerForHideAction__block_invoke_6(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__PXSurveyQuestionsHorizontalGadget_alertControllerForHideAction__block_invoke_7;
  v5[3] = &unk_1E5DD21E8;
  int v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  char v8 = *(unsigned char *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 dismissViewControllerAnimated:1 completion:v5];
}

void __65__PXSurveyQuestionsHorizontalGadget_alertControllerForHideAction__block_invoke_7(uint64_t a1)
{
  int v2 = (void *)MEMORY[0x1E4FB1418];
  id v3 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeHideForeverActionTitle", @"PhotosUICore");
  uint64_t v4 = [v2 alertControllerWithTitle:v3 message:*(void *)(a1 + 32) preferredStyle:0];

  id v5 = (void *)MEMORY[0x1E4FB1410];
  id v6 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeHideCancel", @"PhotosUICore");
  uint64_t v7 = [v5 actionWithTitle:v6 style:1 handler:0];
  [v4 addAction:v7];

  if (*(unsigned char *)(a1 + 48))
  {
    char v8 = (void *)MEMORY[0x1E4FB1410];
    v9 = PXLocalizedStringFromTable(@"PXInternalPhotosChallengeHideForever", @"PhotosUICore");
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __65__PXSurveyQuestionsHorizontalGadget_alertControllerForHideAction__block_invoke_8;
    v11[3] = &unk_1E5DD0030;
    v11[4] = *(void *)(a1 + 40);
    id v10 = [v8 actionWithTitle:v9 style:0 handler:v11];
    [v4 addAction:v10];
  }
  [*(id *)(a1 + 40) presentViewController:v4 animated:1 completion:0];
}

void __65__PXSurveyQuestionsHorizontalGadget_alertControllerForHideAction__block_invoke_8(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x1E4F1C9C8] distantFuture];
  [v1 _hideSurveyQuestionsUntilDate:v2];
}

void __65__PXSurveyQuestionsHorizontalGadget_alertControllerForHideAction__block_invoke_5(uint64_t a1)
{
  id v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v2 = [MEMORY[0x1E4F1C9C8] date];
  id v3 = [v5 dateByAddingUnit:0x2000 value:1 toDate:v2 options:0];

  uint64_t v4 = [v5 startOfDayForDate:v3];
  [*(id *)(a1 + 32) _hideSurveyQuestionsUntilDate:v4];
}

void __65__PXSurveyQuestionsHorizontalGadget_alertControllerForHideAction__block_invoke_3(uint64_t a1)
{
  id v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  id v2 = [MEMORY[0x1E4F1C9C8] date];
  id v3 = [v5 dateByAddingUnit:16 value:1 toDate:v2 options:0];

  uint64_t v4 = [v5 startOfDayForDate:v3];
  [*(id *)(a1 + 32) _hideSurveyQuestionsUntilDate:v4];
}

- (BOOL)selectionFollowsFocus
{
  return 1;
}

- (id)accessoryButtonTitle
{
  return PXLocalizedStringFromTable(@"PXInternalPhotosChallengeHide", @"PhotosUICore");
}

- (unint64_t)accessoryButtonType
{
  return 1;
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = [(PXSurveyQuestionsHorizontalGadget *)self parentViewController];

  if (v10)
  {
    v14.receiver = self;
    v14.super_class = (Class)PXSurveyQuestionsHorizontalGadget;
    [(PXSurveyQuestionsHorizontalGadget *)&v14 presentViewController:v8 animated:v6 completion:v9];
  }
  else
  {
    id v11 = [MEMORY[0x1E4FB1438] sharedApplication];
    id v12 = objc_msgSend(v11, "px_firstKeyWindow");
    id v13 = [v12 rootViewController];

    [v13 presentViewController:v8 animated:v6 completion:v9];
  }
}

- (void)viewDidLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PXSurveyQuestionsHorizontalGadget;
  [(PXGadgetUIViewController *)&v4 viewDidLayoutSubviews];
  id v3 = [(PXSurveyQuestionsHorizontalGadget *)self nextViewLayoutExpectation];
  [v3 fulfill];

  [(PXSurveyQuestionsHorizontalGadget *)self setNextViewLayoutExpectation:0];
}

@end