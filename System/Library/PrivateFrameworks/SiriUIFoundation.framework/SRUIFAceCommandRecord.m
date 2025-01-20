@interface SRUIFAceCommandRecord
- (SAAceCommand)aceCommand;
- (SRUIFAceCommandRecord)initWithAceCommand:(id)a3 andCompletion:(id)a4;
- (SRUIFAceCommandRecordDelegate)delegate;
- (id)commandCompletion;
- (int64_t)numberOfStartedActions;
- (int64_t)numberOfStoppedActions;
- (int64_t)numberOfSuccessfullyCompletedActions;
- (int64_t)numberOfUnsuccessfullyCompletedActions;
- (int64_t)result;
- (void)_setNumberOfStartedActions:(int64_t)a3;
- (void)_setNumberOfStoppedActions:(int64_t)a3;
- (void)_setNumberOfSuccessfullyCompletedActions:(int64_t)a3;
- (void)_setNumberOfUnsuccessfullyCompletedActions:(int64_t)a3;
- (void)_setResult:(int64_t)a3;
- (void)incrementNumberOfStartedActions;
- (void)incrementNumberOfStoppedActions;
- (void)incrementNumberOfSuccessfullyCompletedActions;
- (void)incrementNumberOfUnsuccessfullyCompletedActions;
- (void)setCommandCompletion:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SRUIFAceCommandRecord

- (SRUIFAceCommandRecord)initWithAceCommand:(id)a3 andCompletion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SRUIFAceCommandRecord;
  v9 = [(SRUIFAceCommandRecord *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_aceCommand, a3);
    uint64_t v11 = MEMORY[0x22A643DA0](v8);
    id commandCompletion = v10->_commandCompletion;
    v10->_id commandCompletion = (id)v11;

    v10->_result = 0;
  }

  return v10;
}

- (void)_setResult:(int64_t)a3
{
  if (self->_result != a3)
  {
    self->_result = a3;
    id v4 = [(SRUIFAceCommandRecord *)self delegate];
    [v4 aceCommandRecordDidChangeResult:self];
  }
}

- (void)_setNumberOfSuccessfullyCompletedActions:(int64_t)a3
{
  self->_numberOfSuccessfullyCompletedActions = a3;
}

- (void)_setNumberOfUnsuccessfullyCompletedActions:(int64_t)a3
{
  self->_numberOfUnsuccessfullyCompletedActions = a3;
}

- (void)_setNumberOfStoppedActions:(int64_t)a3
{
  self->_numberOfStoppedActions = a3;
}

- (void)incrementNumberOfStartedActions
{
  int64_t v3 = [(SRUIFAceCommandRecord *)self numberOfStartedActions] + 1;
  [(SRUIFAceCommandRecord *)self _setNumberOfStartedActions:v3];
}

- (void)incrementNumberOfStoppedActions
{
  int64_t v3 = [(SRUIFAceCommandRecord *)self numberOfStoppedActions] + 1;
  [(SRUIFAceCommandRecord *)self _setNumberOfStoppedActions:v3];
}

- (void)incrementNumberOfSuccessfullyCompletedActions
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  [(SRUIFAceCommandRecord *)self _setNumberOfSuccessfullyCompletedActions:[(SRUIFAceCommandRecord *)self numberOfSuccessfullyCompletedActions] + 1];
  int64_t v3 = [(SRUIFAceCommandRecord *)self numberOfSuccessfullyCompletedActions];
  int64_t v4 = [(SRUIFAceCommandRecord *)self numberOfStoppedActions] + v3;
  int64_t v5 = [(SRUIFAceCommandRecord *)self numberOfStartedActions];
  if ([(SRUIFAceCommandRecord *)self result] != 2
    && [(SRUIFAceCommandRecord *)self numberOfStartedActions] == v4)
  {
    v6 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v6;
      id v8 = [(SRUIFAceCommandRecord *)self aceCommand];
      v9 = [v8 aceId];
      *(_DWORD *)v20 = 136316162;
      *(void *)&v20[4] = "-[SRUIFAceCommandRecord incrementNumberOfSuccessfullyCompletedActions]";
      *(_WORD *)&v20[12] = 2112;
      *(void *)&v20[14] = v9;
      *(_WORD *)&v20[22] = 2048;
      int64_t v21 = [(SRUIFAceCommandRecord *)self numberOfStartedActions];
      *(_WORD *)v22 = 2048;
      *(void *)&v22[2] = [(SRUIFAceCommandRecord *)self numberOfSuccessfullyCompletedActions];
      *(_WORD *)&v22[10] = 2048;
      *(void *)&v22[12] = [(SRUIFAceCommandRecord *)self numberOfStoppedActions];
      v10 = "%s #aceCommandRecord Marking ace command %@ as succeeded. %zd StartedActions == %zd SuccessfullyCompletedAct"
            "ions + %zd StoppedActions";
LABEL_9:
      _os_log_impl(&dword_225FBA000, v7, OS_LOG_TYPE_DEFAULT, v10, v20, 0x34u);

      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if ([(SRUIFAceCommandRecord *)self result] != 2 && v4 - v5 == 1)
  {
    uint64_t v11 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v11;
      id v8 = [(SRUIFAceCommandRecord *)self aceCommand];
      v9 = [v8 aceId];
      *(_DWORD *)v20 = 136316162;
      *(void *)&v20[4] = "-[SRUIFAceCommandRecord incrementNumberOfSuccessfullyCompletedActions]";
      *(_WORD *)&v20[12] = 2112;
      *(void *)&v20[14] = v9;
      *(_WORD *)&v20[22] = 2048;
      int64_t v21 = [(SRUIFAceCommandRecord *)self numberOfSuccessfullyCompletedActions];
      *(_WORD *)v22 = 2048;
      *(void *)&v22[2] = [(SRUIFAceCommandRecord *)self numberOfStoppedActions];
      *(_WORD *)&v22[10] = 2048;
      *(void *)&v22[12] = [(SRUIFAceCommandRecord *)self numberOfStartedActions];
      v10 = "%s #aceCommandRecord Marking ace command %@ as succeeded while stopped. (%zd SuccessfullyCompletedActions + "
            "%zd StoppedActions) - %zd StartedActions == 1";
      goto LABEL_9;
    }
LABEL_10:
    -[SRUIFAceCommandRecord _setResult:](self, "_setResult:", 1, *(_OWORD *)v20, *(void *)&v20[16], v21, *(_OWORD *)v22, *(void *)&v22[16]);
    return;
  }
  int64_t v12 = [(SRUIFAceCommandRecord *)self result];
  v13 = (void *)*MEMORY[0x263F28348];
  BOOL v14 = os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT);
  if (v12 == 2)
  {
    if (!v14) {
      return;
    }
    v15 = v13;
    v16 = [(SRUIFAceCommandRecord *)self aceCommand];
    v17 = [v16 aceId];
    *(_DWORD *)v20 = 136315394;
    *(void *)&v20[4] = "-[SRUIFAceCommandRecord incrementNumberOfSuccessfullyCompletedActions]";
    *(_WORD *)&v20[12] = 2112;
    *(void *)&v20[14] = v17;
    _os_log_impl(&dword_225FBA000, v15, OS_LOG_TYPE_DEFAULT, "%s #aceCommandRecord Not marking ace command %@ as succeeded, because result is SRUIFAceCommandResultFailed.", v20, 0x16u);
  }
  else
  {
    if (!v14) {
      return;
    }
    v15 = v13;
    v18 = [(SRUIFAceCommandRecord *)self aceCommand];
    v19 = [v18 aceId];
    *(_DWORD *)v20 = 136316162;
    *(void *)&v20[4] = "-[SRUIFAceCommandRecord incrementNumberOfSuccessfullyCompletedActions]";
    *(_WORD *)&v20[12] = 2112;
    *(void *)&v20[14] = v19;
    *(_WORD *)&v20[22] = 2048;
    int64_t v21 = [(SRUIFAceCommandRecord *)self numberOfStartedActions];
    *(_WORD *)v22 = 2048;
    *(void *)&v22[2] = [(SRUIFAceCommandRecord *)self numberOfSuccessfullyCompletedActions];
    *(_WORD *)&v22[10] = 2048;
    *(void *)&v22[12] = [(SRUIFAceCommandRecord *)self numberOfStoppedActions];
    _os_log_impl(&dword_225FBA000, v15, OS_LOG_TYPE_DEFAULT, "%s #aceCommandRecord Not marking ace command %@ as succeeded. %zd StartedActions != %zd SuccessfullyCompletedActions + %zd StoppedActions", v20, 0x34u);
  }
}

- (void)incrementNumberOfUnsuccessfullyCompletedActions
{
  [(SRUIFAceCommandRecord *)self _setNumberOfUnsuccessfullyCompletedActions:[(SRUIFAceCommandRecord *)self numberOfUnsuccessfullyCompletedActions] + 1];
  [(SRUIFAceCommandRecord *)self _setResult:2];
}

- (SAAceCommand)aceCommand
{
  return self->_aceCommand;
}

- (id)commandCompletion
{
  return self->_commandCompletion;
}

- (void)setCommandCompletion:(id)a3
{
}

- (int64_t)result
{
  return self->_result;
}

- (int64_t)numberOfStartedActions
{
  return self->_numberOfStartedActions;
}

- (void)_setNumberOfStartedActions:(int64_t)a3
{
  self->_numberOfStartedActions = a3;
}

- (int64_t)numberOfSuccessfullyCompletedActions
{
  return self->_numberOfSuccessfullyCompletedActions;
}

- (int64_t)numberOfUnsuccessfullyCompletedActions
{
  return self->_numberOfUnsuccessfullyCompletedActions;
}

- (int64_t)numberOfStoppedActions
{
  return self->_numberOfStoppedActions;
}

- (SRUIFAceCommandRecordDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SRUIFAceCommandRecordDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_commandCompletion, 0);
  objc_storeStrong((id *)&self->_aceCommand, 0);
}

@end