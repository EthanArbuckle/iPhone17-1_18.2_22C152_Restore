@interface WFContactPickerCoordinator
- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContactProperty:(id)a4;
- (NSSet)supportedPersonProperties;
- (UIViewController)presentingViewController;
- (WFAlertPresentationSource)presentationSource;
- (id)completionHandler;
- (id)contactWithMatchingPropertyAndMultivalueIndex:(id)a3;
- (id)supportedContactProperties;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (void)contactPicker:(id)a3 didSelectContact:(id)a4;
- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4;
- (void)contactPickerDidCancel:(id)a3;
- (void)dismissPersonViewController;
- (void)finishWithContact:(id)a3;
- (void)presentContactPickerWithCompletionHandler:(id)a3;
- (void)presentHandlePickerForContact:(id)a3 completionHandler:(id)a4;
- (void)presentViewController:(id)a3 completionHandler:(id)a4;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setPresentationSource:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setSupportedPersonProperties:(id)a3;
@end

@implementation WFContactPickerCoordinator

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_presentationSource, 0);
  objc_storeStrong((id *)&self->_supportedPersonProperties, 0);
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setPresentingViewController:(id)a3
{
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setPresentationSource:(id)a3
{
}

- (WFAlertPresentationSource)presentationSource
{
  return self->_presentationSource;
}

- (void)setSupportedPersonProperties:(id)a3
{
}

- (NSSet)supportedPersonProperties
{
  return self->_supportedPersonProperties;
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

- (void)presentationControllerDidDismiss:(id)a3
{
}

- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4
{
  WFContactFromCNContactProperty();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(WFContactPickerCoordinator *)self finishWithContact:v5];
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v6 = [MEMORY[0x263F33748] contactWithCNContact:a4];
  id v5 = [(WFContactPickerCoordinator *)self contactWithMatchingPropertyAndMultivalueIndex:v6];
  [(WFContactPickerCoordinator *)self finishWithContact:v5];
}

- (void)contactPickerDidCancel:(id)a3
{
}

- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContactProperty:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __97__WFContactPickerCoordinator_contactViewController_shouldPerformDefaultActionForContactProperty___block_invoke;
  block[3] = &unk_264BFD4B0;
  id v12 = v7;
  v13 = self;
  id v14 = v6;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);

  return 0;
}

void __97__WFContactPickerCoordinator_contactViewController_shouldPerformDefaultActionForContactProperty___block_invoke(uint64_t a1)
{
  WFContactFromCNContactProperty();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) finishWithContact:v3];
  v2 = [*(id *)(a1 + 48) navigationController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (id)supportedContactProperties
{
  v2 = [(WFContactPickerCoordinator *)self supportedPersonProperties];
  id v3 = objc_msgSend(v2, "if_compactMap:", &__block_literal_global_1830);
  id v4 = [v3 allObjects];

  return v4;
}

uint64_t __56__WFContactPickerCoordinator_supportedContactProperties__block_invoke(uint64_t a1, void *a2)
{
  [a2 intValue];
  return CNContactPropertyKeyFromWFContactPropertyID();
}

- (id)contactWithMatchingPropertyAndMultivalueIndex:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(WFContactPickerCoordinator *)self supportedPersonProperties];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) intValue];
        if ([v4 hasValueForPropertyID:v10])
        {
          uint64_t v11 = [v4 contactWithPropertyID:v10 multivalueIndex:0];

          id v4 = (id)v11;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)finishWithContact:(id)a3
{
  id v6 = a3;
  id v4 = [(WFContactPickerCoordinator *)self completionHandler];

  if (v4)
  {
    id v5 = [(WFContactPickerCoordinator *)self completionHandler];
    ((void (**)(void, id))v5)[2](v5, v6);

    [(WFContactPickerCoordinator *)self setCompletionHandler:0];
  }
}

- (void)dismissPersonViewController
{
  id v3 = [(WFContactPickerCoordinator *)self presentingViewController];
  v2 = [v3 presentedViewController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (void)presentViewController:(id)a3 completionHandler:(id)a4
{
  id v13 = a3;
  id v6 = (void *)[a4 copy];
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = v6;

  uint64_t v8 = [(WFContactPickerCoordinator *)self presentationSource];
  if (v8)
  {
    [v13 setModalPresentationStyle:7];
    id v9 = [v13 popoverPresentationController];
    [v9 setDelegate:self];
    objc_msgSend(v9, "setPermittedArrowDirections:", objc_msgSend(v8, "permittedArrowDirections"));
    objc_msgSend(v9, "setCanOverlapSourceViewRect:", objc_msgSend(v8, "canOverlapSourceViewRect"));
    uint64_t v10 = [v8 barButtonItem];
    [v9 setBarButtonItem:v10];

    uint64_t v11 = [v8 sourceView];
    [v9 setSourceView:v11];

    objc_msgSend(v9, "wf_forcePresentationInPresenterSceneIfNeeded");
    [v8 sourceRect];
    if (!CGRectIsNull(v15))
    {
      [v8 sourceRect];
      objc_msgSend(v9, "setSourceRect:");
    }
  }
  else
  {
    id v9 = [v13 presentationController];
    [v9 setDelegate:self];
  }

  id v12 = [(WFContactPickerCoordinator *)self presentingViewController];
  [v12 presentViewController:v13 animated:1 completion:0];
}

- (void)presentHandlePickerForContact:(id)a3 completionHandler:(id)a4
{
  id v6 = (void *)MEMORY[0x263EFEBF8];
  id v7 = a4;
  id v14 = [v6 viewControllerForContact:a3];
  [v14 setDelegate:self];
  uint64_t v8 = [(WFContactPickerCoordinator *)self supportedContactProperties];
  [v14 setDisplayedPropertyKeys:v8];

  [v14 setAllowsEditing:0];
  [v14 setAllowsActions:0];
  id v9 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel_dismissPersonViewController];
  uint64_t v10 = [v14 navigationItem];
  [v10 setLeftBarButtonItem:v9];

  uint64_t v11 = WFLocalizedString(@"Choose");
  id v12 = [v14 navigationItem];
  [v12 setTitle:v11];

  id v13 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v14];
  [(WFContactPickerCoordinator *)self presentViewController:v13 completionHandler:v7];
}

- (void)presentContactPickerWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v8 = [(WFContactPickerCoordinator *)self supportedContactProperties];
  id v5 = objc_alloc_init(MEMORY[0x263EFEBE0]);
  [v5 setDelegate:self];
  [v5 setDisplayedPropertyKeys:v8];
  id v6 = WFPredicateForEnablingPerson();
  [v5 setPredicateForEnablingContact:v6];

  id v7 = WFPredicateForSelectionOfPerson();
  [v5 setPredicateForSelectionOfContact:v7];

  [(WFContactPickerCoordinator *)self presentViewController:v5 completionHandler:v4];
}

@end