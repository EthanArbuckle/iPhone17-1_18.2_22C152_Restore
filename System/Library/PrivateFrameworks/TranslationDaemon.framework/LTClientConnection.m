@interface LTClientConnection
@end

@implementation LTClientConnection

void __57___LTClientConnection_initWithConnection_server_trusted___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained cleanupOnDisconnect];
    id WeakRetained = v2;
  }
}

uint64_t __57___LTClientConnection_initWithConnection_server_trusted___block_invoke_2(uint64_t a1)
{
  id v2 = _LTOSLogXPC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __57___LTClientConnection_initWithConnection_server_trusted___block_invoke_2_cold_1();
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __56___LTClientConnection_translate_withContext_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v6;
  id v12 = v6;

  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v7;
}

void __56___LTClientConnection_translate_withContext_completion___block_invoke_2(void *a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (!v3 && !*(void *)(*(void *)(a1[5] + 8) + 40))
  {
    uint64_t v8 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(*(void *)(a1[6] + 8) + 40);
      int v10 = 138739971;
      uint64_t v11 = v9;
      _os_log_impl(&dword_2600DC000, v8, OS_LOG_TYPE_INFO, "_LTTranslationService completed successfully for paragraphResult %{sensitive}@", (uint8_t *)&v10, 0xCu);
    }
    uint64_t v5 = a1[4];
    uint64_t v6 = *(void *)(*(void *)(a1[6] + 8) + 40);
    goto LABEL_10;
  }
  v4 = _LTOSLogTranslationEngine();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __56___LTClientConnection_translate_withContext_completion___block_invoke_2_cold_1((uint64_t)a1, (uint64_t)v3, v4);
  }
  uint64_t v5 = a1[4];
  uint64_t v6 = *(void *)(*(void *)(a1[6] + 8) + 40);
  id v7 = v3;
  if (!v3) {
LABEL_10:
  }
    id v7 = *(id *)(*(void *)(a1[5] + 8) + 40);
  (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, v6, v7);
}

uint64_t __66___LTClientConnection_translateParagraphs_withContext_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) paragraphTranslation:a2 result:a3 error:a4];
}

uint64_t __43___LTClientConnection_assetRequestHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) assetResponseWithProgress:a2 finished:0 error:0];
}

uint64_t __43___LTClientConnection_assetRequestHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) assetResponseWithProgress:0 finished:1 error:a2];
}

uint64_t __76___LTClientConnection_startLanguageStatusChangeObservation_type_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) languageStatusChangedForType:*(void *)(a1 + 40) progress:*(unsigned __int8 *)(a1 + 48) observations:a2];
}

uint64_t __76___LTClientConnection_startLanguageStatusChangeObservation_type_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __57___LTClientConnection_initWithConnection_server_trusted___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_2600DC000, v0, OS_LOG_TYPE_ERROR, "XPC connection was interrupted, likely because the process was killed", v1, 2u);
}

void __56___LTClientConnection_translate_withContext_completion___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  int v5 = 138740483;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  __int16 v9 = 2112;
  uint64_t v10 = v4;
  _os_log_error_impl(&dword_2600DC000, log, OS_LOG_TYPE_ERROR, "_LTTranslationService for paragraphResult %{sensitive}@; got error: %@; paragraphError: %@",
    (uint8_t *)&v5,
    0x20u);
}

@end