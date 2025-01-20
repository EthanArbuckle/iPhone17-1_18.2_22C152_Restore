@interface PLAccessibilityAgent
+ (id)entryAggregateDefinitions;
+ (id)entryEventBackwardDefinitions;
+ (id)entryEventForwardDefinitions;
+ (id)entryEventForwardNameAssistiveTouch;
+ (id)entryEventForwardNameBackTap;
+ (id)entryEventForwardNameBackgroundContrast;
+ (id)entryEventForwardNameFacetimeCaptioning;
+ (id)entryEventForwardNameHandGestures;
+ (id)entryEventForwardNameReduceMotion;
+ (id)entryEventForwardNameSoundRecognition;
+ (id)entryEventForwardNameSpeakScreen;
+ (id)entryEventForwardNameSpeakSelection;
+ (id)entryEventForwardNameSystemCaptioning;
+ (id)entryEventForwardNameVoiceControl;
+ (id)entryEventIntervalDefinitions;
+ (id)entryEventNoneDefinitions;
+ (id)entryEventPointDefinitions;
+ (void)load;
- (PLAccessibilityAgent)init;
- (PLCFNotificationOperatorComposition)notificationBackTapChanged;
- (PLCFNotificationOperatorComposition)notificationBackgroundContrastChanged;
- (PLCFNotificationOperatorComposition)notificationEyeTrackingChanged;
- (PLCFNotificationOperatorComposition)notificationFacetimeCaptioningChanged;
- (PLCFNotificationOperatorComposition)notificationMotionCuesStart;
- (PLCFNotificationOperatorComposition)notificationMotionCuesStop;
- (PLCFNotificationOperatorComposition)notificationReduceMotionChanged;
- (PLCFNotificationOperatorComposition)notificationSoundRecognitionDisabled;
- (PLCFNotificationOperatorComposition)notificationSoundRecognitionReady;
- (PLCFNotificationOperatorComposition)notificationSoundRecognitionRunning;
- (PLCFNotificationOperatorComposition)notificationSpeakScreenChanged;
- (PLCFNotificationOperatorComposition)notificationSpeakSelectionChanged;
- (PLCFNotificationOperatorComposition)notificationSystemCaptioningChanged;
- (PLCFNotificationOperatorComposition)notificationVoiceControlChanged;
- (PLCFNotificationOperatorComposition)notificationZoomChanged;
- (void)initOperatorDependancies;
- (void)initTaskOperatorDependancies;
- (void)log;
- (void)logEventForwardBackTap;
- (void)logEventForwardBackgroundContrast;
- (void)logEventForwardEyeTracking;
- (void)logEventForwardFacetimeCaptioning;
- (void)logEventForwardMotionCues:(BOOL)a3;
- (void)logEventForwardReduceMotion;
- (void)logEventForwardSoundRecognition:(int)a3;
- (void)logEventForwardSpeakScreen;
- (void)logEventForwardSpeakSelection;
- (void)logEventForwardSystemCaptioning;
- (void)logEventForwardVoiceControl;
- (void)logEventForwardZoom;
@end

@implementation PLAccessibilityAgent

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLAccessibilityAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventPointDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventForwardDefinitions
{
  v17[11] = *MEMORY[0x1E4F143B8];
  v16[0] = @"ReduceMotion";
  v15 = [a1 entryEventForwardNameReduceMotion];
  v17[0] = v15;
  v16[1] = @"BackgroundContrast";
  v14 = [a1 entryEventForwardNameBackgroundContrast];
  v17[1] = v14;
  v16[2] = @"AssistiveTouch";
  v3 = [a1 entryEventForwardNameAssistiveTouch];
  v17[2] = v3;
  v16[3] = @"HandGestures";
  v4 = [a1 entryEventForwardNameHandGestures];
  v17[3] = v4;
  v16[4] = @"VoiceControl";
  v5 = [a1 entryEventForwardNameVoiceControl];
  v17[4] = v5;
  v16[5] = @"BackTap";
  v6 = [a1 entryEventForwardNameBackTap];
  v17[5] = v6;
  v16[6] = @"SoundRecognition";
  v7 = [a1 entryEventForwardNameSoundRecognition];
  v17[6] = v7;
  v16[7] = @"SpeakSelection";
  v8 = [a1 entryEventForwardNameSpeakSelection];
  v17[7] = v8;
  v16[8] = @"SpeakScreen";
  v9 = [a1 entryEventForwardNameSpeakScreen];
  v17[8] = v9;
  v16[9] = @"SystemCaptioning";
  v10 = [a1 entryEventForwardNameSystemCaptioning];
  v17[9] = v10;
  v16[10] = @"FacetimeCaptioning";
  v11 = [a1 entryEventForwardNameFacetimeCaptioning];
  v17[10] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:11];

  return v12;
}

+ (id)entryEventForwardNameReduceMotion
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CE8];
  v11[0] = *MEMORY[0x1E4F92CD0];
  v11[1] = v2;
  v12[0] = &unk_1F29F0B70;
  v12[1] = MEMORY[0x1E4F1CC38];
  v11[2] = *MEMORY[0x1E4F92C70];
  v12[2] = MEMORY[0x1E4F1CC38];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E4F92CA8];
  v9 = @"ReduceMotionEnabled";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_BoolFormat");
  v10 = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v14[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v7;
}

+ (id)entryEventForwardNameBackgroundContrast
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CE8];
  v11[0] = *MEMORY[0x1E4F92CD0];
  v11[1] = v2;
  v12[0] = &unk_1F29F0B70;
  v12[1] = MEMORY[0x1E4F1CC38];
  v11[2] = *MEMORY[0x1E4F92C70];
  v12[2] = MEMORY[0x1E4F1CC38];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E4F92CA8];
  v9 = @"BackgroundContrastEnabled";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_BoolFormat");
  v10 = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v14[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v7;
}

+ (id)entryEventForwardNameVoiceControl
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C70];
  v11[0] = *MEMORY[0x1E4F92CD0];
  v11[1] = v2;
  v12[0] = &unk_1F29F0B80;
  v12[1] = MEMORY[0x1E4F1CC38];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E4F92CA8];
  v9 = @"VoiceControlEnabled";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_BoolFormat");
  v10 = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v14[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v7;
}

+ (id)entryEventForwardNameBackTap
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C70];
  v11[0] = *MEMORY[0x1E4F92CD0];
  v11[1] = v2;
  v12[0] = &unk_1F29F0B80;
  v12[1] = MEMORY[0x1E4F1CC38];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E4F92CA8];
  v9 = @"BackTapEnabled";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_BoolFormat");
  v10 = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v14[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v7;
}

+ (id)entryEventForwardNameSoundRecognition
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C70];
  v11[0] = *MEMORY[0x1E4F92CD0];
  v11[1] = v2;
  v12[0] = &unk_1F29F0B90;
  v12[1] = MEMORY[0x1E4F1CC38];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E4F92CA8];
  v9 = @"SoundRecognitionEnabled";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  v10 = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v14[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v7;
}

+ (id)entryEventForwardNameSpeakSelection
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C70];
  v11[0] = *MEMORY[0x1E4F92CD0];
  v11[1] = v2;
  v12[0] = &unk_1F29F0B80;
  v12[1] = MEMORY[0x1E4F1CC38];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E4F92CA8];
  v9 = @"SpeakSelectionEnabled";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_BoolFormat");
  v10 = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v14[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v7;
}

+ (id)entryEventForwardNameSpeakScreen
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C70];
  v11[0] = *MEMORY[0x1E4F92CD0];
  v11[1] = v2;
  v12[0] = &unk_1F29F0B80;
  v12[1] = MEMORY[0x1E4F1CC38];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E4F92CA8];
  v9 = @"SpeakScreenEnabled";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_BoolFormat");
  v10 = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v14[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v7;
}

+ (id)entryEventForwardNameSystemCaptioning
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C70];
  v11[0] = *MEMORY[0x1E4F92CD0];
  v11[1] = v2;
  v12[0] = &unk_1F29F0B80;
  v12[1] = MEMORY[0x1E4F1CC38];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E4F92CA8];
  v9 = @"SystemCaptioningEnabled";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_BoolFormat");
  v10 = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v14[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v7;
}

+ (id)entryEventForwardNameFacetimeCaptioning
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C70];
  v11[0] = *MEMORY[0x1E4F92CD0];
  v11[1] = v2;
  v12[0] = &unk_1F29F0B70;
  v12[1] = MEMORY[0x1E4F1CC38];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E4F92CA8];
  v9 = @"FacetimeCaptioningEnabled";
  v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_BoolFormat");
  v10 = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v14[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v7;
}

+ (id)entryEventForwardNameAssistiveTouch
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventForwardNameHandGestures
{
  return (id)MEMORY[0x1E4F1CC08];
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

- (PLAccessibilityAgent)init
{
  v3.receiver = self;
  v3.super_class = (Class)PLAccessibilityAgent;
  return [(PLAgent *)&v3 init];
}

- (void)initOperatorDependancies
{
  id v3 = objc_alloc(MEMORY[0x1E4F929A0]);
  uint64_t v4 = *MEMORY[0x1E4FB9100];
  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = __48__PLAccessibilityAgent_initOperatorDependancies__block_invoke;
  v65[3] = &unk_1E692A0F0;
  v65[4] = self;
  v5 = (PLCFNotificationOperatorComposition *)[v3 initWithOperator:self forNotification:v4 requireState:0 withBlock:v65];
  notificationVoiceControlChanged = self->_notificationVoiceControlChanged;
  self->_notificationVoiceControlChanged = v5;

  id v7 = objc_alloc(MEMORY[0x1E4F929A0]);
  uint64_t v8 = *MEMORY[0x1E4FB90D0];
  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = __48__PLAccessibilityAgent_initOperatorDependancies__block_invoke_77;
  v64[3] = &unk_1E692A0F0;
  v64[4] = self;
  v9 = (PLCFNotificationOperatorComposition *)[v7 initWithOperator:self forNotification:v8 requireState:0 withBlock:v64];
  notificationBackTapChanged = self->_notificationBackTapChanged;
  self->_notificationBackTapChanged = v9;

  id v11 = objc_alloc(MEMORY[0x1E4F929A0]);
  uint64_t v12 = *MEMORY[0x1E4FB9220];
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __48__PLAccessibilityAgent_initOperatorDependancies__block_invoke_78;
  v63[3] = &unk_1E692A0F0;
  v63[4] = self;
  v13 = (PLCFNotificationOperatorComposition *)[v11 initWithOperator:self forNotification:v12 requireState:0 withBlock:v63];
  notificationEyeTrackingChanged = self->_notificationEyeTrackingChanged;
  self->_notificationEyeTrackingChanged = v13;

  id v15 = objc_alloc(MEMORY[0x1E4F929A0]);
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __48__PLAccessibilityAgent_initOperatorDependancies__block_invoke_82;
  v62[3] = &unk_1E692A0F0;
  v62[4] = self;
  v16 = (PLCFNotificationOperatorComposition *)[v15 initWithOperator:self forNotification:@"com.apple.accessibility.motion.cues.start" requireState:0 withBlock:v62];
  notificationMotionCuesStart = self->_notificationMotionCuesStart;
  self->_notificationMotionCuesStart = v16;

  id v18 = objc_alloc(MEMORY[0x1E4F929A0]);
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __48__PLAccessibilityAgent_initOperatorDependancies__block_invoke_86;
  v61[3] = &unk_1E692A0F0;
  v61[4] = self;
  v19 = (PLCFNotificationOperatorComposition *)[v18 initWithOperator:self forNotification:@"com.apple.accessibility.motion.cues.stop" requireState:0 withBlock:v61];
  notificationMotionCuesStop = self->_notificationMotionCuesStop;
  self->_notificationMotionCuesStop = v19;

  id v21 = objc_alloc(MEMORY[0x1E4F929A0]);
  uint64_t v22 = *MEMORY[0x1E4FB92E0];
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __48__PLAccessibilityAgent_initOperatorDependancies__block_invoke_87;
  v60[3] = &unk_1E692A0F0;
  v60[4] = self;
  v23 = (PLCFNotificationOperatorComposition *)[v21 initWithOperator:self forNotification:v22 requireState:0 withBlock:v60];
  notificationSoundRecognitionDisabled = self->_notificationSoundRecognitionDisabled;
  self->_notificationSoundRecognitionDisabled = v23;

  id v25 = objc_alloc(MEMORY[0x1E4F929A0]);
  uint64_t v26 = *MEMORY[0x1E4FB92D8];
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __48__PLAccessibilityAgent_initOperatorDependancies__block_invoke_88;
  v59[3] = &unk_1E692A0F0;
  v59[4] = self;
  v27 = (PLCFNotificationOperatorComposition *)[v25 initWithOperator:self forNotification:v26 requireState:0 withBlock:v59];
  notificationSoundRecognitionReady = self->_notificationSoundRecognitionReady;
  self->_notificationSoundRecognitionReady = v27;

  id v29 = objc_alloc(MEMORY[0x1E4F929A0]);
  uint64_t v30 = *MEMORY[0x1E4FB92E8];
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __48__PLAccessibilityAgent_initOperatorDependancies__block_invoke_89;
  v58[3] = &unk_1E692A0F0;
  v58[4] = self;
  v31 = (PLCFNotificationOperatorComposition *)[v29 initWithOperator:self forNotification:v30 requireState:0 withBlock:v58];
  notificationSoundRecognitionRunning = self->_notificationSoundRecognitionRunning;
  self->_notificationSoundRecognitionRunning = v31;

  id v33 = objc_alloc(MEMORY[0x1E4F929A0]);
  uint64_t v34 = *MEMORY[0x1E4FB9258];
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __48__PLAccessibilityAgent_initOperatorDependancies__block_invoke_90;
  v57[3] = &unk_1E692A0F0;
  v57[4] = self;
  v35 = (PLCFNotificationOperatorComposition *)[v33 initWithOperator:self forNotification:v34 requireState:0 withBlock:v57];
  notificationSpeakSelectionChanged = self->_notificationSpeakSelectionChanged;
  self->_notificationSpeakSelectionChanged = v35;

  id v37 = objc_alloc(MEMORY[0x1E4F929A0]);
  uint64_t v38 = *MEMORY[0x1E4FB92F8];
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __48__PLAccessibilityAgent_initOperatorDependancies__block_invoke_91;
  v56[3] = &unk_1E692A0F0;
  v56[4] = self;
  v39 = (PLCFNotificationOperatorComposition *)[v37 initWithOperator:self forNotification:v38 requireState:0 withBlock:v56];
  notificationSpeakScreenChanged = self->_notificationSpeakScreenChanged;
  self->_notificationSpeakScreenChanged = v39;

  id v41 = objc_alloc(MEMORY[0x1E4F929A0]);
  uint64_t v42 = *MEMORY[0x1E4FB91F8];
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __48__PLAccessibilityAgent_initOperatorDependancies__block_invoke_92;
  v55[3] = &unk_1E692A0F0;
  v55[4] = self;
  v43 = (PLCFNotificationOperatorComposition *)[v41 initWithOperator:self forNotification:v42 requireState:0 withBlock:v55];
  notificationSystemCaptioningChanged = self->_notificationSystemCaptioningChanged;
  self->_notificationSystemCaptioningChanged = v43;

  id v45 = objc_alloc(MEMORY[0x1E4F929A0]);
  uint64_t v46 = *MEMORY[0x1E4FB8FB8];
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __48__PLAccessibilityAgent_initOperatorDependancies__block_invoke_93;
  v54[3] = &unk_1E692A0F0;
  v54[4] = self;
  v47 = (PLCFNotificationOperatorComposition *)[v45 initWithOperator:self forNotification:v46 requireState:0 withBlock:v54];
  notificationFacetimeCaptioningChanged = self->_notificationFacetimeCaptioningChanged;
  self->_notificationFacetimeCaptioningChanged = v47;

  id v49 = objc_alloc(MEMORY[0x1E4F929A0]);
  uint64_t v50 = *MEMORY[0x1E4FB93B8];
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __48__PLAccessibilityAgent_initOperatorDependancies__block_invoke_94;
  v53[3] = &unk_1E692A0F0;
  v53[4] = self;
  v51 = (PLCFNotificationOperatorComposition *)[v49 initWithOperator:self forNotification:v50 requireState:0 withBlock:v53];
  notificationZoomChanged = self->_notificationZoomChanged;
  self->_notificationZoomChanged = v51;
}

void __48__PLAccessibilityAgent_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "Voice Control Changed: %@", (uint8_t *)&v6, 0xCu);
  }

  [*(id *)(a1 + 32) logEventForwardVoiceControl];
}

void __48__PLAccessibilityAgent_initOperatorDependancies__block_invoke_77(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "Back Tap changed: %@", (uint8_t *)&v6, 0xCu);
  }

  [*(id *)(a1 + 32) logEventForwardBackTap];
}

void __48__PLAccessibilityAgent_initOperatorDependancies__block_invoke_78(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "Eye Tracking changed: %@", (uint8_t *)&v6, 0xCu);
  }

  [*(id *)(a1 + 32) logEventForwardEyeTracking];
}

void __48__PLAccessibilityAgent_initOperatorDependancies__block_invoke_82(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "Motion Cues Started: %@", (uint8_t *)&v6, 0xCu);
  }

  [*(id *)(a1 + 32) logEventForwardMotionCues:1];
}

void __48__PLAccessibilityAgent_initOperatorDependancies__block_invoke_86(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "Motion Cues Stopped: %@", (uint8_t *)&v6, 0xCu);
  }

  [*(id *)(a1 + 32) logEventForwardMotionCues:0];
}

void __48__PLAccessibilityAgent_initOperatorDependancies__block_invoke_87(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "Sound Recognition is disabled: %@", (uint8_t *)&v6, 0xCu);
  }

  [*(id *)(a1 + 32) logEventForwardSoundRecognition:0];
}

void __48__PLAccessibilityAgent_initOperatorDependancies__block_invoke_88(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "Sound Recognition is ready: %@", (uint8_t *)&v6, 0xCu);
  }

  [*(id *)(a1 + 32) logEventForwardSoundRecognition:1];
}

void __48__PLAccessibilityAgent_initOperatorDependancies__block_invoke_89(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "Sound Recognition is running: %@", (uint8_t *)&v6, 0xCu);
  }

  [*(id *)(a1 + 32) logEventForwardSoundRecognition:2];
}

void __48__PLAccessibilityAgent_initOperatorDependancies__block_invoke_90(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "Speak Selection changed: %@", (uint8_t *)&v6, 0xCu);
  }

  [*(id *)(a1 + 32) logEventForwardSpeakSelection];
}

void __48__PLAccessibilityAgent_initOperatorDependancies__block_invoke_91(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "Speak Screen changed: %@", (uint8_t *)&v6, 0xCu);
  }

  [*(id *)(a1 + 32) logEventForwardSpeakScreen];
}

void __48__PLAccessibilityAgent_initOperatorDependancies__block_invoke_92(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "System Captioning changed: %@", (uint8_t *)&v6, 0xCu);
  }

  [*(id *)(a1 + 32) logEventForwardSystemCaptioning];
}

void __48__PLAccessibilityAgent_initOperatorDependancies__block_invoke_93(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "Facetime Captioning changed: %@", (uint8_t *)&v6, 0xCu);
  }

  [*(id *)(a1 + 32) logEventForwardFacetimeCaptioning];
}

void __48__PLAccessibilityAgent_initOperatorDependancies__block_invoke_94(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "Zoom changed: %@", (uint8_t *)&v6, 0xCu);
  }

  [*(id *)(a1 + 32) logEventForwardZoom];
}

- (void)initTaskOperatorDependancies
{
  id v3 = objc_alloc(MEMORY[0x1E4F929A0]);
  uint64_t v4 = *MEMORY[0x1E4FB9290];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __52__PLAccessibilityAgent_initTaskOperatorDependancies__block_invoke;
  void v12[3] = &unk_1E692A0F0;
  v12[4] = self;
  v5 = (PLCFNotificationOperatorComposition *)[v3 initWithOperator:self forNotification:v4 requireState:0 withBlock:v12];
  notificationReduceMotionChanged = self->_notificationReduceMotionChanged;
  self->_notificationReduceMotionChanged = v5;

  id v7 = objc_alloc(MEMORY[0x1E4F929A0]);
  uint64_t v8 = *MEMORY[0x1E4FB9118];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __52__PLAccessibilityAgent_initTaskOperatorDependancies__block_invoke_103;
  void v11[3] = &unk_1E692A0F0;
  v11[4] = self;
  v9 = (PLCFNotificationOperatorComposition *)[v7 initWithOperator:self forNotification:v8 requireState:0 withBlock:v11];
  notificationBackgroundContrastChanged = self->_notificationBackgroundContrastChanged;
  self->_notificationBackgroundContrastChanged = v9;
}

void __52__PLAccessibilityAgent_initTaskOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __52__PLAccessibilityAgent_initTaskOperatorDependancies__block_invoke_2;
    id v15 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v16 = v5;
    if (qword_1EBD58A58 != -1) {
      dispatch_once(&qword_1EBD58A58, &block);
    }
    if (_MergedGlobals_1_35)
    {
      int v6 = [NSString stringWithFormat:@"Reduce Motion changed: %@", v4, block, v13, v14, v15, v16];
      id v7 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLAccessibilityAgent.m"];
      v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLAccessibilityAgent initTaskOperatorDependancies]_block_invoke"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:360];

      id v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [*(id *)(a1 + 32) logEventForwardReduceMotion];
}

uint64_t __52__PLAccessibilityAgent_initTaskOperatorDependancies__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  _MergedGlobals_1_35 = result;
  return result;
}

void __52__PLAccessibilityAgent_initTaskOperatorDependancies__block_invoke_103(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __52__PLAccessibilityAgent_initTaskOperatorDependancies__block_invoke_2_104;
    id v15 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v16 = v5;
    if (qword_1EBD58A60 != -1) {
      dispatch_once(&qword_1EBD58A60, &block);
    }
    if (byte_1EBD58A51)
    {
      int v6 = [NSString stringWithFormat:@"Background Contrast changed: %@", v4, block, v13, v14, v15, v16];
      id v7 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLAccessibilityAgent.m"];
      v9 = [v8 lastPathComponent];
      v10 = [NSString stringWithUTF8String:"-[PLAccessibilityAgent initTaskOperatorDependancies]_block_invoke"];
      [v7 logMessage:v6 fromFile:v9 fromFunction:v10 fromLineNumber:364];

      id v11 = PLLogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v6;
        _os_log_debug_impl(&dword_1D2690000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }
  }
  [*(id *)(a1 + 32) logEventForwardBackgroundContrast];
}

uint64_t __52__PLAccessibilityAgent_initTaskOperatorDependancies__block_invoke_2_104(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58A51 = result;
  return result;
}

- (void)log
{
  [(PLAccessibilityAgent *)self logEventForwardVoiceControl];
  [(PLAccessibilityAgent *)self logEventForwardBackTap];
  [(PLAccessibilityAgent *)self logEventForwardEyeTracking];
  [(PLAccessibilityAgent *)self logEventForwardSoundRecognition:_AXSSoundDetectionRunning()];
  [(PLAccessibilityAgent *)self logEventForwardSpeakSelection];
  [(PLAccessibilityAgent *)self logEventForwardSpeakScreen];
  [(PLAccessibilityAgent *)self logEventForwardSystemCaptioning];
  [(PLAccessibilityAgent *)self logEventForwardFacetimeCaptioning];
  [(PLAccessibilityAgent *)self logEventForwardZoom];
  if (([MEMORY[0x1E4F929C0] taskMode] & 1) != 0
    || [MEMORY[0x1E4F929C0] fullMode])
  {
    [(PLAccessibilityAgent *)self logEventForwardReduceMotion];
    [(PLAccessibilityAgent *)self logEventForwardBackgroundContrast];
  }
}

- (void)logEventForwardReduceMotion
{
  id v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"ReduceMotion"];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v5];
  id v4 = [NSNumber numberWithUnsignedChar:_AXSReduceMotionEnabled()];
  [v3 setObject:v4 forKeyedSubscript:@"ReduceMotionEnabled"];

  [(PLOperator *)self logEntry:v3];
}

- (void)logEventForwardBackgroundContrast
{
  id v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"BackgroundContrast"];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v5];
  id v4 = [NSNumber numberWithUnsignedChar:_AXSEnhanceBackgroundContrastEnabled()];
  [v3 setObject:v4 forKeyedSubscript:@"BackgroundContrastEnabled"];

  [(PLOperator *)self logEntry:v3];
}

- (void)logEventForwardVoiceControl
{
  id v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"VoiceControl"];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v5];
  id v4 = [NSNumber numberWithUnsignedChar:_AXSCommandAndControlEnabled()];
  [v3 setObject:v4 forKeyedSubscript:@"VoiceControlEnabled"];

  [(PLOperator *)self logEntry:v3];
}

- (void)logEventForwardBackTap
{
  id v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"BackTap"];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v5];
  id v4 = [NSNumber numberWithUnsignedChar:_AXSBackTapEnabled()];
  [v3 setObject:v4 forKeyedSubscript:@"BackTapEnabled"];

  [(PLOperator *)self logEntry:v3];
}

- (void)logEventForwardEyeTracking
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = PLLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109120;
    int v9 = _AXSOnDeviceEyeTrackingEnabled();
    _os_log_debug_impl(&dword_1D2690000, v3, OS_LOG_TYPE_DEBUG, "Eye Tracking state: %d", buf, 8u);
  }

  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedChar:", _AXSOnDeviceEyeTrackingEnabled(), @"Enabled");
  id v7 = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v7 forKeys:&v6 count:1];

  [(PLOperator *)self logForSubsystem:@"AccessibilityMetrics" category:@"EyeTracking" data:v5];
}

- (void)logEventForwardMotionCues:(BOOL)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = @"Enabled";
  id v4 = [NSNumber numberWithBool:a3];
  v7[0] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

  [(PLOperator *)self logForSubsystem:@"AccessibilityMetrics" category:@"MotionCuesEnabled" data:v5];
}

- (void)logEventForwardSoundRecognition:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"SoundRecognition"];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v5];
  id v7 = [NSNumber numberWithInt:v3];
  [v6 setObject:v7 forKeyedSubscript:@"SoundRecognitionEnabled"];

  uint64_t v8 = PLLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v13[0] = 67109120;
    v13[1] = v3;
    _os_log_debug_impl(&dword_1D2690000, v8, OS_LOG_TYPE_DEBUG, "Logging Sound Recognition state: %d", (uint8_t *)v13, 8u);
  }

  if (!v3)
  {
    uint64_t v12 = PLLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v13[0]) = 0;
      _os_log_debug_impl(&dword_1D2690000, v12, OS_LOG_TYPE_DEBUG, "Logging Sound Recognition remove distribution event", (uint8_t *)v13, 2u);
    }

    uint64_t v10 = [MEMORY[0x1E4F92900] sharedInstance];
    id v11 = [v6 entryDate];
    [v10 createDistributionEventForwardWithDistributionID:51 withRemovingChildNodeName:@"SoundRecognition" withStartDate:v11];
    goto LABEL_11;
  }
  if (v3 == 2)
  {
    int v9 = PLLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v13[0]) = 0;
      _os_log_debug_impl(&dword_1D2690000, v9, OS_LOG_TYPE_DEBUG, "Logging Sound Recognition create distribution event", (uint8_t *)v13, 2u);
    }

    uint64_t v10 = [MEMORY[0x1E4F92900] sharedInstance];
    id v11 = [v6 entryDate];
    [v10 createDistributionEventForwardWithDistributionID:51 withAddingChildNodeName:@"SoundRecognition" withStartDate:v11];
LABEL_11:
  }
  [(PLOperator *)self logEntry:v6];
}

- (void)logEventForwardSpeakSelection
{
  id v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"SpeakSelection"];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v5];
  id v4 = [NSNumber numberWithUnsignedChar:_AXSQuickSpeakEnabled()];
  [v3 setObject:v4 forKeyedSubscript:@"SpeakSelectionEnabled"];

  [(PLOperator *)self logEntry:v3];
}

- (void)logEventForwardSpeakScreen
{
  id v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"SpeakScreen"];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v5];
  id v4 = [NSNumber numberWithUnsignedChar:_AXSSpeakThisEnabled()];
  [v3 setObject:v4 forKeyedSubscript:@"SpeakScreenEnabled"];

  [(PLOperator *)self logEntry:v3];
}

- (void)logEventForwardSystemCaptioning
{
  id v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"SystemCaptioning"];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v5];
  id v4 = [NSNumber numberWithUnsignedChar:_AXSLiveTranscriptionEnabled()];
  [v3 setObject:v4 forKeyedSubscript:@"SystemCaptioningEnabled"];

  [(PLOperator *)self logEntry:v3];
}

- (void)logEventForwardFacetimeCaptioning
{
  id v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"FacetimeCaptioning"];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v5];
  id v4 = [NSNumber numberWithUnsignedChar:_AXSFaceTimeCaptionsEnabled()];
  [v3 setObject:v4 forKeyedSubscript:@"FacetimeCaptioningEnabled"];

  [(PLOperator *)self logEntry:v3];
}

- (void)logEventForwardZoom
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v5 = @"Enabled";
  uint64_t v3 = [NSNumber numberWithUnsignedChar:_AXSZoomTouchEnabled()];
  v6[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  [(PLOperator *)self logForSubsystem:@"AccessibilityMetrics" category:@"ZoomEnabled" data:v4];
}

- (PLCFNotificationOperatorComposition)notificationReduceMotionChanged
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (PLCFNotificationOperatorComposition)notificationBackgroundContrastChanged
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (PLCFNotificationOperatorComposition)notificationBackTapChanged
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (PLCFNotificationOperatorComposition)notificationEyeTrackingChanged
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (PLCFNotificationOperatorComposition)notificationFacetimeCaptioningChanged
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (PLCFNotificationOperatorComposition)notificationMotionCuesStart
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (PLCFNotificationOperatorComposition)notificationMotionCuesStop
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 96, 1);
}

- (PLCFNotificationOperatorComposition)notificationSpeakSelectionChanged
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 104, 1);
}

- (PLCFNotificationOperatorComposition)notificationSpeakScreenChanged
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 112, 1);
}

- (PLCFNotificationOperatorComposition)notificationSoundRecognitionDisabled
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 120, 1);
}

- (PLCFNotificationOperatorComposition)notificationSoundRecognitionReady
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 128, 1);
}

- (PLCFNotificationOperatorComposition)notificationSoundRecognitionRunning
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 136, 1);
}

- (PLCFNotificationOperatorComposition)notificationSystemCaptioningChanged
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 144, 1);
}

- (PLCFNotificationOperatorComposition)notificationVoiceControlChanged
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 152, 1);
}

- (PLCFNotificationOperatorComposition)notificationZoomChanged
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 160, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationZoomChanged, 0);
  objc_storeStrong((id *)&self->_notificationVoiceControlChanged, 0);
  objc_storeStrong((id *)&self->_notificationSystemCaptioningChanged, 0);
  objc_storeStrong((id *)&self->_notificationSoundRecognitionRunning, 0);
  objc_storeStrong((id *)&self->_notificationSoundRecognitionReady, 0);
  objc_storeStrong((id *)&self->_notificationSoundRecognitionDisabled, 0);
  objc_storeStrong((id *)&self->_notificationSpeakScreenChanged, 0);
  objc_storeStrong((id *)&self->_notificationSpeakSelectionChanged, 0);
  objc_storeStrong((id *)&self->_notificationMotionCuesStop, 0);
  objc_storeStrong((id *)&self->_notificationMotionCuesStart, 0);
  objc_storeStrong((id *)&self->_notificationFacetimeCaptioningChanged, 0);
  objc_storeStrong((id *)&self->_notificationEyeTrackingChanged, 0);
  objc_storeStrong((id *)&self->_notificationBackTapChanged, 0);
  objc_storeStrong((id *)&self->_notificationBackgroundContrastChanged, 0);
  objc_storeStrong((id *)&self->_notificationReduceMotionChanged, 0);
}

@end