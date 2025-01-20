@interface WFRemoteExecutionAskEachTimeRequestResponse
+ (int64_t)version;
- (BOOL)readMessageFromData:(id)a3 error:(id *)a4;
- (NSDictionary)inputtedStates;
- (NSError)error;
- (NSMutableArray)inputtedStatesData;
- (NSString)originatingRequestIdentifier;
- (WFRemoteExecutionAskEachTimeRequestResponse)initWithData:(id)a3 error:(id *)a4;
- (WFRemoteExecutionAskEachTimeRequestResponse)initWithOriginatingRequestIdentifier:(id)a3 inputtedStates:(id)a4 error:(id)a5;
- (id)writeMessageToWriter:(id)a3 error:(id *)a4;
- (void)inflateInputtedStatesWithAction:(id)a3;
- (void)setInputtedStatesData:(id)a3;
@end

@implementation WFRemoteExecutionAskEachTimeRequestResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputtedStatesData, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_inputtedStates, 0);
  objc_storeStrong((id *)&self->_originatingRequestIdentifier, 0);
}

- (void)setInputtedStatesData:(id)a3
{
}

- (NSMutableArray)inputtedStatesData
{
  return self->_inputtedStatesData;
}

- (NSError)error
{
  return self->_error;
}

- (NSDictionary)inputtedStates
{
  return self->_inputtedStates;
}

- (NSString)originatingRequestIdentifier
{
  return self->_originatingRequestIdentifier;
}

- (id)writeMessageToWriter:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = objc_opt_new();
  v7 = [(WFRemoteExecutionAskEachTimeRequestResponse *)self originatingRequestIdentifier];
  [v6 setOriginatingRequestIdentifier:v7];

  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v9 = [(WFRemoteExecutionAskEachTimeRequestResponse *)self inputtedStates];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __74__WFRemoteExecutionAskEachTimeRequestResponse_writeMessageToWriter_error___block_invoke;
  v32[3] = &unk_1E6556848;
  id v10 = v8;
  id v33 = v10;
  [v9 enumerateKeysAndObjectsUsingBlock:v32];

  [v6 setInputtedStates:v10];
  v11 = [(WFRemoteExecutionAskEachTimeRequestResponse *)self error];

  if (v11)
  {
    v12 = objc_opt_new();
    v13 = [(WFRemoteExecutionAskEachTimeRequestResponse *)self error];
    objc_msgSend(v12, "setCode:", objc_msgSend(v13, "code"));

    v14 = [(WFRemoteExecutionAskEachTimeRequestResponse *)self error];
    v15 = [v14 domain];
    [v12 setDomain:v15];

    v16 = [(WFRemoteExecutionAskEachTimeRequestResponse *)self error];
    v17 = [v16 userInfo];
    uint64_t v18 = *MEMORY[0x1E4F28568];
    v19 = [v17 objectForKey:*MEMORY[0x1E4F28568]];

    if (v19)
    {
      v20 = [(WFRemoteExecutionAskEachTimeRequestResponse *)self error];
      v21 = [v20 userInfo];
      v22 = [v21 objectForKey:v18];
      [v12 setLocalizedDescription:v22];
    }
    v23 = [(WFRemoteExecutionAskEachTimeRequestResponse *)self error];
    v24 = [v23 userInfo];
    uint64_t v25 = *MEMORY[0x1E4F28588];
    v26 = [v24 objectForKey:*MEMORY[0x1E4F28588]];

    if (v26)
    {
      v27 = [(WFRemoteExecutionAskEachTimeRequestResponse *)self error];
      v28 = [v27 userInfo];
      v29 = [v28 objectForKey:v25];
      [v12 setLocalizedFailureReason:v29];
    }
    [v6 setError:v12];
  }
  [v6 writeTo:v5];
  v30 = [v5 immutableData];

  return v30;
}

void __74__WFRemoteExecutionAskEachTimeRequestResponse_writeMessageToWriter_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v10 = objc_alloc_init(WFREPBKeyValuePair);
  [(WFREPBKeyValuePair *)v10 setKey:v6];

  v7 = (void *)MEMORY[0x1E4F28F98];
  id v8 = [v5 serializedRepresentation];

  v9 = [v7 dataWithPropertyList:v8 format:200 options:0 error:0];
  [(WFREPBKeyValuePair *)v10 setValue:v9];

  [*(id *)(a1 + 32) addObject:v10];
}

- (BOOL)readMessageFromData:(id)a3 error:(id *)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = (objc_class *)MEMORY[0x1E4F94090];
  id v7 = a3;
  id v8 = (void *)[[v6 alloc] initWithData:v7];

  v9 = objc_alloc_init(WFREPBAskWhenRunRequestResponse);
  id v30 = 0;
  BOOL v10 = [(PBCodable *)v9 readFrom:v8 error:&v30];
  id v11 = v30;
  if (v10)
  {
    v12 = [(WFREPBAskWhenRunRequestResponse *)v9 originatingRequestIdentifier];
    originatingRequestIdentifier = self->_originatingRequestIdentifier;
    self->_originatingRequestIdentifier = v12;

    v14 = [(WFREPBAskWhenRunRequestResponse *)v9 inputtedStates];
    inputtedStatesData = self->_inputtedStatesData;
    self->_inputtedStatesData = v14;

    v16 = [(WFREPBAskWhenRunRequestResponse *)v9 error];
    if (v16)
    {
      id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v18 = [v16 localizedDescription];
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
      uint64_t v25 = [v16 domain];
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
      v32 = "-[WFRemoteExecutionAskEachTimeRequestResponse readMessageFromData:error:]";
      __int16 v33 = 2114;
      id v34 = v11;
      _os_log_impl(&dword_1C7F0A000, v28, OS_LOG_TYPE_FAULT, "%s Failed to read ask each time request response protobuf, %{public}@", buf, 0x16u);
    }

    if (a4) {
      *a4 = v11;
    }
  }

  return v10;
}

- (void)inflateInputtedStatesWithAction:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (NSDictionary *)objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = [(WFRemoteExecutionAskEachTimeRequestResponse *)self inputtedStatesData];
  uint64_t v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(obj);
        }
        BOOL v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v11 = (void *)MEMORY[0x1E4F28F98];
        v12 = [v10 value];
        v13 = [v11 propertyListWithData:v12 options:0 format:0 error:0];

        v14 = [v10 key];
        v15 = [v4 parameterForKey:v14];

        v16 = objc_msgSend(objc_alloc((Class)objc_msgSend(v15, "stateClass")), "initWithSerializedRepresentation:variableProvider:parameter:", v13, v4, v15);
        if (v16)
        {
          id v17 = [v10 key];
          [(NSDictionary *)v5 setObject:v16 forKey:v17];
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }

  inputtedStates = self->_inputtedStates;
  self->_inputtedStates = v5;

  [(WFRemoteExecutionAskEachTimeRequestResponse *)self setInputtedStatesData:0];
}

- (WFRemoteExecutionAskEachTimeRequestResponse)initWithOriginatingRequestIdentifier:(id)a3 inputtedStates:(id)a4 error:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v10)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"WFRemoteExecutionAskEachTimeRequestResponse.m", 32, @"Invalid parameter not satisfying: %@", @"requestIdentifier" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)WFRemoteExecutionAskEachTimeRequestResponse;
  v13 = [(WFRemoteExecutionRequest *)&v18 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_originatingRequestIdentifier, a3);
    objc_storeStrong((id *)&v14->_inputtedStates, a4);
    objc_storeStrong((id *)&v14->_error, a5);
    v15 = v14;
  }

  return v14;
}

- (WFRemoteExecutionAskEachTimeRequestResponse)initWithData:(id)a3 error:(id *)a4
{
  v5.receiver = self;
  v5.super_class = (Class)WFRemoteExecutionAskEachTimeRequestResponse;
  return [(WFRemoteExecutionRequest *)&v5 initWithData:a3 error:a4];
}

+ (int64_t)version
{
  return 1;
}

@end