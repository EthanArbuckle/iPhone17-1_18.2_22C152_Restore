@interface WFRemoteExecutionAskEachTimeRequest
+ (int64_t)version;
- (BOOL)readMessageFromData:(id)a3 error:(id *)a4;
- (NSArray)parameterKeys;
- (NSDictionary)actionSerializedParameters;
- (NSDictionary)parameterKeysAndStates;
- (NSDictionary)possibleStatesByParameterKey;
- (NSMutableArray)parameterKeysAndStatesData;
- (NSMutableArray)possibleStatesByParameterKeyData;
- (NSString)actionIdentifier;
- (NSString)associatedRunRequestIdentifier;
- (WFRemoteExecutionAskEachTimeRequest)initWithAction:(id)a3 parameters:(id)a4 associatedRunRequestIdentifier:(id)a5 possibleStatesByParameterKey:(id)a6;
- (WFRemoteExecutionAskEachTimeRequest)initWithData:(id)a3 error:(id *)a4;
- (id)writeMessageToWriter:(id)a3 error:(id *)a4;
- (void)inflateParameterStatesWithAction:(id)a3;
- (void)setParameterKeysAndStatesData:(id)a3;
- (void)setPossibleStatesByParameterKeyData:(id)a3;
@end

@implementation WFRemoteExecutionAskEachTimeRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_possibleStatesByParameterKeyData, 0);
  objc_storeStrong((id *)&self->_parameterKeysAndStatesData, 0);
  objc_storeStrong((id *)&self->_possibleStatesByParameterKey, 0);
  objc_storeStrong((id *)&self->_actionSerializedParameters, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
  objc_storeStrong((id *)&self->_parameterKeysAndStates, 0);
  objc_storeStrong((id *)&self->_parameterKeys, 0);
  objc_storeStrong((id *)&self->_associatedRunRequestIdentifier, 0);
}

- (void)setPossibleStatesByParameterKeyData:(id)a3
{
}

- (NSMutableArray)possibleStatesByParameterKeyData
{
  return self->_possibleStatesByParameterKeyData;
}

- (void)setParameterKeysAndStatesData:(id)a3
{
}

- (NSMutableArray)parameterKeysAndStatesData
{
  return self->_parameterKeysAndStatesData;
}

- (NSDictionary)possibleStatesByParameterKey
{
  return self->_possibleStatesByParameterKey;
}

- (NSDictionary)actionSerializedParameters
{
  return self->_actionSerializedParameters;
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (NSDictionary)parameterKeysAndStates
{
  return self->_parameterKeysAndStates;
}

- (NSArray)parameterKeys
{
  return self->_parameterKeys;
}

- (NSString)associatedRunRequestIdentifier
{
  return self->_associatedRunRequestIdentifier;
}

- (id)writeMessageToWriter:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = objc_opt_new();
  v8 = [(WFRemoteExecutionAskEachTimeRequest *)self associatedRunRequestIdentifier];
  [v7 setAssociatedRunRequestIdentifier:v8];

  id v9 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v10 = [(WFRemoteExecutionAskEachTimeRequest *)self parameterKeys];
  v11 = (void *)[v9 initWithArray:v10];
  [v7 setParameterKeys:v11];

  v12 = [(WFRemoteExecutionAskEachTimeRequest *)self actionIdentifier];
  [v7 setActionIdentifier:v12];

  v13 = (void *)MEMORY[0x1E4F28F98];
  v14 = [(WFRemoteExecutionAskEachTimeRequest *)self actionSerializedParameters];
  id v28 = 0;
  v15 = [v13 dataWithPropertyList:v14 format:200 options:0 error:&v28];
  id v16 = v28;
  [v7 setActionSerializedParameters:v15];

  v17 = [v7 actionSerializedParameters];

  if (v17)
  {
    v18 = [(WFRemoteExecutionAskEachTimeRequest *)self parameterKeysAndStates];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __66__WFRemoteExecutionAskEachTimeRequest_writeMessageToWriter_error___block_invoke;
    v26[3] = &unk_1E6556848;
    id v19 = v7;
    id v27 = v19;
    [v18 enumerateKeysAndObjectsUsingBlock:v26];

    v20 = [(WFRemoteExecutionAskEachTimeRequest *)self possibleStatesByParameterKey];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __66__WFRemoteExecutionAskEachTimeRequest_writeMessageToWriter_error___block_invoke_2;
    v24[3] = &unk_1E6552990;
    id v21 = v19;
    id v25 = v21;
    [v20 enumerateKeysAndObjectsUsingBlock:v24];

    [v21 writeTo:v6];
    v22 = [v6 immutableData];
  }
  else
  {
    v22 = 0;
    if (a4) {
      *a4 = v16;
    }
  }

  return v22;
}

void __66__WFRemoteExecutionAskEachTimeRequest_writeMessageToWriter_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  v10 = objc_alloc_init(WFREPBKeyValuePair);
  [(WFREPBKeyValuePair *)v10 setKey:v6];

  v7 = (void *)MEMORY[0x1E4F28DB0];
  v8 = [v5 serializedRepresentation];

  id v9 = [v7 archivedDataWithRootObject:v8 requiringSecureCoding:1 error:0];
  [(WFREPBKeyValuePair *)v10 setValue:v9];

  [*(id *)(a1 + 32) addParameterKeysAndStates:v10];
}

void __66__WFRemoteExecutionAskEachTimeRequest_writeMessageToWriter_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v9 = objc_alloc_init(WFREPBRepeatedKeyValuePair);
  [(WFREPBRepeatedKeyValuePair *)v9 setKey:v6];

  v7 = objc_msgSend(v5, "if_map:", &__block_literal_global_2254);

  v8 = [MEMORY[0x1E4F1CA48] arrayWithArray:v7];
  [(WFREPBRepeatedKeyValuePair *)v9 setValues:v8];

  [*(id *)(a1 + 32) addPossibleStates:v9];
}

id __66__WFRemoteExecutionAskEachTimeRequest_writeMessageToWriter_error___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F28F98];
  v3 = [a2 serializedRepresentation];
  v4 = [v2 dataWithPropertyList:v3 format:200 options:0 error:0];

  return v4;
}

- (BOOL)readMessageFromData:(id)a3 error:(id *)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = (objc_class *)MEMORY[0x1E4F94090];
  id v7 = a3;
  v8 = (void *)[[v6 alloc] initWithData:v7];

  id v9 = objc_alloc_init(WFREPBAskWhenRunRequest);
  id v32 = 0;
  BOOL v10 = [(PBCodable *)v9 readFrom:v8 error:&v32];
  id v11 = v32;
  if (v10)
  {
    v12 = [(WFREPBAskWhenRunRequest *)v9 associatedRunRequestIdentifier];
    associatedRunRequestIdentifier = self->_associatedRunRequestIdentifier;
    self->_associatedRunRequestIdentifier = v12;

    v14 = [(WFREPBAskWhenRunRequest *)v9 parameterKeys];
    parameterKeys = self->_parameterKeys;
    self->_parameterKeys = v14;

    id v16 = [(WFREPBAskWhenRunRequest *)v9 parameterKeysAndStates];
    parameterKeysAndStatesData = self->_parameterKeysAndStatesData;
    self->_parameterKeysAndStatesData = v16;

    v18 = [(WFREPBAskWhenRunRequest *)v9 actionIdentifier];
    actionIdentifier = self->_actionIdentifier;
    self->_actionIdentifier = v18;

    v20 = [(WFREPBAskWhenRunRequest *)v9 possibleStates];
    possibleStatesByParameterKeyData = self->_possibleStatesByParameterKeyData;
    self->_possibleStatesByParameterKeyData = v20;

    v22 = (void *)MEMORY[0x1E4F28F98];
    v23 = [(WFREPBAskWhenRunRequest *)v9 actionSerializedParameters];
    id v31 = 0;
    v24 = [v22 propertyListWithData:v23 options:0 format:0 error:&v31];
    id v25 = v31;
    actionSerializedParameters = self->_actionSerializedParameters;
    self->_actionSerializedParameters = v24;

    if (!self->_actionSerializedParameters)
    {
      id v27 = getWFRemoteExecutionLogObject();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        id v28 = [(WFREPBAskWhenRunRequest *)v9 actionSerializedParameters];
        *(_DWORD *)buf = 136315650;
        v34 = "-[WFRemoteExecutionAskEachTimeRequest readMessageFromData:error:]";
        __int16 v35 = 2114;
        id v36 = v28;
        __int16 v37 = 2114;
        id v38 = v25;
        _os_log_impl(&dword_1C7F0A000, v27, OS_LOG_TYPE_ERROR, "%s An error occurred when decoding object (%{public}@), error: %{public}@", buf, 0x20u);
      }
      if (a4) {
        *a4 = v25;
      }
    }
  }
  else
  {
    v29 = getWFRemoteExecutionLogObject();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v34 = "-[WFRemoteExecutionAskEachTimeRequest readMessageFromData:error:]";
      __int16 v35 = 2114;
      id v36 = v11;
      _os_log_impl(&dword_1C7F0A000, v29, OS_LOG_TYPE_FAULT, "%s Failed to read ask each time request protobuf, %{public}@", buf, 0x16u);
    }

    if (a4) {
      *a4 = v11;
    }
  }

  return v10;
}

- (void)inflateParameterStatesWithAction:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v45 = a3;
  if (v45)
  {
    id v37 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v36 = self;
    obuint64_t j = [(WFRemoteExecutionAskEachTimeRequest *)self parameterKeysAndStatesData];
    uint64_t v40 = [obj countByEnumeratingWithState:&v54 objects:v65 count:16];
    if (v40)
    {
      uint64_t v39 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v40; ++i)
        {
          if (*(void *)v55 != v39) {
            objc_enumerationMutation(obj);
          }
          id v5 = *(void **)(*((void *)&v54 + 1) + 8 * i);
          id v6 = [v5 key];
          id v7 = [v45 parameterForKey:v6];
          uint64_t v8 = [v7 stateClass];
          if (v8)
          {
            id v9 = (objc_class *)v8;
            id v41 = v7;
            v43 = v6;
            BOOL v10 = (void *)MEMORY[0x1E4F28DC0];
            id v11 = (void *)MEMORY[0x1E4F1CAD0];
            uint64_t v12 = objc_opt_class();
            uint64_t v13 = objc_opt_class();
            uint64_t v14 = objc_opt_class();
            uint64_t v15 = objc_opt_class();
            uint64_t v16 = objc_opt_class();
            v17 = objc_msgSend(v11, "setWithObjects:", v12, v13, v14, v15, v16, objc_opt_class(), 0);
            v18 = [v5 value];
            id v53 = 0;
            id v19 = [v10 unarchivedObjectOfClasses:v17 fromData:v18 error:&v53];
            id v20 = v53;

            if (v19)
            {
              id v7 = v41;
              uint64_t v21 = [[v9 alloc] initWithSerializedRepresentation:v19 variableProvider:0 parameter:v41];
              id v6 = v43;
              if (v21)
              {
                v22 = v21;
                [v37 setObject:v21 forKey:v43];
              }
              else
              {
                v23 = getWFRemoteExecutionLogObject();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315650;
                  v60 = "-[WFRemoteExecutionAskEachTimeRequest inflateParameterStatesWithAction:]";
                  __int16 v61 = 2114;
                  v62 = v43;
                  __int16 v63 = 2114;
                  id v64 = v20;
                  _os_log_impl(&dword_1C7F0A000, v23, OS_LOG_TYPE_ERROR, "%s An error occurred when inflating parameter (%{public}@) state data, error: %{public}@", buf, 0x20u);
                }

                v22 = 0;
              }
            }
            else
            {
              v22 = getWFRemoteExecutionLogObject();
              id v7 = v41;
              id v6 = v43;
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                v60 = "-[WFRemoteExecutionAskEachTimeRequest inflateParameterStatesWithAction:]";
                __int16 v61 = 2114;
                v62 = v43;
                __int16 v63 = 2114;
                id v64 = v20;
                _os_log_impl(&dword_1C7F0A000, v22, OS_LOG_TYPE_ERROR, "%s An error occurred when inflating serialized data for key %{public}@, error: %{public}@", buf, 0x20u);
              }
            }
          }
        }
        uint64_t v40 = [obj countByEnumeratingWithState:&v54 objects:v65 count:16];
      }
      while (v40);
    }

    objc_storeStrong((id *)&v36->_parameterKeysAndStates, v37);
    [(WFRemoteExecutionAskEachTimeRequest *)v36 setParameterKeysAndStatesData:0];
    v44 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v42 = [(WFRemoteExecutionAskEachTimeRequest *)v36 possibleStatesByParameterKeyData];
    uint64_t v24 = [v42 countByEnumeratingWithState:&v49 objects:v58 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v50;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v50 != v26) {
            objc_enumerationMutation(v42);
          }
          id v28 = *(void **)(*((void *)&v49 + 1) + 8 * j);
          v29 = [v28 key];
          v30 = [v45 parameterForKey:v29];
          uint64_t v31 = [v30 singleStateClass];
          if (v31)
          {
            uint64_t v32 = v31;
            v33 = [v28 values];
            v46[0] = MEMORY[0x1E4F143A8];
            v46[1] = 3221225472;
            v46[2] = __72__WFRemoteExecutionAskEachTimeRequest_inflateParameterStatesWithAction___block_invoke;
            v46[3] = &unk_1E654CF48;
            uint64_t v48 = v32;
            id v47 = v30;
            v34 = objc_msgSend(v33, "if_map:", v46);

            [(NSDictionary *)v44 setObject:v34 forKey:v29];
          }
        }
        uint64_t v25 = [v42 countByEnumeratingWithState:&v49 objects:v58 count:16];
      }
      while (v25);
    }

    possibleStatesByParameterKey = v36->_possibleStatesByParameterKey;
    v36->_possibleStatesByParameterKey = v44;

    [(WFRemoteExecutionAskEachTimeRequest *)v36 setPossibleStatesByParameterKeyData:0];
  }
}

id __72__WFRemoteExecutionAskEachTimeRequest_inflateParameterStatesWithAction___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = [MEMORY[0x1E4F28F98] propertyListWithData:a2 options:0 format:0 error:0];
  v4 = (void *)[objc_alloc(*(Class *)(a1 + 40)) initWithSerializedRepresentation:v3 variableProvider:0 parameter:*(void *)(a1 + 32)];

  return v4;
}

- (WFRemoteExecutionAskEachTimeRequest)initWithAction:(id)a3 parameters:(id)a4 associatedRunRequestIdentifier:(id)a5 possibleStatesByParameterKey:(id)a6
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
LABEL_17:
    id v37 = [MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInMethod:a2, self, @"WFRemoteExecutionAskEachTimeRequest.m", 34, @"Invalid parameter not satisfying: %@", @"parameters" object file lineNumber description];

    if (v13) {
      goto LABEL_4;
    }
    goto LABEL_18;
  }
  id v36 = [MEMORY[0x1E4F28B00] currentHandler];
  [v36 handleFailureInMethod:a2, self, @"WFRemoteExecutionAskEachTimeRequest.m", 33, @"Invalid parameter not satisfying: %@", @"action" object file lineNumber description];

  if (!v12) {
    goto LABEL_17;
  }
LABEL_3:
  if (v13) {
    goto LABEL_4;
  }
LABEL_18:
  id v38 = [MEMORY[0x1E4F28B00] currentHandler];
  [v38 handleFailureInMethod:a2, self, @"WFRemoteExecutionAskEachTimeRequest.m", 35, @"Invalid parameter not satisfying: %@", @"associatedRunRequestIdentifier" object file lineNumber description];

LABEL_4:
  v47.receiver = self;
  v47.super_class = (Class)WFRemoteExecutionAskEachTimeRequest;
  uint64_t v15 = [(WFRemoteExecutionRequest *)&v47 init];
  uint64_t v16 = v15;
  if (v15)
  {
    id v39 = v14;
    id v40 = v13;
    obuint64_t j = a6;
    objc_storeStrong((id *)&v15->_associatedRunRequestIdentifier, a5);
    uint64_t v17 = [v11 identifier];
    actionIdentifier = v16->_actionIdentifier;
    v16->_actionIdentifier = (NSString *)v17;

    uint64_t v19 = [v11 serializedParameters];
    actionSerializedParameters = v16->_actionSerializedParameters;
    v16->_actionSerializedParameters = (NSDictionary *)v19;

    uint64_t v21 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v22 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v42 = v12;
    id v23 = v12;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v44;
      do
      {
        uint64_t v27 = 0;
        do
        {
          if (*(void *)v44 != v26) {
            objc_enumerationMutation(v23);
          }
          id v28 = [*(id *)(*((void *)&v43 + 1) + 8 * v27) key];
          [(NSArray *)v22 addObject:v28];
          v29 = [v11 parameterStateForKey:v28];
          if (v29) {
            [(NSDictionary *)v21 setObject:v29 forKey:v28];
          }

          ++v27;
        }
        while (v25 != v27);
        uint64_t v25 = [v23 countByEnumeratingWithState:&v43 objects:v48 count:16];
      }
      while (v25);
    }

    parameterKeys = v16->_parameterKeys;
    v16->_parameterKeys = v22;
    uint64_t v31 = v22;

    parameterKeysAndStates = v16->_parameterKeysAndStates;
    v16->_parameterKeysAndStates = v21;
    v33 = v21;

    objc_storeStrong((id *)&v16->_possibleStatesByParameterKey, obj);
    v34 = v16;
    id v12 = v42;
    id v14 = v39;
    id v13 = v40;
  }

  return v16;
}

- (WFRemoteExecutionAskEachTimeRequest)initWithData:(id)a3 error:(id *)a4
{
  v5.receiver = self;
  v5.super_class = (Class)WFRemoteExecutionAskEachTimeRequest;
  return [(WFRemoteExecutionRequest *)&v5 initWithData:a3 error:a4];
}

+ (int64_t)version
{
  return 1;
}

@end