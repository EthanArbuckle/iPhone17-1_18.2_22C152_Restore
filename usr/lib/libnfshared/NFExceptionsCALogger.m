@interface NFExceptionsCALogger
+ (void)postAnalyticsATLFailureEvent:(unsigned __int16)a3 aid:(id)a4 error:(id)a5;
+ (void)postAnalyticsAppletProvisioningFailureEvent:(unsigned __int16)a3 responseCode:(unsigned __int16)a4;
+ (void)postAnalyticsCRSAuthECommerceWithParameters:(id)a3;
+ (void)postAnalyticsCRSAuthInitEventWithStatus:(unsigned __int16)a3;
+ (void)postAnalyticsCRSAuthWithStatus:(unsigned __int16)a3 withMethod:(unsigned int)a4;
+ (void)postAnalyticsCRSDeAuthWithStatus:(unsigned __int16)a3;
+ (void)postAnalyticsContactlessErrorsEvent:(unsigned __int16)a3 status:(unsigned __int16)a4 error:(id)a5;
+ (void)postAnalyticsExpressSetupFailureEvent:(unsigned __int16)a3 context:(unsigned __int16)a4 error:(id)a5;
+ (void)postAnalyticsHciTransactionException:(id)a3 eventType:(id)a4 commandResult:(id)a5 status:(id)a6;
+ (void)postAnalyticsMobileSoftwareUpdateExceptionEvent:(unsigned __int16)a3;
+ (void)postAnalyticsOsResetEvent:(unsigned int)a3 osID:(unsigned int)a4 hardwareType:(unsigned int)a5;
+ (void)postAnalyticsReaderModeExceptionForType:(unsigned int)a3 tagType:(unsigned int)a4 rfFrameInterface:(BOOL)a5 withErrorCode:(unsigned int)a6;
+ (void)postAnalyticsSEFailureEvent:(unsigned __int16)a3 context:(id)a4 error:(id)a5;
+ (void)postAnalyticsSERemovedEvent:(unsigned int)a3 hasExpressTransactionStarted:(BOOL)a4 hasCardEmulationStarted:(BOOL)a5 hardwareType:(unsigned int)a6;
+ (void)postAnalyticsSERestrictedModeEntered:(id)a3;
+ (void)postAnalyticsSERestrictedModeExited:(unsigned int)a3;
+ (void)postAnalyticsTSMConnectivityException:(unsigned int)a3;
+ (void)postAnalyticsVASTransactionException:(unsigned int)a3 withSWStatus:(unsigned __int16)a4;
+ (void)postCASERestrictedModeExited:(unsigned int)a3;
+ (void)postHardwareExceptionEventWithAssertionCounter:(unsigned int)a3 hardwareType:(unsigned int)a4 wdogDump:(unsigned int *)a5 hwFltDump:(unsigned int *)a6 wdgTickInfo:(unsigned int *)a7 assertionData:(id)a8;
+ (void)postMiddlewareExceptionEvent:(unsigned int)a3 mwVersion:(unsigned int)a4 errorType:(unsigned int)a5 errorCode:(unsigned int)a6 breadcrumb:(unint64_t)a7 description:(id)a8;
@end

@implementation NFExceptionsCALogger

+ (void)postHardwareExceptionEventWithAssertionCounter:(unsigned int)a3 hardwareType:(unsigned int)a4 wdogDump:(unsigned int *)a5 hwFltDump:(unsigned int *)a6 wdgTickInfo:(unsigned int *)a7 assertionData:(id)a8
{
  uint64_t v11 = *(void *)&a4;
  uint64_t v12 = *(void *)&a3;
  v64[3] = *MEMORY[0x1E4F143B8];
  id v13 = a8;
  v14 = (void *)MEMORY[0x1CB7976C0]();
  if (v11)
  {
    v15 = [MEMORY[0x1E4F1CA60] dictionary];
    v16 = [NSNumber numberWithUnsignedInt:v12];
    [v15 setObject:v16 forKeyedSubscript:@"AssertionProgramCounter"];

    if (a5)
    {
      v17 = [NSNumber numberWithUnsignedInt:*a5];
      [v15 setObject:v17 forKeyedSubscript:@"RfProcessPc"];
    }
    else
    {
      [v15 setObject:&unk_1F24D1E38 forKeyedSubscript:@"RfProcessPc"];
    }
    v19 = [NSNumber numberWithUnsignedInt:a5[1]];
    [v15 setObject:v19 forKeyedSubscript:@"RfProcessSp"];

    v20 = [NSNumber numberWithUnsignedInt:a5[2]];
    [v15 setObject:v20 forKeyedSubscript:@"RfProcessWaitObject"];

    v21 = [NSNumber numberWithUnsignedInt:a5[3]];
    [v15 setObject:v21 forKeyedSubscript:@"RfProcessState"];

    v22 = [NSNumber numberWithUnsignedInt:a5[4]];
    [v15 setObject:v22 forKeyedSubscript:@"SwpProcessPc"];

    v23 = [NSNumber numberWithUnsignedInt:a5[5]];
    [v15 setObject:v23 forKeyedSubscript:@"SwpProcessSp"];

    v24 = [NSNumber numberWithUnsignedInt:a5[6]];
    [v15 setObject:v24 forKeyedSubscript:@"SwpProcessWaitObject"];

    v25 = [NSNumber numberWithUnsignedInt:a5[7]];
    [v15 setObject:v25 forKeyedSubscript:@"SwpProcessState"];

    v26 = [NSNumber numberWithUnsignedInt:a5[8]];
    [v15 setObject:v26 forKeyedSubscript:@"KernelProcessPc"];

    v27 = [NSNumber numberWithUnsignedInt:a5[9]];
    [v15 setObject:v27 forKeyedSubscript:@"KernelProcessSp"];

    v28 = [NSNumber numberWithUnsignedInt:a5[10]];
    [v15 setObject:v28 forKeyedSubscript:@"KernelProcessWaitObject"];

    v29 = [NSNumber numberWithUnsignedInt:a5[11]];
    [v15 setObject:v29 forKeyedSubscript:@"KernelProcessState"];

    v30 = [NSNumber numberWithUnsignedInt:a5[12]];
    [v15 setObject:v30 forKeyedSubscript:@"HostProcessPc"];

    v31 = [NSNumber numberWithUnsignedInt:a5[13]];
    [v15 setObject:v31 forKeyedSubscript:@"HostProcessSp"];

    v32 = [NSNumber numberWithUnsignedInt:a5[14]];
    [v15 setObject:v32 forKeyedSubscript:@"HostProcessWaitObject"];

    v33 = [NSNumber numberWithUnsignedInt:a5[15]];
    [v15 setObject:v33 forKeyedSubscript:@"HostProcessState"];

    if (a6)
    {
      v34 = [NSNumber numberWithUnsignedInt:*a6];
      [v15 setObject:v34 forKeyedSubscript:@"R0"];
    }
    else
    {
      [v15 setObject:&unk_1F24D1E38 forKeyedSubscript:@"R0"];
    }
    v35 = [NSNumber numberWithUnsignedInt:a6[1]];
    [v15 setObject:v35 forKeyedSubscript:@"R1"];

    v36 = [NSNumber numberWithUnsignedInt:a6[2]];
    [v15 setObject:v36 forKeyedSubscript:@"R2"];

    v37 = [NSNumber numberWithUnsignedInt:a6[3]];
    [v15 setObject:v37 forKeyedSubscript:@"R3"];

    v38 = [NSNumber numberWithUnsignedInt:a6[4]];
    [v15 setObject:v38 forKeyedSubscript:@"R12"];

    v39 = [NSNumber numberWithUnsignedInt:a6[5]];
    [v15 setObject:v39 forKeyedSubscript:@"LR"];

    v40 = [NSNumber numberWithUnsignedInt:a6[6]];
    [v15 setObject:v40 forKeyedSubscript:@"PC"];

    v41 = [NSNumber numberWithUnsignedInt:a6[7]];
    [v15 setObject:v41 forKeyedSubscript:@"XPsr"];

    v42 = [NSNumber numberWithUnsignedInt:a6[8]];
    [v15 setObject:v42 forKeyedSubscript:@"hfLr"];

    v43 = [NSNumber numberWithUnsignedInt:a6[9]];
    [v15 setObject:v43 forKeyedSubscript:@"Psp"];

    v44 = [NSNumber numberWithUnsignedInt:a6[10]];
    [v15 setObject:v44 forKeyedSubscript:@"Msp"];

    if (a7)
    {
      v45 = [NSNumber numberWithUnsignedInt:*a7];
      [v15 setObject:v45 forKeyedSubscript:@"WDG_RF"];
    }
    else
    {
      [v15 setObject:&unk_1F24D1E38 forKeyedSubscript:@"WDG_RF"];
    }
    v46 = [NSNumber numberWithUnsignedInt:a7[1]];
    [v15 setObject:v46 forKeyedSubscript:@"WDG_SWP"];

    v47 = [NSNumber numberWithUnsignedInt:a7[2]];
    [v15 setObject:v47 forKeyedSubscript:@"WDG_Kernel"];

    v48 = [NSNumber numberWithUnsignedInt:a7[3]];
    [v15 setObject:v48 forKeyedSubscript:@"WDG_Host"];

    v49 = [NSNumber numberWithUnsignedInt:a7[4]];
    [v15 setObject:v49 forKeyedSubscript:@"WDG_MBox"];

    v50 = [NSNumber numberWithUnsignedInt:a7[5]];
    [v15 setObject:v50 forKeyedSubscript:@"WDG_LowPower"];

    v51 = [NSNumber numberWithUnsignedInt:a7[6]];
    [v15 setObject:v51 forKeyedSubscript:@"WDG_Sys_Ticks"];

    v18 = [v15 description];
  }
  else
  {
    v18 = 0;
  }
  v52 = &stru_1F24CADC0;
  if (v18) {
    v53 = v18;
  }
  else {
    v53 = &stru_1F24CADC0;
  }
  v64[0] = v53;
  v63[0] = @"exceptionData";
  v63[1] = @"hardwareType";
  v54 = [NSNumber numberWithUnsignedInt:v11];
  v64[1] = v54;
  v63[2] = @"assertionDebug";
  if (v13)
  {
    [v13 NF_asHexString];
    v52 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v64[2] = v52;
  v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:v63 count:3];
  if (v13) {

  }
  v56 = +[NFCALogger sharedCALogger];
  [v56 postCAEventFor:@"com.apple.nfcd.exceptions.hardwareExceptionEvent" eventInput:v55];
  uint64_t v57 = [v56 generateDailyUUIDForCA];
  v58 = (void *)v57;
  v61[0] = @"hwCount";
  v61[1] = @"dailyDeviceUUID";
  if (v57) {
    v59 = (__CFString *)v57;
  }
  else {
    v59 = @"noUUID";
  }
  v62[0] = &unk_1F24D1E50;
  v62[1] = v59;
  v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:v61 count:2];
  [v56 postCAEventFor:@"com.apple.nfcd.deviceExceptionStatistic" eventInput:v60];
}

+ (void)postMiddlewareExceptionEvent:(unsigned int)a3 mwVersion:(unsigned int)a4 errorType:(unsigned int)a5 errorCode:(unsigned int)a6 breadcrumb:(unint64_t)a7 description:(id)a8
{
  uint64_t v9 = *(void *)&a6;
  uint64_t v10 = *(void *)&a5;
  uint64_t v11 = *(void *)&a4;
  uint64_t v12 = *(void *)&a3;
  v29[6] = *MEMORY[0x1E4F143B8];
  id v13 = a8;
  v14 = (void *)MEMORY[0x1CB7976C0]();
  v28[0] = @"middlewareVersion";
  v15 = [NSNumber numberWithUnsignedInt:v11];
  v29[0] = v15;
  v28[1] = @"type";
  v16 = [NSNumber numberWithUnsignedInt:v10];
  v29[1] = v16;
  v28[2] = @"errorCode";
  v17 = [NSNumber numberWithUnsignedInt:v9];
  v29[2] = v17;
  v28[3] = @"breadcrump";
  v18 = [NSNumber numberWithUnsignedLongLong:a7];
  v29[3] = v18;
  v28[4] = @"hardwareType";
  v19 = [NSNumber numberWithUnsignedInt:v12];
  v28[5] = @"description";
  v29[4] = v19;
  v29[5] = v13;
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:6];

  v21 = +[NFCALogger sharedCALogger];
  [v21 postCAEventFor:@"com.apple.nfcd.exceptions.middlewareExceptionEvent" eventInput:v20];
  uint64_t v22 = [v21 generateDailyUUIDForCA];
  v23 = (void *)v22;
  v26[0] = @"mwCount";
  v26[1] = @"dailyDeviceUUID";
  if (v22) {
    v24 = (__CFString *)v22;
  }
  else {
    v24 = @"noUUID";
  }
  v27[0] = &unk_1F24D1E50;
  v27[1] = v24;
  v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];
  [v21 postCAEventFor:@"com.apple.nfcd.deviceExceptionStatistic" eventInput:v25];
}

+ (void)postAnalyticsMobileSoftwareUpdateExceptionEvent:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  v9[1] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1CB7976C0](a1, a2);
  v8 = @"status";
  v5 = [NSNumber numberWithUnsignedShort:v3];
  v9[0] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];

  v7 = +[NFCALogger sharedCALogger];
  [v7 postCAEventFor:@"com.apple.nfcd.exceptions.mobileSoftwareUpdateExceptionEvent" eventInput:v6];
}

+ (void)postAnalyticsSERemovedEvent:(unsigned int)a3 hasExpressTransactionStarted:(BOOL)a4 hasCardEmulationStarted:(BOOL)a5 hardwareType:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v9 = *(void *)&a3;
  v18[4] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = (void *)MEMORY[0x1CB7976C0](a1, a2);
  v17[0] = @"reason";
  uint64_t v11 = [NSNumber numberWithUnsignedInt:v9];
  v18[0] = v11;
  v17[1] = @"hasExpressTransactionStarted";
  uint64_t v12 = [NSNumber numberWithInt:v8];
  v18[1] = v12;
  v17[2] = @"hasCardEmulationStarted";
  id v13 = [NSNumber numberWithInt:v7];
  v18[2] = v13;
  v17[3] = @"hardwareType";
  v14 = [NSNumber numberWithUnsignedInt:v6];
  v18[3] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];

  v16 = +[NFCALogger sharedCALogger];
  [v16 postCAEventFor:@"com.apple.nfcd.exceptions.seRemovedEvent" eventInput:v15];
}

+ (void)postAnalyticsOsResetEvent:(unsigned int)a3 osID:(unsigned int)a4 hardwareType:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  v15[3] = *MEMORY[0x1E4F143B8];
  BOOL v8 = (void *)MEMORY[0x1CB7976C0](a1, a2);
  v14[0] = @"reason";
  uint64_t v9 = [NSNumber numberWithUnsignedInt:v7];
  v15[0] = v9;
  v14[1] = @"osID";
  uint64_t v10 = [NSNumber numberWithUnsignedInt:v6];
  v15[1] = v10;
  v14[2] = @"hardwareType";
  uint64_t v11 = [NSNumber numberWithUnsignedInt:v5];
  v15[2] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];

  id v13 = +[NFCALogger sharedCALogger];
  [v13 postCAEventFor:@"com.apple.nfcd.exceptions.osResetEvent" eventInput:v12];
}

+ (void)postAnalyticsCRSAuthInitEventWithStatus:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  v9[1] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1CB7976C0](a1, a2);
  if (v3 != 36864)
  {
    BOOL v8 = @"statusCode";
    uint64_t v5 = [NSNumber numberWithUnsignedShort:v3];
    v9[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];

    uint64_t v7 = +[NFCALogger sharedCALogger];
    [v7 postCAEventFor:@"com.apple.nfcd.exceptions.crsAuthInitExceptionEvent" eventInput:v6];
  }
}

+ (void)postAnalyticsCRSAuthECommerceWithParameters:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = (void *)MEMORY[0x1CB7976C0]();
  uint64_t v5 = [v3 objectForKey:@"status"];
  uint64_t v6 = [v5 unsignedIntValue];

  if (v6 != 36864)
  {
    uint64_t v7 = [v3 objectForKey:@"method"];
    if (v7)
    {
      BOOL v8 = [v3 objectForKey:@"method"];
      uint64_t v9 = [v8 unsignedIntValue];
    }
    else
    {
      uint64_t v9 = 0xFFFFFFFFLL;
    }

    v14[0] = @"statusCode";
    uint64_t v10 = [NSNumber numberWithUnsignedInt:v6];
    v14[1] = @"type";
    v15[0] = v10;
    uint64_t v11 = [NSNumber numberWithUnsignedInt:v9];
    v15[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

    id v13 = +[NFCALogger sharedCALogger];
    [v13 postCAEventFor:@"com.apple.nfcd.exceptions.crsAuthExceptionEvent" eventInput:v12];
  }
}

+ (void)postAnalyticsCRSAuthWithStatus:(unsigned __int16)a3 withMethod:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = a3;
  v12[2] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void *)MEMORY[0x1CB7976C0](a1, a2);
  if (v5 != 36864)
  {
    v11[0] = @"statusCode";
    uint64_t v7 = [NSNumber numberWithUnsignedShort:v5];
    v11[1] = @"type";
    v12[0] = v7;
    BOOL v8 = [NSNumber numberWithUnsignedInt:v4];
    v12[1] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

    uint64_t v10 = +[NFCALogger sharedCALogger];
    [v10 postCAEventFor:@"com.apple.nfcd.exceptions.crsAuthExceptionEvent" eventInput:v9];
  }
}

+ (void)postAnalyticsCRSDeAuthWithStatus:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  void v9[2] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)MEMORY[0x1CB7976C0](a1, a2);
  if (v3 != 36864)
  {
    v8[0] = @"statusCode";
    uint64_t v5 = [NSNumber numberWithUnsignedShort:v3];
    v8[1] = @"type";
    v9[0] = v5;
    v9[1] = &unk_1F24D1E68;
    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];

    uint64_t v7 = +[NFCALogger sharedCALogger];
    [v7 postCAEventFor:@"com.apple.nfcd.exceptions.crsAuthExceptionEvent" eventInput:v6];
  }
}

+ (void)postAnalyticsSERestrictedModeEntered:(id)a3
{
  v24[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1CB7976C0]();
  uint64_t v6 = +[NFCALogger sharedCALogger];
  if (([v6 restrictedMode] & 1) == 0)
  {
    [v6 setRestrictedMode:1];
    v23[0] = @"contactless";
    uint64_t v7 = [v4 objectForKeyedSubscript:];
    if (v7)
    {
      BOOL v8 = NSNumber;
      uint64_t v3 = [v4 objectForKeyedSubscript:@"contactless"];
      uint64_t v9 = [v8 numberWithBool:[v3 BOOLValue]];
    }
    else
    {
      uint64_t v9 = &unk_1F24D1E38;
    }
    v24[0] = v9;
    v23[1] = @"platformIdentifier";
    uint64_t v10 = [v4 objectForKeyedSubscript:];
    uint64_t v11 = (void *)v10;
    uint64_t v12 = &stru_1F24CADC0;
    if (v10) {
      uint64_t v12 = (__CFString *)v10;
    }
    v24[1] = v12;
    v23[2] = @"hardwareType";
    uint64_t v13 = [v4 objectForKeyedSubscript:];
    v14 = (void *)v13;
    if (v13) {
      v15 = (void *)v13;
    }
    else {
      v15 = &unk_1F24D1E38;
    }
    v24[2] = v15;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];

    if (v7)
    {
    }
    [v6 postCAEventFor:@"com.apple.nfcd.exceptions.seRestrictedModeEnteredEvent" eventInput:v16];
    +[NFGeneralStatisticsCALogger updateAnalyticsGeneralTransactionStatistics:&unk_1F24D2018];
    uint64_t v17 = [v6 generateDailyUUIDForCA];
    v18 = (void *)v17;
    v21[0] = @"restrictedModeCount";
    v21[1] = @"dailyDeviceUUID";
    if (v17) {
      v19 = (__CFString *)v17;
    }
    else {
      v19 = @"noUUID";
    }
    v22[0] = &unk_1F24D1E50;
    v22[1] = v19;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
    [v6 postCAEventFor:@"com.apple.nfcd.deviceExceptionStatistic" eventInput:v20];
  }
}

+ (void)postAnalyticsSERestrictedModeExited:(unsigned int)a3
{
  [a1 postCASERestrictedModeExited:*(void *)&a3];
  id v3 = +[NFCALogger sharedCALogger];
  [v3 removeRestrictedMode];
}

+ (void)postCASERestrictedModeExited:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  void v9[2] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1CB7976C0](a1, a2);
  v8[0] = @"hardwareType";
  uint64_t v5 = [NSNumber numberWithUnsignedInt:v3];
  v8[1] = @"exitReason";
  v9[0] = v5;
  v9[1] = &unk_1F24D1E38;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];

  uint64_t v7 = +[NFCALogger sharedCALogger];
  [v7 postCAEventFor:@"com.apple.nfcd.exceptions.seRestrictedModeExitEvent" eventInput:v6];
}

+ (void)postAnalyticsVASTransactionException:(unsigned int)a3 withSWStatus:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  uint64_t v5 = *(void *)&a3;
  v12[2] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void *)MEMORY[0x1CB7976C0](a1, a2);
  if ((int)v4 > 27266)
  {
    if (v4 != 27267 && v4 != 36864) {
      goto LABEL_7;
    }
  }
  else if (v4 != 25223 && v4 != 27012)
  {
LABEL_7:
    v11[0] = @"swStatus";
    uint64_t v7 = [NSNumber numberWithUnsignedShort:v4];
    v11[1] = @"commandType";
    v12[0] = v7;
    BOOL v8 = [NSNumber numberWithUnsignedInt:v5];
    v12[1] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

    uint64_t v10 = +[NFCALogger sharedCALogger];
    [v10 postCAEventFor:@"com.apple.nfcd.exceptions.vasTransactionExceptionEvent" eventInput:v9];

    +[NFGeneralStatisticsCALogger updateAnalyticsGeneralTransactionStatistics:&unk_1F24D2040];
  }
}

+ (void)postAnalyticsTSMConnectivityException:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)MEMORY[0x1CB7976C0](a1, a2);
  BOOL v8 = @"errorCode";
  uint64_t v5 = [NSNumber numberWithUnsignedInt:v3];
  v9[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];

  uint64_t v7 = +[NFCALogger sharedCALogger];
  [v7 postCAEventFor:@"com.apple.nfcd.exceptions.tsmConnectivityExceptionEvent" eventInput:v6];
}

+ (void)postAnalyticsHciTransactionException:(id)a3 eventType:(id)a4 commandResult:(id)a5 status:(id)a6
{
  void v17[4] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = (void *)MEMORY[0x1CB7976C0]();
  v16[0] = @"transactionUUID";
  v16[1] = @"eventType";
  v17[0] = v9;
  v17[1] = v10;
  v16[2] = @"commandResult";
  v16[3] = @"status";
  v17[2] = v11;
  v17[3] = v12;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];
  v15 = +[NFCALogger sharedCALogger];
  [v15 postCAEventFor:@"com.apple.nfcd.exceptions.hciTransactionExceptionEvent" eventInput:v14];
}

+ (void)postAnalyticsReaderModeExceptionForType:(unsigned int)a3 tagType:(unsigned int)a4 rfFrameInterface:(BOOL)a5 withErrorCode:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  BOOL v7 = a5;
  uint64_t v8 = *(void *)&a4;
  uint64_t v9 = *(void *)&a3;
  v18[4] = *MEMORY[0x1E4F143B8];
  id v10 = (void *)MEMORY[0x1CB7976C0](a1, a2);
  v17[0] = @"type";
  id v11 = [NSNumber numberWithUnsignedInt:v9];
  v18[0] = v11;
  v17[1] = @"tagType";
  id v12 = [NSNumber numberWithUnsignedInt:v8];
  v18[1] = v12;
  v17[2] = @"rfFrameInterface";
  uint64_t v13 = [NSNumber numberWithBool:v7];
  v18[2] = v13;
  v17[3] = @"errorCode";
  v14 = [NSNumber numberWithUnsignedInt:v6];
  v18[3] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];

  v16 = +[NFCALogger sharedCALogger];
  [v16 postCAEventFor:@"com.apple.nfcd.exceptions.ReaderModeExceptionEvent" eventInput:v15];
}

+ (void)postAnalyticsExpressSetupFailureEvent:(unsigned __int16)a3 context:(unsigned __int16)a4 error:(id)a5
{
  uint64_t v5 = a4;
  uint64_t v6 = a3;
  id v13 = a5;
  BOOL v7 = (void *)MEMORY[0x1CB7976C0]();
  uint64_t v8 = objc_opt_new();
  uint64_t v9 = [NSNumber numberWithUnsignedShort:v6];
  [v8 setObject:v9 forKeyedSubscript:@"reason"];

  id v10 = [NSNumber numberWithUnsignedShort:v5];
  [v8 setObject:v10 forKeyedSubscript:@"context"];

  if (v13)
  {
    id v11 = [NSNumber numberWithInteger:[v13 code]];
    [v8 setObject:v11 forKeyedSubscript:@"errorCode"];
  }
  id v12 = +[NFCALogger sharedCALogger];
  [v12 postCAEventFor:@"com.apple.nfcd.exceptions.expressSetupFailures" eventInput:v8];
}

+ (void)postAnalyticsATLFailureEvent:(unsigned __int16)a3 aid:(id)a4 error:(id)a5
{
  uint64_t v6 = a3;
  id v13 = a4;
  id v7 = a5;
  uint64_t v8 = (void *)MEMORY[0x1CB7976C0]();
  uint64_t v9 = objc_opt_new();
  id v10 = [NSNumber numberWithUnsignedShort:v6];
  [v9 setObject:v10 forKeyedSubscript:@"reason"];

  if (v13) {
    [v9 setObject:v13 forKeyedSubscript:@"aid"];
  }
  if (v7)
  {
    id v11 = [NSNumber numberWithInteger:[v7 code]];
    [v9 setObject:v11 forKeyedSubscript:@"errorCode"];
  }
  id v12 = +[NFCALogger sharedCALogger];
  [v12 postCAEventFor:@"com.apple.nfcd.exceptions.atlFailures" eventInput:v9];
}

+ (void)postAnalyticsAppletProvisioningFailureEvent:(unsigned __int16)a3 responseCode:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  uint64_t v6 = (void *)MEMORY[0x1CB7976C0](a1, a2);
  id v7 = objc_opt_new();
  uint64_t v8 = [NSNumber numberWithUnsignedShort:v5];
  [v7 setObject:v8 forKeyedSubscript:@"reason"];

  uint64_t v9 = [NSNumber numberWithUnsignedShort:v4];
  [v7 setObject:v9 forKeyedSubscript:@"errorCode"];

  id v10 = +[NFCALogger sharedCALogger];
  [v10 postCAEventFor:@"com.apple.nfcd.exceptions.appletProvisioningFailures" eventInput:v7];
}

+ (void)postAnalyticsSEFailureEvent:(unsigned __int16)a3 context:(id)a4 error:(id)a5
{
  uint64_t v6 = a3;
  id v13 = a4;
  id v7 = a5;
  uint64_t v8 = (void *)MEMORY[0x1CB7976C0]();
  uint64_t v9 = objc_opt_new();
  id v10 = [NSNumber numberWithUnsignedShort:v6];
  [v9 setObject:v10 forKeyedSubscript:@"reason"];

  if (v13) {
    [v9 setObject:v13 forKeyedSubscript:@"context"];
  }
  if (v7)
  {
    id v11 = [NSNumber numberWithInteger:[v7 code]];
    [v9 setObject:v11 forKeyedSubscript:@"errorCode"];
  }
  id v12 = +[NFCALogger sharedCALogger];
  [v12 postCAEventFor:@"com.apple.nfcd.exceptions.seFailures" eventInput:v9];
}

+ (void)postAnalyticsContactlessErrorsEvent:(unsigned __int16)a3 status:(unsigned __int16)a4 error:(id)a5
{
  uint64_t v5 = a4;
  uint64_t v6 = a3;
  id v13 = a5;
  id v7 = (void *)MEMORY[0x1CB7976C0]();
  uint64_t v8 = objc_opt_new();
  uint64_t v9 = [NSNumber numberWithUnsignedShort:v6];
  [v8 setObject:v9 forKeyedSubscript:@"reason"];

  id v10 = [NSNumber numberWithUnsignedShort:v5];
  [v8 setObject:v10 forKeyedSubscript:@"context"];

  if (v13)
  {
    id v11 = [NSNumber numberWithInteger:[v13 code]];
    [v8 setObject:v11 forKeyedSubscript:@"errorCode"];
  }
  id v12 = +[NFCALogger sharedCALogger];
  [v12 postCAEventFor:@"com.apple.nfcd.exceptions.contactlessErrors" eventInput:v8];
}

@end