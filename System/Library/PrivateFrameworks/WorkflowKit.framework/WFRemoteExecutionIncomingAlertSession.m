@interface WFRemoteExecutionIncomingAlertSession
- (NSDictionary)lastKnownOptions;
- (NSSet)lastKnownDestinations;
- (double)timeoutLimitInSeconds;
- (void)finishWithError:(id)a3;
- (void)handleIncomingProtobuf:(id)a3 currentlyActiveSessions:(id)a4 responseDestinations:(id)a5 options:(id)a6;
- (void)handleTimeout;
- (void)sendSelectedButton:(id)a3 forAlertWithIdentifier:(id)a4 error:(id)a5 destinations:(id)a6 options:(id)a7;
- (void)setLastKnownDestinations:(id)a3;
- (void)setLastKnownOptions:(id)a3;
@end

@implementation WFRemoteExecutionIncomingAlertSession

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

- (double)timeoutLimitInSeconds
{
  return 30.0;
}

- (void)handleTimeout
{
  [(WFRemoteExecutionSession *)self setState:203];
  [(WFRemoteExecutionSession *)self finish];
}

- (void)finishWithError:(id)a3
{
  id v9 = a3;
  [(WFRemoteExecutionSession *)self finish];
  v4 = [(WFRemoteExecutionIncomingAlertSession *)self lastKnownDestinations];

  if (v4)
  {
    v5 = [(WFRemoteExecutionSession *)self request];
    v6 = [v5 identifier];
    v7 = [(WFRemoteExecutionIncomingAlertSession *)self lastKnownDestinations];
    v8 = [(WFRemoteExecutionIncomingAlertSession *)self lastKnownOptions];
    [(WFRemoteExecutionIncomingAlertSession *)self sendSelectedButton:0 forAlertWithIdentifier:v6 error:v9 destinations:v7 options:v8];
  }
}

- (void)sendSelectedButton:(id)a3 forAlertWithIdentifier:(id)a4 error:(id)a5 destinations:(id)a6 options:(id)a7
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (v14)
  {
    if (v16) {
      goto LABEL_3;
    }
  }
  else
  {
    [MEMORY[0x1E4F28B00] currentHandler];
    v34 = id v33 = v17;
    [v34 handleFailureInMethod:a2, self, @"WFRemoteExecutionIncomingAlertSession.m", 111, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

    id v17 = v33;
    if (v16) {
      goto LABEL_3;
    }
  }
  [MEMORY[0x1E4F28B00] currentHandler];
  v36 = id v35 = v17;
  [v36 handleFailureInMethod:a2, self, @"WFRemoteExecutionIncomingAlertSession.m", 112, @"Invalid parameter not satisfying: %@", @"destinations" object file lineNumber description];

  id v17 = v35;
LABEL_3:
  [(WFRemoteExecutionSession *)self setState:201];
  v18 = [[WFRemoteExecutionAlertRequestResponse alloc] initWithSelectedButton:v13 requestIdentifier:v14 error:v15];
  id v19 = objc_alloc_init(MEMORY[0x1E4F94098]);
  id v43 = 0;
  BOOL v20 = [(WFRemoteExecutionRequest *)v18 writeTo:v19 error:&v43];
  id v21 = v43;
  if (v20)
  {
    id v40 = v17;
    id v37 = v15;
    id v22 = objc_alloc(MEMORY[0x1E4F6AB78]);
    v23 = [v19 immutableData];
    v39 = (void *)[v22 initWithProtobufData:v23 type:4 isResponse:0];

    v24 = getWFRemoteExecutionLogObject();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v25 = [(WFRemoteExecutionRequest *)v18 identifier];
      *(_DWORD *)buf = 136315906;
      v45 = "-[WFRemoteExecutionIncomingAlertSession sendSelectedButton:forAlertWithIdentifier:error:destinations:options:]";
      __int16 v46 = 2114;
      id v47 = v25;
      __int16 v48 = 2114;
      id v49 = v14;
      __int16 v50 = 2114;
      id v51 = v13;
      _os_log_impl(&dword_1C7F0A000, v24, OS_LOG_TYPE_INFO, "%s <%{public}@> sending response for alert (%{public}@) with selected button: %{public}@", buf, 0x2Au);
    }
    id v38 = v13;

    [(WFRemoteExecutionSession *)self restartTimeout];
    v26 = [(WFRemoteExecutionSession *)self service];
    id v41 = 0;
    id v42 = 0;
    char v27 = [v26 sendProtobuf:v39 toDestinations:v16 priority:300 options:v40 identifier:&v42 error:&v41];
    id v28 = v42;
    id v29 = v41;

    if (v27)
    {
      [(WFRemoteExecutionSession *)self setIdsIdentifier:v28];
      [(WFRemoteExecutionSession *)self setState:202];
      [(WFRemoteExecutionSession *)self finish];
    }
    else
    {
      v31 = getWFRemoteExecutionLogObject();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
      {
        v32 = [(WFRemoteExecutionRequest *)v18 identifier];
        *(_DWORD *)buf = 136315650;
        v45 = "-[WFRemoteExecutionIncomingAlertSession sendSelectedButton:forAlertWithIdentifier:error:destinations:options:]";
        __int16 v46 = 2114;
        id v47 = v32;
        __int16 v48 = 2114;
        id v49 = v29;
        _os_log_impl(&dword_1C7F0A000, v31, OS_LOG_TYPE_FAULT, "%s <%{public}@> Failed to send alert response: %{public}@", buf, 0x20u);
      }
      [(WFRemoteExecutionSession *)self setState:1];
    }

    id v15 = v37;
    id v13 = v38;
    id v17 = v40;
  }
  else
  {
    v30 = getWFRemoteExecutionLogObject();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v45 = "-[WFRemoteExecutionIncomingAlertSession sendSelectedButton:forAlertWithIdentifier:error:destinations:options:]";
      __int16 v46 = 2114;
      id v47 = v21;
      _os_log_impl(&dword_1C7F0A000, v30, OS_LOG_TYPE_FAULT, "%s failed to write alert response protobuf: %{public}@", buf, 0x16u);
    }

    [(WFRemoteExecutionSession *)self setState:1];
  }
}

- (void)handleIncomingProtobuf:(id)a3 currentlyActiveSessions:(id)a4 responseDestinations:(id)a5 options:(id)a6
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  [(WFRemoteExecutionIncomingAlertSession *)self setLastKnownDestinations:v12];
  [(WFRemoteExecutionIncomingAlertSession *)self setLastKnownOptions:v13];
  v54 = self;
  [(WFRemoteExecutionSession *)self setState:200];
  id v14 = objc_alloc(MEMORY[0x1E4F94090]);
  id v15 = [v10 data];
  id v16 = (void *)[v14 initWithData:v15];

  id v65 = 0;
  v56 = objc_alloc_init(WFRemoteExecutionAlertRequest);
  LOBYTE(v14) = [(WFRemoteExecutionRequest *)v56 readFrom:v16 error:&v65];
  id v17 = v65;
  if (v14) {
    goto LABEL_6;
  }
  BOOL v18 = +[WFRemoteExecutionRequest isUnsupportedVersionError:v17];
  id v19 = getWFRemoteExecutionLogObject();
  BOOL v20 = v19;
  if (v18)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v68 = "-[WFRemoteExecutionIncomingAlertSession handleIncomingProtobuf:currentlyActiveSessions:responseDestinations:options:]";
      _os_log_impl(&dword_1C7F0A000, v20, OS_LOG_TYPE_ERROR, "%s Encountered unsupported version of an alert request", buf, 0xCu);
    }

    [(WFRemoteExecutionSession *)v54 setState:2];
LABEL_6:
    id v53 = v17;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v21 = v11;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v61 objects:v66 count:16];
    if (!v22)
    {

      goto LABEL_25;
    }
    uint64_t v23 = v22;
    uint64_t v52 = v16;
    id v49 = v13;
    __int16 v50 = v12;
    id v51 = v11;
    v55 = 0;
    uint64_t v24 = *(void *)v62;
LABEL_8:
    uint64_t v25 = 0;
    while (1)
    {
      if (*(void *)v62 != v24) {
        objc_enumerationMutation(v21);
      }
      v26 = *(void **)(*((void *)&v61 + 1) + 8 * v25);
      uint64_t v27 = objc_opt_class();
      id v28 = v26;
      if (!v28) {
        goto LABEL_19;
      }
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      id v29 = [v28 request];
      v30 = [v29 identifier];
      v31 = [(WFRemoteExecutionAlertRequest *)v56 associatedRunRequestIdentifier];
      int v32 = [v30 isEqualToString:v31];

      if (v32)
      {
        id v33 = v28;
        id v28 = v55;
        v55 = v33;
LABEL_18:

        id v28 = v33;
      }
LABEL_19:

      if (v23 == ++v25)
      {
        uint64_t v23 = [v21 countByEnumeratingWithState:&v61 objects:v66 count:16];
        if (!v23)
        {

          id v11 = v51;
          id v13 = v49;
          id v12 = v50;
          id v16 = v52;
          id v37 = v55;
          if (v55)
          {
            id v17 = v53;
            if ([(WFRemoteExecutionSession *)v54 state] == 2)
            {
              [v55 finishWithError:v53];
            }
            else if (VCIsDeviceLocked())
            {
              [(WFRemoteExecutionSession *)v54 setState:1];
              id v38 = getWFRemoteExecutionLogObject();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315138;
                v68 = "-[WFRemoteExecutionIncomingAlertSession handleIncomingProtobuf:currentlyActiveSessions:responseDes"
                      "tinations:options:]";
                _os_log_impl(&dword_1C7F0A000, v38, OS_LOG_TYPE_ERROR, "%s Found a outgoing run request session to show the alert in, but the device is locked", buf, 0xCu);
              }

              v39 = [MEMORY[0x1E4F28C58] wfUnsupportedUserInterfaceError];
              [v55 finishWithError:v39];
            }
            else
            {
              v57[0] = MEMORY[0x1E4F143A8];
              v57[1] = 3221225472;
              v57[2] = __117__WFRemoteExecutionIncomingAlertSession_handleIncomingProtobuf_currentlyActiveSessions_responseDestinations_options___block_invoke;
              v57[3] = &unk_1E65511E8;
              v57[4] = v54;
              id v40 = v56;
              v58 = v40;
              id v41 = v50;
              id v59 = v41;
              id v42 = v49;
              id v60 = v42;
              [(WFRemoteExecutionAlertRequest *)v40 inflateAlertWithBlock:v57];
              [(WFRemoteExecutionSession *)v54 setRequest:v40];
              id v43 = [v55 userInterface];
              int v44 = [v43 isRunningWithSiriUI];

              if (v44)
              {
                v45 = [(WFRemoteExecutionRequest *)v40 identifier];
                __int16 v46 = [MEMORY[0x1E4F28C58] userCancelledError];
                [(WFRemoteExecutionIncomingAlertSession *)v54 sendSelectedButton:0 forAlertWithIdentifier:v45 error:v46 destinations:v41 options:v42];

                id v47 = [MEMORY[0x1E4F28C58] wfUnsupportedUserInterfaceError];
                id v37 = v55;
                [v55 finishWithError:v47];
              }
              else
              {
                id v37 = v55;
                id v47 = [v55 userInterface];
                __int16 v48 = [(WFRemoteExecutionAlertRequest *)v40 alert];
                [v47 presentAlert:v48];
              }
              id v16 = v52;
            }
            goto LABEL_38;
          }
LABEL_25:
          [(WFRemoteExecutionSession *)v54 setState:-420];
          id v17 = v53;
          goto LABEL_38;
        }
        goto LABEL_8;
      }
    }
    v34 = getWFGeneralLogObject();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
    {
      id v35 = objc_opt_class();
      *(_DWORD *)buf = 136315906;
      v68 = "WFEnforceClass";
      __int16 v69 = 2114;
      id v70 = v28;
      __int16 v71 = 2114;
      v72 = v35;
      __int16 v73 = 2114;
      uint64_t v74 = v27;
      id v36 = v35;
      _os_log_impl(&dword_1C7F0A000, v34, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);
    }
    id v33 = 0;
    goto LABEL_18;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    v68 = "-[WFRemoteExecutionIncomingAlertSession handleIncomingProtobuf:currentlyActiveSessions:responseDestinations:options:]";
    __int16 v69 = 2114;
    id v70 = v17;
    _os_log_impl(&dword_1C7F0A000, v20, OS_LOG_TYPE_FAULT, "%s failed to read alert request: %{public}@", buf, 0x16u);
  }

LABEL_38:
}

id __117__WFRemoteExecutionIncomingAlertSession_handleIncomingProtobuf_currentlyActiveSessions_responseDestinations_options___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = objc_msgSend(MEMORY[0x1E4F5A768], "alertWithPreferredStyle:", (int)objc_msgSend(v3, "preferredStyle"));
  v5 = [v3 title];
  [v4 setTitle:v5];

  v6 = [v3 message];
  id v19 = v4;
  [v4 setMessage:v6];

  uint64_t v22 = objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  BOOL v20 = v3;
  id obj = [v3 buttons];
  uint64_t v7 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v12 = (void *)MEMORY[0x1E4F5A770];
        id v13 = [v11 title];
        uint64_t v14 = (int)[v11 style];
        uint64_t v15 = [v11 preferred];
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __117__WFRemoteExecutionIncomingAlertSession_handleIncomingProtobuf_currentlyActiveSessions_responseDestinations_options___block_invoke_2;
        v23[3] = &unk_1E65535A0;
        id v16 = *(void **)(a1 + 40);
        v23[4] = *(void *)(a1 + 32);
        v23[5] = v11;
        id v24 = v16;
        id v25 = *(id *)(a1 + 48);
        id v26 = *(id *)(a1 + 56);
        id v17 = [v12 buttonWithTitle:v13 style:v14 preferred:v15 handler:v23];

        [v22 addObject:v17];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v8);
  }

  [v19 setButtons:v22];
  return v19;
}

void __117__WFRemoteExecutionIncomingAlertSession_handleIncomingProtobuf_currentlyActiveSessions_responseDestinations_options___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) title];
  id v3 = [*(id *)(a1 + 48) identifier];
  [v2 sendSelectedButton:v4 forAlertWithIdentifier:v3 error:0 destinations:*(void *)(a1 + 56) options:*(void *)(a1 + 64)];
}

@end