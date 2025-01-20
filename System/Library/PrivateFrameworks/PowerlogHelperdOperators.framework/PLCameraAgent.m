@interface PLCameraAgent
+ (BOOL)isBackFacingCamera:(int)a3;
+ (BOOL)isFrontFacingCamera:(int)a3;
+ (id)defaults;
+ (id)distributionFromCameraType:(int)a3;
+ (id)entryEventBackwardDefinitions;
+ (id)entryEventForwardDefinitionCamera;
+ (id)entryEventForwardDefinitionTorch;
+ (id)entryEventForwardDefinitions;
+ (id)entryEventIntervalDefinitionSmartCamDetection;
+ (id)entryEventIntervalDefinitions;
+ (id)entryEventNoneDefinitions;
+ (id)entryEventPointDefinitions;
+ (int)checkCameraType:(int)a3;
+ (void)load;
- (BOOL)allCamerasAreOff;
- (BOOL)backCameraIsOn;
- (BOOL)frontCameraIsOn;
- (NSDictionary)torchPowerModel;
- (NSMutableDictionary)backgroundBlurState;
- (NSMutableDictionary)cameraState;
- (PLCameraAgent)init;
- (PLNSNotificationOperatorComposition)thermalMonitorListener;
- (PLXPCListenerOperatorComposition)cameraNotification;
- (PLXPCListenerOperatorComposition)smartCamDetectionNotification;
- (PLXPCListenerOperatorComposition)torchNotification;
- (double)getCameraPower:(int)a3;
- (void)closeBackCameraAtDate:(id)a3;
- (void)closeFrontCameraAtDate:(id)a3;
- (void)closeOpenCameraEventsAtDate:(id)a3 withEntryKey:(id)a4;
- (void)handleCameraEvent:(id)a3 withEntryKey:(id)a4;
- (void)handleTorchEvent:(id)a3 withEntryKey:(id)a4;
- (void)initOperatorDependancies;
- (void)logEventIntervalSmartCamDetection:(id)a3;
- (void)modelBackCameraPowerWithEntry:(id)a3;
- (void)modelFrontCameraPowerWithEntry:(id)a3;
- (void)modelTorchPowerWithEntry:(id)a3;
- (void)setBackCameraIsOn:(BOOL)a3;
- (void)setBackgroundBlurState:(id)a3;
- (void)setCameraState:(id)a3;
- (void)setFrontCameraIsOn:(BOOL)a3;
- (void)setThermalMonitorListener:(id)a3;
@end

@implementation PLCameraAgent

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLCameraAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)defaults
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventPointDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventForwardDefinitions
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"Camera";
  objc_super v2 = +[PLCameraAgent entryEventForwardDefinitionCamera];
  v6[1] = @"Torch";
  v7[0] = v2;
  v3 = +[PLCameraAgent entryEventForwardDefinitionTorch];
  v7[1] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

+ (id)entryEventForwardDefinitionCamera
{
  v55[3] = *MEMORY[0x1E4F143B8];
  v54[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v52[0] = *MEMORY[0x1E4F92CD0];
  v52[1] = v2;
  v53[0] = &unk_1F4011A68;
  v53[1] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = *MEMORY[0x1E4F92C60];
  v52[2] = *MEMORY[0x1E4F92C08];
  v52[3] = v3;
  v53[2] = MEMORY[0x1E4F1CC38];
  v53[3] = MEMORY[0x1E4F1CC38];
  v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:4];
  v55[0] = v45;
  v54[1] = *MEMORY[0x1E4F92CA8];
  v50[0] = @"State";
  v44 = [MEMORY[0x1E4F929D8] sharedInstance];
  v43 = objc_msgSend(v44, "commonTypeDict_BoolFormat");
  v51[0] = v43;
  v50[1] = @"BundleId";
  v42 = [MEMORY[0x1E4F929D8] sharedInstance];
  v41 = objc_msgSend(v42, "commonTypeDict_StringFormat_withBundleID");
  v51[1] = v41;
  v50[2] = @"PixelFormatIsTenBit";
  v40 = [MEMORY[0x1E4F929D8] sharedInstance];
  v39 = objc_msgSend(v40, "commonTypeDict_BoolFormat");
  v51[2] = v39;
  v50[3] = @"MaximumSupportedFrameRate";
  v38 = [MEMORY[0x1E4F929D8] sharedInstance];
  v37 = objc_msgSend(v38, "commonTypeDict_RealFormat");
  v51[3] = v37;
  v50[4] = @"SecondaryInterFrameReferenceEnabled";
  v36 = [MEMORY[0x1E4F929D8] sharedInstance];
  v35 = objc_msgSend(v36, "commonTypeDict_BoolFormat");
  v51[4] = v35;
  v50[5] = @"SensorWidth";
  v34 = [MEMORY[0x1E4F929D8] sharedInstance];
  v33 = objc_msgSend(v34, "commonTypeDict_IntegerFormat");
  v51[5] = v33;
  v50[6] = @"SensorHeight";
  v32 = [MEMORY[0x1E4F929D8] sharedInstance];
  v31 = objc_msgSend(v32, "commonTypeDict_IntegerFormat");
  v51[6] = v31;
  v50[7] = @"VideoCaptureWidth";
  v30 = [MEMORY[0x1E4F929D8] sharedInstance];
  v29 = objc_msgSend(v30, "commonTypeDict_IntegerFormat");
  v51[7] = v29;
  v50[8] = @"VideoCaptureHeight";
  v28 = [MEMORY[0x1E4F929D8] sharedInstance];
  v27 = objc_msgSend(v28, "commonTypeDict_IntegerFormat");
  v51[8] = v27;
  v50[9] = @"BackgroundBlurEnabled";
  v26 = [MEMORY[0x1E4F929D8] sharedInstance];
  v25 = objc_msgSend(v26, "commonTypeDict_BoolFormat");
  v51[9] = v25;
  v50[10] = @"DeferredCount";
  v24 = [MEMORY[0x1E4F929D8] sharedInstance];
  v23 = objc_msgSend(v24, "commonTypeDict_IntegerFormat");
  v51[10] = v23;
  v50[11] = @"CameraType";
  v22 = [MEMORY[0x1E4F929D8] sharedInstance];
  v21 = objc_msgSend(v22, "commonTypeDict_IntegerFormat");
  v51[11] = v21;
  v50[12] = @"ContinuityCameraType";
  v20 = [MEMORY[0x1E4F929D8] sharedInstance];
  v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
  v51[12] = v19;
  v50[13] = @"IsWired";
  v18 = [MEMORY[0x1E4F929D8] sharedInstance];
  v17 = objc_msgSend(v18, "commonTypeDict_BoolFormat");
  v51[13] = v17;
  v50[14] = @"AverageFramerate";
  v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  v15 = objc_msgSend(v16, "commonTypeDict_RealFormat");
  v51[14] = v15;
  v50[15] = @"CenterStageEnabled";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_BoolFormat");
  v51[15] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:16];
  v55[1] = v6;
  v54[2] = *MEMORY[0x1E4F92C68];
  v48[0] = @"key";
  v46 = @"CaptureCount";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_StringFormat");
  v47 = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
  v48[1] = @"value";
  v49[0] = v9;
  v10 = [MEMORY[0x1E4F929D8] sharedInstance];
  v11 = objc_msgSend(v10, "commonTypeDict_IntegerFormat");
  v49[1] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:2];
  v55[2] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:3];

  return v13;
}

+ (id)entryEventForwardDefinitionTorch
{
  v20[2] = *MEMORY[0x1E4F143B8];
  v19[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v17[0] = *MEMORY[0x1E4F92CD0];
  v17[1] = v2;
  v18[0] = &unk_1F4011A78;
  v18[1] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = *MEMORY[0x1E4F92C08];
  v18[2] = MEMORY[0x1E4F1CC38];
  uint64_t v4 = *MEMORY[0x1E4F92C58];
  v17[2] = v3;
  v17[3] = v4;
  v16[0] = @"BundleId";
  v16[1] = @"Level";
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  v18[3] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];
  v20[0] = v6;
  v19[1] = *MEMORY[0x1E4F92CA8];
  v14[0] = @"Level";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_BoolFormat");
  v14[1] = @"BundleId";
  v15[0] = v8;
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  v10 = objc_msgSend(v9, "commonTypeDict_StringFormat_withBundleID");
  v15[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
  v20[1] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];

  return v12;
}

+ (id)entryEventBackwardDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventIntervalDefinitions
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"SmartCamDetection";
  uint64_t v2 = +[PLCameraAgent entryEventIntervalDefinitionSmartCamDetection];
  v6[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)entryEventIntervalDefinitionSmartCamDetection
{
  v25[2] = *MEMORY[0x1E4F143B8];
  v24[0] = *MEMORY[0x1E4F92C50];
  uint64_t v22 = *MEMORY[0x1E4F92CD0];
  v23 = &unk_1F4011A88;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  v25[0] = v19;
  v24[1] = *MEMORY[0x1E4F92CA8];
  v20[0] = @"timestampEnd";
  v18 = [MEMORY[0x1E4F929D8] sharedInstance];
  v17 = objc_msgSend(v18, "commonTypeDict_DateFormat");
  v21[0] = v17;
  v20[1] = @"GateID";
  v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
  v21[1] = v15;
  v20[2] = @"NumTrackedRegions";
  v14 = [MEMORY[0x1E4F929D8] sharedInstance];
  v13 = objc_msgSend(v14, "commonTypeDict_IntegerFormat");
  v21[2] = v13;
  void v20[3] = @"NumBoxesPresented";
  uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v21[3] = v3;
  v20[4] = @"NumFrames";
  uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v21[4] = v5;
  v20[5] = @"NumEmptyFrames";
  v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v21[5] = v7;
  v20[6] = @"NumClosingFrames";
  v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v21[6] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:7];
  v25[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];

  return v11;
}

+ (id)entryEventNoneDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (PLCameraAgent)init
{
  if (([MEMORY[0x1E4F92A38] isHomePod] & 1) != 0
    || +[PLUtilities isPowerlogHelperd])
  {
    uint64_t v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PLCameraAgent;
    self = [(PLAgent *)&v5 init];
    uint64_t v3 = self;
  }

  return v3;
}

- (void)initOperatorDependancies
{
  v44[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[PLUtilities torchTypeString];
  if (v3)
  {
    uint64_t v4 = +[PLUtilities powerModelForOperatorName:@"Torch"];
    objc_super v5 = [v4 objectForKeyedSubscript:v3];
    torchPowerModel = self->_torchPowerModel;
    self->_torchPowerModel = v5;
  }
  v35 = (void *)v3;
  self->_frontCameraIsOn = 0;
  self->_backCameraIsOn = 0;
  v7 = objc_opt_new();
  [(PLCameraAgent *)self setCameraState:v7];

  v8 = objc_opt_new();
  [(PLCameraAgent *)self setBackgroundBlurState:v8];

  uint64_t v9 = *MEMORY[0x1E4F92D30];
  v10 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"Camera"];
  v11 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  [(PLCameraAgent *)self closeOpenCameraEventsAtDate:v11 withEntryKey:v10];

  v12 = +[PLOperator entryKeyForType:v9 andName:@"Torch"];
  v13 = [(PLOperator *)self storage];
  v14 = [v13 lastEntryForKey:v12];

  if (v14)
  {
    v15 = objc_msgSend(v14, "objectForKeyedSubscript:", @"Level", v35);
    [v15 doubleValue];
    double v17 = v16;

    if (v17 > 0.0)
    {
      v18 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v12];
      [v18 setObject:&unk_1F400BF20 forKeyedSubscript:@"Level"];
      v19 = [v14 objectForKeyedSubscript:@"BundleId"];
      [v18 setObject:v19 forKeyedSubscript:@"BundleId"];

      [(PLOperator *)self logEntry:v18];
      [(PLCameraAgent *)self modelTorchPowerWithEntry:v18];
    }
  }
  id v20 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v43[0] = @"clientID";
  v43[1] = @"event";
  v44[0] = &unk_1F400BF38;
  v44[1] = @"CameraStreaming";
  v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:2];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __41__PLCameraAgent_initOperatorDependancies__block_invoke;
  v39[3] = &unk_1E6E47718;
  v39[4] = self;
  id v40 = v10;
  id v22 = v10;
  v23 = (PLXPCListenerOperatorComposition *)[v20 initWithOperator:self withRegistration:v21 withBlock:v39];
  cameraNotification = self->_cameraNotification;
  self->_cameraNotification = v23;

  id v25 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __41__PLCameraAgent_initOperatorDependancies__block_invoke_166;
  v37[3] = &unk_1E6E47718;
  v37[4] = self;
  id v38 = v12;
  id v26 = v12;
  v27 = (PLXPCListenerOperatorComposition *)[v25 initWithOperator:self withRegistration:&unk_1F400E778 withBlock:v37];
  torchNotification = self->_torchNotification;
  self->_torchNotification = v27;

  id v29 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v41[0] = @"clientID";
  v41[1] = @"event";
  v42[0] = &unk_1F400BF38;
  v42[1] = @"SmartCamDetection";
  v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:2];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __41__PLCameraAgent_initOperatorDependancies__block_invoke_167;
  v36[3] = &unk_1E6E47740;
  v36[4] = self;
  v31 = (PLXPCListenerOperatorComposition *)[v29 initWithOperator:self withRegistration:v30 withBlock:v36];
  smartCamDetectionNotification = self->_smartCamDetectionNotification;
  self->_smartCamDetectionNotification = v31;

  v33 = (PLNSNotificationOperatorComposition *)[objc_alloc(MEMORY[0x1E4F92A28]) initWithOperator:self forNotification:@"PLThermalMonitorNotification" withBlock:&__block_literal_global_175];
  thermalMonitorListener = self->_thermalMonitorListener;
  self->_thermalMonitorListener = v33;
}

void __41__PLCameraAgent_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  v7 = PLLogCamera();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __41__PLCameraAgent_initOperatorDependancies__block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) handleCameraEvent:v6 withEntryKey:*(void *)(a1 + 40)];
}

void __41__PLCameraAgent_initOperatorDependancies__block_invoke_166(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  v7 = PLLogCamera();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __41__PLCameraAgent_initOperatorDependancies__block_invoke_166_cold_1();
  }

  [*(id *)(a1 + 32) handleTorchEvent:v6 withEntryKey:*(void *)(a1 + 40)];
}

void __41__PLCameraAgent_initOperatorDependancies__block_invoke_167(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  v7 = PLLogCamera();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __41__PLCameraAgent_initOperatorDependancies__block_invoke_167_cold_1();
  }

  [*(id *)(a1 + 32) logEventIntervalSmartCamDetection:v6];
}

void __41__PLCameraAgent_initOperatorDependancies__block_invoke_172(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = PLLogCamera();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __41__PLCameraAgent_initOperatorDependancies__block_invoke_172_cold_1();
  }
}

- (void)closeOpenCameraEventsAtDate:(id)a3 withEntryKey:(id)a4
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  id v6 = a4;
  v27 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v7 = 0;
  v8 = @"CameraType";
  uint64_t v9 = @"%@ = %d";
  unint64_t v10 = 0x1E4F29000uLL;
  unint64_t v11 = 0x1E4F1C000uLL;
  do
  {
    v30 = objc_msgSend(*(id *)(v10 + 24), "stringWithFormat:", v9, v8, v7);
    uint64_t v12 = objc_msgSend(*(id *)(v11 + 2424), "arrayWithObject:");
    v13 = [(PLOperator *)self storage];
    id v29 = (void *)v12;
    v14 = [v13 lastEntryForKey:v6 withFilters:v12];

    if (v14)
    {
      uint64_t v15 = [v14 objectForKeyedSubscript:@"State"];
      if (v15)
      {
        double v16 = (void *)v15;
        [v14 objectForKeyedSubscript:@"State"];
        unint64_t v17 = v10;
        v18 = self;
        id v19 = v6;
        id v20 = v9;
        id v22 = v21 = v8;
        int v23 = [v22 BOOLValue];

        v8 = v21;
        uint64_t v9 = v20;
        id v6 = v19;
        self = v18;
        unint64_t v10 = v17;
        unint64_t v11 = 0x1E4F1C000;

        if (v23)
        {
          v24 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v6 withDate:v28];
          [v24 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"State"];
          [v24 setObject:@"init" forKeyedSubscript:@"BundleId"];
          id v25 = [MEMORY[0x1E4F28ED0] numberWithInt:v7];
          [v24 setObject:v25 forKeyedSubscript:v8];

          [v27 addObject:v24];
          if (v7)
          {
            if (v7 == 2)
            {
              [(PLCameraAgent *)self closeFrontCameraAtDate:v28];
              [(PLCameraAgent *)self modelFrontCameraPowerWithEntry:v24];
            }
          }
          else
          {
            [(PLCameraAgent *)self closeBackCameraAtDate:v28];
            [(PLCameraAgent *)self modelBackCameraPowerWithEntry:v24];
          }
        }
      }
    }
    uint64_t v7 = (v7 + 1);
  }
  while (v7 != 8);
  if ([v27 count])
  {
    id v31 = v6;
    v32[0] = v27;
    id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
    [(PLOperator *)self logEntries:v26 withGroupID:v6];
  }
}

- (void)handleCameraEvent:(id)a3 withEntryKey:(id)a4
{
  uint64_t v133 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v103 = a4;
  if (!v6) {
    goto LABEL_68;
  }
  uint64_t v7 = [v6 objectForKeyedSubscript:@"Events"];

  if (!v7) {
    goto LABEL_68;
  }
  v102 = [MEMORY[0x1E4F1CA48] array];
  long long v119 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  id v100 = v6;
  v8 = [v6 objectForKeyedSubscript:@"Events"];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v119 objects:v132 count:16];
  if (!v9) {
    goto LABEL_65;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v120;
  v101 = self;
  v104 = v8;
  uint64_t v112 = *(void *)v120;
  do
  {
    uint64_t v12 = 0;
    uint64_t v108 = v10;
    do
    {
      if (*(void *)v120 != v11) {
        objc_enumerationMutation(v8);
      }
      v13 = *(void **)(*((void *)&v119 + 1) + 8 * v12);
      v14 = PLLogCamera();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v131 = v13;
        _os_log_debug_impl(&dword_1E4220000, v14, OS_LOG_TYPE_DEBUG, "Camera payload event: %@", buf, 0xCu);
      }

      if (v13)
      {
        uint64_t v15 = [v13 objectForKeyedSubscript:@"Timestamp"];
        if (v15)
        {
          double v16 = v15;
          uint64_t v17 = [v13 objectForKeyedSubscript:@"Streaming"];
          if (!v17) {
            goto LABEL_59;
          }
          v18 = (void *)v17;
          [v13 objectForKeyedSubscript:@"CameraType"];
          id v20 = v19 = v16;

          if (!v20) {
            goto LABEL_60;
          }
          v21 = [v13 objectForKeyedSubscript:@"CameraType"];
          uint64_t v22 = +[PLCameraAgent checkCameraType:](PLCameraAgent, "checkCameraType:", [v21 intValue]);

          if (v22 == -1)
          {
            double v16 = PLLogCamera();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
              [(PLCameraAgent *)v128 handleCameraEvent:&v129 withEntryKey:v16];
            }
            uint64_t v11 = v112;
            goto LABEL_59;
          }
          int v23 = [v13 objectForKeyedSubscript:@"Streaming"];
          uint64_t v24 = [v23 BOOLValue];

          if (v24)
          {
            id v25 = [v13 objectForKeyedSubscript:@"BackgroundBlurEnabled"];
            unsigned int v26 = [v25 BOOLValue];
          }
          else
          {
            unsigned int v26 = 0;
          }
          uint64_t v11 = v112;
          v27 = [v13 objectForKeyedSubscript:@"PID"];
          char v28 = v27 ? 0 : v24;

          if ((v28 & 1) == 0)
          {
            unsigned int v105 = v26;
            id v29 = self;
            v30 = [(PLCameraAgent *)self cameraState];
            uint64_t v31 = v24;
            unsigned int v109 = v22;
            v32 = [MEMORY[0x1E4F28ED0] numberWithInt:v22];
            v33 = [v30 objectForKeyedSubscript:v32];

            v111 = v33;
            unsigned int v110 = v24;
            if (v33 && v24 == [v33 BOOLValue])
            {
              if (v24)
              {
                uint64_t v34 = v10;
                self = v29;
                v35 = [(PLCameraAgent *)v29 backgroundBlurState];
                v36 = [MEMORY[0x1E4F28ED0] numberWithInt:v109];
                v37 = [v35 objectForKeyedSubscript:v36];

                if (!v37 || v105 != [v37 BOOLValue])
                {

                  uint64_t v11 = v112;
                  uint64_t v31 = v24;
                  goto LABEL_31;
                }
                v8 = v104;
                uint64_t v10 = v34;
                double v16 = v33;
                uint64_t v11 = v112;
LABEL_58:
              }
              else
              {
                v8 = v104;
                double v16 = v33;
                self = v29;
              }
LABEL_59:

              goto LABEL_60;
            }
LABEL_31:
            id v38 = [MEMORY[0x1E4F28ED0] numberWithBool:v31];
            self = v29;
            v39 = [(PLCameraAgent *)v29 cameraState];
            unsigned int v40 = v109;
            v41 = [MEMORY[0x1E4F28ED0] numberWithInt:v109];
            [v39 setObject:v38 forKeyedSubscript:v41];

            v37 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v103];
            v107 = [v13 objectForKeyedSubscript:@"Timestamp"];
            v42 = [v107 convertFromSystemToMonotonic];
            [v37 setEntryDate:v42];

            uint64_t v43 = [v13 objectForKeyedSubscript:@"ApplicationID"];
            v106 = (void *)v43;
            if (v43)
            {
              [v37 setObject:v43 forKeyedSubscript:@"BundleId"];
            }
            else
            {
              v44 = PLLogCamera();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
                -[PLCameraAgent handleCameraEvent:withEntryKey:](&v117, v118, v44);
              }

              v45 = [v13 objectForKeyedSubscript:@"PID"];
              uint64_t v46 = [v45 intValue];

              v47 = +[PLUtilities bundleIDFromPid:v46];
              [v37 setObject:v47 forKeyedSubscript:@"BundleId"];
            }
            v48 = [MEMORY[0x1E4F28ED0] numberWithBool:v24];
            [v37 setObject:v48 forKeyedSubscript:@"State"];

            v49 = [MEMORY[0x1E4F28ED0] numberWithInt:v109];
            [v37 setObject:v49 forKeyedSubscript:@"CameraType"];

            v50 = (void *)MEMORY[0x1E4F28ED0];
            if (v24)
            {
              v51 = [v13 objectForKeyedSubscript:@"PixelFormatIsTenBit"];
              v52 = objc_msgSend(v50, "numberWithBool:", objc_msgSend(v51, "BOOLValue"));
              [v37 setObject:v52 forKeyedSubscript:@"PixelFormatIsTenBit"];

              v53 = (void *)MEMORY[0x1E4F28ED0];
              v54 = [v13 objectForKeyedSubscript:@"MaximumSupportedFrameRate"];
              [v54 doubleValue];
              v55 = objc_msgSend(v53, "numberWithDouble:");
              [v37 setObject:v55 forKeyedSubscript:@"MaximumSupportedFrameRate"];

              v56 = (void *)MEMORY[0x1E4F28ED0];
              v57 = [v13 objectForKeyedSubscript:@"SecondaryInterFrameReferenceEnabled"];
              v58 = objc_msgSend(v56, "numberWithBool:", objc_msgSend(v57, "BOOLValue"));
              [v37 setObject:v58 forKeyedSubscript:@"SecondaryInterFrameReferenceEnabled"];

              v59 = (void *)MEMORY[0x1E4F28ED0];
              v60 = [v13 objectForKeyedSubscript:@"SensorWidth"];
              v61 = objc_msgSend(v59, "numberWithInteger:", objc_msgSend(v60, "integerValue"));
              [v37 setObject:v61 forKeyedSubscript:@"SensorWidth"];

              v62 = (void *)MEMORY[0x1E4F28ED0];
              v63 = [v13 objectForKeyedSubscript:@"SensorHeight"];
              v64 = objc_msgSend(v62, "numberWithInteger:", objc_msgSend(v63, "integerValue"));
              [v37 setObject:v64 forKeyedSubscript:@"SensorHeight"];

              v65 = (void *)MEMORY[0x1E4F28ED0];
              v66 = [v13 objectForKeyedSubscript:@"VideoCaptureWidth"];
              v67 = objc_msgSend(v65, "numberWithInteger:", objc_msgSend(v66, "integerValue"));
              [v37 setObject:v67 forKeyedSubscript:@"VideoCaptureWidth"];

              v68 = (void *)MEMORY[0x1E4F28ED0];
              v69 = [v13 objectForKeyedSubscript:@"VideoCaptureHeight"];
              v70 = objc_msgSend(v68, "numberWithInteger:", objc_msgSend(v69, "integerValue"));
              [v37 setObject:v70 forKeyedSubscript:@"VideoCaptureHeight"];

              v71 = [MEMORY[0x1E4F28ED0] numberWithBool:v105];
              [v37 setObject:v71 forKeyedSubscript:@"BackgroundBlurEnabled"];

              v72 = [MEMORY[0x1E4F28ED0] numberWithBool:v105];
              v73 = [(PLCameraAgent *)v29 backgroundBlurState];
              v74 = [MEMORY[0x1E4F28ED0] numberWithInt:v109];
              [v73 setObject:v72 forKeyedSubscript:v74];

              v75 = (void *)MEMORY[0x1E4F28ED0];
              v76 = [v13 objectForKeyedSubscript:@"ContinuityCameraIsWired"];
              v77 = objc_msgSend(v75, "numberWithBool:", objc_msgSend(v76, "BOOLValue"));
              [v37 setObject:v77 forKeyedSubscript:@"IsWired"];

              v78 = (void *)MEMORY[0x1E4F28ED0];
              v79 = [v13 objectForKeyedSubscript:@"CenterStageEnabled"];
              v80 = objc_msgSend(v78, "numberWithBool:", -[NSObject BOOLValue](v79, "BOOLValue"));
              [v37 setObject:v80 forKeyedSubscript:@"CenterStageEnabled"];

              uint64_t v10 = v108;
              goto LABEL_51;
            }
            v81 = [v13 objectForKeyedSubscript:@"AverageFramerate"];
            [v81 doubleValue];
            v82 = objc_msgSend(v50, "numberWithDouble:");
            [v37 setObject:v82 forKeyedSubscript:@"AverageFramerate"];

            v83 = [v13 objectForKeyedSubscript:@"StillImageDeferredProcessingCount"];

            uint64_t v10 = v108;
            if (v83)
            {
              v84 = [v13 objectForKeyedSubscript:@"StillImageDeferredProcessingCount"];
              [v37 setObject:v84 forKeyedSubscript:@"DeferredCount"];
            }
            v85 = [v13 objectForKeyedSubscript:@"StillImageCaptureCounts"];

            if (v85)
            {
              long long v115 = 0u;
              long long v116 = 0u;
              long long v113 = 0u;
              long long v114 = 0u;
              v86 = [v13 objectForKeyedSubscript:@"StillImageCaptureCounts"];
              uint64_t v87 = [v86 countByEnumeratingWithState:&v113 objects:v127 count:16];
              if (v87)
              {
                uint64_t v88 = v87;
                uint64_t v89 = *(void *)v114;
                do
                {
                  for (uint64_t i = 0; i != v88; ++i)
                  {
                    if (*(void *)v114 != v89) {
                      objc_enumerationMutation(v86);
                    }
                    uint64_t v91 = *(void *)(*((void *)&v113 + 1) + 8 * i);
                    v125 = @"CaptureCount";
                    uint64_t v126 = v91;
                    v92 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v126 forKeys:&v125 count:1];
                    v93 = [v13 objectForKeyedSubscript:@"StillImageCaptureCounts"];
                    v94 = [v93 objectForKeyedSubscript:v91];
                    [v37 setObject:v94 forKeyedSubscript:v92];
                  }
                  uint64_t v88 = [v86 countByEnumeratingWithState:&v113 objects:v127 count:16];
                }
                while (v88);
              }

              v79 = PLLogCamera();
              if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v131 = v37;
                _os_log_debug_impl(&dword_1E4220000, v79, OS_LOG_TYPE_DEBUG, "dynamic table entry: %@", buf, 0xCu);
              }
              self = v101;
              uint64_t v10 = v108;
              uint64_t v11 = v112;
              unsigned int v40 = v109;
LABEL_51:
            }
            v95 = (void *)MEMORY[0x1E4F28ED0];
            v96 = [v13 objectForKeyedSubscript:@"ContinuityCameraType"];
            v97 = objc_msgSend(v95, "numberWithInteger:", objc_msgSend(v96, "integerValue"));
            [v37 setObject:v97 forKeyedSubscript:@"ContinuityCameraType"];

            v8 = v104;
            double v16 = v111;
            if (v40 <= 6)
            {
              if (((1 << v40) & 0x33) != 0)
              {
                [(PLCameraAgent *)self setBackCameraIsOn:v110];
                [(PLCameraAgent *)self modelBackCameraPowerWithEntry:v37];
              }
              else if (((1 << v40) & 0x44) != 0)
              {
                [(PLCameraAgent *)self setFrontCameraIsOn:v110];
                [(PLCameraAgent *)self modelFrontCameraPowerWithEntry:v37];
              }
            }
            [v102 addObject:v37];

            goto LABEL_58;
          }
        }
      }
LABEL_60:
      ++v12;
    }
    while (v12 != v10);
    uint64_t v98 = [v8 countByEnumeratingWithState:&v119 objects:v132 count:16];
    uint64_t v10 = v98;
  }
  while (v98);
LABEL_65:

  if ([v102 count])
  {
    id v123 = v103;
    v124 = v102;
    v99 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v124 forKeys:&v123 count:1];
    [(PLOperator *)self logEntries:v99 withGroupID:v103];
  }
  id v6 = v100;
LABEL_68:
}

- (void)handleTorchEvent:(id)a3 withEntryKey:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (objc_class *)MEMORY[0x1E4F929D0];
  id v8 = a4;
  uint64_t v9 = (void *)[[v7 alloc] initWithEntryKey:v8 withRawData:v6];

  uint64_t v10 = [v6 objectForKeyedSubscript:@"ApplicationID"];
  if (v10)
  {
    [v9 setObject:v10 forKeyedSubscript:@"BundleId"];
  }
  else
  {
    uint64_t v11 = PLLogCamera();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[PLCameraAgent handleTorchEvent:withEntryKey:](v11);
    }

    uint64_t v12 = [v6 objectForKeyedSubscript:@"PID"];
    v13 = +[PLUtilities bundleIDFromPid:](PLUtilities, "bundleIDFromPid:", [v12 intValue]);
    [v9 setObject:v13 forKeyedSubscript:@"BundleId"];
  }
  uint64_t v14 = [v6 objectForKeyedSubscript:@"State"];
  if (v14)
  {
    uint64_t v15 = (void *)v14;
    double v16 = [v6 objectForKeyedSubscript:@"Level"];

    if (!v16)
    {
      uint64_t v17 = [v6 objectForKeyedSubscript:@"State"];
      [v9 setObject:v17 forKeyedSubscript:@"Level"];
    }
  }
  [(PLOperator *)self logEntry:v9];
  [(PLCameraAgent *)self modelTorchPowerWithEntry:v9];
}

- (void)logEventIntervalSmartCamDetection:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D38];
  id v5 = a3;
  id v13 = +[PLOperator entryKeyForType:v4 andName:@"SmartCamDetection"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v13 withRawData:v5];
  uint64_t v7 = [v5 objectForKeyedSubscript:@"timestamp"];
  id v8 = [v7 convertFromSystemToMonotonic];
  [v6 setEntryDate:v8];

  uint64_t v9 = [v5 objectForKeyedSubscript:@"timestampEnd"];

  uint64_t v10 = [v9 convertFromSystemToMonotonic];
  [v6 setObject:v10 forKeyedSubscript:@"timestampEnd"];

  uint64_t v11 = [v6 objectForKeyedSubscript:@"timestampEnd"];

  if (!v11)
  {
    uint64_t v12 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    [v6 setObject:v12 forKeyedSubscript:@"timestampEnd"];
  }
  [(PLOperator *)self logEntry:v6];
}

- (void)closeFrontCameraAtDate:(id)a3
{
  id v5 = a3;
  if ([(PLCameraAgent *)self frontCameraIsOn])
  {
    uint64_t v4 = [MEMORY[0x1E4F92900] sharedInstance];
    [v4 createPowerEventForwardWithRootNodeID:17 withPower:v5 withStartDate:0.0];

    [(PLCameraAgent *)self setFrontCameraIsOn:0];
  }
}

- (void)closeBackCameraAtDate:(id)a3
{
  id v5 = a3;
  if ([(PLCameraAgent *)self backCameraIsOn])
  {
    uint64_t v4 = [MEMORY[0x1E4F92900] sharedInstance];
    [v4 createPowerEventForwardWithRootNodeID:18 withPower:v5 withStartDate:0.0];

    [(PLCameraAgent *)self setBackCameraIsOn:0];
  }
}

- (double)getCameraPower:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v4 = +[PLUtilities powerModelForOperatorName:@"camera"];
  id v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(MEMORY[0x1E4F92A38], "kPLCameraClassOfDevice"));
  id v6 = [v5 stringValue];

  uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%i", v3);
  id v8 = [v4 allKeys];
  char v9 = [v8 containsString:v6];

  if (v9)
  {
    uint64_t v10 = [v4 objectForKeyedSubscript:v6];
    uint64_t v11 = [v10 objectForKeyedSubscript:v7];
    [v11 doubleValue];
    double v13 = v12;
  }
  else
  {
    uint64_t v14 = PLLogCamera();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[PLCameraAgent getCameraPower:]();
    }

    double v13 = 0.0;
  }

  return v13;
}

- (void)modelFrontCameraPowerWithEntry:(id)a3
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = 0.0;
  if ([(PLCameraAgent *)self frontCameraIsOn])
  {
    [(PLCameraAgent *)self getCameraPower:2];
    double v5 = v6;
    uint64_t v7 = PLLogCamera();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[PLCameraAgent modelFrontCameraPowerWithEntry:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  uint64_t v15 = [MEMORY[0x1E4F92900] sharedInstance];
  double v16 = [v4 entryDate];
  [v15 createPowerEventForwardWithRootNodeID:17 withPower:v16 withStartDate:v5];

  if ([(PLCameraAgent *)self frontCameraIsOn])
  {
    uint64_t v17 = [v4 objectForKeyedSubscript:@"BundleId"];
    v18 = (void *)v17;
    id v19 = @"com.apple.deadcanary";
    if (v17) {
      id v19 = (__CFString *)v17;
    }
    id v20 = v19;

    if ([(__CFString *)v20 isEqualToString:@"com.apple.avconferenced"])
    {

      id v20 = @"avconferenced";
    }
    char v28 = v20;
    v29[0] = &unk_1F4011A88;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
    uint64_t v22 = [MEMORY[0x1E4F92900] sharedInstance];
    int v23 = [v4 entryDate];
    [v22 createDistributionEventForwardWithDistributionID:13 withChildNodeNameToWeight:v21 withStartDate:v23];

    uint64_t v24 = [MEMORY[0x1E4F92900] sharedInstance];
    id v25 = [v4 entryDate];
    [v24 createDistributionEventForwardWithDistributionID:43 withChildNodeNameToWeight:v21 withStartDate:v25];
  }
  else
  {
    if (![(PLCameraAgent *)self allCamerasAreOff])
    {
      v21 = (void *)MEMORY[0x1E4F1CC08];
      goto LABEL_15;
    }
    unsigned int v26 = [MEMORY[0x1E4F92900] sharedInstance];
    v27 = [v4 entryDate];
    v21 = (void *)MEMORY[0x1E4F1CC08];
    [v26 createDistributionEventForwardWithDistributionID:13 withChildNodeNameToWeight:MEMORY[0x1E4F1CC08] withStartDate:v27];

    id v20 = [MEMORY[0x1E4F92900] sharedInstance];
    uint64_t v24 = [v4 entryDate];
    [(__CFString *)v20 createDistributionEventForwardWithDistributionID:43 withChildNodeNameToWeight:v21 withStartDate:v24];
  }

LABEL_15:
}

- (void)modelBackCameraPowerWithEntry:(id)a3
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = 0.0;
  if ([(PLCameraAgent *)self backCameraIsOn])
  {
    [(PLCameraAgent *)self getCameraPower:0];
    double v5 = v6;
    uint64_t v7 = PLLogCamera();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[PLCameraAgent modelBackCameraPowerWithEntry:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  uint64_t v15 = [MEMORY[0x1E4F92900] sharedInstance];
  double v16 = [v4 entryDate];
  [v15 createPowerEventForwardWithRootNodeID:18 withPower:v16 withStartDate:v5];

  if ([(PLCameraAgent *)self backCameraIsOn])
  {
    uint64_t v17 = [v4 objectForKeyedSubscript:@"BundleId"];
    v18 = (void *)v17;
    id v19 = @"com.apple.deadcanary";
    if (v17) {
      id v19 = (__CFString *)v17;
    }
    id v20 = v19;

    if ([(__CFString *)v20 isEqualToString:@"com.apple.avconferenced"])
    {

      id v20 = @"avconferenced";
    }
    char v28 = v20;
    v29[0] = &unk_1F4011A88;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
    uint64_t v22 = [MEMORY[0x1E4F92900] sharedInstance];
    int v23 = [v4 entryDate];
    [v22 createDistributionEventForwardWithDistributionID:13 withChildNodeNameToWeight:v21 withStartDate:v23];

    uint64_t v24 = [MEMORY[0x1E4F92900] sharedInstance];
    id v25 = [v4 entryDate];
    [v24 createDistributionEventForwardWithDistributionID:43 withChildNodeNameToWeight:v21 withStartDate:v25];
  }
  else
  {
    if (![(PLCameraAgent *)self allCamerasAreOff])
    {
      v21 = (void *)MEMORY[0x1E4F1CC08];
      goto LABEL_15;
    }
    unsigned int v26 = [MEMORY[0x1E4F92900] sharedInstance];
    v27 = [v4 entryDate];
    v21 = (void *)MEMORY[0x1E4F1CC08];
    [v26 createDistributionEventForwardWithDistributionID:13 withChildNodeNameToWeight:MEMORY[0x1E4F1CC08] withStartDate:v27];

    id v20 = [MEMORY[0x1E4F92900] sharedInstance];
    uint64_t v24 = [v4 entryDate];
    [(__CFString *)v20 createDistributionEventForwardWithDistributionID:43 withChildNodeNameToWeight:v21 withStartDate:v24];
  }

LABEL_15:
}

- (void)modelTorchPowerWithEntry:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [v4 objectForKeyedSubscript:@"Level"];
  [v5 doubleValue];
  double v7 = v6;

  uint64_t v8 = [(PLCameraAgent *)self torchPowerModel];
  +[PLUtilities scaledPowerBasedOnPoint:v8 withPowerModel:v7];
  double v10 = v9;

  uint64_t v11 = [MEMORY[0x1E4F92900] sharedInstance];
  uint64_t v12 = [v4 entryDate];
  [v11 createPowerEventForwardWithRootNodeID:19 withPower:v12 withStartDate:v10];

  uint64_t v13 = [v4 objectForKeyedSubscript:@"BundleId"];
  uint64_t v14 = v13;
  uint64_t v15 = @"Flashlight";
  if (v13
    && [(__CFString *)v13 rangeOfString:@"com.apple.springboard"] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v15 = v14;
  }
  double v16 = v15;

  if (v7 == 0.0)
  {
    uint64_t v17 = (void *)MEMORY[0x1E4F1CC08];
  }
  else
  {
    uint64_t v22 = v16;
    v23[0] = &unk_1F4011A88;
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
  }
  v18 = [MEMORY[0x1E4F92900] sharedInstance];
  id v19 = [v4 entryDate];
  [v18 createDistributionEventForwardWithDistributionID:16 withChildNodeNameToWeight:v17 withStartDate:v19];

  id v20 = [MEMORY[0x1E4F92900] sharedInstance];
  v21 = [v4 entryDate];
  [v20 createDistributionEventForwardWithDistributionID:13 withChildNodeNameToWeight:v17 withStartDate:v21];
}

- (BOOL)allCamerasAreOff
{
  if ([(PLCameraAgent *)self frontCameraIsOn]) {
    return 0;
  }
  else {
    return ![(PLCameraAgent *)self backCameraIsOn];
  }
}

+ (id)distributionFromCameraType:(int)a3
{
  unsigned int v3 = +[PLCameraAgent checkCameraType:*(void *)&a3];
  if (v3 > 7) {
    return 0;
  }
  else {
    return off_1E6E47780[v3];
  }
}

+ (BOOL)isFrontFacingCamera:(int)a3
{
  return a3 == 2;
}

+ (BOOL)isBackFacingCamera:(int)a3
{
  return a3 == 0;
}

+ (int)checkCameraType:(int)a3
{
  int v3 = a3;
  if (a3 >= 8)
  {
    id v4 = PLLogCamera();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[PLCameraAgent checkCameraType:](v3, v4);
    }

    return -1;
  }
  return v3;
}

- (NSMutableDictionary)cameraState
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCameraState:(id)a3
{
}

- (PLXPCListenerOperatorComposition)cameraNotification
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (PLXPCListenerOperatorComposition)torchNotification
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (PLXPCListenerOperatorComposition)smartCamDetectionNotification
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (PLNSNotificationOperatorComposition)thermalMonitorListener
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setThermalMonitorListener:(id)a3
{
}

- (BOOL)frontCameraIsOn
{
  return self->_frontCameraIsOn;
}

- (void)setFrontCameraIsOn:(BOOL)a3
{
  self->_frontCameraIsOn = a3;
}

- (BOOL)backCameraIsOn
{
  return self->_backCameraIsOn;
}

- (void)setBackCameraIsOn:(BOOL)a3
{
  self->_backCameraIsOn = a3;
}

- (NSMutableDictionary)backgroundBlurState
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setBackgroundBlurState:(id)a3
{
}

- (NSDictionary)torchPowerModel
{
  return (NSDictionary *)objc_getProperty(self, a2, 104, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_torchPowerModel, 0);
  objc_storeStrong((id *)&self->_backgroundBlurState, 0);
  objc_storeStrong((id *)&self->_thermalMonitorListener, 0);
  objc_storeStrong((id *)&self->_smartCamDetectionNotification, 0);
  objc_storeStrong((id *)&self->_torchNotification, 0);
  objc_storeStrong((id *)&self->_cameraNotification, 0);
  objc_storeStrong((id *)&self->_cameraState, 0);
}

void __41__PLCameraAgent_initOperatorDependancies__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Camera payload: %@", v2, v3, v4, v5, v6);
}

void __41__PLCameraAgent_initOperatorDependancies__block_invoke_166_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Torch payload: %@", v2, v3, v4, v5, v6);
}

void __41__PLCameraAgent_initOperatorDependancies__block_invoke_167_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "SmartCamDetection payload: %@", v2, v3, v4, v5, v6);
}

void __41__PLCameraAgent_initOperatorDependancies__block_invoke_172_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Notification from ThermalMonitor: %@", v2, v3, v4, v5, v6);
}

- (void)handleCameraEvent:(void *)a3 withEntryKey:(NSObject *)a4 .cold.1(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  double v7 = [a2 objectForKeyedSubscript:@"CameraType"];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_1E4220000, a4, OS_LOG_TYPE_ERROR, "Unknown camera type: %@", a1, 0xCu);
}

- (void)handleCameraEvent:(os_log_t)log withEntryKey:.cold.2(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_1E4220000, log, OS_LOG_TYPE_DEBUG, "Using pid to lookup bundleID", buf, 2u);
}

- (void)handleTorchEvent:(os_log_t)log withEntryKey:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_1E4220000, log, OS_LOG_TYPE_DEBUG, "Using pid to lookup bundleID", v1, 2u);
}

- (void)getCameraPower:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1E4220000, v0, OS_LOG_TYPE_ERROR, "No camera power model exists for camera class: %@", v1, 0xCu);
}

- (void)modelFrontCameraPowerWithEntry:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)modelBackCameraPowerWithEntry:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)checkCameraType:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1E4220000, a2, OS_LOG_TYPE_ERROR, "PLCameraAgent checkCameraType undefined camera type: %d", (uint8_t *)v2, 8u);
}

@end