@interface TSPRXSIMTransferringViewController
- (BOOL)otpDetectorNeeded;
- (CoreTelephonyClient)client;
- (IMOneTimeCodeAccelerator)oneTimeCodeAccelerator;
- (TSPRXSIMTransferringViewController)initWithTitle:(id)a3 subtitle:(id)a4 otpDetectorNeeded:(BOOL)a5;
- (void)_maybeEnableOneTimeCodeCheck;
- (void)_setupOneTimeCodeDetection;
- (void)setClient:(id)a3;
- (void)setOneTimeCodeAccelerator:(id)a3;
- (void)setOtpDetectorNeeded:(BOOL)a3;
@end

@implementation TSPRXSIMTransferringViewController

- (TSPRXSIMTransferringViewController)initWithTitle:(id)a3 subtitle:(id)a4 otpDetectorNeeded:(BOOL)a5
{
  BOOL v5 = a5;
  v10.receiver = self;
  v10.super_class = (Class)TSPRXSIMTransferringViewController;
  v6 = [(TSIDSSimTransferringViewController *)&v10 initWithTitle:a3 subtitle:a4];
  v7 = v6;
  if (v6)
  {
    if (v5) {
      [(TSPRXSIMTransferringViewController *)v6 _maybeEnableOneTimeCodeCheck];
    }
    v8 = v7;
  }

  return v7;
}

- (void)_maybeEnableOneTimeCodeCheck
{
  id v3 = objc_alloc(MEMORY[0x263F02D30]);
  v4 = (CoreTelephonyClient *)[v3 initWithQueue:MEMORY[0x263EF83A0]];
  client = self->_client;
  self->_client = v4;

  objc_initWeak(&location, self);
  v6 = self->_client;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__TSPRXSIMTransferringViewController__maybeEnableOneTimeCodeCheck__block_invoke;
  v7[3] = &unk_2648284E0;
  objc_copyWeak(&v8, &location);
  [(CoreTelephonyClient *)v6 getSubscriptionInfo:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __66__TSPRXSIMTransferringViewController__maybeEnableOneTimeCodeCheck__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v6)
    {
      obj = _TSLogDomain();
      if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
        __66__TSPRXSIMTransferringViewController__maybeEnableOneTimeCodeCheck__block_invoke_cold_2((uint64_t)v6, obj);
      }
    }
    else
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      obj = [v5 subscriptions];
      uint64_t v8 = [obj countByEnumeratingWithState:&v19 objects:v26 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v20;
        while (2)
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v20 != v10) {
              objc_enumerationMutation(obj);
            }
            uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * i);
            v13 = (void *)[objc_alloc(MEMORY[0x263F02C20]) initWithBundleType:1];
            v25[0] = @"PhoneAccountTransfer";
            v25[1] = @"OneTimeCodeForTransfer";
            v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
            v15 = [WeakRetained client];
            v16 = (void *)[v15 copyCarrierBundleValue:v12 keyHierarchy:v14 bundleType:v13 error:0];

            if (v16)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                if ([v16 BOOLValue])
                {
                  v17 = _TSLogDomain();
                  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315138;
                    v24 = "-[TSPRXSIMTransferringViewController _maybeEnableOneTimeCodeCheck]_block_invoke";
                    _os_log_impl(&dword_227A17000, v17, OS_LOG_TYPE_DEFAULT, "start monitor OTP @%s", buf, 0xCu);
                  }

                  [WeakRetained _setupOneTimeCodeDetection];
                  goto LABEL_21;
                }
              }
            }
          }
          uint64_t v9 = [obj countByEnumeratingWithState:&v19 objects:v26 count:16];
          if (v9) {
            continue;
          }
          break;
        }
LABEL_21:
        id v6 = 0;
      }
    }
  }
  else
  {
    obj = _TSLogDomain();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
      __66__TSPRXSIMTransferringViewController__maybeEnableOneTimeCodeCheck__block_invoke_cold_1(obj);
    }
  }
}

- (void)_setupOneTimeCodeDetection
{
  objc_initWeak(&location, self);
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2050000000;
  id v3 = (void *)getIMOneTimeCodeAcceleratorClass_softClass;
  uint64_t v15 = getIMOneTimeCodeAcceleratorClass_softClass;
  if (!getIMOneTimeCodeAcceleratorClass_softClass)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __getIMOneTimeCodeAcceleratorClass_block_invoke;
    v11[3] = &unk_264827BA8;
    v11[4] = &v12;
    __getIMOneTimeCodeAcceleratorClass_block_invoke((uint64_t)v11);
    id v3 = (void *)v13[3];
  }
  v4 = v3;
  _Block_object_dispose(&v12, 8);
  id v5 = [v4 alloc];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __64__TSPRXSIMTransferringViewController__setupOneTimeCodeDetection__block_invoke;
  v8[3] = &unk_264828508;
  objc_copyWeak(&v9, &location);
  v8[4] = self;
  id v6 = (IMOneTimeCodeAccelerator *)[v5 initWithBlockForUpdates:v8];
  oneTimeCodeAccelerator = self->_oneTimeCodeAccelerator;
  self->_oneTimeCodeAccelerator = v6;

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __64__TSPRXSIMTransferringViewController__setupOneTimeCodeDetection__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = _TSLogDomain();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v3;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "-[TSPRXSIMTransferringViewController _setupOneTimeCodeDetection]_block_invoke";
    _os_log_impl(&dword_227A17000, v4, OS_LOG_TYPE_DEFAULT, "detect codes: %@ @%s", buf, 0x16u);
  }

  id v5 = [v3 firstObject];
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  id v6 = (id *)getIMOneTimeCodeKeySymbolLoc_ptr;
  uint64_t v18 = getIMOneTimeCodeKeySymbolLoc_ptr;
  if (!getIMOneTimeCodeKeySymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getIMOneTimeCodeKeySymbolLoc_block_invoke;
    long long v20 = &unk_264827BA8;
    long long v21 = &v15;
    v7 = (void *)IMCoreLibrary();
    uint64_t v8 = dlsym(v7, "IMOneTimeCodeKey");
    *(void *)(v21[1] + 24) = v8;
    getIMOneTimeCodeKeySymbolLoc_ptr = *(void *)(v21[1] + 24);
    id v6 = (id *)v16[3];
  }
  _Block_object_dispose(&v15, 8);
  if (!v6)
  {
    __64__TSPRXSIMTransferringViewController__setupOneTimeCodeDetection__block_invoke_cold_1();
    __break(1u);
  }
  id v9 = *v6;
  uint64_t v10 = [v5 objectForKeyedSubscript:v9];

  v11 = _TSLogDomain();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "-[TSPRXSIMTransferringViewController _setupOneTimeCodeDetection]_block_invoke";
    _os_log_impl(&dword_227A17000, v11, OS_LOG_TYPE_DEFAULT, "OTP : %@ @%s", buf, 0x16u);
  }

  if (v10 && [v10 length])
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__TSPRXSIMTransferringViewController__setupOneTimeCodeDetection__block_invoke_56;
    block[3] = &unk_264827E30;
    objc_copyWeak(&v14, (id *)(a1 + 40));
    block[4] = *(void *)(a1 + 32);
    id v13 = v10;
    dispatch_async(MEMORY[0x263EF83A0], block);

    objc_destroyWeak(&v14);
  }
}

void __64__TSPRXSIMTransferringViewController__setupOneTimeCodeDetection__block_invoke_56(uint64_t a1)
{
  v2 = NSString;
  id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"PRXCARD_ONE_TIME_CODE_%@" value:&stru_26DBE8E78 table:@"Localizable"];
  id v5 = objc_msgSend(v2, "stringWithFormat:", v4, *(void *)(a1 + 40));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v7 = [WeakRetained placeHolderLabel];
  [v7 setText:v5];

  id v8 = objc_loadWeakRetained((id *)(a1 + 48));
  id v9 = [v8 placeHolderLabel];
  [v9 setBoldSubString:*(void *)(a1 + 40)];

  id v11 = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v10 = [v11 placeHolderLabel];
  [v10 setHidden:0];
}

- (IMOneTimeCodeAccelerator)oneTimeCodeAccelerator
{
  return (IMOneTimeCodeAccelerator *)objc_getProperty(self, a2, 1112, 1);
}

- (void)setOneTimeCodeAccelerator:(id)a3
{
}

- (CoreTelephonyClient)client
{
  return (CoreTelephonyClient *)objc_getProperty(self, a2, 1120, 1);
}

- (void)setClient:(id)a3
{
}

- (BOOL)otpDetectorNeeded
{
  return self->_otpDetectorNeeded;
}

- (void)setOtpDetectorNeeded:(BOOL)a3
{
  self->_otpDetectorNeeded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_oneTimeCodeAccelerator, 0);
}

void __66__TSPRXSIMTransferringViewController__maybeEnableOneTimeCodeCheck__block_invoke_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[TSPRXSIMTransferringViewController _maybeEnableOneTimeCodeCheck]_block_invoke";
  _os_log_error_impl(&dword_227A17000, log, OS_LOG_TYPE_ERROR, "[E]Self doesnt exist @%s", (uint8_t *)&v1, 0xCu);
}

void __66__TSPRXSIMTransferringViewController__maybeEnableOneTimeCodeCheck__block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  id v5 = "-[TSPRXSIMTransferringViewController _maybeEnableOneTimeCodeCheck]_block_invoke";
  _os_log_error_impl(&dword_227A17000, a2, OS_LOG_TYPE_ERROR, "[E]get subscription failed : %@ @%s", (uint8_t *)&v2, 0x16u);
}

uint64_t __64__TSPRXSIMTransferringViewController__setupOneTimeCodeDetection__block_invoke_cold_1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return __getIMOneTimeCodeAcceleratorClass_block_invoke_cold_1(v0);
}

@end