@interface TSTransferQRCodeFlow
- (TSTransferQRCodeFlow)initWithIccid:(id)a3;
- (void)firstViewController:(id)a3;
@end

@implementation TSTransferQRCodeFlow

- (TSTransferQRCodeFlow)initWithIccid:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TSTransferQRCodeFlow;
  v6 = [(TSSIMSetupFlow *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_iccid, a3);
  }

  return v7;
}

- (void)firstViewController:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, void))a3;
  if (v4)
  {
    if (_os_feature_enabled_impl())
    {
      id v5 = +[TSCellularPlanManagerCache sharedInstance];
      v6 = [v5 planItems];

      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v25;
        while (2)
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v25 != v9) {
              objc_enumerationMutation(v7);
            }
            v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            v12 = [v11 iccid];
            int v13 = [v12 isEqualToString:self->_iccid];

            if (v13)
            {
              v15 = [v11 carrierName];
              carrierName = self->_carrierName;
              self->_carrierName = v15;

              goto LABEL_16;
            }
          }
          uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }
LABEL_16:

      v17 = (void *)MEMORY[0x22A683B20](v4);
      objc_initWeak((id *)buf, self);
      v18 = +[TSCoreTelephonyClientCache sharedInstance];
      iccid = self->_iccid;
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __44__TSTransferQRCodeFlow_firstViewController___block_invoke;
      v21[3] = &unk_264828598;
      objc_copyWeak(&v23, (id *)buf);
      id v20 = v17;
      v21[4] = self;
      id v22 = v20;
      [v18 getPlanTransferCredentials:iccid completion:v21];

      objc_destroyWeak(&v23);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      v14 = _TSLogDomain();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v30 = "-[TSTransferQRCodeFlow firstViewController:]";
        _os_log_impl(&dword_227A17000, v14, OS_LOG_TYPE_DEFAULT, "SIMSetupSupport/MagnoliaOverQRCode is disabled @%s", buf, 0xCu);
      }

      v4[2](v4, 0);
    }
  }
}

void __44__TSTransferQRCodeFlow_firstViewController___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained)
  {
    id v7 = _TSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __44__TSTransferQRCodeFlow_firstViewController___block_invoke_cold_1(v7);
    }
    goto LABEL_10;
  }
  if (![v3 length])
  {
    id v7 = _TSLogDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __44__TSTransferQRCodeFlow_firstViewController___block_invoke_cold_2(v7);
    }
LABEL_10:

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_11;
  }
  id v5 = [[TSTransferQRCodeViewController alloc] initWithTransferCredentials:v3 carrierName:WeakRetained[12]];
  [*(id *)(a1 + 32) setTopViewController:v5];
  v6 = _TSLogDomain();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    uint64_t v9 = objc_opt_class();
    __int16 v10 = 2080;
    v11 = "-[TSTransferQRCodeFlow firstViewController:]_block_invoke";
    _os_log_impl(&dword_227A17000, v6, OS_LOG_TYPE_DEFAULT, "first view: %@ @%s", (uint8_t *)&v8, 0x16u);
  }

  [(TSTransferQRCodeViewController *)v5 setDelegate:WeakRetained];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

LABEL_11:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carrierName, 0);
  objc_storeStrong((id *)&self->_iccid, 0);
}

void __44__TSTransferQRCodeFlow_firstViewController___block_invoke_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[TSTransferQRCodeFlow firstViewController:]_block_invoke";
  _os_log_error_impl(&dword_227A17000, log, OS_LOG_TYPE_ERROR, "[E]invalid self @%s", (uint8_t *)&v1, 0xCu);
}

void __44__TSTransferQRCodeFlow_firstViewController___block_invoke_cold_2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[TSTransferQRCodeFlow firstViewController:]_block_invoke";
  _os_log_error_impl(&dword_227A17000, log, OS_LOG_TYPE_ERROR, "[E]no credentials @%s", (uint8_t *)&v1, 0xCu);
}

@end