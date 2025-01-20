@interface WFRemoteExecutionStopRequest
+ (int64_t)version;
- (BOOL)readMessageFromData:(id)a3 error:(id *)a4;
- (NSString)requestIdentifier;
- (WFRemoteExecutionStopRequest)initWithRequestIdentifier:(id)a3;
- (id)writeMessageToWriter:(id)a3 error:(id *)a4;
@end

@implementation WFRemoteExecutionStopRequest

+ (int64_t)version
{
  return 1;
}

- (void).cxx_destruct
{
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (id)writeMessageToWriter:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(WFREPBStopRequest);
  v7 = [(WFRemoteExecutionStopRequest *)self requestIdentifier];
  [(WFREPBStopRequest *)v6 setRequestIdentifier:v7];

  [(WFREPBStopRequest *)v6 writeTo:v5];
  v8 = [v5 immutableData];

  return v8;
}

- (BOOL)readMessageFromData:(id)a3 error:(id *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v6 = (objc_class *)MEMORY[0x1E4F94090];
  id v7 = a3;
  v8 = (void *)[[v6 alloc] initWithData:v7];

  v9 = objc_alloc_init(WFREPBStopRequest);
  id v16 = 0;
  BOOL v10 = [(PBCodable *)v9 readFrom:v8 error:&v16];
  id v11 = v16;
  if (v10)
  {
    v12 = [(WFREPBStopRequest *)v9 requestIdentifier];
    requestIdentifier = self->_requestIdentifier;
    self->_requestIdentifier = v12;
  }
  else
  {
    v14 = getWFRemoteExecutionLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[WFRemoteExecutionStopRequest readMessageFromData:error:]";
      __int16 v19 = 2114;
      id v20 = v11;
      _os_log_impl(&dword_1C7F0A000, v14, OS_LOG_TYPE_FAULT, "%s Failed to read stop request protobuf, %{public}@", buf, 0x16u);
    }

    if (a4) {
      *a4 = v11;
    }
  }

  return v10;
}

- (WFRemoteExecutionStopRequest)initWithRequestIdentifier:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFRemoteExecutionStopRequest.m", 19, @"Invalid parameter not satisfying: %@", @"requestIdentifier" object file lineNumber description];
  }
  id v7 = [(WFRemoteExecutionRequest *)self init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_requestIdentifier, a3);
    v9 = v8;
  }

  return v8;
}

@end