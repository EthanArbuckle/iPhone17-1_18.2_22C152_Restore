@interface WFMeasure
+ (BOOL)isOnSupportedPlatform;
- (BOOL)doDNSResolution:(id)a3 timeout:(int64_t)a4;
- (BOOL)doPing:(id)a3 count:(int64_t)a4 timeout:(int64_t)a5 size:(int64_t)a6 class:(int64_t)a7 minRTT:(int64_t *)a8 maxRTT:(int64_t *)a9 successCount:(int64_t *)a10;
- (BOOL)isApsdTimeout;
- (BOOL)isInProgress;
- (BOOL)isParis;
- (BOOL)isPeriodicTest;
- (BOOL)isRetest;
- (BOOL)isSiriTimeout;
- (BOOL)shouldApsdSampleSiriTCP;
- (BOOL)shouldApsdSampleSiriTLS;
- (BOOL)shouldPeriodicSampleSiriTCP;
- (BOOL)shouldPeriodicSampleSiriTLS;
- (BOOL)shouldTimeoutSampleSiriTCP;
- (BOOL)shouldTimeoutSampleSiriTLS;
- (BOOL)start:(id)a3 withCompletionQueue:(id)a4;
- (NPTPerformanceTest)performanceTest;
- (NSMutableSet)dnsServers;
- (NSString)gatewayAddress;
- (NSString)interfaceName;
- (NSString)publicDNSAddress;
- (NSString)testDNSHostname;
- (NSString)testReason;
- (OS_dispatch_group)dispatchGroup;
- (OS_dispatch_queue)completionQueue;
- (OS_dispatch_queue)internalQueue;
- (WFMeasure)initWithType:(unint64_t)a3 andReason:(id)a4 prevTestedOptions:(unint64_t)a5 andInterfaceName:(id)a6;
- (WFMeasureResult)result;
- (id)completionHandler;
- (id)description;
- (unint64_t)options;
- (unsigned)getApsdSampleTrafficClass;
- (unsigned)getPeriodicSampleTrafficClass;
- (unsigned)getTimeoutSampleTrafficClass;
- (unsigned)tclass;
- (void)abort;
- (void)dispatchDNSTest:(id)a3;
- (void)dispatchPingTest:(unint64_t)a3;
- (void)dispatchSiriTest:(int64_t)a3 trafficClass:(unsigned int)a4;
- (void)dispatchThroughputTest;
- (void)doThroughputTest;
- (void)getLazyNSNumberPreference:(id)a3 exists:(id)a4;
- (void)getLazyNSStringPreference:(id)a3 exists:(id)a4;
- (void)retrieveNetworkConfigurations;
- (void)setCompletionHandler:(id)a3;
- (void)setCompletionQueue:(id)a3;
- (void)setDispatchGroup:(id)a3;
- (void)setDnsServers:(id)a3;
- (void)setGatewayAddress:(id)a3;
- (void)setInterfaceName:(id)a3;
- (void)setInternalQueue:(id)a3;
- (void)setIsApsdTimeout:(BOOL)a3;
- (void)setIsInProgress:(BOOL)a3;
- (void)setIsParis:(BOOL)a3;
- (void)setIsPeriodicTest:(BOOL)a3;
- (void)setIsRetest:(BOOL)a3;
- (void)setIsSiriTimeout:(BOOL)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setPerformanceTest:(id)a3;
- (void)setPublicDNSAddress:(id)a3;
- (void)setResult:(id)a3;
- (void)setTclass:(unsigned int)a3;
- (void)setTestDNSHostname:(id)a3;
- (void)setTestReason:(id)a3;
@end

@implementation WFMeasure

+ (BOOL)isOnSupportedPlatform
{
  return 0;
}

- (WFMeasure)initWithType:(unint64_t)a3 andReason:(id)a4 prevTestedOptions:(unint64_t)a5 andInterfaceName:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  v36.receiver = self;
  v36.super_class = (Class)WFMeasure;
  v12 = [(WFMeasure *)&v36 init];
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  *(_DWORD *)(v12 + 9) = 0;
  v12[13] = 0;
  NSLog(&cfstr_SRequestingTes.isa, "-[WFMeasure initWithType:andReason:prevTestedOptions:andInterfaceName:]", a3, v10, a5, v11);
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    NSLog(&cfstr_SFeatureNotEna.isa, "-[WFMeasure initWithType:andReason:prevTestedOptions:andInterfaceName:]");
    goto LABEL_25;
  }
  if (MGGetBoolAnswer())
  {
    *((unsigned char *)v29 + 24) = 1;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __71__WFMeasure_initWithType_andReason_prevTestedOptions_andInterfaceName___block_invoke;
    v27[3] = &unk_1E69BD830;
    v27[4] = &v28;
    [v12 getLazyNSNumberPreference:@"behave_as_internal" exists:v27];
  }
  if (MGGetBoolAnswer())
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __71__WFMeasure_initWithType_andReason_prevTestedOptions_andInterfaceName___block_invoke_2;
    v26[3] = &unk_1E69BD830;
    v26[4] = &v32;
    [v12 getLazyNSNumberPreference:@"behave_as_seed" exists:v26];
  }
  if (MGGetBoolAnswer())
  {
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __71__WFMeasure_initWithType_andReason_prevTestedOptions_andInterfaceName___block_invoke_3;
    v24[3] = &unk_1E69BD858;
    v25 = v12;
    [v25 getLazyNSNumberPreference:@"behave_as_paris" exists:v24];
  }
  [v12 setIsInProgress:0];
  [v12 setOptions:0];
  [v12 setInterfaceName:v11];
  [v12 setTestReason:v10];
  dispatch_group_t v13 = dispatch_group_create();
  [v12 setDispatchGroup:v13];

  [v12 setTclass:700];
  if ([v10 containsString:@"periodicTestHourly"]) {
    v12[9] = 1;
  }
  if ([v10 containsString:@"Siri Timed Out"]) {
    v12[10] = 1;
  }
  if ([v10 containsString:@"Apsd Timed Out"]) {
    v12[11] = 1;
  }
  if (a5)
  {
    NSLog(&cfstr_SBecausePrevte.isa, "-[WFMeasure initWithType:andReason:prevTestedOptions:andInterfaceName:]");
    v12[12] = 1;
  }
  if (MGGetBoolAnswer())
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __71__WFMeasure_initWithType_andReason_prevTestedOptions_andInterfaceName___block_invoke_4;
    v22[3] = &unk_1E69BD858;
    v23 = v12;
    [v23 getLazyNSNumberPreference:@"behave_as_retest" exists:v22];
  }
  if (v12[12])
  {
    NSLog(&cfstr_SBecauseIsrete.isa, "-[WFMeasure initWithType:andReason:prevTestedOptions:andInterfaceName:]", a5);
    [v12 setOptions:a5];
  }
  switch(a3)
  {
    case 0xFFFFFFFFuLL:
      objc_msgSend(v12, "setOptions:", objc_msgSend(v12, "options") | 1);
      objc_msgSend(v12, "setOptions:", objc_msgSend(v12, "options") | 2);
      objc_msgSend(v12, "setOptions:", objc_msgSend(v12, "options") | 4);
      if (!*((unsigned char *)v29 + 24) && !*((unsigned char *)v33 + 24)) {
        break;
      }
LABEL_32:
      objc_msgSend(v12, "setOptions:", objc_msgSend(v12, "options") | 8);
      uint64_t v14 = [v12 options] | 0x10;
      goto LABEL_33;
    case 2uLL:
      objc_msgSend(v12, "setOptions:", objc_msgSend(v12, "options") | 2);
      objc_msgSend(v12, "setOptions:", objc_msgSend(v12, "options") | 4);
      if (v12[13] && !*((unsigned char *)v29 + 24) && !*((unsigned char *)v33 + 24)) {
        break;
      }
      goto LABEL_32;
    case 1uLL:
      uint64_t v14 = [v12 options] | 1;
LABEL_33:
      [v12 setOptions:v14];
      break;
  }
  if (MGGetBoolAnswer())
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __71__WFMeasure_initWithType_andReason_prevTestedOptions_andInterfaceName___block_invoke_5;
    v20[3] = &unk_1E69BD858;
    v21 = v12;
    [v21 getLazyNSNumberPreference:@"test_options" exists:v20];
  }
  NSLog(&cfstr_SWillTestTypeL.isa, "-[WFMeasure initWithType:andReason:prevTestedOptions:andInterfaceName:]", a3, v10, a5, [v12 options], v11);
  if ([v12 options])
  {
    [v12 setPublicDNSAddress:@"1.1.1.1"];
    [v12 setTestDNSHostname:@"www.apple.com"];
    v16 = [[WFMeasureResult alloc] initWithType:a3];
    [v12 setResult:v16];

    uint64_t v17 = [v12 options];
    v18 = [v12 result];
    [v18 setOptions:v17];

    [v12 retrieveNetworkConfigurations];
    NSLog(&cfstr_SLqmWifi_0.isa, "-[WFMeasure initWithType:andReason:prevTestedOptions:andInterfaceName:]", v12);
    v12 = v12;
    v15 = (WFMeasure *)v12;
    goto LABEL_38;
  }
  NSLog(&cfstr_SOptionsNotSpe.isa, "-[WFMeasure initWithType:andReason:prevTestedOptions:andInterfaceName:]");

  v12 = 0;
LABEL_25:
  v15 = 0;
LABEL_38:
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);

  return v15;
}

void __71__WFMeasure_initWithType_andReason_prevTestedOptions_andInterfaceName___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  id v4 = a2;
  NSLog(&cfstr_SSettingIsinte.isa, "-[WFMeasure initWithType:andReason:prevTestedOptions:andInterfaceName:]_block_invoke", v3, [v4 BOOLValue]);
  LOBYTE(v3) = [v4 BOOLValue];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3;
}

void __71__WFMeasure_initWithType_andReason_prevTestedOptions_andInterfaceName___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  id v4 = a2;
  NSLog(&cfstr_SSettingIsseed.isa, "-[WFMeasure initWithType:andReason:prevTestedOptions:andInterfaceName:]_block_invoke_2", v3, [v4 BOOLValue]);
  LOBYTE(v3) = [v4 BOOLValue];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3;
}

void __71__WFMeasure_initWithType_andReason_prevTestedOptions_andInterfaceName___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 13);
  id v4 = a2;
  NSLog(&cfstr_SSettingIspari.isa, "-[WFMeasure initWithType:andReason:prevTestedOptions:andInterfaceName:]_block_invoke_3", v3, [v4 BOOLValue]);
  LOBYTE(v3) = [v4 BOOLValue];

  *(unsigned char *)(*(void *)(a1 + 32) + 13) = v3;
}

void __71__WFMeasure_initWithType_andReason_prevTestedOptions_andInterfaceName___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 12);
  id v4 = a2;
  NSLog(&cfstr_SSettingIsrete.isa, "-[WFMeasure initWithType:andReason:prevTestedOptions:andInterfaceName:]_block_invoke_4", v3, [v4 BOOLValue]);
  LOBYTE(v3) = [v4 BOOLValue];

  *(unsigned char *)(*(void *)(a1 + 32) + 12) = v3;
}

uint64_t __71__WFMeasure_initWithType_andReason_prevTestedOptions_andInterfaceName___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  NSLog(&cfstr_SOverridingKwf.isa, "-[WFMeasure initWithType:andReason:prevTestedOptions:andInterfaceName:]_block_invoke_5", [v3 options], objc_msgSend(v4, "unsignedIntValue"));
  unsigned int v5 = [v4 unsignedIntValue];

  v6 = *(void **)(a1 + 32);

  return [v6 setOptions:v5];
}

- (void)getLazyNSNumberPreference:(id)a3 exists:(id)a4
{
  id v9 = a3;
  unsigned int v5 = (void (**)(id, void *))a4;
  v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v7 = [v6 persistentDomainForName:@"com.apple.wifipolicy.wfmeasure"];

  v8 = [v7 objectForKey:v9];
  if (v8)
  {
    NSLog(&cfstr_SFoundPreferen.isa, "-[WFMeasure getLazyNSNumberPreference:exists:]", @"com.apple.wifipolicy.wfmeasure", v9);
    v5[2](v5, v8);
  }
}

- (void)getLazyNSStringPreference:(id)a3 exists:(id)a4
{
  id v9 = a3;
  unsigned int v5 = (void (**)(id, void *))a4;
  v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v7 = [v6 persistentDomainForName:@"com.apple.wifipolicy.wfmeasure"];

  v8 = [v7 objectForKey:v9];
  if (v8)
  {
    NSLog(&cfstr_SFoundPreferen.isa, "-[WFMeasure getLazyNSStringPreference:exists:]", @"com.apple.wifipolicy.wfmeasure", v9);
    v5[2](v5, v8);
  }
}

- (BOOL)shouldPeriodicSampleSiriTCP
{
  uint64_t v12 = 0;
  dispatch_group_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  int v15 = 0;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  int v11 = 0;
  if (MGGetBoolAnswer())
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __40__WFMeasure_shouldPeriodicSampleSiriTCP__block_invoke;
    v7[3] = &unk_1E69BD830;
    v7[4] = &v12;
    [(WFMeasure *)self getLazyNSNumberPreference:@"periodic_sampling_siri_numerator" exists:v7];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __40__WFMeasure_shouldPeriodicSampleSiriTCP__block_invoke_2;
    v6[3] = &unk_1E69BD830;
    v6[4] = &v8;
    [(WFMeasure *)self getLazyNSNumberPreference:@"periodic_sampling_siri_denominator" exists:v6];
  }
  uint32_t v3 = arc4random_uniform(*((_DWORD *)v9 + 6));
  uint32_t v4 = *((_DWORD *)v13 + 6);
  if (v3 >= v4) {
    NSLog(&cfstr_SPeriodicTestN.isa, "-[WFMeasure shouldPeriodicSampleSiriTCP]", *((unsigned int *)v13 + 6), *((unsigned int *)v9 + 6));
  }
  else {
    NSLog(&cfstr_SPeriodicTestS.isa, "-[WFMeasure shouldPeriodicSampleSiriTCP]", *((unsigned int *)v13 + 6), *((unsigned int *)v9 + 6));
  }
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  return v3 < v4;
}

void __40__WFMeasure_shouldPeriodicSampleSiriTCP__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  id v4 = a2;
  NSLog(&cfstr_SOverridingKwf_0.isa, "-[WFMeasure shouldPeriodicSampleSiriTCP]_block_invoke", v3, [v4 unsignedIntValue]);
  LODWORD(v3) = [v4 unsignedIntValue];

  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3;
}

void __40__WFMeasure_shouldPeriodicSampleSiriTCP__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  id v4 = a2;
  NSLog(&cfstr_SOverridingKwf_1.isa, "-[WFMeasure shouldPeriodicSampleSiriTCP]_block_invoke_2", v3, [v4 unsignedIntValue]);
  LODWORD(v3) = [v4 unsignedIntValue];

  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3;
}

- (BOOL)shouldPeriodicSampleSiriTLS
{
  uint64_t v12 = 0;
  dispatch_group_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  int v15 = 0;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  int v11 = 0;
  if (MGGetBoolAnswer())
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __40__WFMeasure_shouldPeriodicSampleSiriTLS__block_invoke;
    v7[3] = &unk_1E69BD830;
    v7[4] = &v12;
    [(WFMeasure *)self getLazyNSNumberPreference:@"periodic_sampling_siri_numerator" exists:v7];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __40__WFMeasure_shouldPeriodicSampleSiriTLS__block_invoke_2;
    v6[3] = &unk_1E69BD830;
    v6[4] = &v8;
    [(WFMeasure *)self getLazyNSNumberPreference:@"periodic_sampling_siri_denominator" exists:v6];
  }
  uint32_t v3 = arc4random_uniform(*((_DWORD *)v9 + 6));
  uint32_t v4 = *((_DWORD *)v13 + 6);
  if (v3 >= v4) {
    NSLog(&cfstr_SPeriodicTestN_0.isa, "-[WFMeasure shouldPeriodicSampleSiriTLS]", *((unsigned int *)v13 + 6), *((unsigned int *)v9 + 6));
  }
  else {
    NSLog(&cfstr_SPeriodicTestS_0.isa, "-[WFMeasure shouldPeriodicSampleSiriTLS]", *((unsigned int *)v13 + 6), *((unsigned int *)v9 + 6));
  }
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  return v3 < v4;
}

void __40__WFMeasure_shouldPeriodicSampleSiriTLS__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  id v4 = a2;
  NSLog(&cfstr_SOverridingKwf_0.isa, "-[WFMeasure shouldPeriodicSampleSiriTLS]_block_invoke", v3, [v4 unsignedIntValue]);
  LODWORD(v3) = [v4 unsignedIntValue];

  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3;
}

void __40__WFMeasure_shouldPeriodicSampleSiriTLS__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  id v4 = a2;
  NSLog(&cfstr_SOverridingKwf_1.isa, "-[WFMeasure shouldPeriodicSampleSiriTLS]_block_invoke_2", v3, [v4 unsignedIntValue]);
  LODWORD(v3) = [v4 unsignedIntValue];

  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3;
}

- (unsigned)getPeriodicSampleTrafficClass
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  arc4random_uniform(0);
  NSLog(&cfstr_SPerodicTraffi.isa, "-[WFMeasure getPeriodicSampleTrafficClass]");
  *((_DWORD *)v7 + 6) = 0;
  if (MGGetBoolAnswer())
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __42__WFMeasure_getPeriodicSampleTrafficClass__block_invoke;
    v5[3] = &unk_1E69BD830;
    v5[4] = &v6;
    [(WFMeasure *)self getLazyNSNumberPreference:@"periodic_siri_tclass" exists:v5];
  }
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __42__WFMeasure_getPeriodicSampleTrafficClass__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  NSLog(&cfstr_SOverridingKwf_2.isa, "-[WFMeasure getPeriodicSampleTrafficClass]_block_invoke", [v3 unsignedIntValue]);
  int v4 = [v3 unsignedIntValue];

  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
}

- (BOOL)shouldTimeoutSampleSiriTCP
{
  uint64_t v12 = 0;
  dispatch_group_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  int v15 = 0;
  uint64_t v8 = 0;
  int v9 = &v8;
  uint64_t v10 = 0x2020000000;
  int v11 = 0;
  if (MGGetBoolAnswer())
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __39__WFMeasure_shouldTimeoutSampleSiriTCP__block_invoke;
    v7[3] = &unk_1E69BD830;
    v7[4] = &v12;
    [(WFMeasure *)self getLazyNSNumberPreference:@"siri_timeout_sampling_numerator" exists:v7];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __39__WFMeasure_shouldTimeoutSampleSiriTCP__block_invoke_2;
    v6[3] = &unk_1E69BD830;
    v6[4] = &v8;
    [(WFMeasure *)self getLazyNSNumberPreference:@"siri_timeout_sampling_denominator" exists:v6];
  }
  uint32_t v3 = arc4random_uniform(*((_DWORD *)v9 + 6));
  uint32_t v4 = *((_DWORD *)v13 + 6);
  if (v3 >= v4) {
    NSLog(&cfstr_STimeoutTestNo.isa, "-[WFMeasure shouldTimeoutSampleSiriTCP]", *((unsigned int *)v13 + 6), *((unsigned int *)v9 + 6));
  }
  else {
    NSLog(&cfstr_STimeoutTestSe.isa, "-[WFMeasure shouldTimeoutSampleSiriTCP]", *((unsigned int *)v13 + 6), *((unsigned int *)v9 + 6));
  }
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  return v3 < v4;
}

void __39__WFMeasure_shouldTimeoutSampleSiriTCP__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  id v4 = a2;
  NSLog(&cfstr_SOverridingKwf_3.isa, "-[WFMeasure shouldTimeoutSampleSiriTCP]_block_invoke", v3, [v4 unsignedIntValue]);
  LODWORD(v3) = [v4 unsignedIntValue];

  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3;
}

void __39__WFMeasure_shouldTimeoutSampleSiriTCP__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  id v4 = a2;
  NSLog(&cfstr_SOverridingKwf_4.isa, "-[WFMeasure shouldTimeoutSampleSiriTCP]_block_invoke_2", v3, [v4 unsignedIntValue]);
  LODWORD(v3) = [v4 unsignedIntValue];

  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3;
}

- (BOOL)shouldTimeoutSampleSiriTLS
{
  uint64_t v12 = 0;
  dispatch_group_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  int v15 = 0;
  uint64_t v8 = 0;
  int v9 = &v8;
  uint64_t v10 = 0x2020000000;
  int v11 = 0;
  if (MGGetBoolAnswer())
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __39__WFMeasure_shouldTimeoutSampleSiriTLS__block_invoke;
    v7[3] = &unk_1E69BD830;
    v7[4] = &v12;
    [(WFMeasure *)self getLazyNSNumberPreference:@"siri_timeout_sampling_numerator" exists:v7];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __39__WFMeasure_shouldTimeoutSampleSiriTLS__block_invoke_2;
    v6[3] = &unk_1E69BD830;
    v6[4] = &v8;
    [(WFMeasure *)self getLazyNSNumberPreference:@"siri_timeout_sampling_denominator" exists:v6];
  }
  uint32_t v3 = arc4random_uniform(*((_DWORD *)v9 + 6));
  uint32_t v4 = *((_DWORD *)v13 + 6);
  if (v3 >= v4) {
    NSLog(&cfstr_STimeoutTestNo_0.isa, "-[WFMeasure shouldTimeoutSampleSiriTLS]", *((unsigned int *)v13 + 6), *((unsigned int *)v9 + 6));
  }
  else {
    NSLog(&cfstr_STimeoutTestSe_0.isa, "-[WFMeasure shouldTimeoutSampleSiriTLS]", *((unsigned int *)v13 + 6), *((unsigned int *)v9 + 6));
  }
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  return v3 < v4;
}

void __39__WFMeasure_shouldTimeoutSampleSiriTLS__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  id v4 = a2;
  NSLog(&cfstr_SOverridingKwf_3.isa, "-[WFMeasure shouldTimeoutSampleSiriTLS]_block_invoke", v3, [v4 unsignedIntValue]);
  LODWORD(v3) = [v4 unsignedIntValue];

  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3;
}

void __39__WFMeasure_shouldTimeoutSampleSiriTLS__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  id v4 = a2;
  NSLog(&cfstr_SOverridingKwf_4.isa, "-[WFMeasure shouldTimeoutSampleSiriTLS]_block_invoke_2", v3, [v4 unsignedIntValue]);
  LODWORD(v3) = [v4 unsignedIntValue];

  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3;
}

- (unsigned)getTimeoutSampleTrafficClass
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  arc4random_uniform(0);
  NSLog(&cfstr_STimeoutTraffi.isa, "-[WFMeasure getTimeoutSampleTrafficClass]");
  *((_DWORD *)v7 + 6) = 0;
  if (MGGetBoolAnswer())
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __41__WFMeasure_getTimeoutSampleTrafficClass__block_invoke;
    v5[3] = &unk_1E69BD830;
    v5[4] = &v6;
    [(WFMeasure *)self getLazyNSNumberPreference:@"siri_timeout_tclass" exists:v5];
  }
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __41__WFMeasure_getTimeoutSampleTrafficClass__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  NSLog(&cfstr_SOverridingKwf_5.isa, "-[WFMeasure getTimeoutSampleTrafficClass]_block_invoke", [v3 unsignedIntValue]);
  int v4 = [v3 unsignedIntValue];

  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
}

- (BOOL)shouldApsdSampleSiriTCP
{
  uint64_t v12 = 0;
  dispatch_group_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  int v15 = 0;
  uint64_t v8 = 0;
  int v9 = &v8;
  uint64_t v10 = 0x2020000000;
  int v11 = 0;
  if (MGGetBoolAnswer())
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __36__WFMeasure_shouldApsdSampleSiriTCP__block_invoke;
    v7[3] = &unk_1E69BD830;
    v7[4] = &v12;
    [(WFMeasure *)self getLazyNSNumberPreference:@"apsd_sampling_numerator" exists:v7];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __36__WFMeasure_shouldApsdSampleSiriTCP__block_invoke_2;
    v6[3] = &unk_1E69BD830;
    v6[4] = &v8;
    [(WFMeasure *)self getLazyNSNumberPreference:@"apsd_sampling_denominator" exists:v6];
  }
  uint32_t v3 = arc4random_uniform(*((_DWORD *)v9 + 6));
  uint32_t v4 = *((_DWORD *)v13 + 6);
  if (v3 >= v4) {
    NSLog(&cfstr_SApsdTestNotSe.isa, "-[WFMeasure shouldApsdSampleSiriTCP]", *((unsigned int *)v13 + 6), *((unsigned int *)v9 + 6));
  }
  else {
    NSLog(&cfstr_SApsdTestSelec.isa, "-[WFMeasure shouldApsdSampleSiriTCP]", *((unsigned int *)v13 + 6), *((unsigned int *)v9 + 6));
  }
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  return v3 < v4;
}

void __36__WFMeasure_shouldApsdSampleSiriTCP__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  id v4 = a2;
  NSLog(&cfstr_SOverridingKwf_6.isa, "-[WFMeasure shouldApsdSampleSiriTCP]_block_invoke", v3, [v4 unsignedIntValue]);
  LODWORD(v3) = [v4 unsignedIntValue];

  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3;
}

void __36__WFMeasure_shouldApsdSampleSiriTCP__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  id v4 = a2;
  NSLog(&cfstr_SOverridingKwf_7.isa, "-[WFMeasure shouldApsdSampleSiriTCP]_block_invoke_2", v3, [v4 unsignedIntValue]);
  LODWORD(v3) = [v4 unsignedIntValue];

  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3;
}

- (BOOL)shouldApsdSampleSiriTLS
{
  uint64_t v12 = 0;
  dispatch_group_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  int v15 = 0;
  uint64_t v8 = 0;
  int v9 = &v8;
  uint64_t v10 = 0x2020000000;
  int v11 = 0;
  if (MGGetBoolAnswer())
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __36__WFMeasure_shouldApsdSampleSiriTLS__block_invoke;
    v7[3] = &unk_1E69BD830;
    v7[4] = &v12;
    [(WFMeasure *)self getLazyNSNumberPreference:@"apsd_sampling_numerator" exists:v7];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __36__WFMeasure_shouldApsdSampleSiriTLS__block_invoke_2;
    v6[3] = &unk_1E69BD830;
    v6[4] = &v8;
    [(WFMeasure *)self getLazyNSNumberPreference:@"apsd_sampling_denominator" exists:v6];
  }
  uint32_t v3 = arc4random_uniform(*((_DWORD *)v9 + 6));
  uint32_t v4 = *((_DWORD *)v13 + 6);
  if (v3 >= v4) {
    NSLog(&cfstr_SApsdTestNotSe_0.isa, "-[WFMeasure shouldApsdSampleSiriTLS]", *((unsigned int *)v13 + 6), *((unsigned int *)v9 + 6));
  }
  else {
    NSLog(&cfstr_SApsdTestSelec_0.isa, "-[WFMeasure shouldApsdSampleSiriTLS]", *((unsigned int *)v13 + 6), *((unsigned int *)v9 + 6));
  }
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  return v3 < v4;
}

void __36__WFMeasure_shouldApsdSampleSiriTLS__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  id v4 = a2;
  NSLog(&cfstr_SOverridingKwf_6.isa, "-[WFMeasure shouldApsdSampleSiriTLS]_block_invoke", v3, [v4 unsignedIntValue]);
  LODWORD(v3) = [v4 unsignedIntValue];

  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3;
}

void __36__WFMeasure_shouldApsdSampleSiriTLS__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  id v4 = a2;
  NSLog(&cfstr_SOverridingKwf_7.isa, "-[WFMeasure shouldApsdSampleSiriTLS]_block_invoke_2", v3, [v4 unsignedIntValue]);
  LODWORD(v3) = [v4 unsignedIntValue];

  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3;
}

- (unsigned)getApsdSampleTrafficClass
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  arc4random_uniform(0);
  NSLog(&cfstr_SApsdTrafficCl.isa, "-[WFMeasure getApsdSampleTrafficClass]");
  *((_DWORD *)v7 + 6) = 0;
  if (MGGetBoolAnswer())
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __38__WFMeasure_getApsdSampleTrafficClass__block_invoke;
    v5[3] = &unk_1E69BD830;
    v5[4] = &v6;
    [(WFMeasure *)self getLazyNSNumberPreference:@"apsd_tclass" exists:v5];
  }
  unsigned int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __38__WFMeasure_getApsdSampleTrafficClass__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  NSLog(&cfstr_SOverridingKwf_8.isa, "-[WFMeasure getApsdSampleTrafficClass]_block_invoke", [v3 unsignedIntValue]);
  int v4 = [v3 unsignedIntValue];

  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
}

- (void)retrieveNetworkConfigurations
{
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  int v4 = SCDynamicStoreCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], @"com.apple.wifi.wfmeasure", 0, 0);
  unsigned int v5 = SCPreferencesCreateWithAuthorization(v3, @"com.apple.wifi.wfmeasure", 0, 0);
  uint64_t v6 = v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    uint64_t v8 = [(WFMeasure *)self gatewayAddress];
    int v9 = [(WFMeasure *)self dnsServers];
    NSLog(&cfstr_SCriticalNoScd.isa, "-[WFMeasure retrieveNetworkConfigurations]", v8, v9);

    if (v4) {
      goto LABEL_26;
    }
    goto LABEL_7;
  }
  uint64_t v10 = SCNetworkSetCopyCurrent(v5);
  if (!v10)
  {
    v24 = [(WFMeasure *)self gatewayAddress];
    v25 = [(WFMeasure *)self dnsServers];
    NSLog(&cfstr_SCriticalNoScn_0.isa, "-[WFMeasure retrieveNetworkConfigurations]", v24, v25);

    goto LABEL_26;
  }
  int v11 = v10;
  CFArrayRef v12 = SCNetworkSetCopyServices(v10);
  if (v12)
  {
    CFArrayRef v13 = v12;
    if (CFArrayGetCount(v12) < 1)
    {
LABEL_20:
      v22 = [(WFMeasure *)self gatewayAddress];
      v23 = [(WFMeasure *)self dnsServers];
      NSLog(&cfstr_SCriticalNoMat_0.isa, "-[WFMeasure retrieveNetworkConfigurations]", v22, v23);
    }
    else
    {
      CFIndex v14 = 0;
      while (1)
      {
        ValueAtIndex = (const __SCNetworkService *)CFArrayGetValueAtIndex(v13, v14);
        if (ValueAtIndex)
        {
          v16 = ValueAtIndex;
          Interface = SCNetworkServiceGetInterface(ValueAtIndex);
          if (Interface)
          {
            CFStringRef BSDName = SCNetworkInterfaceGetBSDName(Interface);
            if (BSDName)
            {
              CFStringRef v19 = BSDName;
              v20 = [(WFMeasure *)self interfaceName];
              CFComparisonResult v21 = CFStringCompare(v19, v20, 0);

              if (v21 == kCFCompareEqualTo) {
                break;
              }
            }
          }
        }
        if (++v14 >= CFArrayGetCount(v13)) {
          goto LABEL_20;
        }
      }
      CFStringRef ServiceID = SCNetworkServiceGetServiceID(v16);
      if (ServiceID)
      {
        CFStringRef v29 = ServiceID;
        CFStringRef v30 = (const __CFString *)*MEMORY[0x1E4F41AC8];
        CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(v3, (CFStringRef)*MEMORY[0x1E4F41AC8], ServiceID, (CFStringRef)*MEMORY[0x1E4F41B08]);
        CFStringRef v32 = SCDynamicStoreKeyCreateNetworkServiceEntity(v3, v30, v29, (CFStringRef)*MEMORY[0x1E4F41B10]);
        if (!NetworkServiceEntity)
        {
          v39 = [(WFMeasure *)self dnsServers];
          NSLog(&cfstr_SWarningNoDnsS.isa, "-[WFMeasure retrieveNetworkConfigurations]", v39);

          goto LABEL_46;
        }
        CFDictionaryRef v33 = (const __CFDictionary *)SCDynamicStoreCopyValue(v4, NetworkServiceEntity);
        if (!v33)
        {
          v40 = [(WFMeasure *)self dnsServers];
          NSLog(&cfstr_SCriticalNoDns_0.isa, "-[WFMeasure retrieveNetworkConfigurations]", NetworkServiceEntity, v40);

LABEL_45:
          CFRelease(NetworkServiceEntity);
LABEL_46:
          if (v32)
          {
            CFDictionaryRef v43 = (const __CFDictionary *)SCDynamicStoreCopyValue(v4, v32);
            if (v43)
            {
              CFDictionaryRef v44 = v43;
              [(WFMeasure *)self setGatewayAddress:CFDictionaryGetValue(v43, (const void *)*MEMORY[0x1E4F41CA8])];
              CFRelease(v44);
            }
            else
            {
              NSLog(&cfstr_SWarningNoGate.isa, "-[WFMeasure retrieveNetworkConfigurations]");
            }
            CFRelease(v32);
          }
          else
          {
            NSLog(&cfstr_SWarningNoGate_0.isa, "-[WFMeasure retrieveNetworkConfigurations]");
          }
          goto LABEL_22;
        }
        CFDictionaryRef v34 = v33;
        Value = CFDictionaryGetValue(v33, (const void *)*MEMORY[0x1E4F41BC0]);
        objc_super v36 = [(WFMeasure *)self dnsServers];
        v37 = v36;
        if (Value)
        {

          if (v37)
          {
            v38 = [(WFMeasure *)self dnsServers];
            [v38 removeAllObjects];
          }
          else
          {
            v38 = [MEMORY[0x1E4F1CA80] set];
            [(WFMeasure *)self setDnsServers:v38];
          }

          CFTypeID v41 = CFGetTypeID(Value);
          if (v41 == CFArrayGetTypeID())
          {
            v37 = [(WFMeasure *)self dnsServers];
            [v37 addObjectsFromArray:Value];
          }
          else
          {
            CFTypeID v42 = CFGetTypeID(Value);
            if (v42 != CFStringGetTypeID())
            {
LABEL_44:
              CFRelease(v34);
              goto LABEL_45;
            }
            v37 = [(WFMeasure *)self dnsServers];
            [v37 addObject:Value];
          }
        }
        else
        {
          NSLog(&cfstr_SCriticalNoDns.isa, "-[WFMeasure retrieveNetworkConfigurations]", v34, v36);
        }

        goto LABEL_44;
      }
      v22 = [(WFMeasure *)self gatewayAddress];
      v23 = [(WFMeasure *)self dnsServers];
      NSLog(&cfstr_SCriticalNoMat.isa, "-[WFMeasure retrieveNetworkConfigurations]", v22, v23);
    }

LABEL_22:
    CFRelease(v13);
    goto LABEL_25;
  }
  v26 = [(WFMeasure *)self gatewayAddress];
  v27 = [(WFMeasure *)self dnsServers];
  NSLog(&cfstr_SCriticalNoScn.isa, "-[WFMeasure retrieveNetworkConfigurations]", v26, v27);

LABEL_25:
  CFRelease(v11);
  if (v4)
  {
LABEL_26:
    CFRelease(v4);
    if (!v6) {
      return;
    }
    goto LABEL_8;
  }
LABEL_7:
  if (!v6) {
    return;
  }
LABEL_8:

  CFRelease(v6);
}

- (void)doThroughputTest
{
  if (!objc_opt_class())
  {
    int v4 = 0;
    NSLog(&cfstr_SNptperformanc.isa, "-[WFMeasure doThroughputTest]");
LABEL_11:
    NSLog(&cfstr_SDownloadTaskE_0.isa, "-[WFMeasure doThroughputTest]");
    int v11 = [(WFMeasure *)self dispatchGroup];
    dispatch_group_leave(v11);

    goto LABEL_6;
  }
  if (!objc_opt_class())
  {
    int v4 = 0;
    NSLog(&cfstr_SNptperformanc_0.isa, "-[WFMeasure doThroughputTest]");
    goto LABEL_11;
  }
  CFAllocatorRef v3 = [MEMORY[0x1E4F79C30] defaultConfigurationWiFi];
  int v4 = v3;
  if (!v3)
  {
    NSLog(&cfstr_SPerformancete.isa, "-[WFMeasure doThroughputTest]");
    goto LABEL_11;
  }
  [v3 setDownloadSize:10];
  [v4 setClientName:@"wifid"];
  unsigned int v5 = [MEMORY[0x1E4F79C28] performanceTestWithConfiguration:v4];
  [(WFMeasure *)self setPerformanceTest:v5];

  uint64_t v6 = [(WFMeasure *)self performanceTest];

  if (!v6)
  {
    NSLog(&cfstr_SPerformancete_0.isa, "-[WFMeasure doThroughputTest]");
    goto LABEL_11;
  }
  BOOL v7 = [(WFMeasure *)self testReason];
  char v8 = [v7 isEqualToString:@"SlowWiFi"];

  int v9 = (void *)MEMORY[0x1D9440170]();
  objc_initWeak(&location, self);
  NSLog(&cfstr_SDownloadMetad.isa, "-[WFMeasure doThroughputTest]");
  uint64_t v10 = [(WFMeasure *)self performanceTest];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  CFIndex v14 = __29__WFMeasure_doThroughputTest__block_invoke;
  int v15 = &unk_1E69BD8A8;
  objc_copyWeak(&v16, &location);
  char v17 = v8;
  [v10 startMetadataCollectionWithCompletion:&v12];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  NSLog(&cfstr_SDownloadTaskW.isa, "-[WFMeasure doThroughputTest]", v12, v13, v14, v15);
LABEL_6:
}

void __29__WFMeasure_doThroughputTest__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = (void *)MEMORY[0x1D9440170]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_initWeak(&location, WeakRetained);
  int v9 = +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing];
  [v9 networkActivityStart:2 activate:1];

  NSLog(&cfstr_SDownloadTaskS.isa, "-[WFMeasure doThroughputTest]_block_invoke");
  uint64_t v10 = [WeakRetained performanceTest];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __29__WFMeasure_doThroughputTest__block_invoke_2;
  v11[3] = &unk_1E69BD880;
  objc_copyWeak(&v12, &location);
  char v13 = *(unsigned char *)(a1 + 40);
  [v10 startDownloadWithCompletion:v11];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __29__WFMeasure_doThroughputTest__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = (void *)MEMORY[0x1D9440170]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v9 = [v5 fileSize];
  [v5 speed];
  double v11 = v10;
  id v12 = [WeakRetained performanceTest];
  [v12 stopMetadataCollection];

  char v13 = +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing];
  CFIndex v14 = v13;
  if (v6) {
    uint64_t v15 = 3;
  }
  else {
    uint64_t v15 = 2;
  }
  [v13 networkActivityStop:2 withReason:v15 withClientMetric:0 withClientDict:0 andError:v6];

  id v16 = [WeakRetained dispatchGroup];
  dispatch_group_leave(v16);

  if (v6)
  {
    NSLog(&cfstr_SDownloadTaskE.isa, "-[WFMeasure doThroughputTest]_block_invoke_2", v6);
  }
  else
  {
    NSLog(&cfstr_SLqmWifiDownlo.isa, "-[WFMeasure doThroughputTest]_block_invoke_2", v9, (double)(unint64_t)(8 * v9) / (v11 * 1000000.0), *(void *)&v11);
    char v17 = [WeakRetained performanceTest];
    [v17 save];

    v18 = [WeakRetained performanceTest];
    CFStringRef v19 = [v18 getTransformedDataForCoreAnalytics];

    v20 = (void *)[v19 mutableCopy];
    CFComparisonResult v21 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
    [v20 setObject:v21 forKeyedSubscript:@"isSlowWiFi"];

    id v22 = v20;
    AnalyticsSendEventLazy();
  }
  v23 = [WeakRetained result];
  [v23 setBackhaulThroughput:v11];

  v24 = [WeakRetained result];
  [v24 setDownloadError:v6];

  v25 = [WeakRetained result];
  [v25 setBackhaulResultsValid:1];

  v26 = +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing];
  [v26 networkActivityStop:2 withReason:v15 withClientMetric:0 withClientDict:0 andError:0];
}

id __29__WFMeasure_doThroughputTest__block_invoke_3(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)dispatchThroughputTest
{
  CFAllocatorRef v3 = [(WFMeasure *)self internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__WFMeasure_dispatchThroughputTest__block_invoke;
  block[3] = &unk_1E69BC8D8;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __35__WFMeasure_dispatchThroughputTest__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) doThroughputTest];
}

- (BOOL)doPing:(id)a3 count:(int64_t)a4 timeout:(int64_t)a5 size:(int64_t)a6 class:(int64_t)a7 minRTT:(int64_t *)a8 maxRTT:(int64_t *)a9 successCount:(int64_t *)a10
{
  v40[3] = *MEMORY[0x1E4F143B8];
  id v38 = a3;
  if (!v38)
  {
    NSLog(&cfstr_SNullAddress.isa, "-[WFMeasure doPing:count:timeout:size:class:minRTT:maxRTT:successCount:]");
LABEL_29:
    BOOL v28 = 0;
    goto LABEL_23;
  }
  if ((unint64_t)(a4 - 0x7FFFFFFF) < 0xFFFFFFFF80000002)
  {
    NSLog(&cfstr_SInvalidCountD.isa, "-[WFMeasure doPing:count:timeout:size:class:minRTT:maxRTT:successCount:]", a4);
    goto LABEL_29;
  }
  if ((unint64_t)(a5 - 0x7FFFFFFF) < 0xFFFFFFFF80000002)
  {
    NSLog(&cfstr_SInvalidTimeou.isa, "-[WFMeasure doPing:count:timeout:size:class:minRTT:maxRTT:successCount:]", a5);
    goto LABEL_29;
  }
  if ((unint64_t)(a6 - 0x7FFFFFFF) < 0xFFFFFFFF80000002)
  {
    NSLog(&cfstr_SInvalidSizeD.isa, "-[WFMeasure doPing:count:timeout:size:class:minRTT:maxRTT:successCount:]", a6);
    goto LABEL_29;
  }
  if ((unint64_t)a7 > 0x7FFFFFFE)
  {
    NSLog(&cfstr_SInvalidTraffi.isa, "-[WFMeasure doPing:count:timeout:size:class:minRTT:maxRTT:successCount:]", a7);
    goto LABEL_29;
  }
  char v31 = a8;
  int64_t v13 = 0;
  uint64_t v34 = *MEMORY[0x1E4F18FB8];
  uint64_t v35 = *MEMORY[0x1E4F18FC0];
  uint64_t v32 = *MEMORY[0x1E4F18FC8];
  uint64_t v33 = *MEMORY[0x1E4F18FB0];
  int64_t v14 = 0xFFFFFFFF80000000;
  uint64_t v15 = 0x7FFFFFFFLL;
  int64_t v30 = a4;
  do
  {
    v39[0] = v35;
    id v16 = [NSNumber numberWithInteger:a5];
    v40[0] = v16;
    v40[1] = &unk_1F2B94198;
    v39[1] = v34;
    v39[2] = v33;
    char v17 = [NSNumber numberWithInteger:a6];
    v40[2] = v17;
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:3];

    CFStringRef v19 = (void *)[v18 mutableCopy];
    if (a7)
    {
      v20 = [NSNumber numberWithInteger:a7];
      [v19 setObject:v20 forKeyedSubscript:v32];
    }
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v22 = v21;
    int v23 = CFNetDiagnosticPingWithOptions();
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    BOOL v24 = v23 == 0;
    double v26 = (v25 - v22) * 1000.0;
    uint64_t v27 = (uint64_t)v26;
    if (!v24) {
      ++v13;
    }
    if (v14 <= v27) {
      int64_t v14 = (uint64_t)v26;
    }
    if (v15 >= v27) {
      uint64_t v15 = (uint64_t)v26;
    }

    --a4;
  }
  while (a4);
  NSLog(&cfstr_SLqmWifiPingAd.isa, "-[WFMeasure doPing:count:timeout:size:class:minRTT:maxRTT:successCount:]", v38, v30, a5, a6, a7, v27, v13);
  if (a9) {
    *a9 = v14;
  }
  if (v31) {
    *char v31 = v15;
  }
  if (a10) {
    *a10 = v13;
  }
  BOOL v28 = 1;
LABEL_23:

  return v28;
}

- (void)dispatchPingTest:(unint64_t)a3
{
  id v5 = [MEMORY[0x1E4F1CA48] arrayWithArray:&unk_1F2B95320];
  id v6 = [MEMORY[0x1E4F1CA48] arrayWithArray:&unk_1F2B95338];
  if (a3 == 8)
  {
    id v12 = +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing];
    uint64_t v11 = 1;
    [v12 networkActivityStart:6 activate:1];

    double v10 = [(WFMeasure *)self publicDNSAddress];
    uint64_t v8 = 5;
  }
  else
  {
    BOOL v7 = +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing];
    if (a3 == 4)
    {
      uint64_t v8 = 5;
      [v7 networkActivityStart:5 activate:1];

      uint64_t v9 = [(WFMeasure *)self dnsServers];
      double v10 = [v9 anyObject];

      uint64_t v11 = 3;
    }
    else
    {
      uint64_t v11 = 1;
      [v7 networkActivityStart:4 activate:1];

      double v10 = [(WFMeasure *)self gatewayAddress];
      [v5 addObjectsFromArray:&unk_1F2B95350];
      uint64_t v8 = 1;
    }
    [v6 addObjectsFromArray:&unk_1F2B95368];
  }
  int64_t v13 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__WFMeasure_dispatchPingTest___block_invoke;
  block[3] = &unk_1E69BD920;
  id v18 = v6;
  id v19 = v5;
  v20 = self;
  id v21 = v10;
  uint64_t v22 = v11;
  uint64_t v23 = v8;
  unint64_t v24 = a3;
  id v14 = v10;
  id v15 = v5;
  id v16 = v6;
  dispatch_async(v13, block);
}

void __30__WFMeasure_dispatchPingTest___block_invoke(uint64_t a1)
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  uint64_t v89 = 0;
  int64_t v88 = 0;
  uint64_t v84 = 0;
  v85 = &v84;
  uint64_t v86 = 0x2020000000;
  uint64_t v87 = 0;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v80 objects:v91 count:16];
  if (v2)
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
    uint64_t v53 = *(void *)v81;
    uint64_t v54 = v2;
    uint64_t v60 = 0x7FFFFFFFLL;
    int64_t v61 = 0xFFFFFFFF80000000;
    while (1)
    {
      for (uint64_t i = 0; i != v54; ++i)
      {
        if (*(void *)v81 != v53) {
          objc_enumerationMutation(obj);
        }
        v59 = *(void **)(*((void *)&v80 + 1) + 8 * i);
        long long v76 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        id v56 = *(id *)(a1 + 40);
        uint64_t v5 = [v56 countByEnumeratingWithState:&v76 objects:v90 count:16];
        if (!v5) {
          goto LABEL_83;
        }
        uint64_t v58 = *(void *)v77;
        while (2)
        {
          uint64_t v6 = 0;
          uint64_t v57 = v5;
          do
          {
            if (*(void *)v77 != v58) {
              objc_enumerationMutation(v56);
            }
            BOOL v7 = *(void **)(*((void *)&v76 + 1) + 8 * v6);
            uint64_t v8 = *(void **)(a1 + 48);
            uint64_t v9 = *(void *)(a1 + 56);
            uint64_t v10 = *(void *)(a1 + 64);
            uint64_t v11 = *(void *)(a1 + 72);
            uint64_t v12 = [v59 integerValue];
            uint64_t v13 = [v7 integerValue];
            uint64_t v14 = [v8 doPing:v9 count:v10 timeout:v11 size:v12 class:v13 minRTT:&v89 maxRTT:&v88 successCount:v85 + 3];
            if (MGGetBoolAnswer() && *(void *)(a1 + 80) == 4)
            {
              id v15 = *(void **)(a1 + 48);
              v75[0] = MEMORY[0x1E4F143A8];
              v75[1] = 3221225472;
              v75[2] = __30__WFMeasure_dispatchPingTest___block_invoke_2;
              v75[3] = &unk_1E69BD830;
              v75[4] = &v84;
              [v15 getLazyNSNumberPreference:@"local_dns_result" exists:v75];
            }
            if (MGGetBoolAnswer() && *(void *)(a1 + 80) == 8)
            {
              id v16 = *(void **)(a1 + 48);
              v74[0] = MEMORY[0x1E4F143A8];
              v74[1] = 3221225472;
              v74[2] = __30__WFMeasure_dispatchPingTest___block_invoke_3;
              v74[3] = &unk_1E69BD830;
              v74[4] = &v84;
              [v16 getLazyNSNumberPreference:@"public_dns_result" exists:v74];
            }
            if (MGGetBoolAnswer() && *(void *)(a1 + 80) == 2)
            {
              char v17 = *(void **)(a1 + 48);
              v73[0] = MEMORY[0x1E4F143A8];
              v73[1] = 3221225472;
              v73[2] = __30__WFMeasure_dispatchPingTest___block_invoke_4;
              v73[3] = &unk_1E69BD830;
              v73[4] = &v84;
              [v17 getLazyNSNumberPreference:@"gateway_result" exists:v73];
            }
            if (MGGetBoolAnswer())
            {
              unint64_t v18 = *(void *)(a1 + 80);
              if (v18 <= 8 && ((1 << v18) & 0x114) != 0)
              {
                id v19 = *(void **)(a1 + 48);
                v72[0] = MEMORY[0x1E4F143A8];
                v72[1] = 3221225472;
                v72[2] = __30__WFMeasure_dispatchPingTest___block_invoke_5;
                v72[3] = &unk_1E69BD8D0;
                v72[4] = v7;
                v72[5] = &v84;
                [v19 getLazyNSNumberPreference:@"fail_pings_ac" exists:v72];
              }
            }
            uint64_t v20 = v85[3];
            if (v60 >= v89) {
              uint64_t v21 = v89;
            }
            else {
              uint64_t v21 = v60;
            }
            int64_t v22 = v61;
            if (v61 <= v88) {
              int64_t v22 = v88;
            }
            uint64_t v60 = v21;
            int64_t v61 = v22;
            if (v14)
            {
              uint64_t v23 = [v7 integerValue];
              if (v23 > 699)
              {
                if (v23 == 700)
                {
                  uint64_t v33 = [v59 integerValue];
                  uint64_t v34 = *(void **)(a1 + 48);
                  if (v33 == 300)
                  {
                    uint64_t v35 = [v34 result];
                    objc_msgSend(v35, "setTrafficClassVIAttemptedSmall:", *(void *)(a1 + 64) + objc_msgSend(v35, "trafficClassVIAttemptedSmall"));
                  }
                  else
                  {
                    uint64_t v35 = [v34 result];
                    objc_msgSend(v35, "setTrafficClassVIAttemptedLarge:", *(void *)(a1 + 64) + objc_msgSend(v35, "trafficClassVIAttemptedLarge"));
                  }

                  if (v85[3] >= 1)
                  {
                    uint64_t v43 = [v59 integerValue];
                    CFDictionaryRef v44 = *(void **)(a1 + 48);
                    if (v43 == 300)
                    {
                      id v38 = [v44 result];
                      objc_msgSend(v38, "setTrafficClassVISucceededSmall:", v85[3] + objc_msgSend(v38, "trafficClassVISucceededSmall"));
                    }
                    else
                    {
                      id v38 = [v44 result];
                      objc_msgSend(v38, "setTrafficClassVISucceededLarge:", v85[3] + objc_msgSend(v38, "trafficClassVISucceededLarge"));
                    }
                    goto LABEL_63;
                  }
                }
                else if (v23 == 800)
                {
                  uint64_t v27 = [v59 integerValue];
                  BOOL v28 = *(void **)(a1 + 48);
                  if (v27 == 300)
                  {
                    CFStringRef v29 = [v28 result];
                    objc_msgSend(v29, "setTrafficClassVOAttemptedSmall:", *(void *)(a1 + 64) + objc_msgSend(v29, "trafficClassVOAttemptedSmall"));
                  }
                  else
                  {
                    CFStringRef v29 = [v28 result];
                    objc_msgSend(v29, "setTrafficClassVOAttemptedLarge:", *(void *)(a1 + 64) + objc_msgSend(v29, "trafficClassVOAttemptedLarge"));
                  }

                  if (v85[3] >= 1)
                  {
                    uint64_t v39 = [v59 integerValue];
                    v40 = *(void **)(a1 + 48);
                    if (v39 == 300)
                    {
                      id v38 = [v40 result];
                      objc_msgSend(v38, "setTrafficClassVOSucceededSmall:", v85[3] + objc_msgSend(v38, "trafficClassVOSucceededSmall"));
                    }
                    else
                    {
                      id v38 = [v40 result];
                      objc_msgSend(v38, "setTrafficClassVOSucceededLarge:", v85[3] + objc_msgSend(v38, "trafficClassVOSucceededLarge"));
                    }
                    goto LABEL_63;
                  }
                }
              }
              else if (v23)
              {
                if (v23 == 200)
                {
                  uint64_t v24 = [v59 integerValue];
                  double v25 = *(void **)(a1 + 48);
                  if (v24 == 300)
                  {
                    double v26 = [v25 result];
                    objc_msgSend(v26, "setTrafficClassBKAttemptedSmall:", *(void *)(a1 + 64) + objc_msgSend(v26, "trafficClassBKAttemptedSmall"));
                  }
                  else
                  {
                    double v26 = [v25 result];
                    objc_msgSend(v26, "setTrafficClassBKAttemptedLarge:", *(void *)(a1 + 64) + objc_msgSend(v26, "trafficClassBKAttemptedLarge"));
                  }

                  if (v85[3] >= 1)
                  {
                    uint64_t v36 = [v59 integerValue];
                    v37 = *(void **)(a1 + 48);
                    if (v36 == 300)
                    {
                      id v38 = [v37 result];
                      objc_msgSend(v38, "setTrafficClassBKSucceededSmall:", v85[3] + objc_msgSend(v38, "trafficClassBKSucceededSmall"));
                    }
                    else
                    {
                      id v38 = [v37 result];
                      objc_msgSend(v38, "setTrafficClassBKSucceededLarge:", v85[3] + objc_msgSend(v38, "trafficClassBKSucceededLarge"));
                    }
LABEL_63:
                  }
                }
              }
              else
              {
                uint64_t v30 = [v59 integerValue];
                char v31 = *(void **)(a1 + 48);
                if (v30 == 300)
                {
                  uint64_t v32 = [v31 result];
                  objc_msgSend(v32, "setTrafficClassBEAttemptedSmall:", *(void *)(a1 + 64) + objc_msgSend(v32, "trafficClassBEAttemptedSmall"));
                }
                else
                {
                  uint64_t v32 = [v31 result];
                  objc_msgSend(v32, "setTrafficClassBEAttemptedLarge:", *(void *)(a1 + 64) + objc_msgSend(v32, "trafficClassBEAttemptedLarge"));
                }

                if (v85[3] >= 1)
                {
                  uint64_t v41 = [v59 integerValue];
                  CFTypeID v42 = *(void **)(a1 + 48);
                  if (v41 == 300)
                  {
                    id v38 = [v42 result];
                    objc_msgSend(v38, "setTrafficClassBESucceededSmall:", v85[3] + objc_msgSend(v38, "trafficClassBESucceededSmall"));
                  }
                  else
                  {
                    id v38 = [v42 result];
                    objc_msgSend(v38, "setTrafficClassBESucceededLarge:", v85[3] + objc_msgSend(v38, "trafficClassBESucceededLarge"));
                  }
                  goto LABEL_63;
                }
              }
            }
            v45 = *(unsigned char **)(a1 + 48);
            if (v45[13] && !v85[3])
            {
              v46 = [v45 result];
              [v46 setSeenSpecificAcFailure:1];
            }
            uint64_t v47 = *(void *)(a1 + 80);
            switch(v47)
            {
              case 2:
                v48 = [*(id *)(a1 + 48) result];
                [v48 setGatewayResultsValid:v14];
                goto LABEL_73;
              case 8:
                v48 = [*(id *)(a1 + 48) result];
                [v48 setPublicResultsValid:v14];
                goto LABEL_73;
              case 4:
                v48 = [*(id *)(a1 + 48) result];
                [v48 setLocalResultsValid:v14];
LABEL_73:

                goto LABEL_75;
            }
            NSLog(&cfstr_SNotARecogniza.isa, "-[WFMeasure dispatchPingTest:]_block_invoke");
LABEL_75:
            v3 += v10;
            v4 += v20;
            if ((v14 & 1) == 0)
            {
              if (!*(void *)(a1 + 56))
              {
                if (MGGetBoolAnswer())
                {
                  NSLog(&cfstr_SPingingLocald.isa, "-[WFMeasure dispatchPingTest:]_block_invoke");
                  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
                    __30__WFMeasure_dispatchPingTest___block_invoke_cold_1(&buf, v71);
                  }
                }
              }
              goto LABEL_83;
            }
            ++v6;
          }
          while (v57 != v6);
          uint64_t v5 = [v56 countByEnumeratingWithState:&v76 objects:v90 count:16];
          if (v5) {
            continue;
          }
          break;
        }
LABEL_83:
      }
      uint64_t v54 = [obj countByEnumeratingWithState:&v80 objects:v91 count:16];
      if (!v54) {
        goto LABEL_87;
      }
    }
  }
  uint64_t v3 = 0;
  uint64_t v4 = 0;
  uint64_t v60 = 0x7FFFFFFFLL;
  int64_t v61 = 0xFFFFFFFF80000000;
LABEL_87:

  v49 = [*(id *)(a1 + 48) internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__WFMeasure_dispatchPingTest___block_invoke_392;
  block[3] = &unk_1E69BD8F8;
  uint64_t v65 = v3;
  uint64_t v66 = v4;
  id v50 = *(id *)(a1 + 56);
  uint64_t v67 = v60;
  int64_t v68 = v61;
  uint64_t v69 = *(void *)(a1 + 80);
  uint64_t v51 = *(void *)(a1 + 48);
  id v63 = v50;
  uint64_t v64 = v51;
  dispatch_sync(v49, block);

  _Block_object_dispose(&v84, 8);
}

void __30__WFMeasure_dispatchPingTest___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  id v4 = a2;
  NSLog(&cfstr_SOverridingKwf_9.isa, "-[WFMeasure dispatchPingTest:]_block_invoke_2", v3, [v4 integerValue]);
  LODWORD(v3) = [v4 BOOLValue];

  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3;
}

void __30__WFMeasure_dispatchPingTest___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  id v4 = a2;
  NSLog(&cfstr_SOverridingKwf_10.isa, "-[WFMeasure dispatchPingTest:]_block_invoke_3", v3, [v4 integerValue]);
  LODWORD(v3) = [v4 BOOLValue];

  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3;
}

void __30__WFMeasure_dispatchPingTest___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  id v4 = a2;
  NSLog(&cfstr_SOverridingKwf_11.isa, "-[WFMeasure dispatchPingTest:]_block_invoke_4", v3, [v4 integerValue]);
  LODWORD(v3) = [v4 BOOLValue];

  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3;
}

void __30__WFMeasure_dispatchPingTest___block_invoke_5(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) integerValue];
  if (v3 == [v4 integerValue])
  {
    NSLog(&cfstr_SOverridingKwf_12.isa, "-[WFMeasure dispatchPingTest:]_block_invoke_5", [v4 integerValue], *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), objc_msgSend(v4, "integerValue"));
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

void __30__WFMeasure_dispatchPingTest___block_invoke_392(uint64_t a1)
{
  double v2 = (double)(uint64_t)(*(void *)(a1 + 48) - *(void *)(a1 + 56)) / (double)*(uint64_t *)(a1 + 48) * 100.0;
  NSLog(&cfstr_SLqmWifiPingTe.isa, "-[WFMeasure dispatchPingTest:]_block_invoke", *(void *)(a1 + 32), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)&v2);
  if (*(uint64_t *)(a1 + 56) > 0) {
    unsigned int v3 = 2;
  }
  else {
    unsigned int v3 = 3;
  }
  uint64_t v4 = *(void *)(a1 + 80);
  switch(v4)
  {
    case 2:
      uint64_t v15 = *(void *)(a1 + 64);
      id v16 = [*(id *)(a1 + 40) result];
      [v16 setGatewayMinRTT:v15];

      uint64_t v17 = *(void *)(a1 + 72);
      unint64_t v18 = [*(id *)(a1 + 40) result];
      [v18 setGatewayMaxRTT:v17];

      id v19 = [*(id *)(a1 + 40) result];
      [v19 setGatewayPacketLoss:(uint64_t)v2];

      uint64_t v20 = [*(id *)(a1 + 40) result];
      LODWORD(v19) = [v20 gatewayResultsValid];

      if (v19) {
        uint64_t v11 = v3;
      }
      else {
        uint64_t v11 = 3;
      }
      uint64_t v12 = +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing];
      uint64_t v13 = v12;
      uint64_t v14 = 4;
      goto LABEL_19;
    case 8:
      uint64_t v21 = *(void *)(a1 + 64);
      int64_t v22 = [*(id *)(a1 + 40) result];
      [v22 setPublicDNSMinRTT:v21];

      uint64_t v23 = *(void *)(a1 + 72);
      uint64_t v24 = [*(id *)(a1 + 40) result];
      [v24 setPublicDNSMaxRTT:v23];

      double v25 = [*(id *)(a1 + 40) result];
      [v25 setPublicDNSPacketLoss:(uint64_t)v2];

      double v26 = [*(id *)(a1 + 40) result];
      LODWORD(v25) = [v26 publicResultsValid];

      if (v25) {
        uint64_t v11 = v3;
      }
      else {
        uint64_t v11 = 3;
      }
      uint64_t v12 = +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing];
      uint64_t v13 = v12;
      uint64_t v14 = 6;
      goto LABEL_19;
    case 4:
      uint64_t v5 = *(void *)(a1 + 64);
      uint64_t v6 = [*(id *)(a1 + 40) result];
      [v6 setLocalDNSMinRTT:v5];

      uint64_t v7 = *(void *)(a1 + 72);
      uint64_t v8 = [*(id *)(a1 + 40) result];
      [v8 setLocalDNSMaxRTT:v7];

      uint64_t v9 = [*(id *)(a1 + 40) result];
      [v9 setLocalDNSPacketLoss:(uint64_t)v2];

      uint64_t v10 = [*(id *)(a1 + 40) result];
      LODWORD(v9) = [v10 gatewayResultsValid];

      if (v9) {
        uint64_t v11 = v3;
      }
      else {
        uint64_t v11 = 3;
      }
      uint64_t v12 = +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing];
      uint64_t v13 = v12;
      uint64_t v14 = 5;
LABEL_19:
      [v12 networkActivityStop:v14 withReason:v11 withClientMetric:0 withClientDict:0 andError:0];

      goto LABEL_21;
  }
  NSLog(&cfstr_SNotARecogniza.isa, "-[WFMeasure dispatchPingTest:]_block_invoke");
LABEL_21:
  uint64_t v27 = [*(id *)(a1 + 40) dispatchGroup];
  dispatch_group_leave(v27);
}

- (BOOL)doDNSResolution:(id)a3 timeout:(int64_t)a4
{
  uint64_t v4 = (__CFString *)a3;
  error.domain = 0;
  *(void *)&error.CFStreamError error = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  CFHostRef v17 = 0;
  CFHostRef v17 = CFHostCreateWithName((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v4);
  uint64_t v5 = (__CFHost *)v15[3];
  if (v5)
  {
    int started = CFHostStartInfoResolution(v5, kCFHostAddresses, &error);
    CFRetain((CFTypeRef)v15[3]);
    dispatch_time_t v7 = dispatch_time(0, 5000000);
    uint64_t v8 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__WFMeasure_doDNSResolution_timeout___block_invoke;
    block[3] = &unk_1E69BD7C8;
    void block[4] = &v14;
    dispatch_after(v7, v8, block);

    if (started)
    {
      CFArrayRef Addressing = CFHostGetAddressing((CFHostRef)v15[3], 0);
      if (Addressing)
      {
        BOOL v10 = CFArrayGetCount(Addressing) != 0;
        goto LABEL_8;
      }
    }
    else
    {
      NSLog(&cfstr_SCfhoststartin.isa, "-[WFMeasure doDNSResolution:timeout:]", error.error);
    }
  }
  else
  {
    NSLog(&cfstr_SHostrefIsNull.isa, "-[WFMeasure doDNSResolution:timeout:]");
  }
  BOOL v10 = 0;
LABEL_8:
  uint64_t v11 = (const void *)v15[3];
  if (v11) {
    CFRelease(v11);
  }
  _Block_object_dispose(&v14, 8);

  return v10;
}

void __37__WFMeasure_doDNSResolution_timeout___block_invoke(uint64_t a1)
{
  CFHostCancelInfoResolution(*(CFHostRef *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), kCFHostAddresses);
  double v2 = *(const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);

  CFRelease(v2);
}

- (void)dispatchDNSTest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing];
  [v5 networkActivityStart:7 activate:1];

  uint64_t v6 = dispatch_get_global_queue(0, 0);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __29__WFMeasure_dispatchDNSTest___block_invoke;
  v8[3] = &unk_1E69BC8B0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __29__WFMeasure_dispatchDNSTest___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) doDNSResolution:*(void *)(a1 + 40) timeout:5];
  unsigned int v3 = [*(id *)(a1 + 32) internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__WFMeasure_dispatchDNSTest___block_invoke_2;
  block[3] = &unk_1E69BCE78;
  char v7 = v2;
  id v4 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v6 = v4;
  dispatch_sync(v3, block);
}

void __29__WFMeasure_dispatchDNSTest___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = *(unsigned char *)(a1 + 48);
  if (MGGetBoolAnswer())
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __29__WFMeasure_dispatchDNSTest___block_invoke_3;
    v11[3] = &unk_1E69BD8D0;
    char v2 = *(void **)(a1 + 32);
    id v12 = *(id *)(a1 + 40);
    uint64_t v13 = &v14;
    [v2 getLazyNSNumberPreference:@"resolve_apple_result" exists:v11];
  }
  if (*((unsigned char *)v15 + 24)) {
    unsigned int v3 = @"YES";
  }
  else {
    unsigned int v3 = @"NO";
  }
  NSLog(&cfstr_SLqmWifiDnsTes.isa, "-[WFMeasure dispatchDNSTest:]_block_invoke_2", *(void *)(a1 + 40), v3);
  int v4 = *((unsigned __int8 *)v15 + 24);
  uint64_t v5 = [*(id *)(a1 + 32) result];
  [v5 setDnsSuccess:v4 != 0];

  id v6 = [*(id *)(a1 + 32) result];
  [v6 setDnsResultsValid:1];

  char v7 = +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing];
  uint64_t v8 = v7;
  if (*((unsigned char *)v15 + 24)) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = 3;
  }
  [v7 networkActivityStop:7 withReason:v9 withClientMetric:0 withClientDict:0 andError:0];

  BOOL v10 = [*(id *)(a1 + 32) dispatchGroup];
  dispatch_group_leave(v10);

  _Block_object_dispose(&v14, 8);
}

void __29__WFMeasure_dispatchDNSTest___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  id v5 = a2;
  NSLog(&cfstr_SOverridingKwf_13.isa, "-[WFMeasure dispatchDNSTest:]_block_invoke_3", v3, v4, [v5 BOOLValue]);
  LOBYTE(v3) = [v5 BOOLValue];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
}

- (void)dispatchSiriTest:(int64_t)a3 trafficClass:(unsigned int)a4
{
  if (a3 == 2)
  {
    char v7 = +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing];
    uint64_t v8 = v7;
    uint64_t v9 = 10;
  }
  else if (a3 == 1)
  {
    char v7 = +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing];
    uint64_t v8 = v7;
    uint64_t v9 = 9;
  }
  else
  {
    if (a3) {
      -[WFMeasure dispatchSiriTest:trafficClass:]();
    }
    char v7 = +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing];
    uint64_t v8 = v7;
    uint64_t v9 = 8;
  }
  [v7 networkActivityStart:v9 activate:1];

  BOOL v10 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__WFMeasure_dispatchSiriTest_trafficClass___block_invoke;
  block[3] = &unk_1E69BD998;
  unsigned int v12 = a4;
  void block[4] = self;
  void block[5] = a3;
  dispatch_async(v10, block);
}

void __43__WFMeasure_dispatchSiriTest_trafficClass___block_invoke(uint64_t a1)
{
  char v2 = [SiriNWConnection alloc];
  uint64_t v3 = [*(id *)(a1 + 32) internalQueue];
  uint64_t v4 = [*(id *)(a1 + 32) testReason];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__WFMeasure_dispatchSiriTest_trafficClass___block_invoke_2;
  v7[3] = &unk_1E69BD970;
  int v8 = *(_DWORD *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  void v7[5] = v5;
  id v6 = [(SiriNWConnection *)v2 initWithQueueAndCompletion:v3 reason:v4 callback:v7];

  NSLog(&cfstr_Sirinwconnecti_1.isa);
  [(SiriNWConnection *)v6 runSiriProbeWithDepth:*(void *)(a1 + 40) trafficClass:*(unsigned int *)(a1 + 48)];
}

void __43__WFMeasure_dispatchSiriTest_trafficClass___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v42 = 0;
  uint64_t v43 = &v42;
  uint64_t v44 = 0x2020000000;
  char v45 = a2;
  if (MGGetBoolAnswer())
  {
    id v6 = *(unsigned char **)(a1 + 32);
    if (v6[10])
    {
      if (v6[12])
      {
        char v7 = v41;
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        int v8 = @"siri_timeout_retest_result";
        uint64_t v9 = __43__WFMeasure_dispatchSiriTest_trafficClass___block_invoke_3;
      }
      else
      {
        char v7 = v40;
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        int v8 = @"siri_timeout_result";
        uint64_t v9 = __43__WFMeasure_dispatchSiriTest_trafficClass___block_invoke_4;
      }
      v7[2] = v9;
      v7[3] = &unk_1E69BD948;
      *((unsigned char *)v7 + 40) = a2;
      v7[4] = &v42;
      objc_msgSend(v6, "getLazyNSNumberPreference:exists:", v8);
    }
    BOOL v10 = *(unsigned char **)(a1 + 32);
    if (v10[9])
    {
      if (v10[12])
      {
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __43__WFMeasure_dispatchSiriTest_trafficClass___block_invoke_5;
        void v39[3] = &unk_1E69BD8D0;
        v39[4] = v10;
        v39[5] = &v42;
        [v10 getLazyNSNumberPreference:@"periodic_siri_retest_result" exists:v39];
      }
      else
      {
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __43__WFMeasure_dispatchSiriTest_trafficClass___block_invoke_6;
        v38[3] = &unk_1E69BD8D0;
        v38[4] = v10;
        v38[5] = &v42;
        [v10 getLazyNSNumberPreference:@"periodic_siri_result" exists:v38];
      }
    }
    uint64_t v11 = *(unsigned char **)(a1 + 32);
    if (v11[11])
    {
      if (v11[12])
      {
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __43__WFMeasure_dispatchSiriTest_trafficClass___block_invoke_7;
        v37[3] = &unk_1E69BD8D0;
        v37[4] = v11;
        v37[5] = &v42;
        [v11 getLazyNSNumberPreference:@"apsd_retest_result" exists:v37];
      }
      else
      {
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __43__WFMeasure_dispatchSiriTest_trafficClass___block_invoke_8;
        v36[3] = &unk_1E69BD8D0;
        v36[4] = v11;
        v36[5] = &v42;
        [v11 getLazyNSNumberPreference:@"apsd_result" exists:v36];
      }
    }
  }
  if (!*((unsigned char *)v43 + 24))
  {
    NSLog(&cfstr_Sirinwconnecti_0.isa, v5);
    goto LABEL_28;
  }
  NSLog(&cfstr_Sirinwconnecti.isa);
  int v12 = *(_DWORD *)(a1 + 48);
  if (v12 <= 599)
  {
    if (v12)
    {
      if (v12 != 200) {
        goto LABEL_28;
      }
      uint64_t v15 = [*(id *)(a1 + 32) result];
      objc_msgSend(v15, "setTrafficClassBKAttemptedLarge:", objc_msgSend(v15, "trafficClassBKAttemptedLarge") + 1);

      uint64_t v14 = [*(id *)(a1 + 32) result];
      objc_msgSend(v14, "setTrafficClassBKSucceededLarge:", objc_msgSend(v14, "trafficClassBKSucceededLarge") + 1);
    }
    else
    {
      char v17 = [*(id *)(a1 + 32) result];
      objc_msgSend(v17, "setTrafficClassBEAttemptedLarge:", objc_msgSend(v17, "trafficClassBEAttemptedLarge") + 1);

      uint64_t v14 = [*(id *)(a1 + 32) result];
      objc_msgSend(v14, "setTrafficClassBESucceededLarge:", objc_msgSend(v14, "trafficClassBESucceededLarge") + 1);
    }
  }
  else if (v12 == 600 || v12 == 700)
  {
    uint64_t v16 = [*(id *)(a1 + 32) result];
    objc_msgSend(v16, "setTrafficClassVIAttemptedLarge:", objc_msgSend(v16, "trafficClassVIAttemptedLarge") + 1);

    uint64_t v14 = [*(id *)(a1 + 32) result];
    objc_msgSend(v14, "setTrafficClassVISucceededLarge:", objc_msgSend(v14, "trafficClassVISucceededLarge") + 1);
  }
  else
  {
    if (v12 != 800) {
      goto LABEL_28;
    }
    uint64_t v13 = [*(id *)(a1 + 32) result];
    objc_msgSend(v13, "setTrafficClassVOAttemptedLarge:", objc_msgSend(v13, "trafficClassVOAttemptedLarge") + 1);

    uint64_t v14 = [*(id *)(a1 + 32) result];
    objc_msgSend(v14, "setTrafficClassVOSucceededLarge:", objc_msgSend(v14, "trafficClassVOSucceededLarge") + 1);
  }

LABEL_28:
  uint64_t v18 = *(unsigned int *)(a1 + 48);
  id v19 = [*(id *)(a1 + 32) result];
  [v19 setSiriTrafficClass:v18];

  uint64_t v20 = *(void *)(a1 + 40);
  if (v20 == 2)
  {
    int v31 = *((unsigned __int8 *)v43 + 24);
    uint64_t v32 = [*(id *)(a1 + 32) result];
    [v32 setSiriACESuccess:v31 != 0];

    uint64_t v33 = [*(id *)(a1 + 32) result];
    [v33 setSiriACEResultsValid:1];

    uint64_t v24 = +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing];
    double v25 = [*(id *)(a1 + 32) result];
    if ([v25 siriACESuccess]) {
      uint64_t v34 = 2;
    }
    else {
      uint64_t v34 = 3;
    }
    [v24 networkActivityStop:10 withReason:v34 withClientMetric:0 withClientDict:0 andError:0];
  }
  else if (v20 == 1)
  {
    int v27 = *((unsigned __int8 *)v43 + 24);
    BOOL v28 = [*(id *)(a1 + 32) result];
    [v28 setSiriTLSSuccess:v27 != 0];

    CFStringRef v29 = [*(id *)(a1 + 32) result];
    [v29 setSiriTLSResultsValid:1];

    uint64_t v24 = +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing];
    double v25 = [*(id *)(a1 + 32) result];
    if ([v25 siriTLSSuccess]) {
      uint64_t v30 = 2;
    }
    else {
      uint64_t v30 = 3;
    }
    [v24 networkActivityStop:9 withReason:v30 withClientMetric:0 withClientDict:0 andError:0];
  }
  else
  {
    if (v20)
    {
      NSLog(&cfstr_Dispatchsirite.isa);
      __assert_rtn("-[WFMeasure dispatchSiriTest:trafficClass:]_block_invoke_2", "WFMeasure.m", 1411, "false");
    }
    int v21 = *((unsigned __int8 *)v43 + 24);
    int64_t v22 = [*(id *)(a1 + 32) result];
    [v22 setSiriTCPSuccess:v21 != 0];

    uint64_t v23 = [*(id *)(a1 + 32) result];
    [v23 setSiriTCPResultsValid:1];

    uint64_t v24 = +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing];
    double v25 = [*(id *)(a1 + 32) result];
    if ([v25 siriTCPSuccess]) {
      uint64_t v26 = 2;
    }
    else {
      uint64_t v26 = 3;
    }
    [v24 networkActivityStop:8 withReason:v26 withClientMetric:0 withClientDict:0 andError:0];
  }

  uint64_t v35 = [*(id *)(a1 + 32) dispatchGroup];
  dispatch_group_leave(v35);

  _Block_object_dispose(&v42, 8);
}

void __43__WFMeasure_dispatchSiriTest_trafficClass___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 40);
  id v4 = a2;
  NSLog(&cfstr_SOverridingKwf_14.isa, "-[WFMeasure dispatchSiriTest:trafficClass:]_block_invoke_3", v3, [v4 BOOLValue]);
  LOBYTE(v3) = [v4 BOOLValue];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3;
}

void __43__WFMeasure_dispatchSiriTest_trafficClass___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 40);
  id v4 = a2;
  NSLog(&cfstr_SOverridingKwf_15.isa, "-[WFMeasure dispatchSiriTest:trafficClass:]_block_invoke_4", v3, [v4 BOOLValue]);
  LOBYTE(v3) = [v4 BOOLValue];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v3;
}

void __43__WFMeasure_dispatchSiriTest_trafficClass___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  NSLog(&cfstr_SOverridingKwf_16.isa, "-[WFMeasure dispatchSiriTest:trafficClass:]_block_invoke_5", [v3 tclass], objc_msgSend(v4, "BOOLValue"));
  LOBYTE(v3) = [v4 BOOLValue];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)v3;
}

void __43__WFMeasure_dispatchSiriTest_trafficClass___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  NSLog(&cfstr_SOverridingKwf_17.isa, "-[WFMeasure dispatchSiriTest:trafficClass:]_block_invoke_6", [v3 tclass], objc_msgSend(v4, "BOOLValue"));
  LOBYTE(v3) = [v4 BOOLValue];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)v3;
}

void __43__WFMeasure_dispatchSiriTest_trafficClass___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  NSLog(&cfstr_SOverridingKwf_18.isa, "-[WFMeasure dispatchSiriTest:trafficClass:]_block_invoke_7", [v3 tclass], objc_msgSend(v4, "BOOLValue"));
  LOBYTE(v3) = [v4 BOOLValue];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)v3;
}

void __43__WFMeasure_dispatchSiriTest_trafficClass___block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  NSLog(&cfstr_SOverridingKwf_19.isa, "-[WFMeasure dispatchSiriTest:trafficClass:]_block_invoke_8", [v3 tclass], objc_msgSend(v4, "BOOLValue"));
  LOBYTE(v3) = [v4 BOOLValue];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)v3;
}

- (BOOL)start:(id)a3 withCompletionQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(WFMeasure *)self isInProgress])
  {
    NSLog(&cfstr_SMeasurementAl.isa, "-[WFMeasure start:withCompletionQueue:]");
  }
  else
  {
    [(WFMeasure *)self setCompletionHandler:v6];
    [(WFMeasure *)self setCompletionQueue:v7];
    int v8 = [(WFMeasure *)self internalQueue];

    if (!v8)
    {
      dispatch_queue_t v9 = dispatch_queue_create("com.apple.wifi.wfmeasure", 0);
      [(WFMeasure *)self setInternalQueue:v9];
    }
    if ([(WFMeasure *)self options])
    {
      BOOL v10 = [(WFMeasure *)self dispatchGroup];
      dispatch_group_enter(v10);

      [(WFMeasure *)self dispatchThroughputTest];
    }
    if (([(WFMeasure *)self options] & 2) != 0)
    {
      uint64_t v11 = [(WFMeasure *)self dispatchGroup];
      dispatch_group_enter(v11);

      [(WFMeasure *)self dispatchPingTest:2];
    }
    if (([(WFMeasure *)self options] & 4) != 0)
    {
      int v12 = [(WFMeasure *)self dispatchGroup];
      dispatch_group_enter(v12);

      [(WFMeasure *)self dispatchPingTest:4];
    }
    if (([(WFMeasure *)self options] & 8) != 0)
    {
      uint64_t v13 = [(WFMeasure *)self dispatchGroup];
      dispatch_group_enter(v13);

      [(WFMeasure *)self dispatchPingTest:8];
    }
    if (([(WFMeasure *)self options] & 0x10) != 0)
    {
      uint64_t v14 = [(WFMeasure *)self dispatchGroup];
      dispatch_group_enter(v14);

      uint64_t v15 = [(WFMeasure *)self testDNSHostname];
      [(WFMeasure *)self dispatchDNSTest:v15];
    }
    if (([(WFMeasure *)self options] & 0x20) != 0)
    {
      uint64_t v16 = [(WFMeasure *)self dispatchGroup];
      dispatch_group_enter(v16);

      [(WFMeasure *)self dispatchSiriTest:0 trafficClass:[(WFMeasure *)self tclass]];
    }
    if (([(WFMeasure *)self options] & 0x40) != 0)
    {
      char v17 = [(WFMeasure *)self dispatchGroup];
      dispatch_group_enter(v17);

      [(WFMeasure *)self dispatchSiriTest:1 trafficClass:[(WFMeasure *)self tclass]];
    }
    uint64_t v18 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__WFMeasure_start_withCompletionQueue___block_invoke;
    block[3] = &unk_1E69BC8D8;
    void block[4] = self;
    dispatch_async(v18, block);

    [(WFMeasure *)self setIsInProgress:1];
  }
  BOOL v19 = [(WFMeasure *)self isInProgress];

  return v19;
}

void __39__WFMeasure_start_withCompletionQueue___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) dispatchGroup];
  dispatch_time_t v3 = dispatch_time(0, 120000000000);
  intptr_t v4 = dispatch_group_wait(v2, v3);

  if (v4) {
    NSLog(&cfstr_STestsTimedOut.isa, "-[WFMeasure start:withCompletionQueue:]_block_invoke");
  }
  else {
    NSLog(&cfstr_SAllTestsCompl.isa, "-[WFMeasure start:withCompletionQueue:]_block_invoke");
  }
  id v5 = [*(id *)(a1 + 32) internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__WFMeasure_start_withCompletionQueue___block_invoke_2;
  block[3] = &unk_1E69BC8D8;
  void block[4] = *(void *)(a1 + 32);
  dispatch_sync(v5, block);
}

void __39__WFMeasure_start_withCompletionQueue___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsInProgress:0];
  uint64_t v2 = [*(id *)(a1 + 32) completionHandler];
  if (v2)
  {
    dispatch_time_t v3 = (void *)v2;
    intptr_t v4 = [*(id *)(a1 + 32) completionQueue];

    if (v4)
    {
      id v5 = [*(id *)(a1 + 32) completionQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __39__WFMeasure_start_withCompletionQueue___block_invoke_3;
      block[3] = &unk_1E69BC8D8;
      void block[4] = *(void *)(a1 + 32);
      dispatch_async(v5, block);
    }
  }
}

void __39__WFMeasure_start_withCompletionQueue___block_invoke_3(uint64_t a1)
{
  id v5 = *(unsigned char **)(a1 + 32);
  if (!v5[13])
  {
    id v6 = [v5 result];
    [v6 setSeenSpecificAcFailure:0];

    id v7 = [*(id *)(a1 + 32) result];
    int v8 = [*(id *)(a1 + 32) result];
    uint64_t v9 = [v8 trafficClassBEAttemptedSmall];
    if (v9 <= 0
      && ([*(id *)(a1 + 32) result],
          v1 = objc_claimAutoreleasedReturnValue(),
          [v1 trafficClassBEAttemptedLarge] < 1))
    {
      int v12 = 0;
      int v10 = 0;
      BOOL v11 = 0;
    }
    else
    {
      uint64_t v2 = [*(id *)(a1 + 32) result];
      if ([v2 trafficClassBESucceededSmall])
      {
        int v10 = 0;
        BOOL v11 = 0;
        int v12 = 1;
      }
      else
      {
        dispatch_time_t v3 = [*(id *)(a1 + 32) result];
        BOOL v11 = [v3 trafficClassBESucceededLarge] == 0;
        int v12 = 1;
        int v10 = 1;
      }
    }
    objc_msgSend(v7, "setSeenSpecificAcFailure:", v11 | objc_msgSend(v7, "seenSpecificAcFailure"));
    if (v10) {

    }
    if (v12) {
    if (v9 <= 0)
    }

    uint64_t v13 = [*(id *)(a1 + 32) result];
    uint64_t v14 = [*(id *)(a1 + 32) result];
    uint64_t v15 = [v14 trafficClassBKAttemptedSmall];
    if (v15 <= 0
      && ([*(id *)(a1 + 32) result],
          v1 = objc_claimAutoreleasedReturnValue(),
          [v1 trafficClassBKAttemptedLarge] < 1))
    {
      int v18 = 0;
      int v16 = 0;
      BOOL v17 = 0;
    }
    else
    {
      uint64_t v2 = [*(id *)(a1 + 32) result];
      if ([v2 trafficClassBKSucceededSmall])
      {
        int v16 = 0;
        BOOL v17 = 0;
        int v18 = 1;
      }
      else
      {
        dispatch_time_t v3 = [*(id *)(a1 + 32) result];
        BOOL v17 = [v3 trafficClassBKSucceededLarge] == 0;
        int v18 = 1;
        int v16 = 1;
      }
    }
    objc_msgSend(v13, "setSeenSpecificAcFailure:", v17 | objc_msgSend(v13, "seenSpecificAcFailure"));
    if (v16) {

    }
    if (v18) {
    if (v15 <= 0)
    }

    BOOL v19 = [*(id *)(a1 + 32) result];
    uint64_t v20 = [*(id *)(a1 + 32) result];
    uint64_t v21 = [v20 trafficClassVOAttemptedSmall];
    if (v21 <= 0
      && ([*(id *)(a1 + 32) result],
          v1 = objc_claimAutoreleasedReturnValue(),
          [v1 trafficClassVOAttemptedLarge] < 1))
    {
      int v24 = 0;
      int v22 = 0;
      BOOL v23 = 0;
    }
    else
    {
      uint64_t v2 = [*(id *)(a1 + 32) result];
      if ([v2 trafficClassVOSucceededSmall])
      {
        int v22 = 0;
        BOOL v23 = 0;
        int v24 = 1;
      }
      else
      {
        dispatch_time_t v3 = [*(id *)(a1 + 32) result];
        BOOL v23 = [v3 trafficClassVOSucceededLarge] == 0;
        int v24 = 1;
        int v22 = 1;
      }
    }
    objc_msgSend(v19, "setSeenSpecificAcFailure:", v23 | objc_msgSend(v19, "seenSpecificAcFailure"));
    if (v22) {

    }
    if (v24) {
    if (v21 <= 0)
    }

    double v25 = [*(id *)(a1 + 32) result];
    uint64_t v26 = [*(id *)(a1 + 32) result];
    uint64_t v27 = [v26 trafficClassVIAttemptedSmall];
    if (v27 <= 0
      && ([*(id *)(a1 + 32) result],
          v1 = objc_claimAutoreleasedReturnValue(),
          [v1 trafficClassVIAttemptedLarge] < 1))
    {
      int v30 = 0;
      int v28 = 0;
      BOOL v29 = 0;
    }
    else
    {
      uint64_t v2 = [*(id *)(a1 + 32) result];
      if ([v2 trafficClassVISucceededSmall])
      {
        int v28 = 0;
        BOOL v29 = 0;
        int v30 = 1;
      }
      else
      {
        dispatch_time_t v3 = [*(id *)(a1 + 32) result];
        BOOL v29 = [v3 trafficClassVISucceededLarge] == 0;
        int v30 = 1;
        int v28 = 1;
      }
    }
    objc_msgSend(v25, "setSeenSpecificAcFailure:", v29 | objc_msgSend(v25, "seenSpecificAcFailure"));
    if (v28) {

    }
    if (v30) {
    if (v27 <= 0)
    }

    int v31 = [*(id *)(a1 + 32) result];
    uint64_t v32 = [v31 numAcFailed];

    uint64_t v33 = [*(id *)(a1 + 32) result];
    int v34 = [v33 seenSpecificAcFailure];
    if (v32)
    {
      if ((v34 & 1) == 0) {
        __39__WFMeasure_start_withCompletionQueue___block_invoke_3_cold_2();
      }
    }
    else if (v34)
    {
      __39__WFMeasure_start_withCompletionQueue___block_invoke_3_cold_1();
    }
  }
  uint64_t v35 = +[WiFiUsageMonitor sharedInstance];
  uint64_t v36 = [*(id *)(a1 + 32) result];
  v37 = *(void **)(a1 + 32);
  uint64_t v38 = v37[13];
  uint64_t v39 = [v37 interfaceName];
  [v35 linkTestEvent:v36 withReason:v38 forInterface:v39];

  v40 = [*(id *)(a1 + 32) dnsServers];
  uint64_t v41 = [*(id *)(a1 + 32) result];
  [v41 setDnsServers:v40];

  uint64_t v42 = [*(id *)(a1 + 32) gatewayAddress];
  uint64_t v43 = [*(id *)(a1 + 32) result];
  [v43 setGatewayAddress:v42];

  v46 = [*(id *)(a1 + 32) completionHandler];
  uint64_t v44 = [*(id *)(a1 + 32) result];
  char v45 = (void *)[v44 copy];
  v46[2](v46, v45);
}

- (id)description
{
  dispatch_time_t v3 = NSString;
  if ([(WFMeasure *)self isInProgress]) {
    intptr_t v4 = @"YES";
  }
  else {
    intptr_t v4 = @"NO";
  }
  unint64_t v5 = [(WFMeasure *)self options];
  id v6 = [(WFMeasure *)self interfaceName];
  id v7 = [(WFMeasure *)self gatewayAddress];
  int v8 = [(WFMeasure *)self dnsServers];
  uint64_t v9 = [v3 stringWithFormat:@"isInProgress=%@ options=0x%lx interfaceName=%@ gateway=%@ dnsServers=%@", v4, v5, v6, v7, v8];

  return v9;
}

- (void)abort
{
  dispatch_time_t v3 = +[WiFiPolicyNetworkActivityTracing sharedNetworkActivityTracing];
  [v3 networkActivityTracingCompleteConnectionsActivities];

  intptr_t v4 = [(WFMeasure *)self performanceTest];
  [v4 cancelAllNetworking];

  [(WFMeasure *)self setIsInProgress:0];
}

- (BOOL)isInProgress
{
  return self->_isInProgress;
}

- (void)setIsInProgress:(BOOL)a3
{
  self->_isInProgress = a3;
}

- (NSString)gatewayAddress
{
  return self->_gatewayAddress;
}

- (void)setGatewayAddress:(id)a3
{
}

- (NSMutableSet)dnsServers
{
  return self->_dnsServers;
}

- (void)setDnsServers:(id)a3
{
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (OS_dispatch_group)dispatchGroup
{
  return self->_dispatchGroup;
}

- (void)setDispatchGroup:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (OS_dispatch_queue)completionQueue
{
  return self->_completionQueue;
}

- (void)setCompletionQueue:(id)a3
{
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
}

- (NSString)publicDNSAddress
{
  return self->_publicDNSAddress;
}

- (void)setPublicDNSAddress:(id)a3
{
}

- (NSString)testDNSHostname
{
  return self->_testDNSHostname;
}

- (void)setTestDNSHostname:(id)a3
{
}

- (NSString)testReason
{
  return self->_testReason;
}

- (void)setTestReason:(id)a3
{
}

- (BOOL)isPeriodicTest
{
  return self->_isPeriodicTest;
}

- (void)setIsPeriodicTest:(BOOL)a3
{
  self->_isPeriodicTest = a3;
}

- (BOOL)isSiriTimeout
{
  return self->_isSiriTimeout;
}

- (void)setIsSiriTimeout:(BOOL)a3
{
  self->_isSiriTimeout = a3;
}

- (BOOL)isApsdTimeout
{
  return self->_isApsdTimeout;
}

- (void)setIsApsdTimeout:(BOOL)a3
{
  self->_isApsdTimeout = a3;
}

- (BOOL)isRetest
{
  return self->_isRetest;
}

- (void)setIsRetest:(BOOL)a3
{
  self->_isRetest = a3;
}

- (BOOL)isParis
{
  return self->_isParis;
}

- (void)setIsParis:(BOOL)a3
{
  self->_isParis = a3;
}

- (unsigned)tclass
{
  return self->_tclass;
}

- (void)setTclass:(unsigned int)a3
{
  self->_tclass = a3;
}

- (NPTPerformanceTest)performanceTest
{
  return self->_performanceTest;
}

- (void)setPerformanceTest:(id)a3
{
}

- (WFMeasureResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_performanceTest, 0);
  objc_storeStrong((id *)&self->_testReason, 0);
  objc_storeStrong((id *)&self->_testDNSHostname, 0);
  objc_storeStrong((id *)&self->_publicDNSAddress, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_dispatchGroup, 0);
  objc_storeStrong((id *)&self->_dnsServers, 0);

  objc_storeStrong((id *)&self->_gatewayAddress, 0);
}

void __30__WFMeasure_dispatchPingTest___block_invoke_cold_1(uint8_t *buf, unsigned char *a2)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_fault_impl(&dword_1D3CCD000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Pinging LocalDNS PublicDNS or Gateway failed due to no pingAddress", buf, 2u);
}

- (void)dispatchSiriTest:trafficClass:.cold.1()
{
}

void __39__WFMeasure_start_withCompletionQueue___block_invoke_3_cold_1()
{
  __assert_rtn("-[WFMeasure start:withCompletionQueue:]_block_invoke_3", "WFMeasure.m", 1489, "self.result.seenSpecificAcFailure == NO");
}

void __39__WFMeasure_start_withCompletionQueue___block_invoke_3_cold_2()
{
  __assert_rtn("-[WFMeasure start:withCompletionQueue:]_block_invoke_3", "WFMeasure.m", 1487, "self.result.seenSpecificAcFailure == YES");
}

@end