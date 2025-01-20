@interface WFModuleSummaryEditor
+ (BOOL)supportsEditingTextAttachment:(id)a3 inSlotWithIdentifier:(id)a4;
+ (unint64_t)variableResultTypeForParameter:(id)a3;
- (BOOL)allowsPickingVariables;
- (BOOL)canTypeAlongsideVariables;
- (BOOL)isProcessing;
- (BOOL)menuElementsContainDeferredElement:(id)a3 withEstimatedCountGreaterThan:(int64_t)a4;
- (BOOL)returnToKeyboardOnComplete;
- (BOOL)textEntryShouldChangeText:(id)a3;
- (BOOL)variableMenuSupportsVariableSelectionForSlotWithIdentifier:(id)a3;
- (WFEditorAuxiliaryViewPresenter)auxiliaryViewPresenter;
- (WFModuleSummaryEditor)initWithParameter:(id)a3 arrayIndex:(unint64_t)a4 processing:(BOOL)a5;
- (WFModuleSummaryEditorDelegate)delegate;
- (WFModuleSummarySupporting)parameter;
- (WFMultipleValueParameterState)initialArrayState;
- (WFParameterState)currentState;
- (WFParameterState)initialState;
- (WFSlotTemplateTextEntry)textEntry;
- (WFVariable)lastValueForEditingVariable;
- (WFVariableProvider)variableProvider;
- (WFVariableUIDelegate)variableUIDelegate;
- (id)clearButtonMenuItemForSlotWithIdentifier:(id)a3;
- (id)customMenuElementsForSlotWithIdentifier:(id)a3 style:(unint64_t)a4;
- (id)menuForSlotWithIdentifier:(id)a3 style:(unint64_t)a4;
- (id)stateByReplacingVariableFromCurrentState:(id)a3 withVariable:(id)a4;
- (id)variableMenuElementsForSlotWithIdentifier:(id)a3;
- (id)viewControllerForEditingWithIdentifier:(id)a3;
- (unint64_t)arrayIndex;
- (void)_beginEditingVariableAttachment:(id)a3 slotIdentifier:(id)a4 presentationAnchor:(id)a5;
- (void)beginEditingTextAttachment:(id)a3 inSlotWithIdentifier:(id)a4 presentationAnchor:(id)a5;
- (void)cancelEditingWithCompletionHandler:(id)a3;
- (void)commitAuxiliaryState:(id)a3 forKey:(id)a4;
- (void)commitState:(id)a3;
- (void)completeEditing;
- (void)completeEditingWithTextAttachmentToEdit:(id)a3;
- (void)requestEditingSlotIdentifier:(id)a3;
- (void)requestTextEntry;
- (void)setAllowsPickingVariables:(BOOL)a3;
- (void)setAuxiliaryViewPresenter:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLastValueForEditingVariable:(id)a3;
- (void)setReturnToKeyboardOnComplete:(BOOL)a3;
- (void)setVariableProvider:(id)a3;
- (void)setVariableUIDelegate:(id)a3;
- (void)stageState:(id)a3;
- (void)textEntryDidCopyWithOriginalBlock:(id)a3;
- (void)textEntryDidCutWithOriginalBlock:(id)a3;
- (void)textEntryDidFinish;
- (void)textEntryDidPasteWithOriginalBlock:(id)a3;
- (void)textEntryWillBegin:(id)a3 allowMultipleLines:(BOOL *)a4;
@end

@implementation WFModuleSummaryEditor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastValueForEditingVariable, 0);
  objc_destroyWeak((id *)&self->_textEntry);
  objc_destroyWeak((id *)&self->_auxiliaryViewPresenter);
  objc_destroyWeak((id *)&self->_variableUIDelegate);
  objc_destroyWeak((id *)&self->_variableProvider);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_parameter, 0);
  objc_storeStrong((id *)&self->_currentState, 0);
}

- (void)setLastValueForEditingVariable:(id)a3
{
}

- (WFVariable)lastValueForEditingVariable
{
  return self->_lastValueForEditingVariable;
}

- (void)setReturnToKeyboardOnComplete:(BOOL)a3
{
  self->_returnToKeyboardOnComplete = a3;
}

- (BOOL)returnToKeyboardOnComplete
{
  return self->_returnToKeyboardOnComplete;
}

- (WFSlotTemplateTextEntry)textEntry
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textEntry);
  return (WFSlotTemplateTextEntry *)WeakRetained;
}

- (void)setAuxiliaryViewPresenter:(id)a3
{
}

- (WFEditorAuxiliaryViewPresenter)auxiliaryViewPresenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_auxiliaryViewPresenter);
  return (WFEditorAuxiliaryViewPresenter *)WeakRetained;
}

- (void)setAllowsPickingVariables:(BOOL)a3
{
  self->_allowsPickingVariables = a3;
}

- (BOOL)allowsPickingVariables
{
  return self->_allowsPickingVariables;
}

- (void)setVariableUIDelegate:(id)a3
{
}

- (WFVariableUIDelegate)variableUIDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_variableUIDelegate);
  return (WFVariableUIDelegate *)WeakRetained;
}

- (void)setVariableProvider:(id)a3
{
}

- (WFVariableProvider)variableProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_variableProvider);
  return (WFVariableProvider *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (WFModuleSummaryEditorDelegate)delegate
{
  return self->_delegate;
}

- (BOOL)isProcessing
{
  return self->_processing;
}

- (unint64_t)arrayIndex
{
  return self->_arrayIndex;
}

- (WFModuleSummarySupporting)parameter
{
  return self->_parameter;
}

- (void)_beginEditingVariableAttachment:(id)a3 slotIdentifier:(id)a4 presentationAnchor:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v9 = [v7 variable];
  [(WFModuleSummaryEditor *)self setLastValueForEditingVariable:v9];

  v10 = [(WFModuleSummaryEditor *)self variableUIDelegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_4;
  }
  v11 = [(WFModuleSummaryEditor *)self variableProvider];

  if (v11)
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __91__WFModuleSummaryEditor__beginEditingVariableAttachment_slotIdentifier_presentationAnchor___block_invoke;
    aBlock[3] = &unk_264BFD458;
    aBlock[4] = self;
    v10 = _Block_copy(aBlock);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __91__WFModuleSummaryEditor__beginEditingVariableAttachment_slotIdentifier_presentationAnchor___block_invoke_2;
    v23[3] = &unk_264BFDA70;
    v23[4] = self;
    v12 = _Block_copy(v23);
    v13 = objc_opt_class();
    v14 = [(WFModuleSummaryEditor *)self parameter];
    uint64_t v15 = [v13 variableResultTypeForParameter:v14];

    v16 = [WFVariableEditingAnchor alloc];
    v17 = [v7 variable];
    v18 = [(WFModuleSummaryEditor *)self variableProvider];
    v19 = [(WFModuleSummaryEditor *)self parameter];
    v20 = [(WFVariableEditingAnchor *)v16 initWithVariable:v17 variableProvider:v18 parameter:v19];

    v21 = [[WFVariableEditingOptions alloc] initWithAnchor:v20 resultType:v15 onChange:v10 onFinish:v12];
    v22 = [(WFModuleSummaryEditor *)self variableUIDelegate];
    [v8 sourceRect];
    objc_msgSend(v22, "showVariableEditorWithOptions:fromSourceRect:", v21);

LABEL_4:
  }
}

void __91__WFModuleSummaryEditor__beginEditingVariableAttachment_slotIdentifier_presentationAnchor___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  v3 = [*(id *)(a1 + 32) delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = [*(id *)(a1 + 32) delegate];
    [v5 summaryEditor:*(void *)(a1 + 32) willUpdateVariable:v9];
  }
  v6 = *(void **)(a1 + 32);
  id v7 = [v6 lastValueForEditingVariable];
  id v8 = [v6 stateByReplacingVariableFromCurrentState:v7 withVariable:v9];
  [v6 commitState:v8];

  [*(id *)(a1 + 32) setLastValueForEditingVariable:v9];
}

uint64_t __91__WFModuleSummaryEditor__beginEditingVariableAttachment_slotIdentifier_presentationAnchor___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setLastValueForEditingVariable:0];
  [*(id *)(a1 + 32) setReturnToKeyboardOnComplete:a2];
  char v4 = *(void **)(a1 + 32);
  return [v4 completeEditing];
}

- (id)stateByReplacingVariableFromCurrentState:(id)a3 withVariable:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WFModuleSummaryEditor *)self delegate];
  id v9 = [v8 initialStateForSummaryEditor:self];

  id v10 = v9;
  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v11 = v10;
    }
    else {
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }
  id v12 = v11;

  if (!v7 && v12)
  {
    v13 = [v12 parameterStates];
    v14 = (void *)[v13 mutableCopy];

    unint64_t arrayIndex = self->_arrayIndex;
    if (arrayIndex != 0x7FFFFFFFFFFFFFFFLL && arrayIndex < [v14 count])
    {
      [v14 removeObjectAtIndex:self->_arrayIndex];
      v16 = (void *)[objc_alloc((Class)objc_opt_class()) initWithParameterStates:v14];

      goto LABEL_20;
    }
  }
  v17 = [(WFModuleSummaryEditor *)self parameter];
  v18 = (objc_class *)[v17 stateClass];

  if (v18 == (objc_class *)objc_opt_class() && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v19 = [v10 stateByReplacingVariable:v6 withVariable:v7];
LABEL_18:
    v16 = (void *)v19;
    goto LABEL_20;
  }
  if (v7
    && [(objc_class *)v18 instancesRespondToSelector:sel_initWithVariable_])
  {
    uint64_t v19 = [[v18 alloc] initWithVariable:v7];
    goto LABEL_18;
  }
  v16 = 0;
LABEL_20:

  return v16;
}

- (BOOL)canTypeAlongsideVariables
{
  v2 = [(WFModuleSummaryEditor *)self parameter];
  v3 = (void *)[v2 stateClass];

  uint64_t v4 = objc_opt_class();
  return [v3 isSubclassOfClass:v4];
}

- (void)beginEditingTextAttachment:(id)a3 inSlotWithIdentifier:(id)a4 presentationAnchor:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(WFModuleSummaryEditor *)self _beginEditingVariableAttachment:v10 slotIdentifier:v8 presentationAnchor:v9];
  }
  else {
    [(WFModuleSummaryEditor *)self completeEditing];
  }
}

- (void)requestEditingSlotIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(WFModuleSummaryEditor *)self delegate];
  [v5 summaryEditor:self didRequestEditingSlotWithIdentifier:v4];
}

- (id)menuForSlotWithIdentifier:(id)a3 style:(unint64_t)a4
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(WFModuleSummaryEditor *)self clearButtonMenuItemForSlotWithIdentifier:v6];
  id v8 = [(WFModuleSummaryEditor *)self variableMenuElementsForSlotWithIdentifier:v6];
  id v9 = [(WFModuleSummaryEditor *)self customMenuElementsForSlotWithIdentifier:v6 style:a4];
  if (a4 && (a4 != 1 || v7 || [v8 count]) || objc_msgSend(v9, "count"))
  {
    id v10 = objc_opt_new();
    [v10 addObjectsFromArray:v9];
    v46 = v9;
    v47 = v7;
    v45 = v10;
    if ([v9 count])
    {
      BOOL v41 = [(WFModuleSummaryEditor *)self menuElementsContainDeferredElement:v9 withEstimatedCountGreaterThan:5];
      BOOL v11 = (unint64_t)[v8 count] > 1;
      if ([v8 count] == 1)
      {
        id v12 = [v8 objectAtIndexedSubscript:0];
        if (v12)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v13 = [v12 menuElements];
            BOOL v11 = (unint64_t)[v13 count] > 1;
          }
        }
        BOOL v42 = v11;
      }
      else
      {
        BOOL v42 = v11;
      }
      id v43 = v8;
      id v44 = v6;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v15 = v9;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v52 objects:v57 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        int v18 = 0;
        uint64_t v19 = *(void *)v53;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v53 != v19) {
              objc_enumerationMutation(v15);
            }
            id v21 = *(id *)(*((void *)&v52 + 1) + 8 * i);
            if (v21)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                v22 = v21;
              }
              else {
                v22 = 0;
              }
            }
            else
            {
              v22 = 0;
            }
            id v23 = v22;

            if (v23) {
              ++v18;
            }
            id v24 = v21;
            if (v21)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                if ([v24 shouldCollapse])
                {
                  ++v18;
                }
                else
                {
                  v25 = [v24 menuElements];
                  v18 += [v25 count];
                }
              }
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v52 objects:v57 count:16];
        }
        while (v17);
      }
      else
      {
        int v18 = 0;
      }

      id v8 = v43;
      if (v42) {
        uint64_t v14 = v18 > 10 || v41;
      }
      else {
        uint64_t v14 = 0;
      }
      id v6 = v44;
      id v10 = v45;
      id v9 = v46;
      id v7 = v47;
    }
    else
    {
      uint64_t v14 = 0;
    }
    v26 = [(WFModuleSummaryEditor *)self initialState];
    if (v26)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v27 = v26;
      }
      else {
        v27 = 0;
      }
    }
    else
    {
      v27 = 0;
    }
    id v28 = v27;

    v29 = [v28 variable];

    if (v14)
    {
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v8 = v8;
      uint64_t v30 = [v8 countByEnumeratingWithState:&v48 objects:v56 count:16];
      if (v30)
      {
        uint64_t v31 = v30;
        uint64_t v32 = *(void *)v49;
        do
        {
          for (uint64_t j = 0; j != v31; ++j)
          {
            if (*(void *)v49 != v32) {
              objc_enumerationMutation(v8);
            }
            id v34 = *(id *)(*((void *)&v48 + 1) + 8 * j);
            v35 = v34;
            if (v34 && [v34 conformsToProtocol:&unk_26E8299D0]) {
              [v35 setStyle:0];
            }
          }
          uint64_t v31 = [v8 countByEnumeratingWithState:&v48 objects:v56 count:16];
        }
        while (v31);
      }

      id v7 = v47;
      if (v47)
      {
        id v10 = v45;
        id v9 = v46;
        if (v29)
        {
          uint64_t v36 = [v8 arrayByAddingObject:v47];

          id v8 = (id)v36;
        }
        else
        {
          [v45 addObject:v47];
        }
      }
      else
      {
        id v10 = v45;
        id v9 = v46;
      }
      v38 = (void *)[objc_alloc(MEMORY[0x263F879C0]) initWithMenuElements:v8];
      [v38 setStyle:1];
      v39 = WFLocalizedString(@"Variables…");
      [v38 setTitle:v39];

      [v10 insertObject:v38 atIndex:0];
    }
    else
    {
      [v10 addObjectsFromArray:v8];
      if (v7) {
        [v10 addObject:v7];
      }
    }
    v37 = (void *)[objc_alloc(MEMORY[0x263F879B0]) initWithElements:v10];
    [v37 setShouldDisplayInFixedOrder:v14];
  }
  else
  {
    v37 = 0;
  }

  return v37;
}

- (BOOL)menuElementsContainDeferredElement:(id)a3 withEstimatedCountGreaterThan:(int64_t)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        BOOL v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int64_t v12 = objc_msgSend(v11, "estimatedItemCount", (void)v16);
          BOOL v13 = 1;
          if (v12 < 0 || v12 > a4) {
            goto LABEL_15;
          }
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v14 = objc_msgSend(v11, "menuElements", (void)v16);
            BOOL v13 = [(WFModuleSummaryEditor *)self menuElementsContainDeferredElement:v14 withEstimatedCountGreaterThan:a4];

            goto LABEL_15;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_15:

  return v13;
}

- (id)customMenuElementsForSlotWithIdentifier:(id)a3 style:(unint64_t)a4
{
  return 0;
}

- (id)clearButtonMenuItemForSlotWithIdentifier:(id)a3
{
  if ([(WFModuleSummaryEditor *)self allowsPickingVariables])
  {
    id v4 = [(WFModuleSummaryEditor *)self initialState];
    id v5 = [v4 containedVariables];

    if ([v5 count] == 1)
    {
      id v6 = [v5 firstObject];
    }
    else
    {
      id v6 = 0;
    }
    uint64_t v8 = [(WFModuleSummaryEditor *)self parameter];
    uint64_t v9 = [(WFModuleSummaryEditor *)self initialState];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __66__WFModuleSummaryEditor_clearButtonMenuItemForSlotWithIdentifier___block_invoke;
    v12[3] = &unk_264BFD430;
    v12[4] = self;
    id v13 = v6;
    id v10 = v6;
    uint64_t v7 = [v8 clearButtonMenuItemWithVariable:v10 parameterState:v9 setVariableHandler:v12];
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

uint64_t __66__WFModuleSummaryEditor_clearButtonMenuItemForSlotWithIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = [v3 stateByReplacingVariableFromCurrentState:*(void *)(a1 + 40) withVariable:a2];
  [v3 commitState:v4];

  id v5 = *(void **)(a1 + 32);
  return [v5 completeEditing];
}

- (id)variableMenuElementsForSlotWithIdentifier:(id)a3
{
  if ([(WFModuleSummaryEditor *)self variableMenuSupportsVariableSelectionForSlotWithIdentifier:a3]&& [(WFModuleSummaryEditor *)self allowsPickingVariables])
  {
    id v4 = [(WFModuleSummaryEditor *)self parameter];
    id v5 = [(WFModuleSummaryEditor *)self initialState];
    id v6 = [v5 containedVariables];

    if ([v6 count] == 1)
    {
      uint64_t v7 = [v6 objectAtIndexedSubscript:0];
    }
    else
    {
      uint64_t v7 = 0;
    }
    uint64_t v9 = [(WFModuleSummaryEditor *)self initialState];
    id v10 = [(WFModuleSummaryEditor *)self variableProvider];
    BOOL v11 = [(WFModuleSummaryEditor *)self variableUIDelegate];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __67__WFModuleSummaryEditor_variableMenuElementsForSlotWithIdentifier___block_invoke;
    v14[3] = &unk_264BFD430;
    v14[4] = self;
    id v15 = v7;
    id v12 = v7;
    uint64_t v8 = [v4 variableMenuElementsWithVariable:v12 parameterState:v9 variableProvider:v10 variableUIDelegate:v11 setVariableHandler:v14];
  }
  else
  {
    uint64_t v8 = 0;
  }
  return v8;
}

uint64_t __67__WFModuleSummaryEditor_variableMenuElementsForSlotWithIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = [v3 stateByReplacingVariableFromCurrentState:*(void *)(a1 + 40) withVariable:a2];
  [v3 commitState:v4];

  id v5 = *(void **)(a1 + 32);
  return [v5 completeEditing];
}

- (BOOL)variableMenuSupportsVariableSelectionForSlotWithIdentifier:(id)a3
{
  v3 = [(WFModuleSummaryEditor *)self parameter];
  id v4 = (void *)[v3 stateClass];

  return [v4 instancesRespondToSelector:sel_initWithVariable_];
}

- (void)textEntryDidFinish
{
}

- (void)textEntryDidPasteWithOriginalBlock:(id)a3
{
}

- (void)textEntryDidCopyWithOriginalBlock:(id)a3
{
}

- (void)textEntryDidCutWithOriginalBlock:(id)a3
{
}

- (BOOL)textEntryShouldChangeText:(id)a3
{
  return 1;
}

- (void)textEntryWillBegin:(id)a3 allowMultipleLines:(BOOL *)a4
{
}

- (void)requestTextEntry
{
  id v3 = [(WFModuleSummaryEditor *)self delegate];
  [v3 summaryEditorDidRequestTextEntry:self];
}

- (void)completeEditingWithTextAttachmentToEdit:(id)a3
{
  id v4 = a3;
  id v5 = [(WFModuleSummaryEditor *)self delegate];
  objc_msgSend(v5, "summaryEditorDidFinish:returnToKeyboard:withTextAttachmentToEdit:", self, -[WFModuleSummaryEditor returnToKeyboardOnComplete](self, "returnToKeyboardOnComplete"), v4);
}

- (void)completeEditing
{
}

- (void)commitAuxiliaryState:(id)a3 forKey:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  uint64_t v7 = [(WFModuleSummaryEditor *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    uint64_t v9 = [(WFModuleSummaryEditor *)self delegate];
    [v9 summaryEditor:self didCommitAuxiliaryParameterState:v10 forKey:v6];
  }
}

- (void)commitState:(id)a3
{
  objc_storeStrong((id *)&self->_currentState, a3);
  id v5 = a3;
  id v6 = [(WFModuleSummaryEditor *)self delegate];
  [v6 summaryEditor:self didCommitParameterState:v5];
}

- (void)stageState:(id)a3
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_currentState, a3);
  id v5 = [(WFModuleSummaryEditor *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    uint64_t v7 = [(WFModuleSummaryEditor *)self delegate];
    [v7 summaryEditor:self didStageParameterState:v8];
  }
}

- (WFMultipleValueParameterState)initialArrayState
{
  id v3 = [(WFModuleSummaryEditor *)self delegate];
  id v4 = [v3 initialStateForSummaryEditor:self];

  id v5 = v4;
  char v6 = v5;
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v6;
    }
    else {
      id v5 = 0;
    }
  }
  uint64_t v7 = (WFMultipleValueParameterState *)v5;

  return v7;
}

- (WFParameterState)initialState
{
  unint64_t v3 = [(WFModuleSummaryEditor *)self arrayIndex];
  id v4 = [(WFModuleSummaryEditor *)self delegate];
  id v5 = [v4 initialStateForSummaryEditor:self];

  id v6 = v5;
  if (v6)
  {
    objc_opt_class();
    uint64_t v7 = v6;
    if (objc_opt_isKindOfClass())
    {
      id v8 = [v6 parameterStates];
      uint64_t v9 = v8;
      if (v3 == 0x7FFFFFFFFFFFFFFFLL || v3 >= [v8 count])
      {
        uint64_t v7 = 0;
      }
      else
      {
        uint64_t v7 = [v9 objectAtIndex:v3];
      }
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return (WFParameterState *)v7;
}

- (WFParameterState)currentState
{
  currentState = self->_currentState;
  if (currentState)
  {
    unint64_t v3 = currentState;
  }
  else
  {
    unint64_t v3 = [(WFModuleSummaryEditor *)self initialState];
  }
  return v3;
}

- (void)cancelEditingWithCompletionHandler:(id)a3
{
}

- (id)viewControllerForEditingWithIdentifier:(id)a3
{
  return 0;
}

- (WFModuleSummaryEditor)initWithParameter:(id)a3 arrayIndex:(unint64_t)a4 processing:(BOOL)a5
{
  id v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFModuleSummaryEditor;
  id v10 = [(WFModuleSummaryEditor *)&v14 init];
  BOOL v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_parameter, a3);
    v11->_unint64_t arrayIndex = a4;
    v11->_processing = a5;
    id v12 = v11;
  }

  return v11;
}

+ (unint64_t)variableResultTypeForParameter:(id)a3
{
  return 0;
}

+ (BOOL)supportsEditingTextAttachment:(id)a3 inSlotWithIdentifier:(id)a4
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end