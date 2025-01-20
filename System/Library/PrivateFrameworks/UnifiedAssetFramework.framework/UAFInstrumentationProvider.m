@interface UAFInstrumentationProvider
+ (id)_constructNamespaceStatusEventForNamespace:(unsigned int)a3 withClient:(id)a4;
+ (id)_constructSelfAssetSet:(id)a3 storeManager:(id)a4;
+ (id)defaultDeviceId;
+ (id)getDeviceMetadata;
+ (id)getPersistedDeviceId;
+ (id)logSubscriptionsStatus;
+ (int)_getAssetSource:(id)a3;
+ (void)_emitAssetDailyStatusEvent:(id)a3;
+ (void)logAvailableAssetDailyStatus;
+ (void)logAvailableAssetDailyStatusWithFeedbackLogger:(id)a3 completion:(id)a4;
+ (void)logDownloadTriggerEventWithLanguage:(id)a3 hasExistingAssets:(BOOL)a4 retryCount:(unsigned int)a5;
+ (void)logUAFAssetSetDailyStatus:(id)a3 assetSetArrived:(BOOL)a4;
@end

@implementation UAFInstrumentationProvider

+ (id)defaultDeviceId
{
  if (_MergedGlobals_15 != -1) {
    dispatch_once(&_MergedGlobals_15, &__block_literal_global_17);
  }
  v2 = (void *)qword_26AF0BB18;

  return v2;
}

void __45__UAFInstrumentationProvider_defaultDeviceId__block_invoke()
{
  v0 = +[UAFAssetSetManager defaults];
  uint64_t v1 = [v0 stringForKey:@"PersistedDeviceId"];
  v2 = (void *)qword_26AF0BB18;
  qword_26AF0BB18 = v1;

  if (!qword_26AF0BB18)
  {
    v3 = objc_opt_new();
    uint64_t v4 = [v3 UUIDString];
    v5 = (void *)qword_26AF0BB18;
    qword_26AF0BB18 = v4;

    id v6 = +[UAFAssetSetManager defaults];
    [v6 setValue:qword_26AF0BB18 forKey:@"PersistedDeviceId"];
  }
}

+ (int)_getAssetSource:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Factory"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Root"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Trial"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"MA"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

+ (id)_constructNamespaceStatusEventForNamespace:(unsigned int)a3 withClient:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v55 = objc_alloc_init(MEMORY[0x263F6EC58]);
  if (v4 == 406)
  {
    uint64_t v6 = 2;
  }
  else
  {
    v7 = UAFGetLogCategory((void **)&UAFLogContextInstrumentation);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v62 = "+[UAFInstrumentationProvider _constructNamespaceStatusEventForNamespace:withClient:]";
      __int16 v63 = 1024;
      LODWORD(v64) = v4;
      _os_log_error_impl(&dword_23797A000, v7, OS_LOG_TYPE_ERROR, "%s Got an unknown namespaceId: %d", buf, 0x12u);
    }

    uint64_t v6 = 0;
  }
  [v55 setTrialNamespace:v6];
  uint64_t v8 = [MEMORY[0x263F80EA8] namespaceNameFromId:v4];
  uint64_t v9 = [v5 compatibilityVersionWithNamespaceName:v8];
  id v10 = objc_alloc_init(MEMORY[0x263F6EEF0]);
  [v10 setMajor:v9];
  v51 = v10;
  [v55 setNamespaceCompatabilityVersion:v10];
  id v11 = objc_alloc_init(MEMORY[0x263F6EC60]);
  v12 = [v5 rolloutIdentifiersWithNamespaceName:v8];
  v13 = [v12 rolloutId];
  [v11 setRolloutId:v13];

  objc_msgSend(v11, "setDeployment:", objc_msgSend(v12, "deploymentId"));
  v49 = v12;
  v14 = [v12 factorPackId];
  [v11 setFactorPack:v14];

  v50 = v11;
  [v55 setRollout:v11];
  v52 = v5;
  v54 = (void *)v8;
  v15 = [v5 factorLevelsWithNamespaceName:v8];
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v57 objects:v67 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v58;
    v53 = v15;
    uint64_t v56 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v58 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        v21 = [v20 level];
        v22 = [v21 directoryValue];
        v23 = v22;
        if (v22)
        {
          id v24 = v22;
        }
        else
        {
          v25 = [v20 level];
          id v24 = [v25 fileValue];
        }
        uint64_t v26 = [v24 path];
        if (v26)
        {
          v27 = (void *)v26;
          v28 = [v24 path];
          uint64_t v29 = [v28 length];

          if (v29)
          {
            v30 = [v20 level];
            v31 = [v30 metadata];
            v32 = [v31 valueForKey:@"version"];

            if (v32)
            {
              v33 = [v32 componentsSeparatedByString:@"."];
              if ((unint64_t)[v33 count] > 2)
              {
                v34 = objc_alloc_init(MEMORY[0x263F6EEF0]);
                v39 = [v33 objectAtIndex:0];
                -[NSObject setMajor:](v34, "setMajor:", [v39 intValue]);

                v40 = [v33 objectAtIndex:1];
                -[NSObject setMinor:](v34, "setMinor:", [v40 intValue]);

                if ((unint64_t)[v33 count] >= 3)
                {
                  v41 = [v33 objectAtIndex:2];
                  -[NSObject setPatch:](v34, "setPatch:", [v41 intValue]);
                }
                if ([v33 count] == 4)
                {
                  v42 = [v33 objectAtIndex:3];
                  [v34 setPrerelease:v42];
                }
                id v36 = objc_alloc_init(MEMORY[0x263F6ECF0]);
                [v36 setAssetVersion:v34];
                [v36 setTrialNamespace:v54];
                v43 = [v20 factor];
                v44 = [v43 name];
                [v36 setAssetName:v44];

                v45 = [v20 level];
                v46 = [v45 metadata];
                v35 = [v46 valueForKey:@"locale"];

                if (v35)
                {
                  v47 = [v35 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
                  objc_msgSend(v36, "setAssetLocale:", objc_msgSend(MEMORY[0x263F6EF10], "convertLanguageCodeToSchemaLocale:", v47));
                }
                else
                {
                  [v36 setAssetLocale:0];
                }
                v15 = v53;
                [v55 addAssets:v36];
LABEL_30:
              }
              else
              {
                v34 = UAFGetLogCategory((void **)&UAFLogContextInstrumentation);
                if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                {
                  v35 = [v20 factor];
                  id v36 = [v35 name];
                  *(_DWORD *)buf = 136315650;
                  v62 = "+[UAFInstrumentationProvider _constructNamespaceStatusEventForNamespace:withClient:]";
                  __int16 v63 = 2112;
                  id v64 = v36;
                  __int16 v65 = 2112;
                  v66 = v32;
                  _os_log_error_impl(&dword_23797A000, v34, OS_LOG_TYPE_ERROR, "%s Version info is malformed for asset %@, version %@", buf, 0x20u);
                  goto LABEL_30;
                }
              }
            }
            else
            {
              v33 = UAFGetLogCategory((void **)&UAFLogContextInstrumentation);
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              {
                v37 = [v20 factor];
                v38 = [v37 name];
                *(_DWORD *)buf = 136315394;
                v62 = "+[UAFInstrumentationProvider _constructNamespaceStatusEventForNamespace:withClient:]";
                __int16 v63 = 2112;
                id v64 = v38;
                _os_log_error_impl(&dword_23797A000, v33, OS_LOG_TYPE_ERROR, "%s Missing version info for asset %@", buf, 0x16u);
              }
            }

            uint64_t v18 = v56;
          }
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v57 objects:v67 count:16];
    }
    while (v17);
  }

  return v55;
}

+ (id)_constructSelfAssetSet:(id)a3 storeManager:(id)a4
{
  v66[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263F6F130]);
  id v54 = objc_alloc_init(MEMORY[0x263EFF980]);
  [v7 setAssetSetName:v5];
  uint64_t v8 = [v6 getSystemAssetSetUsages:v5];
  uint64_t v9 = (void *)v8;
  if (v8)
  {
    id v65 = v5;
    v66[0] = v8;
    id v10 = [NSDictionary dictionaryWithObjects:v66 forKeys:&v65 count:1];
  }
  else
  {
    id v10 = 0;
  }
  id v11 = +[UAFAssetSetManager sharedManager];
  v12 = [v11 retrieveAssetSet:v5 usages:0];

  if (v12)
  {
    v45 = v9;
    id v46 = v6;
    id v48 = v5;
    v13 = [v12 assetSetIdForSELF:1];
    [v7 setAssetSetId:v13];

    v44 = v12;
    v14 = [v12 autoAssetSet];
    v15 = [v14 getMAAutoAssetDownloadErrorsSync];

    v49 = v15;
    v50 = v10;
    if ([v15 count])
    {
      uint64_t v16 = objc_opt_new();
      long long v59 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      id v17 = v15;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v59 objects:v64 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v60;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v60 != v20) {
              objc_enumerationMutation(v17);
            }
            v22 = *(void **)(*((void *)&v59 + 1) + 8 * i);
            v23 = objc_opt_new();
            objc_msgSend(v23, "setMobileAssetDownloadErrorCode:", objc_msgSend(v22, "unsignedIntValue"));
            objc_msgSend(v23, "setTimesOccurred:", objc_msgSend(v17, "countForObject:", v22));
            [v16 addObject:v23];
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v59 objects:v64 count:16];
        }
        while (v19);
      }

      [v7 setMobileAssetDownloadErrorCodeFrequencys:v16];
      id v10 = v50;
    }
    id v47 = v7;
    +[UAFAssetSetManager getSystemUsageAssets:v10];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v24 = [obj countByEnumeratingWithState:&v55 objects:v63 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v52 = *(void *)v56;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v56 != v52) {
            objc_enumerationMutation(obj);
          }
          v27 = *(void **)(*((void *)&v55 + 1) + 8 * j);
          id v28 = objc_alloc_init(MEMORY[0x263F6F120]);
          uint64_t v29 = [v27 name];
          [v28 setAssetName:v29];

          v30 = [v27 metadata];
          v31 = [v30 objectForKeyedSubscript:@"com.apple.UnifiedAssetFramework.Source"];
          objc_msgSend(v28, "setAssetSource:", objc_msgSend(a1, "_getAssetSource:", v31));

          LODWORD(v31) = [v28 assetSource];
          v32 = [v27 metadata];
          v33 = v32;
          if (v31 == 4) {
            v34 = @"AssetVersion";
          }
          else {
            v34 = @"version";
          }
          v35 = [v32 objectForKeyedSubscript:v34];
          [v28 setAssetVersion:v35];

          id v36 = [v27 metadata];
          v37 = [v36 objectForKeyedSubscript:@"com.apple.UnifiedAssetFramework.AssetId"];
          [v28 setAssetSpecifier:v37];

          v38 = [v27 metadata];
          v39 = [v38 objectForKeyedSubscript:@"com.apple.UnifiedAssetFramework.ReportedDownloadSize"];
          objc_msgSend(v28, "setAssetDownloadSizeInBytes:", objc_msgSend(v39, "longLongValue"));

          v40 = [v27 metadata];
          v41 = [v40 objectForKeyedSubscript:@"com.apple.UnifiedAssetFramework.UnarchivedSize"];
          objc_msgSend(v28, "setAssetUnarchivedSizeInBytes:", objc_msgSend(v41, "longLongValue"));

          v42 = [v27 location];
          [v28 setIsAssetPathValid:v42 != 0];

          [v54 addObject:v28];
        }
        uint64_t v25 = [obj countByEnumeratingWithState:&v55 objects:v63 count:16];
      }
      while (v25);
    }

    id v7 = v47;
    id v5 = v48;
    uint64_t v9 = v45;
    id v6 = v46;
    id v10 = v50;
    v12 = v44;
  }
  [v7 setAssets:v54];

  return v7;
}

+ (void)logUAFAssetSetDailyStatus:(id)a3 assetSetArrived:(BOOL)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (a3)
  {
    BOOL v4 = a4;
    id v6 = (objc_class *)MEMORY[0x263F6EC40];
    id v7 = a3;
    id v8 = objc_alloc_init(v6);
    id v9 = objc_alloc_init(MEMORY[0x263F6F138]);
    [v9 setUafAssetSets:v7];

    [v8 addAssetSetStatus:v9];
    if (v4) {
      uint64_t v10 = 3;
    }
    else {
      uint64_t v10 = 4;
    }
    [v8 setStatusReason:v10];
    [a1 _emitAssetDailyStatusEvent:v8];
    id v11 = UAFGetLogCategory((void **)&UAFLogContextInstrumentation);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315138;
      v13 = "+[UAFInstrumentationProvider logUAFAssetSetDailyStatus:assetSetArrived:]";
      _os_log_impl(&dword_23797A000, v11, OS_LOG_TYPE_INFO, "%s Emitted SADAvailableAssetDailyStatus message for asset sets", (uint8_t *)&v12, 0xCu);
    }
  }
}

+ (void)logAvailableAssetDailyStatus
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = UAFGetLogCategory((void **)&UAFLogContextInstrumentation);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v31 = "+[UAFInstrumentationProvider logAvailableAssetDailyStatus]";
    _os_log_impl(&dword_23797A000, v3, OS_LOG_TYPE_DEFAULT, "%s Logging asset daily status.", buf, 0xCu);
  }

  id v4 = objc_alloc_init(MEMORY[0x263F6EC40]);
  _MapTrialProjectsToNamespacesFromConfig();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v18 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v9 = objc_msgSend(MEMORY[0x263F80E18], "clientWithIdentifier:", objc_msgSend(v8, "intValue", v18));
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        uint64_t v10 = [obj objectForKey:v8];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v21;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v21 != v13) {
                objc_enumerationMutation(v10);
              }
              v15 = objc_msgSend(a1, "_constructNamespaceStatusEventForNamespace:withClient:", objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * j), "intValue"), v9);
              [v4 addNamespaceStatus:v15];
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }
          while (v12);
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v6);
  }
  uint64_t v16 = [a1 logSubscriptionsStatus];
  [v4 addAssetSetStatus:v16];
  [v4 setStatusReason:1];
  [a1 _emitAssetDailyStatusEvent:v4];
  id v17 = UAFGetLogCategory((void **)&UAFLogContextInstrumentation);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v31 = "+[UAFInstrumentationProvider logAvailableAssetDailyStatus]";
    _os_log_impl(&dword_23797A000, v17, OS_LOG_TYPE_DEFAULT, "%s Emitted scheduled SADAvailableAssetDailyStatus message", buf, 0xCu);
  }
}

+ (void)_emitAssetDailyStatusEvent:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (+[UAFCommonUtilities isAssistantEnabled]
    || +[UAFCommonUtilities isDictationEnabled])
  {
    id v5 = objc_alloc_init(MEMORY[0x263F6EC48]);
    [v5 setAvailableAssetDailyStatus:v4];
    uint64_t v6 = [MEMORY[0x263F6C818] sharedStream];
    [v6 emitMessage:v5];
  }
  else
  {
    id v7 = UAFGetLogCategory((void **)&UAFLogContextInstrumentation);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136315138;
      id v17 = "+[UAFInstrumentationProvider _emitAssetDailyStatusEvent:]";
      _os_log_impl(&dword_23797A000, v7, OS_LOG_TYPE_DEFAULT, "%s Siri & Dictation are turned off, so using Feedback logger for logging asset status", (uint8_t *)&v16, 0xCu);
    }

    id v8 = objc_alloc_init(MEMORY[0x263F6F128]);
    [v8 setAvailableAssetDailyStatus:v4];
    id v9 = [a1 getDeviceMetadata];
    [v8 setDeviceMetadata:v9];

    id v10 = objc_alloc_init(MEMORY[0x263F6F160]);
    [v10 setUafAssetDailyStatus:v8];
    id v11 = objc_alloc_init(MEMORY[0x263F6F168]);
    id v12 = objc_alloc(MEMORY[0x263F6EEE0]);
    uint64_t v13 = objc_opt_new();
    uint64_t v14 = (void *)[v12 initWithNSUUID:v13];
    [v11 setUafId:v14];

    [v10 setEventMetadata:v11];
    v15 = [v10 wrapAsAnyEvent];
    [a1 logAvailableAssetDailyStatusWithFeedbackLogger:v15 completion:&__block_literal_global_308];
  }
}

void __57__UAFInstrumentationProvider__emitAssetDailyStatusEvent___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = UAFGetLogCategory((void **)&UAFLogContextInstrumentation);
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315394;
      uint64_t v6 = "+[UAFInstrumentationProvider _emitAssetDailyStatusEvent:]_block_invoke";
      __int16 v7 = 2112;
      id v8 = v2;
      _os_log_error_impl(&dword_23797A000, v4, OS_LOG_TYPE_ERROR, "%s Upload of UAFSchemaUAFClientEvent to Feedback logger failed with error: %@", (uint8_t *)&v5, 0x16u);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = "+[UAFInstrumentationProvider _emitAssetDailyStatusEvent:]_block_invoke";
    _os_log_impl(&dword_23797A000, v4, OS_LOG_TYPE_DEFAULT, "%s UAFSchemaUAFClientEvent uploaded to Feedback logger", (uint8_t *)&v5, 0xCu);
  }
}

+ (void)logAvailableAssetDailyStatusWithFeedbackLogger:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = a3;
  __int16 v7 = UAFGetLogCategory((void **)&UAFLogContextInstrumentation);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "+[UAFInstrumentationProvider logAvailableAssetDailyStatusWithFeedbackLogger:completion:]";
    _os_log_impl(&dword_23797A000, v7, OS_LOG_TYPE_DEFAULT, "%s Using Feedback logger", buf, 0xCu);
  }

  id v8 = [MEMORY[0x263F3C178] sharedLoggerWithPersistenceConfiguration:1];
  uint64_t v9 = [MEMORY[0x263F086E0] mainBundle];
  id v10 = [v9 bundleIdentifier];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __88__UAFInstrumentationProvider_logAvailableAssetDailyStatusWithFeedbackLogger_completion___block_invoke;
  v12[3] = &unk_264CEB038;
  id v13 = v5;
  id v11 = v5;
  [v8 reportSiriInstrumentationEvent:v6 forBundleID:v10 completion:v12];
}

uint64_t __88__UAFInstrumentationProvider_logAvailableAssetDailyStatusWithFeedbackLogger_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)getDeviceMetadata
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  id v4 = [a1 getPersistedDeviceId];
  [v3 setDeviceId:v4];

  id v5 = +[UAFCommonUtilities mobileGestaltQuery:@"ProductType"];
  [v3 setDeviceType:v5];

  id v6 = +[UAFCommonUtilities mobileGestaltQuery:@"BuildVersion"];
  [v3 setSystemBuild:v6];

  __int16 v7 = +[UAFCommonUtilities systemLanguage];
  objc_msgSend(v3, "setInputLocale:", objc_msgSend(MEMORY[0x263F6EF10], "convertLanguageCodeToSchemaLocale:", v7));
  [v3 setProgramCode:1];
  [v3 setNanoSecondsSinceLastBoot:mach_absolute_time()];
  id v8 = UAFGetLogCategory((void **)&UAFLogContextInstrumentation);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    id v11 = "+[UAFInstrumentationProvider getDeviceMetadata]";
    _os_log_impl(&dword_23797A000, v8, OS_LOG_TYPE_DEFAULT, "%s Captured device metadata for UAFAssetDailyStatusWithDeviceProperties event", (uint8_t *)&v10, 0xCu);
  }

  return v3;
}

+ (id)getPersistedDeviceId
{
  id v2 = [a1 defaultDeviceId];
  id v3 = objc_alloc(MEMORY[0x263F6EEE0]);
  id v4 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v2];
  id v5 = (void *)[v3 initWithNSUUID:v4];

  return v5;
}

+ (id)logSubscriptionsStatus
{
  uint64_t v142 = *MEMORY[0x263EF8340];
  id v66 = objc_alloc_init(MEMORY[0x263F6F138]);
  id v70 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v69 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = +[UAFSubscriptionStoreManager defaultManager];
  id v5 = +[UAFConfigurationManager defaultManager];
  v74 = v4;
  id v6 = [v4 getSubscribers];
  __int16 v7 = UAFGetLogCategory((void **)&UAFLogContextInstrumentation);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v130 = "+[UAFInstrumentationProvider logSubscriptionsStatus]";
    __int16 v131 = 2114;
    v132 = v6;
    _os_log_impl(&dword_23797A000, v7, OS_LOG_TYPE_INFO, "%s The subscribers on this device: %{public}@", buf, 0x16u);
  }

  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v124 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v124 objects:v141 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v125;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v125 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = [v74 getSubscriptions:*(void *)(*((void *)&v124 + 1) + 8 * i) error:0];
        [v8 addObjectsFromArray:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v124 objects:v141 count:16];
    }
    while (v11);
  }

  v84 = v5;
  id v65 = v8;
  [v5 applySubscriptions:v8];
  long long v120 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  id v64 = v123 = 0u;
  v15 = [v64 allKeys];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v120 objects:v140 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v121;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v121 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v120 + 1) + 8 * j);
        long long v21 = [a1 _constructSelfAssetSet:v20 storeManager:v74];
        [v69 addObject:v21];

        long long v22 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v69, "count") - 1);
        [v3 setObject:v22 forKeyedSubscript:v20];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v120 objects:v140 count:16];
    }
    while (v17);
  }

  long long v118 = 0u;
  long long v119 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  obuint64_t j = v9;
  uint64_t v71 = [obj countByEnumeratingWithState:&v116 objects:v139 count:16];
  if (v71)
  {
    uint64_t v68 = *(void *)v117;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v117 != v68) {
          objc_enumerationMutation(obj);
        }
        uint64_t v73 = v23;
        uint64_t v24 = *(void *)(*((void *)&v116 + 1) + 8 * v23);
        id v72 = objc_alloc_init(MEMORY[0x263F6F150]);
        [v72 setSubscriberName:v24];
        long long v25 = [v74 getSubscriptions:v24 error:0];
        id v77 = objc_alloc_init(MEMORY[0x263EFF980]);
        long long v112 = 0u;
        long long v113 = 0u;
        long long v114 = 0u;
        long long v115 = 0u;
        id v75 = v25;
        uint64_t v78 = [v75 countByEnumeratingWithState:&v112 objects:v138 count:16];
        if (v78)
        {
          uint64_t v76 = *(void *)v113;
          do
          {
            uint64_t v26 = 0;
            do
            {
              if (*(void *)v113 != v76) {
                objc_enumerationMutation(v75);
              }
              uint64_t v79 = v26;
              long long v27 = *(void **)(*((void *)&v112 + 1) + 8 * v26);
              id v28 = objc_alloc_init(MEMORY[0x263F6F140]);
              uint64_t v29 = [v27 name];
              v80 = v28;
              [v28 setSubscriptionName:v29];

              id v30 = objc_alloc_init(MEMORY[0x263EFF980]);
              id v31 = objc_alloc_init(MEMORY[0x263EFF980]);
              long long v108 = 0u;
              long long v109 = 0u;
              long long v110 = 0u;
              long long v111 = 0u;
              v95 = v27;
              id v85 = [v27 assetSets];
              uint64_t v89 = [v85 countByEnumeratingWithState:&v108 objects:v137 count:16];
              if (v89)
              {
                uint64_t v87 = *(void *)v109;
                do
                {
                  uint64_t v32 = 0;
                  do
                  {
                    if (*(void *)v109 != v87) {
                      objc_enumerationMutation(v85);
                    }
                    uint64_t v93 = v32;
                    uint64_t v33 = *(void *)(*((void *)&v108 + 1) + 8 * v32);
                    v34 = [v95 assetSets];
                    uint64_t v91 = v33;
                    v35 = [v34 objectForKeyedSubscript:v33];

                    long long v106 = 0u;
                    long long v107 = 0u;
                    long long v104 = 0u;
                    long long v105 = 0u;
                    id v36 = v35;
                    uint64_t v37 = [v36 countByEnumeratingWithState:&v104 objects:v136 count:16];
                    if (v37)
                    {
                      uint64_t v38 = v37;
                      uint64_t v39 = *(void *)v105;
                      do
                      {
                        for (uint64_t k = 0; k != v38; ++k)
                        {
                          if (*(void *)v105 != v39) {
                            objc_enumerationMutation(v36);
                          }
                          uint64_t v41 = *(void *)(*((void *)&v104 + 1) + 8 * k);
                          id v42 = objc_alloc_init(MEMORY[0x263F6F148]);
                          [v42 setUsageName:v41];
                          v43 = [v36 objectForKeyedSubscript:v41];
                          [v42 setUsageValue:v43];

                          [v31 addObject:v42];
                        }
                        uint64_t v38 = [v36 countByEnumeratingWithState:&v104 objects:v136 count:16];
                      }
                      while (v38);
                    }

                    v44 = [v3 objectForKeyedSubscript:v91];
                    [v30 addObject:v44];

                    uint64_t v32 = v93 + 1;
                  }
                  while (v93 + 1 != v89);
                  uint64_t v89 = [v85 countByEnumeratingWithState:&v108 objects:v137 count:16];
                }
                while (v89);
              }

              [v80 setAssetSetUsages:v31];
              id v88 = objc_alloc_init(MEMORY[0x263EFF980]);
              long long v100 = 0u;
              long long v101 = 0u;
              long long v102 = 0u;
              long long v103 = 0u;
              id v83 = [v95 usageAliases];
              uint64_t v90 = [v83 countByEnumeratingWithState:&v100 objects:v135 count:16];
              if (v90)
              {
                id v86 = *(id *)v101;
                do
                {
                  for (uint64_t m = 0; m != v90; ++m)
                  {
                    if (*(id *)v101 != v86) {
                      objc_enumerationMutation(v83);
                    }
                    id v46 = *(void **)(*((void *)&v100 + 1) + 8 * m);
                    id v47 = objc_alloc_init(MEMORY[0x263F6F158]);
                    [v47 setAliasName:v46];
                    id v48 = [v95 usageAliases];
                    v49 = [v48 objectForKeyedSubscript:v46];
                    [v47 setAliasValue:v49];

                    [v88 addObject:v47];
                    v50 = [v95 usageAliases];
                    v51 = [v50 objectForKeyedSubscript:v46];

                    uint64_t v52 = [v84 getUsageAlias:v46];
                    v53 = v52;
                    if (v52)
                    {
                      id v94 = v47;
                      id v54 = [v52 values];
                      long long v55 = [v54 objectForKeyedSubscript:v51];

                      v92 = v55;
                      if ([v55 count])
                      {
                        long long v98 = 0u;
                        long long v99 = 0u;
                        long long v96 = 0u;
                        long long v97 = 0u;
                        long long v56 = v55;
                        uint64_t v57 = [v56 countByEnumeratingWithState:&v96 objects:v128 count:16];
                        if (v57)
                        {
                          uint64_t v58 = v57;
                          v81 = v53;
                          v82 = v51;
                          uint64_t v59 = *(void *)v97;
                          do
                          {
                            for (uint64_t n = 0; n != v58; ++n)
                            {
                              if (*(void *)v97 != v59) {
                                objc_enumerationMutation(v56);
                              }
                              long long v61 = [v3 objectForKeyedSubscript:*(void *)(*((void *)&v96 + 1) + 8 * n)];
                              [v30 addObject:v61];
                            }
                            uint64_t v58 = [v56 countByEnumeratingWithState:&v96 objects:v128 count:16];
                          }
                          while (v58);
                          id v47 = v94;
                          v53 = v81;
                          v51 = v82;
                          goto LABEL_61;
                        }
                      }
                      else
                      {
                        long long v56 = UAFGetLogCategory((void **)&UAFLogContextInstrumentation);
                        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 136315650;
                          v130 = "+[UAFInstrumentationProvider logSubscriptionsStatus]";
                          __int16 v131 = 2114;
                          v132 = v46;
                          __int16 v133 = 2114;
                          v134 = v51;
                          _os_log_error_impl(&dword_23797A000, v56, OS_LOG_TYPE_ERROR, "%s Could not process subscription for usage alias %{public}@ with value %{public}@", buf, 0x20u);
                        }
                      }
                      id v47 = v94;
LABEL_61:

                      long long v62 = v92;
                      goto LABEL_62;
                    }
                    long long v62 = UAFGetLogCategory((void **)&UAFLogContextInstrumentation);
                    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 136315394;
                      v130 = "+[UAFInstrumentationProvider logSubscriptionsStatus]";
                      __int16 v131 = 2114;
                      v132 = v46;
                      _os_log_error_impl(&dword_23797A000, v62, OS_LOG_TYPE_ERROR, "%s Could not process subscription for usage alias %{public}@", buf, 0x16u);
                    }
LABEL_62:
                  }
                  uint64_t v90 = [v83 countByEnumeratingWithState:&v100 objects:v135 count:16];
                }
                while (v90);
              }

              [v80 setUsageAliases:v88];
              [v80 setAssetSetIndices:v30];
              [v77 addObject:v80];

              uint64_t v26 = v79 + 1;
            }
            while (v79 + 1 != v78);
            uint64_t v78 = [v75 countByEnumeratingWithState:&v112 objects:v138 count:16];
          }
          while (v78);
        }

        [v72 setSubscriptions:v77];
        [v70 addObject:v72];

        uint64_t v23 = v73 + 1;
      }
      while (v73 + 1 != v71);
      uint64_t v71 = [obj countByEnumeratingWithState:&v116 objects:v139 count:16];
    }
    while (v71);
  }

  [v66 setUafAssetSets:v69];
  [v66 setUafAssetSubscriptions:v70];

  return v66;
}

+ (void)logDownloadTriggerEventWithLanguage:(id)a3 hasExistingAssets:(BOOL)a4 retryCount:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  BOOL v6 = a4;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = [v7 uppercaseString];
  id v9 = [v8 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];

  uint64_t v10 = [NSString stringWithFormat:@"LOCALE_%@", v9];

  id v11 = v10;
  if ([v11 isEqualToString:@"LOCALE_UNKNOWN_LOCALE"])
  {
    uint64_t v12 = 0;
  }
  else if ([v11 isEqualToString:@"LOCALE_AR_AE"])
  {
    uint64_t v12 = 1;
  }
  else if ([v11 isEqualToString:@"LOCALE_AR_SA"])
  {
    uint64_t v12 = 2;
  }
  else if ([v11 isEqualToString:@"LOCALE_CA_ES"])
  {
    uint64_t v12 = 3;
  }
  else if ([v11 isEqualToString:@"LOCALE_CS_CZ"])
  {
    uint64_t v12 = 4;
  }
  else if ([v11 isEqualToString:@"LOCALE_DA_DK"])
  {
    uint64_t v12 = 5;
  }
  else if ([v11 isEqualToString:@"LOCALE_DE_AT"])
  {
    uint64_t v12 = 6;
  }
  else if ([v11 isEqualToString:@"LOCALE_DE_CH"])
  {
    uint64_t v12 = 7;
  }
  else if ([v11 isEqualToString:@"LOCALE_DE_DE"])
  {
    uint64_t v12 = 8;
  }
  else if ([v11 isEqualToString:@"LOCALE_EL_GR"])
  {
    uint64_t v12 = 9;
  }
  else if ([v11 isEqualToString:@"LOCALE_EN_AE"])
  {
    uint64_t v12 = 10;
  }
  else if ([v11 isEqualToString:@"LOCALE_EN_AU"])
  {
    uint64_t v12 = 11;
  }
  else if ([v11 isEqualToString:@"LOCALE_EN_CA"])
  {
    uint64_t v12 = 12;
  }
  else if ([v11 isEqualToString:@"LOCALE_EN_GB"])
  {
    uint64_t v12 = 13;
  }
  else if ([v11 isEqualToString:@"LOCALE_EN_ID"])
  {
    uint64_t v12 = 14;
  }
  else if ([v11 isEqualToString:@"LOCALE_EN_IE"])
  {
    uint64_t v12 = 15;
  }
  else if ([v11 isEqualToString:@"LOCALE_EN_IN"])
  {
    uint64_t v12 = 16;
  }
  else if ([v11 isEqualToString:@"LOCALE_EN_MY"])
  {
    uint64_t v12 = 17;
  }
  else if ([v11 isEqualToString:@"LOCALE_EN_NZ"])
  {
    uint64_t v12 = 18;
  }
  else if ([v11 isEqualToString:@"LOCALE_EN_PH"])
  {
    uint64_t v12 = 19;
  }
  else if ([v11 isEqualToString:@"LOCALE_EN_SG"])
  {
    uint64_t v12 = 20;
  }
  else if ([v11 isEqualToString:@"LOCALE_EN_SA"])
  {
    uint64_t v12 = 21;
  }
  else if ([v11 isEqualToString:@"LOCALE_EN_US"])
  {
    uint64_t v12 = 22;
  }
  else if ([v11 isEqualToString:@"LOCALE_EN_ZA"])
  {
    uint64_t v12 = 23;
  }
  else if ([v11 isEqualToString:@"LOCALE_ES_CL"])
  {
    uint64_t v12 = 24;
  }
  else if ([v11 isEqualToString:@"LOCALE_ES_CO"])
  {
    uint64_t v12 = 25;
  }
  else if ([v11 isEqualToString:@"LOCALE_ES_ES"])
  {
    uint64_t v12 = 26;
  }
  else if ([v11 isEqualToString:@"LOCALE_ES_MX"])
  {
    uint64_t v12 = 27;
  }
  else if ([v11 isEqualToString:@"LOCALE_ES_US"])
  {
    uint64_t v12 = 28;
  }
  else if ([v11 isEqualToString:@"LOCALE_FI_FI"])
  {
    uint64_t v12 = 29;
  }
  else if ([v11 isEqualToString:@"LOCALE_FR_BE"])
  {
    uint64_t v12 = 30;
  }
  else if ([v11 isEqualToString:@"LOCALE_FR_CA"])
  {
    uint64_t v12 = 31;
  }
  else if ([v11 isEqualToString:@"LOCALE_FR_CH"])
  {
    uint64_t v12 = 32;
  }
  else if ([v11 isEqualToString:@"LOCALE_FR_FR"])
  {
    uint64_t v12 = 33;
  }
  else if ([v11 isEqualToString:@"LOCALE_HE_IL"])
  {
    uint64_t v12 = 34;
  }
  else if ([v11 isEqualToString:@"LOCALE_HI_IN"])
  {
    uint64_t v12 = 35;
  }
  else if ([v11 isEqualToString:@"LOCALE_HR_HR"])
  {
    uint64_t v12 = 36;
  }
  else if ([v11 isEqualToString:@"LOCALE_HU_HU"])
  {
    uint64_t v12 = 37;
  }
  else if ([v11 isEqualToString:@"LOCALE_ID_ID"])
  {
    uint64_t v12 = 38;
  }
  else if ([v11 isEqualToString:@"LOCALE_IT_CH"])
  {
    uint64_t v12 = 39;
  }
  else if ([v11 isEqualToString:@"LOCALE_IT_IT"])
  {
    uint64_t v12 = 40;
  }
  else if ([v11 isEqualToString:@"LOCALE_JA_JP"])
  {
    uint64_t v12 = 41;
  }
  else if ([v11 isEqualToString:@"LOCALE_KO_KR"])
  {
    uint64_t v12 = 42;
  }
  else if ([v11 isEqualToString:@"LOCALE_MS_MY"])
  {
    uint64_t v12 = 43;
  }
  else if ([v11 isEqualToString:@"LOCALE_NB_NO"])
  {
    uint64_t v12 = 44;
  }
  else if ([v11 isEqualToString:@"LOCALE_NL_BE"])
  {
    uint64_t v12 = 45;
  }
  else if ([v11 isEqualToString:@"LOCALE_NL_NL"])
  {
    uint64_t v12 = 46;
  }
  else if ([v11 isEqualToString:@"LOCALE_PL_PL"])
  {
    uint64_t v12 = 47;
  }
  else if ([v11 isEqualToString:@"LOCALE_PT_BR"])
  {
    uint64_t v12 = 48;
  }
  else if ([v11 isEqualToString:@"LOCALE_PT_PT"])
  {
    uint64_t v12 = 49;
  }
  else if ([v11 isEqualToString:@"LOCALE_RO_RO"])
  {
    uint64_t v12 = 50;
  }
  else if ([v11 isEqualToString:@"LOCALE_RU_RU"])
  {
    uint64_t v12 = 51;
  }
  else if ([v11 isEqualToString:@"LOCALE_SK_SK"])
  {
    uint64_t v12 = 52;
  }
  else if ([v11 isEqualToString:@"LOCALE_SV_SE"])
  {
    uint64_t v12 = 53;
  }
  else if ([v11 isEqualToString:@"LOCALE_TH_TH"])
  {
    uint64_t v12 = 54;
  }
  else if ([v11 isEqualToString:@"LOCALE_TR_TR"])
  {
    uint64_t v12 = 55;
  }
  else if ([v11 isEqualToString:@"LOCALE_UK_UA"])
  {
    uint64_t v12 = 56;
  }
  else if ([v11 isEqualToString:@"LOCALE_VI_VN"])
  {
    uint64_t v12 = 57;
  }
  else if ([v11 isEqualToString:@"LOCALE_WUU_CN"])
  {
    uint64_t v12 = 58;
  }
  else if ([v11 isEqualToString:@"LOCALE_YUE_CN"])
  {
    uint64_t v12 = 59;
  }
  else if ([v11 isEqualToString:@"LOCALE_ZH_CN"])
  {
    uint64_t v12 = 60;
  }
  else if ([v11 isEqualToString:@"LOCALE_ZH_HK"])
  {
    uint64_t v12 = 61;
  }
  else if ([v11 isEqualToString:@"LOCALE_ZH_TW"])
  {
    uint64_t v12 = 62;
  }
  else
  {
    uint64_t v12 = 0;
  }

  id v13 = objc_alloc_init(MEMORY[0x263F6EC50]);
  [v13 setLocale:v12];
  [v13 setExistingAssets:v6];
  [v13 setRetryCount:v5];
  id v14 = objc_alloc_init(MEMORY[0x263F6EC48]);
  [v14 setImmediateDownloadTriggered:v13];
  v15 = UAFGetLogCategory((void **)&UAFLogContextAssetUtilities);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    uint64_t v18 = "+[UAFInstrumentationProvider logDownloadTriggerEventWithLanguage:hasExistingAssets:retryCount:]";
    __int16 v19 = 2114;
    id v20 = v7;
    __int16 v21 = 1024;
    BOOL v22 = v6;
    __int16 v23 = 1024;
    int v24 = v5;
    _os_log_impl(&dword_23797A000, v15, OS_LOG_TYPE_DEFAULT, "%s #settings Emitting SADSchemaSADImmediateDownloadTriggered event: language=%{public}@ hasExistingAssets=%u retryCount=%d", buf, 0x22u);
  }

  uint64_t v16 = [MEMORY[0x263F6C818] sharedStream];
  [v16 emitMessage:v14];
}

@end