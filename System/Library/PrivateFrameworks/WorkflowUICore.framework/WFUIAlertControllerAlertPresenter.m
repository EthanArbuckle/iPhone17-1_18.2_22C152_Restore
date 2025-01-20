@interface WFUIAlertControllerAlertPresenter
+ (id)contentViewControllerForContentView:(id)a3 padding:(UIEdgeInsets)a4;
+ (void)presentAlert:(id)a3 withUserInterface:(id)a4;
@end

@implementation WFUIAlertControllerAlertPresenter

+ (id)contentViewControllerForContentView:(id)a3 padding:(UIEdgeInsets)a4
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  v26[4] = *MEMORY[0x263EF8340];
  id v8 = a3;
  v25 = objc_opt_new();
  id v9 = objc_alloc_init(MEMORY[0x263F82E00]);
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v9 addSubview:v8];
  v20 = (void *)MEMORY[0x263F08938];
  v24 = [v8 topAnchor];
  v23 = [v9 topAnchor];
  v22 = [v24 constraintEqualToAnchor:v23 constant:top];
  v26[0] = v22;
  v21 = [v8 bottomAnchor];
  v10 = [v9 bottomAnchor];
  v11 = [v21 constraintEqualToAnchor:v10 constant:-bottom];
  v26[1] = v11;
  v12 = [v8 leadingAnchor];
  v13 = [v9 leadingAnchor];
  v14 = [v12 constraintEqualToAnchor:v13 constant:left];
  v26[2] = v14;
  v15 = [v8 trailingAnchor];

  v16 = [v9 trailingAnchor];
  v17 = [v15 constraintEqualToAnchor:v16 constant:-right];
  v26[3] = v17;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:4];
  [v20 activateConstraints:v18];

  [v25 setView:v9];
  return v25;
}

+ (void)presentAlert:(id)a3 withUserInterface:(id)a4
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if ([v5 preferredStyle] != 1
    || ([v5 textFieldConfigurationHandlers],
        v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 count],
        v7,
        v8))
  {
    BOOL v9 = 1;
    goto LABEL_4;
  }
  v37 = [v5 presentationSource];
  v38 = [v37 barButtonItem];
  if (v38)
  {

    BOOL v9 = 0;
LABEL_31:

    goto LABEL_4;
  }
  v39 = [v5 presentationSource];
  v40 = [v39 sourceView];

  if (!v40)
  {
    v37 = [MEMORY[0x263F82418] alertControllerWithTitle:0 message:0 preferredStyle:0];
    BOOL v9 = [v37 modalPresentationStyle] == 7;
    goto LABEL_31;
  }
  BOOL v9 = 0;
LABEL_4:
  v10 = (void *)MEMORY[0x263F82418];
  v11 = [v5 title];
  v12 = [v5 message];
  v13 = [v10 alertControllerWithTitle:v11 message:v12 preferredStyle:v9];

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  v14 = [v5 textFieldConfigurationHandlers];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v49;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v49 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v48 + 1) + 8 * v18);
        v47[0] = MEMORY[0x263EF8330];
        v47[1] = 3221225472;
        v47[2] = __68__WFUIAlertControllerAlertPresenter_presentAlert_withUserInterface___block_invoke;
        v47[3] = &unk_264C50F00;
        v47[4] = v19;
        [v13 addTextFieldWithConfigurationHandler:v47];
        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v48 objects:v53 count:16];
    }
    while (v16);
  }

  v20 = [v5 buttons];
  [v13 setButtons:v20 forAlert:v5];

  v21 = [v5 contentView];
  if (v21)
  {
    [v5 contentViewPadding];
    v22 = +[WFUIAlertControllerAlertPresenter contentViewControllerForContentView:padding:](WFUIAlertControllerAlertPresenter, "contentViewControllerForContentView:padding:", v21);
    [v13 setContentViewController:v22];
  }
  v23 = [v5 keyCommands];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v43 objects:v52 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v44;
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v44 != v26) {
          objc_enumerationMutation(v23);
        }
        [v13 addKeyCommand:*(void *)(*((void *)&v43 + 1) + 8 * v27++)];
      }
      while (v25 != v27);
      uint64_t v25 = [v23 countByEnumeratingWithState:&v43 objects:v52 count:16];
    }
    while (v25);
  }
  v28 = [v5 presentationSource];
  v29 = [v13 popoverPresentationController];
  objc_msgSend(v29, "setPermittedArrowDirections:", objc_msgSend(v28, "permittedArrowDirections"));
  objc_msgSend(v29, "setCanOverlapSourceViewRect:", objc_msgSend(v28, "canOverlapSourceViewRect"));
  v30 = [v28 barButtonItem];
  [v29 setBarButtonItem:v30];

  v31 = [v28 sourceView];
  [v29 setSourceView:v31];

  objc_msgSend(v29, "wf_forcePresentationInPresenterSceneIfNeeded");
  [v28 sourceRect];
  if (!CGRectIsNull(v55))
  {
    [v28 sourceRect];
    objc_msgSend(v29, "setSourceRect:");
  }
  v32 = [v6 viewController];
  if ([v32 overrideUserInterfaceStyle]) {
    objc_msgSend(v13, "setOverrideUserInterfaceStyle:", objc_msgSend(v32, "overrideUserInterfaceStyle"));
  }
  v33 = [v32 presentedViewController];

  if (v33)
  {
    do
    {
      v34 = [v32 presentedViewController];

      v35 = [v34 presentedViewController];

      v32 = v34;
    }
    while (v35);
  }
  else
  {
    v34 = v32;
  }
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __68__WFUIAlertControllerAlertPresenter_presentAlert_withUserInterface___block_invoke_2;
  v41[3] = &unk_264C50F28;
  id v42 = v21;
  id v36 = v21;
  [v34 presentViewController:v13 animated:1 completion:v41];
  [v5 setPresenter:v13];
}

uint64_t __68__WFUIAlertControllerAlertPresenter_presentAlert_withUserInterface___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __68__WFUIAlertControllerAlertPresenter_presentAlert_withUserInterface___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) canBecomeFirstResponder];
  if (result)
  {
    v3 = *(void **)(a1 + 32);
    return [v3 becomeFirstResponder];
  }
  return result;
}

@end