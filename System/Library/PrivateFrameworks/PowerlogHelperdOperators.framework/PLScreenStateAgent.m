@interface PLScreenStateAgent
+ (id)entryAggregateDefinitionForeground;
+ (id)entryAggregateDefinitionWidgetAdditionAnimation;
+ (id)entryAggregateDefinitionWidgetFlipAnimation;
+ (id)entryAggregateDefinitions;
+ (id)entryEventBackwardDefinitionAlwaysOnEnableState;
+ (id)entryEventBackwardDefinitionBacklightStateChange;
+ (id)entryEventBackwardDefinitionFlipbookStatistics;
+ (id)entryEventBackwardDefinitionIconDragging;
+ (id)entryEventBackwardDefinitions;
+ (id)entryEventForwardDefinitions;
+ (id)entryEventForwardScreenState;
+ (id)entryEventForwardWindowMode;
+ (id)entryEventNoneDefinitions;
+ (id)entryEventPointBacklightEvent;
+ (id)entryEventPointDefinitions;
+ (void)load;
- (BOOL)lastDisplayLayoutContainsLockScreen;
- (FBSDisplayLayout)lastDisplayLayout;
- (FBSDisplayLayoutMonitor)airPlayDisplayMonitor;
- (FBSDisplayLayoutMonitor)carPlayDisplayMonitor;
- (FBSDisplayLayoutMonitor)mainDisplayMonitor;
- (NSMutableDictionary)lastLayoutMonitorEntries;
- (NSMutableDictionary)lastScreenStateEntries;
- (PLEntryNotificationOperatorComposition)displayCallback;
- (PLScreenStateAgent)init;
- (PLXPCListenerOperatorComposition)iconDraggingListner;
- (PLXPCListenerOperatorComposition)springBoardAlwaysOnEnableStateListener;
- (PLXPCListenerOperatorComposition)springBoardBacklightStateChangeListener;
- (PLXPCListenerOperatorComposition)springBoardFlipbookStatisticsListener;
- (PLXPCListenerOperatorComposition)widgetAdditionAnimationListener;
- (PLXPCListenerOperatorComposition)widgetFlipAnimationListener;
- (PLXPCListenerOperatorComposition)windowModeListener;
- (PLXPCResponderOperatorComposition)springBoardAlwaysOnEnableStateResponder;
- (PLXPCResponderOperatorComposition)springBoardBacklightStateChangeResponder;
- (PLXPCResponderOperatorComposition)springBoardFlipbookStatisticsResponder;
- (id)processQuery:(id)a3 withEntryKey:(id)a4;
- (int)GetBacklightState:(id)a3;
- (int)displayState;
- (unint64_t)convertWindowingMode:(id)a3;
- (unint64_t)convertZoomLevel:(id)a3;
- (void)accountWithLayoutEntries:(id)a3;
- (void)createAirPlayWiFiAccountingEvent:(id)a3;
- (void)createCarPlayAccountingEvents:(id)a3;
- (void)dealloc;
- (void)handleDisplayCallback:(id)a3;
- (void)initOperatorDependancies;
- (void)layoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4 withContext:(id)a5;
- (void)log;
- (void)logAggregateWidgetAdditionAnimation:(id)a3;
- (void)logAggregateWidgetFlipAnimation:(id)a3;
- (void)logEventBackwardAlwaysOnEnableState:(id)a3;
- (void)logEventBackwardBacklightStateChange:(id)a3;
- (void)logEventBackwardFlipbookStatistics:(id)a3;
- (void)logEventBackwardIconDragging:(id)a3;
- (void)logEventForwardAirPlayScreenState:(id)a3;
- (void)logEventForwardCarScreenState:(id)a3;
- (void)logEventForwardMainScreenState:(id)a3;
- (void)logEventForwardWindowMode:(id)a3;
- (void)logEventPointMainBacklightEvent:(id)a3 withContext:(id)a4;
- (void)postEnhancedScreenStateNotification:(id)a3 currentLayout:(id)a4;
- (void)setAirPlayDisplayMonitor:(id)a3;
- (void)setCarPlayDisplayMonitor:(id)a3;
- (void)setDisplayCallback:(id)a3;
- (void)setDisplayState:(int)a3;
- (void)setIconDraggingListner:(id)a3;
- (void)setLastDisplayLayout:(id)a3;
- (void)setLastDisplayLayoutContainsLockScreen:(BOOL)a3;
- (void)setLastLayoutMonitorEntries:(id)a3;
- (void)setLastScreenStateEntries:(id)a3;
- (void)setMainDisplayMonitor:(id)a3;
- (void)setSpringBoardAlwaysOnEnableStateListener:(id)a3;
- (void)setSpringBoardAlwaysOnEnableStateResponder:(id)a3;
- (void)setSpringBoardBacklightStateChangeListener:(id)a3;
- (void)setSpringBoardBacklightStateChangeResponder:(id)a3;
- (void)setSpringBoardFlipbookStatisticsListener:(id)a3;
- (void)setSpringBoardFlipbookStatisticsResponder:(id)a3;
- (void)setWidgetAdditionAnimationListener:(id)a3;
- (void)setWidgetFlipAnimationListener:(id)a3;
- (void)setWindowModeListener:(id)a3;
@end

@implementation PLScreenStateAgent

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLScreenStateAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventPointDefinitions
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"BacklightEvent";
  objc_super v2 = [a1 entryEventPointBacklightEvent];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)entryEventPointBacklightEvent
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v14[0] = *MEMORY[0x1E4F92C50];
  uint64_t v12 = *MEMORY[0x1E4F92CD0];
  v13 = &unk_1F4011BF8;
  objc_super v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  v15[0] = v2;
  v14[1] = *MEMORY[0x1E4F92CA8];
  v10[0] = @"TransitionReason";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v10[1] = @"BacklightLevel";
  v11[0] = v4;
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v11[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  v15[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

  return v8;
}

+ (id)entryEventForwardDefinitions
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"ScreenState";
  v3 = [a1 entryEventForwardScreenState];
  v7[1] = @"WindowMode";
  v8[0] = v3;
  v4 = [a1 entryEventForwardWindowMode];
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

+ (id)entryEventForwardScreenState
{
  v24[2] = *MEMORY[0x1E4F143B8];
  v23[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C40];
  v21[0] = *MEMORY[0x1E4F92CD0];
  v21[1] = v2;
  v22[0] = &unk_1F4011C08;
  v22[1] = MEMORY[0x1E4F1CC38];
  v21[2] = *MEMORY[0x1E4F92C08];
  v22[2] = MEMORY[0x1E4F1CC38];
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
  v24[0] = v18;
  v23[1] = *MEMORY[0x1E4F92CA8];
  v19[0] = @"bundleID";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  v16 = objc_msgSend(v17, "commonTypeDict_StringFormat_withBundleID");
  v20[0] = v16;
  v19[1] = @"ScreenWeight";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  v14 = objc_msgSend(v15, "commonTypeDict_RealFormat");
  v20[1] = v14;
  v19[2] = @"AppRole";
  v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v20[2] = v4;
  v19[3] = @"Display";
  v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v20[3] = v6;
  v19[4] = @"Level";
  v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  v8 = objc_msgSend(v7, "commonTypeDict_RealFormat");
  v20[4] = v8;
  v19[5] = @"Orientation";
  v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v20[5] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:6];
  v24[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];

  return v12;
}

+ (id)entryEventForwardWindowMode
{
  v19[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isiPad])
  {
    v18[0] = *MEMORY[0x1E4F92C50];
    uint64_t v16 = *MEMORY[0x1E4F92CD0];
    v17 = &unk_1F4011BF8;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    v19[0] = v13;
    v18[1] = *MEMORY[0x1E4F92CA8];
    v14[0] = @"displayType";
    uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
    v3 = objc_msgSend(v2, "commonTypeDict_StringFormat");
    v15[0] = v3;
    v14[1] = @"zoomLevel";
    v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    v15[1] = v5;
    void v14[2] = @"windowingMode";
    v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    v15[2] = v7;
    v14[3] = @"canvasRatio";
    v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    v9 = objc_msgSend(v8, "commonTypeDict_RealFormat");
    void v15[3] = v9;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
    v19[1] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  }
  else
  {
    v11 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v11;
}

+ (id)entryEventBackwardDefinitions
{
  v10[4] = *MEMORY[0x1E4F143B8];
  v9[0] = @"IconDragging";
  v3 = [a1 entryEventBackwardDefinitionIconDragging];
  v10[0] = v3;
  v9[1] = @"AlwaysOnEnableState";
  v4 = [a1 entryEventBackwardDefinitionAlwaysOnEnableState];
  v10[1] = v4;
  v9[2] = @"BacklightStateChange";
  v5 = [a1 entryEventBackwardDefinitionBacklightStateChange];
  void v10[2] = v5;
  v9[3] = @"FlipbookStatistics";
  v6 = [a1 entryEventBackwardDefinitionFlipbookStatistics];
  v10[3] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];

  return v7;
}

- (int)GetBacklightState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"off"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"suppressed"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"inactiveOnFlipbook"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"inactiveOnLiveFlipbook"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"inactiveOnLive"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"activeDimmed"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"active"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 7;
  }

  return v4;
}

+ (id)entryEventBackwardDefinitionIconDragging
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v12[0] = *MEMORY[0x1E4F92C50];
  uint64_t v10 = *MEMORY[0x1E4F92CD0];
  v11 = &unk_1F4011BF8;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E4F92CA8];
  v8 = @"Duration";
  id v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  int v4 = objc_msgSend(v3, "commonTypeDict_RealFormat");
  v9 = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v13[1] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  return v6;
}

+ (id)entryEventBackwardDefinitionAlwaysOnEnableState
{
  v20[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] hasAOD])
  {
    v19[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CF8];
    v17[0] = *MEMORY[0x1E4F92CD0];
    v17[1] = v2;
    v18[0] = &unk_1F4011C18;
    v18[1] = &unk_1F400C508;
    v17[2] = *MEMORY[0x1E4F92CF0];
    void v18[2] = &unk_1F4011C28;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];
    v20[0] = v14;
    v19[1] = *MEMORY[0x1E4F92CA8];
    v15[0] = @"alwaysOnResolvedEnabled";
    id v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    int v4 = objc_msgSend(v3, "commonTypeDict_BoolFormat");
    v16[0] = v4;
    v15[1] = @"alwaysOnEnabledSetting";
    v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    v6 = objc_msgSend(v5, "commonTypeDict_BoolFormat");
    v16[1] = v6;
    v15[2] = @"lowPowerMode";
    v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    v8 = objc_msgSend(v7, "commonTypeDict_BoolFormat");
    v16[2] = v8;
    void v15[3] = @"focusMode";
    v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v10 = objc_msgSend(v9, "commonTypeDict_BoolFormat");
    v16[3] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];
    v20[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventBackwardDefinitionBacklightStateChange
{
  void v19[2] = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F92A38] hasAOD] & 1) != 0
    || ([MEMORY[0x1E4F92A38] isDeviceClass:102040] & 1) != 0
    || [MEMORY[0x1E4F92A38] isDeviceClass:102041])
  {
    v18[0] = *MEMORY[0x1E4F92C50];
    uint64_t v16 = *MEMORY[0x1E4F92CD0];
    v17 = &unk_1F4011C18;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    v19[0] = v13;
    v18[1] = *MEMORY[0x1E4F92CA8];
    v14[0] = @"state";
    uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
    v15[0] = v3;
    v14[1] = @"explanation";
    int v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    v5 = objc_msgSend(v4, "commonTypeDict_StringFormat");
    v15[1] = v5;
    void v14[2] = @"suppressionChangeType";
    v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    v7 = objc_msgSend(v6, "commonTypeDict_StringFormat");
    v15[2] = v7;
    v14[3] = @"suppressionReasons";
    v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    v9 = objc_msgSend(v8, "commonTypeDict_StringFormat");
    void v15[3] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
    v19[1] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  }
  else
  {
    v11 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v11;
}

+ (id)entryEventBackwardDefinitionFlipbookStatistics
{
  v59[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] hasAOD])
  {
    v58[0] = *MEMORY[0x1E4F92C50];
    uint64_t v56 = *MEMORY[0x1E4F92CD0];
    v57 = &unk_1F4011BF8;
    v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
    v59[0] = v53;
    v58[1] = *MEMORY[0x1E4F92CA8];
    v54[0] = @"invalidatedFramesUpTo2mStale";
    v52 = [MEMORY[0x1E4F929D8] sharedInstance];
    v51 = objc_msgSend(v52, "commonTypeDict_IntegerFormat");
    v55[0] = v51;
    v54[1] = @"invalidatedFramesUpTo3mStale";
    v50 = [MEMORY[0x1E4F929D8] sharedInstance];
    v49 = objc_msgSend(v50, "commonTypeDict_IntegerFormat");
    v55[1] = v49;
    v54[2] = @"invalidatedFramesUpTo4mStale";
    v48 = [MEMORY[0x1E4F929D8] sharedInstance];
    v47 = objc_msgSend(v48, "commonTypeDict_IntegerFormat");
    v55[2] = v47;
    v54[3] = @"invalidatedFramesUpTo5mStale";
    v46 = [MEMORY[0x1E4F929D8] sharedInstance];
    v45 = objc_msgSend(v46, "commonTypeDict_IntegerFormat");
    v55[3] = v45;
    v54[4] = @"invalidatedFramesUpTo6mStale";
    v44 = [MEMORY[0x1E4F929D8] sharedInstance];
    v43 = objc_msgSend(v44, "commonTypeDict_IntegerFormat");
    v55[4] = v43;
    v54[5] = @"discardedFramesUpTo2mStale";
    v42 = [MEMORY[0x1E4F929D8] sharedInstance];
    v41 = objc_msgSend(v42, "commonTypeDict_IntegerFormat");
    v55[5] = v41;
    v54[6] = @"discardedFramesUpTo3mStale";
    v40 = [MEMORY[0x1E4F929D8] sharedInstance];
    v39 = objc_msgSend(v40, "commonTypeDict_IntegerFormat");
    v55[6] = v39;
    v54[7] = @"discardedFramesUpTo4mStale";
    v38 = [MEMORY[0x1E4F929D8] sharedInstance];
    v37 = objc_msgSend(v38, "commonTypeDict_IntegerFormat");
    v55[7] = v37;
    v54[8] = @"discardedFramesUpTo5mStale";
    v36 = [MEMORY[0x1E4F929D8] sharedInstance];
    v35 = objc_msgSend(v36, "commonTypeDict_IntegerFormat");
    v55[8] = v35;
    v54[9] = @"discardedFramesUpTo6mStale";
    v34 = [MEMORY[0x1E4F929D8] sharedInstance];
    v33 = objc_msgSend(v34, "commonTypeDict_IntegerFormat");
    v55[9] = v33;
    v54[10] = @"renderedFramesLessThan1Min";
    v32 = [MEMORY[0x1E4F929D8] sharedInstance];
    v31 = objc_msgSend(v32, "commonTypeDict_IntegerFormat");
    v55[10] = v31;
    v54[11] = @"renderedFrames1to2Min";
    v30 = [MEMORY[0x1E4F929D8] sharedInstance];
    v29 = objc_msgSend(v30, "commonTypeDict_IntegerFormat");
    v55[11] = v29;
    v54[12] = @"renderedFrames2to3Min";
    v28 = [MEMORY[0x1E4F929D8] sharedInstance];
    v27 = objc_msgSend(v28, "commonTypeDict_IntegerFormat");
    v55[12] = v27;
    v54[13] = @"renderedFrames3to4Min";
    v26 = [MEMORY[0x1E4F929D8] sharedInstance];
    v25 = objc_msgSend(v26, "commonTypeDict_IntegerFormat");
    v55[13] = v25;
    v54[14] = @"renderedFrames4to5Min";
    v24 = [MEMORY[0x1E4F929D8] sharedInstance];
    v23 = objc_msgSend(v24, "commonTypeDict_IntegerFormat");
    v55[14] = v23;
    v54[15] = @"renderedFrames5to6Min";
    v22 = [MEMORY[0x1E4F929D8] sharedInstance];
    v21 = objc_msgSend(v22, "commonTypeDict_IntegerFormat");
    v55[15] = v21;
    v54[16] = @"renderedFramesMoreThan6Min";
    v20 = [MEMORY[0x1E4F929D8] sharedInstance];
    v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
    v55[16] = v19;
    v54[17] = @"renderedFrameCount";
    v18 = [MEMORY[0x1E4F929D8] sharedInstance];
    v17 = objc_msgSend(v18, "commonTypeDict_IntegerFormat");
    v55[17] = v17;
    v54[18] = @"renderedPartialMinuteCount";
    uint64_t v16 = [MEMORY[0x1E4F929D8] sharedInstance];
    v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
    v55[18] = v15;
    v54[19] = @"millisecondsDisplayOff";
    v14 = [MEMORY[0x1E4F929D8] sharedInstance];
    v13 = objc_msgSend(v14, "commonTypeDict_IntegerFormat");
    v55[19] = v13;
    v54[20] = @"millisecondsDisplayOn";
    uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
    id v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
    v55[20] = v3;
    v54[21] = @"millisecondsDisplayDimmed";
    int v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    v55[21] = v5;
    v54[22] = @"millisecondsShowingAOT";
    v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    v55[22] = v7;
    v54[23] = @"millisecondsSuppressed";
    v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
    v55[23] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:24];
    v59[1] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:v58 count:2];
  }
  else
  {
    v11 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v11;
}

+ (id)entryEventNoneDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryAggregateDefinitions
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"WidgetAdditionAnimation";
  id v3 = [a1 entryAggregateDefinitionWidgetAdditionAnimation];
  v7[1] = @"WidgetFlipAnimation";
  v8[0] = v3;
  int v4 = [a1 entryAggregateDefinitionWidgetFlipAnimation];
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

+ (id)entryAggregateDefinitionWidgetAdditionAnimation
{
  void v20[4] = *MEMORY[0x1E4F143B8];
  v19[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CE8];
  v17[0] = *MEMORY[0x1E4F92CD0];
  v17[1] = v2;
  v18[0] = &unk_1F4011BF8;
  v18[1] = MEMORY[0x1E4F1CC38];
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  v20[0] = v3;
  v19[1] = *MEMORY[0x1E4F92CA8];
  v15 = @"Count";
  int v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  uint64_t v16 = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  v20[1] = v6;
  void v19[2] = *MEMORY[0x1E4F92BE0];
  v13 = &unk_1F4011C38;
  uint64_t v11 = *MEMORY[0x1E4F92BD8];
  uint64_t v12 = &unk_1F4011C28;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  v14 = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  void v19[3] = *MEMORY[0x1E4F92BF0];
  v20[2] = v8;
  v20[3] = &unk_1F4013168;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:4];

  return v9;
}

+ (id)entryAggregateDefinitionWidgetFlipAnimation
{
  void v20[4] = *MEMORY[0x1E4F143B8];
  v19[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CE8];
  v17[0] = *MEMORY[0x1E4F92CD0];
  v17[1] = v2;
  v18[0] = &unk_1F4011BF8;
  v18[1] = MEMORY[0x1E4F1CC38];
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  v20[0] = v3;
  v19[1] = *MEMORY[0x1E4F92CA8];
  v15 = @"Count";
  int v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
  uint64_t v16 = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  v20[1] = v6;
  void v19[2] = *MEMORY[0x1E4F92BE0];
  v13 = &unk_1F4011C38;
  uint64_t v11 = *MEMORY[0x1E4F92BD8];
  uint64_t v12 = &unk_1F4011C28;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  v14 = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  void v19[3] = *MEMORY[0x1E4F92BF0];
  v20[2] = v8;
  v20[3] = &unk_1F4013180;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:4];

  return v9;
}

+ (id)entryAggregateDefinitionForeground
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (PLScreenStateAgent)init
{
  if (([MEMORY[0x1E4F92A38] isHomePod] & 1) != 0
    || +[PLUtilities isPowerlogHelperd])
  {
    id v3 = 0;
  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)PLScreenStateAgent;
    int v4 = [(PLAgent *)&v25 init];
    v5 = v4;
    if (v4)
    {
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      void v23[2] = __26__PLScreenStateAgent_init__block_invoke_2;
      v23[3] = &unk_1E6E48558;
      v6 = v4;
      v24 = v6;
      v7 = (void *)MEMORY[0x1E4E7F1C0](v23);
      uint64_t v18 = MEMORY[0x1E4F143A8];
      uint64_t v19 = 3221225472;
      v20 = __26__PLScreenStateAgent_init__block_invoke_4;
      v21 = &unk_1E6E48558;
      v8 = v6;
      v22 = v8;
      v9 = (void *)MEMORY[0x1E4E7F1C0](&v18);
      id v10 = objc_alloc(MEMORY[0x1E4F62940]);
      uint64_t v11 = objc_msgSend(v10, "initWithDisplayType:qualityOfService:handler:", 0, 17, &__block_literal_global_219, v18, v19, v20, v21);
      id v12 = v8[7];
      v8[7] = (id)v11;

      [v8[7] addObserver:v8];
      uint64_t v13 = [objc_alloc(MEMORY[0x1E4F62940]) initWithDisplayType:3 qualityOfService:17 handler:v7];
      id v14 = v8[9];
      v8[9] = (id)v13;

      uint64_t v15 = [objc_alloc(MEMORY[0x1E4F62940]) initWithDisplayType:1 qualityOfService:17 handler:v9];
      id v16 = v8[8];
      v8[8] = (id)v15;
    }
    self = v5;
    id v3 = self;
  }

  return v3;
}

void __26__PLScreenStateAgent_init__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    int v4 = [*(id *)(a1 + 32) workQueue];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __26__PLScreenStateAgent_init__block_invoke_3;
    v5[3] = &unk_1E6E47EB8;
    id v6 = *(id *)(a1 + 32);
    id v7 = v3;
    dispatch_async(v4, v5);
  }
}

uint64_t __26__PLScreenStateAgent_init__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) logEventForwardCarScreenState:*(void *)(a1 + 40)];
}

void __26__PLScreenStateAgent_init__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    int v4 = [*(id *)(a1 + 32) workQueue];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __26__PLScreenStateAgent_init__block_invoke_5;
    v5[3] = &unk_1E6E47EB8;
    id v6 = *(id *)(a1 + 32);
    id v7 = v3;
    dispatch_async(v4, v5);
  }
}

uint64_t __26__PLScreenStateAgent_init__block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) logEventForwardAirPlayScreenState:*(void *)(a1 + 40)];
}

- (void)initOperatorDependancies
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_1E4220000, a2, OS_LOG_TYPE_DEBUG, "initial state for EnableAlwaysOn is %d", (uint8_t *)v2, 8u);
}

void __46__PLScreenStateAgent_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogScreenState();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) logEventForwardWindowMode:v6];
}

void __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_245(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogScreenState();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_245_cold_1();
  }

  [*(id *)(a1 + 32) logEventBackwardIconDragging:v6];
}

void __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_250(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogScreenState();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_250_cold_1();
  }

  [*(id *)(a1 + 32) logAggregateWidgetAdditionAnimation:v6];
}

void __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_255(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogScreenState();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_255_cold_1();
  }

  [*(id *)(a1 + 32) logAggregateWidgetFlipAnimation:v6];
}

void __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_260(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogScreenState();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_260_cold_1();
  }

  [*(id *)(a1 + 32) logEventBackwardAlwaysOnEnableState:v6];
}

void __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_265(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogScreenState();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_265_cold_1();
  }

  [*(id *)(a1 + 32) logEventBackwardBacklightStateChange:v6];
}

void __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_270(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogScreenState();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_270_cold_1();
  }

  [*(id *)(a1 + 32) logEventBackwardFlipbookStatistics:v6];
}

id __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_276(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogScreenState();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_276_cold_2();
  }

  v8 = [*(id *)(a1 + 32) processQuery:v6 withEntryKey:@"PLScreenStateAgent_EventBackward_AlwaysOnEnableState"];
  v9 = v8;
  if (v8 && [v8 count])
  {
    id v10 = objc_opt_new();
    [v10 setObject:v9 forKeyedSubscript:@"AlwaysOnEnableState"];
    uint64_t v11 = PLLogScreenState();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_276_cold_2();
    }
  }
  else
  {
    uint64_t v11 = PLLogScreenState();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_276_cold_1();
    }
    id v10 = 0;
  }

  return v10;
}

id __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_286(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogScreenState();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_286_cold_2();
  }

  v8 = [*(id *)(a1 + 32) processQuery:v6 withEntryKey:@"PLScreenStateAgent_EventBackward_BacklightStateChange"];
  v9 = v8;
  if (v8 && [v8 count])
  {
    id v10 = objc_opt_new();
    [v10 setObject:v9 forKeyedSubscript:@"BacklightStateChange"];
    uint64_t v11 = PLLogScreenState();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_286_cold_2();
    }
  }
  else
  {
    uint64_t v11 = PLLogScreenState();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_286_cold_1();
    }
    id v10 = 0;
  }

  return v10;
}

id __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_294(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6 = a5;
  id v7 = PLLogScreenState();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_294_cold_2();
  }

  v8 = [*(id *)(a1 + 32) processQuery:v6 withEntryKey:@"PLScreenStateAgent_EventBackward_FlipbookStatistics"];
  v9 = v8;
  if (v8 && [v8 count])
  {
    id v10 = objc_opt_new();
    [v10 setObject:v9 forKeyedSubscript:@"FlipbookStatistics"];
    uint64_t v11 = PLLogScreenState();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_294_cold_2();
    }
  }
  else
  {
    uint64_t v11 = PLLogScreenState();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_294_cold_1();
    }
    id v10 = 0;
  }

  return v10;
}

void __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_311(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    int v4 = PLLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_311_cold_1();
    }

    [*(id *)(a1 + 32) handleDisplayCallback:v3];
  }
}

- (void)dealloc
{
  carPlayDisplayMonitor = self->_carPlayDisplayMonitor;
  if (carPlayDisplayMonitor) {
    [(FBSDisplayLayoutMonitor *)carPlayDisplayMonitor invalidate];
  }
  airPlayDisplayMonitor = self->_airPlayDisplayMonitor;
  if (airPlayDisplayMonitor) {
    [(FBSDisplayLayoutMonitor *)airPlayDisplayMonitor invalidate];
  }
  mainDisplayMonitor = self->_mainDisplayMonitor;
  if (mainDisplayMonitor) {
    [(FBSDisplayLayoutMonitor *)mainDisplayMonitor invalidate];
  }
  v6.receiver = self;
  v6.super_class = (Class)PLScreenStateAgent;
  [(PLAgent *)&v6 dealloc];
}

- (void)log
{
  id v4 = [(PLScreenStateAgent *)self mainDisplayMonitor];
  id v3 = [v4 currentLayout];
  [(PLScreenStateAgent *)self logEventForwardMainScreenState:v3];
}

- (void)logEventPointMainBacklightEvent:(id)a3 withContext:(id)a4
{
  uint64_t v6 = *MEMORY[0x1E4F92D48];
  id v7 = a4;
  id v8 = a3;
  v9 = +[PLOperator entryKeyForType:v6 andName:@"BacklightEvent"];
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v9];
  uint64_t v11 = (void *)MEMORY[0x1E4F28ED0];
  id v12 = [v7 transitionReason];

  uint64_t v13 = [v11 numberWithInteger:SBSBacklightChangeSourceForDisplayLayoutTransitionReason()];
  [v10 setObject:v13 forKeyedSubscript:@"TransitionReason"];

  id v14 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v15 = [v8 displayBacklightLevel];

  id v16 = [v14 numberWithInteger:v15];
  [v10 setObject:v16 forKeyedSubscript:@"BacklightLevel"];

  [(PLOperator *)self logEntry:v10];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v17 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    v26 = __66__PLScreenStateAgent_logEventPointMainBacklightEvent_withContext___block_invoke;
    v27 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v28 = v17;
    if (logEventPointMainBacklightEvent_withContext__defaultOnce != -1) {
      dispatch_once(&logEventPointMainBacklightEvent_withContext__defaultOnce, &block);
    }
    if (logEventPointMainBacklightEvent_withContext__classDebugEnabled)
    {
      uint64_t v18 = [NSString stringWithFormat:@"BacklightEvent: %@", v10, block, v25, v26, v27, v28];
      uint64_t v19 = (void *)MEMORY[0x1E4F929B8];
      v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLScreenStateAgent.m"];
      v21 = [v20 lastPathComponent];
      v22 = [NSString stringWithUTF8String:"-[PLScreenStateAgent logEventPointMainBacklightEvent:withContext:]"];
      [v19 logMessage:v18 fromFile:v21 fromFunction:v22 fromLineNumber:557];

      v23 = PLLogCommon();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
}

uint64_t __66__PLScreenStateAgent_logEventPointMainBacklightEvent_withContext___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventPointMainBacklightEvent_withContext__classDebugEnabled = result;
  return result;
}

- (void)postEnhancedScreenStateNotification:(id)a3 currentLayout:(id)a4
{
  char v5 = [a3 isEqualToDictionary:a4];
  uint64_t v6 = PLLogCommon();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7) {
      -[PLScreenStateAgent postEnhancedScreenStateNotification:currentLayout:]();
    }
  }
  else
  {
    if (v7) {
      -[PLScreenStateAgent postEnhancedScreenStateNotification:currentLayout:]();
    }

    ++postEnhancedScreenStateNotification_currentLayout__enhancedScreenStateCounter;
    id v8 = [NSString stringWithFormat:@"com.apple.powerlog.EnhancedScreenState"];
    +[PLUtilities postNotificationName:v8 object:self userInfo:0];

    uint64_t v6 = PLLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[PLScreenStateAgent postEnhancedScreenStateNotification:currentLayout:](v6);
    }
  }
}

- (void)logEventForwardMainScreenState:(id)a3
{
  id v4 = a3;
  char v5 = [(PLOperator *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __53__PLScreenStateAgent_logEventForwardMainScreenState___block_invoke;
  v7[3] = &unk_1E6E47EB8;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __53__PLScreenStateAgent_logEventForwardMainScreenState___block_invoke(uint64_t a1)
{
  v138[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __53__PLScreenStateAgent_logEventForwardMainScreenState___block_invoke_cold_10(a1, v2, v3, v4, v5, v6, v7, v8);
  }

  if (!*(void *)(a1 + 32)) {
    return;
  }
  v9 = PLLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __53__PLScreenStateAgent_logEventForwardMainScreenState___block_invoke_cold_9();
  }

  if ((!_os_feature_enabled_impl() || ([MEMORY[0x1E4F92A38] hasAOD] & 1) == 0)
    && [*(id *)(a1 + 32) displayBacklightLevel] < 1)
  {
    return;
  }
  v108 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"ScreenState"];
  v107 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  [*(id *)(a1 + 32) bounds];
  double v11 = v10;
  [*(id *)(a1 + 32) bounds];
  double v13 = v12;
  uint64_t v14 = [objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"level" ascending:0];
  uint64_t v15 = [objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"layoutRole" ascending:0];
  id v16 = [*(id *)(a1 + 32) elements];
  v98 = (void *)v15;
  v99 = (void *)v14;
  v138[0] = v14;
  v138[1] = v15;
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v138 count:2];
  uint64_t v18 = [v16 sortedArrayUsingDescriptors:v17];

  uint64_t v19 = [MEMORY[0x1E4F1CA48] array];
  v104 = [MEMORY[0x1E4F1CA60] dictionary];
  v20 = PLLogCommon();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    __53__PLScreenStateAgent_logEventForwardMainScreenState___block_invoke_cold_8();
  }

  if (_os_feature_enabled_impl() && [MEMORY[0x1E4F92A38] hasAOD]) {
    [*(id *)(a1 + 40) setLastDisplayLayoutContainsLockScreen:0];
  }
  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  id obj = v18;
  uint64_t v106 = [obj countByEnumeratingWithState:&v111 objects:v137 count:16];
  if (!v106) {
    goto LABEL_62;
  }
  double v21 = v11 * v13;
  uint64_t v105 = *(void *)v112;
  uint64_t v100 = *MEMORY[0x1E4F625B0];
  double v22 = -1.0;
  double v23 = 0.0;
  uint64_t v103 = a1;
  v101 = v19;
  while (2)
  {
    for (uint64_t i = 0; i != v106; ++i)
    {
      if (*(void *)v112 != v105) {
        objc_enumerationMutation(obj);
      }
      uint64_t v25 = *(void **)(*((void *)&v111 + 1) + 8 * i);
      v26 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v108 withDate:v107];
      v27 = [v25 bundleIdentifier];
      if (v27) {
        [v25 bundleIdentifier];
      }
      else {
      uint64_t v28 = [v25 identifier];
      }
      [v26 setObject:v28 forKeyedSubscript:@"bundleID"];

      v29 = [v26 objectForKeyedSubscript:@"bundleID"];

      if (!v29)
      {
        v54 = PLLogCommon();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
          __53__PLScreenStateAgent_logEventForwardMainScreenState___block_invoke_cold_4(&v109, v110, v54);
        }
        goto LABEL_45;
      }
      if (_os_feature_enabled_impl())
      {
        if ([MEMORY[0x1E4F92A38] hasAOD])
        {
          v30 = [v26 objectForKeyedSubscript:@"bundleID"];
          int v31 = [v30 isEqualToString:v100];

          if (v31)
          {
            [*(id *)(a1 + 40) setLastDisplayLayoutContainsLockScreen:1];
            v32 = PLLogCommon();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
            {
              v79 = [v26 objectForKeyedSubscript:@"bundleID"];
              int v80 = [*(id *)(a1 + 40) displayState];
              *(_DWORD *)buf = 138412802;
              v126 = v79;
              __int16 v127 = 2112;
              v128 = v26;
              __int16 v129 = 1024;
              LODWORD(v130) = v80;
              _os_log_debug_impl(&dword_1E4220000, v32, OS_LOG_TYPE_DEBUG, "element bundleID=%@, entry=%@, displayState=%d", buf, 0x1Cu);
            }
            if ([*(id *)(a1 + 40) displayState] == 2)
            {
              v33 = [NSString stringWithFormat:@"%@.%@", v100, @"aod"];
              [v26 setObject:v33 forKeyedSubscript:@"bundleID"];

              v34 = PLLogCommon();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v126 = v26;
                _os_log_debug_impl(&dword_1E4220000, v34, OS_LOG_TYPE_DEBUG, "entry after transformation = %@", buf, 0xCu);
              }
            }
          }
        }
      }
      v35 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v25, "layoutRole"));
      [v26 setObject:v35 forKeyedSubscript:@"AppRole"];

      v36 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "displayType"));
      [v26 setObject:v36 forKeyedSubscript:@"Display"];

      v37 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "interfaceOrientation"));
      [v26 setObject:v37 forKeyedSubscript:@"Orientation"];

      v38 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v25, "level"));
      [v26 setObject:v38 forKeyedSubscript:@"Level"];

      [v25 frame];
      double v40 = v39;
      [v25 frame];
      double v42 = v40 * v41 / v21;
      v43 = [MEMORY[0x1E4F28ED0] numberWithDouble:v42];
      [v26 setObject:v43 forKeyedSubscript:@"ScreenWeight"];

      if (_os_feature_enabled_impl())
      {
        v44 = PLLogCommon();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
          __53__PLScreenStateAgent_logEventForwardMainScreenState___block_invoke_cold_7(&v135, v26, &v136);
        }

        if ([*(id *)(*(void *)(a1 + 40) + 88) count])
        {
          v45 = PLLogCommon();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
            __53__PLScreenStateAgent_logEventForwardMainScreenState___block_invoke_cold_6(&v133, v26, &v134);
          }

          v46 = *(void **)(*(void *)(a1 + 40) + 88);
          v47 = [v26 objectForKeyedSubscript:@"bundleID"];
          v48 = [v46 objectForKey:v47];

          if (v48)
          {
            v131[0] = @"AppRole";
            v49 = objc_msgSend(v26, "objectForKeyedSubscript:");
            v132[0] = v49;
            v131[1] = @"Display";
            v50 = objc_msgSend(v26, "objectForKeyedSubscript:");
            v132[1] = v50;
            v131[2] = @"Orientation";
            v51 = objc_msgSend(v26, "objectForKeyedSubscript:");
            v132[2] = v51;
            v131[3] = @"Level";
            v52 = objc_msgSend(v26, "objectForKeyedSubscript:");
            v132[3] = v52;
            v131[4] = @"ScreenWeight";
            v53 = objc_msgSend(v26, "objectForKeyedSubscript:");
            v132[4] = v53;
            v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v132 forKeys:v131 count:5];

            a1 = v103;
            v55 = *(void **)(*(void *)(v103 + 40) + 88);
            uint64_t v56 = [v26 objectForKeyedSubscript:@"bundleID"];
            v57 = [v55 objectForKey:v56];
            LODWORD(v51) = [v57 isEqualToDictionary:v54];

            if (v51)
            {
              v58 = PLLogCommon();
              if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
              {
                v81 = [v26 objectForKeyedSubscript:@"bundleID"];
                v82 = [v26 objectForKeyedSubscript:@"ScreenWeight"];
                v83 = [v26 objectForKeyedSubscript:@"Level"];
                *(_DWORD *)buf = 138412802;
                v126 = v81;
                __int16 v127 = 2112;
                v128 = v82;
                __int16 v129 = 2112;
                v130 = v83;
                _os_log_debug_impl(&dword_1E4220000, v58, OS_LOG_TYPE_DEBUG, "current FBSDisplayLayoutElement entry was already logged, skipping logging for  %@ with screenWeight %@ and Level: %@", buf, 0x20u);
              }
              v59 = [v26 objectForKeyedSubscript:@"bundleID"];
              [v104 setObject:v54 forKeyedSubscript:v59];

              uint64_t v19 = v101;
LABEL_45:

              goto LABEL_58;
            }
          }
        }
        v60 = PLLogCommon();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
        {
          v76 = [v26 objectForKeyedSubscript:@"bundleID"];
          v77 = [v26 objectForKeyedSubscript:@"ScreenWeight"];
          v78 = [v26 objectForKeyedSubscript:@"Level"];
          *(_DWORD *)buf = 138412802;
          v126 = v76;
          __int16 v127 = 2112;
          v128 = v77;
          __int16 v129 = 2112;
          v130 = v78;
          _os_log_debug_impl(&dword_1E4220000, v60, OS_LOG_TYPE_DEBUG, "FBSDisplayLayoutElement entries was not logged, logging %@ with screenWeight %@ and Level: %@", buf, 0x20u);
        }
        v123[0] = @"AppRole";
        v61 = objc_msgSend(v26, "objectForKeyedSubscript:");
        v124[0] = v61;
        v123[1] = @"Display";
        v62 = objc_msgSend(v26, "objectForKeyedSubscript:");
        v124[1] = v62;
        v123[2] = @"Orientation";
        v63 = objc_msgSend(v26, "objectForKeyedSubscript:");
        v124[2] = v63;
        v123[3] = @"Level";
        v64 = objc_msgSend(v26, "objectForKeyedSubscript:");
        v124[3] = v64;
        v123[4] = @"ScreenWeight";
        v65 = objc_msgSend(v26, "objectForKeyedSubscript:");
        v124[4] = v65;
        v66 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v124 forKeys:v123 count:5];
        v67 = [v26 objectForKeyedSubscript:@"bundleID"];
        [v104 setObject:v66 forKeyedSubscript:v67];

        a1 = v103;
        uint64_t v19 = v101;
      }
      if ([MEMORY[0x1E4F929C0] taskMode])
      {
        v121[0] = @"AppRole";
        v68 = objc_msgSend(v26, "objectForKeyedSubscript:");
        v122[0] = v68;
        v121[1] = @"Display";
        v69 = objc_msgSend(v26, "objectForKeyedSubscript:");
        v122[1] = v69;
        v121[2] = @"Orientation";
        v70 = objc_msgSend(v26, "objectForKeyedSubscript:");
        v122[2] = v70;
        v121[3] = @"Level";
        v71 = objc_msgSend(v26, "objectForKeyedSubscript:");
        v122[3] = v71;
        v121[4] = @"ScreenWeight";
        v72 = objc_msgSend(v26, "objectForKeyedSubscript:");
        v122[4] = v72;
        v73 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v122 forKeys:v121 count:5];
        v74 = [v26 objectForKeyedSubscript:@"bundleID"];
        [v104 setObject:v73 forKeyedSubscript:v74];

        a1 = v103;
        uint64_t v19 = v101;
      }
      [v19 addObject:v26];
      ++displaySync_block_invoke_screenStateEntriesCounter;
      v75 = PLLogCommon();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG)) {
        __53__PLScreenStateAgent_logEventForwardMainScreenState___block_invoke_cold_5(v119, v120, v75);
      }

      if (v22 == (double)[v25 level]) {
        double v42 = v23 + v42;
      }
      else {
        double v22 = (double)[v25 level];
      }
      double v23 = v42;
      if (v42 >= 1.0)
      {

        goto LABEL_62;
      }
LABEL_58:
    }
    uint64_t v106 = [obj countByEnumeratingWithState:&v111 objects:v137 count:16];
    if (v106) {
      continue;
    }
    break;
  }
LABEL_62:

  if ([MEMORY[0x1E4F929C0] taskMode])
  {
    [*(id *)(a1 + 40) postEnhancedScreenStateNotification:*(void *)(*(void *)(a1 + 40) + 96) currentLayout:v104];
    [*(id *)(*(void *)(a1 + 40) + 96) removeAllObjects];
    uint64_t v84 = [v104 mutableCopy];
    uint64_t v85 = *(void *)(a1 + 40);
    v86 = *(void **)(v85 + 96);
    *(void *)(v85 + 96) = v84;
  }
  int v87 = _os_feature_enabled_impl();
  v88 = *(id **)(a1 + 40);
  if (!v87)
  {
    v115 = v108;
    v116 = v19;
    v95 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v116 forKeys:&v115 count:1];
    [v88 logEntries:v95 withGroupID:v108];

    v94 = PLLogCommon();
    if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_69;
    }
    goto LABEL_70;
  }
  [v88[11] removeAllObjects];
  uint64_t v89 = [v104 mutableCopy];
  uint64_t v90 = *(void *)(a1 + 40);
  v91 = *(void **)(v90 + 88);
  *(void *)(v90 + 88) = v89;

  if ([v19 count])
  {
    v92 = *(void **)(a1 + 40);
    v117 = v108;
    v118 = v19;
    v93 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v118 forKeys:&v117 count:1];
    [v92 logEntries:v93 withGroupID:v108];

    v94 = PLLogCommon();
    if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG)) {
LABEL_69:
    }
      __53__PLScreenStateAgent_logEventForwardMainScreenState___block_invoke_cold_2();
LABEL_70:
    v97 = v98;
    v96 = v99;
  }
  else
  {
    v94 = PLLogCommon();
    v97 = v98;
    v96 = v99;
    if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG)) {
      __53__PLScreenStateAgent_logEventForwardMainScreenState___block_invoke_cold_1();
    }
  }

  [*(id *)(a1 + 40) accountWithLayoutEntries:v19];
  if (_os_feature_enabled_impl())
  {
    if ([MEMORY[0x1E4F92A38] hasAOD]) {
      [*(id *)(a1 + 40) setLastDisplayLayout:*(void *)(a1 + 32)];
    }
  }
}

- (void)logEventForwardCarScreenState:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"ScreenState"];
  uint64_t v6 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  uint64_t v7 = [v4 elements];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    [v4 bounds];
    double v10 = v9;
    [v4 bounds];
    double v12 = v11;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id obj = [v4 elements];
    uint64_t v32 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v32)
    {
      double v13 = v10 * v12;
      uint64_t v31 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v34 != v31) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          id v16 = v5;
          uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v5];
          uint64_t v18 = v6;
          [v17 setEntryDate:v6];
          uint64_t v19 = [v15 bundleIdentifier];
          if (v19) {
            [v15 bundleIdentifier];
          }
          else {
          v20 = [v15 identifier];
          }
          [v17 setObject:v20 forKeyedSubscript:@"bundleID"];

          double v21 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v15, "layoutRole"));
          [v17 setObject:v21 forKeyedSubscript:@"AppRole"];

          double v22 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v4, "displayType"));
          [v17 setObject:v22 forKeyedSubscript:@"Display"];

          double v23 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v15, "level"));
          [v17 setObject:v23 forKeyedSubscript:@"Level"];

          [v15 frame];
          double v25 = v24;
          [v15 frame];
          v27 = [MEMORY[0x1E4F28ED0] numberWithDouble:v25 * v26 / v13];
          [v17 setObject:v27 forKeyedSubscript:@"ScreenWeight"];

          [(PLOperator *)self logEntry:v17];
          [(PLScreenStateAgent *)self createCarPlayAccountingEvents:v17];

          uint64_t v5 = v16;
          uint64_t v6 = v18;
        }
        uint64_t v32 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v32);
    }
  }
  else
  {
    uint64_t v28 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v5];
    [v28 setEntryDate:v6];
    [v28 setObject:0 forKeyedSubscript:@"bundleID"];
    [v28 setObject:&unk_1F400C538 forKeyedSubscript:@"AppRole"];
    v29 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v4, "displayType"));
    [v28 setObject:v29 forKeyedSubscript:@"Display"];

    [v28 setObject:&unk_1F4011BF8 forKeyedSubscript:@"ScreenWeight"];
    [v28 setObject:&unk_1F400C550 forKeyedSubscript:@"Level"];
    [(PLOperator *)self logEntry:v28];
    [(PLScreenStateAgent *)self createCarPlayAccountingEvents:v28];
  }
}

- (void)logEventForwardAirPlayScreenState:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"ScreenState"];
  uint64_t v6 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  uint64_t v7 = [v4 elements];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    [v4 bounds];
    double v10 = v9;
    [v4 bounds];
    double v12 = v11;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id obj = [v4 elements];
    uint64_t v33 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v33)
    {
      double v13 = v10 * v12;
      uint64_t v32 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v35 != v32) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = v4;
          id v16 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          uint64_t v17 = v5;
          uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v5];
          uint64_t v19 = v6;
          [v18 setEntryDate:v6];
          v20 = [v16 bundleIdentifier];
          if (v20) {
            [v16 bundleIdentifier];
          }
          else {
          double v21 = [v16 identifier];
          }
          [v18 setObject:v21 forKeyedSubscript:@"bundleID"];

          double v22 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v16, "layoutRole"));
          [v18 setObject:v22 forKeyedSubscript:@"AppRole"];

          id v4 = v15;
          double v23 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v15, "displayType"));
          [v18 setObject:v23 forKeyedSubscript:@"Display"];

          double v24 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v16, "level"));
          [v18 setObject:v24 forKeyedSubscript:@"Level"];

          [v16 frame];
          double v26 = v25;
          [v16 frame];
          uint64_t v28 = [MEMORY[0x1E4F28ED0] numberWithDouble:v26 * v27 / v13];
          [v18 setObject:v28 forKeyedSubscript:@"ScreenWeight"];

          [(PLScreenStateAgent *)self createAirPlayWiFiAccountingEvent:v18];
          uint64_t v5 = v17;
          uint64_t v6 = v19;
        }
        uint64_t v33 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v33);
    }
  }
  else
  {
    v29 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v5];
    [v29 setEntryDate:v6];
    [v29 setObject:0 forKeyedSubscript:@"bundleID"];
    [v29 setObject:&unk_1F400C538 forKeyedSubscript:@"AppRole"];
    v30 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v4, "displayType"));
    [v29 setObject:v30 forKeyedSubscript:@"Display"];

    [v29 setObject:&unk_1F4011BF8 forKeyedSubscript:@"ScreenWeight"];
    [v29 setObject:&unk_1F400C550 forKeyedSubscript:@"Level"];
    [(PLScreenStateAgent *)self createAirPlayWiFiAccountingEvent:v29];
  }
}

- (unint64_t)convertWindowingMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Invalid"])
  {
    unint64_t v4 = 0;
  }
  else if ([v3 isEqualToString:@"Mirroring"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"Medusa"])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"Chamois"])
  {
    unint64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"NonInteractive"])
  {
    unint64_t v4 = 4;
  }
  else
  {
    uint64_t v5 = PLLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[PLScreenStateAgent convertWindowingMode:]();
    }

    unint64_t v4 = 5;
  }

  return v4;
}

- (unint64_t)convertZoomLevel:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Invalid"])
  {
    unint64_t v4 = 0;
  }
  else if ([v3 isEqualToString:@"LargerText"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"Standard"])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"Dense"])
  {
    unint64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"Denser"])
  {
    unint64_t v4 = 4;
  }
  else
  {
    uint64_t v5 = PLLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[PLScreenStateAgent convertZoomLevel:]();
    }

    unint64_t v4 = 5;
  }

  return v4;
}

- (void)logEventForwardWindowMode:(id)a3
{
  id v22 = a3;
  if ([MEMORY[0x1E4F92A38] isiPad])
  {
    unint64_t v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"WindowMode"];
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v4 withRawData:v22];
    uint64_t v6 = [v22 objectForKeyedSubscript:@"displayName"];
    [v5 setObject:v6 forKeyedSubscript:@"displayType"];

    uint64_t v7 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v8 = [v22 objectForKeyedSubscript:@"windowingMode"];
    double v9 = objc_msgSend(v7, "numberWithUnsignedInteger:", -[PLScreenStateAgent convertWindowingMode:](self, "convertWindowingMode:", v8));
    [v5 setObject:v9 forKeyedSubscript:@"windowingMode"];

    double v10 = (void *)MEMORY[0x1E4F28ED0];
    double v11 = [v22 objectForKeyedSubscript:@"zoomLevel"];
    double v12 = objc_msgSend(v10, "numberWithUnsignedInteger:", -[PLScreenStateAgent convertZoomLevel:](self, "convertZoomLevel:", v11));
    [v5 setObject:v12 forKeyedSubscript:@"zoomLevel"];

    double v13 = [v22 objectForKeyedSubscript:@"canvasSizeHeight"];
    int v14 = [v13 intValue];
    uint64_t v15 = [v22 objectForKeyedSubscript:@"canvasSizeWidth"];
    int v16 = [v15 intValue] * v14;

    uint64_t v17 = [v22 objectForKeyedSubscript:@"nativeSizeHeight"];
    int v18 = [v17 intValue];
    uint64_t v19 = [v22 objectForKeyedSubscript:@"nativeSizeWidth"];
    int v20 = [v19 intValue];

    if (v16 >= 1 && v20 * v18 >= 1)
    {
      double v21 = [MEMORY[0x1E4F28ED0] numberWithDouble:(double)v16 / (double)(v20 * v18)];
      [v5 setObject:v21 forKeyedSubscript:@"canvasRatio"];
    }
    [(PLOperator *)self logEntry:v5];
  }
}

- (void)logEventBackwardIconDragging:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (void *)MEMORY[0x1E4F1C9C8];
  id v5 = a3;
  uint64_t v6 = [v4 now];
  uint64_t v7 = [v6 convertFromSystemToMonotonic];

  uint64_t v8 = [v5 objectForKeyedSubscript:@"Durations"];

  double v9 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"IconDragging"];
  double v10 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __51__PLScreenStateAgent_logEventBackwardIconDragging___block_invoke;
  int v18 = &unk_1E6E48580;
  id v11 = v9;
  id v19 = v11;
  id v12 = v7;
  id v20 = v12;
  id v13 = v10;
  id v21 = v13;
  [v8 enumerateObjectsUsingBlock:&v15];
  if (objc_msgSend(v13, "count", v15, v16, v17, v18))
  {
    id v22 = v11;
    v23[0] = v13;
    int v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    [(PLOperator *)self logEntries:v14 withGroupID:v11];
  }
}

void __51__PLScreenStateAgent_logEventBackwardIconDragging___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F929D0];
  id v4 = a2;
  id v5 = (id)[[v3 alloc] initWithEntryKey:*(void *)(a1 + 32) withDate:*(void *)(a1 + 40)];
  [v5 setObject:v4 forKeyedSubscript:@"Duration"];

  [*(id *)(a1 + 48) addObject:v5];
}

- (void)logEventBackwardAlwaysOnEnableState:(id)a3
{
  id v8 = a3;
  if ([MEMORY[0x1E4F92A38] hasAOD])
  {
    id v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"AlwaysOnEnableState"];
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v4 withRawData:v8];
    uint64_t v6 = [v8 objectForKeyedSubscript:@"focusMode"];
    uint64_t v7 = [v6 length];

    if (v7) {
      [v5 setObject:&unk_1F400C568 forKeyedSubscript:@"focusMode"];
    }
    [(PLOperator *)self logEntry:v5];
  }
}

- (void)logEventBackwardBacklightStateChange:(id)a3
{
  id v9 = a3;
  if (([MEMORY[0x1E4F92A38] hasAOD] & 1) != 0
    || ([MEMORY[0x1E4F92A38] isDeviceClass:102040] & 1) != 0
    || [MEMORY[0x1E4F92A38] isDeviceClass:102041])
  {
    id v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"BacklightStateChange"];
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v4 withRawData:v9];
    uint64_t v6 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v7 = [v9 objectForKeyedSubscript:@"state"];
    id v8 = objc_msgSend(v6, "numberWithUnsignedInt:", -[PLScreenStateAgent GetBacklightState:](self, "GetBacklightState:", v7));
    [v5 setObject:v8 forKeyedSubscript:@"state"];

    [(PLOperator *)self logEntry:v5];
  }
}

- (void)logEventBackwardFlipbookStatistics:(id)a3
{
  id v6 = a3;
  if ([MEMORY[0x1E4F92A38] hasAOD])
  {
    id v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"FlipbookStatistics"];
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v4 withRawData:v6];
    [(PLOperator *)self logEntry:v5];
  }
}

- (id)processQuery:(id)a3 withEntryKey:(id)a4
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([MEMORY[0x1E4F92A38] internalBuild])
  {
    uint64_t v7 = (void *)MEMORY[0x1E4E7EF70]();
    id v8 = PLLogScreenState();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[PLScreenStateAgent processQuery:withEntryKey:].cold.5();
    }

    if (!v5
      || ([v5 objectForKeyedSubscript:@"StartEpochTime"],
          id v9 = objc_claimAutoreleasedReturnValue(),
          BOOL v10 = v9 == 0,
          v9,
          v10))
    {
      id v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[PLScreenStateAgent processQuery:withEntryKey:]();
      }
      id v26 = 0;
    }
    else
    {
      id v11 = (void *)MEMORY[0x1E4F1C9C8];
      id v12 = [v5 objectForKeyedSubscript:@"StartEpochTime"];
      [v12 doubleValue];
      id v13 = objc_msgSend(v11, "dateWithTimeIntervalSince1970:");

      int v14 = [v13 convertFromSystemToMonotonic];
      uint64_t v15 = PLLogScreenState();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[PLScreenStateAgent processQuery:withEntryKey:].cold.4();
      }

      id v16 = objc_alloc(MEMORY[0x1E4F92A90]);
      uint64_t v17 = (void *)MEMORY[0x1E4F28ED0];
      [v14 timeIntervalSince1970];
      int v18 = objc_msgSend(v17, "numberWithDouble:");
      id v19 = (void *)[v16 initWithKey:@"timestamp" withValue:v18 withComparisonOperation:3];

      id v20 = [MEMORY[0x1E4F92AD0] sharedCore];
      id v21 = [v20 storage];
      v37[0] = v19;
      id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
      double v23 = [v21 entriesForKey:v6 withComparisons:v22];

      double v24 = PLLogScreenState();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        -[PLScreenStateAgent processQuery:withEntryKey:]();
      }

      uint64_t v31 = 0;
      uint64_t v32 = &v31;
      uint64_t v33 = 0x3032000000;
      long long v34 = __Block_byref_object_copy__7;
      long long v35 = __Block_byref_object_dispose__7;
      id v36 = (id)objc_opt_new();
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __48__PLScreenStateAgent_processQuery_withEntryKey___block_invoke;
      v28[3] = &unk_1E6E485A8;
      id v29 = v6;
      v30 = &v31;
      [v23 enumerateObjectsUsingBlock:v28];
      double v25 = PLLogScreenState();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        -[PLScreenStateAgent processQuery:withEntryKey:]();
      }

      id v26 = (id)v32[5];
      _Block_object_dispose(&v31, 8);
    }
  }
  else
  {
    id v26 = 0;
  }

  return v26;
}

void __48__PLScreenStateAgent_processQuery_withEntryKey___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 dictionary];
  id v5 = (void *)[v4 mutableCopy];

  id v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v3, "entryID"));
  [v5 setObject:v6 forKeyedSubscript:@"ID"];

  uint64_t v7 = [v3 entryDate];
  id v8 = [v7 convertFromMonotonicToSystem];

  id v9 = (void *)MEMORY[0x1E4F28ED0];
  [v8 timeIntervalSince1970];
  BOOL v10 = objc_msgSend(v9, "numberWithDouble:");
  [v5 setObject:v10 forKeyedSubscript:@"timestamp"];

  id v11 = PLLogScreenState();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = [v3 entryDate];
    int v14 = 138412802;
    uint64_t v15 = v12;
    __int16 v16 = 2112;
    uint64_t v17 = v13;
    __int16 v18 = 2112;
    id v19 = v8;
    _os_log_debug_impl(&dword_1E4220000, v11, OS_LOG_TYPE_DEBUG, "process for query related to %@ is NSDates=%@ and correctedTimeStamp=%@", (uint8_t *)&v14, 0x20u);
  }
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v5];
}

- (void)logAggregateWidgetAdditionAnimation:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D20];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"WidgetAdditionAnimation"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logAggregateWidgetFlipAnimation:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D20];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"WidgetFlipAnimation"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)createCarPlayAccountingEvents:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 objectForKeyedSubscript:@"bundleID"];

  id v14 = [MEMORY[0x1E4F92900] sharedInstance];
  if (v4)
  {
    id v5 = [v3 objectForKeyedSubscript:@"bundleID"];
    uint64_t v17 = v5;
    v18[0] = &unk_1F4011BF8;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    id v7 = [v3 entryDate];
    [v14 createDistributionEventForwardWithDistributionID:27 withChildNodeNameToWeight:v6 withStartDate:v7];

    id v8 = [MEMORY[0x1E4F92900] sharedInstance];
    id v9 = [v3 objectForKeyedSubscript:@"bundleID"];
    uint64_t v15 = v9;
    BOOL v10 = [v3 objectForKeyedSubscript:@"ScreenWeight"];
    __int16 v16 = v10;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    uint64_t v12 = [v3 entryDate];

    [v8 createDistributionEventForwardWithDistributionID:43 withChildNodeNameToWeight:v11 withStartDate:v12];
  }
  else
  {
    id v13 = [v3 entryDate];

    [v14 createDistributionEventForwardWithDistributionID:43 withChildNodeNameToWeight:MEMORY[0x1E4F1CC08] withStartDate:v13];
  }
}

- (void)createAirPlayWiFiAccountingEvent:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 objectForKeyedSubscript:@"bundleID"];

  if (v4)
  {
    id v5 = [MEMORY[0x1E4F92900] sharedInstance];
    id v6 = [v3 objectForKeyedSubscript:@"bundleID"];
    id v9 = v6;
    v10[0] = &unk_1F4011BF8;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    id v8 = [v3 entryDate];
    [v5 createDistributionEventForwardWithDistributionID:36 withChildNodeNameToWeight:v7 withStartDate:v8];
  }
}

- (void)accountWithLayoutEntries:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = [v3 firstObject];
  id v6 = [v5 entryDate];

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v7 = v3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v36 objects:v41 count:16];
  id v9 = v7;
  if (!v8)
  {
LABEL_20:

    goto LABEL_21;
  }
  uint64_t v10 = v8;
  uint64_t v31 = v6;
  uint64_t v11 = *(void *)v37;
  double v12 = 0.0;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v37 != v11) {
        objc_enumerationMutation(v7);
      }
      id v14 = *(void **)(*((void *)&v36 + 1) + 8 * i);
      uint64_t v15 = [v14 objectForKeyedSubscript:@"bundleID"];
      if (v15)
      {
        __int16 v16 = [v14 objectForKeyedSubscript:@"ScreenWeight"];
        [v4 setObject:v16 forKeyedSubscript:v15];

        uint64_t v17 = [v14 objectForKeyedSubscript:@"ScreenWeight"];
        [v17 doubleValue];
        double v12 = v12 + v18;
      }
    }
    uint64_t v10 = [v7 countByEnumeratingWithState:&v36 objects:v41 count:16];
  }
  while (v10);

  if (v12 > 0.0 && v12 != 1.0)
  {
    id v9 = [v4 allKeys];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v19 = [v9 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v33;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v33 != v21) {
            objc_enumerationMutation(v9);
          }
          uint64_t v23 = *(void *)(*((void *)&v32 + 1) + 8 * j);
          double v24 = (void *)MEMORY[0x1E4F28ED0];
          double v25 = [v4 objectForKeyedSubscript:v23];
          [v25 doubleValue];
          double v27 = [v24 numberWithDouble:v26 / v12];
          [v4 setObject:v27 forKeyedSubscript:v23];
        }
        uint64_t v20 = [v9 countByEnumeratingWithState:&v32 objects:v40 count:16];
      }
      while (v20);
      id v6 = v31;
    }
    goto LABEL_20;
  }
LABEL_21:
  uint64_t v28 = [MEMORY[0x1E4F92900] sharedInstance];
  [v28 createDistributionEventForwardWithDistributionID:1 withChildNodeNameToWeight:v4 withStartDate:v6];

  id v29 = [MEMORY[0x1E4F92900] sharedInstance];
  v30 = [v4 allKeys];
  [v29 createQualificationEventForwardWithQualificationID:2 withChildNodeNames:v30 withStartDate:v6];
}

- (void)handleDisplayCallback:(id)a3
{
  id v4 = a3;
  id v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_311_cold_1();
  }

  id v6 = [v4 objectForKey:@"entry"];
  id v7 = [v6 objectForKeyedSubscript:@"Active"];
  -[PLScreenStateAgent setDisplayState:](self, "setDisplayState:", [v7 intValue]);

  uint64_t v8 = PLLogCommon();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[PLScreenStateAgent handleDisplayCallback:](self);
  }

  if (([(PLScreenStateAgent *)self displayState] == 2
     || [(PLScreenStateAgent *)self displayState] == 1)
    && [(PLScreenStateAgent *)self lastDisplayLayoutContainsLockScreen])
  {
    id v9 = PLLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[PLScreenStateAgent handleDisplayCallback:](self);
    }

    uint64_t v10 = [(PLScreenStateAgent *)self lastDisplayLayout];
    [(PLScreenStateAgent *)self logEventForwardMainScreenState:v10];
  }
}

- (void)layoutMonitor:(id)a3 didUpdateDisplayLayout:(id)a4 withContext:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = PLLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[PLScreenStateAgent layoutMonitor:didUpdateDisplayLayout:withContext:]((uint64_t)v7, v8);
  }

  uint64_t v10 = [v8 transitionReason];
  unint64_t v11 = SBSBacklightChangeSourceForDisplayLayoutTransitionReason();

  if (!v11
    || ([(PLScreenStateAgent *)self logEventPointMainBacklightEvent:v7 withContext:v8], v11 > 0x1C)|| ((1 << v11) & 0x1A000050) == 0)
  {
    [(PLScreenStateAgent *)self logEventForwardMainScreenState:v7];
  }
}

- (FBSDisplayLayoutMonitor)mainDisplayMonitor
{
  return (FBSDisplayLayoutMonitor *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMainDisplayMonitor:(id)a3
{
}

- (FBSDisplayLayoutMonitor)airPlayDisplayMonitor
{
  return (FBSDisplayLayoutMonitor *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAirPlayDisplayMonitor:(id)a3
{
}

- (FBSDisplayLayoutMonitor)carPlayDisplayMonitor
{
  return (FBSDisplayLayoutMonitor *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCarPlayDisplayMonitor:(id)a3
{
}

- (PLXPCListenerOperatorComposition)windowModeListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setWindowModeListener:(id)a3
{
}

- (NSMutableDictionary)lastScreenStateEntries
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setLastScreenStateEntries:(id)a3
{
}

- (NSMutableDictionary)lastLayoutMonitorEntries
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setLastLayoutMonitorEntries:(id)a3
{
}

- (PLXPCListenerOperatorComposition)iconDraggingListner
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 104, 1);
}

- (void)setIconDraggingListner:(id)a3
{
}

- (PLXPCListenerOperatorComposition)widgetAdditionAnimationListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 112, 1);
}

- (void)setWidgetAdditionAnimationListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)widgetFlipAnimationListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 120, 1);
}

- (void)setWidgetFlipAnimationListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)springBoardAlwaysOnEnableStateListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 128, 1);
}

- (void)setSpringBoardAlwaysOnEnableStateListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)springBoardBacklightStateChangeListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 136, 1);
}

- (void)setSpringBoardBacklightStateChangeListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)springBoardFlipbookStatisticsListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 144, 1);
}

- (void)setSpringBoardFlipbookStatisticsListener:(id)a3
{
}

- (PLXPCResponderOperatorComposition)springBoardAlwaysOnEnableStateResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 152, 1);
}

- (void)setSpringBoardAlwaysOnEnableStateResponder:(id)a3
{
}

- (PLXPCResponderOperatorComposition)springBoardBacklightStateChangeResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 160, 1);
}

- (void)setSpringBoardBacklightStateChangeResponder:(id)a3
{
}

- (PLXPCResponderOperatorComposition)springBoardFlipbookStatisticsResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 168, 1);
}

- (void)setSpringBoardFlipbookStatisticsResponder:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)displayCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 176, 1);
}

- (void)setDisplayCallback:(id)a3
{
}

- (int)displayState
{
  return self->_displayState;
}

- (void)setDisplayState:(int)a3
{
  self->_displayState = a3;
}

- (FBSDisplayLayout)lastDisplayLayout
{
  return (FBSDisplayLayout *)objc_getProperty(self, a2, 184, 1);
}

- (void)setLastDisplayLayout:(id)a3
{
}

- (BOOL)lastDisplayLayoutContainsLockScreen
{
  return self->_lastDisplayLayoutContainsLockScreen;
}

- (void)setLastDisplayLayoutContainsLockScreen:(BOOL)a3
{
  self->_lastDisplayLayoutContainsLockScreen = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastDisplayLayout, 0);
  objc_storeStrong((id *)&self->_displayCallback, 0);
  objc_storeStrong((id *)&self->_springBoardFlipbookStatisticsResponder, 0);
  objc_storeStrong((id *)&self->_springBoardBacklightStateChangeResponder, 0);
  objc_storeStrong((id *)&self->_springBoardAlwaysOnEnableStateResponder, 0);
  objc_storeStrong((id *)&self->_springBoardFlipbookStatisticsListener, 0);
  objc_storeStrong((id *)&self->_springBoardBacklightStateChangeListener, 0);
  objc_storeStrong((id *)&self->_springBoardAlwaysOnEnableStateListener, 0);
  objc_storeStrong((id *)&self->_widgetFlipAnimationListener, 0);
  objc_storeStrong((id *)&self->_widgetAdditionAnimationListener, 0);
  objc_storeStrong((id *)&self->_iconDraggingListner, 0);
  objc_storeStrong((id *)&self->_lastLayoutMonitorEntries, 0);
  objc_storeStrong((id *)&self->_lastScreenStateEntries, 0);
  objc_storeStrong((id *)&self->_windowModeListener, 0);
  objc_storeStrong((id *)&self->_carPlayDisplayMonitor, 0);
  objc_storeStrong((id *)&self->_airPlayDisplayMonitor, 0);
  objc_storeStrong((id *)&self->_mainDisplayMonitor, 0);
}

void __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Got callback for PLScreenStateAgent_EventForward_WindowMode: %@", v2, v3, v4, v5, v6);
}

void __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_245_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Got callback for PLScreenStateAgent_EventBackward_IconDragging: %@", v2, v3, v4, v5, v6);
}

void __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_250_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Got callback for PLScreenStateAgent_Aggregate_WidgetAdditionAnimation: %@", v2, v3, v4, v5, v6);
}

void __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_255_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Got callback for PLScreenStateAgent_Aggregate_WidgetFlipAnimation: %@", v2, v3, v4, v5, v6);
}

void __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_260_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Got callback for PLScreenStateAgent_EventBackward_AlwaysOnEnableState: %@", v2, v3, v4, v5, v6);
}

void __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_265_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Got callback for PLScreenStateAgent_EventBackward_BacklightStateChange: %@", v2, v3, v4, v5, v6);
}

void __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_270_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Got callback for PLScreenStateAgent_EventBackward_FlipbookStatistics: %@", v2, v3, v4, v5, v6);
}

void __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_276_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "AlwaysOnEnableState query did not succeed", v2, v3, v4, v5, v6);
}

void __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_276_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "AlwaysOnEnableState query received with info: %@", v2, v3, v4, v5, v6);
}

void __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_286_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "BacklightStateChange query did not succeed", v2, v3, v4, v5, v6);
}

void __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_286_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "BacklightStateChange query received with info: %@", v2, v3, v4, v5, v6);
}

void __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_294_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "FlipbookStatistics query did not succeed", v2, v3, v4, v5, v6);
}

void __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_294_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "FlipbookStatistics query received with info: %@", v2, v3, v4, v5, v6);
}

void __46__PLScreenStateAgent_initOperatorDependancies__block_invoke_311_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "userInfo=%@", v2, v3, v4, v5, v6);
}

- (void)postEnhancedScreenStateNotification:currentLayout:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "current FBSDisplayLayoutElement dictionary is the same than the last, not sending a EnhancedScreenState notification", v2, v3, v4, v5, v6);
}

- (void)postEnhancedScreenStateNotification:(os_log_t)log currentLayout:.cold.2(os_log_t log)
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 67109120;
  v1[1] = postEnhancedScreenStateNotification_currentLayout__enhancedScreenStateCounter;
  _os_log_debug_impl(&dword_1E4220000, log, OS_LOG_TYPE_DEBUG, "FBSDisplayLayoutElement notification notified, count is now %d", (uint8_t *)v1, 8u);
}

- (void)postEnhancedScreenStateNotification:currentLayout:.cold.3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "current FBSDisplayLayoutElement dictionary is different than the last, notifying EnhancedScreenState Listener", v2, v3, v4, v5, v6);
}

void __53__PLScreenStateAgent_logEventForwardMainScreenState___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "LayoutEntries is empty", v2, v3, v4, v5, v6);
}

void __53__PLScreenStateAgent_logEventForwardMainScreenState___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "LayoutEntries: %@", v2, v3, v4, v5, v6);
}

void __53__PLScreenStateAgent_logEventForwardMainScreenState___block_invoke_cold_4(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1E4220000, log, OS_LOG_TYPE_ERROR, "Screen State element's bundleID/identifier is nil", buf, 2u);
}

void __53__PLScreenStateAgent_logEventForwardMainScreenState___block_invoke_cold_5(uint8_t *buf, int *a2, os_log_t log)
{
  int v3 = displaySync_block_invoke_screenStateEntriesCounter;
  *(_DWORD *)buf = 67109120;
  *a2 = v3;
  _os_log_debug_impl(&dword_1E4220000, log, OS_LOG_TYPE_DEBUG, "Logged %d FBSDisplayLayoutElement entries", buf, 8u);
}

void __53__PLScreenStateAgent_logEventForwardMainScreenState___block_invoke_cold_6(_DWORD *a1, void *a2, void *a3)
{
  uint64_t v5 = [a2 objectForKeyedSubscript:@"bundleID"];
  *a1 = 138412290;
  *a3 = v5;
  OUTLINED_FUNCTION_7(&dword_1E4220000, v6, v7, "FBSDisplayLayoutElement searching for currentEntry bundleID in last Dictionary: %@");
}

void __53__PLScreenStateAgent_logEventForwardMainScreenState___block_invoke_cold_7(_DWORD *a1, void *a2, void *a3)
{
  uint64_t v5 = [a2 objectForKeyedSubscript:@"bundleID"];
  *a1 = 138412290;
  *a3 = v5;
  OUTLINED_FUNCTION_7(&dword_1E4220000, v6, v7, "FBSDisplayLayoutElement currentEntry bundleID: %@");
}

void __53__PLScreenStateAgent_logEventForwardMainScreenState___block_invoke_cold_8()
{
  _os_feature_enabled_impl();
  [MEMORY[0x1E4F92A38] hasAOD];
  OUTLINED_FUNCTION_9_1(&dword_1E4220000, v0, v1, "dts runtime ff enabled=%d, [PLPlatform hasAOD]=%d]", v2, v3, v4, v5, 0);
}

void __53__PLScreenStateAgent_logEventForwardMainScreenState___block_invoke_cold_9()
{
  [MEMORY[0x1E4F92A38] hasAOD];
  OUTLINED_FUNCTION_6_1();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 8u);
}

void __53__PLScreenStateAgent_logEventForwardMainScreenState___block_invoke_cold_10(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1E4220000, a2, a3, "calling logEventForwardMainScreenState with displayLayout=%@", a5, a6, a7, a8, 2u);
}

- (void)convertWindowingMode:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, " Unknown windowingMode %@", v2, v3, v4, v5, v6);
}

- (void)convertZoomLevel:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, " Unknown zoomLevel %@", v2, v3, v4, v5, v6);
}

- (void)processQuery:withEntryKey:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1E4220000, v0, OS_LOG_TYPE_ERROR, "process for %@ Invalid payload!", v1, 0xCu);
}

- (void)processQuery:withEntryKey:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_5(&dword_1E4220000, v0, v1, "process for %@ output response is =%@.");
}

- (void)processQuery:withEntryKey:.cold.3()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_1E4220000, v0, v1, "selected query entries for %@ are selectedEntries =%@.");
}

- (void)processQuery:withEntryKey:.cold.4()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_1E4220000, v0, v1, "process for %@ queryStartDate is =%@.");
}

- (void)processQuery:withEntryKey:.cold.5()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_1E4220000, v0, v1, "process for %@ Received query with payload=%@.");
}

- (void)handleDisplayCallback:(void *)a1 .cold.1(void *a1)
{
  [a1 displayState];
  [a1 lastDisplayLayoutContainsLockScreen];
  OUTLINED_FUNCTION_10_3();
  OUTLINED_FUNCTION_9_1(&dword_1E4220000, v2, v3, "self.displayState=%d, self.lastDisplayLayoutContainsLockScreen=%d", v4, v5, v6, v7, v8);
}

- (void)handleDisplayCallback:(void *)a1 .cold.2(void *a1)
{
  [a1 displayState];
  [a1 lastDisplayLayoutContainsLockScreen];
  uint64_t v2 = [a1 lastDisplayLayout];
  OUTLINED_FUNCTION_10_3();
  OUTLINED_FUNCTION_6_1();
  _os_log_debug_impl(v3, v4, v5, v6, v7, 0x18u);
}

- (void)layoutMonitor:(uint64_t)a1 didUpdateDisplayLayout:(void *)a2 withContext:.cold.1(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 transitionReason];
  id v9 = [a2 transitionReasons];
  OUTLINED_FUNCTION_6_1();
  _os_log_debug_impl(v4, v5, v6, v7, v8, 0x2Au);
}

@end