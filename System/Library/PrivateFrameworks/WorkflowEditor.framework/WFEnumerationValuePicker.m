@interface WFEnumerationValuePicker
+ (id)presentWithParameter:(id)a3 state:(id)a4 slotIdentifier:(id)a5 initialCollection:(id)a6 variableProvider:(id)a7 variableUIDelegate:(id)a8 allowsPickingVariables:(BOOL)a9 processing:(BOOL)a10 presentationAnchor:(id)a11 cancelHandler:(id)a12 completionHandler:(id)a13;
- (BOOL)suppressAutomaticCancellation;
- (WFEnumerationParameter)parameter;
- (WFEnumerationValuePicker)initWithParameter:(id)a3 currentState:(id)a4 completionHandler:(id)a5;
- (WFParameterValuePickerViewController)parameterValuePickerViewController;
- (WFSlotIdentifier)slotIdentifier;
- (WFVariableSubstitutableParameterState)currentState;
- (id)cancelHandler;
- (id)completionHandler;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (int64_t)editingSlotArrayIndex;
- (void)cancelOperationAndCommitState;
- (void)cancelOperationCommittingState:(BOOL)a3;
- (void)dismissWithCompletionHandler:(id)a3;
- (void)parameterValuePickerViewController:(id)a3 didFinishWithParameterState:(id)a4;
- (void)parameterValuePickingDidClear;
- (void)parameterValuePickingDidFinishWithParameterState:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)setCancelHandler:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setCurrentState:(id)a3;
- (void)setParameter:(id)a3;
- (void)setParameterValuePickerViewController:(id)a3;
- (void)setSlotIdentifier:(id)a3;
- (void)setSuppressAutomaticCancellation:(BOOL)a3;
@end

@implementation WFEnumerationValuePicker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slotIdentifier, 0);
  objc_storeStrong(&self->_cancelHandler, 0);
  objc_storeStrong((id *)&self->_parameterValuePickerViewController, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_parameter, 0);
  objc_storeStrong((id *)&self->_currentState, 0);
}

- (void)setSuppressAutomaticCancellation:(BOOL)a3
{
  self->_suppressAutomaticCancellation = a3;
}

- (BOOL)suppressAutomaticCancellation
{
  return self->_suppressAutomaticCancellation;
}

- (void)setSlotIdentifier:(id)a3
{
}

- (WFSlotIdentifier)slotIdentifier
{
  return self->_slotIdentifier;
}

- (void)setCancelHandler:(id)a3
{
}

- (id)cancelHandler
{
  return self->_cancelHandler;
}

- (void)setParameterValuePickerViewController:(id)a3
{
}

- (WFParameterValuePickerViewController)parameterValuePickerViewController
{
  return self->_parameterValuePickerViewController;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setParameter:(id)a3
{
}

- (WFEnumerationParameter)parameter
{
  return self->_parameter;
}

- (void)setCurrentState:(id)a3
{
}

- (WFVariableSubstitutableParameterState)currentState
{
  return self->_currentState;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  id v4 = a4;
  if ([v4 userInterfaceIdiom])
  {
    if ([v4 horizontalSizeClass] == 1) {
      int64_t v5 = 2;
    }
    else {
      int64_t v5 = -1;
    }
  }
  else
  {
    int64_t v5 = 2;
  }

  return v5;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  if (![(WFEnumerationValuePicker *)self suppressAutomaticCancellation])
  {
    [(WFEnumerationValuePicker *)self cancelOperationAndCommitState];
  }
}

- (void)parameterValuePickerViewController:(id)a3 didFinishWithParameterState:(id)a4
{
}

- (void)parameterValuePickingDidClear
{
  v3 = [(WFEnumerationValuePicker *)self parameter];
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }
  id v5 = v4;

  v6 = [(WFEnumerationValuePicker *)self currentState];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  id v15 = v7;

  int v8 = [v5 allowsMultipleValues];
  if (!v8
    || [(WFEnumerationValuePicker *)self editingSlotArrayIndex] == 0x7FFFFFFFFFFFFFFFLL
    || (unint64_t v9 = [(WFEnumerationValuePicker *)self editingSlotArrayIndex],
        [v15 value],
        v10 = objc_claimAutoreleasedReturnValue(),
        unint64_t v11 = [v10 count],
        v10,
        v9 >= v11))
  {
    v12 = 0;
  }
  else
  {
    v12 = objc_msgSend(v15, "stateByRemovingValueAtIndex:", -[WFEnumerationValuePicker editingSlotArrayIndex](self, "editingSlotArrayIndex"));
  }
  v13 = [(WFEnumerationValuePicker *)self completionHandler];

  if (v13)
  {
    v14 = [(WFEnumerationValuePicker *)self completionHandler];
    ((void (**)(void, void *))v14)[2](v14, v12);
  }
}

- (void)parameterValuePickingDidFinishWithParameterState:(id)a3
{
  v24[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(WFEnumerationValuePicker *)self parameter];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v6 = v5;
    }
    else {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  id v7 = v6;

  if (![v7 allowsMultipleValues] || (objc_msgSend(v7, "isRangedSizeArray") & 1) != 0) {
    goto LABEL_10;
  }
  int v8 = [(WFEnumerationValuePicker *)self slotIdentifier];
  unint64_t v9 = [v8 key];
  if ([v9 isEqual:@"_array_add_"])
  {

LABEL_10:
    id v10 = v4;
    goto LABEL_11;
  }
  uint64_t v13 = [(WFEnumerationValuePicker *)self currentState];
  if (!v13) {
    goto LABEL_17;
  }
  v14 = (void *)v13;
  id v15 = [(WFEnumerationValuePicker *)self currentState];
  if (WFParameterStateIsMultipleValue(v15))
  {

LABEL_17:
    goto LABEL_18;
  }
  char IsMultipleValue = WFParameterStateIsMultipleValue(v4);

  if ((IsMultipleValue & 1) == 0) {
    goto LABEL_10;
  }
LABEL_18:
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (!v4 || (isKindOfClass & 1) != 0) {
    goto LABEL_10;
  }
  v17 = [(WFEnumerationValuePicker *)self currentState];
  if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if ([(WFEnumerationValuePicker *)self editingSlotArrayIndex] == 0x7FFFFFFFFFFFFFFFLL
      || (unint64_t v18 = [(WFEnumerationValuePicker *)self editingSlotArrayIndex],
          [v17 value],
          v19 = objc_claimAutoreleasedReturnValue(),
          unint64_t v20 = [v19 count],
          v19,
          v18 >= v20))
    {
      uint64_t v21 = [v17 stateByAppendingValue:v4];
    }
    else
    {
      uint64_t v21 = objc_msgSend(v17, "stateByReplacingValueAtIndex:withValue:", -[WFEnumerationValuePicker editingSlotArrayIndex](self, "editingSlotArrayIndex"), v4);
    }
  }
  else
  {

    id v23 = objc_alloc((Class)[v7 multipleStateClass]);
    v24[0] = v4;
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
    uint64_t v21 = [v23 initWithParameterStates:v17];
  }
  id v10 = (id)v21;

LABEL_11:
  unint64_t v11 = [(WFEnumerationValuePicker *)self completionHandler];

  if (v11)
  {
    v12 = [(WFEnumerationValuePicker *)self completionHandler];
    ((void (**)(void, id))v12)[2](v12, v10);
  }
}

- (void)cancelOperationCommittingState:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(WFEnumerationValuePicker *)self cancelHandler];

  if (v5)
  {
    v6 = [(WFEnumerationValuePicker *)self cancelHandler];
    v6[2](v6, v3);
  }
}

- (void)cancelOperationAndCommitState
{
  BOOL v3 = [(WFEnumerationValuePicker *)self cancelHandler];

  if (v3)
  {
    id v4 = [(WFEnumerationValuePicker *)self cancelHandler];
    v4[2](v4, 1);
  }
}

- (void)dismissWithCompletionHandler:(id)a3
{
  id v7 = a3;
  id v4 = [(WFEnumerationValuePicker *)self parameterValuePickerViewController];

  if (v4)
  {
    id v5 = [(WFEnumerationValuePicker *)self parameterValuePickerViewController];
    v6 = [v5 presentingViewController];
    [v6 dismissViewControllerAnimated:1 completion:v7];
  }
}

- (int64_t)editingSlotArrayIndex
{
  BOOL v3 = [(WFEnumerationValuePicker *)self slotIdentifier];
  if (v3)
  {
    id v4 = [(WFEnumerationValuePicker *)self slotIdentifier];
    int64_t v5 = [v4 arrayIndex];
  }
  else
  {
    int64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (WFEnumerationValuePicker)initWithParameter:(id)a3 currentState:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)WFEnumerationValuePicker;
  v12 = [(WFEnumerationValuePicker *)&v18 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_parameter, a3);
    objc_storeStrong((id *)&v13->_currentState, a4);
    v14 = _Block_copy(v11);
    id completionHandler = v13->_completionHandler;
    v13->_id completionHandler = v14;

    v16 = v13;
  }

  return v13;
}

+ (id)presentWithParameter:(id)a3 state:(id)a4 slotIdentifier:(id)a5 initialCollection:(id)a6 variableProvider:(id)a7 variableUIDelegate:(id)a8 allowsPickingVariables:(BOOL)a9 processing:(BOOL)a10 presentationAnchor:(id)a11 cancelHandler:(id)a12 completionHandler:(id)a13
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v84 = a11;
  id v21 = a13;
  id v22 = a12;
  id v23 = a8;
  v24 = v18;
  id v25 = v23;
  id v26 = a7;
  id v27 = a6;
  v28 = [[WFEnumerationValuePicker alloc] initWithParameter:v24 currentState:v19 completionHandler:v21];

  [(WFEnumerationValuePicker *)v28 setSlotIdentifier:v20];
  v90 = v28;
  [(WFEnumerationValuePicker *)v28 setCancelHandler:v22];

  v86 = v20;
  if (v20) {
    uint64_t v29 = [v20 arrayIndex];
  }
  else {
    uint64_t v29 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v30 = v28;
  if (objc_msgSend(v24, "allowsMultipleValues", v84) && (objc_msgSend(v24, "isRangedSizeArray") & 1) == 0) {
    uint64_t v31 = objc_msgSend(v24, "wf_supportsSearch") ^ 1;
  }
  else {
    uint64_t v31 = 0;
  }
  if (a10) {
    uint64_t v32 = 0;
  }
  else {
    uint64_t v32 = objc_msgSend(v24, "wf_supportsSearch") ^ 1;
  }
  id v33 = v19;
  if (v33)
  {
    id v88 = v25;
    unint64_t v34 = v29;
    v35 = v24;
    objc_opt_class();
    int isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass) {
      v37 = v33;
    }
    else {
      v37 = 0;
    }
    id v38 = v37;

    if ((isKindOfClass & 1 & v31) == 1)
    {
      id v39 = v38;

      id v87 = v33;
    }
    else
    {
      id v87 = v38;
      if (([v35 allowsMultipleValues] & isKindOfClass) == 1)
      {
        if (v29 == 0x7FFFFFFFFFFFFFFFLL
          || ([v38 value],
              v40 = objc_claimAutoreleasedReturnValue(),
              unint64_t v41 = [v40 count],
              v40,
              v34 >= v41))
        {

          id v33 = 0;
        }
        else
        {
          v42 = [v38 parameterStates];
          uint64_t v43 = [v42 objectAtIndex:v34];

          id v33 = (id)v43;
        }
      }
    }
    v24 = v35;
    v30 = v90;
    id v25 = v88;
  }
  else
  {
    [v24 allowsMultipleValues];
    id v87 = 0;
  }
  v89 = v24;
  v44 = [[WFParameterValuePickerViewController alloc] initWithParameter:v24 widgetFamily:3 allowsVariables:v32 initialCollection:v27 currentState:v33 delegate:v30];

  [v30 setParameterValuePickerViewController:v44];
  [(WFParameterValuePickerViewController *)v44 setVariableProvider:v26];

  [(WFParameterValuePickerViewController *)v44 setVariableUIDelegate:v25];
  [(WFParameterValuePickerViewController *)v44 setAllowsMultipleSelection:v31];
  v45 = WFLocalizedString(@"No options available.");
  [(WFParameterValuePickerViewController *)v44 setNoOptionAvailableTitle:v45];

  if (!a10)
  {
    v46 = [v33 variable];
    if (v46
      || (([v24 defaultSerializedRepresentation],
           uint64_t v47 = objc_claimAutoreleasedReturnValue(),
           v48 = (void *)v47,
           v47 != 0 || v33 == 0)
        ? (v30 = (void *)v47)
        : (v30 = 0),
          ((v47 == 0 && v33 != 0) | v31) == 1))
    {
      v49 = [MEMORY[0x263F086E0] mainBundle];
      v50 = [v49 bundleIdentifier];
      int v51 = [v50 isEqualToString:*MEMORY[0x263F85610]];

      if (v46)
      {

        v30 = v90;
        if (!v51) {
          goto LABEL_36;
        }
      }
      else
      {

        v30 = v90;
        if ((v51 & 1) == 0) {
          goto LABEL_36;
        }
      }
      v48 = WFLocalizedString(@"Clear");
      [(WFParameterValuePickerViewController *)v44 setRemoveItemButtonTitle:v48];
    }

    v30 = v90;
  }
LABEL_36:
  v52 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v44];
  v53 = [MEMORY[0x263F086E0] mainBundle];
  int v54 = objc_msgSend(v53, "wf_isWidgetConfigurationExtensionBundle");

  if (v54)
  {
    [v52 setModalPresentationStyle:2];
    v55 = [v52 presentationController];
    v56 = v87;
    if (v55)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v57 = v55;
      }
      else {
        v57 = 0;
      }
    }
    else
    {
      v57 = 0;
    }
    v78 = v89;
    id v79 = v57;

    [v79 _setWantsBottomAttachedInCompactHeight:1];
  }
  else
  {
    v58 = [v85 sourceViewController];
    v59 = [v58 traitCollection];
    uint64_t v60 = [v59 layoutDirection];

    [v52 setModalPresentationStyle:7];
    v61 = [v52 popoverPresentationController];
    [v61 setDelegate:v30];

    v62 = [v85 sourceView];
    v63 = [v52 popoverPresentationController];
    [v63 setSourceView:v62];

    [v85 sourceRect];
    double v65 = v64;
    double v67 = v66;
    double v69 = v68;
    double v71 = v70;
    v72 = [v52 popoverPresentationController];
    objc_msgSend(v72, "setSourceRect:", v65, v67, v69, v71);

    v73 = [MEMORY[0x263F086E0] mainBundle];
    LODWORD(v63) = objc_msgSend(v73, "wf_isFocusConfigurationExtensionBundle");

    if (v63)
    {
      v74 = [v52 popoverPresentationController];
      v75 = v74;
      uint64_t v76 = 15;
    }
    else
    {
      if (v60 == 1) {
        uint64_t v77 = 10;
      }
      else {
        uint64_t v77 = 6;
      }
      v74 = [v52 popoverPresentationController];
      v75 = v74;
      uint64_t v76 = v77;
    }
    [v74 setPermittedArrowDirections:v76];
    v56 = v87;
    v78 = v89;

    id v79 = [v52 popoverPresentationController];
    objc_msgSend(v79, "wf_forcePresentationInPresenterSceneIfNeeded");
  }

  v80 = [v85 sourceViewController];
  v81 = [v80 traitCollection];
  objc_msgSend(v52, "setOverrideUserInterfaceStyle:", objc_msgSend(v81, "userInterfaceStyle"));

  v82 = [v85 sourceViewController];
  [v82 presentViewController:v52 animated:1 completion:0];

  return v30;
}

@end