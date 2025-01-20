@interface TIStreamingCandidateHandler
- (BOOL)asynchronous;
- (TICandidateRequestToken)requestToken;
- (TIClientProxy)clientProxy;
- (TIKeyboardInputManagerLogging)logger;
- (TIKeyboardState)keyboardState;
- (TIStreamingCandidateHandler)initWithClientProxy:(id)a3 keyboardState:(id)a4 requestToken:(id)a5 logger:(id)a6 inputManager:(id)a7 candidateHandler:(id)a8;
- (TIStreamingCandidateHandler)initWithClientProxy:(id)a3 keyboardState:(id)a4 requestToken:(id)a5 logger:(id)a6 inputManager:(id)a7 candidateHandler:(id)a8 candidateResultSetHandler:(id)a9;
- (TIStreamingCandidateHandler)initWithClientProxy:(id)a3 keyboardState:(id)a4 requestToken:(id)a5 logger:(id)a6 inputManager:(id)a7 candidateResultSetHandler:(id)a8;
- (id)candidateHandler;
- (id)candidateResultSetHandler;
- (void)close;
- (void)dealloc;
- (void)open;
- (void)pushCandidateResultSet:(id)a3;
- (void)pushCandidates:(id)a3;
- (void)setKeyboardState:(id)a3;
- (void)setLogger:(id)a3;
@end

@implementation TIStreamingCandidateHandler

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_logger);
  objc_storeStrong((id *)&self->_keyboardState, 0);
  objc_storeStrong(&self->_candidateResultSetHandler, 0);
  objc_storeStrong(&self->_candidateHandler, 0);
  objc_storeStrong((id *)&self->_clientProxy, 0);
  objc_storeStrong((id *)&self->_requestToken, 0);

  objc_destroyWeak((id *)&self->_inputManager);
}

- (void)setLogger:(id)a3
{
}

- (TIKeyboardInputManagerLogging)logger
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_logger);

  return (TIKeyboardInputManagerLogging *)WeakRetained;
}

- (void)setKeyboardState:(id)a3
{
}

- (TIKeyboardState)keyboardState
{
  return self->_keyboardState;
}

- (id)candidateResultSetHandler
{
  return self->_candidateResultSetHandler;
}

- (id)candidateHandler
{
  return self->_candidateHandler;
}

- (TIClientProxy)clientProxy
{
  return self->_clientProxy;
}

- (TICandidateRequestToken)requestToken
{
  return self->_requestToken;
}

- (void)close
{
  if (self->_status != 2)
  {
    self->_status = 2;
    kdebug_trace();
    kac_get_log();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, (const void *)((unint64_t)self ^ 2));
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v5 = v4;
      if (os_signpost_enabled(v3))
      {
        *(_WORD *)v13 = 0;
        _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v3, OS_SIGNPOST_INTERVAL_END, v5, "kbdManager.generateAutocorrections.async", (const char *)&unk_1E41704BE, v13, 2u);
      }
    }

    if (!self->_didCallHandler)
    {
      v6 = [(TIStreamingCandidateHandler *)self candidateHandler];

      if (v6)
      {
        v7 = [MEMORY[0x1E4FAE278] listWithCorrections:0 predictions:0];
        v8 = [(TIStreamingCandidateHandler *)self candidateHandler];
        ((void (**)(void, void *))v8)[2](v8, v7);
      }
      v9 = [(TIStreamingCandidateHandler *)self candidateResultSetHandler];

      if (v9)
      {
        v10 = [(TIStreamingCandidateHandler *)self candidateResultSetHandler];
        v10[2](v10, 0);
      }
      self->_didCallHandler = 1;
    }
    v11 = [(TIStreamingCandidateHandler *)self clientProxy];
    v12 = [(TIStreamingCandidateHandler *)self requestToken];
    [v11 closeRequestToken:v12];
  }
}

- (void)pushCandidateResultSet:(id)a3
{
  id v4 = a3;
  if (self->_status == 1)
  {
    id v13 = v4;
    os_signpost_id_t v5 = [(TIStreamingCandidateHandler *)self candidateResultSetHandler];
    id v4 = v13;
    if (v5)
    {
      v6 = [(TIStreamingCandidateHandler *)self candidateHandler];

      id v4 = v13;
      if (!v6)
      {
        if (self->_didCallHandler)
        {
          v7 = [(TIStreamingCandidateHandler *)self clientProxy];
          v8 = [(TIStreamingCandidateHandler *)self requestToken];
          [v7 pushCandidateResultSet:v13 requestToken:v8];

          v9 = [(TIStreamingCandidateHandler *)self logger];
          v10 = [(TIStreamingCandidateHandler *)self keyboardState];
          v11 = [(TIStreamingCandidateHandler *)self requestToken];
          [v9 logCandidateResultSet:v13 trace:0 forKeyboardState:v10 requestToken:v11];

          id v4 = v13;
        }
        else
        {
          v12 = [(TIStreamingCandidateHandler *)self candidateResultSetHandler];
          ((void (**)(void, id))v12)[2](v12, v13);

          id v4 = v13;
          self->_didCallHandler = 1;
        }
      }
    }
  }
}

- (void)pushCandidates:(id)a3
{
  id v15 = a3;
  if (self->_status == 1)
  {
    uint64_t v4 = [(TIStreamingCandidateHandler *)self candidateHandler];
    if (v4)
    {
      os_signpost_id_t v5 = (void *)v4;
      v6 = [(TIStreamingCandidateHandler *)self candidateResultSetHandler];

      if (!v6)
      {
        if (self->_didCallHandler)
        {
          v7 = [(TIStreamingCandidateHandler *)self clientProxy];
          v8 = [(TIStreamingCandidateHandler *)self requestToken];
          [v7 pushCandidates:v15 requestToken:v8];

          v9 = [(TIStreamingCandidateHandler *)self logger];
          v10 = [(TIStreamingCandidateHandler *)self keyboardState];
          v11 = [(TIStreamingCandidateHandler *)self requestToken];
          [v9 logAutocorrections:v15 trace:0 forKeyboardState:v10 requestToken:v11];

          id WeakRetained = objc_loadWeakRetained((id *)&self->_inputManager);
          if (WeakRetained)
          {
            id v13 = objc_loadWeakRetained((id *)&self->_inputManager);
            [v13 candidatesOfferedFeedback:v15 keyboardState:self->_keyboardState];
          }
        }
        else
        {
          v14 = [(TIStreamingCandidateHandler *)self candidateHandler];
          ((void (**)(void, id))v14)[2](v14, v15);

          self->_didCallHandler = 1;
        }
      }
    }
  }
}

- (void)open
{
  if (!self->_status)
  {
    self->_status = 1;
    kdebug_trace();
    kac_get_log();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, (const void *)((unint64_t)self ^ 2));
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v5 = v4;
      if (os_signpost_enabled(v3))
      {
        *(_WORD *)v6 = 0;
        _os_signpost_emit_with_name_impl(&dword_1E3F0E000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "kbdManager.generateAutocorrections.async", (const char *)&unk_1E41704BE, v6, 2u);
      }
    }
  }
}

- (BOOL)asynchronous
{
  return 1;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)TIStreamingCandidateHandler;
  [(TIStreamingCandidateHandler *)&v2 dealloc];
}

- (TIStreamingCandidateHandler)initWithClientProxy:(id)a3 keyboardState:(id)a4 requestToken:(id)a5 logger:(id)a6 inputManager:(id)a7 candidateHandler:(id)a8 candidateResultSetHandler:(id)a9
{
  id v29 = a3;
  id v28 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  v30.receiver = self;
  v30.super_class = (Class)TIStreamingCandidateHandler;
  v21 = [(TIStreamingCandidateHandler *)&v30 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_clientProxy, a3);
    objc_storeStrong((id *)&v22->_keyboardState, a4);
    objc_storeStrong((id *)&v22->_requestToken, a5);
    objc_storeWeak((id *)&v22->_logger, v17);
    objc_storeWeak((id *)&v22->_inputManager, v18);
    uint64_t v23 = objc_msgSend(v19, "copy", v28, v29);
    id candidateHandler = v22->_candidateHandler;
    v22->_id candidateHandler = (id)v23;

    uint64_t v25 = [v20 copy];
    id candidateResultSetHandler = v22->_candidateResultSetHandler;
    v22->_id candidateResultSetHandler = (id)v25;

    v22->_status = 0;
  }

  return v22;
}

- (TIStreamingCandidateHandler)initWithClientProxy:(id)a3 keyboardState:(id)a4 requestToken:(id)a5 logger:(id)a6 inputManager:(id)a7 candidateResultSetHandler:(id)a8
{
  return [(TIStreamingCandidateHandler *)self initWithClientProxy:a3 keyboardState:a4 requestToken:a5 logger:a6 inputManager:a7 candidateHandler:0 candidateResultSetHandler:a8];
}

- (TIStreamingCandidateHandler)initWithClientProxy:(id)a3 keyboardState:(id)a4 requestToken:(id)a5 logger:(id)a6 inputManager:(id)a7 candidateHandler:(id)a8
{
  return [(TIStreamingCandidateHandler *)self initWithClientProxy:a3 keyboardState:a4 requestToken:a5 logger:a6 inputManager:a7 candidateHandler:a8 candidateResultSetHandler:0];
}

@end