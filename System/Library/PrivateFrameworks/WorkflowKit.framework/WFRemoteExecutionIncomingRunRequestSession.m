@interface WFRemoteExecutionIncomingRunRequestSession
- (NSDictionary)lastKnownOptions;
- (NSSet)lastKnownDestinations;
- (WFOutOfProcessWorkflowController)controller;
- (double)timeoutLimitInSeconds;
- (void)finish;
- (void)finishWithError:(id)a3;
- (void)handleIncomingFileForRemoteExecutionWithURL:(id)a3 withIdentifier:(id)a4 metadata:(id)a5 destinations:(id)a6 options:(id)a7;
- (void)handleIncomingProtobuf:(id)a3 destinations:(id)a4 options:(id)a5;
- (void)handleTimeout;
- (void)handleUnsupportedVersionForRequestData:(id)a3 error:(id)a4 destinations:(id)a5 options:(id)a6;
- (void)sendResponse:(id)a3 toDestinations:(id)a4 options:(id)a5;
- (void)setController:(id)a3;
- (void)setLastKnownDestinations:(id)a3;
- (void)setLastKnownOptions:(id)a3;
@end

@implementation WFRemoteExecutionIncomingRunRequestSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastKnownOptions, 0);
  objc_storeStrong((id *)&self->_lastKnownDestinations, 0);
  objc_storeStrong((id *)&self->_controller, 0);
}

- (void)setLastKnownOptions:(id)a3
{
}

- (NSDictionary)lastKnownOptions
{
  return self->_lastKnownOptions;
}

- (void)setLastKnownDestinations:(id)a3
{
}

- (NSSet)lastKnownDestinations
{
  return self->_lastKnownDestinations;
}

- (void)setController:(id)a3
{
}

- (WFOutOfProcessWorkflowController)controller
{
  return self->_controller;
}

- (void)finishWithError:(id)a3
{
  id v13 = a3;
  [(WFRemoteExecutionIncomingRunRequestSession *)self finish];
  uint64_t v4 = [(WFRemoteExecutionIncomingRunRequestSession *)self lastKnownDestinations];
  if (v4)
  {
    v5 = (void *)v4;
    v6 = [(WFRemoteExecutionSession *)self request];

    if (v6)
    {
      v7 = [WFRemoteExecutionRunRequestResponse alloc];
      v8 = [(WFRemoteExecutionSession *)self request];
      v9 = [v8 identifier];
      v10 = [(WFRemoteExecutionRunRequestResponse *)v7 initWithRunRequestIdentifier:v9 variables:0 output:0 error:v13];

      v11 = [(WFRemoteExecutionIncomingRunRequestSession *)self lastKnownDestinations];
      v12 = [(WFRemoteExecutionIncomingRunRequestSession *)self lastKnownOptions];
      [(WFRemoteExecutionIncomingRunRequestSession *)self sendResponse:v10 toDestinations:v11 options:v12];
    }
  }
}

- (void)finish
{
  v3 = [(WFRemoteExecutionIncomingRunRequestSession *)self controller];
  [v3 stop];

  [(WFRemoteExecutionIncomingRunRequestSession *)self setController:0];
  v4.receiver = self;
  v4.super_class = (Class)WFRemoteExecutionIncomingRunRequestSession;
  [(WFRemoteExecutionSession *)&v4 finish];
}

- (double)timeoutLimitInSeconds
{
  return 120.0;
}

- (void)handleTimeout
{
  [(WFRemoteExecutionSession *)self setState:203];
  [(WFRemoteExecutionIncomingRunRequestSession *)self finish];
}

- (void)handleIncomingFileForRemoteExecutionWithURL:(id)a3 withIdentifier:(id)a4 metadata:(id)a5 destinations:(id)a6 options:(id)a7
{
  id v22 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  id v15 = a5;
  [(WFRemoteExecutionIncomingRunRequestSession *)self setLastKnownDestinations:v13];
  [(WFRemoteExecutionIncomingRunRequestSession *)self setLastKnownOptions:v14];
  v16 = [v15 objectForKey:@"version"];

  if (+[WFRemoteExecutionOutgoingFileSession supportsVersion:](WFRemoteExecutionOutgoingFileSession, "supportsVersion:", [v16 integerValue]))
  {
    v17 = [(WFRemoteExecutionIncomingRunRequestSession *)self controller];
    [(WFRemoteExecutionRunRequestResponse *)v17 handleIncomingFileForRemoteExecutionWithURL:v22 withIdentifier:v12];
  }
  else
  {
    [(WFRemoteExecutionSession *)self setState:2];
    v18 = [WFRemoteExecutionRunRequestResponse alloc];
    v19 = [(WFRemoteExecutionSession *)self request];
    v20 = [v19 identifier];
    v21 = +[WFRemoteExecutionRequest unsupportedVersionError];
    v17 = [(WFRemoteExecutionRunRequestResponse *)v18 initWithRunRequestIdentifier:v20 variables:0 output:0 error:v21];

    [(WFRemoteExecutionIncomingRunRequestSession *)self sendResponse:v17 toDestinations:v13 options:v14];
  }
}

- (void)sendResponse:(id)a3 toDestinations:(id)a4 options:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(WFRemoteExecutionSession *)self setState:201];
  id v11 = objc_alloc_init(MEMORY[0x1E4F94098]);
  id v29 = 0;
  char v12 = [v8 writeTo:v11 error:&v29];
  id v13 = v29;
  if (v12)
  {
    id v14 = objc_alloc(MEMORY[0x1E4F6AB78]);
    id v15 = [v11 immutableData];
    v16 = (void *)[v14 initWithProtobufData:v15 type:2 isResponse:0];

    [(WFRemoteExecutionSession *)self restartTimeout];
    v17 = [(WFRemoteExecutionSession *)self service];
    id v27 = 0;
    id v28 = 0;
    id v18 = v9;
    id v26 = v10;
    char v19 = [v17 sendProtobuf:v16 toDestinations:v9 priority:300 options:v10 identifier:&v28 error:&v27];
    id v20 = v28;
    id v21 = v27;

    if (v19)
    {
      [(WFRemoteExecutionSession *)self setIdsIdentifier:v20];
      uint64_t v22 = 202;
    }
    else
    {
      v25 = getWFRemoteExecutionLogObject();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v31 = "-[WFRemoteExecutionIncomingRunRequestSession sendResponse:toDestinations:options:]";
        __int16 v32 = 2114;
        v33 = self;
        __int16 v34 = 2114;
        id v35 = v21;
        _os_log_impl(&dword_1C7F0A000, v25, OS_LOG_TYPE_ERROR, "%s %{public}@ failed to send with error: %{public}@", buf, 0x20u);
      }

      uint64_t v22 = 1;
    }
    id v9 = v18;
    [(WFRemoteExecutionSession *)self setState:v22];
    [(WFRemoteExecutionIncomingRunRequestSession *)self finish];

    id v10 = v26;
  }
  else
  {
    v23 = getWFRemoteExecutionLogObject();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      v24 = [v8 identifier];
      *(_DWORD *)buf = 136315650;
      v31 = "-[WFRemoteExecutionIncomingRunRequestSession sendResponse:toDestinations:options:]";
      __int16 v32 = 2114;
      v33 = v24;
      __int16 v34 = 2114;
      id v35 = v13;
      _os_log_impl(&dword_1C7F0A000, v23, OS_LOG_TYPE_FAULT, "%s <%{public}@> failed to write protobuf with error: %{public}@", buf, 0x20u);
    }
    [(WFRemoteExecutionSession *)self setState:1];
    [(WFRemoteExecutionIncomingRunRequestSession *)self finish];
  }
}

- (void)handleUnsupportedVersionForRequestData:(id)a3 error:(id)a4 destinations:(id)a5 options:(id)a6
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (a3)
  {
    id v17 = 0;
    id v13 = +[WFRemoteExecutionRequest identifierFromData:a3 error:&v17];
    id v14 = v17;
    id v15 = getWFRemoteExecutionLogObject();
    v16 = (WFRemoteExecutionRunRequestResponse *)v15;
    if (v13)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        char v19 = "-[WFRemoteExecutionIncomingRunRequestSession handleUnsupportedVersionForRequestData:error:destinations:options:]";
        __int16 v20 = 2114;
        id v21 = v13;
        _os_log_impl(&dword_1C7F0A000, &v16->super.super, OS_LOG_TYPE_DEFAULT, "%s Sending unsupported version error back for request with identifier %{public}@", buf, 0x16u);
      }

      v16 = [[WFRemoteExecutionRunRequestResponse alloc] initWithRunRequestIdentifier:v13 variables:0 output:0 error:v10];
      [(WFRemoteExecutionIncomingRunRequestSession *)self sendResponse:v16 toDestinations:v11 options:v12];
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      char v19 = "-[WFRemoteExecutionIncomingRunRequestSession handleUnsupportedVersionForRequestData:error:destinations:options:]";
      __int16 v20 = 2112;
      id v21 = v14;
      _os_log_impl(&dword_1C7F0A000, &v16->super.super, OS_LOG_TYPE_FAULT, "%s Unable to read identifier from base request: %@, so unable to send unsupported version error back", buf, 0x16u);
    }
  }
}

- (void)handleIncomingProtobuf:(id)a3 destinations:(id)a4 options:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(WFRemoteExecutionIncomingRunRequestSession *)self setLastKnownDestinations:v9];
  [(WFRemoteExecutionIncomingRunRequestSession *)self setLastKnownOptions:v10];
  [(WFRemoteExecutionSession *)self restartTimeout];
  [(WFRemoteExecutionSession *)self setState:200];
  id v11 = [WFRemoteExecutionRunRequest alloc];
  id v12 = [v8 data];
  id v24 = 0;
  id v13 = [(WFRemoteExecutionRunRequest *)v11 initWithData:v12 error:&v24];
  id v14 = v24;

  if (v13)
  {
    [(WFRemoteExecutionSession *)self setRequest:v13];
    id v15 = (void *)[objc_alloc(MEMORY[0x1E4FB4820]) initWithEnvironment:4 runningContext:0 presentationMode:0];
    [v15 setDelegate:self];
    v16 = [v8 data];
    id v23 = 0;
    [v15 runActionWithRunRequestData:v16 error:&v23];
    id v17 = v23;

    objc_storeStrong((id *)&self->_controller, v15);
    if (v17)
    {
      id v18 = getWFRemoteExecutionLogObject();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        id v26 = "-[WFRemoteExecutionIncomingRunRequestSession handleIncomingProtobuf:destinations:options:]";
        __int16 v27 = 2114;
        id v28 = v17;
        _os_log_impl(&dword_1C7F0A000, v18, OS_LOG_TYPE_FAULT, "%s failed to start running in the out of process controller: %{public}@", buf, 0x16u);
      }

      [(WFRemoteExecutionSession *)self setState:1];
      [(WFRemoteExecutionIncomingRunRequestSession *)self finish];
    }
  }
  else
  {
    BOOL v19 = +[WFRemoteExecutionRequest isUnsupportedVersionError:v14];
    __int16 v20 = getWFRemoteExecutionLogObject();
    id v21 = v20;
    if (v19)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        id v26 = "-[WFRemoteExecutionIncomingRunRequestSession handleIncomingProtobuf:destinations:options:]";
        _os_log_impl(&dword_1C7F0A000, v21, OS_LOG_TYPE_ERROR, "%s Encountered unsupported version of run request", buf, 0xCu);
      }

      [(WFRemoteExecutionSession *)self setState:2];
      uint64_t v22 = [v8 data];
      [(WFRemoteExecutionIncomingRunRequestSession *)self handleUnsupportedVersionForRequestData:v22 error:v14 destinations:v9 options:v10];
    }
    else
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        id v26 = "-[WFRemoteExecutionIncomingRunRequestSession handleIncomingProtobuf:destinations:options:]";
        __int16 v27 = 2114;
        id v28 = v14;
        _os_log_impl(&dword_1C7F0A000, v21, OS_LOG_TYPE_FAULT, "%s failed to read run request from data, error: %{public}@", buf, 0x16u);
      }

      [(WFRemoteExecutionSession *)self setState:1];
    }
  }
}

@end