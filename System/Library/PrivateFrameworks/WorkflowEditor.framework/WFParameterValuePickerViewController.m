@interface WFParameterValuePickerViewController
- (BOOL)accessibilityPerformEscape;
- (BOOL)allowsMultipleSelection;
- (BOOL)currentSelectedValueIsVariable:(id)a3;
- (BOOL)currentSelectedValuesContainsState:(id)a3;
- (BOOL)hasScrolledToSelectedItem;
- (BOOL)showsCancelButton;
- (BOOL)showsPrompt;
- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4;
- (BOOL)tableView:(id)a3 shouldHaveFullLengthBottomSeparatorForSection:(int64_t)a4;
- (INObjectCollection)defaultResults;
- (NSMutableDictionary)cachedPrompts;
- (NSMutableDictionary)cachedResults;
- (NSSet)allowedVariableTypes;
- (NSString)customPrompt;
- (NSString)defaultPrompt;
- (NSString)noOptionAvailableTitle;
- (NSString)removeItemButtonTitle;
- (UIBarButtonItem)cancelBarButtonItem;
- (UIBarButtonItem)doneBarButtonItem;
- (UIBarButtonItem)removeItemBarButtonItem;
- (UILabel)errorMessageLabel;
- (UILabel)errorTitleLabel;
- (UISearchBar)searchBar;
- (UISearchController)searchController;
- (UIView)errorMessageView;
- (WFDebouncer)inputDebouncer;
- (WFParameterValuePickable)parameter;
- (WFParameterValuePickerDataSource)dataSource;
- (WFParameterValuePickerViewController)initWithParameter:(id)a3 widgetFamily:(int64_t)a4 allowsVariables:(BOOL)a5 initialCollection:(id)a6 currentState:(id)a7 delegate:(id)a8;
- (WFParameterValuePickerViewControllerDelegate)delegate;
- (WFVariableProvider)variableProvider;
- (WFVariableSubstitutableParameterState)currentState;
- (WFVariableUIDelegate)variableUIDelegate;
- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4;
- (id)extractIntentsExecutionErrorFromError:(id)a3;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)maximumSelectableItemsCount;
- (int64_t)widgetFamily;
- (void)cancelPickingValue;
- (void)configureCell:(id)a3 forState:(id)a4;
- (void)configureCell:(id)a3 forVariable:(id)a4;
- (void)displayError:(id)a3;
- (void)displayNoOptionsAvailableMessageIfNeeded;
- (void)finishPickingValue;
- (void)loadView;
- (void)parameterAttributesDidChange:(id)a3;
- (void)parameterValuePickerTableViewCell:(id)a3 didToggleSelection:(BOOL)a4;
- (void)performSearchWithUserInput:(id)a3;
- (void)reloadChoosingPrompt;
- (void)reloadDisplayingValuesWithCollection:(id)a3 searchTerm:(id)a4 validateCurrentState:(BOOL)a5 animatingDifferences:(BOOL)a6;
- (void)reloadNavigationBarButtonItems;
- (void)requestRemovingItem;
- (void)resetVisibleCellsSelection;
- (void)searchBar:(id)a3 textDidChange:(id)a4;
- (void)searchBarSearchButtonClicked:(id)a3;
- (void)setAllowedVariableTypes:(id)a3;
- (void)setAllowsMultipleSelection:(BOOL)a3;
- (void)setCachedPrompts:(id)a3;
- (void)setCachedResults:(id)a3;
- (void)setCurrentState:(id)a3;
- (void)setCustomPrompt:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDefaultPrompt:(id)a3;
- (void)setDefaultResults:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setErrorMessageLabel:(id)a3;
- (void)setErrorMessageView:(id)a3;
- (void)setErrorTitleLabel:(id)a3;
- (void)setHasScrolledToSelectedItem:(BOOL)a3;
- (void)setInputDebouncer:(id)a3;
- (void)setMaximumSelectableItemsCount:(int64_t)a3;
- (void)setNoOptionAvailableTitle:(id)a3;
- (void)setRemoveItemButtonTitle:(id)a3;
- (void)setSearchBar:(id)a3;
- (void)setSearchController:(id)a3;
- (void)setShowsCancelButton:(BOOL)a3;
- (void)setShowsPrompt:(BOOL)a3;
- (void)setVariableProvider:(id)a3;
- (void)setVariableUIDelegate:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)toggleCell:(id)a3 atIndexPath:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)updateSearchResultsFromCurrentUserInput;
- (void)validateCurrentStateWithCollection:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation WFParameterValuePickerViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorMessageLabel, 0);
  objc_storeStrong((id *)&self->_errorTitleLabel, 0);
  objc_storeStrong((id *)&self->_searchBar, 0);
  objc_storeStrong((id *)&self->_errorMessageView, 0);
  objc_storeStrong((id *)&self->_allowedVariableTypes, 0);
  objc_storeStrong((id *)&self->_inputDebouncer, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_customPrompt, 0);
  objc_storeStrong((id *)&self->_defaultPrompt, 0);
  objc_storeStrong((id *)&self->_defaultResults, 0);
  objc_storeStrong((id *)&self->_cachedPrompts, 0);
  objc_storeStrong((id *)&self->_cachedResults, 0);
  objc_storeStrong((id *)&self->_removeItemButtonTitle, 0);
  objc_storeStrong((id *)&self->_noOptionAvailableTitle, 0);
  objc_destroyWeak((id *)&self->_variableUIDelegate);
  objc_destroyWeak((id *)&self->_variableProvider);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_storeStrong((id *)&self->_parameter, 0);
  objc_storeStrong((id *)&self->_cancelBarButtonItem, 0);
  objc_storeStrong((id *)&self->_removeItemBarButtonItem, 0);
  objc_storeStrong((id *)&self->_doneBarButtonItem, 0);
}

- (void)setHasScrolledToSelectedItem:(BOOL)a3
{
  self->_hasScrolledToSelectedItem = a3;
}

- (BOOL)hasScrolledToSelectedItem
{
  return self->_hasScrolledToSelectedItem;
}

- (void)setErrorMessageLabel:(id)a3
{
}

- (UILabel)errorMessageLabel
{
  return self->_errorMessageLabel;
}

- (void)setErrorTitleLabel:(id)a3
{
}

- (UILabel)errorTitleLabel
{
  return self->_errorTitleLabel;
}

- (void)setSearchBar:(id)a3
{
}

- (UISearchBar)searchBar
{
  return self->_searchBar;
}

- (void)setErrorMessageView:(id)a3
{
}

- (UIView)errorMessageView
{
  return self->_errorMessageView;
}

- (void)setMaximumSelectableItemsCount:(int64_t)a3
{
  self->_maximumSelectableItemsCount = a3;
}

- (int64_t)maximumSelectableItemsCount
{
  return self->_maximumSelectableItemsCount;
}

- (void)setAllowedVariableTypes:(id)a3
{
}

- (NSSet)allowedVariableTypes
{
  return self->_allowedVariableTypes;
}

- (void)setInputDebouncer:(id)a3
{
}

- (WFDebouncer)inputDebouncer
{
  return self->_inputDebouncer;
}

- (void)setDataSource:(id)a3
{
}

- (WFParameterValuePickerDataSource)dataSource
{
  return self->_dataSource;
}

- (NSString)customPrompt
{
  return self->_customPrompt;
}

- (NSString)defaultPrompt
{
  return self->_defaultPrompt;
}

- (void)setDefaultResults:(id)a3
{
}

- (INObjectCollection)defaultResults
{
  return self->_defaultResults;
}

- (void)setCachedPrompts:(id)a3
{
}

- (NSMutableDictionary)cachedPrompts
{
  return self->_cachedPrompts;
}

- (void)setCachedResults:(id)a3
{
}

- (NSMutableDictionary)cachedResults
{
  return self->_cachedResults;
}

- (BOOL)showsCancelButton
{
  return self->_showsCancelButton;
}

- (NSString)removeItemButtonTitle
{
  return self->_removeItemButtonTitle;
}

- (NSString)noOptionAvailableTitle
{
  return self->_noOptionAvailableTitle;
}

- (BOOL)allowsMultipleSelection
{
  return self->_allowsMultipleSelection;
}

- (WFVariableUIDelegate)variableUIDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_variableUIDelegate);
  return (WFVariableUIDelegate *)WeakRetained;
}

- (WFVariableProvider)variableProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_variableProvider);
  return (WFVariableProvider *)WeakRetained;
}

- (void)setSearchController:(id)a3
{
}

- (UISearchController)searchController
{
  return self->_searchController;
}

- (void)setDelegate:(id)a3
{
}

- (WFParameterValuePickerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFParameterValuePickerViewControllerDelegate *)WeakRetained;
}

- (void)setCurrentState:(id)a3
{
}

- (WFVariableSubstitutableParameterState)currentState
{
  return self->_currentState;
}

- (int64_t)widgetFamily
{
  return self->_widgetFamily;
}

- (WFParameterValuePickable)parameter
{
  return self->_parameter;
}

- (BOOL)accessibilityPerformEscape
{
  return 1;
}

- (void)parameterValuePickerTableViewCell:(id)a3 didToggleSelection:(BOOL)a4
{
  id v5 = a3;
  v6 = [(WFParameterValuePickerViewController *)self tableView];
  id v7 = [v6 indexPathForCell:v5];

  [(WFParameterValuePickerViewController *)self toggleCell:v5 atIndexPath:v7];
}

- (void)parameterAttributesDidChange:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __69__WFParameterValuePickerViewController_parameterAttributesDidChange___block_invoke;
  v3[3] = &unk_264BFD408;
  v3[4] = self;
  objc_msgSend(a3, "wf_reloadFromAttributesDidChangeWithCompletionHandler:", v3);
}

void __69__WFParameterValuePickerViewController_parameterAttributesDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __69__WFParameterValuePickerViewController_parameterAttributesDidChange___block_invoke_2;
  v6[3] = &unk_264BFD500;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __69__WFParameterValuePickerViewController_parameterAttributesDidChange___block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (v1) {
    return [*(id *)(result + 40) reloadDisplayingValuesWithCollection:v1 searchTerm:0 validateCurrentState:1 animatingDifferences:1];
  }
  return result;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v8;
  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v11 = v10;
    }
    else {
      v11 = 0;
    }
    id v12 = v11;

    id v13 = v10;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v14 = v13;
    }
    else {
      v14 = 0;
    }
  }
  else
  {
    id v12 = 0;
    v14 = 0;
  }
  id v15 = v14;

  v16 = [(WFParameterValuePickerViewController *)self dataSource];
  v17 = [v16 parameterStateAtIndexPath:v9];

  BOOL v18 = [(WFParameterValuePickerViewController *)self currentSelectedValuesContainsState:v17];
  if (v18) {
    uint64_t v19 = 3;
  }
  else {
    uint64_t v19 = 0;
  }
  [v12 setContainedInState:v18];
  [v15 setAccessoryType:v19];
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(WFParameterValuePickerViewController *)self dataSource];
  id v8 = [v7 tableView:v6 titleForHeaderInSection:a4];

  if (v8)
  {
    id v9 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:@"WFParameterValuePickerSectionHeaderView"];
    id v10 = [v9 defaultContentConfiguration];
    [v10 setText:v8];
    [v9 setContentConfiguration:v10];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (double)tableView:(id)a3 estimatedHeightForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(WFParameterValuePickerViewController *)self dataSource];
  id v8 = [v7 tableView:v6 titleForHeaderInSection:a4];

  if (v8) {
    double v9 = 22.0;
  }
  else {
    double v9 = 0.0;
  }

  return v9;
}

- (BOOL)tableView:(id)a3 shouldHaveFullLengthBottomSeparatorForSection:(int64_t)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(WFParameterValuePickerViewController *)self dataSource];
  unint64_t v8 = [v7 sectionsCount] - 1;

  if (v8 <= a4)
  {
    id v10 = [MEMORY[0x263F086E0] mainBundle];
    char v11 = objc_msgSend(v10, "wf_isWidgetConfigurationExtensionBundle");
  }
  else
  {
    double v9 = [(WFParameterValuePickerViewController *)self dataSource];
    id v10 = [v9 tableView:v6 titleForHeaderInSection:a4 + 1];

    char v11 = [v10 length] == 0;
  }

  return v11;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(WFParameterValuePickerViewController *)self parameter];
  char v8 = objc_msgSend(v7, "wf_usesTogglesForSelection");

  if ((v8 & 1) == 0)
  {
    [v10 deselectRowAtIndexPath:v6 animated:1];
    double v9 = [v10 cellForRowAtIndexPath:v6];
    [(WFParameterValuePickerViewController *)self toggleCell:v9 atIndexPath:v6];
  }
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([(WFParameterValuePickerViewController *)self maximumSelectableItemsCount] < 2
    || [(WFParameterValuePickerViewController *)self maximumSelectableItemsCount] == 0x7FFFFFFFFFFFFFFFLL)
  {
    goto LABEL_3;
  }
  char v8 = [(WFParameterValuePickerViewController *)self dataSource];
  double v9 = [v8 parameterStateAtIndexPath:v5];

  if ([(WFParameterValuePickerViewController *)self currentSelectedValuesContainsState:v9])
  {
    id v6 = v5;
  }
  else
  {
    id v10 = [(WFParameterValuePickerViewController *)self currentState];
    if (v10)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        char v11 = v10;
      }
      else {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
    id v12 = v11;

    id v13 = [v12 parameterStates];

    unint64_t v14 = [v13 count];
    unint64_t v15 = [(WFParameterValuePickerViewController *)self maximumSelectableItemsCount];

    if (v14 < v15)
    {

LABEL_3:
      id v6 = v5;
      goto LABEL_4;
    }
    id v6 = 0;
  }

LABEL_4:
  return v6;
}

- (void)toggleCell:(id)a3 atIndexPath:(id)a4
{
  v41[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      double v9 = v8;
    }
    else {
      double v9 = 0;
    }
    id v10 = v9;

    id v11 = v8;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v12 = v11;
    }
    else {
      id v12 = 0;
    }
  }
  else
  {
    id v10 = 0;
    id v12 = 0;
  }
  id v13 = v12;

  unint64_t v14 = [(WFParameterValuePickerViewController *)self dataSource];
  unint64_t v15 = [v14 parameterStateAtIndexPath:v7];

  v16 = [v15 variable];
  int v17 = [v16 isEqual:*MEMORY[0x263F874E0]];

  if (!v17)
  {
    if (![(WFParameterValuePickerViewController *)self allowsMultipleSelection]
      || ([(WFParameterValuePickerViewController *)self parameter],
          uint64_t v19 = objc_claimAutoreleasedReturnValue(),
          [v19 multipleStateClass],
          char isKindOfClass = objc_opt_isKindOfClass(),
          v19,
          (isKindOfClass & 1) != 0))
    {
      [(WFParameterValuePickerViewController *)self setCurrentState:v15];
      [(WFParameterValuePickerViewController *)self finishPickingValue];
      goto LABEL_26;
    }
    v21 = [(WFParameterValuePickerViewController *)self currentState];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = [(WFParameterValuePickerViewController *)self currentState];
      v23 = [v22 variable];

      if (!v23)
      {
        BOOL v24 = [(WFParameterValuePickerViewController *)self currentSelectedValuesContainsState:v15];
        v25 = [(WFParameterValuePickerViewController *)self currentState];
        BOOL v18 = v25;
        if (v24)
        {
          v26 = [v25 parameterStates];
          uint64_t v35 = MEMORY[0x263EF8330];
          uint64_t v36 = 3221225472;
          v37 = __63__WFParameterValuePickerViewController_toggleCell_atIndexPath___block_invoke_3;
          v38 = &unk_264BFD348;
          id v39 = v15;
          uint64_t v27 = [v26 indexOfObjectPassingTest:&v35];

          if (v27 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v28 = objc_msgSend(v18, "stateByRemovingValueAtIndex:", v27, v35, v36, v37, v38);
            [(WFParameterValuePickerViewController *)self setCurrentState:v28];

            [v10 setContainedInState:0];
            [v13 setAccessoryType:0];
          }

          goto LABEL_11;
        }
        v34 = [v25 stateByAppendingValue:v15];
        [(WFParameterValuePickerViewController *)self setCurrentState:v34];

LABEL_25:
        [v10 setContainedInState:1];
        [v13 setAccessoryType:3];
        goto LABEL_26;
      }
    }
    else
    {
    }
    v29 = [(WFParameterValuePickerViewController *)self currentState];
    v30 = [v29 variable];

    if (v30) {
      [(WFParameterValuePickerViewController *)self resetVisibleCellsSelection];
    }
    id v31 = objc_alloc(MEMORY[0x263F86D10]);
    v41[0] = v15;
    v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:1];
    v33 = (void *)[v31 initWithParameterStates:v32];
    [(WFParameterValuePickerViewController *)self setCurrentState:v33];

    goto LABEL_25;
  }
  BOOL v18 = [(WFParameterValuePickerViewController *)self presentingViewController];
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __63__WFParameterValuePickerViewController_toggleCell_atIndexPath___block_invoke;
  v40[3] = &unk_264BFDBA0;
  v40[4] = self;
  [v18 dismissViewControllerAnimated:1 completion:v40];
LABEL_11:

LABEL_26:
}

void __63__WFParameterValuePickerViewController_toggleCell_atIndexPath___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) allowedVariableTypes];
  uint64_t v3 = [v2 containsObject:*MEMORY[0x263F87510]];

  uint64_t v4 = [*(id *)(a1 + 32) variableUIDelegate];
  id v5 = [*(id *)(a1 + 32) variableProvider];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __63__WFParameterValuePickerViewController_toggleCell_atIndexPath___block_invoke_2;
  v6[3] = &unk_264BFD458;
  void v6[4] = *(void *)(a1 + 32);
  [v4 showActionOutputPickerAllowingShortcutInput:v3 variableProvider:v5 completionHandler:v6];
}

uint64_t __63__WFParameterValuePickerViewController_toggleCell_atIndexPath___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 stateIsEquivalent:*(void *)(a1 + 32)];
  *a4 = result;
  return result;
}

void __63__WFParameterValuePickerViewController_toggleCell_atIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v8 = v3;
  if (v3)
  {
    id v5 = [v4 parameter];
    id v6 = (objc_class *)[v5 stateClass];

    id v7 = (void *)[[v6 alloc] initWithVariable:v8];
    [*(id *)(a1 + 32) setCurrentState:v7];
    [*(id *)(a1 + 32) finishPickingValue];
  }
  else
  {
    [v4 cancelPickingValue];
  }
}

- (void)resetVisibleCellsSelection
{
  id v3 = [(WFParameterValuePickerViewController *)self tableView];
  v2 = [v3 visibleCells];
  [v2 enumerateObjectsUsingBlock:&__block_literal_global_3054];
}

void __66__WFParameterValuePickerViewController_resetVisibleCellsSelection__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v2 = v7;
    }
    else {
      v2 = 0;
    }
    id v3 = v2;

    id v4 = v7;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v3 = 0;
    id v5 = 0;
  }
  id v6 = v5;

  [v3 setContainedInState:0];
  [v6 setAccessoryType:0];
}

- (void)requestRemovingItem
{
  if ([(WFParameterValuePickerViewController *)self allowsMultipleSelection])
  {
    [(WFParameterValuePickerViewController *)self setCurrentState:0];
    [(WFParameterValuePickerViewController *)self resetVisibleCellsSelection];
  }
  else
  {
    id v3 = [(WFParameterValuePickerViewController *)self delegate];
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      id v5 = [(WFParameterValuePickerViewController *)self delegate];
      [v5 parameterValuePickerViewControllerDidRequestRemovingItem:self];
    }
  }
}

- (void)cancelPickingValue
{
  id v3 = [(WFParameterValuePickerViewController *)self searchController];
  [v3 setActive:0];

  char v4 = [(WFParameterValuePickerViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(WFParameterValuePickerViewController *)self delegate];
    [v6 parameterValuePickerViewControllerDidCancel:self];
  }
}

- (void)finishPickingValue
{
  id v3 = [(WFParameterValuePickerViewController *)self searchController];
  [v3 setActive:0];

  char v4 = [(WFParameterValuePickerViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v7 = [(WFParameterValuePickerViewController *)self delegate];
    id v6 = [(WFParameterValuePickerViewController *)self currentState];
    [v7 parameterValuePickerViewController:self didFinishWithParameterState:v6];
  }
}

- (void)updateSearchResultsFromCurrentUserInput
{
  id v3 = [(WFParameterValuePickerViewController *)self searchBar];
  id v5 = [v3 text];

  if ([v5 length])
  {
    id v4 = v5;
  }
  else
  {

    id v4 = 0;
  }
  id v6 = v4;
  [(WFParameterValuePickerViewController *)self performSearchWithUserInput:v4];
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  id v3 = [(WFParameterValuePickerViewController *)self searchBar];
  [v3 resignFirstResponder];
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v4 = [(WFParameterValuePickerViewController *)self inputDebouncer];
  [v4 poke];
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  if ([a3 isActive])
  {
    id v4 = [(WFParameterValuePickerViewController *)self inputDebouncer];
    [v4 poke];
  }
}

- (void)performSearchWithUserInput:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = [(WFParameterValuePickerViewController *)self cachedResults];
    id v6 = [v5 objectForKey:v4];

    id v7 = [(WFParameterValuePickerViewController *)self cachedPrompts];
    id v8 = [v7 objectForKey:v4];

    BOOL v9 = 1;
    if (v6)
    {
LABEL_3:
      [(WFParameterValuePickerViewController *)self reloadDisplayingValuesWithCollection:v6 searchTerm:v4 validateCurrentState:1 animatingDifferences:1];
      [(WFParameterValuePickerViewController *)self setCustomPrompt:v8];
      goto LABEL_12;
    }
  }
  else
  {
    id v6 = [(WFParameterValuePickerViewController *)self defaultResults];
    id v8 = [(WFParameterValuePickerViewController *)self defaultPrompt];
    BOOL v9 = v6 != 0;
    if (v6) {
      goto LABEL_3;
    }
  }
  if (v4
    && ([(WFParameterValuePickerViewController *)self parameter],
        id v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = objc_msgSend(v10, "wf_supportsSearch"),
        v10,
        !v11))
  {
    id v13 = [(WFParameterValuePickerViewController *)self defaultResults];
    unint64_t v14 = v13;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      id v16 = objc_alloc(MEMORY[0x263F0FCB8]);
      id v15 = (id)[v16 initWithItems:MEMORY[0x263EFFA68]];
    }
    int v17 = v15;

    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    v22 = __67__WFParameterValuePickerViewController_performSearchWithUserInput___block_invoke_3;
    v23 = &unk_264BFD3C0;
    BOOL v24 = self;
    id v18 = v4;
    id v25 = v18;
    uint64_t v19 = objc_msgSend(v17, "wf_filteredCollectionUsingBlock:", &v20);
    -[WFParameterValuePickerViewController reloadDisplayingValuesWithCollection:searchTerm:validateCurrentState:animatingDifferences:](self, "reloadDisplayingValuesWithCollection:searchTerm:validateCurrentState:animatingDifferences:", v19, v18, 0, v9, v20, v21, v22, v23, v24);
  }
  else
  {
    objc_initWeak(&location, self);
    id v12 = [(WFParameterValuePickerViewController *)self parameter];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __67__WFParameterValuePickerViewController_performSearchWithUserInput___block_invoke;
    v26[3] = &unk_264BFD398;
    objc_copyWeak(&v28, &location);
    id v27 = v4;
    BOOL v29 = v9;
    objc_msgSend(v12, "wf_loadStatesWithSearchTerm:completionHandler:", v27, v26);

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
LABEL_12:
}

void __67__WFParameterValuePickerViewController_performSearchWithUserInput___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v11 = WeakRetained;
  if (v9)
  {
    [WeakRetained displayError:v9];
  }
  else
  {
    if (v7)
    {
      id v12 = v7;
    }
    else
    {
      id v13 = objc_alloc(MEMORY[0x263F0FCB8]);
      id v12 = (id)[v13 initWithItems:MEMORY[0x263EFFA68]];
    }
    unint64_t v14 = v12;
    [v11 reloadDisplayingValuesWithCollection:v12 searchTerm:*(void *)(a1 + 32) validateCurrentState:1 animatingDifferences:*(unsigned __int8 *)(a1 + 48)];
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__WFParameterValuePickerViewController_performSearchWithUserInput___block_invoke_2;
  block[3] = &unk_264BFD4B0;
  block[4] = v11;
  id v17 = v8;
  id v18 = *(id *)(a1 + 32);
  id v15 = v8;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __67__WFParameterValuePickerViewController_performSearchWithUserInput___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 parameter];
  id v6 = objc_msgSend(v5, "wf_pickerLocalizedTitleForState:", v4);

  uint64_t v7 = [v6 localizedStandardContainsString:*(void *)(a1 + 40)];
  return v7;
}

void __67__WFParameterValuePickerViewController_performSearchWithUserInput___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setCustomPrompt:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    id v3 = [*(id *)(a1 + 32) defaultPrompt];
  }
  id v4 = v3;
  id v5 = *(void **)(a1 + 32);
  id v7 = v4;
  if (*(void *)(a1 + 48))
  {
    id v6 = [v5 cachedPrompts];
    [v6 setObject:v7 forKeyedSubscript:*(void *)(a1 + 48)];
  }
  else
  {
    [v5 setDefaultPrompt:v4];
  }
}

- (void)reloadDisplayingValuesWithCollection:(id)a3 searchTerm:(id)a4 validateCurrentState:(BOOL)a5 animatingDifferences:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v19 = a3;
  id v10 = a4;
  if ([v10 length])
  {
    int v11 = [(WFParameterValuePickerViewController *)self cachedResults];
    [v11 setObject:v19 forKeyedSubscript:v10];

    if (!v7) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  [(WFParameterValuePickerViewController *)self setDefaultResults:v19];
  if (v7) {
LABEL_3:
  }
    [(WFParameterValuePickerViewController *)self validateCurrentStateWithCollection:v19];
LABEL_4:
  id v12 = [(WFParameterValuePickerViewController *)self searchBar];
  id v13 = [v12 text];

  if (![v13 length])
  {

    id v13 = 0;
  }
  id v14 = v13;
  id v15 = v10;
  id v16 = v15;
  if (v14 == v15)
  {

LABEL_14:
    if ([(WFParameterValuePickerViewController *)self isViewLoaded])
    {
      id v18 = [(WFParameterValuePickerViewController *)self dataSource];
      [v18 applyCollection:v19 animatingDifferences:v6 filterVariableTitle:v16];

      [(WFParameterValuePickerViewController *)self displayNoOptionsAvailableMessageIfNeeded];
    }
    goto LABEL_17;
  }
  if (!v15 || !v14)
  {

    goto LABEL_17;
  }
  int v17 = [v14 isEqualToString:v15];

  if (v17) {
    goto LABEL_14;
  }
LABEL_17:
}

- (void)validateCurrentStateWithCollection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFParameterValuePickerViewController *)self currentState];
  if (v5)
  {
    BOOL v6 = (void *)v5;
    BOOL v7 = [(WFParameterValuePickerViewController *)self parameter];
    if (objc_msgSend(v7, "wf_shouldValidateCurrentStateOnCollectionChanged"))
    {
      id v8 = [(WFParameterValuePickerViewController *)self currentState];
      id v9 = [v8 variable];

      if (!v9)
      {
        aBlock[0] = MEMORY[0x263EF8330];
        aBlock[1] = 3221225472;
        aBlock[2] = __75__WFParameterValuePickerViewController_validateCurrentStateWithCollection___block_invoke;
        aBlock[3] = &unk_264BFD370;
        id v22 = v4;
        id v10 = (uint64_t (**)(void *, void *))_Block_copy(aBlock);
        int v11 = [(WFParameterValuePickerViewController *)self currentState];
        if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v12 = [v11 parameterStates];
          id v13 = objc_msgSend(v12, "if_objectsPassingTest:", v10);

          id v14 = [v11 parameterStates];
          char v15 = [v14 isEqual:v13];

          if ((v15 & 1) == 0)
          {
            id v16 = [(WFParameterValuePickerViewController *)self parameter];
            int v17 = (objc_class *)[v16 multipleStateClass];

            if ([v13 count])
            {
              id v18 = (void *)[[v17 alloc] initWithParameterStates:v13];
              [(WFParameterValuePickerViewController *)self setCurrentState:v18];
            }
            else
            {
              [(WFParameterValuePickerViewController *)self setCurrentState:0];
            }
          }
        }
        else
        {

          id v19 = [(WFParameterValuePickerViewController *)self currentState];
          char v20 = v10[2](v10, v19);

          if ((v20 & 1) == 0) {
            [(WFParameterValuePickerViewController *)self setCurrentState:0];
          }
        }
      }
    }
    else
    {
    }
  }
}

BOOL __75__WFParameterValuePickerViewController_validateCurrentStateWithCollection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) allItems];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __75__WFParameterValuePickerViewController_validateCurrentStateWithCollection___block_invoke_2;
  v8[3] = &unk_264BFD348;
  id v9 = v3;
  id v5 = v3;
  BOOL v6 = [v4 indexOfObjectPassingTest:v8] != 0x7FFFFFFFFFFFFFFFLL;

  return v6;
}

uint64_t __75__WFParameterValuePickerViewController_validateCurrentStateWithCollection___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) stateIsEquivalent:a2];
  *a4 = result;
  return result;
}

- (BOOL)currentSelectedValueIsVariable:(id)a3
{
  id v4 = a3;
  id v5 = [(WFParameterValuePickerViewController *)self currentState];
  BOOL v6 = [v5 variable];

  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v7 = [v4 isEqual:*MEMORY[0x263F874E0]];
    }
    else
    {
      id v8 = [v6 name];
      id v9 = v4;
      if (v9)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v10 = v9;
        }
        else {
          id v10 = 0;
        }
      }
      else
      {
        id v10 = 0;
      }
      id v11 = v10;

      id v12 = [v11 name];

      char v7 = [v8 isEqualToString:v12];
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)currentSelectedValuesContainsState:(id)a3
{
  id v4 = a3;
  id v5 = [(WFParameterValuePickerViewController *)self currentState];
  if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    id v5 = 0;
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
LABEL_6:
    id v8 = [(WFParameterValuePickerViewController *)self currentState];
    char v7 = [v8 stateIsEquivalent:v4];

    goto LABEL_7;
  }
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  BOOL v6 = [v5 parameterStates];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __75__WFParameterValuePickerViewController_currentSelectedValuesContainsState___block_invoke;
  v10[3] = &unk_264BFD320;
  id v12 = &v13;
  id v11 = v4;
  [v6 enumerateObjectsUsingBlock:v10];

  char v7 = *((unsigned char *)v14 + 24) != 0;
  _Block_object_dispose(&v13, 8);
LABEL_7:

  return v7;
}

uint64_t __75__WFParameterValuePickerViewController_currentSelectedValuesContainsState___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 stateIsEquivalent:*(void *)(a1 + 32)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  return result;
}

- (void)displayNoOptionsAvailableMessageIfNeeded
{
  id v3 = [(WFParameterValuePickerViewController *)self errorTitleLabel];
  [v3 setText:0];

  id v4 = [(WFParameterValuePickerViewController *)self noOptionAvailableTitle];
  id v5 = [(WFParameterValuePickerViewController *)self errorMessageLabel];
  [v5 setText:v4];

  id v9 = [(WFParameterValuePickerViewController *)self dataSource];
  uint64_t v6 = [v9 itemsCount];
  if (v6)
  {
    char v7 = 0;
  }
  else
  {
    char v7 = [(WFParameterValuePickerViewController *)self errorMessageView];
  }
  id v8 = [(WFParameterValuePickerViewController *)self tableView];
  [v8 setBackgroundView:v7];

  if (!v6) {
}
  }

- (void)displayError:(id)a3
{
  if (a3)
  {
    id v4 = -[WFParameterValuePickerViewController extractIntentsExecutionErrorFromError:](self, "extractIntentsExecutionErrorFromError:");
    id v5 = [v4 localizedDescription];
    uint64_t v6 = [(WFParameterValuePickerViewController *)self errorTitleLabel];
    [v6 setText:v5];

    char v7 = [v4 localizedFailureReason];
    id v8 = [(WFParameterValuePickerViewController *)self errorMessageLabel];
    [v8 setText:v7];

    id v9 = [(WFParameterValuePickerViewController *)self dataSource];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __53__WFParameterValuePickerViewController_displayError___block_invoke;
    v10[3] = &unk_264BFDBA0;
    void v10[4] = self;
    [v9 applyEmptyCollectionAnimatingDifferences:1 completion:v10];
  }
}

void __53__WFParameterValuePickerViewController_displayError___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) errorMessageView];
  v2 = [*(id *)(a1 + 32) tableView];
  [v2 setBackgroundView:v3];
}

- (id)extractIntentsExecutionErrorFromError:(id)a3
{
  id v4 = a3;
  id v5 = [v4 userInfo];
  uint64_t v6 = *MEMORY[0x263F08608];
  char v7 = [v5 objectForKeyedSubscript:*MEMORY[0x263F08608]];

  if (v7)
  {
    id v8 = [v4 domain];
    if ([v8 isEqualToString:*MEMORY[0x263F87230]])
    {

LABEL_5:
      id v11 = [v4 userInfo];
      id v12 = [v11 objectForKeyedSubscript:v6];

      if (v12)
      {
        id v13 = [(WFParameterValuePickerViewController *)self extractIntentsExecutionErrorFromError:v12];
      }
      else
      {
        id v13 = v4;
      }
      id v14 = v13;

      goto LABEL_10;
    }
    id v9 = [v4 domain];
    char v10 = [v9 isEqualToString:*MEMORY[0x263F101F0]];

    if (v10) {
      goto LABEL_5;
    }
  }
  id v14 = v4;
LABEL_10:

  return v14;
}

- (void)reloadChoosingPrompt
{
  if ([(WFParameterValuePickerViewController *)self showsPrompt])
  {
    id v3 = [(WFParameterValuePickerViewController *)self customPrompt];
    id v4 = v3;
    if (v3)
    {
      id v5 = v3;
    }
    else
    {
      id v5 = [(WFParameterValuePickerViewController *)self defaultPrompt];
    }
    id v7 = v5;
  }
  else
  {
    id v7 = 0;
  }
  uint64_t v6 = [(WFParameterValuePickerViewController *)self navigationItem];
  [v6 setPrompt:v7];
}

- (void)reloadNavigationBarButtonItems
{
  if ([(WFParameterValuePickerViewController *)self allowsMultipleSelection])
  {
    uint64_t v3 = [(WFParameterValuePickerViewController *)self doneBarButtonItem];
LABEL_5:
    id v7 = (id)v3;
    goto LABEL_7;
  }
  if ([(WFParameterValuePickerViewController *)self showsCancelButton])
  {
    uint64_t v3 = [(WFParameterValuePickerViewController *)self cancelBarButtonItem];
    goto LABEL_5;
  }
  id v7 = 0;
LABEL_7:
  id v4 = [(WFParameterValuePickerViewController *)self removeItemBarButtonItem];
  id v5 = [(WFParameterValuePickerViewController *)self navigationItem];
  [v5 setRightBarButtonItem:v7];

  uint64_t v6 = [(WFParameterValuePickerViewController *)self navigationItem];
  [v6 setLeftBarButtonItem:v4];
}

- (void)configureCell:(id)a3 forVariable:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [v6 name];
      id v8 = [v6 icon];
      [v13 updateWithName:v7 icon:v8];
      id v9 = v6;
LABEL_6:

      goto LABEL_8;
    }
  }

  if ([v6 isEqual:*MEMORY[0x263F874E0]])
  {
    id v7 = WFLocalizedString(@"Select Variable");
    id v10 = objc_alloc(MEMORY[0x263F85438]);
    id v8 = [MEMORY[0x263F852F8] clearBackground];
    id v11 = (void *)[v10 initWithSymbolName:@"wand.and.stars" background:v8];
    [v13 updateWithName:v7 icon:v11];

    id v9 = 0;
    goto LABEL_6;
  }
  id v9 = 0;
LABEL_8:
  if ([(WFParameterValuePickerViewController *)self currentSelectedValueIsVariable:v6])
  {
    uint64_t v12 = 3;
  }
  else
  {
    uint64_t v12 = 0;
  }
  [v13 setAccessoryType:v12];
}

- (void)configureCell:(id)a3 forState:(id)a4
{
  id v6 = a4;
  id v11 = a3;
  id v7 = [(WFParameterValuePickerViewController *)self parameter];
  [v11 setParameter:v7];

  [v11 setState:v6];
  BOOL v8 = [(WFParameterValuePickerViewController *)self currentSelectedValuesContainsState:v6];

  [v11 setContainedInState:v8];
  id v9 = [(WFParameterValuePickerViewController *)self parameter];
  if (objc_msgSend(v9, "wf_usesTogglesForSelection")) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = 3;
  }
  [v11 setSelectionStyle:v10];

  [v11 setParentViewController:self];
  [v11 setDelegate:self];
}

- (void)traitCollectionDidChange:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)WFParameterValuePickerViewController;
  id v4 = a3;
  [(WFParameterValuePickerViewController *)&v12 traitCollectionDidChange:v4];
  id v5 = [(WFParameterValuePickerViewController *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];
  uint64_t v7 = [v4 userInterfaceStyle];

  if (v6 != v7)
  {
    BOOL v8 = [(WFParameterValuePickerViewController *)self traitCollection];
    uint64_t v9 = [v8 userInterfaceStyle];
    if (v9 == 1) {
      uint64_t v10 = 2;
    }
    else {
      uint64_t v10 = v9 == 2;
    }
    id v11 = [(WFParameterValuePickerViewController *)self searchBar];
    [v11 setKeyboardAppearance:v10];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v23.receiver = self;
  v23.super_class = (Class)WFParameterValuePickerViewController;
  [(WFParameterValuePickerViewController *)&v23 viewWillAppear:a3];
  if (![(WFParameterValuePickerViewController *)self hasScrolledToSelectedItem])
  {
    [(WFParameterValuePickerViewController *)self setHasScrolledToSelectedItem:1];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v4 = [(WFParameterValuePickerViewController *)self dataSource];
    id v5 = [v4 collection];
    uint64_t v6 = [v5 allItems];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = 0;
      uint64_t v10 = 0;
      uint64_t v11 = *(void *)v20;
      while (2)
      {
        uint64_t v12 = 0;
        id v13 = v9;
        id v14 = v10;
        do
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v6);
          }
          uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8 * v12);
          char v16 = [(WFParameterValuePickerViewController *)self dataSource];
          uint64_t v10 = [v16 indexPathForItemIdentifier:v15];

          int v17 = [(WFParameterValuePickerViewController *)self dataSource];
          uint64_t v9 = [v17 parameterStateAtIndexPath:v10];

          if ([(WFParameterValuePickerViewController *)self currentSelectedValuesContainsState:v9])
          {
            id v18 = [(WFParameterValuePickerViewController *)self tableView];
            [v18 scrollToRowAtIndexPath:v10 atScrollPosition:2 animated:0];

            goto LABEL_12;
          }
          ++v12;
          id v13 = v9;
          id v14 = v10;
        }
        while (v8 != v12);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v24 count:16];
        if (v8) {
          continue;
        }
        break;
      }
LABEL_12:
    }
  }
}

- (void)viewDidLoad
{
  v33.receiver = self;
  v33.super_class = (Class)WFParameterValuePickerViewController;
  [(WFParameterValuePickerViewController *)&v33 viewDidLoad];
  uint64_t v3 = [(WFParameterValuePickerViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"ParameterStateCell"];

  id v4 = [(WFParameterValuePickerViewController *)self tableView];
  [v4 registerClass:objc_opt_class() forCellReuseIdentifier:@"ParameterVariableCell"];

  id v5 = [(WFParameterValuePickerViewController *)self tableView];
  [v5 registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:@"WFParameterValuePickerSectionHeaderView"];

  BOOL v6 = [(WFParameterValuePickerViewController *)self allowsMultipleSelection];
  uint64_t v7 = [(WFParameterValuePickerViewController *)self tableView];
  [v7 setAllowsMultipleSelection:v6];

  uint64_t v8 = [(WFParameterValuePickerViewController *)self tableView];
  [v8 setEstimatedRowHeight:44.0];

  double v9 = *MEMORY[0x263F839B8];
  uint64_t v10 = [(WFParameterValuePickerViewController *)self tableView];
  [v10 setRowHeight:v9];

  objc_initWeak(&location, self);
  uint64_t v11 = [WFParameterValuePickerDataSource alloc];
  uint64_t v12 = [(WFParameterValuePickerViewController *)self parameter];
  id v13 = [(WFParameterValuePickerViewController *)self tableView];
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  BOOL v29 = __51__WFParameterValuePickerViewController_viewDidLoad__block_invoke;
  v30 = &unk_264BFD2F8;
  objc_copyWeak(&v31, &location);
  id v14 = [(WFParameterValuePickerDataSource *)v11 initWithParameter:v12 tableView:v13 cellProvider:&v27];
  -[WFParameterValuePickerViewController setDataSource:](self, "setDataSource:", v14, v27, v28, v29, v30);

  uint64_t v15 = [(WFParameterValuePickerViewController *)self variableProvider];
  char v16 = [(WFParameterValuePickerViewController *)self dataSource];
  [v16 setVariableProvider:v15];

  int v17 = [(WFParameterValuePickerViewController *)self variableUIDelegate];
  id v18 = [(WFParameterValuePickerViewController *)self dataSource];
  [v18 setVariableUIDelegate:v17];

  long long v19 = [(WFParameterValuePickerViewController *)self allowedVariableTypes];
  long long v20 = [(WFParameterValuePickerViewController *)self dataSource];
  [v20 setAllowedVariableTypes:v19];

  long long v21 = [(WFParameterValuePickerViewController *)self dataSource];
  [v21 setDefaultRowAnimation:0];

  long long v22 = [(WFParameterValuePickerViewController *)self defaultResults];

  if (v22)
  {
    objc_super v23 = [(WFParameterValuePickerViewController *)self dataSource];
    BOOL v24 = [(WFParameterValuePickerViewController *)self defaultResults];
    [v23 applyCollection:v24 animatingDifferences:0 filterVariableTitle:0];

    [(WFParameterValuePickerViewController *)self displayNoOptionsAvailableMessageIfNeeded];
    [(WFParameterValuePickerViewController *)self setCustomPrompt:0];
  }
  uint64_t v25 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", 0.0, 0.0, 1.0, 1.0);
  v26 = [(WFParameterValuePickerViewController *)self tableView];
  [v26 setTableFooterView:v25];

  [(WFParameterValuePickerViewController *)self reloadNavigationBarButtonItems];
  [(WFParameterValuePickerViewController *)self reloadChoosingPrompt];
  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);
}

id __51__WFParameterValuePickerViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = [v9 value];

    id v9 = (id)v11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v12 = [v7 dequeueReusableCellWithIdentifier:@"ParameterStateCell" forIndexPath:v8];
    id v13 = [WeakRetained tableView];
    if ([v13 numberOfSections] == 2)
    {
      id v14 = [WeakRetained tableView];
      uint64_t v15 = objc_msgSend(v14, "numberOfRowsInSection:", objc_msgSend(v8, "section"));
      BOOL v16 = v15 == [v8 row] + 1;
    }
    else
    {
      BOOL v16 = 0;
    }

    [WeakRetained configureCell:v12 forState:v9];
  }
  else
  {
    uint64_t v12 = [v7 dequeueReusableCellWithIdentifier:@"ParameterVariableCell" forIndexPath:v8];
    [WeakRetained configureCell:v12 forVariable:v9];
    BOOL v16 = 0;
  }
  id v17 = v12;
  if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    [v17 setDisablesSeparatorIconInset:v16];
    id v18 = v17;
  }
  else
  {

    id v18 = 0;
  }

  return v17;
}

- (void)loadView
{
  v45[2] = *MEMORY[0x263EF8340];
  v43.receiver = self;
  v43.super_class = (Class)WFParameterValuePickerViewController;
  [(WFParameterValuePickerViewController *)&v43 loadView];
  uint64_t v3 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
  errorTitleLabel = self->_errorTitleLabel;
  self->_errorTitleLabel = v3;

  id v5 = [(WFParameterValuePickerViewController *)self errorTitleLabel];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  BOOL v6 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835D0]];
  id v7 = [(WFParameterValuePickerViewController *)self errorTitleLabel];
  [v7 setFont:v6];

  id v8 = [(WFParameterValuePickerViewController *)self errorTitleLabel];
  [v8 setAdjustsFontForContentSizeCategory:1];

  id v9 = [MEMORY[0x263F825C8] secondaryLabelColor];
  uint64_t v10 = [(WFParameterValuePickerViewController *)self errorTitleLabel];
  [v10 setTextColor:v9];

  uint64_t v11 = [(WFParameterValuePickerViewController *)self errorTitleLabel];
  [v11 setTextAlignment:1];

  uint64_t v12 = [(WFParameterValuePickerViewController *)self errorTitleLabel];
  [v12 setNumberOfLines:0];

  id v13 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
  errorMessageLabel = self->_errorMessageLabel;
  self->_errorMessageLabel = v13;

  uint64_t v15 = [(WFParameterValuePickerViewController *)self errorMessageLabel];
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

  BOOL v16 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
  id v17 = [(WFParameterValuePickerViewController *)self errorMessageLabel];
  [v17 setFont:v16];

  id v18 = [(WFParameterValuePickerViewController *)self errorMessageLabel];
  [v18 setAdjustsFontForContentSizeCategory:1];

  long long v19 = [MEMORY[0x263F825C8] secondaryLabelColor];
  long long v20 = [(WFParameterValuePickerViewController *)self errorMessageLabel];
  [v20 setTextColor:v19];

  long long v21 = [(WFParameterValuePickerViewController *)self errorMessageLabel];
  [v21 setTextAlignment:1];

  long long v22 = [(WFParameterValuePickerViewController *)self errorMessageLabel];
  [v22 setNumberOfLines:0];

  id v23 = objc_alloc(MEMORY[0x263F82BF8]);
  BOOL v24 = [(WFParameterValuePickerViewController *)self errorTitleLabel];
  v45[0] = v24;
  uint64_t v25 = [(WFParameterValuePickerViewController *)self errorMessageLabel];
  v45[1] = v25;
  v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:2];
  uint64_t v27 = (void *)[v23 initWithArrangedSubviews:v26];

  [v27 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v27 setAxis:1];
  [v27 setSpacing:3.0];
  id v28 = objc_alloc_init(MEMORY[0x263F82E00]);
  [v28 setPreservesSuperviewLayoutMargins:1];
  [v28 addSubview:v27];
  v38 = (void *)MEMORY[0x263F08938];
  v41 = [v27 leadingAnchor];
  v42 = [v28 readableContentGuide];
  v40 = [v42 leadingAnchor];
  id v39 = [v41 constraintEqualToAnchor:v40];
  v44[0] = v39;
  uint64_t v36 = [v27 trailingAnchor];
  v37 = [v28 readableContentGuide];
  BOOL v29 = [v37 trailingAnchor];
  v30 = [v36 constraintEqualToAnchor:v29];
  v44[1] = v30;
  id v31 = [v27 centerYAnchor];
  v32 = [v28 readableContentGuide];
  objc_super v33 = [v32 centerYAnchor];
  v34 = [v31 constraintEqualToAnchor:v33];
  v44[2] = v34;
  uint64_t v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:3];
  [v38 activateConstraints:v35];

  [(WFParameterValuePickerViewController *)self setErrorMessageView:v28];
}

- (void)setCustomPrompt:(id)a3
{
  id v4 = a3;
  id v5 = self->_customPrompt;
  BOOL v6 = (NSString *)v4;
  uint64_t v10 = v6;
  if (v5 == v6)
  {

    goto LABEL_10;
  }
  if (v6 && v5)
  {
    BOOL v7 = [(NSString *)v5 isEqualToString:v6];

    if (v7) {
      goto LABEL_10;
    }
  }
  else
  {
  }
  id v8 = (NSString *)[(NSString *)v10 copy];
  customPrompt = self->_customPrompt;
  self->_customPrompt = v8;

  if ([(WFParameterValuePickerViewController *)self isViewLoaded]) {
    [(WFParameterValuePickerViewController *)self reloadChoosingPrompt];
  }
LABEL_10:
}

- (void)setDefaultPrompt:(id)a3
{
  id v4 = a3;
  id v5 = self->_defaultPrompt;
  BOOL v6 = (NSString *)v4;
  uint64_t v10 = v6;
  if (v5 == v6)
  {

    goto LABEL_10;
  }
  if (v6 && v5)
  {
    BOOL v7 = [(NSString *)v5 isEqualToString:v6];

    if (v7) {
      goto LABEL_10;
    }
  }
  else
  {
  }
  id v8 = (NSString *)[(NSString *)v10 copy];
  defaultPrompt = self->_defaultPrompt;
  self->_defaultPrompt = v8;

  if ([(WFParameterValuePickerViewController *)self isViewLoaded]) {
    [(WFParameterValuePickerViewController *)self reloadChoosingPrompt];
  }
LABEL_10:
}

- (void)setShowsCancelButton:(BOOL)a3
{
  if (self->_showsCancelButton != a3)
  {
    self->_showsCancelButton = a3;
    if ([(WFParameterValuePickerViewController *)self isViewLoaded])
    {
      [(WFParameterValuePickerViewController *)self reloadNavigationBarButtonItems];
    }
  }
}

- (void)setShowsPrompt:(BOOL)a3
{
  if (self->_showsPrompt != a3)
  {
    self->_showsPrompt = a3;
    if ([(WFParameterValuePickerViewController *)self isViewLoaded])
    {
      [(WFParameterValuePickerViewController *)self reloadNavigationBarButtonItems];
    }
  }
}

- (BOOL)showsPrompt
{
  uint64_t v3 = [MEMORY[0x263F086E0] mainBundle];
  id v4 = [v3 bundleIdentifier];
  char v5 = [v4 isEqualToString:*MEMORY[0x263F85590]];

  return (v5 & 1) == 0 && self->_showsPrompt;
}

- (UIBarButtonItem)cancelBarButtonItem
{
  cancelBarButtonItem = self->_cancelBarButtonItem;
  if (!cancelBarButtonItem)
  {
    id v4 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancelPickingValue];
    char v5 = self->_cancelBarButtonItem;
    self->_cancelBarButtonItem = v4;

    cancelBarButtonItem = self->_cancelBarButtonItem;
  }
  return cancelBarButtonItem;
}

- (UIBarButtonItem)removeItemBarButtonItem
{
  if (!self->_removeItemBarButtonItem)
  {
    uint64_t v3 = [(WFParameterValuePickerViewController *)self removeItemButtonTitle];

    if (v3)
    {
      id v4 = objc_alloc(MEMORY[0x263F824A8]);
      char v5 = [(WFParameterValuePickerViewController *)self removeItemButtonTitle];
      BOOL v6 = (UIBarButtonItem *)[v4 initWithTitle:v5 style:0 target:self action:sel_requestRemovingItem];
      removeItemBarButtonItem = self->_removeItemBarButtonItem;
      self->_removeItemBarButtonItem = v6;
    }
  }
  id v8 = self->_removeItemBarButtonItem;
  return v8;
}

- (UIBarButtonItem)doneBarButtonItem
{
  doneBarButtonItem = self->_doneBarButtonItem;
  if (!doneBarButtonItem)
  {
    id v4 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:0 target:self action:sel_finishPickingValue];
    char v5 = self->_doneBarButtonItem;
    self->_doneBarButtonItem = v4;

    doneBarButtonItem = self->_doneBarButtonItem;
  }
  return doneBarButtonItem;
}

- (void)setVariableUIDelegate:(id)a3
{
  p_variableUIDelegate = &self->_variableUIDelegate;
  id v5 = a3;
  objc_storeWeak((id *)p_variableUIDelegate, v5);
  id v6 = [(WFParameterValuePickerViewController *)self dataSource];
  [v6 setVariableUIDelegate:v5];
}

- (void)setVariableProvider:(id)a3
{
  p_variableProvider = &self->_variableProvider;
  id v5 = a3;
  objc_storeWeak((id *)p_variableProvider, v5);
  id v6 = [(WFParameterValuePickerViewController *)self dataSource];
  [v6 setVariableProvider:v5];
}

- (void)setRemoveItemButtonTitle:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  removeItemButtonTitle = self->_removeItemButtonTitle;
  self->_removeItemButtonTitle = v4;

  removeItemBarButtonItem = self->_removeItemBarButtonItem;
  self->_removeItemBarButtonItem = 0;

  if ([(WFParameterValuePickerViewController *)self isViewLoaded])
  {
    [(WFParameterValuePickerViewController *)self reloadNavigationBarButtonItems];
  }
}

- (void)setAllowsMultipleSelection:(BOOL)a3
{
  BOOL v3 = a3;
  self->_allowsMultipleSelection = a3;
  if ([(WFParameterValuePickerViewController *)self isViewLoaded])
  {
    id v5 = [(WFParameterValuePickerViewController *)self tableView];
    [v5 setAllowsMultipleSelection:v3];

    [(WFParameterValuePickerViewController *)self reloadNavigationBarButtonItems];
  }
}

- (void)setNoOptionAvailableTitle:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  noOptionAvailableTitle = self->_noOptionAvailableTitle;
  self->_noOptionAvailableTitle = v4;

  if ([(WFParameterValuePickerViewController *)self isViewLoaded])
  {
    id v9 = [(WFParameterValuePickerViewController *)self dataSource];
    uint64_t v6 = [v9 itemsCount];
    if (v6)
    {
      BOOL v7 = 0;
    }
    else
    {
      BOOL v7 = [(WFParameterValuePickerViewController *)self errorMessageView];
    }
    id v8 = [(WFParameterValuePickerViewController *)self tableView];
    [v8 setBackgroundView:v7];

    if (!v6) {
  }
    }
}

- (WFParameterValuePickerViewController)initWithParameter:(id)a3 widgetFamily:(int64_t)a4 allowsVariables:(BOOL)a5 initialCollection:(id)a6 currentState:(id)a7 delegate:(id)a8
{
  BOOL v11 = a5;
  id v15 = a3;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (objc_msgSend(v15, "wf_usesGroupTableViewStyle")) {
    uint64_t v19 = 2;
  }
  else {
    uint64_t v19 = 0;
  }
  v61.receiver = self;
  v61.super_class = (Class)WFParameterValuePickerViewController;
  long long v20 = [(WFParameterValuePickerViewController *)&v61 initWithStyle:v19];
  long long v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_parameter, a3);
    v21->_widgetFamily = a4;
    if (v11)
    {
      uint64_t v22 = [v15 supportedVariableTypes];
    }
    else
    {
      uint64_t v22 = objc_opt_new();
    }
    allowedVariableTypes = v21->_allowedVariableTypes;
    v21->_allowedVariableTypes = (NSSet *)v22;

    objc_storeWeak((id *)&v21->_delegate, v18);
    id v24 = objc_alloc(MEMORY[0x263F86A88]);
    uint64_t v25 = [v24 initWithDelay:MEMORY[0x263EF83A0] queue:0.200000003];
    inputDebouncer = v21->_inputDebouncer;
    v21->_inputDebouncer = (WFDebouncer *)v25;

    [(WFDebouncer *)v21->_inputDebouncer addTarget:v21 action:sel_updateSearchResultsFromCurrentUserInput];
    objc_storeStrong((id *)&v21->_defaultResults, a6);
    objc_storeStrong((id *)&v21->_currentState, a7);
    uint64_t v27 = objc_opt_new();
    cachedResults = v21->_cachedResults;
    v21->_cachedResults = (NSMutableDictionary *)v27;

    uint64_t v29 = objc_opt_new();
    cachedPrompts = v21->_cachedPrompts;
    v21->_cachedPrompts = (NSMutableDictionary *)v29;

    if ([v15 isRangedSizeArray]) {
      uint64_t v31 = [v15 arrayMaxCountForWidgetFamily:a4];
    }
    else {
      uint64_t v31 = 0x7FFFFFFFFFFFFFFFLL;
    }
    v21->_maximumSelectableItemsCount = v31;
    v32 = [MEMORY[0x263F086E0] mainBundle];
    int v33 = objc_msgSend(v32, "wf_isWidgetConfigurationExtensionBundle");

    if (v33)
    {
      id v34 = objc_alloc_init(MEMORY[0x263F82B98]);
      [(WFParameterValuePickerViewController *)v21 setSearchBar:v34];

      uint64_t v35 = [(WFParameterValuePickerViewController *)v21 searchBar];
      [v35 sizeToFit];

      uint64_t v36 = [(WFParameterValuePickerViewController *)v21 searchBar];
      [v36 setDelegate:v21];
    }
    else
    {
      v37 = (void *)[objc_alloc(MEMORY[0x263F82BA0]) initWithSearchResultsController:0];
      [(WFParameterValuePickerViewController *)v21 setSearchController:v37];

      v38 = [(WFParameterValuePickerViewController *)v21 searchController];
      [v38 setObscuresBackgroundDuringPresentation:0];

      id v39 = [(WFParameterValuePickerViewController *)v21 searchController];
      [v39 setHidesNavigationBarDuringPresentation:0];

      v40 = [(WFParameterValuePickerViewController *)v21 searchController];
      [v40 setAutomaticallyShowsCancelButton:0];

      v41 = [(WFParameterValuePickerViewController *)v21 searchController];
      [v41 setSearchResultsUpdater:v21];

      uint64_t v36 = [(WFParameterValuePickerViewController *)v21 searchController];
      v42 = [v36 searchBar];
      [(WFParameterValuePickerViewController *)v21 setSearchBar:v42];
    }
    objc_super v43 = [(WFParameterValuePickerViewController *)v21 searchBar];
    [v43 setShowsCancelButton:0];

    v44 = [(WFParameterValuePickerViewController *)v21 searchBar];
    [v44 setSearchBarStyle:2];

    v45 = [(WFParameterValuePickerViewController *)v21 searchBar];
    [v45 setAutocorrectionType:1];

    v46 = [(WFParameterValuePickerViewController *)v21 searchBar];
    [v46 setSearchBarStyle:2];

    v47 = WFLocalizedString(@"Search");
    v48 = [(WFParameterValuePickerViewController *)v21 searchBar];
    [v48 setPlaceholder:v47];

    v49 = [MEMORY[0x263F086E0] mainBundle];
    LODWORD(v48) = objc_msgSend(v49, "wf_isWidgetConfigurationExtensionBundle");

    if (v48)
    {
      v50 = [(WFParameterValuePickerViewController *)v21 searchBar];
      v51 = [(WFParameterValuePickerViewController *)v21 navigationItem];
      [v51 setTitleView:v50];

      v52 = [(WFParameterValuePickerViewController *)v21 parameter];
      v53 = [v52 localizedLabel];
      [(WFParameterValuePickerViewController *)v21 setTitle:v53];
    }
    else
    {
      v54 = [(WFParameterValuePickerViewController *)v21 searchController];
      v55 = [(WFParameterValuePickerViewController *)v21 navigationItem];
      [v55 setSearchController:v54];

      v52 = WFLocalizedString(@"Choose");
      [(WFParameterValuePickerViewController *)v21 setTitle:v52];
    }

    v56 = [(WFParameterValuePickerViewController *)v21 navigationItem];
    [v56 setHidesSearchBarWhenScrolling:0];

    v57 = [(WFParameterValuePickerViewController *)v21 parameter];
    v58 = objc_msgSend(v57, "wf_displayLocalizedPrompt");
    [(WFParameterValuePickerViewController *)v21 setDefaultPrompt:v58];

    v21->_showsPrompt = 1;
    v21->_showsCancelButton = 1;
    [(WFParameterValuePickerViewController *)v21 performSearchWithUserInput:0];
    [v15 addEventObserver:v21];
    v59 = v21;
  }

  return v21;
}

@end