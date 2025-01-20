@interface WFRemoteExecutionAceCommandRequestResponse
+ (int64_t)version;
- (BOOL)readMessageFromData:(id)a3 error:(id *)a4;
- (NSDictionary)aceCommandResponseDictionary;
- (NSError)error;
- (NSString)originatingRequestIdentifier;
- (WFRemoteExecutionAceCommandRequestResponse)initWithData:(id)a3 error:(id *)a4;
- (WFRemoteExecutionAceCommandRequestResponse)initWithOriginatingRequestIdentifier:(id)a3 aceCommandResponseDictionary:(id)a4 error:(id)a5;
- (id)writeMessageToWriter:(id)a3 error:(id *)a4;
@end

@implementation WFRemoteExecutionAceCommandRequestResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_aceCommandResponseDictionary, 0);
  objc_storeStrong((id *)&self->_originatingRequestIdentifier, 0);
}

- (NSError)error
{
  return self->_error;
}

- (NSDictionary)aceCommandResponseDictionary
{
  return self->_aceCommandResponseDictionary;
}

- (NSString)originatingRequestIdentifier
{
  return self->_originatingRequestIdentifier;
}

- (id)writeMessageToWriter:(id)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = objc_alloc_init(WFREPBAceCommandRequestResponse);
  v8 = [(WFRemoteExecutionAceCommandRequestResponse *)self originatingRequestIdentifier];
  [(WFREPBAceCommandRequestResponse *)v7 setOriginatingRequestIdentifier:v8];

  v9 = (void *)MEMORY[0x1E4F28DB0];
  v10 = [(WFRemoteExecutionAceCommandRequestResponse *)self aceCommandResponseDictionary];
  id v27 = 0;
  v11 = [v9 archivedDataWithRootObject:v10 requiringSecureCoding:1 error:&v27];
  id v12 = v27;

  if ([v11 length])
  {
    [(WFREPBAceCommandRequestResponse *)v7 setAceCommandResponseData:v11];
    v13 = [(WFRemoteExecutionAceCommandRequestResponse *)self error];

    if (v13)
    {
      v14 = objc_alloc_init(WFREPBError);
      v15 = [(WFRemoteExecutionAceCommandRequestResponse *)self error];
      v16 = [v15 domain];
      [(WFREPBError *)v14 setDomain:v16];

      v17 = [(WFRemoteExecutionAceCommandRequestResponse *)self error];
      -[WFREPBError setCode:](v14, "setCode:", [v17 code]);

      v18 = [(WFRemoteExecutionAceCommandRequestResponse *)self error];
      v19 = [v18 userInfo];
      v20 = [v19 objectForKey:*MEMORY[0x1E4F28568]];
      [(WFREPBError *)v14 setLocalizedDescription:v20];

      v21 = [(WFRemoteExecutionAceCommandRequestResponse *)self error];
      v22 = [v21 userInfo];
      v23 = [v22 objectForKey:*MEMORY[0x1E4F28588]];
      [(WFREPBError *)v14 setLocalizedFailureReason:v23];

      [(WFREPBAceCommandRequestResponse *)v7 setError:v14];
    }
    [(WFREPBAceCommandRequestResponse *)v7 writeTo:v6];
    v24 = [v6 immutableData];
  }
  else
  {
    v25 = getWFRemoteExecutionLogObject();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "-[WFRemoteExecutionAceCommandRequestResponse writeMessageToWriter:error:]";
      __int16 v30 = 2114;
      id v31 = v12;
      _os_log_impl(&dword_1C7F0A000, v25, OS_LOG_TYPE_FAULT, "%s Unable to write ace command response dictionary as data: %{public}@", buf, 0x16u);
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
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = (objc_class *)MEMORY[0x1E4F94090];
  id v7 = a3;
  v8 = (void *)[[v6 alloc] initWithData:v7];

  v9 = objc_alloc_init(WFREPBAceCommandRequestResponse);
  id v51 = 0;
  BOOL v10 = [(PBCodable *)v9 readFrom:v8 error:&v51];
  id v11 = v51;
  if (v10)
  {
    id v12 = [(WFREPBAceCommandRequestResponse *)v9 originatingRequestIdentifier];
    originatingRequestIdentifier = self->_originatingRequestIdentifier;
    self->_originatingRequestIdentifier = v12;

    v14 = [(WFREPBAceCommandRequestResponse *)v9 aceCommandResponseData];
    v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v15, "setWithObjects:", v16, v17, objc_opt_class(), 0);
    id v50 = 0;
    v19 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v18 fromData:v14 error:&v50];
    id v20 = v50;
    BOOL v21 = v19 != 0;
    if (!v19)
    {
      v26 = getWFRemoteExecutionLogObject();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v53 = "-[WFRemoteExecutionAceCommandRequestResponse readMessageFromData:error:]";
        __int16 v54 = 2114;
        id v55 = v20;
        _os_log_impl(&dword_1C7F0A000, v26, OS_LOG_TYPE_FAULT, "%s Unable to unarchive ace command response dictionary from protobuf: %{public}@", buf, 0x16u);
      }

      if (a4) {
        *a4 = v20;
      }
      goto LABEL_22;
    }
    objc_storeStrong((id *)&self->_aceCommandResponseDictionary, v19);
    v22 = [(WFREPBAceCommandRequestResponse *)v9 error];

    if (!v22)
    {
LABEL_22:

      goto LABEL_23;
    }
    id v47 = v20;
    v49 = v14;
    v23 = [(WFREPBAceCommandRequestResponse *)v9 error];
    v24 = [v23 localizedFailureReason];
    v48 = v18;
    id v46 = v11;
    if (v24)
    {
    }
    else
    {
      id v27 = [(WFREPBAceCommandRequestResponse *)v9 error];
      v28 = [v27 localizedDescription];

      if (!v28)
      {
        v38 = 0;
LABEL_21:
        v39 = (void *)MEMORY[0x1E4F28C58];
        v40 = [(WFREPBAceCommandRequestResponse *)v9 error];
        v41 = [v40 domain];
        v42 = [(WFREPBAceCommandRequestResponse *)v9 error];
        objc_msgSend(v39, "errorWithDomain:code:userInfo:", v41, (int)objc_msgSend(v42, "code"), v38);
        v43 = (NSError *)objc_claimAutoreleasedReturnValue();
        error = self->_error;
        self->_error = v43;

        v18 = v48;
        v14 = v49;
        id v11 = v46;
        id v20 = v47;
        goto LABEL_22;
      }
    }
    id v29 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    __int16 v30 = [(WFREPBAceCommandRequestResponse *)v9 error];
    id v31 = [v30 localizedFailureReason];

    if (v31)
    {
      uint64_t v32 = [(WFREPBAceCommandRequestResponse *)v9 error];
      v33 = [v32 localizedFailureReason];
      [v29 setObject:v33 forKey:*MEMORY[0x1E4F28588]];
    }
    v34 = [(WFREPBAceCommandRequestResponse *)v9 error];
    v35 = [v34 localizedDescription];

    if (v35)
    {
      v36 = [(WFREPBAceCommandRequestResponse *)v9 error];
      v37 = [v36 localizedDescription];
      [v29 setObject:v37 forKey:*MEMORY[0x1E4F28568]];
    }
    v38 = v29;
    goto LABEL_21;
  }
  v25 = getWFRemoteExecutionLogObject();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    v53 = "-[WFRemoteExecutionAceCommandRequestResponse readMessageFromData:error:]";
    __int16 v54 = 2114;
    id v55 = v11;
    _os_log_impl(&dword_1C7F0A000, v25, OS_LOG_TYPE_FAULT, "%s Failed to read ace command request response protobuf, %{public}@", buf, 0x16u);
  }

  BOOL v21 = 0;
  if (a4) {
    *a4 = v11;
  }
LABEL_23:

  return v21;
}

- (WFRemoteExecutionAceCommandRequestResponse)initWithOriginatingRequestIdentifier:(id)a3 aceCommandResponseDictionary:(id)a4 error:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)WFRemoteExecutionAceCommandRequestResponse;
  id v12 = [(WFRemoteExecutionRequest *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_originatingRequestIdentifier, a3);
    objc_storeStrong((id *)&v13->_aceCommandResponseDictionary, a4);
    objc_storeStrong((id *)&v13->_error, a5);
    v14 = v13;
  }

  return v13;
}

- (WFRemoteExecutionAceCommandRequestResponse)initWithData:(id)a3 error:(id *)a4
{
  v5.receiver = self;
  v5.super_class = (Class)WFRemoteExecutionAceCommandRequestResponse;
  return [(WFRemoteExecutionRequest *)&v5 initWithData:a3 error:a4];
}

+ (int64_t)version
{
  return 1;
}

@end