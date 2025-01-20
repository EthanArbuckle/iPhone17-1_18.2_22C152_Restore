@interface TransparencyDaemon
- (id)transparencyCheckIDSHealth:(id *)a3;
- (id)transparencyIDMSDeviceList:(id *)a3;
- (id)transparencySysDiagnoseData:(id *)a3;
- (void)changeOptInState:(unint64_t)a3 application:(id)a4 complete:(id)a5;
- (void)clearEligibilityOverrides:(id)a3;
- (void)clearOptInStateForURI:(id)a3 application:(id)a4 complete:(id)a5;
- (void)clearPeerState:(id)a3 uris:(id)a4 block:(id)a5;
- (void)clearTapToRadarNotification:(id)a3 complete:(id)a4;
- (void)configurationBagFetch:(id)a3;
- (void)getAggregateResult:(int64_t)a3 element:(id)a4 complete:(id)a5;
- (void)getAllOptInStates:(id)a3;
- (void)getOptInForURI:(id)a3 application:(id)a4 complete:(id)a5;
- (void)getOptInState:(id)a3 complete:(id)a4;
- (void)getOptInStateForApplication:(id)a3 complete:(id)a4;
- (void)insertResultForElement:(id)a3 samplesAgo:(id)a4 success:(BOOL)a5 complete:(id)a6;
- (void)maybeUpdateMonitorState;
- (void)performAndWaitForSelfValidate:(id)a3;
- (void)replaySelfValidate:(id)a3 application:(id)a4 pcsAccountKey:(id)a5 queryRequest:(id)a6 queryResponse:(id)a7 responseTime:(id)a8 completionHandler:(id)a9;
- (void)reportEligibility:(id)a3 complete:(id)a4;
- (void)setOSUpdate:(BOOL)a3 complete:(id)a4;
- (void)setOptInForURI:(id)a3 application:(id)a4 state:(BOOL)a5 smtTimestamp:(id)a6 complete:(id)a7;
- (void)setOverrideTimeBetweenReports:(double)a3 completion:(id)a4;
- (void)transparencyCheckKTAccountKey:(id)a3 complete:(id)a4;
- (void)transparencyClearKTRegistrationData:(id)a3;
- (void)transparencyCloudDeviceAdd:(id)a3 clientData:(id)a4 complete:(id)a5;
- (void)transparencyCloudDeviceRemove:(id)a3 clientData:(id)a4 complete:(id)a5;
- (void)transparencyCloudDevices:(id)a3;
- (void)transparencyDumpKTRegistrationData:(id)a3;
- (void)transparencyFetchIDMS:(id)a3;
- (void)transparencyFetchPublicKeys:(id)a3;
- (void)transparencyFetchSelf:(id)a3;
- (void)transparencyGetKTSignatures:(id)a3 complete:(id)a4;
- (void)transparencyIDSRegistration:(id)a3;
- (void)transparencyIDSRepair:(id)a3;
- (void)transparencyPerformRegistrationSignature:(id)a3;
- (void)transparencySysDiagnose:(id)a3;
- (void)transparencyTriggerIDSRegistration:(id)a3;
- (void)transparencyTriggerMaybeReportEligibility:(id)a3;
- (void)transparencyTriggerOperation:(id)a3 complete:(id)a4;
- (void)transparencyTriggerTTR:(id)a3 handle:(id)a4 complete:(id)a5;
- (void)transparencyValidateSelf:(id)a3;
- (void)updateIDSRecommendation:(BOOL)a3 complete:(id)a4;
@end

@implementation TransparencyDaemon

- (void)configurationBagFetch:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__TransparencyDaemon_configurationBagFetch___block_invoke;
  v7[3] = &unk_26479E998;
  id v8 = v3;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__TransparencyDaemon_configurationBagFetch___block_invoke_269;
  v5[3] = &unk_26479E748;
  id v6 = v8;
  id v4 = v8;
  +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:v7 errorHandler:v5];
}

void __44__TransparencyDaemon_configurationBagFetch___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_6);
  }
  v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_226345000, v7, OS_LOG_TYPE_INFO, "Sending configurationBagFetch", v8, 2u);
  }
  [v5 configurationBagFetch:*(void *)(a1 + 32)];
}

uint64_t __44__TransparencyDaemon_configurationBagFetch___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __44__TransparencyDaemon_configurationBagFetch___block_invoke_269(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)transparencyIDSRepair:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__TransparencyDaemon_transparencyIDSRepair___block_invoke;
  v7[3] = &unk_26479E998;
  id v8 = v3;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__TransparencyDaemon_transparencyIDSRepair___block_invoke_2_274;
  v5[3] = &unk_26479E748;
  id v6 = v8;
  id v4 = v8;
  +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:v7 errorHandler:v5];
}

void __44__TransparencyDaemon_transparencyIDSRepair___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_272_0);
  }
  v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226345000, v7, OS_LOG_TYPE_INFO, "Sending transparencyRepair", buf, 2u);
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __44__TransparencyDaemon_transparencyIDSRepair___block_invoke_273;
  v8[3] = &unk_26479E748;
  id v9 = *(id *)(a1 + 32);
  [v5 transparencyIDSRepair:v8];
}

uint64_t __44__TransparencyDaemon_transparencyIDSRepair___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __44__TransparencyDaemon_transparencyIDSRepair___block_invoke_273(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __44__TransparencyDaemon_transparencyIDSRepair___block_invoke_2_274(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)transparencySysDiagnose:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__TransparencyDaemon_transparencySysDiagnose___block_invoke;
  v7[3] = &unk_26479E998;
  id v8 = v3;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __46__TransparencyDaemon_transparencySysDiagnose___block_invoke_277;
  v5[3] = &unk_26479E748;
  id v6 = v8;
  id v4 = v8;
  +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:v7 errorHandler:v5];
}

void __46__TransparencyDaemon_transparencySysDiagnose___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_276);
  }
  v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_226345000, v7, OS_LOG_TYPE_INFO, "Sending transparencySysDiagnose", v8, 2u);
  }
  [v5 transparencySysDiagnose:*(void *)(a1 + 32)];
}

uint64_t __46__TransparencyDaemon_transparencySysDiagnose___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __46__TransparencyDaemon_transparencySysDiagnose___block_invoke_277(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)transparencySysDiagnoseData:(id *)a3
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  id v22 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__2;
  v15[4] = __Block_byref_object_dispose__2;
  id v16 = 0;
  id v4 = [MEMORY[0x263EFF9A0] dictionary];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __50__TransparencyDaemon_transparencySysDiagnoseData___block_invoke;
  v14[3] = &unk_26479EBC8;
  v14[4] = v15;
  v14[5] = &v17;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __50__TransparencyDaemon_transparencySysDiagnoseData___block_invoke_2_283;
  v13[3] = &unk_26479EB08;
  v13[4] = v15;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:v14 errorHandler:v13];
  id v5 = [MEMORY[0x263EFF980] array];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __50__TransparencyDaemon_transparencySysDiagnoseData___block_invoke_3;
  v10[3] = &unk_26479EC18;
  v12 = v15;
  id v6 = v5;
  id v11 = v6;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __50__TransparencyDaemon_transparencySysDiagnoseData___block_invoke_2_299;
  v9[3] = &unk_26479EB08;
  v9[4] = v15;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:v10 errorHandler:v9];
  if (![v6 count])
  {

    id v6 = 0;
  }
  [v4 setObject:v18[5] forKeyedSubscript:@"stateMachine"];
  [v4 setObject:v6 forKeyedSubscript:@"registration"];
  if ([v4 count])
  {
    v7 = [MEMORY[0x263F08900] dataWithJSONObject:v4 options:0 error:a3];
  }
  else
  {
    v7 = 0;
  }

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(&v17, 8);

  return v7;
}

void __50__TransparencyDaemon_transparencySysDiagnoseData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
  else
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_280);
    }
    v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226345000, v7, OS_LOG_TYPE_INFO, "Sending transparencySysDiagnose", buf, 2u);
    }
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __50__TransparencyDaemon_transparencySysDiagnoseData___block_invoke_281;
    v8[3] = &unk_26479E598;
    void v8[4] = *(void *)(a1 + 40);
    [v5 transparencySysDiagnose:v8];
  }
}

uint64_t __50__TransparencyDaemon_transparencySysDiagnoseData___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

void __50__TransparencyDaemon_transparencySysDiagnoseData___block_invoke_281(uint64_t a1, void *a2)
{
}

void __50__TransparencyDaemon_transparencySysDiagnoseData___block_invoke_2_283(uint64_t a1, void *a2)
{
}

void __50__TransparencyDaemon_transparencySysDiagnoseData___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_286);
    }
    v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226345000, v7, OS_LOG_TYPE_INFO, "Sending transparencyDumpKTRegistrationData", buf, 2u);
    }
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __50__TransparencyDaemon_transparencySysDiagnoseData___block_invoke_287;
    v8[3] = &unk_26479EBF0;
    id v9 = *(id *)(a1 + 32);
    [v5 transparencyDumpKTRegistrationData:v8];
  }
}

uint64_t __50__TransparencyDaemon_transparencySysDiagnoseData___block_invoke_4()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

void __50__TransparencyDaemon_transparencySysDiagnoseData___block_invoke_287(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  if (!a3)
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v4 = [a2 registrationData];
    id v5 = [v4 allValues];

    id obj = v5;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      id v8 = @"app";
      id v9 = @"YES";
      uint64_t v10 = *(void *)v38;
      do
      {
        uint64_t v11 = 0;
        uint64_t v35 = v7;
        do
        {
          if (*(void *)v38 != v10) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v37 + 1) + 8 * v11);
          v13 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v35);
          v14 = [v12 application];
          [v13 setObject:v14 forKeyedSubscript:v8];

          v15 = [v12 signature];
          if (v15) {
            id v16 = v9;
          }
          else {
            id v16 = @"NO";
          }
          [v13 setObject:v16 forKeyedSubscript:@"signature"];

          uint64_t v17 = [v12 createdAt];
          v18 = [v17 description];
          [v13 setObject:v18 forKeyedSubscript:@"createdAt"];

          uint64_t v19 = [v12 signedAt];
          v20 = [v19 description];
          [v13 setObject:v20 forKeyedSubscript:@"signedAt"];

          uint64_t v21 = [v12 createdAt];
          if (v21)
          {
            id v22 = (void *)v21;
            v23 = [v12 signedAt];

            if (v23)
            {
              v24 = NSNumber;
              v25 = [v12 signedAt];
              [v12 createdAt];
              uint64_t v26 = v10;
              uint64_t v27 = a1;
              v28 = v9;
              v30 = v29 = v8;
              [v25 timeIntervalSinceDate:v30];
              v32 = [v24 numberWithInt:(int)v31];
              [v13 setObject:v32 forKeyedSubscript:@"delay"];

              id v8 = v29;
              id v9 = v28;
              a1 = v27;
              uint64_t v10 = v26;
              uint64_t v7 = v35;
            }
          }
          v33 = [v12 pushToken];
          v34 = objc_msgSend(v33, "kt_hexString");
          [v13 setObject:v34 forKeyedSubscript:@"pushToken"];

          [*(id *)(a1 + 32) addObject:v13];
          ++v11;
        }
        while (v7 != v11);
        uint64_t v7 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v7);
    }
  }
}

void __50__TransparencyDaemon_transparencySysDiagnoseData___block_invoke_2_299(uint64_t a1, void *a2)
{
}

- (void)transparencyFetchIDMS:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__TransparencyDaemon_transparencyFetchIDMS___block_invoke;
  v7[3] = &unk_26479E998;
  id v8 = v3;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__TransparencyDaemon_transparencyFetchIDMS___block_invoke_309;
  v5[3] = &unk_26479E748;
  id v6 = v8;
  id v4 = v8;
  +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:v7 errorHandler:v5];
}

void __44__TransparencyDaemon_transparencyFetchIDMS___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_308);
  }
  uint64_t v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_226345000, v7, OS_LOG_TYPE_INFO, "Sending transparencyFetchIDMS", v8, 2u);
  }
  [v5 transparencyTriggerIDMSFetch:*(void *)(a1 + 32)];
}

uint64_t __44__TransparencyDaemon_transparencyFetchIDMS___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __44__TransparencyDaemon_transparencyFetchIDMS___block_invoke_309(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)transparencyValidateSelf:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__TransparencyDaemon_transparencyValidateSelf___block_invoke;
  v7[3] = &unk_26479E998;
  id v8 = v3;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __47__TransparencyDaemon_transparencyValidateSelf___block_invoke_312;
  v5[3] = &unk_26479E748;
  id v6 = v8;
  id v4 = v8;
  +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:v7 errorHandler:v5];
}

void __47__TransparencyDaemon_transparencyValidateSelf___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_311);
  }
  uint64_t v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_226345000, v7, OS_LOG_TYPE_INFO, "Sending transparencyValidateSelf", v8, 2u);
  }
  [v5 triggerSelfValidate:*(void *)(a1 + 32)];
}

uint64_t __47__TransparencyDaemon_transparencyValidateSelf___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __47__TransparencyDaemon_transparencyValidateSelf___block_invoke_312(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)transparencyFetchSelf:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__TransparencyDaemon_transparencyFetchSelf___block_invoke;
  v7[3] = &unk_26479E998;
  id v8 = v3;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__TransparencyDaemon_transparencyFetchSelf___block_invoke_315;
  v5[3] = &unk_26479E748;
  id v6 = v8;
  id v4 = v8;
  +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:v7 errorHandler:v5];
}

void __44__TransparencyDaemon_transparencyFetchSelf___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_314);
  }
  uint64_t v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_226345000, v7, OS_LOG_TYPE_INFO, "Sending transparencyTriggerFetchSelf", v8, 2u);
  }
  [v5 transparencyTriggerFetchSelf:*(void *)(a1 + 32)];
}

uint64_t __44__TransparencyDaemon_transparencyFetchSelf___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __44__TransparencyDaemon_transparencyFetchSelf___block_invoke_315(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performAndWaitForSelfValidate:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__TransparencyDaemon_performAndWaitForSelfValidate___block_invoke;
  v7[3] = &unk_26479E998;
  id v8 = v3;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __52__TransparencyDaemon_performAndWaitForSelfValidate___block_invoke_318;
  v5[3] = &unk_26479E748;
  id v6 = v8;
  id v4 = v8;
  +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:v7 errorHandler:v5];
}

void __52__TransparencyDaemon_performAndWaitForSelfValidate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_317);
  }
  uint64_t v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_226345000, v7, OS_LOG_TYPE_INFO, "Sending performAndWaitForSelfValidate", v8, 2u);
  }
  [v5 performAndWaitForSelfValidate:*(void *)(a1 + 32)];
}

uint64_t __52__TransparencyDaemon_performAndWaitForSelfValidate___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __52__TransparencyDaemon_performAndWaitForSelfValidate___block_invoke_318(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)maybeUpdateMonitorState
{
}

void __45__TransparencyDaemon_maybeUpdateMonitorState__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_322);
  }
  id v6 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_226345000, v6, OS_LOG_TYPE_INFO, "Sending maybeUpdateMonitorState", v7, 2u);
  }
  [v4 maybeUpdateMonitorState];
}

uint64_t __45__TransparencyDaemon_maybeUpdateMonitorState__block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

void __45__TransparencyDaemon_maybeUpdateMonitorState__block_invoke_323(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_328);
  }
  id v3 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_226345000, v3, OS_LOG_TYPE_ERROR, "maybeUpdateMonitorState failed with: %@", (uint8_t *)&v4, 0xCu);
  }
}

uint64_t __45__TransparencyDaemon_maybeUpdateMonitorState__block_invoke_2_326()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

- (id)transparencyIDMSDeviceList:(id *)a3
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy__2;
  v18 = __Block_byref_object_dispose__2;
  id v19 = 0;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__2;
  v12 = __Block_byref_object_dispose__2;
  id v13 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__TransparencyDaemon_transparencyIDMSDeviceList___block_invoke;
  v7[3] = &unk_26479EBC8;
  void v7[4] = &v14;
  v7[5] = &v8;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:v7 errorHandler:&__block_literal_global_335];
  if (a3)
  {
    int v4 = (void *)v9[5];
    if (v4) {
      *a3 = v4;
    }
  }
  id v5 = (id)v15[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);

  return v5;
}

void __49__TransparencyDaemon_transparencyIDMSDeviceList___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_330);
  }
  uint64_t v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226345000, v7, OS_LOG_TYPE_INFO, "Sending deviceStatus", buf, 2u);
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__TransparencyDaemon_transparencyIDMSDeviceList___block_invoke_331;
  v8[3] = &unk_26479EC60;
  long long v9 = *(_OWORD *)(a1 + 32);
  [v5 idmsDevices:v8];
}

uint64_t __49__TransparencyDaemon_transparencyIDMSDeviceList___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

void __49__TransparencyDaemon_transparencyIDMSDeviceList___block_invoke_331(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __49__TransparencyDaemon_transparencyIDMSDeviceList___block_invoke_2_333(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_337);
  }
  id v3 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_226345000, v3, OS_LOG_TYPE_ERROR, "deviceStatus failed with: %@", (uint8_t *)&v4, 0xCu);
  }
}

uint64_t __49__TransparencyDaemon_transparencyIDMSDeviceList___block_invoke_3()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

- (void)replaySelfValidate:(id)a3 application:(id)a4 pcsAccountKey:(id)a5 queryRequest:(id)a6 queryResponse:(id)a7 responseTime:(id)a8 completionHandler:(id)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __125__TransparencyDaemon_replaySelfValidate_application_pcsAccountKey_queryRequest_queryResponse_responseTime_completionHandler___block_invoke;
  v30[3] = &unk_26479EC88;
  id v31 = v14;
  id v32 = v15;
  id v33 = v16;
  id v34 = v17;
  id v35 = v18;
  id v36 = v19;
  id v37 = v20;
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __125__TransparencyDaemon_replaySelfValidate_application_pcsAccountKey_queryRequest_queryResponse_responseTime_completionHandler___block_invoke_340;
  v28[3] = &unk_26479E748;
  id v29 = v37;
  id v21 = v37;
  id v22 = v19;
  id v23 = v18;
  id v24 = v17;
  id v25 = v16;
  id v26 = v15;
  id v27 = v14;
  +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:v30 errorHandler:v28];
}

void __125__TransparencyDaemon_replaySelfValidate_application_pcsAccountKey_queryRequest_queryResponse_responseTime_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_339);
  }
  uint64_t v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_226345000, v7, OS_LOG_TYPE_INFO, "Sending replay self validate", buf, 2u);
  }
  [v5 replaySelfValidate:a1[4] application:a1[5] pcsAccountKey:a1[6] queryRequest:a1[7] queryResponse:a1[8] responseTime:a1[9] completionHandler:a1[10]];
}

uint64_t __125__TransparencyDaemon_replaySelfValidate_application_pcsAccountKey_queryRequest_queryResponse_responseTime_completionHandler___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __125__TransparencyDaemon_replaySelfValidate_application_pcsAccountKey_queryRequest_queryResponse_responseTime_completionHandler___block_invoke_340(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)transparencyFetchPublicKeys:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__TransparencyDaemon_transparencyFetchPublicKeys___block_invoke;
  v7[3] = &unk_26479E998;
  id v8 = v3;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __50__TransparencyDaemon_transparencyFetchPublicKeys___block_invoke_343;
  v5[3] = &unk_26479E748;
  id v6 = v8;
  id v4 = v8;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:v7 errorHandler:v5];
}

void __50__TransparencyDaemon_transparencyFetchPublicKeys___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_342);
  }
  uint64_t v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_226345000, v7, OS_LOG_TYPE_INFO, "Sending transparencyFetchPublicKeys", v8, 2u);
  }
  [v5 transparencyTriggerPublicKeyFetch:*(void *)(a1 + 32)];
}

uint64_t __50__TransparencyDaemon_transparencyFetchPublicKeys___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __50__TransparencyDaemon_transparencyFetchPublicKeys___block_invoke_343(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)transparencyTriggerIDSRegistration:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__TransparencyDaemon_transparencyTriggerIDSRegistration___block_invoke;
  v7[3] = &unk_26479E998;
  id v8 = v3;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __57__TransparencyDaemon_transparencyTriggerIDSRegistration___block_invoke_346;
  v5[3] = &unk_26479E748;
  id v6 = v8;
  id v4 = v8;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:v7 errorHandler:v5];
}

void __57__TransparencyDaemon_transparencyTriggerIDSRegistration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_345);
  }
  uint64_t v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_226345000, v7, OS_LOG_TYPE_INFO, "Sending transparencyTriggerIDSRegistration", v8, 2u);
  }
  [v5 transparencyTriggerCheckIDSRegistration:*(void *)(a1 + 32)];
}

uint64_t __57__TransparencyDaemon_transparencyTriggerIDSRegistration___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __57__TransparencyDaemon_transparencyTriggerIDSRegistration___block_invoke_346(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)transparencyCheckKTAccountKey:(id)a3 complete:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __61__TransparencyDaemon_transparencyCheckKTAccountKey_complete___block_invoke;
  v11[3] = &unk_26479ECB0;
  id v12 = v5;
  id v13 = v6;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __61__TransparencyDaemon_transparencyCheckKTAccountKey_complete___block_invoke_349;
  v9[3] = &unk_26479E748;
  id v10 = v13;
  id v7 = v13;
  id v8 = v5;
  +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:v11 errorHandler:v9];
}

void __61__TransparencyDaemon_transparencyCheckKTAccountKey_complete___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_348);
  }
  id v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_226345000, v7, OS_LOG_TYPE_INFO, "Sending transparencyCheckKTAccountKey", v8, 2u);
  }
  [v5 transparencyCheckKTAccountKey:*(void *)(a1 + 32) complete:*(void *)(a1 + 40)];
}

uint64_t __61__TransparencyDaemon_transparencyCheckKTAccountKey_complete___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __61__TransparencyDaemon_transparencyCheckKTAccountKey_complete___block_invoke_349(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)transparencyTriggerTTR:(id)a3 handle:(id)a4 complete:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __61__TransparencyDaemon_transparencyTriggerTTR_handle_complete___block_invoke;
  v15[3] = &unk_26479ECD8;
  id v17 = v8;
  id v18 = v9;
  id v16 = v7;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __61__TransparencyDaemon_transparencyTriggerTTR_handle_complete___block_invoke_357;
  v13[3] = &unk_26479E748;
  id v14 = v18;
  id v10 = v18;
  id v11 = v8;
  id v12 = v7;
  +[TransparencyXPCConnection invokeIDSSupportWithBlock:v15 errorHandler:v13];
}

void __61__TransparencyDaemon_transparencyTriggerTTR_handle_complete___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_351);
    }
    id v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = v6;
      _os_log_impl(&dword_226345000, v7, OS_LOG_TYPE_INFO, "ktTTR: failed send %{public}@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __61__TransparencyDaemon_transparencyTriggerTTR_handle_complete___block_invoke_352;
    v10[3] = &unk_26479E748;
    id v11 = *(id *)(a1 + 48);
    [v5 ttr:v8 fromHandle:v9 complete:v10];
  }
}

uint64_t __61__TransparencyDaemon_transparencyTriggerTTR_handle_complete___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

void __61__TransparencyDaemon_transparencyTriggerTTR_handle_complete___block_invoke_352(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_355);
    }
    id v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138543362;
      id v6 = v3;
      _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_ERROR, "ktTTR: trigger ttr %{public}@", (uint8_t *)&v5, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __61__TransparencyDaemon_transparencyTriggerTTR_handle_complete___block_invoke_2_353()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

void __61__TransparencyDaemon_transparencyTriggerTTR_handle_complete___block_invoke_357(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_360);
  }
  id v4 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&dword_226345000, v4, OS_LOG_TYPE_ERROR, "ktTTR: error handler %{public}@", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __61__TransparencyDaemon_transparencyTriggerTTR_handle_complete___block_invoke_2_358()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

- (void)clearTapToRadarNotification:(id)a3 complete:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __59__TransparencyDaemon_clearTapToRadarNotification_complete___block_invoke;
  v11[3] = &unk_26479ECB0;
  id v12 = v5;
  id v13 = v6;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __59__TransparencyDaemon_clearTapToRadarNotification_complete___block_invoke_363;
  v9[3] = &unk_26479E748;
  id v10 = v13;
  id v7 = v13;
  id v8 = v5;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:v11 errorHandler:v9];
}

void __59__TransparencyDaemon_clearTapToRadarNotification_complete___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_362);
  }
  id v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_226345000, v7, OS_LOG_TYPE_INFO, "Sending clearTapToRadarNotification", v8, 2u);
  }
  [v5 clearTapToRadarNotification:*(void *)(a1 + 32) complete:*(void *)(a1 + 40)];
}

uint64_t __59__TransparencyDaemon_clearTapToRadarNotification_complete___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __59__TransparencyDaemon_clearTapToRadarNotification_complete___block_invoke_363(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)transparencyCheckIDSHealth:(id *)a3
{
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__2;
  id v19 = __Block_byref_object_dispose__2;
  id v20 = @"unknown";
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__2;
  id v13 = __Block_byref_object_dispose__2;
  id v14 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__TransparencyDaemon_transparencyCheckIDSHealth___block_invoke;
  v8[3] = &unk_26479EBC8;
  void v8[4] = &v9;
  void v8[5] = &v15;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__TransparencyDaemon_transparencyCheckIDSHealth___block_invoke_2_371;
  v7[3] = &unk_26479EB08;
  void v7[4] = &v9;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:v8 errorHandler:v7];
  if (a3)
  {
    id v4 = (void *)v10[5];
    if (v4) {
      *a3 = v4;
    }
  }
  id v5 = (id)v16[5];
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);

  return v5;
}

void __49__TransparencyDaemon_transparencyCheckIDSHealth___block_invoke(int8x16_t *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(a1[2].i64[0] + 8) + 40), a3);
  }
  else
  {
    if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1) {
      dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_368);
    }
    id v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
    if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_226345000, v7, OS_LOG_TYPE_INFO, "Sending transparencyCheckIDSHealth", buf, 2u);
    }
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __49__TransparencyDaemon_transparencyCheckIDSHealth___block_invoke_369;
    v8[3] = &unk_26479ED00;
    int8x16_t v9 = vextq_s8(a1[2], a1[2], 8uLL);
    [v5 transparencyCheckIDSHealth:v8];
  }
}

uint64_t __49__TransparencyDaemon_transparencyCheckIDSHealth___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

void __49__TransparencyDaemon_transparencyCheckIDSHealth___block_invoke_369(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __49__TransparencyDaemon_transparencyCheckIDSHealth___block_invoke_2_371(uint64_t a1, void *a2)
{
}

- (void)transparencyIDSRegistration:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__TransparencyDaemon_transparencyIDSRegistration___block_invoke;
  v7[3] = &unk_26479E998;
  id v8 = v3;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __50__TransparencyDaemon_transparencyIDSRegistration___block_invoke_374;
  v5[3] = &unk_26479E748;
  id v6 = v8;
  id v4 = v8;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:v7 errorHandler:v5];
}

void __50__TransparencyDaemon_transparencyIDSRegistration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_373);
  }
  uint64_t v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_226345000, v7, OS_LOG_TYPE_INFO, "Sending transparencyPerformRegistrationSignature", v8, 2u);
  }
  [v5 transparencyIDSRegistration:*(void *)(a1 + 32)];
}

uint64_t __50__TransparencyDaemon_transparencyIDSRegistration___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __50__TransparencyDaemon_transparencyIDSRegistration___block_invoke_374(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)transparencyPerformRegistrationSignature:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__TransparencyDaemon_transparencyPerformRegistrationSignature___block_invoke;
  v7[3] = &unk_26479E998;
  id v8 = v3;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __63__TransparencyDaemon_transparencyPerformRegistrationSignature___block_invoke_377;
  v5[3] = &unk_26479E748;
  id v6 = v8;
  id v4 = v8;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:v7 errorHandler:v5];
}

void __63__TransparencyDaemon_transparencyPerformRegistrationSignature___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_376);
  }
  uint64_t v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_226345000, v7, OS_LOG_TYPE_INFO, "Sending transparencyPerformRegistrationSignature", v8, 2u);
  }
  [v5 transparencyPerformRegistrationSignature:*(void *)(a1 + 32)];
}

uint64_t __63__TransparencyDaemon_transparencyPerformRegistrationSignature___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __63__TransparencyDaemon_transparencyPerformRegistrationSignature___block_invoke_377(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)transparencyDumpKTRegistrationData:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__TransparencyDaemon_transparencyDumpKTRegistrationData___block_invoke;
  v7[3] = &unk_26479E998;
  id v8 = v3;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __57__TransparencyDaemon_transparencyDumpKTRegistrationData___block_invoke_380;
  v5[3] = &unk_26479E748;
  id v6 = v8;
  id v4 = v8;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:v7 errorHandler:v5];
}

void __57__TransparencyDaemon_transparencyDumpKTRegistrationData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_379);
  }
  uint64_t v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_226345000, v7, OS_LOG_TYPE_INFO, "Sending transparencyDumpKTRegistrationData", v8, 2u);
  }
  [v5 transparencyDumpKTRegistrationData:*(void *)(a1 + 32)];
}

uint64_t __57__TransparencyDaemon_transparencyDumpKTRegistrationData___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __57__TransparencyDaemon_transparencyDumpKTRegistrationData___block_invoke_380(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)transparencyGetKTSignatures:(id)a3 complete:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __59__TransparencyDaemon_transparencyGetKTSignatures_complete___block_invoke;
  v11[3] = &unk_26479ECB0;
  id v12 = v5;
  id v13 = v6;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __59__TransparencyDaemon_transparencyGetKTSignatures_complete___block_invoke_383;
  v9[3] = &unk_26479E748;
  id v10 = v13;
  id v7 = v13;
  id v8 = v5;
  +[TransparencyXPCConnection invokeXPCAsynchronousCallWithBlock:v11 errorHandler:v9];
}

void __59__TransparencyDaemon_transparencyGetKTSignatures_complete___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_382);
  }
  id v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_226345000, v7, OS_LOG_TYPE_INFO, "Sending transparencyGetKTSignatures:complete:", v8, 2u);
  }
  [v5 transparencyGetKTSignatures:*(void *)(a1 + 32) complete:*(void *)(a1 + 40)];
}

uint64_t __59__TransparencyDaemon_transparencyGetKTSignatures_complete___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __59__TransparencyDaemon_transparencyGetKTSignatures_complete___block_invoke_383(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)transparencyClearKTRegistrationData:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__TransparencyDaemon_transparencyClearKTRegistrationData___block_invoke;
  v7[3] = &unk_26479E998;
  id v8 = v3;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __58__TransparencyDaemon_transparencyClearKTRegistrationData___block_invoke_386;
  v5[3] = &unk_26479E748;
  id v6 = v8;
  id v4 = v8;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:v7 errorHandler:v5];
}

void __58__TransparencyDaemon_transparencyClearKTRegistrationData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_385);
  }
  id v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_226345000, v7, OS_LOG_TYPE_INFO, "Sending transparencyClearKTRegistrationData:", v8, 2u);
  }
  [v5 transparencyClearKTRegistrationData:*(void *)(a1 + 32)];
}

uint64_t __58__TransparencyDaemon_transparencyClearKTRegistrationData___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __58__TransparencyDaemon_transparencyClearKTRegistrationData___block_invoke_386(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)transparencyCloudDevices:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__TransparencyDaemon_transparencyCloudDevices___block_invoke;
  v7[3] = &unk_26479E998;
  id v8 = v3;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __47__TransparencyDaemon_transparencyCloudDevices___block_invoke_389;
  v5[3] = &unk_26479E748;
  id v6 = v8;
  id v4 = v8;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:v7 errorHandler:v5];
}

void __47__TransparencyDaemon_transparencyCloudDevices___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_388);
  }
  id v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_226345000, v7, OS_LOG_TYPE_INFO, "Sending transparencyCloudDevices", v8, 2u);
  }
  [v5 transparencyCloudDevices:*(void *)(a1 + 32)];
}

uint64_t __47__TransparencyDaemon_transparencyCloudDevices___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __47__TransparencyDaemon_transparencyCloudDevices___block_invoke_389(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)clearPeerState:(id)a3 uris:(id)a4 block:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __48__TransparencyDaemon_clearPeerState_uris_block___block_invoke;
  v13[3] = &unk_26479ED28;
  id v14 = v8;
  id v15 = v7;
  id v16 = v9;
  id v10 = v9;
  id v11 = v7;
  id v12 = v8;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:v13 errorHandler:v10];
}

void __48__TransparencyDaemon_clearPeerState_uris_block___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_391);
  }
  id v7 = (id)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    if (v8)
    {
      id v9 = [*(id *)(a1 + 32) componentsJoinedByString:@","];
    }
    else
    {
      id v9 = @"all peers";
    }
    int v10 = 138412290;
    id v11 = v9;
    _os_log_impl(&dword_226345000, v7, OS_LOG_TYPE_INFO, "Sending clearPeerState for %@", (uint8_t *)&v10, 0xCu);
    if (v8) {
  }
    }
  [v5 clearPeerState:*(void *)(a1 + 40) uris:*(void *)(a1 + 32) block:*(void *)(a1 + 48)];
}

uint64_t __48__TransparencyDaemon_clearPeerState_uris_block___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

- (void)transparencyTriggerOperation:(id)a3 complete:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __60__TransparencyDaemon_transparencyTriggerOperation_complete___block_invoke;
  v11[3] = &unk_26479ECB0;
  id v12 = v5;
  id v13 = v6;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __60__TransparencyDaemon_transparencyTriggerOperation_complete___block_invoke_400;
  v9[3] = &unk_26479E748;
  id v10 = v13;
  id v7 = v13;
  id v8 = v5;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:v11 errorHandler:v9];
}

void __60__TransparencyDaemon_transparencyTriggerOperation_complete___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_399);
  }
  id v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_226345000, v7, OS_LOG_TYPE_INFO, "Sending transparencyTriggerOperation", v8, 2u);
  }
  [v5 transparencyTriggerOperation:*(void *)(a1 + 32) complete:*(void *)(a1 + 40)];
}

uint64_t __60__TransparencyDaemon_transparencyTriggerOperation_complete___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __60__TransparencyDaemon_transparencyTriggerOperation_complete___block_invoke_400(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)changeOptInState:(unint64_t)a3 application:(id)a4 complete:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __60__TransparencyDaemon_changeOptInState_application_complete___block_invoke;
  v13[3] = &unk_26479ED50;
  unint64_t v16 = a3;
  id v14 = v7;
  id v15 = v8;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __60__TransparencyDaemon_changeOptInState_application_complete___block_invoke_403;
  v11[3] = &unk_26479E748;
  id v12 = v15;
  id v9 = v15;
  id v10 = v7;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:v13 errorHandler:v11];
}

void __60__TransparencyDaemon_changeOptInState_application_complete___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_402);
  }
  id v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = a1[6];
    v9[0] = 67109120;
    v9[1] = v8;
    _os_log_impl(&dword_226345000, v7, OS_LOG_TYPE_INFO, "Sending changeOptInState:complete: %d", (uint8_t *)v9, 8u);
  }
  [v5 changeOptInState:a1[6] application:a1[4] completionBlock:a1[5]];
}

uint64_t __60__TransparencyDaemon_changeOptInState_application_complete___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __60__TransparencyDaemon_changeOptInState_application_complete___block_invoke_403(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getOptInState:(id)a3 complete:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __45__TransparencyDaemon_getOptInState_complete___block_invoke;
  v11[3] = &unk_26479ECB0;
  id v12 = v5;
  id v13 = v6;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  _DWORD v9[2] = __45__TransparencyDaemon_getOptInState_complete___block_invoke_406;
  v9[3] = &unk_26479E748;
  id v10 = v13;
  id v7 = v13;
  id v8 = v5;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:v11 errorHandler:v9];
}

void __45__TransparencyDaemon_getOptInState_complete___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_405);
  }
  id v7 = (void *)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    id v8 = *(void **)(a1 + 32);
    id v9 = v7;
    id v10 = [v8 application];
    int v11 = 138412290;
    id v12 = v10;
    _os_log_impl(&dword_226345000, v9, OS_LOG_TYPE_INFO, "Sending getOptInState:complete: %@", (uint8_t *)&v11, 0xCu);
  }
  [v5 getOptInStateForAccount:*(void *)(a1 + 32) complete:*(void *)(a1 + 40)];
}

uint64_t __45__TransparencyDaemon_getOptInState_complete___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __45__TransparencyDaemon_getOptInState_complete___block_invoke_406(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getOptInForURI:(id)a3 application:(id)a4 complete:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __58__TransparencyDaemon_getOptInForURI_application_complete___block_invoke;
  v15[3] = &unk_26479ED28;
  id v16 = v7;
  id v17 = v8;
  id v18 = v9;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __58__TransparencyDaemon_getOptInForURI_application_complete___block_invoke_409;
  v13[3] = &unk_26479E748;
  id v14 = v18;
  id v10 = v18;
  id v11 = v8;
  id v12 = v7;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:v15 errorHandler:v13];
}

void __58__TransparencyDaemon_getOptInForURI_application_complete___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_408);
  }
  id v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_226345000, v7, OS_LOG_TYPE_INFO, "Sending getOptInForURI:application:complete:", v8, 2u);
  }
  [v5 getOptInForURI:a1[4] application:a1[5] complete:a1[6]];
}

uint64_t __58__TransparencyDaemon_getOptInForURI_application_complete___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __58__TransparencyDaemon_getOptInForURI_application_complete___block_invoke_409(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setOptInForURI:(id)a3 application:(id)a4 state:(BOOL)a5 smtTimestamp:(id)a6 complete:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __77__TransparencyDaemon_setOptInForURI_application_state_smtTimestamp_complete___block_invoke;
  v21[3] = &unk_26479ED78;
  id v22 = v11;
  id v23 = v12;
  BOOL v26 = a5;
  id v24 = v13;
  id v25 = v14;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __77__TransparencyDaemon_setOptInForURI_application_state_smtTimestamp_complete___block_invoke_412;
  v19[3] = &unk_26479E748;
  id v20 = v25;
  id v15 = v25;
  id v16 = v13;
  id v17 = v12;
  id v18 = v11;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:v21 errorHandler:v19];
}

void __77__TransparencyDaemon_setOptInForURI_application_state_smtTimestamp_complete___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_411);
  }
  id v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_226345000, v7, OS_LOG_TYPE_INFO, "Sending setOptInForURI:application:state:complete:", v8, 2u);
  }
  [v5 setOptInForURI:*(void *)(a1 + 32) application:*(void *)(a1 + 40) state:*(unsigned __int8 *)(a1 + 64) smtTimestamp:*(void *)(a1 + 48) complete:*(void *)(a1 + 56)];
}

uint64_t __77__TransparencyDaemon_setOptInForURI_application_state_smtTimestamp_complete___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __77__TransparencyDaemon_setOptInForURI_application_state_smtTimestamp_complete___block_invoke_412(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getAllOptInStates:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__TransparencyDaemon_getAllOptInStates___block_invoke;
  v7[3] = &unk_26479E998;
  id v8 = v3;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__TransparencyDaemon_getAllOptInStates___block_invoke_415;
  v5[3] = &unk_26479E748;
  id v6 = v8;
  id v4 = v8;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:v7 errorHandler:v5];
}

void __40__TransparencyDaemon_getAllOptInStates___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_414);
  }
  id v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_226345000, v7, OS_LOG_TYPE_INFO, "Sending getAllOptInStates:complete:", v8, 2u);
  }
  [v5 getAllOptInStates:*(void *)(a1 + 32)];
}

uint64_t __40__TransparencyDaemon_getAllOptInStates___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __40__TransparencyDaemon_getAllOptInStates___block_invoke_415(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getOptInStateForApplication:(id)a3 complete:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __59__TransparencyDaemon_getOptInStateForApplication_complete___block_invoke;
  v11[3] = &unk_26479ECB0;
  id v12 = v5;
  id v13 = v6;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  _DWORD v9[2] = __59__TransparencyDaemon_getOptInStateForApplication_complete___block_invoke_418;
  v9[3] = &unk_26479E748;
  id v10 = v13;
  id v7 = v13;
  id v8 = v5;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:v11 errorHandler:v9];
}

void __59__TransparencyDaemon_getOptInStateForApplication_complete___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_417);
  }
  id v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_226345000, v7, OS_LOG_TYPE_INFO, "Sending getAggregateOptInState:application:complete:", v8, 2u);
  }
  [v5 getOptInStateForApplication:*(void *)(a1 + 32) complete:*(void *)(a1 + 40)];
}

uint64_t __59__TransparencyDaemon_getOptInStateForApplication_complete___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __59__TransparencyDaemon_getOptInStateForApplication_complete___block_invoke_418(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)clearOptInStateForURI:(id)a3 application:(id)a4 complete:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __65__TransparencyDaemon_clearOptInStateForURI_application_complete___block_invoke;
  v15[3] = &unk_26479ED28;
  id v16 = v7;
  id v17 = v8;
  id v18 = v9;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __65__TransparencyDaemon_clearOptInStateForURI_application_complete___block_invoke_421;
  v13[3] = &unk_26479E748;
  id v14 = v18;
  id v10 = v18;
  id v11 = v8;
  id v12 = v7;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:v15 errorHandler:v13];
}

void __65__TransparencyDaemon_clearOptInStateForURI_application_complete___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_420);
  }
  id v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_226345000, v7, OS_LOG_TYPE_INFO, "Sending clearOptInStateForURI:application:complete:", v8, 2u);
  }
  [v5 clearOptInStateForURI:a1[4] application:a1[5] complete:a1[6]];
}

uint64_t __65__TransparencyDaemon_clearOptInStateForURI_application_complete___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __65__TransparencyDaemon_clearOptInStateForURI_application_complete___block_invoke_421(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)transparencyCloudDeviceAdd:(id)a3 clientData:(id)a4 complete:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __69__TransparencyDaemon_transparencyCloudDeviceAdd_clientData_complete___block_invoke;
  v15[3] = &unk_26479ED28;
  id v16 = v7;
  id v17 = v8;
  id v18 = v9;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __69__TransparencyDaemon_transparencyCloudDeviceAdd_clientData_complete___block_invoke_424;
  v13[3] = &unk_26479E748;
  id v14 = v18;
  id v10 = v18;
  id v11 = v8;
  id v12 = v7;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:v15 errorHandler:v13];
}

void __69__TransparencyDaemon_transparencyCloudDeviceAdd_clientData_complete___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_423);
  }
  id v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_226345000, v7, OS_LOG_TYPE_INFO, "Sending transparencyCloudDeviceAdd:complete:", v8, 2u);
  }
  [v5 transparencyCloudDeviceAdd:a1[4] clientData:a1[5] complete:a1[6]];
}

uint64_t __69__TransparencyDaemon_transparencyCloudDeviceAdd_clientData_complete___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __69__TransparencyDaemon_transparencyCloudDeviceAdd_clientData_complete___block_invoke_424(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)transparencyCloudDeviceRemove:(id)a3 clientData:(id)a4 complete:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __72__TransparencyDaemon_transparencyCloudDeviceRemove_clientData_complete___block_invoke;
  v15[3] = &unk_26479ED28;
  id v16 = v7;
  id v17 = v8;
  id v18 = v9;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __72__TransparencyDaemon_transparencyCloudDeviceRemove_clientData_complete___block_invoke_427;
  v13[3] = &unk_26479E748;
  id v14 = v18;
  id v10 = v18;
  id v11 = v8;
  id v12 = v7;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:v15 errorHandler:v13];
}

void __72__TransparencyDaemon_transparencyCloudDeviceRemove_clientData_complete___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_426);
  }
  id v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_226345000, v7, OS_LOG_TYPE_INFO, "Sending transparencyCloudDeviceRemove:complete:", v8, 2u);
  }
  [v5 transparencyCloudDeviceRemove:a1[4] clientData:a1[5] complete:a1[6]];
}

uint64_t __72__TransparencyDaemon_transparencyCloudDeviceRemove_clientData_complete___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __72__TransparencyDaemon_transparencyCloudDeviceRemove_clientData_complete___block_invoke_427(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateIDSRecommendation:(BOOL)a3 complete:(id)a4
{
  id v5 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  _DWORD v9[2] = __55__TransparencyDaemon_updateIDSRecommendation_complete___block_invoke;
  v9[3] = &unk_26479EDA0;
  BOOL v11 = a3;
  id v10 = v5;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__TransparencyDaemon_updateIDSRecommendation_complete___block_invoke_430;
  v7[3] = &unk_26479E748;
  id v8 = v10;
  id v6 = v10;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:v9 errorHandler:v7];
}

void __55__TransparencyDaemon_updateIDSRecommendation_complete___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_429);
  }
  id v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_226345000, v7, OS_LOG_TYPE_INFO, "Sending updateIDSRecommendation:complete:", v8, 2u);
  }
  [v5 updateIDSRecommendation:*(unsigned __int8 *)(a1 + 40) complete:*(void *)(a1 + 32)];
}

uint64_t __55__TransparencyDaemon_updateIDSRecommendation_complete___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __55__TransparencyDaemon_updateIDSRecommendation_complete___block_invoke_430(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setOSUpdate:(BOOL)a3 complete:(id)a4
{
  id v5 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  _DWORD v9[2] = __43__TransparencyDaemon_setOSUpdate_complete___block_invoke;
  v9[3] = &unk_26479EDA0;
  BOOL v11 = a3;
  id v10 = v5;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__TransparencyDaemon_setOSUpdate_complete___block_invoke_433;
  v7[3] = &unk_26479E748;
  id v8 = v10;
  id v6 = v10;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:v9 errorHandler:v7];
}

void __43__TransparencyDaemon_setOSUpdate_complete___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_432);
  }
  id v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_226345000, v7, OS_LOG_TYPE_INFO, "Sending setOSUpdate:complete:", v8, 2u);
  }
  [v5 setOSUpdate:*(unsigned __int8 *)(a1 + 40) complete:*(void *)(a1 + 32)];
}

uint64_t __43__TransparencyDaemon_setOSUpdate_complete___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __43__TransparencyDaemon_setOSUpdate_complete___block_invoke_433(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setOverrideTimeBetweenReports:(double)a3 completion:(id)a4
{
  id v5 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  _DWORD v9[2] = __63__TransparencyDaemon_setOverrideTimeBetweenReports_completion___block_invoke;
  v9[3] = &unk_26479EDC8;
  double v11 = a3;
  id v10 = v5;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__TransparencyDaemon_setOverrideTimeBetweenReports_completion___block_invoke_436;
  v7[3] = &unk_26479E748;
  id v8 = v10;
  id v6 = v10;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:v9 errorHandler:v7];
}

void __63__TransparencyDaemon_setOverrideTimeBetweenReports_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_435);
  }
  id v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_226345000, v7, OS_LOG_TYPE_INFO, "Sending setOverrideTimeBetweenReports:complete:", v8, 2u);
  }
  [v5 setOverrideTimeBetweenReports:*(void *)(a1 + 32) completion:*(double *)(a1 + 40)];
}

uint64_t __63__TransparencyDaemon_setOverrideTimeBetweenReports_completion___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __63__TransparencyDaemon_setOverrideTimeBetweenReports_completion___block_invoke_436(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)clearEligibilityOverrides:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__TransparencyDaemon_clearEligibilityOverrides___block_invoke;
  v7[3] = &unk_26479E998;
  id v8 = v3;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __48__TransparencyDaemon_clearEligibilityOverrides___block_invoke_439;
  v5[3] = &unk_26479E748;
  id v6 = v8;
  id v4 = v8;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:v7 errorHandler:v5];
}

void __48__TransparencyDaemon_clearEligibilityOverrides___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_438);
  }
  id v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_226345000, v7, OS_LOG_TYPE_INFO, "Sending clearEligibilityOverrides:", v8, 2u);
  }
  [v5 clearEligibilityOverrides:*(void *)(a1 + 32)];
}

uint64_t __48__TransparencyDaemon_clearEligibilityOverrides___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __48__TransparencyDaemon_clearEligibilityOverrides___block_invoke_439(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)reportEligibility:(id)a3 complete:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __49__TransparencyDaemon_reportEligibility_complete___block_invoke;
  v11[3] = &unk_26479ECB0;
  id v12 = v5;
  id v13 = v6;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  _DWORD v9[2] = __49__TransparencyDaemon_reportEligibility_complete___block_invoke_442;
  v9[3] = &unk_26479E748;
  id v10 = v13;
  id v7 = v13;
  id v8 = v5;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:v11 errorHandler:v9];
}

void __49__TransparencyDaemon_reportEligibility_complete___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_441);
  }
  id v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_226345000, v7, OS_LOG_TYPE_INFO, "Sending reportEligibility:complete:", v8, 2u);
  }
  [v5 reportEligibility:*(void *)(a1 + 32) complete:*(void *)(a1 + 40)];
}

uint64_t __49__TransparencyDaemon_reportEligibility_complete___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __49__TransparencyDaemon_reportEligibility_complete___block_invoke_442(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getAggregateResult:(int64_t)a3 element:(id)a4 complete:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __58__TransparencyDaemon_getAggregateResult_element_complete___block_invoke;
  v13[3] = &unk_26479ED50;
  int64_t v16 = a3;
  id v14 = v7;
  id v15 = v8;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __58__TransparencyDaemon_getAggregateResult_element_complete___block_invoke_445;
  v11[3] = &unk_26479E748;
  id v12 = v15;
  id v9 = v15;
  id v10 = v7;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:v13 errorHandler:v11];
}

void __58__TransparencyDaemon_getAggregateResult_element_complete___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_444);
  }
  id v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_226345000, v7, OS_LOG_TYPE_INFO, "Sending getAggregateResult:", v8, 2u);
  }
  [v5 getAggregateResult:a1[6] element:a1[4] complete:a1[5]];
}

uint64_t __58__TransparencyDaemon_getAggregateResult_element_complete___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __58__TransparencyDaemon_getAggregateResult_element_complete___block_invoke_445(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)insertResultForElement:(id)a3 samplesAgo:(id)a4 success:(BOOL)a5 complete:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __73__TransparencyDaemon_insertResultForElement_samplesAgo_success_complete___block_invoke;
  v17[3] = &unk_26479EDF0;
  id v18 = v9;
  id v19 = v10;
  BOOL v21 = a5;
  id v20 = v11;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __73__TransparencyDaemon_insertResultForElement_samplesAgo_success_complete___block_invoke_448;
  v15[3] = &unk_26479E748;
  id v16 = v20;
  id v12 = v20;
  id v13 = v10;
  id v14 = v9;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:v17 errorHandler:v15];
}

void __73__TransparencyDaemon_insertResultForElement_samplesAgo_success_complete___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_447);
  }
  id v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_226345000, v7, OS_LOG_TYPE_INFO, "Sending insertResultForElement:", v8, 2u);
  }
  [v5 insertResultForElement:*(void *)(a1 + 32) samplesAgo:*(void *)(a1 + 40) success:*(unsigned __int8 *)(a1 + 56) complete:*(void *)(a1 + 48)];
}

uint64_t __73__TransparencyDaemon_insertResultForElement_samplesAgo_success_complete___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __73__TransparencyDaemon_insertResultForElement_samplesAgo_success_complete___block_invoke_448(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)transparencyTriggerMaybeReportEligibility:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__TransparencyDaemon_transparencyTriggerMaybeReportEligibility___block_invoke;
  v7[3] = &unk_26479E998;
  id v8 = v3;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __64__TransparencyDaemon_transparencyTriggerMaybeReportEligibility___block_invoke_451;
  v5[3] = &unk_26479E748;
  id v6 = v8;
  id v4 = v8;
  +[TransparencyXPCConnection invokeXPCSynchronousCallWithBlock:v7 errorHandler:v5];
}

void __64__TransparencyDaemon_transparencyTriggerMaybeReportEligibility___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (TRANSPARENCY_DEFAULT_LOG_BLOCK_5 != -1) {
    dispatch_once(&TRANSPARENCY_DEFAULT_LOG_BLOCK_5, &__block_literal_global_450);
  }
  id v7 = TRANSPARENCY_DEFAULT_LOG_INTERNAL_5;
  if (os_log_type_enabled((os_log_t)TRANSPARENCY_DEFAULT_LOG_INTERNAL_5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_226345000, v7, OS_LOG_TYPE_INFO, "Sending transparencyTriggerMaybeReportEligibility", v8, 2u);
  }
  [v5 triggerMaybeReportEligibility:*(void *)(a1 + 32)];
}

uint64_t __64__TransparencyDaemon_transparencyTriggerMaybeReportEligibility___block_invoke_2()
{
  TRANSPARENCY_DEFAULT_LOG_INTERNAL_5 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  return MEMORY[0x270F9A758]();
}

uint64_t __64__TransparencyDaemon_transparencyTriggerMaybeReportEligibility___block_invoke_451(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end