@interface WFRemoteExecutionOutgoingRunRequestSession
- (WFActionParameterInputProvider)parameterInputProvider;
- (WFRemoteExecutionCoordinator)coordinator;
- (WFRemoteExecutionFileCoordinator)fileCoordinator;
- (WFRemoteExecutionOutgoingRunRequestSession)initWithService:(id)a3 request:(id)a4 userInterface:(id)a5 parameterInputProvider:(id)a6 coordinator:(id)a7 completion:(id)a8;
- (WFUserInterfaceHost)userInterface;
- (double)timeoutLimitInSeconds;
- (id)completion;
- (void)finish;
- (void)finishWithError:(id)a3;
- (void)handleIncomingFileForRemoteExecutionWithURL:(id)a3 withIdentifier:(id)a4 metadata:(id)a5;
- (void)handleIncomingProtobuf:(id)a3;
- (void)handleTimeout;
- (void)sendToDestinations:(id)a3 options:(id)a4;
- (void)setCompletion:(id)a3;
- (void)setFileCoordinator:(id)a3;
@end

@implementation WFRemoteExecutionOutgoingRunRequestSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileCoordinator, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_destroyWeak((id *)&self->_coordinator);
  objc_storeStrong((id *)&self->_parameterInputProvider, 0);
  objc_storeStrong((id *)&self->_userInterface, 0);
}

- (void)setFileCoordinator:(id)a3
{
}

- (void)setCompletion:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (WFRemoteExecutionCoordinator)coordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinator);
  return (WFRemoteExecutionCoordinator *)WeakRetained;
}

- (WFActionParameterInputProvider)parameterInputProvider
{
  return self->_parameterInputProvider;
}

- (WFUserInterfaceHost)userInterface
{
  return self->_userInterface;
}

- (WFRemoteExecutionFileCoordinator)fileCoordinator
{
  fileCoordinator = self->_fileCoordinator;
  if (!fileCoordinator)
  {
    v4 = (WFRemoteExecutionFileCoordinator *)objc_opt_new();
    v5 = self->_fileCoordinator;
    self->_fileCoordinator = v4;

    fileCoordinator = self->_fileCoordinator;
  }
  return fileCoordinator;
}

- (double)timeoutLimitInSeconds
{
  return 120.0;
}

- (void)finish
{
}

- (void)finishWithError:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = getWFRemoteExecutionLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[WFRemoteExecutionOutgoingRunRequestSession finishWithError:]";
    __int16 v22 = 2112;
    id v23 = v4;
    _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_DEFAULT, "%s finishWithError: %@", buf, 0x16u);
  }

  if ([(WFRemoteExecutionSession *)self state] == 101)
  {
    id v6 = [(WFRemoteExecutionSession *)self request];

    if (v6)
    {
      v7 = getWFRemoteExecutionLogObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v21 = "-[WFRemoteExecutionOutgoingRunRequestSession finishWithError:]";
        _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_INFO, "%s Sending stop...", buf, 0xCu);
      }

      v8 = [WFRemoteExecutionStopRequest alloc];
      v9 = [(WFRemoteExecutionSession *)self request];
      uint64_t v10 = [v9 identifier];
      v11 = [(WFRemoteExecutionStopRequest *)v8 initWithRequestIdentifier:v10];

      v12 = [(WFRemoteExecutionOutgoingRunRequestSession *)self coordinator];
      id v19 = 0;
      LOBYTE(v10) = [v12 sendStopRequest:v11 error:&v19];
      id v6 = v19;

      if ((v10 & 1) == 0)
      {
        [(WFRemoteExecutionSession *)self setState:1];
        v13 = getWFRemoteExecutionLogObject();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          v21 = "-[WFRemoteExecutionOutgoingRunRequestSession finishWithError:]";
          __int16 v22 = 2114;
          id v23 = v6;
          _os_log_impl(&dword_1C7F0A000, v13, OS_LOG_TYPE_FAULT, "%s Failed to send stop request: %{public}@", buf, 0x16u);
        }
      }
    }
  }
  else
  {
    id v6 = 0;
  }
  v14 = [(WFRemoteExecutionOutgoingRunRequestSession *)self completion];

  if (v14)
  {
    uint64_t v15 = [(WFRemoteExecutionOutgoingRunRequestSession *)self completion];
    v16 = (void *)v15;
    if (v4) {
      id v17 = v4;
    }
    else {
      id v17 = v6;
    }
    (*(void (**)(uint64_t, void, id))(v15 + 16))(v15, 0, v17);

    [(WFRemoteExecutionOutgoingRunRequestSession *)self setCompletion:0];
  }
  [(WFRemoteExecutionSession *)self setState:103];
  v18.receiver = self;
  v18.super_class = (Class)WFRemoteExecutionOutgoingRunRequestSession;
  [(WFRemoteExecutionSession *)&v18 finish];
}

- (void)handleTimeout
{
  [(WFRemoteExecutionSession *)self setState:104];
  id v3 = [(WFRemoteExecutionSession *)self sessionTimedOutError];
  [(WFRemoteExecutionOutgoingRunRequestSession *)self finishWithError:v3];
}

- (void)handleIncomingFileForRemoteExecutionWithURL:(id)a3 withIdentifier:(id)a4 metadata:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  v9 = [a5 objectForKey:@"version"];
  if (+[WFRemoteExecutionOutgoingFileSession supportsVersion:](WFRemoteExecutionOutgoingFileSession, "supportsVersion:", [v9 integerValue]))
  {
    uint64_t v10 = [(WFRemoteExecutionOutgoingRunRequestSession *)self fileCoordinator];
    [v10 handleFile:v11 withIdentifier:v8];
  }
  else
  {
    [(WFRemoteExecutionSession *)self setState:2];
    uint64_t v10 = +[WFRemoteExecutionRequest unsupportedVersionError];
    [(WFRemoteExecutionOutgoingRunRequestSession *)self finishWithError:v10];
  }
}

- (void)handleIncomingProtobuf:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(WFRemoteExecutionSession *)self setState:102];
  v5 = [WFRemoteExecutionRunRequestResponse alloc];
  id v6 = [v4 data];

  id v19 = 0;
  v7 = [(WFRemoteExecutionRunRequestResponse *)v5 initWithData:v6 error:&v19];
  id v8 = v19;

  if (v7)
  {
    v9 = [(WFRemoteExecutionRunRequestResponse *)v7 runRequestIdentifier];
    uint64_t v10 = [(WFRemoteExecutionSession *)self request];
    id v11 = [v10 identifier];
    char v12 = [v9 isEqualToString:v11];

    if (v12)
    {
      v13 = [(WFRemoteExecutionOutgoingRunRequestSession *)self fileCoordinator];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __69__WFRemoteExecutionOutgoingRunRequestSession_handleIncomingProtobuf___block_invoke;
      v18[3] = &unk_1E6551C98;
      v18[4] = self;
      [(WFRemoteExecutionRunRequestResponse *)v7 inflateWithFileCoordinator:v13 completion:v18];
    }
    else
    {
      [(WFRemoteExecutionSession *)self setState:-420];
    }
  }
  else
  {
    BOOL v14 = +[WFRemoteExecutionRequest isUnsupportedVersionError:v8];
    uint64_t v15 = getWFRemoteExecutionLogObject();
    v16 = v15;
    if (v14)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v21 = "-[WFRemoteExecutionOutgoingRunRequestSession handleIncomingProtobuf:]";
        _os_log_impl(&dword_1C7F0A000, v16, OS_LOG_TYPE_ERROR, "%s Encountered unsupported version of run request response", buf, 0xCu);
      }
      uint64_t v17 = 2;
    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v21 = "-[WFRemoteExecutionOutgoingRunRequestSession handleIncomingProtobuf:]";
        __int16 v22 = 2114;
        id v23 = v8;
        _os_log_impl(&dword_1C7F0A000, v16, OS_LOG_TYPE_FAULT, "%s Failed to read run request response: %{public}@", buf, 0x16u);
      }
      uint64_t v17 = 1;
    }

    [(WFRemoteExecutionSession *)self setState:v17];
    [(WFRemoteExecutionOutgoingRunRequestSession *)self finishWithError:v8];
  }
}

void __69__WFRemoteExecutionOutgoingRunRequestSession_handleIncomingProtobuf___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(a1 + 32) setState:103];
  id v4 = [*(id *)(a1 + 32) completion];

  if (v4)
  {
    v5 = [*(id *)(a1 + 32) completion];
    id v6 = [v3 error];
    ((void (**)(void, id, void *))v5)[2](v5, v3, v6);

    [*(id *)(a1 + 32) setCompletion:0];
  }
  else
  {
    v7 = getWFRemoteExecutionLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v10 = "-[WFRemoteExecutionOutgoingRunRequestSession handleIncomingProtobuf:]_block_invoke";
      _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_ERROR, "%s completion is nil in handleIncomingProtobuf:", buf, 0xCu);
    }
  }
  v8.receiver = *(id *)(a1 + 32);
  v8.super_class = (Class)WFRemoteExecutionOutgoingRunRequestSession;
  objc_msgSendSuper2(&v8, sel_finish);
}

- (void)sendToDestinations:(id)a3 options:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)WFRemoteExecutionOutgoingRunRequestSession;
  [(WFRemoteExecutionSession *)&v31 sendToDestinations:v6 options:v7];
  [(WFRemoteExecutionSession *)self setState:100];
  id v8 = objc_alloc_init(MEMORY[0x1E4F94098]);
  v9 = [(WFRemoteExecutionOutgoingRunRequestSession *)self coordinator];
  uint64_t v10 = [(WFRemoteExecutionSession *)self request];
  [v10 setCoordinator:v9];

  uint64_t v11 = [(WFRemoteExecutionSession *)self request];
  id v30 = 0;
  char v12 = [v11 writeTo:v8 error:&v30];
  id v13 = v30;

  if (v12)
  {
    id v14 = objc_alloc(MEMORY[0x1E4F6AB78]);
    uint64_t v15 = [v8 immutableData];
    v16 = (void *)[v14 initWithProtobufData:v15 type:1 isResponse:0];

    uint64_t v17 = getWFRemoteExecutionLogObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      objc_super v18 = [(WFRemoteExecutionSession *)self request];
      id v19 = [v18 identifier];
      *(_DWORD *)buf = 136315394;
      v33 = "-[WFRemoteExecutionOutgoingRunRequestSession sendToDestinations:options:]";
      __int16 v34 = 2114;
      v35 = v19;
      _os_log_impl(&dword_1C7F0A000, v17, OS_LOG_TYPE_INFO, "%s <%{public}@> sending run request", buf, 0x16u);
    }
    [(WFRemoteExecutionSession *)self restartTimeout];
    v20 = [(WFRemoteExecutionSession *)self service];
    id v28 = 0;
    id v29 = 0;
    char v21 = [v20 sendProtobuf:v16 toDestinations:v6 priority:300 options:v7 identifier:&v29 error:&v28];
    id v22 = v29;
    id v23 = v28;

    if (v21)
    {
      [(WFRemoteExecutionSession *)self setIdsIdentifier:v22];
      [(WFRemoteExecutionSession *)self setState:101];
    }
    else
    {
      v27 = getWFRemoteExecutionLogObject();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v33 = "-[WFRemoteExecutionOutgoingRunRequestSession sendToDestinations:options:]";
        __int16 v34 = 2114;
        v35 = self;
        __int16 v36 = 2114;
        id v37 = v23;
        _os_log_impl(&dword_1C7F0A000, v27, OS_LOG_TYPE_ERROR, "%s %{public}@ failed to send with error: %{public}@", buf, 0x20u);
      }

      [(WFRemoteExecutionSession *)self setState:1];
      [(WFRemoteExecutionOutgoingRunRequestSession *)self finishWithError:v23];
    }
  }
  else
  {
    uint64_t v24 = getWFRemoteExecutionLogObject();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      v25 = [(WFRemoteExecutionSession *)self request];
      v26 = [v25 identifier];
      *(_DWORD *)buf = 136315650;
      v33 = "-[WFRemoteExecutionOutgoingRunRequestSession sendToDestinations:options:]";
      __int16 v34 = 2114;
      v35 = v26;
      __int16 v36 = 2114;
      id v37 = v13;
      _os_log_impl(&dword_1C7F0A000, v24, OS_LOG_TYPE_FAULT, "%s <%{public}@> failed to write protobuf with error: %{public}@", buf, 0x20u);
    }
    [(WFRemoteExecutionSession *)self setState:1];
    [(WFRemoteExecutionOutgoingRunRequestSession *)self finishWithError:v13];
  }
}

- (WFRemoteExecutionOutgoingRunRequestSession)initWithService:(id)a3 request:(id)a4 userInterface:(id)a5 parameterInputProvider:(id)a6 coordinator:(id)a7 completion:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  if (v15)
  {
    if (v16) {
      goto LABEL_3;
    }
  }
  else
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"WFRemoteExecutionOutgoingRunRequestSession.m", 33, @"Invalid parameter not satisfying: %@", @"service" object file lineNumber description];

    if (v16)
    {
LABEL_3:
      if (v17) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  id v28 = [MEMORY[0x1E4F28B00] currentHandler];
  [v28 handleFailureInMethod:a2, self, @"WFRemoteExecutionOutgoingRunRequestSession.m", 34, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];

  if (v17)
  {
LABEL_4:
    if (v19) {
      goto LABEL_5;
    }
LABEL_12:
    id v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"WFRemoteExecutionOutgoingRunRequestSession.m", 39, @"Invalid parameter not satisfying: %@", @"coordinator" object file lineNumber description];

    if (v20) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_11:
  id v29 = [MEMORY[0x1E4F28B00] currentHandler];
  [v29 handleFailureInMethod:a2, self, @"WFRemoteExecutionOutgoingRunRequestSession.m", 35, @"Invalid parameter not satisfying: %@", @"userInterface" object file lineNumber description];

  if (!v19) {
    goto LABEL_12;
  }
LABEL_5:
  if (v20) {
    goto LABEL_6;
  }
LABEL_13:
  objc_super v31 = [MEMORY[0x1E4F28B00] currentHandler];
  [v31 handleFailureInMethod:a2, self, @"WFRemoteExecutionOutgoingRunRequestSession.m", 40, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_6:
  v32.receiver = self;
  v32.super_class = (Class)WFRemoteExecutionOutgoingRunRequestSession;
  char v21 = [(WFRemoteExecutionSession *)&v32 initWithService:v15];
  id v22 = v21;
  if (v21)
  {
    [(WFRemoteExecutionSession *)v21 setRequest:v16];
    objc_storeStrong((id *)&v22->_userInterface, a5);
    objc_storeStrong((id *)&v22->_parameterInputProvider, a6);
    uint64_t v23 = [v20 copy];
    id completion = v22->_completion;
    v22->_id completion = (id)v23;

    objc_storeWeak((id *)&v22->_coordinator, v19);
    v25 = v22;
  }

  return v22;
}

@end