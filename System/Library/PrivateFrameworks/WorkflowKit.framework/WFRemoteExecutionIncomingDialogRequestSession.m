@interface WFRemoteExecutionIncomingDialogRequestSession
- (WFRemoteExecutionDialogRequestResponse)response;
- (double)timeoutLimitInSeconds;
- (void)finishWithError:(id)a3;
- (void)handleIncomingProtobuf:(id)a3 currentlyActiveSessions:(id)a4 destinations:(id)a5 options:(id)a6;
- (void)handleTimeout;
- (void)sendResponseWithOriginatingRequestIdentifier:(id)a3 dialogResponse:(id)a4 error:(id)a5 destinations:(id)a6 options:(id)a7;
- (void)sendToDestinations:(id)a3 options:(id)a4;
- (void)setResponse:(id)a3;
@end

@implementation WFRemoteExecutionIncomingDialogRequestSession

- (void).cxx_destruct
{
}

- (void)setResponse:(id)a3
{
}

- (WFRemoteExecutionDialogRequestResponse)response
{
  return self->_response;
}

- (void)sendToDestinations:(id)a3 options:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)WFRemoteExecutionIncomingDialogRequestSession;
  [(WFRemoteExecutionSession *)&v30 sendToDestinations:v6 options:v7];
  id v8 = objc_alloc_init(MEMORY[0x1E4F94098]);
  v9 = [(WFRemoteExecutionIncomingDialogRequestSession *)self response];
  id v29 = 0;
  char v10 = [v9 writeTo:v8 error:&v29];
  id v11 = v29;

  if (v10)
  {
    id v12 = objc_alloc(MEMORY[0x1E4F6AB78]);
    v13 = [v8 immutableData];
    v14 = (void *)[v12 initWithProtobufData:v13 type:11 isResponse:0];

    v15 = getWFRemoteExecutionLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = [(WFRemoteExecutionIncomingDialogRequestSession *)self response];
      v17 = [v16 identifier];
      *(_DWORD *)buf = 136315394;
      v32 = "-[WFRemoteExecutionIncomingDialogRequestSession sendToDestinations:options:]";
      __int16 v33 = 2114;
      v34 = v17;
      _os_log_impl(&dword_1C7F0A000, v15, OS_LOG_TYPE_INFO, "%s <%{public}@> sending dialog request response", buf, 0x16u);
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
        v32 = "-[WFRemoteExecutionIncomingDialogRequestSession sendToDestinations:options:]";
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
      v24 = [(WFRemoteExecutionIncomingDialogRequestSession *)self response];
      v25 = [v24 identifier];
      *(_DWORD *)buf = 136315650;
      v32 = "-[WFRemoteExecutionIncomingDialogRequestSession sendToDestinations:options:]";
      __int16 v33 = 2114;
      v34 = v25;
      __int16 v35 = 2114;
      id v36 = v11;
      _os_log_impl(&dword_1C7F0A000, v23, OS_LOG_TYPE_FAULT, "%s <%{public}@> failed to write protobuf with error: %{public}@", buf, 0x20u);
    }
    [(WFRemoteExecutionSession *)self setState:1];
  }
}

- (void)sendResponseWithOriginatingRequestIdentifier:(id)a3 dialogResponse:(id)a4 error:(id)a5 destinations:(id)a6 options:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = [[WFRemoteExecutionDialogRequestResponse alloc] initWithOriginatingRequestIdentifier:v16 dialogResponse:v15 error:v14];

  [(WFRemoteExecutionIncomingDialogRequestSession *)self setResponse:v17];
  [(WFRemoteExecutionIncomingDialogRequestSession *)self sendToDestinations:v13 options:v12];
}

- (double)timeoutLimitInSeconds
{
  return 120.0;
}

- (void)handleTimeout
{
  [(WFRemoteExecutionSession *)self setState:203];
  [(WFRemoteExecutionSession *)self finish];
}

- (void)finishWithError:(id)a3
{
  [(WFRemoteExecutionSession *)self setState:202];
  [(WFRemoteExecutionSession *)self finish];
}

- (void)handleIncomingProtobuf:(id)a3 currentlyActiveSessions:(id)a4 destinations:(id)a5 options:(id)a6
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v11)
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    v63 = [MEMORY[0x1E4F28B00] currentHandler];
    [v63 handleFailureInMethod:a2, self, @"WFRemoteExecutionIncomingDialogRequestSession.m", 30, @"Invalid parameter not satisfying: %@", @"protobuf" object file lineNumber description];

    if (v13) {
      goto LABEL_3;
    }
  }
  v64 = [MEMORY[0x1E4F28B00] currentHandler];
  [v64 handleFailureInMethod:a2, self, @"WFRemoteExecutionIncomingDialogRequestSession.m", 31, @"Invalid parameter not satisfying: %@", @"responseDestinations" object file lineNumber description];

LABEL_3:
  [(WFRemoteExecutionSession *)self setState:200];
  id v15 = [WFRemoteExecutionDialogRequest alloc];
  id v16 = [v11 data];
  id v82 = 0;
  v17 = [(WFRemoteExecutionDialogRequest *)v15 initWithData:v16 error:&v82];
  id v18 = v82;

  if (v17)
  {
    id v70 = v18;
    v71 = v14;
    v69 = self;
    [(WFRemoteExecutionSession *)self setRequest:v17];
    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    id v19 = v12;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v77 objects:v83 count:16];
    if (!v20)
    {

      goto LABEL_33;
    }
    uint64_t v21 = v20;
    id v66 = v11;
    v67 = v13;
    id v65 = v12;
    v72 = 0;
    uint64_t v22 = *(void *)v78;
    v23 = off_1E654A000;
LABEL_6:
    uint64_t v24 = 0;
    uint64_t v73 = v21;
    while (1)
    {
      if (*(void *)v78 != v22) {
        objc_enumerationMutation(v19);
      }
      v25 = *(void **)(*((void *)&v77 + 1) + 8 * v24);
      uint64_t v26 = objc_opt_class();
      id v27 = v25;
      if (!v27) {
        goto LABEL_18;
      }
      if (objc_opt_isKindOfClass())
      {
        id v28 = v23;
        id v29 = v19;
        objc_super v30 = [v27 request];
        v31 = [v30 identifier];
        v32 = v17;
        __int16 v33 = [(WFRemoteExecutionDialogRequest *)v17 runRequestIdentifier];
        int v34 = [v31 isEqualToString:v33];

        if (!v34)
        {
          v17 = v32;
          id v19 = v29;
          v23 = v28;
          uint64_t v21 = v73;
          goto LABEL_18;
        }
        id v35 = v27;
        id v27 = v72;
        v72 = v35;
        v17 = v32;
        id v19 = v29;
        v23 = v28;
        uint64_t v21 = v73;
      }
      else
      {
        id v36 = getWFGeneralLogObject();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
        {
          uint64_t v37 = objc_opt_class();
          *(_DWORD *)buf = 136315906;
          v85 = "WFEnforceClass";
          __int16 v86 = 2114;
          id v87 = v27;
          __int16 v88 = 2114;
          v89 = v37;
          __int16 v90 = 2114;
          uint64_t v91 = v26;
          id v38 = v37;
          _os_log_impl(&dword_1C7F0A000, v36, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);
        }
        id v35 = 0;
      }

      id v27 = v35;
LABEL_18:

      if (v21 == ++v24)
      {
        uint64_t v21 = [v19 countByEnumeratingWithState:&v77 objects:v83 count:16];
        if (!v21)
        {

          id v12 = v65;
          id v11 = v66;
          id v13 = v67;
          v39 = v72;
          if (v72)
          {
            id v18 = v70;
            if (VCIsDeviceLocked())
            {
              [(WFRemoteExecutionSession *)v69 setState:1];
              v40 = getWFRemoteExecutionLogObject();
              id v14 = v71;
              if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315138;
                v85 = "-[WFRemoteExecutionIncomingDialogRequestSession handleIncomingProtobuf:currentlyActiveSessions:des"
                      "tinations:options:]";
                _os_log_impl(&dword_1C7F0A000, v40, OS_LOG_TYPE_ERROR, "%s Found a outgoing run request session to show the alert in, but the device is locked", buf, 0xCu);
              }

              v41 = [MEMORY[0x1E4F28C58] wfUnsupportedUserInterfaceError];
              [v72 finishWithError:v41];
            }
            else
            {
              v50 = [v72 userInterface];
              char v51 = objc_opt_respondsToSelector();

              id v14 = v71;
              if (v51)
              {
                v52 = [v72 userInterface];
                v53 = [v52 dialogTransformer];

                v54 = [v53 userInterfacePresenter];

                if (v54)
                {
                  [v53 userInterfacePresenter];
                  v56 = v55 = v17;
                  v57 = [(WFRemoteExecutionDialogRequest *)v55 dialogRequest];
                  v58 = [v53 runningContext];
                  v74[0] = MEMORY[0x1E4F143A8];
                  v74[1] = 3221225472;
                  v74[2] = __117__WFRemoteExecutionIncomingDialogRequestSession_handleIncomingProtobuf_currentlyActiveSessions_destinations_options___block_invoke;
                  v74[3] = &unk_1E6550770;
                  v74[4] = v69;
                  id v75 = v67;
                  id v76 = v71;
                  [v56 showDialogRequest:v57 runningContext:v58 completionHandler:v74];

                  v17 = v55;
                  v39 = v72;
                }
                else
                {
                  v61 = getWFRemoteExecutionLogObject();
                  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315138;
                    v85 = "-[WFRemoteExecutionIncomingDialogRequestSession handleIncomingProtobuf:currentlyActiveSessions"
                          ":destinations:options:]";
                    _os_log_impl(&dword_1C7F0A000, v61, OS_LOG_TYPE_DEFAULT, "%s Unable to handle dialog request locally, need to handoff", buf, 0xCu);
                  }

                  v62 = [MEMORY[0x1E4F28C58] wfUnsupportedUserInterfaceError];
                  [v72 finishWithError:v62];

                  [(WFRemoteExecutionSession *)v69 finish];
                }
              }
              else
              {
                v59 = getWFRemoteExecutionLogObject();
                if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315138;
                  v85 = "-[WFRemoteExecutionIncomingDialogRequestSession handleIncomingProtobuf:currentlyActiveSessions:d"
                        "estinations:options:]";
                  _os_log_impl(&dword_1C7F0A000, v59, OS_LOG_TYPE_DEFAULT, "%s Unable to handle dialog request locally, need to handoff", buf, 0xCu);
                }

                v60 = [MEMORY[0x1E4F28C58] wfUnsupportedUserInterfaceError];
                [v72 finishWithError:v60];

                [(WFRemoteExecutionSession *)v69 finish];
              }
            }

            goto LABEL_52;
          }
LABEL_33:
          [(WFRemoteExecutionSession *)v69 setState:-420];
          [(WFRemoteExecutionSession *)v69 finish];
          id v18 = v70;
          id v14 = v71;
          goto LABEL_52;
        }
        goto LABEL_6;
      }
    }
  }
  BOOL v42 = +[WFRemoteExecutionRequest isUnsupportedVersionError:v18];
  v43 = getWFRemoteExecutionLogObject();
  BOOL v44 = os_log_type_enabled(v43, OS_LOG_TYPE_FAULT);
  if (v42)
  {
    id v68 = v13;
    if (v44)
    {
      *(_DWORD *)buf = 136315138;
      v85 = "-[WFRemoteExecutionIncomingDialogRequestSession handleIncomingProtobuf:currentlyActiveSessions:destinations:options:]";
      _os_log_impl(&dword_1C7F0A000, v43, OS_LOG_TYPE_FAULT, "%s Encountered unsupported version of dialog request", buf, 0xCu);
    }

    [(WFRemoteExecutionSession *)self setState:2];
    v45 = [v11 data];
    id v81 = 0;
    v46 = +[WFRemoteExecutionRequest identifierFromData:v45 error:&v81];
    id v47 = v81;

    v48 = getWFRemoteExecutionLogObject();
    v49 = v48;
    if (v46)
    {
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v85 = "-[WFRemoteExecutionIncomingDialogRequestSession handleIncomingProtobuf:currentlyActiveSessions:destinations:options:]";
        _os_log_impl(&dword_1C7F0A000, v49, OS_LOG_TYPE_DEFAULT, "%s Sending unsupported dialog request error back", buf, 0xCu);
      }

      id v13 = v68;
      [(WFRemoteExecutionIncomingDialogRequestSession *)self sendResponseWithOriginatingRequestIdentifier:v46 dialogResponse:0 error:v18 destinations:v68 options:v14];
    }
    else
    {
      if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v85 = "-[WFRemoteExecutionIncomingDialogRequestSession handleIncomingProtobuf:currentlyActiveSessions:destinations:options:]";
        __int16 v86 = 2112;
        id v87 = v47;
        _os_log_impl(&dword_1C7F0A000, v49, OS_LOG_TYPE_FAULT, "%s Unable to read identifier from base request: %@, so unable to send unsupported version error back", buf, 0x16u);
      }

      [(WFRemoteExecutionSession *)self finish];
      id v13 = v68;
    }

    v17 = 0;
  }
  else
  {
    if (v44)
    {
      *(_DWORD *)buf = 136315394;
      v85 = "-[WFRemoteExecutionIncomingDialogRequestSession handleIncomingProtobuf:currentlyActiveSessions:destinations:options:]";
      __int16 v86 = 2114;
      id v87 = v18;
      _os_log_impl(&dword_1C7F0A000, v43, OS_LOG_TYPE_FAULT, "%s failed to read incoming dialog request from data, error: %{public}@", buf, 0x16u);
    }

    [(WFRemoteExecutionSession *)self setState:1];
    [(WFRemoteExecutionSession *)self finish];
  }
LABEL_52:
}

void __117__WFRemoteExecutionIncomingDialogRequestSession_handleIncomingProtobuf_currentlyActiveSessions_destinations_options___block_invoke(void *a1, void *a2, void *a3)
{
  v5 = (void *)a1[4];
  id v6 = a3;
  id v7 = a2;
  id v9 = [v5 request];
  id v8 = [v9 identifier];
  [v5 sendResponseWithOriginatingRequestIdentifier:v8 dialogResponse:v7 error:v6 destinations:a1[5] options:a1[6]];
}

@end