@interface WFRemoteExecutionRunRequest
+ (int64_t)version;
- (BOOL)readMessageFromData:(id)a3 error:(id *)a4;
- (NSDictionary)processedParameters;
- (NSDictionary)serializedParameters;
- (NSDictionary)variables;
- (NSMutableArray)inputData;
- (NSMutableArray)processedParametersData;
- (NSMutableArray)variablesData;
- (NSString)actionIdentifier;
- (NSString)workflowID;
- (WFContentCollection)input;
- (WFRemoteExecutionCoordinator)coordinator;
- (WFRemoteExecutionRunRequest)initWithAction:(id)a3 workflowControllerState:(id)a4;
- (WFRemoteExecutionRunRequest)initWithData:(id)a3 error:(id *)a4;
- (id)writeMessageToWriter:(id)a3 error:(id *)a4;
- (void)inflateInputData:(id)a3 fileCoordinator:(id)a4 completion:(id)a5;
- (void)inflateProcessedParametersData:(id)a3 fileCoordinator:(id)a4 completion:(id)a5;
- (void)inflateVariablesData:(id)a3 fileCoordinator:(id)a4 completion:(id)a5;
- (void)inflateWithFileCoordinator:(id)a3 completion:(id)a4;
- (void)setCoordinator:(id)a3;
- (void)setInputData:(id)a3;
- (void)setProcessedParametersData:(id)a3;
- (void)setVariablesData:(id)a3;
@end

@implementation WFRemoteExecutionRunRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_processedParametersData, 0);
  objc_storeStrong((id *)&self->_inputData, 0);
  objc_storeStrong((id *)&self->_variablesData, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_processedParameters, 0);
  objc_storeStrong((id *)&self->_serializedParameters, 0);
  objc_storeStrong((id *)&self->_variables, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
  objc_storeStrong((id *)&self->_workflowID, 0);
}

- (void)setCoordinator:(id)a3
{
}

- (WFRemoteExecutionCoordinator)coordinator
{
  return self->_coordinator;
}

- (void)setProcessedParametersData:(id)a3
{
}

- (NSMutableArray)processedParametersData
{
  return self->_processedParametersData;
}

- (void)setInputData:(id)a3
{
}

- (NSMutableArray)inputData
{
  return self->_inputData;
}

- (void)setVariablesData:(id)a3
{
}

- (NSMutableArray)variablesData
{
  return self->_variablesData;
}

- (WFContentCollection)input
{
  return self->_input;
}

- (NSDictionary)processedParameters
{
  return self->_processedParameters;
}

- (NSDictionary)serializedParameters
{
  return self->_serializedParameters;
}

- (NSDictionary)variables
{
  return self->_variables;
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (NSString)workflowID
{
  return self->_workflowID;
}

- (id)writeMessageToWriter:(id)a3 error:(id *)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = objc_opt_new();
  [v7 setPayloadType:1];
  v8 = objc_opt_new();
  v9 = [(WFRemoteExecutionRunRequest *)self actionIdentifier];
  [v8 setActionIdentifier:v9];

  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v11 = [(WFRemoteExecutionRunRequest *)self variables];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __58__WFRemoteExecutionRunRequest_writeMessageToWriter_error___block_invoke;
  v49[3] = &unk_1E6550200;
  v49[4] = self;
  id v12 = v10;
  id v50 = v12;
  [v11 enumerateKeysAndObjectsUsingBlock:v49];

  [v8 setVariables:v12];
  v13 = [(WFRemoteExecutionRunRequest *)self processedParameters];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __58__WFRemoteExecutionRunRequest_writeMessageToWriter_error___block_invoke_221;
  v47[3] = &unk_1E6550228;
  v47[4] = self;
  id v14 = v8;
  id v48 = v14;
  [v13 enumerateKeysAndObjectsUsingBlock:v47];

  v15 = (void *)MEMORY[0x1E4F28F98];
  v16 = [(WFRemoteExecutionRunRequest *)self serializedParameters];
  id v46 = 0;
  v17 = [v15 dataWithPropertyList:v16 format:200 options:0 error:&v46];
  id v18 = v46;
  [v14 setSerializedParameters:v17];

  if (v18)
  {
    v19 = 0;
    if (a4) {
      *a4 = v18;
    }
  }
  else
  {
    v37 = v14;
    id v38 = v12;
    v39 = v7;
    v40 = v6;
    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v21 = [(WFRemoteExecutionRunRequest *)self input];
    v22 = [v21 items];

    id obj = v22;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v42 objects:v51 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v43 != v25) {
            objc_enumerationMutation(obj);
          }
          uint64_t v27 = *(void *)(*((void *)&v42 + 1) + 8 * i);
          v28 = objc_opt_new();
          v29 = [WFRemoteExecutionFileCoder alloc];
          v30 = [(WFRemoteExecutionRunRequest *)self coordinator];
          v31 = [(WFRemoteExecutionRequest *)self identifier];
          v32 = [(WFRemoteExecutionFileCoder *)v29 initWithCoordinator:v30 requestIdentifier:v31];

          v33 = objc_msgSend(MEMORY[0x1E4F28DB0], "wf_securelyArchivedDataWithRootObject:fileCoder:", v27, v32);
          [v28 setItem:v33];

          [v28 setEncodingType:2];
          [v20 addObject:v28];
        }
        uint64_t v24 = [obj countByEnumeratingWithState:&v42 objects:v51 count:16];
      }
      while (v24);
    }

    id v14 = v37;
    [v37 setInputs:v20];
    v34 = objc_opt_new();
    [v37 writeTo:v34];
    v35 = [v34 immutableData];
    v7 = v39;
    [v39 setPayload:v35];

    id v6 = v40;
    [v39 writeTo:v40];
    v19 = [v40 immutableData];

    id v12 = v38;
    id v18 = 0;
  }

  return v19;
}

void __58__WFRemoteExecutionRunRequest_writeMessageToWriter_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = objc_opt_new();
  v22 = v5;
  [v7 setKey:v5];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v21 = v6;
  id obj = [v6 items];
  uint64_t v8 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        v13 = [WFRemoteExecutionFileCoder alloc];
        id v14 = [*(id *)(a1 + 32) coordinator];
        v15 = [*(id *)(a1 + 32) identifier];
        v16 = [(WFRemoteExecutionFileCoder *)v13 initWithCoordinator:v14 requestIdentifier:v15];

        v17 = objc_opt_new();
        [v17 setEncodingType:2];
        id v18 = objc_msgSend(MEMORY[0x1E4F28DB0], "wf_securelyArchivedDataWithRootObject:fileCoder:", v12, v16);
        [v17 setItem:v18];

        v19 = [v17 item];

        if (!v19)
        {
          id v20 = getWFRemoteExecutionLogObject();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v29 = "-[WFRemoteExecutionRunRequest writeMessageToWriter:error:]_block_invoke";
            __int16 v30 = 2114;
            uint64_t v31 = v12;
            _os_log_impl(&dword_1C7F0A000, v20, OS_LOG_TYPE_ERROR, "%s No data returned for content item in variable: %{public}@", buf, 0x16u);
          }
        }
        [v7 addItems:v17];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v9);
  }

  [*(id *)(a1 + 40) addObject:v7];
}

void __58__WFRemoteExecutionRunRequest_writeMessageToWriter_error___block_invoke_221(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  v7 = [WFRemoteExecutionFileCoder alloc];
  uint64_t v8 = [*(id *)(a1 + 32) coordinator];
  uint64_t v9 = [*(id *)(a1 + 32) identifier];
  uint64_t v12 = [(WFRemoteExecutionFileCoder *)v7 initWithCoordinator:v8 requestIdentifier:v9];

  uint64_t v10 = objc_opt_new();
  [v10 setKey:v6];

  v11 = objc_msgSend(MEMORY[0x1E4F28DB0], "wf_securelyArchivedDataWithRootObject:fileCoder:", v5, v12);

  [v10 setValue:v11];
  [*(id *)(a1 + 40) addProcessedParameters:v10];
}

- (BOOL)readMessageFromData:(id)a3 error:(id *)a4
{
  v56[1] = *MEMORY[0x1E4F143B8];
  id v6 = (objc_class *)MEMORY[0x1E4F94090];
  id v7 = a3;
  uint64_t v8 = (void *)[[v6 alloc] initWithData:v7];

  uint64_t v9 = objc_alloc_init(WFREPBRunRequest);
  id v48 = 0;
  BOOL v10 = [(PBCodable *)v9 readFrom:v8 error:&v48];
  id v11 = v48;
  if (v10)
  {
    int v12 = [(WFREPBRunRequest *)v9 payloadType];
    v13 = [(WFREPBRunRequest *)v9 payload];
    if (v12 == 1)
    {
      id v14 = (void *)[objc_alloc(MEMORY[0x1E4F94090]) initWithData:v13];
      v15 = objc_opt_new();
      id v47 = 0;
      char v16 = [v15 readFrom:v14 error:&v47];
      id v45 = v47;
      if (v16)
      {
        long long v44 = v13;
        v17 = [v15 actionIdentifier];
        actionIdentifier = self->_actionIdentifier;
        self->_actionIdentifier = v17;

        v19 = getWFRemoteExecutionLogObject();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          id v20 = [(WFRemoteExecutionRequest *)self identifier];
          v21 = [(WFRemoteExecutionRunRequest *)self actionIdentifier];
          *(_DWORD *)buf = 136315650;
          id v50 = "-[WFRemoteExecutionRunRequest readMessageFromData:error:]";
          __int16 v51 = 2114;
          id v52 = v20;
          __int16 v53 = 2114;
          v54 = v21;
          _os_log_impl(&dword_1C7F0A000, v19, OS_LOG_TYPE_INFO, "%s <%{public}@> action identifier: %{public}@", buf, 0x20u);
        }
        v22 = [v15 variables];
        variablesData = self->_variablesData;
        self->_variablesData = v22;

        long long v24 = (void *)MEMORY[0x1E4F28F98];
        long long v25 = [v15 serializedParameters];
        id v46 = 0;
        long long v26 = [v24 propertyListWithData:v25 options:0 format:0 error:&v46];
        id v27 = v46;
        serializedParameters = self->_serializedParameters;
        self->_serializedParameters = v26;

        v29 = [(NSDictionary *)self->_serializedParameters objectForKey:@"workflowID"];
        if (v29)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            __int16 v30 = v29;
          }
          else {
            __int16 v30 = 0;
          }
        }
        else
        {
          __int16 v30 = 0;
        }
        v37 = v30;

        workflowID = self->_workflowID;
        self->_workflowID = v37;

        BOOL v32 = v27 == 0;
        if (v27)
        {
          v13 = v44;
          if (a4) {
            *a4 = v27;
          }
        }
        else
        {
          v39 = [v15 processedParameters];
          processedParametersData = self->_processedParametersData;
          self->_processedParametersData = v39;

          v41 = [v15 inputs];
          inputData = self->_inputData;
          self->_inputData = v41;

          v13 = v44;
        }

        v36 = v45;
      }
      else
      {
        v35 = getWFRemoteExecutionLogObject();
        v36 = v45;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          id v50 = "-[WFRemoteExecutionRunRequest readMessageFromData:error:]";
          __int16 v51 = 2114;
          id v52 = v45;
          _os_log_impl(&dword_1C7F0A000, v35, OS_LOG_TYPE_FAULT, "%s Failed to read single action execution from payload: %{public}@", buf, 0x16u);
        }

        BOOL v32 = 0;
        if (a4) {
          *a4 = v45;
        }
      }
    }
    else
    {
      uint64_t v33 = getWFRemoteExecutionLogObject();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        id v50 = "-[WFRemoteExecutionRunRequest readMessageFromData:error:]";
        __int16 v51 = 1024;
        LODWORD(v52) = v12;
        _os_log_impl(&dword_1C7F0A000, v33, OS_LOG_TYPE_FAULT, "%s Unsupported run request type: %i", buf, 0x12u);
      }

      if (!a4)
      {
        BOOL v32 = 0;
LABEL_33:

        goto LABEL_34;
      }
      v34 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v55 = *MEMORY[0x1E4F28568];
      v56[0] = @"Unsupported run request type";
      id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:&v55 count:1];
      [v34 errorWithDomain:@"WFRemoteExecutionRequestErrorDomain" code:1 userInfo:v14];
      BOOL v32 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_33;
  }
  uint64_t v31 = getWFRemoteExecutionLogObject();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v50 = "-[WFRemoteExecutionRunRequest readMessageFromData:error:]";
    __int16 v51 = 2114;
    id v52 = v11;
    _os_log_impl(&dword_1C7F0A000, v31, OS_LOG_TYPE_FAULT, "%s Failed to read run request protobuf, %{public}@", buf, 0x16u);
  }

  BOOL v32 = 0;
  if (a4) {
    *a4 = v11;
  }
LABEL_34:

  return v32;
}

- (void)inflateProcessedParametersData:(id)a3 fileCoordinator:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v11 = a3;
  id v12 = objc_alloc_init(v10);
  v13 = +[WFActionRegistry sharedRegistry];
  id v14 = [(WFRemoteExecutionRunRequest *)self actionIdentifier];
  v15 = [(WFRemoteExecutionRunRequest *)self serializedParameters];
  char v16 = [v13 createActionWithIdentifier:v14 serializedParameters:v15];

  [v16 initializeParametersIfNecessary];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __89__WFRemoteExecutionRunRequest_inflateProcessedParametersData_fileCoordinator_completion___block_invoke;
  v23[3] = &unk_1E65501D0;
  id v24 = v12;
  id v25 = v8;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __89__WFRemoteExecutionRunRequest_inflateProcessedParametersData_fileCoordinator_completion___block_invoke_204;
  v20[3] = &unk_1E6557EA8;
  id v21 = v24;
  id v22 = v9;
  id v17 = v24;
  id v18 = v9;
  id v19 = v8;
  objc_msgSend(v11, "if_enumerateAsynchronouslyInSequence:completionHandler:", v23, v20);
}

void __89__WFRemoteExecutionRunRequest_inflateProcessedParametersData_fileCoordinator_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v8 = a2;
  id v9 = a4;
  BOOL v10 = +[WFParameterValueRegistry registeredValueClasses];
  id v11 = (void *)MEMORY[0x1E4F28DC0];
  id v12 = [v8 value];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = __89__WFRemoteExecutionRunRequest_inflateProcessedParametersData_fileCoordinator_completion___block_invoke_2;
  id v19 = &unk_1E65501A8;
  id v20 = *(id *)(a1 + 32);
  id v21 = v8;
  id v22 = v9;
  uint64_t v23 = a5;
  id v13 = v9;
  id v14 = v8;
  v15 = objc_msgSend(v11, "wf_securelyUnarchiveObjectWithData:allowedClasses:completionHandler:", v12, v10, &v16);

  objc_msgSend(*(id *)(a1 + 40), "registerArchiver:", v15, v16, v17, v18, v19);
}

uint64_t __89__WFRemoteExecutionRunRequest_inflateProcessedParametersData_fileCoordinator_completion___block_invoke_204(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __89__WFRemoteExecutionRunRequest_inflateProcessedParametersData_fileCoordinator_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    id v5 = [*(id *)(a1 + 40) key];
    [v4 setObject:v3 forKey:v5];
  }
  else
  {
    id v6 = getWFRemoteExecutionLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      id v7 = [*(id *)(a1 + 40) key];
      int v8 = 136315394;
      id v9 = "-[WFRemoteExecutionRunRequest inflateProcessedParametersData:fileCoordinator:completion:]_block_invoke_2";
      __int16 v10 = 2114;
      id v11 = v7;
      _os_log_impl(&dword_1C7F0A000, v6, OS_LOG_TYPE_FAULT, "%s Reading processed parameter (%{public}@) failed", (uint8_t *)&v8, 0x16u);
    }
    **(unsigned char **)(a1 + 56) = 1;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)inflateInputData:(id)a3 fileCoordinator:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __75__WFRemoteExecutionRunRequest_inflateInputData_fileCoordinator_completion___block_invoke;
  v13[3] = &unk_1E6550158;
  id v14 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __75__WFRemoteExecutionRunRequest_inflateInputData_fileCoordinator_completion___block_invoke_200;
  v11[3] = &unk_1E65586C8;
  id v12 = v8;
  id v9 = v8;
  id v10 = v7;
  objc_msgSend(a3, "if_mapAsynchronously:completionHandler:", v13, v11);
}

void __75__WFRemoteExecutionRunRequest_inflateInputData_fileCoordinator_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F1CAD0];
  id v8 = a2;
  id v9 = [v7 setWithObject:objc_opt_class()];
  id v10 = (void *)MEMORY[0x1E4F28DC0];
  id v11 = [v8 item];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __75__WFRemoteExecutionRunRequest_inflateInputData_fileCoordinator_completion___block_invoke_2;
  v14[3] = &unk_1E6550130;
  id v15 = v6;
  id v12 = v6;
  id v13 = objc_msgSend(v10, "wf_securelyUnarchiveObjectWithData:allowedClasses:completionHandler:", v11, v9, v14);

  [*(id *)(a1 + 32) registerArchiver:v13];
}

void __75__WFRemoteExecutionRunRequest_inflateInputData_fileCoordinator_completion___block_invoke_200(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = (void *)MEMORY[0x1E4F5A830];
  id v6 = a3;
  id v7 = [v5 collectionWithItems:a2];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v7, v6);
}

uint64_t __75__WFRemoteExecutionRunRequest_inflateInputData_fileCoordinator_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v3();
  }
  else
  {
    id v5 = getWFRemoteExecutionLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      int v6 = 136315138;
      id v7 = "-[WFRemoteExecutionRunRequest inflateInputData:fileCoordinator:completion:]_block_invoke_2";
      _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_FAULT, "%s No content item", (uint8_t *)&v6, 0xCu);
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)inflateVariablesData:(id)a3 fileCoordinator:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79__WFRemoteExecutionRunRequest_inflateVariablesData_fileCoordinator_completion___block_invoke;
  v13[3] = &unk_1E6550180;
  id v14 = v7;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __79__WFRemoteExecutionRunRequest_inflateVariablesData_fileCoordinator_completion___block_invoke_2_198;
  v11[3] = &unk_1E65586C8;
  id v12 = v8;
  id v9 = v8;
  id v10 = v7;
  objc_msgSend(a3, "if_mapAsynchronously:completionHandler:", v13, v11);
}

void __79__WFRemoteExecutionRunRequest_inflateVariablesData_fileCoordinator_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id v8 = [v6 items];

  if (v8)
  {
    id v9 = [v6 items];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __79__WFRemoteExecutionRunRequest_inflateVariablesData_fileCoordinator_completion___block_invoke_2;
    v13[3] = &unk_1E6550158;
    id v14 = *(id *)(a1 + 32);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __79__WFRemoteExecutionRunRequest_inflateVariablesData_fileCoordinator_completion___block_invoke_193;
    v10[3] = &unk_1E6558040;
    id v12 = v7;
    id v11 = v6;
    objc_msgSend(v9, "if_mapAsynchronously:completionHandler:", v13, v10);
  }
  else
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

void __79__WFRemoteExecutionRunRequest_inflateVariablesData_fileCoordinator_completion___block_invoke_2_198(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v14 = objc_msgSend(v13, "value", (void)v16);
        id v15 = [v13 key];
        [v7 setObject:v14 forKey:v15];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __79__WFRemoteExecutionRunRequest_inflateVariablesData_fileCoordinator_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F1CAD0];
  id v8 = a2;
  uint64_t v9 = [v7 setWithObject:objc_opt_class()];
  uint64_t v10 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v11 = [v8 item];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __79__WFRemoteExecutionRunRequest_inflateVariablesData_fileCoordinator_completion___block_invoke_3;
  v14[3] = &unk_1E6550130;
  id v15 = v6;
  id v12 = v6;
  id v13 = objc_msgSend(v10, "wf_securelyUnarchiveObjectWithData:allowedClasses:completionHandler:", v11, v9, v14);

  [*(id *)(a1 + 32) registerArchiver:v13];
}

void __79__WFRemoteExecutionRunRequest_inflateVariablesData_fileCoordinator_completion___block_invoke_193(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id v8 = [WFRemoteExecutionKeyValuePair alloc];
  id v11 = [*(id *)(a1 + 32) key];
  uint64_t v9 = [MEMORY[0x1E4F5A830] collectionWithItems:v7];

  uint64_t v10 = [(WFRemoteExecutionKeyValuePair *)v8 initWithKey:v11 value:v9];
  (*(void (**)(uint64_t, WFRemoteExecutionKeyValuePair *, id))(v5 + 16))(v5, v10, v6);
}

uint64_t __79__WFRemoteExecutionRunRequest_inflateVariablesData_fileCoordinator_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v3();
  }
  else
  {
    uint64_t v5 = getWFRemoteExecutionLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      int v6 = 136315138;
      id v7 = "-[WFRemoteExecutionRunRequest inflateVariablesData:fileCoordinator:completion:]_block_invoke_3";
      _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_FAULT, "%s No content item", (uint8_t *)&v6, 0xCu);
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)inflateWithFileCoordinator:(id)a3 completion:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = getWFRemoteExecutionLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[WFRemoteExecutionRunRequest inflateWithFileCoordinator:completion:]";
    _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_INFO, "%s Inflating request", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__21928;
  id v38 = __Block_byref_object_dispose__21929;
  id v39 = 0;
  uint64_t v9 = dispatch_group_create();
  uint64_t v10 = [(WFRemoteExecutionRunRequest *)self variablesData];

  if (v10)
  {
    id v11 = getWFRemoteExecutionLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t v33 = 136315138;
      v34 = "-[WFRemoteExecutionRunRequest inflateWithFileCoordinator:completion:]";
      _os_log_impl(&dword_1C7F0A000, v11, OS_LOG_TYPE_INFO, "%s Has variables data", v33, 0xCu);
    }

    dispatch_group_enter(v9);
    id v12 = [(WFRemoteExecutionRunRequest *)self variablesData];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __69__WFRemoteExecutionRunRequest_inflateWithFileCoordinator_completion___block_invoke;
    v30[3] = &unk_1E65500E0;
    v30[4] = self;
    p_long long buf = &buf;
    uint64_t v31 = v9;
    [(WFRemoteExecutionRunRequest *)self inflateVariablesData:v12 fileCoordinator:v6 completion:v30];
  }
  id v13 = [(WFRemoteExecutionRunRequest *)self inputData];

  if (v13)
  {
    id v14 = getWFRemoteExecutionLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t v33 = 136315138;
      v34 = "-[WFRemoteExecutionRunRequest inflateWithFileCoordinator:completion:]";
      _os_log_impl(&dword_1C7F0A000, v14, OS_LOG_TYPE_INFO, "%s Has input data", v33, 0xCu);
    }

    dispatch_group_enter(v9);
    id v15 = [(WFRemoteExecutionRunRequest *)self inputData];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __69__WFRemoteExecutionRunRequest_inflateWithFileCoordinator_completion___block_invoke_183;
    v27[3] = &unk_1E6550108;
    v27[4] = self;
    v29 = &buf;
    v28 = v9;
    [(WFRemoteExecutionRunRequest *)self inflateInputData:v15 fileCoordinator:v6 completion:v27];
  }
  long long v16 = [(WFRemoteExecutionRunRequest *)self processedParametersData];

  if (v16)
  {
    long long v17 = getWFRemoteExecutionLogObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t v33 = 136315138;
      v34 = "-[WFRemoteExecutionRunRequest inflateWithFileCoordinator:completion:]";
      _os_log_impl(&dword_1C7F0A000, v17, OS_LOG_TYPE_INFO, "%s Has processed parameters data", v33, 0xCu);
    }

    dispatch_group_enter(v9);
    long long v18 = [(WFRemoteExecutionRunRequest *)self processedParametersData];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __69__WFRemoteExecutionRunRequest_inflateWithFileCoordinator_completion___block_invoke_185;
    v24[3] = &unk_1E65500E0;
    v24[4] = self;
    long long v26 = &buf;
    id v25 = v9;
    [(WFRemoteExecutionRunRequest *)self inflateProcessedParametersData:v18 fileCoordinator:v6 completion:v24];
  }
  long long v19 = dispatch_get_global_queue(0, 0);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __69__WFRemoteExecutionRunRequest_inflateWithFileCoordinator_completion___block_invoke_186;
  v21[3] = &unk_1E65579F0;
  v21[4] = self;
  id v22 = v7;
  uint64_t v23 = &buf;
  id v20 = v7;
  dispatch_group_notify(v9, v19, v21);

  _Block_object_dispose(&buf, 8);
}

void __69__WFRemoteExecutionRunRequest_inflateWithFileCoordinator_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = getWFRemoteExecutionLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    id v12 = "-[WFRemoteExecutionRunRequest inflateWithFileCoordinator:completion:]_block_invoke";
    __int16 v13 = 2114;
    id v14 = v6;
    _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_INFO, "%s Done with variables: %{public}@", (uint8_t *)&v11, 0x16u);
  }

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), a2);
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void **)(v9 + 80);
  *(void *)(v9 + 80) = 0;

  if (v7) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __69__WFRemoteExecutionRunRequest_inflateWithFileCoordinator_completion___block_invoke_183(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = getWFRemoteExecutionLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    id v12 = "-[WFRemoteExecutionRunRequest inflateWithFileCoordinator:completion:]_block_invoke";
    __int16 v13 = 2114;
    id v14 = v6;
    _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_INFO, "%s Done with input: %{public}@", (uint8_t *)&v11, 0x16u);
  }

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 72), a2);
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void **)(v9 + 88);
  *(void *)(v9 + 88) = 0;

  if (v7) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __69__WFRemoteExecutionRunRequest_inflateWithFileCoordinator_completion___block_invoke_185(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = getWFRemoteExecutionLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315650;
    id v12 = "-[WFRemoteExecutionRunRequest inflateWithFileCoordinator:completion:]_block_invoke";
    __int16 v13 = 2114;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl(&dword_1C7F0A000, v8, OS_LOG_TYPE_INFO, "%s Done with processedParameters: %{public}@, error: %@", (uint8_t *)&v11, 0x20u);
  }

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), a2);
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void **)(v9 + 96);
  *(void *)(v9 + 96) = 0;

  if (v7) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __69__WFRemoteExecutionRunRequest_inflateWithFileCoordinator_completion___block_invoke_186(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = getWFRemoteExecutionLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[WFRemoteExecutionRunRequest inflateWithFileCoordinator:completion:]_block_invoke";
    _os_log_impl(&dword_1C7F0A000, v2, OS_LOG_TYPE_INFO, "%s Finished inflating request", (uint8_t *)&v4, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (WFRemoteExecutionRunRequest)initWithAction:(id)a3 workflowControllerState:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2, self, @"WFRemoteExecutionRunRequest.m", 51, @"Invalid parameter not satisfying: %@", @"action" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v37 = [MEMORY[0x1E4F28B00] currentHandler];
  [v37 handleFailureInMethod:a2, self, @"WFRemoteExecutionRunRequest.m", 52, @"Invalid parameter not satisfying: %@", @"state" object file lineNumber description];

LABEL_3:
  uint64_t v10 = [v9 runningContext];
  int v11 = [v10 identifier];

  if (!v11)
  {
    id v38 = [MEMORY[0x1E4F28B00] currentHandler];
    [v38 handleFailureInMethod:a2, self, @"WFRemoteExecutionRunRequest.m", 53, @"Invalid parameter not satisfying: %@", @"state.runningContext.identifier" object file lineNumber description];
  }
  v39.receiver = self;
  v39.super_class = (Class)WFRemoteExecutionRunRequest;
  id v12 = [(WFRemoteExecutionRequest *)&v39 init];
  if (v12)
  {
    __int16 v13 = NSString;
    id v14 = [MEMORY[0x1E4F29128] UUID];
    __int16 v15 = [v14 UUIDString];
    id v16 = [v9 runningContext];
    uint64_t v17 = [v16 identifier];
    long long v18 = [v7 identifier];
    long long v19 = [v13 stringWithFormat:@"%@.%@.%@.%lu", v15, v17, v18, objc_msgSend(v9, "currentActionIndex")];
    [(WFRemoteExecutionRequest *)v12 setIdentifier:v19];

    uint64_t v20 = [v7 identifier];
    actionIdentifier = v12->_actionIdentifier;
    v12->_actionIdentifier = (NSString *)v20;

    uint64_t v22 = [v9 variables];
    variables = v12->_variables;
    v12->_variables = (NSDictionary *)v22;

    id v24 = [v7 serializedParameters];
    id v25 = (NSDictionary *)[v24 mutableCopy];

    if (v25)
    {
      long long v26 = [v7 workflow];
      id v27 = [v26 workflowID];
      [(NSDictionary *)v25 setValue:v27 forKey:@"workflowID"];
    }
    serializedParameters = v12->_serializedParameters;
    v12->_serializedParameters = v25;
    v29 = v25;

    uint64_t v30 = [v9 currentProcessedParameters];
    processedParameters = v12->_processedParameters;
    v12->_processedParameters = (NSDictionary *)v30;

    uint64_t v32 = [v9 currentInput];
    input = v12->_input;
    v12->_input = (WFContentCollection *)v32;

    v34 = v12;
  }

  return v12;
}

- (WFRemoteExecutionRunRequest)initWithData:(id)a3 error:(id *)a4
{
  v5.receiver = self;
  v5.super_class = (Class)WFRemoteExecutionRunRequest;
  return [(WFRemoteExecutionRequest *)&v5 initWithData:a3 error:a4];
}

+ (int64_t)version
{
  return 2;
}

@end