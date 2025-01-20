@interface NetworkQualityClient
+ (id)getXpcConn;
+ (void)findLocalMeasurementEndpoints:(id)a3;
+ (void)performMeasurementWithConfiguration:(id)a3 reply:(id)a4;
@end

@implementation NetworkQualityClient

+ (id)getXpcConn
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithServiceName:@"com.apple.network-quality.NetworkQualityXPC"];
  v3 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_27065A788];
  [v2 setRemoteObjectInterface:v3];

  [v2 resume];
  return v2;
}

+ (void)performMeasurementWithConfiguration:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [a1 getXpcConn];
  v8 = [v9 remoteObjectProxyWithErrorHandler:&__block_literal_global_0];
  [v8 performMeasurementWithConfiguration:v7 reply:v6];
}

void __66__NetworkQualityClient_performMeasurementWithConfiguration_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = a2;
  netqual_log_init();
  v3 = (void *)os_log_netqual;
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v5 = [v2 localizedDescription];
    id v6 = [v2 localizedFailureReason];
    int v7 = 136315906;
    v8 = "+[NetworkQualityClient performMeasurementWithConfiguration:reply:]_block_invoke";
    __int16 v9 = 1024;
    int v10 = 37;
    __int16 v11 = 2112;
    v12 = v5;
    __int16 v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_257453000, v4, OS_LOG_TYPE_DEFAULT, "%s:%u - Error on remote object proxy: %@ %@\n", (uint8_t *)&v7, 0x26u);
  }
}

+ (void)findLocalMeasurementEndpoints:(id)a3
{
  id v4 = a3;
  id v6 = [a1 getXpcConn];
  v5 = [v6 remoteObjectProxyWithErrorHandler:&__block_literal_global_8];
  [v5 findLocalMeasurementEndpoints:v4];
}

void __54__NetworkQualityClient_findLocalMeasurementEndpoints___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = a2;
  netqual_log_init();
  v3 = (void *)os_log_netqual;
  if (os_log_type_enabled((os_log_t)os_log_netqual, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    v5 = [v2 localizedDescription];
    id v6 = [v2 localizedFailureReason];
    int v7 = 136315906;
    v8 = "+[NetworkQualityClient findLocalMeasurementEndpoints:]_block_invoke";
    __int16 v9 = 1024;
    int v10 = 48;
    __int16 v11 = 2112;
    v12 = v5;
    __int16 v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_257453000, v4, OS_LOG_TYPE_DEFAULT, "%s:%u - Error on remote object proxy: %@ %@\n", (uint8_t *)&v7, 0x26u);
  }
}

@end