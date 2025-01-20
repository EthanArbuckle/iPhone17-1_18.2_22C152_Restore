@interface NPKStandaloneProvisioningNumericEntryCoordinator
- (NSArray)providedFields;
- (NSMutableArray)completedFields;
- (id)completionHandler;
- (unint64_t)currentIndex;
- (void)_invokeCompletionHandler;
- (void)_showCurrentPasscodePromptOrComplete;
- (void)_showNextPasscodePromptOrComplete;
- (void)invalidate;
- (void)requestNumericInputForFields:(id)a3 completion:(id)a4;
- (void)setCompletedFields:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setCurrentIndex:(unint64_t)a3;
- (void)setProvidedFields:(id)a3;
@end

@implementation NPKStandaloneProvisioningNumericEntryCoordinator

- (void)requestNumericInputForFields:(id)a3 completion:(id)a4
{
  objc_storeStrong((id *)&self->_providedFields, a3);
  id v7 = a3;
  id v8 = a4;
  v9 = [MEMORY[0x263EFF980] array];
  completedFields = self->_completedFields;
  self->_completedFields = v9;

  v11 = (void *)MEMORY[0x223C37380](v8);
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = v11;

  self->_currentIndex = 0;
  [(NPKStandaloneProvisioningNumericEntryCoordinator *)self _showCurrentPasscodePromptOrComplete];
}

- (void)invalidate
{
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = 0;

  providedFields = self->_providedFields;
  self->_providedFields = 0;

  completedFields = self->_completedFields;
  self->_completedFields = 0;
}

- (void)_showNextPasscodePromptOrComplete
{
}

- (void)_showCurrentPasscodePromptOrComplete
{
  unint64_t currentIndex = self->_currentIndex;
  if (currentIndex >= [(NSArray *)self->_providedFields count])
  {
    v4 = pk_Payment_log();
    BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

    if (v5)
    {
      v6 = pk_Payment_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v7 = 0;
        _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Numeric entry complete; invoking completion handler",
          v7,
          2u);
      }
    }
    [(NPKStandaloneProvisioningNumericEntryCoordinator *)self _invokeCompletionHandler];
  }
  else
  {
    [(NPKStandaloneProvisioningNumericEntryCoordinator *)self _invokeCompletionHandler];
  }
}

- (void)_invokeCompletionHandler
{
  BOOL v5 = (void (**)(id, NSMutableArray *))MEMORY[0x223C37380](self->_completionHandler, a2);
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = 0;

  if (v5) {
    v5[2](v5, self->_completedFields);
  }
  providedFields = self->_providedFields;
  self->_providedFields = 0;
}

- (NSArray)providedFields
{
  return self->_providedFields;
}

- (void)setProvidedFields:(id)a3
{
}

- (NSMutableArray)completedFields
{
  return self->_completedFields;
}

- (void)setCompletedFields:(id)a3
{
}

- (unint64_t)currentIndex
{
  return self->_currentIndex;
}

- (void)setCurrentIndex:(unint64_t)a3
{
  self->_unint64_t currentIndex = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_completedFields, 0);
  objc_storeStrong((id *)&self->_providedFields, 0);
}

@end