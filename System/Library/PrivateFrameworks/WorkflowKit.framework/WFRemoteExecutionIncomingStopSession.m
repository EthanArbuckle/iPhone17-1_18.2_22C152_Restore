@interface WFRemoteExecutionIncomingStopSession
- (void)handleIncomingProtobuf:(id)a3 currentlyActiveSessions:(id)a4;
@end

@implementation WFRemoteExecutionIncomingStopSession

- (void)handleIncomingProtobuf:(id)a3 currentlyActiveSessions:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(WFRemoteExecutionSession *)self setState:200];
  id v8 = objc_alloc(MEMORY[0x1E4F94090]);
  v9 = [v6 data];
  v10 = (void *)[v8 initWithData:v9];

  v11 = objc_alloc_init(WFRemoteExecutionStopRequest);
  id v36 = 0;
  LOBYTE(v8) = [(WFRemoteExecutionRequest *)v11 readFrom:v10 error:&v36];
  id v12 = v36;
  if (v8)
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v13 = v7;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      id v27 = v12;
      v28 = v10;
      v29 = self;
      id v30 = v7;
      id v31 = v6;
      uint64_t v16 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v33 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          v19 = [v18 request];
          v20 = [v19 identifier];
          v21 = [(WFRemoteExecutionStopRequest *)v11 requestIdentifier];
          int v22 = [v20 isEqualToString:v21];

          if (v22)
          {
            v23 = getWFRemoteExecutionLogObject();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              v39 = "-[WFRemoteExecutionIncomingStopSession handleIncomingProtobuf:currentlyActiveSessions:]";
              __int16 v40 = 2112;
              id v41 = v18;
              _os_log_impl(&dword_1C7F0A000, v23, OS_LOG_TYPE_DEFAULT, "%s Found a match for the stop request; stopping session: %@",
                buf,
                0x16u);
            }

            [v18 finish];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v15);
      id v7 = v30;
      id v6 = v31;
      v10 = v28;
      self = v29;
      id v12 = v27;
    }
    uint64_t v24 = 202;
  }
  else
  {
    BOOL v25 = +[WFRemoteExecutionRequest isUnsupportedVersionError:v12];
    v26 = getWFRemoteExecutionLogObject();
    v13 = v26;
    if (v25)
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v39 = "-[WFRemoteExecutionIncomingStopSession handleIncomingProtobuf:currentlyActiveSessions:]";
        _os_log_impl(&dword_1C7F0A000, v13, OS_LOG_TYPE_ERROR, "%s Encountered unsupported version of stop request response", buf, 0xCu);
      }
      uint64_t v24 = 2;
    }
    else
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v39 = "-[WFRemoteExecutionIncomingStopSession handleIncomingProtobuf:currentlyActiveSessions:]";
        __int16 v40 = 2114;
        id v41 = v12;
        _os_log_impl(&dword_1C7F0A000, v13, OS_LOG_TYPE_FAULT, "%s failed to read stop request: %{public}@", buf, 0x16u);
      }
      uint64_t v24 = 1;
    }
  }

  [(WFRemoteExecutionSession *)self setState:v24];
}

@end