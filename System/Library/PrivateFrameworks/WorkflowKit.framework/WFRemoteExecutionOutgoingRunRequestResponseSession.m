@interface WFRemoteExecutionOutgoingRunRequestResponseSession
- (NSData)responseData;
- (WFRemoteExecutionOutgoingRunRequestResponseSession)initWithService:(id)a3 responseData:(id)a4;
- (double)timeoutLimitInSeconds;
- (void)handleTimeout;
- (void)sendToDestinations:(id)a3 options:(id)a4;
@end

@implementation WFRemoteExecutionOutgoingRunRequestResponseSession

- (void).cxx_destruct
{
}

- (NSData)responseData
{
  return self->_responseData;
}

- (double)timeoutLimitInSeconds
{
  return 60.0;
}

- (void)handleTimeout
{
  [(WFRemoteExecutionSession *)self setState:104];
  [(WFRemoteExecutionSession *)self finish];
}

- (void)sendToDestinations:(id)a3 options:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)WFRemoteExecutionOutgoingRunRequestResponseSession;
  id v6 = a4;
  id v7 = a3;
  [(WFRemoteExecutionSession *)&v19 sendToDestinations:v7 options:v6];
  [(WFRemoteExecutionSession *)self setState:100];
  id v8 = objc_alloc(MEMORY[0x1E4F6AB78]);
  v9 = [(WFRemoteExecutionOutgoingRunRequestResponseSession *)self responseData];
  v10 = (void *)[v8 initWithProtobufData:v9 type:2 isResponse:0];

  v11 = getWFRemoteExecutionLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "-[WFRemoteExecutionOutgoingRunRequestResponseSession sendToDestinations:options:]";
    _os_log_impl(&dword_1C7F0A000, v11, OS_LOG_TYPE_INFO, "%s sending run request response", buf, 0xCu);
  }

  [(WFRemoteExecutionSession *)self restartTimeout];
  v12 = [(WFRemoteExecutionSession *)self service];
  id v17 = 0;
  id v18 = 0;
  char v13 = [v12 sendProtobuf:v10 toDestinations:v7 priority:300 options:v6 identifier:&v18 error:&v17];

  id v14 = v18;
  id v15 = v17;

  if (v13)
  {
    [(WFRemoteExecutionSession *)self setIdsIdentifier:v14];
    [(WFRemoteExecutionSession *)self setState:103];
  }
  else
  {
    v16 = getWFRemoteExecutionLogObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[WFRemoteExecutionOutgoingRunRequestResponseSession sendToDestinations:options:]";
      __int16 v22 = 2114;
      id v23 = v15;
      _os_log_impl(&dword_1C7F0A000, v16, OS_LOG_TYPE_ERROR, "%s failed to send run request response with error: %{public}@", buf, 0x16u);
    }

    [(WFRemoteExecutionSession *)self setState:1];
    [(WFRemoteExecutionSession *)self finish];
  }
}

- (WFRemoteExecutionOutgoingRunRequestResponseSession)initWithService:(id)a3 responseData:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"WFRemoteExecutionOutgoingRunRequestResponseSession.m", 24, @"Invalid parameter not satisfying: %@", @"service" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  id v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"WFRemoteExecutionOutgoingRunRequestResponseSession.m", 25, @"Invalid parameter not satisfying: %@", @"responseData" object file lineNumber description];

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)WFRemoteExecutionOutgoingRunRequestResponseSession;
  v10 = [(WFRemoteExecutionSession *)&v16 initWithService:v7];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_responseData, a4);
    v12 = v11;
  }

  return v11;
}

@end