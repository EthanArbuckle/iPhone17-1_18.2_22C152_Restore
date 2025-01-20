@interface SASInterfaceTouchButtonHost
- (BOOL)active;
- (BOOL)caseAttached;
- (BOOL)fullPressEngaged:(BOOL)a3 timestamp:(unint64_t)a4;
- (BOOL)handleInputStream:(id)a3;
- (BOOL)injectAlgsProperty:(id)a3;
- (BOOL)injectProperty:(id)a3 value:(id)a4;
- (BOOL)runAlgs:(void *)a3 timestamp:(unint64_t)a4;
- (BOOL)touchSensitiveButtonEventsEnabled;
- (NSArray)forceStages;
- (NSMutableArray)versions;
- (NSMutableData)inputBuffer;
- (NSMutableData)outputBuffer;
- (NSMutableDictionary)propertyDatabase;
- (SACaseConnectionInfoProvider)caseConnectionInfoProvider;
- (SASInterfaceTouchButtonHost)initWithStreamSize:(unint64_t)a3 platformId:(unint64_t)a4 streamCallback:(id)a5;
- (const)forceStageEvents;
- (const)forceStageEventsDescriptor;
- (const)touchSensitiveButtonEvents;
- (const)touchSensitiveButtonEventsDescriptor;
- (id)configurationCallback;
- (id)coreAnalyticsCallback;
- (id)eventCallback;
- (id)extractAlgsState:(id)a3;
- (id)generateNovaEvent:(const TouchSensitiveButtonEventPacket *)a3 force_stage_event:(const ForceStageEventPacket *)a4;
- (id)getProperty:(id)a3;
- (id)resetRequestCallback;
- (id)streamCallback;
- (mach_timebase_info)timebase;
- (uint64_t)configureCallbacks;
- (unint64_t)timestampAbsoluteMachToUs:(unint64_t)a3;
- (unint64_t)timestampUsToAbsoluteMach:(unint64_t)a3;
- (unint64_t)timestampUsToContinuousMach:(unint64_t)a3;
- (unsigned)lastFrameId;
- (unsigned)planId;
- (unsigned)usage;
- (unsigned)usagePage;
- (void)addVersion:(id)a3;
- (void)callConfigurationCallback:(unint64_t)a3;
- (void)callEventCallback;
- (void)callResetRequestCallback:(unsigned __int16)a3 arg_ptr:(const void *)a4;
- (void)callStreamCallback:(unint64_t)a3;
- (void)cleanup;
- (void)cleanupExtractions;
- (void)configureCallbacks;
- (void)defaultStreamingConfiguration;
- (void)device;
- (void)initProperties;
- (void)sendNovaCAEvents:(const NovaCoreAnalytics *)a3;
- (void)sendNovaHostCAEvents:(const NovaHostCoreAnalytics *)a3;
- (void)setActive:(BOOL)a3;
- (void)setCaseAttached:(BOOL)a3;
- (void)setCaseConnectionInfoProvider:(id)a3;
- (void)setConfigurationCallback:(id)a3;
- (void)setCoreAnalyticsCallback:(id)a3;
- (void)setDevice:(void *)a3;
- (void)setEventCallback:(id)a3;
- (void)setForceStageEvents:(const ForceStageEventPacket *)a3;
- (void)setForceStageEventsDescriptor:(const _SADynamicArrayDescriptor *)a3;
- (void)setInputBuffer:(id)a3;
- (void)setLastFrameId:(unsigned int)a3;
- (void)setOutputBuffer:(id)a3;
- (void)setPlanId:(unsigned __int8)a3;
- (void)setPropertyDatabase:(id)a3;
- (void)setResetRequestCallback:(id)a3;
- (void)setStreamCallback:(id)a3;
- (void)setTimebase:(mach_timebase_info)a3;
- (void)setTouchSensitiveButtonEvents:(const TouchSensitiveButtonEventPacket *)a3;
- (void)setTouchSensitiveButtonEventsDescriptor:(const _SADynamicArrayDescriptor *)a3;
- (void)setTouchSensitiveButtonEventsEnabled:(BOOL)a3;
- (void)setUsage:(unsigned __int16)a3;
- (void)setUsagePage:(unsigned __int16)a3;
- (void)setVersions:(id)a3;
@end

@implementation SASInterfaceTouchButtonHost

- (SASInterfaceTouchButtonHost)initWithStreamSize:(unint64_t)a3 platformId:(unint64_t)a4 streamCallback:(id)a5
{
  id v7 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SASInterfaceTouchButtonHost;
  v8 = [(SASInterfaceTouchButtonHost *)&v16 init];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x263EFF990] dataWithLength:a3];
    outputBuffer = v8->_outputBuffer;
    v8->_outputBuffer = (NSMutableData *)v9;

    uint64_t v11 = [MEMORY[0x263EFF990] dataWithLength:a3];
    inputBuffer = v8->_inputBuffer;
    v8->_inputBuffer = (NSMutableData *)v11;

    *(unsigned char *)[(NSMutableData *)v8->_outputBuffer mutableBytes] = 90;
    uint64_t v13 = MEMORY[0x261179050](v7);
    id streamCallback = v8->_streamCallback;
    v8->_id streamCallback = (id)v13;

    OUTLINED_FUNCTION_13();
    operator new();
  }

  return 0;
}

- (void)initProperties
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v25[0] = @"WorkNodeId";
  v25[1] = @"DataNodeId";
  v26[0] = &unk_27096ED98;
  v26[1] = &unk_27096EDB0;
  v25[2] = @"Type";
  v26[2] = &unk_27096EDC8;
  v27[0] = @"MaybeStageEnabled";
  objc_super v16 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:3];
  uint64_t v28 = [v16 mutableCopy];
  v27[1] = @"AccelerationEnabled";
  v23[0] = @"WorkNodeId";
  v23[1] = @"DataNodeId";
  v24[0] = &unk_27096ED98;
  v24[1] = &unk_27096EDE0;
  v23[2] = @"Type";
  v24[2] = &unk_27096EDC8;
  v15 = (void *)v28;
  v14 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:3];
  uint64_t v29 = [v14 mutableCopy];
  v27[2] = @"ActiveMode";
  v21[0] = @"WorkNodeId";
  v21[1] = @"DataNodeId";
  v22[0] = &unk_27096EDF8;
  v22[1] = &unk_27096EE10;
  v21[2] = @"Type";
  v22[2] = &unk_27096EDC8;
  v12 = (void *)v29;
  uint64_t v13 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:3];
  uint64_t v11 = (void *)[v13 mutableCopy];
  v30 = v11;
  v27[3] = @"HalfPressThresholdModifier";
  v19[0] = @"WorkNodeId";
  v19[1] = @"DataNodeId";
  v20[0] = &unk_27096EE28;
  v20[1] = &unk_27096EE40;
  v19[2] = @"Type";
  v19[3] = @"IsExternalNode";
  uint64_t v3 = MEMORY[0x263EFFA88];
  v20[2] = &unk_27096EE58;
  v20[3] = MEMORY[0x263EFFA88];
  v10 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:4];
  v4 = (void *)[v10 mutableCopy];
  v31 = v4;
  v27[4] = @"NovaCaseAttachState";
  v17[0] = @"WorkNodeId";
  v17[1] = @"DataNodeId";
  v18[0] = &unk_27096EE28;
  v18[1] = &unk_27096EE70;
  v17[2] = @"Type";
  v17[3] = @"IsExternalNode";
  v18[2] = &unk_27096EDC8;
  v18[3] = v3;
  v5 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:4];
  v6 = (void *)[v5 mutableCopy];
  v32 = v6;
  id v7 = [NSDictionary dictionaryWithObjects:&v28 forKeys:v27 count:5];
  v8 = (NSMutableDictionary *)[v7 mutableCopy];
  propertyDatabase = self->_propertyDatabase;
  self->_propertyDatabase = v8;
}

- (BOOL)handleInputStream:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v6 = a3;
  BOOL v7 = [(SACaseConnectionInfoProvider *)self->_caseConnectionInfoProvider caseConnected];
  if (self->_caseAttached != v7)
  {
    v8 = SALoggingGeneral();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_0_1_4_0(buf, v7);
      _os_log_impl(&dword_25BF2A000, v8, OS_LOG_TYPE_DEFAULT, "[SASInterfaceTouchButtonHost] updating case attach state to %d", buf, 8u);
    }

    uint64_t v9 = [NSNumber numberWithBool:v7];
    [(SASInterfaceTouchButtonHost *)self injectProperty:@"NovaCaseAttachState" value:v9];

    self->_caseAttached = v7;
  }
  id v10 = v6;
  uint64_t v11 = (unsigned char *)[v10 bytes];
  if (![v10 length] || *v11 != 90)
  {
    BOOL v12 = 1;
    goto LABEL_10;
  }
  StreamingParser::StreamingParser((uint64_t)buf, (uint64_t)(v11 + 1), [v10 length] - 1, 0);
  if (v47 <= 1)
  {
    uint64_t v40 = 0;
    uint64_t v41 = 0;
    uint64_t v42 = 0;
    goto LABEL_22;
  }
  OUTLINED_FUNCTION_7();
  if (!v15 || v14[1] != 1 || !self->_active)
  {
    uint64_t v40 = 0;
    uint64_t v41 = 0;
    uint64_t v42 = 0;
    goto LABEL_18;
  }
  [(SASInterfaceTouchButtonHost *)self cleanup];
  v14 = v46;
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  uint64_t v42 = 0;
  if (v47 >= 2)
  {
LABEL_18:
    if (*v14 == 1 && v14[1] == 2)
    {
      StreamingParser::parseRun((uint64_t)buf, (uint64_t)&v40, 0, 0);
      if (v40 == 0x2000)
      {
        unsigned int v4 = *(_DWORD *)(v42 + 8);
        uint64_t v3 = *(void *)(v42 + 16);
        self->_lastFrameId = v4;
      }
    }
  }
LABEL_22:
  unsigned __int8 v39 = 0;
  unint64_t v38 = 0;
  unint64_t v38 = [(NSMutableData *)self->_outputBuffer length] - 1;
  objc_super v16 = [(NSMutableData *)self->_outputBuffer mutableBytes];
  v37 = 0;
  unsigned __int16 v36 = 0;
  uint64_t v34 = 0;
  uint64_t v35 = 0;
  mach_get_times();
  device = (AlgsDevice *)self->_device;
  id v18 = v10;
  AlgsDevice::handleInputStream(device, (const void *)([v18 bytes] + 1), objc_msgSend(v18, "length") - 1, v16 + 1, &v38, &v39, &v36, (const void **)&v37);
  BOOL v12 = v19;
  if (v47 >= 2)
  {
    OUTLINED_FUNCTION_7();
    if (v15)
    {
      if (*(unsigned char *)(v20 + 1) == 2)
      {
        v21 = SALoggingHIDEventSignpost();
        v22 = SALoggingHIDEventSignpost();
        os_signpost_id_t v23 = os_signpost_id_generate(v22);

        if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
        {
          __os_log_helper_16_0_3_8_2_8_0_4_0((uint64_t)v44, v35, v3, v4);
          _os_signpost_emit_with_name_impl(&dword_25BF2A000, v21, OS_SIGNPOST_EVENT, v23, "HandleInputStream", "%{public, signpost.description:begin_time}llu timestamp:%llu frameId:%d ", v44, 0x1Cu);
        }
      }
    }
  }
  [(SASInterfaceTouchButtonHost *)self callStreamCallback:v38];
  [(SASInterfaceTouchButtonHost *)self callEventCallback];
  int v24 = v39;
  if (v39 == 1)
  {
    [(SASInterfaceTouchButtonHost *)self callResetRequestCallback:v36 arg_ptr:v37];
    int v24 = v39;
  }
  if (v24 == 2) {
    [(SASInterfaceTouchButtonHost *)self defaultStreamingConfiguration];
  }
  if (v47 >= 2)
  {
    OUTLINED_FUNCTION_7();
    if (v15)
    {
      if (*(unsigned char *)(v25 + 1) == 1)
      {
        [(SASInterfaceTouchButtonHost *)self configureCallbacks];
        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        v26 = self->_propertyDatabase;
        unint64_t v27 = [(NSMutableDictionary *)v26 countByEnumeratingWithState:&v30 objects:v43 count:16];
        if (v27)
        {
          uint64_t v28 = *(void *)v31;
          do
          {
            for (unint64_t i = 0; i < v27; ++i)
            {
              if (*(void *)v31 != v28) {
                objc_enumerationMutation(v26);
              }
              -[SASInterfaceTouchButtonHost injectAlgsProperty:](self, "injectAlgsProperty:", *(void *)(*((void *)&v30 + 1) + 8 * i), (void)v30);
            }
            unint64_t v27 = [(NSMutableDictionary *)v26 countByEnumeratingWithState:&v30 objects:v43 count:16];
          }
          while (v27);
        }
      }
    }
  }
LABEL_10:

  return v12;
}

- (void)defaultStreamingConfiguration
{
  uint64_t v3 = AlgDataExtractor::AlgDataExtractor((uint64_t)v42, 3, 1);
  OUTLINED_FUNCTION_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10, v38, v41, v42[0]);
  OUTLINED_FUNCTION_5();
  uint64_t v15 = AlgDataExtractor::callbackFor(v11, v12, v13, v14);
  OUTLINED_FUNCTION_1(v15, v16, v17, v18, v19, v20, v21, v22, v39, v41, v42[0]);
  OUTLINED_FUNCTION_8();
  uint64_t v27 = AlgDataExtractor::callbackFor(v23, v24, v25, v26);
  OUTLINED_FUNCTION_1(v27, v28, v29, v30, v31, v32, v33, v34, v40, v41, v42[0]);
  OUTLINED_FUNCTION_14();
  AlgDataExtractor::callbackFor(v35, v36, v37, 1);
  unint64_t v41 = [(NSMutableData *)self->_outputBuffer length] - 1;
  AlgsDevice::configureStreaming((AlgsDevice::StreamingClient **)self->_device, 0, (AlgDataExtractor *)v42, [(NSMutableData *)self->_outputBuffer mutableBytes] + 1, &v41);
  [(SASInterfaceTouchButtonHost *)self callStreamCallback:v41];
  PacketCollection::~PacketCollection((PacketCollection *)v42);
}

- (void)callStreamCallback:(unint64_t)a3
{
  if (a3 && self->_streamCallback)
  {
    objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytesNoCopy:length:freeWhenDone:", -[NSMutableData mutableBytes](self->_outputBuffer, "mutableBytes"), a3 + 1, 0);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void))self->_streamCallback + 2))();
  }
}

- (void)configureCallbacks
{
  id v2 = *(id *)a1;
  [v2 setForceStageEventsDescriptor:*(void *)(a1 + 40)];
  [v2 setForceStageEvents:*(void *)(a1 + 56)];
}

- (void)callResetRequestCallback:(unsigned __int16)a3 arg_ptr:(const void *)a4
{
  resetRequestCallback = (void (**)(id, void))self->_resetRequestCallback;
  if (resetRequestCallback)
  {
    if (a3 == 1) {
      uint64_t v5 = *(unsigned __int8 *)a4;
    }
    else {
      uint64_t v5 = 0;
    }
    resetRequestCallback[2](resetRequestCallback, v5);
  }
}

- (void)callEventCallback
{
  if (self->_eventCallback
    && self->_touchSensitiveButtonEvents
    && self->_touchSensitiveButtonEventsDescriptor
    && self->_forceStageEvents
    && self->_forceStageEventsDescriptor)
  {
    uint64_t v3 = objc_opt_new();
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    for (unint64_t i = 0; i < self->_touchSensitiveButtonEventsDescriptor->var3; ++i)
    {
      uint64_t v7 = [(SASInterfaceTouchButtonHost *)self generateNovaEvent:&self->_touchSensitiveButtonEvents[v4] force_stage_event:&self->_forceStageEvents[v5]];
      if (v7)
      {
        [v3 addObject:v7];
      }
      else
      {
        uint64_t v8 = SALoggingGeneral();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_0_0(v9);
          _os_log_error_impl(&dword_25BF2A000, v8, OS_LOG_TYPE_ERROR, "Error creating TouchSensitiveButton event!", (uint8_t *)v9, 2u);
        }
      }
      ++v5;
      ++v4;
    }
    (*((void (**)(void))self->_eventCallback + 2))();
    [(SASInterfaceTouchButtonHost *)self cleanupExtractions];
  }
  else
  {
    [(SASInterfaceTouchButtonHost *)self cleanupExtractions];
  }
}

- (void)callConfigurationCallback:(unint64_t)a3
{
  if (a3 && self->_configurationCallback)
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytesNoCopy:length:freeWhenDone:", -[NSMutableData mutableBytes](self->_outputBuffer, "mutableBytes"), a3, 0);
    if (((*((uint64_t (**)(void))self->_configurationCallback + 2))() & 1) == 0)
    {
      uint64_t v5 = SALoggingGeneral();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_0_0(v12);
        OUTLINED_FUNCTION_9(&dword_25BF2A000, v6, v7, "Error calling configuration callback", v8, v9, v10, v11, v12[0]);
      }
    }
  }
}

- (void)cleanupExtractions
{
  *(_OWORD *)&self->_touchSensitiveButtonEvents = 0u;
  *(_OWORD *)&self->_touchSensitiveButtonEventsDescriptor = 0u;
}

- (id)generateNovaEvent:(const TouchSensitiveButtonEventPacket *)a3 force_stage_event:(const ForceStageEventPacket *)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  unint64_t v7 = [(SASInterfaceTouchButtonHost *)self timestampUsToAbsoluteMach:a3->var0];
  if (self->_touchSensitiveButtonEventsEnabled)
  {
    TouchSensitiveButtonEventWithRadius = (void *)IOHIDEventCreateTouchSensitiveButtonEventWithRadius();
    IOHIDEventSetPhase();
    ForceStageEvent = (void *)IOHIDEventCreateForceStageEvent();
    IOHIDEventSetPhase();
    [TouchSensitiveButtonEventWithRadius appendEvent:ForceStageEvent];
  }
  else
  {
    uint64_t v10 = *(void *)&a4->var5;
    float64x2_t v21 = vcvtq_f64_f32(*(float32x2_t *)&a4->var2);
    double var1 = a4->var1;
    double var4 = a4->var4;
    double v23 = var1;
    uint64_t v24 = 0x7FF8000000000000;
    double var2 = a3->var2;
    *(void *)buf = v10;
    LODWORD(v17) = 0;
    TouchSensitiveButtonEventWithRadius = [MEMORY[0x263F0EC40] vendorDefinedEvent:v7 usagePage:self->_usagePage usage:self->_usage version:0 data:&var2 length:8 options:v17];
    LODWORD(v18) = 0;
    uint64_t v12 = [MEMORY[0x263F0EC40] vendorDefinedEvent:v7 usagePage:65280 usage:17 version:0 data:buf length:48 options:v18];
    IOHIDEventSetPhase();
    IOHIDEventSetPhase();
    [TouchSensitiveButtonEventWithRadius appendEvent:v12];
  }
  uint64_t v13 = SALoggingHIDEventSignpost();
  int v14 = SALoggingHIDEventSignpost();
  os_signpost_id_t v15 = os_signpost_id_generate(v14);

  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    __os_log_helper_16_0_7_8_2_8_0_8_0_4_0_4_0_4_0_4_0((uint64_t)buf, [(SASInterfaceTouchButtonHost *)self timestampUsToContinuousMach:a3->var0], COERCE__INT64(a3->var1), COERCE__INT64(a3->var2), a4->var5, a4->var6, a4->var7, a3->var6);
    _os_signpost_emit_with_name_impl(&dword_25BF2A000, v13, OS_SIGNPOST_EVENT, v15, "GenerateTouchSensitiveButtonEvent", "%{public, signpost.description:begin_time}llu position=%3f positionDelta=%3f forceStage:%d forceTransition:%d phase:0x%x touching:%d", buf, 0x38u);
  }

  return TouchSensitiveButtonEventWithRadius;
}

- (unint64_t)timestampUsToContinuousMach:(unint64_t)a3
{
  HIDWORD(v4) = 1083129856;
  LODWORD(v3) = self->_timebase.numer;
  LODWORD(v4) = self->_timebase.denom;
  return (unint64_t)((double)a3 * 1000.0 * (double)v4 / (double)v3);
}

- (unint64_t)timestampUsToAbsoluteMach:(unint64_t)a3
{
  OUTLINED_FUNCTION_4();
  return v6 - v7 + [v4 timestampUsToContinuousMach:v3];
}

- (unint64_t)timestampAbsoluteMachToUs:(unint64_t)a3
{
  OUTLINED_FUNCTION_4();
  LODWORD(v5) = *(_DWORD *)(v4 + 84);
  return (unint64_t)((double)((v8 + v3 - v7) * (unint64_t)*(unsigned int *)(v4 + 80)) / (double)v5 / 1000.0);
}

- (void)cleanup
{
  [(SASInterfaceTouchButtonHost *)self injectProperty:@"ActiveMode" value:MEMORY[0x263EFFA80]];
  AlgDataInjector::AlgDataInjector((uint64_t)v12, 0, 1);
  if (![(SASInterfaceTouchButtonHost *)self runAlgs:v12 timestamp:[(SASInterfaceTouchButtonHost *)self timestampAbsoluteMachToUs:mach_absolute_time()]])
  {
    uint64_t v3 = SALoggingGeneral();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_0_0(v11);
      OUTLINED_FUNCTION_9(&dword_25BF2A000, v5, v6, "[SASInterfaceTouchButtonHost] Failed to run cleanup!", v7, v8, v9, v10, v11[0]);
    }
  }
  if (self->_active)
  {
    uint64_t v4 = [NSNumber numberWithBool:1];
    [(SASInterfaceTouchButtonHost *)self injectProperty:@"ActiveMode" value:v4];
  }
  PacketCollection::~PacketCollection((PacketCollection *)v12);
}

- (BOOL)injectProperty:(id)a3 value:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(NSMutableDictionary *)self->_propertyDatabase objectForKeyedSubscript:v6];
  uint64_t v9 = v8;
  if (!v8)
  {
    if (([v6 isEqualToString:@"SwitchPressedTimestamp"] & 1) != 0
      || [v6 isEqualToString:@"SwitchReleasedTimestamp"])
    {
      id v11 = v7;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        char isKindOfClass = -[SASInterfaceTouchButtonHost fullPressEngaged:timestamp:](self, "fullPressEngaged:timestamp:", [v6 isEqualToString:@"SwitchPressedTimestamp"], objc_msgSend(v11, "unsignedLongLongValue"));
      }
      else {
        char isKindOfClass = 0;
      }
LABEL_8:

      goto LABEL_9;
    }
    if ([v6 isEqualToString:@"CameraButtonScanActive"])
    {
      id v11 = v7;
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (isKindOfClass) {
        -[SASInterfaceTouchButtonHost setActive:](self, "setActive:", [v11 BOOLValue]);
      }
      goto LABEL_8;
    }
    if ([v6 isEqualToString:@"PrimaryUsagePage"])
    {
      id v13 = v7;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        __int16 v14 = [v13 unsignedIntValue];
        uint64_t v15 = 12;
LABEL_19:
        *(_WORD *)((char *)&self->super.isa + v15) = v14;

        uint64_t v16 = SALoggingGeneral();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_2_2_8_64_8_64((uint64_t)v17, (uint64_t)v6, (uint64_t)v7);
          _os_log_impl(&dword_25BF2A000, v16, OS_LOG_TYPE_DEFAULT, "[SASInterfaceTouchButtonHost] Injected property: %@ : %@", v17, 0x16u);
        }

        goto LABEL_22;
      }
    }
    else
    {
      if (![v6 isEqualToString:@"PrimaryUsage"])
      {
LABEL_22:
        char isKindOfClass = 1;
        goto LABEL_9;
      }
      id v13 = v7;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        __int16 v14 = [v13 unsignedIntValue];
        uint64_t v15 = 14;
        goto LABEL_19;
      }
    }

    char isKindOfClass = 0;
    goto LABEL_9;
  }
  [v8 setObject:v7 forKeyedSubscript:@"Value"];
  char isKindOfClass = [(SASInterfaceTouchButtonHost *)self injectAlgsProperty:v6];
LABEL_9:

  return isKindOfClass & 1;
}

- (id)getProperty:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_propertyDatabase objectForKeyedSubscript:v4];

  if (v5)
  {
    id v6 = [(SASInterfaceTouchButtonHost *)self extractAlgsState:v4];
LABEL_7:
    id v7 = v6;
    goto LABEL_8;
  }
  if ([v4 isEqualToString:@"ForceStages"])
  {
    id v6 = self->_forceStages;
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"CameraButtonScanActive"])
  {
    id v6 = [NSNumber numberWithBool:self->_active];
    goto LABEL_7;
  }
  id v7 = 0;
LABEL_8:

  return v7;
}

- (BOOL)fullPressEngaged:(BOOL)a3 timestamp:(unint64_t)a4
{
  BOOL v4 = a3;
  uint64_t v5 = self;
  unint64_t v6 = [(SASInterfaceTouchButtonHost *)self timestampAbsoluteMachToUs:a4];
  BOOL v14 = v4;
  AlgDataInjector::AlgDataInjector((uint64_t)v13, 1, 1);
  OUTLINED_FUNCTION_14();
  AlgDataPacket::AlgDataPacket(v7, v8, v9, 20480, 1, 1, v10, 4, 0, 0);
  AlgDataInjector::add((AlgDataInjector *)v13, (const AlgDataPacket *)v12);
  AlgDataPacket::~AlgDataPacket((AlgDataPacket *)v12);
  LOBYTE(v5) = [(SASInterfaceTouchButtonHost *)v5 runAlgs:v13 timestamp:v6];
  PacketCollection::~PacketCollection((PacketCollection *)v13);
  return (char)v5;
}

- (BOOL)runAlgs:(void *)a3 timestamp:(unint64_t)a4
{
  unsigned int lastFrameId = self->_lastFrameId;
  int v12 = 0;
  unint64_t v13 = a4;
  long long v8 = xmmword_25BF39430;
  LODWORD(v8) = 0x2000;
  uint64_t v9 = &v10;
  unint64_t v10 = a4;
  NSUInteger v7 = [(NSMutableData *)self->_outputBuffer length] - 1;
  LOBYTE(a3) = (*(uint64_t (**)(void *, long long *, void *, void *, NSUInteger *))(*(void *)self->_device
                                                                                           + 24))(self->_device, &v8, a3, [(NSMutableData *)self->_outputBuffer mutableBytes] + 1, &v7);
  [(SASInterfaceTouchButtonHost *)self callStreamCallback:v7];
  [(SASInterfaceTouchButtonHost *)self callEventCallback];
  return (char)a3;
}

- (BOOL)injectAlgsProperty:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_propertyDatabase objectForKeyedSubscript:v4];
  AlgDataInjector::AlgDataInjector((uint64_t)v40, 1, 1);
  AlgDataExtractor::AlgDataExtractor((uint64_t)v39, 0, 1);
  if (v5)
  {
    unint64_t v6 = [v5 objectForKeyedSubscript:@"WorkNodeId"];
    uint64_t v7 = [v6 unsignedLongLongValue];

    long long v8 = [v5 objectForKeyedSubscript:@"DataNodeId"];
    uint64_t v9 = [v8 unsignedLongLongValue];

    unint64_t v10 = [v5 objectForKeyedSubscript:@"Type"];
    int v11 = [v10 unsignedShortValue];

    int v12 = [v5 objectForKeyedSubscript:@"Value"];
    unint64_t v13 = v12;
    if (v12)
    {
      switch(v11)
      {
        case 20480:
        case 20486:
          BOOL v14 = v12;
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            *(_DWORD *)v43 = 0;
            *(_DWORD *)v43 = [v14 unsignedIntValue];
            uint64_t v15 = [MEMORY[0x263EFF8F8] dataWithBytes:v43 length:4];
            uint64_t v16 = 4;
            goto LABEL_14;
          }
          double v23 = SALoggingGeneral();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            uint64_t v28 = (objc_class *)objc_opt_class();
            uint64_t v29 = NSStringFromClass(v28);
            __os_log_helper_16_2_2_8_64_4_0((uint64_t)v43, (uint64_t)v29, v11);
            OUTLINED_FUNCTION_12(&dword_25BF2A000, v30, v31, "[SASInterfaceTouchButtonHost] InjectProperty: unexpected id %@ for type 0x%x");
          }
          goto LABEL_22;
        case 20483:
          BOOL v14 = v12;
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v43[0] = 0;
            v43[0] = [v14 charValue];
            uint64_t v15 = [MEMORY[0x263EFF8F8] dataWithBytes:v43 length:1];
            uint64_t v16 = 1;
            goto LABEL_14;
          }
          double v23 = SALoggingGeneral();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            uint64_t v32 = (objc_class *)objc_opt_class();
            uint64_t v33 = NSStringFromClass(v32);
            __os_log_helper_16_2_2_8_64_4_0((uint64_t)v43, (uint64_t)v33, 20483);
            OUTLINED_FUNCTION_12(&dword_25BF2A000, v34, v35, "[SASInterfaceTouchButtonHost] InjectProperty: unexpected id %@ for type 0x%x");
          }
LABEL_22:

          goto LABEL_28;
        case 20488:
          BOOL v14 = v12;
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            *(void *)v43 = 0;
            *(void *)v43 = [v14 unsignedLongLongValue];
            uint64_t v15 = [MEMORY[0x263EFF8F8] dataWithBytes:v43 length:8];
            uint64_t v16 = 8;
LABEL_14:

            id v36 = v15;
            AlgDataPacket::AlgDataPacket((uint64_t)v43, v7, v9, v11, 1, 1, [v36 bytes], v16, 0, 0);
            AlgDataInjector::add((AlgDataInjector *)v40, (const AlgDataPacket *)v43);
            uint64_t v18 = [(NSMutableData *)self->_outputBuffer length] - 1;
            uint64_t v38 = v18;
            uint64_t v19 = [(NSMutableData *)self->_outputBuffer mutableBytes];
            uint64_t v20 = [v5 objectForKeyedSubscript:@"IsExternalNode"];
            int v21 = [v20 BOOLValue];

            if (v21)
            {
              StreamingWriter::StreamingWriter((uint64_t)buf, (uint64_t)v19 + 1, v18, 0);
              int v17 = StreamingWriter::writeInjext((StreamingWriter *)buf, 0, (AlgDataInjector *)v40, 0, 0, 0);
              if (v17)
              {
                [(SASInterfaceTouchButtonHost *)self callConfigurationCallback:v42 + 1];
              }
              else
              {
                uint64_t v24 = SALoggingGeneral();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                {
                  __os_log_helper_16_0_0(v37);
                  _os_log_error_impl(&dword_25BF2A000, v24, OS_LOG_TYPE_ERROR, "[SASInterfaceTouchButtonHost] failed to write injext data", v37, 2u);
                }
              }
            }
            else
            {
              int v17 = (*(uint64_t (**)(void *, uint8_t *, unsigned char *, uint64_t, uint64_t *))(*(void *)self->_device
                                                                                              + 32))(self->_device, v40, v39, (uint64_t)v19 + 1, &v38);
              [(SASInterfaceTouchButtonHost *)self callStreamCallback:v38];
            }
            uint64_t v25 = SALoggingGeneral();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              if (v17) {
                int v26 = "OK";
              }
              else {
                int v26 = "Error";
              }
              __os_log_helper_16_2_6_8_64_4_0_8_0_8_0_8_64_8_32((uint64_t)buf, (uint64_t)v4, v21, v7, v9, (uint64_t)v13, (uint64_t)v26);
              _os_log_impl(&dword_25BF2A000, v25, OS_LOG_TYPE_DEFAULT, "[SASInterfaceTouchButtonHost] InjectProperty: %@, External: %d, (%llu,%llu)=%@ result %s", buf, 0x3Au);
            }

            AlgDataPacket::~AlgDataPacket((AlgDataPacket *)v43);
          }
          else
          {

LABEL_28:
            LOBYTE(v17) = 0;
            unint64_t v13 = v14;
          }
          break;
        default:
          uint64_t v22 = SALoggingGeneral();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            __os_log_helper_16_0_1_4_0(v43, v11);
            _os_log_error_impl(&dword_25BF2A000, v22, OS_LOG_TYPE_ERROR, "[SASInterfaceTouchButtonHost] InjectProperty: cannot handle type 0x%x", v43, 8u);
          }

          goto LABEL_8;
      }
    }
    else
    {
      LOBYTE(v17) = 1;
    }
  }
  else
  {
    unint64_t v13 = SALoggingGeneral();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v43, (uint64_t)v4);
      _os_log_error_impl(&dword_25BF2A000, v13, OS_LOG_TYPE_ERROR, "[SASInterfaceTouchButtonHost] InjectProperty: %@ key config not found", v43, 0xCu);
    }
LABEL_8:
    LOBYTE(v17) = 0;
  }

  PacketCollection::~PacketCollection((PacketCollection *)v39);
  PacketCollection::~PacketCollection((PacketCollection *)v40);

  return v17;
}

- (id)extractAlgsState:(id)a3
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_propertyDatabase objectForKeyedSubscript:v4];
  AlgDataInjector::AlgDataInjector((uint64_t)&v63, 0, 1);
  AlgDataExtractor::AlgDataExtractor((uint64_t)&v51, 1, 1);
  if (v5)
  {
    unint64_t v6 = [v5 objectForKeyedSubscript:@"IsExternalNode"];
    int v7 = [v6 BOOLValue];

    if (v7)
    {
      long long v8 = [v5 objectForKeyedSubscript:@"Value"];
    }
    else
    {
      unint64_t v10 = [v5 objectForKeyedSubscript:@"WorkNodeId"];
      uint64_t v11 = [v10 unsignedLongLongValue];

      int v12 = [v5 objectForKeyedSubscript:@"DataNodeId"];
      uint64_t v13 = [v12 unsignedLongLongValue];

      BOOL v14 = [v5 objectForKeyedSubscript:@"Type"];
      int v15 = [v14 unsignedShortValue];

      AlgDataPacket::AlgDataPacket((uint64_t)v74, v11, v13, v15, 2, 2, 0, 0, 0, 0);
      AlgDataExtractor::add((AlgDataExtractor *)&v51, (const AlgDataPacket *)v74);
      uint64_t v50 = 0;
      uint64_t v16 = (*(uint64_t (**)(void *, uint64_t *, uint64_t *, void, uint64_t *))(*(void *)self->_device + 32))(self->_device, &v63, &v51, 0, &v50);
      if (v16)
      {
        switch(v15)
        {
          case 20480:
            uint64_t v20 = objc_msgSend(NSNumber, "numberWithBool:", **(unsigned __int8 **)(OUTLINED_FUNCTION_11(v16, v17, v18, v19) + 56));
            break;
          case 20483:
            uint64_t v20 = objc_msgSend(NSNumber, "numberWithChar:", **(char **)(OUTLINED_FUNCTION_11(v16, v17, v18, v19) + 56));
            break;
          case 20486:
            uint64_t v20 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", **(unsigned int **)(OUTLINED_FUNCTION_11(v16, v17, v18, v19) + 56));
            break;
          case 20488:
            uint64_t v20 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", **(void **)(OUTLINED_FUNCTION_11(v16, v17, v18, v19) + 56));
            break;
          default:
            int v21 = SALoggingGeneral();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              __os_log_helper_16_0_1_4_0(buf, v15);
              _os_log_error_impl(&dword_25BF2A000, v21, OS_LOG_TYPE_ERROR, "[SASInterfaceTouchButtonHost] ExtractProperty: cannot handle type 0x%x", buf, 8u);
            }
            goto LABEL_16;
        }
        long long v8 = (void *)v20;
        int v21 = SALoggingGeneral();
        BOOL v34 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
        if (v34)
        {
          uint64_t v42 = OUTLINED_FUNCTION_10(v34, v35, v36, v37, v38, v39, v40, v41, v47, v48, v49, v50, v51, v52, v53, v54, v55, v56, v57,
                  v58,
                  v59,
                  v60,
                  v61,
                  v62,
                  v63,
                  v64,
                  v65,
                  v66,
                  v67,
                  v68,
                  v69,
                  v70,
                  v71,
                  v72,
                  buf[0]);
          __os_log_helper_16_2_4_8_64_8_0_8_0_8_64((uint64_t)v42, v43, v44, v45, (uint64_t)v8);
          _os_log_impl(&dword_25BF2A000, v21, OS_LOG_TYPE_INFO, "[SASInterfaceTouchButtonHost] ExtractProperty: %@, (%llu,%llu)=%@", buf, 0x2Au);
        }
      }
      else
      {
        int v21 = SALoggingGeneral();
        BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
        if (v22)
        {
          uint64_t v30 = OUTLINED_FUNCTION_10(v22, v23, v24, v25, v26, v27, v28, v29, v47, v48, v49, v50, v51, v52, v53, v54, v55, v56, v57,
                  v58,
                  v59,
                  v60,
                  v61,
                  v62,
                  v63,
                  v64,
                  v65,
                  v66,
                  v67,
                  v68,
                  v69,
                  v70,
                  v71,
                  v72,
                  buf[0]);
          __os_log_helper_16_2_3_8_64_8_0_8_0((uint64_t)v30, v31, v32, v33);
          _os_log_impl(&dword_25BF2A000, v21, OS_LOG_TYPE_INFO, "[SASInterfaceTouchButtonHost] ExtractProperty: %@, (%llu,%llu) extraction failed", buf, 0x20u);
        }
LABEL_16:
        long long v8 = 0;
      }

      AlgDataPacket::~AlgDataPacket((AlgDataPacket *)v74);
    }
  }
  else
  {
    uint64_t v9 = SALoggingGeneral();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v74, (uint64_t)v4);
      _os_log_error_impl(&dword_25BF2A000, v9, OS_LOG_TYPE_ERROR, "[SASInterfaceTouchButtonHost] ExtractProperty: %@ key config not found", v74, 0xCu);
    }

    long long v8 = 0;
  }
  PacketCollection::~PacketCollection((PacketCollection *)&v51);
  PacketCollection::~PacketCollection((PacketCollection *)&v63);

  return v8;
}

- (void)addVersion:(id)a3
{
  id v4 = a3;
  [(NSMutableArray *)self->_versions addObject:v4];
  device = (AlgsDevice *)self->_device;
  id v6 = v4;
  AlgsDevice::addVersion(device, (const char *)[v6 UTF8String]);
}

- (void)setActive:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (self->_active != a3)
  {
    BOOL v3 = a3;
    self->_active = a3;
    if (a3) {
      [(SASInterfaceTouchButtonHost *)self injectProperty:@"ActiveMode" value:MEMORY[0x263EFFA88]];
    }
    else {
      [(SASInterfaceTouchButtonHost *)self cleanup];
    }
    id v4 = SALoggingGeneral();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      __os_log_helper_16_0_1_4_0(v5, v3);
      _os_log_impl(&dword_25BF2A000, v4, OS_LOG_TYPE_INFO, "[SASInterfaceTouchButtonHost] active state switched to: %d", v5, 8u);
    }
  }
}

- (void)sendNovaCAEvents:(const NovaCoreAnalytics *)a3
{
  v56[2] = *MEMORY[0x263EF8340];
  if (a3)
  {
    coreAnalyticsCallback = (void (**)(id, __CFString *, void *))self->_coreAnalyticsCallback;
    if (coreAnalyticsCallback)
    {
      if (a3->var1)
      {
        v55[0] = @"PrimaryFreqResidency";
        *(float *)&double v3 = a3->var7;
        int v7 = [NSNumber numberWithFloat:v3];
        v55[1] = @"NoiseLevel";
        v56[0] = v7;
        *(float *)&double v8 = a3->var8;
        uint64_t v9 = [NSNumber numberWithFloat:v8];
        v56[1] = v9;
        unint64_t v10 = [NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:2];
        coreAnalyticsCallback[2](coreAnalyticsCallback, @"com.apple.TouchSensitiveButton.FreqResidencyNoiseLevel", v10);

        uint64_t v11 = SALoggingGeneral();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_0_0(&v48);
          OUTLINED_FUNCTION_3(&dword_25BF2A000, v12, v13, "[SASInterfaceTouchButtonHost] CA FreqResidencyNoiseLevel event emitted", v14, v15, v16, v17, v48);
        }
      }
      if (a3->var2)
      {
        id v18 = self->_coreAnalyticsCallback;
        uint64_t v53 = @"Full_Scale";
        *(float *)&double v3 = a3->var9;
        uint64_t v19 = [NSNumber numberWithFloat:v3];
        uint64_t v54 = v19;
        [NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
        objc_claimAutoreleasedReturnValue();
        OUTLINED_FUNCTION_6();
        v20(v18, @"com.apple.TouchSensitiveButton.FS_Estimate", coreAnalyticsCallback);

        int v21 = SALoggingGeneral();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_0_0(&v48);
          OUTLINED_FUNCTION_3(&dword_25BF2A000, v22, v23, "[SASInterfaceTouchButtonHost] CA FS_Estimate event emitted", v24, v25, v26, v27, v48);
        }
      }
      if (a3->var3)
      {
        id v28 = self->_coreAnalyticsCallback;
        uint64_t v51 = @"fingerPosition";
        *(float *)&double v3 = a3->var10;
        uint64_t v29 = [NSNumber numberWithFloat:v3];
        uint64_t v52 = v29;
        [NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];
        objc_claimAutoreleasedReturnValue();
        OUTLINED_FUNCTION_6();
        v30(v28, @"com.apple.TouchSensitiveButton.HalfPressPressed", coreAnalyticsCallback);

        uint64_t v31 = SALoggingGeneral();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_0_0(&v48);
          OUTLINED_FUNCTION_3(&dword_25BF2A000, v32, v33, "[SASInterfaceTouchButtonHost] CA HalfPressPressed event emitted", v34, v35, v36, v37, v48);
        }
      }
      if (a3->var4)
      {
        uint64_t v38 = (void (**)(id, __CFString *, void *))self->_coreAnalyticsCallback;
        uint64_t v49 = @"EntryGestureType";
        uint64_t v39 = [NSNumber numberWithUnsignedChar:a3->var5];
        uint64_t v50 = v39;
        uint64_t v40 = [NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1];
        v38[2](v38, @"com.apple.TouchSensitiveButton.EntryGestureType", v40);

        uint64_t v41 = SALoggingGeneral();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_0_0(&v48);
          OUTLINED_FUNCTION_2(&dword_25BF2A000, v42, v43, "[SASInterfaceTouchButtonHost] CA EntryGestureType event emitted", v44, v45, v46, v47, v48);
        }
      }
    }
  }
}

- (void)sendNovaHostCAEvents:(const NovaHostCoreAnalytics *)a3
{
  v31[1] = *MEMORY[0x263EF8340];
  if (a3)
  {
    id coreAnalyticsCallback = self->_coreAnalyticsCallback;
    if (coreAnalyticsCallback)
    {
      if (a3->var2)
      {
        uint64_t v30 = @"EntryGestureType";
        double v8 = [NSNumber numberWithUnsignedChar:a3->var3];
        v31[0] = v8;
        [NSDictionary dictionaryWithObjects:v31 forKeys:&v30 count:1];
        objc_claimAutoreleasedReturnValue();
        OUTLINED_FUNCTION_6();
        v9(coreAnalyticsCallback, @"com.apple.TouchSensitiveButton.EntryGestureType");

        unint64_t v10 = SALoggingGeneral();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_0_0(&v27);
          OUTLINED_FUNCTION_2(&dword_25BF2A000, v11, v12, "[SASInterfaceTouchButtonHost] CA EntryGestureType event emitted", v13, v14, v15, v16, v27);
        }
      }
      if (a3->var1)
      {
        uint64_t v17 = (void (**)(id, __CFString *, void *))self->_coreAnalyticsCallback;
        id v28 = @"fingerPosition";
        *(float *)&double v4 = a3->var4;
        id v18 = [NSNumber numberWithFloat:v4];
        uint64_t v29 = v18;
        uint64_t v19 = [NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
        v17[2](v17, @"com.apple.TouchSensitiveButton.tactSwitchPressed", v19);

        uint64_t v20 = SALoggingGeneral();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_0_0(&v27);
          OUTLINED_FUNCTION_2(&dword_25BF2A000, v21, v22, "[SASInterfaceTouchButtonHost] CA TactSwitchPressed event emitted", v23, v24, v25, v26, v27);
        }
      }
    }
  }
}

- (id)streamCallback
{
  return self->_streamCallback;
}

- (void)setStreamCallback:(id)a3
{
}

- (id)eventCallback
{
  return self->_eventCallback;
}

- (void)setEventCallback:(id)a3
{
}

- (id)resetRequestCallback
{
  return self->_resetRequestCallback;
}

- (void)setResetRequestCallback:(id)a3
{
}

- (id)coreAnalyticsCallback
{
  return self->_coreAnalyticsCallback;
}

- (void)setCoreAnalyticsCallback:(id)a3
{
}

- (id)configurationCallback
{
  return self->_configurationCallback;
}

- (void)setConfigurationCallback:(id)a3
{
}

- (NSMutableData)outputBuffer
{
  return self->_outputBuffer;
}

- (void)setOutputBuffer:(id)a3
{
}

- (NSMutableData)inputBuffer
{
  return self->_inputBuffer;
}

- (void)setInputBuffer:(id)a3
{
}

- (mach_timebase_info)timebase
{
  return self->_timebase;
}

- (void)setTimebase:(mach_timebase_info)a3
{
  self->_timebase = a3;
}

- (void)device
{
  return self->_device;
}

- (void)setDevice:(void *)a3
{
  self->_device = a3;
}

- (unsigned)usagePage
{
  return self->_usagePage;
}

- (void)setUsagePage:(unsigned __int16)a3
{
  self->_usagePage = a3;
}

- (unsigned)usage
{
  return self->_usage;
}

- (void)setUsage:(unsigned __int16)a3
{
  self->_usage = a3;
}

- (unsigned)planId
{
  return self->_planId;
}

- (void)setPlanId:(unsigned __int8)a3
{
  self->_planId = a3;
}

- (NSMutableArray)versions
{
  return self->_versions;
}

- (void)setVersions:(id)a3
{
}

- (unsigned)lastFrameId
{
  return self->_lastFrameId;
}

- (void)setLastFrameId:(unsigned int)a3
{
  self->_unsigned int lastFrameId = a3;
}

- (const)touchSensitiveButtonEventsDescriptor
{
  return self->_touchSensitiveButtonEventsDescriptor;
}

- (void)setTouchSensitiveButtonEventsDescriptor:(const _SADynamicArrayDescriptor *)a3
{
  self->_touchSensitiveButtonEventsDescriptor = a3;
}

- (const)forceStageEventsDescriptor
{
  return self->_forceStageEventsDescriptor;
}

- (void)setForceStageEventsDescriptor:(const _SADynamicArrayDescriptor *)a3
{
  self->_forceStageEventsDescriptor = a3;
}

- (const)touchSensitiveButtonEvents
{
  return self->_touchSensitiveButtonEvents;
}

- (void)setTouchSensitiveButtonEvents:(const TouchSensitiveButtonEventPacket *)a3
{
  self->_touchSensitiveButtonEvents = a3;
}

- (const)forceStageEvents
{
  return self->_forceStageEvents;
}

- (void)setForceStageEvents:(const ForceStageEventPacket *)a3
{
  self->_forceStageEvents = a3;
}

- (NSArray)forceStages
{
  return self->_forceStages;
}

- (NSMutableDictionary)propertyDatabase
{
  return self->_propertyDatabase;
}

- (void)setPropertyDatabase:(id)a3
{
}

- (BOOL)active
{
  return self->_active;
}

- (BOOL)caseAttached
{
  return self->_caseAttached;
}

- (void)setCaseAttached:(BOOL)a3
{
  self->_caseAttached = a3;
}

- (BOOL)touchSensitiveButtonEventsEnabled
{
  return self->_touchSensitiveButtonEventsEnabled;
}

- (void)setTouchSensitiveButtonEventsEnabled:(BOOL)a3
{
  self->_touchSensitiveButtonEventsEnabled = a3;
}

- (SACaseConnectionInfoProvider)caseConnectionInfoProvider
{
  return self->_caseConnectionInfoProvider;
}

- (void)setCaseConnectionInfoProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_caseConnectionInfoProvider, 0);
  objc_storeStrong((id *)&self->_propertyDatabase, 0);
  objc_storeStrong((id *)&self->_forceStages, 0);
  objc_storeStrong((id *)&self->_versions, 0);
  objc_storeStrong((id *)&self->_inputBuffer, 0);
  objc_storeStrong((id *)&self->_outputBuffer, 0);
  objc_storeStrong(&self->_configurationCallback, 0);
  objc_storeStrong(&self->_coreAnalyticsCallback, 0);
  objc_storeStrong(&self->_resetRequestCallback, 0);
  objc_storeStrong(&self->_eventCallback, 0);
  objc_storeStrong(&self->_streamCallback, 0);
}

- (uint64_t)configureCallbacks
{
  return [*(id *)a1 sendNovaHostCAEvents:*(void *)(a1 + 56)];
}

@end