@interface WFRemoteExecutionOutgoingStopSession
- (BOOL)sendToDestinations:(id)a3 options:(id)a4 error:(id *)a5;
- (WFRemoteExecutionOutgoingStopSession)initWithService:(id)a3 request:(id)a4;
@end

@implementation WFRemoteExecutionOutgoingStopSession

- (BOOL)sendToDestinations:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"WFRemoteExecutionOutgoingStopSession.m", 30, @"Invalid parameter not satisfying: %@", @"destinations" object file lineNumber description];
  }
  [(WFRemoteExecutionSession *)self setState:100];
  id v11 = objc_alloc_init(MEMORY[0x1E4F94098]);
  v12 = [(WFRemoteExecutionSession *)self request];
  id v34 = 0;
  char v13 = [v12 writeTo:v11 error:&v34];
  id v14 = v34;

  if (v13)
  {
    v31 = a5;
    id v15 = objc_alloc(MEMORY[0x1E4F6AB78]);
    v16 = [v11 immutableData];
    v17 = (void *)[v15 initWithProtobufData:v16 type:7 isResponse:0];

    v18 = getWFRemoteExecutionLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = [(WFRemoteExecutionSession *)self request];
      v20 = [v19 identifier];
      *(_DWORD *)buf = 136315394;
      v36 = "-[WFRemoteExecutionOutgoingStopSession sendToDestinations:options:error:]";
      __int16 v37 = 2114;
      v38 = v20;
      _os_log_impl(&dword_1C7F0A000, v18, OS_LOG_TYPE_INFO, "%s <%{public}@> sending stop request", buf, 0x16u);
    }
    v21 = [(WFRemoteExecutionSession *)self service];
    id v32 = 0;
    id v33 = 0;
    char v22 = [v21 sendProtobuf:v17 toDestinations:v9 priority:300 options:v10 identifier:&v33 error:&v32];
    id v23 = v33;
    id v24 = v32;

    if (v22)
    {
      [(WFRemoteExecutionSession *)self setIdsIdentifier:v23];
      [(WFRemoteExecutionSession *)self setState:103];
    }
    else
    {
      v28 = getWFRemoteExecutionLogObject();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v36 = "-[WFRemoteExecutionOutgoingStopSession sendToDestinations:options:error:]";
        __int16 v37 = 2114;
        v38 = self;
        __int16 v39 = 2114;
        id v40 = v24;
        _os_log_impl(&dword_1C7F0A000, v28, OS_LOG_TYPE_ERROR, "%s %{public}@ failed to send with error: %{public}@", buf, 0x20u);
      }

      [(WFRemoteExecutionSession *)self setState:1];
      if (v31) {
        id *v31 = v14;
      }
    }
    [(WFRemoteExecutionSession *)self finish];
  }
  else
  {
    v25 = getWFRemoteExecutionLogObject();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      v26 = [(WFRemoteExecutionSession *)self request];
      v27 = [v26 identifier];
      *(_DWORD *)buf = 136315650;
      v36 = "-[WFRemoteExecutionOutgoingStopSession sendToDestinations:options:error:]";
      __int16 v37 = 2114;
      v38 = v27;
      __int16 v39 = 2114;
      id v40 = v14;
      _os_log_impl(&dword_1C7F0A000, v25, OS_LOG_TYPE_FAULT, "%s <%{public}@> failed to write protobuf with error: %{public}@", buf, 0x20u);
    }
    [(WFRemoteExecutionSession *)self setState:1];
    if (a5) {
      *a5 = v14;
    }
    [(WFRemoteExecutionSession *)self finish];
    char v22 = 0;
  }

  return v22;
}

- (WFRemoteExecutionOutgoingStopSession)initWithService:(id)a3 request:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)WFRemoteExecutionOutgoingStopSession;
  v7 = [(WFRemoteExecutionSession *)&v11 initWithService:a3];
  v8 = v7;
  if (v7)
  {
    [(WFRemoteExecutionSession *)v7 setRequest:v6];
    id v9 = v8;
  }

  return v8;
}

@end