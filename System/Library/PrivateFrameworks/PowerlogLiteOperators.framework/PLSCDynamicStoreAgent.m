@interface PLSCDynamicStoreAgent
+ (id)accountingGroupDefinitions;
+ (id)defaults;
+ (id)entryAggregateDefinitions;
+ (id)entryEventBackwardDefinitions;
+ (id)entryEventForwardDefinitions;
+ (id)entryEventIntervalDefinitions;
+ (id)entryEventNoneDefinitions;
+ (id)entryEventPointDefinitions;
+ (id)railDefinitions;
+ (void)load;
- (PLSCDynamicStoreAgent)init;
- (void)initOperatorDependancies;
- (void)networkLinkQualityChanged:(__SCDynamicStore *)a3 withChangedKeys:(id)a4;
@end

@implementation PLSCDynamicStoreAgent

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLSCDynamicStoreAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)defaults
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)railDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)accountingGroupDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventPointDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventForwardDefinitions
{
  v63[4] = *MEMORY[0x1E4F143B8];
  v62[0] = @"CellularActive";
  uint64_t v59 = *MEMORY[0x1E4F92C50];
  uint64_t v2 = v59;
  uint64_t v4 = *MEMORY[0x1E4F92CB8];
  v57[0] = *MEMORY[0x1E4F92CD0];
  uint64_t v3 = v57[0];
  v57[1] = v4;
  uint64_t v5 = MEMORY[0x1E4F1CC28];
  v58[0] = &unk_1F29F0EB0;
  v58[1] = MEMORY[0x1E4F1CC28];
  v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v58 forKeys:v57 count:2];
  v61[0] = v36;
  uint64_t v60 = *MEMORY[0x1E4F92CA8];
  uint64_t v6 = v60;
  v55[0] = @"Active";
  v35 = [MEMORY[0x1E4F929D8] sharedInstance];
  v34 = objc_msgSend(v35, "commonTypeDict_BoolFormat");
  v55[1] = @"LinkQuality";
  v56[0] = v34;
  v33 = [MEMORY[0x1E4F929D8] sharedInstance];
  v32 = objc_msgSend(v33, "commonTypeDict_IntegerFormat");
  v56[1] = v32;
  v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:2];
  v61[1] = v31;
  v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:&v59 count:2];
  v63[0] = v30;
  v62[1] = @"WifiActive";
  v52[1] = v5;
  v53[0] = v2;
  v51[0] = v3;
  v51[1] = v4;
  v52[0] = &unk_1F29F0EB0;
  v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:v51 count:2];
  v53[1] = v6;
  v54[0] = v29;
  v49[0] = @"Active";
  v28 = [MEMORY[0x1E4F929D8] sharedInstance];
  v27 = objc_msgSend(v28, "commonTypeDict_BoolFormat");
  v49[1] = @"LinkQuality";
  v50[0] = v27;
  v26 = [MEMORY[0x1E4F929D8] sharedInstance];
  v25 = objc_msgSend(v26, "commonTypeDict_IntegerFormat");
  v50[1] = v25;
  v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:2];
  v54[1] = v24;
  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:2];
  v63[1] = v23;
  v62[2] = @"HotspotActive";
  v46[1] = v5;
  v47[0] = v2;
  v45[0] = v3;
  v45[1] = v4;
  v46[0] = &unk_1F29F0EB0;
  v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:2];
  v47[1] = v6;
  v48[0] = v22;
  v43[0] = @"Active";
  v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  v20 = objc_msgSend(v21, "commonTypeDict_BoolFormat");
  v43[1] = @"LinkQuality";
  v44[0] = v20;
  v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
  v44[1] = v18;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:2];
  v48[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:2];
  v63[2] = v8;
  v62[3] = @"BTHotspotActive";
  v40[1] = v5;
  v41[0] = v2;
  v39[0] = v3;
  v39[1] = v4;
  v40[0] = &unk_1F29F0EB0;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:2];
  v41[1] = v6;
  v42[0] = v9;
  v37[0] = @"Active";
  v10 = [MEMORY[0x1E4F929D8] sharedInstance];
  v11 = objc_msgSend(v10, "commonTypeDict_BoolFormat");
  v37[1] = @"LinkQuality";
  v38[0] = v11;
  v12 = [MEMORY[0x1E4F929D8] sharedInstance];
  v13 = objc_msgSend(v12, "commonTypeDict_IntegerFormat");
  v38[1] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:2];
  v42[1] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:2];
  v63[3] = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:v62 count:4];

  return v16;
}

+ (id)entryEventBackwardDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventIntervalDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventNoneDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryAggregateDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (PLSCDynamicStoreAgent)init
{
  v17.receiver = self;
  v17.super_class = (Class)PLSCDynamicStoreAgent;
  uint64_t v2 = [(PLAgent *)&v17 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v16.version = 0;
    memset(&v16.retain, 0, 24);
    v16.info = v2;
    CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    uint64_t v5 = SCDynamicStoreCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], @"PLSCDynamicStoreAgent", (SCDynamicStoreCallBack)networkLinkQualityChangeCallback, &v16);
    _dynamicStore = (uint64_t)v5;
    uint64_t v6 = [(PLOperator *)v3 workQueue];
    SCDynamicStoreSetDispatchQueue(v5, v6);

    v7 = objc_opt_new();
    v8 = objc_opt_new();
    CFStringRef v9 = (const __CFString *)*MEMORY[0x1E4F41AC8];
    NetworkGlobalEntity = (__CFString *)SCDynamicStoreKeyCreateNetworkGlobalEntity(v4, (CFStringRef)*MEMORY[0x1E4F41AC8], (CFStringRef)*MEMORY[0x1E4F41B10]);
    [v7 addObject:NetworkGlobalEntity];
    v11 = (__CFString *)SCDynamicStoreKeyCreateNetworkGlobalEntity(v4, v9, (CFStringRef)*MEMORY[0x1E4F41B18]);

    [v7 addObject:v11];
    CFStringRef v12 = (const __CFString *)*MEMORY[0x1E4F41AB8];
    NetworkInterfaceEntity = (__CFString *)SCDynamicStoreKeyCreateNetworkInterfaceEntity(v4, v9, (CFStringRef)*MEMORY[0x1E4F41AB8], (CFStringRef)*MEMORY[0x1E4F41B28]);

    [v8 addObject:NetworkInterfaceEntity];
    v14 = (__CFString *)SCDynamicStoreKeyCreateNetworkInterfaceEntity(v4, v9, v12, (CFStringRef)*MEMORY[0x1E4F41B38]);

    [v8 addObject:v14];
    SCDynamicStoreSetNotificationKeys((SCDynamicStoreRef)_dynamicStore, (CFArrayRef)v7, (CFArrayRef)v8);
  }
  return v3;
}

- (void)initOperatorDependancies
{
  id v3 = [MEMORY[0x1E4F92900] sharedInstance];
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  [v3 createDistributionEventForwardWithDistributionID:8 withRemovingChildNodeName:@"Hotspot" withStartDate:v2];
}

- (void)networkLinkQualityChanged:(__SCDynamicStore *)a3 withChangedKeys:(id)a4
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v6 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__PLSCDynamicStoreAgent_networkLinkQualityChanged_withChangedKeys___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v6;
    if (qword_1EBD5C3C0 != -1) {
      dispatch_once(&qword_1EBD5C3C0, block);
    }
    if (_MergedGlobals_103)
    {
      v7 = [NSString stringWithFormat:@"SCDS Changed Keys: %@", v5];
      v8 = (void *)MEMORY[0x1E4F929B8];
      CFStringRef v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSCDynamicStoreAgent.m"];
      v10 = [v9 lastPathComponent];
      v11 = [NSString stringWithUTF8String:"-[PLSCDynamicStoreAgent networkLinkQualityChanged:withChangedKeys:]"];
      [v8 logMessage:v7 fromFile:v10 fromFunction:v11 fromLineNumber:163];

      CFStringRef v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v90 = v7;
        _os_log_debug_impl(&dword_1D2690000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  CFArrayRef v13 = (const __CFArray *)objc_opt_new();
  v14 = objc_opt_new();
  CFAllocatorRef v15 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFStringRef v16 = (const __CFString *)*MEMORY[0x1E4F41AC8];
  CFStringRef v17 = (const __CFString *)*MEMORY[0x1E4F41AB8];
  NetworkInterfaceEntity = (__CFString *)SCDynamicStoreKeyCreateNetworkInterfaceEntity((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFStringRef)*MEMORY[0x1E4F41AC8], (CFStringRef)*MEMORY[0x1E4F41AB8], (CFStringRef)*MEMORY[0x1E4F41B28]);
  [v14 addObject:NetworkInterfaceEntity];

  v19 = (__CFString *)SCDynamicStoreKeyCreateNetworkInterfaceEntity(v15, v16, v17, (CFStringRef)*MEMORY[0x1E4F41B38]);
  [v14 addObject:v19];

  CFDictionaryRef v20 = SCDynamicStoreCopyMultiple((SCDynamicStoreRef)_dynamicStore, v13, (CFArrayRef)v14);
  if (!v20) {
    goto LABEL_48;
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v21 = objc_opt_class();
    v87[0] = MEMORY[0x1E4F143A8];
    v87[1] = 3221225472;
    v87[2] = __67__PLSCDynamicStoreAgent_networkLinkQualityChanged_withChangedKeys___block_invoke_48;
    v87[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v87[4] = v21;
    if (qword_1EBD5C3C8 != -1) {
      dispatch_once(&qword_1EBD5C3C8, v87);
    }
    if (byte_1EBD5C3B9)
    {
      v82 = v14;
      v22 = self;
      v23 = [NSString stringWithFormat:@"SCDS Dynamic store dictionary: %@", v20];
      v24 = (void *)MEMORY[0x1E4F929B8];
      v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSCDynamicStoreAgent.m"];
      v26 = [v25 lastPathComponent];
      v27 = [NSString stringWithUTF8String:"-[PLSCDynamicStoreAgent networkLinkQualityChanged:withChangedKeys:]"];
      [v24 logMessage:v23 fromFile:v26 fromFunction:v27 fromLineNumber:174];

      v28 = PLLogCommon();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v90 = v23;
        _os_log_debug_impl(&dword_1D2690000, v28, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      self = v22;
      v14 = v82;
    }
  }
  if ([v5 containsObject:@"State:/Network/Interface/en0/Link"])
  {
    v29 = [(__CFDictionary *)v20 allKeys];
    if (![v29 containsObject:@"State:/Network/Interface/en0/Link"])
    {
LABEL_25:

      goto LABEL_26;
    }
    v30 = [(__CFDictionary *)v20 allKeys];
    int v31 = [v30 containsObject:@"State:/Network/Interface/en0/LinkQuality"];

    if (v31)
    {
      v83 = v14;
      v32 = self;
      v29 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"WifiActive"];
      v33 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v29];
      v34 = [(__CFDictionary *)v20 objectForKeyedSubscript:@"State:/Network/Interface/en0/Link"];
      v35 = [v34 objectForKeyedSubscript:@"Active"];
      int v36 = [v35 isEqual:&unk_1F29E6EB0];

      if (v36) {
        uint64_t v37 = MEMORY[0x1E4F1CC38];
      }
      else {
        uint64_t v37 = MEMORY[0x1E4F1CC28];
      }
      [v33 setObject:v37 forKeyedSubscript:@"Active"];
      v38 = [(__CFDictionary *)v20 objectForKeyedSubscript:@"State:/Network/Interface/en0/LinkQuality"];

      if (v38)
      {
        v39 = [(__CFDictionary *)v20 objectForKeyedSubscript:@"State:/Network/Interface/en0/LinkQuality"];
        v40 = [v39 objectForKeyedSubscript:@"LinkQuality"];
        [v33 setObject:v40 forKeyedSubscript:@"LinkQuality"];
      }
      self = v32;
      [(PLOperator *)v32 logEntry:v33];

      v14 = v83;
      goto LABEL_25;
    }
  }
LABEL_26:
  if ([v5 containsObject:@"State:/Network/Interface/ap1/Link"])
  {
    v41 = [(__CFDictionary *)v20 allKeys];
    int v42 = [v41 containsObject:@"State:/Network/Interface/ap1/Link"];

    if (v42)
    {
      v43 = v14;
      v44 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"HotspotActive"];
      v45 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v44];
      v46 = [(__CFDictionary *)v20 objectForKeyedSubscript:@"State:/Network/Interface/ap1/Link"];
      v47 = [v46 objectForKeyedSubscript:@"Active"];
      int v48 = [v47 isEqual:&unk_1F29E6EB0];

      if (v48)
      {
        [v45 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"Active"];
        v49 = [MEMORY[0x1E4F92900] sharedInstance];
        v50 = [v45 entryDate];
        [v49 createDistributionEventForwardWithDistributionID:41 withAddingChildNodeName:@"Hotspot" withStartDate:v50];
      }
      else
      {
        [v45 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"Active"];
        v49 = [MEMORY[0x1E4F92900] sharedInstance];
        v50 = [v45 entryDate];
        [v49 createDistributionEventForwardWithDistributionID:41 withRemovingChildNodeName:@"Hotspot" withStartDate:v50];
      }

      [(PLOperator *)self logEntry:v45];
      v14 = v43;
    }
  }
  if (([v5 containsObject:@"State:/Network/Interface/pdp_ip0/Link"] & 1) != 0
    || [v5 containsObject:@"State:/Network/Interface/pdp_ip0/LinkQuality"])
  {
    v51 = [(__CFDictionary *)v20 allKeys];
    int v52 = [v51 containsObject:@"State:/Network/Interface/pdp_ip0/LinkQuality"];

    if (v52)
    {
      v84 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"CellularActive"];
      v53 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v84];
      v54 = [(__CFDictionary *)v20 objectForKeyedSubscript:@"State:/Network/Interface/pdp_ip0/LinkQuality"];
      [v54 objectForKeyedSubscript:@"LinkQuality"];
      CFArrayRef v55 = v13;
      id v56 = v5;
      v58 = v57 = self;
      int v59 = [v58 isEqual:&unk_1F29E6EC8];

      self = v57;
      id v5 = v56;
      CFArrayRef v13 = v55;

      if (v59) {
        uint64_t v60 = MEMORY[0x1E4F1CC28];
      }
      else {
        uint64_t v60 = MEMORY[0x1E4F1CC38];
      }
      [v53 setObject:v60 forKeyedSubscript:@"Active"];
      v61 = [(__CFDictionary *)v20 objectForKeyedSubscript:@"State:/Network/Interface/pdp_ip0/LinkQuality"];
      v62 = [v61 objectForKeyedSubscript:@"LinkQuality"];
      [v53 setObject:v62 forKeyedSubscript:@"LinkQuality"];

      [(PLOperator *)self logEntry:v53];
    }
  }
  if ([v5 containsObject:@"State:/Network/Interface/en2/Link"])
  {
    v63 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"BTHotspotActive"];
    v64 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v63];
    v65 = [(__CFDictionary *)v20 allKeys];
    int v66 = [v65 containsObject:@"State:/Network/Interface/en2/Link"];

    if (v66)
    {
      v67 = [(__CFDictionary *)v20 objectForKeyedSubscript:@"State:/Network/Interface/en2/Link"];
      v68 = [v67 objectForKeyedSubscript:@"Active"];
      int v69 = [v68 isEqual:&unk_1F29E6EB0];

      if (!v69)
      {
        [v64 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"Active"];
        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v74 = objc_opt_class();
          v86[0] = MEMORY[0x1E4F143A8];
          v86[1] = 3221225472;
          v86[2] = __67__PLSCDynamicStoreAgent_networkLinkQualityChanged_withChangedKeys___block_invoke_77;
          v86[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v86[4] = v74;
          if (qword_1EBD5C3D0 != -1) {
            dispatch_once(&qword_1EBD5C3D0, v86);
          }
          if (byte_1EBD5C3BA)
          {
            v81 = self;
            v85 = v14;
            v75 = [NSString stringWithFormat:@"WARNING: Interface en2 keys exist, but active=no. Expected en2.active=yes whenever en2 interface exists"];
            v76 = (void *)MEMORY[0x1E4F929B8];
            v77 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSCDynamicStoreAgent.m"];
            v78 = [v77 lastPathComponent];
            v79 = [NSString stringWithUTF8String:"-[PLSCDynamicStoreAgent networkLinkQualityChanged:withChangedKeys:]"];
            [v76 logMessage:v75 fromFile:v78 fromFunction:v79 fromLineNumber:239];

            v80 = PLLogCommon();
            if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v90 = v75;
              _os_log_debug_impl(&dword_1D2690000, v80, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            self = v81;
            v14 = v85;
          }
        }
        goto LABEL_45;
      }
      uint64_t v70 = MEMORY[0x1E4F1CC38];
    }
    else
    {
      uint64_t v70 = MEMORY[0x1E4F1CC28];
    }
    [v64 setObject:v70 forKeyedSubscript:@"Active"];
LABEL_45:
    v71 = [(__CFDictionary *)v20 objectForKeyedSubscript:@"State:/Network/Interface/en2/LinkQuality"];

    if (v71)
    {
      v72 = [(__CFDictionary *)v20 objectForKeyedSubscript:@"State:/Network/Interface/en2/LinkQuality"];
      v73 = [v72 objectForKeyedSubscript:@"LinkQuality"];
      [v64 setObject:v73 forKeyedSubscript:@"LinkQuality"];
    }
    [(PLOperator *)self logEntry:v64];
  }
LABEL_48:
}

uint64_t __67__PLSCDynamicStoreAgent_networkLinkQualityChanged_withChangedKeys___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_103 = result;
  return result;
}

uint64_t __67__PLSCDynamicStoreAgent_networkLinkQualityChanged_withChangedKeys___block_invoke_48(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C3B9 = result;
  return result;
}

uint64_t __67__PLSCDynamicStoreAgent_networkLinkQualityChanged_withChangedKeys___block_invoke_77(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD5C3BA = result;
  return result;
}

@end