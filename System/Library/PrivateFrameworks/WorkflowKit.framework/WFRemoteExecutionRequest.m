@interface WFRemoteExecutionRequest
+ (BOOL)isUnsupportedVersionError:(id)a3;
+ (BOOL)supportsVersion:(int64_t)a3;
+ (id)identifierFromData:(id)a3 error:(id *)a4;
+ (id)unsupportedVersionError;
+ (int64_t)version;
- (BOOL)readFrom:(id)a3 error:(id *)a4;
- (BOOL)readMessageFromData:(id)a3 error:(id *)a4;
- (BOOL)writeTo:(id)a3 error:(id *)a4;
- (NSString)identifier;
- (WFRemoteExecutionRequest)init;
- (WFRemoteExecutionRequest)initWithData:(id)a3 error:(id *)a4;
- (id)emptyProtobufError;
- (id)writeMessageToWriter:(id)a3 error:(id *)a4;
- (int64_t)minimumSupportedVersion;
- (int64_t)version;
- (void)setIdentifier:(id)a3;
@end

@implementation WFRemoteExecutionRequest

- (void).cxx_destruct
{
}

- (int64_t)version
{
  return self->_version;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)minimumSupportedVersion
{
  return self->_minimumSupportedVersion;
}

- (id)emptyProtobufError
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v6 = *MEMORY[0x1E4F28568];
  v7[0] = @"Attempted to write protobuf for message but resulting data was empty.";
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  v4 = [v2 errorWithDomain:@"WFRemoteExecutionRequestErrorDomain" code:0 userInfo:v3];

  return v4;
}

- (BOOL)writeTo:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = objc_alloc_init(WFREPBRequest);
  v8 = [(WFRemoteExecutionRequest *)self identifier];
  [(WFREPBRequest *)v7 setIdentifier:v8];

  -[WFREPBRequest setVersion:](v7, "setVersion:", [(id)objc_opt_class() version]);
  id v9 = objc_alloc_init(MEMORY[0x1E4F94098]);
  id v14 = 0;
  v10 = [(WFRemoteExecutionRequest *)self writeMessageToWriter:v9 error:&v14];
  id v11 = v14;
  if (v10)
  {
    [(WFREPBRequest *)v7 setMessage:v10];
    [(WFREPBRequest *)v7 writeTo:v6];
  }
  else
  {
    v12 = getWFRemoteExecutionLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[WFRemoteExecutionRequest writeTo:error:]";
      __int16 v17 = 2114;
      id v18 = v11;
      _os_log_impl(&dword_1C7F0A000, v12, OS_LOG_TYPE_FAULT, "%s Writing message from request failed with error: %{public}@", buf, 0x16u);
    }

    if (a4) {
      *a4 = v11;
    }
  }

  return v10 != 0;
}

- (BOOL)readFrom:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = objc_alloc_init(WFREPBRequest);
  BOOL v8 = [(PBCodable *)v7 readFrom:v6 error:a4];

  if (!v8)
  {
    v15 = getWFRemoteExecutionLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[WFRemoteExecutionRequest readFrom:error:]";
      _os_log_impl(&dword_1C7F0A000, v15, OS_LOG_TYPE_FAULT, "%s Failed to read base request protobuf", buf, 0xCu);
    }

LABEL_12:
    BOOL v12 = 0;
    goto LABEL_17;
  }
  id v9 = [(WFREPBRequest *)v7 identifier];
  identifier = self->_identifier;
  self->_identifier = v9;

  self->_version = [(WFREPBRequest *)v7 version];
  if (([(id)objc_opt_class() supportsVersion:self->_version] & 1) == 0)
  {
    v16 = getWFRemoteExecutionLogObject();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[WFRemoteExecutionRequest readFrom:error:]";
      _os_log_impl(&dword_1C7F0A000, v16, OS_LOG_TYPE_FAULT, "%s Unsupported version of request", buf, 0xCu);
    }

    if (a4)
    {
      [(id)objc_opt_class() unsupportedVersionError];
      BOOL v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    goto LABEL_12;
  }
  id v11 = [(WFREPBRequest *)v7 message];
  id v18 = 0;
  BOOL v12 = [(WFRemoteExecutionRequest *)self readMessageFromData:v11 error:&v18];
  id v13 = v18;
  if (!v12)
  {
    id v14 = getWFRemoteExecutionLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v20 = "-[WFRemoteExecutionRequest readFrom:error:]";
      __int16 v21 = 2114;
      id v22 = v13;
      _os_log_impl(&dword_1C7F0A000, v14, OS_LOG_TYPE_FAULT, "%s Reading message from request failed with error: %{public}@", buf, 0x16u);
    }

    if (a4) {
      *a4 = v13;
    }
  }

LABEL_17:
  return v12;
}

- (id)writeMessageToWriter:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)readMessageFromData:(id)a3 error:(id *)a4
{
  return 0;
}

- (WFRemoteExecutionRequest)initWithData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WFRemoteExecutionRequest;
  v7 = [(WFRemoteExecutionRequest *)&v11 init];
  if (v7)
  {
    BOOL v8 = (void *)[objc_alloc(MEMORY[0x1E4F94090]) initWithData:v6];
    if ([(WFRemoteExecutionRequest *)v7 readFrom:v8 error:a4]) {
      id v9 = v7;
    }
    else {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (WFRemoteExecutionRequest)init
{
  v8.receiver = self;
  v8.super_class = (Class)WFRemoteExecutionRequest;
  v2 = [(WFRemoteExecutionRequest *)&v8 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v4 = [v3 UUIDString];
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v4;

    id v6 = v2;
  }

  return v2;
}

+ (int64_t)version
{
  return 1;
}

+ (BOOL)supportsVersion:(int64_t)a3
{
  return [a1 version] == a3;
}

+ (id)unsupportedVersionError
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28C58];
  v8[0] = *MEMORY[0x1E4F28588];
  v3 = WFLocalizedString(@"Could Not Run Remotely");
  v9[0] = v3;
  v8[1] = *MEMORY[0x1E4F28568];
  uint64_t v4 = WFLocalizedString(@"This remote execution request is unsupported in this version of Shortcuts. Please update your device.");
  v9[1] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  id v6 = [v2 errorWithDomain:@"WFRemoteExecutionRequestErrorDomain" code:2 userInfo:v5];

  return v6;
}

+ (BOOL)isUnsupportedVersionError:(id)a3
{
  id v4 = a3;
  v5 = [a1 unsupportedVersionError];
  id v6 = [v5 domain];
  v7 = [v4 domain];
  if ([v6 isEqualToString:v7])
  {
    uint64_t v8 = [v5 code];
    BOOL v9 = v8 == [v4 code];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

+ (id)identifierFromData:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v5 = (objc_class *)MEMORY[0x1E4F94090];
  id v6 = a3;
  v7 = (void *)[[v5 alloc] initWithData:v6];

  uint64_t v8 = objc_alloc_init(WFREPBRequest);
  id v14 = 0;
  BOOL v9 = [(PBCodable *)v8 readFrom:v7 error:&v14];
  id v10 = v14;
  if (v9)
  {
    objc_super v11 = [(WFREPBRequest *)v8 identifier];
  }
  else
  {
    BOOL v12 = getWFRemoteExecutionLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "+[WFRemoteExecutionRequest identifierFromData:error:]";
      __int16 v17 = 2114;
      id v18 = v10;
      _os_log_impl(&dword_1C7F0A000, v12, OS_LOG_TYPE_FAULT, "%s Failed to read base request protobuf: %{public}@", buf, 0x16u);
    }

    objc_super v11 = 0;
    if (a4) {
      *a4 = v10;
    }
  }

  return v11;
}

@end