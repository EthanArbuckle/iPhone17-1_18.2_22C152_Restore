@interface WFLocationParameterSummaryEditor
+ (unint64_t)variableResultTypeForParameter:(id)a3;
- (UIViewController)presentedViewController;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (void)beginEditingSlotWithIdentifier:(id)a3 presentationAnchor:(id)a4;
- (void)cancelEditingWithCompletionHandler:(id)a3;
- (void)locationPicker:(id)a3 didFinishWithValue:(id)a4;
- (void)locationPickerDidCancel:(id)a3;
- (void)setPresentedViewController:(id)a3;
@end

@implementation WFLocationParameterSummaryEditor

- (void).cxx_destruct
{
}

- (void)setPresentedViewController:(id)a3
{
}

- (UIViewController)presentedViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentedViewController);
  return (UIViewController *)WeakRetained;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  id v4 = a4;
  v5 = [MEMORY[0x263F086E0] mainBundle];
  char v6 = objc_msgSend(v5, "wf_isWidgetConfigurationExtensionBundle");

  if (v6)
  {
    int64_t v7 = 2;
  }
  else if ([v4 horizontalSizeClass] == 1)
  {
    int64_t v7 = 2;
  }
  else
  {
    int64_t v7 = -1;
  }

  return v7;
}

- (void)locationPickerDidCancel:(id)a3
{
  id v4 = [a3 navigationController];
  [v4 dismissViewControllerAnimated:1 completion:0];

  [(WFModuleSummaryEditor *)self completeEditing];
}

- (void)locationPicker:(id)a3 didFinishWithValue:(id)a4
{
  id v9 = a3;
  if (a4)
  {
    id v6 = a4;
    int64_t v7 = [(WFModuleSummaryEditor *)self parameter];
    a4 = (id)objc_msgSend(objc_alloc((Class)objc_msgSend(v7, "singleStateClass")), "initWithValue:", v6);
  }
  [(WFModuleSummaryEditor *)self commitState:a4];
  v8 = [v9 navigationController];
  [v8 dismissViewControllerAnimated:1 completion:0];

  [(WFModuleSummaryEditor *)self completeEditing];
}

- (void)cancelEditingWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __71__WFLocationParameterSummaryEditor_cancelEditingWithCompletionHandler___block_invoke;
  v7[3] = &unk_264BFDA98;
  v7[4] = self;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)WFLocationParameterSummaryEditor;
  id v5 = v4;
  [(WFModuleSummaryEditor *)&v6 cancelEditingWithCompletionHandler:v7];
}

void __71__WFLocationParameterSummaryEditor_cancelEditingWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) presentedViewController];

  if (v2)
  {
    id v4 = [*(id *)(a1 + 32) presentedViewController];
    [v4 dismissViewControllerAnimated:1 completion:*(void *)(a1 + 40)];
  }
  else
  {
    v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
}

- (void)beginEditingSlotWithIdentifier:(id)a3 presentationAnchor:(id)a4
{
  id v5 = a4;
  objc_super v6 = [WFLocationPickerViewController alloc];
  int64_t v7 = [(WFModuleSummaryEditor *)self initialState];
  id v8 = [v7 value];
  v26 = [(WFLocationPickerViewController *)v6 initWithPickerType:0 value:v8];

  [(WFLocationPickerViewController *)v26 setDelegate:self];
  id v9 = [(WFModuleSummaryEditor *)self parameter];
  -[WFLocationPickerViewController setAllowsPickingCurrentLocation:](v26, "setAllowsPickingCurrentLocation:", [v9 allowsCurrentLocation]);

  v10 = [(WFModuleSummaryEditor *)self parameter];
  -[WFLocationPickerViewController setAllowsTextOnlyLocation:](v26, "setAllowsTextOnlyLocation:", [v10 allowsTextOnlyLocations]);

  v11 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v26];
  [v11 setModalPresentationStyle:7];
  v12 = [v11 popoverPresentationController];
  [v12 setDelegate:self];

  v13 = [v5 sourceView];
  v14 = [v11 popoverPresentationController];
  [v14 setSourceView:v13];

  [v5 sourceRect];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  v23 = [v11 popoverPresentationController];
  objc_msgSend(v23, "setSourceRect:", v16, v18, v20, v22);

  v24 = [v11 popoverPresentationController];
  objc_msgSend(v24, "wf_forcePresentationInPresenterSceneIfNeeded");

  v25 = [v5 sourceViewController];

  [v25 presentViewController:v11 animated:1 completion:0];
  objc_storeWeak((id *)&self->_presentedViewController, v11);
}

+ (unint64_t)variableResultTypeForParameter:(id)a3
{
  return 0;
}

@end