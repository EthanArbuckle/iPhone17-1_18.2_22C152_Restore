@interface MOSuggestionsSheetClientProxyTarget
- (MOSuggestionsSheetClientProxyTarget)initWithController:(id)a3;
- (void)didGrantSandboxAccessFor:(id)a3;
- (void)didReceiveStateUpdateRequest:(id)a3;
- (void)performTask:(id)a3 suggestion:(id)a4;
- (void)sheetCancelled;
- (void)showBlankComposeView;
@end

@implementation MOSuggestionsSheetClientProxyTarget

- (MOSuggestionsSheetClientProxyTarget)initWithController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MOSuggestionsSheetClientProxyTarget;
  v6 = [(MOSuggestionsSheetClientProxyTarget *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_controller, a3);
  }

  return v7;
}

- (void)sheetCancelled
{
  v3 = [(MOSuggestionSheetController *)self->_controller delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(MOSuggestionSheetController *)self->_controller delegate];
    [v5 suggestionSheetControllerDidCancel:self->_controller];
  }
}

- (void)showBlankComposeView
{
  v3 = [(MOSuggestionSheetController *)self->_controller delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(MOSuggestionSheetController *)self->_controller delegate];
    [v5 suggestionSheetControllerShouldShowBlankComposeView:self->_controller];
  }
}

- (void)didReceiveStateUpdateRequest:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _mo_log_facility_get_os_log(MOLogFacilityUIService);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109120;
    v10[1] = [v4 intValue];
    _os_log_impl(&dword_1D24AE000, v5, OS_LOG_TYPE_DEFAULT, "client proxy callback, transitioned to state=%d", (uint8_t *)v10, 8u);
  }

  v6 = [(MOSuggestionSheetController *)self->_controller delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    if (([v4 intValue] & 0x80000000) != 0) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = [v4 unsignedIntValue];
    }
    objc_super v9 = [(MOSuggestionSheetController *)self->_controller delegate];
    [v9 suggestionSheetController:self->_controller didTransitionTo:v8];
  }
}

- (void)performTask:(id)a3 suggestion:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _mo_log_facility_get_os_log(MOLogFacilityUIService);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 67109120;
    v13[1] = [v6 intValue];
    _os_log_impl(&dword_1D24AE000, v8, OS_LOG_TYPE_DEFAULT, "client proxy callback, requested task=%d", (uint8_t *)v13, 8u);
  }

  objc_super v9 = [(MOSuggestionSheetController *)self->_controller delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    uint64_t v11 = [v6 unsignedIntValue];
    v12 = [(MOSuggestionSheetController *)self->_controller delegate];
    [v12 suggestionSheetController:self->_controller shouldPerformTask:v11 forSuggestion:v7];
  }
}

- (void)didGrantSandboxAccessFor:(id)a3
{
  [a3 UTF8String];
  uint64_t v4 = sandbox_extension_consume();
  if (v4 != -1)
  {
    controller = self->_controller;
    id v6 = [NSNumber numberWithLongLong:v4];
    [(MOSuggestionSheetController *)controller addSandboxHandle:v6];
  }
}

- (void).cxx_destruct
{
}

@end