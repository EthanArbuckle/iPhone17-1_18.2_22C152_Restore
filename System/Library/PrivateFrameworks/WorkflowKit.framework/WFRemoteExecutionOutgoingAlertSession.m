@interface WFRemoteExecutionOutgoingAlertSession
- (WFRemoteExecutionOutgoingAlertSession)initWithService:(id)a3 request:(id)a4 completion:(id)a5;
- (double)timeoutLimitInSeconds;
- (id)completion;
- (void)finish;
- (void)finishWithError:(id)a3;
- (void)handleIncomingProtobuf:(id)a3;
- (void)handleTimeout;
- (void)sendToDestinations:(id)a3 options:(id)a4;
@end

@implementation WFRemoteExecutionOutgoingAlertSession

- (void).cxx_destruct
{
}

- (id)completion
{
  return self->_completion;
}

- (void)finish
{
}

- (void)finishWithError:(id)a3
{
  id v4 = a3;
  v5 = [(WFRemoteExecutionOutgoingAlertSession *)self completion];

  if (v5)
  {
    v6 = [(WFRemoteExecutionOutgoingAlertSession *)self completion];
    ((void (**)(void, void, id))v6)[2](v6, 0, v4);
  }
  v7.receiver = self;
  v7.super_class = (Class)WFRemoteExecutionOutgoingAlertSession;
  [(WFRemoteExecutionSession *)&v7 finish];
}

- (double)timeoutLimitInSeconds
{
  return 60.0;
}

- (void)handleTimeout
{
  [(WFRemoteExecutionSession *)self setState:104];
  id v3 = [(WFRemoteExecutionSession *)self sessionTimedOutError];
  [(WFRemoteExecutionOutgoingAlertSession *)self finishWithError:v3];
}

- (void)handleIncomingProtobuf:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(WFRemoteExecutionSession *)self setState:102];
  id v5 = objc_alloc(MEMORY[0x1E4F94090]);
  v6 = [v4 data];

  objc_super v7 = (void *)[v5 initWithData:v6];
  v8 = objc_alloc_init(WFRemoteExecutionAlertRequestResponse);
  id v26 = 0;
  BOOL v9 = [(WFRemoteExecutionRequest *)v8 readFrom:v7 error:&v26];
  id v10 = v26;
  if (v9)
  {
    v11 = [(WFRemoteExecutionAlertRequestResponse *)v8 requestIdentifier];
    v12 = [(WFRemoteExecutionSession *)self request];
    v13 = [v12 identifier];
    char v14 = [v11 isEqualToString:v13];

    if (v14)
    {
      v15 = getWFRemoteExecutionLogObject();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = [(WFRemoteExecutionRequest *)v8 identifier];
        v17 = [(WFRemoteExecutionAlertRequestResponse *)v8 requestIdentifier];
        *(_DWORD *)buf = 136315650;
        v28 = "-[WFRemoteExecutionOutgoingAlertSession handleIncomingProtobuf:]";
        __int16 v29 = 2114;
        id v30 = v16;
        __int16 v31 = 2114;
        v32 = v17;
        _os_log_impl(&dword_1C7F0A000, v15, OS_LOG_TYPE_INFO, "%s <%{public}@> Received response for alert: %{public}@", buf, 0x20u);
      }
      v18 = [(WFRemoteExecutionOutgoingAlertSession *)self completion];
      v19 = [(WFRemoteExecutionAlertRequestResponse *)v8 selectedButton];
      v20 = [(WFRemoteExecutionAlertRequestResponse *)v8 error];
      ((void (**)(void, void *, void *))v18)[2](v18, v19, v20);

      v25.receiver = self;
      v25.super_class = (Class)WFRemoteExecutionOutgoingAlertSession;
      [(WFRemoteExecutionSession *)&v25 finish];
    }
    else
    {
      [(WFRemoteExecutionSession *)self setState:-420];
    }
  }
  else
  {
    BOOL v21 = +[WFRemoteExecutionRequest isUnsupportedVersionError:v10];
    v22 = getWFRemoteExecutionLogObject();
    v23 = v22;
    if (v21)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v28 = "-[WFRemoteExecutionOutgoingAlertSession handleIncomingProtobuf:]";
        _os_log_impl(&dword_1C7F0A000, v23, OS_LOG_TYPE_ERROR, "%s Encountered unsupported version of alert request response", buf, 0xCu);
      }
      uint64_t v24 = 2;
    }
    else
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v28 = "-[WFRemoteExecutionOutgoingAlertSession handleIncomingProtobuf:]";
        __int16 v29 = 2114;
        id v30 = v10;
        _os_log_impl(&dword_1C7F0A000, v23, OS_LOG_TYPE_FAULT, "%s failed to read response protobuf: %{public}@", buf, 0x16u);
      }
      uint64_t v24 = 1;
    }

    [(WFRemoteExecutionSession *)self setState:v24];
    [(WFRemoteExecutionOutgoingAlertSession *)self finishWithError:v10];
  }
}

- (void)sendToDestinations:(id)a3 options:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)WFRemoteExecutionOutgoingAlertSession;
  [(WFRemoteExecutionSession *)&v31 sendToDestinations:v6 options:v7];
  [(WFRemoteExecutionSession *)self setState:100];
  v8 = getWFRemoteExecutionLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    BOOL v9 = [(WFRemoteExecutionSession *)self request];
    id v10 = [v9 identifier];
    *(_DWORD *)buf = 136315394;
    uint64_t v33 = "-[WFRemoteExecutionOutgoingAlertSession sendToDestinations:options:]";
    __int16 v34 = 2114;
    v35 = v10;
    _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_INFO, "%s <%{public}@> Sending alert", buf, 0x16u);
  }
  id v11 = objc_alloc_init(MEMORY[0x1E4F94098]);
  v12 = [(WFRemoteExecutionSession *)self request];
  id v30 = 0;
  char v13 = [v12 writeTo:v11 error:&v30];
  id v14 = v30;

  if (v13)
  {
    id v15 = objc_alloc(MEMORY[0x1E4F6AB78]);
    v16 = [v11 immutableData];
    v17 = (void *)[v15 initWithProtobufData:v16 type:3 isResponse:0];

    [(WFRemoteExecutionSession *)self restartTimeout];
    v18 = [(WFRemoteExecutionSession *)self service];
    id v28 = 0;
    id v29 = 0;
    char v19 = [v18 sendProtobuf:v17 toDestinations:v6 priority:300 options:v7 identifier:&v29 error:&v28];
    id v20 = v29;
    id v21 = v28;

    if (v19)
    {
      [(WFRemoteExecutionSession *)self setIdsIdentifier:v20];
      [(WFRemoteExecutionSession *)self setState:101];
    }
    else
    {
      objc_super v25 = getWFRemoteExecutionLogObject();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      {
        v27 = [(WFRemoteExecutionSession *)self request];
        id v26 = [v27 identifier];
        *(_DWORD *)buf = 136315650;
        uint64_t v33 = "-[WFRemoteExecutionOutgoingAlertSession sendToDestinations:options:]";
        __int16 v34 = 2114;
        v35 = v26;
        __int16 v36 = 2114;
        id v37 = v21;
        _os_log_impl(&dword_1C7F0A000, v25, OS_LOG_TYPE_FAULT, "%s <%{public}@> failed to write protobuf with error: %{public}@", buf, 0x20u);
      }
      [(WFRemoteExecutionSession *)self setState:1];
      [(WFRemoteExecutionOutgoingAlertSession *)self finishWithError:v21];
    }
  }
  else
  {
    v22 = getWFRemoteExecutionLogObject();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      v23 = [(WFRemoteExecutionSession *)self request];
      uint64_t v24 = [v23 identifier];
      *(_DWORD *)buf = 136315650;
      uint64_t v33 = "-[WFRemoteExecutionOutgoingAlertSession sendToDestinations:options:]";
      __int16 v34 = 2114;
      v35 = v24;
      __int16 v36 = 2114;
      id v37 = v14;
      _os_log_impl(&dword_1C7F0A000, v22, OS_LOG_TYPE_FAULT, "%s <%{public}@> failed to write protobuf with error: %{public}@", buf, 0x20u);
    }
    [(WFRemoteExecutionSession *)self setState:1];
    [(WFRemoteExecutionOutgoingAlertSession *)self finishWithError:v14];
  }
}

- (WFRemoteExecutionOutgoingAlertSession)initWithService:(id)a3 request:(id)a4 completion:(id)a5
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
    [v19 handleFailureInMethod:a2, self, @"WFRemoteExecutionOutgoingAlertSession.m", 26, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"WFRemoteExecutionOutgoingAlertSession.m", 25, @"Invalid parameter not satisfying: %@", @"service" object file lineNumber description];

  if (!v10) {
    goto LABEL_8;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_9:
  id v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"WFRemoteExecutionOutgoingAlertSession.m", 27, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];

LABEL_4:
  v21.receiver = self;
  v21.super_class = (Class)WFRemoteExecutionOutgoingAlertSession;
  v12 = [(WFRemoteExecutionSession *)&v21 initWithService:v9];
  char v13 = v12;
  if (v12)
  {
    [(WFRemoteExecutionSession *)v12 setRequest:v10];
    id v14 = _Block_copy(v11);
    id completion = v13->_completion;
    v13->_id completion = v14;

    v16 = v13;
  }

  return v13;
}

@end