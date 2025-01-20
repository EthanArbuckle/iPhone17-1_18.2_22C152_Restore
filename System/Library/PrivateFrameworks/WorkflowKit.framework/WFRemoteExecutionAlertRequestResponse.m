@interface WFRemoteExecutionAlertRequestResponse
+ (int64_t)version;
- (BOOL)readMessageFromData:(id)a3 error:(id *)a4;
- (NSError)error;
- (NSString)requestIdentifier;
- (NSString)selectedButton;
- (WFRemoteExecutionAlertRequestResponse)initWithSelectedButton:(id)a3 requestIdentifier:(id)a4 error:(id)a5;
- (id)writeMessageToWriter:(id)a3 error:(id *)a4;
- (void)setError:(id)a3;
@end

@implementation WFRemoteExecutionAlertRequestResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_selectedButton, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (NSString)selectedButton
{
  return self->_selectedButton;
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (id)writeMessageToWriter:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = objc_opt_new();
  v7 = [(WFRemoteExecutionAlertRequestResponse *)self requestIdentifier];
  [v6 setRequestIdentifier:v7];

  v8 = [(WFRemoteExecutionAlertRequestResponse *)self selectedButton];
  [v6 setSelectedButton:v8];

  v9 = [(WFRemoteExecutionAlertRequestResponse *)self error];

  if (v9)
  {
    v10 = objc_opt_new();
    v11 = [(WFRemoteExecutionAlertRequestResponse *)self error];
    v12 = [v11 domain];
    [v10 setDomain:v12];

    v13 = [(WFRemoteExecutionAlertRequestResponse *)self error];
    objc_msgSend(v10, "setCode:", objc_msgSend(v13, "code"));

    v14 = [(WFRemoteExecutionAlertRequestResponse *)self error];
    v15 = [v14 userInfo];
    v16 = [v15 objectForKey:*MEMORY[0x1E4F28568]];
    [v10 setLocalizedDescription:v16];

    v17 = [(WFRemoteExecutionAlertRequestResponse *)self error];
    v18 = [v17 userInfo];
    v19 = [v18 objectForKey:*MEMORY[0x1E4F28588]];
    [v10 setLocalizedFailureReason:v19];

    [v6 setError:v10];
  }
  [v6 writeTo:v5];
  v20 = [v5 immutableData];

  return v20;
}

- (BOOL)readMessageFromData:(id)a3 error:(id *)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v6 = (objc_class *)MEMORY[0x1E4F94090];
  id v7 = a3;
  v8 = (void *)[[v6 alloc] initWithData:v7];

  v9 = objc_alloc_init(WFREPBAlertRequestResponse);
  id v30 = 0;
  BOOL v10 = [(PBCodable *)v9 readFrom:v8 error:&v30];
  id v11 = v30;
  if (v10)
  {
    v12 = [(WFREPBAlertRequestResponse *)v9 requestIdentifier];
    requestIdentifier = self->_requestIdentifier;
    self->_requestIdentifier = v12;

    v14 = [(WFREPBAlertRequestResponse *)v9 selectedButton];
    selectedButton = self->_selectedButton;
    self->_selectedButton = v14;

    v16 = [(WFREPBAlertRequestResponse *)v9 error];
    if (v16)
    {
      id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v18 = [v16 localizedDescription];
      uint64_t v19 = [v18 length];

      if (v19)
      {
        v20 = [v16 localizedDescription];
        [v17 setObject:v20 forKey:*MEMORY[0x1E4F28568]];
      }
      v21 = [v16 localizedFailureReason];
      uint64_t v22 = [v21 length];

      if (v22)
      {
        v23 = [v16 localizedFailureReason];
        [v17 setObject:v23 forKey:*MEMORY[0x1E4F28588]];
      }
      v24 = (void *)MEMORY[0x1E4F28C58];
      v25 = [v16 domain];
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", v25, (int)objc_msgSend(v16, "code"), v17);
      v26 = (NSError *)objc_claimAutoreleasedReturnValue();
      error = self->_error;
      self->_error = v26;
    }
  }
  else
  {
    v28 = getWFRemoteExecutionLogObject();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v32 = "-[WFRemoteExecutionAlertRequestResponse readMessageFromData:error:]";
      __int16 v33 = 2114;
      id v34 = v11;
      _os_log_impl(&dword_1C7F0A000, v28, OS_LOG_TYPE_FAULT, "%s Failed to read alert request response protobuf, %{public}@", buf, 0x16u);
    }

    if (a4) {
      *a4 = v11;
    }
  }

  return v10;
}

- (WFRemoteExecutionAlertRequestResponse)initWithSelectedButton:(id)a3 requestIdentifier:(id)a4 error:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v11)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"WFRemoteExecutionAlertRequestResponse.m", 20, @"Invalid parameter not satisfying: %@", @"requestIdentifier" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)WFRemoteExecutionAlertRequestResponse;
  v13 = [(WFRemoteExecutionRequest *)&v18 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_requestIdentifier, a4);
    objc_storeStrong((id *)&v14->_selectedButton, a3);
    objc_storeStrong((id *)&v14->_error, a5);
    v15 = v14;
  }

  return v14;
}

+ (int64_t)version
{
  return 1;
}

@end