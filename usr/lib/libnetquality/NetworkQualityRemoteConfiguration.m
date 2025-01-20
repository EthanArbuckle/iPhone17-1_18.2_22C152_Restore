@interface NetworkQualityRemoteConfiguration
- (NSString)testEndpoint;
- (NetworkQualityRemoteConfiguration)initWithData:(id)a3 andConfig:(id)a4;
- (NetworkQualityRemoteConfiguration)initWithDictionary:(id)a3 andConfig:(id)a4;
- (id)URLForURLType:(int)a3;
- (id)portForURLType:(int)a3;
- (id)testEndpoint:(int)a3;
- (void)setTestEndpoint:(id)a3;
@end

@implementation NetworkQualityRemoteConfiguration

- (NetworkQualityRemoteConfiguration)initWithData:(id)a3 andConfig:(id)a4
{
  id v6 = a4;
  id v11 = 0;
  v7 = [MEMORY[0x263F08900] JSONObjectWithData:a3 options:0 error:&v11];
  id v8 = v11;
  if (v7)
  {
    self = [(NetworkQualityRemoteConfiguration *)self initWithDictionary:v7 andConfig:v6];
    v9 = self;
  }
  else
  {
    netqual_log_init();
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR)) {
      -[NetworkQualityRemoteConfiguration initWithData:andConfig:]();
    }
    v9 = 0;
  }

  return v9;
}

- (NetworkQualityRemoteConfiguration)initWithDictionary:(id)a3 andConfig:(id)a4
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  v48 = (NSString *)a3;
  id v46 = a4;
  v59.receiver = self;
  v59.super_class = (Class)NetworkQualityRemoteConfiguration;
  v49 = [(NetworkQualityRemoteConfiguration *)&v59 init];
  id v6 = v49;
  if (!v49) {
    goto LABEL_58;
  }
  netqual_log_init();
  v7 = os_log_netqual;
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v63 = "-[NetworkQualityRemoteConfiguration initWithDictionary:andConfig:]";
    __int16 v64 = 1024;
    int v65 = 50;
    __int16 v66 = 2112;
    v67 = v48;
    _os_log_impl(&dword_2192FE000, v7, OS_LOG_TYPE_DEFAULT, "%s:%u - [Staging] Got configuration: %@", buf, 0x1Cu);
  }
  v47 = [(NSString *)v48 objectForKeyedSubscript:@"version", a4];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_33:
    netqual_log_init();
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR)) {
      -[NetworkQualityRemoteConfiguration initWithDictionary:andConfig:]();
    }
    goto LABEL_41;
  }
  if (!v47) {
    goto LABEL_33;
  }
  id v8 = [(NSString *)v48 objectForKeyedSubscript:@"urls"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    id v8 = 0;
  }
  if (![v8 count])
  {
    netqual_log_init();
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR)) {
      -[NetworkQualityRemoteConfiguration initWithDictionary:andConfig:]();
    }

LABEL_41:
    v26 = 0;
    goto LABEL_59;
  }
  id v50 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  uint64_t v9 = [&unk_26CAB1DF8 countByEnumeratingWithState:&v55 objects:v61 count:16];
  if (!v9) {
    goto LABEL_20;
  }
  uint64_t v10 = *(void *)v56;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v56 != v10) {
        objc_enumerationMutation(&unk_26CAB1DF8);
      }
      uint64_t v12 = *(void *)(*((void *)&v55 + 1) + 8 * i);
      v13 = [v8 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (!v13) {
          continue;
        }
        v14 = [&unk_26CAB1DF8 objectForKeyedSubscript:v12];
        v15 = [NSURL URLWithString:v13];
        [v50 setObject:v15 forKeyedSubscript:v14];
      }
    }
    uint64_t v9 = [&unk_26CAB1DF8 countByEnumeratingWithState:&v55 objects:v61 count:16];
  }
  while (v9);
LABEL_20:
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  uint64_t v16 = [&unk_26CAB1E20 countByEnumeratingWithState:&v51 objects:v60 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v52;
    while (2)
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v52 != v17) {
          objc_enumerationMutation(&unk_26CAB1E20);
        }
        v19 = [v50 objectForKeyedSubscript:*(void *)(*((void *)&v51 + 1) + 8 * j)];
        BOOL v20 = v19 == 0;

        if (v20)
        {
          netqual_log_init();
          if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_ERROR)) {
            -[NetworkQualityRemoteConfiguration initWithDictionary:andConfig:].cold.4();
          }

          goto LABEL_41;
        }
      }
      uint64_t v16 = [&unk_26CAB1E20 countByEnumeratingWithState:&v51 objects:v60 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }
  objc_storeStrong((id *)&v49->_urls, v50);
  v21 = [(NSString *)v48 objectForKeyedSubscript:@"test_endpoint"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_43:
    netqual_log_init();
    if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEBUG)) {
      -[NetworkQualityRemoteConfiguration initWithDictionary:andConfig:]();
    }
    v27 = NSURL;
    v28 = [v46 configuration];
    v29 = [v27 URLWithString:v28];

    v30 = [v29 port];
    BOOL v31 = v30 == 0;

    if (v31)
    {
      v35 = [v29 scheme];
      int v36 = [v35 isEqualToString:@"https"];

      if (v36)
      {
        v37 = v49;
        port = v49->_port;
        v38 = @"443";
      }
      else
      {
        v39 = [v29 scheme];
        int v40 = [v39 isEqualToString:@"http"];

        if (!v40)
        {
LABEL_53:

          v21 = 0;
          goto LABEL_54;
        }
        v37 = v49;
        port = v49->_port;
        v38 = @"80";
      }
      v37->_port = &v38->isa;
    }
    else
    {
      port = [v29 port];
      uint64_t v33 = [port stringValue];
      v34 = v49->_port;
      v49->_port = (NSString *)v33;
    }
    goto LABEL_53;
  }
  if (!v21) {
    goto LABEL_43;
  }
  v22 = v49->_port;
  v49->_port = (NSString *)@"443";

  netqual_log_init();
  v23 = os_log_netqual;
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_INFO))
  {
    v24 = v49;
    v25 = v49->_port;
    *(_DWORD *)buf = 136315650;
    v63 = "-[NetworkQualityRemoteConfiguration initWithDictionary:andConfig:]";
    __int16 v64 = 1024;
    int v65 = 103;
    __int16 v66 = 2112;
    v67 = v25;
    _os_log_impl(&dword_2192FE000, v23, OS_LOG_TYPE_INFO, "%s:%u - Assuming port %@", buf, 0x1Cu);
    goto LABEL_55;
  }
LABEL_54:
  v24 = v49;
LABEL_55:
  [(NetworkQualityRemoteConfiguration *)v24 setTestEndpoint:v21];
  netqual_log_init();
  v41 = (void *)os_log_netqual;
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_INFO))
  {
    v42 = v41;
    v43 = [(NetworkQualityRemoteConfiguration *)v49 testEndpoint];
    *(_DWORD *)buf = 136315650;
    v63 = "-[NetworkQualityRemoteConfiguration initWithDictionary:andConfig:]";
    __int16 v64 = 1024;
    int v65 = 107;
    __int16 v66 = 2112;
    v67 = v43;
    _os_log_impl(&dword_2192FE000, v42, OS_LOG_TYPE_INFO, "%s:%u - test endpoint: %@", buf, 0x1Cu);
  }
  objc_storeStrong((id *)&v49->_config, obj);

  id v6 = v49;
LABEL_58:
  v26 = v6;
LABEL_59:

  return v26;
}

- (id)URLForURLType:(int)a3
{
  urls = self->_urls;
  v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  v5 = [(NSDictionary *)urls objectForKeyedSubscript:v4];

  return v5;
}

- (id)portForURLType:(int)a3
{
  if (a3 > 2)
  {
    v4 = @"0";
  }
  else
  {
    v4 = self->_port;
  }
  return v4;
}

- (id)testEndpoint:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(NetworkQualityConfiguration *)self->_config edgeRelay]
    || [(NetworkQualityConfiguration *)self->_config edgeRelayRemote])
  {
    goto LABEL_3;
  }
  id v6 = [(NetworkQualityConfiguration *)self->_config hostOverride];

  if (v6)
  {
    v7 = [(NetworkQualityConfiguration *)self->_config hostOverride];
  }
  else
  {
    id v8 = [(NetworkQualityRemoteConfiguration *)self testEndpoint];

    if (!v8)
    {
LABEL_3:
      nw_endpoint_t host = 0;
      goto LABEL_9;
    }
    v7 = [(NetworkQualityRemoteConfiguration *)self testEndpoint];
  }
  id v9 = v7;
  uint64_t v10 = (const char *)[v9 UTF8String];
  id v11 = [(NetworkQualityRemoteConfiguration *)self portForURLType:v3];
  nw_endpoint_t host = nw_endpoint_create_host(v10, (const char *)[v11 UTF8String]);

LABEL_9:

  return host;
}

- (NSString)testEndpoint
{
  return self->_testEndpoint;
}

- (void)setTestEndpoint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testEndpoint, 0);
  objc_storeStrong((id *)&self->_port, 0);
  objc_storeStrong((id *)&self->_config, 0);

  objc_storeStrong((id *)&self->_urls, 0);
}

- (void)initWithData:andConfig:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_2192FE000, v0, v1, "%s:%u - Could not deserialize data: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)initWithDictionary:andConfig:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_1();
  *(_DWORD *)((char *)&v1[3] + 2) = 54;
  _os_log_error_impl(&dword_2192FE000, v0, OS_LOG_TYPE_ERROR, "%s:%u - server response without version spec", (uint8_t *)v1, 0x12u);
}

- (void)initWithDictionary:andConfig:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_1();
  *(_DWORD *)((char *)&v1[3] + 2) = 60;
  _os_log_error_impl(&dword_2192FE000, v0, OS_LOG_TYPE_ERROR, "%s:%u - No urls in data", (uint8_t *)v1, 0x12u);
}

- (void)initWithDictionary:andConfig:.cold.3()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_1();
  *(_DWORD *)((char *)&v1[3] + 2) = 90;
  _os_log_debug_impl(&dword_2192FE000, v0, OS_LOG_TYPE_DEBUG, "%s:%u - server response without test_endpoint spec", (uint8_t *)v1, 0x12u);
}

- (void)initWithDictionary:andConfig:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_2192FE000, v0, v1, "%s:%u - Missing required configuration %@", v2, v3, v4, v5, 2u);
}

- (void)initWithDictionary:andConfig:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_2192FE000, v0, v1, "%s:%u - Caught an exception %@ while parsing JSON response", v2, v3, v4, v5, 2u);
}

@end