@interface WFRemoteExecutionDialogRequestResponse
+ (int64_t)version;
- (BOOL)readMessageFromData:(id)a3 error:(id *)a4;
- (NSError)error;
- (NSString)originatingRequestIdentifier;
- (WFDialogResponse)dialogResponse;
- (WFRemoteExecutionDialogRequestResponse)initWithData:(id)a3 error:(id *)a4;
- (WFRemoteExecutionDialogRequestResponse)initWithOriginatingRequestIdentifier:(id)a3 dialogResponse:(id)a4 error:(id)a5;
- (id)writeMessageToWriter:(id)a3 error:(id *)a4;
@end

@implementation WFRemoteExecutionDialogRequestResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_dialogResponse, 0);
  objc_storeStrong((id *)&self->_originatingRequestIdentifier, 0);
}

- (NSError)error
{
  return self->_error;
}

- (WFDialogResponse)dialogResponse
{
  return self->_dialogResponse;
}

- (NSString)originatingRequestIdentifier
{
  return self->_originatingRequestIdentifier;
}

- (id)writeMessageToWriter:(id)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = objc_alloc_init(WFREPBDialogRequestResponse);
  v8 = [(WFRemoteExecutionDialogRequestResponse *)self originatingRequestIdentifier];
  [(WFREPBDialogRequestResponse *)v7 setOriginatingRequestIdentifier:v8];

  v9 = (void *)MEMORY[0x1E4F28DB0];
  v10 = [(WFRemoteExecutionDialogRequestResponse *)self dialogResponse];
  id v27 = 0;
  v11 = [v9 archivedDataWithRootObject:v10 requiringSecureCoding:1 error:&v27];
  id v12 = v27;

  if ([v11 length])
  {
    [(WFREPBDialogRequestResponse *)v7 setDialogRequestResponseData:v11];
    v13 = [(WFRemoteExecutionDialogRequestResponse *)self error];

    if (v13)
    {
      v14 = objc_alloc_init(WFREPBError);
      v15 = [(WFRemoteExecutionDialogRequestResponse *)self error];
      v16 = [v15 domain];
      [(WFREPBError *)v14 setDomain:v16];

      v17 = [(WFRemoteExecutionDialogRequestResponse *)self error];
      -[WFREPBError setCode:](v14, "setCode:", [v17 code]);

      v18 = [(WFRemoteExecutionDialogRequestResponse *)self error];
      v19 = [v18 userInfo];
      v20 = [v19 objectForKey:*MEMORY[0x1E4F28568]];
      [(WFREPBError *)v14 setLocalizedDescription:v20];

      v21 = [(WFRemoteExecutionDialogRequestResponse *)self error];
      v22 = [v21 userInfo];
      v23 = [v22 objectForKey:*MEMORY[0x1E4F28588]];
      [(WFREPBError *)v14 setLocalizedFailureReason:v23];

      [(WFREPBDialogRequestResponse *)v7 setError:v14];
    }
    [(WFREPBDialogRequestResponse *)v7 writeTo:v6];
    v24 = [v6 immutableData];
  }
  else
  {
    v25 = getWFRemoteExecutionLogObject();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "-[WFRemoteExecutionDialogRequestResponse writeMessageToWriter:error:]";
      __int16 v30 = 2114;
      id v31 = v12;
      _os_log_impl(&dword_1C7F0A000, v25, OS_LOG_TYPE_FAULT, "%s Unable to write dialog request response as data: %{public}@", buf, 0x16u);
    }

    v24 = 0;
    if (a4) {
      *a4 = v12;
    }
  }

  return v24;
}

- (BOOL)readMessageFromData:(id)a3 error:(id *)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v6 = (objc_class *)MEMORY[0x1E4F94090];
  id v7 = a3;
  v8 = (void *)[[v6 alloc] initWithData:v7];

  v9 = objc_alloc_init(WFREPBDialogRequestResponse);
  id v57 = 0;
  BOOL v10 = [(PBCodable *)v9 readFrom:v8 error:&v57];
  id v11 = v57;
  id v12 = v11;
  if (v10)
  {
    v54 = v8;
    id v55 = v11;
    v13 = [(WFREPBDialogRequestResponse *)v9 originatingRequestIdentifier];
    originatingRequestIdentifier = self->_originatingRequestIdentifier;
    self->_originatingRequestIdentifier = v13;

    uint64_t v15 = [(WFREPBDialogRequestResponse *)v9 dialogRequestResponseData];
    v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    uint64_t v51 = v20;
    v22 = (void *)v15;
    v23 = objc_msgSend(v16, "setWithObjects:", v17, v18, v19, v51, v21, objc_opt_class(), 0);
    v24 = (void *)[v23 mutableCopy];

    [v24 addObject:objc_opt_class()];
    id v56 = 0;
    v25 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v24 fromData:v15 error:&v56];
    id v26 = v56;
    BOOL v27 = v25 != 0;
    if (!v25)
    {
      uint64_t v32 = getWFRemoteExecutionLogObject();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v59 = "-[WFRemoteExecutionDialogRequestResponse readMessageFromData:error:]";
        __int16 v60 = 2114;
        id v61 = v26;
        _os_log_impl(&dword_1C7F0A000, v32, OS_LOG_TYPE_FAULT, "%s Unable to unarchive dialog response from protobuf: %{public}@", buf, 0x16u);
      }

      if (a4) {
        *a4 = v26;
      }
      goto LABEL_22;
    }
    objc_storeStrong((id *)&self->_dialogResponse, v25);
    v28 = [(WFREPBDialogRequestResponse *)v9 error];

    if (!v28)
    {
LABEL_22:

      v8 = v54;
      id v12 = v55;
      goto LABEL_23;
    }
    v52 = v22;
    id v53 = v26;
    v29 = [(WFREPBDialogRequestResponse *)v9 error];
    __int16 v30 = [v29 localizedFailureReason];
    if (v30)
    {
    }
    else
    {
      v33 = [(WFREPBDialogRequestResponse *)v9 error];
      v34 = [v33 localizedDescription];

      if (!v34)
      {
        id v35 = 0;
LABEL_21:
        v44 = (void *)MEMORY[0x1E4F28C58];
        v45 = [(WFREPBDialogRequestResponse *)v9 error];
        v46 = [v45 domain];
        v47 = [(WFREPBDialogRequestResponse *)v9 error];
        objc_msgSend(v44, "errorWithDomain:code:userInfo:", v46, (int)objc_msgSend(v47, "code"), v35);
        v48 = (NSError *)objc_claimAutoreleasedReturnValue();
        error = self->_error;
        self->_error = v48;

        v22 = v52;
        id v26 = v53;
        goto LABEL_22;
      }
    }
    id v35 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v36 = [(WFREPBDialogRequestResponse *)v9 error];
    v37 = [v36 localizedFailureReason];

    if (v37)
    {
      v38 = [(WFREPBDialogRequestResponse *)v9 error];
      v39 = [v38 localizedFailureReason];
      [v35 setObject:v39 forKey:*MEMORY[0x1E4F28588]];
    }
    v40 = [(WFREPBDialogRequestResponse *)v9 error];
    v41 = [v40 localizedDescription];

    if (v41)
    {
      v42 = [(WFREPBDialogRequestResponse *)v9 error];
      v43 = [v42 localizedDescription];
      [v35 setObject:v43 forKey:*MEMORY[0x1E4F28568]];
    }
    goto LABEL_21;
  }
  id v31 = getWFRemoteExecutionLogObject();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    v59 = "-[WFRemoteExecutionDialogRequestResponse readMessageFromData:error:]";
    __int16 v60 = 2114;
    id v61 = v12;
    _os_log_impl(&dword_1C7F0A000, v31, OS_LOG_TYPE_FAULT, "%s Failed to read dialog response protobuf, %{public}@", buf, 0x16u);
  }

  BOOL v27 = 0;
  if (a4) {
    *a4 = v12;
  }
LABEL_23:

  return v27;
}

- (WFRemoteExecutionDialogRequestResponse)initWithOriginatingRequestIdentifier:(id)a3 dialogResponse:(id)a4 error:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v10)
  {
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"WFRemoteExecutionDialogRequestResponse.m", 26, @"Invalid parameter not satisfying: %@", @"originatingRequestIdentifier" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)WFRemoteExecutionDialogRequestResponse;
  v13 = [(WFRemoteExecutionRequest *)&v18 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_originatingRequestIdentifier, a3);
    objc_storeStrong((id *)&v14->_dialogResponse, a4);
    objc_storeStrong((id *)&v14->_error, a5);
    uint64_t v15 = v14;
  }

  return v14;
}

- (WFRemoteExecutionDialogRequestResponse)initWithData:(id)a3 error:(id *)a4
{
  v5.receiver = self;
  v5.super_class = (Class)WFRemoteExecutionDialogRequestResponse;
  return [(WFRemoteExecutionRequest *)&v5 initWithData:a3 error:a4];
}

+ (int64_t)version
{
  return 1;
}

@end