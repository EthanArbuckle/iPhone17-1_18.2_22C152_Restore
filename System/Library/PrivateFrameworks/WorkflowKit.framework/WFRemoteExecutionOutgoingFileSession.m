@interface WFRemoteExecutionOutgoingFileSession
+ (BOOL)supportsVersion:(int64_t)a3;
+ (int64_t)version;
- (BOOL)sendToDestinations:(id)a3 options:(id)a4 error:(id *)a5;
- (NSString)requestIdentifier;
- (NSString)transferIdentifier;
- (NSURL)fileURL;
- (WFRemoteExecutionOutgoingFileSession)initWithService:(id)a3 fileURL:(id)a4 transferIdentifier:(id)a5 requestIdentifier:(id)a6;
- (void)fileSentWithSuccess:(BOOL)a3 error:(id)a4;
- (void)setFileURL:(id)a3;
- (void)setRequestIdentifier:(id)a3;
- (void)setTransferIdentifier:(id)a3;
@end

@implementation WFRemoteExecutionOutgoingFileSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_transferIdentifier, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

- (void)setRequestIdentifier:(id)a3
{
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setTransferIdentifier:(id)a3
{
}

- (NSString)transferIdentifier
{
  return self->_transferIdentifier;
}

- (void)setFileURL:(id)a3
{
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)fileSentWithSuccess:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = getWFRemoteExecutionLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = [(WFRemoteExecutionOutgoingFileSession *)self transferIdentifier];
    int v9 = 136315906;
    v10 = "-[WFRemoteExecutionOutgoingFileSession fileSentWithSuccess:error:]";
    __int16 v11 = 2114;
    v12 = v8;
    __int16 v13 = 1024;
    BOOL v14 = v4;
    __int16 v15 = 2114;
    id v16 = v6;
    _os_log_impl(&dword_1C7F0A000, v7, OS_LOG_TYPE_INFO, "%s <%{public}@> file sent with success: %i, error: %{public}@", (uint8_t *)&v9, 0x26u);
  }
  [(WFRemoteExecutionSession *)self finish];
}

- (BOOL)sendToDestinations:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"WFRemoteExecutionOutgoingFileSession.m", 39, @"Invalid parameter not satisfying: %@", @"destinations" object file lineNumber description];
  }
  __int16 v11 = getWFRemoteExecutionLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = [(WFRemoteExecutionOutgoingFileSession *)self transferIdentifier];
    __int16 v13 = [(WFRemoteExecutionOutgoingFileSession *)self fileURL];
    *(_DWORD *)buf = 136315650;
    v29 = "-[WFRemoteExecutionOutgoingFileSession sendToDestinations:options:error:]";
    __int16 v30 = 2114;
    id v31 = v12;
    __int16 v32 = 2114;
    v33 = v13;
    _os_log_impl(&dword_1C7F0A000, v11, OS_LOG_TYPE_INFO, "%s <%{public}@> Sending file at URL: %{public}@", buf, 0x20u);
  }
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  __int16 v15 = [(WFRemoteExecutionOutgoingFileSession *)self requestIdentifier];
  [v14 setObject:v15 forKey:@"requestIdentifier"];

  id v16 = [(WFRemoteExecutionOutgoingFileSession *)self transferIdentifier];
  [v14 setObject:v16 forKey:@"transferIdentifier"];

  uint64_t v17 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend((id)objc_opt_class(), "version"));
  [v14 setObject:v17 forKey:@"version"];

  v18 = [(WFRemoteExecutionSession *)self service];
  v19 = [(WFRemoteExecutionOutgoingFileSession *)self fileURL];
  id v26 = 0;
  id v27 = 0;
  char v20 = [v18 sendResourceAtURL:v19 metadata:v14 toDestinations:v9 priority:300 options:v10 identifier:&v27 error:&v26];
  id v21 = v27;
  id v22 = v26;

  if (v20)
  {
    [(WFRemoteExecutionSession *)self setIdsIdentifier:v21];
    [(WFRemoteExecutionSession *)self setState:101];
  }
  else
  {
    [(WFRemoteExecutionSession *)self setState:1];
    v23 = getWFRemoteExecutionLogObject();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "-[WFRemoteExecutionOutgoingFileSession sendToDestinations:options:error:]";
      __int16 v30 = 2114;
      id v31 = v22;
      _os_log_impl(&dword_1C7F0A000, v23, OS_LOG_TYPE_ERROR, "%s File sending failed with error: %{public}@", buf, 0x16u);
    }

    if (a5) {
      *a5 = v22;
    }
    [(WFRemoteExecutionSession *)self finish];
  }

  return v20;
}

- (WFRemoteExecutionOutgoingFileSession)initWithService:(id)a3 fileURL:(id)a4 transferIdentifier:(id)a5 requestIdentifier:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
LABEL_8:
    char v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"WFRemoteExecutionOutgoingFileSession.m", 23, @"Invalid parameter not satisfying: %@", @"fileURL" object file lineNumber description];

    if (v13) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"WFRemoteExecutionOutgoingFileSession.m", 22, @"Invalid parameter not satisfying: %@", @"service" object file lineNumber description];

  if (!v12) {
    goto LABEL_8;
  }
LABEL_3:
  if (v13) {
    goto LABEL_4;
  }
LABEL_9:
  id v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"WFRemoteExecutionOutgoingFileSession.m", 24, @"Invalid parameter not satisfying: %@", @"transferIdentifier" object file lineNumber description];

LABEL_4:
  v22.receiver = self;
  v22.super_class = (Class)WFRemoteExecutionOutgoingFileSession;
  __int16 v15 = [(WFRemoteExecutionSession *)&v22 initWithService:v11];
  id v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_fileURL, a4);
    objc_storeStrong((id *)&v16->_transferIdentifier, a5);
    objc_storeStrong((id *)&v16->_requestIdentifier, a6);
    [(WFRemoteExecutionSession *)v16 setState:100];
    uint64_t v17 = v16;
  }

  return v16;
}

+ (BOOL)supportsVersion:(int64_t)a3
{
  return [a1 version] == a3;
}

+ (int64_t)version
{
  return 1;
}

@end