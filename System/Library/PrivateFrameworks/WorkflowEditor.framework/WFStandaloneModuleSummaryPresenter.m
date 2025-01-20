@interface WFStandaloneModuleSummaryPresenter
- (WFModalPresentationAnchor)presentationAnchor;
- (WFModuleSummaryEditor)editor;
- (WFParameterState)initialState;
- (WFSlotIdentifier)slotIdentifier;
- (WFStandaloneModuleSummaryPresenter)initWithParameter:(id)a3 slotIdentifier:(id)a4 initialState:(id)a5 isProcessing:(BOOL)a6 variableProvider:(id)a7 variableUIDelegate:(id)a8 presentationAnchor:(id)a9 allowsPickingVariables:(BOOL)a10;
- (WFStandaloneModuleSummaryPresenterDelegate)delegate;
- (WFStandaloneModuleSummaryPresenterDelegate)retainedDelegate;
- (id)menu;
- (void)dismiss;
- (void)present;
- (void)releaseDelegate;
- (void)retainDelegate;
- (void)setDelegate:(id)a3;
- (void)setEditor:(id)a3;
- (void)setPresentationAnchor:(id)a3;
- (void)setRetainedDelegate:(id)a3;
- (void)summaryEditor:(id)a3 didCommitParameterState:(id)a4;
- (void)summaryEditor:(id)a3 didStageParameterState:(id)a4;
- (void)summaryEditorDidFinish:(id)a3 returnToKeyboard:(BOOL)a4 withTextAttachmentToEdit:(id)a5;
- (void)summaryEditorDidRequestTextEntry:(id)a3;
@end

@implementation WFStandaloneModuleSummaryPresenter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retainedDelegate, 0);
  objc_storeStrong((id *)&self->_presentationAnchor, 0);
  objc_storeStrong((id *)&self->_slotIdentifier, 0);
  objc_storeStrong((id *)&self->_initialState, 0);
  objc_storeStrong((id *)&self->_editor, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setRetainedDelegate:(id)a3
{
}

- (WFStandaloneModuleSummaryPresenterDelegate)retainedDelegate
{
  return self->_retainedDelegate;
}

- (void)setPresentationAnchor:(id)a3
{
}

- (WFModalPresentationAnchor)presentationAnchor
{
  return self->_presentationAnchor;
}

- (WFSlotIdentifier)slotIdentifier
{
  return self->_slotIdentifier;
}

- (WFParameterState)initialState
{
  return self->_initialState;
}

- (void)setEditor:(id)a3
{
}

- (WFModuleSummaryEditor)editor
{
  return self->_editor;
}

- (void)setDelegate:(id)a3
{
}

- (WFStandaloneModuleSummaryPresenterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFStandaloneModuleSummaryPresenterDelegate *)WeakRetained;
}

- (void)summaryEditorDidRequestTextEntry:(id)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = getWFGeneralLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    int v4 = 136315138;
    v5 = "-[WFStandaloneModuleSummaryPresenter summaryEditorDidRequestTextEntry:]";
    _os_log_impl(&dword_23490C000, v3, OS_LOG_TYPE_FAULT, "%s Text entry isn't supported in old-UI parameters represented as buttons", (uint8_t *)&v4, 0xCu);
  }
}

- (void)summaryEditorDidFinish:(id)a3 returnToKeyboard:(BOOL)a4 withTextAttachmentToEdit:(id)a5
{
  -[WFStandaloneModuleSummaryPresenter setEditor:](self, "setEditor:", 0, a4, a5);
  uint64_t v6 = [(WFStandaloneModuleSummaryPresenter *)self delegate];
  [v6 moduleSummaryPresenterDidFinish:self];

  [(WFStandaloneModuleSummaryPresenter *)self releaseDelegate];
}

- (void)summaryEditor:(id)a3 didCommitParameterState:(id)a4
{
  id v5 = a4;
  id v6 = [(WFStandaloneModuleSummaryPresenter *)self delegate];
  [v6 moduleSummaryPresenter:self didCommitParameterState:v5];
}

- (void)summaryEditor:(id)a3 didStageParameterState:(id)a4
{
  id v8 = a4;
  id v5 = [(WFStandaloneModuleSummaryPresenter *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(WFStandaloneModuleSummaryPresenter *)self delegate];
    [v7 moduleSummaryPresenter:self didStageParameterState:v8];
  }
}

- (void)releaseDelegate
{
}

- (void)retainDelegate
{
  id v3 = [(WFStandaloneModuleSummaryPresenter *)self delegate];
  [(WFStandaloneModuleSummaryPresenter *)self setRetainedDelegate:v3];
}

- (id)menu
{
  id v3 = [(WFStandaloneModuleSummaryPresenter *)self editor];
  int v4 = [(WFStandaloneModuleSummaryPresenter *)self slotIdentifier];
  id v5 = [v3 menuForSlotWithIdentifier:v4 style:0];

  if (v5) {
    [(WFStandaloneModuleSummaryPresenter *)self retainDelegate];
  }
  return v5;
}

- (void)dismiss
{
  id v3 = [(WFStandaloneModuleSummaryPresenter *)self editor];
  [v3 cancelEditingWithCompletionHandler:&__block_literal_global_1549];

  [(WFStandaloneModuleSummaryPresenter *)self setEditor:0];
  [(WFStandaloneModuleSummaryPresenter *)self releaseDelegate];
}

- (void)present
{
  id v3 = [(WFStandaloneModuleSummaryPresenter *)self presentationAnchor];

  if (v3)
  {
    int v4 = [(WFStandaloneModuleSummaryPresenter *)self editor];
    id v5 = [(WFStandaloneModuleSummaryPresenter *)self slotIdentifier];
    char v6 = [(WFStandaloneModuleSummaryPresenter *)self presentationAnchor];
    [v4 beginEditingSlotWithIdentifier:v5 presentationAnchor:v6];

    [(WFStandaloneModuleSummaryPresenter *)self retainDelegate];
  }
}

- (WFStandaloneModuleSummaryPresenter)initWithParameter:(id)a3 slotIdentifier:(id)a4 initialState:(id)a5 isProcessing:(BOOL)a6 variableProvider:(id)a7 variableUIDelegate:(id)a8 presentationAnchor:(id)a9 allowsPickingVariables:(BOOL)a10
{
  BOOL v12 = a6;
  id v16 = a3;
  id v27 = a4;
  id v26 = a5;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  v28.receiver = self;
  v28.super_class = (Class)WFStandaloneModuleSummaryPresenter;
  v20 = [(WFStandaloneModuleSummaryPresenter *)&v28 init];
  if (v20 && (v21 = (objc_class *)objc_opt_class(), (v22 = WFModuleSummaryEditorClassForParameterClass(v21)) != 0))
  {
    v23 = (void *)[[v22 alloc] initWithParameter:v16 arrayIndex:0x7FFFFFFFFFFFFFFFLL processing:v12];
    [v23 setDelegate:v20];
    [v23 setVariableProvider:v17];
    [v23 setVariableUIDelegate:v18];
    [v23 setAllowsPickingVariables:a10];
    [(WFStandaloneModuleSummaryPresenter *)v20 setEditor:v23];
    objc_storeStrong((id *)&v20->_initialState, a5);
    objc_storeStrong((id *)&v20->_slotIdentifier, a4);
    objc_storeStrong((id *)&v20->_presentationAnchor, a9);
    v24 = v20;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

@end