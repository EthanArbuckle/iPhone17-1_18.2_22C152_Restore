@interface ANEVirtualPlatformClient
@end

@implementation ANEVirtualPlatformClient

void __46___ANEVirtualPlatformClient_sharedConnection___block_invoke(uint64_t a1)
{
  v2 = (id)gLogger;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    objc_claimAutoreleasedReturnValue();
    __46___ANEVirtualPlatformClient_sharedConnection___block_invoke_cold_1();
  }

  id v3 = [[_ANEVirtualPlatformClient alloc] init:*(void *)(a1 + 32)];
  v4 = (void *)+[_ANEVirtualPlatformClient sharedConnection:]::client;
  +[_ANEVirtualPlatformClient sharedConnection:]::client = (uint64_t)v3;
}

void __59___ANEVirtualPlatformClient_modelAction_buffer_bufferSize___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = *(int **)(a1 + 40);
  if (v2)
  {
    int v3 = *v2;
    if (*v2 >= 0x10000) {
      int v3 = v2[1];
    }
    if (v3 == 16
      || +[_ANEVirtualPlatformClient isValidBufferSize:*(void *)(a1 + 56)])
    {
      v4 = (id)gLogger;
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        v8 = NSStringFromSelector(*(SEL *)(a1 + 48));
        int v9 = *(unsigned __int16 *)(a1 + 64);
        *(_DWORD *)buf = 138412802;
        v14 = v8;
        __int16 v15 = 1024;
        int v16 = v9;
        __int16 v17 = 1024;
        LODWORD(v18) = v3;
        _os_log_debug_impl(&dword_258723000, v4, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualPlatformClient Begin1 %d - %d!", buf, 0x18u);
      }
      switch(v3)
      {
        case 0:
          break;
        case 1:
          [*(id *)(a1 + 32) compileModel:*(void *)(a1 + 40)];
          break;
        case 2:
          [*(id *)(a1 + 32) loadModel:*(void *)(a1 + 40)];
          break;
        case 3:
          [*(id *)(a1 + 32) unLoadModel:*(void *)(a1 + 40)];
          break;
        case 4:
          [*(id *)(a1 + 32) evaluateWithModel:*(void *)(a1 + 40)];
          break;
        case 5:
          [*(id *)(a1 + 32) compiledModelExistsFor:*(void *)(a1 + 40)];
          break;
        case 6:
          [*(id *)(a1 + 32) purgeCompiledModel:*(void *)(a1 + 40)];
          break;
        case 7:
          [*(id *)(a1 + 32) compiledModelExistsMatchingHash:*(void *)(a1 + 40)];
          break;
        case 8:
          [*(id *)(a1 + 32) purgeCompiledModelMatchingHash:*(void *)(a1 + 40)];
          break;
        case 9:
          [*(id *)(a1 + 32) beginRealTimeTask:*(void *)(a1 + 40)];
          break;
        case 10:
          [*(id *)(a1 + 32) endRealTimeTask:*(void *)(a1 + 40)];
          break;
        case 11:
          [*(id *)(a1 + 32) echo:*(void *)(a1 + 40)];
          break;
        case 12:
          [*(id *)(a1 + 32) getDeviceInfo:*(void *)(a1 + 40)];
          break;
        case 13:
          [*(id *)(a1 + 32) mapIOSurfacesWithModel:*(void *)(a1 + 40)];
          break;
        case 14:
          [*(id *)(a1 + 32) storeGuestBuildVersion:*(void *)(a1 + 40)];
          break;
        case 15:
          [*(id *)(a1 + 32) exchangeBuildVersionInfo:*(void *)(a1 + 40)];
          break;
        case 16:
          [*(id *)(a1 + 32) callCFDictionaryMethod:*(void *)(a1 + 40)];
          break;
        case 17:
          [*(id *)(a1 + 32) asyncAvpHoldMessageReceived:*(void *)(a1 + 40)];
          break;
        default:
          v10 = (id)gLogger;
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(*(SEL *)(a1 + 48));
            objc_claimAutoreleasedReturnValue();
            __59___ANEVirtualPlatformClient_modelAction_buffer_bufferSize___block_invoke_cold_2();
          }

          break;
      }
      v5 = (id)gLogger;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        v11 = NSStringFromSelector(*(SEL *)(a1 + 48));
        int v12 = *(unsigned __int16 *)(a1 + 64);
        *(_DWORD *)buf = 138412802;
        v14 = v11;
        __int16 v15 = 1024;
        int v16 = v3;
        __int16 v17 = 1024;
        LODWORD(v18) = v12;
        _os_log_debug_impl(&dword_258723000, v5, OS_LOG_TYPE_DEBUG, "%@: ANEVirtualPlatformClient %u queueIndex %d End!", buf, 0x18u);
      }
    }
    else
    {
      v5 = (id)gLogger;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v6 = NSStringFromSelector(*(SEL *)(a1 + 48));
        uint64_t v7 = *(void *)(a1 + 56);
        *(_DWORD *)buf = 138412802;
        v14 = v6;
        __int16 v15 = 1024;
        int v16 = v3;
        __int16 v17 = 2048;
        uint64_t v18 = v7;
        _os_log_error_impl(&dword_258723000, v5, OS_LOG_TYPE_ERROR, "%@: ANEVirtualPlatformClient command=%u, unknown buffer size=%lu, exiting", buf, 0x1Cu);
      }
    }
  }
  else
  {
    v5 = (id)gLogger;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      objc_claimAutoreleasedReturnValue();
      __59___ANEVirtualPlatformClient_modelAction_buffer_bufferSize___block_invoke_cold_1();
    }
  }
}

void __46___ANEVirtualPlatformClient_sharedConnection___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_6(&dword_258723000, v3, v4, "%@: ANEVirtualPlatformClient  _ANEVirtualPlatformClient Create !", v5);
}

void __59___ANEVirtualPlatformClient_modelAction_buffer_bufferSize___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_6(&dword_258723000, v3, v4, "%@: ANEVirtualPlatformClient invalid buffer pointer!", v5);
}

void __59___ANEVirtualPlatformClient_modelAction_buffer_bufferSize___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_18(v1, 5.778e-34, v2, v3);
  OUTLINED_FUNCTION_20(&dword_258723000, v6, v4, "%@: ANEVirtualPlatformClient unimplemented ANEVPC %hu!", v5);
}

@end