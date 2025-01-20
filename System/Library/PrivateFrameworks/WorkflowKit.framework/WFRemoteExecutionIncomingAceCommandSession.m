@interface WFRemoteExecutionIncomingAceCommandSession
- (WFRemoteExecutionAceCommandRequestResponse)response;
- (void)handleIncomingProtobuf:(id)a3 destinations:(id)a4 options:(id)a5;
- (void)sendResponseWithOriginatingRequestIdentifier:(id)a3 aceCommandResponseDictionary:(id)a4 error:(id)a5 destinations:(id)a6 options:(id)a7;
- (void)sendToDestinations:(id)a3 options:(id)a4;
- (void)setResponse:(id)a3;
@end

@implementation WFRemoteExecutionIncomingAceCommandSession

- (void).cxx_destruct
{
}

- (void)setResponse:(id)a3
{
}

- (WFRemoteExecutionAceCommandRequestResponse)response
{
  return self->_response;
}

- (void)sendResponseWithOriginatingRequestIdentifier:(id)a3 aceCommandResponseDictionary:(id)a4 error:(id)a5 destinations:(id)a6 options:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = [[WFRemoteExecutionAceCommandRequestResponse alloc] initWithOriginatingRequestIdentifier:v16 aceCommandResponseDictionary:v15 error:v14];

  [(WFRemoteExecutionIncomingAceCommandSession *)self setResponse:v17];
  [(WFRemoteExecutionIncomingAceCommandSession *)self sendToDestinations:v13 options:v12];
}

- (void)sendToDestinations:(id)a3 options:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)WFRemoteExecutionIncomingAceCommandSession;
  [(WFRemoteExecutionSession *)&v30 sendToDestinations:v6 options:v7];
  id v8 = objc_alloc_init(MEMORY[0x1E4F94098]);
  v9 = [(WFRemoteExecutionIncomingAceCommandSession *)self response];
  id v29 = 0;
  char v10 = [v9 writeTo:v8 error:&v29];
  id v11 = v29;

  if (v10)
  {
    id v12 = objc_alloc(MEMORY[0x1E4F6AB78]);
    id v13 = [v8 immutableData];
    id v14 = (void *)[v12 initWithProtobufData:v13 type:9 isResponse:0];

    id v15 = getWFRemoteExecutionLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = [(WFRemoteExecutionIncomingAceCommandSession *)self response];
      v17 = [v16 identifier];
      *(_DWORD *)buf = 136315394;
      v32 = "-[WFRemoteExecutionIncomingAceCommandSession sendToDestinations:options:]";
      __int16 v33 = 2114;
      v34 = v17;
      _os_log_impl(&dword_1C7F0A000, v15, OS_LOG_TYPE_INFO, "%s <%{public}@> sending ace command response", buf, 0x16u);
    }
    v18 = [(WFRemoteExecutionSession *)self service];
    id v27 = 0;
    id v28 = 0;
    char v19 = [v18 sendProtobuf:v14 toDestinations:v6 priority:300 options:v7 identifier:&v28 error:&v27];
    id v20 = v28;
    id v21 = v27;

    if (v19)
    {
      [(WFRemoteExecutionSession *)self setIdsIdentifier:v20];
      uint64_t v22 = 202;
    }
    else
    {
      v26 = getWFRemoteExecutionLogObject();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v32 = "-[WFRemoteExecutionIncomingAceCommandSession sendToDestinations:options:]";
        __int16 v33 = 2114;
        v34 = self;
        __int16 v35 = 2114;
        id v36 = v21;
        _os_log_impl(&dword_1C7F0A000, v26, OS_LOG_TYPE_ERROR, "%s %{public}@ failed to send with error: %{public}@", buf, 0x20u);
      }

      uint64_t v22 = 1;
    }
    [(WFRemoteExecutionSession *)self setState:v22];
    [(WFRemoteExecutionSession *)self finish];
  }
  else
  {
    v23 = getWFRemoteExecutionLogObject();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      v24 = [(WFRemoteExecutionIncomingAceCommandSession *)self response];
      v25 = [v24 identifier];
      *(_DWORD *)buf = 136315650;
      v32 = "-[WFRemoteExecutionIncomingAceCommandSession sendToDestinations:options:]";
      __int16 v33 = 2114;
      v34 = v25;
      __int16 v35 = 2114;
      id v36 = v11;
      _os_log_impl(&dword_1C7F0A000, v23, OS_LOG_TYPE_FAULT, "%s <%{public}@> failed to write protobuf with error: %{public}@", buf, 0x20u);
    }
    [(WFRemoteExecutionSession *)self setState:1];
  }
}

- (void)handleIncomingProtobuf:(id)a3 destinations:(id)a4 options:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(WFRemoteExecutionSession *)self setState:200];
  id v11 = [WFRemoteExecutionAceCommandRequest alloc];
  id v12 = [v8 data];
  id v34 = 0;
  id v13 = [(WFRemoteExecutionAceCommandRequest *)v11 initWithData:v12 error:&v34];
  id v14 = v34;

  if (v13)
  {
    id v15 = (void *)MEMORY[0x1E4F96508];
    id v16 = [(WFRemoteExecutionAceCommandRequest *)v13 aceCommandDictionary];
    v17 = [v15 aceObjectWithDictionary:v16];

    if (v17)
    {
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __90__WFRemoteExecutionIncomingAceCommandSession_handleIncomingProtobuf_destinations_options___block_invoke;
      v29[3] = &unk_1E6558A68;
      v29[4] = self;
      objc_super v30 = v13;
      id v31 = v9;
      id v32 = v10;
      WFPerformACECommand(v17, 0, v29);
    }
    else
    {
      v26 = getWFRemoteExecutionLogObject();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v36 = "-[WFRemoteExecutionIncomingAceCommandSession handleIncomingProtobuf:destinations:options:]";
        _os_log_impl(&dword_1C7F0A000, v26, OS_LOG_TYPE_FAULT, "%s unable to create ace command from dictionary representation", buf, 0xCu);
      }

      [(WFRemoteExecutionSession *)self setState:1];
      id v27 = [(WFRemoteExecutionRequest *)v13 identifier];
      id v28 = [(WFRemoteExecutionSession *)self invalidAceCommandError];
      [(WFRemoteExecutionIncomingAceCommandSession *)self sendResponseWithOriginatingRequestIdentifier:v27 aceCommandResponseDictionary:0 error:v28 destinations:v9 options:v10];

      [(WFRemoteExecutionSession *)self finish];
    }
  }
  else
  {
    BOOL v18 = +[WFRemoteExecutionRequest isUnsupportedVersionError:v14];
    char v19 = getWFRemoteExecutionLogObject();
    BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_FAULT);
    if (v18)
    {
      if (v20)
      {
        *(_DWORD *)buf = 136315138;
        id v36 = "-[WFRemoteExecutionIncomingAceCommandSession handleIncomingProtobuf:destinations:options:]";
        _os_log_impl(&dword_1C7F0A000, v19, OS_LOG_TYPE_FAULT, "%s Encountered unsupported version of ace command request", buf, 0xCu);
      }

      [(WFRemoteExecutionSession *)self setState:2];
      id v21 = [v8 data];
      id v33 = 0;
      uint64_t v22 = +[WFRemoteExecutionRequest identifierFromData:v21 error:&v33];
      id v23 = v33;

      v24 = getWFRemoteExecutionLogObject();
      v25 = v24;
      if (v22)
      {
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          id v36 = "-[WFRemoteExecutionIncomingAceCommandSession handleIncomingProtobuf:destinations:options:]";
          _os_log_impl(&dword_1C7F0A000, v25, OS_LOG_TYPE_DEFAULT, "%s Sending unsupported ace command request error back", buf, 0xCu);
        }

        [(WFRemoteExecutionIncomingAceCommandSession *)self sendResponseWithOriginatingRequestIdentifier:v22 aceCommandResponseDictionary:0 error:v14 destinations:v9 options:v10];
      }
      else
      {
        if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          id v36 = "-[WFRemoteExecutionIncomingAceCommandSession handleIncomingProtobuf:destinations:options:]";
          __int16 v37 = 2112;
          id v38 = v23;
          _os_log_impl(&dword_1C7F0A000, v25, OS_LOG_TYPE_FAULT, "%s Unable to read identifier from base request: %@, so unable to send unsupported version error back", buf, 0x16u);
        }
      }
    }
    else
    {
      if (v20)
      {
        *(_DWORD *)buf = 136315394;
        id v36 = "-[WFRemoteExecutionIncomingAceCommandSession handleIncomingProtobuf:destinations:options:]";
        __int16 v37 = 2114;
        id v38 = v14;
        _os_log_impl(&dword_1C7F0A000, v19, OS_LOG_TYPE_FAULT, "%s failed to read incoming ace command request from data, error: %{public}@", buf, 0x16u);
      }

      [(WFRemoteExecutionSession *)self setState:1];
      [(WFRemoteExecutionSession *)self finish];
    }
  }
}

void __90__WFRemoteExecutionIncomingAceCommandSession_handleIncomingProtobuf_destinations_options___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = *(void **)(a1 + 32);
  id v7 = a4;
  id v8 = a2;
  [v6 setState:201];
  id v9 = *(void **)(a1 + 32);
  id v11 = [*(id *)(a1 + 40) identifier];
  id v10 = [v8 dictionary];

  [v9 sendResponseWithOriginatingRequestIdentifier:v11 aceCommandResponseDictionary:v10 error:v7 destinations:*(void *)(a1 + 48) options:*(void *)(a1 + 56)];
}

@end