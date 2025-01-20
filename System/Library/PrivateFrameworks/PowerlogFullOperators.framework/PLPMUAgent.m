@interface PLPMUAgent
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
- (PLEntryNotificationOperatorComposition)batteryLevelChanged;
- (PLPMUAgent)init;
- (void)init;
- (void)initOperatorDependancies;
- (void)logEventPointSensors;
- (void)setBatteryLevelChanged:(id)a3;
@end

@implementation PLPMUAgent

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLPMUAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)defaults
{
  return (id)MEMORY[0x263EFFA78];
}

+ (id)railDefinitions
{
  return (id)MEMORY[0x263EFFA78];
}

+ (id)accountingGroupDefinitions
{
  return (id)MEMORY[0x263EFFA78];
}

+ (id)entryEventPointDefinitions
{
  v36[1] = *MEMORY[0x263EF8340];
  uint64_t v35 = kPLPMUAgentSensors;
  v33[0] = *MEMORY[0x263F5F858];
  uint64_t v2 = *MEMORY[0x263F5F850];
  v31[0] = *MEMORY[0x263F5F880];
  v31[1] = v2;
  v32[0] = &unk_26E5465F0;
  v32[1] = MEMORY[0x263EFFA88];
  v31[2] = *MEMORY[0x263F5F860];
  v32[2] = MEMORY[0x263EFFA88];
  v26 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:3];
  v34[0] = v26;
  v33[1] = *MEMORY[0x263F5F870];
  v29[0] = @"C-ich";
  v25 = [MEMORY[0x263F5F650] sharedInstance];
  v24 = objc_msgSend(v25, "commonTypeDict_RealFormat");
  v30[0] = v24;
  v29[1] = @"C-vbus";
  v23 = [MEMORY[0x263F5F650] sharedInstance];
  v22 = objc_msgSend(v23, "commonTypeDict_RealFormat");
  v30[1] = v22;
  v29[2] = @"C-ich_avg";
  v21 = [MEMORY[0x263F5F650] sharedInstance];
  v20 = objc_msgSend(v21, "commonTypeDict_RealFormat");
  v30[2] = v20;
  v29[3] = @"V-vbus";
  v19 = [MEMORY[0x263F5F650] sharedInstance];
  v18 = objc_msgSend(v19, "commonTypeDict_RealFormat");
  v30[3] = v18;
  v29[4] = @"V-adc_in7";
  v17 = [MEMORY[0x263F5F650] sharedInstance];
  v16 = objc_msgSend(v17, "commonTypeDict_RealFormat");
  v30[4] = v16;
  v29[5] = @"V-vbat";
  v15 = [MEMORY[0x263F5F650] sharedInstance];
  v14 = objc_msgSend(v15, "commonTypeDict_RealFormat");
  v30[5] = v14;
  v29[6] = @"V-vcc_main";
  v3 = [MEMORY[0x263F5F650] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_RealFormat");
  v30[6] = v4;
  v5 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:7];
  v34[1] = v5;
  v33[2] = *MEMORY[0x263F5F868];
  v27[0] = @"value";
  v6 = [MEMORY[0x263F5F650] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_RealFormat");
  v27[1] = @"unit";
  v28[0] = v7;
  v8 = [MEMORY[0x263F5F650] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_StringFormat");
  v28[1] = v9;
  v10 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
  v34[2] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:3];
  v36[0] = v11;
  v12 = [NSDictionary dictionaryWithObjects:v36 forKeys:&v35 count:1];

  return v12;
}

+ (id)entryEventForwardDefinitions
{
  return (id)MEMORY[0x263EFFA78];
}

+ (id)entryEventBackwardDefinitions
{
  return (id)MEMORY[0x263EFFA78];
}

+ (id)entryEventIntervalDefinitions
{
  return (id)MEMORY[0x263EFFA78];
}

+ (id)entryEventNoneDefinitions
{
  return (id)MEMORY[0x263EFFA78];
}

+ (id)entryAggregateDefinitions
{
  return (id)MEMORY[0x263EFFA78];
}

- (PLPMUAgent)init
{
  v99[2] = *MEMORY[0x263EF8340];
  if ([MEMORY[0x263F5F668] isArchARM])
  {
    v93.receiver = self;
    v93.super_class = (Class)PLPMUAgent;
    v3 = [(PLAgent *)&v93 init];
    if (!v3)
    {
LABEL_51:
      self = v3;
      v23 = self;
      goto LABEL_52;
    }
    uint64_t v4 = IOHIDEventSystemClientCreate();
    v3->hidEventSystem = (__IOHIDEventSystemClient *)v4;
    if (!v4)
    {
      if (![MEMORY[0x263F5F640] debugEnabled]) {
        goto LABEL_51;
      }
      uint64_t v24 = objc_opt_class();
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __18__PLPMUAgent_init__block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v24;
      if (init_defaultOnce != -1) {
        dispatch_once(&init_defaultOnce, block);
      }
      if (!init_classDebugEnabled) {
        goto LABEL_51;
      }
      v10 = [NSString stringWithFormat:@"PMU: could not create HIDEventSystem"];
      v25 = (void *)MEMORY[0x263F5F638];
      v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLPMUAgent.m"];
      v27 = [v26 lastPathComponent];
      v28 = [NSString stringWithUTF8String:"-[PLPMUAgent init]"];
      [v25 logMessage:v10 fromFile:v27 fromFunction:v28 fromLineNumber:119];

      v12 = PLLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        [(PLPMUAgent *)(uint64_t)v10 init];
      }
      goto LABEL_50;
    }
    uint64_t v5 = objc_opt_new();
    matchingSensors = v3->matchingSensors;
    v3->matchingSensors = (NSMutableDictionary *)v5;

    v98[0] = @"PrimaryUsagePage";
    unint64_t v7 = 0x263F08000uLL;
    v8 = [NSNumber numberWithInt:65288];
    v98[1] = @"PrimaryUsage";
    v99[0] = v8;
    v9 = [NSNumber numberWithInt:3];
    v99[1] = v9;
    v10 = [NSDictionary dictionaryWithObjects:v99 forKeys:v98 count:2];

    IOHIDEventSystemClientSetMatching();
    CFArrayRef v11 = IOHIDEventSystemClientCopyServices(v3->hidEventSystem);
    v12 = v11;
    v79 = v11;
    if (v11)
    {
      long long v89 = 0u;
      long long v90 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      obuint64_t j = v11;
      uint64_t v13 = [(__CFArray *)obj countByEnumeratingWithState:&v87 objects:v97 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        v78 = v10;
        uint64_t v15 = *(void *)v88;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v88 != v15) {
              objc_enumerationMutation(obj);
            }
            v17 = *(__IOHIDServiceClient **)(*((void *)&v87 + 1) + 8 * i);
            v18 = (void *)IOHIDServiceClientCopyProperty(v17, @"Product");
            v19 = v18;
            if (v18)
            {
              v20 = v3->matchingSensors;
              [v18 stringByReplacingOccurrencesOfString:@"PMU " withString:@"V-"];
              v22 = v21 = v3;
              [(NSMutableDictionary *)v20 setObject:v17 forKey:v22];

              v3 = v21;
            }
          }
          uint64_t v14 = [(__CFArray *)obj countByEnumeratingWithState:&v87 objects:v97 count:16];
        }
        while (v14);
        v10 = v78;
        v12 = v79;
        unint64_t v7 = 0x263F08000;
      }
    }
    else
    {
      if (![MEMORY[0x263F5F640] debugEnabled]) {
        goto LABEL_30;
      }
      uint64_t v35 = objc_opt_class();
      v91[0] = MEMORY[0x263EF8330];
      v91[1] = 3221225472;
      v91[2] = __18__PLPMUAgent_init__block_invoke_60;
      v91[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v91[4] = v35;
      if (init_defaultOnce_58 != -1) {
        dispatch_once(&init_defaultOnce_58, v91);
      }
      if (!init_classDebugEnabled_59)
      {
LABEL_30:
        v95[0] = @"PrimaryUsagePage";
        v48 = [*(id *)(v7 + 2584) numberWithInt:65288];
        v95[1] = @"PrimaryUsage";
        v96[0] = v48;
        v49 = [*(id *)(v7 + 2584) numberWithInt:2];
        v96[1] = v49;
        v50 = [NSDictionary dictionaryWithObjects:v96 forKeys:v95 count:2];

        IOHIDEventSystemClientSetMatching();
        CFArrayRef v51 = IOHIDEventSystemClientCopyServices(v3->hidEventSystem);
        CFArrayRef v52 = v51;
        if (v51)
        {
          long long v84 = 0u;
          long long v85 = 0u;
          long long v82 = 0u;
          long long v83 = 0u;
          CFArrayRef obja = v51;
          uint64_t v53 = [(__CFArray *)obja countByEnumeratingWithState:&v82 objects:v94 count:16];
          if (v53)
          {
            uint64_t v54 = v53;
            CFArrayRef v76 = v52;
            v77 = v50;
            uint64_t v55 = *(void *)v83;
            do
            {
              for (uint64_t j = 0; j != v54; ++j)
              {
                if (*(void *)v83 != v55) {
                  objc_enumerationMutation(obja);
                }
                v57 = *(__IOHIDServiceClient **)(*((void *)&v82 + 1) + 8 * j);
                v58 = (void *)IOHIDServiceClientCopyProperty(v57, @"Product");
                v59 = v58;
                if (v58)
                {
                  v60 = v3->matchingSensors;
                  v61 = [v58 stringByReplacingOccurrencesOfString:@"PMU " withString:@"C-"];
                  [(NSMutableDictionary *)v60 setObject:v57 forKey:v61];
                }
              }
              uint64_t v54 = [(__CFArray *)obja countByEnumeratingWithState:&v82 objects:v94 count:16];
            }
            while (v54);
            v12 = v79;
            CFArrayRef v52 = v76;
            v50 = v77;
          }
        }
        else
        {
          if (![MEMORY[0x263F5F640] debugEnabled]) {
            goto LABEL_49;
          }
          uint64_t v62 = objc_opt_class();
          v86[0] = MEMORY[0x263EF8330];
          v86[1] = 3221225472;
          v86[2] = __18__PLPMUAgent_init__block_invoke_75;
          v86[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v86[4] = v62;
          if (init_defaultOnce_73 != -1) {
            dispatch_once(&init_defaultOnce_73, v86);
          }
          if (!init_classDebugEnabled_74) {
            goto LABEL_49;
          }
          uint64_t v63 = [NSString stringWithFormat:@"ERROR: PMU: Could not find any current sensors"];
          v64 = (void *)MEMORY[0x263F5F638];
          v65 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLPMUAgent.m"];
          v66 = [v65 lastPathComponent];
          v67 = [NSString stringWithUTF8String:"-[PLPMUAgent init]"];
          CFArrayRef obja = (const __CFArray *)v63;
          [v64 logMessage:v63 fromFile:v66 fromFunction:v67 fromLineNumber:149];

          v68 = PLLogCommon();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG)) {
            [(PLPMUAgent *)v63 init];
          }

          v12 = v79;
        }

LABEL_49:
LABEL_50:

        goto LABEL_51;
      }
      uint64_t v36 = [NSString stringWithFormat:@"ERROR: PMU: Could not find any voltage sensors"];
      v37 = (void *)MEMORY[0x263F5F638];
      v38 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLPMUAgent.m"];
      v39 = [v38 lastPathComponent];
      v40 = [NSString stringWithUTF8String:"-[PLPMUAgent init]"];
      obuint64_t j = (const __CFArray *)v36;
      [v37 logMessage:v36 fromFile:v39 fromFunction:v40 fromLineNumber:131];

      v41 = PLLogCommon();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
        [(PLPMUAgent *)v36 init];
      }

      v12 = 0;
    }

    goto LABEL_30;
  }
  v23 = 0;
LABEL_52:

  return v23;
}

uint64_t __18__PLPMUAgent_init__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  init_classDebugEnabled = result;
  return result;
}

uint64_t __18__PLPMUAgent_init__block_invoke_60(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  init_classDebugEnabled_59 = result;
  return result;
}

uint64_t __18__PLPMUAgent_init__block_invoke_75(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263F5F640] isClassDebugEnabled:*(void *)(a1 + 32)];
  init_classDebugEnabled_74 = result;
  return result;
}

- (void)initOperatorDependancies
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __38__PLPMUAgent_initOperatorDependancies__block_invoke;
  v4[3] = &unk_264B99DD0;
  v4[4] = self;
  v3 = [MEMORY[0x263F5F658] significantBatteryChangeNotificationWithOperator:self withBlock:v4];
  [(PLPMUAgent *)self setBatteryLevelChanged:v3];
}

uint64_t __38__PLPMUAgent_initOperatorDependancies__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) log];
}

- (void)logEventPointSensors
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (self->matchingSensors)
  {
    uint64_t v13 = +[PLOperator entryKeyForType:*MEMORY[0x263F5F8B8] andName:kPLPMUAgentSensors];
    v3 = (void *)[objc_alloc(MEMORY[0x263F5F648]) initWithEntryKey:v13];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v4 = [(NSMutableDictionary *)self->matchingSensors allKeys];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          [(NSMutableDictionary *)self->matchingSensors objectForKeyedSubscript:v9];

          uint64_t v10 = IOHIDServiceClientCopyEvent();
          if (v10)
          {
            CFArrayRef v11 = (const void *)v10;
            IOHIDEventGetFloatValue();
            v12 = objc_msgSend(NSNumber, "numberWithDouble:");
            [v3 setObject:v12 forKeyedSubscript:v9];

            CFRelease(v11);
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v6);
    }

    [(PLOperator *)self logEntry:v3];
  }
}

- (PLEntryNotificationOperatorComposition)batteryLevelChanged
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setBatteryLevelChanged:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryLevelChanged, 0);
  objc_storeStrong((id *)&self->sensorNamesV, 0);
  objc_storeStrong((id *)&self->sensorNamesC, 0);

  objc_storeStrong((id *)&self->matchingSensors, 0);
}

- (void)init
{
}

@end