@interface MNTraceNetworkConditionHelper
+ (BOOL)deviceSupportsCellularData;
+ (BOOL)disableNLC;
+ (BOOL)enableNLC:(id)a3;
+ (BOOL)hasActiveNetworkConditionInducer;
+ (BOOL)isCellDataEnabled;
+ (BOOL)isWiFiEnabled;
+ (BOOL)setCellDataEnabled:(BOOL)a3;
+ (BOOL)setCurrentState:(id)a3;
+ (BOOL)setWiFiEnabled:(BOOL)a3;
+ (id)activeNLCProfile;
+ (id)availableNLCProfiles;
+ (id)getCurrentState;
+ (id)getNLCProfile:(id)a3;
+ (id)nlcProfiles;
@end

@implementation MNTraceNetworkConditionHelper

+ (id)getCurrentState
{
  v3 = objc_alloc_init(MNTraceNetworkEvent);
  -[MNTraceNetworkEvent setWifiEnabled:](v3, "setWifiEnabled:", [a1 isWiFiEnabled]);
  -[MNTraceNetworkEvent setCellEnabled:](v3, "setCellEnabled:", [a1 isCellDataEnabled]);
  v4 = [a1 activeNLCProfile];
  [(MNTraceNetworkEvent *)v3 setNlcProfile:v4];

  v5 = [(MNTraceNetworkEvent *)v3 nlcProfile];
  -[MNTraceNetworkEvent setNlcEnabled:](v3, "setNlcEnabled:", [v5 length] != 0);

  return v3;
}

+ (BOOL)setCurrentState:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    int v6 = objc_msgSend(a1, "setWiFiEnabled:", objc_msgSend(v4, "wifiEnabled"));
    int v7 = v6 & objc_msgSend(a1, "setCellDataEnabled:", objc_msgSend(v5, "cellEnabled"));
    if ([v5 nlcEnabled]
      && ([v5 nlcProfile],
          v8 = objc_claimAutoreleasedReturnValue(),
          uint64_t v9 = [v8 length],
          v8,
          v9))
    {
      v10 = [v5 nlcProfile];
      char v11 = [a1 enableNLC:v10];
    }
    else
    {
      char v11 = [a1 disableNLC];
    }
    char v12 = v7 & v11;
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

+ (BOOL)setWiFiEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v17 = 0;
  if (!qword_1EB59C290)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v19 = __ATKLoggerLibraryCore_block_invoke;
    v20 = &__block_descriptor_40_e5_v8__0l;
    v21 = &v17;
    long long v22 = xmmword_1E60FB7E0;
    uint64_t v23 = 0;
    qword_1EB59C290 = _sl_dlopen();
    id v4 = v17;
    if (qword_1EB59C290)
    {
      if (!v17) {
        goto LABEL_4;
      }
    }
    else
    {
      id v4 = (void *)abort_report_np();
      __break(1u);
    }
    free(v4);
  }
LABEL_4:
  CoreAutomationDeviceLibrary();
  *(void *)&long long v22 = 0;
  *((void *)&v22 + 1) = &v22;
  uint64_t v23 = 0x2050000000;
  v5 = (void *)_MergedGlobals_43;
  uint64_t v24 = _MergedGlobals_43;
  if (!_MergedGlobals_43)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v19 = __getCAMDEmbeddedDeviceServiceClass_block_invoke;
    v20 = &unk_1E60F7E88;
    v21 = (void **)&v22;
    __getCAMDEmbeddedDeviceServiceClass_block_invoke((uint64_t)&buf);
    v5 = *(void **)(*((void *)&v22 + 1) + 24);
  }
  id v6 = v5;
  _Block_object_dispose(&v22, 8);
  int v7 = (void *)[objc_alloc((Class)v6) initAsMobile];
  [v7 setDirectInvocations:0];
  [v7 start];
  v8 = [v7 WiFi];
  uint64_t v9 = v8;
  if (v3) {
    [v8 on];
  }
  else {
  v10 = [v8 off];
  }

  char v11 = [v10 error];

  char v12 = GEOFindOrCreateLog();
  v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14 = [v10 error];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v14;
      _os_log_impl(&dword_1B542B000, v13, OS_LOG_TYPE_ERROR, "Unable to change WiFi state: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v15 = "OFF";
    if (v3) {
      v15 = "ON";
    }
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = v15;
    _os_log_impl(&dword_1B542B000, v13, OS_LOG_TYPE_INFO, "WiFi power set to %s", (uint8_t *)&buf, 0xCu);
  }

  return v11 == 0;
}

+ (BOOL)isWiFiEnabled
{
  CoreWiFiLibrary();
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2050000000;
  v2 = (void *)getCWFInterfaceClass_softClass;
  uint64_t v11 = getCWFInterfaceClass_softClass;
  if (!getCWFInterfaceClass_softClass)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __getCWFInterfaceClass_block_invoke;
    v7[3] = &unk_1E60F7E88;
    v7[4] = &v8;
    __getCWFInterfaceClass_block_invoke((uint64_t)v7);
    v2 = (void *)v9[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v8, 8);
  id v4 = objc_alloc_init((Class)v3);
  [v4 activate];
  char v5 = [v4 powerOn];
  [v4 invalidate];

  return v5;
}

+ (BOOL)setCellDataEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  ctConnection();
  uint64_t IsEnabled = _CTServerConnectionSetCellularDataIsEnabled();
  errorFromCTError(IsEnabled);
  char v5 = (char *)objc_claimAutoreleasedReturnValue();
  id v6 = GEOFindOrCreateLog();
  int v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      v14 = v5;
      uint64_t v8 = "Couldn't set cell data state: %@";
      uint64_t v9 = v7;
      os_log_type_t v10 = OS_LOG_TYPE_ERROR;
LABEL_8:
      _os_log_impl(&dword_1B542B000, v9, v10, v8, (uint8_t *)&v13, 0xCu);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = "dis";
    if (v3) {
      uint64_t v11 = "en";
    }
    int v13 = 136315138;
    v14 = v11;
    uint64_t v8 = "Cell Data %sabled";
    uint64_t v9 = v7;
    os_log_type_t v10 = OS_LOG_TYPE_INFO;
    goto LABEL_8;
  }

  return v5 == 0;
}

+ (BOOL)isCellDataEnabled
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  ctConnection();
  uint64_t IsEnabled = _CTServerConnectionGetCellularDataIsEnabled();
  BOOL v3 = errorFromCTError(IsEnabled);
  if (v3)
  {
    id v4 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      int v7 = v3;
      _os_log_impl(&dword_1B542B000, v4, OS_LOG_TYPE_ERROR, "Couldn't get cell data state: %@", buf, 0xCu);
    }
  }
  return 0;
}

+ (BOOL)deviceSupportsCellularData
{
  return MEMORY[0x1F417CE00](@"cellular-data", a2);
}

+ (BOOL)hasActiveNetworkConditionInducer
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  ConditionInducerLibrary();
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2050000000;
  v2 = (void *)getCOConditionSessionClass_softClass;
  uint64_t v19 = getCOConditionSessionClass_softClass;
  if (!getCOConditionSessionClass_softClass)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __getCOConditionSessionClass_block_invoke;
    v15[3] = &unk_1E60F7E88;
    v15[4] = &v16;
    __getCOConditionSessionClass_block_invoke((uint64_t)v15);
    v2 = (void *)v17[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v16, 8);
  id v4 = [v3 getActiveConditions];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  char v5 = objc_msgSend(v4, "allKeys", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v11 + 1) + 8 * i) containsString:@"SlowNetwork"])
        {
          BOOL v9 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v20 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_13:

  return v9;
}

+ (BOOL)enableNLC:(id)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([a1 hasActiveNetworkConditionInducer] & 1) == 0)
  {
    uint64_t v6 = [a1 getNLCProfile:v4];
    uint64_t v7 = v6;
    if (!v6)
    {
      BOOL v5 = 0;
LABEL_46:

      goto LABEL_47;
    }
    memset(v58, 0, sizeof(v58));
    long long v57 = 0u;
    long long v56 = 0u;
    long long v55 = 0u;
    long long v54 = 0u;
    long long v53 = 0u;
    long long v52 = 0u;
    int v51 = 21;
    int v66 = 0;
    long long v64 = 0u;
    long long v65 = 0u;
    memset(v63, 0, sizeof(v63));
    long long v61 = 0u;
    long long v62 = 0u;
    uint64_t v8 = [v6 objectForKeyedSubscript:@"DownlinkBandwidth"];
    unsigned int v9 = [v8 unsignedIntValue];

    os_log_type_t v10 = [v7 objectForKeyedSubscript:@"DownlinkBandwidthUnit"];
    unsigned int v11 = [v10 BOOLValue];

    long long v12 = [v7 objectForKeyedSubscript:@"DownlinkPacketLossRatio"];
    [v12 floatValue];
    float v14 = v13 / 100.0;

    uint64_t v15 = [v7 objectForKeyedSubscript:@"DownlinkDelay"];
    unsigned int v16 = [v15 unsignedIntValue];

    if (!v9 && (v14 == 0.0 ? (BOOL v17 = v16 == 0) : (BOOL v17 = 0), v17))
    {
      int v18 = 5;
    }
    else
    {
      LODWORD(v61) = 9;
      *(void *)&long long v64 = __PAIR64__(v11, v9);
      *((void *)&v64 + 1) = __PAIR64__(v16, LODWORD(v14));
      long long v65 = 0uLL;
      int v18 = 13;
      int v66 = 0;
    }
    uint64_t v19 = [v7 objectForKeyedSubscript:@"UplinkBandwidth"];
    int v20 = [v19 unsignedIntValue];

    uint64_t v21 = [v7 objectForKeyedSubscript:@"UplinkBandwidthUnit"];
    unsigned int v22 = [v21 BOOLValue];

    uint64_t v23 = [v7 objectForKeyedSubscript:@"UplinkPacketLossRatio"];
    [v23 floatValue];
    float v25 = v24 / 100.0;

    v26 = [v7 objectForKeyedSubscript:@"UplinkDelay"];
    int v27 = [v26 unsignedIntValue];

    if (v20 || (v25 == 0.0 ? (BOOL v28 = v27 == 0) : (BOOL v28 = 0), !v28))
    {
      LODWORD(v61) = v18;
      HIDWORD(v62) = v20;
      *(void *)&v63[0] = __PAIR64__(LODWORD(v25), v22);
      memset((char *)v63 + 12, 0, 20);
      DWORD2(v63[0]) = v27;
    }
    v29 = [v7 objectForKeyedSubscript:@"RunOnInterface"];
    if ([v29 length])
    {
      [v29 cStringUsingEncoding:1];
      __strlcpy_chk();
      LODWORD(v61) = v61 | 1;
    }
    v30 = [v7 objectForKeyedSubscript:@"ProtocolFamily"];
    DWORD1(v61) = [v30 unsignedIntValue];

    if (DWORD1(v61)) {
      LODWORD(v61) = v61 | 1;
    }
    v31 = [v7 objectForKeyedSubscript:@"ExcludeLoopback"];
    DWORD2(v61) = [v31 unsignedIntValue];

    if (v61)
    {
      *(_OWORD *)&v58[56] = v63[1];
      *(_OWORD *)&v58[72] = v64;
      *(_OWORD *)&v58[88] = v65;
      *(_DWORD *)&v58[104] = v66;
      *(_OWORD *)&v58[8] = v61;
      *(_OWORD *)&v58[24] = v62;
      *(_OWORD *)&v58[40] = v63[0];
    }
    v32 = [v7 objectForKeyedSubscript:@"DNSDelayValue"];
    int v33 = [v32 unsignedIntValue];

    if (v33)
    {
      v34 = [v7 objectForKeyedSubscript:@"ExcludeLoopback"];
      int v35 = [v34 unsignedIntValue];

      *(void *)((char *)&v52 + 4) = 6;
      HIDWORD(v52) = v35;
      long long v53 = 0uLL;
      *(void *)&long long v54 = 0;
      DWORD2(v54) = 0;
      HIDWORD(v54) = v33;
      *(void *)&long long v55 = 0;
      *((void *)&v55 + 1) = 0x3500000011;
      long long v56 = 0u;
      long long v57 = 0u;
      *(void *)v58 = 0;
    }
    uint64_t v50 = 0;
    int v36 = _nlc_connect(&v50);
    BOOL v5 = v36 == 1;
    if (v36 == 1)
    {
      int started = _nlc_start_simulation((mach_port_name_t *)&v50, (long long *)&v51);
      if (started != 1)
      {
        v38 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1B542B000, v38, OS_LOG_TYPE_ERROR, "_nlc_start_simulation failed", buf, 2u);
        }
      }
      if (_nlc_disconnect((int *)&v50) != 1)
      {
        v39 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1B542B000, v39, OS_LOG_TYPE_ERROR, "_nlc_disconnect failed", buf, 2u);
        }
      }
      if (started != 1)
      {
        BOOL v5 = 0;
        goto LABEL_45;
      }
      _CFPreferencesSetValueWithContainer();
      _CFPreferencesSetValueWithContainer();
      v40 = [MEMORY[0x1E4F1C9C8] date];
      [v40 timeIntervalSince1970];
      unint64_t v42 = (unint64_t)v41;

      [NSNumber numberWithUnsignedInteger:v42];
      _CFPreferencesSetValueWithContainer();
      CFPreferencesAppSynchronize(@"com.apple.network.prefPaneSimulate");
      v47 = GEOFindOrCreateLog();
      if (!os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
LABEL_43:

LABEL_45:
        goto LABEL_46;
      }
      *(_DWORD *)long long buf = 138412290;
      id v60 = v4;
      v43 = "Network Link Conditioner set to \"%@\"";
      v44 = v47;
      os_log_type_t v45 = OS_LOG_TYPE_INFO;
      uint32_t v46 = 12;
    }
    else
    {
      v47 = GEOFindOrCreateLog();
      if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
        goto LABEL_43;
      }
      *(_WORD *)long long buf = 0;
      v43 = "_nlc_connect failed";
      v44 = v47;
      os_log_type_t v45 = OS_LOG_TYPE_ERROR;
      uint32_t v46 = 2;
    }
    _os_log_impl(&dword_1B542B000, v44, v45, v43, buf, v46);
    goto LABEL_43;
  }
  BOOL v5 = 0;
LABEL_47:

  return v5;
}

+ (BOOL)disableNLC
{
  memset(v27, 0, sizeof(v27));
  long long v26 = 0u;
  long long v25 = 0u;
  long long v24 = 0u;
  long long v23 = 0u;
  long long v22 = 0u;
  long long v21 = 0u;
  long long v20 = 0u;
  long long v19 = 0u;
  long long v18 = 0u;
  long long v17 = 0u;
  long long v16 = 0u;
  int v15 = 21;
  uint64_t v14 = 0;
  int v2 = _nlc_connect(&v14);
  BOOL v3 = v2 == 1;
  if (v2 != 1)
  {
    os_log_type_t v10 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_WORD *)float v13 = 0;
    uint64_t v7 = "_nlc_connect failed";
    uint64_t v8 = v10;
    os_log_type_t v9 = OS_LOG_TYPE_ERROR;
    goto LABEL_16;
  }
  int v4 = _nlc_stop_simulation((mach_port_name_t *)&v14, (long long *)&v15);
  if (v4 != 1)
  {
    BOOL v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)float v13 = 0;
      _os_log_impl(&dword_1B542B000, v5, OS_LOG_TYPE_ERROR, "_nlc_stop_simulation failed", v13, 2u);
    }
  }
  if (_nlc_disconnect((int *)&v14) != 1)
  {
    uint64_t v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)float v13 = 0;
      _os_log_impl(&dword_1B542B000, v6, OS_LOG_TYPE_ERROR, "_nlc_disconnect failed", v13, 2u);
    }
  }
  if (v4 != 1) {
    return 0;
  }
  _CFPreferencesSetValueWithContainer();
  os_log_type_t v10 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)float v13 = 0;
    uint64_t v7 = "Network Link Conditioner disabled";
    uint64_t v8 = v10;
    os_log_type_t v9 = OS_LOG_TYPE_INFO;
LABEL_16:
    _os_log_impl(&dword_1B542B000, v8, v9, v7, v13, 2u);
  }
LABEL_17:

  return v3;
}

+ (id)activeNLCProfile
{
  int v2 = (void *)_CFPreferencesCopyValueWithContainer();
  BOOL v3 = (void *)_CFPreferencesCopyValueWithContainer();
  int v4 = [v3 BOOLValue];

  BOOL v5 = (void *)_CFPreferencesCopyValueWithContainer();
  double v6 = (double)[v5 longValue];

  uint64_t v7 = [MEMORY[0x1E4F28F80] processInfo];
  [v7 systemUptime];
  double v9 = v8;

  os_log_type_t v10 = [MEMORY[0x1E4F1C9C8] date];
  [v10 timeIntervalSince1970];
  BOOL v12 = v11 - v6 <= v9;

  if ((v12 & v4) != 0) {
    float v13 = v2;
  }
  else {
    float v13 = 0;
  }
  id v14 = v13;

  return v14;
}

+ (id)nlcProfiles
{
  int v2 = (void *)_CFPreferencesCopyValueWithContainer();
  if (![v2 count])
  {
    BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithContentsOfFile:@"/Developer/Library/PreferenceBundles/Developer Settings.bundle/com.apple.network.prefPaneSimulate.plist"];
    uint64_t v4 = [v3 objectForKeyedSubscript:@"Profiles"];

    _CFPreferencesSetValueWithContainer();
    int v2 = (void *)v4;
  }
  return v2;
}

+ (id)availableNLCProfiles
{
  int v2 = [a1 nlcProfiles];
  BOOL v3 = [v2 allKeys];
  uint64_t v4 = [v3 sortedArrayUsingSelector:sel_compare_];

  return v4;
}

+ (id)getNLCProfile:(id)a3
{
  id v4 = a3;
  BOOL v5 = [a1 nlcProfiles];
  double v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

@end