@interface MLRemoteConnection
@end

@implementation MLRemoteConnection

void __39___MLRemoteConnection_initWithOptions___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v13 = +[_MLLog clientFramework];
  v14 = v13;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      __39___MLRemoteConnection_initWithOptions___block_invoke_cold_2(a1);
    }

    [WeakRetained doReceive:v9 context:v10 isComplete:a4 error:v11];
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __39___MLRemoteConnection_initWithOptions___block_invoke_cold_1(a1);
    }
  }
}

uint64_t __58___MLRemoteConnection_doReceive_context_isComplete_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v7 = [*(id *)(a1 + 32) packet];
  v8 = [v7 buffer];
  [v8 appendBytes:a4 length:a5];

  return 1;
}

void __71___MLRemoteConnection_predictionFromURL_features_output_options_error___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) packet];
  v3 = [v2 buffer];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    v5 = +[_MLLog clientFramework];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __71___MLRemoteConnection_predictionFromURL_features_output_options_error___block_invoke_cold_1();
    }

    v6 = *(void **)(a1 + 40);
    v7 = [*(id *)(a1 + 32) packet];
    v8 = [v7 buffer];
    [v6 appendData:v8];
  }
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = [*(id *)(a1 + 32) packet];
  [v10 setBuffer:v9];
}

void __66___MLRemoteConnection_sendDataAndWaitForAcknowledgementOrTimeout___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) nwObj];
  [v2 sendData:*(void *)(a1 + 40)];

  v3 = [*(id *)(a1 + 32) nwOptions];
  dispatch_time_t v4 = dispatch_time(0, [v3 receiveTimeoutValue]);

  v5 = [*(id *)(a1 + 32) semaphore];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = dispatch_semaphore_wait(v5, v4) != 0;

  v6 = [*(id *)(a1 + 32) packet];
  [v6 resetDoubleBuffer];

  LODWORD(v5) = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  v7 = +[_MLLog clientFramework];
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __66___MLRemoteConnection_sendDataAndWaitForAcknowledgementOrTimeout___block_invoke_cold_2(a1);
    }

    uint64_t v9 = [*(id *)(a1 + 32) q];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __66___MLRemoteConnection_sendDataAndWaitForAcknowledgementOrTimeout___block_invoke_10;
    block[3] = &unk_264D530C8;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(v9, block);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __66___MLRemoteConnection_sendDataAndWaitForAcknowledgementOrTimeout___block_invoke_cold_1();
    }
  }
}

void __66___MLRemoteConnection_sendDataAndWaitForAcknowledgementOrTimeout___block_invoke_10(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) nwObj];
  [v2 stop];

  id v3 = [*(id *)(a1 + 32) nwObj];
  [v3 restartConnection];
}

void __39___MLRemoteConnection_initWithOptions___block_invoke_cold_1(uint64_t a1)
{
  v1 = NSStringFromSelector(*(SEL *)(a1 + 40));
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_238967000, v2, v3, "%@: lost client connection", v4, v5, v6, v7, v8);
}

void __39___MLRemoteConnection_initWithOptions___block_invoke_cold_2(uint64_t a1)
{
  v1 = NSStringFromSelector(*(SEL *)(a1 + 40));
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_238967000, v2, v3, "%@: Client Callback", v4, v5, v6, v7, v8);
}

void __71___MLRemoteConnection_predictionFromURL_features_output_options_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  uint64_t v2 = NSStringFromSelector(*(SEL *)(v1 + 48));
  uint64_t v3 = [*v0 packet];
  uint64_t v4 = [v3 buffer];
  [v4 length];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_7(&dword_238967000, v5, v6, "%@: Buffer should be empty = %lu", v7, v8, v9, v10, v11);
}

void __66___MLRemoteConnection_sendDataAndWaitForAcknowledgementOrTimeout___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = NSStringFromSelector(*(SEL *)(v1 + 56));
  OUTLINED_FUNCTION_2_0();
  __int16 v5 = 1024;
  int v6 = v3;
  _os_log_debug_impl(&dword_238967000, v0, OS_LOG_TYPE_DEBUG, "%@: Sucess NO Timeout %d", v4, 0x12u);
}

void __66___MLRemoteConnection_sendDataAndWaitForAcknowledgementOrTimeout___block_invoke_cold_2(uint64_t a1)
{
  uint64_t v1 = NSStringFromSelector(*(SEL *)(a1 + 56));
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_6(&dword_238967000, v2, v3, "%@: Timeout waiting for server response.", v4, v5, v6, v7, v8);
}

@end