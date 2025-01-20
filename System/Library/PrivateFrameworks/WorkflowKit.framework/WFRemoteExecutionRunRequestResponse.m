@interface WFRemoteExecutionRunRequestResponse
+ (int64_t)version;
- (BOOL)readMessageFromData:(id)a3 error:(id *)a4;
- (NSData)errorData;
- (NSDictionary)variables;
- (NSError)error;
- (NSMutableArray)outputData;
- (NSMutableArray)variablesData;
- (NSString)runRequestIdentifier;
- (WFContentCollection)output;
- (WFRemoteExecutionCoordinator)coordinator;
- (WFRemoteExecutionRunRequestResponse)initWithData:(id)a3 error:(id *)a4;
- (WFRemoteExecutionRunRequestResponse)initWithRunRequestIdentifier:(id)a3 variables:(id)a4 output:(id)a5 error:(id)a6;
- (id)writeMessageToWriter:(id)a3 error:(id *)a4;
- (void)inflateOutputData:(id)a3 fileCoordinator:(id)a4 completion:(id)a5;
- (void)inflateVariablesData:(id)a3 fileCoordinator:(id)a4 completion:(id)a5;
- (void)inflateWithFileCoordinator:(id)a3 completion:(id)a4;
- (void)setCoordinator:(id)a3;
- (void)setErrorData:(id)a3;
- (void)setOutputData:(id)a3;
- (void)setVariablesData:(id)a3;
@end

@implementation WFRemoteExecutionRunRequestResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_errorData, 0);
  objc_storeStrong((id *)&self->_outputData, 0);
  objc_storeStrong((id *)&self->_variablesData, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong((id *)&self->_variables, 0);
  objc_storeStrong((id *)&self->_runRequestIdentifier, 0);
}

- (void)setCoordinator:(id)a3
{
}

- (WFRemoteExecutionCoordinator)coordinator
{
  return self->_coordinator;
}

- (void)setErrorData:(id)a3
{
}

- (NSData)errorData
{
  return self->_errorData;
}

- (void)setOutputData:(id)a3
{
}

- (NSMutableArray)outputData
{
  return self->_outputData;
}

- (void)setVariablesData:(id)a3
{
}

- (NSMutableArray)variablesData
{
  return self->_variablesData;
}

- (NSError)error
{
  return self->_error;
}

- (WFContentCollection)output
{
  return self->_output;
}

- (NSDictionary)variables
{
  return self->_variables;
}

- (NSString)runRequestIdentifier
{
  return self->_runRequestIdentifier;
}

- (id)writeMessageToWriter:(id)a3 error:(id *)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v48 = a3;
  v5 = objc_opt_new();
  v6 = [(WFRemoteExecutionRunRequestResponse *)self runRequestIdentifier];
  [v5 setRunRequestIdentifier:v6];

  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v8 = [(WFRemoteExecutionRunRequestResponse *)self variables];
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __66__WFRemoteExecutionRunRequestResponse_writeMessageToWriter_error___block_invoke;
  v55[3] = &unk_1E6550200;
  v55[4] = self;
  id v9 = v7;
  id v56 = v9;
  [v8 enumerateKeysAndObjectsUsingBlock:v55];

  v46 = v9;
  v47 = v5;
  [v5 setVariablesDatas:v9];
  id v50 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v10 = [(WFRemoteExecutionRunRequestResponse *)self output];
  v11 = [v10 items];

  id obj = v11;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v51 objects:v57 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v52 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v51 + 1) + 8 * i);
        v17 = [WFRemoteExecutionFileCoder alloc];
        v18 = [(WFRemoteExecutionRunRequestResponse *)self coordinator];
        v19 = [(WFRemoteExecutionRequest *)self identifier];
        v20 = [(WFRemoteExecutionFileCoder *)v17 initWithCoordinator:v18 requestIdentifier:v19];

        v21 = objc_opt_new();
        v22 = objc_msgSend(MEMORY[0x1E4F28DB0], "wf_securelyArchivedDataWithRootObject:fileCoder:", v16, v20);
        [v21 setItem:v22];

        [v21 setEncodingType:2];
        v23 = [v21 data];
        [v50 addObject:v23];
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
    }
    while (v13);
  }

  [v47 setOutputDatas:v50];
  v24 = [(WFRemoteExecutionRunRequestResponse *)self error];

  if (v24)
  {
    v25 = objc_opt_new();
    v26 = [(WFRemoteExecutionRunRequestResponse *)self error];
    objc_msgSend(v25, "setCode:", objc_msgSend(v26, "code"));

    v27 = [(WFRemoteExecutionRunRequestResponse *)self error];
    v28 = [v27 domain];
    [v25 setDomain:v28];

    v29 = [(WFRemoteExecutionRunRequestResponse *)self error];
    v30 = [v29 userInfo];
    uint64_t v31 = *MEMORY[0x1E4F28568];
    v32 = [v30 objectForKey:*MEMORY[0x1E4F28568]];

    if (v32)
    {
      v33 = [(WFRemoteExecutionRunRequestResponse *)self error];
      v34 = [v33 userInfo];
      v35 = [v34 objectForKey:v31];
      [v25 setLocalizedDescription:v35];
    }
    v36 = [(WFRemoteExecutionRunRequestResponse *)self error];
    v37 = [v36 userInfo];
    uint64_t v38 = *MEMORY[0x1E4F28588];
    v39 = [v37 objectForKey:*MEMORY[0x1E4F28588]];

    if (v39)
    {
      v40 = [(WFRemoteExecutionRunRequestResponse *)self error];
      v41 = [v40 userInfo];
      v42 = [v41 objectForKey:v38];
      [v25 setLocalizedFailureReason:v42];
    }
    v43 = [v25 data];
    [v47 setErrorData:v43];
  }
  [v47 writeTo:v48];
  v44 = [v48 immutableData];

  return v44;
}

void __66__WFRemoteExecutionRunRequestResponse_writeMessageToWriter_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_opt_new();
  v21 = v5;
  [v7 setKey:v5];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = [v6 items];
  uint64_t v8 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v13 = [WFRemoteExecutionFileCoder alloc];
        uint64_t v14 = [*(id *)(a1 + 32) coordinator];
        v15 = [*(id *)(a1 + 32) identifier];
        uint64_t v16 = [(WFRemoteExecutionFileCoder *)v13 initWithCoordinator:v14 requestIdentifier:v15];

        v17 = objc_opt_new();
        [v17 setEncodingType:2];
        v18 = objc_msgSend(MEMORY[0x1E4F28DB0], "wf_securelyArchivedDataWithRootObject:fileCoder:", v12, v16);
        [v17 setItem:v18];

        [v7 addItems:v17];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v9);
  }

  v19 = *(void **)(a1 + 40);
  v20 = [v7 data];
  [v19 addObject:v20];
}

- (BOOL)readMessageFromData:(id)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = (objc_class *)MEMORY[0x1E4F94090];
  id v6 = a3;
  id v7 = (void *)[[v5 alloc] initWithData:v6];

  uint64_t v8 = objc_alloc_init(WFREPBRunRequestResponse);
  id v20 = 0;
  BOOL v9 = [(PBCodable *)v8 readFrom:v7 error:&v20];
  id v10 = v20;
  if (v9)
  {
    v11 = [(WFREPBRunRequestResponse *)v8 runRequestIdentifier];
    runRequestIdentifier = self->_runRequestIdentifier;
    self->_runRequestIdentifier = v11;

    uint64_t v13 = [(WFREPBRunRequestResponse *)v8 variablesDatas];
    variablesData = self->_variablesData;
    self->_variablesData = v13;

    v15 = [(WFREPBRunRequestResponse *)v8 outputDatas];
    outputData = self->_outputData;
    self->_outputData = v15;

    v17 = [(WFREPBRunRequestResponse *)v8 errorData];
    p_super = &self->_errorData->super;
    self->_errorData = v17;
  }
  else
  {
    p_super = getWFRemoteExecutionLogObject();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[WFRemoteExecutionRunRequestResponse readMessageFromData:error:]";
      __int16 v23 = 2114;
      id v24 = v10;
      _os_log_impl(&dword_1C7F0A000, p_super, OS_LOG_TYPE_FAULT, "%s Failed to read run request response protobuf, %{public}@", buf, 0x16u);
    }
  }

  return v9;
}

- (void)inflateOutputData:(id)a3 fileCoordinator:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  BOOL v9 = objc_msgSend(a3, "if_map:", &__block_literal_global_189);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __84__WFRemoteExecutionRunRequestResponse_inflateOutputData_fileCoordinator_completion___block_invoke_2;
  v14[3] = &unk_1E6550158;
  id v15 = v7;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __84__WFRemoteExecutionRunRequestResponse_inflateOutputData_fileCoordinator_completion___block_invoke_191;
  v12[3] = &unk_1E65586C8;
  id v13 = v8;
  id v10 = v8;
  id v11 = v7;
  objc_msgSend(v9, "if_mapAsynchronously:completionHandler:", v14, v12);
}

void __84__WFRemoteExecutionRunRequestResponse_inflateOutputData_fileCoordinator_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F1CAD0];
  id v8 = a2;
  BOOL v9 = [v7 setWithObject:objc_opt_class()];
  id v10 = (void *)MEMORY[0x1E4F28DC0];
  id v11 = [v8 item];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __84__WFRemoteExecutionRunRequestResponse_inflateOutputData_fileCoordinator_completion___block_invoke_3;
  v14[3] = &unk_1E6550130;
  id v15 = v6;
  id v12 = v6;
  id v13 = objc_msgSend(v10, "wf_securelyUnarchiveObjectWithData:allowedClasses:completionHandler:", v11, v9, v14);

  [*(id *)(a1 + 32) registerArchiver:v13];
}

void __84__WFRemoteExecutionRunRequestResponse_inflateOutputData_fileCoordinator_completion___block_invoke_191(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = (void *)MEMORY[0x1E4F5A830];
  id v6 = a3;
  id v7 = [v5 collectionWithItems:a2];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v7, v6);
}

uint64_t __84__WFRemoteExecutionRunRequestResponse_inflateOutputData_fileCoordinator_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v3();
  }
  else
  {
    id v5 = getWFRemoteExecutionLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      int v6 = 136315138;
      id v7 = "-[WFRemoteExecutionRunRequestResponse inflateOutputData:fileCoordinator:completion:]_block_invoke_3";
      _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_FAULT, "%s No content item", (uint8_t *)&v6, 0xCu);
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

WFREPBContentItem *__84__WFRemoteExecutionRunRequestResponse_inflateOutputData_fileCoordinator_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[WFREPBContentItem alloc] initWithData:v2];

  return v3;
}

- (void)inflateVariablesData:(id)a3 fileCoordinator:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  BOOL v9 = objc_msgSend(a3, "if_map:", &__block_literal_global_2677);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __87__WFRemoteExecutionRunRequestResponse_inflateVariablesData_fileCoordinator_completion___block_invoke_2;
  v14[3] = &unk_1E6550180;
  id v15 = v7;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __87__WFRemoteExecutionRunRequestResponse_inflateVariablesData_fileCoordinator_completion___block_invoke_2_186;
  v12[3] = &unk_1E65586C8;
  id v13 = v8;
  id v10 = v8;
  id v11 = v7;
  objc_msgSend(v9, "if_mapAsynchronously:completionHandler:", v14, v12);
}

void __87__WFRemoteExecutionRunRequestResponse_inflateVariablesData_fileCoordinator_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id v8 = [v6 items];

  if (!v8) {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
  BOOL v9 = [v6 items];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __87__WFRemoteExecutionRunRequestResponse_inflateVariablesData_fileCoordinator_completion___block_invoke_3;
  v15[3] = &unk_1E6550158;
  id v16 = *(id *)(a1 + 32);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __87__WFRemoteExecutionRunRequestResponse_inflateVariablesData_fileCoordinator_completion___block_invoke_181;
  v12[3] = &unk_1E6558040;
  id v13 = v6;
  id v14 = v7;
  id v10 = v6;
  id v11 = v7;
  objc_msgSend(v9, "if_mapAsynchronously:completionHandler:", v15, v12);
}

void __87__WFRemoteExecutionRunRequestResponse_inflateVariablesData_fileCoordinator_completion___block_invoke_2_186(uint64_t a1, void *a2, void *a3)
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

void __87__WFRemoteExecutionRunRequestResponse_inflateVariablesData_fileCoordinator_completion___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F1CAD0];
  id v8 = a2;
  uint64_t v9 = [v7 setWithObject:objc_opt_class()];
  uint64_t v10 = (void *)MEMORY[0x1E4F28DC0];
  uint64_t v11 = [v8 item];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __87__WFRemoteExecutionRunRequestResponse_inflateVariablesData_fileCoordinator_completion___block_invoke_4;
  v14[3] = &unk_1E6550130;
  id v15 = v6;
  id v12 = v6;
  id v13 = objc_msgSend(v10, "wf_securelyUnarchiveObjectWithData:allowedClasses:completionHandler:", v11, v9, v14);

  [*(id *)(a1 + 32) registerArchiver:v13];
}

void __87__WFRemoteExecutionRunRequestResponse_inflateVariablesData_fileCoordinator_completion___block_invoke_181(uint64_t a1, void *a2, void *a3)
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

uint64_t __87__WFRemoteExecutionRunRequestResponse_inflateVariablesData_fileCoordinator_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v3();
  }
  else
  {
    uint64_t v5 = getWFRemoteExecutionLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      int v6 = 136315138;
      id v7 = "-[WFRemoteExecutionRunRequestResponse inflateVariablesData:fileCoordinator:completion:]_block_invoke_4";
      _os_log_impl(&dword_1C7F0A000, v5, OS_LOG_TYPE_FAULT, "%s No content item", (uint8_t *)&v6, 0xCu);
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

WFREPBVariable *__87__WFRemoteExecutionRunRequestResponse_inflateVariablesData_fileCoordinator_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[WFREPBVariable alloc] initWithData:v2];

  return v3;
}

- (void)inflateWithFileCoordinator:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3032000000;
  v43[3] = __Block_byref_object_copy_;
  v43[4] = __Block_byref_object_dispose_;
  id v44 = 0;
  uint64_t v9 = dispatch_group_create();
  uint64_t v10 = [(WFRemoteExecutionRunRequestResponse *)self variablesData];

  if (v10)
  {
    dispatch_group_enter(v9);
    id v11 = [(WFRemoteExecutionRunRequestResponse *)self variablesData];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __77__WFRemoteExecutionRunRequestResponse_inflateWithFileCoordinator_completion___block_invoke;
    v40[3] = &unk_1E65500E0;
    v40[4] = self;
    v42 = v43;
    v41 = v9;
    [(WFRemoteExecutionRunRequestResponse *)self inflateVariablesData:v11 fileCoordinator:v7 completion:v40];
  }
  id v12 = [(WFRemoteExecutionRunRequestResponse *)self outputData];

  if (v12)
  {
    dispatch_group_enter(v9);
    id v13 = [(WFRemoteExecutionRunRequestResponse *)self outputData];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __77__WFRemoteExecutionRunRequestResponse_inflateWithFileCoordinator_completion___block_invoke_2;
    v37[3] = &unk_1E6550108;
    v37[4] = self;
    v39 = v43;
    uint64_t v38 = v9;
    [(WFRemoteExecutionRunRequestResponse *)self inflateOutputData:v13 fileCoordinator:v7 completion:v37];
  }
  id v14 = [(WFRemoteExecutionRunRequestResponse *)self errorData];

  if (v14)
  {
    id v15 = [WFREPBError alloc];
    long long v16 = [(WFRemoteExecutionRunRequestResponse *)self errorData];
    long long v17 = [(WFREPBError *)v15 initWithData:v16];

    long long v18 = [(WFREPBError *)v17 localizedDescription];
    uint64_t v19 = [v18 length];
    if (v19
      || ([(WFREPBError *)v17 localizedFailureReason],
          uint64_t v4 = objc_claimAutoreleasedReturnValue(),
          [v4 length]))
    {
      id v20 = objc_opt_new();
      if (v19)
      {
LABEL_12:

        uint64_t v21 = [(WFREPBError *)v17 localizedDescription];
        uint64_t v22 = [v21 length];

        if (v22)
        {
          __int16 v23 = [(WFREPBError *)v17 localizedDescription];
          [v20 setObject:v23 forKey:*MEMORY[0x1E4F28568]];
        }
        id v24 = [(WFREPBError *)v17 localizedFailureReason];
        uint64_t v25 = [v24 length];

        if (v25)
        {
          long long v26 = [(WFREPBError *)v17 localizedFailureReason];
          [v20 setObject:v26 forKey:*MEMORY[0x1E4F28588]];
        }
        v27 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v28 = [(WFREPBError *)v17 domain];
        objc_msgSend(v27, "errorWithDomain:code:userInfo:", v28, (int)-[WFREPBError code](v17, "code"), v20);
        v29 = (NSError *)objc_claimAutoreleasedReturnValue();
        error = self->_error;
        self->_error = v29;

        errorData = self->_errorData;
        self->_errorData = 0;

        goto LABEL_17;
      }
    }
    else
    {
      id v20 = 0;
    }

    goto LABEL_12;
  }
LABEL_17:
  v32 = dispatch_get_global_queue(0, 0);
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __77__WFRemoteExecutionRunRequestResponse_inflateWithFileCoordinator_completion___block_invoke_3;
  v34[3] = &unk_1E65579F0;
  v34[4] = self;
  id v35 = v8;
  v36 = v43;
  id v33 = v8;
  dispatch_group_notify(v9, v32, v34);

  _Block_object_dispose(v43, 8);
}

void __77__WFRemoteExecutionRunRequestResponse_inflateWithFileCoordinator_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), a2);
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 64);
  *(void *)(v7 + 64) = 0;

  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __77__WFRemoteExecutionRunRequestResponse_inflateWithFileCoordinator_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), a2);
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 72);
  *(void *)(v7 + 72) = 0;

  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __77__WFRemoteExecutionRunRequestResponse_inflateWithFileCoordinator_completion___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[4], *(void *)(*(void *)(a1[6] + 8) + 40));
}

- (WFRemoteExecutionRunRequestResponse)initWithRunRequestIdentifier:(id)a3 variables:(id)a4 output:(id)a5 error:(id)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (!v12)
  {
    id v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"WFRemoteExecutionRunRequestResponse.m", 36, @"Invalid parameter not satisfying: %@", @"runRequestIdentifier" object file lineNumber description];
  }
  v21.receiver = self;
  v21.super_class = (Class)WFRemoteExecutionRunRequestResponse;
  long long v16 = [(WFRemoteExecutionRequest *)&v21 init];
  long long v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_runRequestIdentifier, a3);
    objc_storeStrong((id *)&v17->_variables, a4);
    objc_storeStrong((id *)&v17->_output, a5);
    objc_storeStrong((id *)&v17->_error, a6);
    long long v18 = v17;
  }

  return v17;
}

- (WFRemoteExecutionRunRequestResponse)initWithData:(id)a3 error:(id *)a4
{
  v5.receiver = self;
  v5.super_class = (Class)WFRemoteExecutionRunRequestResponse;
  return [(WFRemoteExecutionRequest *)&v5 initWithData:a3 error:a4];
}

+ (int64_t)version
{
  return 1;
}

@end