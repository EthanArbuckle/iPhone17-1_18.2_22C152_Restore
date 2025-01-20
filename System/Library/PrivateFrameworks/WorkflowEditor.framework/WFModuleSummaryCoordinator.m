@interface WFModuleSummaryCoordinator
+ (double)heightForWidth:(double)a3 withSummaryFormatString:(id)a4 parameters:(id)a5 editableParameters:(id)a6 parameterStates:(id)a7 stagedParameterStates:(id)a8 horizontalPadding:(double)a9 font:(id)a10 unpopulatedFont:(id)a11 textAlignment:(int64_t)a12;
+ (id)parameterStatesByApplyingStaging:(id)a3 toOriginal:(id)a4;
+ (void)enumerateVariableAttachmentsInContents:(id)a3 withBlock:(id)a4;
- (BOOL)allowsPickingVariables;
- (BOOL)currentEditorIsEditing;
- (BOOL)processing;
- (BOOL)slotTemplateView:(id)a3 shouldChangeText:(id)a4 forSlotWithIdentifier:(id)a5;
- (BOOL)slotTemplateView:(id)a3 shouldTapTextAttachment:(id)a4 inSlotWithIdentifier:(id)a5;
- (Class)editorClassForParameter:(id)a3;
- (NSArray)contents;
- (NSDictionary)parameterStates;
- (NSDictionary)stagedParameterStates;
- (NSHashTable)variablesBeingObserved;
- (NSMutableDictionary)mutableStagedParameterStates;
- (NSSet)editableParameters;
- (NSSet)parameters;
- (NSString)summaryFormatString;
- (WFEditorAuxiliaryViewPresenter)auxiliaryViewPresenter;
- (WFModuleSummaryCoordinator)init;
- (WFModuleSummaryCoordinatorDelegate)delegate;
- (WFModuleSummaryEditor)currentEditor;
- (WFModuleSummaryTemplateBuilder)templateBuilder;
- (WFSlotIdentifier)currentlyEditingSlotIdentifier;
- (WFSlotIdentifier)currentlyTypingSlotIdentifier;
- (WFSlotTemplateView)templateView;
- (WFVariable)variableBeingEdited;
- (WFVariableProvider)variableProvider;
- (WFVariableUIDelegate)variableUIDelegate;
- (id)addElementToArrayForParameterKey:(id)a3;
- (id)createSummaryEditorForSlotWithIdentifier:(id)a3;
- (id)currentParameterStateForParameterKey:(id)a3;
- (id)firstSlotIdentifierWithParameterKey:(id)a3;
- (id)initialStateForSummaryEditor:(id)a3;
- (id)parameterForKey:(id)a3;
- (id)presentationAnchorForSlotWithIdentifier:(id)a3;
- (id)slotTemplateView:(id)a3 menuForSlotIdentifier:(id)a4 style:(unint64_t)a5;
- (id)transformParameterStateForSerialization:(id)a3 arrayIndex:(unint64_t)a4 parameter:(id)a5;
- (id)updateBlock;
- (void)beginEditingSlotWithIdentifier:(id)a3 fromTextAttachment:(id)a4;
- (void)cancelEditingWithCompletionHandler:(id)a3;
- (void)commitParameterState:(id)a3 forKey:(id)a4;
- (void)destroyCurrentEditor;
- (void)menuDidDismissInSlotTemplateView:(id)a3;
- (void)parameterAttributesDidChange:(id)a3;
- (void)removeElementFromArrayAtIndex:(unint64_t)a3 forParameterKey:(id)a4;
- (void)revealAction:(id)a3 preScrollHandler:(id)a4 goBackHandler:(id)a5 scrolledAwayHandler:(id)a6;
- (void)setAllowsPickingVariables:(BOOL)a3;
- (void)setAuxiliaryViewPresenter:(id)a3;
- (void)setContents:(id)a3;
- (void)setCurrentEditor:(id)a3;
- (void)setCurrentEditorIsEditing:(BOOL)a3;
- (void)setCurrentlyEditingSlotIdentifier:(id)a3;
- (void)setCurrentlyTypingSlotIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMutableStagedParameterStates:(id)a3;
- (void)setParameters:(id)a3;
- (void)setProcessing:(BOOL)a3;
- (void)setSummaryFormatString:(id)a3 withParameters:(id)a4 editableParameters:(id)a5 parameterStates:(id)a6;
- (void)setTemplateBuilder:(id)a3;
- (void)setTemplateView:(id)a3;
- (void)setUpdateBlock:(id)a3;
- (void)setVariableBeingEdited:(id)a3;
- (void)setVariableProvider:(id)a3;
- (void)setVariableUIDelegate:(id)a3;
- (void)setVariablesBeingObserved:(id)a3;
- (void)showActionOutputPickerAllowingShortcutInput:(BOOL)a3 variableProvider:(id)a4 completionHandler:(id)a5;
- (void)showParameterEditingHint:(id)a3;
- (void)showVariableEditorWithOptions:(id)a3 fromSourceRect:(CGRect)a4;
- (void)slotTemplateView:(id)a3 deletePressedOnSlotWithIdentifier:(id)a4 allowResettingValue:(BOOL)a5;
- (void)slotTemplateView:(id)a3 didChangeText:(id)a4 forSlotWithIdentifier:(id)a5;
- (void)slotTemplateView:(id)a3 didDeselectSlotWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)slotTemplateView:(id)a3 didEndTypingInSlotWithIdentifier:(id)a4;
- (void)slotTemplateView:(id)a3 didSelectSlotWithIdentifier:(id)a4;
- (void)slotTemplateView:(id)a3 didTapTextAttachment:(id)a4 inSlotWithIdentifier:(id)a5;
- (void)slotTemplateView:(id)a3 disclosureArrowDidChange:(BOOL)a4;
- (void)slotTemplateView:(id)a3 outputButtonDidChange:(BOOL)a4;
- (void)slotTemplateView:(id)a3 typingDidCopyWithOriginalBlock:(id)a4;
- (void)slotTemplateView:(id)a3 typingDidCutWithOriginalBlock:(id)a4;
- (void)slotTemplateView:(id)a3 typingDidPasteWithOriginalBlock:(id)a4;
- (void)slotTemplateView:(id)a3 willBeginTypingInSlotWithIdentifier:(id)a4 usingTextEntry:(id)a5 allowMultipleLines:(BOOL *)a6;
- (void)slotTemplateViewDidInvalidateSize:(id)a3;
- (void)slotTemplateViewTintColorDidChange:(id)a3;
- (void)summaryEditor:(id)a3 didCommitAuxiliaryParameterState:(id)a4 forKey:(id)a5;
- (void)summaryEditor:(id)a3 didCommitParameterState:(id)a4;
- (void)summaryEditor:(id)a3 didRequestEditingSlotWithIdentifier:(id)a4;
- (void)summaryEditor:(id)a3 didStageParameterState:(id)a4;
- (void)summaryEditor:(id)a3 willUpdateVariable:(id)a4;
- (void)summaryEditorDidFinish:(id)a3 returnToKeyboard:(BOOL)a4 withTextAttachmentToEdit:(id)a5;
- (void)summaryEditorDidRequestTextEntry:(id)a3;
- (void)updateTemplateContentsAnimated:(BOOL)a3;
- (void)updateVariableObservationsWithContents:(id)a3;
- (void)variableDidChange:(id)a3;
@end

@implementation WFModuleSummaryCoordinator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variablesBeingObserved, 0);
  objc_storeStrong((id *)&self->_variableBeingEdited, 0);
  objc_storeStrong((id *)&self->_templateBuilder, 0);
  objc_storeStrong((id *)&self->_currentlyTypingSlotIdentifier, 0);
  objc_storeStrong((id *)&self->_currentlyEditingSlotIdentifier, 0);
  objc_storeStrong((id *)&self->_currentEditor, 0);
  objc_storeStrong((id *)&self->_mutableStagedParameterStates, 0);
  objc_storeStrong((id *)&self->_contents, 0);
  objc_storeStrong((id *)&self->_templateView, 0);
  objc_destroyWeak((id *)&self->_auxiliaryViewPresenter);
  objc_destroyWeak((id *)&self->_variableUIDelegate);
  objc_destroyWeak((id *)&self->_variableProvider);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_updateBlock, 0);
  objc_storeStrong((id *)&self->_parameterStates, 0);
  objc_storeStrong((id *)&self->_editableParameters, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_summaryFormatString, 0);
}

- (void)setVariablesBeingObserved:(id)a3
{
}

- (NSHashTable)variablesBeingObserved
{
  return self->_variablesBeingObserved;
}

- (void)setVariableBeingEdited:(id)a3
{
}

- (WFVariable)variableBeingEdited
{
  return self->_variableBeingEdited;
}

- (void)setTemplateBuilder:(id)a3
{
}

- (WFModuleSummaryTemplateBuilder)templateBuilder
{
  return self->_templateBuilder;
}

- (void)setCurrentlyTypingSlotIdentifier:(id)a3
{
}

- (WFSlotIdentifier)currentlyTypingSlotIdentifier
{
  return self->_currentlyTypingSlotIdentifier;
}

- (void)setCurrentlyEditingSlotIdentifier:(id)a3
{
}

- (WFSlotIdentifier)currentlyEditingSlotIdentifier
{
  return self->_currentlyEditingSlotIdentifier;
}

- (void)setCurrentEditor:(id)a3
{
}

- (WFModuleSummaryEditor)currentEditor
{
  return self->_currentEditor;
}

- (void)setMutableStagedParameterStates:(id)a3
{
}

- (NSMutableDictionary)mutableStagedParameterStates
{
  return self->_mutableStagedParameterStates;
}

- (void)setContents:(id)a3
{
}

- (NSArray)contents
{
  return self->_contents;
}

- (void)setCurrentEditorIsEditing:(BOOL)a3
{
  self->_currentEditorIsEditing = a3;
}

- (BOOL)currentEditorIsEditing
{
  return self->_currentEditorIsEditing;
}

- (WFSlotTemplateView)templateView
{
  return self->_templateView;
}

- (void)setAllowsPickingVariables:(BOOL)a3
{
  self->_allowsPickingVariables = a3;
}

- (BOOL)allowsPickingVariables
{
  return self->_allowsPickingVariables;
}

- (void)setAuxiliaryViewPresenter:(id)a3
{
}

- (WFEditorAuxiliaryViewPresenter)auxiliaryViewPresenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_auxiliaryViewPresenter);
  return (WFEditorAuxiliaryViewPresenter *)WeakRetained;
}

- (void)setVariableUIDelegate:(id)a3
{
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

- (void)setDelegate:(id)a3
{
}

- (WFModuleSummaryCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFModuleSummaryCoordinatorDelegate *)WeakRetained;
}

- (void)setProcessing:(BOOL)a3
{
  self->_processing = a3;
}

- (BOOL)processing
{
  return self->_processing;
}

- (void)setUpdateBlock:(id)a3
{
}

- (id)updateBlock
{
  return self->_updateBlock;
}

- (NSDictionary)parameterStates
{
  return self->_parameterStates;
}

- (NSSet)editableParameters
{
  return self->_editableParameters;
}

- (NSSet)parameters
{
  return self->_parameters;
}

- (NSString)summaryFormatString
{
  return self->_summaryFormatString;
}

- (void)parameterAttributesDidChange:(id)a3
{
}

- (void)showVariableEditorWithOptions:(id)a3 fromSourceRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v12 = a3;
  v9 = [(WFModuleSummaryCoordinator *)self variableUIDelegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    v11 = [(WFModuleSummaryCoordinator *)self variableUIDelegate];
    objc_msgSend(v11, "showVariableEditorWithOptions:fromSourceRect:", v12, x, y, width, height);
  }
}

- (void)showParameterEditingHint:(id)a3
{
  id v7 = a3;
  v4 = [(WFModuleSummaryCoordinator *)self variableUIDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    v6 = [(WFModuleSummaryCoordinator *)self variableUIDelegate];
    [v6 showParameterEditingHint:v7];
  }
}

- (void)revealAction:(id)a3 preScrollHandler:(id)a4 goBackHandler:(id)a5 scrolledAwayHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(WFModuleSummaryCoordinator *)self variableUIDelegate];
  [v14 revealAction:v13 preScrollHandler:v12 goBackHandler:v11 scrolledAwayHandler:v10];
}

- (void)showActionOutputPickerAllowingShortcutInput:(BOOL)a3 variableProvider:(id)a4 completionHandler:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = a4;
  BOOL v10 = [(WFModuleSummaryCoordinator *)self currentEditorIsEditing];
  [(WFModuleSummaryCoordinator *)self setCurrentEditorIsEditing:1];
  id v11 = [(WFModuleSummaryCoordinator *)self variableUIDelegate];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __109__WFModuleSummaryCoordinator_showActionOutputPickerAllowingShortcutInput_variableProvider_completionHandler___block_invoke;
  v13[3] = &unk_264BFCE00;
  BOOL v15 = v10;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 showActionOutputPickerAllowingShortcutInput:v6 variableProvider:v9 completionHandler:v13];
}

uint64_t __109__WFModuleSummaryCoordinator_showActionOutputPickerAllowingShortcutInput_variableProvider_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (!*(unsigned char *)(a1 + 48))
  {
    v3 = *(void **)(a1 + 32);
    return [v3 cancelEditingWithCompletionHandler:0];
  }
  return result;
}

- (void)variableDidChange:(id)a3
{
}

- (void)updateVariableObservationsWithContents:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  char v5 = [(WFModuleSummaryCoordinator *)self variablesBeingObserved];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v9++) removeDelegate:self];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  BOOL v10 = [(WFModuleSummaryCoordinator *)self variablesBeingObserved];
  [v10 removeAllObjects];

  id v11 = objc_opt_class();
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __69__WFModuleSummaryCoordinator_updateVariableObservationsWithContents___block_invoke;
  v12[3] = &unk_264BFCDB0;
  v12[4] = self;
  [v11 enumerateVariableAttachmentsInContents:v4 withBlock:v12];
}

void __69__WFModuleSummaryCoordinator_updateVariableObservationsWithContents___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 variable];
  [v3 addDelegate:*(void *)(a1 + 32)];
}

- (void)summaryEditor:(id)a3 willUpdateVariable:(id)a4
{
}

- (id)transformParameterStateForSerialization:(id)a3 arrayIndex:(unint64_t)a4 parameter:(id)a5
{
  v23[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  if (!v8
    || a4 == 0x7FFFFFFFFFFFFFFFLL
    || (objc_opt_class(), char isKindOfClass = objc_opt_isKindOfClass(), !v9)
    || (isKindOfClass & 1) != 0)
  {
    id v17 = v8;
    goto LABEL_15;
  }
  id v11 = [v9 key];
  id v12 = [(WFModuleSummaryCoordinator *)self currentParameterStateForParameterKey:v11];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_13;
  }
  id v13 = v12;
  long long v14 = [v13 value];
  unint64_t v15 = [v14 count];

  if (v15 <= a4)
  {
    if ([v9 isRangedSizeArray])
    {
      unint64_t v18 = [v9 arrayMaxCountForWidgetFamily:3];
      v19 = [v13 value];
      unint64_t v20 = [v19 count];

      if (v20 < v18)
      {
        uint64_t v16 = [v13 stateByAppendingValue:v8];
        goto LABEL_14;
      }
    }

LABEL_13:
    id v21 = objc_alloc((Class)[v9 multipleStateClass]);
    v23[0] = v8;
    id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
    uint64_t v16 = [v21 initWithParameterStates:v13];
    goto LABEL_14;
  }
  uint64_t v16 = [v13 stateByReplacingValueAtIndex:a4 withValue:v8];
LABEL_14:
  id v17 = (id)v16;

LABEL_15:
  return v17;
}

- (void)commitParameterState:(id)a3 forKey:(id)a4
{
  id v24 = a4;
  id v6 = a3;
  uint64_t v7 = [(WFModuleSummaryCoordinator *)self parameterForKey:v24];
  id v8 = [(WFModuleSummaryCoordinator *)self currentEditor];
  id v9 = [v8 parameter];
  BOOL v10 = [v9 key];
  if ([v10 isEqualToString:v24])
  {
    id v11 = [(WFModuleSummaryCoordinator *)self currentEditor];
    uint64_t v12 = [v11 arrayIndex];
  }
  else
  {
    uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  }

  id v13 = [(WFModuleSummaryCoordinator *)self transformParameterStateForSerialization:v6 arrayIndex:v12 parameter:v7];

  long long v14 = [(WFModuleSummaryCoordinator *)self mutableStagedParameterStates];
  [v14 removeObjectForKey:v24];

  unint64_t v15 = [(WFModuleSummaryCoordinator *)self parameterStates];
  uint64_t v16 = (void *)[v15 mutableCopy];
  id v17 = v16;
  if (v16) {
    id v18 = v16;
  }
  else {
    id v18 = (id)objc_opt_new();
  }
  v19 = v18;

  if (v13) {
    [v19 setObject:v13 forKey:v24];
  }
  else {
    [v19 removeObjectForKey:v24];
  }
  unint64_t v20 = (NSDictionary *)[v19 copy];
  parameterStates = self->_parameterStates;
  self->_parameterStates = v20;

  [(WFModuleSummaryCoordinator *)self updateTemplateContentsAnimated:0];
  v22 = [(WFModuleSummaryCoordinator *)self updateBlock];

  if (v22)
  {
    v23 = [(WFModuleSummaryCoordinator *)self updateBlock];
    ((void (**)(void, id, void *))v23)[2](v23, v24, v13);
  }
}

- (void)summaryEditor:(id)a3 didCommitAuxiliaryParameterState:(id)a4 forKey:(id)a5
{
}

- (void)summaryEditor:(id)a3 didCommitParameterState:(id)a4
{
  id v6 = a4;
  id v8 = [a3 parameter];
  uint64_t v7 = [v8 key];
  [(WFModuleSummaryCoordinator *)self commitParameterState:v6 forKey:v7];
}

- (void)summaryEditor:(id)a3 didStageParameterState:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 parameter];
  id v16 = [v8 key];

  uint64_t v9 = [v7 arrayIndex];
  BOOL v10 = [v7 parameter];

  id v11 = [(WFModuleSummaryCoordinator *)self transformParameterStateForSerialization:v6 arrayIndex:v9 parameter:v10];

  uint64_t v12 = [(WFModuleSummaryCoordinator *)self mutableStagedParameterStates];
  id v13 = v12;
  if (v11)
  {
    [v12 setObject:v11 forKey:v16];
  }
  else
  {
    long long v14 = [MEMORY[0x263EFF9D0] null];
    [v13 setObject:v14 forKey:v16];
  }
  unint64_t v15 = [(WFModuleSummaryCoordinator *)self currentlyTypingSlotIdentifier];

  if (!v15) {
    [(WFModuleSummaryCoordinator *)self updateTemplateContentsAnimated:0];
  }
}

- (void)summaryEditorDidFinish:(id)a3 returnToKeyboard:(BOOL)a4 withTextAttachmentToEdit:(id)a5
{
  BOOL v5 = a4;
  id v13 = a5;
  id v7 = [(WFModuleSummaryCoordinator *)self currentlyEditingSlotIdentifier];
  [(WFModuleSummaryCoordinator *)self destroyCurrentEditor];
  if (v7)
  {
    if (v5)
    {
      id v8 = [(WFModuleSummaryCoordinator *)self templateView];
      [v8 selectSlotWithIdentifier:v7];

      uint64_t v9 = self;
      BOOL v10 = v7;
      id v11 = 0;
    }
    else
    {
      if (!v13) {
        goto LABEL_7;
      }
      uint64_t v12 = [(WFModuleSummaryCoordinator *)self templateView];
      [v12 endTyping];

      uint64_t v9 = self;
      BOOL v10 = v7;
      id v11 = v13;
    }
    [(WFModuleSummaryCoordinator *)v9 beginEditingSlotWithIdentifier:v10 fromTextAttachment:v11];
  }
LABEL_7:
}

- (void)summaryEditorDidRequestTextEntry:(id)a3
{
  id v4 = [(WFModuleSummaryCoordinator *)self currentlyEditingSlotIdentifier];
  [(WFModuleSummaryCoordinator *)self setCurrentlyTypingSlotIdentifier:v4];

  id v6 = [(WFModuleSummaryCoordinator *)self templateView];
  BOOL v5 = [(WFModuleSummaryCoordinator *)self currentlyEditingSlotIdentifier];
  [v6 beginTypingInSlotWithIdentifier:v5];
}

- (void)summaryEditor:(id)a3 didRequestEditingSlotWithIdentifier:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  id v7 = [(WFModuleSummaryCoordinator *)self currentEditor];
  if (v7 != v15) {
    goto LABEL_2;
  }
  id v8 = [(WFModuleSummaryCoordinator *)self currentlyEditingSlotIdentifier];
  id v9 = v6;
  BOOL v10 = v9;
  if (v8 == v9)
  {

    goto LABEL_12;
  }
  if (!v9 || !v8)
  {

    id v7 = v15;
LABEL_2:

    goto LABEL_3;
  }
  char v11 = [v8 isEqual:v9];

  if (v11)
  {
LABEL_12:
    id v7 = [(WFModuleSummaryCoordinator *)self presentationAnchorForSlotWithIdentifier:v10];
    if (v7)
    {
      [(WFModuleSummaryCoordinator *)self setCurrentEditorIsEditing:1];
      uint64_t v12 = [(WFModuleSummaryCoordinator *)self delegate];
      char v13 = objc_opt_respondsToSelector();

      if (v13)
      {
        long long v14 = [(WFModuleSummaryCoordinator *)self delegate];
        [v14 summaryCoordinatorWillBeginEditing:self];
      }
      [v15 beginEditingSlotWithIdentifier:v10 presentationAnchor:v7];
    }
    goto LABEL_2;
  }
LABEL_3:
}

- (id)initialStateForSummaryEditor:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(WFModuleSummaryCoordinator *)self parameterStates];
  id v6 = [v4 parameter];
  id v7 = [v6 key];
  id v8 = [v5 objectForKey:v7];

  id v9 = [v4 parameter];

  LODWORD(v4) = [v9 parameterStateIsValid:v8];
  if (v4) {
    id v10 = v8;
  }
  else {
    id v10 = 0;
  }

  return v10;
}

- (void)cancelEditingWithCompletionHandler:(id)a3
{
  id v7 = (void (**)(void))a3;
  id v4 = [(WFModuleSummaryCoordinator *)self currentEditor];
  if (v4)
  {
    BOOL v5 = [(WFModuleSummaryCoordinator *)self templateView];
    [v5 endTyping];

    [(WFModuleSummaryCoordinator *)self destroyCurrentEditor];
    [v4 setDelegate:0];
    if (v7) {
      id v6 = v7;
    }
    else {
      id v6 = (void (**)(void))&__block_literal_global_184;
    }
    [v4 cancelEditingWithCompletionHandler:v6];
  }
  else if (v7)
  {
    v7[2]();
  }
}

- (id)firstSlotIdentifierWithParameterKey:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  BOOL v5 = [(WFModuleSummaryCoordinator *)self contents];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = v10;
          uint64_t v12 = [v11 identifier];
          char v13 = [v12 parameterKey];
          char v14 = [v13 isEqualToString:v4];

          if (v14)
          {

            goto LABEL_13;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  uint64_t v12 = 0;
LABEL_13:

  return v12;
}

- (void)destroyCurrentEditor
{
  [(WFModuleSummaryCoordinator *)self setCurrentEditor:0];
  [(WFModuleSummaryCoordinator *)self setCurrentlyTypingSlotIdentifier:0];
  [(WFModuleSummaryCoordinator *)self setCurrentlyEditingSlotIdentifier:0];
  [(WFModuleSummaryCoordinator *)self setCurrentEditorIsEditing:0];
  id v3 = [(WFModuleSummaryCoordinator *)self mutableStagedParameterStates];
  [v3 removeAllObjects];

  id v4 = [(WFModuleSummaryCoordinator *)self variableBeingEdited];

  if (v4)
  {
    [(WFModuleSummaryCoordinator *)self setVariableBeingEdited:0];
    [(WFModuleSummaryCoordinator *)self updateTemplateContentsAnimated:1];
  }
  BOOL v5 = [(WFModuleSummaryCoordinator *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    uint64_t v7 = [(WFModuleSummaryCoordinator *)self delegate];
    [v7 summaryCoordinatorDidEndEditing:self];
  }
  id v8 = [(WFModuleSummaryCoordinator *)self templateView];
  [v8 deselectSlot];
}

- (void)removeElementFromArrayAtIndex:(unint64_t)a3 forParameterKey:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(WFModuleSummaryCoordinator *)self parameterForKey:v6];
  if (v7)
  {
    id v8 = [(WFModuleSummaryCoordinator *)self currentParameterStateForParameterKey:v6];
    uint64_t v9 = [(WFModuleSummaryCoordinator *)self updateBlock];
    if (v9)
    {
      id v10 = (void *)v9;
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v12 = v8;
        char v13 = [v12 value];
        unint64_t v14 = [v13 count];

        if (v14 > a3)
        {
          id v15 = [v12 stateByRemovingValueAtIndex:a3];
          v17[0] = MEMORY[0x263EF8330];
          v17[1] = 3221225472;
          v17[2] = __76__WFModuleSummaryCoordinator_removeElementFromArrayAtIndex_forParameterKey___block_invoke;
          v17[3] = &unk_264BFD4B0;
          v17[4] = self;
          id v18 = v6;
          id v19 = v15;
          id v16 = v15;
          [(WFModuleSummaryCoordinator *)self cancelEditingWithCompletionHandler:v17];
        }
      }
    }
  }
}

void __76__WFModuleSummaryCoordinator_removeElementFromArrayAtIndex_forParameterKey___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) updateBlock];
  (*((void (**)(id, void, void))v2 + 2))(v2, *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (id)addElementToArrayForParameterKey:(id)a3
{
  v22[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(WFModuleSummaryCoordinator *)self parameterForKey:v4];
  if (v5)
  {
    id v6 = [(WFModuleSummaryCoordinator *)self currentParameterStateForParameterKey:v4];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v7 = [v5 defaultStateForNewArrayElement];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = [v6 stateByAppendingValue:v7];
      }
      else
      {
        id v10 = objc_alloc((Class)[v5 multipleStateClass]);
        v22[0] = v7;
        id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];
        id v8 = (void *)[v10 initWithParameterStates:v11];
      }
      id v12 = [(WFModuleSummaryCoordinator *)self mutableStagedParameterStates];
      [v12 setObject:v8 forKey:v4];

      char v13 = [v8 value];
      uint64_t v14 = [v13 count] - 1;

      uint64_t v9 = [v5 moduleSummarySlotForState:v7];
      uint64_t v15 = [v9 identifier];
      id v16 = [(id)v15 identifierBySettingParameterKey:v4 arrayIndex:v14];
      [v9 setIdentifier:v16];

      [(WFModuleSummaryCoordinator *)self updateTemplateContentsAnimated:1];
      long long v17 = [(WFModuleSummaryCoordinator *)self delegate];
      LOBYTE(v15) = objc_opt_respondsToSelector();

      if (v15)
      {
        id v18 = [(WFModuleSummaryCoordinator *)self delegate];
        [v18 summaryCoordinatorDidInvalidateSize:self];
      }
      id v19 = [(WFModuleSummaryCoordinator *)self templateView];
      unint64_t v20 = [v9 identifier];
      [v19 selectSlotWithIdentifier:v20];
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)beginEditingSlotWithIdentifier:(id)a3 fromTextAttachment:(id)a4
{
  id v19 = a3;
  id v7 = a4;
  id v8 = [(WFModuleSummaryCoordinator *)self currentEditor];

  if (v8)
  {
    id v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"WFModuleSummaryCoordinator.m" lineNumber:365 description:@"There's an active editor that hasn't been cancelled"];
  }
  uint64_t v9 = [(WFModuleSummaryCoordinator *)self createSummaryEditorForSlotWithIdentifier:v19];
  id v10 = [(WFModuleSummaryCoordinator *)self presentationAnchorForSlotWithIdentifier:v19];
  if (v10)
  {
    id v11 = [(WFModuleSummaryCoordinator *)self templateView];
    uint64_t v12 = [v19 key];
    char v13 = (void *)v12;
    if (v11 && v12)
    {
      [(WFModuleSummaryCoordinator *)self setCurrentEditor:v9];
      [(WFModuleSummaryCoordinator *)self setCurrentlyEditingSlotIdentifier:v19];
      [(WFModuleSummaryCoordinator *)self setCurrentEditorIsEditing:1];
      uint64_t v14 = [(WFModuleSummaryCoordinator *)self delegate];
      char v15 = objc_opt_respondsToSelector();

      if (v15)
      {
        id v16 = [(WFModuleSummaryCoordinator *)self delegate];
        [v16 summaryCoordinatorWillBeginEditing:self];
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v17 = [v7 variable];
        [(WFModuleSummaryCoordinator *)self setVariableBeingEdited:v17];

        [(WFModuleSummaryCoordinator *)self updateTemplateContentsAnimated:1];
      }
      if ([v13 isEqualToString:@"_array_add_"])
      {
        [v9 beginEditingNewArrayElementFromPresentationAnchor:v10];
      }
      else if (v7)
      {
        [v9 beginEditingTextAttachment:v7 inSlotWithIdentifier:v19 presentationAnchor:v10];
      }
      else
      {
        [v9 beginEditingSlotWithIdentifier:v19 presentationAnchor:v10];
      }
    }
  }
}

- (id)presentationAnchorForSlotWithIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(WFModuleSummaryCoordinator *)self templateView];
  if (v5)
  {
    id v6 = [(WFModuleSummaryCoordinator *)self delegate];
    id v7 = [v6 viewControllerForCoordinator:self];

    if (v7)
    {
      [v5 sourceRectForSlotWithIdentifier:v4];
      uint64_t v12 = -[WFModalPresentationAnchor initWithSourceViewController:sourceView:sourceRect:]([WFModalPresentationAnchor alloc], "initWithSourceViewController:sourceView:sourceRect:", v7, v5, v8, v9, v10, v11);
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)createSummaryEditorForSlotWithIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 parameterKey];
  id v6 = [v4 key];
  uint64_t v7 = [v4 arrayIndex];

  double v8 = 0;
  if (v5 && v6)
  {
    double v9 = [(WFModuleSummaryCoordinator *)self parameterForKey:v5];
    if (v9)
    {
      double v8 = objc_msgSend(objc_alloc(-[WFModuleSummaryCoordinator editorClassForParameter:](self, "editorClassForParameter:", v9)), "initWithParameter:arrayIndex:processing:", v9, v7, -[WFModuleSummaryCoordinator processing](self, "processing"));
      [v8 setDelegate:self];
      double v10 = [(WFModuleSummaryCoordinator *)self variableProvider];
      [v8 setVariableProvider:v10];

      [v8 setVariableUIDelegate:self];
      double v11 = [(WFModuleSummaryCoordinator *)self auxiliaryViewPresenter];
      [v8 setAuxiliaryViewPresenter:v11];

      objc_msgSend(v8, "setAllowsPickingVariables:", -[WFModuleSummaryCoordinator allowsPickingVariables](self, "allowsPickingVariables"));
    }
    else
    {
      double v8 = 0;
    }
  }
  return v8;
}

- (Class)editorClassForParameter:(id)a3
{
  id v3 = (objc_class *)objc_opt_class();
  return WFModuleSummaryEditorClassForParameterClass(v3);
}

- (id)currentParameterStateForParameterKey:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(WFModuleSummaryCoordinator *)self stagedParameterStates];
  id v6 = [v5 objectForKey:v4];
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    double v9 = [(WFModuleSummaryCoordinator *)self parameterStates];
    id v8 = [v9 objectForKey:v4];
  }
  return v8;
}

- (id)parameterForKey:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v5 = [(WFModuleSummaryCoordinator *)self parameters];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        double v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        double v10 = [v9 key];
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (NSDictionary)stagedParameterStates
{
  id v2 = [(WFModuleSummaryCoordinator *)self mutableStagedParameterStates];
  id v3 = (void *)[v2 copy];

  return (NSDictionary *)v3;
}

- (void)slotTemplateView:(id)a3 outputButtonDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(WFModuleSummaryCoordinator *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(WFModuleSummaryCoordinator *)self delegate];
    [v8 summaryCoordinator:self outputButtonDidChange:v4];
  }
}

- (void)slotTemplateView:(id)a3 disclosureArrowDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(WFModuleSummaryCoordinator *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(WFModuleSummaryCoordinator *)self delegate];
    [v8 summaryCoordinator:self disclosureArrowDidChange:v4];
  }
}

- (void)slotTemplateViewDidInvalidateSize:(id)a3
{
  BOOL v4 = [(WFModuleSummaryCoordinator *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(WFModuleSummaryCoordinator *)self delegate];
    [v6 summaryCoordinatorDidInvalidateSize:self];
  }
}

- (void)slotTemplateView:(id)a3 deletePressedOnSlotWithIdentifier:(id)a4 allowResettingValue:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = [v7 parameterKey];
  if (v8)
  {
    double v9 = [v7 key];
    char v10 = [v9 isEqualToString:@"_array_add_"];

    if ((v10 & 1) == 0)
    {
      uint64_t v11 = [v7 arrayIndex];
      if (v11 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v5)
        {
          uint64_t v12 = [(WFModuleSummaryCoordinator *)self parameterForKey:v8];
          if (v12)
          {
            long long v13 = [(WFModuleSummaryCoordinator *)self updateBlock];

            if (v13)
            {
              v14[0] = MEMORY[0x263EF8330];
              v14[1] = 3221225472;
              v14[2] = __101__WFModuleSummaryCoordinator_slotTemplateView_deletePressedOnSlotWithIdentifier_allowResettingValue___block_invoke;
              v14[3] = &unk_264BFD500;
              v14[4] = self;
              id v15 = v8;
              [(WFModuleSummaryCoordinator *)self cancelEditingWithCompletionHandler:v14];
            }
          }
        }
      }
      else
      {
        [(WFModuleSummaryCoordinator *)self removeElementFromArrayAtIndex:v11 forParameterKey:v8];
      }
    }
  }
}

void __101__WFModuleSummaryCoordinator_slotTemplateView_deletePressedOnSlotWithIdentifier_allowResettingValue___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) updateBlock];
  (*((void (**)(id, void, void))v2 + 2))(v2, *(void *)(a1 + 40), 0);
}

- (void)slotTemplateView:(id)a3 didEndTypingInSlotWithIdentifier:(id)a4
{
  id v4 = [(WFModuleSummaryCoordinator *)self currentEditor];
  [v4 textEntryDidFinish];
}

- (void)slotTemplateView:(id)a3 typingDidPasteWithOriginalBlock:(id)a4
{
  id v5 = a4;
  id v6 = [(WFModuleSummaryCoordinator *)self currentEditor];
  [v6 textEntryDidPasteWithOriginalBlock:v5];
}

- (void)slotTemplateView:(id)a3 typingDidCopyWithOriginalBlock:(id)a4
{
  id v5 = a4;
  id v6 = [(WFModuleSummaryCoordinator *)self currentEditor];
  [v6 textEntryDidCopyWithOriginalBlock:v5];
}

- (void)slotTemplateView:(id)a3 typingDidCutWithOriginalBlock:(id)a4
{
  id v5 = a4;
  id v6 = [(WFModuleSummaryCoordinator *)self currentEditor];
  [v6 textEntryDidCutWithOriginalBlock:v5];
}

- (void)slotTemplateView:(id)a3 didChangeText:(id)a4 forSlotWithIdentifier:(id)a5
{
  id v6 = a4;
  id v7 = [(WFModuleSummaryCoordinator *)self currentEditor];
  [v7 textEntryTextDidChange:v6];
}

- (BOOL)slotTemplateView:(id)a3 shouldChangeText:(id)a4 forSlotWithIdentifier:(id)a5
{
  id v6 = a4;
  id v7 = [(WFModuleSummaryCoordinator *)self currentEditor];
  char v8 = [v7 textEntryShouldChangeText:v6];

  return v8;
}

- (void)slotTemplateView:(id)a3 willBeginTypingInSlotWithIdentifier:(id)a4 usingTextEntry:(id)a5 allowMultipleLines:(BOOL *)a6
{
  id v8 = a5;
  id v9 = [(WFModuleSummaryCoordinator *)self currentEditor];
  [v9 textEntryWillBegin:v8 allowMultipleLines:a6];
}

- (void)slotTemplateView:(id)a3 didTapTextAttachment:(id)a4 inSlotWithIdentifier:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v7 variable],
        id v9 = objc_claimAutoreleasedReturnValue(),
        [(WFModuleSummaryCoordinator *)self variableBeingEdited],
        char v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        v9 == v10))
  {
    [(WFModuleSummaryCoordinator *)self cancelEditingWithCompletionHandler:0];
  }
  else
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __89__WFModuleSummaryCoordinator_slotTemplateView_didTapTextAttachment_inSlotWithIdentifier___block_invoke;
    v11[3] = &unk_264BFD4B0;
    v11[4] = self;
    id v12 = v8;
    id v13 = v7;
    [(WFModuleSummaryCoordinator *)self cancelEditingWithCompletionHandler:v11];
  }
}

uint64_t __89__WFModuleSummaryCoordinator_slotTemplateView_didTapTextAttachment_inSlotWithIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) beginEditingSlotWithIdentifier:*(void *)(a1 + 40) fromTextAttachment:*(void *)(a1 + 48)];
}

- (BOOL)slotTemplateView:(id)a3 shouldTapTextAttachment:(id)a4 inSlotWithIdentifier:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [v8 parameterKey];
  uint64_t v10 = [v8 key];
  uint64_t v11 = (void *)v10;
  char v12 = 0;
  if (v9 && v10)
  {
    id v13 = [(WFModuleSummaryCoordinator *)self parameterForKey:v9];
    char v12 = [(objc_class *)[(WFModuleSummaryCoordinator *)self editorClassForParameter:v13] supportsEditingTextAttachment:v7 inSlotWithIdentifier:v8];
  }
  return v12;
}

- (void)menuDidDismissInSlotTemplateView:(id)a3
{
  if (![(WFModuleSummaryCoordinator *)self currentEditorIsEditing])
  {
    [(WFModuleSummaryCoordinator *)self cancelEditingWithCompletionHandler:0];
  }
}

- (id)slotTemplateView:(id)a3 menuForSlotIdentifier:(id)a4 style:(unint64_t)a5
{
  id v7 = a4;
  id v8 = [(WFModuleSummaryCoordinator *)self createSummaryEditorForSlotWithIdentifier:v7];
  id v9 = [v8 menuForSlotWithIdentifier:v7 style:a5];
  if (v9)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __75__WFModuleSummaryCoordinator_slotTemplateView_menuForSlotIdentifier_style___block_invoke;
    v12[3] = &unk_264BFD4B0;
    v12[4] = self;
    id v13 = v8;
    id v14 = v7;
    [(WFModuleSummaryCoordinator *)self cancelEditingWithCompletionHandler:v12];
    id v10 = v9;
  }
  return v9;
}

uint64_t __75__WFModuleSummaryCoordinator_slotTemplateView_menuForSlotIdentifier_style___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setCurrentEditor:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = *(void **)(a1 + 32);
  return [v3 setCurrentlyEditingSlotIdentifier:v2];
}

- (void)slotTemplateView:(id)a3 didDeselectSlotWithIdentifier:(id)a4 completionHandler:(id)a5
{
}

- (void)slotTemplateView:(id)a3 didSelectSlotWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __75__WFModuleSummaryCoordinator_slotTemplateView_didSelectSlotWithIdentifier___block_invoke;
  v10[3] = &unk_264BFD4B0;
  id v11 = v7;
  id v12 = v6;
  id v13 = self;
  id v8 = v6;
  id v9 = v7;
  [(WFModuleSummaryCoordinator *)self cancelEditingWithCompletionHandler:v10];
}

void __75__WFModuleSummaryCoordinator_slotTemplateView_didSelectSlotWithIdentifier___block_invoke(id *a1)
{
  id v8 = a1[4];
  uint64_t v2 = [a1[4] key];
  int v3 = [v2 isEqualToString:@"_array_add_"];

  if (v3)
  {
    [a1[5] deselectSlot];
    id v4 = a1[6];
    id v5 = [a1[4] parameterKey];
    id v6 = [v4 addElementToArrayForParameterKey:v5];

    if (v6)
    {
      uint64_t v7 = [v6 identifier];

      id v8 = (id)v7;
    }
  }
  [a1[6] beginEditingSlotWithIdentifier:v8 fromTextAttachment:0];
}

- (void)setVariableProvider:(id)a3
{
  p_variableProvider = &self->_variableProvider;
  id v5 = a3;
  objc_storeWeak((id *)p_variableProvider, v5);
  id v6 = [(WFModuleSummaryCoordinator *)self currentEditor];
  [v6 setVariableProvider:v5];
}

- (void)slotTemplateViewTintColorDidChange:(id)a3
{
  id v3 = [(WFModuleSummaryCoordinator *)self currentEditor];
  [v3 sourceViewTintColorDidChange];
}

- (void)setParameters:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = self->_parameters;
  id v6 = (NSSet *)v4;
  uint64_t v7 = v6;
  if (v5 == v6)
  {
  }
  else
  {
    if (v6 && v5)
    {
      BOOL v8 = [(NSSet *)v5 isEqualToSet:v6];

      if (v8) {
        goto LABEL_27;
      }
    }
    else
    {
    }
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v9 = self->_parameters;
    uint64_t v10 = [(NSSet *)v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          if (![(NSSet *)v7 containsObject:v14]) {
            [v14 removeEventObserver:self];
          }
        }
        uint64_t v11 = [(NSSet *)v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v11);
    }

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v15 = v7;
    uint64_t v16 = [(NSSet *)v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v24;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v24 != v18) {
            objc_enumerationMutation(v15);
          }
          unint64_t v20 = *(void **)(*((void *)&v23 + 1) + 8 * j);
          if (!-[NSSet containsObject:](self->_parameters, "containsObject:", v20, (void)v23)) {
            [v20 addEventObserver:self];
          }
        }
        uint64_t v17 = [(NSSet *)v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v17);
    }

    uint64_t v21 = (NSSet *)[(NSSet *)v15 copy];
    parameters = self->_parameters;
    self->_parameters = v21;
  }
LABEL_27:
}

- (void)setSummaryFormatString:(id)a3 withParameters:(id)a4 editableParameters:(id)a5 parameterStates:(id)a6
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v50 = a4;
  id v11 = a5;
  id v51 = a6;
  summaryFormatString = self->_summaryFormatString;
  id v13 = (NSString *)v10;
  id v14 = summaryFormatString;
  id v15 = v14;
  if (v14 == v13)
  {
    int v16 = 1;
    goto LABEL_6;
  }
  int v16 = 0;
  if (!v13)
  {
LABEL_6:
    uint64_t v17 = v50;
    goto LABEL_7;
  }
  uint64_t v17 = v50;
  if (v14) {
    int v16 = [(NSString *)v13 isEqualToString:v14];
  }
LABEL_7:

  editableParameters = self->_editableParameters;
  id v19 = (NSSet *)v11;
  unint64_t v20 = editableParameters;
  uint64_t v21 = v20;
  if (v20 == v19)
  {
    int v22 = 1;
  }
  else
  {
    int v22 = 0;
    if (v19 && v20) {
      int v22 = [(NSSet *)v19 isEqual:v20];
    }
  }

  if (v16)
  {
    parameters = self->_parameters;
    id v24 = v17;
    long long v25 = parameters;
    long long v26 = v25;
    if (v25 == v24)
    {
      char v27 = 0;
    }
    else
    {
      if (!v24 || !v25)
      {
LABEL_25:

        goto LABEL_26;
      }
      char v27 = [v24 isEqual:v25] ^ 1;
    }

    if ((v27 & 1) == 0 && ((v22 ^ 1) & 1) == 0)
    {
      parameterStates = self->_parameterStates;
      id v24 = v51;
      long long v29 = parameterStates;
      if (v29 == v24)
      {

        goto LABEL_41;
      }
      long long v26 = v29;
      if (v24 && v29)
      {
        char v30 = [v24 isEqual:v29];

        if (v30) {
          goto LABEL_41;
        }
        goto LABEL_26;
      }
      goto LABEL_25;
    }
  }
LABEL_26:
  v31 = (NSString *)[(NSString *)v13 copy];
  v32 = self->_summaryFormatString;
  self->_summaryFormatString = v31;

  [(WFModuleSummaryCoordinator *)self setParameters:v17];
  uint64_t v33 = (NSSet *)[(NSSet *)v19 copy];
  v34 = self->_editableParameters;
  self->_editableParameters = v33;

  v35 = (NSDictionary *)[v51 copy];
  v36 = self->_parameterStates;
  self->_parameterStates = v35;

  if ((v16 & 1) == 0)
  {
    v37 = [[WFModuleSummaryTemplateBuilder alloc] initWithFormatString:v13];
    [(WFModuleSummaryCoordinator *)self setTemplateBuilder:v37];

    int v22 = 0;
  }
  [(WFModuleSummaryCoordinator *)self updateTemplateContentsAnimated:v22 ^ 1u];
  v38 = [(WFModuleSummaryCoordinator *)self currentlyEditingSlotIdentifier];

  if (v38)
  {
    v49 = v13;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    v39 = [(WFModuleSummaryCoordinator *)self contents];
    uint64_t v40 = [v39 countByEnumeratingWithState:&v52 objects:v56 count:16];
    if (v40)
    {
      uint64_t v41 = v40;
      uint64_t v42 = *(void *)v53;
      while (2)
      {
        for (uint64_t i = 0; i != v41; ++i)
        {
          if (*(void *)v53 != v42) {
            objc_enumerationMutation(v39);
          }
          v44 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v45 = [v44 identifier];
            v46 = [(WFModuleSummaryCoordinator *)self currentlyEditingSlotIdentifier];
            char v47 = [v45 isEqual:v46];

            if (v47)
            {

              goto LABEL_40;
            }
          }
        }
        uint64_t v41 = [v39 countByEnumeratingWithState:&v52 objects:v56 count:16];
        if (v41) {
          continue;
        }
        break;
      }
    }

    v48 = [(WFModuleSummaryCoordinator *)self currentEditor];
    [v48 setDelegate:0];

    [(WFModuleSummaryCoordinator *)self cancelEditingWithCompletionHandler:0];
LABEL_40:
    id v13 = v49;
    uint64_t v17 = v50;
  }
LABEL_41:
}

- (void)updateTemplateContentsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_opt_class();
  id v6 = [(WFModuleSummaryCoordinator *)self stagedParameterStates];
  uint64_t v7 = [(WFModuleSummaryCoordinator *)self parameterStates];
  id v16 = [v5 parameterStatesByApplyingStaging:v6 toOriginal:v7];

  BOOL v8 = [(WFModuleSummaryCoordinator *)self templateBuilder];
  id v9 = [(WFModuleSummaryCoordinator *)self parameters];
  id v10 = [(WFModuleSummaryCoordinator *)self editableParameters];
  id v11 = [(WFModuleSummaryCoordinator *)self variableBeingEdited];
  uint64_t v12 = [v8 buildContentWithParameters:v9 editableParameters:v10 parameterStates:v16 variableBeingEdited:v11];
  [(WFModuleSummaryCoordinator *)self setContents:v12];

  id v13 = [(WFModuleSummaryCoordinator *)self contents];
  [(WFModuleSummaryCoordinator *)self updateVariableObservationsWithContents:v13];

  id v14 = [(WFModuleSummaryCoordinator *)self templateView];
  id v15 = [(WFModuleSummaryCoordinator *)self contents];
  [v14 setContents:v15 animated:v3];
}

- (void)setTemplateView:(id)a3
{
  id v5 = a3;
  p_templateView = &self->_templateView;
  uint64_t v7 = self->_templateView;
  BOOL v8 = (WFSlotTemplateView *)v5;
  id v16 = v8;
  if (v7 == v8)
  {

    id v10 = v16;
LABEL_13:

    goto LABEL_14;
  }
  if (v8 && v7)
  {
    char v9 = [(WFSlotTemplateView *)v7 isEqual:v8];

    if (v9) {
      goto LABEL_14;
    }
  }
  else
  {
  }
  [(WFSlotTemplateView *)*p_templateView setDelegate:0];
  [(WFSlotTemplateView *)*p_templateView deselectSlot];
  id v11 = [(WFSlotTemplateView *)*p_templateView typingSlotIdentifier];

  if (v11) {
    [(WFSlotTemplateView *)*p_templateView endTyping];
  }
  objc_storeStrong((id *)&self->_templateView, a3);
  [(WFSlotTemplateView *)v16 setDelegate:self];
  uint64_t v12 = [(WFModuleSummaryCoordinator *)self contents];
  [(WFSlotTemplateView *)v16 setContents:v12 animated:0];

  id v13 = [(WFModuleSummaryCoordinator *)self currentlyEditingSlotIdentifier];

  if (v13)
  {
    id v14 = [(WFModuleSummaryCoordinator *)self currentlyEditingSlotIdentifier];
    [(WFSlotTemplateView *)v16 selectSlotWithIdentifier:v14];

    id v15 = [(WFModuleSummaryCoordinator *)self currentlyTypingSlotIdentifier];

    if (v15)
    {
      id v10 = [(WFModuleSummaryCoordinator *)self currentlyTypingSlotIdentifier];
      [(WFSlotTemplateView *)v16 beginTypingInSlotWithIdentifier:v10];
      goto LABEL_13;
    }
  }
LABEL_14:
}

- (WFModuleSummaryCoordinator)init
{
  v11.receiver = self;
  v11.super_class = (Class)WFModuleSummaryCoordinator;
  uint64_t v2 = [(WFModuleSummaryCoordinator *)&v11 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    mutableStagedParameterStates = v2->_mutableStagedParameterStates;
    v2->_mutableStagedParameterStates = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    variablesBeingObserved = v2->_variablesBeingObserved;
    v2->_variablesBeingObserved = (NSHashTable *)v5;

    uint64_t v7 = objc_opt_new();
    contents = v2->_contents;
    v2->_contents = (NSArray *)v7;

    char v9 = v2;
  }

  return v2;
}

+ (double)heightForWidth:(double)a3 withSummaryFormatString:(id)a4 parameters:(id)a5 editableParameters:(id)a6 parameterStates:(id)a7 stagedParameterStates:(id)a8 horizontalPadding:(double)a9 font:(id)a10 unpopulatedFont:(id)a11 textAlignment:(int64_t)a12
{
  id v20 = a10;
  id v21 = a11;
  id v22 = a6;
  id v23 = a5;
  id v24 = a4;
  long long v25 = [a1 parameterStatesByApplyingStaging:a8 toOriginal:a7];
  long long v26 = [[WFModuleSummaryTemplateBuilder alloc] initWithFormatString:v24];

  char v27 = [(WFModuleSummaryTemplateBuilder *)v26 buildContentWithParameters:v23 editableParameters:v22 parameterStates:v25 variableBeingEdited:0];

  if ([v27 count])
  {
    long long v28 = objc_opt_class();
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __190__WFModuleSummaryCoordinator_heightForWidth_withSummaryFormatString_parameters_editableParameters_parameterStates_stagedParameterStates_horizontalPadding_font_unpopulatedFont_textAlignment___block_invoke;
    v33[3] = &unk_264BFCDB0;
    id v29 = v20;
    id v34 = v29;
    [v28 enumerateVariableAttachmentsInContents:v27 withBlock:v33];
    +[WFSlotTemplateView heightForWidth:v27 withContents:v29 horizontalPadding:v21 font:a12 unpopulatedFont:a3 alignment:a9];
    double v31 = v30;
  }
  else
  {
    double v31 = 0.0;
  }

  return v31;
}

uint64_t __190__WFModuleSummaryCoordinator_heightForWidth_withSummaryFormatString_parameters_editableParameters_parameterStates_stagedParameterStates_horizontalPadding_font_unpopulatedFont_textAlignment___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setFont:*(void *)(a1 + 32)];
}

+ (id)parameterStatesByApplyingStaging:(id)a3 toOriginal:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if ([v5 count])
  {
    BOOL v8 = (void *)[v6 mutableCopy];
    char v9 = v8;
    if (v8) {
      id v10 = v8;
    }
    else {
      id v10 = (id)objc_opt_new();
    }
    objc_super v11 = v10;

    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __74__WFModuleSummaryCoordinator_parameterStatesByApplyingStaging_toOriginal___block_invoke;
    v14[3] = &unk_264BFCDD8;
    id v12 = v11;
    id v15 = v12;
    [v5 enumerateKeysAndObjectsUsingBlock:v14];
    id v7 = v12;
  }
  return v7;
}

void __74__WFModuleSummaryCoordinator_parameterStatesByApplyingStaging_toOriginal___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a3;
  id v5 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass) {
    [v7 removeObjectForKey:v5];
  }
  else {
    [v7 setObject:v8 forKey:v5];
  }
}

+ (void)enumerateVariableAttachmentsInContents:(id)a3 withBlock:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v16 = a4;
  obuint64_t j = v5;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    uint64_t v9 = *MEMORY[0x263F814A0];
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(obj);
        }
        objc_super v11 = *(void **)(*((void *)&v20 + 1) + 8 * v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v12 = v11;
          id v13 = [v12 contentAttributedString];
          id v14 = [v12 contentAttributedString];
          uint64_t v15 = [v14 length];
          v18[0] = MEMORY[0x263EF8330];
          v18[1] = 3221225472;
          v18[2] = __79__WFModuleSummaryCoordinator_enumerateVariableAttachmentsInContents_withBlock___block_invoke;
          v18[3] = &unk_264BFCD88;
          id v19 = v16;
          objc_msgSend(v13, "enumerateAttribute:inRange:options:usingBlock:", v9, 0, v15, 0, v18);
        }
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }
}

void __79__WFModuleSummaryCoordinator_enumerateVariableAttachmentsInContents_withBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

@end