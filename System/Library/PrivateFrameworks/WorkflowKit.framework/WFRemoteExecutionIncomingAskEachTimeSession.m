@interface WFRemoteExecutionIncomingAskEachTimeSession
- (NSDictionary)lastKnownOptions;
- (NSSet)lastKnownDestinations;
- (id)missingParameterError;
- (void)finishWithError:(id)a3;
- (void)handleIncomingProtobuf:(id)a3 currentlyActiveSessions:(id)a4 responseDestinations:(id)a5 responseOptions:(id)a6;
- (void)handleTimeout;
- (void)sendResponse:(id)a3 destinations:(id)a4 options:(id)a5;
- (void)setLastKnownDestinations:(id)a3;
- (void)setLastKnownOptions:(id)a3;
@end

@implementation WFRemoteExecutionIncomingAskEachTimeSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastKnownOptions, 0);
  objc_storeStrong((id *)&self->_lastKnownDestinations, 0);
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

- (id)missingParameterError
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28C58];
  v8[0] = *MEMORY[0x1E4F28588];
  v3 = WFLocalizedString(@"Could Not Run Action");
  v9[0] = v3;
  v8[1] = *MEMORY[0x1E4F28568];
  v4 = WFLocalizedString(@"An error occurred while executing an action on your iPhone");
  v9[1] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  v6 = [v2 errorWithDomain:@"WFRemoteExecutionCoordinatorErrorDomain" code:3 userInfo:v5];

  return v6;
}

- (void)finishWithError:(id)a3
{
  id v13 = a3;
  [(WFRemoteExecutionSession *)self finish];
  uint64_t v4 = [(WFRemoteExecutionIncomingAskEachTimeSession *)self lastKnownDestinations];
  if (v4)
  {
    v5 = (void *)v4;
    v6 = [(WFRemoteExecutionSession *)self request];

    if (v6)
    {
      v7 = [WFRemoteExecutionAskEachTimeRequestResponse alloc];
      v8 = [(WFRemoteExecutionSession *)self request];
      v9 = [v8 identifier];
      v10 = [(WFRemoteExecutionAskEachTimeRequestResponse *)v7 initWithOriginatingRequestIdentifier:v9 inputtedStates:0 error:v13];

      v11 = [(WFRemoteExecutionIncomingAskEachTimeSession *)self lastKnownDestinations];
      v12 = [(WFRemoteExecutionIncomingAskEachTimeSession *)self lastKnownOptions];
      [(WFRemoteExecutionIncomingAskEachTimeSession *)self sendResponse:v10 destinations:v11 options:v12];
    }
  }
}

- (void)handleTimeout
{
  [(WFRemoteExecutionSession *)self setState:203];
  [(WFRemoteExecutionSession *)self finish];
}

- (void)sendResponse:(id)a3 destinations:(id)a4 options:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"WFRemoteExecutionIncomingAskEachTimeSession.m", 137, @"Invalid parameter not satisfying: %@", @"response" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v27 = [MEMORY[0x1E4F28B00] currentHandler];
  [v27 handleFailureInMethod:a2, self, @"WFRemoteExecutionIncomingAskEachTimeSession.m", 138, @"Invalid parameter not satisfying: %@", @"destinations" object file lineNumber description];

LABEL_3:
  [(WFRemoteExecutionIncomingAskEachTimeSession *)self setLastKnownDestinations:v10];
  [(WFRemoteExecutionIncomingAskEachTimeSession *)self setLastKnownOptions:v11];
  id v12 = objc_alloc_init(MEMORY[0x1E4F94098]);
  id v31 = 0;
  char v13 = [v9 writeTo:v12 error:&v31];
  id v14 = v31;
  v15 = v14;
  if (v13)
  {
    id v28 = v14;
    id v16 = objc_alloc(MEMORY[0x1E4F6AB78]);
    v17 = [v12 immutableData];
    v18 = (void *)[v16 initWithProtobufData:v17 type:6 isResponse:0];

    v19 = [(WFRemoteExecutionSession *)self service];
    id v29 = 0;
    id v30 = 0;
    char v20 = [v19 sendProtobuf:v18 toDestinations:v10 priority:300 options:v11 identifier:&v30 error:&v29];
    id v21 = v30;
    id v22 = v29;

    if (v20)
    {
      [(WFRemoteExecutionSession *)self setIdsIdentifier:v21];
      uint64_t v23 = 202;
    }
    else
    {
      v25 = getWFRemoteExecutionLogObject();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v33 = "-[WFRemoteExecutionIncomingAskEachTimeSession sendResponse:destinations:options:]";
        __int16 v34 = 2114;
        id v35 = v22;
        _os_log_impl(&dword_1C7F0A000, v25, OS_LOG_TYPE_FAULT, "%s Failed to send ask each time request response: %{public}@", buf, 0x16u);
      }

      uint64_t v23 = 1;
    }
    v15 = v28;
    [(WFRemoteExecutionSession *)self setState:v23];
  }
  else
  {
    v24 = getWFRemoteExecutionLogObject();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v33 = "-[WFRemoteExecutionIncomingAskEachTimeSession sendResponse:destinations:options:]";
      __int16 v34 = 2114;
      id v35 = v15;
      _os_log_impl(&dword_1C7F0A000, v24, OS_LOG_TYPE_FAULT, "%s Failed to write response for ask each time request: %{public}@", buf, 0x16u);
    }

    [(WFRemoteExecutionSession *)self setState:1];
  }
}

- (void)handleIncomingProtobuf:(id)a3 currentlyActiveSessions:(id)a4 responseDestinations:(id)a5 responseOptions:(id)a6
{
  uint64_t v131 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11)
  {
    v90 = [MEMORY[0x1E4F28B00] currentHandler];
    [v90 handleFailureInMethod:a2, self, @"WFRemoteExecutionIncomingAskEachTimeSession.m", 35, @"Invalid parameter not satisfying: %@", @"protobuf" object file lineNumber description];

    if (v13) {
      goto LABEL_3;
    }
LABEL_69:
    v91 = [MEMORY[0x1E4F28B00] currentHandler];
    [v91 handleFailureInMethod:a2, self, @"WFRemoteExecutionIncomingAskEachTimeSession.m", 36, @"Invalid parameter not satisfying: %@", @"destinations" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v13) {
    goto LABEL_69;
  }
LABEL_3:
  [(WFRemoteExecutionIncomingAskEachTimeSession *)self setLastKnownDestinations:v13];
  [(WFRemoteExecutionIncomingAskEachTimeSession *)self setLastKnownOptions:v14];
  [(WFRemoteExecutionSession *)self setState:200];
  v15 = [WFRemoteExecutionAskEachTimeRequest alloc];
  id v16 = [v11 data];
  id v119 = 0;
  uint64_t v17 = [(WFRemoteExecutionAskEachTimeRequest *)v15 initWithData:v16 error:&v119];
  id v18 = v119;

  v100 = (void *)v17;
  if (!v17)
  {
    BOOL v69 = +[WFRemoteExecutionRequest isUnsupportedVersionError:v18];
    v70 = getWFRemoteExecutionLogObject();
    v71 = v70;
    if (v69)
    {
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v124 = "-[WFRemoteExecutionIncomingAskEachTimeSession handleIncomingProtobuf:currentlyActiveSessions:responseDest"
               "inations:responseOptions:]";
        _os_log_impl(&dword_1C7F0A000, v71, OS_LOG_TYPE_ERROR, "%s Encountered unsupported version of ask each time request", buf, 0xCu);
      }

      [(WFRemoteExecutionSession *)self setState:2];
      v72 = [v11 data];
      id v118 = 0;
      v73 = +[WFRemoteExecutionRequest identifierFromData:v72 error:&v118];
      id v74 = v118;

      v75 = getWFRemoteExecutionLogObject();
      v76 = v75;
      if (v73)
      {
        if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v124 = "-[WFRemoteExecutionIncomingAskEachTimeSession handleIncomingProtobuf:currentlyActiveSessions:responseDe"
                 "stinations:responseOptions:]";
          _os_log_impl(&dword_1C7F0A000, v76, OS_LOG_TYPE_DEFAULT, "%s Sending unsupported version of ask each time request back", buf, 0xCu);
        }

        v77 = [[WFRemoteExecutionAskEachTimeRequestResponse alloc] initWithOriginatingRequestIdentifier:v73 inputtedStates:0 error:v18];
        [(WFRemoteExecutionIncomingAskEachTimeSession *)self sendResponse:v77 destinations:v13 options:v14];
      }
      else
      {
        if (os_log_type_enabled(v75, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          v124 = "-[WFRemoteExecutionIncomingAskEachTimeSession handleIncomingProtobuf:currentlyActiveSessions:responseDe"
                 "stinations:responseOptions:]";
          __int16 v125 = 2112;
          id v126 = v74;
          _os_log_impl(&dword_1C7F0A000, v76, OS_LOG_TYPE_FAULT, "%s Unable to read identifier from base request: %@, so unable to send unsupported version error back", buf, 0x16u);
        }

        [(WFRemoteExecutionSession *)self finish];
      }
    }
    else
    {
      if (os_log_type_enabled(v70, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v124 = "-[WFRemoteExecutionIncomingAskEachTimeSession handleIncomingProtobuf:currentlyActiveSessions:responseDest"
               "inations:responseOptions:]";
        __int16 v125 = 2114;
        id v126 = v18;
        _os_log_impl(&dword_1C7F0A000, v71, OS_LOG_TYPE_FAULT, "%s Failed to read incoming ask each time protobuf: %{public}@", buf, 0x16u);
      }

      [(WFRemoteExecutionSession *)self setState:1];
    }
    goto LABEL_67;
  }
  id v96 = v18;
  v97 = v14;
  v93 = v13;
  id v94 = v12;
  id v95 = v11;
  long long v116 = 0u;
  long long v117 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  id v19 = v12;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v114 objects:v122 count:16];
  if (!v20)
  {

    goto LABEL_52;
  }
  uint64_t v21 = v20;
  v92 = self;
  v99 = 0;
  uint64_t v22 = *(void *)v115;
  do
  {
    for (uint64_t i = 0; i != v21; ++i)
    {
      if (*(void *)v115 != v22) {
        objc_enumerationMutation(v19);
      }
      v24 = *(void **)(*((void *)&v114 + 1) + 8 * i);
      uint64_t v25 = objc_opt_class();
      id v26 = v24;
      if (v26)
      {
        if (objc_opt_isKindOfClass())
        {
          v27 = [v26 request];
          id v28 = [v27 identifier];
          id v29 = [v100 associatedRunRequestIdentifier];
          int v30 = [v28 isEqualToString:v29];

          if (!v30) {
            goto LABEL_17;
          }
          id v31 = v26;
          id v26 = v99;
          v99 = v31;
        }
        else
        {
          v32 = getWFGeneralLogObject();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
          {
            v33 = objc_opt_class();
            *(_DWORD *)buf = 136315906;
            v124 = "WFEnforceClass";
            __int16 v125 = 2114;
            id v126 = v26;
            __int16 v127 = 2114;
            v128 = v33;
            __int16 v129 = 2114;
            uint64_t v130 = v25;
            id v34 = v33;
            _os_log_impl(&dword_1C7F0A000, v32, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);
          }
          id v31 = 0;
        }

        id v26 = v31;
      }
LABEL_17:
    }
    uint64_t v21 = [v19 countByEnumeratingWithState:&v114 objects:v122 count:16];
  }
  while (v21);

  if (!v99)
  {
LABEL_52:
    [(WFRemoteExecutionSession *)self setState:-420];
    [(WFRemoteExecutionSession *)self finish];
    id v12 = v94;
    id v11 = v95;
    id v13 = v93;
    goto LABEL_66;
  }
  [(WFRemoteExecutionSession *)self setRequest:v100];
  id v35 = +[WFActionRegistry sharedRegistry];
  uint64_t v36 = [v100 actionIdentifier];
  v37 = [v100 actionSerializedParameters];
  v38 = [v35 createActionWithIdentifier:v36 serializedParameters:v37];

  [v38 initializeParametersIfNecessary];
  [v100 inflateParameterStatesWithAction:v38];
  v39 = [v100 parameterKeys];
  id v40 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  long long v110 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  id v41 = v39;
  uint64_t v42 = [v41 countByEnumeratingWithState:&v110 objects:v121 count:16];
  obuint64_t j = v41;
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v111;
    while (2)
    {
      for (uint64_t j = 0; j != v43; ++j)
      {
        if (*(void *)v111 != v44) {
          objc_enumerationMutation(obj);
        }
        v46 = *(void **)(*((void *)&v110 + 1) + 8 * j);
        v47 = [v38 parameterForKey:v46];
        v48 = [v100 possibleStatesByParameterKey];
        v49 = [v48 allKeys];
        int v50 = [v49 containsObject:v46];

        if (v50)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
          {
            id v51 = v47;
            v52 = [v100 possibleStatesByParameterKey];
            v53 = [v52 objectForKey:v46];
            [v51 setPossibleStatesFromRemoteSource:v53];
          }
        }
        if (!v47)
        {
          v78 = getWFRemoteExecutionLogObject();
          if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
          {
            v79 = [v38 parameters];
            *(_DWORD *)buf = 136315650;
            v124 = "-[WFRemoteExecutionIncomingAskEachTimeSession handleIncomingProtobuf:currentlyActiveSessions:response"
                   "Destinations:responseOptions:]";
            __int16 v125 = 2114;
            id v126 = v46;
            __int16 v127 = 2114;
            v128 = v79;
            _os_log_impl(&dword_1C7F0A000, v78, OS_LOG_TYPE_ERROR, "%s Ask Each Time request needs to resolve parameter (%{public}@) but the parameter is nil. action parameters: %{public}@", buf, 0x20u);
          }
          [(WFRemoteExecutionSession *)v92 setState:1];
          v80 = [WFRemoteExecutionAskEachTimeRequestResponse alloc];
          v81 = [v100 identifier];
          v82 = [(WFRemoteExecutionIncomingAskEachTimeSession *)v92 missingParameterError];
          v83 = [(WFRemoteExecutionAskEachTimeRequestResponse *)v80 initWithOriginatingRequestIdentifier:v81 inputtedStates:0 error:v82];

          id v13 = v93;
          [(WFRemoteExecutionIncomingAskEachTimeSession *)v92 sendResponse:v83 destinations:v93 options:v97];

          v84 = obj;
          id v56 = obj;
          id v12 = v94;
          id v11 = v95;
          v63 = v99;
          goto LABEL_65;
        }
        [v40 addObject:v47];
      }
      id v41 = obj;
      uint64_t v43 = [obj countByEnumeratingWithState:&v110 objects:v121 count:16];
      if (v43) {
        continue;
      }
      break;
    }
  }

  [(WFRemoteExecutionSession *)v92 setState:201];
  v54 = [v99 userInterface];
  int v55 = [v54 isRunningWithSiriUI];

  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  id v56 = v40;
  uint64_t v57 = [v56 countByEnumeratingWithState:&v106 objects:v120 count:16];
  id v13 = v93;
  if (v57)
  {
    uint64_t v58 = v57;
    uint64_t v59 = *(void *)v107;
    while (2)
    {
      for (uint64_t k = 0; k != v58; ++k)
      {
        if (*(void *)v107 != v59) {
          objc_enumerationMutation(v56);
        }
        uint64_t v61 = *(void *)(*((void *)&v106 + 1) + 8 * k);
        v62 = [v99 parameterInputProvider];
        LODWORD(v61) = [v62 action:v38 canProvideInputForParameter:v61] ^ 1 | v55;

        if (v61 == 1)
        {
          v85 = [WFRemoteExecutionAskEachTimeRequestResponse alloc];
          v86 = [v100 identifier];
          v87 = [MEMORY[0x1E4F28C58] userCancelledError];
          v88 = [(WFRemoteExecutionAskEachTimeRequestResponse *)v85 initWithOriginatingRequestIdentifier:v86 inputtedStates:0 error:v87];

          [(WFRemoteExecutionIncomingAskEachTimeSession *)v92 sendResponse:v88 destinations:v93 options:v97];
          v89 = [MEMORY[0x1E4F28C58] wfUnsupportedUserInterfaceError];
          v63 = v99;
          [v99 finishWithError:v89];

          goto LABEL_64;
        }
      }
      uint64_t v58 = [v56 countByEnumeratingWithState:&v106 objects:v120 count:16];
      if (v58) {
        continue;
      }
      break;
    }
  }

  v63 = v99;
  v64 = [v99 parameterInputProvider];
  uint64_t v65 = [v100 parameterKeysAndStates];
  v66 = (void *)v65;
  uint64_t v67 = MEMORY[0x1E4F1CC08];
  if (v65) {
    uint64_t v68 = v65;
  }
  else {
    uint64_t v68 = MEMORY[0x1E4F1CC08];
  }
  v101[0] = MEMORY[0x1E4F143A8];
  v101[1] = 3221225472;
  v101[2] = __131__WFRemoteExecutionIncomingAskEachTimeSession_handleIncomingProtobuf_currentlyActiveSessions_responseDestinations_responseOptions___block_invoke;
  v101[3] = &unk_1E6554CB8;
  id v102 = v100;
  v103 = v92;
  id v104 = v93;
  id v105 = v97;
  [v64 action:v38 provideInputForParameters:v56 withDefaultStates:v68 prompts:v67 completionHandler:v101];

  id v56 = v102;
LABEL_64:
  id v12 = v94;
  id v11 = v95;
  v84 = obj;
LABEL_65:

LABEL_66:
  id v18 = v96;
  id v14 = v97;
LABEL_67:
}

void __131__WFRemoteExecutionIncomingAskEachTimeSession_handleIncomingProtobuf_currentlyActiveSessions_responseDestinations_responseOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  v7 = [WFRemoteExecutionAskEachTimeRequestResponse alloc];
  v8 = [*(id *)(a1 + 32) identifier];
  id v9 = [(WFRemoteExecutionAskEachTimeRequestResponse *)v7 initWithOriginatingRequestIdentifier:v8 inputtedStates:v6 error:v5];

  [*(id *)(a1 + 40) sendResponse:v9 destinations:*(void *)(a1 + 48) options:*(void *)(a1 + 56)];
}

@end