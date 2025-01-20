@interface SRUIFAceCommandRecords
- (NSMutableDictionary)_recordsByCommandIdentifier;
- (SRUIFAceCommandRecords)init;
- (SRUIFAceCommandRecordsDelegate)delegate;
- (id)_recordForAceCommand:(id)a3;
- (id)aceCommandWithIdentifier:(id)a3;
- (id)pendingAddViewsWithReflectionDialogPhaseWithRefId:(id)a3;
- (int64_t)resultForAceCommand:(id)a3;
- (void)aceCommandRecordDidChangeResult:(id)a3;
- (void)recordActionCompletedForAceCommand:(id)a3 success:(BOOL)a4;
- (void)recordActionStartedForAceCommand:(id)a3;
- (void)recordActionStoppedForAceCommand:(id)a3;
- (void)registerAceCommand:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation SRUIFAceCommandRecords

- (SRUIFAceCommandRecords)init
{
  v6.receiver = self;
  v6.super_class = (Class)SRUIFAceCommandRecords;
  v2 = [(SRUIFAceCommandRecords *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    recordsByCommandIdentifier = v2->_recordsByCommandIdentifier;
    v2->_recordsByCommandIdentifier = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)aceCommandRecordDidChangeResult:(id)a3
{
  id v4 = a3;
  id v7 = [(SRUIFAceCommandRecords *)self delegate];
  v5 = [v4 aceCommand];
  objc_super v6 = [v4 commandCompletion];

  [v7 aceCommandRecords:self didChangeResultForCommand:v5 completion:v6];
}

- (void)registerAceCommand:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 aceId];
  v9 = (os_log_t *)MEMORY[0x263F28348];
  v10 = *MEMORY[0x263F28348];
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315394;
      v18 = "-[SRUIFAceCommandRecords registerAceCommand:completion:]";
      __int16 v19 = 2112;
      v20 = v8;
      _os_log_impl(&dword_225FBA000, v10, OS_LOG_TYPE_DEFAULT, "%s #aceCommandRecord identifier=%@", (uint8_t *)&v17, 0x16u);
    }
    v11 = [(SRUIFAceCommandRecords *)self aceCommandWithIdentifier:v8];
    if (v11)
    {
      if (([v6 isEqual:v11] & 1) == 0)
      {
        v12 = [[SRUIFAceCommandRecord alloc] initWithAceCommand:v6 andCompletion:v7];
        [(SRUIFAceCommandRecord *)v12 setDelegate:self];
        v13 = [(SRUIFAceCommandRecords *)self _recordsByCommandIdentifier];
        [v13 setObject:v12 forKey:v8];
      }
      if (([v6 isEqual:v11] & 1) == 0)
      {
        os_log_t v14 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR)) {
          -[SRUIFAceCommandRecords registerAceCommand:completion:](v6, v14);
        }
      }
    }
    else
    {
      v15 = [[SRUIFAceCommandRecord alloc] initWithAceCommand:v6 andCompletion:v7];
      [(SRUIFAceCommandRecord *)v15 setDelegate:self];
      v16 = [(SRUIFAceCommandRecords *)self _recordsByCommandIdentifier];
      [v16 setObject:v15 forKey:v8];
    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
  {
    -[SRUIFAceCommandRecords registerAceCommand:completion:]((uint64_t)v6, v10);
  }
}

- (id)pendingAddViewsWithReflectionDialogPhaseWithRefId:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v6 = [(SRUIFAceCommandRecords *)self _recordsByCommandIdentifier];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __76__SRUIFAceCommandRecords_pendingAddViewsWithReflectionDialogPhaseWithRefId___block_invoke;
  v12[3] = &unk_2647868C8;
  id v13 = v4;
  id v7 = v5;
  id v14 = v7;
  id v8 = v4;
  [v6 enumerateKeysAndObjectsUsingBlock:v12];

  v9 = v14;
  id v10 = v7;

  return v10;
}

void __76__SRUIFAceCommandRecords_pendingAddViewsWithReflectionDialogPhaseWithRefId___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v13 = a3;
  id v4 = [v13 aceCommand];
  id v5 = [v4 refId];
  if (![v5 isEqualToString:*(void *)(a1 + 32)]) {
    goto LABEL_6;
  }
  uint64_t v6 = [v13 result];

  id v7 = v13;
  if (!v6)
  {
    id v8 = [v13 aceCommand];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    id v7 = v13;
    if (isKindOfClass)
    {
      id v4 = [v13 aceCommand];
      id v10 = objc_msgSend(v4, "sruif_dialogPhase");
      int v11 = [v10 isReflectionDialogPhase];

      if (!v11)
      {
LABEL_7:

        id v7 = v13;
        goto LABEL_8;
      }
      v12 = *(void **)(a1 + 40);
      id v5 = [v13 aceCommand];
      [v12 addObject:v5];
LABEL_6:

      goto LABEL_7;
    }
  }
LABEL_8:
}

- (id)aceCommandWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(SRUIFAceCommandRecords *)self _recordsByCommandIdentifier];
  uint64_t v6 = [v5 objectForKey:v4];

  id v7 = [v6 aceCommand];

  return v7;
}

- (id)_recordForAceCommand:(id)a3
{
  id v4 = a3;
  [(SRUIFAceCommandRecords *)self registerAceCommand:v4 completion:0];
  id v5 = [(SRUIFAceCommandRecords *)self _recordsByCommandIdentifier];
  uint64_t v6 = [v4 aceId];

  id v7 = [v5 objectForKey:v6];

  return v7;
}

- (void)recordActionStartedForAceCommand:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "-[SRUIFAceCommandRecords recordActionStartedForAceCommand:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_225FBA000, v5, OS_LOG_TYPE_DEFAULT, "%s #aceCommandRecord aceCommand=%@", (uint8_t *)&v7, 0x16u);
  }
  uint64_t v6 = [(SRUIFAceCommandRecords *)self _recordForAceCommand:v4];
  [v6 incrementNumberOfStartedActions];
}

- (void)recordActionStoppedForAceCommand:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "-[SRUIFAceCommandRecords recordActionStoppedForAceCommand:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_225FBA000, v5, OS_LOG_TYPE_DEFAULT, "%s #aceCommandRecord aceCommand=%@", (uint8_t *)&v7, 0x16u);
  }
  uint64_t v6 = [(SRUIFAceCommandRecords *)self _recordForAceCommand:v4];
  [v6 incrementNumberOfStoppedActions];
}

- (void)recordActionCompletedForAceCommand:(id)a3 success:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = [(SRUIFAceCommandRecords *)self _recordForAceCommand:v6];
  id v8 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    __int16 v9 = v8;
    uint64_t v10 = [v7 result];
    uint64_t v11 = @"SRUIFAceCommandResultNone";
    if (v10 == 1) {
      uint64_t v11 = @"SRUIFAceCommandResultSucceeded";
    }
    if (v10 == 2) {
      uint64_t v11 = @"SRUIFAceCommandResultFailed";
    }
    v12 = v11;
    int v13 = 136316674;
    id v14 = "-[SRUIFAceCommandRecords recordActionCompletedForAceCommand:success:]";
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    v18 = v12;
    __int16 v19 = 2048;
    uint64_t v20 = [v7 numberOfStartedActions];
    __int16 v21 = 2048;
    uint64_t v22 = [v7 numberOfStoppedActions];
    __int16 v23 = 2048;
    uint64_t v24 = [v7 numberOfSuccessfullyCompletedActions];
    __int16 v25 = 2048;
    uint64_t v26 = [v7 numberOfUnsuccessfullyCompletedActions];
    _os_log_impl(&dword_225FBA000, v9, OS_LOG_TYPE_DEFAULT, "%s #aceCommandRecord aceCommand=%@ result=%@ StartedActions=%zd StoppedActions=%zd SuccessfulActions=%zd UnsuccessfulActions=%zd ", (uint8_t *)&v13, 0x48u);
  }
  if (![v7 result])
  {
    if (v4) {
      [v7 incrementNumberOfSuccessfullyCompletedActions];
    }
    else {
      [v7 incrementNumberOfUnsuccessfullyCompletedActions];
    }
  }
}

- (int64_t)resultForAceCommand:(id)a3
{
  uint64_t v3 = [(SRUIFAceCommandRecords *)self _recordForAceCommand:a3];
  int64_t v4 = [v3 result];

  return v4;
}

- (SRUIFAceCommandRecordsDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SRUIFAceCommandRecordsDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableDictionary)_recordsByCommandIdentifier
{
  return self->_recordsByCommandIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordsByCommandIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)registerAceCommand:(uint64_t)a1 completion:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "-[SRUIFAceCommandRecords registerAceCommand:completion:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_225FBA000, a2, OS_LOG_TYPE_ERROR, "%s #aceCommandRecord Attempt to register Ace Command %@ with no aceId", (uint8_t *)&v2, 0x16u);
}

- (void)registerAceCommand:(void *)a1 completion:(void *)a2 .cold.2(void *a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = a2;
  __int16 v4 = [a1 aceId];
  int v5 = 136315650;
  uint64_t v6 = "-[SRUIFAceCommandRecords registerAceCommand:completion:]";
  __int16 v7 = 2112;
  id v8 = a1;
  __int16 v9 = 2112;
  uint64_t v10 = v4;
  _os_log_error_impl(&dword_225FBA000, v3, OS_LOG_TYPE_ERROR, "%s #aceCommandRecord Client received Ace Command %@ but aceId %@ was already in the registry", (uint8_t *)&v5, 0x20u);
}

@end