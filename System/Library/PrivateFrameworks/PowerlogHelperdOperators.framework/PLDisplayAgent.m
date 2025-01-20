@interface PLDisplayAgent
+ (BOOL)shouldLogALSPowerSaved;
+ (BOOL)shouldLogAPL;
+ (BOOL)shouldLogBLR;
+ (BOOL)shouldLogBacklightControl;
+ (BOOL)shouldLogDisplay;
+ (BOOL)shouldLogFromDCP;
+ (BOOL)shouldLogKeyboardBrightness;
+ (BOOL)shouldLogLCD;
+ (BOOL)shouldLogLuxStats;
+ (BOOL)shouldLogTouch;
+ (BOOL)shouldLogUserBrightness;
+ (BOOL)shouldModelPowerFromAPL;
+ (BOOL)shouldModelPowerFromIOMFB;
+ (id)dcpSubFrameMap;
+ (id)entryAggregateDefinitionScreenOn;
+ (id)entryAggregateDefinitionUserTouch;
+ (id)entryAggregateDefinitions;
+ (id)entryEventBackwardDefinitionALSSamplesBeforeWake;
+ (id)entryEventBackwardDefinitionALSThreshold;
+ (id)entryEventBackwardDefinitionAPLStats;
+ (id)entryEventBackwardDefinitionAZLSnapshots;
+ (id)entryEventBackwardDefinitionAZLStats;
+ (id)entryEventBackwardDefinitionAmbientLight;
+ (id)entryEventBackwardDefinitionBlueLightParameters;
+ (id)entryEventBackwardDefinitionCurveUpdate;
+ (id)entryEventBackwardDefinitionDCPAODstats;
+ (id)entryEventBackwardDefinitionHarmonyParameters;
+ (id)entryEventBackwardDefinitionRampInfo;
+ (id)entryEventBackwardDefinitionTouch;
+ (id)entryEventBackwardDefinitions;
+ (id)entryEventForwardDefinitionALSEnabled;
+ (id)entryEventForwardDefinitionALSLux;
+ (id)entryEventForwardDefinitionALSPowerSaved;
+ (id)entryEventForwardDefinitionALSUserPreferences;
+ (id)entryEventForwardDefinitionBlueLightReductionStatus;
+ (id)entryEventForwardDefinitionColorAdaptationMode;
+ (id)entryEventForwardDefinitionDisplay;
+ (id)entryEventForwardDefinitionDisplayBacklight;
+ (id)entryEventForwardDefinitionLinearBrightness;
+ (id)entryEventForwardDefinitionLuxStats;
+ (id)entryEventForwardDefinitions;
+ (id)entryEventIntervalDefinitions;
+ (id)entryEventNoneDefinitionPanelStats;
+ (id)entryEventNoneDefinitions;
+ (id)entryEventPointDefinitionBacklightControl;
+ (id)entryEventPointDefinitionDisplay;
+ (id)entryEventPointDefinitionKeyboardBrightness;
+ (id)entryEventPointDefinitionMultitouch;
+ (id)entryEventPointDefinitionUserBrightness;
+ (id)entryEventPointDefinitions;
+ (void)load;
- (BOOL)ShouldLogAmbient;
- (BOOL)alsOn;
- (BOOL)alsPluginKeyRegistered;
- (BOOL)firstEntryOnInit;
- (BOOL)isAlsEnabled;
- (BOOL)isDisplayHighBrightness;
- (BOOL)isDisplayOnNow;
- (BOOL)isFirstTimeModeling;
- (BOOL)isMIEActive;
- (BOOL)isMultitouchLoggingEnabled;
- (BOOL)listenForAlsPluginMatchingKeys:(__IOHIDEventSystemClient *)a3 withKeys:(const void *)a4 withValues:(const void *)a5 withCount:(unint64_t)a6;
- (BOOL)supportsFinalBrightnessCommit;
- (BOOL)updateDisplayIOReportStats:(id)a3 logZeroFramesOnlyOnce:(BOOL)a4;
- (BOOL)userTouch;
- (BOOL)wasDisplayOn;
- (BrightnessSystemClient)brightnessSystemClient;
- (CBAdaptationClient)colorAdaptationClient;
- (KeyboardBrightnessClient)kbClient;
- (NSDate)pendingALSLuxEntryDate;
- (NSDate)pendingBacklightEntryDate;
- (NSDate)pendingKeyboardBrightnessDate;
- (NSDate)userTouchDownTime;
- (NSDictionary)displayPowerModel;
- (NSMutableArray)afkEndpoints;
- (NSMutableArray)displayStateChanges;
- (NSMutableDictionary)pendingBacklightEntry;
- (NSString)lastForegroundAppAPL;
- (PLDisplayAgent)init;
- (PLDisplayIOReportAODStats)displayIOReportAODStats;
- (PLDisplayIOReportStats)displayIOReportAZLSnapshots;
- (PLDisplayIOReportStats)displayIOReportAZLStats;
- (PLDisplayIOReportStats)displayIOReportStats;
- (PLEntry)bluelightStatusEntry;
- (PLEntryNotificationOperatorComposition)ApplicationNotification;
- (PLEntryNotificationOperatorComposition)IOMFBScanoutNotification;
- (PLEntryNotificationOperatorComposition)aodstateChangedNotification;
- (PLEntryNotificationOperatorComposition)batteryLevelChanged;
- (PLEventForwardDisplayEntry)uAmpsEntry;
- (PLIOKitOperatorComposition)iokitBacklight;
- (PLIOKitOperatorComposition)iokitBacklightControl;
- (PLIOKitOperatorComposition)iokitBacklightDCP;
- (PLIOKitOperatorComposition)iokitDisplay;
- (PLIOKitOperatorComposition)iokitKeyboardBrightness;
- (PLIOKitOperatorComposition)iokitLCD;
- (PLIOKitOperatorComposition)iokitTouch;
- (PLMonotonicTimer)logLastALSPowerSavedTimer;
- (PLNSNotificationOperatorComposition)thermalMonitorListener;
- (PLTimer)AZLSnapshotsTimer;
- (PLTimer)alsLuxFilterTimer;
- (PLTimer)backlightFilterTimer;
- (PLTimer)bluelightFilterTimer;
- (PLTimer)dcpTimeoffsetCalibTimer;
- (PLTimer)keyboardBrightnessFilterTimer;
- (PLTimer)uAmpsFilterTimer;
- (PLXPCListenerOperatorComposition)multitouchXPCListener;
- (__IOHIDEventSystemClient)ambientLightSensorHIDClientRef;
- (__IOHIDEventSystemClient)setUpIOHIDAmbientLightSensorSystemClient;
- (__IOHIDEventSystemClient)setUpIOHIDTouchSystemClient;
- (__IOHIDEventSystemClient)touchHIDClientRef;
- (__IOMobileFramebuffer)frameBuffer;
- (double)averageFrameRateFromIOMFBScanout:(id)a3;
- (double)calculatePowerFromAPL:(double)a3 withAvgRed:(double)a4 withAvgGreen:(double)a5 withAvgBlue:(double)a6;
- (double)currAFKSystemTimeOffset;
- (double)currAFKSystemTimestamp;
- (double)currMonoTimestamp;
- (double)displayLux;
- (double)displaymNits;
- (double)lastALSPowerSaved;
- (double)lastBuiltinDisplayBrightness;
- (double)lastBuiltinDisplayLux;
- (double)lastBuiltinDisplaySliderValue;
- (double)lastBuiltinDisplayTime;
- (double)pendingKeyboardBrightnessValue;
- (double)uAmpsToDisplayPower:(double)a3;
- (float)autobrightnessmNits;
- (float)realmNits;
- (id)getIOMFBSubFrameMap;
- (id)trimConditionsForEntryKey:(id)a3 forTrimDate:(id)a4;
- (int)lastScreenState;
- (int64_t)AZLSnapshotsEntries;
- (int64_t)getBuiltInDisplayID:(id)a3;
- (int64_t)lastRearLuxValue;
- (unint64_t)getBacklightEnabledTimestamp:(unsigned int)a3;
- (unint64_t)lastALSLux;
- (unint64_t)pendingALSLux;
- (void)__FrameBufferEventCallback:(__IOMobileFramebuffer *)a3;
- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvent:(id)a5;
- (void)cleanUpAFKInterfaces;
- (void)clearDisplayAccountingEvents;
- (void)dealloc;
- (void)extractDataWithEntry:(id)a3 withColName:(id)a4 withDataArray:(id)a5;
- (void)fillInBuiltinDisplayBrightnessParameters:(id)a3;
- (void)handleAFKInterfaceIOServiceCallback:(unsigned int)a3;
- (void)handleAFKInterfaceMsg:(id)a3;
- (void)handleBrightnessClientNotification:(id)a3 withValue:(id)a4;
- (void)handleSBC;
- (void)init;
- (void)initAODState:(int64_t)a3;
- (void)initOperatorDependancies;
- (void)initTaskOperatorDependancies;
- (void)log;
- (void)logAODChange;
- (void)logAODState:(int)a3;
- (void)logBlueLightDataWithDictionary:(id)a3;
- (void)logBrightnessDataWithEntryKey:(id)a3 withColName:(id)a4 withValue:(id)a5;
- (void)logDisplayAPL;
- (void)logDisplayAZL;
- (void)logDisplayEntry:(id)a3;
- (void)logEventBackwardALSSamplesBeforeWake:(id)a3;
- (void)logEventBackwardALSThreshold:(id)a3;
- (void)logEventBackwardAmbientLight:(id)a3;
- (void)logEventBackwardCurveUpdate:(id)a3;
- (void)logEventBackwardRampInfo:(id)a3;
- (void)logEventBackwardTouch;
- (void)logEventBackwardUserTouch:(BOOL)a3;
- (void)logEventForwardALSEnabled;
- (void)logEventForwardALSLux:(unint64_t)a3;
- (void)logEventForwardALSUserPreferences;
- (void)logEventForwardALSUserPreferencesEntryWithLux:(id)a3;
- (void)logEventForwardALSUserPreferencesWithCurrLux;
- (void)logEventForwardColorAdaptationMode;
- (void)logEventForwardDisplay;
- (void)logEventForwardDisplayBacklight;
- (void)logEventForwardDisplayWithRawData:(id)a3 withDate:(id)a4;
- (void)logEventForwardExtendedALSUserPreferences:(id)a3;
- (void)logEventForwardLuxStats:(id)a3;
- (void)logEventNonePanelStats;
- (void)logEventPointDisplay;
- (void)logEventPointDisplayBacklight;
- (void)logEventPointDisplayBacklightWithState:(unint64_t)a3;
- (void)logEventPointDisplayForBlock:(id)a3 isActive:(int)a4;
- (void)logEventPointDisplayMIE;
- (void)logEventPointKeyboardBrightness:(double)a3;
- (void)logEventPointKeyboardBrightness:(double)a3 withDate:(id)a4;
- (void)logEventPointMultitouchWithPayload:(id)a3;
- (void)logEventPointUserBrightnessCommitted:(double)a3;
- (void)modelDisplayPower:(id)a3;
- (void)modelDisplayPowerFromIOMFB:(id)a3;
- (void)modelDynamicDisplayPower:(id)a3;
- (void)modelDynamicDisplayPowerFromAPL:(id)a3;
- (void)qualifyDisplayPower:(id)a3;
- (void)reArmCallback;
- (void)reArmUAmpsCallback;
- (void)setAZLSnapshotsEntries:(int64_t)a3;
- (void)setAZLSnapshotsTimer:(id)a3;
- (void)setAfkEndpoints:(id)a3;
- (void)setAlsLuxFilterTimer:(id)a3;
- (void)setAlsOn:(BOOL)a3;
- (void)setAlsPluginKeyRegistered:(BOOL)a3;
- (void)setAmbientLightSensorHIDClientRef:(__IOHIDEventSystemClient *)a3;
- (void)setAodstateChangedNotification:(id)a3;
- (void)setApplicationNotification:(id)a3;
- (void)setAutobrightnessmNits:(float)a3;
- (void)setBacklightFilterTimer:(id)a3;
- (void)setBatteryLevelChanged:(id)a3;
- (void)setBluelightFilterTimer:(id)a3;
- (void)setBluelightStatusEntry:(id)a3;
- (void)setBrightnessSystemClient:(id)a3;
- (void)setColorAdaptationClient:(id)a3;
- (void)setCurrAFKSystemTimeOffset:(double)a3;
- (void)setCurrAFKSystemTimestamp:(double)a3;
- (void)setCurrMonoTimestamp:(double)a3;
- (void)setDcpTimeoffsetCalibTimer:(id)a3;
- (void)setDisplayIOReportAODStats:(id)a3;
- (void)setDisplayIOReportAZLSnapshots:(id)a3;
- (void)setDisplayIOReportAZLStats:(id)a3;
- (void)setDisplayIOReportStats:(id)a3;
- (void)setDisplayLux:(double)a3;
- (void)setDisplayStateChanges:(id)a3;
- (void)setDisplaymNits:(double)a3;
- (void)setFirstEntryOnInit:(BOOL)a3;
- (void)setFrameBuffer:(__IOMobileFramebuffer *)a3;
- (void)setIOMFBScanoutNotification:(id)a3;
- (void)setIsDisplayHighBrightness:(BOOL)a3;
- (void)setIsDisplayOnNow:(BOOL)a3;
- (void)setIsFirstTimeModeling:(BOOL)a3;
- (void)setIsMIEActive:(BOOL)a3;
- (void)setIsMultitouchLoggingEnabled:(BOOL)a3;
- (void)setKbClient:(id)a3;
- (void)setKeyboardBrightnessFilterTimer:(id)a3;
- (void)setLastALSLux:(unint64_t)a3;
- (void)setLastALSPowerSaved:(double)a3;
- (void)setLastBuiltinDisplayBrightness:(double)a3;
- (void)setLastBuiltinDisplayLux:(double)a3;
- (void)setLastBuiltinDisplaySliderValue:(double)a3;
- (void)setLastBuiltinDisplayTime:(double)a3;
- (void)setLastForegroundAppAPL:(id)a3;
- (void)setLastRearLuxValue:(int64_t)a3;
- (void)setLastScreenState:(int)a3;
- (void)setLogLastALSPowerSavedTimer:(id)a3;
- (void)setMultitouchXPCListener:(id)a3;
- (void)setPendingALSLux:(unint64_t)a3;
- (void)setPendingALSLuxEntryDate:(id)a3;
- (void)setPendingBacklightEntry:(id)a3;
- (void)setPendingBacklightEntryDate:(id)a3;
- (void)setPendingKeyboardBrightnessDate:(id)a3;
- (void)setPendingKeyboardBrightnessValue:(double)a3;
- (void)setRealmNits:(float)a3;
- (void)setShouldLogAmbient:(BOOL)a3;
- (void)setSupportsFinalBrightnessCommit:(BOOL)a3;
- (void)setThermalMonitorListener:(id)a3;
- (void)setTouchHIDClientRef:(__IOHIDEventSystemClient *)a3;
- (void)setUAmpsEntry:(id)a3;
- (void)setUAmpsFilterTimer:(id)a3;
- (void)setUserTouch:(BOOL)a3;
- (void)setUserTouchDownTime:(id)a3;
- (void)setWasDisplayOn:(BOOL)a3;
- (void)updateLastForegroundAppAPL:(id)a3;
@end

@implementation PLDisplayAgent

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLDisplayAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventNoneDefinitions
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"PanelStats";
  objc_super v2 = +[PLDisplayAgent entryEventNoneDefinitionPanelStats];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

+ (id)entryEventNoneDefinitionPanelStats
{
  v25[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isMac])
  {
    objc_super v2 = (void *)MEMORY[0x1E4F1CC08];
  }
  else
  {
    v24[0] = *MEMORY[0x1E4F92C50];
    uint64_t v22 = *MEMORY[0x1E4F92CD0];
    v23 = &unk_1F4012148;
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    v25[0] = v19;
    v24[1] = *MEMORY[0x1E4F92CA8];
    v20[0] = @"B_input";
    v18 = [MEMORY[0x1E4F929D8] sharedInstance];
    v17 = objc_msgSend(v18, "commonTypeDict_RealFormat");
    v21[0] = v17;
    v20[1] = @"B_min";
    v16 = [MEMORY[0x1E4F929D8] sharedInstance];
    v15 = objc_msgSend(v16, "commonTypeDict_RealFormat");
    v21[1] = v15;
    v20[2] = @"I_input";
    v14 = [MEMORY[0x1E4F929D8] sharedInstance];
    v13 = objc_msgSend(v14, "commonTypeDict_RealFormat");
    v21[2] = v13;
    v20[3] = @"I_nominal";
    v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    v4 = objc_msgSend(v3, "commonTypeDict_RealFormat");
    v21[3] = v4;
    v20[4] = @"I_threshold";
    v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    v6 = objc_msgSend(v5, "commonTypeDict_RealFormat");
    v21[4] = v6;
    v20[5] = @"Scalar";
    v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    v8 = objc_msgSend(v7, "commonTypeDict_RealFormat");
    v21[5] = v8;
    v20[6] = @"Slope";
    v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    v10 = objc_msgSend(v9, "commonTypeDict_RealFormat");
    v21[6] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:7];
    v25[1] = v11;
    objc_super v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
  }
  return v2;
}

+ (id)entryEventPointDefinitions
{
  v10[5] = *MEMORY[0x1E4F143B8];
  v9[0] = @"Display";
  objc_super v2 = +[PLDisplayAgent entryEventPointDefinitionDisplay];
  v10[0] = v2;
  v9[1] = @"UserBrightness";
  v3 = +[PLDisplayAgent entryEventPointDefinitionUserBrightness];
  v10[1] = v3;
  v9[2] = @"Multitouch";
  v4 = +[PLDisplayAgent entryEventPointDefinitionMultitouch];
  v10[2] = v4;
  v9[3] = @"BacklightControl";
  v5 = +[PLDisplayAgent entryEventPointDefinitionBacklightControl];
  v10[3] = v5;
  v9[4] = @"KeyboardBrightness";
  v6 = +[PLDisplayAgent entryEventPointDefinitionKeyboardBrightness];
  v10[4] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:5];

  return v7;
}

+ (id)entryEventPointDefinitionDisplay
{
  v17[2] = *MEMORY[0x1E4F143B8];
  if (+[PLDisplayAgent shouldLogDisplay]
    || +[PLDisplayAgent shouldLogLCD])
  {
    v16[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CD8];
    v14[0] = *MEMORY[0x1E4F92CD0];
    v14[1] = v2;
    v15[0] = &unk_1F4012158;
    v15[1] = &unk_1F40142A8;
    uint64_t v3 = *MEMORY[0x1E4F92CF8];
    v14[2] = *MEMORY[0x1E4F92CE0];
    v14[3] = v3;
    v15[2] = @"Block";
    v15[3] = &unk_1F400DA20;
    v14[4] = *MEMORY[0x1E4F92C40];
    v15[4] = MEMORY[0x1E4F1CC38];
    v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:5];
    v16[1] = *MEMORY[0x1E4F92CA8];
    v17[0] = v4;
    v12[0] = @"Block";
    v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    v6 = objc_msgSend(v5, "commonTypeDict_StringFormat");
    v12[1] = @"Active";
    v13[0] = v6;
    v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    v13[1] = v8;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
    v17[1] = v9;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  }
  else
  {
    v10 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v10;
}

+ (id)entryEventPointDefinitionUserBrightness
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  if (+[PLDisplayAgent shouldLogUserBrightness])
  {
    v15[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CD8];
    v13[0] = *MEMORY[0x1E4F92CD0];
    v13[1] = v2;
    v14[0] = &unk_1F4012148;
    v14[1] = &unk_1F40142C0;
    void v13[2] = *MEMORY[0x1E4F92CB8];
    v14[2] = MEMORY[0x1E4F1CC28];
    uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
    v16[0] = v3;
    v15[1] = *MEMORY[0x1E4F92CA8];
    v11 = @"UserBrightness";
    uint64_t v4 = *MEMORY[0x1E4F92D18];
    v9[0] = *MEMORY[0x1E4F92D10];
    v9[1] = v4;
    v10[0] = &unk_1F400DA38;
    v10[1] = @"%";
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
    v12 = v5;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    v16[1] = v6;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  }
  else
  {
    v7 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v7;
}

+ (id)entryEventPointDefinitionMultitouch
{
  v37[2] = *MEMORY[0x1E4F143B8];
  if (+[PLDisplayAgent shouldLogTouch])
  {
    if ([MEMORY[0x1E4F92A38] hasOrb])
    {
      v36[0] = *MEMORY[0x1E4F92C50];
      uint64_t v2 = *MEMORY[0x1E4F92CB8];
      v34[0] = *MEMORY[0x1E4F92CD0];
      v34[1] = v2;
      v35[0] = &unk_1F4012168;
      v35[1] = MEMORY[0x1E4F1CC28];
      uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];
      v37[0] = v18;
      v36[1] = *MEMORY[0x1E4F92CA8];
      v32[0] = @"fingerNum";
      v17 = [MEMORY[0x1E4F929D8] sharedInstance];
      v25 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
      v33[0] = v25;
      v32[1] = @"peak";
      v24 = [MEMORY[0x1E4F929D8] sharedInstance];
      v23 = objc_msgSend(v24, "commonTypeDict_IntegerFormat");
      v33[1] = v23;
      v32[2] = @"peakMillimetersFromEdge";
      uint64_t v22 = [MEMORY[0x1E4F929D8] sharedInstance];
      v21 = objc_msgSend(v22, "commonTypeDict_RealFormat");
      v33[2] = v21;
      v32[3] = @"peakProximity";
      v20 = [MEMORY[0x1E4F929D8] sharedInstance];
      v19 = objc_msgSend(v20, "commonTypeDict_RealFormat");
      v33[3] = v19;
      v32[4] = @"peakMajorRadius";
      uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
      uint64_t v4 = objc_msgSend(v3, "commonTypeDict_RealFormat");
      v33[4] = v4;
      v32[5] = @"peakMinorRadius";
      v5 = [MEMORY[0x1E4F929D8] sharedInstance];
      v6 = objc_msgSend(v5, "commonTypeDict_RealFormat");
      v33[5] = v6;
      v32[6] = @"touchStartTime";
      v7 = [MEMORY[0x1E4F929D8] sharedInstance];
      v8 = objc_msgSend(v7, "commonTypeDict_RealFormat");
      v33[6] = v8;
      v32[7] = @"touchStopTime";
      v9 = [MEMORY[0x1E4F929D8] sharedInstance];
      v10 = objc_msgSend(v9, "commonTypeDict_RealFormat");
      v33[7] = v10;
      v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:8];
      v37[1] = v11;
      v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];

      v13 = v17;
      v14 = (void *)v18;
    }
    else
    {
      v30[0] = *MEMORY[0x1E4F92C50];
      uint64_t v15 = *MEMORY[0x1E4F92CB8];
      v28[0] = *MEMORY[0x1E4F92CD0];
      v28[1] = v15;
      v29[0] = &unk_1F4012158;
      v29[1] = MEMORY[0x1E4F1CC28];
      v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
      v31[0] = v14;
      v30[1] = *MEMORY[0x1E4F92CA8];
      v26[0] = @"fingerNum";
      v13 = [MEMORY[0x1E4F929D8] sharedInstance];
      v25 = objc_msgSend(v13, "commonTypeDict_IntegerFormat");
      v27[0] = v25;
      v26[1] = @"peakProximity";
      v24 = [MEMORY[0x1E4F929D8] sharedInstance];
      v23 = objc_msgSend(v24, "commonTypeDict_IntegerFormat");
      v27[1] = v23;
      v26[2] = @"peakProximityMillimetersFromEdge";
      uint64_t v22 = [MEMORY[0x1E4F929D8] sharedInstance];
      v21 = objc_msgSend(v22, "commonTypeDict_RealFormat");
      v27[2] = v21;
      v26[3] = @"peakProximityMajorRadius";
      v20 = [MEMORY[0x1E4F929D8] sharedInstance];
      v19 = objc_msgSend(v20, "commonTypeDict_RealFormat");
      v27[3] = v19;
      v26[4] = @"peakProximityMinorRadius";
      uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
      uint64_t v4 = objc_msgSend(v3, "commonTypeDict_RealFormat");
      v27[4] = v4;
      v26[5] = @"touchStartTime";
      v5 = [MEMORY[0x1E4F929D8] sharedInstance];
      v6 = objc_msgSend(v5, "commonTypeDict_RealFormat");
      v27[5] = v6;
      v26[6] = @"touchStopTime";
      v7 = [MEMORY[0x1E4F929D8] sharedInstance];
      v8 = objc_msgSend(v7, "commonTypeDict_RealFormat");
      v27[6] = v8;
      v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:7];
      v31[1] = v9;
      v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];
    }
  }
  else
  {
    v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventPointDefinitionBacklightControl
{
  void v13[2] = *MEMORY[0x1E4F143B8];
  if (+[PLDisplayAgent shouldLogBacklightControl])
  {
    v12[0] = *MEMORY[0x1E4F92C50];
    uint64_t v10 = *MEMORY[0x1E4F92CD0];
    v11 = &unk_1F4012148;
    uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    v13[0] = v2;
    v12[1] = *MEMORY[0x1E4F92CA8];
    v8 = @"backlightEnabledTimestamp";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
    v9 = v4;
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    v13[1] = v5;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  }
  else
  {
    v6 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v6;
}

+ (id)entryEventPointDefinitionKeyboardBrightness
{
  void v13[2] = *MEMORY[0x1E4F143B8];
  if (+[PLDisplayAgent shouldLogKeyboardBrightness])
  {
    v12[0] = *MEMORY[0x1E4F92C50];
    uint64_t v10 = *MEMORY[0x1E4F92CD0];
    v11 = &unk_1F4012148;
    uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    v13[0] = v2;
    v12[1] = *MEMORY[0x1E4F92CA8];
    v8 = @"KeyboardBrightness";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
    v9 = v4;
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    v13[1] = v5;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  }
  else
  {
    v6 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v6;
}

+ (id)entryEventForwardDefinitions
{
  v15[10] = *MEMORY[0x1E4F143B8];
  v14[0] = @"Display";
  v13 = +[PLDisplayAgent entryEventForwardDefinitionDisplay];
  v15[0] = v13;
  v14[1] = @"DisplayBacklight";
  uint64_t v2 = +[PLDisplayAgent entryEventForwardDefinitionDisplayBacklight];
  v15[1] = v2;
  v14[2] = @"ALSUserPreferences";
  uint64_t v3 = +[PLDisplayAgent entryEventForwardDefinitionALSUserPreferences];
  void v15[2] = v3;
  void v14[3] = @"ALSEnabled";
  uint64_t v4 = +[PLDisplayAgent entryEventForwardDefinitionALSEnabled];
  v15[3] = v4;
  v14[4] = @"ALSPowerSaved";
  v5 = +[PLDisplayAgent entryEventForwardDefinitionALSPowerSaved];
  v15[4] = v5;
  void v14[5] = @"BlueLightReductionStatus";
  v6 = +[PLDisplayAgent entryEventForwardDefinitionBlueLightReductionStatus];
  void v15[5] = v6;
  v14[6] = @"CAModeEnabled";
  v7 = +[PLDisplayAgent entryEventForwardDefinitionColorAdaptationMode];
  v15[6] = v7;
  v14[7] = @"ALSLux";
  v8 = +[PLDisplayAgent entryEventForwardDefinitionALSLux];
  v15[7] = v8;
  v14[8] = @"LinearBrightness";
  v9 = +[PLDisplayAgent entryEventForwardDefinitionLinearBrightness];
  v15[8] = v9;
  v14[9] = @"LuxStats";
  uint64_t v10 = +[PLDisplayAgent entryEventForwardDefinitionLuxStats];
  v15[9] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:10];

  return v11;
}

+ (id)entryEventForwardDefinitionDisplay
{
  v54[2] = *MEMORY[0x1E4F143B8];
  if (+[PLDisplayAgent shouldLogDisplay])
  {
    v53[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CD8];
    v51[0] = *MEMORY[0x1E4F92CD0];
    v51[1] = v2;
    v52[0] = &unk_1F4012178;
    v52[1] = &unk_1F40142D8;
    v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:v51 count:2];
    v54[0] = v38;
    v53[1] = *MEMORY[0x1E4F92CA8];
    v49[0] = @"Brightness";
    BOOL v3 = +[PLDisplayAgent shouldLogFromDCP];
    uint64_t v4 = (void *)MEMORY[0x1E4F92D10];
    BOOL v37 = v3;
    if (v3)
    {
      v36 = [MEMORY[0x1E4F929D8] sharedInstance];
      uint64_t v5 = objc_msgSend(v36, "commonTypeDict_RealFormat");
    }
    else
    {
      uint64_t v7 = *MEMORY[0x1E4F92D18];
      v47[0] = *MEMORY[0x1E4F92D10];
      v47[1] = v7;
      v48[0] = &unk_1F400DA38;
      v48[1] = @"%";
      v47[2] = *MEMORY[0x1E4F92C48];
      v48[2] = MEMORY[0x1E4F1CC38];
      uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:3];
      v36 = (void *)v5;
    }
    v29 = (void *)v5;
    v50[0] = v5;
    v49[1] = @"SliderValue";
    BOOL v8 = +[PLDisplayAgent shouldLogFromDCP];
    v9 = &unk_1F400DA50;
    uint64_t v10 = (uint64_t *)MEMORY[0x1E4F92CA0];
    BOOL v35 = v8;
    if (v8)
    {
      v34 = [MEMORY[0x1E4F929D8] sharedInstance];
      uint64_t v11 = objc_msgSend(v34, "commonTypeDict_IntegerFormat");
    }
    else
    {
      uint64_t v12 = *MEMORY[0x1E4F92CA0];
      v45[0] = *v4;
      v45[1] = v12;
      v46[0] = &unk_1F400DA50;
      v46[1] = &unk_1F40142F0;
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:2];
      v34 = (void *)v11;
    }
    v28 = (void *)v11;
    v50[1] = v11;
    v49[2] = @"lux";
    v33 = [MEMORY[0x1E4F929D8] sharedInstance];
    v32 = objc_msgSend(v33, "commonTypeDict_IntegerFormat");
    v50[2] = v32;
    v49[3] = @"iDAC";
    BOOL v31 = +[PLDisplayAgent shouldLogFromDCP];
    if (v31)
    {
      v30 = [MEMORY[0x1E4F929D8] sharedInstance];
      uint64_t v13 = objc_msgSend(v30, "commonTypeDict_IntegerFormat");
    }
    else
    {
      uint64_t v14 = *v10;
      v43[0] = *v4;
      v43[1] = v14;
      v44[0] = &unk_1F400DA50;
      v44[1] = &unk_1F4014308;
      uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:v43 count:2];
      v30 = (void *)v13;
    }
    v50[3] = v13;
    v49[4] = @"mNits";
    BOOL v15 = +[PLDisplayAgent shouldLogFromDCP];
    if (v15)
    {
      v16 = [MEMORY[0x1E4F929D8] sharedInstance];
      uint64_t v17 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
    }
    else
    {
      uint64_t v18 = *v10;
      v41[0] = *v4;
      v41[1] = v18;
      v42[0] = &unk_1F400DA50;
      v42[1] = &unk_1F4014320;
      uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:2];
      v16 = (void *)v17;
    }
    v19 = (void *)v17;
    v50[4] = v17;
    v49[5] = @"uAmps";
    BOOL v20 = +[PLDisplayAgent shouldLogFromDCP];
    if (v20)
    {
      v9 = [MEMORY[0x1E4F929D8] sharedInstance];
      v21 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    }
    else
    {
      uint64_t v22 = *v10;
      v39[0] = *v4;
      v39[1] = v22;
      v40[0] = &unk_1F400DA50;
      v40[1] = &unk_1F4014338;
      v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:2];
    }
    v50[5] = v21;
    v49[6] = @"EDRHeadroom";
    v23 = [MEMORY[0x1E4F929D8] sharedInstance];
    v24 = objc_msgSend(v23, "commonTypeDict_IntegerFormat");
    v50[6] = v24;
    v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:7];
    v54[1] = v25;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:2];

    if (v20)
    {

      v21 = v9;
    }

    if (v15) {
    if (v31)
    }

    if (v35) {
    if (v37)
    }
  }
  else
  {
    v6 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v6;
}

+ (id)entryEventForwardDefinitionDisplayBacklight
{
  void v13[2] = *MEMORY[0x1E4F143B8];
  if (+[PLUtilities isPowerlogHelperd])
  {
    v12[0] = *MEMORY[0x1E4F92C50];
    uint64_t v10 = *MEMORY[0x1E4F92CD0];
    uint64_t v11 = &unk_1F4012148;
    uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    v13[0] = v2;
    v12[1] = *MEMORY[0x1E4F92CA8];
    BOOL v8 = @"DisplayPower";
    BOOL v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_RealFormat");
    v9 = v4;
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    v13[1] = v5;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  }
  else
  {
    v6 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v6;
}

+ (id)entryEventForwardDefinitionALSUserPreferences
{
  v104[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] isMac])
  {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CC08];
  }
  else
  {
    v103[0] = *MEMORY[0x1E4F92C50];
    uint64_t v3 = *MEMORY[0x1E4F92CF8];
    v101[0] = *MEMORY[0x1E4F92CD0];
    v101[1] = v3;
    v102[0] = &unk_1F4012188;
    v102[1] = &unk_1F400DA68;
    v101[2] = *MEMORY[0x1E4F92CF0];
    v102[2] = &unk_1F400DA80;
    v98 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v102 forKeys:v101 count:3];
    v104[0] = v98;
    v103[1] = *MEMORY[0x1E4F92CA8];
    v99[0] = @"E0a";
    v97 = [MEMORY[0x1E4F929D8] sharedInstance];
    v96 = objc_msgSend(v97, "commonTypeDict_IntegerFormat");
    v100[0] = v96;
    v99[1] = @"E0b";
    v95 = [MEMORY[0x1E4F929D8] sharedInstance];
    v94 = objc_msgSend(v95, "commonTypeDict_IntegerFormat");
    v100[1] = v94;
    v99[2] = @"E1";
    v93 = [MEMORY[0x1E4F929D8] sharedInstance];
    v92 = objc_msgSend(v93, "commonTypeDict_IntegerFormat");
    v100[2] = v92;
    v99[3] = @"E2";
    v91 = [MEMORY[0x1E4F929D8] sharedInstance];
    v90 = objc_msgSend(v91, "commonTypeDict_IntegerFormat");
    v100[3] = v90;
    v99[4] = @"L0a";
    v89 = [MEMORY[0x1E4F929D8] sharedInstance];
    v88 = objc_msgSend(v89, "commonTypeDict_RealFormat");
    v100[4] = v88;
    v99[5] = @"L0b";
    v87 = [MEMORY[0x1E4F929D8] sharedInstance];
    v86 = objc_msgSend(v87, "commonTypeDict_RealFormat");
    v100[5] = v86;
    v99[6] = @"L1";
    v85 = [MEMORY[0x1E4F929D8] sharedInstance];
    v84 = objc_msgSend(v85, "commonTypeDict_RealFormat");
    v100[6] = v84;
    v99[7] = @"L2";
    v83 = [MEMORY[0x1E4F929D8] sharedInstance];
    v82 = objc_msgSend(v83, "commonTypeDict_RealFormat");
    v100[7] = v82;
    v99[8] = @"S";
    v81 = [MEMORY[0x1E4F929D8] sharedInstance];
    v80 = objc_msgSend(v81, "commonTypeDict_RealFormat");
    v100[8] = v80;
    v99[9] = @"version";
    v79 = [MEMORY[0x1E4F929D8] sharedInstance];
    v78 = objc_msgSend(v79, "commonTypeDict_IntegerFormat");
    v100[9] = v78;
    v99[10] = @"Lux";
    v77 = [MEMORY[0x1E4F929D8] sharedInstance];
    v76 = objc_msgSend(v77, "commonTypeDict_IntegerFormat");
    v100[10] = v76;
    v99[11] = @"thirdSlope";
    v75 = [MEMORY[0x1E4F929D8] sharedInstance];
    v74 = objc_msgSend(v75, "commonTypeDict_RealFormat");
    v100[11] = v74;
    v99[12] = @"aabParamsUpdateOnly";
    v73 = [MEMORY[0x1E4F929D8] sharedInstance];
    v72 = objc_msgSend(v73, "commonTypeDict_BoolFormat");
    v100[12] = v72;
    v99[13] = @"auroraFactor";
    v71 = [MEMORY[0x1E4F929D8] sharedInstance];
    v70 = objc_msgSend(v71, "commonTypeDict_RealFormat");
    v100[13] = v70;
    v99[14] = @"autobrightnessEnabled";
    v69 = [MEMORY[0x1E4F929D8] sharedInstance];
    v68 = objc_msgSend(v69, "commonTypeDict_BoolFormat");
    v100[14] = v68;
    v99[15] = @"colorAdaptationStrength";
    v67 = [MEMORY[0x1E4F929D8] sharedInstance];
    v66 = objc_msgSend(v67, "commonTypeDict_RealFormat");
    v100[15] = v66;
    v99[16] = @"colorAdaptationMode";
    v65 = [MEMORY[0x1E4F929D8] sharedInstance];
    v64 = objc_msgSend(v65, "commonTypeDict_IntegerFormat");
    v100[16] = v64;
    v99[17] = @"cpmsMitigationLimitingBrightness";
    v63 = [MEMORY[0x1E4F929D8] sharedInstance];
    v62 = objc_msgSend(v63, "commonTypeDict_BoolFormat");
    v100[17] = v62;
    v99[18] = @"darkThemeApplied";
    v61 = [MEMORY[0x1E4F929D8] sharedInstance];
    v60 = objc_msgSend(v61, "commonTypeDict_BoolFormat");
    v100[18] = v60;
    v99[19] = @"delayedAPCE";
    v59 = [MEMORY[0x1E4F929D8] sharedInstance];
    v58 = objc_msgSend(v59, "commonTypeDict_IntegerFormat");
    v100[19] = v58;
    v99[20] = @"delayedAPCEStatus";
    v57 = [MEMORY[0x1E4F929D8] sharedInstance];
    v56 = objc_msgSend(v57, "commonTypeDict_IntegerFormat");
    v100[20] = v56;
    v99[21] = @"ecoModeEnabled";
    v55 = [MEMORY[0x1E4F929D8] sharedInstance];
    v54 = objc_msgSend(v55, "commonTypeDict_BoolFormat");
    v100[21] = v54;
    v99[22] = @"ecoModeFactor";
    v53 = [MEMORY[0x1E4F929D8] sharedInstance];
    v52 = objc_msgSend(v53, "commonTypeDict_IntegerFormat");
    v100[22] = v52;
    v99[23] = @"edrHeadroom";
    v51 = [MEMORY[0x1E4F929D8] sharedInstance];
    v50 = objc_msgSend(v51, "commonTypeDict_RealFormat");
    v100[23] = v50;
    v99[24] = @"landscapeOrientation";
    v49 = [MEMORY[0x1E4F929D8] sharedInstance];
    v48 = objc_msgSend(v49, "commonTypeDict_BoolFormat");
    v100[24] = v48;
    v99[25] = @"localTimestamp";
    v47 = [MEMORY[0x1E4F929D8] sharedInstance];
    v46 = objc_msgSend(v47, "commonTypeDict_DateFormat");
    v100[25] = v46;
    v99[26] = @"nits";
    v45 = [MEMORY[0x1E4F929D8] sharedInstance];
    v44 = objc_msgSend(v45, "commonTypeDict_RealFormat");
    v100[26] = v44;
    v99[27] = @"proxMitigationTriggered";
    v43 = [MEMORY[0x1E4F929D8] sharedInstance];
    v42 = objc_msgSend(v43, "commonTypeDict_BoolFormat");
    v100[27] = v42;
    v99[28] = @"rearLux";
    v41 = [MEMORY[0x1E4F929D8] sharedInstance];
    v40 = objc_msgSend(v41, "commonTypeDict_IntegerFormat");
    v100[28] = v40;
    v99[29] = @"rearLuxInUse";
    v39 = [MEMORY[0x1E4F929D8] sharedInstance];
    v38 = objc_msgSend(v39, "commonTypeDict_BoolFormat");
    v100[29] = v38;
    v99[30] = @"touchMitigationTriggered";
    BOOL v37 = [MEMORY[0x1E4F929D8] sharedInstance];
    v36 = objc_msgSend(v37, "commonTypeDict_BoolFormat");
    v100[30] = v36;
    v99[31] = @"trustedLux";
    BOOL v35 = [MEMORY[0x1E4F929D8] sharedInstance];
    v34 = objc_msgSend(v35, "commonTypeDict_IntegerFormat");
    v100[31] = v34;
    v99[32] = @"aabParamsUpdateReason";
    v33 = [MEMORY[0x1E4F929D8] sharedInstance];
    v32 = objc_msgSend(v33, "commonTypeDict_IntegerFormat");
    v100[32] = v32;
    v99[33] = @"inactiveLength";
    BOOL v31 = [MEMORY[0x1E4F929D8] sharedInstance];
    v30 = objc_msgSend(v31, "commonTypeDict_IntegerFormat");
    v100[33] = v30;
    v99[34] = @"inactiveStart";
    v29 = [MEMORY[0x1E4F929D8] sharedInstance];
    v28 = objc_msgSend(v29, "commonTypeDict_IntegerFormat");
    v100[34] = v28;
    v99[35] = @"alternativeE0a";
    v27 = [MEMORY[0x1E4F929D8] sharedInstance];
    v26 = objc_msgSend(v27, "commonTypeDict_IntegerFormat");
    v100[35] = v26;
    v99[36] = @"alternativeE0b";
    v25 = [MEMORY[0x1E4F929D8] sharedInstance];
    v24 = objc_msgSend(v25, "commonTypeDict_IntegerFormat");
    v100[36] = v24;
    v99[37] = @"alternativeE1";
    v23 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v22 = objc_msgSend(v23, "commonTypeDict_IntegerFormat");
    v100[37] = v22;
    v99[38] = @"alternativeE2";
    v21 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v20 = objc_msgSend(v21, "commonTypeDict_IntegerFormat");
    v100[38] = v20;
    v99[39] = @"alternativeL0a";
    v19 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
    v100[39] = v18;
    v99[40] = @"alternativeL0b";
    uint64_t v17 = [MEMORY[0x1E4F929D8] sharedInstance];
    v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
    v100[40] = v16;
    v99[41] = @"alternativeL1";
    BOOL v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
    v100[41] = v14;
    v99[42] = @"alternativeL2";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    v100[42] = v5;
    v99[43] = @"alternativeThirdSlope";
    v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    v100[43] = v7;
    v99[44] = @"nitsDelta";
    BOOL v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
    v100[44] = v9;
    v99[45] = @"nitsDeltaAlternative";
    uint64_t v10 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v11 = objc_msgSend(v10, "commonTypeDict_IntegerFormat");
    v100[45] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v100 forKeys:v99 count:46];
    v104[1] = v12;
    uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v104 forKeys:v103 count:2];
  }
  return v2;
}

+ (id)entryEventForwardDefinitionALSEnabled
{
  void v13[2] = *MEMORY[0x1E4F143B8];
  v12[0] = *MEMORY[0x1E4F92C50];
  uint64_t v10 = *MEMORY[0x1E4F92CD0];
  uint64_t v11 = &unk_1F4012148;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E4F92CA8];
  BOOL v8 = @"ALSEnabled";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v4 = objc_msgSend(v3, "commonTypeDict_BoolFormat");
  v9 = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v13[1] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  return v6;
}

+ (id)entryEventForwardDefinitionALSPowerSaved
{
  void v13[2] = *MEMORY[0x1E4F143B8];
  if (+[PLDisplayAgent shouldLogALSPowerSaved])
  {
    v12[0] = *MEMORY[0x1E4F92C50];
    uint64_t v10 = *MEMORY[0x1E4F92CD0];
    uint64_t v11 = &unk_1F4012148;
    uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    v13[0] = v2;
    v12[1] = *MEMORY[0x1E4F92CA8];
    BOOL v8 = @"Power";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_RealFormat");
    v9 = v4;
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    v13[1] = v5;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  }
  else
  {
    v6 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v6;
}

+ (id)entryEventForwardDefinitionColorAdaptationMode
{
  void v13[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F5B298] supportsAdaptation])
  {
    v12[0] = *MEMORY[0x1E4F92C50];
    uint64_t v10 = *MEMORY[0x1E4F92CD0];
    uint64_t v11 = &unk_1F4012148;
    uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    v13[0] = v2;
    v12[1] = *MEMORY[0x1E4F92CA8];
    BOOL v8 = @"CAModeEnabled";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_BoolFormat");
    v9 = v4;
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    v13[1] = v5;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  }
  else
  {
    v6 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v6;
}

+ (id)entryEventForwardDefinitionBlueLightReductionStatus
{
  v17[2] = *MEMORY[0x1E4F143B8];
  if (+[PLDisplayAgent shouldLogBLR])
  {
    v16[0] = *MEMORY[0x1E4F92C50];
    uint64_t v14 = *MEMORY[0x1E4F92CD0];
    BOOL v15 = &unk_1F4012148;
    uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    v17[0] = v2;
    v16[1] = *MEMORY[0x1E4F92CA8];
    v12[0] = @"BlueReductionEnabled";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_BoolFormat");
    v13[0] = v4;
    v12[1] = @"BlueReductionMode";
    uint64_t v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    v13[1] = v6;
    void v12[2] = @"BlueReductionSunScheduleAllowed";
    uint64_t v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v8 = objc_msgSend(v7, "commonTypeDict_BoolFormat");
    void v13[2] = v8;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
    v17[1] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v10;
}

+ (id)entryEventForwardDefinitionALSLux
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventForwardDefinitionLinearBrightness
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventForwardDefinitionLuxStats
{
  v21[2] = *MEMORY[0x1E4F143B8];
  if (+[PLDisplayAgent shouldLogLuxStats])
  {
    v20[0] = *MEMORY[0x1E4F92C50];
    uint64_t v18 = *MEMORY[0x1E4F92CD0];
    v19 = &unk_1F4012148;
    BOOL v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    v21[0] = v15;
    v20[1] = *MEMORY[0x1E4F92CA8];
    v16[0] = @"cappedLuxForAAB";
    uint64_t v14 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v13 = objc_msgSend(v14, "commonTypeDict_IntegerFormat");
    v17[0] = v13;
    v16[1] = @"frontNits";
    uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
    v17[1] = v3;
    void v16[2] = @"gainChanged";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v5 = objc_msgSend(v4, "commonTypeDict_BoolFormat");
    v17[2] = v5;
    void v16[3] = @"rearNits";
    v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    void v17[3] = v7;
    v16[4] = @"rearLux";
    BOOL v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
    v17[4] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:5];
    v21[1] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v11;
}

+ (id)entryEventBackwardDefinitions
{
  v17[12] = *MEMORY[0x1E4F143B8];
  v16[0] = @"Touch";
  BOOL v15 = +[PLDisplayAgent entryEventBackwardDefinitionTouch];
  v17[0] = v15;
  v16[1] = @"BlueLightParameters";
  uint64_t v14 = +[PLDisplayAgent entryEventBackwardDefinitionBlueLightParameters];
  v17[1] = v14;
  void v16[2] = @"HParameters";
  uint64_t v13 = +[PLDisplayAgent entryEventBackwardDefinitionHarmonyParameters];
  v17[2] = v13;
  void v16[3] = @"APLStats";
  uint64_t v2 = +[PLDisplayAgent entryEventBackwardDefinitionAPLStats];
  void v17[3] = v2;
  v16[4] = @"AZLStats";
  uint64_t v3 = +[PLDisplayAgent entryEventBackwardDefinitionAZLStats];
  v17[4] = v3;
  void v16[5] = @"AZLSnapshots";
  uint64_t v4 = +[PLDisplayAgent entryEventBackwardDefinitionAZLSnapshots];
  void v17[5] = v4;
  v16[6] = @"RampInfo";
  uint64_t v5 = +[PLDisplayAgent entryEventBackwardDefinitionRampInfo];
  v17[6] = v5;
  v16[7] = @"CurveUpdate";
  v6 = +[PLDisplayAgent entryEventBackwardDefinitionCurveUpdate];
  v17[7] = v6;
  v16[8] = @"ALSThreshold";
  uint64_t v7 = +[PLDisplayAgent entryEventBackwardDefinitionALSThreshold];
  v17[8] = v7;
  v16[9] = @"ALSSamplesBeforeWake";
  BOOL v8 = +[PLDisplayAgent entryEventBackwardDefinitionALSSamplesBeforeWake];
  v17[9] = v8;
  v16[10] = @"AmbientLight";
  v9 = +[PLDisplayAgent entryEventBackwardDefinitionAmbientLight];
  v17[10] = v9;
  v16[11] = @"DCPAODstats";
  uint64_t v10 = +[PLDisplayAgent entryEventBackwardDefinitionDCPAODstats];
  v17[11] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:12];

  return v11;
}

+ (id)entryEventBackwardDefinitionTouch
{
  void v51[2] = *MEMORY[0x1E4F143B8];
  if (+[PLDisplayAgent shouldLogTouch])
  {
    v50[0] = *MEMORY[0x1E4F92C50];
    uint64_t v48 = *MEMORY[0x1E4F92CD0];
    v49 = &unk_1F4012148;
    BOOL v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
    v51[0] = v20;
    v50[1] = *MEMORY[0x1E4F92CA8];
    v46[0] = @"Unknown";
    uint64_t v3 = *MEMORY[0x1E4F92D18];
    v43[0] = *MEMORY[0x1E4F92D10];
    uint64_t v2 = v43[0];
    v43[1] = v3;
    v45[0] = &unk_1F400DA38;
    v45[1] = @"s";
    uint64_t v44 = *MEMORY[0x1E4F92CA0];
    uint64_t v4 = v44;
    void v45[2] = &unk_1F4014350;
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v43 count:3];
    v47[0] = v19;
    v46[1] = @"Active";
    v41[0] = v2;
    v41[1] = v3;
    v42[0] = &unk_1F400DA38;
    v42[1] = @"s";
    void v41[2] = v4;
    void v42[2] = &unk_1F4014368;
    uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:3];
    v47[1] = v18;
    void v46[2] = @"Ready";
    v39[0] = v2;
    v39[1] = v3;
    v40[0] = &unk_1F400DA38;
    v40[1] = @"s";
    void v39[2] = v4;
    void v40[2] = &unk_1F4014380;
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:3];
    v47[2] = v17;
    v46[3] = @"AutoReady";
    v37[0] = v2;
    v37[1] = v3;
    v38[0] = &unk_1F400DA38;
    v38[1] = @"s";
    v37[2] = v4;
    v38[2] = &unk_1F4014398;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:3];
    void v47[3] = v16;
    v46[4] = @"UILock";
    v35[0] = v2;
    v35[1] = v3;
    v36[0] = &unk_1F400DA38;
    v36[1] = @"s";
    void v35[2] = v4;
    void v36[2] = &unk_1F40143B0;
    BOOL v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:3];
    v47[4] = v15;
    v46[5] = @"FaceDetected";
    v33[0] = v2;
    v33[1] = v3;
    v34[0] = &unk_1F400DA38;
    v34[1] = @"s";
    v33[2] = v4;
    void v34[2] = &unk_1F40143C8;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:3];
    v47[5] = v14;
    v46[6] = @"StationaryFingers";
    v31[0] = v2;
    v31[1] = v3;
    v32[0] = &unk_1F400DA38;
    v32[1] = @"s";
    void v31[2] = v4;
    v32[2] = &unk_1F40143E0;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:3];
    v47[6] = v13;
    v46[7] = @"AutoScan";
    v29[0] = v2;
    v29[1] = v3;
    v30[0] = &unk_1F400DA38;
    v30[1] = @"s";
    void v29[2] = v4;
    void v30[2] = &unk_1F40143F8;
    uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:3];
    v47[7] = v5;
    v46[8] = @"VSFOMCal";
    v27[0] = v2;
    v27[1] = v3;
    v28[0] = &unk_1F400DA38;
    v28[1] = @"s";
    v27[2] = v4;
    void v28[2] = &unk_1F4014410;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:3];
    v47[8] = v6;
    v46[9] = @"Anticipate";
    v25[0] = v2;
    v25[1] = v3;
    v26[0] = &unk_1F400DA38;
    v26[1] = @"s";
    v25[2] = v4;
    v26[2] = &unk_1F4014428;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:3];
    v47[9] = v7;
    v46[10] = @"Off";
    v23[0] = v2;
    v23[1] = v3;
    v24[0] = &unk_1F400DA38;
    v24[1] = @"s";
    v23[2] = v4;
    void v24[2] = &unk_1F4014440;
    BOOL v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];
    v47[10] = v8;
    v46[11] = @"On";
    v21[0] = v2;
    v21[1] = v3;
    v22[0] = &unk_1F400DA38;
    v22[1] = @"s";
    v21[2] = v4;
    v22[2] = &unk_1F4014458;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];
    v47[11] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:v46 count:12];
    v51[1] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:2];
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v11;
}

+ (id)entryEventBackwardDefinitionHarmonyParameters
{
  v259[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F5B298] supportsAdaptation])
  {
    v258[0] = *MEMORY[0x1E4F92C50];
    uint64_t v256 = *MEMORY[0x1E4F92CD0];
    v257 = &unk_1F4012198;
    v253 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v257 forKeys:&v256 count:1];
    v259[0] = v253;
    v258[1] = *MEMORY[0x1E4F92CA8];
    v254[0] = @"DCBins_0";
    v252 = [MEMORY[0x1E4F929D8] sharedInstance];
    v251 = objc_msgSend(v252, "commonTypeDict_RealFormat");
    v255[0] = v251;
    v254[1] = @"DCBins_1";
    v250 = [MEMORY[0x1E4F929D8] sharedInstance];
    v249 = objc_msgSend(v250, "commonTypeDict_RealFormat");
    v255[1] = v249;
    v254[2] = @"DCBins_2";
    v248 = [MEMORY[0x1E4F929D8] sharedInstance];
    v247 = objc_msgSend(v248, "commonTypeDict_RealFormat");
    v255[2] = v247;
    v254[3] = @"DCBins_3";
    v246 = [MEMORY[0x1E4F929D8] sharedInstance];
    v245 = objc_msgSend(v246, "commonTypeDict_RealFormat");
    v255[3] = v245;
    v254[4] = @"DCBins_4";
    v244 = [MEMORY[0x1E4F929D8] sharedInstance];
    v243 = objc_msgSend(v244, "commonTypeDict_RealFormat");
    v255[4] = v243;
    v254[5] = @"DCBins_5";
    v242 = [MEMORY[0x1E4F929D8] sharedInstance];
    v241 = objc_msgSend(v242, "commonTypeDict_RealFormat");
    v255[5] = v241;
    v254[6] = @"DCBins_6";
    v240 = [MEMORY[0x1E4F929D8] sharedInstance];
    v239 = objc_msgSend(v240, "commonTypeDict_RealFormat");
    v255[6] = v239;
    v254[7] = @"DCBins_7";
    v238 = [MEMORY[0x1E4F929D8] sharedInstance];
    v237 = objc_msgSend(v238, "commonTypeDict_RealFormat");
    v255[7] = v237;
    v254[8] = @"DCBins_8";
    v236 = [MEMORY[0x1E4F929D8] sharedInstance];
    v235 = objc_msgSend(v236, "commonTypeDict_RealFormat");
    v255[8] = v235;
    v254[9] = @"DCBins_9";
    v234 = [MEMORY[0x1E4F929D8] sharedInstance];
    v233 = objc_msgSend(v234, "commonTypeDict_RealFormat");
    v255[9] = v233;
    v254[10] = @"DCBins_10";
    v232 = [MEMORY[0x1E4F929D8] sharedInstance];
    v231 = objc_msgSend(v232, "commonTypeDict_RealFormat");
    v255[10] = v231;
    v254[11] = @"DCBins_11";
    v230 = [MEMORY[0x1E4F929D8] sharedInstance];
    v229 = objc_msgSend(v230, "commonTypeDict_RealFormat");
    v255[11] = v229;
    v254[12] = @"DCBins_12";
    v228 = [MEMORY[0x1E4F929D8] sharedInstance];
    v227 = objc_msgSend(v228, "commonTypeDict_RealFormat");
    v255[12] = v227;
    v254[13] = @"DCBins_13";
    v226 = [MEMORY[0x1E4F929D8] sharedInstance];
    v225 = objc_msgSend(v226, "commonTypeDict_RealFormat");
    v255[13] = v225;
    v254[14] = @"DCBins_14";
    v224 = [MEMORY[0x1E4F929D8] sharedInstance];
    v223 = objc_msgSend(v224, "commonTypeDict_RealFormat");
    v255[14] = v223;
    v254[15] = @"DCBins_15";
    v222 = [MEMORY[0x1E4F929D8] sharedInstance];
    v221 = objc_msgSend(v222, "commonTypeDict_RealFormat");
    v255[15] = v221;
    v254[16] = @"DCBins_16";
    v220 = [MEMORY[0x1E4F929D8] sharedInstance];
    v219 = objc_msgSend(v220, "commonTypeDict_RealFormat");
    v255[16] = v219;
    v254[17] = @"ACBins_0";
    v218 = [MEMORY[0x1E4F929D8] sharedInstance];
    v217 = objc_msgSend(v218, "commonTypeDict_RealFormat");
    v255[17] = v217;
    v254[18] = @"ACBins_1";
    v216 = [MEMORY[0x1E4F929D8] sharedInstance];
    v215 = objc_msgSend(v216, "commonTypeDict_RealFormat");
    v255[18] = v215;
    v254[19] = @"ACBins_2";
    v214 = [MEMORY[0x1E4F929D8] sharedInstance];
    v213 = objc_msgSend(v214, "commonTypeDict_RealFormat");
    v255[19] = v213;
    v254[20] = @"ACBins_3";
    v212 = [MEMORY[0x1E4F929D8] sharedInstance];
    v211 = objc_msgSend(v212, "commonTypeDict_RealFormat");
    v255[20] = v211;
    v254[21] = @"ACBins_4";
    v210 = [MEMORY[0x1E4F929D8] sharedInstance];
    v209 = objc_msgSend(v210, "commonTypeDict_RealFormat");
    v255[21] = v209;
    v254[22] = @"ACBins_5";
    v208 = [MEMORY[0x1E4F929D8] sharedInstance];
    v207 = objc_msgSend(v208, "commonTypeDict_RealFormat");
    v255[22] = v207;
    v254[23] = @"ACBins_6";
    v206 = [MEMORY[0x1E4F929D8] sharedInstance];
    v205 = objc_msgSend(v206, "commonTypeDict_RealFormat");
    v255[23] = v205;
    v254[24] = @"ACBins_7";
    v204 = [MEMORY[0x1E4F929D8] sharedInstance];
    v203 = objc_msgSend(v204, "commonTypeDict_RealFormat");
    v255[24] = v203;
    v254[25] = @"ACBins_8";
    v202 = [MEMORY[0x1E4F929D8] sharedInstance];
    v201 = objc_msgSend(v202, "commonTypeDict_RealFormat");
    v255[25] = v201;
    v254[26] = @"ACBins_9";
    v200 = [MEMORY[0x1E4F929D8] sharedInstance];
    v199 = objc_msgSend(v200, "commonTypeDict_RealFormat");
    v255[26] = v199;
    v254[27] = @"ACBins_10";
    v198 = [MEMORY[0x1E4F929D8] sharedInstance];
    v197 = objc_msgSend(v198, "commonTypeDict_RealFormat");
    v255[27] = v197;
    v254[28] = @"ACBins_11";
    v196 = [MEMORY[0x1E4F929D8] sharedInstance];
    v195 = objc_msgSend(v196, "commonTypeDict_RealFormat");
    v255[28] = v195;
    v254[29] = @"ACBins_12";
    v194 = [MEMORY[0x1E4F929D8] sharedInstance];
    v193 = objc_msgSend(v194, "commonTypeDict_RealFormat");
    v255[29] = v193;
    v254[30] = @"ACBins_13";
    v192 = [MEMORY[0x1E4F929D8] sharedInstance];
    v191 = objc_msgSend(v192, "commonTypeDict_RealFormat");
    v255[30] = v191;
    v254[31] = @"ACBins_14";
    v190 = [MEMORY[0x1E4F929D8] sharedInstance];
    v189 = objc_msgSend(v190, "commonTypeDict_RealFormat");
    v255[31] = v189;
    v254[32] = @"ACBins_15";
    v188 = [MEMORY[0x1E4F929D8] sharedInstance];
    v187 = objc_msgSend(v188, "commonTypeDict_RealFormat");
    v255[32] = v187;
    v254[33] = @"ACBins_16";
    v186 = [MEMORY[0x1E4F929D8] sharedInstance];
    v185 = objc_msgSend(v186, "commonTypeDict_RealFormat");
    v255[33] = v185;
    v254[34] = @"ASBins_0";
    v184 = [MEMORY[0x1E4F929D8] sharedInstance];
    v183 = objc_msgSend(v184, "commonTypeDict_RealFormat");
    v255[34] = v183;
    v254[35] = @"ASBins_1";
    v182 = [MEMORY[0x1E4F929D8] sharedInstance];
    v181 = objc_msgSend(v182, "commonTypeDict_RealFormat");
    v255[35] = v181;
    v254[36] = @"ASBins_2";
    v180 = [MEMORY[0x1E4F929D8] sharedInstance];
    v179 = objc_msgSend(v180, "commonTypeDict_RealFormat");
    v255[36] = v179;
    v254[37] = @"ASBins_3";
    v178 = [MEMORY[0x1E4F929D8] sharedInstance];
    v177 = objc_msgSend(v178, "commonTypeDict_RealFormat");
    v255[37] = v177;
    v254[38] = @"ASBins_4";
    v176 = [MEMORY[0x1E4F929D8] sharedInstance];
    v175 = objc_msgSend(v176, "commonTypeDict_RealFormat");
    v255[38] = v175;
    v254[39] = @"ASBins_5";
    v174 = [MEMORY[0x1E4F929D8] sharedInstance];
    v173 = objc_msgSend(v174, "commonTypeDict_RealFormat");
    v255[39] = v173;
    v254[40] = @"ASBins_6";
    v172 = [MEMORY[0x1E4F929D8] sharedInstance];
    v171 = objc_msgSend(v172, "commonTypeDict_RealFormat");
    v255[40] = v171;
    v254[41] = @"ASBins_7";
    v170 = [MEMORY[0x1E4F929D8] sharedInstance];
    v169 = objc_msgSend(v170, "commonTypeDict_RealFormat");
    v255[41] = v169;
    v254[42] = @"ASBins_8";
    v168 = [MEMORY[0x1E4F929D8] sharedInstance];
    v167 = objc_msgSend(v168, "commonTypeDict_RealFormat");
    v255[42] = v167;
    v254[43] = @"ASBins_9";
    v166 = [MEMORY[0x1E4F929D8] sharedInstance];
    v165 = objc_msgSend(v166, "commonTypeDict_RealFormat");
    v255[43] = v165;
    v254[44] = @"ACABins_0";
    v164 = [MEMORY[0x1E4F929D8] sharedInstance];
    v163 = objc_msgSend(v164, "commonTypeDict_RealFormat");
    v255[44] = v163;
    v254[45] = @"ACABins_1";
    v162 = [MEMORY[0x1E4F929D8] sharedInstance];
    v161 = objc_msgSend(v162, "commonTypeDict_RealFormat");
    v255[45] = v161;
    v254[46] = @"ACABins_2";
    v160 = [MEMORY[0x1E4F929D8] sharedInstance];
    v159 = objc_msgSend(v160, "commonTypeDict_RealFormat");
    v255[46] = v159;
    v254[47] = @"ACABins_3";
    v158 = [MEMORY[0x1E4F929D8] sharedInstance];
    v157 = objc_msgSend(v158, "commonTypeDict_RealFormat");
    v255[47] = v157;
    v254[48] = @"ACABins_4";
    v156 = [MEMORY[0x1E4F929D8] sharedInstance];
    v155 = objc_msgSend(v156, "commonTypeDict_RealFormat");
    v255[48] = v155;
    v254[49] = @"ACABins_5";
    v154 = [MEMORY[0x1E4F929D8] sharedInstance];
    v153 = objc_msgSend(v154, "commonTypeDict_RealFormat");
    v255[49] = v153;
    v254[50] = @"ACABins_6";
    v152 = [MEMORY[0x1E4F929D8] sharedInstance];
    v151 = objc_msgSend(v152, "commonTypeDict_RealFormat");
    v255[50] = v151;
    v254[51] = @"ACABins_7";
    v150 = [MEMORY[0x1E4F929D8] sharedInstance];
    v149 = objc_msgSend(v150, "commonTypeDict_RealFormat");
    v255[51] = v149;
    v254[52] = @"ACABins_8";
    v148 = [MEMORY[0x1E4F929D8] sharedInstance];
    v147 = objc_msgSend(v148, "commonTypeDict_RealFormat");
    v255[52] = v147;
    v254[53] = @"ACABins_9";
    v146 = [MEMORY[0x1E4F929D8] sharedInstance];
    v145 = objc_msgSend(v146, "commonTypeDict_RealFormat");
    v255[53] = v145;
    v254[54] = @"ACABins_10";
    v144 = [MEMORY[0x1E4F929D8] sharedInstance];
    v143 = objc_msgSend(v144, "commonTypeDict_RealFormat");
    v255[54] = v143;
    v254[55] = @"ACABins_11";
    v142 = [MEMORY[0x1E4F929D8] sharedInstance];
    v141 = objc_msgSend(v142, "commonTypeDict_RealFormat");
    v255[55] = v141;
    v254[56] = @"ACABins_12";
    v140 = [MEMORY[0x1E4F929D8] sharedInstance];
    v139 = objc_msgSend(v140, "commonTypeDict_RealFormat");
    v255[56] = v139;
    v254[57] = @"ACABins_13";
    v138 = [MEMORY[0x1E4F929D8] sharedInstance];
    v137 = objc_msgSend(v138, "commonTypeDict_RealFormat");
    v255[57] = v137;
    v254[58] = @"ACABins_14";
    v136 = [MEMORY[0x1E4F929D8] sharedInstance];
    v135 = objc_msgSend(v136, "commonTypeDict_RealFormat");
    v255[58] = v135;
    v254[59] = @"ACABins_15";
    v134 = [MEMORY[0x1E4F929D8] sharedInstance];
    v133 = objc_msgSend(v134, "commonTypeDict_RealFormat");
    v255[59] = v133;
    v254[60] = @"ACABins_16";
    v132 = [MEMORY[0x1E4F929D8] sharedInstance];
    v131 = objc_msgSend(v132, "commonTypeDict_RealFormat");
    v255[60] = v131;
    v254[61] = @"ACABins_17";
    v130 = [MEMORY[0x1E4F929D8] sharedInstance];
    v129 = objc_msgSend(v130, "commonTypeDict_RealFormat");
    v255[61] = v129;
    v254[62] = @"ACABins_18";
    v128 = [MEMORY[0x1E4F929D8] sharedInstance];
    v127 = objc_msgSend(v128, "commonTypeDict_RealFormat");
    v255[62] = v127;
    v254[63] = @"ACABins_19";
    v126 = [MEMORY[0x1E4F929D8] sharedInstance];
    v125 = objc_msgSend(v126, "commonTypeDict_RealFormat");
    v255[63] = v125;
    v254[64] = @"ACABins_20";
    v124 = [MEMORY[0x1E4F929D8] sharedInstance];
    v123 = objc_msgSend(v124, "commonTypeDict_RealFormat");
    v255[64] = v123;
    v254[65] = @"ACABins_21";
    v122 = [MEMORY[0x1E4F929D8] sharedInstance];
    v121 = objc_msgSend(v122, "commonTypeDict_RealFormat");
    v255[65] = v121;
    v254[66] = @"ACABins_22";
    v120 = [MEMORY[0x1E4F929D8] sharedInstance];
    v119 = objc_msgSend(v120, "commonTypeDict_RealFormat");
    v255[66] = v119;
    v254[67] = @"ACABins_23";
    v118 = [MEMORY[0x1E4F929D8] sharedInstance];
    v117 = objc_msgSend(v118, "commonTypeDict_RealFormat");
    v255[67] = v117;
    v254[68] = @"ACABins_24";
    v116 = [MEMORY[0x1E4F929D8] sharedInstance];
    v115 = objc_msgSend(v116, "commonTypeDict_RealFormat");
    v255[68] = v115;
    v254[69] = @"ACABins_25";
    v114 = [MEMORY[0x1E4F929D8] sharedInstance];
    v113 = objc_msgSend(v114, "commonTypeDict_RealFormat");
    v255[69] = v113;
    v254[70] = @"ACABins_26";
    v112 = [MEMORY[0x1E4F929D8] sharedInstance];
    v111 = objc_msgSend(v112, "commonTypeDict_RealFormat");
    v255[70] = v111;
    v254[71] = @"ACABins_27";
    v110 = [MEMORY[0x1E4F929D8] sharedInstance];
    v109 = objc_msgSend(v110, "commonTypeDict_RealFormat");
    v255[71] = v109;
    v254[72] = @"ACABins_28";
    v108 = [MEMORY[0x1E4F929D8] sharedInstance];
    v107 = objc_msgSend(v108, "commonTypeDict_RealFormat");
    v255[72] = v107;
    v254[73] = @"ACABins_29";
    v106 = [MEMORY[0x1E4F929D8] sharedInstance];
    v105 = objc_msgSend(v106, "commonTypeDict_RealFormat");
    v255[73] = v105;
    v254[74] = @"ACABins_30";
    v104 = [MEMORY[0x1E4F929D8] sharedInstance];
    v103 = objc_msgSend(v104, "commonTypeDict_RealFormat");
    v255[74] = v103;
    v254[75] = @"ACABins_31";
    v102 = [MEMORY[0x1E4F929D8] sharedInstance];
    v101 = objc_msgSend(v102, "commonTypeDict_RealFormat");
    v255[75] = v101;
    v254[76] = @"ACABins_32";
    v100 = [MEMORY[0x1E4F929D8] sharedInstance];
    v99 = objc_msgSend(v100, "commonTypeDict_RealFormat");
    v255[76] = v99;
    v254[77] = @"ACABins_33";
    v98 = [MEMORY[0x1E4F929D8] sharedInstance];
    v97 = objc_msgSend(v98, "commonTypeDict_RealFormat");
    v255[77] = v97;
    v254[78] = @"ACABins_34";
    v96 = [MEMORY[0x1E4F929D8] sharedInstance];
    v95 = objc_msgSend(v96, "commonTypeDict_RealFormat");
    v255[78] = v95;
    v254[79] = @"ACABins_35";
    v94 = [MEMORY[0x1E4F929D8] sharedInstance];
    v93 = objc_msgSend(v94, "commonTypeDict_RealFormat");
    v255[79] = v93;
    v254[80] = @"ACABins_36";
    v92 = [MEMORY[0x1E4F929D8] sharedInstance];
    v91 = objc_msgSend(v92, "commonTypeDict_RealFormat");
    v255[80] = v91;
    v254[81] = @"ACABins_37";
    v90 = [MEMORY[0x1E4F929D8] sharedInstance];
    v89 = objc_msgSend(v90, "commonTypeDict_RealFormat");
    v255[81] = v89;
    v254[82] = @"ACABins_38";
    v88 = [MEMORY[0x1E4F929D8] sharedInstance];
    v87 = objc_msgSend(v88, "commonTypeDict_RealFormat");
    v255[82] = v87;
    v254[83] = @"ACABins_39";
    v86 = [MEMORY[0x1E4F929D8] sharedInstance];
    v85 = objc_msgSend(v86, "commonTypeDict_RealFormat");
    v255[83] = v85;
    v254[84] = @"ACABins_40";
    v84 = [MEMORY[0x1E4F929D8] sharedInstance];
    v83 = objc_msgSend(v84, "commonTypeDict_RealFormat");
    v255[84] = v83;
    v254[85] = @"ACABins_41";
    v82 = [MEMORY[0x1E4F929D8] sharedInstance];
    v81 = objc_msgSend(v82, "commonTypeDict_RealFormat");
    v255[85] = v81;
    v254[86] = @"ACABins_42";
    v80 = [MEMORY[0x1E4F929D8] sharedInstance];
    v79 = objc_msgSend(v80, "commonTypeDict_RealFormat");
    v255[86] = v79;
    v254[87] = @"ACABins_43";
    v78 = [MEMORY[0x1E4F929D8] sharedInstance];
    v77 = objc_msgSend(v78, "commonTypeDict_RealFormat");
    v255[87] = v77;
    v254[88] = @"ACABins_44";
    v76 = [MEMORY[0x1E4F929D8] sharedInstance];
    v75 = objc_msgSend(v76, "commonTypeDict_RealFormat");
    v255[88] = v75;
    v254[89] = @"ACABins_45";
    v74 = [MEMORY[0x1E4F929D8] sharedInstance];
    v73 = objc_msgSend(v74, "commonTypeDict_RealFormat");
    v255[89] = v73;
    v254[90] = @"ACTBins_0";
    v72 = [MEMORY[0x1E4F929D8] sharedInstance];
    v71 = objc_msgSend(v72, "commonTypeDict_IntegerFormat");
    v255[90] = v71;
    v254[91] = @"ACTBins_1";
    v70 = [MEMORY[0x1E4F929D8] sharedInstance];
    v69 = objc_msgSend(v70, "commonTypeDict_IntegerFormat");
    v255[91] = v69;
    v254[92] = @"ACTBins_2";
    v68 = [MEMORY[0x1E4F929D8] sharedInstance];
    v67 = objc_msgSend(v68, "commonTypeDict_IntegerFormat");
    v255[92] = v67;
    v254[93] = @"ACTBins_3";
    v66 = [MEMORY[0x1E4F929D8] sharedInstance];
    v65 = objc_msgSend(v66, "commonTypeDict_IntegerFormat");
    v255[93] = v65;
    v254[94] = @"ACTBins_4";
    v64 = [MEMORY[0x1E4F929D8] sharedInstance];
    v63 = objc_msgSend(v64, "commonTypeDict_IntegerFormat");
    v255[94] = v63;
    v254[95] = @"ACTBins_5";
    v62 = [MEMORY[0x1E4F929D8] sharedInstance];
    v61 = objc_msgSend(v62, "commonTypeDict_IntegerFormat");
    v255[95] = v61;
    v254[96] = @"ACTBins_6";
    v60 = [MEMORY[0x1E4F929D8] sharedInstance];
    v59 = objc_msgSend(v60, "commonTypeDict_IntegerFormat");
    v255[96] = v59;
    v254[97] = @"ACTBins_7";
    v58 = [MEMORY[0x1E4F929D8] sharedInstance];
    v57 = objc_msgSend(v58, "commonTypeDict_IntegerFormat");
    v255[97] = v57;
    v254[98] = @"ACTBins_8";
    v56 = [MEMORY[0x1E4F929D8] sharedInstance];
    v55 = objc_msgSend(v56, "commonTypeDict_IntegerFormat");
    v255[98] = v55;
    v254[99] = @"ACTBins_9";
    v54 = [MEMORY[0x1E4F929D8] sharedInstance];
    v53 = objc_msgSend(v54, "commonTypeDict_IntegerFormat");
    v255[99] = v53;
    v254[100] = @"ACTBins_10";
    v52 = [MEMORY[0x1E4F929D8] sharedInstance];
    v51 = objc_msgSend(v52, "commonTypeDict_IntegerFormat");
    v255[100] = v51;
    v254[101] = @"ACTBins_11";
    v50 = [MEMORY[0x1E4F929D8] sharedInstance];
    v49 = objc_msgSend(v50, "commonTypeDict_IntegerFormat");
    v255[101] = v49;
    v254[102] = @"ACTBins_12";
    uint64_t v48 = [MEMORY[0x1E4F929D8] sharedInstance];
    v47 = objc_msgSend(v48, "commonTypeDict_IntegerFormat");
    v255[102] = v47;
    v254[103] = @"ACTBins_13";
    v46 = [MEMORY[0x1E4F929D8] sharedInstance];
    v45 = objc_msgSend(v46, "commonTypeDict_IntegerFormat");
    v255[103] = v45;
    v254[104] = @"ACTBins_14";
    uint64_t v44 = [MEMORY[0x1E4F929D8] sharedInstance];
    v43 = objc_msgSend(v44, "commonTypeDict_IntegerFormat");
    v255[104] = v43;
    v254[105] = @"ACTBins_15";
    v42 = [MEMORY[0x1E4F929D8] sharedInstance];
    v41 = objc_msgSend(v42, "commonTypeDict_IntegerFormat");
    v255[105] = v41;
    v254[106] = @"ACTBins_16";
    v40 = [MEMORY[0x1E4F929D8] sharedInstance];
    v39 = objc_msgSend(v40, "commonTypeDict_IntegerFormat");
    v255[106] = v39;
    v254[107] = @"DCTBins_0";
    v38 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v37 = objc_msgSend(v38, "commonTypeDict_IntegerFormat");
    v255[107] = v37;
    v254[108] = @"DCTBins_1";
    v36 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v35 = objc_msgSend(v36, "commonTypeDict_IntegerFormat");
    v255[108] = v35;
    v254[109] = @"DCTBins_2";
    v34 = [MEMORY[0x1E4F929D8] sharedInstance];
    v33 = objc_msgSend(v34, "commonTypeDict_IntegerFormat");
    v255[109] = v33;
    v254[110] = @"DCTBins_3";
    v32 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v31 = objc_msgSend(v32, "commonTypeDict_IntegerFormat");
    v255[110] = v31;
    v254[111] = @"DCTBins_4";
    v30 = [MEMORY[0x1E4F929D8] sharedInstance];
    v29 = objc_msgSend(v30, "commonTypeDict_IntegerFormat");
    v255[111] = v29;
    v254[112] = @"DCTBins_5";
    v28 = [MEMORY[0x1E4F929D8] sharedInstance];
    v27 = objc_msgSend(v28, "commonTypeDict_IntegerFormat");
    v255[112] = v27;
    v254[113] = @"DCTBins_6";
    v26 = [MEMORY[0x1E4F929D8] sharedInstance];
    v25 = objc_msgSend(v26, "commonTypeDict_IntegerFormat");
    v255[113] = v25;
    v254[114] = @"DCTBins_7";
    v24 = [MEMORY[0x1E4F929D8] sharedInstance];
    v23 = objc_msgSend(v24, "commonTypeDict_IntegerFormat");
    v255[114] = v23;
    v254[115] = @"DCTBins_8";
    uint64_t v22 = [MEMORY[0x1E4F929D8] sharedInstance];
    v21 = objc_msgSend(v22, "commonTypeDict_IntegerFormat");
    v255[115] = v21;
    v254[116] = @"DCTBins_9";
    BOOL v20 = [MEMORY[0x1E4F929D8] sharedInstance];
    v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
    v255[116] = v19;
    v254[117] = @"DCTBins_10";
    uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v17 = objc_msgSend(v18, "commonTypeDict_IntegerFormat");
    v255[117] = v17;
    v254[118] = @"DCTBins_11";
    v16 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
    v255[118] = v15;
    v254[119] = @"DCTBins_12";
    uint64_t v14 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v13 = objc_msgSend(v14, "commonTypeDict_IntegerFormat");
    v255[119] = v13;
    v254[120] = @"DCTBins_13";
    uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
    v255[120] = v3;
    v254[121] = @"DCTBins_14";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    v255[121] = v5;
    v254[122] = @"DCTBins_15";
    v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    v255[122] = v7;
    v254[123] = @"DCTBins_16";
    BOOL v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
    v255[123] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v255 forKeys:v254 count:124];
    v259[1] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v259 forKeys:v258 count:2];
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v11;
}

+ (id)entryEventBackwardDefinitionBlueLightParameters
{
  v19[2] = *MEMORY[0x1E4F143B8];
  if (+[PLDisplayAgent shouldLogBLR])
  {
    v18[0] = *MEMORY[0x1E4F92C50];
    uint64_t v16 = *MEMORY[0x1E4F92CD0];
    uint64_t v17 = &unk_1F4012148;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    v19[0] = v13;
    v18[1] = *MEMORY[0x1E4F92CA8];
    v14[0] = @"AvgBacklightNits";
    uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v3 = objc_msgSend(v2, "commonTypeDict_RealFormat");
    v15[0] = v3;
    v14[1] = @"AvgLogicalBrightnessNits";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v5 = objc_msgSend(v4, "commonTypeDict_RealFormat");
    v15[1] = v5;
    v14[2] = @"BlueLightReductionOffTime";
    v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v7 = objc_msgSend(v6, "commonTypeDict_RealFormat");
    void v15[2] = v7;
    void v14[3] = @"BlueLightReductionOnTime";
    BOOL v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    v9 = objc_msgSend(v8, "commonTypeDict_RealFormat");
    v15[3] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
    v19[1] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v11;
}

+ (id)entryEventBackwardDefinitionRampInfo
{
  v57[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] hasAOD])
  {
    v56[0] = *MEMORY[0x1E4F92C50];
    uint64_t v54 = *MEMORY[0x1E4F92CD0];
    v55 = &unk_1F4012148;
    v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
    v57[0] = v51;
    v56[1] = *MEMORY[0x1E4F92CA8];
    v52[0] = @"AAP_NumberOfUpdates";
    v50 = [MEMORY[0x1E4F929D8] sharedInstance];
    v49 = objc_msgSend(v50, "commonTypeDict_IntegerFormat");
    v53[0] = v49;
    v52[1] = @"AAP_RampFrequency";
    uint64_t v48 = [MEMORY[0x1E4F929D8] sharedInstance];
    v47 = objc_msgSend(v48, "commonTypeDict_IntegerFormat");
    v53[1] = v47;
    void v52[2] = @"AAP_RampLength";
    v46 = [MEMORY[0x1E4F929D8] sharedInstance];
    v45 = objc_msgSend(v46, "commonTypeDict_RealFormat");
    void v53[2] = v45;
    v52[3] = @"AAP_RampOrigin";
    uint64_t v44 = [MEMORY[0x1E4F929D8] sharedInstance];
    v43 = objc_msgSend(v44, "commonTypeDict_RealFormat");
    v53[3] = v43;
    v52[4] = @"AAP_RampTarget";
    v42 = [MEMORY[0x1E4F929D8] sharedInstance];
    v41 = objc_msgSend(v42, "commonTypeDict_RealFormat");
    v53[4] = v41;
    v52[5] = @"Colour_NumberOfUpdates";
    v40 = [MEMORY[0x1E4F929D8] sharedInstance];
    v39 = objc_msgSend(v40, "commonTypeDict_IntegerFormat");
    v53[5] = v39;
    v52[6] = @"Colour_RampFrequency";
    v38 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v37 = objc_msgSend(v38, "commonTypeDict_IntegerFormat");
    v53[6] = v37;
    v52[7] = @"Colour_RampLength";
    v36 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v35 = objc_msgSend(v36, "commonTypeDict_RealFormat");
    v53[7] = v35;
    v52[8] = @"Colour_RampOrigin_X";
    v34 = [MEMORY[0x1E4F929D8] sharedInstance];
    v33 = objc_msgSend(v34, "commonTypeDict_RealFormat");
    v53[8] = v33;
    v52[9] = @"Colour_RampOrigin_Y";
    v32 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v31 = objc_msgSend(v32, "commonTypeDict_RealFormat");
    v53[9] = v31;
    v52[10] = @"Colour_RampTarget_X";
    v30 = [MEMORY[0x1E4F929D8] sharedInstance];
    v29 = objc_msgSend(v30, "commonTypeDict_RealFormat");
    v53[10] = v29;
    v52[11] = @"Colour_RampTarget_Y";
    v28 = [MEMORY[0x1E4F929D8] sharedInstance];
    v27 = objc_msgSend(v28, "commonTypeDict_RealFormat");
    v53[11] = v27;
    v52[12] = @"SDR_NumberOfUpdates";
    v26 = [MEMORY[0x1E4F929D8] sharedInstance];
    v25 = objc_msgSend(v26, "commonTypeDict_IntegerFormat");
    v53[12] = v25;
    v52[13] = @"SDR_RampFrequency";
    v24 = [MEMORY[0x1E4F929D8] sharedInstance];
    v23 = objc_msgSend(v24, "commonTypeDict_IntegerFormat");
    v53[13] = v23;
    v52[14] = @"SDR_RampLength";
    uint64_t v22 = [MEMORY[0x1E4F929D8] sharedInstance];
    v21 = objc_msgSend(v22, "commonTypeDict_RealFormat");
    v53[14] = v21;
    v52[15] = @"SDR_RampOrigin";
    BOOL v20 = [MEMORY[0x1E4F929D8] sharedInstance];
    v19 = objc_msgSend(v20, "commonTypeDict_RealFormat");
    v53[15] = v19;
    v52[16] = @"SDR_RampTarget";
    uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v17 = objc_msgSend(v18, "commonTypeDict_RealFormat");
    v53[16] = v17;
    v52[17] = @"EDR_NumberOfUpdates";
    uint64_t v16 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
    v53[17] = v15;
    v52[18] = @"EDR_RampFrequency";
    uint64_t v14 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v13 = objc_msgSend(v14, "commonTypeDict_IntegerFormat");
    v53[18] = v13;
    v52[19] = @"EDR_RampLength";
    uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v3 = objc_msgSend(v2, "commonTypeDict_RealFormat");
    v53[19] = v3;
    v52[20] = @"EDR_RampOrigin";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v5 = objc_msgSend(v4, "commonTypeDict_RealFormat");
    v53[20] = v5;
    v52[21] = @"EDR_RampTarget";
    v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v7 = objc_msgSend(v6, "commonTypeDict_RealFormat");
    v53[21] = v7;
    v52[22] = @"isFlipbookActive";
    BOOL v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
    v53[22] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:23];
    v57[1] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:2];
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v11;
}

+ (id)entryEventBackwardDefinitionCurveUpdate
{
  v17[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] hasAOD])
  {
    v16[0] = *MEMORY[0x1E4F92C50];
    uint64_t v14 = *MEMORY[0x1E4F92CD0];
    BOOL v15 = &unk_1F4012148;
    uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    v17[0] = v2;
    v16[1] = *MEMORY[0x1E4F92CA8];
    v12[0] = @"lux";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
    v13[0] = v4;
    v12[1] = @"nits";
    uint64_t v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    v13[1] = v6;
    void v12[2] = @"level";
    uint64_t v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    void v13[2] = v8;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
    v17[1] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v10;
}

+ (id)entryEventBackwardDefinitionALSThreshold
{
  v19[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] hasAOD])
  {
    v18[0] = *MEMORY[0x1E4F92C50];
    uint64_t v16 = *MEMORY[0x1E4F92CD0];
    uint64_t v17 = &unk_1F4012148;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    v19[0] = v13;
    v18[1] = *MEMORY[0x1E4F92CA8];
    v14[0] = @"WakeReason";
    uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v3 = objc_msgSend(v2, "commonTypeDict_StringFormat");
    v15[0] = v3;
    v14[1] = @"Lux";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v5 = objc_msgSend(v4, "commonTypeDict_RealFormat");
    v15[1] = v5;
    v14[2] = @"DimThreshold";
    v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v7 = objc_msgSend(v6, "commonTypeDict_RealFormat");
    void v15[2] = v7;
    void v14[3] = @"BrightenThreshold";
    BOOL v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    v9 = objc_msgSend(v8, "commonTypeDict_RealFormat");
    v15[3] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
    v19[1] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v11;
}

+ (id)entryEventBackwardDefinitionALSSamplesBeforeWake
{
  v17[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] hasAOD])
  {
    v16[0] = *MEMORY[0x1E4F92C50];
    uint64_t v14 = *MEMORY[0x1E4F92CD0];
    BOOL v15 = &unk_1F4012148;
    uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    v17[0] = v2;
    v16[1] = *MEMORY[0x1E4F92CA8];
    v12[0] = @"Lux";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_RealFormat");
    v13[0] = v4;
    v12[1] = @"colorX";
    uint64_t v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    v6 = objc_msgSend(v5, "commonTypeDict_RealFormat");
    v13[1] = v6;
    void v12[2] = @"colorY";
    uint64_t v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v8 = objc_msgSend(v7, "commonTypeDict_RealFormat");
    void v13[2] = v8;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
    v17[1] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v10;
}

+ (id)entryEventBackwardDefinitionAmbientLight
{
  v17[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] hasAOD])
  {
    v16[0] = *MEMORY[0x1E4F92C50];
    uint64_t v14 = *MEMORY[0x1E4F92CD0];
    BOOL v15 = &unk_1F4012148;
    uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    v17[0] = v2;
    v16[1] = *MEMORY[0x1E4F92CA8];
    v12[0] = @"Lux";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_RealFormat");
    v13[0] = v4;
    v12[1] = @"colorX";
    uint64_t v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    v6 = objc_msgSend(v5, "commonTypeDict_RealFormat");
    v13[1] = v6;
    void v12[2] = @"colorY";
    uint64_t v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v8 = objc_msgSend(v7, "commonTypeDict_RealFormat");
    void v13[2] = v8;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
    v17[1] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v10;
}

+ (id)entryEventIntervalDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventBackwardDefinitionAPLStats
{
  void v28[2] = *MEMORY[0x1E4F143B8];
  if (+[PLDisplayAgent shouldLogAPL])
  {
    v27[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CB0];
    v25[0] = *MEMORY[0x1E4F92CD0];
    v25[1] = v2;
    v26[0] = &unk_1F40121A8;
    v26[1] = @"logDisplayAPL";
    uint64_t v3 = *MEMORY[0x1E4F92CF8];
    v25[2] = *MEMORY[0x1E4F92C40];
    void v25[3] = v3;
    v26[2] = MEMORY[0x1E4F1CC38];
    void v26[3] = &unk_1F400DA98;
    uint64_t v4 = *MEMORY[0x1E4F92C08];
    void v25[4] = *MEMORY[0x1E4F92CF0];
    v25[5] = v4;
    v26[4] = &unk_1F40121B8;
    v26[5] = MEMORY[0x1E4F1CC38];
    v25[6] = *MEMORY[0x1E4F92C58];
    v26[6] = &unk_1F4014470;
    uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:7];
    v28[0] = v22;
    v27[1] = *MEMORY[0x1E4F92CA8];
    v23[0] = @"bundleID";
    v21 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v20 = objc_msgSend(v21, "commonTypeDict_StringFormat_withBundleID");
    v24[0] = v20;
    v23[1] = @"AvgRed";
    v19 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
    v24[1] = v18;
    v23[2] = @"AvgGreen";
    uint64_t v17 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
    void v24[2] = v16;
    void v23[3] = @"AvgBlue";
    uint64_t v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    void v24[3] = v6;
    v23[4] = @"Frames";
    uint64_t v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    v24[4] = v8;
    v23[5] = @"AvgPower";
    v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v10 = objc_msgSend(v9, "commonTypeDict_RealFormat");
    v24[5] = v10;
    v23[6] = @"AvgAPL";
    uint64_t v11 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v12 = objc_msgSend(v11, "commonTypeDict_RealFormat");
    v24[6] = v12;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:7];
    v28[1] = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v14;
}

+ (id)entryEventBackwardDefinitionAZLStats
{
  v22[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] hasCapability:8])
  {
    v21[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92C40];
    v19[0] = *MEMORY[0x1E4F92CD0];
    v19[1] = v2;
    v20[0] = &unk_1F4012148;
    v20[1] = MEMORY[0x1E4F1CC38];
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
    v22[0] = v16;
    v21[1] = *MEMORY[0x1E4F92CA8];
    v17[0] = @"AvgPower";
    BOOL v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
    v18[0] = v14;
    v17[1] = @"AZLAccum";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
    v18[1] = v4;
    v17[2] = @"NitsAccum";
    uint64_t v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    void v18[2] = v6;
    void v17[3] = @"BLUpdateCount";
    uint64_t v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    v18[3] = v8;
    v17[4] = @"BLFrameCount";
    v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    v18[4] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:5];
    v22[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventBackwardDefinitionAZLSnapshots
{
  v26[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] hasCapability:8])
  {
    v25[0] = *MEMORY[0x1E4F92C50];
    uint64_t v2 = *MEMORY[0x1E4F92CE8];
    v23[0] = *MEMORY[0x1E4F92CD0];
    v23[1] = v2;
    v24[0] = &unk_1F4012148;
    v24[1] = MEMORY[0x1E4F1CC38];
    BOOL v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
    v26[0] = v20;
    v25[1] = *MEMORY[0x1E4F92CA8];
    v21[0] = @"PacketID";
    v19 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v18 = objc_msgSend(v19, "commonTypeDict_IntegerFormat");
    v22[0] = v18;
    v21[1] = @"VLED";
    uint64_t v17 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
    v22[1] = v16;
    void v21[2] = @"MaxRowCurrent";
    BOOL v15 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
    v22[2] = v14;
    void v21[3] = @"NitsAccum";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
    void v22[3] = v4;
    void v21[4] = @"AverageCurrent";
    uint64_t v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
    void v22[4] = v6;
    v21[5] = @"AZL";
    uint64_t v7 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
    v22[5] = v8;
    v21[6] = @"SystemNits";
    v9 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
    v22[6] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:7];
    v26[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v12;
}

+ (id)entryEventBackwardDefinitionDCPAODstats
{
  v33[2] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F92A38] hasAOD])
  {
    v32[0] = *MEMORY[0x1E4F92C50];
    uint64_t v30 = *MEMORY[0x1E4F92CD0];
    BOOL v31 = &unk_1F40121C8;
    v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    v33[0] = v27;
    v32[1] = *MEMORY[0x1E4F92CA8];
    v28[0] = @"awake_count";
    v26 = [MEMORY[0x1E4F929D8] sharedInstance];
    v25 = objc_msgSend(v26, "commonTypeDict_IntegerFormat");
    v29[0] = v25;
    v28[1] = @"media_count";
    v24 = [MEMORY[0x1E4F929D8] sharedInstance];
    v23 = objc_msgSend(v24, "commonTypeDict_IntegerFormat");
    v29[1] = v23;
    void v28[2] = @"flipbook_count";
    uint64_t v22 = [MEMORY[0x1E4F929D8] sharedInstance];
    v21 = objc_msgSend(v22, "commonTypeDict_IntegerFormat");
    void v29[2] = v21;
    void v28[3] = @"flipbook_delay";
    BOOL v20 = [MEMORY[0x1E4F929D8] sharedInstance];
    v19 = objc_msgSend(v20, "commonTypeDict_IntegerFormat");
    void v29[3] = v19;
    void v28[4] = @"media_scanout";
    uint64_t v18 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v17 = objc_msgSend(v18, "commonTypeDict_IntegerFormat");
    v29[4] = v17;
    v28[5] = @"ambient_count";
    uint64_t v16 = [MEMORY[0x1E4F929D8] sharedInstance];
    BOOL v15 = objc_msgSend(v16, "commonTypeDict_IntegerFormat");
    v29[5] = v15;
    v28[6] = @"prc_repeat_coun";
    uint64_t v14 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v13 = objc_msgSend(v14, "commonTypeDict_IntegerFormat");
    v29[6] = v13;
    v28[7] = @"pdc_repeat_coun";
    uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
    v29[7] = v3;
    v28[8] = @"llm_count";
    uint64_t v4 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v5 = objc_msgSend(v4, "commonTypeDict_IntegerFormat");
    v29[8] = v5;
    v28[9] = @"apl_sum";
    v6 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
    v29[9] = v7;
    v28[10] = @"apl_count";
    BOOL v8 = [MEMORY[0x1E4F929D8] sharedInstance];
    v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
    v29[10] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:11];
    v33[1] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v11;
}

+ (id)entryAggregateDefinitions
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"UserTouch";
  uint64_t v2 = +[PLDisplayAgent entryAggregateDefinitionUserTouch];
  v6[1] = @"ScreenOn";
  v7[0] = v2;
  uint64_t v3 = +[PLDisplayAgent entryAggregateDefinitionScreenOn];
  v7[1] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

+ (id)entryAggregateDefinitionUserTouch
{
  void v21[4] = *MEMORY[0x1E4F143B8];
  if (+[PLDisplayAgent shouldLogTouch])
  {
    v20[0] = *MEMORY[0x1E4F92C50];
    uint64_t v18 = *MEMORY[0x1E4F92CD0];
    v19 = &unk_1F4012148;
    uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    v21[0] = v2;
    v20[1] = *MEMORY[0x1E4F92CA8];
    v16[0] = @"UserTouchCount";
    uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
    uint64_t v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat_aggregateFunction_sum");
    v16[1] = @"UserTouchTime";
    v17[0] = v4;
    uint64_t v5 = [MEMORY[0x1E4F929D8] sharedInstance];
    v6 = objc_msgSend(v5, "commonTypeDict_RealFormat_aggregateFunction_sum");
    v17[1] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
    v21[1] = v7;
    void v20[2] = *MEMORY[0x1E4F92BE0];
    uint64_t v14 = &unk_1F40121D8;
    uint64_t v12 = *MEMORY[0x1E4F92BD8];
    uint64_t v13 = &unk_1F40121E8;
    BOOL v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    BOOL v15 = v8;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    v20[3] = *MEMORY[0x1E4F92BF0];
    void v21[2] = v9;
    void v21[3] = &unk_1F4014488;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:4];
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v10;
}

+ (id)entryAggregateDefinitionScreenOn
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (PLDisplayAgent)init
{
  if ([MEMORY[0x1E4F92A38] isHomePod]) {
    goto LABEL_2;
  }
  v98.receiver = self;
  v98.super_class = (Class)PLDisplayAgent;
  uint64_t v4 = [(PLAgent *)&v98 init];
  if (!v4)
  {
LABEL_61:
    self = v4;
    uint64_t v3 = self;
    goto LABEL_62;
  }
  if (_os_feature_enabled_impl() && [MEMORY[0x1E4F92A38] hasAOD])
  {
    uint64_t v5 = [MEMORY[0x1E4F4F4D0] sharedBacklight];
    [v5 addObserver:v4];

    v6 = [(PLOperator *)v4 workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __22__PLDisplayAgent_init__block_invoke;
    block[3] = &unk_1E6E47848;
    v97 = v4;
    dispatch_async(v6, block);
  }
  v4->_alsOn = [(PLDisplayAgent *)v4 isAlsEnabled];
  v4->_lastALSPowerSaved = 1.79769313e308;
  v4->_isFirstTimeModeling = 1;
  v4->_displaymNits = 0.0;
  v4->_realmNits = 0.0;
  v4->_autobrightnessmNits = 0.0;
  v4->_ShouldLogAmbient = [MEMORY[0x1E4F929C0] BOOLForKey:@"AmbientFullMode" ifNotSet:0];
  v4->_lastRearLuxValue = -1;
  v4->_supportsFinalBrightnessCommit = 0;
  unint64_t v7 = 0x1E4F1C000uLL;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (([MEMORY[0x1E4F92A38] isiPad] & 1) != 0
    || ([MEMORY[0x1E4F92A38] isiPod] & 1) != 0
    || ([MEMORY[0x1E4F92A38] isiPhone] & 1) != 0
    || [MEMORY[0x1E4F92A38] isMac])
  {
    [v8 addObject:@"BacklightPowerMilliWatts"];
    [v8 addObject:@"BacklightPowerNits"];
    [v8 addObject:@"DisplayBrightness"];
    [v8 addObject:@"CBSupportsFinalCommit"];
    [v8 addObject:@"CBFinalBrightnessCommit"];
    [v8 addObject:@"DisplayBrightnessAuto"];
    [v8 addObject:@"PowerLogReport"];
    [v8 addObject:@"CBBlueReductionStatus"];
    if ([MEMORY[0x1E4F92A38] hasAOD])
    {
      [v8 addObject:@"AODRampTelemetry"];
      [v8 addObject:@"AODCurveUpdate"];
      [v8 addObject:@"AODWakeFromALSThreshold"];
      [v8 addObject:@"CBAmbientLightTelemetry"];
    }
    if (+[PLDisplayAgent shouldLogLuxStats])
    {
      v9 = @"RLuxStats";
LABEL_15:
      [v8 addObject:v9];
    }
  }
  else if ([MEMORY[0x1E4F92A38] isWatch])
  {
    v9 = @"InactiveScreenHistory";
    goto LABEL_15;
  }
  if ([MEMORY[0x1E4F5B298] supportsAdaptation])
  {
    uint64_t v10 = (CBAdaptationClient *)objc_alloc_init(MEMORY[0x1E4F5B298]);
    colorAdaptationClient = v4->_colorAdaptationClient;
    v4->_colorAdaptationClient = v10;

    if (v4->_colorAdaptationClient)
    {
      [v8 addObject:@"ColorAdaptationEnabled"];
    }
    else if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v12 = objc_opt_class();
      v95[0] = MEMORY[0x1E4F143A8];
      v95[1] = 3221225472;
      v95[2] = __22__PLDisplayAgent_init__block_invoke_2;
      v95[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v95[4] = v12;
      if (init_defaultOnce_0 != -1) {
        dispatch_once(&init_defaultOnce_0, v95);
      }
      if (init_classDebugEnabled_0)
      {
        uint64_t v13 = [NSString stringWithFormat:@"CBAdaptationClient init fail! Cannot get color adaptation information!"];
        uint64_t v14 = (void *)MEMORY[0x1E4F929B8];
        BOOL v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m"];
        uint64_t v16 = [v15 lastPathComponent];
        uint64_t v17 = [NSString stringWithUTF8String:"-[PLDisplayAgent init]"];
        [v14 logMessage:v13 fromFile:v16 fromFunction:v17 fromLineNumber:1460];

        uint64_t v18 = PLLogCommon();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }

        unint64_t v7 = 0x1E4F1C000;
      }
    }
  }
  pendingBacklightEntryDate = v4->_pendingBacklightEntryDate;
  v4->_pendingBacklightEntryDate = 0;

  BOOL v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  pendingBacklightEntry = v4->_pendingBacklightEntry;
  v4->_pendingBacklightEntry = v20;

  id v22 = objc_alloc(MEMORY[0x1E4F92A80]);
  v23 = [(PLOperator *)v4 workQueue];
  v93[0] = MEMORY[0x1E4F143A8];
  v93[1] = 3221225472;
  v93[2] = __22__PLDisplayAgent_init__block_invoke_1406;
  v93[3] = &unk_1E6E489A8;
  v24 = v4;
  v94 = v24;
  uint64_t v25 = [v22 initWithFireDate:0 withInterval:1 withTolerance:0 repeats:v23 withUserInfo:v93 withQueue:1.0 withBlock:0.0];
  id v26 = v24[18];
  v24[18] = (id)v25;

  [v24[18] arm];
  id v27 = objc_alloc_init(MEMORY[0x1E4F5B290]);
  id v28 = v24[16];
  v24[16] = v27;

  if (!v24[16] && [MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v29 = objc_opt_class();
    v92[0] = MEMORY[0x1E4F143A8];
    v92[1] = 3221225472;
    v92[2] = __22__PLDisplayAgent_init__block_invoke_1417;
    v92[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v92[4] = v29;
    if (init_defaultOnce_1415 != -1) {
      dispatch_once(&init_defaultOnce_1415, v92);
    }
    if (init_classDebugEnabled_1416)
    {
      uint64_t v30 = [NSString stringWithFormat:@"BrightnessSystemClient init fail!"];
      BOOL v31 = (void *)MEMORY[0x1E4F929B8];
      v32 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m"];
      v33 = [v32 lastPathComponent];
      v34 = [NSString stringWithUTF8String:"-[PLDisplayAgent init]"];
      [v31 logMessage:v30 fromFile:v33 fromFunction:v34 fromLineNumber:1488];

      BOOL v35 = PLLogCommon();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }

      unint64_t v7 = 0x1E4F1C000uLL;
    }
  }
  if ([v8 count])
  {
    v36 = [v24 brightnessSystemClient];

    if (v36)
    {
      id v37 = v24[16];
      v90[0] = MEMORY[0x1E4F143A8];
      v90[1] = 3221225472;
      v90[2] = __22__PLDisplayAgent_init__block_invoke_1421;
      v90[3] = &unk_1E6E4A210;
      v91 = v24;
      [v37 registerNotificationBlock:v90 forProperties:v8];
    }
  }
  v38 = [v24 brightnessSystemClient];
  v39 = (void *)[v38 copyPropertyForKey:@"CBSupportsFinalCommit"];
  objc_msgSend(v24, "setSupportsFinalBrightnessCommit:", objc_msgSend(v39, "BOOLValue"));

  v40 = PLLogDisplay();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
    [(PLDisplayAgent *)v24 init];
  }

  if (+[PLDisplayAgent shouldLogFromDCP]
    && !+[PLUtilities isPowerlogHelperd])
  {
    v41 = PLLogDisplay();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E4220000, v41, OS_LOG_TYPE_DEFAULT, "IO object: seting up notification", buf, 2u);
    }

    v42 = [*(id *)(v7 + 2632) array];
    [v24 setAfkEndpoints:v42];

    id v43 = objc_alloc(MEMORY[0x1E4F92A00]);
    uint64_t v44 = *MEMORY[0x1E4F92D68];
    v88[0] = MEMORY[0x1E4F143A8];
    v88[1] = 3221225472;
    v88[2] = __22__PLDisplayAgent_init__block_invoke_1425;
    v88[3] = &unk_1E6E4A238;
    v45 = v24;
    v89 = v45;
    uint64_t v46 = [v43 initWithOperator:v45 forDynamicServiceClass:v44 forNotificationType:"IOServiceMatched" withMatchBlock:v88];
    id v47 = v45[10];
    v45[10] = (id)v46;

    id v48 = objc_alloc(MEMORY[0x1E4F92A80]);
    v49 = [v45 workQueue];
    v86[0] = MEMORY[0x1E4F143A8];
    v86[1] = 3221225472;
    v86[2] = __22__PLDisplayAgent_init__block_invoke_2_1427;
    v86[3] = &unk_1E6E489A8;
    v50 = v45;
    v87 = v50;
    v51 = (void *)[v48 initWithFireDate:0 withInterval:1 withTolerance:0 repeats:v49 withUserInfo:v86 withQueue:10.0 withBlock:10.0];
    [v50 setDcpTimeoffsetCalibTimer:v51];

    v52 = [v50 dcpTimeoffsetCalibTimer];
    [v52 arm];
  }
  id v53 = objc_alloc(MEMORY[0x1E4F92A00]);
  v84[0] = MEMORY[0x1E4F143A8];
  v84[1] = 3221225472;
  v84[2] = __22__PLDisplayAgent_init__block_invoke_1431;
  v84[3] = &unk_1E6E4A260;
  uint64_t v54 = v24;
  v85 = v54;
  uint64_t v55 = [v53 initWithOperator:v54 forService:@"AppleARMBacklight" withBlock:v84];
  id v56 = v54[9];
  v54[9] = (id)v55;

  if (+[PLDisplayAgent shouldLogBacklightControl])
  {
    id v57 = objc_alloc(MEMORY[0x1E4F92A00]);
    v82[0] = MEMORY[0x1E4F143A8];
    v82[1] = 3221225472;
    v82[2] = __22__PLDisplayAgent_init__block_invoke_1457;
    v82[3] = &unk_1E6E4A260;
    v58 = v54;
    v83 = v58;
    uint64_t v59 = [v57 initWithOperator:v58 forService:@"backlight-control" withBlock:v82];
    id v60 = v58[11];
    v58[11] = (id)v59;
  }
  id v61 = objc_alloc(MEMORY[0x1E4F92A00]);
  uint64_t v62 = *MEMORY[0x1E4F92D70];
  v80[0] = MEMORY[0x1E4F143A8];
  v80[1] = 3221225472;
  v80[2] = __22__PLDisplayAgent_init__block_invoke_2_1460;
  v80[3] = &unk_1E6E4A260;
  self = v54;
  v81 = self;
  v63 = (PLIOKitOperatorComposition *)[v61 initWithOperator:self forService:v62 withBlock:v80];
  iokitDisplay = self->_iokitDisplay;
  self->_iokitDisplay = v63;

  if ([MEMORY[0x1E4F92A38] hasDCP]
    && !+[PLUtilities isPowerlogHelperd])
  {
    *(void *)buf = 0;
    int MainDisplay = IOMobileFramebufferGetMainDisplay();
    uint64_t v66 = *(void *)buf;
    v67 = PLLogDisplay();
    v68 = v67;
    if (MainDisplay || !v66)
    {
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
        -[PLDisplayAgent init]();
      }
    }
    else
    {
      if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG)) {
        -[PLDisplayAgent init]();
      }

      RunLoopSource = (__CFRunLoopSource *)IOMobileFramebufferGetRunLoopSource();
      Main = CFRunLoopGetMain();
      CFRunLoopAddSource(Main, RunLoopSource, (CFRunLoopMode)*MEMORY[0x1E4F1D418]);
      IOMobileFramebufferEnablePowerNotifications();
      [(PLDisplayAgent *)self setFrameBuffer:*(void *)buf];
    }
  }
  v71 = (PLIOKitOperatorComposition *)[objc_alloc(MEMORY[0x1E4F92A00]) initWithOperator:self forService:@"AppleMultitouchSPI"];
  iokitTouch = self->_iokitTouch;
  self->_iokitTouch = v71;

  if (self->_iokitDisplay || v54[9] || self->_iokitTouch || v24[16])
  {
    self->_userTouch = 0;
    userTouchDownTime = self->_userTouchDownTime;
    self->_userTouchDownTime = 0;

    self->_touchHIDClientRef = [(PLDisplayAgent *)self setUpIOHIDTouchSystemClient];
    bluelightStatusEntry = self->_bluelightStatusEntry;
    self->_bluelightStatusEntry = 0;

    bluelightFilterTimer = self->_bluelightFilterTimer;
    self->_bluelightFilterTimer = 0;

    uAmpsFilterTimer = self->_uAmpsFilterTimer;
    self->_uAmpsFilterTimer = 0;

    self->_isMIEActive = 0;
    uAmpsEntry = self->_uAmpsEntry;
    self->_uAmpsEntry = 0;

    self->_firstEntryOnInit = 1;
    goto LABEL_61;
  }

LABEL_2:
  uint64_t v3 = 0;
LABEL_62:

  return v3;
}

void __22__PLDisplayAgent_init__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F4F4D0] sharedBacklight];
  uint64_t v3 = [v2 backlightState];

  id v7 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"Display"];
  uint64_t v4 = [*(id *)(a1 + 32) storage];
  uint64_t v5 = [v4 lastEntryForKey:v7];

  v6 = [v5 objectForKeyedSubscript:@"Active"];
  objc_msgSend(*(id *)(a1 + 32), "setLastScreenState:", objc_msgSend(v6, "intValue"));

  [*(id *)(a1 + 32) initAODState:v3];
}

uint64_t __22__PLDisplayAgent_init__block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  init_classDebugEnabled_0 = result;
  return result;
}

void __22__PLDisplayAgent_init__block_invoke_1406(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v4 = (id *)(a1 + 32);
  v6 = [v5 pendingBacklightEntry];

  if (v6)
  {
    if ([*v4 isDebugEnabled])
    {
      id v7 = [PLEventForwardDisplayEntry alloc];
      id v8 = [*v4 pendingBacklightEntry];
      id v9 = [(PLEventForwardDisplayEntry *)v7 initEntryWithRawData:v8];

      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v10 = objc_opt_class();
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __22__PLDisplayAgent_init__block_invoke_2_1408;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        void block[4] = v10;
        if (kPRearNits_block_invoke_defaultOnce != -1) {
          dispatch_once(&kPRearNits_block_invoke_defaultOnce, block);
        }
        if (kPRearNits_block_invoke_classDebugEnabled)
        {
          uint64_t v11 = NSString;
          uint64_t v12 = [v9 objectForKeyedSubscript:@"Brightness"];
          uint64_t v13 = (void *)MEMORY[0x1E4F92A98];
          uint64_t v14 = [*v4 pendingBacklightEntryDate];
          BOOL v15 = [v13 formattedStringForDate:v14];
          uint64_t v16 = [v11 stringWithFormat:@"Writing backlight entry:%@ with date: %@", v12, v15];

          uint64_t v17 = (void *)MEMORY[0x1E4F929B8];
          uint64_t v18 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m"];
          v19 = [v18 lastPathComponent];
          BOOL v20 = [NSString stringWithUTF8String:"-[PLDisplayAgent init]_block_invoke"];
          [v17 logMessage:v16 fromFile:v19 fromFunction:v20 fromLineNumber:1473];

          v21 = PLLogCommon();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
          }
        }
      }
    }
    id v22 = PLLogDisplay();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      __22__PLDisplayAgent_init__block_invoke_1406_cold_3(v4);
    }

    id v23 = *v4;
    v24 = [*v4 pendingBacklightEntry];
    uint64_t v25 = [*v4 pendingBacklightEntryDate];
    [v23 logEventForwardDisplayWithRawData:v24 withDate:v25];

    id v26 = PLLogDisplay();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      __22__PLDisplayAgent_init__block_invoke_1406_cold_2();
    }

    [*v4 setPendingBacklightEntry:0];
    [*v4 setPendingBacklightEntryDate:0];
  }
  else
  {
    id v27 = PLLogDisplay();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
      __22__PLDisplayAgent_init__block_invoke_1406_cold_1(v4, (uint64_t)v3);
    }

    id v28 = [*v4 backlightFilterTimer];
    [v28 setTimerActive:0];
  }
}

uint64_t __22__PLDisplayAgent_init__block_invoke_2_1408(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPRearNits_block_invoke_classDebugEnabled = result;
  return result;
}

uint64_t __22__PLDisplayAgent_init__block_invoke_1417(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  init_classDebugEnabled_1416 = result;
  return result;
}

uint64_t __22__PLDisplayAgent_init__block_invoke_1421(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) handleBrightnessClientNotification:a2 withValue:a3];
}

uint64_t __22__PLDisplayAgent_init__block_invoke_1425(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleAFKInterfaceIOServiceCallback:a2];
}

void __22__PLDisplayAgent_init__block_invoke_2_1427(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  [*(id *)(a1 + 32) currMonoTimestamp];
  double v3 = v2;
  [*v1 currAFKSystemTimestamp];
  double v5 = v4;
  [*v1 currMonoTimestamp];
  if (v6 <= 0.0
    || ([*v1 currAFKSystemTimestamp], v7 <= 0.0)
    || (double v8 = v3 - v5, [*v1 currAFKSystemTimeOffset], v8 == v9))
  {
    uint64_t v11 = [*v1 dcpTimeoffsetCalibTimer];
    [v11 setTimerActive:0];

    uint64_t v12 = PLLogDisplay();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      __22__PLDisplayAgent_init__block_invoke_2_1427_cold_2();
    }
  }
  else
  {
    uint64_t v10 = PLLogDisplay();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __22__PLDisplayAgent_init__block_invoke_2_1427_cold_1(v1, v10, v8);
    }

    [*v1 setCurrAFKSystemTimeOffset:v8];
  }
}

void __22__PLDisplayAgent_init__block_invoke_1431(uint64_t a1, uint64_t a2, int a3)
{
  if (a3 == -536870608)
  {
    block[15] = v3;
    block[16] = v4;
    double v6 = [MEMORY[0x1E4F92A00] snapshotFromIOEntry:a2 forKey:@"IODisplayParameters"];
    BOOL v7 = +[PLDisplayAgent shouldLogFromDCP];
    double v8 = *(void **)(a1 + 32);
    if (v7)
    {
      double v9 = [*(id *)(a1 + 32) pendingBacklightEntry];

      if (!v9)
      {
LABEL_26:

        return;
      }
      uint64_t v10 = [v6 objectForKey:@"brightness"];
      uint64_t v11 = [v10 objectForKey:@"value"];
      uint64_t v12 = [v11 longValue];

      uint64_t v13 = [v10 objectForKey:@"min"];
      uint64_t v14 = [v13 longValue];

      BOOL v15 = [v10 objectForKey:@"max"];
      uint64_t v16 = [v15 longValue];

      uint64_t v17 = [MEMORY[0x1E4F28ED0] numberWithDouble:(double)(v12 - v14) * 100.0 / (double)(v16 - v14)];
      uint64_t v18 = [*(id *)(a1 + 32) pendingBacklightEntry];
      [v18 setObject:v17 forKeyedSubscript:@"Brightness"];

      v19 = [MEMORY[0x1E4F28ED0] numberWithLong:v12];
      BOOL v20 = [*(id *)(a1 + 32) pendingBacklightEntry];
      [v20 setObject:v19 forKeyedSubscript:@"SliderValue"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v6];
      [v8 setPendingBacklightEntry:v21];

      id v22 = [*(id *)(a1 + 32) pendingBacklightEntryDate];

      if (!v22)
      {
        id v23 = [MEMORY[0x1E4F1C9C8] monotonicDate];
        [*(id *)(a1 + 32) setPendingBacklightEntryDate:v23];
      }
      if ([*(id *)(a1 + 32) isDebugEnabled])
      {
        id v24 = [[PLEventForwardDisplayEntry alloc] initEntryWithRawData:v6];
        uint64_t v25 = [PLEventForwardDisplayEntry alloc];
        id v26 = [*(id *)(a1 + 32) pendingBacklightEntry];
        id v27 = [(PLEventForwardDisplayEntry *)v25 initEntryWithRawData:v26];

        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v28 = objc_opt_class();
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __22__PLDisplayAgent_init__block_invoke_2_1443;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          void block[4] = v28;
          if (kPRearNits_block_invoke_2_defaultOnce != -1) {
            dispatch_once(&kPRearNits_block_invoke_2_defaultOnce, block);
          }
          if (kPRearNits_block_invoke_2_classDebugEnabled)
          {
            uint64_t v29 = NSString;
            uint64_t v30 = [v24 objectForKeyedSubscript:@"Brightness"];
            BOOL v31 = [v27 objectForKeyedSubscript:@"Brightness"];
            v32 = (void *)MEMORY[0x1E4F92A98];
            v33 = [*(id *)(a1 + 32) pendingBacklightEntryDate];
            v34 = [v32 formattedStringForDate:v33];
            BOOL v35 = [v29 stringWithFormat:@"rawData.brightness=%@ self.pendingBacklightEntry.brightness=%@ self.pendingBacklightEntryDate=%@", v30, v31, v34];

            v36 = (void *)MEMORY[0x1E4F929B8];
            id v37 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m"];
            v38 = [v37 lastPathComponent];
            v39 = [NSString stringWithUTF8String:"-[PLDisplayAgent init]_block_invoke"];
            [v36 logMessage:v35 fromFile:v38 fromFunction:v39 fromLineNumber:1555];

            v40 = PLLogCommon();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
              __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
            }
          }
        }
      }
      v41 = [*(id *)(a1 + 32) backlightFilterTimer];
      char v42 = [v41 timerActive];

      if (v42) {
        goto LABEL_26;
      }
      uint64_t v10 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:1.0];
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v43 = objc_opt_class();
        v53[0] = MEMORY[0x1E4F143A8];
        v53[1] = 3221225472;
        void v53[2] = __22__PLDisplayAgent_init__block_invoke_1449;
        v53[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v53[4] = v43;
        if (kPRearNits_block_invoke_2_defaultOnce_1447 != -1) {
          dispatch_once(&kPRearNits_block_invoke_2_defaultOnce_1447, v53);
        }
        if (kPRearNits_block_invoke_2_classDebugEnabled_1448)
        {
          uint64_t v44 = NSString;
          v45 = [MEMORY[0x1E4F92A98] formattedStringForDate:v10];
          uint64_t v46 = [v44 stringWithFormat:@"Start backlight entry filter timer fireDate=%@", v45];

          id v47 = (void *)MEMORY[0x1E4F929B8];
          id v48 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m"];
          v49 = [v48 lastPathComponent];
          v50 = [NSString stringWithUTF8String:"-[PLDisplayAgent init]_block_invoke_2"];
          [v47 logMessage:v46 fromFile:v49 fromFunction:v50 fromLineNumber:1560];

          v51 = PLLogCommon();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG)) {
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
          }
        }
      }
      v52 = [*(id *)(a1 + 32) backlightFilterTimer];
      [v52 setFireDate:v10];
    }
    goto LABEL_26;
  }
}

uint64_t __22__PLDisplayAgent_init__block_invoke_2_1443(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPRearNits_block_invoke_2_classDebugEnabled = result;
  return result;
}

uint64_t __22__PLDisplayAgent_init__block_invoke_1449(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPRearNits_block_invoke_2_classDebugEnabled_1448 = result;
  return result;
}

void __22__PLDisplayAgent_init__block_invoke_1457(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "getBacklightEnabledTimestamp:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 88), "service"));
  uint64_t v3 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"BacklightControl"];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v3];
  double v5 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v2];
  [v4 setObject:v5 forKeyedSubscript:@"backlightEnabledTimestamp"];

  double v6 = *(void **)(a1 + 32);
  v8[0] = v4;
  BOOL v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [v6 postEntries:v7];
}

uint64_t __22__PLDisplayAgent_init__block_invoke_2_1460(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v4 = result;
  switch(a3)
  {
    case -536788734:
      BOOL v6 = a4 != 0;
      [*(id *)(result + 32) logEventPointDisplayForBlock:@"MIE" isActive:v6];
      BOOL v7 = *(void **)(v4 + 32);
      return [v7 setIsMIEActive:v6];
    case -536788735:
      double v8 = *(void **)(result + 32);
      return [v8 logEventPointDisplayForBlock:@"Backlight" isActive:0];
    case -536788736:
      [*(id *)(result + 32) logEventPointDisplayForBlock:@"Backlight" isActive:1];
      double v5 = *(void **)(v4 + 32);
      return [v5 logEventBackwardTouch];
  }
  return result;
}

- (void)initTaskOperatorDependancies
{
  if ([MEMORY[0x1E4F92A38] hasCapability:8])
  {
    if ([MEMORY[0x1E4F92A38] hasDCP])
    {
      if (!+[PLUtilities isPowerlogHelperd])
      {
        int v3 = [MEMORY[0x1E4F929C0] BOOLForKey:@"AZLFullMode" ifNotSet:0];
        if (![MEMORY[0x1E4F929C0] fullMode] || v3)
        {
          uint64_t v4 = *MEMORY[0x1E4F92D30];
          double v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"AZLSnapshots"];
          if (![MEMORY[0x1E4F929C0] taskMode]
            || (BOOL v6 = (void *)MEMORY[0x1E4F929E0],
                [(PLOperator *)self className],
                BOOL v7 = objc_claimAutoreleasedReturnValue(),
                LODWORD(v6) = [v6 isEntryKeySetup:v5 forOperatorName:v7],
                v7,
                v6))
          {
            double v8 = +[PLOperator entryKeyForType:v4 andName:@"AZLSnapshots"];
            double v9 = [(PLOperator *)self storage];
            -[PLDisplayAgent setAZLSnapshotsEntries:](self, "setAZLSnapshotsEntries:", [v9 countOfEntriesForKey:v8]);

            id v10 = objc_alloc(MEMORY[0x1E4F92A80]);
            uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
            uint64_t v12 = [(PLOperator *)self workQueue];
            v14[0] = MEMORY[0x1E4F143A8];
            v14[1] = 3221225472;
            v14[2] = __46__PLDisplayAgent_initTaskOperatorDependancies__block_invoke;
            void v14[3] = &unk_1E6E489A8;
            void v14[4] = self;
            uint64_t v13 = (void *)[v10 initWithFireDate:v11 withInterval:1 withTolerance:0 repeats:v12 withUserInfo:v14 withQueue:300.0 withBlock:0.0];
            [(PLDisplayAgent *)self setAZLSnapshotsTimer:v13];
          }
        }
      }
    }
  }
}

uint64_t __46__PLDisplayAgent_initTaskOperatorDependancies__block_invoke(uint64_t a1)
{
  if (![MEMORY[0x1E4F929C0] fullMode]
    || (uint64_t result = [MEMORY[0x1E4F929C0] BOOLForKey:@"AZLFullMode"], result))
  {
    if ([MEMORY[0x1E4F929C0] taskMode]
      && [*(id *)(a1 + 32) AZLSnapshotsEntries] >= 21600)
    {
      int v3 = PLLogDisplay();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
        __46__PLDisplayAgent_initTaskOperatorDependancies__block_invoke_cold_1();
      }

      return [*(id *)(*(void *)(a1 + 32) + 184) invalidate];
    }
    else
    {
      uint64_t v4 = *(void **)(a1 + 32);
      uint64_t v5 = v4[64];
      return objc_msgSend(v4, "__FrameBufferEventCallback:", v5);
    }
  }
  return result;
}

- (void)initOperatorDependancies
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "Initializing AZL Stats", v2, v3, v4, v5, v6);
}

void __42__PLDisplayAgent_initOperatorDependancies__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 logDisplayAPL];
  [*(id *)(a1 + 32) updateLastForegroundAppAPL:v4];
}

uint64_t __42__PLDisplayAgent_initOperatorDependancies__block_invoke_1478(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleSBC];
}

uint64_t __42__PLDisplayAgent_initOperatorDependancies__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) logDisplayAZL];
}

uint64_t __42__PLDisplayAgent_initOperatorDependancies__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) modelDynamicDisplayPower:a2];
}

void __42__PLDisplayAgent_initOperatorDependancies__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PLLogDisplay();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __42__PLDisplayAgent_initOperatorDependancies__block_invoke_4_cold_1();
  }

  [*(id *)(a1 + 32) logAODChange];
}

uint64_t __42__PLDisplayAgent_initOperatorDependancies__block_invoke_1494(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) logEventPointMultitouchWithPayload:a5];
}

uint64_t __42__PLDisplayAgent_initOperatorDependancies__block_invoke_2_1497(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  initOperatorDependancies_classDebugEnabled_1 = result;
  return result;
}

void __42__PLDisplayAgent_initOperatorDependancies__block_invoke_1507(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v7 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__PLDisplayAgent_initOperatorDependancies__block_invoke_2_1508;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v7;
    if (kPRearNits_block_invoke_3_defaultOnce != -1) {
      dispatch_once(&kPRearNits_block_invoke_3_defaultOnce, block);
    }
    if (kPRearNits_block_invoke_3_classDebugEnabled)
    {
      double v8 = NSString;
      uint64_t v9 = [v5 UTF8String];
      id v10 = [v6 description];
      uint64_t v11 = objc_msgSend(v8, "stringWithFormat:", @"Keyboard brightness: %s=%s\n", v9, objc_msgSend(v10, "UTF8String"));

      uint64_t v12 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v13 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m"];
      uint64_t v14 = [v13 lastPathComponent];
      BOOL v15 = [NSString stringWithUTF8String:"-[PLDisplayAgent initOperatorDependancies]_block_invoke"];
      [v12 logMessage:v11 fromFile:v14 fromFunction:v15 fromLineNumber:1918];

      uint64_t v16 = PLLogCommon();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  [v6 doubleValue];
  objc_msgSend(*(id *)(a1 + 32), "setPendingKeyboardBrightnessValue:");
  uint64_t v17 = [*(id *)(a1 + 32) pendingKeyboardBrightnessDate];

  if (!v17)
  {
    uint64_t v18 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    [*(id *)(a1 + 32) setPendingKeyboardBrightnessDate:v18];
  }
  v19 = [*(id *)(a1 + 32) keyboardBrightnessFilterTimer];
  char v20 = [v19 timerActive];

  if ((v20 & 1) == 0)
  {
    v21 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.5];
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v22 = objc_opt_class();
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      void v32[2] = __42__PLDisplayAgent_initOperatorDependancies__block_invoke_1514;
      void v32[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v32[4] = v22;
      if (kPRearNits_block_invoke_3_defaultOnce_1512 != -1) {
        dispatch_once(&kPRearNits_block_invoke_3_defaultOnce_1512, v32);
      }
      if (kPRearNits_block_invoke_3_classDebugEnabled_1513)
      {
        id v23 = NSString;
        id v24 = [MEMORY[0x1E4F92A98] formattedStringForDate:v21];
        uint64_t v25 = [v23 stringWithFormat:@"Start keyboard brightness filter timer fireDate=%@", v24];

        id v26 = (void *)MEMORY[0x1E4F929B8];
        id v27 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m"];
        uint64_t v28 = [v27 lastPathComponent];
        uint64_t v29 = [NSString stringWithUTF8String:"-[PLDisplayAgent initOperatorDependancies]_block_invoke_2"];
        [v26 logMessage:v25 fromFile:v28 fromFunction:v29 fromLineNumber:1927];

        uint64_t v30 = PLLogCommon();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }
    BOOL v31 = [*(id *)(a1 + 32) keyboardBrightnessFilterTimer];
    [v31 setFireDate:v21];
  }
}

uint64_t __42__PLDisplayAgent_initOperatorDependancies__block_invoke_2_1508(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPRearNits_block_invoke_3_classDebugEnabled = result;
  return result;
}

uint64_t __42__PLDisplayAgent_initOperatorDependancies__block_invoke_1514(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPRearNits_block_invoke_3_classDebugEnabled_1513 = result;
  return result;
}

void __42__PLDisplayAgent_initOperatorDependancies__block_invoke_1520(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) pendingKeyboardBrightnessDate];

  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    [*(id *)(a1 + 32) pendingKeyboardBrightnessValue];
    double v5 = v4;
    id v6 = [*(id *)(a1 + 32) pendingKeyboardBrightnessDate];
    [v3 logEventPointKeyboardBrightness:v6 withDate:v5];

    uint64_t v7 = *(void **)(a1 + 32);
    [v7 setPendingKeyboardBrightnessDate:0];
  }
  else
  {
    id v8 = [*(id *)(a1 + 32) keyboardBrightnessFilterTimer];
    [v8 setTimerActive:0];
  }
}

void __42__PLDisplayAgent_initOperatorDependancies__block_invoke_2_1525(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = PLLogDisplay();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __41__PLCameraAgent_initOperatorDependancies__block_invoke_172_cold_1();
  }

  [*(id *)(a1 + 32) logDisplayAPL];
}

- (void)handleAFKInterfaceIOServiceCallback:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t entryID = 0;
  IORegistryEntryGetRegistryEntryID(a3, &entryID);
  double v5 = PLLogDisplay();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v23 = entryID;
    _os_log_impl(&dword_1E4220000, v5, OS_LOG_TYPE_DEFAULT, "Registry ID: %llu", buf, 0xCu);
  }

  CFMutableDictionaryRef properties = 0;
  if (IORegistryEntryCreateCFProperties(v3, &properties, (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0)) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = properties == 0;
  }
  if (v6)
  {
    uint64_t v7 = PLLogDisplay();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[PLDisplayAgent handleAFKInterfaceIOServiceCallback:]();
    }
  }
  else
  {
    CFTypeID v8 = CFGetTypeID(properties);
    if (v8 == CFDictionaryGetTypeID())
    {
      uint64_t v7 = properties;
      uint64_t v9 = PLLogDisplay();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v23 = (uint64_t)v7;
        _os_log_impl(&dword_1E4220000, v9, OS_LOG_TYPE_DEFAULT, "IO object property: %@", buf, 0xCu);
      }

      id v10 = [AFKEndpointInterfacePowerlogDisplay alloc];
      uint64_t v11 = [(PLDisplayAgent *)self iokitBacklightDCP];
      uint64_t v12 = [(AFKEndpointInterfacePowerlogDisplay *)v10 initWithService:v3 andIOKitComposition:v11];

      if (v12)
      {
        uint64_t v13 = [(PLDisplayAgent *)self afkEndpoints];
        [v13 addObject:v12];

        uint64_t v14 = [(PLOperator *)self workQueue];
        [(AFKEndpointInterface *)v12 setDispatchQueue:v14];

        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        void v19[2] = __54__PLDisplayAgent_handleAFKInterfaceIOServiceCallback___block_invoke;
        void v19[3] = &unk_1E6E4A2B0;
        v19[4] = self;
        [(AFKEndpointInterface *)v12 setReportHandler:v19];
        [(AFKEndpointInterface *)v12 activate];
        BOOL v15 = PLLogDisplay();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1E4220000, v15, OS_LOG_TYPE_DEFAULT, "AFKInterface activated", buf, 2u);
        }

        uint64_t v16 = [(PLDisplayAgent *)self afkEndpoints];
        unint64_t v17 = [v16 count];

        if (v17 >= 2) {
          [(PLDisplayAgent *)self cleanUpAFKInterfaces];
        }
      }
      else
      {
        uint64_t v18 = PLLogDisplay();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          -[PLDisplayAgent handleAFKInterfaceIOServiceCallback:]();
        }
      }
    }
    else
    {
      uint64_t v7 = PLLogDisplay();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[PLDisplayAgent handleAFKInterfaceIOServiceCallback:]();
      }
    }
  }
}

void __54__PLDisplayAgent_handleAFKInterfaceIOServiceCallback___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const char *a5, size_t a6)
{
  uint64_t v9 = PLLogDisplay();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __54__PLDisplayAgent_handleAFKInterfaceIOServiceCallback___block_invoke_cold_6();
  }

  if (a5 && a6)
  {
    CFStringRef errorString = 0;
    id v10 = IOCFUnserializeWithSize(a5, a6, (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, &errorString);
    CFStringRef v11 = errorString;
    uint64_t v12 = (id)errorString;
    uint64_t v13 = v12;
    if (v11)
    {
    }
    else if (v10)
    {
      CFTypeID v14 = CFGetTypeID(v10);
      CFTypeID TypeID = CFDictionaryGetTypeID();
      uint64_t v16 = PLLogDisplay();
      unint64_t v17 = v16;
      if (v14 == TypeID)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
          __54__PLDisplayAgent_handleAFKInterfaceIOServiceCallback___block_invoke_cold_3();
        }

        uint64_t v18 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v10];
        [*(id *)(a1 + 32) fillInBuiltinDisplayBrightnessParameters:v18];
        v19 = PLLogDisplay();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          __54__PLDisplayAgent_handleAFKInterfaceIOServiceCallback___block_invoke_cold_2();
        }

        [*(id *)(a1 + 32) handleAFKInterfaceMsg:v18];
      }
      else
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          __54__PLDisplayAgent_handleAFKInterfaceIOServiceCallback___block_invoke_cold_4();
        }
        id v10 = v17;
      }
      goto LABEL_9;
    }
    id v10 = PLLogDisplay();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __54__PLDisplayAgent_handleAFKInterfaceIOServiceCallback___block_invoke_cold_1();
    }
LABEL_9:

    goto LABEL_12;
  }
  uint64_t v13 = PLLogDisplay();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    __54__PLDisplayAgent_handleAFKInterfaceIOServiceCallback___block_invoke_cold_5();
  }
LABEL_12:
}

- (void)fillInBuiltinDisplayBrightnessParameters:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  [v5 timeIntervalSince1970];
  double v7 = v6;

  [(PLDisplayAgent *)self lastBuiltinDisplayTime];
  double v9 = v8;
  [(PLDisplayAgent *)self lastBuiltinDisplayTime];
  if (v10 > 0.0)
  {
    double v10 = v7 - v9;
    if (v7 - v9 > 0.0 && v10 < 0.6)
    {
      CFStringRef v11 = (void *)MEMORY[0x1E4F28ED0];
      [(PLDisplayAgent *)self lastBuiltinDisplayLux];
      uint64_t v12 = objc_msgSend(v11, "numberWithDouble:");
      [v4 setObject:v12 forKeyedSubscript:@"lux"];

      [(PLDisplayAgent *)self lastBuiltinDisplayBrightness];
      if (v13 >= 0.0)
      {
        CFTypeID v14 = (void *)MEMORY[0x1E4F28ED0];
        [(PLDisplayAgent *)self lastBuiltinDisplayBrightness];
        BOOL v15 = objc_msgSend(v14, "numberWithDouble:");
        [v4 setObject:v15 forKeyedSubscript:@"Brightness"];
      }
      [(PLDisplayAgent *)self lastBuiltinDisplaySliderValue];
      if (v16 >= 0.0)
      {
        unint64_t v17 = (void *)MEMORY[0x1E4F28ED0];
        [(PLDisplayAgent *)self lastBuiltinDisplaySliderValue];
        uint64_t v18 = objc_msgSend(v17, "numberWithDouble:");
        [v4 setObject:v18 forKeyedSubscript:@"SliderValue"];
      }
      goto LABEL_23;
    }
  }
  v19 = [(PLDisplayAgent *)self brightnessSystemClient];
  char v20 = (void *)[v19 copyPropertyForKey:@"TrustedLux"];
  [v20 doubleValue];
  -[PLDisplayAgent setLastBuiltinDisplayLux:](self, "setLastBuiltinDisplayLux:");

  v21 = [(PLDisplayAgent *)self brightnessSystemClient];
  uint64_t v22 = (void *)[v21 copyPropertyForKey:@"DisplayBrightnessMin"];
  [v22 doubleValue];
  double v24 = v23;

  uint64_t v25 = [(PLDisplayAgent *)self brightnessSystemClient];
  id v26 = (void *)[v25 copyPropertyForKey:@"DisplayBrightnessMax"];
  [v26 doubleValue];
  double v28 = v27;

  uint64_t v29 = [(PLDisplayAgent *)self brightnessSystemClient];
  uint64_t v30 = (void *)[v29 copyPropertyForKey:@"DisplayBrightness"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v30 doubleValue];
    double v32 = v31;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_15:
      [(PLDisplayAgent *)self setLastBuiltinDisplayBrightness:-1.0];
      [(PLDisplayAgent *)self setLastBuiltinDisplaySliderValue:-1.0];
      BOOL v35 = PLLogDisplay();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        int v44 = 138412290;
        v45 = v30;
        _os_log_impl(&dword_1E4220000, v35, OS_LOG_TYPE_DEFAULT, "Not logging brightness value: %@", (uint8_t *)&v44, 0xCu);
      }

      goto LABEL_18;
    }
    v33 = [v30 objectForKeyedSubscript:@"Brightness"];
    [v33 doubleValue];
    double v32 = v34;
  }
  if (v32 < 0.0 || v28 - v24 <= 0.0) {
    goto LABEL_15;
  }
  [(PLDisplayAgent *)self setLastBuiltinDisplayBrightness:(v32 - v24) * 100.0 / (v28 - v24)];
  [(PLDisplayAgent *)self setLastBuiltinDisplaySliderValue:v32];
LABEL_18:
  [(PLDisplayAgent *)self setLastBuiltinDisplayTime:v7];
  v36 = (void *)MEMORY[0x1E4F28ED0];
  [(PLDisplayAgent *)self lastBuiltinDisplayLux];
  id v37 = objc_msgSend(v36, "numberWithDouble:");
  [v4 setObject:v37 forKeyedSubscript:@"lux"];

  [(PLDisplayAgent *)self lastBuiltinDisplayBrightness];
  if (v38 >= 0.0)
  {
    v39 = (void *)MEMORY[0x1E4F28ED0];
    [(PLDisplayAgent *)self lastBuiltinDisplayBrightness];
    v40 = objc_msgSend(v39, "numberWithDouble:");
    [v4 setObject:v40 forKeyedSubscript:@"Brightness"];
  }
  [(PLDisplayAgent *)self lastBuiltinDisplaySliderValue];
  if (v41 >= 0.0)
  {
    char v42 = (void *)MEMORY[0x1E4F28ED0];
    [(PLDisplayAgent *)self lastBuiltinDisplaySliderValue];
    uint64_t v43 = objc_msgSend(v42, "numberWithDouble:");
    [v4 setObject:v43 forKeyedSubscript:@"SliderValue"];
  }
LABEL_23:
}

- (void)cleanUpAFKInterfaces
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(PLDisplayAgent *)self afkEndpoints];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (([v9 valid] & 1) == 0) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  double v10 = [(PLDisplayAgent *)self afkEndpoints];
  [v10 removeObjectsInArray:v3];
}

- (void)handleAFKInterfaceMsg:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"timestamp"];
  [v5 doubleValue];
  double v7 = v6;

  [(PLDisplayAgent *)self currAFKSystemTimeOffset];
  if (v8 == 0.0)
  {
    [MEMORY[0x1E4F1C9C8] monotonicDate];
  }
  else
  {
    double v9 = (void *)MEMORY[0x1E4F1C9C8];
    [(PLDisplayAgent *)self currAFKSystemTimeOffset];
    [v9 dateWithTimeIntervalSince1970:v7 / 1000000.0 + v10];
  long long v11 = };
  uint64_t v12 = [(PLDisplayAgent *)self pendingBacklightEntry];
  if (v12)
  {
    long long v13 = (void *)v12;
    uint64_t v14 = [(PLDisplayAgent *)self pendingBacklightEntryDate];
    if (v14)
    {
      BOOL v15 = (void *)v14;
      uint64_t v16 = [(PLDisplayAgent *)self pendingBacklightEntryDate];
      [v11 timeIntervalSinceDate:v16];
      double v18 = v17;

      if (v18 < 1.0) {
        goto LABEL_9;
      }
      long long v13 = [(PLDisplayAgent *)self pendingBacklightEntry];
      v19 = [(PLDisplayAgent *)self pendingBacklightEntryDate];
      [(PLDisplayAgent *)self logEventForwardDisplayWithRawData:v13 withDate:v19];
    }
  }
LABEL_9:
  [(PLDisplayAgent *)self setPendingBacklightEntry:v4];
  [(PLDisplayAgent *)self setPendingBacklightEntryDate:v11];
  char v20 = [(PLDisplayAgent *)self backlightFilterTimer];
  char v21 = [v20 timerActive];

  if ((v21 & 1) == 0)
  {
    uint64_t v22 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:1.0];
    double v23 = [(PLDisplayAgent *)self backlightFilterTimer];
    [v23 setFireDate:v22];
  }
  double v24 = [(PLDisplayAgent *)self dcpTimeoffsetCalibTimer];
  char v25 = [v24 timerActive];

  if ((v25 & 1) == 0)
  {
    id v31 = 0;
    unint64_t v32 = 0;
    +[PLUtilities getCurrentMonotonicAndMachAbsTime:&v31 machAbsTime:0 machContTime:&v32];
    id v26 = v31;
    [(PLDisplayAgent *)self setCurrAFKSystemTimestamp:(double)v32 / 1000000000.0];
    [v26 timeIntervalSince1970];
    double v28 = v27;

    [(PLDisplayAgent *)self setCurrMonoTimestamp:v28];
    uint64_t v29 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:10.0];
    uint64_t v30 = [(PLDisplayAgent *)self dcpTimeoffsetCalibTimer];
    [v30 setFireDate:v29];
  }
}

- (void)logEventPointMultitouchWithPayload:(id)a3
{
  char v25 = self;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v30 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"Multitouch"];
  double v28 = objc_opt_new();
  uint64_t v29 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v26 = v3;
  id obj = [v3 objectForKeyedSubscript:@"events"];
  uint64_t v4 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v32;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v32 != v6) {
          objc_enumerationMutation(obj);
        }
        double v8 = *(void **)(*((void *)&v31 + 1) + 8 * v7);
        double v9 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v30 withDate:v29];
        double v10 = [v8 objectForKeyedSubscript:@"fingerNum"];
        [v9 setObject:v10 forKeyedSubscript:@"fingerNum"];

        long long v11 = [v8 objectForKeyedSubscript:@"touchStartTime"];
        [v9 setObject:v11 forKeyedSubscript:@"touchStartTime"];

        uint64_t v12 = [v8 objectForKeyedSubscript:@"touchStopTime"];
        [v9 setObject:v12 forKeyedSubscript:@"touchStopTime"];

        if ([MEMORY[0x1E4F92A38] hasOrb])
        {
          long long v13 = [v8 objectForKeyedSubscript:@"peakForce"];
          [v9 setObject:v13 forKeyedSubscript:@"peak"];

          uint64_t v14 = [v8 objectForKeyedSubscript:@"peakForceMillimetersFromEdge"];
          [v9 setObject:v14 forKeyedSubscript:@"peakMillimetersFromEdge"];

          BOOL v15 = [v8 objectForKeyedSubscript:@"peakForceProximity"];
          [v9 setObject:v15 forKeyedSubscript:@"peakProximity"];

          uint64_t v16 = [v8 objectForKeyedSubscript:@"peakForceMajorRadius"];
          [v9 setObject:v16 forKeyedSubscript:@"peakMajorRadius"];

          double v17 = [v8 objectForKeyedSubscript:@"peakForceMinorRadius"];
          double v18 = v9;
          v19 = v17;
          char v20 = @"peakMinorRadius";
        }
        else
        {
          char v21 = [v8 objectForKeyedSubscript:@"peakProximity"];
          [v9 setObject:v21 forKeyedSubscript:@"peakProximity"];

          uint64_t v22 = [v8 objectForKeyedSubscript:@"peakProximityMillimetersFromEdge"];
          [v9 setObject:v22 forKeyedSubscript:@"peakProximityMillimetersFromEdge"];

          double v23 = [v8 objectForKeyedSubscript:@"peakProximityMajorRadius"];
          [v9 setObject:v23 forKeyedSubscript:@"peakProximityMajorRadius"];

          double v17 = [v8 objectForKeyedSubscript:@"peakProximityMinorRadius"];
          double v18 = v9;
          v19 = v17;
          char v20 = @"peakProximityMinorRadius";
        }
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, v20, v25);

        [v28 addObject:v9];
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v5);
  }

  BOOL v35 = v30;
  v36 = v28;
  double v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
  [(PLOperator *)v25 logEntries:v24 withGroupID:v30];
}

- (void)dealloc
{
  if (+[PLDisplayAgent shouldLogFromDCP]
    && [(PLDisplayAgent *)self frameBuffer])
  {
    [(PLDisplayAgent *)self frameBuffer];
    IOMobileFramebufferDisablePowerNotifications();
    CFRelease([(PLDisplayAgent *)self frameBuffer]);
  }
  if (self->_ambientLightSensorHIDClientRef)
  {
    IOHIDEventSystemClientUnregisterEventCallback();
    if (self->_alsPluginKeyRegistered) {
      IOHIDEventSystemClientUnregisterDeviceMatchingCallback();
    }
  }
  if (_os_feature_enabled_impl() && [MEMORY[0x1E4F92A38] hasAOD])
  {
    id v3 = [MEMORY[0x1E4F4F4D0] sharedBacklight];
    [v3 removeObserver:self];
  }
  v4.receiver = self;
  v4.super_class = (Class)PLDisplayAgent;
  [(PLAgent *)&v4 dealloc];
}

- (BOOL)isAlsEnabled
{
  char v2 = 1;
  id v3 = [MEMORY[0x1E4F929C0] objectForKey:@"BKEnableALS" forApplicationID:@"com.apple.backboardd" synchronize:1];
  objc_super v4 = v3;
  if (v3) {
    char v2 = [v3 BOOLValue];
  }

  return v2;
}

- (int64_t)getBuiltInDisplayID:(id)a3
{
  return 0;
}

- (void)log
{
  [(PLDisplayAgent *)self logEventForwardDisplay];
  [(PLDisplayAgent *)self logEventPointDisplay];
  [(PLDisplayAgent *)self logEventForwardALSEnabled];
  [(PLDisplayAgent *)self logEventForwardALSUserPreferences];
  [(PLDisplayAgent *)self logEventForwardColorAdaptationMode];
}

- (void)logEventNonePanelStats
{
  id v3 = [(PLDisplayAgent *)self brightnessSystemClient];

  if (v3 && ([MEMORY[0x1E4F92A38] isMac] & 1) == 0)
  {
    objc_super v4 = [(PLDisplayAgent *)self brightnessSystemClient];
    id v7 = (id)[v4 copyPropertyForKey:@"BrightnessGlobalScalar"];

    if (v7 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      uint64_t v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D40] andName:@"PanelStats"];
      uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v5 withRawData:v7];
      [(PLOperator *)self logEntry:v6];
    }
  }
}

- (void)logDisplayEntry:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 dictionary];
  uint64_t v6 = [v4 entryDate];
  [(PLOperator *)self logForSubsystem:@"DisplayMetrics" category:@"DisplayState" data:v5 date:v6];

  id v8 = [v4 dictionary];
  id v7 = [v4 entryDate];

  [(PLOperator *)self logForSubsystem:@"DisplayMetrics" category:@"DisplayStateExtended" data:v8 date:v7];
}

- (void)logEventPointDisplay
{
  [(PLDisplayAgent *)self logEventPointDisplayBacklight];
  [(PLDisplayAgent *)self logEventPointDisplayMIE];
}

- (void)logEventPointDisplayBacklight
{
  if (!+[PLDisplayAgent shouldLogFromDCP] && self->_iokitBacklight)
  {
    id v3 = [(PLDisplayAgent *)self iokitBacklight];
    id v5 = [v3 propertiesForKey:@"IOPowerManagement"];

    id v4 = [v5 objectForKeyedSubscript:@"CurrentPowerState"];
    -[PLDisplayAgent logEventPointDisplayForBlock:isActive:](self, "logEventPointDisplayForBlock:isActive:", @"Backlight", [v4 BOOLValue]);
  }
}

- (void)logEventPointDisplayMIE
{
  if (!+[PLDisplayAgent shouldLogFromDCP] && self->_iokitDisplay)
  {
    id v3 = [(PLDisplayAgent *)self iokitDisplay];
    id v7 = [v3 propertiesForKey:@"IOMFB Debug Info"];

    id v4 = [v7 objectForKeyedSubscript:@"MIE"];

    if (v4)
    {
      id v5 = [v7 objectForKeyedSubscript:@"MIE"];
      uint64_t v6 = [v5 objectForKeyedSubscript:@"enabled"];
      -[PLDisplayAgent logEventPointDisplayForBlock:isActive:](self, "logEventPointDisplayForBlock:isActive:", @"MIE", [v6 BOOLValue]);
    }
  }
}

- (void)logEventPointDisplayBacklightWithState:(unint64_t)a3
{
  id v5 = PLLogDisplay();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[PLDisplayAgent logEventPointDisplayBacklightWithState:]();
  }

  [(PLDisplayAgent *)self logEventPointDisplayForBlock:@"Backlight" isActive:a3 != 0];
}

- (void)logEventPointDisplayForBlock:(id)a3 isActive:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  void v24[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (+[PLDisplayAgent shouldLogDisplay]
    || +[PLDisplayAgent shouldLogLCD])
  {
    id v7 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"Display"];
    id v8 = [(PLOperator *)self storage];
    double v9 = [v8 lastEntryForKey:v7 withSubEntryKey:v6];

    double v10 = [v9 objectForKeyedSubscript:@"Active"];
    if ([v10 intValue] == v4)
    {
      BOOL v11 = [(PLDisplayAgent *)self firstEntryOnInit];

      if (!v11)
      {
        if (![MEMORY[0x1E4F929C0] debugEnabled]) {
          goto LABEL_17;
        }
        uint64_t v12 = objc_opt_class();
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __56__PLDisplayAgent_logEventPointDisplayForBlock_isActive___block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        void block[4] = v12;
        if (logEventPointDisplayForBlock_isActive__defaultOnce != -1) {
          dispatch_once(&logEventPointDisplayForBlock_isActive__defaultOnce, block);
        }
        if (!logEventPointDisplayForBlock_isActive__classDebugEnabled) {
          goto LABEL_17;
        }
        long long v13 = [NSString stringWithFormat:@"filtering block %@ isActive %d due to lastEntry %@", v6, v4, v9];
        uint64_t v14 = (void *)MEMORY[0x1E4F929B8];
        BOOL v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m"];
        uint64_t v16 = [v15 lastPathComponent];
        double v17 = [NSString stringWithUTF8String:"-[PLDisplayAgent logEventPointDisplayForBlock:isActive:]"];
        [v14 logMessage:v13 fromFile:v16 fromFunction:v17 fromLineNumber:2533];

        double v18 = PLLogCommon();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }

LABEL_16:
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {
    }
    [(PLDisplayAgent *)self setFirstEntryOnInit:0];
    long long v13 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7];
    [v13 setObject:v6 forKeyedSubscript:@"Block"];
    v19 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:v4];
    [v13 setObject:v19 forKeyedSubscript:@"Active"];

    [(PLOperator *)self logEntry:v13];
    [(PLDisplayAgent *)self logDisplayEntry:v13];
    if ([MEMORY[0x1E4F92A38] hasCapability:3])
    {
      char v20 = [v13 objectForKeyedSubscript:@"timestamp"];
      v24[0] = v20;
      char v21 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:v4];
      v24[1] = v21;
      uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];

      [(NSMutableArray *)self->_displayStateChanges addObject:v22];
    }
    [(PLDisplayAgent *)self logDisplayAPL];
    goto LABEL_16;
  }
LABEL_18:
}

uint64_t __56__PLDisplayAgent_logEventPointDisplayForBlock_isActive___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventPointDisplayForBlock_isActive__classDebugEnabled = result;
  return result;
}

- (void)initAODState:(int64_t)a3
{
  id v5 = PLLogDisplay();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[PLDisplayAgent initAODState:]();
  }

  if ((unint64_t)a3 <= 3) {
    [(PLDisplayAgent *)self logAODState:dword_1E4404840[a3]];
  }
}

- (void)logAODState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([MEMORY[0x1E4F92A38] hasAOD])
  {
    id v5 = PLLogDisplay();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[PLDisplayAgent logAODState:](v3, v5);
    }

    id v6 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"Display"];
    if (![(PLDisplayAgent *)self lastScreenState]
      || [(PLDisplayAgent *)self lastScreenState] != v3)
    {
      id v7 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v6];
      id v8 = [MEMORY[0x1E4F28ED0] numberWithInt:v3];
      [v7 setObject:v8 forKeyedSubscript:@"Active"];

      [v7 setObject:@"Backlight" forKeyedSubscript:@"Block"];
      [(PLDisplayAgent *)self setLastScreenState:v3];
      double v9 = PLLogDisplay();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[PLDisplayAgent logAODState:]();
      }

      [(PLOperator *)self logEntry:v7];
      [(PLDisplayAgent *)self logDisplayEntry:v7];
    }
  }
}

- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvent:(id)a5
{
  if (_os_feature_enabled_impl())
  {
    if ([MEMORY[0x1E4F92A38] hasAOD])
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __62__PLDisplayAgent_backlight_didCompleteUpdateToState_forEvent___block_invoke;
      void v7[3] = &unk_1E6E47F58;
      v7[4] = self;
      v7[5] = a4;
      dispatch_async(MEMORY[0x1E4F14428], v7);
    }
  }
}

void __62__PLDisplayAgent_backlight_didCompleteUpdateToState_forEvent___block_invoke(uint64_t a1)
{
  char v2 = PLLogDisplay();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __62__PLDisplayAgent_backlight_didCompleteUpdateToState_forEvent___block_invoke_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
  }

  switch(*(void *)(a1 + 40))
  {
    case 0:
      [*(id *)(a1 + 32) logAODState:0];
      if (_os_feature_enabled_impl()) {
        [*(id *)(a1 + 32) clearDisplayAccountingEvents];
      }
      break;
    case 1:
      double v9 = *(void **)(a1 + 32);
      uint64_t v10 = 2;
      goto LABEL_8;
    case 2:
    case 3:
      double v9 = *(void **)(a1 + 32);
      uint64_t v10 = 1;
LABEL_8:
      [v9 logAODState:v10];
      break;
    default:
      return;
  }
}

- (void)clearDisplayAccountingEvents
{
  id v4 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  char v2 = [MEMORY[0x1E4F92900] sharedInstance];
  [v2 createDistributionEventForwardWithDistributionID:1 withChildNodeNameToWeight:MEMORY[0x1E4F1CC08] withStartDate:v4];

  uint64_t v3 = [MEMORY[0x1E4F92900] sharedInstance];
  [v3 createQualificationEventForwardWithQualificationID:2 withChildNodeNames:MEMORY[0x1E4F1CBF0] withStartDate:v4];
}

- (void)logEventPointUserBrightnessCommitted:(double)a3
{
  if (+[PLDisplayAgent shouldLogUserBrightness])
  {
    id v7 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"UserBrightness"];
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7];
    uint64_t v6 = [MEMORY[0x1E4F28ED0] numberWithDouble:a3];
    [v5 setObject:v6 forKeyedSubscript:@"UserBrightness"];

    [(PLOperator *)self logEntry:v5];
  }
}

- (void)logEventPointKeyboardBrightness:(double)a3
{
}

- (void)logEventPointKeyboardBrightness:(double)a3 withDate:(id)a4
{
  id v9 = a4;
  if (+[PLDisplayAgent shouldLogKeyboardBrightness])
  {
    uint64_t v6 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"KeyboardBrightness"];
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v6];
    uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:(unint64_t)(a3 * 100.0)];
    [v7 setObject:v8 forKeyedSubscript:@"KeyboardBrightness"];

    if (v9) {
      [v7 setEntryDate:v9];
    }
    [(PLOperator *)self logEntry:v7];
  }
}

- (void)logEventForwardALSLux:(unint64_t)a3
{
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v5 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__PLDisplayAgent_logEventForwardALSLux___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v5;
    if (logEventForwardALSLux__defaultOnce != -1) {
      dispatch_once(&logEventForwardALSLux__defaultOnce, block);
    }
    if (logEventForwardALSLux__classDebugEnabled)
    {
      uint64_t v6 = NSString;
      id v7 = [MEMORY[0x1E4F1C9C8] monotonicDate];
      uint64_t v8 = [v6 stringWithFormat:@"Got event ALSLux:%llu at %@\n", a3, v7];

      id v9 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m"];
      BOOL v11 = [v10 lastPathComponent];
      uint64_t v12 = [NSString stringWithUTF8String:"-[PLDisplayAgent logEventForwardALSLux:]"];
      [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:2673];

      long long v13 = PLLogCommon();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  [(PLDisplayAgent *)self setPendingALSLux:a3];
  uint64_t v14 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  [(PLDisplayAgent *)self setPendingALSLuxEntryDate:v14];

  uint64_t v15 = [(PLDisplayAgent *)self alsLuxFilterTimer];
  if (v15)
  {
    uint64_t v16 = (void *)v15;
    double v17 = [(PLDisplayAgent *)self alsLuxFilterTimer];
    char v18 = [v17 timerActive];

    if ((v18 & 1) == 0)
    {
      v19 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:10.0];
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v20 = objc_opt_class();
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        void v30[2] = __40__PLDisplayAgent_logEventForwardALSLux___block_invoke_1587;
        void v30[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v30[4] = v20;
        if (logEventForwardALSLux__defaultOnce_1585 != -1) {
          dispatch_once(&logEventForwardALSLux__defaultOnce_1585, v30);
        }
        if (logEventForwardALSLux__classDebugEnabled_1586)
        {
          char v21 = NSString;
          uint64_t v22 = [MEMORY[0x1E4F92A98] formattedStringForDate:v19];
          double v23 = [v21 stringWithFormat:@"Start ALSLux entry filter timer fireDate=%@", v22];

          double v24 = (void *)MEMORY[0x1E4F929B8];
          char v25 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m"];
          id v26 = [v25 lastPathComponent];
          double v27 = [NSString stringWithUTF8String:"-[PLDisplayAgent logEventForwardALSLux:]"];
          [v24 logMessage:v23 fromFile:v26 fromFunction:v27 fromLineNumber:2694];

          double v28 = PLLogCommon();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
          }
        }
      }
      uint64_t v29 = [(PLDisplayAgent *)self alsLuxFilterTimer];
      [v29 setFireDate:v19];
    }
  }
}

uint64_t __40__PLDisplayAgent_logEventForwardALSLux___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventForwardALSLux__classDebugEnabled = result;
  return result;
}

uint64_t __40__PLDisplayAgent_logEventForwardALSLux___block_invoke_1587(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventForwardALSLux__classDebugEnabled_1586 = result;
  return result;
}

- (unint64_t)getBacklightEnabledTimestamp:(unsigned int)a3
{
  CFNumberRef v3 = (const __CFNumber *)IORegistryEntrySearchCFProperty(a3, "IOService", @"displayOnTimestamp", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 1u);
  if (v3)
  {
    CFNumberRef v4 = v3;
    unint64_t valuePtr = 0;
    CFNumberGetValue(v3, kCFNumberSInt64Type, &valuePtr);
    CFRelease(v4);
    return valuePtr;
  }
  else
  {
    return mach_absolute_time();
  }
}

- (void)logEventForwardDisplay
{
  if (!+[PLDisplayAgent shouldLogFromDCP] && self->_iokitBacklight)
  {
    CFNumberRef v3 = [(PLDisplayAgent *)self iokitBacklight];
    id v5 = [v3 propertiesForKey:@"IODisplayParameters"];

    CFNumberRef v4 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    [(PLDisplayAgent *)self logEventForwardDisplayWithRawData:v5 withDate:v4];
  }
}

- (void)logEventForwardDisplayBacklight
{
  v20[1] = *MEMORY[0x1E4F143B8];
  if (+[PLUtilities isPowerlogHelperd])
  {
    CFNumberRef v3 = [(PLDisplayAgent *)self iokitBacklight];

    if (v3)
    {
      CFNumberRef v4 = [(PLDisplayAgent *)self iokitBacklight];
      id v5 = [v4 propertiesForKey:@"IODisplayParameters"];

      uint64_t v6 = [v5 objectForKeyedSubscript:@"brightness"];
      id v7 = [v6 objectForKeyedSubscript:@"value"];
      [v7 doubleValue];
      double v9 = v8;

      uint64_t v10 = [v5 objectForKeyedSubscript:@"BrightnessMicroAmps"];
      BOOL v11 = [v10 objectForKeyedSubscript:@"value"];
      [v11 doubleValue];
      double v13 = v12;

      if (v9 <= 0.0)
      {
        uint64_t v15 = &unk_1F400DAC8;
      }
      else
      {
        uint64_t v14 = (void *)MEMORY[0x1E4F28ED0];
        [(PLDisplayAgent *)self uAmpsToDisplayPower:v13];
        uint64_t v15 = objc_msgSend(v14, "numberWithDouble:");
      }
    }
    else
    {
      uint64_t v15 = 0;
    }
    uint64_t v16 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"DisplayBacklight"];
    double v17 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v16];
    char v18 = v17;
    if (v15) {
      [v17 setObject:v15 forKeyedSubscript:@"DisplayPower"];
    }
    v20[0] = v18;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    [(PLOperator *)self postEntries:v19];
  }
}

- (void)logEventForwardDisplayWithRawData:(id)a3 withDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(PLDisplayAgent *)self brightnessSystemClient];

  if (v8)
  {
    id v9 = [[PLEventForwardDisplayEntry alloc] initEntryWithRawData:v6];
    [v9 setEntryDate:v7];
    uint64_t v10 = [v6 objectForKeyedSubscript:@"lux"];
    if (!v10)
    {
      BOOL v11 = [v9 objectForKeyedSubscript:@"Brightness"];
      [v11 doubleValue];
      double v13 = v12;

      if (v13 <= 0.0)
      {
        uint64_t v10 = &unk_1F400DAC8;
      }
      else
      {
        uint64_t v14 = [(PLDisplayAgent *)self brightnessSystemClient];
        uint64_t v10 = (void *)[v14 copyPropertyForKey:@"TrustedLux"];
      }
      [v9 setObject:v10 forKeyedSubscript:@"lux"];
      uint64_t v15 = PLLogDisplay();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[PLDisplayAgent logEventForwardDisplayWithRawData:withDate:](v9, v15);
      }
    }
    [v10 doubleValue];
    self->_displayLux = v16;
    double v17 = [v9 objectForKeyedSubscript:@"mNits"];

    if (v17)
    {
      char v18 = [v9 objectForKeyedSubscript:@"mNits"];
      [v18 doubleValue];
      -[PLDisplayAgent setDisplaymNits:](self, "setDisplaymNits:");
    }
    v19 = [v9 objectForKeyedSubscript:@"Brightness"];

    if (v19)
    {
      uint64_t v20 = [v9 objectForKeyedSubscript:@"Brightness"];
      [v20 doubleValue];
      double v22 = v21;

      [(PLDisplayAgent *)self setIsDisplayOnNow:v22 > 0.0];
    }
    if ([(PLDisplayAgent *)self isMIEActive])
    {
      double v23 = [(PLDisplayAgent *)self uAmpsFilterTimer];

      if (!v23)
      {
        objc_initWeak(&location, self);
        id v24 = objc_alloc(MEMORY[0x1E4F92A80]);
        char v25 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:60.0];
        id v26 = [(PLOperator *)self workQueue];
        uint64_t v30 = MEMORY[0x1E4F143A8];
        uint64_t v31 = 3221225472;
        long long v32 = __61__PLDisplayAgent_logEventForwardDisplayWithRawData_withDate___block_invoke;
        long long v33 = &unk_1E6E4A2D8;
        objc_copyWeak(&v34, &location);
        double v27 = (void *)[v24 initWithFireDate:v25 withInterval:0 withTolerance:0 repeats:v26 withUserInfo:&v30 withQueue:0.0 withBlock:0.0];
        -[PLDisplayAgent setUAmpsFilterTimer:](self, "setUAmpsFilterTimer:", v27, v30, v31, v32, v33);

        double v28 = [(PLDisplayAgent *)self uAmpsFilterTimer];
        [v28 arm];

        objc_destroyWeak(&v34);
        objc_destroyWeak(&location);
      }
      [(PLDisplayAgent *)self setUAmpsEntry:v9];
    }
    else
    {
      uint64_t v29 = PLLogDisplay();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
        -[PLDisplayAgent logEventForwardDisplayWithRawData:withDate:]();
      }

      [(PLOperator *)self logEntry:v9];
      [(PLDisplayAgent *)self modelDisplayPower:v9];
      [(PLDisplayAgent *)self qualifyDisplayPower:v9];
    }
  }
}

void __61__PLDisplayAgent_logEventForwardDisplayWithRawData_withDate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reArmUAmpsCallback];
}

- (void)reArmUAmpsCallback
{
  CFNumberRef v3 = [(PLDisplayAgent *)self uAmpsEntry];
  [(PLOperator *)self logEntry:v3];

  CFNumberRef v4 = [(PLDisplayAgent *)self uAmpsEntry];
  [(PLDisplayAgent *)self modelDisplayPower:v4];

  id v5 = [(PLDisplayAgent *)self uAmpsEntry];
  [(PLDisplayAgent *)self qualifyDisplayPower:v5];

  id v6 = [(PLDisplayAgent *)self uAmpsFilterTimer];
  [v6 invalidate];

  [(PLDisplayAgent *)self setUAmpsFilterTimer:0];
  [(PLDisplayAgent *)self setUAmpsEntry:0];
}

- (void)logEventForwardALSUserPreferences
{
}

- (void)logEventForwardColorAdaptationMode
{
  uint64_t v3 = [(PLDisplayAgent *)self colorAdaptationClient];
  if (v3)
  {
    CFNumberRef v4 = (void *)v3;
    int v5 = [MEMORY[0x1E4F5B298] supportsAdaptation];

    if (v5)
    {
      id v10 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"CAModeEnabled"];
      id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v10];
      id v7 = [(PLDisplayAgent *)self colorAdaptationClient];
      uint64_t v8 = [v7 getEnabled];

      id v9 = [MEMORY[0x1E4F28ED0] numberWithBool:v8];
      [v6 setObject:v9 forKeyedSubscript:@"CAModeEnabled"];

      [(PLOperator *)self logEntry:v6];
    }
  }
}

- (void)logEventForwardALSUserPreferencesEntryWithLux:(id)a3
{
  id v13 = a3;
  CFNumberRef v4 = [(PLDisplayAgent *)self brightnessSystemClient];

  if (v4 && ([MEMORY[0x1E4F92A38] isMac] & 1) == 0)
  {
    int v5 = [(PLDisplayAgent *)self brightnessSystemClient];
    id v6 = (void *)[v5 copyPropertyForKey:@"ALSUserPreference"];

    if (v6)
    {
      id v7 = [MEMORY[0x1E4F1CA98] null];

      if (v6 != v7)
      {
        uint64_t v8 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"ALSUserPreferences"];
        id v9 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v8 withRawData:v6];
        id v10 = v9;
        if (v13) {
          [v9 setObject:v13 forKeyedSubscript:@"Lux"];
        }
        BOOL v11 = [v6 objectForKey:@"Prefs"];
        double v12 = [v11 objectForKey:@"thirdSlope"];
        [v10 setObject:v12 forKeyedSubscript:@"thirdSlope"];

        [(PLOperator *)self logEntry:v10];
      }
    }
  }
}

- (void)logEventForwardExtendedALSUserPreferences:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D30];
  id v5 = a3;
  id v80 = +[PLOperator entryKeyForType:v4 andName:@"ALSUserPreferences"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v80 withRawData:v5];
  id v7 = [v5 objectForKeyedSubscript:@"timestamp"];
  [v7 doubleValue];
  double v9 = v8;

  id v10 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v9];
  BOOL v11 = [v10 convertFromSystemToMonotonic];
  [v6 setEntryDate:v11];

  double v12 = [v5 objectForKeyedSubscript:@"e0a"];
  [v6 setObject:v12 forKeyedSubscript:@"E0a"];

  id v13 = [v5 objectForKeyedSubscript:@"e0b"];
  [v6 setObject:v13 forKeyedSubscript:@"E0b"];

  uint64_t v14 = [v5 objectForKeyedSubscript:@"e0b"];
  [v6 setObject:v14 forKeyedSubscript:@"E0b"];

  uint64_t v15 = [v5 objectForKeyedSubscript:@"e1"];
  [v6 setObject:v15 forKeyedSubscript:@"E1"];

  double v16 = [v5 objectForKeyedSubscript:@"e2"];
  [v6 setObject:v16 forKeyedSubscript:@"E2"];

  double v17 = [v5 objectForKeyedSubscript:@"l0a"];
  [v6 setObject:v17 forKeyedSubscript:@"L0a"];

  char v18 = [v5 objectForKeyedSubscript:@"l0b"];
  [v6 setObject:v18 forKeyedSubscript:@"L0b"];

  v19 = [v5 objectForKeyedSubscript:@"l1"];
  [v6 setObject:v19 forKeyedSubscript:@"L1"];

  uint64_t v20 = [v5 objectForKeyedSubscript:@"l2"];
  [v6 setObject:v20 forKeyedSubscript:@"L2"];

  double v21 = [v5 objectForKeyedSubscript:@"slider"];
  [v6 setObject:v21 forKeyedSubscript:@"S"];

  double v22 = (void *)MEMORY[0x1E4F28ED0];
  double v23 = [v5 objectForKeyedSubscript:@"frontLux"];
  [v23 floatValue];
  char v25 = [v22 numberWithDouble:roundf(v24)];
  [v6 setObject:v25 forKeyedSubscript:@"Lux"];

  id v26 = (void *)MEMORY[0x1E4F28ED0];
  double v27 = [v5 objectForKeyedSubscript:@"rearLux"];
  [v27 floatValue];
  uint64_t v29 = [v26 numberWithDouble:roundf(v28)];
  [v6 setObject:v29 forKeyedSubscript:@"rearLux"];

  uint64_t v30 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v31 = [v5 objectForKeyedSubscript:@"trustedLux"];
  [v31 floatValue];
  long long v33 = [v30 numberWithDouble:roundf(v32)];
  [v6 setObject:v33 forKeyedSubscript:@"trustedLux"];

  id v34 = (void *)MEMORY[0x1E4F28ED0];
  BOOL v35 = [v5 objectForKeyedSubscript:@"delayedAPCE"];
  [v35 floatValue];
  id v37 = [v34 numberWithDouble:roundf(v36 * 100.0)];
  [v6 setObject:v37 forKeyedSubscript:@"delayedAPCE"];

  uint64_t v38 = (void *)MEMORY[0x1E4F28ED0];
  v39 = [v5 objectForKeyedSubscript:@"ecoModeFactor"];
  [v39 floatValue];
  double v41 = [v38 numberWithDouble:roundf(v40 * 100.0)];
  [v6 setObject:v41 forKeyedSubscript:@"ecoModeFactor"];

  char v42 = [v5 objectForKeyedSubscript:@"aabParamsUpdateReason"];
  [v6 setObject:v42 forKeyedSubscript:@"aabParamsUpdateReason"];

  uint64_t v43 = (void *)MEMORY[0x1E4F28ED0];
  int v44 = [v5 objectForKeyedSubscript:@"inactiveLength"];
  [v44 floatValue];
  uint64_t v46 = [v43 numberWithDouble:roundf(v45 * 100.0)];
  [v6 setObject:v46 forKeyedSubscript:@"inactiveLength"];

  id v47 = [v5 objectForKeyedSubscript:@"inactiveStart"];
  [v6 setObject:v47 forKeyedSubscript:@"inactiveStart"];

  id v48 = [v5 objectForKeyedSubscript:@"alternativeE0a"];
  [v6 setObject:v48 forKeyedSubscript:@"alternativeE0a"];

  v49 = [v5 objectForKeyedSubscript:@"alternativeE0b"];
  [v6 setObject:v49 forKeyedSubscript:@"alternativeE0b"];

  v50 = [v5 objectForKeyedSubscript:@"alternativeE1"];
  [v6 setObject:v50 forKeyedSubscript:@"alternativeE1"];

  v51 = [v5 objectForKeyedSubscript:@"alternativeE2"];
  [v6 setObject:v51 forKeyedSubscript:@"alternativeE2"];

  v52 = (void *)MEMORY[0x1E4F28ED0];
  id v53 = [v5 objectForKeyedSubscript:@"alternativeL0a"];
  [v53 floatValue];
  uint64_t v55 = [v52 numberWithDouble:roundf(v54 * 100.0)];
  [v6 setObject:v55 forKeyedSubscript:@"alternativeL0a"];

  id v56 = (void *)MEMORY[0x1E4F28ED0];
  id v57 = [v5 objectForKeyedSubscript:@"alternativeL0b"];
  [v57 floatValue];
  uint64_t v59 = [v56 numberWithDouble:roundf(v58 * 100.0)];
  [v6 setObject:v59 forKeyedSubscript:@"alternativeL0b"];

  id v60 = (void *)MEMORY[0x1E4F28ED0];
  id v61 = [v5 objectForKeyedSubscript:@"alternativeL1"];
  [v61 floatValue];
  v63 = [v60 numberWithDouble:roundf(v62 * 100.0)];
  [v6 setObject:v63 forKeyedSubscript:@"alternativeL1"];

  v64 = (void *)MEMORY[0x1E4F28ED0];
  v65 = [v5 objectForKeyedSubscript:@"alternativeL2"];
  [v65 floatValue];
  v67 = [v64 numberWithDouble:roundf(v66 * 100.0)];
  [v6 setObject:v67 forKeyedSubscript:@"alternativeL2"];

  v68 = (void *)MEMORY[0x1E4F28ED0];
  v69 = [v5 objectForKeyedSubscript:@"alternativeThirdSlope"];
  [v69 floatValue];
  v71 = [v68 numberWithDouble:roundf(v70 * 10000.0)];
  [v6 setObject:v71 forKeyedSubscript:@"alternativeThirdSlope"];

  v72 = (void *)MEMORY[0x1E4F28ED0];
  v73 = [v5 objectForKeyedSubscript:@"nitsDelta"];
  [v73 floatValue];
  v75 = [v72 numberWithDouble:roundf(v74 * 100.0)];
  [v6 setObject:v75 forKeyedSubscript:@"nitsDelta"];

  v76 = (void *)MEMORY[0x1E4F28ED0];
  v77 = [v5 objectForKeyedSubscript:@"nitsDeltaAlternative"];

  [v77 floatValue];
  v79 = [v76 numberWithDouble:roundf(v78 * 100.0)];
  [v6 setObject:v79 forKeyedSubscript:@"nitsDeltaAlternative"];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventForwardALSEnabled
{
  id v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"ALSEnabled"];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v5];
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[PLDisplayAgent alsOn](self, "alsOn"));
  [v3 setObject:v4 forKeyedSubscript:@"ALSEnabled"];

  [(PLOperator *)self logEntry:v3];
}

- (void)logEventForwardALSUserPreferencesWithCurrLux
{
  uint64_t v3 = [(PLDisplayAgent *)self brightnessSystemClient];

  if (v3)
  {
    uint64_t v4 = [(PLOperator *)self workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__PLDisplayAgent_logEventForwardALSUserPreferencesWithCurrLux__block_invoke;
    block[3] = &unk_1E6E47848;
    void block[4] = self;
    dispatch_async(v4, block);
  }
}

void __62__PLDisplayAgent_logEventForwardALSUserPreferencesWithCurrLux__block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) brightnessSystemClient];
  id v3 = (id)[v2 copyPropertyForKey:@"TrustedLux"];

  [*(id *)(a1 + 32) logEventForwardALSUserPreferencesEntryWithLux:v3];
}

- (void)logEventForwardLuxStats:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"LuxStats"];
    id v6 = [v4 valueForKey:@"rearLux"];
    uint64_t v7 = [v6 integerValue];

    if ([MEMORY[0x1E4F92A38] isiPhone])
    {
      if ((int)[MEMORY[0x1E4F92A38] kPLSoCClassOfDevice] >= 1001021)
      {
        double v8 = [v4 valueForKey:@"gainChanged"];
        int v9 = [v8 BOOLValue];

        if (v9)
        {
          id v10 = PLLogDisplay();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
            -[PLDisplayAgent logEventForwardLuxStats:]();
          }

          goto LABEL_20;
        }
      }
    }
    if ([(PLDisplayAgent *)self lastRearLuxValue] != v7)
    {
      if ([(PLDisplayAgent *)self lastRearLuxValue] == -1)
      {
        double v14 = 0.0;
        double v12 = 0.0;
      }
      else
      {
        double v11 = (double)[(PLDisplayAgent *)self lastRearLuxValue];
        double v12 = v11 - (double)[(PLDisplayAgent *)self lastRearLuxValue] * 0.2;
        double v13 = (double)[(PLDisplayAgent *)self lastRearLuxValue];
        double v14 = v13 + (double)[(PLDisplayAgent *)self lastRearLuxValue] * 0.2;
      }
      if ([(PLDisplayAgent *)self lastRearLuxValue] == -1
        || (v12 <= (double)v7 ? (BOOL v15 = v14 < (double)v7) : (BOOL v15 = 1), v15))
      {
LABEL_20:
        double v16 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v5 withRawData:v4];
        [(PLOperator *)self logEntry:v16];
        [(PLDisplayAgent *)self setLastRearLuxValue:v7];
      }
    }
  }
  else
  {
    id v5 = PLLogDisplay();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[PLDisplayAgent logEventForwardLuxStats:]();
    }
  }
}

- (void)logEventBackwardTouch
{
  id v3 = [(PLDisplayAgent *)self iokitTouch];

  if (v3)
  {
    id v4 = [(PLDisplayAgent *)self iokitTouch];
    id v7 = [v4 propertiesForKey:@"PowerStates"];

    if (v7)
    {
      id v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"Touch"];
      id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v5 withRawData:v7];
      [(PLOperator *)self logEntry:v6];
    }
  }
}

- (void)logEventBackwardUserTouch:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PLDisplayAgent *)self userTouch] == a3) {
    return;
  }
  [(PLDisplayAgent *)self setUserTouch:v3];
  if (v3)
  {
    id v19 = [MEMORY[0x1E4F1C9C8] date];
    [(PLDisplayAgent *)self setUserTouchDownTime:v19];
LABEL_6:

    return;
  }
  id v5 = [(PLDisplayAgent *)self userTouchDownTime];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F929D0]);
    id v7 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D20] andName:@"UserTouch"];
    id v19 = (id)[v6 initWithEntryKey:v7];

    double v8 = [(PLDisplayAgent *)self userTouchDownTime];
    [v8 timeIntervalSinceNow];
    double v10 = -v9;

    double v11 = [MEMORY[0x1E4F28ED0] numberWithDouble:v10];
    [v19 setObject:v11 forKeyedSubscript:@"UserTouchTime"];

    [v19 setObject:&unk_1F400DAE0 forKeyedSubscript:@"UserTouchCount"];
    [(PLOperator *)self logEntry:v19];
    goto LABEL_6;
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v12 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__PLDisplayAgent_logEventBackwardUserTouch___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v12;
    if (logEventBackwardUserTouch__defaultOnce != -1) {
      dispatch_once(&logEventBackwardUserTouch__defaultOnce, block);
    }
    if (logEventBackwardUserTouch__classDebugEnabled)
    {
      double v13 = [NSString stringWithFormat:@"ERR: Don't have start time for touch"];
      double v14 = (void *)MEMORY[0x1E4F929B8];
      BOOL v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m"];
      double v16 = [v15 lastPathComponent];
      double v17 = [NSString stringWithUTF8String:"-[PLDisplayAgent logEventBackwardUserTouch:]"];
      [v14 logMessage:v13 fromFile:v16 fromFunction:v17 fromLineNumber:3063];

      char v18 = PLLogCommon();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
}

uint64_t __44__PLDisplayAgent_logEventBackwardUserTouch___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logEventBackwardUserTouch__classDebugEnabled = result;
  return result;
}

- (void)logEventBackwardRampInfo:(id)a3
{
  id v4 = a3;
  id v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"RampInfo"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v5];
  if (v4)
  {
    id v7 = [v4 objectForKeyedSubscript:@"AAPRampStats"];

    if (v7)
    {
      double v8 = [v4 objectForKeyedSubscript:@"AAPRampStats"];
      double v9 = [v8 objectForKeyedSubscript:@"NumberOfUpdates"];
      [v6 setObject:v9 forKeyedSubscript:@"AAP_NumberOfUpdates"];

      double v10 = [v4 objectForKeyedSubscript:@"AAPRampStats"];
      double v11 = [v10 objectForKeyedSubscript:@"RampFrequency"];
      [v6 setObject:v11 forKeyedSubscript:@"AAP_RampFrequency"];

      uint64_t v12 = [v4 objectForKeyedSubscript:@"AAPRampStats"];
      double v13 = [v12 objectForKeyedSubscript:@"RampLength"];
      [v6 setObject:v13 forKeyedSubscript:@"AAP_RampLength"];

      double v14 = [v4 objectForKeyedSubscript:@"AAPRampStats"];
      BOOL v15 = [v14 objectForKeyedSubscript:@"RampOrigin"];
      [v6 setObject:v15 forKeyedSubscript:@"AAP_RampOrigin"];

      double v16 = [v4 objectForKeyedSubscript:@"AAPRampStats"];
      double v17 = [v16 objectForKeyedSubscript:@"RampTarget"];
      [v6 setObject:v17 forKeyedSubscript:@"AAP_RampTarget"];
    }
    char v18 = [v4 objectForKeyedSubscript:@"ColourRampStats"];

    if (v18)
    {
      id v19 = [v4 objectForKeyedSubscript:@"ColourRampStats"];
      uint64_t v20 = [v19 objectForKeyedSubscript:@"NumberOfUpdates"];
      [v6 setObject:v20 forKeyedSubscript:@"Colour_NumberOfUpdates"];

      double v21 = [v4 objectForKeyedSubscript:@"ColourRampStats"];
      double v22 = [v21 objectForKeyedSubscript:@"RampFrequency"];
      [v6 setObject:v22 forKeyedSubscript:@"Colour_RampFrequency"];

      double v23 = [v4 objectForKeyedSubscript:@"ColourRampStats"];
      float v24 = [v23 objectForKeyedSubscript:@"RampLength"];
      [v6 setObject:v24 forKeyedSubscript:@"Colour_RampLength"];

      char v25 = [v4 objectForKeyedSubscript:@"ColourRampStats"];
      id v26 = [v25 objectForKeyedSubscript:@"RampOrigin"];
      double v27 = [v26 objectForKeyedSubscript:@"X"];
      [v6 setObject:v27 forKeyedSubscript:@"Colour_RampOrigin_X"];

      float v28 = [v4 objectForKeyedSubscript:@"ColourRampStats"];
      uint64_t v29 = [v28 objectForKeyedSubscript:@"RampOrigin"];
      uint64_t v30 = [v29 objectForKeyedSubscript:@"Y"];
      [v6 setObject:v30 forKeyedSubscript:@"Colour_RampOrigin_Y"];

      uint64_t v31 = [v4 objectForKeyedSubscript:@"ColourRampStats"];
      float v32 = [v31 objectForKeyedSubscript:@"RampTarget"];
      long long v33 = [v32 objectForKeyedSubscript:@"X"];
      [v6 setObject:v33 forKeyedSubscript:@"Colour_RampTarget_X"];

      id v34 = [v4 objectForKeyedSubscript:@"ColourRampStats"];
      BOOL v35 = [v34 objectForKeyedSubscript:@"RampTarget"];
      float v36 = [v35 objectForKeyedSubscript:@"Y"];
      [v6 setObject:v36 forKeyedSubscript:@"Colour_RampTarget_Y"];
    }
    id v37 = [v4 objectForKeyedSubscript:@"SDRRampStats"];

    if (v37)
    {
      uint64_t v38 = [v4 objectForKeyedSubscript:@"SDRRampStats"];
      v39 = [v38 objectForKeyedSubscript:@"NumberOfUpdates"];
      [v6 setObject:v39 forKeyedSubscript:@"SDR_NumberOfUpdates"];

      float v40 = [v4 objectForKeyedSubscript:@"SDRRampStats"];
      double v41 = [v40 objectForKeyedSubscript:@"RampFrequency"];
      [v6 setObject:v41 forKeyedSubscript:@"SDR_RampFrequency"];

      char v42 = [v4 objectForKeyedSubscript:@"SDRRampStats"];
      uint64_t v43 = [v42 objectForKeyedSubscript:@"RampLength"];
      [v6 setObject:v43 forKeyedSubscript:@"SDR_RampLength"];

      int v44 = [v4 objectForKeyedSubscript:@"SDRRampStats"];
      float v45 = [v44 objectForKeyedSubscript:@"RampOrigin"];
      [v6 setObject:v45 forKeyedSubscript:@"SDR_RampOrigin"];

      uint64_t v46 = [v4 objectForKeyedSubscript:@"SDRRampStats"];
      id v47 = [v46 objectForKeyedSubscript:@"RampTarget"];
      [v6 setObject:v47 forKeyedSubscript:@"SDR_RampTarget"];
    }
    id v48 = [v4 objectForKeyedSubscript:@"EDRRampStats"];

    if (v48)
    {
      v49 = [v4 objectForKeyedSubscript:@"EDRRampStats"];
      v50 = [v49 objectForKeyedSubscript:@"NumberOfUpdates"];
      [v6 setObject:v50 forKeyedSubscript:@"EDR_NumberOfUpdates"];

      v51 = [v4 objectForKeyedSubscript:@"EDRRampStats"];
      v52 = [v51 objectForKeyedSubscript:@"RampFrequency"];
      [v6 setObject:v52 forKeyedSubscript:@"EDR_RampFrequency"];

      id v53 = [v4 objectForKeyedSubscript:@"EDRRampStats"];
      float v54 = [v53 objectForKeyedSubscript:@"RampLength"];
      [v6 setObject:v54 forKeyedSubscript:@"EDR_RampLength"];

      uint64_t v55 = [v4 objectForKeyedSubscript:@"EDRRampStats"];
      id v56 = [v55 objectForKeyedSubscript:@"RampOrigin"];
      [v6 setObject:v56 forKeyedSubscript:@"EDR_RampOrigin"];

      id v57 = [v4 objectForKeyedSubscript:@"EDRRampStats"];
      float v58 = [v57 objectForKeyedSubscript:@"RampTarget"];
      [v6 setObject:v58 forKeyedSubscript:@"EDR_RampTarget"];
    }
    uint64_t v59 = [v4 objectForKeyedSubscript:@"isFlipbookActive"];
    [v6 setObject:v59 forKeyedSubscript:@"isFlipbookActive"];

    [(PLOperator *)self logEntry:v6];
  }
  else
  {
    id v60 = PLLogDisplay();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG)) {
      -[PLDisplayAgent logEventBackwardRampInfo:]();
    }
  }
}

- (void)logEventBackwardCurveUpdate:(id)a3
{
  v59[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PLLogDisplay();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    v52 = self;
    if (v6) {
      -[PLDisplayAgent logEventBackwardCurveUpdate:]();
    }

    unint64_t v7 = 0x1E6E46000uLL;
    uint64_t v8 = *MEMORY[0x1E4F92D28];
    id v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"CurveUpdate"];
    double v9 = [MEMORY[0x1E4F1CA48] array];
    double v10 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    double v11 = [v4 objectForKeyedSubscript:@"CurveLevelHigh"];

    float v54 = v5;
    id v56 = v10;
    id v57 = v9;
    if (v11)
    {
      uint64_t v12 = [v4 objectForKeyedSubscript:@"CurveLevelHigh"];
      double v13 = [v12 objectForKeyedSubscript:@"lux"];

      uint64_t v14 = v8;
      if ([v13 count])
      {
        unint64_t v15 = 0;
        do
        {
          id v16 = objc_alloc(MEMORY[0x1E4F929D0]);
          double v17 = +[PLOperator entryKeyForType:v14 andName:@"CurveUpdate"];
          char v18 = (void *)[v16 initWithEntryKey:v17 withDate:v10];

          id v19 = [v4 objectForKeyedSubscript:@"CurveLevelHigh"];
          uint64_t v20 = [v19 objectForKeyedSubscript:@"lux"];
          double v21 = [v20 objectAtIndexedSubscript:v15];
          [v18 setObject:v21 forKeyedSubscript:@"lux"];

          double v22 = [v4 objectForKeyedSubscript:@"CurveLevelHigh"];
          double v23 = [v22 objectForKeyedSubscript:@"nits"];
          float v24 = [v23 objectAtIndexedSubscript:v15];
          [v18 setObject:v24 forKeyedSubscript:@"nits"];

          double v10 = v56;
          unint64_t v7 = 0x1E6E46000uLL;

          double v9 = v57;
          [v18 setObject:&unk_1F400DAC8 forKeyedSubscript:@"level"];
          [v57 addObject:v18];

          ++v15;
        }
        while ([v13 count] > v15);
      }

      id v5 = v54;
      uint64_t v8 = v14;
    }
    char v25 = objc_msgSend(v4, "objectForKeyedSubscript:", @"CurveLevelMed", v52);

    uint64_t v55 = v8;
    if (v25)
    {
      id v26 = [v4 objectForKeyedSubscript:@"CurveLevelHigh"];
      double v27 = [v26 objectForKeyedSubscript:@"lux"];

      if ([v27 count])
      {
        unint64_t v28 = 0;
        do
        {
          id v29 = objc_alloc(MEMORY[0x1E4F929D0]);
          uint64_t v30 = +[PLOperator entryKeyForType:v8 andName:@"CurveUpdate"];
          uint64_t v31 = (void *)[v29 initWithEntryKey:v30 withDate:v10];

          float v32 = [v4 objectForKeyedSubscript:@"CurveLevelHigh"];
          long long v33 = [v32 objectForKeyedSubscript:@"lux"];
          id v34 = [v33 objectAtIndexedSubscript:v28];
          [v31 setObject:v34 forKeyedSubscript:@"lux"];

          BOOL v35 = [v4 objectForKeyedSubscript:@"CurveLevelHigh"];
          float v36 = [v35 objectForKeyedSubscript:@"nits"];
          id v37 = [v36 objectAtIndexedSubscript:v28];
          [v31 setObject:v37 forKeyedSubscript:@"nits"];

          double v10 = v56;
          unint64_t v7 = 0x1E6E46000uLL;

          double v9 = v57;
          [v31 setObject:&unk_1F400DAE0 forKeyedSubscript:@"level"];
          [v57 addObject:v31];

          uint64_t v8 = v55;
          ++v28;
        }
        while ([v27 count] > v28);
      }

      id v5 = v54;
    }
    uint64_t v38 = [v4 objectForKeyedSubscript:@"CurveLevelLow"];

    if (v38)
    {
      v39 = [v4 objectForKeyedSubscript:@"CurveLevelHigh"];
      float v40 = [v39 objectForKeyedSubscript:@"lux"];

      if ([v40 count])
      {
        unint64_t v41 = 0;
        do
        {
          id v42 = objc_alloc(MEMORY[0x1E4F929D0]);
          uint64_t v43 = [*(id *)(v7 + 3336) entryKeyForType:v8 andName:@"CurveUpdate"];
          int v44 = (void *)[v42 initWithEntryKey:v43 withDate:v10];

          float v45 = [v4 objectForKeyedSubscript:@"CurveLevelHigh"];
          uint64_t v46 = [v45 objectForKeyedSubscript:@"lux"];
          id v47 = [v46 objectAtIndexedSubscript:v41];
          [v44 setObject:v47 forKeyedSubscript:@"lux"];

          id v48 = [v4 objectForKeyedSubscript:@"CurveLevelHigh"];
          v49 = [v48 objectForKeyedSubscript:@"nits"];
          v50 = [v49 objectAtIndexedSubscript:v41];
          [v44 setObject:v50 forKeyedSubscript:@"nits"];

          double v10 = v56;
          unint64_t v7 = 0x1E6E46000;

          double v9 = v57;
          [v44 setObject:&unk_1F400DAF8 forKeyedSubscript:@"level"];
          [v57 addObject:v44];

          uint64_t v8 = v55;
          ++v41;
        }
        while ([v40 count] > v41);
      }

      id v5 = v54;
    }
    if ([v9 count])
    {
      float v58 = v5;
      v59[0] = v9;
      v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:&v58 count:1];
      [v53 logEntries:v51 withGroupID:v5];
    }
  }
  else if (v6)
  {
    -[PLDisplayAgent logEventBackwardCurveUpdate:]();
  }
}

- (void)logEventBackwardALSThreshold:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D28];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"ALSThreshold"];
  BOOL v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventBackwardALSSamplesBeforeWake:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v26 = self;
    uint64_t v5 = *MEMORY[0x1E4F92D28];
    uint64_t v27 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"AmbientLight"];
    BOOL v6 = [MEMORY[0x1E4F1CA48] array];
    id v7 = [v4 objectForKeyedSubscript:@"count"];
    unsigned int v8 = [v7 unsignedIntValue];

    id v29 = [v4 objectForKeyedSubscript:@"timestamp"];
    double v9 = [v4 objectForKeyedSubscript:@"lux"];
    double v10 = [v4 objectForKeyedSubscript:@"color_x"];
    id v28 = v4;
    double v11 = [v4 objectForKeyedSubscript:@"color_y"];
    if (v8)
    {
      uint64_t v12 = 0;
      uint64_t v13 = v8;
      do
      {
        uint64_t v14 = (void *)MEMORY[0x1E4F1C9C8];
        unint64_t v15 = [v29 objectAtIndexedSubscript:v12];
        [v15 doubleValue];
        id v16 = objc_msgSend(v14, "dateWithTimeIntervalSinceReferenceDate:");

        id v17 = objc_alloc(MEMORY[0x1E4F929D0]);
        char v18 = +[PLOperator entryKeyForType:v5 andName:@"ALSSamplesBeforeWake"];
        id v19 = (void *)[v17 initWithEntryKey:v18 withDate:v16];

        uint64_t v20 = [v9 objectAtIndexedSubscript:v12];
        [v19 setObject:v20 forKeyedSubscript:@"Lux"];

        double v21 = [v10 objectAtIndexedSubscript:v12];
        [v19 setObject:v21 forKeyedSubscript:@"colorX"];

        double v22 = [v11 objectAtIndexedSubscript:v12];
        [v19 setObject:v22 forKeyedSubscript:@"colorY"];

        double v23 = PLLogDisplay();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109634;
          int v33 = v12;
          __int16 v34 = 2112;
          BOOL v35 = v16;
          __int16 v36 = 2112;
          id v37 = v19;
          _os_log_debug_impl(&dword_1E4220000, v23, OS_LOG_TYPE_DEBUG, "ALSSamplesBeforeWake for the count=%d at the time=%@ is %@", buf, 0x1Cu);
        }

        [v6 addObject:v19];
        ++v12;
      }
      while (v13 != v12);
    }
    float v24 = v27;
    if ([v6 count])
    {
      uint64_t v30 = v27;
      uint64_t v31 = v6;
      char v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      [(PLOperator *)v26 logEntries:v25 withGroupID:v27];
    }
    id v4 = v28;
  }
  else
  {
    float v24 = PLLogDisplay();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      -[PLDisplayAgent logEventBackwardALSSamplesBeforeWake:]();
    }
  }
}

- (void)logEventBackwardAmbientLight:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([MEMORY[0x1E4F92A38] internalBuild]
    && [MEMORY[0x1E4F929C0] fullMode]
    && self->_ShouldLogAmbient)
  {
    if (v4)
    {
      char v25 = self;
      uint64_t v5 = *MEMORY[0x1E4F92D28];
      uint64_t v26 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"AmbientLight"];
      BOOL v6 = [MEMORY[0x1E4F1CA48] array];
      id v7 = [v4 objectForKeyedSubscript:@"count"];
      unsigned int v8 = [v7 unsignedIntValue];

      id v29 = [v4 objectForKeyedSubscript:@"timestamp"];
      id v28 = [v4 objectForKeyedSubscript:@"lux"];
      double v9 = [v4 objectForKeyedSubscript:@"color_x"];
      id v27 = v4;
      double v10 = [v4 objectForKeyedSubscript:@"color_y"];
      if (v8)
      {
        uint64_t v11 = 0;
        uint64_t v12 = v8;
        do
        {
          uint64_t v13 = (void *)MEMORY[0x1E4F1C9C8];
          uint64_t v14 = [v29 objectAtIndexedSubscript:v11];
          [v14 doubleValue];
          unint64_t v15 = objc_msgSend(v13, "dateWithTimeIntervalSinceReferenceDate:");

          id v16 = objc_alloc(MEMORY[0x1E4F929D0]);
          id v17 = +[PLOperator entryKeyForType:v5 andName:@"AmbientLight"];
          char v18 = (void *)[v16 initWithEntryKey:v17 withDate:v15];

          id v19 = [v28 objectAtIndexedSubscript:v11];
          [v18 setObject:v19 forKeyedSubscript:@"Lux"];

          uint64_t v20 = [v9 objectAtIndexedSubscript:v11];
          [v18 setObject:v20 forKeyedSubscript:@"colorX"];

          double v21 = [v10 objectAtIndexedSubscript:v11];
          [v18 setObject:v21 forKeyedSubscript:@"colorY"];

          double v22 = PLLogDisplay();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 67109634;
            int v33 = v11;
            __int16 v34 = 2112;
            BOOL v35 = v15;
            __int16 v36 = 2112;
            id v37 = v18;
            _os_log_debug_impl(&dword_1E4220000, v22, OS_LOG_TYPE_DEBUG, "AmbientLight for the count=%d at the time=%@ is %@", buf, 0x1Cu);
          }

          [v6 addObject:v18];
          ++v11;
        }
        while (v12 != v11);
      }
      double v23 = v26;
      if ([v6 count])
      {
        uint64_t v30 = v26;
        uint64_t v31 = v6;
        float v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
        [(PLOperator *)v25 logEntries:v24 withGroupID:v26];
      }
      id v4 = v27;
    }
    else
    {
      double v23 = PLLogDisplay();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        -[PLDisplayAgent logEventBackwardAmbientLight:]();
      }
    }
  }
}

- (void)handleBrightnessClientNotification:(id)a3 withValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqual:@"BacklightPowerMilliWatts"])
  {
    unsigned int v8 = [(PLOperator *)self workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke;
    block[3] = &unk_1E6E47EB8;
    void block[4] = self;
    id v66 = v7;
    dispatch_async_and_wait(v8, block);

    double v9 = v66;
LABEL_36:

    goto LABEL_37;
  }
  if ([v6 isEqual:@"BacklightPowerNits"])
  {
    double v10 = [(PLOperator *)self workQueue];
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1728;
    v63[3] = &unk_1E6E47EB8;
    v63[4] = self;
    id v64 = v7;
    dispatch_async_and_wait(v10, v63);

    double v9 = v64;
    goto LABEL_36;
  }
  if ([v6 isEqual:@"AODRampTelemetry"])
  {
    uint64_t v11 = [(PLOperator *)self workQueue];
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1739;
    v60[3] = &unk_1E6E47EB8;
    id v61 = v7;
    float v62 = self;
    dispatch_async_and_wait(v11, v60);

    double v9 = v61;
    goto LABEL_36;
  }
  if ([v6 isEqual:@"AODCurveUpdate"])
  {
    uint64_t v12 = [(PLOperator *)self workQueue];
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1740;
    v57[3] = &unk_1E6E47EB8;
    id v58 = v7;
    uint64_t v59 = self;
    dispatch_async_and_wait(v12, v57);

    double v9 = v58;
    goto LABEL_36;
  }
  if ([v6 isEqual:@"AODWakeFromALSThreshold"])
  {
    uint64_t v13 = [(PLOperator *)self workQueue];
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1741;
    v54[3] = &unk_1E6E47EB8;
    id v55 = v7;
    id v56 = self;
    dispatch_async_and_wait(v13, v54);

    double v9 = v55;
    goto LABEL_36;
  }
  if ([MEMORY[0x1E4F92A38] internalBuild]
    && [MEMORY[0x1E4F929C0] fullMode]
    && [v6 isEqual:@"CBAmbientLightTelemetry"]
    && self->_ShouldLogAmbient)
  {
    uint64_t v14 = [(PLOperator *)self workQueue];
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    void v51[2] = __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1742;
    v51[3] = &unk_1E6E47EB8;
    id v52 = v7;
    id v53 = self;
    dispatch_async_and_wait(v14, v51);

    double v9 = v52;
    goto LABEL_36;
  }
  if ([v6 isEqual:@"CBFinalBrightnessCommit"]
    && [(PLDisplayAgent *)self supportsFinalBrightnessCommit])
  {
    unint64_t v15 = [(PLOperator *)self workQueue];
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1743;
    void v48[3] = &unk_1E6E47EB8;
    id v49 = v7;
    v50 = self;
    dispatch_async_and_wait(v15, v48);

    double v9 = v49;
    goto LABEL_36;
  }
  if ([v6 isEqual:@"DisplayBrightness"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v16 = [(PLOperator *)self workQueue];
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      void v46[2] = __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1744;
      v46[3] = &unk_1E6E47EB8;
      v46[4] = self;
      id v47 = v7;
      dispatch_async_and_wait(v16, v46);

      double v9 = v47;
      goto LABEL_36;
    }
  }
  if ([v6 isEqual:@"DisplayBrightnessAuto"])
  {
    id v17 = [(PLOperator *)self workQueue];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    void v44[2] = __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1751;
    v44[3] = &unk_1E6E47EB8;
    v44[4] = self;
    id v45 = v7;
    dispatch_async_and_wait(v17, v44);

    double v9 = v45;
    goto LABEL_36;
  }
  if ([MEMORY[0x1E4F5B298] supportsAdaptation]
    && [v6 isEqual:@"ColorAdaptationEnabled"])
  {
    char v18 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"CAModeEnabled"];
    [(PLDisplayAgent *)self logBrightnessDataWithEntryKey:v18 withColName:@"CAModeEnabled" withValue:v7];
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v19 = objc_opt_class();
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      void v43[2] = __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1756;
      v43[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v43[4] = v19;
      if (handleBrightnessClientNotification_withValue__defaultOnce != -1) {
        dispatch_once(&handleBrightnessClientNotification_withValue__defaultOnce, v43);
      }
      if (handleBrightnessClientNotification_withValue__classDebugEnabled)
      {
        uint64_t v20 = [NSString stringWithFormat:@"%s-%d: property=%@, value=%@", "-[PLDisplayAgent handleBrightnessClientNotification:withValue:]", 3471, v6, v7];
        double v21 = (void *)MEMORY[0x1E4F929B8];
        double v22 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m"];
        double v23 = [v22 lastPathComponent];
        float v24 = [NSString stringWithUTF8String:"-[PLDisplayAgent handleBrightnessClientNotification:withValue:]"];
        [v21 logMessage:v20 fromFile:v23 fromFunction:v24 fromLineNumber:3471];

        char v25 = PLLogCommon();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }
  }
  else
  {
    if ([v6 isEqual:@"PowerLogReport"])
    {
      uint64_t v26 = [(PLOperator *)self workQueue];
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      void v39[2] = __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1760;
      void v39[3] = &unk_1E6E481B0;
      id v40 = v7;
      unint64_t v41 = self;
      id v42 = v6;
      dispatch_async(v26, v39);

      double v9 = v40;
      goto LABEL_36;
    }
    if ([v6 isEqual:@"CBBlueReductionStatus"])
    {
      [(PLDisplayAgent *)self logBlueLightDataWithDictionary:v7];
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v27 = objc_opt_class();
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1785;
        void v38[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v38[4] = v27;
        if (handleBrightnessClientNotification_withValue__defaultOnce_1783 != -1) {
          dispatch_once(&handleBrightnessClientNotification_withValue__defaultOnce_1783, v38);
        }
        if (handleBrightnessClientNotification_withValue__classDebugEnabled_1784)
        {
          id v28 = [NSString stringWithFormat:@"%s-%d: property=%@, value=%@", "-[PLDisplayAgent handleBrightnessClientNotification:withValue:]", 3533, v6, v7];
          id v29 = (void *)MEMORY[0x1E4F929B8];
          uint64_t v30 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m"];
          uint64_t v31 = [v30 lastPathComponent];
          float v32 = [NSString stringWithUTF8String:"-[PLDisplayAgent handleBrightnessClientNotification:withValue:]"];
          [v29 logMessage:v28 fromFile:v31 fromFunction:v32 fromLineNumber:3533];

          int v33 = PLLogCommon();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
          }
        }
      }
    }
    else if (+[PLDisplayAgent shouldLogLuxStats] {
           && [v6 isEqual:@"RLuxStats"])
    }
    {
      __int16 v34 = [(PLOperator *)self workQueue];
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      void v35[2] = __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1786;
      void v35[3] = &unk_1E6E47EB8;
      id v36 = v7;
      id v37 = self;
      dispatch_async_and_wait(v34, v35);

      double v9 = v36;
      goto LABEL_36;
    }
  }
LABEL_37:
}

void __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) alsOn] & 1) == 0)
  {
    id v2 = *(id *)(a1 + 40);
    BOOL v3 = [v2 valueForKey:@"BacklightPowerMilliWattsRealSub"];
    id v4 = [v2 valueForKey:@"BacklightPowerMilliWattsABSub"];
    BOOL v5 = +[PLDisplayAgent shouldModelPowerFromIOMFB];
    [v3 floatValue];
    if (v5)
    {
      double v7 = v6;
      [v4 floatValue];
      double v9 = v8;
    }
    else
    {
      double v10 = (float)(v6 * 1000.0) / 1.8;
      [v4 floatValue];
      double v12 = (float)(v11 * 1000.0) / 1.8;
      [*(id *)(a1 + 32) uAmpsToDisplayPower:v10];
      double v7 = v13;
      [*(id *)(a1 + 32) uAmpsToDisplayPower:v12];
      double v9 = v14;
    }
    double v15 = v7 - v9;
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v16 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_2;
      block[3] = &unk_1E6E4A300;
      v63 = @"ALS";
      uint64_t v64 = v16;
      if (kPRearNits_block_invoke_4_defaultOnce != -1) {
        dispatch_once(&kPRearNits_block_invoke_4_defaultOnce, block);
      }
      int v17 = kPRearNits_block_invoke_4_classDebugEnabled;

      if (v17)
      {
        char v18 = v3;
        uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"PowerReal:%f PowerIfALSOn:%f alsPowerSaved:%f", *(void *)&v7, *(void *)&v9, v7 - v9);
        uint64_t v20 = (void *)MEMORY[0x1E4F929B8];
        double v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m"];
        double v22 = [v21 lastPathComponent];
        double v23 = [NSString stringWithUTF8String:"-[PLDisplayAgent handleBrightnessClientNotification:withValue:]_block_invoke"];
        [v20 logMessage:v19 fromFile:v22 fromFunction:v23 fromLineNumber:3295];

        float v24 = PLLogCommon();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }

        BOOL v3 = v18;
      }
    }
    [*(id *)(a1 + 32) lastALSPowerSaved];
    double v26 = v25;
    if (v15 == 0.0)
    {
      [*(id *)(a1 + 32) lastALSPowerSaved];
      BOOL v28 = v27 != 0.0;
    }
    else
    {
      BOOL v28 = 0;
    }
    double v29 = vabdd_f64(v15, v26);
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v30 = objc_opt_class();
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      void v59[2] = __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1710;
      v59[3] = &unk_1E6E4A300;
      id v60 = @"ALS";
      uint64_t v61 = v30;
      if (kPRearNits_block_invoke_4_defaultOnce_1708 != -1) {
        dispatch_once(&kPRearNits_block_invoke_4_defaultOnce_1708, v59);
      }
      int v31 = kPRearNits_block_invoke_4_classDebugEnabled_1709;

      if (v31)
      {
        float v32 = v3;
        int v33 = objc_msgSend(NSString, "stringWithFormat:", @"significantChange:%d newlyZero:%d", v29 >= 1.0, v28);
        __int16 v34 = (void *)MEMORY[0x1E4F929B8];
        BOOL v35 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m"];
        id v36 = [v35 lastPathComponent];
        id v37 = [NSString stringWithUTF8String:"-[PLDisplayAgent handleBrightnessClientNotification:withValue:]_block_invoke_2"];
        [v34 logMessage:v33 fromFile:v36 fromFunction:v37 fromLineNumber:3303];

        uint64_t v38 = PLLogCommon();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }

        BOOL v3 = v32;
      }
    }
    int v39 = v29 >= 1.0 || v28;
    if (v39 == 1)
    {
      [*(id *)(a1 + 32) setLastALSPowerSaved:v15];
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v40 = objc_opt_class();
        v56[0] = MEMORY[0x1E4F143A8];
        v56[1] = 3221225472;
        void v56[2] = __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1717;
        v56[3] = &unk_1E6E4A300;
        id v57 = @"ALS";
        uint64_t v58 = v40;
        if (kPRearNits_block_invoke_4_defaultOnce_1715 != -1) {
          dispatch_once(&kPRearNits_block_invoke_4_defaultOnce_1715, v56);
        }
        int v41 = kPRearNits_block_invoke_4_classDebugEnabled_1716;

        if (v41)
        {
          id v42 = v3;
          uint64_t v43 = NSString;
          [*(id *)(a1 + 32) lastALSPowerSaved];
          id v45 = objc_msgSend(v43, "stringWithFormat:", @"Setting lastALSPowerSaved=%f", v44);
          uint64_t v46 = (void *)MEMORY[0x1E4F929B8];
          id v47 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m"];
          id v48 = [v47 lastPathComponent];
          id v49 = [NSString stringWithUTF8String:"-[PLDisplayAgent handleBrightnessClientNotification:withValue:]_block_invoke_2"];
          [v46 logMessage:v45 fromFile:v48 fromFunction:v49 fromLineNumber:3307];

          v50 = PLLogCommon();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG)) {
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
          }

          BOOL v3 = v42;
        }
      }
      v51 = (void *)MEMORY[0x1E4F92A18];
      id v52 = [MEMORY[0x1E4F1C9C8] monotonicDateWithTimeIntervalSinceNow:2.0];
      id v53 = [*(id *)(a1 + 32) workQueue];
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1722;
      v55[3] = &unk_1E6E48B20;
      v55[4] = *(void *)(a1 + 32);
      float v54 = [v51 scheduledTimerWithMonotonicFireDate:v52 withInterval:v53 withQueue:v55 withBlock:0.0];
      [*(id *)(a1 + 32) setLogLastALSPowerSavedTimer:v54];
    }
  }
}

uint64_t __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  kPRearNits_block_invoke_4_classDebugEnabled = result;
  return result;
}

uint64_t __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1710(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  kPRearNits_block_invoke_4_classDebugEnabled_1709 = result;
  return result;
}

uint64_t __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1717(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  kPRearNits_block_invoke_4_classDebugEnabled_1716 = result;
  return result;
}

void __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1722(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (+[PLDisplayAgent shouldLogALSPowerSaved])
  {
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v4 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_2_1723;
      block[3] = &unk_1E6E4A300;
      uint64_t v19 = @"ALS";
      uint64_t v20 = v4;
      if (kPRearNits_block_invoke_5_defaultOnce != -1) {
        dispatch_once(&kPRearNits_block_invoke_5_defaultOnce, block);
      }
      int v5 = kPRearNits_block_invoke_5_classDebugEnabled;

      if (v5)
      {
        float v6 = NSString;
        [*(id *)(a1 + 32) lastALSPowerSaved];
        float v8 = objc_msgSend(v6, "stringWithFormat:", @"Logging lastALSPowerSaved=%f", v7);
        double v9 = (void *)MEMORY[0x1E4F929B8];
        double v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m"];
        float v11 = [v10 lastPathComponent];
        double v12 = [NSString stringWithUTF8String:"-[PLDisplayAgent handleBrightnessClientNotification:withValue:]_block_invoke"];
        [v9 logMessage:v8 fromFile:v11 fromFunction:v12 fromLineNumber:3314];

        double v13 = PLLogCommon();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }
    double v14 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"ALSPowerSaved"];
    double v15 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v14 withDate:v3];
    uint64_t v16 = (void *)MEMORY[0x1E4F28ED0];
    [*(id *)(a1 + 32) lastALSPowerSaved];
    int v17 = objc_msgSend(v16, "numberWithDouble:");
    [v15 setObject:v17 forKeyedSubscript:@"Power"];

    [*(id *)(a1 + 32) logEntry:v15];
  }
}

uint64_t __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_2_1723(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  kPRearNits_block_invoke_5_classDebugEnabled = result;
  return result;
}

void __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1728(uint64_t a1)
{
  if (([*(id *)(a1 + 32) alsOn] & 1) == 0)
  {
    id v2 = *(id *)(a1 + 40);
    id v3 = [v2 valueForKey:@"BacklightPowerNitsRealSub"];
    uint64_t v4 = [v2 valueForKey:@"BacklightPowerNitsABSub"];
    [v3 floatValue];
    *(float *)&double v6 = v5 * 1000.0;
    [*(id *)(a1 + 32) setRealmNits:v6];
    [v4 floatValue];
    *(float *)&double v8 = v7 * 1000.0;
    [*(id *)(a1 + 32) setAutobrightnessmNits:v8];
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v9 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_2_1735;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      void block[4] = v9;
      if (kPRearNits_block_invoke_6_defaultOnce != -1) {
        dispatch_once(&kPRearNits_block_invoke_6_defaultOnce, block);
      }
      if (kPRearNits_block_invoke_6_classDebugEnabled)
      {
        double v10 = NSString;
        [*(id *)(a1 + 32) realmNits];
        double v12 = v11;
        [*(id *)(a1 + 32) autobrightnessmNits];
        double v14 = objc_msgSend(v10, "stringWithFormat:", @"BrightnessNotification - Real: %f Nits\tVirtual: %f Nits", *(void *)&v12, v13);
        double v15 = (void *)MEMORY[0x1E4F929B8];
        uint64_t v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m"];
        int v17 = [v16 lastPathComponent];
        char v18 = [NSString stringWithUTF8String:"-[PLDisplayAgent handleBrightnessClientNotification:withValue:]_block_invoke"];
        [v15 logMessage:v14 fromFile:v17 fromFunction:v18 fromLineNumber:3340];

        uint64_t v19 = PLLogCommon();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }
  }
}

uint64_t __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_2_1735(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPRearNits_block_invoke_6_classDebugEnabled = result;
  return result;
}

void __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1739(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id v3 = PLLogDisplay();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1739_cold_1();
  }

  [*(id *)(a1 + 40) logEventBackwardRampInfo:v2];
}

void __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1740(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id v3 = PLLogDisplay();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1740_cold_1();
  }

  [*(id *)(a1 + 40) logEventBackwardCurveUpdate:v2];
}

void __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1741(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id v3 = PLLogDisplay();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1741_cold_1();
  }

  [*(id *)(a1 + 40) logEventBackwardALSThreshold:v2];
  uint64_t v4 = [v2 objectForKeyedSubscript:@"ALSSamplesBeforeWake"];

  if (v4)
  {
    float v5 = *(void **)(a1 + 40);
    double v6 = [v2 objectForKeyedSubscript:@"ALSSamplesBeforeWake"];
    [v5 logEventBackwardALSSamplesBeforeWake:v6];
  }
}

void __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1742(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id v3 = PLLogDisplay();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1742_cold_1();
  }

  [*(id *)(a1 + 40) logEventBackwardAmbientLight:v2];
}

uint64_t __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1743(uint64_t a1)
{
  id v2 = PLLogDisplay();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1743_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
  }

  uint64_t v9 = [*(id *)(a1 + 32) objectForKey:@"slider"];
  [v9 floatValue];
  double v11 = v10 * 100.0;

  [*(id *)(a1 + 40) logEventPointUserBrightnessCommitted:v11];
  return [*(id *)(a1 + 40) logEventForwardExtendedALSUserPreferences:*(void *)(a1 + 32)];
}

void __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1744(uint64_t a1)
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  if (+[PLDisplayAgent shouldLogUserBrightness])
  {
    if (([*(id *)(a1 + 32) supportsFinalBrightnessCommit] & 1) == 0)
    {
      id v2 = [*(id *)(a1 + 40) objectForKey:@"Commit"];
      int v3 = [v2 BOOLValue];

      if (v3)
      {
        uint64_t v4 = [*(id *)(a1 + 40) objectForKey:@"Brightness"];
        [v4 floatValue];
        double v6 = v5 * 100.0;

        [*(id *)(a1 + 32) logEventPointUserBrightnessCommitted:v6];
        if ([*(id *)(a1 + 32) alsOn]) {
          [*(id *)(a1 + 32) logEventForwardALSUserPreferencesWithCurrLux];
        }
      }
    }
  }
  uint64_t v7 = [*(id *)(a1 + 40) objectForKey:@"EDRHeadroom"];
  [v7 doubleValue];
  uint64_t v9 = (int)(v8 * 1000.0);

  float v10 = [MEMORY[0x1E4F28ED0] numberWithInt:v9];
  double v11 = (id *)(a1 + 32);
  double v12 = [*(id *)(a1 + 32) pendingBacklightEntry];
  [v12 setObject:v10 forKeyedSubscript:@"EDRHeadroom"];

  if ([MEMORY[0x1E4F92A38] hasCapability:8])
  {
    float v13 = PLLogDisplay();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      double v14 = *(double *)(a1 + 40);
      int v47 = 138412290;
      double v48 = v14;
      _os_log_impl(&dword_1E4220000, v13, OS_LOG_TYPE_DEFAULT, "Received Brightness Notification: %@", (uint8_t *)&v47, 0xCu);
    }

    double v15 = [*v11 pendingBacklightEntry];

    if (!v15)
    {
      uint64_t v16 = *(void **)(a1 + 32);
      int v17 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:*(void *)(a1 + 40)];
      [v16 setPendingBacklightEntry:v17];
    }
    char v18 = [*(id *)(a1 + 40) objectForKey:@"NitsPhysical"];
    [v18 floatValue];
    double v20 = v19;

    double v21 = [*(id *)(a1 + 32) brightnessSystemClient];
    double v22 = (void *)[v21 copyPropertyForKey:@"DisplayBrightnessMin"];
    [v22 doubleValue];
    double v24 = v23;

    double v25 = [*(id *)(a1 + 32) brightnessSystemClient];
    double v26 = (void *)[v25 copyPropertyForKey:@"DisplayBrightnessMax"];
    [v26 doubleValue];
    double v28 = v27;

    double v29 = [*(id *)(a1 + 40) objectForKey:@"Brightness"];
    [v29 floatValue];
    double v31 = v30;

    float v32 = PLLogDisplay();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      int v47 = 134219264;
      double v48 = v20;
      __int16 v49 = 2048;
      double v50 = v24;
      __int16 v51 = 2048;
      double v52 = v28;
      __int16 v53 = 2048;
      double v54 = v28 - v24;
      __int16 v55 = 2048;
      double v56 = v31;
      __int16 v57 = 2048;
      double v58 = (v31 - v24) * 100.0 / (v28 - v24);
      _os_log_debug_impl(&dword_1E4220000, v32, OS_LOG_TYPE_DEBUG, "Reported mNits:%f ,brightnessMin:%f ,brightnessMax:%f ,brightnessDiff:%f ,brightness:%f ,brightnessPercentage:%f ", (uint8_t *)&v47, 0x3Eu);
    }

    int v33 = [MEMORY[0x1E4F28ED0] numberWithDouble:(v31 - v24) * 100.0 / (v28 - v24)];
    __int16 v34 = [*v11 pendingBacklightEntry];
    [v34 setObject:v33 forKeyedSubscript:@"Brightness"];

    BOOL v35 = [MEMORY[0x1E4F28ED0] numberWithDouble:v31];
    id v36 = [*v11 pendingBacklightEntry];
    [v36 setObject:v35 forKeyedSubscript:@"SliderValue"];

    id v37 = [MEMORY[0x1E4F28ED0] numberWithDouble:v20 * 1000.0];
    uint64_t v38 = [*v11 pendingBacklightEntry];
    [v38 setObject:v37 forKeyedSubscript:@"mNits"];

    int v39 = [*v11 pendingBacklightEntryDate];

    if (!v39)
    {
      uint64_t v40 = [MEMORY[0x1E4F1C9C8] monotonicDate];
      [*v11 setPendingBacklightEntryDate:v40];
    }
    int v41 = PLLogDisplay();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
      __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1744_cold_2(v11);
    }

    id v42 = [*v11 backlightFilterTimer];
    char v43 = [v42 timerActive];

    if ((v43 & 1) == 0)
    {
      uint64_t v44 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:1.0];
      id v45 = PLLogDisplay();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
        __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1744_cold_1((uint64_t)v44, v45);
      }

      uint64_t v46 = [*v11 backlightFilterTimer];
      [v46 setFireDate:v44];
    }
  }
}

void __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1751(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlsOn:", objc_msgSend(*(id *)(a1 + 40), "BOOLValue"));
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v2 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_2_1752;
    block[3] = &unk_1E6E4A300;
    float v13 = @"ALS";
    uint64_t v14 = v2;
    if (kPRearNits_block_invoke_7_defaultOnce != -1) {
      dispatch_once(&kPRearNits_block_invoke_7_defaultOnce, block);
    }
    int v3 = kPRearNits_block_invoke_7_classDebugEnabled;

    if (v3)
    {
      uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"Auto-brightness switched to alsOn=%i", objc_msgSend(*(id *)(a1 + 32), "alsOn"));
      float v5 = (void *)MEMORY[0x1E4F929B8];
      double v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m"];
      uint64_t v7 = [v6 lastPathComponent];
      double v8 = [NSString stringWithUTF8String:"-[PLDisplayAgent handleBrightnessClientNotification:withValue:]_block_invoke"];
      [v5 logMessage:v4 fromFile:v7 fromFunction:v8 fromLineNumber:3452];

      uint64_t v9 = PLLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  [*(id *)(a1 + 32) logEventForwardALSEnabled];
  if ([*(id *)(a1 + 32) alsOn])
  {
    if (+[PLDisplayAgent shouldLogALSPowerSaved])
    {
      float v10 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"ALSPowerSaved"];
      double v11 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v10];
      [v11 setObject:&unk_1F400DAC8 forKeyedSubscript:@"Power"];
      [*(id *)(a1 + 32) logEntry:v11];
    }
  }
}

uint64_t __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_2_1752(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 40) forKey:*(void *)(a1 + 32)];
  kPRearNits_block_invoke_7_classDebugEnabled = result;
  return result;
}

uint64_t __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1756(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleBrightnessClientNotification_withValue__classDebugEnabled = result;
  return result;
}

void __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1760(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *MEMORY[0x1E4F92D28];
  uint64_t v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D28] andName:@"BlueLightParameters"];
  float v5 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v4];
  double v6 = [v2 objectForKeyedSubscript:@"BlueLightReductionOffTime"];
  [v5 setObject:v6 forKeyedSubscript:@"BlueLightReductionOffTime"];

  uint64_t v7 = [v2 objectForKeyedSubscript:@"BlueLightReductionOnTime"];
  [v5 setObject:v7 forKeyedSubscript:@"BlueLightReductionOnTime"];

  double v8 = [v2 objectForKeyedSubscript:@"AvgBacklightNits"];
  [v5 setObject:v8 forKeyedSubscript:@"AvgBacklightNits"];

  uint64_t v9 = [v2 objectForKeyedSubscript:@"AvgLogicalBrightnessNits"];
  [v5 setObject:v9 forKeyedSubscript:@"AvgLogicalBrightnessNits"];

  [*(id *)(a1 + 40) logEntry:v5];
  if ([MEMORY[0x1E4F5B298] supportsAdaptation])
  {
    uint64_t v10 = +[PLOperator entryKeyForType:v3 andName:@"HParameters"];

    double v11 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v10];
    double v12 = *(void **)(a1 + 40);
    float v13 = [v2 objectForKeyedSubscript:@"DisplayColorBins"];
    [v12 extractDataWithEntry:v11 withColName:@"DisplayColorBins" withDataArray:v13];

    uint64_t v14 = *(void **)(a1 + 40);
    double v15 = [v2 objectForKeyedSubscript:@"AmbientColorBins"];
    [v14 extractDataWithEntry:v11 withColName:@"AmbientColorBins" withDataArray:v15];

    uint64_t v16 = *(void **)(a1 + 40);
    int v17 = [v2 objectForKeyedSubscript:@"AdaptationStrengthBins"];
    [v16 extractDataWithEntry:v11 withColName:@"AdaptationStrengthBins" withDataArray:v17];

    char v18 = *(void **)(a1 + 40);
    float v19 = [v2 objectForKeyedSubscript:@"AmbientColorBinsAnsi"];
    [v18 extractDataWithEntry:v11 withColName:@"AmbientColorBinsAnsi" withDataArray:v19];

    double v20 = *(void **)(a1 + 40);
    double v21 = [v2 objectForKeyedSubscript:@"AmbientColorTransitionBins"];
    [v20 extractDataWithEntry:v11 withColName:@"AmbientColorTransitionBins" withDataArray:v21];

    double v22 = *(void **)(a1 + 40);
    double v23 = [v2 objectForKeyedSubscript:@"DisplayColorTransitionBins"];
    [v22 extractDataWithEntry:v11 withColName:@"DisplayColorTransitionBins" withDataArray:v23];

    double v24 = [v11 allValues];
    uint64_t v25 = [v24 count];

    if (v25) {
      [*(id *)(a1 + 40) logEntry:v11];
    }

    uint64_t v4 = (void *)v10;
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v26 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v34 = 3221225472;
    BOOL v35 = __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_2_1779;
    id v36 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v37 = v26;
    if (kPRearNits_block_invoke_8_defaultOnce != -1) {
      dispatch_once(&kPRearNits_block_invoke_8_defaultOnce, &block);
    }
    if (kPRearNits_block_invoke_8_classDebugEnabled)
    {
      double v27 = [NSString stringWithFormat:@"%s-%d: harmonyParametersEntry=%@, property=%@, value=%@", "-[PLDisplayAgent handleBrightnessClientNotification:withValue:]_block_invoke", 3527, v5, *(void *)(a1 + 48), *(void *)(a1 + 32), block, v34, v35, v36, v37];
      double v28 = (void *)MEMORY[0x1E4F929B8];
      double v29 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m"];
      float v30 = [v29 lastPathComponent];
      double v31 = [NSString stringWithUTF8String:"-[PLDisplayAgent handleBrightnessClientNotification:withValue:]_block_invoke"];
      [v28 logMessage:v27 fromFile:v30 fromFunction:v31 fromLineNumber:3527];

      float v32 = PLLogCommon();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
}

uint64_t __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_2_1779(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  kPRearNits_block_invoke_8_classDebugEnabled = result;
  return result;
}

uint64_t __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1785(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  handleBrightnessClientNotification_withValue__classDebugEnabled_1784 = result;
  return result;
}

void __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1786(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = PLLogDisplay();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1786_cold_1();
  }

  [*(id *)(a1 + 40) logEventForwardLuxStats:v2];
}

- (void)extractDataWithEntry:(id)a3 withColName:(id)a4 withDataArray:(id)a5
{
  id v7 = a3;
  double v8 = (__CFString *)a4;
  id v9 = a5;
  uint64_t v10 = [v9 count];
  if (v10)
  {
    uint64_t v11 = v10;
    for (uint64_t i = 0; i != v11; ++i)
    {
      float v13 = @"ACBins";
      if (([(__CFString *)v8 isEqualToString:@"AmbientColorBins"] & 1) != 0
        || (float v13 = @"DCBins",
            ([(__CFString *)v8 isEqualToString:@"DisplayColorBins"] & 1) != 0)
        || (float v13 = @"ASBins",
            ([(__CFString *)v8 isEqualToString:@"AdaptationStrengthBins"] & 1) != 0)
        || (float v13 = @"ACABins",
            ([(__CFString *)v8 isEqualToString:@"AmbientColorBinsAnsi"] & 1) != 0)
        || (float v13 = @"ACTBins",
            ([(__CFString *)v8 isEqualToString:@"AmbientColorTransitionBins"] & 1) != 0)
        || (float v13 = @"DCTBins",
            [(__CFString *)v8 isEqualToString:@"DisplayColorTransitionBins"]))
      {

        double v8 = v13;
      }
      uint64_t v14 = [v9 objectAtIndexedSubscript:i];
      double v15 = [NSString stringWithFormat:@"%@_%lu", v8, i];
      [v7 setObject:v14 forKeyedSubscript:v15];
    }
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v16 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__PLDisplayAgent_extractDataWithEntry_withColName_withDataArray___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v16;
    if (extractDataWithEntry_withColName_withDataArray__defaultOnce != -1) {
      dispatch_once(&extractDataWithEntry_withColName_withDataArray__defaultOnce, block);
    }
    if (extractDataWithEntry_withColName_withDataArray__classDebugEnabled)
    {
      int v17 = [NSString stringWithFormat:@"%s-%d: col=%@, data=%@, entry=%@", "-[PLDisplayAgent extractDataWithEntry:withColName:withDataArray:]", 3572, v8, v9, v7];
      char v18 = (void *)MEMORY[0x1E4F929B8];
      float v19 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m"];
      double v20 = [v19 lastPathComponent];
      double v21 = [NSString stringWithUTF8String:"-[PLDisplayAgent extractDataWithEntry:withColName:withDataArray:]"];
      [v18 logMessage:v17 fromFile:v20 fromFunction:v21 fromLineNumber:3572];

      double v22 = PLLogCommon();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
}

uint64_t __65__PLDisplayAgent_extractDataWithEntry_withColName_withDataArray___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  extractDataWithEntry_withColName_withDataArray__classDebugEnabled = result;
  return result;
}

- (void)logBrightnessDataWithEntryKey:(id)a3 withColName:(id)a4 withValue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v8];
  [v11 setObject:v10 forKeyedSubscript:v9];
  [(PLOperator *)self logEntry:v11];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v12 = objc_opt_class();
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    double v21 = __70__PLDisplayAgent_logBrightnessDataWithEntryKey_withColName_withValue___block_invoke;
    double v22 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v23 = v12;
    if (logBrightnessDataWithEntryKey_withColName_withValue__defaultOnce != -1) {
      dispatch_once(&logBrightnessDataWithEntryKey_withColName_withValue__defaultOnce, &block);
    }
    if (logBrightnessDataWithEntryKey_withColName_withValue__classDebugEnabled)
    {
      float v13 = [NSString stringWithFormat:@"%s-%d: entryKey=%@, col=%@, value=%@", "-[PLDisplayAgent logBrightnessDataWithEntryKey:withColName:withValue:]", 3579, v8, v9, v10, block, v20, v21, v22, v23];
      uint64_t v14 = (void *)MEMORY[0x1E4F929B8];
      double v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m"];
      uint64_t v16 = [v15 lastPathComponent];
      int v17 = [NSString stringWithUTF8String:"-[PLDisplayAgent logBrightnessDataWithEntryKey:withColName:withValue:]"];
      [v14 logMessage:v13 fromFile:v16 fromFunction:v17 fromLineNumber:3579];

      char v18 = PLLogCommon();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
}

uint64_t __70__PLDisplayAgent_logBrightnessDataWithEntryKey_withColName_withValue___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logBrightnessDataWithEntryKey_withColName_withValue__classDebugEnabled = result;
  return result;
}

+ (BOOL)shouldLogBLR
{
  if (shouldLogBLR_onceToken != -1) {
    dispatch_once(&shouldLogBLR_onceToken, &__block_literal_global_1815);
  }
  return shouldLogBLR_result;
}

uint64_t __30__PLDisplayAgent_shouldLogBLR__block_invoke()
{
  if (([MEMORY[0x1E4F92A38] isiPod] & 1) != 0
    || ([MEMORY[0x1E4F92A38] isiPhone] & 1) != 0
    || ([MEMORY[0x1E4F92A38] isiPad] & 1) != 0)
  {
    uint64_t result = 1;
  }
  else
  {
    uint64_t result = [MEMORY[0x1E4F92A38] isMac];
  }
  shouldLogBLR_uint64_t result = result;
  return result;
}

+ (BOOL)shouldLogALSPowerSaved
{
  if (shouldLogALSPowerSaved_onceToken != -1) {
    dispatch_once(&shouldLogALSPowerSaved_onceToken, &__block_literal_global_1817);
  }
  return shouldLogALSPowerSaved_result;
}

uint64_t __40__PLDisplayAgent_shouldLogALSPowerSaved__block_invoke()
{
  uint64_t result = [MEMORY[0x1E4F92A38] isiPod];
  if (result)
  {
    char v1 = 0;
  }
  else
  {
    uint64_t result = [MEMORY[0x1E4F92A38] isMac];
    char v1 = result ^ 1;
  }
  shouldLogALSPowerSaved_uint64_t result = v1;
  return result;
}

+ (BOOL)shouldLogBacklightControl
{
  if (shouldLogBacklightControl_onceToken != -1) {
    dispatch_once(&shouldLogBacklightControl_onceToken, &__block_literal_global_1819);
  }
  return shouldLogBacklightControl_result;
}

uint64_t __43__PLDisplayAgent_shouldLogBacklightControl__block_invoke()
{
  uint64_t result = [MEMORY[0x1E4F92A38] isArchARM];
  shouldLogBacklightControl_uint64_t result = result;
  return result;
}

+ (BOOL)shouldLogDisplay
{
  if (shouldLogDisplay_onceToken != -1) {
    dispatch_once(&shouldLogDisplay_onceToken, &__block_literal_global_1821);
  }
  return shouldLogDisplay_result;
}

uint64_t __34__PLDisplayAgent_shouldLogDisplay__block_invoke()
{
  uint64_t result = [MEMORY[0x1E4F92A38] isArchARM];
  shouldLogDisplay_uint64_t result = result;
  return result;
}

+ (BOOL)shouldLogLCD
{
  if (shouldLogLCD_onceToken != -1) {
    dispatch_once(&shouldLogLCD_onceToken, &__block_literal_global_1823);
  }
  return shouldLogLCD_result;
}

uint64_t __30__PLDisplayAgent_shouldLogLCD__block_invoke()
{
  uint64_t result = [MEMORY[0x1E4F92A38] isMac];
  shouldLogLCD_uint64_t result = result;
  return result;
}

+ (BOOL)shouldLogFromDCP
{
  if (shouldLogFromDCP_onceToken != -1) {
    dispatch_once(&shouldLogFromDCP_onceToken, &__block_literal_global_1825);
  }
  return shouldLogFromDCP_result;
}

uint64_t __34__PLDisplayAgent_shouldLogFromDCP__block_invoke()
{
  uint64_t result = [MEMORY[0x1E4F92A38] hasDCP];
  if (result)
  {
    uint64_t result = objc_msgSend(MEMORY[0x1E4F92A38], "kPLDeviceClassIsOneOf:", 102042, 0);
    char v1 = result ^ 1;
  }
  else
  {
    char v1 = 0;
  }
  shouldLogFromDCP_uint64_t result = v1;
  return result;
}

+ (BOOL)shouldLogUserBrightness
{
  if (shouldLogUserBrightness_onceToken != -1) {
    dispatch_once(&shouldLogUserBrightness_onceToken, &__block_literal_global_1827);
  }
  return shouldLogUserBrightness_result;
}

uint64_t __41__PLDisplayAgent_shouldLogUserBrightness__block_invoke()
{
  uint64_t result = [MEMORY[0x1E4F92A38] isMac];
  shouldLogUserBrightness_uint64_t result = result ^ 1;
  return result;
}

+ (BOOL)shouldLogKeyboardBrightness
{
  if (shouldLogKeyboardBrightness_onceToken != -1) {
    dispatch_once(&shouldLogKeyboardBrightness_onceToken, &__block_literal_global_1829);
  }
  return shouldLogKeyboardBrightness_result;
}

uint64_t __45__PLDisplayAgent_shouldLogKeyboardBrightness__block_invoke()
{
  char v0 = [MEMORY[0x1E4F92A38] isiPad];
  uint64_t result = [MEMORY[0x1E4F92A38] isMac];
  shouldLogKeyboardBrightness_uint64_t result = result | v0;
  return result;
}

+ (BOOL)shouldLogLuxStats
{
  if (shouldLogLuxStats_onceToken != -1) {
    dispatch_once(&shouldLogLuxStats_onceToken, &__block_literal_global_1831);
  }
  return shouldLogLuxStats_result;
}

uint64_t __35__PLDisplayAgent_shouldLogLuxStats__block_invoke()
{
  uint64_t result = [MEMORY[0x1E4F92A38] isiPhone];
  if (result) {
    uint64_t result = MGGetBoolAnswer();
  }
  shouldLogLuxStats_uint64_t result = result;
  return result;
}

- (void)logBlueLightDataWithDictionary:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  float v5 = [(PLDisplayAgent *)self bluelightFilterTimer];

  if (!v5)
  {
    objc_initWeak(&location, self);
    id v6 = objc_alloc(MEMORY[0x1E4F92A80]);
    id v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.5];
    id v8 = [(PLOperator *)self workQueue];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    void v31[2] = __49__PLDisplayAgent_logBlueLightDataWithDictionary___block_invoke;
    void v31[3] = &unk_1E6E4A2D8;
    objc_copyWeak(&v32, &location);
    id v9 = (void *)[v6 initWithFireDate:v7 withInterval:0 withTolerance:0 repeats:v8 withUserInfo:v31 withQueue:0.0 withBlock:0.0];
    [(PLDisplayAgent *)self setBluelightFilterTimer:v9];

    id v10 = [(PLDisplayAgent *)self bluelightFilterTimer];
    [v10 arm];

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }
  uint64_t v11 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"BlueLightReductionStatus"];
  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v11];
  float v13 = [v4 allKeys];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v34 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        char v18 = [v4 objectForKeyedSubscript:v17];
        [v12 setObject:v18 forKeyedSubscript:v17];
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v34 count:16];
    }
    while (v14);
  }
  [(PLDisplayAgent *)self setBluelightStatusEntry:v12];
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v19 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__PLDisplayAgent_logBlueLightDataWithDictionary___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v19;
    if (logBlueLightDataWithDictionary__defaultOnce != -1) {
      dispatch_once(&logBlueLightDataWithDictionary__defaultOnce, block);
    }
    if (logBlueLightDataWithDictionary__classDebugEnabled)
    {
      uint64_t v20 = [NSString stringWithFormat:@"%s-%d: entryKey=%@, entry=%@", "-[PLDisplayAgent logBlueLightDataWithDictionary:]", 3698, v11, v12];
      double v21 = (void *)MEMORY[0x1E4F929B8];
      double v22 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m"];
      uint64_t v23 = [v22 lastPathComponent];
      double v24 = [NSString stringWithUTF8String:"-[PLDisplayAgent logBlueLightDataWithDictionary:]"];
      [v21 logMessage:v20 fromFile:v23 fromFunction:v24 fromLineNumber:3698];

      uint64_t v25 = PLLogCommon();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
}

void __49__PLDisplayAgent_logBlueLightDataWithDictionary___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reArmCallback];
}

uint64_t __49__PLDisplayAgent_logBlueLightDataWithDictionary___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  logBlueLightDataWithDictionary__classDebugEnabled = result;
  return result;
}

- (void)reArmCallback
{
  uint64_t v3 = [(PLDisplayAgent *)self bluelightStatusEntry];
  [(PLOperator *)self logEntry:v3];

  id v4 = [(PLDisplayAgent *)self bluelightFilterTimer];

  if (v4)
  {
    float v5 = [(PLDisplayAgent *)self bluelightFilterTimer];
    [v5 invalidate];
  }
  [(PLDisplayAgent *)self setBluelightFilterTimer:0];
  [(PLDisplayAgent *)self setBluelightStatusEntry:0];
}

+ (BOOL)shouldLogTouch
{
  if (shouldLogTouch_onceToken != -1) {
    dispatch_once(&shouldLogTouch_onceToken, &__block_literal_global_1839);
  }
  return shouldLogTouch_result;
}

uint64_t __32__PLDisplayAgent_shouldLogTouch__block_invoke()
{
  uint64_t result = [MEMORY[0x1E4F92A38] isiOS];
  shouldLogTouch_uint64_t result = result;
  return result;
}

- (__IOHIDEventSystemClient)setUpIOHIDTouchSystemClient
{
  if (!+[PLDisplayAgent shouldLogTouch]
    || ![MEMORY[0x1E4F929C0] fullMode])
  {
    return 0;
  }
  uint64_t v3 = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate();
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    float v5 = [MEMORY[0x1E4F28ED0] numberWithInt:13];
    [v4 setObject:v5 forKey:@"DeviceUsagePage"];

    id v6 = [MEMORY[0x1E4F28ED0] numberWithBool:1];
    [v4 setObject:v6 forKey:@"Built-In"];

    id v7 = [(PLOperator *)self workQueue];
    IOHIDEventSystemClientScheduleWithDispatchQueue();

    IOHIDEventSystemClientRegisterEventCallback();
    IOHIDEventSystemClientSetMatching();
  }
  return v3;
}

- (BOOL)listenForAlsPluginMatchingKeys:(__IOHIDEventSystemClient *)a3 withKeys:(const void *)a4 withValues:(const void *)a5 withCount:(unint64_t)a6
{
  return 0;
}

- (__IOHIDEventSystemClient)setUpIOHIDAmbientLightSensorSystemClient
{
  return 0;
}

- (BOOL)updateDisplayIOReportStats:(id)a3 logZeroFramesOnlyOnce:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = v5;
  if (v5 && [v5 subscription])
  {
    [v6 subscription];
    id v7 = [v6 subscribedChannels];
    Samples = (void *)IOReportCreateSamples();

    if (!Samples)
    {
      LOBYTE(SamplesDelta) = 0;
LABEL_42:

      goto LABEL_43;
    }
    id v9 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    id v10 = [v6 ioReportSample];

    if (!v10)
    {
LABEL_39:
      [v6 setIoReportSample:Samples];
      SamplesDelta = [v6 sampleTime];
      [v6 setSampleTimePrevious:SamplesDelta];

      [v6 setSampleTime:v9];
      LOBYTE(SamplesDelta) = 1;
      goto LABEL_41;
    }
    uint64_t v11 = [v6 ioReportSample];
    SamplesDelta = (void *)IOReportCreateSamplesDelta();

    if (!SamplesDelta)
    {
LABEL_41:

      goto LABEL_42;
    }
    uint64_t v72 = 0;
    v73 = &v72;
    uint64_t v74 = 0x3032000000;
    v75 = __Block_byref_object_copy__14;
    v76 = __Block_byref_object_dispose__14;
    id v77 = 0;
    uint64_t v66 = 0;
    v67 = &v66;
    uint64_t v68 = 0x3032000000;
    v69 = __Block_byref_object_copy__14;
    float v70 = __Block_byref_object_dispose__14;
    id v71 = 0;
    uint64_t v60 = 0;
    uint64_t v61 = &v60;
    uint64_t v62 = 0x3032000000;
    v63 = __Block_byref_object_copy__14;
    uint64_t v64 = __Block_byref_object_dispose__14;
    id v65 = 0;
    v58[0] = 0;
    v58[1] = v58;
    v58[2] = 0x3032000000;
    v58[3] = __Block_byref_object_copy__14;
    v58[4] = __Block_byref_object_dispose__14;
    id v59 = 0;
    v56[0] = 0;
    v56[1] = v56;
    void v56[2] = 0x3032000000;
    v56[3] = __Block_byref_object_copy__14;
    void v56[4] = __Block_byref_object_dispose__14;
    id v57 = 0;
    float v13 = objc_alloc_init(PLDisplayAPLStats);
    IOReportIterate();
    uint64_t v14 = [v6 sampleTime];
    [v9 timeIntervalSinceDate:v14];
    double v16 = v15;

    if (v16 <= 0.0 || ([(id)v61[5] doubleValue], v17 <= 0.0))
    {
      [(PLDisplayAPLStats *)v13 setAvgPower:&unk_1F40121F8];
    }
    else
    {
      if (objc_msgSend(MEMORY[0x1E4F92A38], "kPLDeviceClassIsOneOf:", 100078, 100079, 0))
      {
        double v18 = 1.12014716;
      }
      else if (objc_msgSend(MEMORY[0x1E4F92A38], "kPLDeviceClassIsOneOf:", 100080, 100081, 0))
      {
        double v18 = 1.29084846;
      }
      else
      {
        double v18 = 0.0;
      }
      [(id)v61[5] doubleValue];
      uint64_t v20 = [MEMORY[0x1E4F28ED0] numberWithDouble:v19 / v16 / 1000.0 + v18 * 1000.0];
      [(PLDisplayAPLStats *)v13 setAvgPower:v20];
    }
    double v21 = (void *)v67[5];
    if (v21 && (int)[v21 intValue] >= 1)
    {
      [(id)v73[5] doubleValue];
      double v23 = v22;
      [(id)v67[5] doubleValue];
      uint64_t v25 = [MEMORY[0x1E4F28ED0] numberWithDouble:v23 / v24];
      [(PLDisplayAPLStats *)v13 setAvgAPL:v25];
    }
    uint64_t v26 = [(PLDisplayAPLStats *)v13 frames];
    if (v26)
    {
      long long v27 = [(PLDisplayAPLStats *)v13 frames];
      int v28 = [v27 intValue];

      if (v28 >= 1)
      {
        long long v29 = [(PLDisplayAPLStats *)v13 avgRed];
        [v29 doubleValue];
        double v31 = v30;
        id v32 = [(PLDisplayAPLStats *)v13 frames];
        [v32 doubleValue];
        double v34 = v31 / v33;

        char v35 = 0;
        if (v34 < 0.0) {
          goto LABEL_38;
        }
        if (v34 > 255.0) {
          goto LABEL_38;
        }
        id v36 = [MEMORY[0x1E4F28ED0] numberWithDouble:v34];
        [(PLDisplayAPLStats *)v13 setAvgRed:v36];

        uint64_t v37 = [(PLDisplayAPLStats *)v13 avgGreen];
        [v37 doubleValue];
        double v39 = v38;
        uint64_t v40 = [(PLDisplayAPLStats *)v13 frames];
        [v40 doubleValue];
        double v42 = v39 / v41;

        char v35 = 0;
        if (v42 < 0.0) {
          goto LABEL_38;
        }
        if (v42 > 255.0) {
          goto LABEL_38;
        }
        char v43 = [MEMORY[0x1E4F28ED0] numberWithDouble:v42];
        [(PLDisplayAPLStats *)v13 setAvgGreen:v43];

        uint64_t v44 = [(PLDisplayAPLStats *)v13 avgBlue];
        [v44 doubleValue];
        double v46 = v45;
        int v47 = [(PLDisplayAPLStats *)v13 frames];
        [v47 doubleValue];
        double v49 = v46 / v48;

        char v35 = 0;
        if (v49 < 0.0 || v49 > 255.0)
        {
LABEL_38:

          _Block_object_dispose(v56, 8);
          _Block_object_dispose(v58, 8);

          _Block_object_dispose(&v60, 8);
          _Block_object_dispose(&v66, 8);

          _Block_object_dispose(&v72, 8);
          if ((v35 & 1) == 0)
          {
            LOBYTE(SamplesDelta) = 0;
            goto LABEL_41;
          }
          goto LABEL_39;
        }
        double v50 = [MEMORY[0x1E4F28ED0] numberWithDouble:v49];
        [(PLDisplayAPLStats *)v13 setAvgBlue:v50];

        char v51 = 0;
LABEL_37:
        updateDisplayIOReportStats_logZeroFramesOnlyOnce__gotZeroFrameAlready = v51;
        [v6 setDisplayAPLStats:v13];
        char v35 = 1;
        goto LABEL_38;
      }
    }
    double v52 = [(PLDisplayAPLStats *)v13 frames];
    if (v52)
    {
      __int16 v53 = [(PLDisplayAPLStats *)v13 frames];
      int v54 = [v53 intValue];

      if ((v54 & 0x80000000) == 0)
      {
        if (!v4 || updateDisplayIOReportStats_logZeroFramesOnlyOnce__gotZeroFrameAlready != 1)
        {
          char v51 = 1;
          goto LABEL_37;
        }
        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          char v35 = 0;
          updateDisplayIOReportStats_logZeroFramesOnlyOnce__gotZeroFrameAlready = 0;
          goto LABEL_38;
        }
      }
    }
    char v35 = 0;
    goto LABEL_38;
  }
  LOBYTE(SamplesDelta) = 0;
LABEL_43:

  return (char)SamplesDelta;
}

void __67__PLDisplayAgent_updateDisplayIOReportStats_logZeroFramesOnlyOnce___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4E7EF70]();
  uint64_t v3 = IOReportChannelGetChannelName();
  uint64_t v4 = [MEMORY[0x1E4F28ED0] numberWithLongLong:IOReportSimpleGetIntegerValue()];
  id v5 = (void *)v4;
  if (v4) {
    id v6 = (void *)v4;
  }
  else {
    id v6 = &unk_1F400DAC8;
  }
  id v7 = v6;

  if ([v3 isEqualToString:@"red"])
  {
    [*(id *)(a1 + 32) setAvgRed:v7];
    goto LABEL_23;
  }
  if ([v3 isEqualToString:@"green"])
  {
    [*(id *)(a1 + 32) setAvgGreen:v7];
    goto LABEL_23;
  }
  if ([v3 isEqualToString:@"blue"])
  {
    [*(id *)(a1 + 32) setAvgBlue:v7];
    goto LABEL_23;
  }
  if ([v3 isEqualToString:@"frame_count"])
  {
    [*(id *)(a1 + 32) setFrames:v7];
    goto LABEL_23;
  }
  if ([v3 isEqualToString:@"nits_accum"])
  {
    uint64_t v8 = *(void *)(a1 + 40);
  }
  else if ([v3 isEqualToString:@"bl_frame_count"])
  {
    uint64_t v8 = *(void *)(a1 + 48);
  }
  else if ([v3 isEqualToString:@"power"])
  {
    uint64_t v8 = *(void *)(a1 + 56);
  }
  else if ([v3 isEqualToString:@"apl_sum"])
  {
    uint64_t v8 = *(void *)(a1 + 64);
  }
  else
  {
    if (![v3 isEqualToString:@"apl_count"]) {
      goto LABEL_23;
    }
    uint64_t v8 = *(void *)(a1 + 72);
  }
  objc_storeStrong((id *)(*(void *)(v8 + 8) + 40), v6);
LABEL_23:
}

- (void)__FrameBufferEventCallback:(__IOMobileFramebuffer *)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (int *)malloc_type_aligned_alloc(0x4000uLL, 0x4000uLL, 0xF84E0148uLL);
  id v5 = v4;
  if (((unsigned __int16)v4 & 0x3FFF) != 0)
  {
    if (v4)
    {
      free(v4);
    }
  }
  else
  {
    id v36 = self;
    IOMobileFramebufferGetBufBlock();
    id v6 = PLLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[PLDisplayAgent __FrameBufferEventCallback:](v5, v6);
    }

    char v35 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"AZLSnapshots"];
    id v7 = [MEMORY[0x1E4F1CA48] array];
    double v39 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    if (*v5)
    {
      unint64_t v9 = 0;
      unsigned int v10 = 7;
      uint64_t v37 = *MEMORY[0x1E4F92D28];
      *(void *)&long long v8 = 67110656;
      long long v34 = v8;
      double v38 = v7;
      do
      {
        id v11 = objc_alloc(MEMORY[0x1E4F929D0]);
        uint64_t v12 = +[PLOperator entryKeyForType:v37 andName:@"AZLSnapshots"];
        float v13 = (void *)[v11 initWithEntryKey:v12 withDate:v39];

        uint64_t v14 = PLLogDisplay();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          int v26 = v5[v10];
          uint64_t v15 = v10 - 6;
          int v27 = v5[v15];
          uint64_t v16 = v10 - 5;
          int v28 = v5[v16];
          uint64_t v17 = v10 - 4;
          int v29 = v5[v17];
          uint64_t v18 = v10 - 3;
          int v30 = v5[v18];
          uint64_t v40 = v10 - 2;
          int v31 = v5[v40];
          uint64_t v41 = v10 - 1;
          int v32 = v5[v41];
          *(_DWORD *)buf = v34;
          int v45 = v26;
          __int16 v46 = 1024;
          int v47 = v27;
          __int16 v48 = 1024;
          int v49 = v28;
          __int16 v50 = 1024;
          int v51 = v29;
          __int16 v52 = 1024;
          int v53 = v30;
          __int16 v54 = 1024;
          int v55 = v31;
          __int16 v56 = 1024;
          int v57 = v32;
          _os_log_debug_impl(&dword_1E4220000, v14, OS_LOG_TYPE_DEBUG, "packet_id[%d]: current_ma(u14.18): 0x%x, voltage_v(u4.10): 0x%x, system_nits(u0.20): 0x%x, azl(u0.20): 0x%x, max_zone_current(0.14): 0x%x, max_row_step_to_step_current(10.14): 0x%x \n", buf, 0x2Cu);
        }
        else
        {
          uint64_t v15 = v10 - 6;
          uint64_t v16 = v10 - 5;
          uint64_t v17 = v10 - 4;
          uint64_t v18 = v10 - 3;
          uint64_t v40 = v10 - 2;
          uint64_t v41 = v10 - 1;
        }

        double v19 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:v5[v15]];
        [v13 setObject:v19 forKeyedSubscript:@"AverageCurrent"];

        uint64_t v20 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:v5[v16]];
        [v13 setObject:v20 forKeyedSubscript:@"VLED"];

        double v21 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:v5[v17]];
        [v13 setObject:v21 forKeyedSubscript:@"SystemNits"];

        double v22 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:v5[v18]];
        [v13 setObject:v22 forKeyedSubscript:@"AZL"];

        double v23 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:v5[v40]];
        [v13 setObject:v23 forKeyedSubscript:@"MaxRowCurrent"];

        double v24 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:v5[v41]];
        [v13 setObject:v24 forKeyedSubscript:@"NitsAccum"];

        uint64_t v25 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInt:v5[v10]];
        [v13 setObject:v25 forKeyedSubscript:@"PacketID"];

        id v7 = v38;
        [v38 addObject:v13];

        ++v9;
        v10 += 7;
      }
      while (v9 < *v5);
    }
    if (objc_msgSend(v7, "count", v34))
    {
      double v42 = v35;
      char v43 = v7;
      double v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
      [(PLOperator *)v36 logEntries:v33 withGroupID:v35];
    }
    [(PLDisplayAgent *)v36 setAZLSnapshotsEntries:[(PLDisplayAgent *)v36 AZLSnapshotsEntries] + *v5];
    free(v5);
  }
}

+ (BOOL)shouldLogAPL
{
  if (shouldLogAPL_onceToken != -1) {
    dispatch_once(&shouldLogAPL_onceToken, &__block_literal_global_1880);
  }
  return shouldLogAPL_result;
}

BOOL __30__PLDisplayAgent_shouldLogAPL__block_invoke()
{
  shouldLogAPL_BOOL result = objc_msgSend(MEMORY[0x1E4F92A38], "kPLDisplayClassIsOneOf:", 1002019, 1002020, 1002017, 1002018, 1002023, 1002022, 1002026, 1002027, 1002028, 1002031, 1002032, 1002041, 1002034, 1002035, 1002037, 1002038, 1002039,
                          0);
  BOOL result = (shouldLogAPL_result & 1) != 0
        || ([MEMORY[0x1E4F92A38] hasCapability:0] & 1) != 0
        || +[PLDisplayAgent shouldModelPowerFromAPL]
        || +[PLDisplayAgent shouldModelPowerFromIOMFB];
  shouldLogAPL_BOOL result = result;
  return result;
}

+ (BOOL)shouldModelPowerFromAPL
{
  if (shouldModelPowerFromAPL_onceToken != -1) {
    dispatch_once(&shouldModelPowerFromAPL_onceToken, &__block_literal_global_1882);
  }
  return shouldModelPowerFromAPL_supportedTarget;
}

uint64_t __41__PLDisplayAgent_shouldModelPowerFromAPL__block_invoke()
{
  uint64_t result = objc_msgSend(MEMORY[0x1E4F92A38], "kPLDisplayClassIsOneOf:", 1002021, 1002024, 1002025, 0);
  shouldModelPowerFromAPL_supportedTarget = result;
  return result;
}

+ (BOOL)shouldModelPowerFromIOMFB
{
  if (shouldModelPowerFromIOMFB_onceToken != -1) {
    dispatch_once(&shouldModelPowerFromIOMFB_onceToken, &__block_literal_global_1884);
  }
  return shouldModelPowerFromIOMFB_supportedTarget;
}

uint64_t __43__PLDisplayAgent_shouldModelPowerFromIOMFB__block_invoke()
{
  uint64_t result = objc_msgSend(MEMORY[0x1E4F92A38], "kPLDisplayClassIsOneOf:", 1002030, 0);
  shouldModelPowerFromIOMFB_supportedTarget = result;
  return result;
}

- (void)updateLastForegroundAppAPL:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v20 = v4;
    id v5 = [v4 objectForKey:@"entry"];

    id v4 = v20;
    if (v5)
    {
      id v6 = [v20 objectForKey:@"entry"];
      id v7 = [v6 objectForKey:@"AppRole"];
      int v8 = [v7 isEqualToValue:&unk_1F400DB10];

      unint64_t v9 = [v20 objectForKey:@"entry"];
      unsigned int v10 = [v9 objectForKey:@"ScreenWeight"];
      int v11 = [v10 isEqualToValue:&unk_1F4012148];

      uint64_t v12 = [v20 objectForKey:@"entry"];
      float v13 = [v12 objectForKey:@"bundleID"];
      int v14 = [v13 isEqualToString:@"com.apple.lock-screen"];

      uint64_t v15 = [v20 objectForKey:@"entry"];
      uint64_t v16 = [v15 objectForKey:@"bundleID"];
      int v17 = [v16 isEqualToString:@"com.apple.lock-screen.aod"];

      if (v8 && v11 || ((v14 | v17) & v11) == 1)
      {
        uint64_t v18 = [v20 objectForKey:@"entry"];
        double v19 = [v18 objectForKey:@"bundleID"];
        [(PLDisplayAgent *)self setLastForegroundAppAPL:v19];
      }
      else
      {
        [(PLDisplayAgent *)self setLastForegroundAppAPL:0];
      }
      id v4 = v20;
    }
  }
}

- (void)logDisplayAPL
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "iokitBacklight is nil; skipping power modeling", v2, v3, v4, v5, v6);
}

- (void)logDisplayAZL
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "LogDisplayAZL  for entries %@", v2, v3, v4, v5, v6);
}

- (void)handleSBC
{
  if ([MEMORY[0x1E4F92A38] hasCapability:8])
  {
    [(PLDisplayAgent *)self logDisplayAZL];
  }
}

- (void)logAODChange
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "LogAODChange  for entries %@", v2, v3, v4, v5, v6);
}

- (void)modelDisplayPower:(id)a3
{
  id v4 = a3;
  if (([MEMORY[0x1E4F92A38] hasCapability:0] & 1) == 0)
  {
    uint64_t v5 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    uint8_t v6 = [v4 objectForKeyedSubscript:@"Brightness"];
    [v6 doubleValue];
    double v8 = v7;

    unint64_t v9 = [v4 objectForKeyedSubscript:@"uAmps"];
    [v9 doubleValue];
    double v11 = v10;

    double v12 = 0.0;
    if (v8 > 0.0)
    {
      [(PLDisplayAgent *)self uAmpsToDisplayPower:v11];
      double v12 = v13;
    }
    if ([MEMORY[0x1E4F929C0] debugEnabled])
    {
      uint64_t v14 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __36__PLDisplayAgent_modelDisplayPower___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      void block[4] = v14;
      if (modelDisplayPower__defaultOnce != -1) {
        dispatch_once(&modelDisplayPower__defaultOnce, block);
      }
      if (modelDisplayPower__classDebugEnabled)
      {
        uint64_t v15 = [NSString stringWithFormat:@"raw data %@, brightness %f, uAmps %f, power %f", v4, *(void *)&v8, *(void *)&v11, *(void *)&v12];
        uint64_t v16 = (void *)MEMORY[0x1E4F929B8];
        int v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m"];
        uint64_t v18 = [v17 lastPathComponent];
        double v19 = [NSString stringWithUTF8String:"-[PLDisplayAgent modelDisplayPower:]"];
        [v16 logMessage:v15 fromFile:v18 fromFunction:v19 fromLineNumber:4527];

        id v20 = PLLogCommon();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
        }
      }
    }
    double v21 = [MEMORY[0x1E4F92900] sharedInstance];
    [v21 createPowerEventForwardWithRootNodeID:10 withPower:v5 withStartDate:v12];
  }
}

uint64_t __36__PLDisplayAgent_modelDisplayPower___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  modelDisplayPower__classDebugEnabled = result;
  return result;
}

- (void)qualifyDisplayPower:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"Brightness"];
  [v5 doubleValue];
  double v7 = v6;

  double v8 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  BOOL v9 = [(PLDisplayAgent *)self isFirstTimeModeling];
  double v10 = (void *)MEMORY[0x1E4F1CBF0];
  if (v9
    || (BOOL v11 = [(PLDisplayAgent *)self wasDisplayOn],
        v11 != [(PLDisplayAgent *)self isDisplayOnNow]))
  {
    double v12 = [MEMORY[0x1E4F92900] sharedInstance];
    if ([(PLDisplayAgent *)self isDisplayOnNow]) {
      double v13 = &unk_1F40144B8;
    }
    else {
      double v13 = v10;
    }
    [v12 createQualificationEventForwardWithQualificationID:5 withChildNodeNames:v13 withStartDate:v8];

    [(PLDisplayAgent *)self setWasDisplayOn:[(PLDisplayAgent *)self isDisplayOnNow]];
  }
  uint64_t v14 = PLLogDisplay();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    int v19 = 134218754;
    double v20 = v7;
    __int16 v21 = 2112;
    id v22 = v4;
    __int16 v23 = 1024;
    BOOL v24 = v7 > 80.0;
    __int16 v25 = 1024;
    BOOL v26 = [(PLDisplayAgent *)self isDisplayHighBrightness];
    _os_log_debug_impl(&dword_1E4220000, v14, OS_LOG_TYPE_DEBUG, "brightness=%f, entry=%@, isHighBrightnessNow=%d, isHighBrightnessPrevious=%d", (uint8_t *)&v19, 0x22u);
  }

  if ([(PLDisplayAgent *)self isFirstTimeModeling]
    || v7 > 80.0 != [(PLDisplayAgent *)self isDisplayHighBrightness])
  {
    uint64_t v15 = PLLogDisplay();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[PLDisplayAgent qualifyDisplayPower:]();
    }

    uint64_t v16 = [MEMORY[0x1E4F92900] sharedInstance];
    int v17 = v16;
    if (v7 <= 80.0) {
      uint64_t v18 = v10;
    }
    else {
      uint64_t v18 = &unk_1F40144D0;
    }
    objc_msgSend(v16, "createQualificationEventForwardWithQualificationID:withChildNodeNames:withStartDate:", 6, v18, v8, 80.0);

    [(PLDisplayAgent *)self setIsDisplayHighBrightness:v7 > 80.0];
  }
  [(PLDisplayAgent *)self setIsFirstTimeModeling:0];
}

- (double)uAmpsToDisplayPower:(double)a3
{
  double v3 = 0.0;
  if (a3 > 0.0)
  {
    double v6 = [(PLDisplayAgent *)self displayPowerModel];
    double v7 = [v6 objectForKeyedSubscript:@"slope2"];
    [v7 doubleValue];
    double v9 = v8 * 0.0000001 * a3;
    double v10 = [(PLDisplayAgent *)self displayPowerModel];
    BOOL v11 = [v10 objectForKeyedSubscript:@"slope"];
    [v11 doubleValue];
    double v13 = v12 * a3 + v9 * a3;
    uint64_t v14 = [(PLDisplayAgent *)self displayPowerModel];
    uint64_t v15 = [v14 objectForKeyedSubscript:@"intercept"];
    [v15 doubleValue];
    double v3 = v13 + v16;
  }
  return fmax(v3, 0.0);
}

- (id)getIOMFBSubFrameMap
{
  if (getIOMFBSubFrameMap_onceToken != -1) {
    dispatch_once(&getIOMFBSubFrameMap_onceToken, &__block_literal_global_1925);
  }
  uint64_t v2 = (void *)getIOMFBSubFrameMap_subFrameMap;
  return v2;
}

uint64_t __37__PLDisplayAgent_getIOMFBSubFrameMap__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = (void *)getIOMFBSubFrameMap_subFrameMap;
  getIOMFBSubFrameMap_subFrameMap = v0;

  [(id)getIOMFBSubFrameMap_subFrameMap setObject:&unk_1F4012208 forKeyedSubscript:@"subframes_0"];
  [(id)getIOMFBSubFrameMap_subFrameMap setObject:&unk_1F4012218 forKeyedSubscript:@"subframes_1"];
  [(id)getIOMFBSubFrameMap_subFrameMap setObject:&unk_1F4012228 forKeyedSubscript:@"subframes_2"];
  [(id)getIOMFBSubFrameMap_subFrameMap setObject:&unk_1F4012238 forKeyedSubscript:@"subframes_3"];
  [(id)getIOMFBSubFrameMap_subFrameMap setObject:&unk_1F4012248 forKeyedSubscript:@"subframes_4"];
  [(id)getIOMFBSubFrameMap_subFrameMap setObject:&unk_1F4012258 forKeyedSubscript:@"subframes_5"];
  [(id)getIOMFBSubFrameMap_subFrameMap setObject:&unk_1F4012268 forKeyedSubscript:@"subframes_6"];
  [(id)getIOMFBSubFrameMap_subFrameMap setObject:&unk_1F4012278 forKeyedSubscript:@"subframes_7"];
  [(id)getIOMFBSubFrameMap_subFrameMap setObject:&unk_1F4012288 forKeyedSubscript:@"subframes_8"];
  [(id)getIOMFBSubFrameMap_subFrameMap setObject:&unk_1F4012298 forKeyedSubscript:@"subframes_9"];
  uint64_t v2 = (void *)getIOMFBSubFrameMap_subFrameMap;
  return [v2 setObject:&unk_1F40122A8 forKeyedSubscript:@"subframes_10"];
}

- (double)averageFrameRateFromIOMFBScanout:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(PLDisplayAgent *)self getIOMFBSubFrameMap];
    double v6 = v5;
    double v7 = 0.0;
    if (v5 && [v5 count] == 11)
    {
      uint64_t v19 = 0;
      double v20 = (double *)&v19;
      uint64_t v21 = 0x2020000000;
      uint64_t v22 = 0;
      uint64_t v15 = 0;
      double v16 = (double *)&v15;
      uint64_t v17 = 0x2020000000;
      uint64_t v18 = 0;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __51__PLDisplayAgent_averageFrameRateFromIOMFBScanout___block_invoke;
      v11[3] = &unk_1E6E48070;
      id v12 = v4;
      double v13 = &v19;
      uint64_t v14 = &v15;
      [v6 enumerateKeysAndObjectsUsingBlock:v11];
      double v8 = v16[3];
      if (v8 != 0.0)
      {
        double v9 = v20[3];
        if (v9 != 0.0) {
          double v7 = 1.0 / (v8 / v9);
        }
      }

      _Block_object_dispose(&v15, 8);
      _Block_object_dispose(&v19, 8);
    }
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

double __51__PLDisplayAgent_averageFrameRateFromIOMFBScanout___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v5 = (void *)a1[4];
  id v6 = a3;
  double v7 = [v5 objectForKeyedSubscript:a2];
  [v7 doubleValue];
  double v9 = v8;

  if (v9 == 0.0) {
    double v10 = 0.0;
  }
  else {
    double v10 = v9;
  }
  *(double *)(*(void *)(a1[5] + 8) + 24) = v10 + *(double *)(*(void *)(a1[5] + 8) + 24);
  [v6 doubleValue];
  double v12 = v11;

  uint64_t v13 = *(void *)(a1[6] + 8);
  double result = *(double *)(v13 + 24) + v10 * (1.0 / v12);
  *(double *)(v13 + 24) = result;
  return result;
}

- (void)modelDynamicDisplayPower:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v62 = v4;
    uint64_t v5 = [v4 objectForKey:@"entry"];
    v63 = (void *)v5;
    if (v5)
    {
      id v6 = (void *)v5;
      if ([(NSMutableArray *)self->_displayStateChanges count])
      {
        double v7 = [v6 objectForKey:@"timestamp"];
        [v7 doubleValue];
        double v9 = v8;

        if (v9 != 0.0)
        {
          double v10 = [v63 objectForKey:@"SampleTime"];
          [v10 doubleValue];
          double v12 = v11;

          [(PLDisplayAgent *)self averageFrameRateFromIOMFBScanout:v63];
          double v14 = v13;
          uint64_t v15 = [(PLDisplayAgent *)self displayPowerModel];
          double v16 = [v15 objectForKeyedSubscript:@"dyn_slope"];
          double v17 = 0.0;
          double v18 = 0.0;
          if (v16)
          {
            uint64_t v19 = [(PLDisplayAgent *)self displayPowerModel];
            double v20 = [v19 objectForKeyedSubscript:@"dyn_slope"];
            [v20 doubleValue];
            double v18 = v21;
          }
          uint64_t v22 = [(PLDisplayAgent *)self displayPowerModel];
          __int16 v23 = [v22 objectForKeyedSubscript:@"dyn_intercept"];
          if (v23)
          {
            BOOL v24 = [(PLDisplayAgent *)self displayPowerModel];
            __int16 v25 = [v24 objectForKeyedSubscript:@"dyn_intercept"];
            [v25 doubleValue];
            double v17 = v26;
          }
          double v27 = v9 - v12;

          if (v17 + v18 * v14 >= 0.0) {
            double v28 = v17 + v18 * v14;
          }
          else {
            double v28 = 0.0;
          }
          while (1)
          {
            if (![(NSMutableArray *)self->_displayStateChanges count]) {
              goto LABEL_50;
            }
            int v29 = (void *)MEMORY[0x1E4E7EF70]();
            unint64_t v30 = [(NSMutableArray *)self->_displayStateChanges count];
            int v31 = [(NSMutableArray *)self->_displayStateChanges objectAtIndexedSubscript:0];
            int v32 = [v31 objectAtIndex:0];
            [v32 doubleValue];
            double v34 = v33;

            if (v34 > v27) {
              break;
            }
            double v34 = v27;
            double v38 = v9;
            if (v30 < 2) {
              goto LABEL_24;
            }
            char v35 = [(NSMutableArray *)self->_displayStateChanges objectAtIndexedSubscript:1];
            double v39 = [v35 objectAtIndex:0];
            [v39 doubleValue];
            double v38 = v40;

            if (v38 > v27)
            {
              double v34 = v27;
LABEL_20:
              if (v38 >= v9) {
                double v38 = v9;
              }

              goto LABEL_24;
            }
            [(NSMutableArray *)self->_displayStateChanges removeObjectAtIndex:0];
            int v49 = 2;
LABEL_33:

            if (v49 == 3) {
              goto LABEL_50;
            }
          }
          if (v34 >= v9)
          {

            goto LABEL_50;
          }
          if (v30 >= 2)
          {
            char v35 = [(NSMutableArray *)self->_displayStateChanges objectAtIndexedSubscript:1];
            id v36 = [v35 objectAtIndex:0];
            [v36 doubleValue];
            double v38 = v37;

            goto LABEL_20;
          }
          double v38 = v9;
LABEL_24:
          char v35 = [v31 objectAtIndex:1];
          uint64_t v41 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSince1970:v34];
          double v42 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSince1970:v38];
          if (([v35 BOOLValue] & 1) == 0)
          {
            char v43 = [MEMORY[0x1E4F92900] sharedInstance];
            [v43 createPowerEventIntervalWithRootNodeID:56 withPower:v41 withStartDate:v42 withEndDate:0.0];
          }
          if ([v35 BOOLValue])
          {
            uint64_t v44 = [MEMORY[0x1E4F92900] sharedInstance];
            [v44 createPowerEventIntervalWithRootNodeID:56 withPower:v41 withStartDate:v42 withEndDate:v28];
          }
          if (v30 < 2) {
            goto LABEL_31;
          }
          int v45 = [(NSMutableArray *)self->_displayStateChanges objectAtIndexedSubscript:1];
          __int16 v46 = [v45 objectAtIndex:0];
          [v46 doubleValue];
          double v48 = v47;

          if (v48 > v9)
          {
LABEL_31:
            int v49 = 3;
          }
          else
          {
            [(NSMutableArray *)self->_displayStateChanges removeObjectAtIndex:0];
            int v49 = 0;
          }

          goto LABEL_33;
        }
        goto LABEL_50;
      }
      if (![MEMORY[0x1E4F929C0] debugEnabled]) {
        goto LABEL_50;
      }
      uint64_t v57 = objc_opt_class();
      v64[0] = MEMORY[0x1E4F143A8];
      v64[1] = 3221225472;
      v64[2] = __43__PLDisplayAgent_modelDynamicDisplayPower___block_invoke_1987;
      v64[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v64[4] = v57;
      if (modelDynamicDisplayPower__defaultOnce_1985 != -1) {
        dispatch_once(&modelDynamicDisplayPower__defaultOnce_1985, v64);
      }
      if (!modelDynamicDisplayPower__classDebugEnabled_1986)
      {
LABEL_50:

        id v4 = v62;
        goto LABEL_51;
      }
      int v51 = [NSString stringWithFormat:@"Error: No display states recorded"];
      uint64_t v58 = (void *)MEMORY[0x1E4F929B8];
      id v59 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m"];
      uint64_t v60 = [v59 lastPathComponent];
      uint64_t v61 = [NSString stringWithUTF8String:"-[PLDisplayAgent modelDynamicDisplayPower:]"];
      [v58 logMessage:v51 fromFile:v60 fromFunction:v61 fromLineNumber:4631];

      __int16 v56 = PLLogCommon();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
    else
    {
      if (![MEMORY[0x1E4F929C0] debugEnabled]) {
        goto LABEL_50;
      }
      uint64_t v50 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __43__PLDisplayAgent_modelDynamicDisplayPower___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      void block[4] = v50;
      if (modelDynamicDisplayPower__defaultOnce != -1) {
        dispatch_once(&modelDynamicDisplayPower__defaultOnce, block);
      }
      if (!modelDynamicDisplayPower__classDebugEnabled) {
        goto LABEL_50;
      }
      int v51 = [NSString stringWithFormat:@"Error: No entry object in IOMFBScanout entry"];
      __int16 v52 = (void *)MEMORY[0x1E4F929B8];
      int v53 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m"];
      __int16 v54 = [v53 lastPathComponent];
      int v55 = [NSString stringWithUTF8String:"-[PLDisplayAgent modelDynamicDisplayPower:]"];
      [v52 logMessage:v51 fromFile:v54 fromFunction:v55 fromLineNumber:4629];

      __int16 v56 = PLLogCommon();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }

    goto LABEL_50;
  }
LABEL_51:
}

uint64_t __43__PLDisplayAgent_modelDynamicDisplayPower___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  modelDynamicDisplayPower__classDebugEnabled = result;
  return result;
}

uint64_t __43__PLDisplayAgent_modelDynamicDisplayPower___block_invoke_1987(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  modelDynamicDisplayPower__classDebugEnabled_1986 = result;
  return result;
}

- (double)calculatePowerFromAPL:(double)a3 withAvgRed:(double)a4 withAvgGreen:(double)a5 withAvgBlue:(double)a6
{
  double v9 = [(NSDictionary *)self->_displayPowerModel objectForKeyedSubscript:@"static_power"];
  double v10 = 0.0;
  double v11 = 0.0;
  if (v9)
  {
    double v12 = [(NSDictionary *)self->_displayPowerModel objectForKeyedSubscript:@"static_power"];
    [v12 doubleValue];
    double v11 = v13;
  }
  double v14 = [(NSDictionary *)self->_displayPowerModel objectForKeyedSubscript:@"touch_power"];
  if (v14)
  {
    uint64_t v15 = [(NSDictionary *)self->_displayPowerModel objectForKeyedSubscript:@"touch_power"];
    [v15 doubleValue];
    double v10 = v16;
  }
  double v17 = [(NSDictionary *)self->_displayPowerModel objectForKeyedSubscript:@"red_norm_slope"];
  double v18 = 0.0;
  double v19 = 0.0;
  if (v17)
  {
    double v20 = [(NSDictionary *)self->_displayPowerModel objectForKeyedSubscript:@"red_norm_slope"];
    [v20 doubleValue];
    double v19 = v21 * 0.000001 * a3;
  }
  uint64_t v22 = [(NSDictionary *)self->_displayPowerModel objectForKeyedSubscript:@"green_norm_slope"];
  if (v22)
  {
    __int16 v23 = [(NSDictionary *)self->_displayPowerModel objectForKeyedSubscript:@"green_norm_slope"];
    [v23 doubleValue];
    double v18 = v24 * 0.000001 * a3;
  }
  __int16 v25 = [(NSDictionary *)self->_displayPowerModel objectForKeyedSubscript:@"blue_norm_slope"];
  if (v25)
  {
    double v26 = [(NSDictionary *)self->_displayPowerModel objectForKeyedSubscript:@"blue_norm_slope"];
    [v26 doubleValue];
    double v28 = v27 * 0.000001 * a3;
  }
  else
  {
    double v28 = 0.0;
  }

  int v29 = [(NSDictionary *)self->_displayPowerModel objectForKeyedSubscript:@"red_norm_intercept"];
  if (v29)
  {
    unint64_t v30 = [(NSDictionary *)self->_displayPowerModel objectForKeyedSubscript:@"red_norm_intercept"];
    [v30 doubleValue];
    double v32 = v19 + v31;
  }
  else
  {
    double v32 = v19 + 0.0;
  }

  double v33 = [(NSDictionary *)self->_displayPowerModel objectForKeyedSubscript:@"green_norm_intercept"];
  if (v33)
  {
    double v34 = [(NSDictionary *)self->_displayPowerModel objectForKeyedSubscript:@"green_norm_intercept"];
    [v34 doubleValue];
    double v36 = v18 + v35;
  }
  else
  {
    double v36 = v18 + 0.0;
  }

  double v37 = [(NSDictionary *)self->_displayPowerModel objectForKeyedSubscript:@"blue_norm_intercept"];
  if (v37)
  {
    double v38 = [(NSDictionary *)self->_displayPowerModel objectForKeyedSubscript:@"blue_norm_intercept"];
    [v38 doubleValue];
    double v40 = v28 + v39;
  }
  else
  {
    double v40 = v28 + 0.0;
  }

  if (v32 >= 0.0) {
    double v41 = v32;
  }
  else {
    double v41 = 0.0;
  }
  if (v36 >= 0.0) {
    double v42 = v36;
  }
  else {
    double v42 = 0.0;
  }
  if (v40 >= 0.0) {
    double v43 = v40;
  }
  else {
    double v43 = 0.0;
  }
  if (v41 > 1.0) {
    double v41 = 1.0;
  }
  if (v42 > 1.0) {
    double v42 = 1.0;
  }
  if (v43 > 1.0) {
    double v43 = 1.0;
  }
  double v44 = v41 * a4 / 255.0 + v42 * a5 / 255.0 + v43 * a6 / 255.0;
  uint64_t v45 = [(NSDictionary *)self->_displayPowerModel objectForKeyedSubscript:@"mnit_scale_values"];
  double v46 = 0.0;
  if (v45)
  {
    double v47 = (void *)v45;
    double v48 = [(NSDictionary *)self->_displayPowerModel objectForKeyedSubscript:@"mnit_scale_values"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v50 = [(NSDictionary *)self->_displayPowerModel objectForKeyedSubscript:@"mnit_scale_values"];
      +[PLUtilities scaledPowerBasedOnPoint:v50 withPowerModel:a3];
      double v46 = v51;
    }
  }
  double v52 = v44 * (v46 * a3);
  if (v52 > 5000.0 || v52 < 0.0) {
    double v52 = 0.0;
  }
  double v54 = v11 + v10 + v52;
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v55 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__PLDisplayAgent_calculatePowerFromAPL_withAvgRed_withAvgGreen_withAvgBlue___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v55;
    if (calculatePowerFromAPL_withAvgRed_withAvgGreen_withAvgBlue__defaultOnce != -1) {
      dispatch_once(&calculatePowerFromAPL_withAvgRed_withAvgGreen_withAvgBlue__defaultOnce, block);
    }
    if (calculatePowerFromAPL_withAvgRed_withAvgGreen_withAvgBlue__classDebugEnabled)
    {
      __int16 v56 = [NSString stringWithFormat:@"mNits: %f\tavgRed: %f\tavgGreen: %f\tavgBlue: %f\tnormalizedColorSum: %.2f\tPower: %.2f", *(void *)&a3, *(void *)&a4, *(void *)&a5, *(void *)&a6, *(void *)&v44, *(void *)&v54];
      uint64_t v57 = (void *)MEMORY[0x1E4F929B8];
      uint64_t v58 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m"];
      id v59 = [v58 lastPathComponent];
      uint64_t v60 = [NSString stringWithUTF8String:"-[PLDisplayAgent calculatePowerFromAPL:withAvgRed:withAvgGreen:withAvgBlue:]"];
      [v57 logMessage:v56 fromFile:v59 fromFunction:v60 fromLineNumber:4808];

      uint64_t v61 = PLLogCommon();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  return v54;
}

uint64_t __76__PLDisplayAgent_calculatePowerFromAPL_withAvgRed_withAvgGreen_withAvgBlue___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  calculatePowerFromAPL_withAvgRed_withAvgGreen_withAvgBlue__classDebugEnabled = result;
  return result;
}

- (void)modelDisplayPowerFromIOMFB:(id)a3
{
  id v4 = [a3 displayAPLStats];
  uint64_t v5 = [v4 avgPower];
  [v5 doubleValue];
  double v7 = v6;

  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v8 = objc_opt_class();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__PLDisplayAgent_modelDisplayPowerFromIOMFB___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    void block[4] = v8;
    if (modelDisplayPowerFromIOMFB__defaultOnce != -1) {
      dispatch_once(&modelDisplayPowerFromIOMFB__defaultOnce, block);
    }
    if (modelDisplayPowerFromIOMFB__classDebugEnabled)
    {
      double v9 = objc_msgSend(NSString, "stringWithFormat:", @"Display power: %f", *(void *)&v7);
      double v10 = (void *)MEMORY[0x1E4F929B8];
      double v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m"];
      double v12 = [v11 lastPathComponent];
      double v13 = [NSString stringWithUTF8String:"-[PLDisplayAgent modelDisplayPowerFromIOMFB:]"];
      [v10 logMessage:v9 fromFile:v12 fromFunction:v13 fromLineNumber:4822];

      double v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  if ([MEMORY[0x1E4F929C0] debugEnabled])
  {
    uint64_t v15 = objc_opt_class();
    uint64_t v28 = MEMORY[0x1E4F143A8];
    uint64_t v29 = 3221225472;
    unint64_t v30 = __45__PLDisplayAgent_modelDisplayPowerFromIOMFB___block_invoke_2035;
    double v31 = &__block_descriptor_40_e5_v8__0lu32l8;
    uint64_t v32 = v15;
    if (modelDisplayPowerFromIOMFB__defaultOnce_2033 != -1) {
      dispatch_once(&modelDisplayPowerFromIOMFB__defaultOnce_2033, &v28);
    }
    if (modelDisplayPowerFromIOMFB__classDebugEnabled_2034)
    {
      double v16 = NSString;
      double v17 = [(PLIOReportStats *)self->_displayIOReportStats sampleTimePrevious];
      double v18 = [(PLIOReportStats *)self->_displayIOReportStats sampleTime];
      double v19 = [v16 stringWithFormat:@"SampleTimePrevious: %@ sampleTime: %@,", v17, v18, v28, v29, v30, v31, v32];

      double v20 = (void *)MEMORY[0x1E4F929B8];
      double v21 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m"];
      uint64_t v22 = [v21 lastPathComponent];
      __int16 v23 = [NSString stringWithUTF8String:"-[PLDisplayAgent modelDisplayPowerFromIOMFB:]"];
      [v20 logMessage:v19 fromFile:v22 fromFunction:v23 fromLineNumber:4823];

      double v24 = PLLogCommon();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
      }
    }
  }
  __int16 v25 = [MEMORY[0x1E4F92900] sharedInstance];
  double v26 = [(PLIOReportStats *)self->_displayIOReportStats sampleTimePrevious];
  double v27 = [(PLIOReportStats *)self->_displayIOReportStats sampleTime];
  [v25 createPowerEventIntervalWithRootNodeID:56 withPower:v26 withStartDate:v27 withEndDate:v7];
}

uint64_t __45__PLDisplayAgent_modelDisplayPowerFromIOMFB___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  modelDisplayPowerFromIOMFB__classDebugEnabled = result;
  return result;
}

uint64_t __45__PLDisplayAgent_modelDisplayPowerFromIOMFB___block_invoke_2035(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  modelDisplayPowerFromIOMFB__classDebugEnabled_2034 = result;
  return result;
}

- (void)modelDynamicDisplayPowerFromAPL:(id)a3
{
  id v4 = [a3 displayAPLStats];
  uint64_t v5 = v4;
  if (v4)
  {
    double v6 = [v4 avgRed];

    if (v6)
    {
      double v7 = 0.0;
      double v8 = 0.0;
      if ([(PLDisplayAgent *)self isDisplayOnNow])
      {
        double displaymNits = self->_displaymNits;
        double v10 = [v5 avgRed];
        [v10 doubleValue];
        double v12 = v11;
        double v13 = [v5 avgGreen];
        [v13 doubleValue];
        double v15 = v14;
        double v16 = [v5 avgBlue];
        [v16 doubleValue];
        [(PLDisplayAgent *)self calculatePowerFromAPL:displaymNits withAvgRed:v12 withAvgGreen:v15 withAvgBlue:v17];
        double v8 = v18;

        double realmNits = self->_realmNits;
        double v20 = [v5 avgRed];
        [v20 doubleValue];
        double v22 = v21;
        __int16 v23 = [v5 avgGreen];
        [v23 doubleValue];
        double v25 = v24;
        double v26 = [v5 avgBlue];
        [v26 doubleValue];
        [(PLDisplayAgent *)self calculatePowerFromAPL:realmNits withAvgRed:v22 withAvgGreen:v25 withAvgBlue:v27];
        double v29 = v28;

        double autobrightnessmNits = self->_autobrightnessmNits;
        double v31 = [v5 avgRed];
        [v31 doubleValue];
        double v33 = v32;
        double v34 = [v5 avgGreen];
        [v34 doubleValue];
        double v36 = v35;
        double v37 = [v5 avgBlue];
        [v37 doubleValue];
        [(PLDisplayAgent *)self calculatePowerFromAPL:autobrightnessmNits withAvgRed:v33 withAvgGreen:v36 withAvgBlue:v38];
        double v40 = v39;

        double v7 = v29 - v40;
        if ([MEMORY[0x1E4F929C0] debugEnabled])
        {
          uint64_t v41 = objc_opt_class();
          v67[0] = MEMORY[0x1E4F143A8];
          v67[1] = 3221225472;
          v67[2] = __50__PLDisplayAgent_modelDynamicDisplayPowerFromAPL___block_invoke;
          v67[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v67[4] = v41;
          if (modelDynamicDisplayPowerFromAPL__defaultOnce != -1) {
            dispatch_once(&modelDynamicDisplayPowerFromAPL__defaultOnce, v67);
          }
          if (modelDynamicDisplayPowerFromAPL__classDebugEnabled)
          {
            double v42 = objc_msgSend(NSString, "stringWithFormat:", @"displayPower: %f\trealPower: %f\tvirtualPower: %f\tsavedPower: %f", *(void *)&v8, *(void *)&v29, *(void *)&v40, v29 - v40);
            double v43 = (void *)MEMORY[0x1E4F929B8];
            double v44 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m"];
            uint64_t v45 = [v44 lastPathComponent];
            double v46 = [NSString stringWithUTF8String:"-[PLDisplayAgent modelDynamicDisplayPowerFromAPL:]"];
            [v43 logMessage:v42 fromFile:v45 fromFunction:v46 fromLineNumber:4846];

            double v47 = PLLogCommon();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
              __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
            }
          }
        }
      }
      if ([MEMORY[0x1E4F929C0] debugEnabled])
      {
        uint64_t v48 = objc_opt_class();
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __50__PLDisplayAgent_modelDynamicDisplayPowerFromAPL___block_invoke_2044;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        void block[4] = v48;
        if (modelDynamicDisplayPowerFromAPL__defaultOnce_2042 != -1) {
          dispatch_once(&modelDynamicDisplayPowerFromAPL__defaultOnce_2042, block);
        }
        if (modelDynamicDisplayPowerFromAPL__classDebugEnabled_2043)
        {
          int v49 = NSString;
          uint64_t v50 = [(PLIOReportStats *)self->_displayIOReportStats sampleTimePrevious];
          double v51 = [(PLIOReportStats *)self->_displayIOReportStats sampleTime];
          double v52 = [v49 stringWithFormat:@"SampleTimePrevious: %@ sampleTime: %@,", v50, v51];

          int v53 = (void *)MEMORY[0x1E4F929B8];
          double v54 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLDisplayAgent.m"];
          uint64_t v55 = [v54 lastPathComponent];
          __int16 v56 = [NSString stringWithUTF8String:"-[PLDisplayAgent modelDynamicDisplayPowerFromAPL:]"];
          [v53 logMessage:v52 fromFile:v55 fromFunction:v56 fromLineNumber:4848];

          uint64_t v57 = PLLogCommon();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG)) {
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
          }
        }
      }
      uint64_t v58 = [MEMORY[0x1E4F92900] sharedInstance];
      id v59 = [(PLIOReportStats *)self->_displayIOReportStats sampleTimePrevious];
      uint64_t v60 = [(PLIOReportStats *)self->_displayIOReportStats sampleTime];
      [v58 createPowerEventIntervalWithRootNodeID:56 withPower:v59 withStartDate:v60 withEndDate:v8];

      if (+[PLDisplayAgent shouldLogALSPowerSaved])
      {
        uint64_t v61 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"ALSPowerSaved"];
        id v62 = objc_alloc(MEMORY[0x1E4F929D0]);
        v63 = [(PLIOReportStats *)self->_displayIOReportStats sampleTimePrevious];
        uint64_t v64 = (void *)[v62 initWithEntryKey:v61 withDate:v63];

        id v65 = [MEMORY[0x1E4F28ED0] numberWithDouble:v7];
        [v64 setObject:v65 forKeyedSubscript:@"Power"];

        [(PLOperator *)self logEntry:v64];
      }
    }
  }
}

uint64_t __50__PLDisplayAgent_modelDynamicDisplayPowerFromAPL___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  modelDynamicDisplayPowerFromAPL__classDebugEnabled = result;
  return result;
}

uint64_t __50__PLDisplayAgent_modelDynamicDisplayPowerFromAPL___block_invoke_2044(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  modelDynamicDisplayPowerFromAPL__classDebugEnabled_2043 = result;
  return result;
}

- (id)trimConditionsForEntryKey:(id)a3 forTrimDate:(id)a4
{
  id v5 = a3;
  [a4 timeIntervalSince1970];
  uint64_t v7 = v6;
  double v8 = [(id)objc_opt_class() entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"Display"];
  int v9 = [v5 isEqualToString:v8];

  if (v9)
  {
    double v10 = [NSString stringWithFormat:@"%@ is NULL OR %@<(SELECT max(%@) FROM '%@' WHERE %@<%f)", @"timestamp", @"timestamp", @"timestamp", v5, @"timestamp", v7];
  }
  else
  {
    double v10 = 0;
  }

  return v10;
}

+ (id)dcpSubFrameMap
{
  if ([MEMORY[0x1E4F92A38] hasDCP])
  {
    int v2 = MGGetBoolAnswer();
    if (v2) {
      int v3 = 240;
    }
    else {
      int v3 = 60;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __32__PLDisplayAgent_dcpSubFrameMap__block_invoke;
    block[3] = &__block_descriptor_37_e5_v8__0l;
    int v7 = v3;
    char v8 = v2;
    if (dcpSubFrameMap_onceToken != -1) {
      dispatch_once(&dcpSubFrameMap_onceToken, block);
    }
    id v4 = (id)dcpSubFrameMap_subFrameMap;
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

void __32__PLDisplayAgent_dcpSubFrameMap__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:25];
  int v3 = (void *)dcpSubFrameMap_subFrameMap;
  dcpSubFrameMap_subFrameMap = v2;

  for (int i = 1; i != 26; ++i)
  {
    id v5 = objc_msgSend(NSString, "stringWithFormat:", @"subframes(%d)", (i - 1));
    int v6 = *(_DWORD *)(a1 + 32) / i;
    BOOL v7 = v6 >= 10 || *(unsigned char *)(a1 + 36) == 0;
    double v8 = (double)v6;
    if (!v7) {
      double v8 = 10.0;
    }
    int v9 = [MEMORY[0x1E4F28ED0] numberWithDouble:v8];
    [(id)dcpSubFrameMap_subFrameMap setObject:v9 forKeyedSubscript:v5];
  }
}

- (PLIOKitOperatorComposition)iokitBacklight
{
  return (PLIOKitOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (PLIOKitOperatorComposition)iokitBacklightDCP
{
  return (PLIOKitOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (PLIOKitOperatorComposition)iokitBacklightControl
{
  return (PLIOKitOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (PLIOKitOperatorComposition)iokitDisplay
{
  return (PLIOKitOperatorComposition *)objc_getProperty(self, a2, 96, 1);
}

- (PLIOKitOperatorComposition)iokitTouch
{
  return (PLIOKitOperatorComposition *)objc_getProperty(self, a2, 104, 1);
}

- (PLIOKitOperatorComposition)iokitKeyboardBrightness
{
  return (PLIOKitOperatorComposition *)objc_getProperty(self, a2, 112, 1);
}

- (PLIOKitOperatorComposition)iokitLCD
{
  return (PLIOKitOperatorComposition *)objc_getProperty(self, a2, 120, 1);
}

- (BrightnessSystemClient)brightnessSystemClient
{
  return (BrightnessSystemClient *)objc_getProperty(self, a2, 128, 1);
}

- (void)setBrightnessSystemClient:(id)a3
{
}

- (CBAdaptationClient)colorAdaptationClient
{
  return (CBAdaptationClient *)objc_getProperty(self, a2, 136, 1);
}

- (void)setColorAdaptationClient:(id)a3
{
}

- (PLTimer)backlightFilterTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 144, 1);
}

- (void)setBacklightFilterTimer:(id)a3
{
}

- (PLTimer)dcpTimeoffsetCalibTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 152, 1);
}

- (void)setDcpTimeoffsetCalibTimer:(id)a3
{
}

- (PLTimer)bluelightFilterTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 160, 1);
}

- (void)setBluelightFilterTimer:(id)a3
{
}

- (PLTimer)uAmpsFilterTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 168, 1);
}

- (void)setUAmpsFilterTimer:(id)a3
{
}

- (PLTimer)alsLuxFilterTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 176, 1);
}

- (void)setAlsLuxFilterTimer:(id)a3
{
}

- (PLTimer)AZLSnapshotsTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 184, 1);
}

- (void)setAZLSnapshotsTimer:(id)a3
{
}

- (NSMutableDictionary)pendingBacklightEntry
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 192, 1);
}

- (void)setPendingBacklightEntry:(id)a3
{
}

- (NSDate)pendingBacklightEntryDate
{
  return (NSDate *)objc_getProperty(self, a2, 200, 1);
}

- (void)setPendingBacklightEntryDate:(id)a3
{
}

- (double)currAFKSystemTimestamp
{
  return self->_currAFKSystemTimestamp;
}

- (void)setCurrAFKSystemTimestamp:(double)a3
{
  self->_currAFKSystemTimestamp = a3;
}

- (double)currMonoTimestamp
{
  return self->_currMonoTimestamp;
}

- (void)setCurrMonoTimestamp:(double)a3
{
  self->_currMonoTimestamp = a3;
}

- (double)currAFKSystemTimeOffset
{
  return self->_currAFKSystemTimeOffset;
}

- (void)setCurrAFKSystemTimeOffset:(double)a3
{
  self->_currAFKSystemTimeOffset = a3;
}

- (unint64_t)pendingALSLux
{
  return self->_pendingALSLux;
}

- (void)setPendingALSLux:(unint64_t)a3
{
  self->_pendingALSLux = a3;
}

- (unint64_t)lastALSLux
{
  return self->_lastALSLux;
}

- (void)setLastALSLux:(unint64_t)a3
{
  self->_lastALSLux = a3;
}

- (NSDate)pendingALSLuxEntryDate
{
  return (NSDate *)objc_getProperty(self, a2, 248, 1);
}

- (void)setPendingALSLuxEntryDate:(id)a3
{
}

- (BOOL)alsOn
{
  return self->_alsOn;
}

- (void)setAlsOn:(BOOL)a3
{
  self->_alsOn = a3;
}

- (double)lastALSPowerSaved
{
  return self->_lastALSPowerSaved;
}

- (void)setLastALSPowerSaved:(double)a3
{
  self->_lastALSPowerSaved = a3;
}

- (BOOL)userTouch
{
  return self->_userTouch;
}

- (void)setUserTouch:(BOOL)a3
{
  self->_userTouch = a3;
}

- (NSDate)userTouchDownTime
{
  return (NSDate *)objc_getProperty(self, a2, 264, 1);
}

- (void)setUserTouchDownTime:(id)a3
{
}

- (NSDictionary)displayPowerModel
{
  return (NSDictionary *)objc_getProperty(self, a2, 272, 1);
}

- (__IOHIDEventSystemClient)touchHIDClientRef
{
  return self->_touchHIDClientRef;
}

- (void)setTouchHIDClientRef:(__IOHIDEventSystemClient *)a3
{
  self->_touchHIDClientRef = a3;
}

- (__IOHIDEventSystemClient)ambientLightSensorHIDClientRef
{
  return self->_ambientLightSensorHIDClientRef;
}

- (void)setAmbientLightSensorHIDClientRef:(__IOHIDEventSystemClient *)a3
{
  self->_ambientLightSensorHIDClientRef = a3;
}

- (BOOL)alsPluginKeyRegistered
{
  return self->_alsPluginKeyRegistered;
}

- (void)setAlsPluginKeyRegistered:(BOOL)a3
{
  self->_alsPluginKeyRegistered = a3;
}

- (PLXPCListenerOperatorComposition)multitouchXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 296, 1);
}

- (void)setMultitouchXPCListener:(id)a3
{
}

- (BOOL)isMultitouchLoggingEnabled
{
  return self->_isMultitouchLoggingEnabled;
}

- (void)setIsMultitouchLoggingEnabled:(BOOL)a3
{
  self->_isMultitouchLoggingEnabled = a3;
}

- (PLMonotonicTimer)logLastALSPowerSavedTimer
{
  return (PLMonotonicTimer *)objc_getProperty(self, a2, 304, 1);
}

- (void)setLogLastALSPowerSavedTimer:(id)a3
{
}

- (PLEntry)bluelightStatusEntry
{
  return (PLEntry *)objc_getProperty(self, a2, 312, 1);
}

- (void)setBluelightStatusEntry:(id)a3
{
}

- (PLEventForwardDisplayEntry)uAmpsEntry
{
  return (PLEventForwardDisplayEntry *)objc_getProperty(self, a2, 320, 1);
}

- (void)setUAmpsEntry:(id)a3
{
}

- (BOOL)isMIEActive
{
  return self->_isMIEActive;
}

- (void)setIsMIEActive:(BOOL)a3
{
  self->_isMIEActive = a3;
}

- (BOOL)firstEntryOnInit
{
  return self->_firstEntryOnInit;
}

- (void)setFirstEntryOnInit:(BOOL)a3
{
  self->_firstEntryOnInit = a3;
}

- (BOOL)wasDisplayOn
{
  return self->_wasDisplayOn;
}

- (void)setWasDisplayOn:(BOOL)a3
{
  self->_wasDisplayOn = a3;
}

- (BOOL)isDisplayOnNow
{
  return self->_isDisplayOnNow;
}

- (void)setIsDisplayOnNow:(BOOL)a3
{
  self->_isDisplayOnNow = a3;
}

- (BOOL)isDisplayHighBrightness
{
  return self->_isDisplayHighBrightness;
}

- (void)setIsDisplayHighBrightness:(BOOL)a3
{
  self->_isDisplayHighBrightness = a3;
}

- (BOOL)isFirstTimeModeling
{
  return self->_isFirstTimeModeling;
}

- (void)setIsFirstTimeModeling:(BOOL)a3
{
  self->_isFirstTimeModeling = a3;
}

- (PLEntryNotificationOperatorComposition)IOMFBScanoutNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 328, 1);
}

- (void)setIOMFBScanoutNotification:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)ApplicationNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 336, 1);
}

- (void)setApplicationNotification:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)aodstateChangedNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 344, 1);
}

- (void)setAodstateChangedNotification:(id)a3
{
}

- (PLNSNotificationOperatorComposition)thermalMonitorListener
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 352, 1);
}

- (void)setThermalMonitorListener:(id)a3
{
}

- (NSMutableArray)displayStateChanges
{
  return (NSMutableArray *)objc_getProperty(self, a2, 360, 1);
}

- (void)setDisplayStateChanges:(id)a3
{
}

- (PLDisplayIOReportStats)displayIOReportStats
{
  return (PLDisplayIOReportStats *)objc_getProperty(self, a2, 368, 1);
}

- (void)setDisplayIOReportStats:(id)a3
{
}

- (PLDisplayIOReportStats)displayIOReportAZLStats
{
  return (PLDisplayIOReportStats *)objc_getProperty(self, a2, 376, 1);
}

- (void)setDisplayIOReportAZLStats:(id)a3
{
}

- (PLDisplayIOReportStats)displayIOReportAZLSnapshots
{
  return (PLDisplayIOReportStats *)objc_getProperty(self, a2, 384, 1);
}

- (void)setDisplayIOReportAZLSnapshots:(id)a3
{
}

- (BOOL)ShouldLogAmbient
{
  return self->_ShouldLogAmbient;
}

- (void)setShouldLogAmbient:(BOOL)a3
{
  self->_ShouldLogAmbient = a3;
}

- (PLDisplayIOReportAODStats)displayIOReportAODStats
{
  return (PLDisplayIOReportAODStats *)objc_getProperty(self, a2, 392, 1);
}

- (void)setDisplayIOReportAODStats:(id)a3
{
}

- (int)lastScreenState
{
  return self->_lastScreenState;
}

- (void)setLastScreenState:(int)a3
{
  self->_lastScreenState = a3;
}

- (int64_t)AZLSnapshotsEntries
{
  return self->_AZLSnapshotsEntries;
}

- (void)setAZLSnapshotsEntries:(int64_t)a3
{
  self->_AZLSnapshotsEntries = a3;
}

- (double)displayLux
{
  return self->_displayLux;
}

- (void)setDisplayLux:(double)a3
{
  self->_displayLux = a3;
}

- (double)displaymNits
{
  return self->_displaymNits;
}

- (void)setDisplaymNits:(double)a3
{
  self->_double displaymNits = a3;
}

- (float)realmNits
{
  return self->_realmNits;
}

- (void)setRealmNits:(float)a3
{
  self->_double realmNits = a3;
}

- (float)autobrightnessmNits
{
  return self->_autobrightnessmNits;
}

- (void)setAutobrightnessmNits:(float)a3
{
  self->_double autobrightnessmNits = a3;
}

- (PLEntryNotificationOperatorComposition)batteryLevelChanged
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 424, 1);
}

- (void)setBatteryLevelChanged:(id)a3
{
}

- (NSString)lastForegroundAppAPL
{
  return (NSString *)objc_getProperty(self, a2, 432, 1);
}

- (void)setLastForegroundAppAPL:(id)a3
{
}

- (NSMutableArray)afkEndpoints
{
  return (NSMutableArray *)objc_getProperty(self, a2, 440, 1);
}

- (void)setAfkEndpoints:(id)a3
{
}

- (double)lastBuiltinDisplayLux
{
  return self->_lastBuiltinDisplayLux;
}

- (void)setLastBuiltinDisplayLux:(double)a3
{
  self->_lastBuiltinDisplayLux = a3;
}

- (double)lastBuiltinDisplayBrightness
{
  return self->_lastBuiltinDisplayBrightness;
}

- (void)setLastBuiltinDisplayBrightness:(double)a3
{
  self->_lastBuiltinDisplayBrightness = a3;
}

- (double)lastBuiltinDisplaySliderValue
{
  return self->_lastBuiltinDisplaySliderValue;
}

- (void)setLastBuiltinDisplaySliderValue:(double)a3
{
  self->_lastBuiltinDisplaySliderValue = a3;
}

- (double)lastBuiltinDisplayTime
{
  return self->_lastBuiltinDisplayTime;
}

- (void)setLastBuiltinDisplayTime:(double)a3
{
  self->_lastBuiltinDisplayTime = a3;
}

- (KeyboardBrightnessClient)kbClient
{
  return (KeyboardBrightnessClient *)objc_getProperty(self, a2, 480, 1);
}

- (void)setKbClient:(id)a3
{
}

- (PLTimer)keyboardBrightnessFilterTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 488, 1);
}

- (void)setKeyboardBrightnessFilterTimer:(id)a3
{
}

- (double)pendingKeyboardBrightnessValue
{
  return self->_pendingKeyboardBrightnessValue;
}

- (void)setPendingKeyboardBrightnessValue:(double)a3
{
  self->_pendingKeyboardBrightnessValue = a3;
}

- (NSDate)pendingKeyboardBrightnessDate
{
  return (NSDate *)objc_getProperty(self, a2, 504, 1);
}

- (void)setPendingKeyboardBrightnessDate:(id)a3
{
}

- (__IOMobileFramebuffer)frameBuffer
{
  return self->_frameBuffer;
}

- (void)setFrameBuffer:(__IOMobileFramebuffer *)a3
{
  self->_frameBuffer = a3;
}

- (int64_t)lastRearLuxValue
{
  return self->_lastRearLuxValue;
}

- (void)setLastRearLuxValue:(int64_t)a3
{
  self->_lastRearLuxValue = a3;
}

- (BOOL)supportsFinalBrightnessCommit
{
  return self->_supportsFinalBrightnessCommit;
}

- (void)setSupportsFinalBrightnessCommit:(BOOL)a3
{
  self->_supportsFinalBrightnessCommit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingKeyboardBrightnessDate, 0);
  objc_storeStrong((id *)&self->_keyboardBrightnessFilterTimer, 0);
  objc_storeStrong((id *)&self->_kbClient, 0);
  objc_storeStrong((id *)&self->_afkEndpoints, 0);
  objc_storeStrong((id *)&self->_lastForegroundAppAPL, 0);
  objc_storeStrong((id *)&self->_batteryLevelChanged, 0);
  objc_storeStrong((id *)&self->_displayIOReportAODStats, 0);
  objc_storeStrong((id *)&self->_displayIOReportAZLSnapshots, 0);
  objc_storeStrong((id *)&self->_displayIOReportAZLStats, 0);
  objc_storeStrong((id *)&self->_displayIOReportStats, 0);
  objc_storeStrong((id *)&self->_displayStateChanges, 0);
  objc_storeStrong((id *)&self->_thermalMonitorListener, 0);
  objc_storeStrong((id *)&self->_aodstateChangedNotification, 0);
  objc_storeStrong((id *)&self->_ApplicationNotification, 0);
  objc_storeStrong((id *)&self->_IOMFBScanoutNotification, 0);
  objc_storeStrong((id *)&self->_uAmpsEntry, 0);
  objc_storeStrong((id *)&self->_bluelightStatusEntry, 0);
  objc_storeStrong((id *)&self->_logLastALSPowerSavedTimer, 0);
  objc_storeStrong((id *)&self->_multitouchXPCListener, 0);
  objc_storeStrong((id *)&self->_displayPowerModel, 0);
  objc_storeStrong((id *)&self->_userTouchDownTime, 0);
  objc_storeStrong((id *)&self->_pendingALSLuxEntryDate, 0);
  objc_storeStrong((id *)&self->_pendingBacklightEntryDate, 0);
  objc_storeStrong((id *)&self->_pendingBacklightEntry, 0);
  objc_storeStrong((id *)&self->_AZLSnapshotsTimer, 0);
  objc_storeStrong((id *)&self->_alsLuxFilterTimer, 0);
  objc_storeStrong((id *)&self->_uAmpsFilterTimer, 0);
  objc_storeStrong((id *)&self->_bluelightFilterTimer, 0);
  objc_storeStrong((id *)&self->_dcpTimeoffsetCalibTimer, 0);
  objc_storeStrong((id *)&self->_backlightFilterTimer, 0);
  objc_storeStrong((id *)&self->_colorAdaptationClient, 0);
  objc_storeStrong((id *)&self->_brightnessSystemClient, 0);
  objc_storeStrong((id *)&self->_iokitLCD, 0);
  objc_storeStrong((id *)&self->_iokitKeyboardBrightness, 0);
  objc_storeStrong((id *)&self->_iokitTouch, 0);
  objc_storeStrong((id *)&self->_iokitDisplay, 0);
  objc_storeStrong((id *)&self->_iokitBacklightControl, 0);
  objc_storeStrong((id *)&self->_iokitBacklightDCP, 0);
  objc_storeStrong((id *)&self->_iokitBacklight, 0);
}

- (void)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109120;
  v3[1] = [a1 supportsFinalBrightnessCommit];
  _os_log_debug_impl(&dword_1E4220000, a2, OS_LOG_TYPE_DEBUG, "Copied kCBSupportsFinalBrightnessCommit value: %d", (uint8_t *)v3, 8u);
}

void __22__PLDisplayAgent_init__block_invoke_1406_cold_1(id *a1, uint64_t a2)
{
  int v3 = (void *)MEMORY[0x1E4F92A98];
  uint64_t v4 = [*a1 backlightFilterTimer];
  id v5 = [v4 fireDate];
  int v6 = [v3 formattedStringForDate:v5];
  BOOL v7 = [MEMORY[0x1E4F92A98] formattedStringForDate:a2];
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_10(&dword_1E4220000, v8, v9, "Stop backlight entry filter timer timer.fireDate=%@ fireDate=%@", v10, v11, v12, v13, v14);
}

void __22__PLDisplayAgent_init__block_invoke_1406_cold_2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "Setting pending backlight entry and date as nil", v2, v3, v4, v5, v6);
}

void __22__PLDisplayAgent_init__block_invoke_1406_cold_3(id *a1)
{
  uint64_t v2 = [*a1 pendingBacklightEntry];
  uint64_t v3 = (void *)MEMORY[0x1E4F92A98];
  uint64_t v4 = [*a1 pendingBacklightEntryDate];
  uint64_t v5 = [v3 formattedStringForDate:v4];
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_10(&dword_1E4220000, v6, v7, "BackLight entry not nill. Writing backlight entry:%@ with date: %@", v8, v9, v10, v11, v12);
}

void __22__PLDisplayAgent_init__block_invoke_2_1427_cold_1(id *a1, NSObject *a2, double a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [*a1 currMonoTimestamp];
  uint64_t v7 = v6;
  [*a1 currAFKSystemTimestamp];
  int v9 = 134218496;
  double v10 = a3;
  __int16 v11 = 2048;
  uint64_t v12 = v7;
  __int16 v13 = 2048;
  uint64_t v14 = v8;
  _os_log_debug_impl(&dword_1E4220000, a2, OS_LOG_TYPE_DEBUG, "New AFK time offset: %f, from mono timestamp: %f, afk time: %f", (uint8_t *)&v9, 0x20u);
}

void __22__PLDisplayAgent_init__block_invoke_2_1427_cold_2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "Canceling AFK time calibration timer", v2, v3, v4, v5, v6);
}

void __46__PLDisplayAgent_initTaskOperatorDependancies__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "AZLSnapShot table is full", v2, v3, v4, v5, v6);
}

void __42__PLDisplayAgent_initOperatorDependancies__block_invoke_4_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Got callback for logAODChange: %@", v2, v3, v4, v5, v6);
}

- (void)handleAFKInterfaceIOServiceCallback:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "Error trying to get property IO object", v2, v3, v4, v5, v6);
}

- (void)handleAFKInterfaceIOServiceCallback:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "Error getting AFK interface", v2, v3, v4, v5, v6);
}

- (void)handleAFKInterfaceIOServiceCallback:.cold.3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "IO object property is not dictionary", v2, v3, v4, v5, v6);
}

void __54__PLDisplayAgent_handleAFKInterfaceIOServiceCallback___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1E4220000, v0, OS_LOG_TYPE_ERROR, "Error unserializing buffer: %@", v1, 0xCu);
}

void __54__PLDisplayAgent_handleAFKInterfaceIOServiceCallback___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Final data to be logged: %@", v2, v3, v4, v5, v6);
}

void __54__PLDisplayAgent_handleAFKInterfaceIOServiceCallback___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Data: %@", v2, v3, v4, v5, v6);
}

void __54__PLDisplayAgent_handleAFKInterfaceIOServiceCallback___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "Msg is not a dictionary", v2, v3, v4, v5, v6);
}

void __54__PLDisplayAgent_handleAFKInterfaceIOServiceCallback___block_invoke_cold_5()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4_0(&dword_1E4220000, v0, v1, "Input buffer is empty", v2, v3, v4, v5, v6);
}

void __54__PLDisplayAgent_handleAFKInterfaceIOServiceCallback___block_invoke_cold_6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Received msg at timestamp: %llu", v2, v3, v4, v5, v6);
}

- (void)logEventPointDisplayBacklightWithState:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "IOMFB received power state: %llu", v2, v3, v4, v5, v6);
}

- (void)initAODState:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "initial screen state received by AOD is %ld", v2, v3, v4, v5, v6);
}

- (void)logAODState:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "AOD state we log is %@", v2, v3, v4, v5, v6);
}

- (void)logAODState:(int)a1 .cold.2(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_1E4220000, a2, OS_LOG_TYPE_DEBUG, "AOD state received is %d", (uint8_t *)v2, 8u);
}

void __62__PLDisplayAgent_backlight_didCompleteUpdateToState_forEvent___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)logEventForwardDisplayWithRawData:withDate:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Event Forward display entry: %@", v2, v3, v4, v5, v6);
}

- (void)logEventForwardDisplayWithRawData:(void *)a1 withDate:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 objectForKeyedSubscript:@"lux"];
  [v3 doubleValue];
  int v6 = 134217984;
  uint64_t v7 = v4;
  OUTLINED_FUNCTION_1_2(&dword_1E4220000, a2, v5, "Value for Lux: %f", (uint8_t *)&v6);
}

- (void)logEventForwardLuxStats:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "empty payload for LuxStats", v2, v3, v4, v5, v6);
}

- (void)logEventForwardLuxStats:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "LuxStats gain changed, using last valid RearLux value %ld", v2, v3, v4, v5, v6);
}

- (void)logEventBackwardRampInfo:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "empty payload for RampInfo", v2, v3, v4, v5, v6);
}

- (void)logEventBackwardCurveUpdate:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "empty payload for CurveUpdate", v2, v3, v4, v5, v6);
}

- (void)logEventBackwardCurveUpdate:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "CurveUpdate is %@", v2, v3, v4, v5, v6);
}

- (void)logEventBackwardALSSamplesBeforeWake:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "empty payload for ALSSamplesBeforeWake", v2, v3, v4, v5, v6);
}

- (void)logEventBackwardAmbientLight:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "empty payload for AmbientLight", v2, v3, v4, v5, v6);
}

void __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1739_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "We Recieved notification for AODRampTelemetry: %@", v2, v3, v4, v5, v6);
}

void __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1740_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "We Recieved notification for AODCurveUpdate: %@", v2, v3, v4, v5, v6);
}

void __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1741_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "We Recieved notification for AODWakeFromALSThreshold: %@", v2, v3, v4, v5, v6);
}

void __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1742_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "We Recieved notification for CBAmbientLight: %@", v2, v3, v4, v5, v6);
}

void __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1743_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1744_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F92A98] formattedStringForDate:a1];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_2(&dword_1E4220000, a2, v4, "Start backlight entry filter timer fireDate=%@", v5);
}

void __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1744_cold_2(id *a1)
{
  uint64_t v2 = [*a1 pendingBacklightEntry];
  uint64_t v3 = (void *)MEMORY[0x1E4F92A98];
  uint64_t v4 = [*a1 pendingBacklightEntryDate];
  uint64_t v5 = [v3 formattedStringForDate:v4];
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_10(&dword_1E4220000, v6, v7, "Pending Backlight entry: %@, %@", v8, v9, v10, v11, v12);
}

void __63__PLDisplayAgent_handleBrightnessClientNotification_withValue___block_invoke_1786_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1E4220000, v0, v1, "Received notification for CBrLuxStats: %@", v2, v3, v4, v5, v6);
}

- (void)__FrameBufferEventCallback:(int *)a1 .cold.1(int *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_1E4220000, a2, OS_LOG_TYPE_DEBUG, "Number of data entries retrieved %d \n", (uint8_t *)v3, 8u);
}

- (void)qualifyDisplayPower:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E4220000, v0, v1, "creating high brightness qualification event", v2, v3, v4, v5, v6);
}

@end