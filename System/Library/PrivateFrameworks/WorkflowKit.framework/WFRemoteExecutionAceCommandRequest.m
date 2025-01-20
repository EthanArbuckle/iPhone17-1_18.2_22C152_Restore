@interface WFRemoteExecutionAceCommandRequest
+ (int64_t)version;
- (BOOL)readMessageFromData:(id)a3 error:(id *)a4;
- (NSDictionary)aceCommandDictionary;
- (WFRemoteExecutionAceCommandRequest)initWithAceCommandDictionary:(id)a3;
- (WFRemoteExecutionAceCommandRequest)initWithData:(id)a3 error:(id *)a4;
- (id)writeMessageToWriter:(id)a3 error:(id *)a4;
@end

@implementation WFRemoteExecutionAceCommandRequest

- (void).cxx_destruct
{
}

- (NSDictionary)aceCommandDictionary
{
  return self->_aceCommandDictionary;
}

- (id)writeMessageToWriter:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = objc_alloc_init(WFREPBAceCommandRequest);
  v8 = (void *)MEMORY[0x1E4F28DB0];
  v9 = [(WFRemoteExecutionAceCommandRequest *)self aceCommandDictionary];
  id v15 = 0;
  v10 = [v8 archivedDataWithRootObject:v9 requiringSecureCoding:1 error:&v15];
  id v11 = v15;

  if (v10)
  {
    [(WFREPBAceCommandRequest *)v7 setAceCommandData:v10];
    [(WFREPBAceCommandRequest *)v7 writeTo:v6];
    v12 = [v6 immutableData];
  }
  else
  {
    v13 = getWFRemoteExecutionLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[WFRemoteExecutionAceCommandRequest writeMessageToWriter:error:]";
      __int16 v18 = 2114;
      id v19 = v11;
      _os_log_impl(&dword_1C7F0A000, v13, OS_LOG_TYPE_FAULT, "%s Unable to archive ace command dictionary: %{public}@", buf, 0x16u);
    }

    v12 = 0;
    if (a4) {
      *a4 = v11;
    }
  }

  return v12;
}

- (BOOL)readMessageFromData:(id)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = (objc_class *)MEMORY[0x1E4F94090];
  id v7 = a3;
  v8 = (void *)[[v6 alloc] initWithData:v7];

  v9 = objc_alloc_init(WFREPBAceCommandRequest);
  id v32 = 0;
  BOOL v10 = [(PBCodable *)v9 readFrom:v8 error:&v32];
  id v11 = v32;
  v12 = v11;
  if (v10)
  {
    v29 = a4;
    id v30 = v11;
    v13 = [(WFREPBAceCommandRequest *)v9 aceCommandData];
    v14 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_msgSend(v14, "setWithObjects:", v15, v16, v17, v18, v19, objc_opt_class(), 0);
    id v31 = 0;
    v21 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v20 fromData:v13 error:&v31];
    id v22 = v31;
    aceCommandDictionary = self->_aceCommandDictionary;
    self->_aceCommandDictionary = v21;

    v24 = self->_aceCommandDictionary;
    BOOL v25 = v24 != 0;
    if (!v24)
    {
      v26 = getWFRemoteExecutionLogObject();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v34 = "-[WFRemoteExecutionAceCommandRequest readMessageFromData:error:]";
        __int16 v35 = 2114;
        id v36 = v22;
        _os_log_impl(&dword_1C7F0A000, v26, OS_LOG_TYPE_FAULT, "%s Unable to convert data into the ace command's dictionary representation: %{public}@", buf, 0x16u);
      }

      if (v29) {
        id *v29 = v22;
      }
    }

    v12 = v30;
  }
  else
  {
    v27 = getWFRemoteExecutionLogObject();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v34 = "-[WFRemoteExecutionAceCommandRequest readMessageFromData:error:]";
      __int16 v35 = 2114;
      id v36 = v12;
      _os_log_impl(&dword_1C7F0A000, v27, OS_LOG_TYPE_FAULT, "%s Failed to read ace command protobuf, %{public}@", buf, 0x16u);
    }

    BOOL v25 = 0;
    if (a4) {
      *a4 = v12;
    }
  }

  return v25;
}

- (WFRemoteExecutionAceCommandRequest)initWithAceCommandDictionary:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFRemoteExecutionAceCommandRequest;
  id v6 = [(WFRemoteExecutionRequest *)&v10 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_aceCommandDictionary, a3);
    v8 = v7;
  }

  return v7;
}

- (WFRemoteExecutionAceCommandRequest)initWithData:(id)a3 error:(id *)a4
{
  v5.receiver = self;
  v5.super_class = (Class)WFRemoteExecutionAceCommandRequest;
  return [(WFRemoteExecutionRequest *)&v5 initWithData:a3 error:a4];
}

+ (int64_t)version
{
  return 1;
}

@end