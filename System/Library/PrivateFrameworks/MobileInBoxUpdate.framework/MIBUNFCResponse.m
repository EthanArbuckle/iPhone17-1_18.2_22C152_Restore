@interface MIBUNFCResponse
- (BOOL)_deserialize:(id)a3;
- (BOOL)rejected;
- (MIBUNFCResponse)init;
- (MIBUNFCResponse)initWithResponsePayload:(id)a3;
- (NSError)error;
- (id)serialize;
- (void)serialize;
- (void)setError:(id)a3;
- (void)setRejected:(BOOL)a3;
@end

@implementation MIBUNFCResponse

- (MIBUNFCResponse)init
{
  v5.receiver = self;
  v5.super_class = (Class)MIBUNFCResponse;
  v2 = [(MIBUNFCResponse *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(MIBUNFCResponse *)v2 setRejected:0];
    [(MIBUNFCResponse *)v3 setError:0];
  }
  return v3;
}

- (MIBUNFCResponse)initWithResponsePayload:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(MIBUNFCResponse *)self init];
  v6 = v5;
  if (v5 && ![(MIBUNFCResponse *)v5 _deserialize:v4]) {
    v7 = 0;
  }
  else {
    v7 = v6;
  }

  return v7;
}

- (id)serialize
{
  v3 = objc_opt_new();
  id v4 = [(MIBUNFCResponse *)self error];
  char v5 = [v3 serializeResponseError:v4];

  if (v5)
  {
    v6 = [v3 serializedData];
  }
  else
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_11);
    }
    v8 = (void *)MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      [(MIBUNFCResponse *)v8 serialize];
    }
    v6 = 0;
  }

  return v6;
}

void __28__MIBUNFCResponse_serialize__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

- (BOOL)_deserialize:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[MIBUDeserializer alloc] initWithData:v4];

  uint64_t v6 = [(MIBUDeserializer *)v5 deserialize];

  if (!v6)
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_5_3);
    }
    v11 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      -[MIBUNFCResponse _deserialize:](v11, v12, v13, v14, v15, v16, v17, v18);
    }
    goto LABEL_14;
  }
  id v27 = 0;
  BOOL v7 = [(MIBUDeserializer *)v5 deserializeResponseError:&v27];
  id v8 = v27;
  if (!v7)
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_8_1);
    }
    v19 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      -[MIBUNFCResponse _deserialize:](v19, v20, v21, v22, v23, v24, v25, v26);
    }

LABEL_14:
    BOOL v9 = 0;
    goto LABEL_4;
  }
  [(MIBUNFCResponse *)self setError:v8];

  BOOL v9 = 1;
LABEL_4:

  return v9;
}

void __32__MIBUNFCResponse__deserialize___block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void __32__MIBUNFCResponse__deserialize___block_invoke_6()
{
  os_log_t v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    BOOL v2 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v2) {
      __authInstalllogHandler_block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

- (BOOL)rejected
{
  return self->_rejected;
}

- (void)setRejected:(BOOL)a3
{
  self->_rejected = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)serialize
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 error];
  int v5 = 138543362;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_2309BC000, v3, OS_LOG_TYPE_ERROR, "Failed to serialize responseerror: %{public}@", (uint8_t *)&v5, 0xCu);
}

- (void)_deserialize:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_deserialize:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end