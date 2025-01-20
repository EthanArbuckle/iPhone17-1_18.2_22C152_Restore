@interface SCDAEmergencyCallPunchout
- (SCDAEmergencyCallPunchout)init;
- (void)initiateEmergencyCallMyriad;
@end

@implementation SCDAEmergencyCallPunchout

- (void).cxx_destruct
{
}

- (void)initiateEmergencyCallMyriad
{
}

void __56__SCDAEmergencyCallPunchout_initiateEmergencyCallMyriad__block_invoke()
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v0 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = "-[SCDAEmergencyCallPunchout initiateEmergencyCallMyriad]_block_invoke";
    _os_log_impl(&dword_25C707000, v0, OS_LOG_TYPE_INFO, "%s Punching out to Phone app to make emergency call", buf, 0xCu);
  }
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2050000000;
  v1 = (void *)getTUCallProviderManagerClass_softClass;
  uint64_t v19 = getTUCallProviderManagerClass_softClass;
  if (!getTUCallProviderManagerClass_softClass)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getTUCallProviderManagerClass_block_invoke;
    v21 = &unk_2654B7FF8;
    v22 = &v16;
    TelephonyUtilitiesLibraryCore();
    Class Class = objc_getClass("TUCallProviderManager");
    *(void *)(v22[1] + 24) = Class;
    getTUCallProviderManagerClass_softClass Class = *(void *)(v22[1] + 24);
    v1 = (void *)v17[3];
  }
  v3 = v1;
  _Block_object_dispose(&v16, 8);
  id v4 = objc_alloc_init(v3);
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2050000000;
  v5 = (void *)getTUDialRequestClass_softClass;
  uint64_t v19 = getTUDialRequestClass_softClass;
  if (!getTUDialRequestClass_softClass)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getTUDialRequestClass_block_invoke;
    v21 = &unk_2654B7FF8;
    v22 = &v16;
    TelephonyUtilitiesLibraryCore();
    Class v6 = objc_getClass("TUDialRequest");
    *(void *)(v22[1] + 24) = v6;
    getTUDialRequestClass_softClass Class = *(void *)(v22[1] + 24);
    v5 = (void *)v17[3];
  }
  v7 = v5;
  _Block_object_dispose(&v16, 8);
  id v8 = [v7 alloc];
  v9 = [v4 emergencyProvider];
  v10 = (void *)[v8 initWithProvider:v9];

  [v10 setPerformDialAssist:0];
  [v10 setDialType:1];
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  v11 = (void *)getTUCallSourceIdentifierSpeakerRouteSymbolLoc_ptr;
  uint64_t v19 = getTUCallSourceIdentifierSpeakerRouteSymbolLoc_ptr;
  if (!getTUCallSourceIdentifierSpeakerRouteSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getTUCallSourceIdentifierSpeakerRouteSymbolLoc_block_invoke;
    v21 = &unk_2654B7FF8;
    v22 = &v16;
    __getTUCallSourceIdentifierSpeakerRouteSymbolLoc_block_invoke((uint64_t)buf);
    v11 = (void *)v17[3];
  }
  _Block_object_dispose(&v16, 8);
  if (!v11)
  {
    dlerror();
    abort_report_np();
    __break(1u);
  }
  [v10 setAudioSourceIdentifier:*v11];
  v12 = SCDALogContextCore;
  if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&buf[4] = "-[SCDAEmergencyCallPunchout initiateEmergencyCallMyriad]_block_invoke";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v10;
    _os_log_impl(&dword_25C707000, v12, OS_LOG_TYPE_INFO, "%s Emergency beacon handling created dial request %@", buf, 0x16u);
  }
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __56__SCDAEmergencyCallPunchout_initiateEmergencyCallMyriad__block_invoke_6;
  v14[3] = &unk_2654B7FA8;
  id v15 = v10;
  id v13 = v10;
  [v4 launchAppForDialRequest:v13 completion:v14];
}

void __56__SCDAEmergencyCallPunchout_initiateEmergencyCallMyriad__block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = SCDALogContextCore;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315394;
      v7 = "-[SCDAEmergencyCallPunchout initiateEmergencyCallMyriad]_block_invoke";
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_error_impl(&dword_25C707000, v4, OS_LOG_TYPE_ERROR, "%s Emergency beacon initiated call failed, error: %@", (uint8_t *)&v6, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)SCDALogContextCore, OS_LOG_TYPE_INFO))
  {
    v5 = *(void **)(a1 + 32);
    int v6 = 136315394;
    v7 = "-[SCDAEmergencyCallPunchout initiateEmergencyCallMyriad]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v5;
    _os_log_impl(&dword_25C707000, v4, OS_LOG_TYPE_INFO, "%s Emergency beacon initiated call created: %@", (uint8_t *)&v6, 0x16u);
  }
}

- (SCDAEmergencyCallPunchout)init
{
  v6.receiver = self;
  v6.super_class = (Class)SCDAEmergencyCallPunchout;
  v2 = [(SCDAEmergencyCallPunchout *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.myriad_emergncy_call", 0);
    myriadEmergencyCallingQueue = v2->_myriadEmergencyCallingQueue;
    v2->_myriadEmergencyCallingQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

@end