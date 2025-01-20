@interface PLAudioAgent
+ (id)entryAggregateDefinitions;
+ (id)entryEventBackwardDefinitions;
+ (id)entryEventForwardDefinitionAudioDevice;
+ (id)entryEventForwardDefinitionHapticsPrewarmCount;
+ (id)entryEventForwardDefinitionHapticsRunningCount;
+ (id)entryEventForwardDefinitionMutedTalkerDetection;
+ (id)entryEventForwardDefinitionNowPlaying;
+ (id)entryEventForwardDefinitionOutput;
+ (id)entryEventForwardDefinitionRouting;
+ (id)entryEventForwardDefinitions;
+ (id)entryEventIntervalDefinitionCoreAudioVAD;
+ (id)entryEventIntervalDefinitionRMSLogging;
+ (id)entryEventIntervalDefinitionShazamRecording;
+ (id)entryEventIntervalDefinitions;
+ (id)entryEventNoneDefinitions;
+ (id)entryEventPointDefinitionAudioApp;
+ (id)entryEventPointDefinitionHaptics;
+ (id)entryEventPointDefinitionHapticsAssertion;
+ (id)entryEventPointDefinitionSpeakerAmp;
+ (id)entryEventPointDefinitions;
+ (void)load;
- (AudioDevice)defaultInputDevice;
- (AudioDevice)defaultOutputDevice;
- (BOOL)audioIsActive;
- (BOOL)headphonesConnected;
- (BOOL)headsetHasInput;
- (BOOL)headsetIsPlayingAudio;
- (BOOL)initDefaultAudioDevice:(BOOL)a3;
- (BOOL)muted;
- (BOOL)shouldModelAudioPowerSpeakerTemp;
- (BOOL)speakerIsPlayingAudio;
- (NSDate)lastAudioStateChangeDate;
- (NSDictionary)audioPowerModel;
- (NSMutableArray)nsOutputNotifications;
- (NSMutableArray)nsRoutingNotifications;
- (NSString)audioHardware;
- (PLAudioAgent)init;
- (PLEntry)entryRoutingOld;
- (PLEntryNotificationOperatorComposition)accessoryPowerCallback;
- (PLNSNotificationOperatorComposition)thermalMonitorListener;
- (PLXPCListenerOperatorComposition)CoreAudioVADXPCListener;
- (PLXPCListenerOperatorComposition)RMSLoggingXPCListener;
- (PLXPCListenerOperatorComposition)audioAppXPCListener;
- (PLXPCListenerOperatorComposition)hapticsAssertionXPCListener;
- (PLXPCListenerOperatorComposition)hapticsPrewarmCountListener;
- (PLXPCListenerOperatorComposition)hapticsRunningCountListener;
- (PLXPCListenerOperatorComposition)hapticsXPCListener;
- (PLXPCListenerOperatorComposition)mutedTalkerDetectionXPCListener;
- (PLXPCListenerOperatorComposition)screenMirroringXPCListener;
- (PLXPCListenerOperatorComposition)shazamRecordingXPCListener;
- (PLXPCListenerOperatorComposition)singXPCListener;
- (PLXPCListenerOperatorComposition)speakerAmpXPCListener;
- (double)audioPowerForRoute:(id)a3 forVolume:(double)a4;
- (double)convertSpeakerProtectionModeledPowerToTotalSpeakerPower:(double)a3;
- (double)currentVolume;
- (double)modelAudioPowerWithVolume:(double)a3;
- (id)BTEndpointType;
- (id)activeRoute;
- (id)buildCallBack:(id)a3 withGroup:(BOOL)a4 withHandler:(id)a5;
- (id)defaultInputDeviceHandlerBlock;
- (id)defaultOutputDeviceHandlerBlock;
- (id)nowPlayingAppBundleID:(id)a3;
- (id)outputCategory;
- (id)returnVolumeOrOutPutCategory:(int)a3;
- (id)volume;
- (int)accessoryPowerState;
- (void)closeAudioAccountingEvents;
- (void)createAirPlayAccountingEvents:(id)a3;
- (void)createAudioAccountingEvents:(id)a3;
- (void)createBluetoothAccountingEvents:(id)a3;
- (void)createCarPlayAccountingEvents:(id)a3;
- (void)handleLightningStatusCallback:(id)a3;
- (void)handleNowPlayingApplicationIsPlayingDidChange:(id)a3;
- (void)initOperatorDependancies;
- (void)log;
- (void)logEventForwardAudioDevice:(id)a3;
- (void)logEventForwardHapticsPrewarmCount:(id)a3;
- (void)logEventForwardHapticsRunningCount:(id)a3;
- (void)logEventForwardMutedTalkerDetection:(id)a3;
- (void)logEventForwardOutput;
- (void)logEventForwardRouting;
- (void)logEventForwardSing:(id)a3;
- (void)logEventIntervalCoreAudioVAD:(id)a3;
- (void)logEventIntervalRMSLogging:(id)a3;
- (void)logEventIntervalShazamRecording:(id)a3;
- (void)logEventPointAudioApp:(id)a3;
- (void)logEventPointHaptics:(id)a3;
- (void)logEventPointHapticsAssertion:(id)a3;
- (void)logEventPointSpeakerAmp:(id)a3;
- (void)modelAudioPower;
- (void)modelAudioPowerCodec:(id)a3;
- (void)modelAudioPowerSpeaker:(id)a3;
- (void)setAccessoryPowerCallback:(id)a3;
- (void)setAccessoryPowerState:(int)a3;
- (void)setAudioAppXPCListener:(id)a3;
- (void)setAudioIsActive:(BOOL)a3;
- (void)setCoreAudioVADXPCListener:(id)a3;
- (void)setCurrentVolume:(double)a3;
- (void)setDefaultInputDevice:(id)a3;
- (void)setDefaultInputDeviceHandlerBlock:(id)a3;
- (void)setDefaultOutputDevice:(id)a3;
- (void)setDefaultOutputDeviceHandlerBlock:(id)a3;
- (void)setEntryRoutingOld:(id)a3;
- (void)setHapticsAssertionXPCListener:(id)a3;
- (void)setHapticsPrewarmCountListener:(id)a3;
- (void)setHapticsRunningCountListener:(id)a3;
- (void)setHapticsXPCListener:(id)a3;
- (void)setHeadsetIsPlayingAudio:(BOOL)a3;
- (void)setLastAudioStateChangeDate:(id)a3;
- (void)setMutedTalkerDetectionXPCListener:(id)a3;
- (void)setRMSLoggingXPCListener:(id)a3;
- (void)setScreenMirroringXPCListener:(id)a3;
- (void)setShazamRecordingXPCListener:(id)a3;
- (void)setSingXPCListener:(id)a3;
- (void)setSpeakerAmpXPCListener:(id)a3;
- (void)setSpeakerIsPlayingAudio:(BOOL)a3;
- (void)setThermalMonitorListener:(id)a3;
- (void)setupAVSystemController;
@end

@implementation PLAudioAgent

- (void)modelAudioPowerCodec:(id)a3
{
  id v7 = a3;
  if (([MEMORY[0x1E4F92A38] isHomePod] & 1) == 0)
  {
    double v4 = 0.0;
    if ([(PLAudioAgent *)self speakerIsPlayingAudio])
    {
      unsigned int v5 = [MEMORY[0x1E4F92A38] kPLAudioClassOfDevice] - 1005001;
      if (v5 > 0x2C) {
        double v4 = 35.0;
      }
      else {
        double v4 = dbl_1D2B03008[v5];
      }
    }
    v6 = [MEMORY[0x1E4F92900] sharedInstance];
    [v6 createPowerEventForwardWithRootNodeID:55 withPower:v7 withStartDate:v4];
  }
}

- (id)activeRoute
{
  unsigned int v2 = 0;
  v3 = (void *)MEMORY[0x1E4F74A78];
  do
  {
    double v4 = [(id)avSystemController attributeForKey:*v3];
    unsigned int v5 = v4;
    if (v2 > 4) {
      break;
    }
    ++v2;
  }
  while (!v4);
  if (v4) {
    v6 = v4;
  }
  else {
    v6 = @"INVALID";
  }

  return v6;
}

- (void)logEventForwardRouting
{
  id v12 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"Routing"];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v12];
  double v4 = objc_msgSend(NSNumber, "numberWithBool:", -[PLAudioAgent audioIsActive](self, "audioIsActive"));
  [v3 setObject:v4 forKeyedSubscript:@"Active"];

  unsigned int v5 = [(PLAudioAgent *)self activeRoute];
  [v3 setObject:v5 forKeyedSubscript:@"ActiveRoute"];

  v6 = [(PLAudioAgent *)self outputCategory];
  [v3 setObject:v6 forKeyedSubscript:@"OutputCategory"];

  id v7 = objc_msgSend(NSNumber, "numberWithBool:", -[PLAudioAgent headphonesConnected](self, "headphonesConnected"));
  [v3 setObject:v7 forKeyedSubscript:@"HeadphonesConnected"];

  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[PLAudioAgent headsetHasInput](self, "headsetHasInput"));
  [v3 setObject:v8 forKeyedSubscript:@"HeadsetHasInput"];

  v9 = [(PLAudioAgent *)self BTEndpointType];
  [v3 setObject:v9 forKeyedSubscript:@"BTEndpointType"];

  v10 = [(PLAudioAgent *)self entryRoutingOld];
  uint64_t v11 = [v3 compare:v10];

  if (v11)
  {
    [(PLOperator *)self logEntry:v3];
    [(PLAudioAgent *)self modelAudioPower];
  }
  [(PLAudioAgent *)self setEntryRoutingOld:v3];
}

- (void)logEventForwardOutput
{
  id v6 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"Output"];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v6];
  double v4 = objc_msgSend(NSNumber, "numberWithBool:", -[PLAudioAgent muted](self, "muted"));
  [v3 setObject:v4 forKeyedSubscript:@"Muted"];

  unsigned int v5 = [(PLAudioAgent *)self volume];
  [v3 setObject:v5 forKeyedSubscript:@"Volume"];

  [(PLOperator *)self logEntry:v3];
  [(PLAudioAgent *)self modelAudioPower];
}

- (id)returnVolumeOrOutPutCategory:(int)a3
{
  id v4 = 0;
  unsigned int v5 = 0;
  float v14 = -1.0;
  do
  {
    id v6 = v4;
    id v7 = [MEMORY[0x1E4F74F68] sharedInstance];
    id v13 = v4;
    int v8 = [v7 getActiveCategoryVolume:&v14 andName:&v13];
    id v4 = v13;

    if (v8)
    {
      if (!a3)
      {
        id v9 = [NSNumber numberWithDouble:v14 * 100.0];
        goto LABEL_8;
      }
      if (a3 == 1)
      {
        id v9 = v4;
LABEL_8:
        v10 = v9;
        goto LABEL_9;
      }
    }
    v10 = 0;
LABEL_9:
    if (v5 > 4) {
      break;
    }
    ++v5;
  }
  while (!v10);
  if (v10)
  {
    uint64_t v11 = v10;
  }
  else if (a3)
  {
    uint64_t v11 = @"INVALID";
  }
  else
  {
    uint64_t v11 = (__CFString *)&unk_1F29F0C30;
  }

  return v11;
}

- (void)modelAudioPower
{
  if ([MEMORY[0x1E4F92A38] isHomePod]) {
    return;
  }
  uint64_t v3 = *MEMORY[0x1E4F92D30];
  id v47 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"Output"];
  id v4 = +[PLOperator entryKeyForType:v3 andName:@"Routing"];
  unsigned int v5 = [(PLOperator *)self storage];
  uint64_t v6 = [v5 lastEntryForKey:v47];

  id v7 = [(PLOperator *)self storage];
  uint64_t v8 = [v7 lastEntryForKey:v4];

  BOOL v9 = [(PLAudioAgent *)self speakerIsPlayingAudio];
  BOOL v10 = [(PLAudioAgent *)self headsetIsPlayingAudio];
  if (v6 | v8)
  {
    BOOL v11 = v10;
    if (v6)
    {
      if (v8)
      {
        id v12 = [(id)v8 entryDate];
        id v13 = [(id)v6 entryDate];
        float v14 = [v12 laterDate:v13];

        goto LABEL_10;
      }
      v15 = (void *)v6;
    }
    else
    {
      v15 = (void *)v8;
    }
    float v14 = [v15 entryDate];
LABEL_10:
    v16 = [(id)v8 objectForKeyedSubscript:@"Active"];
    if ([v16 BOOLValue])
    {
      v17 = [(id)v6 objectForKeyedSubscript:@"Muted"];
      char v18 = [v17 BOOLValue];

      if ((v18 & 1) == 0)
      {
        v19 = [(id)v8 objectForKeyedSubscript:@"ActiveRoute"];
        v20 = [v19 description];

        uint64_t v21 = [v20 isEqual:@"Speaker"];
        if (v21) {
          uint64_t v22 = 0;
        }
        else {
          uint64_t v22 = [v20 containsString:@"Head"];
        }

        goto LABEL_18;
      }
    }
    else
    {
    }
    uint64_t v21 = v9 & ~[(PLAudioAgent *)self speakerIsPlayingAudio];
    uint64_t v22 = v11 & ~[(PLAudioAgent *)self headsetIsPlayingAudio];
LABEL_18:
    v23 = [(id)v6 objectForKeyedSubscript:@"Volume"];
    [v23 doubleValue];
    double v25 = v24;

    if (v21 == [(PLAudioAgent *)self speakerIsPlayingAudio])
    {
      [(PLAudioAgent *)self currentVolume];
      if (v32 != v25
        && [(PLAudioAgent *)self speakerIsPlayingAudio]
        && [(PLAudioAgent *)self shouldModelAudioPowerSpeakerTemp])
      {
        [(PLAudioAgent *)self setCurrentVolume:v25];
        v33 = [(id)v8 objectForKeyedSubscript:@"ActiveRoute"];
        v34 = [v33 description];
        v35 = [(id)v6 objectForKeyedSubscript:@"Volume"];
        [v35 doubleValue];
        -[PLAudioAgent audioPowerForRoute:forVolume:](self, "audioPowerForRoute:forVolume:", v34);
        double v37 = v36;

        v38 = [MEMORY[0x1E4F92900] sharedInstance];
        [v38 createPowerEventForwardWithRootNodeID:15 withPower:v14 withStartDate:v37];
      }
    }
    else
    {
      objc_storeStrong((id *)&self->_lastAudioStateChangeDate, v14);
      [(PLAudioAgent *)self setSpeakerIsPlayingAudio:v21];
      if ([(PLAudioAgent *)self speakerIsPlayingAudio])
      {
        if ([(PLAudioAgent *)self shouldModelAudioPowerSpeakerTemp])
        {
          v26 = [(id)v8 objectForKeyedSubscript:@"ActiveRoute"];
          v27 = [v26 description];
          v28 = [(id)v6 objectForKeyedSubscript:@"Volume"];
          [v28 doubleValue];
          -[PLAudioAgent audioPowerForRoute:forVolume:](self, "audioPowerForRoute:forVolume:", v27);
          double v30 = v29;

          v31 = [MEMORY[0x1E4F92900] sharedInstance];
          [v31 createPowerEventForwardWithRootNodeID:15 withPower:v14 withStartDate:v30];
        }
      }
      else
      {
        [(PLAudioAgent *)self modelAudioPowerSpeaker:0];
      }
      [(PLAudioAgent *)self modelAudioPowerCodec:v14];
    }
    if (v22 != [(PLAudioAgent *)self headsetIsPlayingAudio])
    {
      objc_storeStrong((id *)&self->_lastAudioStateChangeDate, v14);
      [(PLAudioAgent *)self setHeadsetIsPlayingAudio:v22];
      if (v22)
      {
        v39 = [(id)v8 objectForKeyedSubscript:@"ActiveRoute"];
        v40 = [v39 description];
        v41 = [(id)v6 objectForKeyedSubscript:@"Volume"];
        [v41 doubleValue];
        -[PLAudioAgent audioPowerForRoute:forVolume:](self, "audioPowerForRoute:forVolume:", v40);
        double v43 = v42;

        v44 = [MEMORY[0x1E4F92900] sharedInstance];
        v45 = v44;
        double v46 = v43;
      }
      else
      {
        v44 = [MEMORY[0x1E4F92900] sharedInstance];
        v45 = v44;
        double v46 = 0.0;
      }
      [v44 createPowerEventForwardWithRootNodeID:14 withPower:v14 withStartDate:v46];
    }
    goto LABEL_33;
  }
  float v14 = 0;
LABEL_33:
}

- (BOOL)speakerIsPlayingAudio
{
  return self->_speakerIsPlayingAudio;
}

- (BOOL)headsetIsPlayingAudio
{
  return self->_headsetIsPlayingAudio;
}

- (id)volume
{
  return [(PLAudioAgent *)self returnVolumeOrOutPutCategory:0];
}

- (BOOL)muted
{
  unsigned int v2 = [(id)avSystemController attributeForKey:*MEMORY[0x1E4F74BD0]];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (double)currentVolume
{
  return self->_currentVolume;
}

- (BOOL)shouldModelAudioPowerSpeakerTemp
{
  if (qword_1EBD58AA8 != -1) {
    dispatch_once(&qword_1EBD58AA8, &__block_literal_global_416);
  }
  return _MergedGlobals_1_37;
}

- (BOOL)headsetHasInput
{
  unsigned int v2 = [(id)avSystemController attributeForKey:*MEMORY[0x1E4F74BE0]];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)headphonesConnected
{
  unsigned int v2 = [(id)avSystemController attributeForKey:*MEMORY[0x1E4F74BF0]];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (PLEntry)entryRoutingOld
{
  return (PLEntry *)objc_getProperty(self, a2, 184, 1);
}

- (id)BTEndpointType
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  unsigned int v2 = [(id)avSystemController attributeForKey:*MEMORY[0x1E4F74C68]];
  char v3 = [v2 objectForKeyedSubscript:*MEMORY[0x1E4F74D00]];
  id v4 = PLLogAudio();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 138412290;
    uint64_t v8 = v3;
    _os_log_debug_impl(&dword_1D2690000, v4, OS_LOG_TYPE_DEBUG, "BTDetails_EndpointType: %@", (uint8_t *)&v7, 0xCu);
  }

  if (v3) {
    unsigned int v5 = v3;
  }
  else {
    unsigned int v5 = &stru_1F294E108;
  }

  return v5;
}

void __39__PLAudioAgent_setupAVSystemController__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = PLLogAudio();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412546;
    id v9 = v6;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "Trigger from output %@: %@", (uint8_t *)&v8, 0x16u);
  }

  [*(id *)(a1 + 32) logEventForwardOutput];
}

- (void)setEntryRoutingOld:(id)a3
{
}

- (void)setAudioIsActive:(BOOL)a3
{
  self->_audioIsActive = a3;
}

- (id)outputCategory
{
  return [(PLAudioAgent *)self returnVolumeOrOutPutCategory:1];
}

- (BOOL)audioIsActive
{
  return self->_audioIsActive;
}

- (void)setSpeakerIsPlayingAudio:(BOOL)a3
{
  self->_speakerIsPlayingAudio = a3;
}

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLAudioAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventPointDefinitions
{
  v10[4] = *MEMORY[0x1E4F143B8];
  v9[0] = @"AudioApp";
  char v3 = [a1 entryEventPointDefinitionAudioApp];
  v10[0] = v3;
  v9[1] = @"SpeakerAmp";
  id v4 = [a1 entryEventPointDefinitionSpeakerAmp];
  v10[1] = v4;
  v9[2] = @"Haptics";
  id v5 = [a1 entryEventPointDefinitionHaptics];
  v10[2] = v5;
  v9[3] = @"HapticsAssertion";
  id v6 = [a1 entryEventPointDefinitionHapticsAssertion];
  v10[3] = v6;
  int v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];

  return v7;
}

+ (id)entryEventPointDefinitionAudioApp
{
  v27[2] = *MEMORY[0x1E4F143B8];
  v26[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v24[0] = *MEMORY[0x1E4F92CD0];
  v24[1] = v2;
  v25[0] = &unk_1F29F0BD0;
  v25[1] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = *MEMORY[0x1E4F92C08];
  v24[2] = *MEMORY[0x1E4F92CC0];
  v24[3] = v3;
  v25[2] = MEMORY[0x1E4F1CC38];
  v25[3] = MEMORY[0x1E4F1CC38];
  uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:4];
  v27[0] = v21;
  v26[1] = *MEMORY[0x1E4F92CA8];
  v22[0] = @"ApplicationName";
  v20 = [MEMORY[0x1E4F929D8] sharedInstance];
  v19 = objc_msgSend(v20, "commonTypeDict_StringFormat_withAppName");
  v23[0] = v19;
  v22[1] = @"AssertionID";
  char v18 = [MEMORY[0x1E4F929D8] sharedInstance];
  v17 = objc_msgSend(v18, "commonTypeDict_IntegerFormat");
  v23[1] = v17;
  v22[2] = @"AssertionName";
  v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  v15 = objc_msgSend(v16, "commonTypeDict_StringFormat");
  v23[2] = v15;
  v22[3] = @"AudioRoute";
  id v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v5 = objc_msgSend(v4, "commonTypeDict_StringFormat");
  v23[3] = v5;
  v22[4] = @"Operation";
  id v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  int v7 = objc_msgSend(v6, "commonTypeDict_StringFormat");
  v23[4] = v7;
  v22[5] = @"PID";
  int v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v23[5] = v9;
  v22[6] = @"MirroringState";
  __int16 v10 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v11 = objc_msgSend(v10, "commonTypeDict_BoolFormat");
  v23[6] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:7];
  v27[1] = v12;
  id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];

  return v13;
}

+ (id)entryEventPointDefinitionSpeakerAmp
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v13[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92CB8];
  v11[0] = *MEMORY[0x1E4F92CD0];
  v11[1] = v2;
  v12[0] = &unk_1F29F0BE0;
  v12[1] = MEMORY[0x1E4F1CC28];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E4F92CA8];
  id v9 = @"Avg Watts Modelled";
  id v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v5 = objc_msgSend(v4, "commonTypeDict_RealFormat");
  __int16 v10 = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v14[1] = v6;
  int v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

  return v7;
}

+ (id)entryEventPointDefinitionHaptics
{
  v20[2] = *MEMORY[0x1E4F143B8];
  v19[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C08];
  v17[0] = *MEMORY[0x1E4F92CD0];
  v17[1] = v2;
  v18[0] = &unk_1F29F0BF0;
  v18[1] = MEMORY[0x1E4F1CC38];
  v17[2] = *MEMORY[0x1E4F92C58];
  v16[0] = @"ApplicationName";
  v16[1] = @"EngineOnDuration";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
  v18[2] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];
  v20[0] = v4;
  v19[1] = *MEMORY[0x1E4F92CA8];
  id v5 = objc_msgSend(MEMORY[0x1E4F929D8], "sharedInstance", @"ApplicationName");
  id v6 = objc_msgSend(v5, "commonTypeDict_StringFormat_withBundleID");
  v15[0] = v6;
  v14[1] = @"EngineOnDuration";
  int v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  int v8 = objc_msgSend(v7, "commonTypeDict_RealFormat");
  v15[1] = v8;
  v14[2] = @"TimestampEnd";
  id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  __int16 v10 = objc_msgSend(v9, "commonTypeDict_DateFormat");
  v15[2] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];
  v20[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];

  return v12;
}

+ (id)entryEventPointDefinitionHapticsAssertion
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v14[0] = *MEMORY[0x1E4F92C50];
  uint64_t v12 = *MEMORY[0x1E4F92CD0];
  id v13 = &unk_1F29F0BE0;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  v15[0] = v2;
  v14[1] = *MEMORY[0x1E4F92CA8];
  v10[0] = @"active_time";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v10[1] = @"active_clients";
  v11[0] = v4;
  id v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v6 = objc_msgSend(v5, "commonTypeDict_StringFormat");
  v11[1] = v6;
  int v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  v15[1] = v7;
  int v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

  return v8;
}

+ (id)entryEventForwardDefinitions
{
  v12[7] = *MEMORY[0x1E4F143B8];
  v11[0] = @"Output";
  uint64_t v2 = +[PLAudioAgent entryEventForwardDefinitionOutput];
  v12[0] = v2;
  v11[1] = @"Routing";
  uint64_t v3 = +[PLAudioAgent entryEventForwardDefinitionRouting];
  v12[1] = v3;
  void v11[2] = @"NowPlaying";
  id v4 = +[PLAudioAgent entryEventForwardDefinitionNowPlaying];
  void v12[2] = v4;
  v11[3] = @"AudioDevice";
  id v5 = +[PLAudioAgent entryEventForwardDefinitionAudioDevice];
  v12[3] = v5;
  v11[4] = @"MutedTalkerDetection";
  id v6 = +[PLAudioAgent entryEventForwardDefinitionMutedTalkerDetection];
  v12[4] = v6;
  v11[5] = @"HapticsRunningCount";
  int v7 = +[PLAudioAgent entryEventForwardDefinitionHapticsRunningCount];
  v12[5] = v7;
  v11[6] = @"HapticsPrewarmCount";
  int v8 = +[PLAudioAgent entryEventForwardDefinitionHapticsPrewarmCount];
  v12[6] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:7];

  return v9;
}

+ (id)entryEventForwardDefinitionOutput
{
  v21[2] = *MEMORY[0x1E4F143B8];
  v20[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C70];
  v18[0] = *MEMORY[0x1E4F92CD0];
  v18[1] = v2;
  v19[0] = &unk_1F29F0BE0;
  v19[1] = MEMORY[0x1E4F1CC38];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  v21[0] = v3;
  v20[1] = *MEMORY[0x1E4F92CA8];
  v16[0] = @"Muted";
  id v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v5 = objc_msgSend(v4, "commonTypeDict_BoolFormat");
  v16[1] = @"Volume";
  v17[0] = v5;
  uint64_t v6 = *MEMORY[0x1E4F92D18];
  v14[0] = *MEMORY[0x1E4F92D10];
  v14[1] = v6;
  v15[0] = &unk_1F29E6418;
  v15[1] = @"%";
  void v14[2] = *MEMORY[0x1E4F92C88];
  uint64_t v12 = *MEMORY[0x1E4F92C78];
  id v13 = &unk_1F29F0C00;
  int v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  v15[2] = v7;
  int v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];
  v17[1] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  v21[1] = v9;
  __int16 v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];

  return v10;
}

+ (id)entryEventForwardDefinitionRouting
{
  void v26[2] = *MEMORY[0x1E4F143B8];
  v25[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C70];
  v23[0] = *MEMORY[0x1E4F92CD0];
  v23[1] = v2;
  v24[0] = &unk_1F29F0BF0;
  v24[1] = MEMORY[0x1E4F1CC38];
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
  v26[0] = v20;
  v25[1] = *MEMORY[0x1E4F92CA8];
  v21[0] = @"Active";
  v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  char v18 = objc_msgSend(v19, "commonTypeDict_BoolFormat");
  v22[0] = v18;
  v21[1] = @"OutputCategory";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  v16 = objc_msgSend(v17, "commonTypeDict_StringFormat");
  v22[1] = v16;
  v21[2] = @"ActiveRoute";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  float v14 = objc_msgSend(v15, "commonTypeDict_StringFormat");
  v22[2] = v14;
  void v21[3] = @"HeadphonesConnected";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v4 = objc_msgSend(v3, "commonTypeDict_BoolFormat");
  v22[3] = v4;
  v21[4] = @"HeadsetHasInput";
  id v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v6 = objc_msgSend(v5, "commonTypeDict_BoolFormat");
  v22[4] = v6;
  v21[5] = @"AudioSessionID";
  int v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  int v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v22[5] = v8;
  v21[6] = @"BTEndpointType";
  id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  __int16 v10 = objc_msgSend(v9, "commonTypeDict_StringFormat");
  v22[6] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:7];
  v26[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];

  return v12;
}

+ (id)entryEventForwardDefinitionNowPlaying
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  v15[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C08];
  v13[0] = *MEMORY[0x1E4F92CD0];
  v13[1] = v2;
  v14[0] = &unk_1F29F0BE0;
  v14[1] = MEMORY[0x1E4F1CC38];
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E4F92CA8];
  v11[0] = @"BundleID";
  id v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v5 = objc_msgSend(v4, "commonTypeDict_StringFormat_withBundleID");
  v11[1] = @"State";
  v12[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  int v7 = objc_msgSend(v6, "commonTypeDict_IntegerFormat");
  v12[1] = v7;
  int v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v16[1] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

  return v9;
}

+ (id)entryEventForwardDefinitionAudioDevice
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventForwardDefinitionMutedTalkerDetection
{
  void v13[2] = *MEMORY[0x1E4F143B8];
  v12[0] = *MEMORY[0x1E4F92C50];
  uint64_t v10 = *MEMORY[0x1E4F92CD0];
  id v11 = &unk_1F29F0BE0;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v13[0] = v2;
  v12[1] = *MEMORY[0x1E4F92CA8];
  int v8 = @"Muted";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v4 = objc_msgSend(v3, "commonTypeDict_BoolFormat");
  id v9 = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v13[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  return v6;
}

+ (id)entryEventForwardDefinitionHapticsRunningCount
{
  void v17[2] = *MEMORY[0x1E4F143B8];
  v16[0] = *MEMORY[0x1E4F92C50];
  uint64_t v14 = *MEMORY[0x1E4F92CD0];
  v15 = &unk_1F29F0C10;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  v17[0] = v2;
  v16[1] = *MEMORY[0x1E4F92CA8];
  v12[0] = @"RunningCount";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v13[0] = v4;
  v12[1] = @"pid";
  id v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v13[1] = v6;
  void v12[2] = @"subsystem";
  int v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  int v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  void v13[2] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
  v17[1] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];

  return v10;
}

+ (id)entryEventForwardDefinitionHapticsPrewarmCount
{
  void v20[2] = *MEMORY[0x1E4F143B8];
  v19[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C58];
  v17[0] = *MEMORY[0x1E4F92CD0];
  v17[1] = v2;
  v18[0] = &unk_1F29F0BE0;
  v18[1] = &unk_1F29EE348;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  v20[0] = v14;
  v19[1] = *MEMORY[0x1E4F92CA8];
  v15[0] = @"PrewarmCount";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v16[0] = v4;
  v15[1] = @"pid";
  id v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v6 = objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v16[1] = v6;
  void v15[2] = @"subsystem";
  int v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  int v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  void v16[2] = v8;
  void v15[3] = @"process";
  id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v10 = objc_msgSend(v9, "commonTypeDict_StringFormat_withProcessName");
  void v16[3] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];
  v20[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];

  return v12;
}

+ (id)entryEventBackwardDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryEventIntervalDefinitions
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v8[0] = @"ShazamRecording";
  uint64_t v3 = +[PLAudioAgent entryEventIntervalDefinitionShazamRecording];
  v9[0] = v3;
  v8[1] = @"RMSLogging";
  id v4 = [a1 entryEventIntervalDefinitionRMSLogging];
  v9[1] = v4;
  v8[2] = @"CoreAudioVAD";
  id v5 = [a1 entryEventIntervalDefinitionCoreAudioVAD];
  v9[2] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

+ (id)entryEventIntervalDefinitionShazamRecording
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  v15[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C08];
  v13[0] = *MEMORY[0x1E4F92CD0];
  v13[1] = v2;
  v14[0] = &unk_1F29F0BE0;
  v14[1] = MEMORY[0x1E4F1CC38];
  void v13[2] = *MEMORY[0x1E4F92C58];
  void v14[2] = &unk_1F29EE360;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E4F92CA8];
  v11[0] = @"timestampEnd";
  id v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v5 = objc_msgSend(v4, "commonTypeDict_DateFormat");
  v11[1] = @"BundleID";
  v12[0] = v5;
  uint64_t v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  int v7 = objc_msgSend(v6, "commonTypeDict_StringFormat_withBundleID");
  v12[1] = v7;
  int v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  v16[1] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];

  return v9;
}

+ (id)entryEventIntervalDefinitionRMSLogging
{
  v32[2] = *MEMORY[0x1E4F143B8];
  v31[0] = *MEMORY[0x1E4F92C50];
  uint64_t v2 = *MEMORY[0x1E4F92C08];
  v29[0] = *MEMORY[0x1E4F92CD0];
  v29[1] = v2;
  v30[0] = &unk_1F29F0C20;
  v30[1] = MEMORY[0x1E4F1CC38];
  v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];
  v32[0] = v26;
  v31[1] = *MEMORY[0x1E4F92CA8];
  v27[0] = @"timestampEnd";
  double v25 = [MEMORY[0x1E4F929D8] sharedInstance];
  double v24 = objc_msgSend(v25, "commonTypeDict_DateFormat");
  v28[0] = v24;
  v27[1] = @"ApplicationName";
  v23 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v22 = objc_msgSend(v23, "commonTypeDict_StringFormat_withBundleID");
  v28[1] = v22;
  v27[2] = @"maxRms";
  uint64_t v21 = [MEMORY[0x1E4F929D8] sharedInstance];
  v20 = objc_msgSend(v21, "commonTypeDict_RealFormat");
  v28[2] = v20;
  v27[3] = @"minRms";
  v19 = [MEMORY[0x1E4F929D8] sharedInstance];
  char v18 = objc_msgSend(v19, "commonTypeDict_RealFormat");
  v28[3] = v18;
  void v27[4] = @"silence_duration";
  v17 = [MEMORY[0x1E4F929D8] sharedInstance];
  v16 = objc_msgSend(v17, "commonTypeDict_IntegerFormat");
  v28[4] = v16;
  v27[5] = @"quiet_duration";
  v15 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v14 = objc_msgSend(v15, "commonTypeDict_IntegerFormat");
  v28[5] = v14;
  v27[6] = @"audible_duration";
  uint64_t v3 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v4 = objc_msgSend(v3, "commonTypeDict_IntegerFormat");
  v28[6] = v4;
  v27[7] = @"node";
  id v5 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v6 = objc_msgSend(v5, "commonTypeDict_StringFormat");
  v28[7] = v6;
  v27[8] = @"pid";
  int v7 = [MEMORY[0x1E4F929D8] sharedInstance];
  int v8 = objc_msgSend(v7, "commonTypeDict_IntegerFormat");
  v28[8] = v8;
  v27[9] = @"reporterID";
  id v9 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v10 = objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v28[9] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:10];
  v32[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];

  return v12;
}

+ (id)entryEventIntervalDefinitionCoreAudioVAD
{
  v27[2] = *MEMORY[0x1E4F143B8];
  v26[0] = *MEMORY[0x1E4F92C50];
  uint64_t v24 = *MEMORY[0x1E4F92CD0];
  double v25 = &unk_1F29F0BF0;
  uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  v27[0] = v21;
  v26[1] = *MEMORY[0x1E4F92CA8];
  v22[0] = @"Client";
  v20 = [MEMORY[0x1E4F929D8] sharedInstance];
  v19 = objc_msgSend(v20, "commonTypeDict_StringFormat");
  v23[0] = v19;
  v22[1] = @"ClientID";
  char v18 = [MEMORY[0x1E4F929D8] sharedInstance];
  v17 = objc_msgSend(v18, "commonTypeDict_StringFormat");
  v23[1] = v17;
  v22[2] = @"StartTime";
  v16 = [MEMORY[0x1E4F929D8] sharedInstance];
  v15 = objc_msgSend(v16, "commonTypeDict_DateFormat");
  void v23[2] = v15;
  v22[3] = @"EndTime";
  uint64_t v14 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v13 = objc_msgSend(v14, "commonTypeDict_DateFormat");
  v23[3] = v13;
  v22[4] = @"State";
  uint64_t v2 = [MEMORY[0x1E4F929D8] sharedInstance];
  uint64_t v3 = objc_msgSend(v2, "commonTypeDict_IntegerFormat");
  v23[4] = v3;
  v22[5] = @"Device";
  id v4 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v5 = objc_msgSend(v4, "commonTypeDict_StringFormat");
  v23[5] = v5;
  v22[6] = @"SID";
  uint64_t v6 = [MEMORY[0x1E4F929D8] sharedInstance];
  int v7 = objc_msgSend(v6, "commonTypeDict_StringFormat");
  v23[6] = v7;
  void v22[7] = @"LifespanInSeconds";
  int v8 = [MEMORY[0x1E4F929D8] sharedInstance];
  id v9 = objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  void v23[7] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:8];
  v27[1] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];

  return v11;
}

+ (id)entryEventNoneDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (id)entryAggregateDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (PLAudioAgent)init
{
  v3.receiver = self;
  v3.super_class = (Class)PLAudioAgent;
  result = [(PLAgent *)&v3 init];
  if (result)
  {
    result->_headsetIsPlayingAudio = 0;
    result->_speakerIsPlayingAudio = 0;
    result->_currentVolume = -1.0;
  }
  return result;
}

- (id)nowPlayingAppBundleID:(id)a3
{
  return (id)[(id)avSystemController attributeForKey:*MEMORY[0x1E4F74C10]];
}

- (void)handleNowPlayingApplicationIsPlayingDidChange:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D30];
  id v5 = a3;
  id v18 = +[PLOperator entryKeyForType:v4 andName:@"NowPlaying"];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v18];
  int v7 = [(PLAudioAgent *)self nowPlayingAppBundleID:v5];

  [v6 setObject:v7 forKeyedSubscript:@"BundleID"];
  int v8 = objc_msgSend(NSNumber, "numberWithBool:", -[PLAudioAgent audioIsActive](self, "audioIsActive"));
  [v6 setObject:v8 forKeyedSubscript:@"State"];

  id v9 = [(PLOperator *)self storage];
  uint64_t v10 = [v9 lastEntryForKey:v18];

  if (!v10) {
    goto LABEL_8;
  }
  id v11 = [v10 objectForKeyedSubscript:@"State"];
  uint64_t v12 = [v11 integerValue];
  id v13 = [v6 objectForKeyedSubscript:@"State"];
  if (v12 != [v13 integerValue]) {
    goto LABEL_7;
  }
  uint64_t v14 = [v10 objectForKeyedSubscript:@"BundleID"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_7:
    goto LABEL_8;
  }
  v15 = [v10 objectForKeyedSubscript:@"BundleID"];
  v16 = [v6 objectForKeyedSubscript:@"BundleID"];
  char v17 = [v15 isEqualToString:v16];

  if ((v17 & 1) == 0) {
LABEL_8:
  }
    [(PLOperator *)self logEntry:v6];
}

- (void)setupAVSystemController
{
  v76[4] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v4 = (void *)MEMORY[0x1E4F74E30];
  [v3 removeObserver:self name:*MEMORY[0x1E4F74E30] object:0];

  uint64_t v5 = [MEMORY[0x1E4F74F68] sharedAVSystemController];
  uint64_t v6 = (void *)avSystemController;
  avSystemController = v5;

  int v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 addObserver:self selector:sel_setupAVSystemController name:*v4 object:0];

  v52 = [(id)avSystemController attributeForKey:*MEMORY[0x1E4F74C78]];
  self->_audioIsActive = [v52 count] != 0;
  int v8 = (NSMutableArray *)objc_opt_new();
  nsOutputNotifications = self->_nsOutputNotifications;
  self->_nsOutputNotifications = v8;

  uint64_t v10 = (NSMutableArray *)objc_opt_new();
  nsRoutingNotifications = self->_nsRoutingNotifications;
  self->_nsRoutingNotifications = v10;

  id v12 = objc_alloc(MEMORY[0x1E4F929D0]);
  id v13 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"Routing"];
  uint64_t v14 = (PLEntry *)[v12 initWithEntryKey:v13];
  entryRoutingOld = self->_entryRoutingOld;
  self->_entryRoutingOld = v14;

  uint64_t v16 = *MEMORY[0x1E4F74BD8];
  v76[0] = *MEMORY[0x1E4F74ED8];
  v76[1] = v16;
  uint64_t v17 = *MEMORY[0x1E4F74CD8];
  v76[2] = *MEMORY[0x1E4F74C08];
  v76[3] = v17;
  id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:4];
  uint64_t v19 = *MEMORY[0x1E4F74B10];
  v75[0] = *MEMORY[0x1E4F74E98];
  v75[1] = v19;
  uint64_t v20 = *MEMORY[0x1E4F74C00];
  v75[2] = *MEMORY[0x1E4F74EC0];
  v75[3] = v20;
  v75[4] = *MEMORY[0x1E4F74A88];
  uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:5];
  uint64_t v74 = *MEMORY[0x1E4F74C20];
  uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v74 count:1];
  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v23 addObjectsFromArray:v18];
  id v53 = (id)v21;
  [v23 addObjectsFromArray:v21];
  [v23 addObjectsFromArray:v22];
  v51 = v23;
  [(id)avSystemController setAttribute:v23 forKey:*MEMORY[0x1E4F74EA8] error:0];
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  obuint64_t j = v18;
  uint64_t v24 = [obj countByEnumeratingWithState:&v67 objects:v73 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v68;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v68 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v28 = *(void *)(*((void *)&v67 + 1) + 8 * i);
        double v29 = [(PLAudioAgent *)self nsOutputNotifications];
        id v30 = objc_alloc(MEMORY[0x1E4F92A28]);
        v66[0] = MEMORY[0x1E4F143A8];
        v66[1] = 3221225472;
        v66[2] = __39__PLAudioAgent_setupAVSystemController__block_invoke;
        v66[3] = &unk_1E692A0F0;
        v66[4] = self;
        v31 = (void *)[v30 initWithOperator:self forNotification:v28 withBlock:v66];
        [v29 addObject:v31];
      }
      uint64_t v25 = [obj countByEnumeratingWithState:&v67 objects:v73 count:16];
    }
    while (v25);
  }

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v54 = v53;
  uint64_t v32 = [v54 countByEnumeratingWithState:&v62 objects:v72 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v63;
    do
    {
      for (uint64_t j = 0; j != v33; ++j)
      {
        if (*(void *)v63 != v34) {
          objc_enumerationMutation(v54);
        }
        uint64_t v36 = *(void *)(*((void *)&v62 + 1) + 8 * j);
        double v37 = [(PLAudioAgent *)self nsOutputNotifications];
        id v38 = objc_alloc(MEMORY[0x1E4F92A28]);
        v61[0] = MEMORY[0x1E4F143A8];
        v61[1] = 3221225472;
        v61[2] = __39__PLAudioAgent_setupAVSystemController__block_invoke_220;
        v61[3] = &unk_1E692A0F0;
        v61[4] = self;
        v39 = (void *)[v38 initWithOperator:self forNotification:v36 withBlock:v61];
        [v37 addObject:v39];
      }
      uint64_t v33 = [v54 countByEnumeratingWithState:&v62 objects:v72 count:16];
    }
    while (v33);
  }

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v40 = v22;
  uint64_t v41 = [v40 countByEnumeratingWithState:&v57 objects:v71 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v58;
    do
    {
      for (uint64_t k = 0; k != v42; ++k)
      {
        if (*(void *)v58 != v43) {
          objc_enumerationMutation(v40);
        }
        uint64_t v45 = *(void *)(*((void *)&v57 + 1) + 8 * k);
        double v46 = [(PLAudioAgent *)self nsOutputNotifications];
        id v47 = objc_alloc(MEMORY[0x1E4F92A28]);
        v56[0] = MEMORY[0x1E4F143A8];
        v56[1] = 3221225472;
        v56[2] = __39__PLAudioAgent_setupAVSystemController__block_invoke_224;
        v56[3] = &unk_1E692A0F0;
        v56[4] = self;
        v48 = (void *)[v47 initWithOperator:self forNotification:v45 withBlock:v56];
        [v46 addObject:v48];
      }
      uint64_t v42 = [v40 countByEnumeratingWithState:&v57 objects:v71 count:16];
    }
    while (v42);
  }

  v49 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  lastAudioStateChangeDate = self->_lastAudioStateChangeDate;
  self->_lastAudioStateChangeDate = v49;
}

void __39__PLAudioAgent_setupAVSystemController__block_invoke_220(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = PLLogAudio();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "Trigger from routing %@: %@", (uint8_t *)&v12, 0x16u);
  }

  int v8 = [v5 objectForKeyedSubscript:@"Sessions"];

  if (v8)
  {
    id v9 = [v5 objectForKeyedSubscript:@"Sessions"];
    objc_msgSend(*(id *)(a1 + 32), "setAudioIsActive:", objc_msgSend(v9, "count") != 0);
    uint64_t v10 = PLLogAudio();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v11 = [*(id *)(a1 + 32) audioIsActive];
      int v12 = 67109120;
      LODWORD(v13) = v11;
      _os_log_debug_impl(&dword_1D2690000, v10, OS_LOG_TYPE_DEBUG, "audio state: %d", (uint8_t *)&v12, 8u);
    }
  }
  [*(id *)(a1 + 32) logEventForwardRouting];
}

void __39__PLAudioAgent_setupAVSystemController__block_invoke_224(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  int v7 = PLLogAudio();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412546;
    id v9 = v6;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "Trigger from nowPlaying %@: %@", (uint8_t *)&v8, 0x16u);
  }

  [*(id *)(a1 + 32) handleNowPlayingApplicationIsPlayingDidChange:v5];
}

- (void)initOperatorDependancies
{
  [(PLAudioAgent *)self setupAVSystemController];
  self->_accessoryPowerState = 1;
  uint64_t v3 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"LightningConnectorStatus"];
  v51[5] = MEMORY[0x1E4F143A8];
  v51[6] = 3221225472;
  v51[7] = __40__PLAudioAgent_initOperatorDependancies__block_invoke;
  v51[8] = &unk_1E692A808;
  v51[9] = self;
  v39 = (void *)v3;
  uint64_t v4 = -[PLAudioAgent buildCallBack:withGroup:withHandler:](self, "buildCallBack:withGroup:withHandler:");
  [(PLAudioAgent *)self setAccessoryPowerCallback:v4];

  if (([MEMORY[0x1E4F92A38] isHomePod] & 1) == 0)
  {
    id v5 = [MEMORY[0x1E4F92A88] powerModelForOperatorName:@"audio"];
    id v6 = [(PLAudioAgent *)self audioHardware];
    int v7 = [v5 objectForKeyedSubscript:v6];
    int v8 = [v7 objectForKeyedSubscript:@"Speaker"];
    audioPowerModel = self->_audioPowerModel;
    self->_audioPowerModel = v8;
  }
  id v10 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __40__PLAudioAgent_initOperatorDependancies__block_invoke_258;
  v51[3] = &unk_1E692A6F8;
  v51[4] = self;
  id v38 = (void *)[v10 initWithOperator:self withRegistration:&unk_1F29EA238 withBlock:v51];
  -[PLAudioAgent setAudioAppXPCListener:](self, "setAudioAppXPCListener:");
  id v11 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __40__PLAudioAgent_initOperatorDependancies__block_invoke_267;
  v50[3] = &unk_1E692A6F8;
  v50[4] = self;
  double v37 = (void *)[v11 initWithOperator:self withRegistration:&unk_1F29EA260 withBlock:v50];
  -[PLAudioAgent setScreenMirroringXPCListener:](self, "setScreenMirroringXPCListener:");
  id v12 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __40__PLAudioAgent_initOperatorDependancies__block_invoke_274;
  v49[3] = &unk_1E692A6F8;
  v49[4] = self;
  uint64_t v36 = (void *)[v12 initWithOperator:self withRegistration:&unk_1F29EA288 withBlock:v49];
  -[PLAudioAgent setSpeakerAmpXPCListener:](self, "setSpeakerAmpXPCListener:");
  id v13 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __40__PLAudioAgent_initOperatorDependancies__block_invoke_282;
  v48[3] = &unk_1E692A6F8;
  v48[4] = self;
  v35 = (void *)[v13 initWithOperator:self withRegistration:&unk_1F29EA2B0 withBlock:v48];
  -[PLAudioAgent setHapticsXPCListener:](self, "setHapticsXPCListener:");
  id v14 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __40__PLAudioAgent_initOperatorDependancies__block_invoke_290;
  v47[3] = &unk_1E692A6F8;
  v47[4] = self;
  id v15 = (void *)[v14 initWithOperator:self withRegistration:&unk_1F29EA2D8 withBlock:v47];
  [(PLAudioAgent *)self setHapticsAssertionXPCListener:v15];
  id v16 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __40__PLAudioAgent_initOperatorDependancies__block_invoke_298;
  v46[3] = &unk_1E692A6F8;
  v46[4] = self;
  uint64_t v17 = (void *)[v16 initWithOperator:self withRegistration:&unk_1F29EA300 withBlock:v46];
  [(PLAudioAgent *)self setRMSLoggingXPCListener:v17];
  id v18 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __40__PLAudioAgent_initOperatorDependancies__block_invoke_303;
  v45[3] = &unk_1E692A6F8;
  v45[4] = self;
  uint64_t v19 = (void *)[v18 initWithOperator:self withRegistration:&unk_1F29EA328 withBlock:v45];
  [(PLAudioAgent *)self setHapticsRunningCountListener:v19];
  id v20 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __40__PLAudioAgent_initOperatorDependancies__block_invoke_308;
  v44[3] = &unk_1E692A6F8;
  v44[4] = self;
  uint64_t v21 = (PLXPCListenerOperatorComposition *)[v20 initWithOperator:self withRegistration:&unk_1F29EA350 withBlock:v44];
  hapticsPrewarmCountListener = self->_hapticsPrewarmCountListener;
  self->_hapticsPrewarmCountListener = v21;

  id v23 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __40__PLAudioAgent_initOperatorDependancies__block_invoke_318;
  v43[3] = &unk_1E692A6F8;
  v43[4] = self;
  uint64_t v24 = (void *)[v23 initWithOperator:self withRegistration:&unk_1F29EA378 withBlock:v43];
  [(PLAudioAgent *)self setCoreAudioVADXPCListener:v24];
  id v25 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __40__PLAudioAgent_initOperatorDependancies__block_invoke_325;
  v42[3] = &unk_1E692A6F8;
  v42[4] = self;
  uint64_t v26 = (void *)[v25 initWithOperator:self withRegistration:&unk_1F29EA3A0 withBlock:v42];
  [(PLAudioAgent *)self setShazamRecordingXPCListener:v26];
  id v27 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __40__PLAudioAgent_initOperatorDependancies__block_invoke_330;
  v41[3] = &unk_1E692A6F8;
  v41[4] = self;
  uint64_t v28 = (void *)[v27 initWithOperator:self withRegistration:&unk_1F29EA3C8 withBlock:v41];
  [(PLAudioAgent *)self setMutedTalkerDetectionXPCListener:v28];
  id v29 = objc_alloc(MEMORY[0x1E4F92AA0]);
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __40__PLAudioAgent_initOperatorDependancies__block_invoke_340;
  v40[3] = &unk_1E692A6F8;
  v40[4] = self;
  id v30 = (void *)[v29 initWithOperator:self withRegistration:&unk_1F29EA3F0 withBlock:v40];
  [(PLAudioAgent *)self setSingXPCListener:v30];
  if (([MEMORY[0x1E4F92A38] isHomePod] & 1) == 0)
  {
    v31 = [MEMORY[0x1E4F92900] sharedInstance];
    uint64_t v32 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    [v31 createDistributionEventForwardWithDistributionID:3 withChildNodeNameToWeight:&unk_1F29EA418 withStartDate:v32];

    if (![(PLAudioAgent *)self audioIsActive]) {
      [(PLAudioAgent *)self closeAudioAccountingEvents];
    }
  }
  uint64_t v33 = (PLNSNotificationOperatorComposition *)[objc_alloc(MEMORY[0x1E4F92A28]) initWithOperator:self forNotification:@"PLThermalMonitorNotification" withBlock:&__block_literal_global_354];
  thermalMonitorListener = self->_thermalMonitorListener;
  self->_thermalMonitorListener = v33;
}

uint64_t __40__PLAudioAgent_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleLightningStatusCallback:a2];
}

void __40__PLAudioAgent_initOperatorDependancies__block_invoke_258(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  int v7 = PLLogAudio();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "got callback! %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventPointAudioApp:v6];
}

void __40__PLAudioAgent_initOperatorDependancies__block_invoke_267(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  int v7 = PLLogAudio();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "got callback! %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventPointAudioApp:v6];
}

void __40__PLAudioAgent_initOperatorDependancies__block_invoke_274(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  int v7 = PLLogAudio();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "got callback! %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventPointSpeakerAmp:v6];
}

void __40__PLAudioAgent_initOperatorDependancies__block_invoke_282(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  int v7 = PLLogAudio();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "got callback! %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventPointHaptics:v6];
}

void __40__PLAudioAgent_initOperatorDependancies__block_invoke_290(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  int v7 = PLLogAudio();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "got callback! %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventPointHapticsAssertion:v6];
}

void __40__PLAudioAgent_initOperatorDependancies__block_invoke_298(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  int v7 = PLLogAudio();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "got callback! %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventIntervalRMSLogging:v6];
}

void __40__PLAudioAgent_initOperatorDependancies__block_invoke_303(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  int v7 = PLLogAudio();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "Got callback for PLAudioAgent_EventForward_HapticsRunningCount: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventForwardHapticsRunningCount:v6];
}

void __40__PLAudioAgent_initOperatorDependancies__block_invoke_308(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  int v7 = PLLogAudio();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "Haptics Prewarm Count callback: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventForwardHapticsPrewarmCount:v6];
}

void __40__PLAudioAgent_initOperatorDependancies__block_invoke_318(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  int v7 = PLLogAudio();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "Got callback for CoreAudioVAD payload: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventIntervalCoreAudioVAD:v6];
}

void __40__PLAudioAgent_initOperatorDependancies__block_invoke_325(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  int v7 = PLLogAudio();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "Got callback for PLAudioAgent_EventInterval_ShazamRecording: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventIntervalShazamRecording:v6];
}

void __40__PLAudioAgent_initOperatorDependancies__block_invoke_330(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  int v7 = PLLogAudio();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "MutedTalkerDetection payload: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventForwardMutedTalkerDetection:v6];
}

void __40__PLAudioAgent_initOperatorDependancies__block_invoke_340(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  int v7 = PLLogAudio();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_debug_impl(&dword_1D2690000, v7, OS_LOG_TYPE_DEBUG, "Audio Sing payload: %@", (uint8_t *)&v8, 0xCu);
  }

  [*(id *)(a1 + 32) logEventForwardSing:v6];
}

void __40__PLAudioAgent_initOperatorDependancies__block_invoke_352(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = PLLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_debug_impl(&dword_1D2690000, v3, OS_LOG_TYPE_DEBUG, "Notification from ThermalMonitor: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (id)buildCallBack:(id)a3 withGroup:(BOOL)a4 withHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (v6)
  {
    id v10 = [NSString stringWithFormat:@"GroupID_%@", v8];
  }
  else
  {
    id v10 = v8;
  }
  id v11 = v10;
  id v12 = objc_alloc(MEMORY[0x1E4F929E8]);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  void v16[2] = __52__PLAudioAgent_buildCallBack_withGroup_withHandler___block_invoke;
  void v16[3] = &unk_1E692A858;
  id v17 = v9;
  id v13 = v9;
  id v14 = (void *)[v12 initWithOperator:self forEntryKey:v11 withBlock:v16];

  return v14;
}

uint64_t __52__PLAudioAgent_buildCallBack_withGroup_withHandler___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (void)handleLightningStatusCallback:(id)a3
{
  id v5 = [a3 objectForKey:@"entry"];
  int v4 = [v5 objectForKey:@"IOAccessoryPowerMode"];
  -[PLAudioAgent setAccessoryPowerState:](self, "setAccessoryPowerState:", [v4 intValue]);
}

- (BOOL)initDefaultAudioDevice:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [AudioDevice alloc];
  if (!v3)
  {
    id v6 = [(AudioDevice *)v5 initOutputDeviceWithCtx:self];
    if ([v6 updateDefaultAudioDeviceInfo])
    {
      uint64_t v7 = 224;
      goto LABEL_6;
    }
LABEL_7:
    BOOL v9 = 0;
    goto LABEL_8;
  }
  id v6 = [(AudioDevice *)v5 initInputDeviceWithCtx:self];
  if (([v6 updateDefaultAudioDeviceInfo] & 1) == 0) {
    goto LABEL_7;
  }
  uint64_t v7 = 232;
LABEL_6:
  id v6 = v6;
  id v8 = *(Class *)((char *)&self->super.super.super.isa + v7);
  *(Class *)((char *)&self->super.super.super.isa + v7) = (Class)v6;

  [v6 addAudioDeviceListener];
  BOOL v9 = 1;
LABEL_8:

  return v9;
}

- (void)log
{
  [(PLAudioAgent *)self logEventForwardOutput];
  [(PLAudioAgent *)self logEventForwardRouting];
}

- (void)logEventPointAudioApp:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D48];
  id v5 = a3;
  id v19 = +[PLOperator entryKeyForType:v4 andName:@"AudioApp"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v19 withRawData:v5];

  uint64_t v7 = [v6 objectForKeyedSubscript:@"PlaybackStartTime"];

  if (v7)
  {
    id v8 = [v6 objectForKeyedSubscript:@"PlaybackStartTime"];
    [v8 timeIntervalSince1970];
    double v10 = v9;

    id v11 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v10];
    id v12 = [v11 convertFromSystemToMonotonic];
    [v6 setEntryDate:v12];
  }
  id v13 = [v6 objectForKeyedSubscript:@"PlaybackStopTime"];

  if (v13)
  {
    id v14 = [v6 objectForKeyedSubscript:@"PlaybackStopTime"];
    [v14 timeIntervalSince1970];
    double v16 = v15;

    id v17 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v16];
    id v18 = [v17 convertFromSystemToMonotonic];
    [v6 setEntryDate:v18];
  }
  [(PLOperator *)self logEntry:v6];
  [(PLAudioAgent *)self createAudioAccountingEvents:v6];
  [(PLAudioAgent *)self createAirPlayAccountingEvents:v6];
  [(PLAudioAgent *)self createCarPlayAccountingEvents:v6];
  [(PLAudioAgent *)self createBluetoothAccountingEvents:v6];
}

- (void)logEventPointSpeakerAmp:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D48];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"SpeakerAmp"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLAudioAgent *)self modelAudioPowerSpeaker:v6];
  [(PLOperator *)self logEntry:v6];
}

- (void)logEventPointHaptics:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D48];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"Haptics"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventPointHapticsAssertion:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D48];
  id v5 = a3;
  id v9 = +[PLOperator entryKeyForType:v4 andName:@"HapticsAssertion"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v9];
  id v7 = [v5 objectForKeyedSubscript:@"Haptic_Active_Hardware_Time_Seconds"];
  [v6 setObject:v7 forKeyedSubscript:@"active_time"];

  id v8 = [v5 objectForKeyedSubscript:@"Active_Clients"];

  [v6 setObject:v8 forKeyedSubscript:@"active_clients"];
  [(PLOperator *)self logEntry:v6];
}

- (void)logEventForwardAudioDevice:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"AudioDevice"];
  id v6 = objc_alloc(MEMORY[0x1E4F929D0]);
  id v7 = [v4 lastUpdateTime];
  id v8 = (void *)[v6 initWithEntryKey:v5 withDate:v7];

  if (v8)
  {
    id v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v4, "deviceID"));
    [v8 setObject:v9 forKeyedSubscript:@"DeviceID"];

    double v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v4, "sourceID"));
    [v8 setObject:v10 forKeyedSubscript:@"SourceID"];

    id v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v4, "transType"));
    [v8 setObject:v11 forKeyedSubscript:@"TransType"];

    id v12 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "isInput"));
    [v8 setObject:v12 forKeyedSubscript:@"IsInput"];

    id v13 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "isRunning"));
    [v8 setObject:v13 forKeyedSubscript:@"IsRunning"];

    id v14 = NSNumber;
    [v4 volume];
    double v15 = objc_msgSend(v14, "numberWithFloat:");
    [v8 setObject:v15 forKeyedSubscript:@"Volume"];

    [(PLOperator *)self logEntry:v8];
    double v16 = PLLogAudio();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      id v17 = [v4 lastUpdateTime];
      int v18 = 138412546;
      id v19 = v17;
      __int16 v20 = 2112;
      uint64_t v21 = v8;
      _os_log_debug_impl(&dword_1D2690000, v16, OS_LOG_TYPE_DEBUG, "AudioDevice changed: %@, %@", (uint8_t *)&v18, 0x16u);
    }
  }
}

- (void)logEventForwardHapticsRunningCount:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D30];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"HapticsRunningCount"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventForwardHapticsPrewarmCount:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D30];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"HapticsPrewarmCount"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventForwardMutedTalkerDetection:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D30];
  id v5 = a3;
  id v7 = +[PLOperator entryKeyForType:v4 andName:@"MutedTalkerDetection"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v5];

  [(PLOperator *)self logEntry:v6];
}

- (void)logEventForwardSing:(id)a3
{
  id v4 = a3;
  id v9 = (id)[v4 mutableCopy];
  id v5 = (void *)MEMORY[0x1E4F1C9C8];
  id v6 = [v4 objectForKeyedSubscript:@"TimestampSent"];

  [v6 doubleValue];
  id v7 = objc_msgSend(v5, "dateWithTimeIntervalSince1970:");

  id v8 = [v7 convertFromSystemToMonotonic];

  [v9 removeObjectForKey:@"TimestampSent"];
  [(PLOperator *)self logForSubsystem:@"Audio" category:@"Sing" data:v9 date:v8];
}

- (void)logEventIntervalRMSLogging:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D38];
  id v5 = a3;
  id v21 = +[PLOperator entryKeyForType:v4 andName:@"RMSLogging"];
  id v6 = (void *)MEMORY[0x1E4F1C9C8];
  id v7 = [v5 objectForKeyedSubscript:@"StartTime"];
  [v7 doubleValue];
  id v8 = objc_msgSend(v6, "dateWithTimeIntervalSince1970:");

  id v9 = [v8 convertFromSystemToMonotonic];

  double v10 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v21 withDate:v9];
  id v11 = [v5 objectForKeyedSubscript:@"ApplicationName"];
  [v10 setObject:v11 forKeyedSubscript:@"ApplicationName"];

  id v12 = [v5 objectForKeyedSubscript:@"maxRms"];
  [v10 setObject:v12 forKeyedSubscript:@"maxRms"];

  id v13 = [v5 objectForKeyedSubscript:@"minRms"];
  [v10 setObject:v13 forKeyedSubscript:@"minRms"];

  id v14 = [v5 objectForKeyedSubscript:@"silence"];
  [v10 setObject:v14 forKeyedSubscript:@"silence_duration"];

  double v15 = [v5 objectForKeyedSubscript:@"quiet"];
  [v10 setObject:v15 forKeyedSubscript:@"quiet_duration"];

  double v16 = [v5 objectForKeyedSubscript:@"audible"];
  [v10 setObject:v16 forKeyedSubscript:@"audible_duration"];

  id v17 = [v5 objectForKeyedSubscript:@"node"];
  [v10 setObject:v17 forKeyedSubscript:@"node"];

  int v18 = [v5 objectForKeyedSubscript:@"pid"];
  [v10 setObject:v18 forKeyedSubscript:@"pid"];

  id v19 = [v5 objectForKeyedSubscript:@"reporterID"];

  [v10 setObject:v19 forKeyedSubscript:@"reporterID"];
  __int16 v20 = [MEMORY[0x1E4F1C9C8] monotonicDate];
  [v10 setObject:v20 forKeyedSubscript:@"timestampEnd"];

  [(PLOperator *)self logEntry:v10];
}

- (void)logEventIntervalShazamRecording:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F92D38];
  id v5 = a3;
  id v13 = +[PLOperator entryKeyForType:v4 andName:@"ShazamRecording"];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v13 withRawData:v5];
  id v7 = [v5 objectForKeyedSubscript:@"timestamp"];
  id v8 = [v7 convertFromSystemToMonotonic];
  [v6 setEntryDate:v8];

  id v9 = [v5 objectForKeyedSubscript:@"timestampEnd"];

  double v10 = [v9 convertFromSystemToMonotonic];
  [v6 setObject:v10 forKeyedSubscript:@"timestampEnd"];

  id v11 = [v6 objectForKeyedSubscript:@"timestampEnd"];

  if (!v11)
  {
    id v12 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    [v6 setObject:v12 forKeyedSubscript:@"timestampEnd"];
  }
  [(PLOperator *)self logEntry:v6];
}

- (void)logEventIntervalCoreAudioVAD:(id)a3
{
  v71[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"State"];
  int v6 = [v5 intValue];

  id v7 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D38] andName:@"CoreAudioVAD"];
  id v8 = NSString;
  id v9 = [v4 objectForKeyedSubscript:@"ClientID"];
  double v10 = [v4 objectForKeyedSubscript:@"Client"];
  id v11 = [v8 stringWithFormat:@"EndTime IS NULL AND ClientID = '%@' AND Client = '%@'", v9, v10];
  v71[0] = v11;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:1];

  id v13 = [(PLOperator *)self storage];
  id v14 = [v13 lastEntryForKey:v7 withFilters:v12];

  if (v6 == 1)
  {
    if (v14)
    {
      double v15 = PLLogAudio();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109378;
        LODWORD(v70[0]) = 1;
        WORD2(v70[0]) = 2112;
        *(void *)((char *)v70 + 6) = v14;
        _os_log_debug_impl(&dword_1D2690000, v15, OS_LOG_TYPE_DEBUG, "CoreAudioVad Active Session state = %d, will update existing table openEntry = %@", buf, 0x12u);
      }

      v66[0] = MEMORY[0x1E4F143A8];
      v66[1] = 3221225472;
      v66[2] = __45__PLAudioAgent_logEventIntervalCoreAudioVAD___block_invoke;
      v66[3] = &unk_1E692B128;
      id v67 = v14;
      id v68 = v4;
      [(PLOperator *)self updateEntry:v67 withBlock:v66];

      double v16 = v67;
    }
    else
    {
      v61 = self;
      double v16 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v4];
      id v19 = (void *)MEMORY[0x1E4F1C9C8];
      __int16 v20 = [v4 objectForKeyedSubscript:@"StartTime"];
      [v20 doubleValue];
      id v21 = objc_msgSend(v19, "dateWithTimeIntervalSince1970:");

      uint64_t v22 = [v21 convertFromSystemToMonotonic];

      id v23 = (void *)MEMORY[0x1E4F1C9C8];
      uint64_t v24 = v22;
      [v22 timeIntervalSince1970];
      uint64_t v26 = [v23 dateWithTimeIntervalSince1970:round(v25 / 60.0) * 60.0];
      [v16 setObject:v26 forKeyedSubscript:@"StartTime"];

      id v27 = NSNumber;
      uint64_t v28 = [v4 objectForKeyedSubscript:@"LifespanInSeconds"];
      id v29 = objc_msgSend(v27, "numberWithDouble:", round((double)(int)objc_msgSend(v28, "intValue") / 60.0) * 60.0);
      [v16 setObject:v29 forKeyedSubscript:@"LifespanInSeconds"];

      id v30 = (void *)MEMORY[0x1E4F92A88];
      v31 = NSString;
      uint64_t v32 = [v4 objectForKeyedSubscript:@"SID"];
      uint64_t v33 = [v31 stringWithFormat:@"%@", v32];
      uint64_t v34 = [v30 hashString:v33];
      [v16 setObject:v34 forKeyedSubscript:@"SID"];

      v35 = PLLogAudio();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109378;
        LODWORD(v70[0]) = 1;
        WORD2(v70[0]) = 2112;
        *(void *)((char *)v70 + 6) = v16;
        _os_log_debug_impl(&dword_1D2690000, v35, OS_LOG_TYPE_DEBUG, "CoreAudioVad Active Session state = %d, creating new table entry =  %@", buf, 0x12u);
      }

      [(PLOperator *)v61 logEntry:v16];
    }
  }
  else
  {
    id v17 = PLLogAudio();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
    if (v14)
    {
      if (v18)
      {
        *(_DWORD *)buf = 67109378;
        LODWORD(v70[0]) = v6;
        WORD2(v70[0]) = 2112;
        *(void *)((char *)v70 + 6) = v14;
        _os_log_debug_impl(&dword_1D2690000, v17, OS_LOG_TYPE_DEBUG, "CoreAudioVad state = %d Found OpenEntry openEntry = %@", buf, 0x12u);
      }

      v63[0] = MEMORY[0x1E4F143A8];
      v63[1] = 3221225472;
      v63[2] = __45__PLAudioAgent_logEventIntervalCoreAudioVAD___block_invoke_414;
      v63[3] = &unk_1E692B128;
      id v64 = v4;
      id v65 = v14;
      [(PLOperator *)self updateEntry:v65 withBlock:v63];

      double v16 = v64;
    }
    else
    {
      long long v62 = self;
      if (v18)
      {
        *(_DWORD *)buf = 138412290;
        v70[0] = v4;
        _os_log_debug_impl(&dword_1D2690000, v17, OS_LOG_TYPE_DEBUG, "CoreAudioVad Didn't find OpenEntry, payload = %@", buf, 0xCu);
      }

      double v16 = (void *)[objc_alloc(MEMORY[0x1E4F929D0]) initWithEntryKey:v7 withRawData:v4];
      uint64_t v36 = (void *)MEMORY[0x1E4F1C9C8];
      double v37 = [v4 objectForKeyedSubscript:@"StartTime"];
      [v37 doubleValue];
      id v38 = objc_msgSend(v36, "dateWithTimeIntervalSince1970:");

      v39 = [v38 convertFromSystemToMonotonic];

      id v40 = (void *)MEMORY[0x1E4F1C9C8];
      long long v60 = v39;
      [v39 timeIntervalSince1970];
      uint64_t v42 = [v40 dateWithTimeIntervalSince1970:round(v41 / 60.0) * 60.0];
      [v16 setObject:v42 forKeyedSubscript:@"StartTime"];

      uint64_t v43 = (void *)MEMORY[0x1E4F1C9C8];
      v44 = [v4 objectForKeyedSubscript:@"EndTime"];
      [v44 doubleValue];
      uint64_t v45 = objc_msgSend(v43, "dateWithTimeIntervalSince1970:");

      double v46 = [v45 convertFromSystemToMonotonic];

      id v47 = (void *)MEMORY[0x1E4F1C9C8];
      v48 = v46;
      [v46 timeIntervalSince1970];
      v50 = [v47 dateWithTimeIntervalSince1970:round(v49 / 60.0) * 60.0];
      [v16 setObject:v50 forKeyedSubscript:@"EndTime"];

      v51 = NSNumber;
      v52 = [v4 objectForKeyedSubscript:@"LifespanInSeconds"];
      id v53 = objc_msgSend(v51, "numberWithDouble:", round((double)(int)objc_msgSend(v52, "intValue") / 60.0) * 60.0);
      [v16 setObject:v53 forKeyedSubscript:@"LifespanInSeconds"];

      id v54 = (void *)MEMORY[0x1E4F92A88];
      v55 = NSString;
      v56 = [v4 objectForKeyedSubscript:@"SID"];
      long long v57 = [v55 stringWithFormat:@"%@", v56];
      long long v58 = [v54 hashString:v57];
      [v16 setObject:v58 forKeyedSubscript:@"SID"];

      long long v59 = PLLogAudio();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v70[0] = v16;
        _os_log_debug_impl(&dword_1D2690000, v59, OS_LOG_TYPE_DEBUG, "CoreAudioVad Didn't find OpenEntry calling logEntry entry = %@", buf, 0xCu);
      }

      [(PLOperator *)v62 logEntry:v16];
    }
  }
}

void __45__PLAudioAgent_logEventIntervalCoreAudioVAD___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = NSNumber;
  BOOL v3 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"LifespanInSeconds"];
  id v4 = objc_msgSend(v2, "numberWithDouble:", round((double)(int)objc_msgSend(v3, "intValue") / 60.0) * 60.0);
  [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:@"LifespanInSeconds"];

  id v5 = PLLogAudio();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "CoreAudioVad updated openEntry = %@", (uint8_t *)&v7, 0xCu);
  }
}

void __45__PLAudioAgent_logEventIntervalCoreAudioVAD___block_invoke_414(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F1C9C8];
  BOOL v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"EndTime"];
  [v3 doubleValue];
  id v4 = objc_msgSend(v2, "dateWithTimeIntervalSince1970:");

  id v5 = [v4 convertFromSystemToMonotonic];

  uint64_t v6 = (void *)MEMORY[0x1E4F1C9C8];
  [v5 timeIntervalSince1970];
  uint64_t v8 = [v6 dateWithTimeIntervalSince1970:round(v7 / 60.0) * 60.0];
  [*(id *)(a1 + 40) setObject:v8 forKeyedSubscript:@"EndTime"];

  uint64_t v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"State"];
  [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:@"State"];

  double v10 = NSNumber;
  id v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"LifespanInSeconds"];
  id v12 = objc_msgSend(v10, "numberWithDouble:", round((double)(int)objc_msgSend(v11, "intValue") / 60.0) * 60.0);
  [*(id *)(a1 + 40) setObject:v12 forKeyedSubscript:@"LifespanInSeconds"];

  id v13 = PLLogAudio();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = *(void *)(a1 + 40);
    int v15 = 138412290;
    uint64_t v16 = v14;
    _os_log_debug_impl(&dword_1D2690000, v13, OS_LOG_TYPE_DEBUG, "CoreAudioVad updateEntry:openEntry = %@", (uint8_t *)&v15, 0xCu);
  }
}

uint64_t __48__PLAudioAgent_shouldModelAudioPowerSpeakerTemp__block_invoke()
{
  uint64_t result = [MEMORY[0x1E4F92A38] isiPad];
  if (result)
  {
    if (([MEMORY[0x1E4F92A38] isDeviceClass:100032] & 1) != 0
      || ([MEMORY[0x1E4F92A38] isDeviceClass:100033] & 1) != 0
      || ([MEMORY[0x1E4F92A38] isDeviceClass:100034] & 1) != 0
      || ([MEMORY[0x1E4F92A38] isDeviceClass:100035] & 1) != 0
      || ([MEMORY[0x1E4F92A38] isDeviceClass:100036] & 1) != 0
      || ([MEMORY[0x1E4F92A38] isDeviceClass:100037] & 1) != 0
      || ([MEMORY[0x1E4F92A38] isDeviceClass:100038] & 1) != 0
      || ([MEMORY[0x1E4F92A38] isDeviceClass:100039] & 1) != 0
      || ([MEMORY[0x1E4F92A38] isDeviceClass:100040] & 1) != 0
      || ([MEMORY[0x1E4F92A38] isDeviceClass:100041] & 1) != 0
      || ([MEMORY[0x1E4F92A38] isDeviceClass:100042] & 1) != 0)
    {
      uint64_t result = 1;
    }
    else
    {
      uint64_t result = [MEMORY[0x1E4F92A38] isDeviceClass:100043];
    }
  }
  _MergedGlobals_1_37 = result;
  return result;
}

- (double)modelAudioPowerWithVolume:(double)a3
{
  if ([MEMORY[0x1E4F92A38] isHomePod]) {
    return 0.0;
  }
  uint64_t v6 = (void *)MEMORY[0x1E4F92A88];
  double v7 = [(PLAudioAgent *)self audioPowerModel];
  [v6 scaledPowerBasedOnPoint:v7 withPowerModel:a3];
  double v9 = v8;

  return v9;
}

- (void)modelAudioPowerSpeaker:(id)a3
{
  id v23 = a3;
  if (([MEMORY[0x1E4F92A38] isHomePod] & 1) == 0)
  {
    if (!v23) {
      goto LABEL_10;
    }
    id v4 = [v23 entryDate];

    if (!v4) {
      goto LABEL_10;
    }
    if ([(PLAudioAgent *)self speakerIsPlayingAudio])
    {
      id v5 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"SpeakerAmp"];
      uint64_t v6 = [(PLOperator *)self storage];
      double v7 = [v6 lastEntryForKey:v5];

      double v8 = [v23 entryDate];
      double v9 = [v8 dateByAddingTimeInterval:-60.0];

      double v10 = [v9 laterDate:self->_lastAudioStateChangeDate];

      if (v7)
      {
        id v11 = [v7 entryDate];
        uint64_t v12 = [v10 laterDate:v11];

        double v10 = (void *)v12;
      }
      id v13 = [v23 objectForKeyedSubscript:@"Avg Watts Modelled"];
      [v13 doubleValue];
      [(PLAudioAgent *)self convertSpeakerProtectionModeledPowerToTotalSpeakerPower:v14 * 1000.0];
      double v16 = v15;

      uint64_t v17 = [MEMORY[0x1E4F92900] sharedInstance];
      [v17 createPowerEventForwardWithRootNodeID:15 withPower:v10 withStartDate:v16];

      goto LABEL_11;
    }
    uint64_t v18 = [v23 objectForKeyedSubscript:@"Avg Watts Modelled"];
    if (!v18
      || (id v19 = (void *)v18,
          [v23 objectForKeyedSubscript:@"Avg Watts Modelled"],
          __int16 v20 = objc_claimAutoreleasedReturnValue(),
          [v20 doubleValue],
          double v22 = v21,
          v20,
          v19,
          v22 <= 0.0))
    {
LABEL_10:
      double v10 = [MEMORY[0x1E4F92900] sharedInstance];
      id v5 = [(PLAudioAgent *)self lastAudioStateChangeDate];
      [v10 createPowerEventForwardWithRootNodeID:15 withPower:v5 withStartDate:0.0];
LABEL_11:
    }
  }
  MEMORY[0x1F41817F8]();
}

- (double)convertSpeakerProtectionModeledPowerToTotalSpeakerPower:(double)a3
{
  double result = 0.0;
  if (a3 > 0.0)
  {
    if (objc_msgSend(MEMORY[0x1E4F92A38], "isHomePod", 0.0))
    {
LABEL_3:
      double result = a3;
    }
    else
    {
      int v5 = [MEMORY[0x1E4F92A38] kPLAudioClassOfDevice] - 1005001;
      double result = a3;
      switch(v5)
      {
        case 0:
          double v13 = log(a3 + 0.1);
          double v14 = 1.5;
          goto LABEL_19;
        case 1:
          double v15 = a3 * -0.0014;
          double v16 = 3.03;
          goto LABEL_24;
        case 2:
          double v8 = log(a3 * 0.005 + 1.0);
          double v9 = 810.0;
          goto LABEL_28;
        case 3:
          double v10 = log(a3 * 0.002 + 1.0);
          double v11 = a3 * 0.4;
          double v12 = 110.0;
          goto LABEL_38;
        case 4:
          double v13 = log(a3 * 0.05 + 1.0);
          double v14 = 10.0;
LABEL_19:
          double result = a3 + v13 * v14;
          goto LABEL_4;
        case 5:
          double result = 0.0;
          if (a3 < 0.1) {
            goto LABEL_4;
          }
          double v6 = a3 * 1.51 + a3 * -0.0003 * a3;
          unint64_t v17 = 0x4048000000000000;
          goto LABEL_55;
        case 6:
        case 7:
          double result = 0.0;
          if (a3 < 0.001) {
            goto LABEL_4;
          }
          double v6 = a3 * 0.96 + a3 * -0.00009 * a3;
          double v7 = 97.0;
          break;
        case 8:
          double v10 = log(a3 + 1.0);
          double v11 = a3 * 0.5;
          double v12 = 6.0;
          goto LABEL_38;
        case 9:
          double v15 = a3 * -0.0013;
          double v16 = 1.75;
LABEL_24:
          double result = a3 * v16 + v15 * a3;
          goto LABEL_4;
        case 10:
          double v10 = log(a3 + 1.0);
          double v11 = a3 * 0.725;
          double v12 = 9.0;
          goto LABEL_38;
        case 11:
          double v10 = log(a3 + 1.0);
          double v11 = a3 * 1.2;
          double v12 = 10.0;
          goto LABEL_38;
        case 12:
        case 13:
          double v8 = log(a3 * 0.006 + 1.0);
          double v9 = 410.0;
          goto LABEL_28;
        case 14:
          double v8 = log(a3 * 0.007 + 1.0);
          double v9 = 450.0;
LABEL_28:
          double result = v8 * v9;
          goto LABEL_4;
        case 15:
          double v10 = log(a3 * 0.9 + 1.0);
          double v11 = a3 * 1.35;
          double v12 = 13.0;
          goto LABEL_38;
        case 16:
        case 17:
          double v10 = log(a3 * 8.0 + 1.0);
          double v11 = a3 * 1.07;
          double v12 = 3.5;
          goto LABEL_38;
        case 18:
        case 19:
        case 23:
        case 26:
        case 30:
        case 38:
        case 39:
        case 40:
          goto LABEL_4;
        case 20:
          double v18 = log(a3 + 1.0);
          double v19 = a3 * 1.075;
          double v20 = 7.0;
          goto LABEL_32;
        case 21:
          double v18 = log(a3 + 1.0);
          double v19 = a3 * 0.97;
          double v20 = 5.0;
LABEL_32:
          double result = v19 + v18 * v20;
          goto LABEL_34;
        case 22:
          double result = a3 + log(a3 * 5.0 + 1.0) * 10.0;
LABEL_34:
          if (result < 0.0) {
            double result = 0.0;
          }
          goto LABEL_4;
        case 24:
          double v10 = log(a3 + 1.0);
          double v11 = a3 * 1.5;
          double v12 = 11.0;
          goto LABEL_38;
        case 25:
          double v10 = log(a3 + 1.0);
          double v11 = a3 * 1.38;
          double v12 = 7.0;
LABEL_38:
          double result = v11 + v10 * v12;
          goto LABEL_4;
        case 27:
          double result = 0.0;
          if (a3 < 0.1) {
            goto LABEL_4;
          }
          double v6 = a3 * 1.87 + a3 * -0.0002 * a3;
          double v7 = 95.26;
          break;
        case 28:
          double result = 0.0;
          if (a3 < 0.1) {
            goto LABEL_4;
          }
          double v6 = a3 * 1.89 + a3 * -0.0001 * a3;
          double v7 = -17.5;
          break;
        case 29:
          double result = 0.0;
          if (a3 < 0.1) {
            goto LABEL_4;
          }
          double v6 = a3 * 1.44 + a3 * -0.000167 * a3;
          double v7 = 15.0;
          break;
        case 31:
          double result = 0.0;
          if (a3 < 0.1) {
            goto LABEL_4;
          }
          double v6 = a3 * 1.81 + a3 * -0.0000852 * a3;
          double v7 = 123.12;
          break;
        case 32:
          double result = 0.0;
          if (a3 < 0.1) {
            goto LABEL_4;
          }
          double v6 = a3 * 1.85 + a3 * -0.00018 * a3;
          double v7 = 22.35;
          break;
        case 33:
          double result = 0.0;
          if (a3 < 0.1) {
            goto LABEL_4;
          }
          double v6 = a3 * 1.16 + a3 * 0.0000309 * a3;
          double v7 = -46.18;
          break;
        case 34:
          double result = 0.0;
          if (a3 < 0.1) {
            goto LABEL_4;
          }
          double v6 = a3 * 1.015 + a3 * 0.0000866 * a3;
          double v7 = -23.0;
          break;
        case 35:
          double result = 0.0;
          if (a3 < 0.1) {
            goto LABEL_4;
          }
          double v6 = a3 * 1.19 + a3 * -0.0000202 * a3;
          unint64_t v17 = 0xC049000000000000;
LABEL_55:
          double v7 = *(double *)&v17;
          break;
        case 36:
          double result = 0.0;
          if (a3 >= 0.1) {
            double result = a3 * 1.404 + -55.2;
          }
          goto LABEL_4;
        case 37:
          double result = 0.0;
          if (a3 < 0.1) {
            goto LABEL_4;
          }
          double v6 = a3 * 0.9261 + a3 * 0.00007412 * a3;
          double v7 = 38.265;
          break;
        case 41:
          double result = 0.0;
          if (a3 < 0.1) {
            goto LABEL_4;
          }
          double v6 = a3 * 1.0808 + a3 * -0.0003205 * a3;
          double v7 = 14.1368;
          break;
        case 42:
          double result = 0.0;
          if (a3 < 0.1) {
            goto LABEL_4;
          }
          double v6 = a3 * 1.1128 + a3 * -0.0002358 * a3;
          double v7 = 13.3804;
          break;
        case 43:
          double result = 0.0;
          if (a3 < 0.1) {
            goto LABEL_4;
          }
          double v6 = a3 * 1.6664 + a3 * -0.0003566 * a3;
          double v7 = -268.816;
          break;
        case 44:
          double result = 0.0;
          if (a3 < 0.1) {
            goto LABEL_4;
          }
          double v6 = a3 * 1.6392 + a3 * -0.0001588 * a3;
          double v7 = 6.333;
          break;
        default:
          goto LABEL_3;
      }
      double result = v6 + v7;
    }
LABEL_4:
    if (result > 3000.0) {
      double result = 3000.0;
    }
    if (result <= 0.0) {
      return 0.0;
    }
  }
  return result;
}

- (double)audioPowerForRoute:(id)a3 forVolume:(double)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  double v6 = (__CFString *)a3;
  char v7 = [MEMORY[0x1E4F92A38] isHomePod];
  double v8 = 0.0;
  if (v6 && (v7 & 1) == 0)
  {
    double v9 = [MEMORY[0x1E4F92A88] powerModelForOperatorName:@"audio"];
    double v10 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(MEMORY[0x1E4F92A38], "kPLAudioClassOfDevice"));
    double v11 = [v10 stringValue];

    double v12 = [v9 allKeys];
    char v13 = [v12 containsString:v11];

    if (v13)
    {
      if ([(PLAudioAgent *)self accessoryPowerState] == 4
        && (([(__CFString *)v6 isEqual:@"Headphone"] & 1) != 0
         || [(__CFString *)v6 isEqual:@"Headset"]))
      {
        double v14 = [v9 objectForKeyedSubscript:v11];
        double v15 = v14;
        double v16 = @"Lightning";
      }
      else if ([(PLAudioAgent *)self accessoryPowerState] == 6 {
             && (([(__CFString *)v6 isEqual:@"Headphone"] & 1) != 0
      }
              || [(__CFString *)v6 isEqual:@"Headset"]))
      {
        double v14 = [v9 objectForKeyedSubscript:v11];
        double v15 = v14;
        double v16 = @"Lightning_VoltageMonitor";
      }
      else
      {
        int v24 = [(__CFString *)v6 isEqual:@"Speaker"];
        double v14 = [v9 objectForKeyedSubscript:v11];
        double v15 = v14;
        if (v24) {
          double v16 = @"Speaker";
        }
        else {
          double v16 = v6;
        }
      }
      double v18 = [v14 objectForKeyedSubscript:v16];

      if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        double v25 = [v18 allKeys];
        uint64_t v26 = [v25 sortedArrayUsingSelector:sel_compareFloat_];

        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        id v23 = v26;
        uint64_t v27 = [v23 countByEnumeratingWithState:&v54 objects:v60 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          id v29 = 0;
          uint64_t v30 = *(void *)v55;
LABEL_25:
          uint64_t v31 = 0;
          uint64_t v32 = v29;
          while (1)
          {
            if (*(void *)v55 != v30) {
              objc_enumerationMutation(v23);
            }
            uint64_t v33 = *(void **)(*((void *)&v54 + 1) + 8 * v31);
            [v33 doubleValue];
            double v35 = v34;
            id v29 = v33;
            if (v35 > a4) {
              break;
            }

            ++v31;
            uint64_t v32 = v29;
            if (v28 == v31)
            {
              uint64_t v28 = [v23 countByEnumeratingWithState:&v54 objects:v60 count:16];
              if (v28) {
                goto LABEL_25;
              }
              goto LABEL_41;
            }
          }

          if (!v29) {
            goto LABEL_42;
          }
          double v41 = [v18 objectForKeyedSubscript:v32];
          [v41 doubleValue];
          double v43 = v42;

          v44 = [v18 objectForKeyedSubscript:v29];
          [v44 doubleValue];
          double v46 = v45;

          [v32 doubleValue];
          double v48 = a4 - v47;
          [v29 doubleValue];
          double v50 = v49;
          [v32 doubleValue];
          double v8 = v43 + v48 / (v50 - v51) * (v46 - v43);
        }
        else
        {
          id v29 = 0;
LABEL_41:

          uint64_t v32 = v29;
LABEL_42:
          id v29 = [v18 objectForKeyedSubscript:v32];
          [v29 doubleValue];
          double v8 = v52;
        }
      }
      else
      {
        if (![MEMORY[0x1E4F929C0] debugEnabled]) {
          goto LABEL_46;
        }
        uint64_t v36 = objc_opt_class();
        v58[0] = MEMORY[0x1E4F143A8];
        v58[1] = 3221225472;
        v58[2] = __45__PLAudioAgent_audioPowerForRoute_forVolume___block_invoke_440;
        v58[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v58[4] = v36;
        if (qword_1EBD58AB8 != -1) {
          dispatch_once(&qword_1EBD58AB8, v58);
        }
        if (!byte_1EBD58A92) {
          goto LABEL_46;
        }
        id v23 = [NSString stringWithFormat:@"No audio power model exists for audio class: %@ and route: %@", v11, v6];
        double v37 = (void *)MEMORY[0x1E4F929B8];
        id v38 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLAudioAgent.m"];
        v39 = [v38 lastPathComponent];
        id v40 = [NSString stringWithUTF8String:"-[PLAudioAgent audioPowerForRoute:forVolume:]"];
        [v37 logMessage:v23 fromFile:v39 fromFunction:v40 fromLineNumber:1823];

        uint64_t v32 = PLLogCommon();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          long long v62 = v23;
          _os_log_debug_impl(&dword_1D2690000, v32, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }
      }
    }
    else
    {
      if (![MEMORY[0x1E4F929C0] debugEnabled]) {
        goto LABEL_47;
      }
      uint64_t v17 = objc_opt_class();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __45__PLAudioAgent_audioPowerForRoute_forVolume___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v17;
      if (qword_1EBD58AB0 != -1) {
        dispatch_once(&qword_1EBD58AB0, block);
      }
      if (!byte_1EBD58A91) {
        goto LABEL_47;
      }
      double v18 = [NSString stringWithFormat:@"No audio power model exists for audio class: %@", v11];
      double v19 = (void *)MEMORY[0x1E4F929B8];
      double v20 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLAudioAgent.m"];
      double v21 = [v20 lastPathComponent];
      double v22 = [NSString stringWithUTF8String:"-[PLAudioAgent audioPowerForRoute:forVolume:]"];
      [v19 logMessage:v18 fromFile:v21 fromFunction:v22 fromLineNumber:1804];

      id v23 = PLLogCommon();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        long long v62 = v18;
        _os_log_debug_impl(&dword_1D2690000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
    }

LABEL_46:
LABEL_47:
  }
  return v8;
}

uint64_t __45__PLAudioAgent_audioPowerForRoute_forVolume___block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58A91 = result;
  return result;
}

uint64_t __45__PLAudioAgent_audioPowerForRoute_forVolume___block_invoke_440(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F929C0] isClassDebugEnabled:*(void *)(a1 + 32)];
  byte_1EBD58A92 = result;
  return result;
}

- (void)closeAudioAccountingEvents
{
  if (([MEMORY[0x1E4F92A38] isHomePod] & 1) == 0)
  {
    id v5 = [MEMORY[0x1E4F1C9C8] monotonicDate];
    id v2 = [MEMORY[0x1E4F92900] sharedInstance];
    uint64_t v3 = MEMORY[0x1E4F1CC08];
    [v2 createDistributionEventForwardWithDistributionID:7 withChildNodeNameToWeight:MEMORY[0x1E4F1CC08] withStartDate:v5];

    id v4 = [MEMORY[0x1E4F92900] sharedInstance];
    [v4 createDistributionEventForwardWithDistributionID:26 withChildNodeNameToWeight:v3 withStartDate:v5];
  }
}

- (void)createAudioAccountingEvents:(id)a3
{
  id v14 = a3;
  if (([MEMORY[0x1E4F92A38] isHomePod] & 1) == 0)
  {
    uint64_t v3 = [v14 objectForKeyedSubscript:@"ApplicationName"];
    if (!v3) {
      goto LABEL_5;
    }
    id v4 = (void *)v3;
    id v5 = [v14 objectForKeyedSubscript:@"Operation"];
    double v6 = [v5 description];
    int v7 = [v6 isEqualToString:@"AudioPlayback_Start"];

    if (v7)
    {
      double v8 = [MEMORY[0x1E4F92900] sharedInstance];
      double v9 = [v14 objectForKeyedSubscript:@"ApplicationName"];
      double v10 = [v14 entryDate];
      [v8 createDistributionEventForwardWithDistributionID:7 withAddingChildNodeName:v9 withStartDate:v10];
    }
    else
    {
LABEL_5:
      double v11 = [v14 objectForKeyedSubscript:@"Operation"];
      double v12 = [v11 description];
      int v13 = [v12 isEqualToString:@"AudioPlayback_Stop"];

      if (!v13) {
        goto LABEL_8;
      }
      double v8 = [MEMORY[0x1E4F92900] sharedInstance];
      double v9 = [v14 objectForKeyedSubscript:@"ApplicationName"];
      double v10 = [v14 entryDate];
      [v8 createDistributionEventForwardWithDistributionID:7 withRemovingChildNodeName:v9 withStartDate:v10];
    }
  }
LABEL_8:
}

- (void)createAirPlayAccountingEvents:(id)a3
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([MEMORY[0x1E4F92A38] isHomePod]) {
    goto LABEL_15;
  }
  id v4 = [v3 objectForKeyedSubscript:@"AudioRoute"];
  id v5 = [v4 description];
  if ([v5 isEqualToString:@"AirPlay"]) {
    goto LABEL_5;
  }
  double v6 = [v3 objectForKeyedSubscript:@"AudioRoute"];
  int v7 = [v6 description];
  if ([v7 isEqualToString:@"Airtunes"])
  {

LABEL_5:
LABEL_6:
    uint64_t v8 = [v3 objectForKeyedSubscript:@"ApplicationName"];
    if (v8)
    {
      double v9 = (void *)v8;
      double v10 = [v3 objectForKeyedSubscript:@"Operation"];

      if (v10)
      {
        double v11 = [v3 objectForKeyedSubscript:@"Operation"];
        double v12 = [v11 description];
        int v13 = [v12 isEqualToString:@"AudioPlayback_Stop"];

        id v14 = [MEMORY[0x1E4F92900] sharedInstance];
        double v15 = [v3 entryDate];
        if (!v13)
        {
          [v14 createDistributionEventForwardWithDistributionID:3 withChildNodeNameToWeight:&unk_1F29EA468 withStartDate:v15];

          id v29 = [MEMORY[0x1E4F92900] sharedInstance];
          uint64_t v30 = [v3 objectForKeyedSubscript:@"ApplicationName"];
          id v38 = v30;
          v39[0] = &unk_1F29F0BE0;
          uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];
          uint64_t v32 = [v3 entryDate];
          [v29 createDistributionEventForwardWithDistributionID:36 withChildNodeNameToWeight:v31 withStartDate:v32];

          uint64_t v33 = [MEMORY[0x1E4F92900] sharedInstance];
          double v34 = [v3 objectForKeyedSubscript:@"ApplicationName"];
          double v37 = v34;
          double v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
          uint64_t v36 = [v3 entryDate];
          [v33 createQualificationEventForwardWithQualificationID:3 withChildNodeNames:v35 withStartDate:v36];

          goto LABEL_15;
        }
        [v14 createDistributionEventForwardWithDistributionID:3 withChildNodeNameToWeight:&unk_1F29EA440 withStartDate:v15];

        double v16 = [MEMORY[0x1E4F92900] sharedInstance];
        uint64_t v17 = [v3 entryDate];
        [v16 createDistributionEventForwardWithDistributionID:36 withChildNodeNameToWeight:MEMORY[0x1E4F1CC08] withStartDate:v17];

        double v18 = (void *)MEMORY[0x1E4F92900];
        goto LABEL_13;
      }
    }
    goto LABEL_15;
  }
  double v19 = [v3 objectForKeyedSubscript:@"AudioRoute"];
  double v20 = [v19 description];
  char v21 = [v20 isEqualToString:@"AirTunes"];

  if (v21) {
    goto LABEL_6;
  }
  double v22 = [v3 objectForKeyedSubscript:@"AudioRoute"];

  if (v22)
  {
    id v23 = [MEMORY[0x1E4F92900] sharedInstance];
    int v24 = [v3 entryDate];
    [v23 createDistributionEventForwardWithDistributionID:3 withChildNodeNameToWeight:&unk_1F29EA490 withStartDate:v24];

    double v25 = [MEMORY[0x1E4F92900] sharedInstance];
    uint64_t v26 = [v3 entryDate];
    [v25 createDistributionEventForwardWithDistributionID:36 withChildNodeNameToWeight:MEMORY[0x1E4F1CC08] withStartDate:v26];

    double v18 = (void *)MEMORY[0x1E4F92900];
LABEL_13:
    uint64_t v27 = [v18 sharedInstance];
    uint64_t v28 = [v3 entryDate];
    [v27 createQualificationEventForwardWithQualificationID:3 withChildNodeNames:MEMORY[0x1E4F1CBF0] withStartDate:v28];
  }
LABEL_15:
}

- (void)createCarPlayAccountingEvents:(id)a3
{
  id v15 = a3;
  if (([MEMORY[0x1E4F92A38] isHomePod] & 1) == 0)
  {
    id v3 = [v15 objectForKeyedSubscript:@"AudioRoute"];
    id v4 = [v3 description];
    int v5 = [v4 isEqualToString:@"CarAudioOutput"];

    if (!v5)
    {
      double v12 = [v15 objectForKeyedSubscript:@"AudioRoute"];
LABEL_10:

      goto LABEL_11;
    }
    uint64_t v6 = [v15 objectForKeyedSubscript:@"ApplicationName"];
    if (v6)
    {
      int v7 = (void *)v6;
      uint64_t v8 = [v15 objectForKeyedSubscript:@"Operation"];

      if (v8)
      {
        double v9 = [v15 objectForKeyedSubscript:@"Operation"];
        double v10 = [v9 description];
        int v11 = [v10 isEqualToString:@"AudioPlayback_Stop"];

        double v12 = [MEMORY[0x1E4F92900] sharedInstance];
        int v13 = [v15 objectForKeyedSubscript:@"ApplicationName"];
        id v14 = [v15 entryDate];
        if (v11) {
          [v12 createDistributionEventForwardWithDistributionID:26 withRemovingChildNodeName:v13 withStartDate:v14];
        }
        else {
          [v12 createDistributionEventForwardWithDistributionID:26 withAddingChildNodeName:v13 withStartDate:v14];
        }

        goto LABEL_10;
      }
    }
  }
LABEL_11:
}

- (void)createBluetoothAccountingEvents:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([MEMORY[0x1E4F92A38] isHomePod]) {
    goto LABEL_24;
  }
  id v4 = [v3 objectForKeyedSubscript:@"AudioRoute"];
  int v5 = [v4 description];
  if ([v5 isEqualToString:@"HeadsetBT"])
  {

LABEL_5:
    uint64_t v9 = [v3 objectForKeyedSubscript:@"ApplicationName"];
    if (v9)
    {
      double v10 = (void *)v9;
      int v11 = [v3 objectForKeyedSubscript:@"Operation"];

      if (v11)
      {
        double v12 = [v3 objectForKeyedSubscript:@"Operation"];
        int v13 = [v12 description];
        int v14 = [v13 isEqualToString:@"AudioPlayback_Stop"];

        id v15 = [MEMORY[0x1E4F92900] sharedInstance];
        id v16 = v15;
        if (!v14)
        {
          uint64_t v17 = [v15 currentDistributionEventForwardWithDistributionID:8];

          long long v32 = 0u;
          long long v33 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          id v16 = v17;
          uint64_t v18 = [v16 countByEnumeratingWithState:&v30 objects:v34 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            uint64_t v20 = *(void *)v31;
            do
            {
              for (uint64_t i = 0; i != v19; ++i)
              {
                if (*(void *)v31 != v20) {
                  objc_enumerationMutation(v16);
                }
                double v22 = *(void **)(*((void *)&v30 + 1) + 8 * i);
                if ((objc_msgSend(v22, "isEqualToString:", @"Hotspot", (void)v30) & 1) == 0
                  && ([v22 isEqualToString:@"IDSWatchBT"] & 1) == 0)
                {
                  id v23 = [MEMORY[0x1E4F92900] sharedInstance];
                  int v24 = [v3 entryDate];
                  [v23 createDistributionEventForwardWithDistributionID:8 withRemovingChildNodeName:v22 withStartDate:v24];
                }
              }
              uint64_t v19 = [v16 countByEnumeratingWithState:&v30 objects:v34 count:16];
            }
            while (v19);
          }

          double v25 = [MEMORY[0x1E4F92900] sharedInstance];
          uint64_t v26 = [v3 objectForKeyedSubscript:@"ApplicationName"];
          uint64_t v27 = [v3 entryDate];
          [v25 createDistributionEventForwardWithDistributionID:8 withAddingChildNodeName:v26 withStartDate:v27];

          goto LABEL_23;
        }
LABEL_22:
        double v25 = [v3 objectForKeyedSubscript:@"ApplicationName"];
        uint64_t v26 = [v3 entryDate];
        [v16 createDistributionEventForwardWithDistributionID:8 withRemovingChildNodeName:v25 withStartDate:v26];
LABEL_23:

        goto LABEL_24;
      }
    }
    goto LABEL_24;
  }
  uint64_t v6 = [v3 objectForKeyedSubscript:@"AudioRoute"];
  int v7 = [v6 description];
  int v8 = [v7 isEqualToString:@"HeadphonesBT"];

  if (v8) {
    goto LABEL_5;
  }
  uint64_t v28 = [v3 objectForKeyedSubscript:@"AudioRoute"];

  if (v28)
  {
    id v29 = [v3 objectForKeyedSubscript:@"ApplicationName"];

    if (v29)
    {
      id v16 = [MEMORY[0x1E4F92900] sharedInstance];
      goto LABEL_22;
    }
  }
LABEL_24:
}

- (int)accessoryPowerState
{
  return self->_accessoryPowerState;
}

- (void)setAccessoryPowerState:(int)a3
{
  self->_accessoryPowerState = a3;
}

- (NSMutableArray)nsOutputNotifications
{
  return (NSMutableArray *)objc_getProperty(self, a2, 56, 1);
}

- (NSMutableArray)nsRoutingNotifications
{
  return (NSMutableArray *)objc_getProperty(self, a2, 64, 1);
}

- (PLEntryNotificationOperatorComposition)accessoryPowerCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAccessoryPowerCallback:(id)a3
{
}

- (PLNSNotificationOperatorComposition)thermalMonitorListener
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setThermalMonitorListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)audioAppXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setAudioAppXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)screenMirroringXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 96, 1);
}

- (void)setScreenMirroringXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)speakerAmpXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 104, 1);
}

- (void)setSpeakerAmpXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)hapticsXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 112, 1);
}

- (void)setHapticsXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)hapticsAssertionXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 120, 1);
}

- (void)setHapticsAssertionXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)hapticsPrewarmCountListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 128, 1);
}

- (void)setHapticsPrewarmCountListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)hapticsRunningCountListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 136, 1);
}

- (void)setHapticsRunningCountListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)RMSLoggingXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 144, 1);
}

- (void)setRMSLoggingXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)CoreAudioVADXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 152, 1);
}

- (void)setCoreAudioVADXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)shazamRecordingXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 160, 1);
}

- (void)setShazamRecordingXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)mutedTalkerDetectionXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 168, 1);
}

- (void)setMutedTalkerDetectionXPCListener:(id)a3
{
}

- (PLXPCListenerOperatorComposition)singXPCListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 176, 1);
}

- (void)setSingXPCListener:(id)a3
{
}

- (void)setHeadsetIsPlayingAudio:(BOOL)a3
{
  self->_headsetIsPlayingAudio = a3;
}

- (void)setCurrentVolume:(double)a3
{
  self->_currentVolume = a3;
}

- (NSString)audioHardware
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (NSDictionary)audioPowerModel
{
  return (NSDictionary *)objc_getProperty(self, a2, 208, 1);
}

- (NSDate)lastAudioStateChangeDate
{
  return (NSDate *)objc_getProperty(self, a2, 216, 1);
}

- (void)setLastAudioStateChangeDate:(id)a3
{
}

- (AudioDevice)defaultOutputDevice
{
  return self->_defaultOutputDevice;
}

- (void)setDefaultOutputDevice:(id)a3
{
}

- (AudioDevice)defaultInputDevice
{
  return self->_defaultInputDevice;
}

- (void)setDefaultInputDevice:(id)a3
{
}

- (id)defaultOutputDeviceHandlerBlock
{
  return self->_defaultOutputDeviceHandlerBlock;
}

- (void)setDefaultOutputDeviceHandlerBlock:(id)a3
{
}

- (id)defaultInputDeviceHandlerBlock
{
  return self->_defaultInputDeviceHandlerBlock;
}

- (void)setDefaultInputDeviceHandlerBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_defaultInputDeviceHandlerBlock, 0);
  objc_storeStrong(&self->_defaultOutputDeviceHandlerBlock, 0);
  objc_storeStrong((id *)&self->_defaultInputDevice, 0);
  objc_storeStrong((id *)&self->_defaultOutputDevice, 0);
  objc_storeStrong((id *)&self->_lastAudioStateChangeDate, 0);
  objc_storeStrong((id *)&self->_audioPowerModel, 0);
  objc_storeStrong((id *)&self->_audioHardware, 0);
  objc_storeStrong((id *)&self->_entryRoutingOld, 0);
  objc_storeStrong((id *)&self->_singXPCListener, 0);
  objc_storeStrong((id *)&self->_mutedTalkerDetectionXPCListener, 0);
  objc_storeStrong((id *)&self->_shazamRecordingXPCListener, 0);
  objc_storeStrong((id *)&self->_CoreAudioVADXPCListener, 0);
  objc_storeStrong((id *)&self->_RMSLoggingXPCListener, 0);
  objc_storeStrong((id *)&self->_hapticsRunningCountListener, 0);
  objc_storeStrong((id *)&self->_hapticsPrewarmCountListener, 0);
  objc_storeStrong((id *)&self->_hapticsAssertionXPCListener, 0);
  objc_storeStrong((id *)&self->_hapticsXPCListener, 0);
  objc_storeStrong((id *)&self->_speakerAmpXPCListener, 0);
  objc_storeStrong((id *)&self->_screenMirroringXPCListener, 0);
  objc_storeStrong((id *)&self->_audioAppXPCListener, 0);
  objc_storeStrong((id *)&self->_thermalMonitorListener, 0);
  objc_storeStrong((id *)&self->_accessoryPowerCallback, 0);
  objc_storeStrong((id *)&self->_nsRoutingNotifications, 0);
  objc_storeStrong((id *)&self->_nsOutputNotifications, 0);
}

@end