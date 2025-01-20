@interface AnalyticsProcessor
+ (id)formattedMACAddressNotation:(id)a3 octetCount:(unint64_t)a4;
+ (id)sharedAnalyticsProcessor;
- (AnalyticsProcessor)initWithOptions:(unint64_t)a3;
- (AnalyticsProcessor)initWithOptions:(unint64_t)a3 byoMOC:(id)a4;
- (AnalyticsStoreMOHandler)managedObjectHandler;
- (BOOL)initCommmonObjects;
- (BOOL)unpackRssiSnrCCAFromRssiMetricField:(id)a3 unpackedRssi:(id *)a4 unpackedCca:(id *)a5 unpackedSnr:(id *)a6;
- (DeploymentMetricHandler)deploymentMetricHandler;
- (LinkChangePolicyHandler)linkChangePolicyHandler;
- (NSDateFormatter)dateFormatterWAMessage;
- (RoamPolicyStore)roamPolicyHandler;
- (id)apProfileForBssid:(id)a3 andSSID:(id)a4;
- (id)formattedNotation:(id)a3 octetCount:(unint64_t)a4;
- (id)getDateFromDateString:(id)a3;
- (id)summarizeAnalyticsForNetwork:(id)a3 maxAgeInDays:(unint64_t)a4;
- (unint64_t)deploymentMetricDiffDays;
- (unint64_t)numRoamSamples;
- (unint64_t)testDateDiffDays;
- (void)ageOutAnalytics:(double)a3;
- (void)performPruneBasedOnStoreSizeAndSave;
- (void)performPruneTestBSSes:(id)a3;
- (void)processDatapathMetricStream:(id)a3 withDate:(id)a4;
- (void)processMetricAssociationFailure:(id)a3;
- (void)processMetricBeaconCache:(id)a3;
- (void)processMetricClientAssociation:(id)a3;
- (void)processMetricDiagnosticState:(id)a3;
- (void)processMetricFault:(id)a3;
- (void)processMetricHistoricalNetworkQuality:(id)a3;
- (void)processMetricIpV4Latency:(id)a3;
- (void)processMetricKnownNetworkEvent:(id)a3;
- (void)processMetricLinkChange:(id)a3;
- (void)processMetricLinkTest:(id)a3;
- (void)processMetricNetworkGeotag:(id)a3;
- (void)processMetricParsedBeaconInfo:(id)a3;
- (void)processMetricRecovery:(id)a3;
- (void)processMetricRoamStatus:(id)a3;
- (void)processMetricWiFiStats:(id)a3;
- (void)processWAMessageMetric:(id)a3 data:(id)a4;
- (void)setDateFormatterWAMessage:(id)a3;
- (void)setDeploymentMetricDiffDays:(unint64_t)a3;
- (void)setDeploymentMetricHandler:(id)a3;
- (void)setLinkChangePolicyHandler:(id)a3;
- (void)setManagedObjectHandler:(id)a3;
- (void)setNumRoamSamples:(unint64_t)a3;
- (void)setRoamPolicyHandler:(id)a3;
- (void)setTestDateDiffDays:(unint64_t)a3;
- (void)storeMetricStreamFragment:(id)a3 withDate:(id)a4;
@end

@implementation AnalyticsProcessor

+ (id)formattedMACAddressNotation:(id)a3 octetCount:(unint64_t)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a4 == 3)
  {
    v6 = @"xx:xx:xx:xx:xx:xx";
  }
  else
  {
    if (a4 != 6)
    {
      uint64_t v7 = 0;
      goto LABEL_7;
    }
    v6 = @"xx:xx:xx";
  }
  uint64_t v7 = [(__CFString *)v6 length];
LABEL_7:
  v8 = [v5 componentsSeparatedByString:@":"];
  v9 = v8;
  if (v7 && [v8 count] == a4)
  {
    v10 = [MEMORY[0x263EFF980] array];
    if (!a4)
    {
LABEL_13:
      id v16 = [v10 componentsJoinedByString:@":"];

      goto LABEL_14;
    }
    v11 = 0;
    while (1)
    {
      unsigned int v19 = 0;
      v12 = (void *)MEMORY[0x263F08B08];
      v13 = [v9 objectAtIndex:v11];
      v14 = [v12 scannerWithString:v13];

      [v14 scanHexInt:&v19];
      if (v19 == -1) {
        break;
      }
      v15 = objc_msgSend(NSString, "stringWithFormat:", @"%02x", v19);
      [v10 setObject:v15 atIndexedSubscript:v11];

      if ((char *)a4 == ++v11) {
        goto LABEL_13;
      }
    }
    v18 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v21 = "+[AnalyticsProcessor formattedMACAddressNotation:octetCount:]";
      __int16 v22 = 1024;
      int v23 = 226;
      __int16 v24 = 2048;
      v25 = v11;
      __int16 v26 = 2112;
      unint64_t v27 = (unint64_t)v5;
      _os_log_impl(&dword_21D96D000, v18, OS_LOG_TYPE_ERROR, "%{public}s::%d:No int value for octet %lu for %@", buf, 0x26u);
    }
  }
  else
  {
    v10 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v21 = "+[AnalyticsProcessor formattedMACAddressNotation:octetCount:]";
      __int16 v22 = 1024;
      int v23 = 220;
      __int16 v24 = 2112;
      v25 = (char *)v5;
      __int16 v26 = 2048;
      unint64_t v27 = a4;
      _os_log_impl(&dword_21D96D000, v10, OS_LOG_TYPE_ERROR, "%{public}s::%d:Cannot format %@ into %lu octets", buf, 0x26u);
    }
  }

  id v16 = (id)[v5 copy];
LABEL_14:

  return v16;
}

void __48__AnalyticsProcessor_apProfileForBssid_andSSID___block_invoke(void *a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (!a1[4])
  {
    v3 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    int v16 = 136446466;
    v17 = "-[AnalyticsProcessor apProfileForBssid:andSSID:]_block_invoke";
    __int16 v18 = 1024;
    int v19 = 1802;
    v12 = "%{public}s::%d:bssid is nil. bailing";
LABEL_15:
    _os_log_impl(&dword_21D96D000, v3, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v16, 0x12u);
    goto LABEL_8;
  }
  if (!a1[5])
  {
    v3 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    int v16 = 136446466;
    v17 = "-[AnalyticsProcessor apProfileForBssid:andSSID:]_block_invoke";
    __int16 v18 = 1024;
    int v19 = 1803;
    v12 = "%{public}s::%d:ssid is nil. bailing";
    goto LABEL_15;
  }
  uint64_t v2 = [(id)objc_opt_class() formattedMACAddressNotation:a1[4] octetCount:6];
  if (!v2)
  {
    v3 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      goto LABEL_8;
    }
    int v16 = 136446466;
    v17 = "-[AnalyticsProcessor apProfileForBssid:andSSID:]_block_invoke";
    __int16 v18 = 1024;
    int v19 = 1806;
    v12 = "%{public}s::%d:bssidFormatted nil";
    goto LABEL_15;
  }
  v3 = v2;
  v4 = +[BSSMO getInstance:v2 ssid:a1[5] moc:a1[6]];
  if (v4)
  {
    id v5 = v4;
    v6 = [v4 apProfileID];

    if (v6)
    {
      uint64_t v7 = NSString;
      v8 = [v5 apProfileID];
      uint64_t v9 = [v7 stringWithString:v8];
      uint64_t v10 = *(void *)(a1[7] + 8);
      v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;
    }
    else
    {
      v14 = WALogCategoryDeviceStoreHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = a1[5];
        int v16 = 136446978;
        v17 = "-[AnalyticsProcessor apProfileForBssid:andSSID:]_block_invoke";
        __int16 v18 = 1024;
        int v19 = 1810;
        __int16 v20 = 2112;
        v21 = v3;
        __int16 v22 = 2112;
        uint64_t v23 = v15;
        _os_log_impl(&dword_21D96D000, v14, OS_LOG_TYPE_ERROR, "%{public}s::%d:bssMO.apProfileID nil for bssid:%@ and SSID:%@", (uint8_t *)&v16, 0x26u);
      }
    }
  }
  else
  {
    id v5 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = a1[5];
      int v16 = 136446978;
      v17 = "-[AnalyticsProcessor apProfileForBssid:andSSID:]_block_invoke";
      __int16 v18 = 1024;
      int v19 = 1809;
      __int16 v20 = 2112;
      v21 = v3;
      __int16 v22 = 2112;
      uint64_t v23 = v13;
      _os_log_impl(&dword_21D96D000, v5, OS_LOG_TYPE_ERROR, "%{public}s::%d:bssMO nil for bssid:%@ and SSID:%@", (uint8_t *)&v16, 0x26u);
    }
  }

LABEL_8:
}

- (AnalyticsStoreMOHandler)managedObjectHandler
{
  return self->_managedObjectHandler;
}

- (id)apProfileForBssid:(id)a3 andSSID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(AnalyticsProcessor *)self managedObjectHandler];
  uint64_t v9 = [v8 managedObjectContext];

  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__0;
  uint64_t v24 = __Block_byref_object_dispose__0;
  id v25 = 0;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __48__AnalyticsProcessor_apProfileForBssid_andSSID___block_invoke;
  v15[3] = &unk_2644660C0;
  id v10 = v6;
  id v16 = v10;
  id v11 = v7;
  id v17 = v11;
  id v12 = v9;
  id v18 = v12;
  int v19 = &v20;
  [v12 performBlockAndWait:v15];
  id v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v13;
}

+ (id)sharedAnalyticsProcessor
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (!+[WAUtil isAnalyticsProcessorAllowed])
  {
    v4 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446466;
      id v7 = "+[AnalyticsProcessor sharedAnalyticsProcessor]";
      __int16 v8 = 1024;
      int v9 = 74;
      id v5 = "%{public}s::%d:Writing in the WiFi Analytics Store is disabled on this platform";
LABEL_14:
      _os_log_impl(&dword_21D96D000, v4, OS_LOG_TYPE_ERROR, v5, (uint8_t *)&v6, 0x12u);
    }
LABEL_15:

    id v2 = 0;
    goto LABEL_7;
  }
  if (!_MergedGlobals_0
    && !+[AnalyticsStoreMOHandler isStoreCompatible])
  {
    v4 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446466;
      id v7 = "+[AnalyticsProcessor sharedAnalyticsProcessor]";
      __int16 v8 = 1024;
      int v9 = 79;
      id v5 = "%{public}s::%d:Store needs migration - Wait for wifianalyticsd to complete migration and retry";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  if (qword_26AA93CA0 != -1) {
    dispatch_once(&qword_26AA93CA0, &__block_literal_global_0);
  }
  id v2 = (id)_MergedGlobals_0;
LABEL_7:
  return v2;
}

void __46__AnalyticsProcessor_sharedAnalyticsProcessor__block_invoke()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v0 = [[AnalyticsProcessor alloc] initWithOptions:0];
  v1 = (void *)_MergedGlobals_0;
  _MergedGlobals_0 = (uint64_t)v0;

  if (!_MergedGlobals_0)
  {
    id v2 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      int v3 = 136446466;
      v4 = "+[AnalyticsProcessor sharedAnalyticsProcessor]_block_invoke";
      __int16 v5 = 1024;
      int v6 = 84;
      _os_log_impl(&dword_21D96D000, v2, OS_LOG_TYPE_ERROR, "%{public}s::%d:AnalyticsProcessor failed to init -- Store unavailable to this process until reboot", (uint8_t *)&v3, 0x12u);
    }
  }
}

- (AnalyticsProcessor)initWithOptions:(unint64_t)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v23.receiver = self;
  v23.super_class = (Class)AnalyticsProcessor;
  v4 = [(AnalyticsProcessor *)&v23 init];
  if (v4)
  {
    __int16 v5 = WALogCategoryDeviceStoreHandle();
    if (os_signpost_enabled(v5))
    {
      *(_DWORD *)buf = 134217984;
      id v25 = (const char *)a3;
      _os_signpost_emit_with_name_impl(&dword_21D96D000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor initWithOptions", "options=%lu", buf, 0xCu);
    }

    int v6 = WALogCategoryDeviceStoreHandle();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if ((a3 & 2) != 0)
    {
      if (v7)
      {
        *(_DWORD *)buf = 136446466;
        id v25 = "-[AnalyticsProcessor initWithOptions:]";
        __int16 v26 = 1024;
        int v27 = 107;
        _os_log_impl(&dword_21D96D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Initing AnalyticsStoreMOHandler with AnalyticsProcessorMigrationCapable - this should only be proc wifianalyticsd", buf, 0x12u);
      }

      if (a3)
      {
        id v13 = WALogCategoryDeviceStoreHandle();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          id v25 = "-[AnalyticsProcessor initWithOptions:]";
          __int16 v26 = 1024;
          int v27 = 111;
          _os_log_impl(&dword_21D96D000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Options have AnalyticsProcessorEnableXPCStore, setting AnalyticsStoreMOSetupXPCStore", buf, 0x12u);
        }

        uint64_t v12 = 3;
      }
      else
      {
        uint64_t v12 = 2;
      }
      v14 = WALogCategoryDeviceStoreHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        id v25 = "-[AnalyticsProcessor initWithOptions:]";
        __int16 v26 = 1024;
        int v27 = 116;
        _os_log_impl(&dword_21D96D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Options have AnalyticsProcessorMigrationCapable, setting AnalyticsStoreMOMigration", buf, 0x12u);
      }

      uint64_t v15 = [[AnalyticsStoreMOHandler alloc] initWithType:1 options:v12];
      managedObjectHandler = v4->_managedObjectHandler;
      v4->_managedObjectHandler = v15;

      if (!v4->_managedObjectHandler)
      {
        p_super = WALogCategoryDeviceStoreHandle();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446722;
          id v25 = "-[AnalyticsProcessor initWithOptions:]";
          __int16 v26 = 1024;
          int v27 = 122;
          __int16 v28 = 2048;
          unint64_t v29 = a3;
          id v11 = "%{public}s::%d:Error getting managedObjectHandler with options %lu";
          uint64_t v20 = p_super;
          uint32_t v21 = 28;
          goto LABEL_30;
        }
        goto LABEL_31;
      }
    }
    else
    {
      if (v7)
      {
        *(_DWORD *)buf = 136446466;
        id v25 = "-[AnalyticsProcessor initWithOptions:]";
        __int16 v26 = 1024;
        int v27 = 125;
        _os_log_impl(&dword_21D96D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Initting AnalyticsStoreMOHandler attempting to reuse existing instance for this pid", buf, 0x12u);
      }

      uint64_t v8 = +[AnalyticsStoreMOHandler sharedAnalyticsStoreMOHandlerWithPersist];
      int v9 = v4->_managedObjectHandler;
      v4->_managedObjectHandler = (AnalyticsStoreMOHandler *)v8;

      if (!v4->_managedObjectHandler)
      {
        p_super = WALogCategoryDeviceStoreHandle();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446466;
          id v25 = "-[AnalyticsProcessor initWithOptions:]";
          __int16 v26 = 1024;
          int v27 = 133;
          id v11 = "%{public}s::%d:Error getting sharedAnalyticsStoreMOHandlerWithPersist";
LABEL_27:
          uint64_t v20 = p_super;
          uint32_t v21 = 18;
LABEL_30:
          _os_log_impl(&dword_21D96D000, v20, OS_LOG_TYPE_ERROR, v11, buf, v21);
          goto LABEL_31;
        }
        goto LABEL_31;
      }
    }
    BOOL v17 = [(AnalyticsProcessor *)v4 initCommmonObjects];
    id v18 = WALogCategoryDeviceStoreHandle();
    p_super = v18;
    if (v17)
    {
      if (os_signpost_enabled(v18))
      {
        *(_DWORD *)buf = 134217984;
        id v25 = (const char *)a3;
        _os_signpost_emit_with_name_impl(&dword_21D96D000, p_super, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor initWithOptions", "options=%lu", buf, 0xCu);
      }
      goto LABEL_23;
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      id v25 = "-[AnalyticsProcessor initWithOptions:]";
      __int16 v26 = 1024;
      int v27 = 142;
      id v11 = "%{public}s::%d:Error creating initCommmonObjects";
      goto LABEL_27;
    }
LABEL_31:

    uint64_t v22 = WALogCategoryDeviceStoreHandle();
    if (os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_21D96D000, v22, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor initWithOptions", "Error in Init", buf, 2u);
    }

    p_super = &v4->super;
    v4 = 0;
LABEL_23:
  }
  return v4;
}

- (AnalyticsProcessor)initWithOptions:(unint64_t)a3 byoMOC:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  BOOL v7 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v7))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor initWithOptionsAndMOC", "", (uint8_t *)&v11, 2u);
  }

  if (a4)
  {
    self = [(AnalyticsProcessor *)self initWithOptions:a3];
    uint64_t v8 = self;
  }
  else
  {
    uint64_t v10 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136446466;
      uint64_t v12 = "-[AnalyticsProcessor initWithOptions:byoMOC:]";
      __int16 v13 = 1024;
      int v14 = 159;
      _os_log_impl(&dword_21D96D000, v10, OS_LOG_TYPE_ERROR, "%{public}s::%d:Error with byoMOC", (uint8_t *)&v11, 0x12u);
    }

    uint64_t v8 = 0;
  }

  return v8;
}

- (BOOL)initCommmonObjects
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (!+[WAUtil isAnalyticsProcessorAllowed])
  {
    uint64_t v10 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    int v12 = 136446466;
    __int16 v13 = "-[AnalyticsProcessor initCommmonObjects]";
    __int16 v14 = 1024;
    int v15 = 170;
    int v11 = "%{public}s::%d:Writing in the WiFi Analytics Store is disabled on this platform";
LABEL_15:
    _os_log_impl(&dword_21D96D000, v10, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v12, 0x12u);
    goto LABEL_16;
  }
  int v3 = [[RoamPolicyStore alloc] initWithAnalyticsStore:self->_managedObjectHandler];
  roamPolicyHandler = self->_roamPolicyHandler;
  self->_roamPolicyHandler = v3;

  if (!self->_roamPolicyHandler)
  {
    uint64_t v10 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    int v12 = 136446466;
    __int16 v13 = "-[AnalyticsProcessor initCommmonObjects]";
    __int16 v14 = 1024;
    int v15 = 173;
    int v11 = "%{public}s::%d:Error getting _roamPolicyHandler";
    goto LABEL_15;
  }
  __int16 v5 = [[LinkChangePolicyHandler alloc] initWithAnalyticsStore:self->_managedObjectHandler];
  linkChangePolicyHandler = self->_linkChangePolicyHandler;
  self->_linkChangePolicyHandler = v5;

  if (!self->_linkChangePolicyHandler)
  {
    uint64_t v10 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    int v12 = 136446466;
    __int16 v13 = "-[AnalyticsProcessor initCommmonObjects]";
    __int16 v14 = 1024;
    int v15 = 176;
    int v11 = "%{public}s::%d:Error getting _linkChangePolicyHandler";
    goto LABEL_15;
  }
  BOOL v7 = [[DeploymentMetricHandler alloc] initWithAnalyticsStore:self->_managedObjectHandler];
  deploymentMetricHandler = self->_deploymentMetricHandler;
  self->_deploymentMetricHandler = v7;

  if (!self->_deploymentMetricHandler)
  {
    uint64_t v10 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136446466;
      __int16 v13 = "-[AnalyticsProcessor initCommmonObjects]";
      __int16 v14 = 1024;
      int v15 = 179;
      int v11 = "%{public}s::%d:Error getting _deploymentMetricHandler";
      goto LABEL_15;
    }
LABEL_16:

    return 0;
  }
  self->_numRoamSamples = 0;
  *(_OWORD *)&self->_testDateDiffDays = xmmword_21DA6C7D0;
  return 1;
}

- (id)formattedNotation:(id)a3 octetCount:(unint64_t)a4
{
  id v5 = a3;
  int v6 = [(id)objc_opt_class() formattedMACAddressNotation:v5 octetCount:a4];

  return v6;
}

- (BOOL)unpackRssiSnrCCAFromRssiMetricField:(id)a3 unpackedRssi:(id *)a4 unpackedCca:(id *)a5 unpackedSnr:(id *)a6
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v9 = a3;
  uint64_t v10 = v9;
  if (!v9)
  {
    uint64_t v24 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v32 = "-[AnalyticsProcessor unpackRssiSnrCCAFromRssiMetricField:unpackedRssi:unpackedCca:unpackedSnr:]";
      __int16 v33 = 1024;
      int v34 = 246;
      id v25 = "%{public}s::%d:packedRssi nil";
      goto LABEL_25;
    }
    goto LABEL_26;
  }
  if (!a4 || !*a4)
  {
    uint64_t v24 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      goto LABEL_26;
    }
    *(_DWORD *)buf = 136446466;
    v32 = "-[AnalyticsProcessor unpackRssiSnrCCAFromRssiMetricField:unpackedRssi:unpackedCca:unpackedSnr:]";
    __int16 v33 = 1024;
    int v34 = 247;
    id v25 = "%{public}s::%d:rssiArray nil";
LABEL_25:
    _os_log_impl(&dword_21D96D000, v24, OS_LOG_TYPE_ERROR, v25, buf, 0x12u);
    goto LABEL_26;
  }
  if (!a5 || !*a5)
  {
    uint64_t v24 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      goto LABEL_26;
    }
    *(_DWORD *)buf = 136446466;
    v32 = "-[AnalyticsProcessor unpackRssiSnrCCAFromRssiMetricField:unpackedRssi:unpackedCca:unpackedSnr:]";
    __int16 v33 = 1024;
    int v34 = 248;
    id v25 = "%{public}s::%d:ccaArray nil";
    goto LABEL_25;
  }
  if (!a6 || !*a6)
  {
    uint64_t v24 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v32 = "-[AnalyticsProcessor unpackRssiSnrCCAFromRssiMetricField:unpackedRssi:unpackedCca:unpackedSnr:]";
      __int16 v33 = 1024;
      int v34 = 249;
      id v25 = "%{public}s::%d:snrArray nil";
      goto LABEL_25;
    }
LABEL_26:

    BOOL v22 = 0;
    goto LABEL_16;
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v10);
        }
        char v15 = [*(id *)(*((void *)&v26 + 1) + 8 * i) intValue];
        id v16 = *a4;
        BOOL v17 = [NSNumber numberWithInt:v15];
        [v16 addObject:v17];

        id v18 = *a5;
        int v19 = [NSNumber numberWithInt:0];
        [v18 addObject:v19];

        id v20 = *a6;
        uint32_t v21 = [NSNumber numberWithInt:0];
        [v20 addObject:v21];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v12);
  }
  BOOL v22 = 1;
LABEL_16:

  return v22;
}

- (id)getDateFromDateString:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = [(AnalyticsProcessor *)self dateFormatterWAMessage];
    int v6 = [v5 dateFromString:v4];

    if ([(AnalyticsProcessor *)self testDateDiffDays] && v6)
    {
      unint64_t v7 = [(AnalyticsProcessor *)self testDateDiffDays];
      id v8 = objc_alloc_init(MEMORY[0x263EFF918]);
      [v8 setDay:-(uint64_t)v7];
      id v9 = [MEMORY[0x263EFF8F0] currentCalendar];
      uint64_t v10 = [v9 dateByAddingComponents:v8 toDate:v6 options:0];

      int v6 = (void *)v10;
    }
  }
  else
  {
    uint64_t v12 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136446466;
      __int16 v14 = "-[AnalyticsProcessor getDateFromDateString:]";
      __int16 v15 = 1024;
      int v16 = 269;
      _os_log_impl(&dword_21D96D000, v12, OS_LOG_TYPE_ERROR, "%{public}s::%d:string nil", (uint8_t *)&v13, 0x12u);
    }

    int v6 = 0;
  }

  return v6;
}

- (void)processWAMessageMetric:(id)a3 data:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  int v6 = (char *)a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x223C0F2E0]();
  id v9 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v32 = "-[AnalyticsProcessor processWAMessageMetric:data:]";
    __int16 v33 = 1024;
    int v34 = 287;
    __int16 v35 = 2112;
    v36 = v6;
    _os_log_impl(&dword_21D96D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Processing metric: %@", buf, 0x1Cu);
  }

  uint64_t v10 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v10))
  {
    *(_DWORD *)buf = 138412290;
    v32 = v6;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processWAMessageMetric", "metricName:%@", buf, 0xCu);
  }

  if (([v6 isEqualToString:@"com.apple.wifi.PowerState"] & 1) == 0)
  {
    if ([v6 isEqualToString:@"com.apple.wifi.KnownNetworkEvent"])
    {
      uint64_t v11 = [(AnalyticsProcessor *)self managedObjectHandler];
      uint64_t v12 = v11;
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __50__AnalyticsProcessor_processWAMessageMetric_data___block_invoke;
      v30[3] = &unk_264465FF8;
      v30[4] = self;
      int v13 = v30;
LABEL_36:
      [v11 performBlockOnManagedObjectContext:v7 block:v13];

      goto LABEL_37;
    }
    if ([v6 isEqualToString:@"com.apple.wifi.Ipv4Latency"])
    {
      uint64_t v11 = [(AnalyticsProcessor *)self managedObjectHandler];
      uint64_t v12 = v11;
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __50__AnalyticsProcessor_processWAMessageMetric_data___block_invoke_2;
      v29[3] = &unk_264465FF8;
      v29[4] = self;
      int v13 = v29;
      goto LABEL_36;
    }
    if ([v6 isEqualToString:@"com.apple.wifi.RoamStatus"])
    {
      uint64_t v11 = [(AnalyticsProcessor *)self managedObjectHandler];
      uint64_t v12 = v11;
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __50__AnalyticsProcessor_processWAMessageMetric_data___block_invoke_3;
      v28[3] = &unk_264465FF8;
      v28[4] = self;
      int v13 = v28;
      goto LABEL_36;
    }
    if ([v6 isEqualToString:@"com.apple.wifi.LinkChange"])
    {
      uint64_t v11 = [(AnalyticsProcessor *)self managedObjectHandler];
      uint64_t v12 = v11;
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __50__AnalyticsProcessor_processWAMessageMetric_data___block_invoke_4;
      v27[3] = &unk_264465FF8;
      v27[4] = self;
      int v13 = v27;
      goto LABEL_36;
    }
    if ([v6 isEqualToString:@"com.apple.wifi.AssociationFailure"])
    {
      uint64_t v11 = [(AnalyticsProcessor *)self managedObjectHandler];
      uint64_t v12 = v11;
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __50__AnalyticsProcessor_processWAMessageMetric_data___block_invoke_5;
      v26[3] = &unk_264465FF8;
      v26[4] = self;
      int v13 = v26;
      goto LABEL_36;
    }
    if ([v6 isEqualToString:@"com.apple.wifi.NetworkGeotag"])
    {
      uint64_t v11 = [(AnalyticsProcessor *)self managedObjectHandler];
      uint64_t v12 = v11;
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __50__AnalyticsProcessor_processWAMessageMetric_data___block_invoke_6;
      v25[3] = &unk_264465FF8;
      v25[4] = self;
      int v13 = v25;
      goto LABEL_36;
    }
    if ([v6 isEqualToString:@"com.apple.wifi.ClientAssociation"])
    {
      uint64_t v11 = [(AnalyticsProcessor *)self managedObjectHandler];
      uint64_t v12 = v11;
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __50__AnalyticsProcessor_processWAMessageMetric_data___block_invoke_7;
      v24[3] = &unk_264465FF8;
      v24[4] = self;
      int v13 = v24;
      goto LABEL_36;
    }
    if ([v6 isEqualToString:@"com.apple.wifi.ParsedBeaconInfo"])
    {
      uint64_t v11 = [(AnalyticsProcessor *)self managedObjectHandler];
      uint64_t v12 = v11;
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __50__AnalyticsProcessor_processWAMessageMetric_data___block_invoke_8;
      v23[3] = &unk_264465FF8;
      v23[4] = self;
      int v13 = v23;
      goto LABEL_36;
    }
    if ([v6 isEqualToString:@"com.apple.wifi.HistoricalKnownNetworkQuality"])
    {
      uint64_t v11 = [(AnalyticsProcessor *)self managedObjectHandler];
      uint64_t v12 = v11;
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __50__AnalyticsProcessor_processWAMessageMetric_data___block_invoke_9;
      v22[3] = &unk_264465FF8;
      v22[4] = self;
      int v13 = v22;
      goto LABEL_36;
    }
    if ([v6 isEqualToString:@"com.apple.wifi.BeaconCache"])
    {
      uint64_t v11 = [(AnalyticsProcessor *)self managedObjectHandler];
      uint64_t v12 = v11;
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __50__AnalyticsProcessor_processWAMessageMetric_data___block_invoke_10;
      v21[3] = &unk_264465FF8;
      v21[4] = self;
      int v13 = v21;
      goto LABEL_36;
    }
    if ([v6 isEqualToString:@"com.apple.wifi.Fault"])
    {
      uint64_t v11 = [(AnalyticsProcessor *)self managedObjectHandler];
      uint64_t v12 = v11;
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __50__AnalyticsProcessor_processWAMessageMetric_data___block_invoke_11;
      v20[3] = &unk_264465FF8;
      v20[4] = self;
      int v13 = v20;
      goto LABEL_36;
    }
    if ([v6 isEqualToString:@"com.apple.wifi.Recovery"])
    {
      uint64_t v11 = [(AnalyticsProcessor *)self managedObjectHandler];
      uint64_t v12 = v11;
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __50__AnalyticsProcessor_processWAMessageMetric_data___block_invoke_12;
      v19[3] = &unk_264465FF8;
      v19[4] = self;
      int v13 = v19;
      goto LABEL_36;
    }
    if ([v6 isEqualToString:@"com.apple.wifi.LinkTest"])
    {
      uint64_t v11 = [(AnalyticsProcessor *)self managedObjectHandler];
      uint64_t v12 = v11;
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __50__AnalyticsProcessor_processWAMessageMetric_data___block_invoke_13;
      v18[3] = &unk_264465FF8;
      v18[4] = self;
      int v13 = v18;
      goto LABEL_36;
    }
    if ([v6 isEqualToString:@"com.apple.wifi.WiFiStats"])
    {
      uint64_t v11 = [(AnalyticsProcessor *)self managedObjectHandler];
      uint64_t v12 = v11;
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __50__AnalyticsProcessor_processWAMessageMetric_data___block_invoke_14;
      v17[3] = &unk_264465FF8;
      v17[4] = self;
      int v13 = v17;
      goto LABEL_36;
    }
    if ([v6 isEqualToString:@"com.apple.wifi.DiagnosticState"])
    {
      uint64_t v11 = [(AnalyticsProcessor *)self managedObjectHandler];
      uint64_t v12 = v11;
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __50__AnalyticsProcessor_processWAMessageMetric_data___block_invoke_15;
      v16[3] = &unk_264465FF8;
      v16[4] = self;
      int v13 = v16;
      goto LABEL_36;
    }
    __int16 v15 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v32 = "-[AnalyticsProcessor processWAMessageMetric:data:]";
      __int16 v33 = 1024;
      int v34 = 377;
      __int16 v35 = 2112;
      v36 = v6;
      _os_log_impl(&dword_21D96D000, v15, OS_LOG_TYPE_ERROR, "%{public}s::%d:Unhandled metric %@", buf, 0x1Cu);
    }
  }
LABEL_37:
  __int16 v14 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v14))
  {
    *(_DWORD *)buf = 138412290;
    v32 = v6;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v14, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processWAMessageMetric", "metricName:%@", buf, 0xCu);
  }
}

uint64_t __50__AnalyticsProcessor_processWAMessageMetric_data___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) processMetricKnownNetworkEvent:a2];
}

uint64_t __50__AnalyticsProcessor_processWAMessageMetric_data___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) processMetricIpV4Latency:a2];
}

uint64_t __50__AnalyticsProcessor_processWAMessageMetric_data___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) processMetricRoamStatus:a2];
}

uint64_t __50__AnalyticsProcessor_processWAMessageMetric_data___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) processMetricLinkChange:a2];
}

uint64_t __50__AnalyticsProcessor_processWAMessageMetric_data___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) processMetricAssociationFailure:a2];
}

uint64_t __50__AnalyticsProcessor_processWAMessageMetric_data___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) processMetricNetworkGeotag:a2];
}

uint64_t __50__AnalyticsProcessor_processWAMessageMetric_data___block_invoke_7(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) processMetricClientAssociation:a2];
}

uint64_t __50__AnalyticsProcessor_processWAMessageMetric_data___block_invoke_8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) processMetricParsedBeaconInfo:a2];
}

uint64_t __50__AnalyticsProcessor_processWAMessageMetric_data___block_invoke_9(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) processMetricHistoricalNetworkQuality:a2];
}

uint64_t __50__AnalyticsProcessor_processWAMessageMetric_data___block_invoke_10(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) processMetricBeaconCache:a2];
}

uint64_t __50__AnalyticsProcessor_processWAMessageMetric_data___block_invoke_11(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) processMetricFault:a2];
}

uint64_t __50__AnalyticsProcessor_processWAMessageMetric_data___block_invoke_12(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) processMetricRecovery:a2];
}

uint64_t __50__AnalyticsProcessor_processWAMessageMetric_data___block_invoke_13(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) processMetricLinkTest:a2];
}

uint64_t __50__AnalyticsProcessor_processWAMessageMetric_data___block_invoke_14(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) processMetricWiFiStats:a2];
}

uint64_t __50__AnalyticsProcessor_processWAMessageMetric_data___block_invoke_15(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) processMetricDiagnosticState:a2];
}

- (void)processMetricKnownNetworkEvent:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 valueForKey:@"eventType"];
  unsigned int v6 = [v5 unsignedIntValue];

  id v7 = [v4 valueForKey:@"networkTypeBitMap"];
  int v8 = [v7 unsignedIntValue];

  id v9 = [v4 valueForKey:@"networkAuthFlags"];
  int v10 = [v9 unsignedIntValue];

  uint64_t v11 = [v4 valueForKey:@"oui"];
  uint64_t v12 = [(AnalyticsProcessor *)self formattedNotation:v11 octetCount:3];

  int v13 = [v4 valueForKey:@"ssid"];
  __int16 v14 = [v4 valueForKey:@"bssid"];

  __int16 v15 = [(AnalyticsProcessor *)self formattedNotation:v14 octetCount:6];

  int v16 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    int v27 = 136448002;
    long long v28 = "-[AnalyticsProcessor processMetricKnownNetworkEvent:]";
    __int16 v29 = 1024;
    int v30 = 395;
    __int16 v31 = 1024;
    *(_DWORD *)v32 = v6;
    *(_WORD *)&v32[4] = 1024;
    *(_DWORD *)&v32[6] = v8;
    LOWORD(v33) = 1024;
    *(_DWORD *)((char *)&v33 + 2) = v10;
    HIWORD(v33) = 2112;
    int v34 = v12;
    __int16 v35 = 2112;
    v36 = v13;
    __int16 v37 = 2112;
    v38 = v15;
    _os_log_impl(&dword_21D96D000, v16, OS_LOG_TYPE_DEBUG, "%{public}s::%d:eventType:%d networkTypeBitMap:%d networkSecurity:%d oui:%@ ssid:%@ bssid:%@", (uint8_t *)&v27, 0x42u);
  }

  if (v6 <= 0xD && ((1 << v6) & 0x3694) != 0 && v13)
  {
    uint64_t v17 = WALogCategoryDeviceStoreHandle();
    if (os_signpost_enabled(v17))
    {
      int v27 = 67109120;
      LODWORD(v28) = v6;
      _os_signpost_emit_with_name_impl(&dword_21D96D000, v17, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricKnownNetworkEvent", "eventType:%d", (uint8_t *)&v27, 8u);
    }

    id v18 = [(AnalyticsProcessor *)self managedObjectHandler];
    int v19 = [v18 managedObjectContext];
    id v20 = +[NetworkMO getInstance:v13 moc:v19];

    if (v20)
    {
      [v20 setSwitchedToCount:0];
      [v20 setSwitchedAwayFromCount:0];
    }
    uint32_t v21 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v22 = "sucess";
      long long v28 = "-[AnalyticsProcessor processMetricKnownNetworkEvent:]";
      __int16 v29 = 1024;
      int v30 = 430;
      int v27 = 136446978;
      if (!v20) {
        BOOL v22 = "failed";
      }
      __int16 v31 = 2112;
      *(void *)v32 = v13;
      *(_WORD *)&v32[8] = 2080;
      __int16 v33 = v22;
      _os_log_impl(&dword_21D96D000, v21, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Resetting user preferences for ssid:%@ %s", (uint8_t *)&v27, 0x26u);
    }

    objc_super v23 = WALogCategoryDeviceStoreHandle();
    if (os_signpost_enabled(v23))
    {
      int v27 = 67109120;
      LODWORD(v28) = v6;
      _os_signpost_emit_with_name_impl(&dword_21D96D000, v23, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricKnownNetworkEvent", "eventType:%d", (uint8_t *)&v27, 8u);
    }

    if (v20)
    {
      uint64_t v24 = [(AnalyticsProcessor *)self managedObjectHandler];
      [v24 saveManagedObjectContext];

      id v25 = [(AnalyticsProcessor *)self managedObjectHandler];
      long long v26 = [v25 managedObjectContext];
      [v26 reset];
    }
  }
}

- (void)processMetricIpV4Latency:(id)a3
{
  *(void *)&v66[5] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricIpV4Latency", "", buf, 2u);
  }

  unsigned int v6 = [v4 valueForKey:@"dhcpLatencyMilliSecs"];
  uint64_t v7 = [v6 unsignedIntValue];

  int v8 = [v4 valueForKey:@"networkAuthFlags"];
  uint64_t v9 = [v8 unsignedIntValue];

  int v10 = [v4 valueForKey:@"dhcpLeaseMins"];
  uint64_t v11 = [v10 unsignedIntValue];

  uint64_t v12 = [v4 valueForKey:@"success"];
  uint64_t v13 = [v12 BOOLValue];

  __int16 v14 = [v4 valueForKey:@"ssid"];
  __int16 v15 = [v4 valueForKey:@"bssid"];
  uint64_t v16 = [(AnalyticsProcessor *)self formattedNotation:v15 octetCount:6];

  uint64_t v17 = (void *)v16;
  v55 = [v4 valueForKey:@"dhcpAddresses"];

  id v18 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136448002;
    v58 = "-[AnalyticsProcessor processMetricIpV4Latency:]";
    __int16 v59 = 1024;
    int v60 = 457;
    __int16 v61 = 1024;
    *(_DWORD *)v62 = v7;
    *(_WORD *)&v62[4] = 1024;
    *(_DWORD *)&v62[6] = v9;
    LOWORD(v63) = 1024;
    *(_DWORD *)((char *)&v63 + 2) = v11;
    HIWORD(v63) = 1024;
    *(_DWORD *)v64 = v13;
    *(_WORD *)&v64[4] = 2112;
    v65 = v14;
    LOWORD(v66[0]) = 2112;
    *(void *)((char *)v66 + 2) = v16;
    _os_log_impl(&dword_21D96D000, v18, OS_LOG_TYPE_DEBUG, "%{public}s::%d:dhcpLatencyMilliSecs:%d securityType:%d dhcpLeaseMins:%d successful:%d ssid:%@ bssid:%@", buf, 0x3Eu);
  }

  int v19 = [(AnalyticsProcessor *)self managedObjectHandler];
  id v20 = [v19 managedObjectContext];
  uint32_t v21 = +[BSSMO getInstance:v17 ssid:v14 moc:v20];

  if (v21)
  {
    [(AnalyticsProcessor *)self managedObjectHandler];
    v23 = BOOL v22 = v14;
    uint64_t v24 = [v23 managedObjectContext];
    id v25 = v17;
    long long v26 = (void *)v24;
    v54 = v25;
    v56 = v22;
    int v27 = +[JoinMO mostRecentJoin:ssid:moc:](JoinMO, "mostRecentJoin:ssid:moc:");

    if (v27)
    {
      [v27 setDhcpSuccess:v13];
      [v27 setDhcpLatencyMs:v7];
      [v27 setDhcpLeaseMins:v11];
      long long v28 = v55;
      if (v55)
      {
        __int16 v29 = [v55 valueForKey:@"IO80211InterfaceIPV4Address"];
        int v30 = [v55 valueForKey:@"IO80211InterfaceIPV4RouterAddress"];
        __int16 v31 = [v55 valueForKey:@"IO80211InterfaceRouterMACAddress"];
        v32 = [(AnalyticsProcessor *)self formattedNotation:v31 octetCount:6];

        -[NSObject setIpv4Addr:](v27, "setIpv4Addr:", [v29 unsignedIntValue]);
        -[NSObject setIpv4routerAddr:](v27, "setIpv4routerAddr:", [v30 unsignedIntValue]);
        [v27 setRouterMAC:v32];

        __int16 v33 = [v21 network];
        [v33 setAuthFlags:v9];

        int v34 = [(AnalyticsProcessor *)self managedObjectHandler];
        [v34 updateManagedObjectContextWithoutSave];

        __int16 v35 = WALogCategoryDeviceStoreHandle();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          v36 = [v27 date];
          __int16 v37 = [v21 bssid];
          int v38 = [v27 ipv4Addr];
          int v39 = [v27 ipv4routerAddr];
          v40 = [v27 routerMAC];
          *(_DWORD *)buf = 136447746;
          v58 = "-[AnalyticsProcessor processMetricIpV4Latency:]";
          __int16 v59 = 1024;
          int v60 = 488;
          __int16 v61 = 2112;
          *(void *)v62 = v36;
          *(_WORD *)&v62[8] = 2112;
          v63 = v37;
          *(_WORD *)v64 = 1024;
          *(_DWORD *)&v64[2] = v38;
          LOWORD(v65) = 1024;
          *(_DWORD *)((char *)&v65 + 2) = v39;
          HIWORD(v65) = 2112;
          *(void *)v66 = v40;
          _os_log_impl(&dword_21D96D000, v35, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Set the IPv4 latency to the Join[%@] for BSS[%@] ipv4Addr:0x%x routerIpv4Addr:0x%x routerMAC:%@", buf, 0x3Cu);
        }
        v41 = [(AnalyticsProcessor *)self linkChangePolicyHandler];
        v42 = [v21 bssid];
        uint64_t v43 = [v27 ipv4Addr];
        uint64_t v44 = [v27 ipv4routerAddr];
        v45 = [v27 routerMAC];
        [v41 checkAndApplyColocatedNetworkScope:v56 bssid:v42 ipAddr:v43 routerIp:v44 routerMAC:v45];
      }
      else
      {
        v46 = [v21 network];
        [v46 setAuthFlags:v9];

        v47 = [(AnalyticsProcessor *)self managedObjectHandler];
        [v47 updateManagedObjectContextWithoutSave];

        v41 = WALogCategoryDeviceStoreHandle();
        if (!os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        {
LABEL_14:
          uint64_t v17 = v54;

          v49 = [(AnalyticsProcessor *)self managedObjectHandler];
          [v49 saveManagedObjectContext];

          v50 = [(AnalyticsProcessor *)self managedObjectHandler];
          v51 = [v50 managedObjectContext];
          [v51 reset];

          __int16 v14 = v56;
          goto LABEL_15;
        }
        v42 = [v27 date];
        v48 = [v21 bssid];
        *(_DWORD *)buf = 136446978;
        v58 = "-[AnalyticsProcessor processMetricIpV4Latency:]";
        __int16 v59 = 1024;
        int v60 = 486;
        __int16 v61 = 2112;
        *(void *)v62 = v42;
        *(_WORD *)&v62[8] = 2112;
        v63 = v48;
        _os_log_impl(&dword_21D96D000, v41, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Set the IPv4 latency to the Join[%@] for BSS[%@]", buf, 0x26u);
      }
      goto LABEL_14;
    }
    int v27 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      __int16 v14 = v56;
      uint64_t v17 = v54;
      goto LABEL_24;
    }
    *(_DWORD *)buf = 136446978;
    v58 = "-[AnalyticsProcessor processMetricIpV4Latency:]";
    __int16 v59 = 1024;
    int v60 = 464;
    __int16 v61 = 2112;
    __int16 v14 = v56;
    *(void *)v62 = v56;
    *(_WORD *)&v62[8] = 2112;
    uint64_t v17 = v54;
    v63 = v54;
    v53 = "%{public}s::%d:joinMO nil for %@[%@]";
    goto LABEL_22;
  }
  int v27 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446978;
    v58 = "-[AnalyticsProcessor processMetricIpV4Latency:]";
    __int16 v59 = 1024;
    int v60 = 461;
    __int16 v61 = 2112;
    *(void *)v62 = v14;
    *(_WORD *)&v62[8] = 2112;
    v63 = v17;
    v53 = "%{public}s::%d:bssMO nil for %@[%@]";
LABEL_22:
    _os_log_impl(&dword_21D96D000, v27, OS_LOG_TYPE_ERROR, v53, buf, 0x26u);
  }
LABEL_24:
  long long v28 = v55;
LABEL_15:

  v52 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v52))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v52, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricIpV4Latency", "", buf, 2u);
  }
}

- (void)processMetricRoamStatus:(id)a3
{
  uint64_t v219 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v5))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricRoamStatus", "", (uint8_t *)&buf, 2u);
  }

  unsigned int v6 = [v4 valueForKey:@"originAddr"];
  uint64_t v7 = [(AnalyticsProcessor *)self formattedNotation:v6 octetCount:6];

  int v8 = [v4 valueForKey:@"targetAddr"];
  uint64_t v9 = [(AnalyticsProcessor *)self formattedNotation:v8 octetCount:6];

  if (+[WAUtil isWildcardMacAddress:v7])
  {
    v155 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v155, OS_LOG_TYPE_ERROR)) {
      goto LABEL_93;
    }
    int buf = 136446722;
    v210 = "-[AnalyticsProcessor processMetricRoamStatus:]";
    __int16 v211 = 1024;
    int v212 = 507;
    __int16 v213 = 2112;
    v214[0] = v7;
    v157 = "%{public}s::%d:originAddr(%@) is the wildcard address!! bailing";
    goto LABEL_101;
  }
  if (+[WAUtil isWildcardMacAddress:v9])
  {
    v155 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v155, OS_LOG_TYPE_ERROR)) {
      goto LABEL_93;
    }
    int buf = 136446722;
    v210 = "-[AnalyticsProcessor processMetricRoamStatus:]";
    __int16 v211 = 1024;
    int v212 = 508;
    __int16 v213 = 2112;
    v214[0] = v9;
    v157 = "%{public}s::%d:targetAddr(%@) is the wildcard address!! bailing";
LABEL_101:
    v158 = v155;
    uint32_t v159 = 28;
    goto LABEL_104;
  }
  if ([v7 isEqualToString:v9])
  {
    v155 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v155, OS_LOG_TYPE_ERROR)) {
      goto LABEL_93;
    }
    int buf = 136446466;
    v210 = "-[AnalyticsProcessor processMetricRoamStatus:]";
    __int16 v211 = 1024;
    int v212 = 509;
    v157 = "%{public}s::%d:ignoring roam status with identical origin and targetAddr";
    v158 = v155;
    uint32_t v159 = 18;
LABEL_104:
    _os_log_impl(&dword_21D96D000, v158, OS_LOG_TYPE_ERROR, v157, (uint8_t *)&buf, v159);
    goto LABEL_93;
  }
  int v10 = [v4 valueForKey:@"timeStarted"];
  uint64_t v11 = [v10 longLongValue];

  uint64_t v12 = [v4 valueForKey:@"timeEnded"];
  uint64_t v198 = [v12 longLongValue];

  uint64_t v13 = [v4 valueForKey:@"networkAuthFlags"];
  unsigned int v14 = [v13 unsignedIntValue];

  __int16 v15 = [v4 valueForKey:@"roamFlags"];
  int v16 = [v15 unsignedIntValue];

  uint64_t v17 = [v4 valueForKey:@"status"];
  uint64_t v180 = [v17 intValue];

  id v18 = [v4 valueForKey:@"reason"];
  unsigned int v196 = [v18 intValue];

  int v19 = [v4 valueForKey:@"profileType"];
  int v20 = [v19 intValue];

  uint32_t v21 = [v4 valueForKey:@"originRssi"];
  int v192 = [v21 intValue];

  BOOL v22 = [v4 valueForKey:@"targetRssi"];
  int v194 = [v22 intValue];

  objc_super v23 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    int buf = 136448770;
    v210 = "-[AnalyticsProcessor processMetricRoamStatus:]";
    __int16 v211 = 1024;
    int v212 = 522;
    __int16 v213 = 2048;
    v214[0] = v11;
    LOWORD(v214[1]) = 2048;
    *(void *)((char *)&v214[1] + 2) = v198;
    WORD1(v214[2]) = 1024;
    HIDWORD(v214[2]) = v14;
    LOWORD(v214[3]) = 1024;
    *(_DWORD *)((char *)&v214[3] + 2) = v16;
    HIWORD(v214[3]) = 1024;
    LODWORD(v214[4]) = v180;
    WORD2(v214[4]) = 1024;
    *(_DWORD *)((char *)&v214[4] + 6) = v196;
    WORD1(v214[5]) = 1024;
    HIDWORD(v214[5]) = v20;
    LOWORD(v214[6]) = 1024;
    *(_DWORD *)((char *)&v214[6] + 2) = v192;
    HIWORD(v214[6]) = 1024;
    LODWORD(v214[7]) = v194;
    _os_log_impl(&dword_21D96D000, v23, OS_LOG_TYPE_DEBUG, "%{public}s::%d:timeStarted:%lld timeEnded:%lld securityType:%d flags:%d status:%d reason:%d profileType:%d originRssi:%d targetRssi:%d", (uint8_t *)&buf, 0x50u);
  }
  uint64_t v189 = v11;

  uint64_t v24 = [v4 valueForKey:@"originChannel"];
  int v171 = [v24 unsignedIntValue];

  id v25 = [v4 valueForKey:@"targetChannel"];
  int v26 = [v25 unsignedIntValue];

  int v27 = [v4 valueForKey:@"originChannelFlags"];
  unsigned int v170 = [v27 unsignedIntValue];

  long long v28 = [v4 valueForKey:@"targetChannelFlags"];
  unsigned int v166 = [v28 unsignedIntValue];

  __int16 v29 = [v4 valueForKey:@"originOui"];
  if (v29)
  {
    int v30 = [v4 valueForKey:@"originOui"];
    v175 = [(AnalyticsProcessor *)self formattedNotation:v30 octetCount:3];
  }
  else
  {
    v175 = 0;
  }

  __int16 v31 = [v4 valueForKey:@"targetOui"];
  v183 = self;
  unsigned int v165 = v14;
  if (v31)
  {
    v32 = [v4 valueForKey:@"targetOui"];
    v174 = [(AnalyticsProcessor *)self formattedNotation:v32 octetCount:3];
  }
  else
  {
    v174 = 0;
  }
  v177 = v7;

  __int16 v33 = [v4 valueForKey:@"ccaTotal"];
  int v34 = [v33 unsignedIntValue];

  __int16 v35 = [v4 valueForKey:@"ccaOthers"];
  int v36 = [v35 unsignedIntValue];

  __int16 v37 = [v4 valueForKey:@"ccaInt"];
  int v38 = [v37 unsignedIntValue];

  int v39 = [v4 valueForKey:@"originTxPer"];
  uint64_t v40 = [v39 longLongValue];

  v178 = v4;
  v41 = [v4 valueForKey:@"offChannelDt"];
  int v42 = [v41 unsignedIntValue];

  uint64_t v43 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
  {
    int buf = 136449282;
    v210 = "-[AnalyticsProcessor processMetricRoamStatus:]";
    __int16 v211 = 1024;
    int v212 = 536;
    __int16 v213 = 1024;
    LODWORD(v214[0]) = v171;
    WORD2(v214[0]) = 1024;
    *(_DWORD *)((char *)v214 + 6) = v26;
    WORD1(v214[1]) = 2112;
    *(void *)((char *)&v214[1] + 4) = v175;
    WORD2(v214[2]) = 2112;
    *(void *)((char *)&v214[2] + 6) = v174;
    HIWORD(v214[3]) = 1024;
    LODWORD(v214[4]) = v34;
    WORD2(v214[4]) = 1024;
    *(_DWORD *)((char *)&v214[4] + 6) = v36;
    WORD1(v214[5]) = 1024;
    HIDWORD(v214[5]) = v38;
    LOWORD(v214[6]) = 2048;
    *(void *)((char *)&v214[6] + 2) = v40;
    WORD1(v214[7]) = 1024;
    HIDWORD(v214[7]) = v42;
    __int16 v215 = 1024;
    unsigned int v216 = v170;
    __int16 v217 = 1024;
    unsigned int v218 = v166;
    _os_log_impl(&dword_21D96D000, v43, OS_LOG_TYPE_DEBUG, "%{public}s::%d:originChannel:%d targetChannel:%d originOui:%@ targetOui:%@ ccaTotal:%d ccaOthers:%d ccaInt:%d originTxPer:%lld offChannelDt:%d, originChannelFlags:%d, targetChannelFlags:%d", (uint8_t *)&buf, 0x60u);
  }
  __int16 v164 = v26;

  id v4 = v178;
  uint64_t v44 = [v178 valueForKey:@"roamScanDuration"];
  uint64_t v45 = [v44 unsignedIntValue];

  v46 = [v178 valueForKey:@"associationDuration"];
  uint64_t v47 = [v46 longLongValue];

  v48 = [v178 valueForKey:@"hostReason"];
  unsigned int v49 = [v48 unsignedIntValue];

  v50 = [v178 valueForKey:@"motionState"];
  int v191 = [v50 unsignedIntValue];

  v51 = [v178 valueForKey:@"voipActive"];
  unsigned int v190 = [v51 BOOLValue];

  v52 = [v178 valueForKey:@"lateRoam"];
  int v53 = [v52 BOOLValue];

  v54 = [v178 valueForKey:@"originBcnPer"];
  uint64_t v55 = [v54 longLongValue];

  v56 = [v178 valueForKey:@"originFwTxPer"];
  uint64_t v57 = [v56 longLongValue];

  v58 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
  {
    int buf = 136448514;
    v210 = "-[AnalyticsProcessor processMetricRoamStatus:]";
    __int16 v211 = 1024;
    int v212 = 547;
    __int16 v213 = 1024;
    LODWORD(v214[0]) = v45;
    WORD2(v214[0]) = 2048;
    *(void *)((char *)v214 + 6) = v47;
    HIWORD(v214[1]) = 1024;
    LODWORD(v214[2]) = v49;
    WORD2(v214[2]) = 1024;
    *(_DWORD *)((char *)&v214[2] + 6) = v191;
    WORD1(v214[3]) = 1024;
    HIDWORD(v214[3]) = v190;
    LOWORD(v214[4]) = 1024;
    *(_DWORD *)((char *)&v214[4] + 2) = v53;
    HIWORD(v214[4]) = 2048;
    v214[5] = v55;
    LOWORD(v214[6]) = 2048;
    *(void *)((char *)&v214[6] + 2) = v57;
    _os_log_impl(&dword_21D96D000, v58, OS_LOG_TYPE_DEBUG, "%{public}s::%d:roamScanDuration:%d associatedDur:%lld hostReason:%d motionState:%d voipActive:%d lateRoam:%d originBcnPer:%lld originFwTxPer:%lld", (uint8_t *)&buf, 0x4Eu);
  }
  unsigned int obj = v49;
  uint64_t v187 = v47;

  __int16 v59 = [v178 valueForKey:@"originEnhancedSecurityType"];
  int v60 = [v59 unsignedIntValue];

  __int16 v61 = [v178 valueForKey:@"targetEnhancedSecurityType"];
  int v62 = [v61 unsignedIntValue];

  v63 = [v178 valueForKey:@"originAKMs"];
  int v64 = [v63 unsignedIntValue];

  v65 = [v178 valueForKey:@"targetAKMs"];
  int v66 = [v65 unsignedIntValue];

  v67 = [v178 valueForKey:@"originPhyMode"];
  int v169 = [v67 unsignedIntValue];

  v68 = [v178 valueForKey:@"targetPhyMode"];
  int v69 = [v68 unsignedIntValue];

  uint64_t v184 = [v178 valueForKey:@"ssid"];
  v179 = [v178 valueForKey:@"roamCache"];
  v70 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
  {
    int buf = 136448770;
    v210 = "-[AnalyticsProcessor processMetricRoamStatus:]";
    __int16 v211 = 1024;
    int v212 = 558;
    __int16 v213 = 1024;
    LODWORD(v214[0]) = v60;
    WORD2(v214[0]) = 1024;
    *(_DWORD *)((char *)v214 + 6) = v62;
    WORD1(v214[1]) = 1024;
    HIDWORD(v214[1]) = v64;
    LOWORD(v214[2]) = 1024;
    *(_DWORD *)((char *)&v214[2] + 2) = v66;
    HIWORD(v214[2]) = 1024;
    LODWORD(v214[3]) = v169;
    WORD2(v214[3]) = 1024;
    *(_DWORD *)((char *)&v214[3] + 6) = v69;
    WORD1(v214[4]) = 2112;
    *(void *)((char *)&v214[4] + 4) = v177;
    WORD2(v214[5]) = 2112;
    *(void *)((char *)&v214[5] + 6) = v9;
    HIWORD(v214[6]) = 2112;
    v214[7] = v184;
    _os_log_impl(&dword_21D96D000, v70, OS_LOG_TYPE_DEBUG, "%{public}s::%d:originEnhancedSecurityType:%d targetEnhancedSecurityType:%d originAKMs:%d targetAKMs:%d originPhyMode:%d targetPhyMode:%d originAddr:%@ targetAddr:%@ ssid:%@", (uint8_t *)&buf, 0x54u);
  }
  __int16 v163 = v69;
  v176 = v9;

  id v193 = objc_alloc_init(MEMORY[0x263EFF980]);
  v71 = objc_msgSend(v178, "valueForKey:");
  v72 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v71, "count"));
  v73 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v71, "count"));
  v74 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v71, "count"));
  id v206 = v73;
  id v207 = v72;
  id v205 = v74;
  v75 = v183;
  v167 = v71;
  BOOL v76 = [(AnalyticsProcessor *)v183 unpackRssiSnrCCAFromRssiMetricField:v71 unpackedRssi:&v207 unpackedCca:&v206 unpackedSnr:&v205];
  id v77 = v207;

  id v173 = v206;
  id v172 = v205;

  v78 = [v178 valueForKey:@"metricDate"];
  [v78 doubleValue];
  double v80 = v79;

  uint64_t v81 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:v80];
  v82 = WALogCategoryDeviceStoreHandle();
  v83 = v82;
  v181 = (void *)v81;
  v168 = v77;
  if (!v81)
  {
    if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
    {
      int buf = 136446466;
      v210 = "-[AnalyticsProcessor processMetricRoamStatus:]";
      __int16 v211 = 1024;
      int v212 = 576;
      _os_log_impl(&dword_21D96D000, v83, OS_LOG_TYPE_ERROR, "%{public}s::%d:date nil", (uint8_t *)&buf, 0x12u);
    }
    int v140 = 4;
    uint64_t v7 = v177;
    v93 = (void *)v184;
    goto LABEL_89;
  }
  if (os_signpost_enabled(v82))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v83, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricRoamStatus_generateRoamMO", "", (uint8_t *)&buf, 2u);
  }

  v84 = [(AnalyticsProcessor *)v183 managedObjectHandler];
  v85 = [v84 managedObjectContext];
  v86 = +[RoamMO generateInstance:v85];

  if (!v86)
  {
    v83 = WALogCategoryDeviceStoreHandle();
    v151 = v167;
    if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
    {
      int buf = 136446466;
      v210 = "-[AnalyticsProcessor processMetricRoamStatus:]";
      __int16 v211 = 1024;
      int v212 = 580;
      _os_log_impl(&dword_21D96D000, v83, OS_LOG_TYPE_ERROR, "%{public}s::%d:roamMO nil", (uint8_t *)&buf, 0x12u);
    }
    int v140 = 4;
    uint64_t v7 = v177;
    v93 = (void *)v184;
    goto LABEL_90;
  }
  [v86 setDate:v181];
  [v86 setFwReason:v196];
  [v86 setHostReason:obj];
  [v86 setStatus:v180];
  [v86 setRoamLatencyMs:(double)(v198 - v189)];
  [v86 setMotionState:(__int16)v191];
  [v86 setSourceScanLatencyMs:v45];
  [v86 setVoipActive:v190];
  [v86 setSourceRssi:(__int16)v192];
  [v86 setTargetRssi:(__int16)v194];
  if (v76)
  {
    [v86 setHistRssi:v77];
    [v86 setHistCca:v173];
    [v86 setHistSnr:v172];
  }
  v87 = [v178 valueForKey:@"txPer"];
  [v86 setHistTxPer:v87];

  v88 = [v178 valueForKey:@"txFrame"];
  [v86 setHistTxFrames:v88];

  v89 = [v178 valueForKey:@"fwTxPer"];
  [v86 setHistFwTxPer:v89];

  v90 = [v178 valueForKey:@"fwTxFrames"];
  [v86 setHistFwTxFrames:v90];

  v91 = [v178 valueForKey:@"beaconSched"];
  [v86 setHistBcnSched:v91];

  v92 = [v178 valueForKey:@"beaconsPer"];
  [v86 setHistBcnPer:v92];

  v195 = v86;
  [v86 setSourceTimeSpentSecs:v187];
  uint64_t v7 = v177;
  v93 = (void *)v184;
  if (v179)
  {
    v182 = [MEMORY[0x263F089D8] string];
    v94 = WALogCategoryDeviceStoreHandle();
    if (os_signpost_enabled(v94))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_21D96D000, v94, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricRoamStatus_roamCacheloop", "", (uint8_t *)&buf, 2u);
    }

    long long v203 = 0u;
    long long v204 = 0u;
    long long v201 = 0u;
    long long v202 = 0u;
    id obja = v179;
    uint64_t v197 = [obja countByEnumeratingWithState:&v201 objects:v208 count:16];
    if (v197)
    {
      uint64_t v95 = *(void *)v202;
      uint64_t v199 = *(void *)v202;
      do
      {
        for (uint64_t i = 0; i != v197; ++i)
        {
          if (*(void *)v202 != v95) {
            objc_enumerationMutation(obja);
          }
          id v97 = *(id *)(*((void *)&v201 + 1) + 8 * i);
          id v98 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          v99 = [v97 objectForKey:@"channel"];
          v100 = [v97 objectForKey:@"rssi"];
          v101 = [v97 objectForKey:@"bssid"];
          int v102 = [v100 intValue];
          if (v102 >= v192) {
            uint64_t v103 = (v192 - v102);
          }
          else {
            uint64_t v103 = (v102 - v192);
          }
          [v98 setObject:v99 forKey:@"channel"];
          [v98 setObject:v100 forKey:@"rssi"];
          [v98 setObject:v101 forKey:@"bssid"];
          v104 = [NSNumber numberWithInt:v103];
          [v98 setObject:v104 forKey:@"roamDelta"];

          [v193 addObject:v98];
          [v195 setRoamDelta:(__int16)v103];
          uint64_t v105 = [NSNumber numberWithInt:v103];
          v106 = (void *)v105;
          uint64_t v95 = v199;
          if (v99 && v100 && v101)
          {
            v188 = v99;
            [v182 appendFormat:@" {%@, %@, %@, %@} ", v101, v100, v99, v105];
            v107 = [(AnalyticsProcessor *)v183 formattedNotation:v101 octetCount:6];
            v108 = [(AnalyticsProcessor *)v183 managedObjectHandler];
            v109 = [v108 managedObjectContext];
            v110 = +[BSSMO getInstance:v107 ssid:v184 moc:v109];

            if (v110) {
              [v110 setLastSeen:v181];
            }

            uint64_t v95 = v199;
            v99 = v188;
          }
        }
        uint64_t v197 = [obja countByEnumeratingWithState:&v201 objects:v208 count:16];
      }
      while (v197);
    }

    v111 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v111, OS_LOG_TYPE_DEBUG))
    {
      int buf = 136446722;
      v210 = "-[AnalyticsProcessor processMetricRoamStatus:]";
      __int16 v211 = 1024;
      int v212 = 646;
      __int16 v213 = 2112;
      v214[0] = v182;
      _os_log_impl(&dword_21D96D000, v111, OS_LOG_TYPE_DEBUG, "%{public}s::%d:roamCacheStr:%@", (uint8_t *)&buf, 0x1Cu);
    }

    [v195 setNeighborCache:v193];
    v112 = WALogCategoryDeviceStoreHandle();
    uint64_t v7 = v177;
    id v4 = v178;
    v75 = v183;
    v93 = (void *)v184;
    if (os_signpost_enabled(v112))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_21D96D000, v112, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricRoamStatus_roamCacheloop", "", (uint8_t *)&buf, 2u);
    }
  }
  v113 = [(AnalyticsProcessor *)v75 managedObjectHandler];
  v114 = [v113 managedObjectContext];
  v83 = +[BSSMO getInstance:v7 ssid:v93 moc:v114];

  if (!v83)
  {
    v160 = WALogCategoryDeviceStoreHandle();
    v151 = v167;
    if (os_log_type_enabled(v160, OS_LOG_TYPE_ERROR))
    {
      int buf = 136446978;
      v210 = "-[AnalyticsProcessor processMetricRoamStatus:]";
      __int16 v211 = 1024;
      int v212 = 652;
      __int16 v213 = 2112;
      v214[0] = v93;
      LOWORD(v214[1]) = 2112;
      *(void *)((char *)&v214[1] + 2) = v7;
      _os_log_impl(&dword_21D96D000, v160, OS_LOG_TYPE_ERROR, "%{public}s::%d:originBssMO nil for %@[%@]", (uint8_t *)&buf, 0x26u);
    }

    int v140 = 4;
    v83 = v195;
    goto LABEL_90;
  }
  [v83 setChannel:(__int16)v171];
  [v83 setChannelFlags:v170];
  [v83 setPhyMode:(__int16)v169];
  [v83 setLastSeen:v181];
  [v195 setSource:v83];
  v115 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
  {
    v116 = [v83 bssid];
    int v117 = [v83 channel];
    int buf = 136447234;
    v210 = "-[AnalyticsProcessor processMetricRoamStatus:]";
    __int16 v211 = 1024;
    int v212 = 661;
    __int16 v213 = 2112;
    v214[0] = v116;
    LOWORD(v214[1]) = 1024;
    *(_DWORD *)((char *)&v214[1] + 2) = v117;
    HIWORD(v214[1]) = 1024;
    LODWORD(v214[2]) = v180;
    _os_log_impl(&dword_21D96D000, v115, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Set Roam Source BSS[%@] (chan: %d) status %d", (uint8_t *)&buf, 0x28u);
  }
  char v200 = 0;
  if (v180)
  {
    v118 = 0;
  }
  else
  {
    v119 = [(AnalyticsProcessor *)v75 managedObjectHandler];
    v120 = [v119 managedObjectContext];
    v118 = +[BSSMO generateInstance:v176 ssid:v93 created:&v200 moc:v120];

    if (!v118)
    {
      v162 = WALogCategoryDeviceStoreHandle();
      if (os_log_type_enabled(v162, OS_LOG_TYPE_ERROR))
      {
        int buf = 136446978;
        v210 = "-[AnalyticsProcessor processMetricRoamStatus:]";
        __int16 v211 = 1024;
        int v212 = 666;
        __int16 v213 = 2112;
        v214[0] = v93;
        LOWORD(v214[1]) = 2112;
        *(void *)((char *)&v214[1] + 2) = v176;
        _os_log_impl(&dword_21D96D000, v162, OS_LOG_TYPE_ERROR, "%{public}s::%d:targetBssMO nil for %@[%@]", (uint8_t *)&buf, 0x26u);
      }

      v118 = 0;
      goto LABEL_120;
    }
    if (v200)
    {
      [v118 setChannel:v164];
      [v118 setChannelFlags:v166];
      [v118 setPhyMode:v163];
      [v118 setLastSeen:v181];
    }
    v121 = [v4 valueForKey:@"apProfile"];
    if (v121)
    {
      v122 = [v118 apProfileID];
      char v123 = [v122 isEqualToString:v121];

      if ((v123 & 1) == 0) {
        [v118 setApProfileID:v121];
      }
    }
    [v195 setTarget:v118];
    v124 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
    {
      v125 = [v118 bssid];
      int v126 = [v118 channel];
      int buf = 136446978;
      v210 = "-[AnalyticsProcessor processMetricRoamStatus:]";
      __int16 v211 = 1024;
      int v212 = 679;
      __int16 v213 = 2112;
      v214[0] = v125;
      LOWORD(v214[1]) = 1024;
      *(_DWORD *)((char *)&v214[1] + 2) = v126;
      _os_log_impl(&dword_21D96D000, v124, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Set Roam Target BSS[%@] (chan: %d)", (uint8_t *)&buf, 0x22u);
    }
  }
  v127 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v127))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v127, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricRoamStatus_generateRoamMO", "", (uint8_t *)&buf, 2u);
  }

  if (!v200)
  {
    v130 = 0;
    goto LABEL_74;
  }
  v128 = [(AnalyticsProcessor *)v75 managedObjectHandler];
  v129 = [v128 managedObjectContext];
  v130 = +[NetworkMO getInstance:v93 moc:v129];

  if (!v130)
  {
    v161 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v161, OS_LOG_TYPE_ERROR))
    {
      int buf = 136446722;
      v210 = "-[AnalyticsProcessor processMetricRoamStatus:]";
      __int16 v211 = 1024;
      int v212 = 686;
      __int16 v213 = 2112;
      v214[0] = v93;
      _os_log_impl(&dword_21D96D000, v161, OS_LOG_TYPE_ERROR, "%{public}s::%d:networkMO nil for ssid %@", (uint8_t *)&buf, 0x1Cu);
    }

LABEL_120:
    v130 = 0;
    int v140 = 4;
    goto LABEL_88;
  }
  [v130 setAuthFlags:v165];
  if (v200)
  {
    v131 = [v130 bss];
    char v132 = [v131 containsObject:v118];

    if ((v132 & 1) == 0)
    {
      [v130 addBssObject:v118];
      v133 = WALogCategoryDeviceStoreHandle();
      if (os_log_type_enabled(v133, OS_LOG_TYPE_DEFAULT))
      {
        v134 = [v118 bssid];
        v135 = [v130 ssid];
        int buf = 136446978;
        v210 = "-[AnalyticsProcessor processMetricRoamStatus:]";
        __int16 v211 = 1024;
        int v212 = 693;
        __int16 v213 = 2112;
        v214[0] = v134;
        LOWORD(v214[1]) = 2112;
        *(void *)((char *)&v214[1] + 2) = v135;
        _os_log_impl(&dword_21D96D000, v133, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Added BSS[%@] to Network[%@]", (uint8_t *)&buf, 0x26u);
      }
    }
  }
LABEL_74:
  v136 = [(AnalyticsProcessor *)v75 managedObjectHandler];
  [v136 updateManagedObjectContextWithoutSave];

  if (v180)
  {
    char v137 = 0;
  }
  else
  {
    v138 = [(AnalyticsProcessor *)v75 roamPolicyHandler];
    char v139 = objc_msgSend(v138, "buildRoamPoliciesForNetwork:bssid:numRoamSamples:deploymentStatus:", v93, v7, v75->_numRoamSamples, objc_msgSend(v130, "didDeploymentChange"));

    char v137 = v139 ^ 1;
  }
  int v140 = 0;
  if (v179 && (v137 & 1) == 0)
  {
    v141 = [(AnalyticsProcessor *)v75 roamPolicyHandler];
    v142 = [v83 bssid];
    int v143 = [v141 buildRoamCacheInfoForNetwork:v93 bssid:v142 numRoamSamples:v75->_numRoamSamples];

    if (v143)
    {
      v144 = [(AnalyticsProcessor *)v75 roamPolicyHandler];
      v145 = [v83 bssid];
      int v146 = [v144 monitorDeploymentChanges:v179 ssid:v93 roamStatus:(int)v180 originBssid:v145 targetBssid:v176];

      v147 = WALogCategoryDeviceStoreHandle();
      BOOL v148 = os_log_type_enabled(v147, OS_LOG_TYPE_DEBUG);
      if (!v146)
      {
        if (v148)
        {
          int buf = 136446466;
          v210 = "-[AnalyticsProcessor processMetricRoamStatus:]";
          __int16 v211 = 1024;
          int v212 = 713;
          _os_log_impl(&dword_21D96D000, v147, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Deployment remained intact", (uint8_t *)&buf, 0x12u);
        }

        [v130 setDidDeploymentChange:0];
        int v140 = 0;
        v75 = v183;
        goto LABEL_88;
      }
      if (v148)
      {
        int buf = 136446466;
        v210 = "-[AnalyticsProcessor processMetricRoamStatus:]";
        __int16 v211 = 1024;
        int v212 = 709;
        _os_log_impl(&dword_21D96D000, v147, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Deployment Changed, Reset Adaptive Roaming State Machine", (uint8_t *)&buf, 0x12u);
      }

      v75 = v183;
      v149 = [(AnalyticsProcessor *)v183 roamPolicyHandler];
      v150 = [v83 bssid];
      [v149 resetAdaptiveRoamingStateMachine:v93 bssid:v150];

      [v130 setDidDeploymentChange:1];
    }
    int v140 = 0;
  }
LABEL_88:

  id v4 = v178;
LABEL_89:
  v151 = v167;
LABEL_90:

  if (v140)
  {

    uint64_t v9 = v176;
    goto LABEL_94;
  }
  v152 = [(AnalyticsProcessor *)v75 managedObjectHandler];
  [v152 saveManagedObjectContext];

  v153 = [(AnalyticsProcessor *)v75 managedObjectHandler];
  v154 = [v153 managedObjectContext];
  [v154 reset];

  v155 = v175;
  uint64_t v9 = v176;
LABEL_93:

LABEL_94:
  v156 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v156))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v156, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricRoamStatus", "", (uint8_t *)&buf, 2u);
  }
}

- (void)processMetricLinkChange:(id)a3
{
  uint64_t v160 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 valueForKey:@"isLinkUp"];
  unsigned int v141 = [v4 BOOLValue];

  id v5 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v5))
  {
    unsigned int v6 = @"NO";
    if (v141) {
      unsigned int v6 = @"YES";
    }
    *(_DWORD *)int buf = 138412290;
    BOOL v148 = (const char *)v6;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricLinkChange", "isLinkUp:%@", buf, 0xCu);
  }

  uint64_t v7 = [v3 valueForKey:@"isInVol"];
  int v8 = [v7 BOOLValue];

  uint64_t v9 = [v3 valueForKey:@"reason"];
  unsigned int v138 = [v9 unsignedIntValue];

  int v10 = [v3 valueForKey:@"subreason"];
  unsigned int v137 = [v10 unsignedIntValue];

  uint64_t v11 = [v3 valueForKey:@"cachedRSSI"];
  int v12 = [v11 intValue];

  uint64_t v13 = [v3 valueForKey:@"channel"];
  int v14 = [v13 unsignedIntValue];

  __int16 v15 = [v3 valueForKey:@"channelFlags"];
  unsigned int v16 = [v15 unsignedIntValue];

  uint64_t v17 = [v3 valueForKey:@"channelWidth"];
  int v18 = [v17 unsignedIntValue];

  int v19 = [v3 valueForKey:@"phyMode"];
  int v20 = [v19 unsignedIntValue];

  uint32_t v21 = [v3 valueForKey:@"phyMode"];
  int v22 = [v21 unsignedCharValue];

  objc_super v23 = [v3 valueForKey:@"networkFlags"];
  unsigned int v24 = [v23 unsignedIntValue];

  id v25 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)int buf = 136448770;
    BOOL v148 = "-[AnalyticsProcessor processMetricLinkChange:]";
    __int16 v149 = 1024;
    int v150 = 744;
    __int16 v151 = 1024;
    *(_DWORD *)v152 = v141;
    *(_WORD *)&v152[4] = 1024;
    *(_DWORD *)&v152[6] = v8;
    LOWORD(v153) = 1024;
    *(_DWORD *)((char *)&v153 + 2) = v138;
    HIWORD(v153) = 1024;
    *(_DWORD *)v154 = v137;
    *(_WORD *)&v154[4] = 1024;
    *(_DWORD *)v155 = v14;
    *(_WORD *)&v155[4] = 1024;
    *(_DWORD *)v156 = v18;
    *(_WORD *)&v156[4] = 1024;
    *(_DWORD *)v157 = v20;
    *(_WORD *)&v157[4] = 1024;
    *(_DWORD *)v158 = v22;
    *(_WORD *)&v158[4] = 1024;
    v159[0] = v24;
    _os_log_impl(&dword_21D96D000, v25, OS_LOG_TYPE_DEBUG, "%{public}s::%d:isLinkUp:%d isInVol:%d reason:%d subreason:%d channel:%d channelWidth:%d phyMode:%d awdlState:%d - flags:%d", buf, 0x48u);
  }

  int v26 = [v3 valueForKey:@"associationDuration"];
  [v26 doubleValue];
  double v28 = v27;

  __int16 v29 = [v3 valueForKey:@"networkAuthFlags"];
  unsigned int v130 = [v29 unsignedCharValue];

  int v30 = [v3 valueForKey:@"bssid"];
  if (+[WAUtil isWildcardMacAddress:v30])
  {
    v113 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 136446722;
      BOOL v148 = "-[AnalyticsProcessor processMetricLinkChange:]";
      __int16 v149 = 1024;
      int v150 = 788;
      __int16 v151 = 2112;
      *(void *)v152 = v30;
      _os_log_impl(&dword_21D96D000, v113, OS_LOG_TYPE_ERROR, "%{public}s::%d:bssid(%@) is the wildcard address!! bailing", buf, 0x1Cu);
    }
    goto LABEL_48;
  }
  __int16 v124 = v14;
  unsigned int v31 = v16;
  int v32 = v12;
  __int16 v33 = [v3 valueForKey:@"ssid"];
  v133 = [v3 valueForKey:@"apProfile"];
  int v34 = [v3 valueForKey:@"metricDate"];
  [v34 doubleValue];
  double v36 = v35;

  uint64_t v37 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:v36];
  char v132 = (void *)v37;
  if (!v33)
  {
    int v117 = WALogCategoryDeviceStoreHandle();
    int v38 = self;
    if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 136446466;
      BOOL v148 = "-[AnalyticsProcessor processMetricLinkChange:]";
      __int16 v149 = 1024;
      int v150 = 800;
      _os_log_impl(&dword_21D96D000, v117, OS_LOG_TYPE_ERROR, "%{public}s::%d:ssid is nil", buf, 0x12u);
    }

    int v66 = 0;
    uint64_t v57 = 0;
    __int16 v61 = 0;
    int v60 = 0;
    v73 = 0;
    int v97 = 4;
    goto LABEL_65;
  }
  int v38 = self;
  if (!v30)
  {
    v118 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 136446466;
      BOOL v148 = "-[AnalyticsProcessor processMetricLinkChange:]";
      __int16 v149 = 1024;
      int v150 = 801;
      _os_log_impl(&dword_21D96D000, v118, OS_LOG_TYPE_ERROR, "%{public}s::%d:bssid is nil", buf, 0x12u);
    }

    int v53 = 0;
    uint64_t v57 = 0;
    int v60 = 0;
    v73 = 0;
    int v97 = 4;
    int v66 = v33;
    __int16 v61 = 0;
    goto LABEL_46;
  }
  uint64_t v39 = v37;
  if (!v37)
  {
    v119 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 136446466;
      BOOL v148 = "-[AnalyticsProcessor processMetricLinkChange:]";
      __int16 v149 = 1024;
      int v150 = 802;
      _os_log_impl(&dword_21D96D000, v119, OS_LOG_TYPE_ERROR, "%{public}s::%d:date nil", buf, 0x12u);
    }

    uint64_t v57 = 0;
    int v60 = 0;
    v73 = 0;
    int v97 = 4;
    int v66 = v33;
    __int16 v61 = 0;
LABEL_65:
    int v53 = v30;
    goto LABEL_46;
  }
  unsigned int v126 = v24;
  uint64_t v140 = [v3 valueForKey:@"ssid"];

  uint64_t v40 = [v3 valueForKey:@"bssid"];
  uint64_t v139 = [(AnalyticsProcessor *)self formattedNotation:v40 octetCount:6];

  v41 = [v3 valueForKey:@"usageRank"];
  unsigned int v42 = [v41 unsignedShortValue];

  uint64_t v43 = [v3 valueForKey:@"noiHomeType"];
  int v128 = [v43 unsignedShortValue];

  uint64_t v44 = [v3 valueForKey:@"noiWorkType"];
  int v45 = [v44 unsignedShortValue];

  v46 = [v3 valueForKey:@"loiType"];
  int v47 = [v46 unsignedShortValue];

  v48 = [v3 valueForKey:@"motionState"];
  int v49 = [v48 unsignedIntValue];

  v50 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)int buf = 136448514;
    BOOL v148 = "-[AnalyticsProcessor processMetricLinkChange:]";
    __int16 v149 = 1024;
    int v150 = 814;
    __int16 v151 = 2112;
    *(void *)v152 = v140;
    *(_WORD *)&v152[8] = 2112;
    uint64_t v153 = v139;
    *(_WORD *)v154 = 1024;
    *(_DWORD *)&v154[2] = v130;
    *(_WORD *)v155 = 1024;
    *(_DWORD *)&v155[2] = v42;
    *(_WORD *)v156 = 1024;
    *(_DWORD *)&v156[2] = v128;
    *(_WORD *)v157 = 1024;
    *(_DWORD *)&v157[2] = v45;
    *(_WORD *)v158 = 1024;
    *(_DWORD *)&v158[2] = v47;
    LOWORD(v159[0]) = 1024;
    *(_DWORD *)((char *)v159 + 2) = v49;
    _os_log_impl(&dword_21D96D000, v50, OS_LOG_TYPE_DEBUG, "%{public}s::%d:ssid:%@ bssid:%@ securityType:%d usageRank:%d noiHomeType:%d noiWorkType:%d loiType:%d motionState:%d", buf, 0x4Au);
  }

  int v127 = v32;
  if (v141)
  {
    unsigned int v122 = v42;
    unsigned int v123 = v31;
    unsigned __int8 v146 = 0;
    v51 = [(AnalyticsProcessor *)self managedObjectHandler];
    v52 = [v51 managedObjectContext];
    int v53 = (void *)v139;
    uint64_t v54 = +[BSSMO generateInstance:v139 ssid:v140 created:&v146 moc:v52];

    v135 = (void *)v54;
    if (v54)
    {
      unsigned __int8 v145 = 0;
      uint64_t v55 = [(AnalyticsProcessor *)self managedObjectHandler];
      v56 = [v55 managedObjectContext];
      uint64_t v57 = +[NetworkMO generateInstance:v140 created:&v145 moc:v56];

      if (v57)
      {
        v58 = [(AnalyticsProcessor *)self managedObjectHandler];
        __int16 v59 = [v58 managedObjectContext];
        int v60 = +[JoinMO generateInstance:v59];

        if (v60)
        {
          [v60 setSuccess:1];
          [v60 setMotionState:(__int16)v49];
          [v60 setReason:v138];
          [v60 setSubreason:v137];
          [v60 setDate:v132];
          __int16 v61 = v135;
          [v135 setLastSeen:v132];
          [v135 setChannel:v124];
          [v135 setChannelFlags:v123];
          [v135 setApProfileID:v133];
          [v135 addJoinsObject:v60];
          int v62 = WALogCategoryDeviceStoreHandle();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
          {
            v63 = [v60 date];
            int v64 = [v135 bssid];
            int v65 = [v135 channel];
            *(_DWORD *)int buf = 136447234;
            BOOL v148 = "-[AnalyticsProcessor processMetricLinkChange:]";
            __int16 v149 = 1024;
            int v150 = 839;
            __int16 v151 = 2112;
            *(void *)v152 = v63;
            *(_WORD *)&v152[8] = 2112;
            uint64_t v153 = (uint64_t)v64;
            *(_WORD *)v154 = 1024;
            *(_DWORD *)&v154[2] = v65;
            _os_log_impl(&dword_21D96D000, v62, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Added Join at [%@] to BSS[%@] (chan: %d)", buf, 0x2Cu);

            __int16 v61 = v135;
          }

          [v57 setIsHome:v128 == 1];
          [v57 setIsWork:v45 == 1];
          [v57 setUsageRank:v122];
          [v57 setAuthFlags:v130];
          int v38 = self;
          int v66 = (void *)v140;
          if (v146 | v145)
          {
            v67 = [v57 bss];
            char v68 = [v67 containsObject:v61];

            if ((v68 & 1) == 0)
            {
              [v57 addBssObject:v61];
              int v69 = WALogCategoryDeviceStoreHandle();
              if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
              {
                v70 = [v61 bssid];
                v71 = [v57 ssid];
                *(_DWORD *)int buf = 136446978;
                BOOL v148 = "-[AnalyticsProcessor processMetricLinkChange:]";
                __int16 v149 = 1024;
                int v150 = 849;
                __int16 v151 = 2112;
                *(void *)v152 = v70;
                *(_WORD *)&v152[8] = 2112;
                uint64_t v153 = (uint64_t)v71;
                _os_log_impl(&dword_21D96D000, v69, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Added BSS[%@] to Network[%@] with securityType", buf, 0x26u);

                __int16 v61 = v135;
              }
            }
          }
          v72 = [(AnalyticsProcessor *)self roamPolicyHandler];
          objc_msgSend(v72, "buildRoamPoliciesForNetwork:bssid:numRoamSamples:deploymentStatus:", v140, v139, self->_numRoamSamples, objc_msgSend(v57, "didDeploymentChange"));

          v73 = 0;
LABEL_33:
          id v98 = [(AnalyticsProcessor *)v38 linkChangePolicyHandler];
          [v98 setLinkChange:v141 ssid:v66 bssid:v53 reason:v138 subReason:v137 rssi:v127];

          if ((v141 & 1) == 0)
          {
            v99 = [(AnalyticsProcessor *)v38 managedObjectHandler];
            [v99 managedObjectContext];
            v100 = v53;
            int v102 = v101 = v61;
            +[SessionMO addMostRecentSession:v66 moc:v102];

            __int16 v61 = v101;
            int v53 = v100;
          }
          uint64_t v103 = [(AnalyticsProcessor *)v38 managedObjectHandler];
          [v103 updateManagedObjectContextWithoutSave];

          if (v57)
          {
            v104 = [(AnalyticsProcessor *)v38 managedObjectHandler];
            uint64_t v105 = [NSNumber numberWithUnsignedInt:v126];
            [v104 setNetworkManagedObjectPropertyValueForKeyWithoutSave:v57 forKey:@"NetworkSummaryNetworkFlags" withValue:v105];
          }
          if (v141)
          {
            int v97 = 0;
          }
          else
          {
            v106 = v61;
            v107 = [v61 apid];
            v108 = v107;
            if (v107
              && ([v107 UUIDString],
                  v109 = objc_claimAutoreleasedReturnValue(),
                  v109,
                  v109))
            {
              v110 = [v108 UUIDString];
              v111 = [(AnalyticsProcessor *)v38 deploymentMetricHandler];
              objc_msgSend(v111, "networkDeploymentMetricCheckAndSubmit:deploymentUuid:interval:", v66, v110, -[AnalyticsProcessor deploymentMetricDiffDays](v38, "deploymentMetricDiffDays"));
            }
            else
            {
              v110 = WALogCategoryDeviceStoreHandle();
              if (os_log_type_enabled(v110, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)int buf = 136446722;
                BOOL v148 = "-[AnalyticsProcessor processMetricLinkChange:]";
                __int16 v149 = 1024;
                int v150 = 1010;
                __int16 v151 = 2112;
                *(void *)v152 = v66;
                _os_log_impl(&dword_21D96D000, v110, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Deployment uuid not set for %@", buf, 0x1Cu);
              }
            }

            int v97 = 0;
            __int16 v61 = v106;
            int v53 = (void *)v139;
          }
          goto LABEL_46;
        }
        v121 = WALogCategoryDeviceStoreHandle();
        __int16 v61 = v135;
        if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)int buf = 136446466;
          BOOL v148 = "-[AnalyticsProcessor processMetricLinkChange:]";
          __int16 v149 = 1024;
          int v150 = 827;
          _os_log_impl(&dword_21D96D000, v121, OS_LOG_TYPE_ERROR, "%{public}s::%d:joinMO nil", buf, 0x12u);
        }
        int v38 = self;
        int v66 = (void *)v140;
      }
      else
      {
        v121 = WALogCategoryDeviceStoreHandle();
        if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)int buf = 136446722;
          BOOL v148 = "-[AnalyticsProcessor processMetricLinkChange:]";
          __int16 v149 = 1024;
          int v150 = 824;
          __int16 v151 = 2112;
          int v66 = (void *)v140;
          *(void *)v152 = v140;
          _os_log_impl(&dword_21D96D000, v121, OS_LOG_TYPE_ERROR, "%{public}s::%d:networkMO nil for ssid %@", buf, 0x1Cu);
          int v38 = self;
        }
        else
        {
          int v38 = self;
          int v66 = (void *)v140;
        }
        __int16 v61 = (void *)v54;
      }

      goto LABEL_83;
    }
    v120 = WALogCategoryDeviceStoreHandle();
    int v66 = (void *)v140;
    if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 136446978;
      BOOL v148 = "-[AnalyticsProcessor processMetricLinkChange:]";
      __int16 v149 = 1024;
      int v150 = 820;
      __int16 v151 = 2112;
      *(void *)v152 = v140;
      *(_WORD *)&v152[8] = 2112;
      uint64_t v153 = v139;
LABEL_70:
      _os_log_impl(&dword_21D96D000, v120, OS_LOG_TYPE_ERROR, "%{public}s::%d:bssMO nil for %@[%@]", buf, 0x26u);
      goto LABEL_71;
    }
    goto LABEL_71;
  }
  v74 = [(AnalyticsProcessor *)self managedObjectHandler];
  v75 = [v74 managedObjectContext];
  int v53 = (void *)v139;
  BOOL v76 = +[BSSMO getInstance:v139 ssid:v140 moc:v75];

  if (!v76)
  {
    v120 = WALogCategoryDeviceStoreHandle();
    int v66 = (void *)v140;
    if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 136446978;
      BOOL v148 = "-[AnalyticsProcessor processMetricLinkChange:]";
      __int16 v149 = 1024;
      int v150 = 859;
      __int16 v151 = 2112;
      *(void *)v152 = v140;
      *(_WORD *)&v152[8] = 2112;
      uint64_t v153 = v139;
      goto LABEL_70;
    }
LABEL_71:

    uint64_t v57 = 0;
    __int16 v61 = 0;
LABEL_83:
    int v60 = 0;
    v73 = 0;
    int v97 = 4;
    goto LABEL_46;
  }
  v136 = v76;
  [v76 setLastSeen:v39];
  id v77 = [v3 valueForKey:@"rssi"];
  v78 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v77, "count"));
  uint64_t v79 = v39;
  double v80 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v77, "count"));
  uint64_t v81 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v77, "count"));
  id v143 = v80;
  id v144 = v78;
  id v142 = v81;
  BOOL v82 = [(AnalyticsProcessor *)self unpackRssiSnrCCAFromRssiMetricField:v77 unpackedRssi:&v144 unpackedCca:&v143 unpackedSnr:&v142];
  id v125 = v144;

  id v131 = v143;
  id v129 = v142;

  v83 = [(AnalyticsProcessor *)self managedObjectHandler];
  v84 = [v83 managedObjectContext];
  v73 = +[LeaveMO generateInstance:v84];

  if (v73)
  {
    [v73 setReason:v138];
    [v73 setSubReason:v137];
    [v73 setMotionState:(__int16)v49];
    [v73 setDate:v79];
    [v73 setAssocDuration:v28];
    v85 = v125;
    if (v82)
    {
      [v73 setHistRssi:v125];
      [v73 setHistCca:v131];
      [v73 setHistSnr:v129];
    }
    v86 = [v3 valueForKey:@"rssi"];
    [v73 setHistRssi:v86];

    v87 = [v3 valueForKey:@"txPer"];
    [v73 setHistTxPer:v87];

    v88 = [v3 valueForKey:@"txFrame"];
    [v73 setHistTxFrames:v88];

    v89 = [v3 valueForKey:@"fwTxPer"];
    [v73 setHistFwTxPer:v89];

    v90 = [v3 valueForKey:@"fwTxFrames"];
    [v73 setHistFwTxFrames:v90];

    v91 = [v3 valueForKey:@"beaconSched"];
    [v73 setHistBcnSched:v91];

    v92 = [v3 valueForKey:@"beaconsPer"];
    [v73 setHistBcnPer:v92];

    [v136 addLeavesObject:v73];
    v93 = WALogCategoryDeviceStoreHandle();
    int v38 = self;
    if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
    {
      v94 = [v73 date];
      uint64_t v95 = [v136 bssid];
      int v96 = [v136 channel];
      *(_DWORD *)int buf = 136447234;
      BOOL v148 = "-[AnalyticsProcessor processMetricLinkChange:]";
      __int16 v149 = 1024;
      int v150 = 896;
      __int16 v151 = 2112;
      *(void *)v152 = v94;
      *(_WORD *)&v152[8] = 2112;
      uint64_t v153 = (uint64_t)v95;
      *(_WORD *)v154 = 1024;
      *(_DWORD *)&v154[2] = v96;
      _os_log_impl(&dword_21D96D000, v93, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Added Leave at [%@] to BSS[%@] (chan: %d)", buf, 0x2Cu);
    }
    int v97 = 0;
    int v53 = (void *)v139;
    int v66 = (void *)v140;
  }
  else
  {
    v93 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 136446466;
      BOOL v148 = "-[AnalyticsProcessor processMetricLinkChange:]";
      __int16 v149 = 1024;
      int v150 = 872;
      _os_log_impl(&dword_21D96D000, v93, OS_LOG_TYPE_ERROR, "%{public}s::%d:leaveMO nil", buf, 0x12u);
    }
    int v97 = 4;
    int v38 = self;
    int v53 = (void *)v139;
    int v66 = (void *)v140;
    v85 = v125;
  }

  uint64_t v57 = 0;
  int v60 = 0;
  __int16 v61 = v136;
  if (v73) {
    goto LABEL_33;
  }
  int v60 = 0;
  v73 = 0;
LABEL_46:

  if (v97 == 4) {
    goto LABEL_49;
  }
  v112 = [(AnalyticsProcessor *)v38 managedObjectHandler];
  [v112 saveManagedObjectContext];

  v113 = [(AnalyticsProcessor *)v38 managedObjectHandler];
  v114 = [v113 managedObjectContext];
  [v114 reset];

  int v30 = v53;
LABEL_48:

  int v53 = v30;
LABEL_49:
  v115 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v115))
  {
    v116 = @"NO";
    if (v141) {
      v116 = @"YES";
    }
    *(_DWORD *)int buf = 138412290;
    BOOL v148 = (const char *)v116;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v115, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricLinkChange", "isLinkUp:%@", buf, 0xCu);
  }
}

- (void)processMetricAssociationFailure:(id)a3
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)int buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricAssociationFailure", "", buf, 2u);
  }

  unsigned int v6 = [v4 valueForKey:@"error"];
  uint64_t v7 = [v6 intValue];

  int v8 = [v4 valueForKey:@"deauthReason"];
  uint64_t v9 = [v8 intValue];

  int v10 = [v4 valueForKey:@"deauthSourceOUI"];
  int v53 = [(AnalyticsProcessor *)self formattedNotation:v10 octetCount:3];

  uint64_t v11 = [v4 valueForKey:@"channel"];
  int v50 = [v11 intValue];

  int v12 = [v4 valueForKey:@"rssi"];
  int v13 = [v12 intValue];

  int v14 = [v4 valueForKey:@"bssidOUI"];
  v52 = [(AnalyticsProcessor *)self formattedNotation:v14 octetCount:3];

  v51 = [v4 valueForKey:@"security"];
  __int16 v15 = [v4 valueForKey:@"ssid"];
  unsigned int v16 = [v4 valueForKey:@"bssid"];
  uint64_t v17 = [v4 valueForKey:@"metricDate"];
  [v17 doubleValue];
  double v19 = v18;

  uint64_t v20 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:v19];
  uint32_t v21 = (void *)v20;
  if (v15)
  {
    if (v16)
    {
      if (v20)
      {
        uint64_t v54 = (void *)v20;
        int v22 = [v4 valueForKey:@"ssid"];

        objc_super v23 = [v4 valueForKey:@"bssid"];
        unsigned int v24 = [(AnalyticsProcessor *)self formattedNotation:v23 octetCount:6];

        id v25 = WALogCategoryDeviceStoreHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)int buf = 136448770;
          uint64_t v57 = "-[AnalyticsProcessor processMetricAssociationFailure:]";
          __int16 v58 = 1024;
          int v59 = 1049;
          __int16 v60 = 1024;
          *(_DWORD *)__int16 v61 = v7;
          *(_WORD *)&v61[4] = 1024;
          *(_DWORD *)&v61[6] = v9;
          *(_WORD *)int v62 = 2112;
          *(void *)&v62[2] = v53;
          __int16 v63 = 1024;
          int v64 = v50;
          __int16 v65 = 1024;
          int v66 = v13;
          __int16 v67 = 2112;
          char v68 = v52;
          __int16 v69 = 2112;
          v70 = v51;
          __int16 v71 = 2112;
          v72 = v22;
          __int16 v73 = 2112;
          v74 = v24;
          _os_log_impl(&dword_21D96D000, v25, OS_LOG_TYPE_DEBUG, "%{public}s::%d:err:%d deauthReason:%d deauthSourceOUI:%@ channel:%d rssi%d bssidOUI:%@ security:%@ SSID:%@ BSSID:%@", buf, 0x5Cu);
        }

        int v26 = [(AnalyticsProcessor *)self managedObjectHandler];
        double v27 = [v26 managedObjectContext];
        double v28 = +[JoinMO generateInstance:v27];

        if (v28)
        {
          [v28 setSuccess:0];
          [v28 setReason:v7];
          [v28 setSubreason:v9];
          [v28 setDate:v54];
          __int16 v29 = [(AnalyticsProcessor *)self managedObjectHandler];
          int v30 = [v29 managedObjectContext];
          unsigned int v31 = +[NetworkMO getInstance:v22 moc:v30];

          if (v31)
          {
            char v55 = 0;
            int v32 = [(AnalyticsProcessor *)self managedObjectHandler];
            __int16 v33 = [v32 managedObjectContext];
            __int16 v15 = +[BSSMO generateInstance:v24 ssid:v22 created:&v55 moc:v33];

            if (v15)
            {
              [v15 addJoinsObject:v28];
              int v34 = WALogCategoryDeviceStoreHandle();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
              {
                double v35 = [v28 date];
                double v36 = [v15 bssid];
                *(_DWORD *)int buf = 136446978;
                uint64_t v57 = "-[AnalyticsProcessor processMetricAssociationFailure:]";
                __int16 v58 = 1024;
                int v59 = 1067;
                __int16 v60 = 2112;
                *(void *)__int16 v61 = v35;
                *(_WORD *)&v61[8] = 2112;
                *(void *)int v62 = v36;
                _os_log_impl(&dword_21D96D000, v34, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Added Join at [%@] to BSS[%@]", buf, 0x26u);
              }
              if (v55)
              {
                uint64_t v37 = [v31 bss];
                char v38 = [v37 containsObject:v15];

                if ((v38 & 1) == 0)
                {
                  [v31 addBssObject:v15];
                  uint64_t v39 = WALogCategoryDeviceStoreHandle();
                  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
                  {
                    uint64_t v40 = [v15 bssid];
                    v41 = [v31 ssid];
                    *(_DWORD *)int buf = 136446978;
                    uint64_t v57 = "-[AnalyticsProcessor processMetricAssociationFailure:]";
                    __int16 v58 = 1024;
                    int v59 = 1072;
                    __int16 v60 = 2112;
                    *(void *)__int16 v61 = v40;
                    *(_WORD *)&v61[8] = 2112;
                    *(void *)int v62 = v41;
                    _os_log_impl(&dword_21D96D000, v39, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Added BSS[%@] to Network[%@]", buf, 0x26u);
                  }
                }
              }
              unsigned int v42 = [(AnalyticsProcessor *)self managedObjectHandler];
              [v42 saveManagedObjectContext];

              uint64_t v43 = [(AnalyticsProcessor *)self managedObjectHandler];
              uint64_t v44 = [v43 managedObjectContext];
              [v44 reset];

              unsigned int v24 = v31;
            }
            else
            {
              int v49 = WALogCategoryDeviceStoreHandle();
              if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)int buf = 136446978;
                uint64_t v57 = "-[AnalyticsProcessor processMetricAssociationFailure:]";
                __int16 v58 = 1024;
                int v59 = 1064;
                __int16 v60 = 2112;
                *(void *)__int16 v61 = v22;
                *(_WORD *)&v61[8] = 2112;
                *(void *)int v62 = v24;
                _os_log_impl(&dword_21D96D000, v49, OS_LOG_TYPE_ERROR, "%{public}s::%d:bssMO nil for %@[%@]", buf, 0x26u);
              }

              unsigned int v24 = v28;
              __int16 v15 = v31;
            }
          }
          else
          {
            v48 = WALogCategoryDeviceStoreHandle();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)int buf = 136446722;
              uint64_t v57 = "-[AnalyticsProcessor processMetricAssociationFailure:]";
              __int16 v58 = 1024;
              int v59 = 1060;
              __int16 v60 = 2112;
              *(void *)__int16 v61 = v22;
              _os_log_impl(&dword_21D96D000, v48, OS_LOG_TYPE_ERROR, "%{public}s::%d:networkMO nil for ssid %@", buf, 0x1Cu);
            }

            unsigned int v24 = v22;
            __int16 v15 = v28;
          }
        }
        else
        {
          int v47 = WALogCategoryDeviceStoreHandle();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)int buf = 136446466;
            uint64_t v57 = "-[AnalyticsProcessor processMetricAssociationFailure:]";
            __int16 v58 = 1024;
            int v59 = 1052;
            _os_log_impl(&dword_21D96D000, v47, OS_LOG_TYPE_ERROR, "%{public}s::%d:joinMO nil", buf, 0x12u);
          }

          __int16 v15 = v22;
        }
        uint32_t v21 = v54;
      }
      else
      {
        v46 = WALogCategoryDeviceStoreHandle();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)int buf = 136446466;
          uint64_t v57 = "-[AnalyticsProcessor processMetricAssociationFailure:]";
          __int16 v58 = 1024;
          int v59 = 1044;
          _os_log_impl(&dword_21D96D000, v46, OS_LOG_TYPE_ERROR, "%{public}s::%d:date nil", buf, 0x12u);
        }

        unsigned int v24 = v16;
      }
    }
    else
    {
      unsigned int v24 = WALogCategoryDeviceStoreHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)int buf = 136446466;
        uint64_t v57 = "-[AnalyticsProcessor processMetricAssociationFailure:]";
        __int16 v58 = 1024;
        int v59 = 1043;
        _os_log_impl(&dword_21D96D000, v24, OS_LOG_TYPE_ERROR, "%{public}s::%d:bssid is nil", buf, 0x12u);
      }
    }
  }
  else
  {
    unsigned int v24 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 136446466;
      uint64_t v57 = "-[AnalyticsProcessor processMetricAssociationFailure:]";
      __int16 v58 = 1024;
      int v59 = 1042;
      _os_log_impl(&dword_21D96D000, v24, OS_LOG_TYPE_ERROR, "%{public}s::%d:ssid is nil", buf, 0x12u);
    }
    __int16 v15 = v16;
  }

  int v45 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v45))
  {
    *(_WORD *)int buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v45, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricAssociationFailure", "", buf, 2u);
  }
}

- (void)processMetricNetworkGeotag:(id)a3
{
  uint64_t v101 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)int buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricNetworkGeotag", "", buf, 2u);
  }

  v83 = [MEMORY[0x263EFF9C0] set];
  unsigned int v6 = [v4 valueForKey:@"ssid"];
  uint64_t v7 = [v4 valueForKey:@"bssid"];
  uint64_t v8 = [(AnalyticsProcessor *)self formattedNotation:v7 octetCount:6];

  uint64_t v9 = [v4 valueForKey:@"latitude"];
  [v9 doubleValue];
  CLLocationDegrees v11 = v10;

  int v12 = [v4 valueForKey:@"longitude"];
  [v12 doubleValue];
  CLLocationDegrees v14 = v13;

  __int16 v15 = [v4 valueForKey:@"metricDate"];
  [v15 doubleValue];
  double v17 = v16;

  uint64_t v18 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:v17];
  double v19 = WALogCategoryDeviceStoreHandle();
  uint64_t v20 = v19;
  uint64_t v81 = (void *)v18;
  v78 = (void *)v8;
  if (!v18)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 136446466;
      v90 = "-[AnalyticsProcessor processMetricNetworkGeotag:]";
      __int16 v91 = 1024;
      int v92 = 1101;
      v72 = "%{public}s::%d:date nil";
      __int16 v73 = v20;
      uint32_t v74 = 18;
LABEL_52:
      _os_log_impl(&dword_21D96D000, v73, OS_LOG_TYPE_ERROR, v72, buf, v74);
    }
LABEL_53:
    id v52 = 0;
    BOOL v82 = 0;
    __int16 v67 = 0;
    goto LABEL_57;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)int buf = 136447490;
    v90 = "-[AnalyticsProcessor processMetricNetworkGeotag:]";
    __int16 v91 = 1024;
    int v92 = 1103;
    __int16 v93 = 2112;
    v94 = v6;
    __int16 v95 = 2112;
    uint64_t v96 = v8;
    __int16 v97 = 2048;
    CLLocationDegrees v98 = v11;
    __int16 v99 = 2048;
    CLLocationDegrees v100 = v14;
    _os_log_impl(&dword_21D96D000, v20, OS_LOG_TYPE_DEBUG, "%{public}s::%d:SSID:%@ BSSID:%@ latitude:%f longitude:%f", buf, 0x3Au);
  }

  uint32_t v21 = [(AnalyticsProcessor *)self managedObjectHandler];
  int v22 = [v21 managedObjectContext];
  objc_super v23 = +[BSSMO getInstance:v8 ssid:v6 moc:v22];

  if (!v23)
  {
    uint64_t v20 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 136446978;
      v90 = "-[AnalyticsProcessor processMetricNetworkGeotag:]";
      __int16 v91 = 1024;
      int v92 = 1106;
      __int16 v93 = 2112;
      v94 = v6;
      __int16 v95 = 2112;
      uint64_t v96 = v8;
      v72 = "%{public}s::%d:bssMO nil for %@[%@]";
      __int16 v73 = v20;
      uint32_t v74 = 38;
      goto LABEL_52;
    }
    goto LABEL_53;
  }
  uint64_t v24 = [v23 geoTag];
  uint64_t v79 = self;
  double v80 = v23;
  id v77 = v24;
  if (!v24)
  {
    BOOL v82 = 0;
LABEL_37:
    uint64_t v54 = [(AnalyticsProcessor *)self managedObjectHandler];
    char v55 = [v54 managedObjectContext];
    int v53 = +[GeoTagMO generateInstance:v55];

    if (v53)
    {
      [v53 setTaggedCount:0];
      id v52 = 0;
      goto LABEL_39;
    }
    uint64_t v75 = WALogCategoryDeviceStoreHandle();
    uint64_t v20 = v77;
    __int16 v67 = v80;
    if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 136446466;
      v90 = "-[AnalyticsProcessor processMetricNetworkGeotag:]";
      __int16 v91 = 1024;
      int v92 = 1153;
      _os_log_impl(&dword_21D96D000, v75, OS_LOG_TYPE_ERROR, "%{public}s::%d:geotagMO nil", buf, 0x12u);
    }

    id v52 = 0;
LABEL_57:
    int v53 = 0;
    goto LABEL_45;
  }
  id v25 = (void *)v24;
  id v76 = v4;
  id v26 = objc_alloc(MEMORY[0x263F00A58]);
  CLLocationCoordinate2D v27 = CLLocationCoordinate2DMake(v11, v14);
  double v28 = objc_msgSend(v26, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v81, v27.latitude, v27.longitude, -1.0, -1.0, -1.0);
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  id v29 = v25;
  uint64_t v30 = [v29 countByEnumeratingWithState:&v84 objects:v88 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    BOOL v82 = 0;
    int v32 = 0;
    uint64_t v33 = *(void *)v85;
    double v34 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v85 != v33) {
          objc_enumerationMutation(v29);
        }
        double v36 = *(void **)(*((void *)&v84 + 1) + 8 * i);
        uint64_t v37 = [v36 date];
        [v37 timeIntervalSinceNow];
        double v39 = v38;

        if (v39 >= -31104000.0)
        {
          if (v39 < 0.0)
          {
            id v41 = v36;

            int v32 = v41;
          }
          id v42 = objc_alloc(MEMORY[0x263F00A58]);
          [v36 latitude];
          CLLocationDegrees v44 = v43;
          [v36 longitude];
          CLLocationCoordinate2D v46 = CLLocationCoordinate2DMake(v44, v45);
          int v47 = [v36 date];
          v48 = objc_msgSend(v42, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v47, v46.latitude, v46.longitude, -1.0, -1.0, -1.0);

          [v48 distanceFromLocation:v28];
          if (v49 <= 300.0)
          {
            double v50 = v49;
            if (!v82 || v49 < v34)
            {
              id v51 = v36;

              double v34 = v50;
              BOOL v82 = v51;
            }
          }
        }
        else
        {
          uint64_t v40 = WALogCategoryDeviceStoreHandle();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)int buf = 136446722;
            v90 = "-[AnalyticsProcessor processMetricNetworkGeotag:]";
            __int16 v91 = 1024;
            int v92 = 1118;
            __int16 v93 = 2112;
            v94 = v36;
            _os_log_impl(&dword_21D96D000, v40, OS_LOG_TYPE_ERROR, "%{public}s::%d:Expired geotag %@", buf, 0x1Cu);
          }

          [v83 addObject:v36];
        }
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v84 objects:v88 count:16];
    }
    while (v31);
  }
  else
  {
    BOOL v82 = 0;
    int v32 = 0;
  }

  if ((unint64_t)[v29 count] >= 5)
  {
    if (v32)
    {
      [v83 addObject:v32];
      if (v82 == v32)
      {

        id v4 = v76;
        goto LABEL_36;
      }
    }
  }

  id v4 = v76;
  if (!v82)
  {
    BOOL v82 = v32;
LABEL_36:
    self = v79;
    goto LABEL_37;
  }
  id v52 = v82;
  BOOL v82 = v32;
  int v53 = v52;
LABEL_39:
  if ([v53 taggedCount])
  {
    [v53 latitude];
    objc_msgSend(v53, "setLatitude:", (v11 + v56 * (double)(int)objc_msgSend(v53, "taggedCount")) / (double)(int)(objc_msgSend(v53, "taggedCount") + 1));
    [v53 longitude];
    CLLocationDegrees v58 = v14 + v57 * (double)(int)[v53 taggedCount];
    CLLocationDegrees v14 = v58 / (double)(int)([v53 taggedCount] + 1);
  }
  else
  {
    [v53 setLatitude:v11];
  }
  [v53 setLongitude:v14];
  objc_msgSend(v53, "setTaggedCount:", objc_msgSend(v53, "taggedCount") + 1);
  [v53 setDate:v81];
  [v80 removeGeoTag:v83];
  [v80 addGeoTagObject:v53];
  int v59 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
  {
    [v53 latitude];
    __int16 v61 = v60;
    [v53 longitude];
    uint64_t v63 = v62;
    int v64 = [v80 bssid];
    *(_DWORD *)int buf = 136447234;
    v90 = "-[AnalyticsProcessor processMetricNetworkGeotag:]";
    __int16 v91 = 1024;
    int v92 = 1169;
    __int16 v93 = 2048;
    v94 = v61;
    __int16 v95 = 2048;
    uint64_t v96 = v63;
    __int16 v97 = 2112;
    CLLocationDegrees v98 = *(double *)&v64;
    _os_log_impl(&dword_21D96D000, v59, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Added Geotag at (lat:%f long:%f) to BSS[%@]", buf, 0x30u);
  }
  __int16 v65 = [(AnalyticsProcessor *)v79 managedObjectHandler];
  int v66 = [v65 managedObjectContext];
  +[NetworkMO classifyTraitsForNetwork:v6 distanceFilter:v66 moc:4000.0];

  __int16 v67 = v80;
  char v68 = [(AnalyticsProcessor *)v79 managedObjectHandler];
  [v68 saveManagedObjectContext];

  __int16 v69 = [(AnalyticsProcessor *)v79 managedObjectHandler];
  v70 = [v69 managedObjectContext];
  [v70 reset];

  uint64_t v20 = v77;
LABEL_45:

  __int16 v71 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v71))
  {
    *(_WORD *)int buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v71, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricNetworkGeotag", "", buf, 2u);
  }
}

- (void)processMetricClientAssociation:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v5))
  {
    LOWORD(v26) = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricClientAssociation", "", (uint8_t *)&v26, 2u);
  }

  unsigned int v6 = [v4 valueForKey:@"ssid"];
  uint64_t v7 = [v4 valueForKey:@"networkAuthFlags"];
  int v8 = [v7 unsignedCharValue];

  uint64_t v9 = [v4 valueForKey:@"switchedFromNetworkSSID"];
  double v10 = [v4 valueForKey:@"networkAuthFlags"];

  int v11 = [v10 unsignedCharValue];
  int v12 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v26 = 136447490;
    CLLocationCoordinate2D v27 = "-[AnalyticsProcessor processMetricClientAssociation:]";
    __int16 v28 = 1024;
    int v29 = 1192;
    __int16 v30 = 2112;
    uint64_t v31 = v6;
    __int16 v32 = 1024;
    *(_DWORD *)uint64_t v33 = v8;
    *(_WORD *)&v33[4] = 2112;
    *(void *)&v33[6] = v9;
    *(_WORD *)&v33[14] = 1024;
    *(_DWORD *)&v33[16] = v11;
    _os_log_impl(&dword_21D96D000, v12, OS_LOG_TYPE_DEBUG, "%{public}s::%d:SSID: %@ securityType: %d prevSsid: %@ prevSecurityType: %d", (uint8_t *)&v26, 0x32u);
  }

  double v13 = [(AnalyticsProcessor *)self managedObjectHandler];
  CLLocationDegrees v14 = [v13 managedObjectContext];
  __int16 v15 = +[NetworkMO getInstance:v6 moc:v14];

  if (v15)
  {
    if (v9)
    {
      double v16 = [(AnalyticsProcessor *)self managedObjectHandler];
      double v17 = [v16 managedObjectContext];
      uint64_t v18 = +[NetworkMO getInstance:v9 moc:v17];

      if (v18)
      {
        objc_msgSend(v18, "setSwitchedAwayFromCount:", objc_msgSend(v18, "switchedAwayFromCount") + 1);
        objc_msgSend(v15, "setSwitchedToCount:", objc_msgSend(v15, "switchedToCount") + 1);
        double v19 = WALogCategoryDeviceStoreHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v20 = [v15 switchedToCount];
          uint64_t v21 = [v18 switchedAwayFromCount];
          int v26 = 136447490;
          CLLocationCoordinate2D v27 = "-[AnalyticsProcessor processMetricClientAssociation:]";
          __int16 v28 = 1024;
          int v29 = 1208;
          __int16 v30 = 2112;
          uint64_t v31 = v6;
          __int16 v32 = 2048;
          *(void *)uint64_t v33 = v20;
          *(_WORD *)&v33[8] = 2112;
          *(void *)&v33[10] = v9;
          *(_WORD *)&v33[18] = 2048;
          uint64_t v34 = v21;
          _os_log_impl(&dword_21D96D000, v19, OS_LOG_TYPE_DEBUG, "%{public}s::%d:SSID: %@ switchedTo: %lu SSID: %@ switchedAway: %lu", (uint8_t *)&v26, 0x3Au);
        }

        int v22 = [(AnalyticsProcessor *)self managedObjectHandler];
        [v22 saveManagedObjectContext];

        objc_super v23 = [(AnalyticsProcessor *)self managedObjectHandler];
        uint64_t v24 = [v23 managedObjectContext];
        [v24 reset];
      }
    }
  }
  id v25 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v25))
  {
    LOWORD(v26) = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v25, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricClientAssociation", "", (uint8_t *)&v26, 2u);
  }
}

- (void)processMetricParsedBeaconInfo:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v5))
  {
    LOWORD(v22) = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricParsedBeaconInfo", "", (uint8_t *)&v22, 2u);
  }

  unsigned int v6 = [v4 valueForKey:@"ssid"];
  uint64_t v7 = [v4 valueForKey:@"bssid"];
  int v8 = [(AnalyticsProcessor *)self formattedNotation:v7 octetCount:6];

  uint64_t v9 = [(AnalyticsProcessor *)self managedObjectHandler];
  double v10 = [v9 managedObjectContext];
  int v11 = +[BSSMO getInstance:v8 ssid:v6 moc:v10];

  if (v11)
  {
    int v12 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v4];
    [v12 removeObjectForKey:@"ssid"];
    [v12 removeObjectForKey:@"bssid"];
    [v12 removeObjectForKey:@"scanBssidList"];
    [v12 removeObjectForKey:@"scanDirected"];
    [v12 removeObjectForKey:@"age"];
    [v12 removeObjectForKey:@"rssi"];
    [v12 removeObjectForKey:@"snr"];
    [v12 removeObjectForKey:@"channel"];
    [v12 removeObjectForKey:@"channelFlags"];
    [v12 removeObjectForKey:@"noise"];
    double v13 = [v11 parsedBeacon];

    if (v13)
    {
      CLLocationDegrees v14 = [v11 parsedBeacon];
      if ([v14 isEqualToDictionary:v12])
      {
        int v15 = 0;
LABEL_12:

        double v19 = WALogCategoryDeviceStoreHandle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          objc_super v23 = "-[AnalyticsProcessor processMetricParsedBeaconInfo:]";
          __int16 v24 = 1024;
          uint64_t v20 = "Did not update";
          int v25 = 1266;
          int v22 = 136447234;
          __int16 v26 = 2080;
          if (v15) {
            uint64_t v20 = "Updated";
          }
          CLLocationCoordinate2D v27 = v20;
          __int16 v28 = 2112;
          int v29 = v6;
          __int16 v30 = 2112;
          uint64_t v31 = v8;
          _os_log_impl(&dword_21D96D000, v19, OS_LOG_TYPE_DEBUG, "%{public}s::%d:%s for ssid:%@ bssid:%@", (uint8_t *)&v22, 0x30u);
        }

        goto LABEL_17;
      }
      double v16 = WALogCategoryDeviceStoreHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        int v22 = 136446466;
        objc_super v23 = "-[AnalyticsProcessor processMetricParsedBeaconInfo:]";
        __int16 v24 = 1024;
        int v25 = 1252;
        _os_log_impl(&dword_21D96D000, v16, OS_LOG_TYPE_ERROR, "%{public}s::%d:existing dictionary doesn't match.. overwriting", (uint8_t *)&v22, 0x12u);
      }

      [v11 setParsedBeacon:v12];
    }
    else
    {
      [v11 setParsedBeacon:v12];
    }
    double v17 = [(AnalyticsProcessor *)self managedObjectHandler];
    [v17 saveManagedObjectContext];

    CLLocationDegrees v14 = [(AnalyticsProcessor *)self managedObjectHandler];
    uint64_t v18 = [v14 managedObjectContext];
    [v18 reset];

    int v15 = 1;
    goto LABEL_12;
  }
  int v12 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    int v22 = 136446978;
    objc_super v23 = "-[AnalyticsProcessor processMetricParsedBeaconInfo:]";
    __int16 v24 = 1024;
    int v25 = 1232;
    __int16 v26 = 2112;
    CLLocationCoordinate2D v27 = (const char *)v6;
    __int16 v28 = 2112;
    int v29 = v8;
    _os_log_impl(&dword_21D96D000, v12, OS_LOG_TYPE_ERROR, "%{public}s::%d:bssMO nil for %@[%@]", (uint8_t *)&v22, 0x26u);
  }
LABEL_17:

  uint64_t v21 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v21))
  {
    LOWORD(v22) = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v21, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricParsedBeaconInfo", "", (uint8_t *)&v22, 2u);
  }
}

- (void)processMetricHistoricalNetworkQuality:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)int buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricHistoricalNetworkQuality", "", buf, 2u);
  }

  id v5 = [v3 valueForKey:@"networkHistoricalQuality"];
  unsigned int v6 = v5;
  if (!v5)
  {
    uint64_t v7 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 136446466;
      uint64_t v37 = "-[AnalyticsProcessor processMetricHistoricalNetworkQuality:]";
      __int16 v38 = 1024;
      int v39 = 1277;
      _os_log_impl(&dword_21D96D000, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:ssidAndQualityArr nil", buf, 0x12u);
    }
    goto LABEL_26;
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v32 objects:v44 count:16];
  if (!v8) {
    goto LABEL_26;
  }
  uint64_t v9 = v8;
  __int16 v28 = v6;
  id v29 = v3;
  uint64_t v10 = *(void *)v33;
  unsigned int obj = v7;
  while (2)
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v33 != v10) {
        objc_enumerationMutation(obj);
      }
      int v12 = *(void **)(*((void *)&v32 + 1) + 8 * i);
      double v13 = objc_msgSend(v12, "objectForKey:", @"ssid", v28);
      CLLocationDegrees v14 = [v12 objectForKey:@"ssid"];

      if (!v14)
      {
        int v25 = WALogCategoryDeviceStoreHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)int buf = 136446466;
          uint64_t v37 = "-[AnalyticsProcessor processMetricHistoricalNetworkQuality:]";
          __int16 v38 = 1024;
          int v39 = 1281;
          __int16 v26 = "%{public}s::%d:ssid nil";
LABEL_23:
          _os_log_impl(&dword_21D96D000, v25, OS_LOG_TYPE_ERROR, v26, buf, 0x12u);
        }
LABEL_24:
        id v3 = v29;
LABEL_25:
        unsigned int v6 = v28;

        uint64_t v7 = obj;
        goto LABEL_26;
      }
      int v15 = [v12 objectForKey:@"isTCPGood"];

      if (!v15)
      {
        int v25 = WALogCategoryDeviceStoreHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)int buf = 136446466;
          uint64_t v37 = "-[AnalyticsProcessor processMetricHistoricalNetworkQuality:]";
          __int16 v38 = 1024;
          int v39 = 1282;
          __int16 v26 = "%{public}s::%d:isTCPGood nil";
          goto LABEL_23;
        }
        goto LABEL_24;
      }
      double v16 = [v12 objectForKey:@"isTCPGood"];
      uint64_t v17 = [v16 BOOLValue];

      uint64_t v18 = WALogCategoryDeviceStoreHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)int buf = 136446978;
        double v19 = @"bad";
        if (v17) {
          double v19 = @"good";
        }
        uint64_t v37 = "-[AnalyticsProcessor processMetricHistoricalNetworkQuality:]";
        __int16 v38 = 1024;
        int v39 = 1286;
        __int16 v40 = 2112;
        id v41 = v13;
        __int16 v42 = 2112;
        double v43 = v19;
        _os_log_impl(&dword_21D96D000, v18, OS_LOG_TYPE_DEBUG, "%{public}s::%d:%@ is known %@", buf, 0x26u);
      }

      uint64_t v20 = [(AnalyticsProcessor *)self managedObjectHandler];
      uint64_t v21 = [v20 managedObjectContext];
      int v22 = +[NetworkMO getInstance:v13 moc:v21];

      if (!v22)
      {
        int v25 = WALogCategoryDeviceStoreHandle();
        id v3 = v29;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)int buf = 136446722;
          uint64_t v37 = "-[AnalyticsProcessor processMetricHistoricalNetworkQuality:]";
          __int16 v38 = 1024;
          int v39 = 1289;
          __int16 v40 = 2112;
          id v41 = v13;
          _os_log_impl(&dword_21D96D000, v25, OS_LOG_TYPE_ERROR, "%{public}s::%d:networkMO nil for ssid %@", buf, 0x1Cu);
        }
        goto LABEL_25;
      }
      [v22 setIsTCPGood:v17];
    }
    uint64_t v9 = [obj countByEnumeratingWithState:&v32 objects:v44 count:16];
    if (v9) {
      continue;
    }
    break;
  }

  objc_super v23 = [(AnalyticsProcessor *)self managedObjectHandler];
  [v23 saveManagedObjectContext];

  uint64_t v7 = [(AnalyticsProcessor *)self managedObjectHandler];
  __int16 v24 = [v7 managedObjectContext];
  [v24 reset];

  unsigned int v6 = v28;
  id v3 = v29;
LABEL_26:

  CLLocationCoordinate2D v27 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v27))
  {
    *(_WORD *)int buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v27, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricHistoricalNetworkQuality", "", buf, 2u);
  }
}

- (void)processMetricBeaconCache:(id)a3
{
  uint64_t v93 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)int buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricBeaconCache", "", buf, 2u);
  }

  id v5 = objc_msgSend(v3, "valueForKey:");
  unsigned int v6 = objc_msgSend(v3, "valueForKey:");
  __int16 v61 = [(AnalyticsProcessor *)self formattedNotation:v6 octetCount:6];

  uint64_t v7 = [v3 valueForKey:@"metricDate"];
  [v7 doubleValue];
  double v9 = v8;

  uint64_t v63 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:v9];
  if (!v63)
  {
    CLLocationDegrees v14 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_56;
    }
    *(_DWORD *)int buf = 136446466;
    v78 = "-[AnalyticsProcessor processMetricBeaconCache:]";
    __int16 v79 = 1024;
    int v80 = 1319;
    id v52 = "%{public}s::%d:date nil";
LABEL_63:
    _os_log_impl(&dword_21D96D000, v14, OS_LOG_TYPE_ERROR, v52, buf, 0x12u);
    goto LABEL_56;
  }
  uint64_t v10 = [v3 valueForKey:@"beaconCacheResults"];
  if (!v10)
  {
    CLLocationDegrees v14 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_56;
    }
    *(_DWORD *)int buf = 136446466;
    v78 = "-[AnalyticsProcessor processMetricBeaconCache:]";
    __int16 v79 = 1024;
    int v80 = 1322;
    id v52 = "%{public}s::%d:beaconCacheResults nil";
    goto LABEL_63;
  }
  int v11 = v10;
  if (!v5)
  {
    int v53 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
      goto LABEL_74;
    }
    *(_DWORD *)int buf = 136446466;
    v78 = "-[AnalyticsProcessor processMetricBeaconCache:]";
    __int16 v79 = 1024;
    int v80 = 1323;
    uint64_t v54 = "%{public}s::%d:ssid nil";
LABEL_70:
    char v55 = v53;
    uint32_t v56 = 18;
LABEL_73:
    _os_log_impl(&dword_21D96D000, v55, OS_LOG_TYPE_ERROR, v54, buf, v56);
    goto LABEL_74;
  }
  if (!v61)
  {
    int v53 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
      goto LABEL_74;
    }
    *(_DWORD *)int buf = 136446466;
    v78 = "-[AnalyticsProcessor processMetricBeaconCache:]";
    __int16 v79 = 1024;
    int v80 = 1324;
    uint64_t v54 = "%{public}s::%d:bssid nil";
    goto LABEL_70;
  }
  if ((unint64_t)[v10 count] <= 1)
  {
    int v53 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
      goto LABEL_74;
    }
    *(_DWORD *)int buf = 136446466;
    v78 = "-[AnalyticsProcessor processMetricBeaconCache:]";
    __int16 v79 = 1024;
    int v80 = 1325;
    uint64_t v54 = "%{public}s::%d:Not enough results";
    goto LABEL_70;
  }
  int v12 = [(AnalyticsProcessor *)self managedObjectHandler];
  double v13 = [v12 managedObjectContext];
  CLLocationDegrees v14 = +[BSSMO getInstance:v61 ssid:v5 moc:v13];

  if (!v14)
  {
    int v53 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 136446978;
      v78 = "-[AnalyticsProcessor processMetricBeaconCache:]";
      __int16 v79 = 1024;
      int v80 = 1328;
      __int16 v81 = 2112;
      BOOL v82 = v5;
      __int16 v83 = 2112;
      *(void *)long long v84 = v61;
      uint64_t v54 = "%{public}s::%d:bssMO nil for %@[%@]";
      char v55 = v53;
      uint32_t v56 = 38;
      goto LABEL_73;
    }
LABEL_74:

    CLLocationDegrees v14 = v11;
    goto LABEL_56;
  }
  int v15 = [v3 valueForKey:@"channel"];

  if (v15)
  {
    double v16 = [v3 valueForKey:@"channel"];
    -[NSObject setChannel:](v14, "setChannel:", (__int16)[v16 unsignedIntValue]);
  }
  uint64_t v17 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K == %@", @"bssid", v61];
  uint64_t v18 = [v11 filteredArrayUsingPredicate:v17];
  if ([v18 count] != 1)
  {
    double v57 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 136446466;
      v78 = "-[AnalyticsProcessor processMetricBeaconCache:]";
      __int16 v79 = 1024;
      int v80 = 1337;
      _os_log_impl(&dword_21D96D000, v57, OS_LOG_TYPE_ERROR, "%{public}s::%d:Failed to find connected Bssid in the scan results", buf, 0x12u);
    }

    goto LABEL_56;
  }
  int v59 = v5;
  __int16 v60 = v17;
  int v64 = v14;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id obj = v18;
  uint64_t v19 = [obj countByEnumeratingWithState:&v73 objects:v92 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v74;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v74 != v21) {
          objc_enumerationMutation(obj);
        }
        objc_super v23 = [*(id *)(*((void *)&v73 + 1) + 8 * i) valueForKey:@"rssi"];
        if (!v23)
        {
          v48 = WALogCategoryDeviceStoreHandle();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)int buf = 136446466;
            v78 = "-[AnalyticsProcessor processMetricBeaconCache:]";
            __int16 v79 = 1024;
            int v80 = 1342;
            _os_log_impl(&dword_21D96D000, v48, OS_LOG_TYPE_ERROR, "%{public}s::%d:rssiRes for connected Bssid nil", buf, 0x12u);
          }

          goto LABEL_43;
        }
        __int16 v24 = v23;
        int v25 = [v23 intValue];
      }
      uint64_t v20 = [obj countByEnumeratingWithState:&v73 objects:v92 count:16];
    }
    while (v20);
    id v58 = v3;
  }
  else
  {
    id v58 = v3;
    int v25 = 0;
  }

  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  uint64_t v62 = v11;
  uint64_t v66 = [v62 countByEnumeratingWithState:&v69 objects:v91 count:16];
  if (!v66) {
    goto LABEL_39;
  }
  uint64_t v65 = *(void *)v70;
  while (2)
  {
    for (uint64_t j = 0; j != v66; ++j)
    {
      if (*(void *)v70 != v65) {
        objc_enumerationMutation(v62);
      }
      CLLocationCoordinate2D v27 = *(void **)(*((void *)&v69 + 1) + 8 * j);
      __int16 v28 = [v27 valueForKey:@"rssi"];
      id v29 = [v27 valueForKey:@"ssid"];
      __int16 v30 = [v27 valueForKey:@"channel"];
      uint64_t v31 = [v27 valueForKey:@"bssid"];
      long long v32 = [(AnalyticsProcessor *)self formattedNotation:v31 octetCount:6];

      if (!v28)
      {
        double v49 = WALogCategoryDeviceStoreHandle();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)int buf = 136446466;
          v78 = "-[AnalyticsProcessor processMetricBeaconCache:]";
          __int16 v79 = 1024;
          int v80 = 1353;
          _os_log_impl(&dword_21D96D000, v49, OS_LOG_TYPE_ERROR, "%{public}s::%d:rssiRes nil", buf, 0x12u);
        }

        double v50 = v32;
        goto LABEL_54;
      }
      if (!v29)
      {
        double v50 = WALogCategoryDeviceStoreHandle();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)int buf = 136446466;
          v78 = "-[AnalyticsProcessor processMetricBeaconCache:]";
          __int16 v79 = 1024;
          int v80 = 1354;
          _os_log_impl(&dword_21D96D000, v50, OS_LOG_TYPE_ERROR, "%{public}s::%d:ssidRes nil", buf, 0x12u);
        }
        id v29 = v30;
        goto LABEL_55;
      }
      if (!v30)
      {
        double v50 = WALogCategoryDeviceStoreHandle();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)int buf = 136446466;
          v78 = "-[AnalyticsProcessor processMetricBeaconCache:]";
          __int16 v79 = 1024;
          int v80 = 1355;
          _os_log_impl(&dword_21D96D000, v50, OS_LOG_TYPE_ERROR, "%{public}s::%d:chanRes nil", buf, 0x12u);
        }
        goto LABEL_55;
      }
      if (!v32)
      {
        double v50 = WALogCategoryDeviceStoreHandle();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)int buf = 136446466;
          v78 = "-[AnalyticsProcessor processMetricBeaconCache:]";
          __int16 v79 = 1024;
          int v80 = 1356;
          _os_log_impl(&dword_21D96D000, v50, OS_LOG_TYPE_ERROR, "%{public}s::%d:bssidRes nil", buf, 0x12u);
        }
LABEL_54:
        long long v32 = v30;
LABEL_55:
        id v3 = v58;
        id v5 = v59;
        CLLocationDegrees v14 = v64;

        goto LABEL_56;
      }
      long long v33 = [(AnalyticsProcessor *)self managedObjectHandler];
      long long v34 = [v33 managedObjectContext];
      long long v35 = +[BSSMO getInstance:v32 ssid:v29 moc:v34];

      if (v35)
      {
        double v36 = [v27 valueForKey:@"channel"];

        if (v36)
        {
          uint64_t v37 = [v27 valueForKey:@"channel"];
          objc_msgSend(v35, "setChannel:", (__int16)objc_msgSend(v37, "unsignedIntValue"));
        }
        __int16 v38 = WALogCategoryDeviceStoreHandle();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          int v39 = [v64 channel];
          int v40 = [v35 channel];
          int v41 = [v28 intValue];
          *(_DWORD *)int buf = 136448002;
          v78 = "-[AnalyticsProcessor processMetricBeaconCache:]";
          __int16 v79 = 1024;
          int v80 = 1368;
          __int16 v81 = 2112;
          BOOL v82 = v61;
          __int16 v83 = 1024;
          *(_DWORD *)long long v84 = v39;
          *(_WORD *)&v84[4] = 1024;
          *(_DWORD *)&v84[6] = v25;
          __int16 v85 = 2112;
          long long v86 = v32;
          __int16 v87 = 1024;
          int v88 = v40;
          __int16 v89 = 1024;
          int v90 = v41;
          _os_log_impl(&dword_21D96D000, v38, OS_LOG_TYPE_DEBUG, "%{public}s::%d:origin %@(chan: %d) rssi %d neighbor %@(chan: %d) rssi %d", buf, 0x3Eu);
        }

        __int16 v42 = [(AnalyticsProcessor *)self managedObjectHandler];
        double v43 = [v42 managedObjectContext];
        CLLocationDegrees v44 = +[ScanMO generateInstance:v43];

        [v44 setOriginRssi:(__int16)v25];
        objc_msgSend(v44, "setResultRssi:", (__int16)objc_msgSend(v28, "intValue"));
        [v44 setOrigin:v64];
        [v44 setResult:v35];
        [v44 setDate:v63];
      }
    }
    uint64_t v66 = [v62 countByEnumeratingWithState:&v69 objects:v91 count:16];
    if (v66) {
      continue;
    }
    break;
  }
LABEL_39:

  uint64_t v45 = [(AnalyticsProcessor *)self managedObjectHandler];
  [v45 saveManagedObjectContext];

  CLLocationCoordinate2D v46 = [(AnalyticsProcessor *)self managedObjectHandler];
  int v47 = [v46 managedObjectContext];
  [v47 reset];

  id v3 = v58;
LABEL_43:
  id v5 = v59;
  CLLocationDegrees v14 = v64;
LABEL_56:

  id v51 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v51))
  {
    *(_WORD *)int buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v51, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricBeaconCache", "", buf, 2u);
  }
}

- (void)processMetricFault:(id)a3
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)int buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricFault", "", buf, 2u);
  }

  unsigned int v6 = [v4 valueForKey:@"name"];
  if (v6)
  {
    uint64_t v7 = [v4 valueForKey:@"interface"];
    double v8 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)int buf = 136446978;
      double v50 = "-[AnalyticsProcessor processMetricFault:]";
      __int16 v51 = 1024;
      int v52 = 1405;
      __int16 v53 = 2112;
      uint64_t v54 = v6;
      __int16 v55 = 2112;
      uint32_t v56 = v7;
      _os_log_impl(&dword_21D96D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Processing Fault %@, Interface %@", buf, 0x26u);
    }

    double v9 = [(AnalyticsProcessor *)self managedObjectHandler];
    uint64_t v10 = [v9 managedObjectContext];
    int v11 = +[FaultMO generateInstance:v10];

    if (v11)
    {
      [v11 setType:v6];
      if (v7) {
        [v11 setInterface:v7];
      }
      int v12 = [v4 valueForKey:@"date"];

      if (v12) {
        [v4 valueForKey:@"date"];
      }
      else {
      double v13 = [MEMORY[0x263EFF910] date];
      }
      [v11 setDate:v13];

      CLLocationDegrees v14 = [(AnalyticsProcessor *)self managedObjectHandler];
      int v15 = [v14 managedObjectContext];
      double v16 = +[JoinMO mostRecentJoin:0 ssid:0 moc:v15];

      uint64_t v17 = WALogCategoryDeviceStoreHandle();
      BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
      if (!v16)
      {
        if (v18)
        {
          *(_DWORD *)int buf = 136446466;
          double v50 = "-[AnalyticsProcessor processMetricFault:]";
          __int16 v51 = 1024;
          int v52 = 1438;
          _os_log_impl(&dword_21D96D000, v17, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:No joinMO found", buf, 0x12u);
        }
        goto LABEL_21;
      }
      CLLocationCoordinate2D v46 = v7;
      int v47 = v6;
      id v48 = v4;
      if (v18)
      {
        uint64_t v19 = [v16 bss];
        uint64_t v20 = [v19 network];
        uint64_t v21 = [v20 ssid];
        int v22 = [v16 bss];
        objc_super v23 = [v22 bssid];
        *(_DWORD *)int buf = 136446978;
        double v50 = "-[AnalyticsProcessor processMetricFault:]";
        __int16 v51 = 1024;
        int v52 = 1429;
        __int16 v53 = 2112;
        uint64_t v54 = v21;
        __int16 v55 = 2112;
        uint32_t v56 = v23;
        _os_log_impl(&dword_21D96D000, v17, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Finding BSSMO for ssid %@ bssid %@", buf, 0x26u);
      }
      __int16 v24 = [v16 bss];
      int v25 = [v24 bssid];
      uint64_t v45 = v16;
      __int16 v26 = [v16 bss];
      CLLocationCoordinate2D v27 = [v26 network];
      __int16 v28 = [v27 ssid];
      CLLocationDegrees v44 = self;
      id v29 = [(AnalyticsProcessor *)self managedObjectHandler];
      __int16 v30 = [v29 managedObjectContext];
      uint64_t v17 = +[BSSMO getInstance:v25 ssid:v28 moc:v30];

      uint64_t v31 = WALogCategoryDeviceStoreHandle();
      long long v32 = v31;
      if (v17)
      {
        uint64_t v7 = v46;
        unsigned int v6 = v47;
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)int buf = 136446466;
          double v50 = "-[AnalyticsProcessor processMetricFault:]";
          __int16 v51 = 1024;
          int v52 = 1434;
          _os_log_impl(&dword_21D96D000, v32, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Associating Fault to mostRecentJoin", buf, 0x12u);
        }

        [v17 addFaultsObject:v11];
        id v4 = v48;
        self = v44;
        double v16 = v45;
LABEL_21:

        long long v33 = [(AnalyticsProcessor *)self managedObjectHandler];
        [v33 saveManagedObjectContext];

        long long v34 = [(AnalyticsProcessor *)self managedObjectHandler];
        long long v35 = [v34 managedObjectContext];
        [v35 reset];

        goto LABEL_22;
      }
      unsigned int v6 = v47;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        int v39 = [v45 bss];
        int v40 = [v39 network];
        int v41 = [v40 ssid];
        __int16 v42 = [v45 bss];
        double v43 = [v42 bssid];
        *(_DWORD *)int buf = 136446978;
        double v50 = "-[AnalyticsProcessor processMetricFault:]";
        __int16 v51 = 1024;
        int v52 = 1432;
        __int16 v53 = 2112;
        uint64_t v54 = v41;
        __int16 v55 = 2112;
        uint32_t v56 = v43;
        _os_log_impl(&dword_21D96D000, v32, OS_LOG_TYPE_ERROR, "%{public}s::%d:bssMo nil for %@[%@]", buf, 0x26u);
      }
      id v4 = v48;
      uint64_t v7 = v46;
    }
    else
    {
      __int16 v38 = WALogCategoryDeviceStoreHandle();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)int buf = 136446722;
        double v50 = "-[AnalyticsProcessor processMetricFault:]";
        __int16 v51 = 1024;
        int v52 = 1408;
        __int16 v53 = 2112;
        uint64_t v54 = v6;
        _os_log_impl(&dword_21D96D000, v38, OS_LOG_TYPE_ERROR, "%{public}s::%d:failed to create new FaultMO %@", buf, 0x1Cu);
      }
    }
  }
  else
  {
    uint64_t v7 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 136446466;
      double v50 = "-[AnalyticsProcessor processMetricFault:]";
      __int16 v51 = 1024;
      int v52 = 1401;
      _os_log_impl(&dword_21D96D000, v7, OS_LOG_TYPE_ERROR, "%{public}s::%d:failed to retrieve kWAMessageKeyFaultName", buf, 0x12u);
    }
  }
LABEL_22:

  double v36 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)int buf = 136446466;
    double v50 = "-[AnalyticsProcessor processMetricFault:]";
    __int16 v51 = 1024;
    int v52 = 1449;
    _os_log_impl(&dword_21D96D000, v36, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Exiting", buf, 0x12u);
  }

  uint64_t v37 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v37))
  {
    *(_WORD *)int buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v37, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricFault", "", buf, 2u);
  }
}

- (void)processMetricRecovery:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)int buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricRecovery", "", buf, 2u);
  }

  unsigned int v6 = [v4 valueForKey:@"recoveryType"];
  if (!v6)
  {
    int v11 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_26;
    }
    *(_DWORD *)int buf = 136446466;
    long long v35 = "-[AnalyticsProcessor processMetricRecovery:]";
    __int16 v36 = 1024;
    int v37 = 1473;
    __int16 v30 = "%{public}s::%d:failed to retrieve kWAMessageKeyRecoveryType";
LABEL_35:
    _os_log_impl(&dword_21D96D000, v11, OS_LOG_TYPE_ERROR, v30, buf, 0x12u);
    goto LABEL_26;
  }
  uint64_t v7 = [v4 valueForKey:@"recoveryReason"];
  if (!v7)
  {
    int v11 = WALogCategoryDeviceStoreHandle();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_26;
    }
    *(_DWORD *)int buf = 136446466;
    long long v35 = "-[AnalyticsProcessor processMetricRecovery:]";
    __int16 v36 = 1024;
    int v37 = 1476;
    __int16 v30 = "%{public}s::%d:failed to retrieve kWAMessageKeyRecoveryReason";
    goto LABEL_35;
  }
  double v8 = v7;
  uint64_t v9 = [v4 valueForKey:@"apple80211Return"];
  if (v9)
  {
    uint64_t v10 = (void *)v9;
    int v11 = [v4 valueForKey:@"bssid"];
    int v12 = [v4 valueForKey:@"ssid"];
    double v13 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)int buf = 136446978;
      long long v35 = "-[AnalyticsProcessor processMetricRecovery:]";
      __int16 v36 = 1024;
      int v37 = 1484;
      __int16 v38 = 2112;
      int v39 = v6;
      __int16 v40 = 2112;
      int v41 = v8;
      _os_log_impl(&dword_21D96D000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Processing Recovery type %@ reason %@ ", buf, 0x26u);
    }

    CLLocationDegrees v14 = [(AnalyticsProcessor *)self managedObjectHandler];
    int v15 = [v14 managedObjectContext];
    double v16 = +[RecoveryMO generateInstance:v15];

    if (v16)
    {
      [v16 setRecoveryType:v6];
      [v16 setRecoveryReason:v8];
      objc_msgSend(v16, "setApple80211Return:", objc_msgSend(v10, "intValue"));
      uint64_t v17 = [v4 valueForKey:@"date"];

      if (v17) {
        [v4 valueForKey:@"date"];
      }
      else {
      BOOL v18 = [MEMORY[0x263EFF910] date];
      }
      [v16 setDate:v18];

      uint64_t v19 = WALogCategoryDeviceStoreHandle();
      uint64_t v20 = v19;
      long long v33 = v6;
      if (v11 && v12)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)int buf = 136446978;
          long long v35 = "-[AnalyticsProcessor processMetricRecovery:]";
          __int16 v36 = 1024;
          int v37 = 1500;
          __int16 v38 = 2112;
          int v39 = v12;
          __int16 v40 = 2112;
          int v41 = v11;
          _os_log_impl(&dword_21D96D000, v20, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Finding BSSMO for ssid %@ bssid %@", buf, 0x26u);
        }

        uint64_t v21 = [(AnalyticsProcessor *)self managedObjectHandler];
        int v22 = [v21 managedObjectContext];
        objc_super v23 = +[BSSMO getInstance:v11 ssid:v12 moc:v22];

        if (v23)
        {
          __int16 v24 = WALogCategoryDeviceStoreHandle();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)int buf = 136446466;
            long long v35 = "-[AnalyticsProcessor processMetricRecovery:]";
            __int16 v36 = 1024;
            int v37 = 1507;
            _os_log_impl(&dword_21D96D000, v24, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Associating Recovery to BSS", buf, 0x12u);
          }

          [v23 addRecoveriesObject:v16];
LABEL_25:

          int v25 = [(AnalyticsProcessor *)self managedObjectHandler];
          [v25 saveManagedObjectContext];

          __int16 v26 = [(AnalyticsProcessor *)self managedObjectHandler];
          CLLocationCoordinate2D v27 = [v26 managedObjectContext];
          [v27 reset];

          unsigned int v6 = v33;
          goto LABEL_26;
        }
      }
      else
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)int buf = 136446466;
          long long v35 = "-[AnalyticsProcessor processMetricRecovery:]";
          __int16 v36 = 1024;
          int v37 = 1503;
          _os_log_impl(&dword_21D96D000, v20, OS_LOG_TYPE_ERROR, "%{public}s::%d:Insufficient info to associate recovery to bss, leaving unlinked", buf, 0x12u);
        }
      }
      objc_super v23 = WALogCategoryDeviceStoreHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)int buf = 136446466;
        long long v35 = "-[AnalyticsProcessor processMetricRecovery:]";
        __int16 v36 = 1024;
        int v37 = 1511;
        _os_log_impl(&dword_21D96D000, v23, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:No bssMo found", buf, 0x12u);
      }
      goto LABEL_25;
    }
    long long v32 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 136446466;
      long long v35 = "-[AnalyticsProcessor processMetricRecovery:]";
      __int16 v36 = 1024;
      int v37 = 1487;
      _os_log_impl(&dword_21D96D000, v32, OS_LOG_TYPE_ERROR, "%{public}s::%d:failed to create new RecoveryMO", buf, 0x12u);
    }
  }
  else
  {
    uint64_t v31 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 136446466;
      long long v35 = "-[AnalyticsProcessor processMetricRecovery:]";
      __int16 v36 = 1024;
      int v37 = 1479;
      _os_log_impl(&dword_21D96D000, v31, OS_LOG_TYPE_ERROR, "%{public}s::%d:failed to retrieve kWAMessageKeyApple80211Return", buf, 0x12u);
    }

    int v11 = v8;
  }
LABEL_26:

  __int16 v28 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)int buf = 136446466;
    long long v35 = "-[AnalyticsProcessor processMetricRecovery:]";
    __int16 v36 = 1024;
    int v37 = 1522;
    _os_log_impl(&dword_21D96D000, v28, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Exiting", buf, 0x12u);
  }

  id v29 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v29))
  {
    *(_WORD *)int buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v29, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricRecovery", "", buf, 2u);
  }
}

- (void)processMetricLinkTest:(id)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)int buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricLinkTest", "", buf, 2u);
  }

  unsigned int v6 = [v4 valueForKey:@"bssid"];
  uint64_t v7 = [v4 valueForKey:@"ssid"];
  double v8 = [(AnalyticsProcessor *)self managedObjectHandler];
  uint64_t v9 = [v8 managedObjectContext];
  uint64_t v10 = +[LinkTestMO generateInstance:v9];

  if (v10)
  {
    int v11 = [v10 entity];
    int v12 = [v11 attributesByName];
    double v13 = [v4 valueForKey:@"date"];

    __int16 v38 = v7;
    int v39 = self;
    if (v13) {
      [v4 valueForKey:@"date"];
    }
    else {
    CLLocationDegrees v14 = [MEMORY[0x263EFF910] date];
    }
    int v15 = v10;
    objc_msgSend(v10, "setDate:", v14, v11);

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v16 = v12;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v40 objects:v52 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v41 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          int v22 = [v4 objectForKeyedSubscript:v21];

          if (v22)
          {
            objc_super v23 = [v4 objectForKeyedSubscript:v21];
            __int16 v24 = WALogCategoryDeviceStoreHandle();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)int buf = 136446978;
              uint64_t v45 = "-[AnalyticsProcessor processMetricLinkTest:]";
              __int16 v46 = 1024;
              int v47 = 1564;
              __int16 v48 = 2112;
              double v49 = v21;
              __int16 v50 = 2112;
              __int16 v51 = v23;
              _os_log_impl(&dword_21D96D000, v24, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Storing linkTest key %@ value %@ to linkTestMo", buf, 0x26u);
            }

            [v15 setValue:v23 forKey:v21];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v40 objects:v52 count:16];
      }
      while (v18);
    }

    int v25 = WALogCategoryDeviceStoreHandle();
    __int16 v26 = v25;
    uint64_t v7 = v38;
    if (v6 && v38)
    {
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)int buf = 136446978;
        uint64_t v45 = "-[AnalyticsProcessor processMetricLinkTest:]";
        __int16 v46 = 1024;
        int v47 = 1569;
        __int16 v48 = 2112;
        double v49 = v38;
        __int16 v50 = 2112;
        __int16 v51 = v6;
        _os_log_impl(&dword_21D96D000, v26, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Finding BSSMO for ssid %@ bssid %@", buf, 0x26u);
      }

      CLLocationCoordinate2D v27 = [(AnalyticsProcessor *)v39 managedObjectHandler];
      __int16 v28 = [v27 managedObjectContext];
      id v29 = +[BSSMO getInstance:v6 ssid:v38 moc:v28];

      uint64_t v10 = v15;
      if (v29)
      {
        __int16 v30 = WALogCategoryDeviceStoreHandle();
        uint64_t v31 = v37;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)int buf = 136446466;
          uint64_t v45 = "-[AnalyticsProcessor processMetricLinkTest:]";
          __int16 v46 = 1024;
          int v47 = 1577;
          _os_log_impl(&dword_21D96D000, v30, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Associating LinkTest to BSS", buf, 0x12u);
        }

        [v29 addLinkTestsObject:v15];
LABEL_31:

        long long v32 = [(AnalyticsProcessor *)v39 managedObjectHandler];
        [v32 saveManagedObjectContext];

        long long v33 = [(AnalyticsProcessor *)v39 managedObjectHandler];
        long long v34 = [v33 managedObjectContext];
        [v34 reset];

        goto LABEL_32;
      }
    }
    else
    {
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)int buf = 136446466;
        uint64_t v45 = "-[AnalyticsProcessor processMetricLinkTest:]";
        __int16 v46 = 1024;
        int v47 = 1573;
        _os_log_impl(&dword_21D96D000, v26, OS_LOG_TYPE_ERROR, "%{public}s::%d:Insufficient info to associate recovery to bss, leaving unlinked", buf, 0x12u);
      }

      uint64_t v10 = v15;
    }
    id v29 = WALogCategoryDeviceStoreHandle();
    uint64_t v31 = v37;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)int buf = 136446466;
      uint64_t v45 = "-[AnalyticsProcessor processMetricLinkTest:]";
      __int16 v46 = 1024;
      int v47 = 1581;
      _os_log_impl(&dword_21D96D000, v29, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:No bssMo found", buf, 0x12u);
    }
    goto LABEL_31;
  }
  uint64_t v31 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)int buf = 136446466;
    uint64_t v45 = "-[AnalyticsProcessor processMetricLinkTest:]";
    __int16 v46 = 1024;
    int v47 = 1547;
    _os_log_impl(&dword_21D96D000, v31, OS_LOG_TYPE_ERROR, "%{public}s::%d:failed to create new LinkTestMO", buf, 0x12u);
  }
LABEL_32:

  long long v35 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)int buf = 136446466;
    uint64_t v45 = "-[AnalyticsProcessor processMetricLinkTest:]";
    __int16 v46 = 1024;
    int v47 = 1592;
    _os_log_impl(&dword_21D96D000, v35, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Exiting", buf, 0x12u);
  }

  __int16 v36 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v36))
  {
    *(_WORD *)int buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v36, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricLinkTest", "", buf, 2u);
  }
}

- (void)processMetricWiFiStats:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)int buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricWiFiStats", "", buf, 2u);
  }

  if (v4)
  {
    unsigned int v6 = [(AnalyticsProcessor *)self managedObjectHandler];
    uint64_t v7 = [v6 managedObjectContext];
    double v8 = +[WiFiStatMO generateInstance:v7];

    uint64_t v9 = [v8 entity];
    uint64_t v10 = [v9 attributesByName];
    int v11 = [v10 allKeys];

    int v12 = [v4 valueForKey:@"date"];

    if (v12) {
      [v4 valueForKey:@"date"];
    }
    else {
    double v13 = [MEMORY[0x263EFF910] date];
    }
    [v8 setDate:v13];

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v14 = v4;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v27 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          if (objc_msgSend(v11, "containsObject:", v19, (void)v26))
          {
            uint64_t v20 = [v14 objectForKeyedSubscript:v19];
            [v8 setValue:v20 forKey:v19];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v16);
    }

    uint64_t v21 = [(AnalyticsProcessor *)self managedObjectHandler];
    [v21 saveManagedObjectContext];

    int v22 = [(AnalyticsProcessor *)self managedObjectHandler];
    objc_super v23 = [v22 managedObjectContext];
    [v23 reset];
  }
  else
  {
    double v8 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 136446466;
      long long v32 = "-[AnalyticsProcessor processMetricWiFiStats:]";
      __int16 v33 = 1024;
      int v34 = 1605;
      _os_log_impl(&dword_21D96D000, v8, OS_LOG_TYPE_ERROR, "%{public}s::%d:bad metricData", buf, 0x12u);
    }
  }

  __int16 v24 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)int buf = 136446466;
    long long v32 = "-[AnalyticsProcessor processMetricWiFiStats:]";
    __int16 v33 = 1024;
    int v34 = 1635;
    _os_log_impl(&dword_21D96D000, v24, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Exiting", buf, 0x12u);
  }

  int v25 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v25))
  {
    *(_WORD *)int buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v25, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricWiFiStats", "", buf, 2u);
  }
}

- (void)processMetricDiagnosticState:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)int buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricDiagnosticState", "", buf, 2u);
  }

  if (v4)
  {
    unsigned int v6 = [(AnalyticsProcessor *)self managedObjectHandler];
    uint64_t v7 = [v6 managedObjectContext];
    double v8 = +[DiagnosticStateMO generateInstance:v7];

    uint64_t v9 = [v8 entity];
    uint64_t v10 = [v9 attributesByName];
    int v11 = [v10 allKeys];

    int v12 = [v4 valueForKey:@"date"];

    if (v12) {
      [v4 valueForKey:@"date"];
    }
    else {
    double v13 = [MEMORY[0x263EFF910] date];
    }
    [v8 setDate:v13];

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v14 = v4;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v27 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          if (objc_msgSend(v11, "containsObject:", v19, (void)v26))
          {
            uint64_t v20 = [v14 objectForKeyedSubscript:v19];
            [v8 setValue:v20 forKey:v19];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v16);
    }

    uint64_t v21 = [(AnalyticsProcessor *)self managedObjectHandler];
    [v21 saveManagedObjectContext];

    int v22 = [(AnalyticsProcessor *)self managedObjectHandler];
    objc_super v23 = [v22 managedObjectContext];
    [v23 reset];
  }
  else
  {
    double v8 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 136446466;
      long long v32 = "-[AnalyticsProcessor processMetricDiagnosticState:]";
      __int16 v33 = 1024;
      int v34 = 1648;
      _os_log_impl(&dword_21D96D000, v8, OS_LOG_TYPE_ERROR, "%{public}s::%d:bad metricData", buf, 0x12u);
    }
  }

  __int16 v24 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)int buf = 136446466;
    long long v32 = "-[AnalyticsProcessor processMetricDiagnosticState:]";
    __int16 v33 = 1024;
    int v34 = 1678;
    _os_log_impl(&dword_21D96D000, v24, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:Exiting", buf, 0x12u);
  }

  int v25 = WALogCategoryDeviceStoreHandle();
  if (os_signpost_enabled(v25))
  {
    *(_WORD *)int buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21D96D000, v25, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AnalyticsProcessor processMetricDiagnosticState", "", buf, 2u);
  }
}

- (void)ageOutAnalytics:(double)a3
{
  id v4 = [(AnalyticsProcessor *)self managedObjectHandler];
  [v4 ageOutManagedObjectsOlderThan:a3];
}

- (void)performPruneTestBSSes:(id)a3
{
  id v4 = a3;
  id v5 = [(AnalyticsProcessor *)self managedObjectHandler];
  unsigned int v6 = [v5 managedObjectContext];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __44__AnalyticsProcessor_performPruneTestBSSes___block_invoke;
  v8[3] = &unk_264466020;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 performBlockAndWait:v8];
}

void __44__AnalyticsProcessor_performPruneTestBSSes___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) managedObjectHandler];
  [v2 pruneTestBSSes:*(void *)(a1 + 40)];
}

- (void)performPruneBasedOnStoreSizeAndSave
{
  id v3 = [(AnalyticsProcessor *)self managedObjectHandler];
  id v4 = [v3 managedObjectContext];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __57__AnalyticsProcessor_performPruneBasedOnStoreSizeAndSave__block_invoke;
  v5[3] = &unk_264466048;
  v5[4] = self;
  [v4 performBlockAndWait:v5];
}

void __57__AnalyticsProcessor_performPruneBasedOnStoreSizeAndSave__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) managedObjectHandler];
  [v1 performPruneBasedOnStoreSizeAndSave];
}

- (id)summarizeAnalyticsForNetwork:(id)a3 maxAgeInDays:(unint64_t)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a3;
  unsigned int v6 = (void *)MEMORY[0x223C0F2E0]();
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__0;
  int v22 = __Block_byref_object_dispose__0;
  id v23 = (id)objc_opt_new();
  id v7 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)int buf = 136446722;
    int v25 = "-[AnalyticsProcessor summarizeAnalyticsForNetwork:maxAgeInDays:]";
    __int16 v26 = 1024;
    int v27 = 1706;
    __int16 v28 = 2112;
    id v29 = v5;
    _os_log_impl(&dword_21D96D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:%@", buf, 0x1Cu);
  }

  if (v5)
  {
    double v8 = [(AnalyticsProcessor *)self managedObjectHandler];
    id v9 = [v8 managedObjectContext];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __64__AnalyticsProcessor_summarizeAnalyticsForNetwork_maxAgeInDays___block_invoke;
    v14[3] = &unk_264466070;
    id v15 = v5;
    uint64_t v16 = self;
    uint64_t v17 = &v18;
    [v9 performBlockAndWait:v14];
  }
  uint64_t v10 = WALogCategoryDeviceStoreHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v11 = (void *)v19[5];
    *(_DWORD *)int buf = 136446722;
    int v25 = "-[AnalyticsProcessor summarizeAnalyticsForNetwork:maxAgeInDays:]";
    __int16 v26 = 1024;
    int v27 = 1750;
    __int16 v28 = 2112;
    id v29 = v11;
    _os_log_impl(&dword_21D96D000, v10, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Returning:%@", buf, 0x1Cu);
  }

  id v12 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v12;
}

void __64__AnalyticsProcessor_summarizeAnalyticsForNetwork_maxAgeInDays___block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v108 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) managedObjectHandler];
  id v4 = [v3 managedObjectContext];
  id v5 = +[NetworkMO getInstance:v2 moc:v4];

  if (v5)
  {
    long long v92 = 0u;
    long long v93 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    id obj = [v5 bss];
    uint64_t v80 = [obj countByEnumeratingWithState:&v90 objects:v107 count:16];
    if (v80)
    {
      id v77 = v5;
      uint64_t v79 = *(void *)v91;
      unint64_t v6 = 0x263F08000uLL;
      uint64_t v85 = v1;
      while (2)
      {
        for (uint64_t i = 0; i != v80; ++i)
        {
          if (*(void *)v91 != v79) {
            objc_enumerationMutation(obj);
          }
          double v8 = *(void **)(*((void *)&v90 + 1) + 8 * i);
          id v9 = WALogCategoryDeviceStoreHandle();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v10 = *(void **)(v1 + 32);
            int v11 = [v8 bssid];
            *(_DWORD *)int buf = 136446978;
            __int16 v95 = "-[AnalyticsProcessor summarizeAnalyticsForNetwork:maxAgeInDays:]_block_invoke";
            __int16 v96 = 1024;
            int v97 = 1713;
            __int16 v98 = 2112;
            __int16 v99 = v10;
            __int16 v100 = 2112;
            uint64_t v101 = v11;
            _os_log_impl(&dword_21D96D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s::%d:%@ %@", buf, 0x26u);
          }
          id v12 = [v8 bssid];

          if (v12)
          {
            uint64_t v81 = i;
            double v13 = [*(id *)(v1 + 40) roamPolicyHandler];
            uint64_t v14 = *(void *)(v1 + 32);
            id v15 = [v8 bssid];
            [v13 buildRoamPoliciesForNetwork:v14 bssid:v15 numRoamSamples:*(void *)(*(void *)(v1 + 40) + 64) deploymentStatus:0];

            uint64_t v16 = [v8 bssid];
            uint64_t v17 = *(void *)(v1 + 32);
            uint64_t v18 = [*(id *)(v1 + 40) managedObjectHandler];
            uint64_t v19 = [v18 managedObjectContext];
            uint64_t v20 = +[BSSMO getInstance:v16 ssid:v17 moc:v19];

            if (!v20)
            {
              long long v73 = WALogCategoryDeviceStoreHandle();
              if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
              {
                long long v74 = [v8 bssid];
                *(_DWORD *)int buf = 136446722;
                __int16 v95 = "-[AnalyticsProcessor summarizeAnalyticsForNetwork:maxAgeInDays:]_block_invoke";
                __int16 v96 = 1024;
                int v97 = 1721;
                __int16 v98 = 2112;
                __int16 v99 = v74;
                _os_log_impl(&dword_21D96D000, v73, OS_LOG_TYPE_ERROR, "%{public}s::%d:bssMO nil for bssid:%@", buf, 0x1Cu);
              }
              goto LABEL_39;
            }
            uint64_t v21 = +[RoamPolicyStore neighborChannelsAsArray:log:For:](RoamPolicyStore, "neighborChannelsAsArray:log:For:", v20, 0, "-[AnalyticsProcessor summarizeAnalyticsForNetwork:maxAgeInDays:]_block_invoke");
            int v22 = WALogCategoryDeviceStoreHandle();
            BOOL v82 = v21;
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              id v23 = [v20 bssid];
              __int16 v24 = *(void **)(v1 + 32);
              int v25 = [v20 roamTriggerRssi];
              *(_DWORD *)int buf = 136447234;
              __int16 v95 = "-[AnalyticsProcessor summarizeAnalyticsForNetwork:maxAgeInDays:]_block_invoke";
              __int16 v96 = 1024;
              int v97 = 1725;
              __int16 v98 = 2112;
              __int16 v99 = v23;
              __int16 v100 = 2112;
              uint64_t v101 = v24;
              uint64_t v21 = v82;
              __int16 v102 = 2048;
              uint64_t v103 = (void *)v25;
              _os_log_impl(&dword_21D96D000, v22, OS_LOG_TYPE_DEBUG, "%{public}s::%d:triggerRssi for bssid[%@] ssid[%@] : %ld", buf, 0x30u);
            }
            __int16 v26 = WALogCategoryDeviceStoreHandle();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            {
              int v27 = [v20 bssid];
              __int16 v28 = *(void **)(v1 + 32);
              id v29 = [v20 neighborBSSIDs];
              *(_DWORD *)int buf = 136447234;
              __int16 v95 = "-[AnalyticsProcessor summarizeAnalyticsForNetwork:maxAgeInDays:]_block_invoke";
              __int16 v96 = 1024;
              int v97 = 1726;
              __int16 v98 = 2112;
              __int16 v99 = v27;
              __int16 v100 = 2112;
              uint64_t v101 = v28;
              uint64_t v21 = v82;
              __int16 v102 = 2112;
              uint64_t v103 = v29;
              _os_log_impl(&dword_21D96D000, v26, OS_LOG_TYPE_DEBUG, "%{public}s::%d:neighborBSSIDs for bssid[%@] ssid[%@] : %@", buf, 0x30u);
            }
            uint64_t v30 = WALogCategoryDeviceStoreHandle();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v31 = [v20 bssid];
              long long v32 = *(void **)(v1 + 32);
              *(_DWORD *)int buf = 136447234;
              __int16 v95 = "-[AnalyticsProcessor summarizeAnalyticsForNetwork:maxAgeInDays:]_block_invoke";
              __int16 v96 = 1024;
              int v97 = 1727;
              __int16 v98 = 2112;
              __int16 v99 = v31;
              __int16 v100 = 2112;
              uint64_t v101 = v32;
              __int16 v102 = 2112;
              uint64_t v103 = v21;
              _os_log_impl(&dword_21D96D000, v30, OS_LOG_TYPE_DEBUG, "%{public}s::%d:neighborChannels for bssid[%@] ssid[%@] :%@", buf, 0x30u);
            }
            __int16 v33 = objc_msgSend(NSNumber, "numberWithInteger:", (int)objc_msgSend(v20, "roamTriggerRssi"));
            int v34 = *(void **)(*(void *)(*(void *)(v1 + 48) + 8) + 40);
            uint64_t v35 = *(void **)(v6 + 2880);
            __int16 v36 = [v20 bssid];
            int v37 = [v35 stringWithFormat:@"%@.triggerRSSI", v36];
            [v34 setObject:v33 forKeyedSubscript:v37];

            __int16 v38 = [v20 neighborBSSIDs];
            int v39 = [v38 componentsJoinedByString:@","];

            if (v39)
            {
              [v20 neighborBSSIDs];
              v41 = long long v40 = v8;
              long long v42 = [v41 componentsJoinedByString:@","];
              long long v43 = *(void **)(*(void *)(*(void *)(v1 + 48) + 8) + 40);
              CLLocationDegrees v44 = *(void **)(v6 + 2880);
              uint64_t v45 = [v20 bssid];
              __int16 v46 = [v44 stringWithFormat:@"%@.neighborBSSIDs", v45];
              [v43 setObject:v42 forKeyedSubscript:v46];

              double v8 = v40;
              uint64_t v21 = v82;
            }
            int v47 = [v21 componentsJoinedByString:@","];

            if (v47)
            {
              __int16 v48 = [v21 componentsJoinedByString:@","];
              double v49 = *(void **)(*(void *)(*(void *)(v1 + 48) + 8) + 40);
              __int16 v50 = *(void **)(v6 + 2880);
              __int16 v51 = [v20 bssid];
              int v52 = [v50 stringWithFormat:@"%@.neighborChannels", v51];
              [v49 setObject:v48 forKeyedSubscript:v52];
            }
            uint64_t v53 = v20;
            uint64_t v54 = WALogCategoryDeviceStoreHandle();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)int buf = 136446466;
              __int16 v95 = "-[AnalyticsProcessor summarizeAnalyticsForNetwork:maxAgeInDays:]_block_invoke";
              __int16 v96 = 1024;
              int v97 = 1737;
              _os_log_impl(&dword_21D96D000, v54, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Checking for Faults", buf, 0x12u);
            }

            long long v88 = 0u;
            long long v89 = 0u;
            long long v86 = 0u;
            long long v87 = 0u;
            id v83 = [v8 faults];
            uint64_t v55 = [v83 countByEnumeratingWithState:&v86 objects:v106 count:16];
            if (v55)
            {
              uint64_t v56 = v55;
              int v57 = 0;
              uint64_t v84 = *(void *)v87;
              do
              {
                uint64_t v58 = 0;
                uint64_t v59 = v57;
                do
                {
                  if (*(void *)v87 != v84) {
                    objc_enumerationMutation(v83);
                  }
                  __int16 v60 = *(void **)(*((void *)&v86 + 1) + 8 * v58);
                  __int16 v61 = WALogCategoryDeviceStoreHandle();
                  uint64_t v62 = v85;
                  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
                  {
                    uint64_t v63 = [v53 bssid];
                    int v64 = *(void **)(v85 + 32);
                    uint64_t v65 = [v60 type];
                    uint64_t v66 = [v60 date];
                    *(_DWORD *)int buf = 136447490;
                    __int16 v95 = "-[AnalyticsProcessor summarizeAnalyticsForNetwork:maxAgeInDays:]_block_invoke";
                    __int16 v96 = 1024;
                    int v97 = 1740;
                    __int16 v98 = 2112;
                    __int16 v99 = v63;
                    __int16 v100 = 2112;
                    uint64_t v101 = v64;
                    __int16 v102 = 2112;
                    uint64_t v103 = v65;
                    __int16 v104 = 2112;
                    uint64_t v105 = v66;
                    _os_log_impl(&dword_21D96D000, v61, OS_LOG_TYPE_DEBUG, "%{public}s::%d:Fault ssid[%@] bssid[%@] : %@ at date %@", buf, 0x3Au);

                    uint64_t v62 = v85;
                  }

                  __int16 v67 = [v60 date];
                  char v68 = *(void **)(*(void *)(*(void *)(v62 + 48) + 8) + 40);
                  long long v69 = NSString;
                  long long v70 = [v53 bssid];
                  long long v71 = [v60 type];
                  long long v72 = [v69 stringWithFormat:@"%@.fault[%lu].%@", v70, v59 + v58, v71];
                  [v68 setObject:v67 forKeyedSubscript:v72];

                  ++v58;
                }
                while (v56 != v58);
                uint64_t v56 = [v83 countByEnumeratingWithState:&v86 objects:v106 count:16];
                int v57 = v59 + v58;
              }
              while (v56);
            }

            uint64_t v1 = v85;
            unint64_t v6 = 0x263F08000;
            uint64_t i = v81;
          }
        }
        uint64_t v80 = [obj countByEnumeratingWithState:&v90 objects:v107 count:16];
        if (v80) {
          continue;
        }
        break;
      }
LABEL_39:
      id v5 = v77;
    }
    long long v75 = obj;
  }
  else
  {
    long long v75 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
    {
      long long v76 = *(void **)(v1 + 32);
      *(_DWORD *)int buf = 136446722;
      __int16 v95 = "-[AnalyticsProcessor summarizeAnalyticsForNetwork:maxAgeInDays:]_block_invoke";
      __int16 v96 = 1024;
      int v97 = 1710;
      __int16 v98 = 2112;
      __int16 v99 = v76;
      _os_log_impl(&dword_21D96D000, v75, OS_LOG_TYPE_ERROR, "%{public}s::%d:Could not find network for %@", buf, 0x1Cu);
    }
  }
}

- (void)processDatapathMetricStream:(id)a3 withDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(AnalyticsProcessor *)self managedObjectHandler];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __59__AnalyticsProcessor_processDatapathMetricStream_withDate___block_invoke;
  v10[3] = &unk_264466098;
  id v11 = v6;
  id v12 = self;
  id v9 = v6;
  [v8 performBlockOnManagedObjectContextForNSData:v9 withDate:v7 block:v10];
}

uint64_t __59__AnalyticsProcessor_processDatapathMetricStream_withDate___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(result + 32);
  if (v4) {
    return [*(id *)(result + 40) storeMetricStreamFragment:v4 withDate:a3];
  }
  return result;
}

- (void)storeMetricStreamFragment:(id)a3 withDate:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  double v8 = [(AnalyticsProcessor *)self managedObjectHandler];
  id v9 = [v8 managedObjectContext];
  unint64_t v10 = +[MetricEntryMO metricEntryCount:500 moc:v9];

  unint64_t v11 = v10 + 1;
  if (v10 + 1 >= 0x169)
  {
    unint64_t v12 = v10 - 359;
    double v13 = WALogCategoryDeviceStoreHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)int buf = 136446978;
      uint64_t v30 = "-[AnalyticsProcessor storeMetricStreamFragment:withDate:]";
      __int16 v31 = 1024;
      int v32 = 1773;
      __int16 v33 = 2048;
      unint64_t v34 = v11;
      __int16 v35 = 2048;
      unint64_t v36 = v12;
      _os_log_impl(&dword_21D96D000, v13, OS_LOG_TYPE_DEBUG, "%{public}s::%d:metricEntryCount is %lu, deleting %lu", buf, 0x26u);
    }

    id v14 = objc_alloc(MEMORY[0x263EFF260]);
    id v15 = +[MetricEntryMO entityName];
    uint64_t v16 = (void *)[v14 initWithEntityName:v15];

    uint64_t v17 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"date" ascending:1];
    __int16 v28 = v17;
    uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v28 count:1];
    [v16 setSortDescriptors:v18];

    [v16 setFetchLimit:v12];
    uint64_t v19 = +[MetricEntryMO entityName];
    uint64_t v20 = [(AnalyticsProcessor *)self managedObjectHandler];
    uint64_t v21 = [v20 managedObjectContext];
    +[AnalyticsStoreProxy batchDelete:v19 withPredicate:0 withFetchRequest:v16 moc:v21];
  }
  int v22 = [(AnalyticsProcessor *)self managedObjectHandler];
  id v23 = [v22 managedObjectContext];
  __int16 v24 = +[MetricEntryMO generateInstance:v23];

  [v24 setDate:v6];
  [v24 setEventMessage:v7];

  int v25 = [(AnalyticsProcessor *)self managedObjectHandler];
  [v25 saveManagedObjectContext];

  __int16 v26 = [(AnalyticsProcessor *)self managedObjectHandler];
  int v27 = [v26 managedObjectContext];
  [v27 reset];
}

- (void)setManagedObjectHandler:(id)a3
{
}

- (LinkChangePolicyHandler)linkChangePolicyHandler
{
  return self->_linkChangePolicyHandler;
}

- (void)setLinkChangePolicyHandler:(id)a3
{
}

- (RoamPolicyStore)roamPolicyHandler
{
  return self->_roamPolicyHandler;
}

- (void)setRoamPolicyHandler:(id)a3
{
}

- (DeploymentMetricHandler)deploymentMetricHandler
{
  return self->_deploymentMetricHandler;
}

- (void)setDeploymentMetricHandler:(id)a3
{
}

- (unint64_t)testDateDiffDays
{
  return self->_testDateDiffDays;
}

- (void)setTestDateDiffDays:(unint64_t)a3
{
  self->_testDateDiffDays = a3;
}

- (unint64_t)deploymentMetricDiffDays
{
  return self->_deploymentMetricDiffDays;
}

- (void)setDeploymentMetricDiffDays:(unint64_t)a3
{
  self->_deploymentMetricDiffDays = a3;
}

- (NSDateFormatter)dateFormatterWAMessage
{
  return self->_dateFormatterWAMessage;
}

- (void)setDateFormatterWAMessage:(id)a3
{
}

- (unint64_t)numRoamSamples
{
  return self->_numRoamSamples;
}

- (void)setNumRoamSamples:(unint64_t)a3
{
  self->_numRoamSamples = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatterWAMessage, 0);
  objc_storeStrong((id *)&self->_deploymentMetricHandler, 0);
  objc_storeStrong((id *)&self->_roamPolicyHandler, 0);
  objc_storeStrong((id *)&self->_linkChangePolicyHandler, 0);
  objc_storeStrong((id *)&self->_managedObjectHandler, 0);
}

@end