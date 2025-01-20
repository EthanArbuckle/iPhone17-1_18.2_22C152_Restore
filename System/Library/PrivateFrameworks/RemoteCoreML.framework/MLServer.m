@interface MLServer
@end

@implementation MLServer

void __29___MLServer_initWithOptions___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v13 = +[_MLLog serverFramework];
  v14 = v13;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      __29___MLServer_initWithOptions___block_invoke_cold_2(a1);
    }

    [WeakRetained doReceive:v9 context:v10 isComplete:a4 error:v11];
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __29___MLServer_initWithOptions___block_invoke_cold_1(a1, v14);
    }
  }
}

uint64_t __48___MLServer_doReceive_context_isComplete_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v8 = [*(id *)(a1 + 32) packet];
  id v9 = [v8 buffer];
  [v9 appendBytes:a4 length:a5];

  id v10 = +[_MLLog serverFramework];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    __48___MLServer_doReceive_context_isComplete_error___block_invoke_cold_1(a1);
  }

  return 1;
}

void __48___MLServer_doReceive_context_isComplete_error___block_invoke_8(uint64_t a1)
{
  v42[1] = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) packet];
  BOOL v3 = +[_MLNetworkHeaderEncoding isHeaderAcknowledgeSucessData:](_MLNetworkHeaderEncoding, "isHeaderAcknowledgeSucessData:", [v2 command]);

  if (!v3)
  {
    v4 = [*(id *)(a1 + 32) packet];
    BOOL v5 = +[_MLNetworkHeaderEncoding isHeaderLoad:](_MLNetworkHeaderEncoding, "isHeaderLoad:", [v4 command]);

    if (v5)
    {
      v6 = +[_MLLog serverFramework];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        __48___MLServer_doReceive_context_isComplete_error___block_invoke_8_cold_1(a1);
      }

      v7 = [*(id *)(a1 + 32) loadFunction];
      id v8 = (id)v7[2](v7, 0, 0);
LABEL_10:

      goto LABEL_11;
    }
    id v9 = [*(id *)(a1 + 32) packet];
    BOOL v10 = +[_MLNetworkHeaderEncoding isHeaderUnLoad:](_MLNetworkHeaderEncoding, "isHeaderUnLoad:", [v9 command]);

    if (v10)
    {
      id v11 = +[_MLLog serverFramework];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        __48___MLServer_doReceive_context_isComplete_error___block_invoke_8_cold_2(a1);
      }

      v7 = [*(id *)(a1 + 32) unLoadFunction];
      v12 = [*(id *)(a1 + 32) packet];
      v13 = [v12 buffer];
      id v14 = (id)((uint64_t (**)(void, void, void *))v7)[2](v7, 0, v13);

      goto LABEL_10;
    }
    v16 = [*(id *)(a1 + 32) packet];
    BOOL v17 = +[_MLNetworkHeaderEncoding isHeaderPredictFeature:](_MLNetworkHeaderEncoding, "isHeaderPredictFeature:", [v16 command]);

    if (v17)
    {
      v18 = +[_MLLog serverFramework];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        __48___MLServer_doReceive_context_isComplete_error___block_invoke_8_cold_3(a1);
      }

      v19 = [*(id *)(a1 + 32) predictFunction];
      v20 = [*(id *)(a1 + 32) packet];
      v21 = [v20 buffer];
      v22 = ((void (**)(void, void, void *))v19)[2](v19, 0, v21);

      v23 = +[_MLNetworkHeaderEncoding predictFeature:v22];
      v24 = [*(id *)(a1 + 32) nwObj];
      [v24 sendData:v23];
    }
    else
    {
      v25 = [*(id *)(a1 + 32) packet];
      BOOL v26 = +[_MLNetworkHeaderEncoding isHeaderText:](_MLNetworkHeaderEncoding, "isHeaderText:", [v25 command]);

      if (v26)
      {
        v27 = [*(id *)(a1 + 32) packet];
        v28 = [v27 buffer];
        size_t v29 = +[_MLNetworkHeaderEncoding getHeaderDataSize:v28];

        if (8 * v29 + 8 >= 0x200) {
          size_t v30 = 512;
        }
        else {
          size_t v30 = 8 * v29 + 8;
        }
        bzero((char *)v42 - ((8 * v29 + 23) & 0xFFFFFFFFFFFFFFF0), v30);
        v31 = [*(id *)(a1 + 32) packet];
        v32 = [v31 buffer];
        strlcpy((char *)v42 - ((8 * v29 + 23) & 0xFFFFFFFFFFFFFFF0), (const char *)+[_MLNetworkHeaderEncoding getHeaderDataStart:v32], v29);

        v33 = [*(id *)(a1 + 32) packet];
        v34 = [v33 buffer];
        v35 = +[_MLNetworkHeaderEncoding getHeaderDataStart:v34];

        v36 = [NSString stringWithUTF8String:v35];
        v37 = +[_MLLog serverFramework];
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
          __48___MLServer_doReceive_context_isComplete_error___block_invoke_8_cold_4(a1);
        }

        v38 = [*(id *)(a1 + 32) textFunction];
        id v39 = (id)((uint64_t (**)(void, void, void *))v38)[2](v38, 0, v36);

        v40 = +[_MLNetworkHeaderEncoding acknowledgeSucessData];
        v41 = [*(id *)(a1 + 32) nwObj];
        [v41 sendData:v40];
      }
    }
  }
LABEL_11:
  v15 = [*(id *)(a1 + 32) packet];
  [v15 resetDoubleBuffer];
}

void __29___MLServer_initWithOptions___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  BOOL v3 = (const char *)OUTLINED_FUNCTION_2(a1);
  v4 = NSStringFromSelector(v3);
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_238967000, a2, OS_LOG_TYPE_ERROR, "%@: connection lost", v5, 0xCu);
}

void __29___MLServer_initWithOptions___block_invoke_cold_2(uint64_t a1)
{
  v1 = (const char *)OUTLINED_FUNCTION_2(a1);
  v2 = NSStringFromSelector(v1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_238967000, v3, v4, "%@: server callback", v5, v6, v7, v8, v9);
}

void __48___MLServer_doReceive_context_isComplete_error___block_invoke_cold_1(uint64_t a1)
{
  v1 = (const char *)OUTLINED_FUNCTION_2(a1);
  v2 = NSStringFromSelector(v1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_0(&dword_238967000, v3, v4, "%@: Incoming Packet size = %lu ", v5, v6, v7, v8, v9);
}

void __48___MLServer_doReceive_context_isComplete_error___block_invoke_8_cold_1(uint64_t a1)
{
  v1 = (const char *)OUTLINED_FUNCTION_2(a1);
  v2 = NSStringFromSelector(v1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_238967000, v3, v4, "%@: Load", v5, v6, v7, v8, v9);
}

void __48___MLServer_doReceive_context_isComplete_error___block_invoke_8_cold_2(uint64_t a1)
{
  v1 = (const char *)OUTLINED_FUNCTION_2(a1);
  v2 = NSStringFromSelector(v1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_238967000, v3, v4, "%@: Call Unload", v5, v6, v7, v8, v9);
}

void __48___MLServer_doReceive_context_isComplete_error___block_invoke_8_cold_3(uint64_t a1)
{
  v1 = (const char *)OUTLINED_FUNCTION_2(a1);
  v2 = NSStringFromSelector(v1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_238967000, v3, v4, "%@: Call Prediction", v5, v6, v7, v8, v9);
}

void __48___MLServer_doReceive_context_isComplete_error___block_invoke_8_cold_4(uint64_t a1)
{
  v1 = (const char *)OUTLINED_FUNCTION_2(a1);
  v2 = NSStringFromSelector(v1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_0(&dword_238967000, v3, v4, "%@: Decoded Text: %@", v5, v6, v7, v8, v9);
}

@end