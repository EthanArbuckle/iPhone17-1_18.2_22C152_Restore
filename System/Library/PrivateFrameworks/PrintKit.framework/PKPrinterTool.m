@interface PKPrinterTool
@end

@implementation PKPrinterTool

void __36__PKPrinterTool_Client_sharedClient__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)+[PKPrinterTool_Client sharedClient]::sSharedClient;
  +[PKPrinterTool_Client sharedClient]::sSharedClient = v0;
}

void __37__PKPrinterTool_Client_ptConn_locked__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = _PKLogCategory(PKLogCategoryDefault[0]);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v3;
    _os_log_impl(&dword_22EA54000, v2, OS_LOG_TYPE_DEFAULT, "PrinterTool connection %@ invalidated", (uint8_t *)&v7, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = (void *)*((void *)WeakRetained + 1);
    *((void *)WeakRetained + 1) = 0;
  }
}

void __37__PKPrinterTool_Client_ptConn_locked__block_invoke_4(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = _PKLogCategory(PKLogCategoryDefault[0]);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_22EA54000, v2, OS_LOG_TYPE_DEFAULT, "PrinterTool connection %@ interrupted", (uint8_t *)&v5, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained invalidate];
}

void __55__PKPrinterTool_Client_getRecentJobsCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  PKLogXPCError(*(objc_selector **)(a1 + 40), v3);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __78__PKPrinterTool_Client_getJobUpdateStatus_includeThumbnail_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  PKLogXPCError(*(objc_selector **)(a1 + 40), v3);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __78__PKPrinterTool_Client_getLastUsedPrintersForCurrentNetworkCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  PKLogXPCError(*(objc_selector **)(a1 + 40), v3);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __63__PKPrinterTool_Client_getiCloudPrintersWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  PKLogXPCError(*(objc_selector **)(a1 + 40), v3);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __59__PKPrinterTool_Client_logiCloudPrintersCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  PKLogXPCError(*(objc_selector **)(a1 + 40), v3);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __71__PKPrinterTool_Client_browseInfoForPrinter_timeout_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  PKLogXPCError(*(objc_selector **)(a1 + 40), v3);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __66__PKPrinterTool_Client_endpointResolve_timeout_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  PKLogXPCError(*(objc_selector **)(a1 + 40), v3);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __51__PKPrinterTool_Client_printerTool_realPathForTmp___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  PKLogXPCError(*(objc_selector **)(a1 + 40), v3);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __95__PKPrinterTool_Client_printerTool_getPrinterDescription_assertReachability_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  PKLogXPCError(*(objc_selector **)(a1 + 40), v3);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __78__PKPrinterTool_Client_printerTool_queryPrinter_attributes_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  PKLogXPCError(*(objc_selector **)(a1 + 40), v3);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __78__PKPrinterTool_Client_printerTool_queryPrinter_attributes_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = +[PKIPP responseFromData:v3];
    int v5 = v4;
    if (v4)
    {
      id v6 = v4;
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __71__PKPrinterTool_Client_printerTool_checkAccessState_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  PKLogXPCError(*(objc_selector **)(a1 + 40), v3);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __78__PKPrinterTool_Client_startStreamingRequest_printSettings_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  PKLogXPCError(*(objc_selector **)(a1 + 40), v3);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __66__PKPrinterTool_Client_finishRequestWithCancel_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  PKLogXPCError(*(objc_selector **)(a1 + 40), v3);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end