@interface WFRemoteExecutionDialogRequest
+ (int64_t)version;
- (BOOL)readMessageFromData:(id)a3 error:(id *)a4;
- (NSString)runRequestIdentifier;
- (WFDialogRequest)dialogRequest;
- (WFRemoteExecutionDialogRequest)initWithData:(id)a3 error:(id *)a4;
- (WFRemoteExecutionDialogRequest)initWithDialogRequest:(id)a3 runRequestIdentifier:(id)a4;
- (id)writeMessageToWriter:(id)a3 error:(id *)a4;
@end

@implementation WFRemoteExecutionDialogRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dialogRequest, 0);
  objc_storeStrong((id *)&self->_runRequestIdentifier, 0);
}

- (WFDialogRequest)dialogRequest
{
  return self->_dialogRequest;
}

- (NSString)runRequestIdentifier
{
  return self->_runRequestIdentifier;
}

- (id)writeMessageToWriter:(id)a3 error:(id *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = objc_alloc_init(WFREPBDialogRequest);
  v8 = (void *)MEMORY[0x1E4F28DB0];
  v9 = [(WFRemoteExecutionDialogRequest *)self dialogRequest];
  id v16 = 0;
  v10 = [v8 archivedDataWithRootObject:v9 requiringSecureCoding:1 error:&v16];
  id v11 = v16;

  if (v10)
  {
    [(WFREPBDialogRequest *)v7 setDialogRequestData:v10];
    v12 = [(WFRemoteExecutionDialogRequest *)self runRequestIdentifier];
    [(WFREPBDialogRequest *)v7 setRunRequestIdentifier:v12];

    [(WFREPBDialogRequest *)v7 writeTo:v6];
    v13 = [v6 immutableData];
  }
  else
  {
    v14 = getWFRemoteExecutionLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[WFRemoteExecutionDialogRequest writeMessageToWriter:error:]";
      __int16 v19 = 2114;
      id v20 = v11;
      _os_log_impl(&dword_1C7F0A000, v14, OS_LOG_TYPE_FAULT, "%s Unable to archive dialog request: %{public}@", buf, 0x16u);
    }

    v13 = 0;
    if (a4) {
      *a4 = v11;
    }
  }

  return v13;
}

- (BOOL)readMessageFromData:(id)a3 error:(id *)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = (objc_class *)MEMORY[0x1E4F94090];
  id v7 = a3;
  v8 = (void *)[[v6 alloc] initWithData:v7];

  v9 = objc_alloc_init(WFREPBDialogRequest);
  id v35 = 0;
  BOOL v10 = [(PBCodable *)v9 readFrom:v8 error:&v35];
  id v11 = v35;
  v12 = v11;
  if (v10)
  {
    v32 = a4;
    id v33 = v11;
    v13 = [(WFREPBDialogRequest *)v9 runRequestIdentifier];
    runRequestIdentifier = self->_runRequestIdentifier;
    self->_runRequestIdentifier = v13;

    v15 = [(WFREPBDialogRequest *)v9 dialogRequestData];
    id v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    v22 = objc_msgSend(v16, "setWithObjects:", v17, v18, v19, v20, v21, objc_opt_class(), 0);
    v23 = (void *)[v22 mutableCopy];

    [v23 addObject:objc_opt_class()];
    id v34 = 0;
    v24 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v23 fromData:v15 error:&v34];
    id v25 = v34;
    dialogRequest = self->_dialogRequest;
    self->_dialogRequest = v24;

    v27 = self->_dialogRequest;
    BOOL v28 = v27 != 0;
    if (!v27)
    {
      v29 = getWFRemoteExecutionLogObject();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v37 = "-[WFRemoteExecutionDialogRequest readMessageFromData:error:]";
        __int16 v38 = 2114;
        id v39 = v25;
        _os_log_impl(&dword_1C7F0A000, v29, OS_LOG_TYPE_FAULT, "%s Unable to convert data into dialog request: %{public}@", buf, 0x16u);
      }

      if (v32) {
        id *v32 = v25;
      }
    }

    v12 = v33;
  }
  else
  {
    v30 = getWFRemoteExecutionLogObject();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v37 = "-[WFRemoteExecutionDialogRequest readMessageFromData:error:]";
      __int16 v38 = 2114;
      id v39 = v12;
      _os_log_impl(&dword_1C7F0A000, v30, OS_LOG_TYPE_FAULT, "%s Failed to read dialog request protobuf, %{public}@", buf, 0x16u);
    }

    BOOL v28 = 0;
    if (a4) {
      *a4 = v12;
    }
  }

  return v28;
}

- (WFRemoteExecutionDialogRequest)initWithDialogRequest:(id)a3 runRequestIdentifier:(id)a4
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
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"WFRemoteExecutionDialogRequest.m", 24, @"Invalid parameter not satisfying: %@", @"dialogRequest" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  id v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"WFRemoteExecutionDialogRequest.m", 25, @"Invalid parameter not satisfying: %@", @"runRequestIdentifier" object file lineNumber description];

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)WFRemoteExecutionDialogRequest;
  BOOL v10 = [(WFRemoteExecutionRequest *)&v17 init];
  if (v10)
  {
    uint64_t v11 = [v7 requestByCompactingRequest];
    dialogRequest = v10->_dialogRequest;
    v10->_dialogRequest = (WFDialogRequest *)v11;

    objc_storeStrong((id *)&v10->_runRequestIdentifier, a4);
    v13 = v10;
  }

  return v10;
}

- (WFRemoteExecutionDialogRequest)initWithData:(id)a3 error:(id *)a4
{
  v5.receiver = self;
  v5.super_class = (Class)WFRemoteExecutionDialogRequest;
  return [(WFRemoteExecutionRequest *)&v5 initWithData:a3 error:a4];
}

+ (int64_t)version
{
  return 1;
}

@end