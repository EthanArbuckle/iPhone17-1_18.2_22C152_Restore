@interface PXSurveyQuestionsHorizontalGadgetProvider
- (PXSurveyQuestionGadgetsProviderLemonadeUIDelegate)lemonadeUIDelegate;
- (PXSurveyQuestionsHorizontalGadgetProvider)initWithConfiguration:(id)a3;
- (PXSurveyQuestionsHorizontalGadgetProvider)initWithIdentifier:(id)a3 contentGadgetProvider:(id)a4 title:(id)a5 horizontalCollectionGadgetClass:(Class)a6;
- (id)hideForeverAlertMessageForHorizontalCollectionGadget:(id)a3;
- (id)infoAlertMessageForHorizontalCollectionGadget:(id)a3;
- (id)infoAlertTitleForHorizontalCollectionGadget:(id)a3;
- (id)presentationEnvironmentForGadget:(id)a3;
- (id)radarConfigurationForHorizontalCollectionGadget:(id)a3;
- (unint64_t)gadgetType;
- (void)didAnswerQuestionForGadgetProvider:(id)a3 completionHandler:(id)a4;
- (void)horizontalCollectionGadget:(id)a3 configureCustomInfoAlertActionsForAlertController:(id)a4;
- (void)horizontalCollectionGadget:(id)a3 hideUntilDate:(id)a4;
- (void)setLemonadeUIDelegate:(id)a3;
- (void)surveyQuestionsGadgetProvider:(id)a3 navigateToGadget:(id)a4;
@end

@implementation PXSurveyQuestionsHorizontalGadgetProvider

- (PXSurveyQuestionsHorizontalGadgetProvider)initWithConfiguration:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PXSurveyQuestionsHorizontalGadgetProvider.m", 38, @"Invalid parameter not satisfying: %@", @"configuration" object file lineNumber description];
  }
  v7 = [v6 gadgetProvider];
  [v7 setGadgetProviderDelegate:self];
  v8 = [v6 identifier];
  v9 = [v6 sectionTitle];
  uint64_t v10 = objc_opt_class();
  v14.receiver = self;
  v14.super_class = (Class)PXSurveyQuestionsHorizontalGadgetProvider;
  v11 = [(PXHorizontalCollectionGadgetProvider *)&v14 initWithIdentifier:v8 contentGadgetProvider:v7 title:v9 horizontalCollectionGadgetClass:v10];

  if (v11)
  {
    objc_storeStrong((id *)&v11->_configuration, a3);
    [(PXHorizontalCollectionGadgetProvider *)v11 setIsFixedHeight:1];
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_lemonadeUIDelegate);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (PXSurveyQuestionGadgetsProviderLemonadeUIDelegate)lemonadeUIDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lemonadeUIDelegate);
  return (PXSurveyQuestionGadgetsProviderLemonadeUIDelegate *)WeakRetained;
}

- (void)surveyQuestionsGadgetProvider:(id)a3 navigateToGadget:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [(PXSurveyQuestionsHorizontalGadgetProvider *)self lemonadeUIDelegate];
  v7 = v6;
  if (v6)
  {
    [v6 navigateToGadget:v5];
  }
  else
  {
    v8 = PLUIGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v5;
      _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_ERROR, "Couldn't navigate to gadget %@", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)didAnswerQuestionForGadgetProvider:(id)a3 completionHandler:(id)a4
{
  id v27 = a3;
  id v6 = (void (**)(void))a4;
  if ((PXSurveyQuestionIsAppleInternal() & 1) == 0)
  {
    v6[2](v6);
    goto LABEL_12;
  }
  v7 = [v27 dataSource];
  uint64_t v8 = [v7 fetchTotalNumberOfAnsweredYesOrNoQuestions];

  int v9 = [MEMORY[0x1E4F1C9C8] date];
  id v10 = +[PXUserDefaults standardUserDefaults];
  uint64_t v11 = [(PXSurveyQuestionsHorizontalGadgetProviderConfiguration *)self->_configuration radarPromptAnsweredQuestionCountDefaultsKey];
  v12 = [(PXSurveyQuestionsHorizontalGadgetProviderConfiguration *)self->_configuration radarPromptDateDefaultsKey];
  v13 = [v10 valueForKey:v12];
  if (!v13)
  {
    objc_super v14 = [v9 dateByAddingTimeInterval:-259200.0];
    [v10 setValue:v14 forKey:v12];
    v24 = [NSNumber numberWithUnsignedInteger:v8 - 1];
    [v10 setValue:v24 forKey:v11];

    goto LABEL_9;
  }
  objc_super v14 = [v10 valueForKey:v11];
  if ((unint64_t)(v8 - [v14 unsignedIntegerValue]) < 0x32)
  {
LABEL_9:

LABEL_10:
    v6[2](v6);
    goto LABEL_11;
  }
  uint64_t v25 = v8;
  [v13 dateByAddingTimeInterval:259200.0];
  v16 = v15 = v11;
  v26 = v9;
  uint64_t v17 = [v16 compare:v9];

  uint64_t v11 = v15;
  BOOL v18 = v17 == -1;
  int v9 = v26;
  if (!v18) {
    goto LABEL_10;
  }
  v19 = [MEMORY[0x1E4F1C9C8] date];
  [v10 setValue:v19 forKey:v12];

  v20 = [NSNumber numberWithUnsignedInteger:v25];
  [v10 setValue:v20 forKey:v15];

  v21 = [(PXSurveyQuestionsHorizontalGadgetProviderConfiguration *)self->_configuration radarConfiguration];
  v22 = [[PXSurveyRadarReporterViewController alloc] initWithConfiguration:v21 completionHandler:v6];
  v23 = [(PXGadgetProvider *)self nextGadgetResponder];
  [v23 presentGadgetViewController:v22 animated:1 completion:0];

  int v9 = v26;
LABEL_11:

LABEL_12:
}

- (id)presentationEnvironmentForGadget:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXSurveyQuestionsHorizontalGadgetProvider;
  id v6 = [(PXGadgetProvider *)&v13 presentationEnvironmentForGadget:v5];
  if (!v6)
  {
    v7 = [(PXSurveyQuestionsHorizontalGadgetProvider *)self lemonadeUIDelegate];
    if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      uint64_t v8 = [v5 overrideContainerViewController];
      if (v8)
      {
        int v9 = (void *)v8;
        id v6 = +[PXViewControllerPresenter defaultPresenterWithViewController:v8];

        if (v6)
        {
LABEL_9:

          goto LABEL_10;
        }
      }
      else
      {
        id v10 = [MEMORY[0x1E4F28B00] currentHandler];
        [v10 handleFailureInMethod:a2, self, @"PXSurveyQuestionsHorizontalGadgetProvider.m", 123, @"No presentation environment for gadget: %@, gadget has nil overrideContainerViewController", v5 object file lineNumber description];
      }
    }
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PXSurveyQuestionsHorizontalGadgetProvider.m", 126, @"No presentation environment for gadget: %@", v5 object file lineNumber description];

    id v6 = 0;
    goto LABEL_9;
  }
LABEL_10:

  return v6;
}

- (void)horizontalCollectionGadget:(id)a3 configureCustomInfoAlertActionsForAlertController:(id)a4
{
  id v5 = a4;
  id v6 = [(PXSurveyQuestionsHorizontalGadgetProviderConfiguration *)self->_configuration customInfoAlertActionTitle];
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    v12 = __122__PXSurveyQuestionsHorizontalGadgetProvider_horizontalCollectionGadget_configureCustomInfoAlertActionsForAlertController___block_invoke;
    objc_super v13 = &unk_1E5DD1068;
    id v8 = v5;
    id v14 = v8;
    v15 = self;
    int v9 = [v7 actionWithTitle:v6 style:0 handler:&v10];
    objc_msgSend(v8, "addAction:", v9, v10, v11, v12, v13);
  }
}

uint64_t __122__PXSurveyQuestionsHorizontalGadgetProvider_horizontalCollectionGadget_configureCustomInfoAlertActionsForAlertController___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __122__PXSurveyQuestionsHorizontalGadgetProvider_horizontalCollectionGadget_configureCustomInfoAlertActionsForAlertController___block_invoke_2;
  v3[3] = &unk_1E5DD36F8;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 dismissViewControllerAnimated:1 completion:v3];
}

void __122__PXSurveyQuestionsHorizontalGadgetProvider_horizontalCollectionGadget_configureCustomInfoAlertActionsForAlertController___block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(*(void *)(a1 + 32) + 128);
  id v6 = 0;
  v3 = [v2 customInfoAlertActionViewController:&v6];
  id v4 = v6;
  if (v3)
  {
    id v5 = [*(id *)(a1 + 32) nextGadgetResponder];
    [v5 presentGadgetViewController:v3 animated:1 completion:0];
  }
  else
  {
    id v5 = PLUIGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v8 = v4;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_ERROR, "No custom info alert view controller: %@", buf, 0xCu);
    }
  }
}

- (id)radarConfigurationForHorizontalCollectionGadget:(id)a3
{
  return [(PXSurveyQuestionsHorizontalGadgetProviderConfiguration *)self->_configuration radarConfiguration];
}

- (void)horizontalCollectionGadget:(id)a3 hideUntilDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[PXUserDefaults standardUserDefaults];
  uint64_t v9 = [(PXSurveyQuestionsHorizontalGadgetProviderConfiguration *)self->_configuration hideDateDefaultsKey];
  [v8 setValue:v6 forKey:v9];

  [(PXGadgetProvider *)self gadget:v7 didChange:32];
  id v10 = [(PXSurveyQuestionsHorizontalGadgetProvider *)self lemonadeUIDelegate];
  [v10 invalidateGadgets];
}

- (id)hideForeverAlertMessageForHorizontalCollectionGadget:(id)a3
{
  return [(PXSurveyQuestionsHorizontalGadgetProviderConfiguration *)self->_configuration hideForeverAlertMessage];
}

- (id)infoAlertMessageForHorizontalCollectionGadget:(id)a3
{
  return [(PXSurveyQuestionsHorizontalGadgetProviderConfiguration *)self->_configuration infoAlertMessage];
}

- (id)infoAlertTitleForHorizontalCollectionGadget:(id)a3
{
  return [(PXSurveyQuestionsHorizontalGadgetProviderConfiguration *)self->_configuration infoAlertTitle];
}

- (void)setLemonadeUIDelegate:(id)a3
{
  id obj = a3;
  id v4 = [(PXSurveyQuestionsHorizontalGadgetProvider *)self lemonadeUIDelegate];

  if (v4 != obj)
  {
    objc_storeWeak((id *)&self->_lemonadeUIDelegate, obj);
    id v5 = [(PXSurveyQuestionsHorizontalGadgetProviderConfiguration *)self->_configuration gadgetProvider];
    [v5 setLemonadeUIDelegate:obj];
  }
}

- (unint64_t)gadgetType
{
  v2 = [(PXSurveyQuestionsHorizontalGadgetProviderConfiguration *)self->_configuration gadgetProvider];
  unint64_t v3 = [v2 gadgetType];

  return v3;
}

- (PXSurveyQuestionsHorizontalGadgetProvider)initWithIdentifier:(id)a3 contentGadgetProvider:(id)a4 title:(id)a5 horizontalCollectionGadgetClass:(Class)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  objc_super v13 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSurveyQuestionsHorizontalGadgetProvider.m", 34, @"%s is not available as initializer", "-[PXSurveyQuestionsHorizontalGadgetProvider initWithIdentifier:contentGadgetProvider:title:horizontalCollectionGadgetClass:]");

  abort();
}

@end