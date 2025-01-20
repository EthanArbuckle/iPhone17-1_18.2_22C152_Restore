@interface ICSCDPStatusUpdateHook
- (BOOL)shouldMatchElement:(id)a3;
- (BOOL)shouldMatchModel:(id)a3;
- (RUIServerHookDelegate)delegate;
- (RUIServerHookResponse)serverHookResponse;
- (id)additionalPayloadForAction:(id)a3 error:(id)a4;
- (id)changeControllerForAction:(id)a3;
- (unint64_t)_presentationTypeForString:(id)a3;
- (void)_handleCompletionWithCallback:(id)a3 onModel:(id)a4 forHookAction:(id)a5 userAction:(unint64_t)a6 error:(id)a7;
- (void)_handleUserInteractionWithCallback:(id)a3 onModel:(id)a4 forHookAction:(id)a5 userAction:(unint64_t)a6;
- (void)_invokeJSCallback:(id)a3 onModel:(id)a4;
- (void)_invokeJSCallback:(id)a3 onModel:(id)a4 withArguments:(id)a5;
- (void)_processAttributes:(id)a3;
- (void)_updateStatusWithAction:(id)a3 forObjectModel:(id)a4 completion:(id)a5;
- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6;
- (void)processObjectModel:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setServerHookResponse:(id)a3;
@end

@implementation ICSCDPStatusUpdateHook

- (BOOL)shouldMatchElement:(id)a3
{
  v4 = [a3 name];
  v5 = [(ICSCDPStatusUpdateHook *)self changeControllerForAction:v4];
  LOBYTE(self) = v5 != 0;

  return (char)self;
}

- (BOOL)shouldMatchModel:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [v4 clientInfo];

  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F63818]];
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  v8 = [(ICSCDPStatusUpdateHook *)self changeControllerForAction:v7];
  BOOL v9 = v8 != 0;

  return v9;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  [(ICSCDPStatusUpdateHook *)self _processAttributes:a4];
  id v13 = [v12 name];

  [(ICSCDPStatusUpdateHook *)self _updateStatusWithAction:v13 forObjectModel:v11 completion:v10];
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [v11 clientInfo];
  [(ICSCDPStatusUpdateHook *)self _processAttributes:v7];

  objc_opt_class();
  v8 = [v11 clientInfo];
  id v9 = [v8 objectForKeyedSubscript:*MEMORY[0x263F63818]];
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  [(ICSCDPStatusUpdateHook *)self _updateStatusWithAction:v10 forObjectModel:v11 completion:v6];
}

- (void)_processAttributes:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F63848]];

  id v6 = v5;
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  self->_presentationType = [(ICSCDPStatusUpdateHook *)self _presentationTypeForString:v7];
  v8 = _AAUILogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    [(ICSCDPStatusUpdateHook *)(uint64_t)self _processAttributes:v8];
  }
}

- (unint64_t)_presentationTypeForString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x263F63838]])
  {
    unint64_t v4 = 0;
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F63840]])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F63850]])
  {
    unint64_t v4 = 2;
  }
  else
  {
    unint64_t v4 = 1;
  }

  return v4;
}

- (void)_updateStatusWithAction:(id)a3 forObjectModel:(id)a4 completion:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v22 = a4;
  id v9 = a5;
  id v10 = [(ICSCDPStatusUpdateHook *)self changeControllerForAction:v8];
  if (v10)
  {
    id v11 = [(ICSCDPStatusUpdateHook *)self delegate];
    id v12 = [v11 presentationContextForHook:self];

    id v13 = (RUIServerHookResponse *)objc_alloc_init(MEMORY[0x263F637C8]);
    serverHookResponse = self->_serverHookResponse;
    self->_serverHookResponse = v13;

    objc_initWeak(&location, self);
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __76__ICSCDPStatusUpdateHook__updateStatusWithAction_forObjectModel_completion___block_invoke;
    v28[3] = &unk_2655B6208;
    objc_copyWeak(&v32, &location);
    id v15 = v9;
    id v31 = v15;
    id v16 = v22;
    id v29 = v16;
    id v17 = v8;
    id v30 = v17;
    [v10 setUserActionCallback:v28];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __76__ICSCDPStatusUpdateHook__updateStatusWithAction_forObjectModel_completion___block_invoke_40;
    v23[3] = &unk_2655B6230;
    objc_copyWeak(&v27, &location);
    id v26 = v15;
    id v24 = v16;
    id v18 = v17;
    id v25 = v18;
    [v10 setCompletionCallback:v23];
    v19 = _AAUILogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v20 = objc_opt_class();
      -[ICSCDPStatusUpdateHook _updateStatusWithAction:forObjectModel:completion:](v20, (uint64_t)v18, buf, v19);
    }

    [v10 presentWithViewController:v12 presentationType:self->_presentationType];
    objc_destroyWeak(&v27);

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }
  else
  {
    v21 = _AAUILogSystem();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      -[ICSCDPStatusUpdateHook _updateStatusWithAction:forObjectModel:completion:]((uint64_t)self, (uint64_t)v8, v21);
    }

    id v12 = objc_msgSend(MEMORY[0x263F087E8], "aa_errorWithCode:", -3, v22);
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v12);
  }
}

void __76__ICSCDPStatusUpdateHook__updateStatusWithAction_forObjectModel_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _handleUserInteractionWithCallback:*(void *)(a1 + 48) onModel:*(void *)(a1 + 32) forHookAction:*(void *)(a1 + 40) userAction:a2];
  }
  else
  {
    id v6 = _AAUILogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __76__ICSCDPStatusUpdateHook__updateStatusWithAction_forObjectModel_completion___block_invoke_cold_1(v6);
    }
  }
}

void __76__ICSCDPStatusUpdateHook__updateStatusWithAction_forObjectModel_completion___block_invoke_40(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _handleCompletionWithCallback:*(void *)(a1 + 48) onModel:*(void *)(a1 + 32) forHookAction:*(void *)(a1 + 40) userAction:a2 error:v5];
  }
  else
  {
    id v8 = _AAUILogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      __76__ICSCDPStatusUpdateHook__updateStatusWithAction_forObjectModel_completion___block_invoke_40_cold_1(v8);
    }
  }
}

- (id)changeControllerForAction:(id)a3
{
  return 0;
}

- (id)additionalPayloadForAction:(id)a3 error:(id)a4
{
  return 0;
}

- (void)_handleUserInteractionWithCallback:(id)a3 onModel:(id)a4 forHookAction:(id)a5 userAction:(unint64_t)a6
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a6 - 1 < 2) {
    goto LABEL_4;
  }
  if (!a6)
  {
    v14 = _AAUILogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412546;
      uint64_t v16 = objc_opt_class();
      __int16 v17 = 2112;
      id v18 = v12;
      _os_log_impl(&dword_262993000, v14, OS_LOG_TYPE_DEFAULT, "%@: Status for %@ not being updated due to user decline.", (uint8_t *)&v15, 0x16u);
    }

    id v13 = @"onUserDecline";
    goto LABEL_8;
  }
  if (a6 == 3)
  {
LABEL_4:
    id v13 = @"onUserAccept";
LABEL_8:
    [(ICSCDPStatusUpdateHook *)self _invokeJSCallback:v13 onModel:v11];
  }
}

- (void)_handleCompletionWithCallback:(id)a3 onModel:(id)a4 forHookAction:(id)a5 userAction:(unint64_t)a6 error:(id)a7
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v12 = (void (**)(id, BOOL, void *))a3;
  id v13 = a4;
  id v14 = a5;
  int v15 = (__CFString *)a7;
  uint64_t v16 = v15;
  if (!a6 && !v15)
  {
    uint64_t v16 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F28F30] code:-7003 userInfo:0];
    __int16 v17 = _AAUILogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v32 = objc_opt_class();
      __int16 v33 = 2112;
      id v34 = v14;
      __int16 v35 = 2112;
      v36 = v16;
      _os_log_debug_impl(&dword_262993000, v17, OS_LOG_TYPE_DEBUG, "%@: User declined status update for %@ and no error was provided. Using %@", buf, 0x20u);
    }
  }
  BOOL v19 = a6 != 3 && v16 == 0;
  uint64_t v20 = _AAUILogSystem();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = objc_opt_class();
    id v22 = @"NO";
    *(_DWORD *)buf = 138413058;
    uint64_t v32 = v21;
    __int16 v33 = 2112;
    if (v19) {
      id v22 = @"YES";
    }
    id v34 = v14;
    __int16 v35 = 2112;
    v36 = v22;
    __int16 v37 = 2112;
    v38 = v16;
    _os_log_impl(&dword_262993000, v20, OS_LOG_TYPE_DEFAULT, "%@: Calling completion callback for %@ with (didChange: %@, error: %@)", buf, 0x2Au);
  }

  if (v16)
  {
    v23 = v16;
  }
  else
  {
    v23 = [MEMORY[0x263EFF9D0] null];
  }
  id v24 = v23;
  id v25 = [NSNumber numberWithBool:v19];
  v30[0] = v25;
  v30[1] = v24;
  id v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:2];
  [(ICSCDPStatusUpdateHook *)self _invokeJSCallback:@"onCompletion" onModel:v13 withArguments:v26];

  id v27 = [(ICSCDPStatusUpdateHook *)self additionalPayloadForAction:v14 error:v16];
  [(RUIServerHookResponse *)self->_serverHookResponse setAdditionalPayload:v27];

  BOOL v29 = a6 == 3 || v16 == 0;
  v12[2](v12, v29, v16);
  [(ICSCDPStatusUpdateHook *)self postCompletionProcessingForAction:v14 error:v16];
}

- (void)_invokeJSCallback:(id)a3 onModel:(id)a4
{
}

- (void)_invokeJSCallback:(id)a3 onModel:(id)a4 withArguments:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_opt_class();
  id v10 = [v8 clientInfo];
  id v11 = [v10 objectForKeyedSubscript:v7];
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }

  uint64_t v13 = [v12 length];
  id v14 = _AAUILogSystem();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v15)
    {
      int v17 = 138413058;
      uint64_t v18 = objc_opt_class();
      __int16 v19 = 2112;
      id v20 = v7;
      __int16 v21 = 2112;
      id v22 = v12;
      __int16 v23 = 2112;
      id v24 = v9;
      _os_log_impl(&dword_262993000, v14, OS_LOG_TYPE_DEFAULT, "%@: Calling %@ callback using %@ with arguments: %@", (uint8_t *)&v17, 0x2Au);
    }

    id v16 = (id)[v8 invokeScriptFunction:v12 withArguments:v9];
  }
  else
  {
    if (v15)
    {
      int v17 = 138412546;
      uint64_t v18 = objc_opt_class();
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl(&dword_262993000, v14, OS_LOG_TYPE_DEFAULT, "%@: Skipping %@ callback, no function provided.", (uint8_t *)&v17, 0x16u);
    }
  }
}

- (RUIServerHookDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RUIServerHookDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (RUIServerHookResponse)serverHookResponse
{
  return self->_serverHookResponse;
}

- (void)setServerHookResponse:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverHookResponse, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_actionControllers, 0);
}

- (void)_processAttributes:(os_log_t)log .cold.1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a2;
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2048;
  uint64_t v7 = v3;
  _os_log_debug_impl(&dword_262993000, log, OS_LOG_TYPE_DEBUG, "%@: presentation type is: %lu", (uint8_t *)&v4, 0x16u);
}

- (void)_updateStatusWithAction:(uint64_t)a1 forObjectModel:(uint64_t)a2 completion:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v5 = 138412546;
  uint64_t v6 = objc_opt_class();
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_fault_impl(&dword_262993000, a3, OS_LOG_TYPE_FAULT, "%@: Unexpected action processed - %@", (uint8_t *)&v5, 0x16u);
}

- (void)_updateStatusWithAction:(uint8_t *)buf forObjectModel:(os_log_t)log completion:.cold.2(uint64_t a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_262993000, log, OS_LOG_TYPE_DEBUG, "%@: Presenting CDP status change controller for %@", buf, 0x16u);
}

void __76__ICSCDPStatusUpdateHook__updateStatusWithAction_forObjectModel_completion___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_262993000, log, OS_LOG_TYPE_ERROR, "AAUICDPStatusUpdateHook not present when userActionCallback was called. Skipping user interaction JS callbacks.", v1, 2u);
}

void __76__ICSCDPStatusUpdateHook__updateStatusWithAction_forObjectModel_completion___block_invoke_40_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_262993000, log, OS_LOG_TYPE_FAULT, "AAUICDPStatusUpdateHook not present when completionCallback was called. Status update may have been successful, but JS callbacks/refreshUrl handling will not be invoked.", v1, 2u);
}

@end