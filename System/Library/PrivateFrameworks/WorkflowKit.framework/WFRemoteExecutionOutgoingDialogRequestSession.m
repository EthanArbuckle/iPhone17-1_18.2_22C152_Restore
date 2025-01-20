@interface WFRemoteExecutionOutgoingDialogRequestSession
- (WFRemoteExecutionOutgoingDialogRequestSession)initWithService:(id)a3 request:(id)a4 completion:(id)a5;
- (double)timeoutLimitInSeconds;
- (id)completion;
- (void)finish;
- (void)finishWithError:(id)a3;
- (void)handleIncomingProtobuf:(id)a3;
- (void)handleTimeout;
- (void)sendToDestinations:(id)a3 options:(id)a4;
- (void)setCompletion:(id)a3;
@end

@implementation WFRemoteExecutionOutgoingDialogRequestSession

- (void).cxx_destruct
{
}

- (void)setCompletion:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)finishWithError:(id)a3
{
  id v4 = a3;
  v5 = [(WFRemoteExecutionOutgoingDialogRequestSession *)self completion];

  if (v5)
  {
    v6 = [(WFRemoteExecutionOutgoingDialogRequestSession *)self completion];
    ((void (**)(void, void, id))v6)[2](v6, 0, v4);

    [(WFRemoteExecutionOutgoingDialogRequestSession *)self setCompletion:0];
  }
  v7.receiver = self;
  v7.super_class = (Class)WFRemoteExecutionOutgoingDialogRequestSession;
  [(WFRemoteExecutionSession *)&v7 finish];
}

- (void)finish
{
}

- (double)timeoutLimitInSeconds
{
  return 120.0;
}

- (void)handleTimeout
{
  [(WFRemoteExecutionSession *)self setState:104];
  [(WFRemoteExecutionOutgoingDialogRequestSession *)self finish];
}

- (void)handleIncomingProtobuf:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(WFRemoteExecutionSession *)self setState:102];
  v5 = [WFRemoteExecutionDialogRequestResponse alloc];
  v6 = [v4 data];

  id v21 = 0;
  objc_super v7 = [(WFRemoteExecutionDialogRequestResponse *)v5 initWithData:v6 error:&v21];
  id v8 = v21;

  if (v7)
  {
    v9 = [(WFRemoteExecutionDialogRequestResponse *)v7 originatingRequestIdentifier];
    v10 = [(WFRemoteExecutionSession *)self request];
    v11 = [v10 identifier];
    int v12 = [v9 isEqualToString:v11];

    if (v12)
    {
      v13 = [(WFRemoteExecutionOutgoingDialogRequestSession *)self completion];
      v14 = [(WFRemoteExecutionDialogRequestResponse *)v7 error];
      ((void (**)(void, WFRemoteExecutionDialogRequestResponse *, void *))v13)[2](v13, v7, v14);

      [(WFRemoteExecutionOutgoingDialogRequestSession *)self setCompletion:0];
      [(WFRemoteExecutionOutgoingDialogRequestSession *)self finish];
      uint64_t v15 = 103;
    }
    else
    {
      uint64_t v15 = -420;
    }
    [(WFRemoteExecutionSession *)self setState:v15];
  }
  else
  {
    BOOL v16 = +[WFRemoteExecutionRequest isUnsupportedVersionError:v8];
    v17 = getWFRemoteExecutionLogObject();
    v18 = v17;
    if (v16)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v23 = "-[WFRemoteExecutionOutgoingDialogRequestSession handleIncomingProtobuf:]";
        _os_log_impl(&dword_1C7F0A000, v18, OS_LOG_TYPE_ERROR, "%s Encountered unsupported version of dialog request response", buf, 0xCu);
      }
      uint64_t v19 = 2;
    }
    else
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v23 = "-[WFRemoteExecutionOutgoingDialogRequestSession handleIncomingProtobuf:]";
        __int16 v24 = 2114;
        id v25 = v8;
        _os_log_impl(&dword_1C7F0A000, v18, OS_LOG_TYPE_FAULT, "%s Failed to read dialog response: %{public}@", buf, 0x16u);
      }
      uint64_t v19 = 1;
    }

    [(WFRemoteExecutionSession *)self setState:v19];
    v20 = [(WFRemoteExecutionOutgoingDialogRequestSession *)self completion];
    ((void (**)(void, void, id))v20)[2](v20, 0, v8);

    [(WFRemoteExecutionOutgoingDialogRequestSession *)self setCompletion:0];
    [(WFRemoteExecutionOutgoingDialogRequestSession *)self finishWithError:v8];
  }
}

- (void)sendToDestinations:(id)a3 options:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)WFRemoteExecutionOutgoingDialogRequestSession;
  [(WFRemoteExecutionSession *)&v29 sendToDestinations:v6 options:v7];
  [(WFRemoteExecutionSession *)self setState:100];
  id v8 = objc_alloc_init(MEMORY[0x1E4F94098]);
  v9 = [(WFRemoteExecutionSession *)self request];
  id v28 = 0;
  char v10 = [v9 writeTo:v8 error:&v28];
  id v11 = v28;

  if (v10)
  {
    id v12 = objc_alloc(MEMORY[0x1E4F6AB78]);
    v13 = [v8 immutableData];
    v14 = (void *)[v12 initWithProtobufData:v13 type:10 isResponse:0];

    uint64_t v15 = getWFRemoteExecutionLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      BOOL v16 = [(WFRemoteExecutionSession *)self request];
      v17 = [v16 identifier];
      *(_DWORD *)buf = 136315394;
      v31 = "-[WFRemoteExecutionOutgoingDialogRequestSession sendToDestinations:options:]";
      __int16 v32 = 2114;
      v33 = v17;
      _os_log_impl(&dword_1C7F0A000, v15, OS_LOG_TYPE_INFO, "%s <%{public}@> sending dialog request", buf, 0x16u);
    }
    [(WFRemoteExecutionSession *)self restartTimeout];
    v18 = [(WFRemoteExecutionSession *)self service];
    id v26 = 0;
    id v27 = 0;
    char v19 = [v18 sendProtobuf:v14 toDestinations:v6 priority:300 options:v7 identifier:&v27 error:&v26];
    id v20 = v27;
    id v21 = v26;

    if (v19)
    {
      [(WFRemoteExecutionSession *)self setIdsIdentifier:v20];
      [(WFRemoteExecutionSession *)self setState:101];
    }
    else
    {
      [(WFRemoteExecutionSession *)self setState:1];
      id v25 = getWFRemoteExecutionLogObject();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v31 = "-[WFRemoteExecutionOutgoingDialogRequestSession sendToDestinations:options:]";
        __int16 v32 = 2114;
        v33 = self;
        __int16 v34 = 2114;
        id v35 = v21;
        _os_log_impl(&dword_1C7F0A000, v25, OS_LOG_TYPE_ERROR, "%s %{public}@ failed to send with error: %{public}@", buf, 0x20u);
      }

      [(WFRemoteExecutionOutgoingDialogRequestSession *)self finishWithError:v21];
    }
  }
  else
  {
    v22 = getWFRemoteExecutionLogObject();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      v23 = [(WFRemoteExecutionSession *)self request];
      __int16 v24 = [v23 identifier];
      *(_DWORD *)buf = 136315650;
      v31 = "-[WFRemoteExecutionOutgoingDialogRequestSession sendToDestinations:options:]";
      __int16 v32 = 2114;
      v33 = v24;
      __int16 v34 = 2114;
      id v35 = v11;
      _os_log_impl(&dword_1C7F0A000, v22, OS_LOG_TYPE_FAULT, "%s <%{public}@> failed to write protobuf with error: %{public}@", buf, 0x20u);
    }
    [(WFRemoteExecutionSession *)self setState:1];
    [(WFRemoteExecutionOutgoingDialogRequestSession *)self finishWithError:v11];
  }
}

- (WFRemoteExecutionOutgoingDialogRequestSession)initWithService:(id)a3 request:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_8:
    char v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"WFRemoteExecutionOutgoingDialogRequestSession.m", 30, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"WFRemoteExecutionOutgoingDialogRequestSession.m", 29, @"Invalid parameter not satisfying: %@", @"service" object file lineNumber description];

  if (!v10) {
    goto LABEL_8;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_9:
  id v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"WFRemoteExecutionOutgoingDialogRequestSession.m", 31, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_4:
  v21.receiver = self;
  v21.super_class = (Class)WFRemoteExecutionOutgoingDialogRequestSession;
  id v12 = [(WFRemoteExecutionSession *)&v21 initWithService:v9];
  v13 = v12;
  if (v12)
  {
    [(WFRemoteExecutionSession *)v12 setRequest:v10];
    v14 = _Block_copy(v11);
    id completion = v13->_completion;
    v13->_id completion = v14;

    BOOL v16 = v13;
  }

  return v13;
}

@end