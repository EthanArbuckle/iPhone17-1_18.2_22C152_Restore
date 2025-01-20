@interface MIBUSelectResponse
- (BOOL)_deserialize:(id)a3;
- (MIBUSelectResponse)init;
- (NSNumber)protocolVersion;
- (id)serialize;
- (void)serialize;
- (void)setProtocolVersion:(id)a3;
@end

@implementation MIBUSelectResponse

- (MIBUSelectResponse)init
{
  v5.receiver = self;
  v5.super_class = (Class)MIBUSelectResponse;
  v2 = [(MIBUNFCResponse *)&v5 init];
  v3 = v2;
  if (v2) {
    [(MIBUSelectResponse *)v2 setProtocolVersion:0];
  }
  return v3;
}

- (id)serialize
{
  v12[1] = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  if (![(MIBUNFCResponse *)self rejected])
  {
    v4 = [(MIBUSelectResponse *)self protocolVersion];
    v12[0] = v4;
    objc_super v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
    char v6 = [v3 serialize:&unk_26E53EB38 withValue:v5];

    if (v6)
    {
      v7 = [(MIBUNFCResponse *)self error];
      char v8 = [v3 serializeResponseError:v7];

      if (v8)
      {
        v9 = [v3 serializedData];
        goto LABEL_5;
      }
      if (MIBUOnceToken != -1) {
        dispatch_once(&MIBUOnceToken, &__block_literal_global_7);
      }
      v11 = (void *)MIBUConnObj;
      if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
        [(MIBUDeviceInfoResponse *)v11 serialize];
      }
    }
    else
    {
      if (MIBUOnceToken != -1) {
        dispatch_once(&MIBUOnceToken, &__block_literal_global_5);
      }
      if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
        -[MIBUSelectResponse serialize]();
      }
    }
  }
  v9 = 0;
LABEL_5:

  return v9;
}

void __31__MIBUSelectResponse_serialize__block_invoke()
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

void __31__MIBUSelectResponse_serialize__block_invoke_5()
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
      dispatch_once(&MIBUOnceToken, &__block_literal_global_10);
    }
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      -[MIBUSelectResponse _deserialize:]();
    }
    goto LABEL_22;
  }
  id v14 = 0;
  BOOL v7 = [(MIBUDeserializer *)v5 deserializeResponseError:&v14];
  id v8 = v14;
  uint64_t v9 = v8;
  if (!v7)
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_13_0);
    }
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      -[MIBUStatusResponse _deserialize:].cold.7();
    }
    v11 = 0;
    goto LABEL_23;
  }
  if (v8)
  {
    v11 = 0;
    goto LABEL_6;
  }
  uint64_t v10 = [v6 objectForKey:&unk_26E53E7D8];
  if (!v10)
  {
    if (MIBUOnceToken != -1) {
      dispatch_once(&MIBUOnceToken, &__block_literal_global_16);
    }
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR)) {
      -[MIBUSelectResponse _deserialize:]();
    }
LABEL_22:
    v11 = 0;
    uint64_t v9 = 0;
LABEL_23:
    BOOL v12 = 0;
    goto LABEL_7;
  }
  v11 = (void *)v10;
  [(MIBUSelectResponse *)self setProtocolVersion:v10];
  uint64_t v9 = 0;
LABEL_6:
  BOOL v12 = 1;
LABEL_7:
  [(MIBUNFCResponse *)self setError:v9];

  return v12;
}

void __35__MIBUSelectResponse__deserialize___block_invoke()
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

void __35__MIBUSelectResponse__deserialize___block_invoke_11()
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

void __35__MIBUSelectResponse__deserialize___block_invoke_14()
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

- (NSNumber)protocolVersion
{
  return self->_protocolVersion;
}

- (void)setProtocolVersion:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)serialize
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_2309BC000, v0, v1, "Failed to serialize protocol version", v2, v3, v4, v5, v6);
}

- (void)_deserialize:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_2309BC000, v0, v1, "Failed to deserialize payload for Select command", v2, v3, v4, v5, v6);
}

- (void)_deserialize:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_2309BC000, v0, v1, "Failed to deserialize protocol version", v2, v3, v4, v5, v6);
}

@end