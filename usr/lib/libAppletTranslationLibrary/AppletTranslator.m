@interface AppletTranslator
+ (BOOL)appletCacheUpdated:(id)a3 serialNumber:(id)a4 isdSequenceCounter:(id)a5 transceiver:(id)a6 error:(id *)a7;
+ (BOOL)configureSEWithPassInformation:(id)a3 transceiver:(id)a4 limitedToAID:(id)a5 seHasActivatedApplets:(BOOL *)a6 skipAllActivations:(BOOL)a7 useLegacyBehavior:(BOOL)a8 error:(id *)a9;
+ (BOOL)getCurrentInMetroStatus:(id *)a3;
+ (BOOL)isLegacyApplet:(id)a3 withPackage:(id)a4 withModule:(id)a5;
+ (BOOL)setPlasticCardMode:(BOOL)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 serialNumber:(id)a7 transceiver:(id)a8 error:(id *)a9;
+ dumpState;
+ (id)GetAppletProperties:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7;
+ (id)checkSEExpressAppletCompatibilityWithPassInformation:(id)a3 error:(id *)a4;
+ (id)checkSEExpressAppletCompatibilityWithPassInformation:(id)a3 useLegacyBehavior:(BOOL)a4 error:(id *)a5;
+ (id)getATLDelegate;
+ (id)getAppletStateAndHistory:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7;
+ (id)getNFCSettings;
+ (id)getServiceProviderData:(id)a3 withPackage:(id)a4 withModule:(id)a5 withPublicKey:(id)a6 withEncryptionScheme:(id)a7 withTransceiver:(id)a8 withError:(id *)a9;
+ (id)getServiceProviderData:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7;
+ (id)parseHCIEvent:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withTransceiver:(id)a7 withError:(id *)a8;
+ (id)processEndOfTransaction:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7;
+ (id)userDefaults;
+ (uint64_t)isInternalBuild;
+ (void)cleanup;
+ (void)deregisterForCleanup:(uint64_t)a1;
+ (void)initLibrary:(id)a3;
+ (void)initLibraryWithDelegate:(id)a3;
+ (void)registerForCleanup:(uint64_t)a1;
+ (void)setLibraryHardwareCapabilities:(id)a3;
@end

@implementation AppletTranslator

+ (void)initLibrary:(id)a3
{
  +[AppletConfigurationData init];
  if (initLibrary__onceToken != -1)
  {
    dispatch_once(&initLibrary__onceToken, &__block_literal_global_7);
  }
}

uint64_t __32__AppletTranslator_initLibrary___block_invoke()
{
  return os_state_add_handler();
}

_DWORD *__32__AppletTranslator_initLibrary___block_invoke_2()
{
  return +[AppletTranslator dumpState]();
}

+ dumpState
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  _DWORD *v4;
  id v5;

  self;
  v0 = +[AppletTranslator userDefaults]();
  v1 = (void *)MEMORY[0x1E4F28F98];
  v2 = [v0 dictionaryRepresentation];
  v3 = [v1 dataWithPropertyList:v2 format:200 options:0 error:0];

  v4 = malloc_type_calloc(1uLL, [v3 length] + 200, 0xC51DC296uLL);
  *v4 = 1;
  v4[1] = [v3 length];
  __strlcpy_chk();
  v5 = v3;
  memcpy(v4 + 50, (const void *)[v5 bytes], [v5 length]);

  return v4;
}

+ (void)initLibraryWithDelegate:(id)a3
{
  id v4 = a3;
  objc_storeStrong((id *)&delegate, a3);
  +[AppletConfigurationData init];
  if (initLibraryWithDelegate__onceToken != -1) {
    dispatch_once(&initLibraryWithDelegate__onceToken, &__block_literal_global_664);
  }
}

uint64_t __44__AppletTranslator_initLibraryWithDelegate___block_invoke()
{
  return os_state_add_handler();
}

_DWORD *__44__AppletTranslator_initLibraryWithDelegate___block_invoke_2()
{
  return +[AppletTranslator dumpState]();
}

+ (void)setLibraryHardwareCapabilities:(id)a3
{
}

+ (id)parseHCIEvent:(id)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 withTransceiver:(id)a7 withError:(id *)a8
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (parseHCIEvent_withApplet_withPackage_withModule_withTransceiver_withError__onceToken != -1) {
    dispatch_once(&parseHCIEvent_withApplet_withPackage_withModule_withTransceiver_withError__onceToken, &__block_literal_global_668);
  }
  if (parseHCIEvent_withApplet_withPackage_withModule_withTransceiver_withError__debugHCIPrint)
  {
    id v18 = v13;
    uint64_t v19 = [v18 bytes];
    uint64_t v20 = [v18 length];
    LogBinary(OS_LOG_TYPE_DEFAULT, (uint64_t)"+[AppletTranslator parseHCIEvent:withApplet:withPackage:withModule:withTransceiver:withError:]", 85, v19, v20, @"AID: %@ HCI:", v21, v22, (uint64_t)v14);
  }
  v23 = +[ATLGetDecoder getDecoderForApplet:withPackage:withModule:]((uint64_t)ATLGetDecoder, (uint64_t)v14, (uint64_t)v15, v16);
  if (v23)
  {
    if (v17)
    {
      v24 = +[TransceiverWrapper withTransceiver:v17];
    }
    else
    {
      v24 = 0;
    }
    v35 = [v23 parseHCIEvent:v13 withApplet:v14 withPackage:v15 withModule:v16 withTransceiver:v24 withError:a8];

    if (!a8) {
      goto LABEL_21;
    }
  }
  else
  {
    v25 = ATLLogObject();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v54 = v14;
      __int16 v55 = 2112;
      id v56 = v15;
      __int16 v57 = 2112;
      id v58 = v16;
      _os_log_impl(&dword_1CA552000, v25, OS_LOG_TYPE_ERROR, "No suitable decoder for AID %@ PID %@ MID %@", buf, 0x20u);
    }

    uint64_t v48 = (uint64_t)v14;
    uint64_t v26 = [[NSString alloc] initWithFormat:@"No suitable decoder for AID %@ PID %@ MID %@"];
    v27 = (void *)v26;
    if (a8)
    {
      id v28 = *a8;
      v29 = (void *)MEMORY[0x1E4F28C58];
      if (*a8)
      {
        uint64_t v30 = *MEMORY[0x1E4F28A50];
        v49[0] = *MEMORY[0x1E4F28568];
        v49[1] = v30;
        v50[0] = v26;
        v50[1] = v28;
        v31 = (void *)MEMORY[0x1E4F1C9E8];
        v32 = v50;
        v33 = v49;
        uint64_t v34 = 2;
      }
      else
      {
        uint64_t v51 = *MEMORY[0x1E4F28568];
        uint64_t v52 = v26;
        v31 = (void *)MEMORY[0x1E4F1C9E8];
        v32 = &v52;
        v33 = &v51;
        uint64_t v34 = 1;
      }
      v36 = [v31 dictionaryWithObjects:v32 forKeys:v33 count:v34];
      *a8 = [v29 errorWithDomain:@"ATL" code:2 userInfo:v36];
    }
    v35 = 0;
    if (!a8) {
      goto LABEL_21;
    }
  }
  if (*a8)
  {
    id v37 = v13;
    uint64_t v38 = [v37 bytes];
    uint64_t v39 = [v37 length];
    LogBinary(OS_LOG_TYPE_ERROR, (uint64_t)"+[AppletTranslator parseHCIEvent:withApplet:withPackage:withModule:withTransceiver:withError:]", 108, v38, v39, @"Failed to parse HCI event:", v40, v41, v48);
    goto LABEL_30;
  }
LABEL_21:
  if (!v35) {
    goto LABEL_30;
  }
  v42 = [v35 objectForKeyedSubscript:@"EventType"];
  if ([v42 isEqualToString:@"StartEvent"])
  {
  }
  else
  {
    v43 = [v35 objectForKeyedSubscript:@"EventType"];
    int v44 = [v43 isEqualToString:@"EndEvent"];

    if (!v44)
    {
      v45 = ATLLogObject();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        v46 = [v35 objectForKeyedSubscript:@"EventType"];
        *(_DWORD *)buf = 138543362;
        id v54 = v46;
        _os_log_impl(&dword_1CA552000, v45, OS_LOG_TYPE_DEFAULT, "ATL generated event = %{public}@", buf, 0xCu);
      }
      goto LABEL_29;
    }
  }
  v45 = ATLLogObject();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v54 = v35;
    _os_log_impl(&dword_1CA552000, v45, OS_LOG_TYPE_DEFAULT, "ATL generated event = %{public}@", buf, 0xCu);
  }
LABEL_29:

LABEL_30:

  return v35;
}

void __94__AppletTranslator_parseHCIEvent_withApplet_withPackage_withModule_withTransceiver_withError___block_invoke()
{
  if (+[AppletTranslator isInternalBuild]())
  {
    +[AppletTranslator userDefaults]();
    id v0 = (id)objc_claimAutoreleasedReturnValue();
    parseHCIEvent_withApplet_withPackage_withModule_withTransceiver_withError__debugHCIPrint = [v0 BOOLForKey:@"debug.hcievent.logging"];
  }
  else
  {
    parseHCIEvent_withApplet_withPackage_withModule_withTransceiver_withError__debugHCIPrint = 0;
  }
}

+ (uint64_t)isInternalBuild
{
  if (isInternalBuild_onceToken != -1) {
    dispatch_once(&isInternalBuild_onceToken, &__block_literal_global_802);
  }
  return isInternalBuild_isInternal;
}

+ (id)userDefaults
{
  self;
  id v0 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.stockholm.atl"];

  return v0;
}

+ (id)getAppletStateAndHistory:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = +[ATLGetDecoder getDecoderForApplet:withPackage:withModule:]((uint64_t)ATLGetDecoder, (uint64_t)v11, (uint64_t)v12, v13);
  if (v15)
  {
    +[TransceiverWrapper withTransceiver:v14];
    v42 = uint64_t v47 = 0;
    [v15 getAppletStateAndHistory:withApplet:withPackage:withModule:withError:];
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    id v17 = 0;
    if (v17 || !v16)
    {
      v36 = ATLLogObject();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v54 = v11;
        __int16 v55 = 2112;
        id v56 = v12;
        __int16 v57 = 2112;
        id v58 = v13;
        _os_log_impl(&dword_1CA552000, v36, OS_LOG_TYPE_ERROR, "Failed to query AID %@ PID %@ MID %@", buf, 0x20u);
      }

      id v28 = v42;
      [v42 dumpAPDUs:&__block_literal_global_691];
      id v37 = 0;
      if (a7) {
        *a7 = v17;
      }
    }
    else
    {
      id v18 = [v16 objectForKeyedSubscript:@"ATLInternal"];

      if (v18)
      {
        uint64_t v19 = (void *)[v16 mutableCopy];
        [v19 removeObjectForKey:@"ATLInternal"];

        id v16 = v19;
      }
      uint64_t v20 = [v16 objectForKeyedSubscript:@"State"];
      uint64_t v21 = [v20 objectForKeyedSubscript:@"TransactionInProgress"];

      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v22 = v21;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v43 objects:v48 count:16];
      if (v23)
      {
        uint64_t v40 = v15;
        id v41 = v14;
        uint64_t v24 = *(void *)v44;
        while (2)
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v44 != v24) {
              objc_enumerationMutation(v22);
            }
            if ([*(id *)(*((void *)&v43 + 1) + 8 * i) hasPrefix:@"TransitMetro"])
            {
              uint64_t v23 = 1;
              goto LABEL_25;
            }
          }
          uint64_t v23 = [v22 countByEnumeratingWithState:&v43 objects:v48 count:16];
          if (v23) {
            continue;
          }
          break;
        }
LABEL_25:
        id v15 = v40;
        id v14 = v41;
      }

      uint64_t v38 = +[MetroStateMonitor shared];
      [v38 consumeStateWithAid:v11 newState:v23];

      id v16 = v16;
      id v37 = v16;
      id v28 = v42;
    }
  }
  else
  {
    uint64_t v26 = ATLLogObject();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v54 = v11;
      __int16 v55 = 2112;
      id v56 = v12;
      __int16 v57 = 2112;
      id v58 = v13;
      _os_log_impl(&dword_1CA552000, v26, OS_LOG_TYPE_ERROR, "No suitable decoder for AID %@ PID %@ MID %@", buf, 0x20u);
    }

    uint64_t v27 = [[NSString alloc] initWithFormat:@"No suitable decoder for AID %@ PID %@ MID %@", v11, v12, v13];
    id v28 = (void *)v27;
    if (!a7)
    {
      id v37 = 0;
      goto LABEL_32;
    }
    id v29 = *a7;
    uint64_t v30 = (void *)MEMORY[0x1E4F28C58];
    if (*a7)
    {
      uint64_t v31 = *MEMORY[0x1E4F28A50];
      v49[0] = *MEMORY[0x1E4F28568];
      v49[1] = v31;
      v50[0] = v27;
      v50[1] = v29;
      v32 = (void *)MEMORY[0x1E4F1C9E8];
      v33 = v50;
      uint64_t v34 = v49;
      uint64_t v35 = 2;
    }
    else
    {
      uint64_t v51 = *MEMORY[0x1E4F28568];
      uint64_t v52 = v27;
      v32 = (void *)MEMORY[0x1E4F1C9E8];
      v33 = &v52;
      uint64_t v34 = &v51;
      uint64_t v35 = 1;
    }
    id v17 = [v32 dictionaryWithObjects:v33 forKeys:v34 count:v35];
    [v30 errorWithDomain:@"ATL" code:2 userInfo:v17];
    id v37 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_32:

  return v37;
}

void __94__AppletTranslator_getAppletStateAndHistory_withPackage_withModule_withTransceiver_withError___block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (BOOL)appletCacheUpdated:(id)a3 serialNumber:(id)a4 isdSequenceCounter:(id)a5 transceiver:(id)a6 error:(id *)a7
{
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v85 = a4;
  id v84 = a5;
  id v91 = a6;
  v88 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v10 count]];
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v103 objects:v117 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v104;
    unint64_t v15 = 0x1E4F1C000uLL;
    id v16 = &unk_1F24E2950;
    uint64_t v92 = *(void *)v104;
    v82 = v11;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v104 != v14) {
          objc_enumerationMutation(v11);
        }
        id v18 = *(NSObject **)(*((void *)&v103 + 1) + 8 * v17);
        uint64_t v19 = v16;
        v94 = [*(id *)(v15 + 2656) dictionaryWithCapacity:[v16 count]];
        long long v99 = 0u;
        long long v100 = 0u;
        long long v101 = 0u;
        long long v102 = 0u;
        uint64_t v20 = [&unk_1F24E2968 countByEnumeratingWithState:&v99 objects:v116 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v100;
          while (2)
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v100 != v22) {
                objc_enumerationMutation(&unk_1F24E2968);
              }
              uint64_t v24 = *(void *)(*((void *)&v99 + 1) + 8 * i);
              v25 = [v18 objectForKeyedSubscript:v24];

              if (!v25)
              {
                v42 = ATLLogObject();
                if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v113 = v18;
                  __int16 v114 = 2112;
                  uint64_t v115 = v24;
                  _os_log_impl(&dword_1CA552000, v42, OS_LOG_TYPE_ERROR, "Applet %@ missing prop %@", buf, 0x16u);
                }

                long long v43 = (void *)[[NSString alloc] initWithFormat:@"Applet %@ missing prop %@", v18, v24];
                id v29 = v84;
                if (a7)
                {
                  id v44 = *a7;
                  long long v45 = (void *)MEMORY[0x1E4F28C58];
                  id v37 = v85;
                  uint64_t v35 = v82;
                  if (*a7)
                  {
                    uint64_t v46 = *MEMORY[0x1E4F28A50];
                    v108[0] = *MEMORY[0x1E4F28568];
                    v108[1] = v46;
                    uint64_t v47 = v43;
                    v109[0] = v43;
                    v109[1] = v44;
                    uint64_t v48 = (void *)MEMORY[0x1E4F1C9E8];
                    v49 = (void **)v109;
                    v50 = v108;
                    uint64_t v51 = 2;
                  }
                  else
                  {
                    uint64_t v110 = *MEMORY[0x1E4F28568];
                    v111 = v43;
                    uint64_t v47 = v43;
                    uint64_t v48 = (void *)MEMORY[0x1E4F1C9E8];
                    v49 = &v111;
                    v50 = &v110;
                    uint64_t v51 = 1;
                  }
                  v77 = [v48 dictionaryWithObjects:v49 forKeys:v50 count:v51];
                  *a7 = [v45 errorWithDomain:@"ATL" code:6 userInfo:v77];

                  BOOL v41 = 0;
                  id v27 = v82;
                  long long v43 = v47;
                }
                else
                {
                  BOOL v41 = 0;
                  uint64_t v35 = v82;
                  id v27 = v82;
                  id v37 = v85;
                }
                goto LABEL_62;
              }
              uint64_t v26 = [v18 objectForKeyedSubscript:v24];
              [v94 setObject:v26 forKeyedSubscript:v24];
            }
            uint64_t v21 = [&unk_1F24E2968 countByEnumeratingWithState:&v99 objects:v116 count:16];
            if (v21) {
              continue;
            }
            break;
          }
        }
        [v88 addObject:v94];

        ++v17;
        id v11 = v82;
        uint64_t v14 = v92;
        unint64_t v15 = 0x1E4F1C000;
        id v16 = v19;
      }
      while (v17 != v13);
      uint64_t v13 = [v82 countByEnumeratingWithState:&v103 objects:v117 count:16];
    }
    while (v13);
  }

  id v27 = v88;
  +[HashHelper hashHelper]();
  id v28 = (char *)objc_claimAutoreleasedReturnValue();
  id v29 = v84;
  -[HashHelper addData:](v28, v84);
  uint64_t v30 = (char *)objc_claimAutoreleasedReturnValue();
  uint64_t v31 = +[AppletConfigurationData dataHash];
  v32 = -[HashHelper addData:](v30, v31);
  -[HashHelper addArray:](v32, v27);
  v33 = (char *)objc_claimAutoreleasedReturnValue();
  uint64_t v34 = -[HashHelper getHash](v33);

  uint64_t v35 = v34;
  v36 = +[AppletTranslator userDefaults]();
  id v37 = v85;
  uint64_t v38 = [v85 asHexString];
  v94 = v36;
  uint64_t v39 = [v36 objectForKey:v38];

  id v80 = (id)v39;
  if ([v34 isEqual:v39])
  {
    uint64_t v40 = ATLLogObject();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA552000, v40, OS_LOG_TYPE_DEFAULT, "No changes to either configuration or SE, bailing out", buf, 2u);
    }

    BOOL v41 = 1;
  }
  else
  {
    v83 = v34;
    long long v97 = 0u;
    long long v98 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    id v27 = v27;
    uint64_t v52 = [v27 countByEnumeratingWithState:&v95 objects:v107 count:16];
    if (v52)
    {
      uint64_t v53 = v52;
      id v54 = @"lifecycleState";
      __int16 v55 = &unk_1F24E2428;
      uint64_t v56 = *(void *)v96;
      v81 = v27;
      uint64_t v87 = *(void *)v96;
      while (2)
      {
        uint64_t v57 = 0;
        uint64_t v86 = v53;
        do
        {
          if (*(void *)v96 != v56) {
            objc_enumerationMutation(v27);
          }
          id v58 = *(void **)(*((void *)&v95 + 1) + 8 * v57);
          uint64_t v59 = [v58 objectForKeyedSubscript:v54];
          char v60 = [v59 isEqual:v55];

          if (v60)
          {
            v61 = [v58 objectForKeyedSubscript:@"identifier"];
            v62 = [v58 objectForKeyedSubscript:@"moduleIdentifier"];
            v63 = [v58 objectForKeyedSubscript:@"packageIdentifier"];
            v93 = +[TransceiverWrapper withTransceiver:v91];
            v64 = +[ATLGetDecoder getDecoderForApplet:withPackage:withModule:]((uint64_t)ATLGetDecoder, (uint64_t)v61, (uint64_t)v63, v62);
            v65 = v64;
            if (v64
              && [v64 conformsToProtocol:&unk_1F24E79C8]
              && ([v65 supportsPlasticCardMode:v93 withApplet:v61 withPackage:v63 withModule:v62] & 1) == 0)
            {
              v74 = ATLLogObject();
              if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v113 = v61;
                _os_log_impl(&dword_1CA552000, v74, OS_LOG_TYPE_DEFAULT, "Plastic card mode not supported for %@", buf, 0xCu);
              }
            }
            else
            {
              v66 = +[AppletConfigurationData scriptForModule:v62];
              if (v66)
              {
                v89 = v63;
                v67 = v55;
                v68 = v54;
                v69 = [MEMORY[0x1E4F1C9B8] dataWithHexString:v61];
                v70 = SelectByNameCmd(v69);
                v71 = [v93 transceiveAndCheckSW:v70 error:a7];

                if (!v71 || ![v93 applyScript:v66 error:a7] || a7 && *a7)
                {
                  v78 = ATLLogObject();
                  if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v113 = v61;
                    _os_log_impl(&dword_1CA552000, v78, OS_LOG_TYPE_ERROR, "Failed executing script on AID %@", buf, 0xCu);
                  }

                  [v93 dumpAPDUs:&__block_literal_global_734];
                  id v27 = v81;

                  BOOL v41 = 0;
                  id v29 = v84;
                  id v37 = v85;
                  uint64_t v35 = v83;
                  goto LABEL_61;
                }
                v72 = ATLLogObject();
                id v54 = v68;
                if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v113 = v61;
                  _os_log_impl(&dword_1CA552000, v72, OS_LOG_TYPE_DEFAULT, "Successfully executed script on AID %@", buf, 0xCu);
                }
                id v27 = v81;
                __int16 v55 = v67;
                v63 = v89;
              }
              else
              {
                v72 = ATLLogObject();
                if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v113 = v62;
                  _os_log_impl(&dword_1CA552000, v72, OS_LOG_TYPE_DEFAULT, "No script for MID %@", buf, 0xCu);
                }
              }

              uint64_t v53 = v86;
            }
            uint64_t v56 = v87;
          }
          else
          {
            v61 = ATLLogObject();
            if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
            {
              v73 = [v58 objectForKeyedSubscript:v54];
              *(_DWORD *)buf = 138412290;
              v113 = v73;
              _os_log_impl(&dword_1CA552000, v61, OS_LOG_TYPE_DEFAULT, "Ignore LC %@", buf, 0xCu);
            }
          }

          ++v57;
        }
        while (v53 != v57);
        uint64_t v75 = [v27 countByEnumeratingWithState:&v95 objects:v107 count:16];
        uint64_t v53 = v75;
        if (v75) {
          continue;
        }
        break;
      }
    }

    id v37 = v85;
    v76 = [v85 asHexString];
    uint64_t v35 = v83;
    [v94 setObject:v83 forKey:v76];

    [v94 synchronize];
    BOOL v41 = 1;
    id v29 = v84;
  }
LABEL_61:
  long long v43 = v80;
LABEL_62:

  return v41;
}

void __89__AppletTranslator_appletCacheUpdated_serialNumber_isdSequenceCounter_transceiver_error___block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (BOOL)setPlasticCardMode:(BOOL)a3 withApplet:(id)a4 withPackage:(id)a5 withModule:(id)a6 serialNumber:(id)a7 transceiver:(id)a8 error:(id *)a9
{
  BOOL v13 = a3;
  v77[1] = *MEMORY[0x1E4F143B8];
  uint64_t v14 = (__CFString *)a4;
  id v15 = a5;
  id v16 = (__CFString *)a6;
  id v17 = a7;
  id v18 = a8;
  if (v13) {
    +[AppletConfigurationData plasticCardScriptForModule:v16];
  }
  else {
  uint64_t v19 = +[AppletConfigurationData scriptForModule:v16];
  }
  uint64_t v20 = (void *)v19;
  if (v19)
  {
    v64 = (void *)v19;
    uint64_t v21 = +[AppletTranslator userDefaults]();
    id v63 = v17;
    uint64_t v22 = [v17 asHexString];
    [v21 removeObjectForKey:v22];

    [v21 synchronize];
    id v65 = v18;
    uint64_t v23 = +[TransceiverWrapper withTransceiver:v18];
    uint64_t v24 = +[ATLGetDecoder getDecoderForApplet:withPackage:withModule:]((uint64_t)ATLGetDecoder, (uint64_t)v14, (uint64_t)v15, v16);
    v25 = v24;
    if (v24
      && [v24 conformsToProtocol:&unk_1F24E79C8]
      && ([v25 supportsPlasticCardMode:v23 withApplet:v14 withPackage:v15 withModule:v16] & 1) == 0)
    {
      uint64_t v51 = ATLLogObject();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v67 = v14;
        _os_log_impl(&dword_1CA552000, v51, OS_LOG_TYPE_ERROR, "Plastic card mode not supported for %@", buf, 0xCu);
      }

      uint64_t v52 = [[NSString alloc] initWithFormat:@"Plastic card mode not supported for %@", v14];
      v33 = (__CFString *)v52;
      uint64_t v20 = v64;
      if (!a9)
      {
        BOOL v38 = 0;
        goto LABEL_32;
      }
      id v53 = *a9;
      id v54 = (void *)MEMORY[0x1E4F28C58];
      if (*a9)
      {
        uint64_t v55 = *MEMORY[0x1E4F28A50];
        v70[0] = *MEMORY[0x1E4F28568];
        v70[1] = v55;
        v71[0] = v52;
        v71[1] = v53;
        uint64_t v56 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v57 = v71;
        id v58 = v70;
        uint64_t v59 = 2;
      }
      else
      {
        uint64_t v72 = *MEMORY[0x1E4F28568];
        uint64_t v73 = v52;
        uint64_t v56 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v57 = &v73;
        id v58 = &v72;
        uint64_t v59 = 1;
      }
      v61 = [v56 dictionaryWithObjects:v57 forKeys:v58 count:v59];
      *a9 = [v54 errorWithDomain:@"ATL" code:2 userInfo:v61];
    }
    else
    {
      uint64_t v26 = v14;
      id v27 = v15;
      v62 = v26;
      id v28 = [MEMORY[0x1E4F1C9B8] dataWithHexString:];
      id v29 = SelectByNameCmd(v28);
      uint64_t v30 = [v23 transceiveAndCheckSW:v29 error:a9];

      if (v30)
      {
        int v31 = [v23 applyScript:v64 error:a9];
        v32 = @"disabling";
        if (v13) {
          v32 = @"enabling";
        }
        v33 = v32;
        if (v31 && (!a9 || !*a9))
        {
          uint64_t v34 = ATLLogObject();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v67 = v33;
            __int16 v68 = 2112;
            v69 = v62;
            _os_log_impl(&dword_1CA552000, v34, OS_LOG_TYPE_DEFAULT, "Success %@ plastic card mode on AID %@", buf, 0x16u);
          }

          uint64_t v35 = [MEMORY[0x1E4F1C9B8] dataWithHexString:@"A00000015143525300"];
          v36 = SelectByNameCmd(v35);
          id v37 = [v23 transceiveAndCheckSW:v36 error:0];
          BOOL v38 = v37 != 0;

          uint64_t v39 = ATLLogObject();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v67) = v37 != 0;
            _os_log_impl(&dword_1CA552000, v39, OS_LOG_TYPE_INFO, "Selected CRS: %d", buf, 8u);
          }

          id v15 = v27;
          uint64_t v14 = v62;
          goto LABEL_31;
        }
      }
      else
      {
        v49 = @"disabling";
        if (v13) {
          v49 = @"enabling";
        }
        v33 = v49;
      }
      id v15 = v27;
      v50 = ATLLogObject();
      uint64_t v14 = v62;
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v67 = v33;
        __int16 v68 = 2112;
        v69 = v62;
        _os_log_impl(&dword_1CA552000, v50, OS_LOG_TYPE_ERROR, "Failed %@ plastic card mode on AID %@", buf, 0x16u);
      }

      [v23 dumpAPDUs:&__block_literal_global_748];
    }
    BOOL v38 = 0;
LABEL_31:
    uint64_t v20 = v64;
LABEL_32:

    id v17 = v63;
LABEL_41:

    id v18 = v65;
    goto LABEL_42;
  }
  uint64_t v40 = ATLLogObject();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v67 = v16;
    _os_log_impl(&dword_1CA552000, v40, OS_LOG_TYPE_ERROR, "No plastic card configuration for %@", buf, 0xCu);
  }

  uint64_t v41 = [[NSString alloc] initWithFormat:@"No plastic card configuration for %@", v16];
  uint64_t v21 = (void *)v41;
  if (a9)
  {
    id v65 = v18;
    id v42 = *a9;
    long long v43 = (void *)MEMORY[0x1E4F28C58];
    if (*a9)
    {
      uint64_t v44 = *MEMORY[0x1E4F28A50];
      v74[0] = *MEMORY[0x1E4F28568];
      v74[1] = v44;
      v75[0] = v41;
      v75[1] = v42;
      long long v45 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v46 = v75;
      uint64_t v47 = v74;
      uint64_t v48 = 2;
    }
    else
    {
      uint64_t v76 = *MEMORY[0x1E4F28568];
      v77[0] = v41;
      long long v45 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v46 = v77;
      uint64_t v47 = &v76;
      uint64_t v48 = 1;
    }
    uint64_t v23 = [v45 dictionaryWithObjects:v46 forKeys:v47 count:v48];
    [v43 errorWithDomain:@"ATL" code:2 userInfo:v23];
    BOOL v38 = 0;
    *a9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_41;
  }
  BOOL v38 = 0;
LABEL_42:

  return v38;
}

void __104__AppletTranslator_setPlasticCardMode_withApplet_withPackage_withModule_serialNumber_transceiver_error___block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (BOOL)configureSEWithPassInformation:(id)a3 transceiver:(id)a4 limitedToAID:(id)a5 seHasActivatedApplets:(BOOL *)a6 skipAllActivations:(BOOL)a7 useLegacyBehavior:(BOOL)a8 error:(id *)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  if (+[AppletTranslator isInternalBuild]())
  {
    +[AppletTranslator userDefaults]();
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    if ([v17 BOOLForKey:@"debug.skip.configure.express"])
    {
      id v18 = ATLLogObject();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA552000, v18, OS_LOG_TYPE_ERROR, "!!! Skipping configuration and returning success due to debug pref !!!", buf, 2u);
      }
      LOBYTE(v19) = 1;
      goto LABEL_18;
    }
  }
  id v18 = +[TransceiverWrapper withTransceiver:v15];
  id v26 = 0;
  BOOL v19 = +[ExpressMode applyConfiguration:v14 toSecureElement:v18 inSessionWithAID:v16 hasActivatedApplets:a6 skipActivations:v10 useLegacyBehavior:v9 error:&v26];
  id v17 = v26;
  uint64_t v20 = ATLLogObject();
  uint64_t v21 = v20;
  if (v19 && v17 == 0)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v24 = 0;
      _os_log_impl(&dword_1CA552000, v21, OS_LOG_TYPE_INFO, "Express config successfully set", v24, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_1CA552000, v21, OS_LOG_TYPE_ERROR, "Failed to set express mode configuration!", v25, 2u);
    }

    [v18 dumpAPDUs:&__block_literal_global_757];
    if (a9)
    {
      id v17 = v17;
      *a9 = v17;
    }
  }
LABEL_18:

  return v19;
}

void __141__AppletTranslator_configureSEWithPassInformation_transceiver_limitedToAID_seHasActivatedApplets_skipAllActivations_useLegacyBehavior_error___block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (id)checkSEExpressAppletCompatibilityWithPassInformation:(id)a3 error:(id *)a4
{
  return +[ExpressMode checkCompatibilityWithPassInformation:a3 error:a4];
}

+ (id)checkSEExpressAppletCompatibilityWithPassInformation:(id)a3 useLegacyBehavior:(BOOL)a4 error:(id *)a5
{
  return +[ExpressMode checkCompatibilityWithPassInformation:a3 useLegacyBehavior:a4 error:a5];
}

+ (id)GetAppletProperties:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = +[ATLGetDecoder getDecoderForApplet:withPackage:withModule:]((uint64_t)ATLGetDecoder, (uint64_t)v11, (uint64_t)v12, v13);
  id v16 = v15;
  if (v15)
  {
    uint64_t v17 = [v15 GetAppletProperties:v11 withPackage:v12 withModule:v13 withTransceiver:v14 withError:a7];
  }
  else
  {
    uint64_t v20 = @"Supported";
    v21[0] = MEMORY[0x1E4F1CC28];
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
  }
  id v18 = (void *)v17;

  return v18;
}

+ (id)processEndOfTransaction:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = +[ATLGetDecoder getDecoderForApplet:withPackage:withModule:]((uint64_t)ATLGetDecoder, (uint64_t)v11, (uint64_t)v12, v13);
  if (v15)
  {
    id v16 = +[TransceiverWrapper withTransceiver:v14];
    uint64_t v17 = [v15 processEndOfTransaction:v16 withApplet:v11 withPackage:v12 withModule:v13 withError:a7];

    if (v17) {
      goto LABEL_15;
    }
  }
  else
  {
    id v18 = ATLLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v36 = v11;
      __int16 v37 = 2112;
      id v38 = v12;
      __int16 v39 = 2112;
      id v40 = v13;
      _os_log_impl(&dword_1CA552000, v18, OS_LOG_TYPE_ERROR, "No suitable decoder for AID %@ PID %@ MID %@", buf, 0x20u);
    }

    uint64_t v19 = [[NSString alloc] initWithFormat:@"No suitable decoder for AID %@ PID %@ MID %@", v11, v12, v13];
    uint64_t v20 = (void *)v19;
    if (a7)
    {
      id v21 = *a7;
      uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
      if (*a7)
      {
        uint64_t v23 = *MEMORY[0x1E4F28A50];
        v31[0] = *MEMORY[0x1E4F28568];
        v31[1] = v23;
        v32[0] = v19;
        v32[1] = v21;
        uint64_t v24 = (void *)MEMORY[0x1E4F1C9E8];
        v25 = v32;
        id v26 = v31;
        uint64_t v27 = 2;
      }
      else
      {
        uint64_t v33 = *MEMORY[0x1E4F28568];
        uint64_t v34 = v19;
        uint64_t v24 = (void *)MEMORY[0x1E4F1C9E8];
        v25 = &v34;
        id v26 = &v33;
        uint64_t v27 = 1;
      }
      id v28 = [v24 dictionaryWithObjects:v25 forKeys:v26 count:v27];
      *a7 = [v22 errorWithDomain:@"ATL" code:2 userInfo:v28];
    }
  }
  id v29 = ATLLogObject();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v36 = v11;
    _os_log_impl(&dword_1CA552000, v29, OS_LOG_TYPE_ERROR, "Failed to process End of Transaction: %@", buf, 0xCu);
  }

  uint64_t v17 = 0;
LABEL_15:

  return v17;
}

+ (BOOL)isLegacyApplet:(id)a3 withPackage:(id)a4 withModule:(id)a5
{
  id v5 = a4;
  if ([v5 hasPrefix:@"A00000068001"])
  {
    v6 = (void *)MEMORY[0x1E4F1C9B8];
    v7 = [v5 substringFromIndex:[v5 length] - 4];
    v8 = [v6 dataWithHexString:v7];

    id v9 = v8;
    BOOL v10 = ReadU16BE((const unsigned __int8 *)[v9 bytes]) < 0x621;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

+ (id)getNFCSettings
{
  return +[AppletConfigurationData getNFCSettings];
}

+ (void)cleanup
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [statefulDecoders allObjects];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) cleanup];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

+ (id)getServiceProviderData:(id)a3 withPackage:(id)a4 withModule:(id)a5 withTransceiver:(id)a6 withError:(id *)a7
{
  return (id)[a1 getServiceProviderData:a3 withPackage:a4 withModule:a5 withPublicKey:0 withEncryptionScheme:0 withTransceiver:a6 withError:a7];
}

+ (id)getServiceProviderData:(id)a3 withPackage:(id)a4 withModule:(id)a5 withPublicKey:(id)a6 withEncryptionScheme:(id)a7 withTransceiver:(id)a8 withError:(id *)a9
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  uint64_t v20 = +[ATLGetDecoder getDecoderForApplet:withPackage:withModule:]((uint64_t)ATLGetDecoder, (uint64_t)v14, (uint64_t)v15, v16);
  id v21 = v20;
  if (v20 && [v20 conformsToProtocol:&unk_1F24E6740])
  {
    uint64_t v22 = +[TransceiverWrapper withTransceiver:v19];
    uint64_t v23 = [v21 getServiceProviderData:v14 withPackage:v15 withModule:v16 withPublicKey:v17 withEncryptionScheme:v18 withTransceiver:v22 withError:a9];
  }
  else
  {
    uint64_t v24 = ATLLogObject();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v41 = v14;
      _os_log_impl(&dword_1CA552000, v24, OS_LOG_TYPE_ERROR, "Service Provider Opaque Data is not supported for %@", buf, 0xCu);
    }

    uint64_t v25 = [[NSString alloc] initWithFormat:@"Service Provider Opaque Data is not supported for %@", v14];
    id v26 = (void *)v25;
    if (a9)
    {
      id v27 = *a9;
      id v28 = (void *)MEMORY[0x1E4F28C58];
      if (*a9)
      {
        uint64_t v29 = *MEMORY[0x1E4F28A50];
        v36[0] = *MEMORY[0x1E4F28568];
        v36[1] = v29;
        v37[0] = v25;
        v37[1] = v27;
        uint64_t v30 = (void *)MEMORY[0x1E4F1C9E8];
        int v31 = v37;
        v32 = v36;
        uint64_t v33 = 2;
      }
      else
      {
        uint64_t v38 = *MEMORY[0x1E4F28568];
        uint64_t v39 = v25;
        uint64_t v30 = (void *)MEMORY[0x1E4F1C9E8];
        int v31 = &v39;
        v32 = &v38;
        uint64_t v33 = 1;
      }
      uint64_t v34 = [v30 dictionaryWithObjects:v31 forKeys:v32 count:v33];
      *a9 = [v28 errorWithDomain:@"ATL" code:2 userInfo:v34];
    }
    uint64_t v23 = 0;
  }

  return v23;
}

+ (BOOL)getCurrentInMetroStatus:(id *)a3
{
  uint64_t v3 = +[MetroStateMonitor shared];
  char v4 = [v3 inMetro];

  return v4;
}

+ (id)getATLDelegate
{
  self;
  id v0 = (void *)delegate;

  return v0;
}

void __44__AppletTranslator_Private__isInternalBuild__block_invoke()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  isInternalBuild_isInternal = has_internal_diagnostics;
  if (has_internal_diagnostics)
  {
    v1 = +[AppletTranslator userDefaults]();
    isInternalBuild_isInternal = [v1 BOOLForKey:@"debug.enable.customer.behavior"] ^ 1;
  }
  v2 = ATLLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3[0] = 67109120;
    v3[1] = isInternalBuild_isInternal;
    _os_log_impl(&dword_1CA552000, v2, OS_LOG_TYPE_INFO, "Allowing internal diagnostics? %d", (uint8_t *)v3, 8u);
  }
}

+ (void)registerForCleanup:(uint64_t)a1
{
  id v5 = a2;
  self;
  v2 = (void *)statefulDecoders;
  if (!statefulDecoders)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v4 = (void *)statefulDecoders;
    statefulDecoders = (uint64_t)v3;

    v2 = (void *)statefulDecoders;
  }
  [v2 addObject:v5];
}

+ (void)deregisterForCleanup:(uint64_t)a1
{
  id v2 = a2;
  self;
  if ([(id)statefulDecoders containsObject:v2]) {
    [(id)statefulDecoders removeObject:v2];
  }
}

@end