@interface SASRequestOptions
+ (BOOL)supportsSecureCoding;
- (AFApplicationContext)directActionApplicationContext;
- (AFBulletin)bulletin;
- (AFRequestInfo)requestInfo;
- (AFSpeechRequestOptions)speechRequestOptions;
- (BOOL)_isForSpeechRequest;
- (BOOL)_isTypeToSiriPermittedAndEnabledForRequestOptions;
- (BOOL)acousticIdEnabled;
- (BOOL)isATVRemotePTTEligible;
- (BOOL)isAnnounceRequest;
- (BOOL)isConnectedToCarPlay;
- (BOOL)isFlexibleFollowupRequest;
- (BOOL)isForAppleTV;
- (BOOL)isForBluetoothCar;
- (BOOL)isForCarDND;
- (BOOL)isForEyesFree;
- (BOOL)isForStark;
- (BOOL)isForUIFree;
- (BOOL)isH1Activation;
- (BOOL)isHTTRequestSource;
- (BOOL)isInAutoPrompt;
- (BOOL)isInitialBringUp;
- (BOOL)isPronunciationRequest;
- (BOOL)isRemotePresentationBringUp;
- (BOOL)isRequestMadeWithPhysicalDeviceInteraction;
- (BOOL)isRightHandDrive;
- (BOOL)isShortButtonPressAction;
- (BOOL)isSuggestionSourceWithTextInput;
- (BOOL)isTVRemoteSourcePTTEligible;
- (BOOL)isVoiceTriggerRequest;
- (BOOL)isWiredMicOrBTHeadsetOrWx;
- (BOOL)predictedRecordRouteIsZLL;
- (BOOL)releaseAudioSessionOnRecordingCompletion;
- (BOOL)supportsCarPlayVehicleData;
- (BOOL)useAutomaticEndpointing;
- (BOOL)useStreamingDictation;
- (BOOL)userTypedInSiri;
- (NSArray)contextAppInfosForSiriViewController;
- (NSArray)currentCarPlaySupportedOEMAppIdList;
- (NSDictionary)continuityInfo;
- (NSDictionary)testingContext;
- (NSMutableArray)instrumentationEvents;
- (NSNumber)homeButtonUpFromBeep;
- (NSSet)launchActions;
- (NSString)activationDeviceIdentifier;
- (NSString)appBundleIdentifier;
- (NSString)serverCommandId;
- (NSString)startRecordingSoundId;
- (NSString)text;
- (NSString)uiPresentationIdentifier;
- (NSURL)speechFileURL;
- (NSUUID)activationEventInstrumentationIdenifier;
- (NSUUID)previousTurnIdentifier;
- (SASPronunciationContext)pronunciationContext;
- (SASRequestOptions)init;
- (SASRequestOptions)initWithCoder:(id)a3;
- (SASRequestOptions)initWithRequestSource:(int64_t)a3;
- (SASRequestOptions)initWithRequestSource:(int64_t)a3 uiPresentationIdentifier:(id)a4;
- (SASRequestOptions)initWithRequestSource:(int64_t)a3 uiPresentationIdentifier:(id)a4 buttonContext:(id)a5;
- (SASRequestOptions)initWithRequestSource:(int64_t)a3 uiPresentationIdentifier:(id)a4 systemState:(id)a5;
- (SASRequestOptions)originalRequestOptions;
- (SASUserEngagementContext)userEngagementContext;
- (double)buttonDownTimestamp;
- (double)computedActivationTime;
- (double)expectedTimestamp;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)nullableProperties;
- (int64_t)directActionEvent;
- (int64_t)inputType;
- (int64_t)longPressBehavior;
- (int64_t)presentationMode;
- (int64_t)previousInteractionInputType;
- (int64_t)requestSource;
- (unint64_t)carDNDStatus;
- (unint64_t)currentLockState;
- (unint64_t)tvRemoteType;
- (void)_configureStreamingDictationForSource:(int64_t)a3;
- (void)_updateWithSystemState:(id)a3 forcefully:(BOOL)a4;
- (void)encodeWithCoder:(id)a3;
- (void)isATVRemotePTTEligible;
- (void)setAcousticIdEnabled:(BOOL)a3;
- (void)setActivationDeviceIdentifier:(id)a3;
- (void)setActivationEventInstrumentationIdenifier:(id)a3;
- (void)setAppBundleIdentifier:(id)a3;
- (void)setBulletin:(id)a3;
- (void)setButtonDownTimestamp:(double)a3;
- (void)setCarDNDStatus:(unint64_t)a3;
- (void)setComputedActivationTime:(double)a3;
- (void)setContextAppInfosForSiriViewController:(id)a3;
- (void)setContinuityInfo:(id)a3;
- (void)setCurrentCarPlaySupportedOEMAppIdList:(id)a3;
- (void)setCurrentLockState:(unint64_t)a3;
- (void)setDirectActionApplicationContext:(id)a3;
- (void)setDirectActionEvent:(int64_t)a3;
- (void)setExpectedTimestamp:(double)a3;
- (void)setHomeButtonUpFromBeep:(id)a3;
- (void)setInitialBringUp:(BOOL)a3;
- (void)setInstrumentationEvents:(id)a3;
- (void)setIsConnectedToCarPlay:(BOOL)a3;
- (void)setIsForBluetoothCar:(BOOL)a3;
- (void)setIsForCarDND:(BOOL)a3;
- (void)setIsTVRemoteSourcePTTEligible:(BOOL)a3;
- (void)setLaunchActions:(id)a3;
- (void)setLongPressBehavior:(int64_t)a3;
- (void)setOriginalRequestOptions:(id)a3;
- (void)setPredictedRecordRouteIsZLL:(BOOL)a3;
- (void)setPresentationMode:(int64_t)a3;
- (void)setPreviousInteractionInputType:(int64_t)a3;
- (void)setPreviousTurnIdentifier:(id)a3;
- (void)setPronunciationContext:(id)a3;
- (void)setPronunciationRequest:(BOOL)a3;
- (void)setReleaseAudioSessionOnRecordingCompletion:(BOOL)a3;
- (void)setRequestInfo:(id)a3;
- (void)setRequestSource:(int64_t)a3;
- (void)setRightHandDrive:(BOOL)a3;
- (void)setServerCommandId:(id)a3;
- (void)setShortButtonPressAction:(BOOL)a3;
- (void)setSpeechFileURL:(id)a3;
- (void)setSpeechRequestOptions:(id)a3;
- (void)setStartRecordingSoundId:(id)a3;
- (void)setSupportsCarPlayVehicleData:(BOOL)a3;
- (void)setTestingContext:(id)a3;
- (void)setText:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)setTvRemoteType:(unint64_t)a3;
- (void)setUiPresentationIdentifier:(id)a3;
- (void)setUseAutomaticEndpointing:(BOOL)a3;
- (void)setUseStreamingDictation:(BOOL)a3;
- (void)setUserEngagementContext:(id)a3;
- (void)updateIfNeededWithSystemState:(id)a3;
@end

@implementation SASRequestOptions

- (SASRequestOptions)initWithRequestSource:(int64_t)a3
{
  return [(SASRequestOptions *)self initWithRequestSource:a3 uiPresentationIdentifier:@"com.apple.siri.Compact"];
}

- (SASRequestOptions)initWithRequestSource:(int64_t)a3 uiPresentationIdentifier:(id)a4
{
  return [(SASRequestOptions *)self initWithRequestSource:a3 uiPresentationIdentifier:a4 systemState:0];
}

- (SASRequestOptions)initWithRequestSource:(int64_t)a3 uiPresentationIdentifier:(id)a4 systemState:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SASRequestOptions;
  v11 = [(SASRequestOptions *)&v18 init];
  v12 = v11;
  if (v11)
  {
    v11->_requestSource = a3;
    v13 = [MEMORY[0x1E4F28F80] processInfo];
    [v13 systemUptime];
    v12->_timestamp = v14;

    v12->_useAutomaticEndpointing = 1;
    v12->_acousticIdEnabled = 0;
    objc_storeStrong((id *)&v12->_uiPresentationIdentifier, a4);
    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    instrumentationEvents = v12->_instrumentationEvents;
    v12->_instrumentationEvents = v15;

    [(SASRequestOptions *)v12 _configureStreamingDictationForSource:a3];
    v12->_longPressBehavior = -1;
    if (v10) {
      [(SASRequestOptions *)v12 _updateWithSystemState:v10 forcefully:1];
    }
  }

  return v12;
}

- (SASRequestOptions)initWithRequestSource:(int64_t)a3 uiPresentationIdentifier:(id)a4 buttonContext:(id)a5
{
  id v8 = a5;
  id v9 = [(SASRequestOptions *)self initWithRequestSource:a3 uiPresentationIdentifier:a4 systemState:0];
  if ([MEMORY[0x1E4F4E488] isTVPushToTalkEnabled])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v8;
      uint64_t v11 = [v10 remoteType];
      if ((unint64_t)(v11 - 1) >= 6) {
        uint64_t v12 = 0;
      }
      else {
        uint64_t v12 = v11;
      }
      [(SASRequestOptions *)v9 setTvRemoteType:v12];
      uint64_t v13 = [v10 isPTTEligible];

      [(SASRequestOptions *)v9 setIsTVRemoteSourcePTTEligible:v13];
    }
  }
  double v14 = [v8 activationEventInstrumentationIdentifier];
  [(SASRequestOptions *)v9 setActivationEventInstrumentationIdenifier:v14];

  return v9;
}

- (SASRequestOptions)init
{
  return [(SASRequestOptions *)self initWithRequestSource:0 uiPresentationIdentifier:@"com.apple.siri.Compact"];
}

- (int64_t)requestSource
{
  return self->_requestSource;
}

- (void)setRequestSource:(int64_t)a3
{
  if (a3 == 23)
  {
    if (AFPreferencesTypeToSiriEnabled())
    {
      a3 = 23;
    }
    else
    {
      v4 = *MEMORY[0x1E4F4E360];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_ERROR)) {
        -[SASRequestOptions setRequestSource:](v4);
      }
      a3 = 0;
    }
  }
  self->_requestSource = a3;
}

- (void)_configureStreamingDictationForSource:(int64_t)a3
{
  int v5 = AFPreferencesStreamingDictationEnabled();
  unint64_t v6 = (0x1014105E03FEuLL >> a3) & 1;
  if ((unint64_t)a3 > 0x2C) {
    LODWORD(v6) = 0;
  }
  if (v5) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  [(SASRequestOptions *)self setUseStreamingDictation:v7];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  int64_t v5 = [(SASRequestOptions *)self requestSource];
  unint64_t v6 = [(SASRequestOptions *)self uiPresentationIdentifier];
  uint64_t v7 = (void *)[v4 initWithRequestSource:v5 uiPresentationIdentifier:v6];

  id v8 = [(SASRequestOptions *)self activationDeviceIdentifier];
  [v7 setActivationDeviceIdentifier:v8];

  id v9 = [(SASRequestOptions *)self bulletin];
  [v7 setBulletin:v9];

  id v10 = [(SASRequestOptions *)self appBundleIdentifier];
  [v7 setAppBundleIdentifier:v10];

  objc_msgSend(v7, "setDirectActionEvent:", -[SASRequestOptions directActionEvent](self, "directActionEvent"));
  uint64_t v11 = [(SASRequestOptions *)self directActionApplicationContext];
  [v7 setDirectActionApplicationContext:v11];

  uint64_t v12 = [(SASRequestOptions *)self serverCommandId];
  [v7 setServerCommandId:v12];

  objc_msgSend(v7, "setPronunciationRequest:", -[SASRequestOptions isPronunciationRequest](self, "isPronunciationRequest"));
  uint64_t v13 = [(SASRequestOptions *)self pronunciationContext];
  [v7 setPronunciationContext:v13];

  double v14 = [(SASRequestOptions *)self text];
  [v7 setText:v14];

  v15 = [(SASRequestOptions *)self speechFileURL];
  [v7 setSpeechFileURL:v15];

  [(SASRequestOptions *)self timestamp];
  objc_msgSend(v7, "setTimestamp:");
  [(SASRequestOptions *)self expectedTimestamp];
  objc_msgSend(v7, "setExpectedTimestamp:");
  [(SASRequestOptions *)self buttonDownTimestamp];
  objc_msgSend(v7, "setButtonDownTimestamp:");
  [(SASRequestOptions *)self computedActivationTime];
  objc_msgSend(v7, "setComputedActivationTime:");
  objc_msgSend(v7, "setInitialBringUp:", -[SASRequestOptions isInitialBringUp](self, "isInitialBringUp"));
  objc_msgSend(v7, "setUseAutomaticEndpointing:", -[SASRequestOptions useAutomaticEndpointing](self, "useAutomaticEndpointing"));
  objc_msgSend(v7, "setUseStreamingDictation:", -[SASRequestOptions useStreamingDictation](self, "useStreamingDictation"));
  v16 = [(SASRequestOptions *)self homeButtonUpFromBeep];
  [v7 setHomeButtonUpFromBeep:v16];

  v17 = [(SASRequestOptions *)self continuityInfo];
  [v7 setContinuityInfo:v17];

  objc_super v18 = [(SASRequestOptions *)self requestInfo];
  [v7 setRequestInfo:v18];

  v19 = [(SASRequestOptions *)self speechRequestOptions];
  [v7 setSpeechRequestOptions:v19];

  objc_msgSend(v7, "setAcousticIdEnabled:", -[SASRequestOptions acousticIdEnabled](self, "acousticIdEnabled"));
  objc_msgSend(v7, "setReleaseAudioSessionOnRecordingCompletion:", -[SASRequestOptions releaseAudioSessionOnRecordingCompletion](self, "releaseAudioSessionOnRecordingCompletion"));
  objc_msgSend(v7, "setPredictedRecordRouteIsZLL:", -[SASRequestOptions predictedRecordRouteIsZLL](self, "predictedRecordRouteIsZLL"));
  v20 = [(SASRequestOptions *)self testingContext];
  [v7 setTestingContext:v20];

  objc_msgSend(v7, "setIsConnectedToCarPlay:", -[SASRequestOptions isConnectedToCarPlay](self, "isConnectedToCarPlay"));
  objc_msgSend(v7, "setIsForCarDND:", -[SASRequestOptions isForCarDND](self, "isForCarDND"));
  objc_msgSend(v7, "setCarDNDStatus:", -[SASRequestOptions carDNDStatus](self, "carDNDStatus"));
  objc_msgSend(v7, "setCurrentLockState:", -[SASRequestOptions currentLockState](self, "currentLockState"));
  objc_msgSend(v7, "setPreviousInteractionInputType:", -[SASRequestOptions previousInteractionInputType](self, "previousInteractionInputType"));
  objc_msgSend(v7, "setIsForBluetoothCar:", -[SASRequestOptions isForBluetoothCar](self, "isForBluetoothCar"));
  v21 = [(SASRequestOptions *)self currentCarPlaySupportedOEMAppIdList];
  [v7 setCurrentCarPlaySupportedOEMAppIdList:v21];

  objc_msgSend(v7, "setShortButtonPressAction:", -[SASRequestOptions isShortButtonPressAction](self, "isShortButtonPressAction"));
  v22 = [(SASRequestOptions *)self instrumentationEvents];
  [v7 setInstrumentationEvents:v22];

  v23 = [(SASRequestOptions *)self startRecordingSoundId];
  [v7 setStartRecordingSoundId:v23];

  v24 = [(SASRequestOptions *)self originalRequestOptions];
  [v7 setOriginalRequestOptions:v24];

  objc_msgSend(v7, "setPresentationMode:", -[SASRequestOptions presentationMode](self, "presentationMode"));
  objc_msgSend(v7, "setRightHandDrive:", -[SASRequestOptions isRightHandDrive](self, "isRightHandDrive"));
  objc_msgSend(v7, "setTvRemoteType:", -[SASRequestOptions tvRemoteType](self, "tvRemoteType"));
  objc_msgSend(v7, "setIsTVRemoteSourcePTTEligible:", -[SASRequestOptions isTVRemoteSourcePTTEligible](self, "isTVRemoteSourcePTTEligible"));
  objc_msgSend(v7, "setLongPressBehavior:", -[SASRequestOptions longPressBehavior](self, "longPressBehavior"));
  v25 = [(SASRequestOptions *)self activationEventInstrumentationIdenifier];
  [v7 setActivationEventInstrumentationIdenifier:v25];

  v26 = [(SASRequestOptions *)self userEngagementContext];
  [v7 setUserEngagementContext:v26];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SASRequestOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v67.receiver = self;
  v67.super_class = (Class)SASRequestOptions;
  int64_t v5 = [(SASRequestOptions *)&v67 init];
  if (v5)
  {
    v5->_requestSource = [v4 decodeIntegerForKey:@"SASRequestOptionsSourceCodingKey"];
    unint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SASRequestOptionsActivationDeviceIdentifierCodingKey"];
    uint64_t v7 = [v6 copy];
    activationDeviceIdentifier = v5->_activationDeviceIdentifier;
    v5->_activationDeviceIdentifier = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SASRequestOptionsBulletinCodingKey"];
    bulletin = v5->_bulletin;
    v5->_bulletin = (AFBulletin *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SASRequestOptionsAppBundleIdentifierCodingKey"];
    uint64_t v12 = [v11 copy];
    appBundleIdentifier = v5->_appBundleIdentifier;
    v5->_appBundleIdentifier = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SASRequestOptionsMessagesDirectActionApplicationContextCodingKey"];
    directActionApplicationContext = v5->_directActionApplicationContext;
    v5->_directActionApplicationContext = (AFApplicationContext *)v14;

    v5->_directActionEvent = [v4 decodeIntegerForKey:@"SASRequestOptionsDirectActionEventCodingKey"];
    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SASRequestOptionsServerCommandAceIdentifierCodingKey"];
    uint64_t v17 = [v16 copy];
    serverCommandId = v5->_serverCommandId;
    v5->_serverCommandId = (NSString *)v17;

    v5->_pronunciationRequest = [v4 decodeBoolForKey:@"SASRequestOptionsPronunciationRequestCodingKey"];
    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SASRequestOptionsPronunciationContextCodingKey"];
    pronunciationContext = v5->_pronunciationContext;
    v5->_pronunciationContext = (SASPronunciationContext *)v19;

    v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SASRequestOptionsTextCodingKey"];
    uint64_t v22 = [v21 copy];
    text = v5->_text;
    v5->_text = (NSString *)v22;

    v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SASRequestOptionsSpeechFileURLCodingKey"];
    uint64_t v25 = [v24 copy];
    speechFileURL = v5->_speechFileURL;
    v5->_speechFileURL = (NSURL *)v25;

    [v4 decodeDoubleForKey:@"SASRequestOptionsTimestampCodingKey"];
    v5->_timestamp = v27;
    [v4 decodeDoubleForKey:@"SASRequestOptionsExpectedTimestampCodingKey"];
    v5->_expectedTimestamp = v28;
    [v4 decodeDoubleForKey:@"SASRequestOptionsButtonDownTimestampCodingKey"];
    v5->_buttonDownTimestamp = v29;
    [v4 decodeDoubleForKey:@"SASRequestOptionsComputedActivationTimestampCodingKey"];
    v5->_computedActivationTime = v30;
    v5->_initialBringUp = [v4 decodeBoolForKey:@"SASRequestOptionsIsInitialBringUpKey"];
    v5->_useAutomaticEndpointing = [v4 decodeBoolForKey:@"SASRequestOptionsUseAutomaticEndpointingKey"];
    v5->_useStreamingDictation = [v4 decodeBoolForKey:@"SASRequestOptionsUseStreamingDictationKey"];
    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SASRequestHomeButtonUpFromBeepKey"];
    homeButtonUpFromBeep = v5->_homeButtonUpFromBeep;
    v5->_homeButtonUpFromBeep = (NSNumber *)v31;

    uint64_t v33 = [v4 decodePropertyListForKey:@"SASRequestContinuityDataKey"];
    continuityInfo = v5->_continuityInfo;
    v5->_continuityInfo = (NSDictionary *)v33;

    uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SASRequestRequestInfoKey"];
    requestInfo = v5->_requestInfo;
    v5->_requestInfo = (AFRequestInfo *)v35;

    uint64_t v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SASRequestSpeechRequestOptionsKey"];
    speechRequestOptions = v5->_speechRequestOptions;
    v5->_speechRequestOptions = (AFSpeechRequestOptions *)v37;

    v5->_acousticIdEnabled = [v4 decodeBoolForKey:@"SASRequestOptionsAcousticIdEnabledKey"];
    v5->_releaseAudioSessionOnRecordingCompletion = [v4 decodeBoolForKey:@"SASRequestOptionsReleaseAudioSessionOnRecordingCompletionKey"];
    v5->_predictedRecordRouteIsZLL = [v4 decodeBoolForKey:@"SASRequestPredictedRecordRouteIsZLL"];
    v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SASRequestOptionsUIPresentationIdentifierCodingKey"];
    uint64_t v40 = [v39 copy];
    uiPresentationIdentifier = v5->_uiPresentationIdentifier;
    v5->_uiPresentationIdentifier = (NSString *)v40;

    uint64_t v42 = [v4 decodePropertyListForKey:@"SASRequestOptionsTestingContextKey"];
    testingContext = v5->_testingContext;
    v5->_testingContext = (NSDictionary *)v42;

    v5->_isConnectedToCarPlay = [v4 decodeBoolForKey:@"SASRequestOptionsIsConnectedToCarPlayCodingKey"];
    v5->_supportsCarPlayVehicleData = [v4 decodeBoolForKey:@"SASRequestOptionsSupportsCarPlayVehicleData"];
    v5->_isForCarDND = [v4 decodeBoolForKey:@"SASRequestOptionsIsForCarDNDCodingKey"];
    v5->_carDNDStatus = [v4 decodeIntegerForKey:@"SASRequestOptionsCarDNDStatusCodingKey"];
    v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SASRequestOptionsCurrentLockStateCodingKey"];
    v5->_currentLockState = [v44 unsignedIntegerValue];

    v45 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SASRequestOptionsPreviousInteractionInputTypeCodingKey"];
    v5->_previousInteractionInputType = [v45 unsignedIntegerValue];

    v5->_isForBluetoothCar = [v4 decodeBoolForKey:@"SASRequestOptionsBluetoothCarCodingKey"];
    v46 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v47 = objc_opt_class();
    v48 = objc_msgSend(v46, "setWithObjects:", v47, objc_opt_class(), 0);
    uint64_t v49 = [v4 decodeObjectOfClasses:v48 forKey:@"SASRequestOptionsInstrumentationEventsCodingKey"];
    instrumentationEvents = v5->_instrumentationEvents;
    v5->_instrumentationEvents = (NSMutableArray *)v49;

    v51 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v52 = objc_opt_class();
    v53 = objc_msgSend(v51, "setWithObjects:", v52, objc_opt_class(), 0);
    uint64_t v54 = [v4 decodeObjectOfClasses:v53 forKey:@"SASRequestOptionsCurrentCarPlaySupportedOEMAppIdListKey"];
    currentCarPlaySupportedOEMAppIdList = v5->_currentCarPlaySupportedOEMAppIdList;
    v5->_currentCarPlaySupportedOEMAppIdList = (NSArray *)v54;

    v5->_shortButtonPressAction = [v4 decodeBoolForKey:@"SASRequestOptionsIsTVShortButtonPressAction"];
    uint64_t v56 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SASRequestOptionsStartRecordingSoundIDCodingKey"];
    startRecordingSoundId = v5->_startRecordingSoundId;
    v5->_startRecordingSoundId = (NSString *)v56;

    uint64_t v58 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SASRequestOptionsOriginalOptionsCodingKey"];
    originalRequestOptions = v5->_originalRequestOptions;
    v5->_originalRequestOptions = (SASRequestOptions *)v58;

    v5->_presentationMode = [v4 decodeIntegerForKey:@"SASRequestOptionsPresentationModeCodingKey"];
    uint64_t v60 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SASRequestOptionsPreviousTurnIdentifierCodingKey"];
    previousTurnIdentifier = v5->_previousTurnIdentifier;
    v5->_previousTurnIdentifier = (NSUUID *)v60;

    uint64_t v62 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SASRequestOptionsActivationEventIdentifierCodingKey"];
    activationEventInstrumentationIdenifier = v5->_activationEventInstrumentationIdenifier;
    v5->_activationEventInstrumentationIdenifier = (NSUUID *)v62;

    v5->_rightHandDrive = [v4 decodeBoolForKey:@"SASRequestOptionsIsRightHandDriveKey"];
    v5->_tvRemoteType = [v4 decodeIntegerForKey:@"SASRequestOptionsTVRemoteType"];
    v5->_isRemotePresentationBringUp = [v4 decodeBoolForKey:@"SASRequestOptionsIsRemotePresentationBringUpCodingKey"];
    v5->_isTVRemoteSourcePTTEligible = [v4 decodeBoolForKey:@"SASRequestOptionsIsTVRemoteSourcePTTEligibleCodingKey"];
    v5->_longPressBehavior = [v4 decodeIntegerForKey:@"SASRequestOptionsLongPressBehavior"];
    uint64_t v64 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SASRequestOptionsUserEngagementContextCodingKey"];
    userEngagementContext = v5->_userEngagementContext;
    v5->_userEngagementContext = (SASUserEngagementContext *)v64;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[SASRequestOptions requestSource](self, "requestSource"), @"SASRequestOptionsSourceCodingKey");
  int64_t v5 = [(SASRequestOptions *)self activationDeviceIdentifier];
  [v4 encodeObject:v5 forKey:@"SASRequestOptionsActivationDeviceIdentifierCodingKey"];

  unint64_t v6 = [(SASRequestOptions *)self bulletin];
  [v4 encodeObject:v6 forKey:@"SASRequestOptionsBulletinCodingKey"];

  uint64_t v7 = [(SASRequestOptions *)self appBundleIdentifier];
  [v4 encodeObject:v7 forKey:@"SASRequestOptionsAppBundleIdentifierCodingKey"];

  id v8 = [(SASRequestOptions *)self directActionApplicationContext];
  [v4 encodeObject:v8 forKey:@"SASRequestOptionsMessagesDirectActionApplicationContextCodingKey"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[SASRequestOptions directActionEvent](self, "directActionEvent"), @"SASRequestOptionsDirectActionEventCodingKey");
  uint64_t v9 = [(SASRequestOptions *)self serverCommandId];
  [v4 encodeObject:v9 forKey:@"SASRequestOptionsServerCommandAceIdentifierCodingKey"];

  objc_msgSend(v4, "encodeBool:forKey:", -[SASRequestOptions isPronunciationRequest](self, "isPronunciationRequest"), @"SASRequestOptionsPronunciationRequestCodingKey");
  id v10 = [(SASRequestOptions *)self pronunciationContext];
  [v4 encodeObject:v10 forKey:@"SASRequestOptionsPronunciationContextCodingKey"];

  uint64_t v11 = [(SASRequestOptions *)self text];
  [v4 encodeObject:v11 forKey:@"SASRequestOptionsTextCodingKey"];

  uint64_t v12 = [(SASRequestOptions *)self speechFileURL];
  [v4 encodeObject:v12 forKey:@"SASRequestOptionsSpeechFileURLCodingKey"];

  [(SASRequestOptions *)self timestamp];
  objc_msgSend(v4, "encodeDouble:forKey:", @"SASRequestOptionsTimestampCodingKey");
  [(SASRequestOptions *)self expectedTimestamp];
  objc_msgSend(v4, "encodeDouble:forKey:", @"SASRequestOptionsExpectedTimestampCodingKey");
  [(SASRequestOptions *)self buttonDownTimestamp];
  objc_msgSend(v4, "encodeDouble:forKey:", @"SASRequestOptionsButtonDownTimestampCodingKey");
  [(SASRequestOptions *)self computedActivationTime];
  objc_msgSend(v4, "encodeDouble:forKey:", @"SASRequestOptionsComputedActivationTimestampCodingKey");
  objc_msgSend(v4, "encodeBool:forKey:", -[SASRequestOptions isInitialBringUp](self, "isInitialBringUp"), @"SASRequestOptionsIsInitialBringUpKey");
  objc_msgSend(v4, "encodeBool:forKey:", -[SASRequestOptions useStreamingDictation](self, "useStreamingDictation"), @"SASRequestOptionsUseStreamingDictationKey");
  uint64_t v13 = [(SASRequestOptions *)self homeButtonUpFromBeep];
  [v4 encodeObject:v13 forKey:@"SASRequestHomeButtonUpFromBeepKey"];

  uint64_t v14 = [(SASRequestOptions *)self continuityInfo];
  [v4 encodeObject:v14 forKey:@"SASRequestContinuityDataKey"];

  v15 = [(SASRequestOptions *)self requestInfo];
  [v4 encodeObject:v15 forKey:@"SASRequestRequestInfoKey"];

  objc_msgSend(v4, "encodeBool:forKey:", -[SASRequestOptions useAutomaticEndpointing](self, "useAutomaticEndpointing"), @"SASRequestOptionsUseAutomaticEndpointingKey");
  v16 = [(SASRequestOptions *)self speechRequestOptions];
  [v4 encodeObject:v16 forKey:@"SASRequestSpeechRequestOptionsKey"];

  objc_msgSend(v4, "encodeBool:forKey:", -[SASRequestOptions acousticIdEnabled](self, "acousticIdEnabled"), @"SASRequestOptionsAcousticIdEnabledKey");
  objc_msgSend(v4, "encodeBool:forKey:", -[SASRequestOptions releaseAudioSessionOnRecordingCompletion](self, "releaseAudioSessionOnRecordingCompletion"), @"SASRequestOptionsReleaseAudioSessionOnRecordingCompletionKey");
  objc_msgSend(v4, "encodeBool:forKey:", -[SASRequestOptions predictedRecordRouteIsZLL](self, "predictedRecordRouteIsZLL"), @"SASRequestPredictedRecordRouteIsZLL");
  uint64_t v17 = [(SASRequestOptions *)self uiPresentationIdentifier];
  [v4 encodeObject:v17 forKey:@"SASRequestOptionsUIPresentationIdentifierCodingKey"];

  objc_super v18 = [(SASRequestOptions *)self testingContext];
  [v4 encodeObject:v18 forKey:@"SASRequestOptionsTestingContextKey"];

  objc_msgSend(v4, "encodeBool:forKey:", -[SASRequestOptions isConnectedToCarPlay](self, "isConnectedToCarPlay"), @"SASRequestOptionsIsConnectedToCarPlayCodingKey");
  objc_msgSend(v4, "encodeBool:forKey:", -[SASRequestOptions supportsCarPlayVehicleData](self, "supportsCarPlayVehicleData"), @"SASRequestOptionsSupportsCarPlayVehicleData");
  objc_msgSend(v4, "encodeBool:forKey:", -[SASRequestOptions isForCarDND](self, "isForCarDND"), @"SASRequestOptionsIsForCarDNDCodingKey");
  objc_msgSend(v4, "encodeInteger:forKey:", -[SASRequestOptions carDNDStatus](self, "carDNDStatus"), @"SASRequestOptionsCarDNDStatusCodingKey");
  uint64_t v19 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[SASRequestOptions currentLockState](self, "currentLockState"));
  [v4 encodeObject:v19 forKey:@"SASRequestOptionsCurrentLockStateCodingKey"];

  v20 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[SASRequestOptions previousInteractionInputType](self, "previousInteractionInputType"));
  [v4 encodeObject:v20 forKey:@"SASRequestOptionsPreviousInteractionInputTypeCodingKey"];

  objc_msgSend(v4, "encodeBool:forKey:", -[SASRequestOptions isForBluetoothCar](self, "isForBluetoothCar"), @"SASRequestOptionsBluetoothCarCodingKey");
  v21 = [(SASRequestOptions *)self instrumentationEvents];
  [v4 encodeObject:v21 forKey:@"SASRequestOptionsInstrumentationEventsCodingKey"];

  uint64_t v22 = [(SASRequestOptions *)self currentCarPlaySupportedOEMAppIdList];
  [v4 encodeObject:v22 forKey:@"SASRequestOptionsCurrentCarPlaySupportedOEMAppIdListKey"];

  objc_msgSend(v4, "encodeBool:forKey:", -[SASRequestOptions isShortButtonPressAction](self, "isShortButtonPressAction"), @"SASRequestOptionsIsTVShortButtonPressAction");
  v23 = [(SASRequestOptions *)self startRecordingSoundId];
  [v4 encodeObject:v23 forKey:@"SASRequestOptionsStartRecordingSoundIDCodingKey"];

  v24 = [(SASRequestOptions *)self originalRequestOptions];
  [v4 encodeObject:v24 forKey:@"SASRequestOptionsOriginalOptionsCodingKey"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[SASRequestOptions presentationMode](self, "presentationMode"), @"SASRequestOptionsPresentationModeCodingKey");
  uint64_t v25 = [(SASRequestOptions *)self previousTurnIdentifier];
  [v4 encodeObject:v25 forKey:@"SASRequestOptionsPreviousTurnIdentifierCodingKey"];

  v26 = [(SASRequestOptions *)self activationEventInstrumentationIdenifier];
  [v4 encodeObject:v26 forKey:@"SASRequestOptionsActivationEventIdentifierCodingKey"];

  objc_msgSend(v4, "encodeBool:forKey:", -[SASRequestOptions isRightHandDrive](self, "isRightHandDrive"), @"SASRequestOptionsIsRightHandDriveKey");
  objc_msgSend(v4, "encodeInteger:forKey:", -[SASRequestOptions tvRemoteType](self, "tvRemoteType"), @"SASRequestOptionsTVRemoteType");
  objc_msgSend(v4, "encodeBool:forKey:", -[SASRequestOptions isRemotePresentationBringUp](self, "isRemotePresentationBringUp"), @"SASRequestOptionsIsRemotePresentationBringUpCodingKey");
  objc_msgSend(v4, "encodeBool:forKey:", -[SASRequestOptions isTVRemoteSourcePTTEligible](self, "isTVRemoteSourcePTTEligible"), @"SASRequestOptionsIsTVRemoteSourcePTTEligibleCodingKey");
  objc_msgSend(v4, "encodeInteger:forKey:", -[SASRequestOptions longPressBehavior](self, "longPressBehavior"), @"SASRequestOptionsLongPressBehavior");
  id v27 = [(SASRequestOptions *)self userEngagementContext];
  [v4 encodeObject:v27 forKey:@"SASRequestOptionsUserEngagementContextCodingKey"];
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v4 = objc_opt_class();
  int64_t v5 = SASRequestSourceGetName([(SASRequestOptions *)self requestSource]);
  unint64_t v6 = [v3 stringWithFormat:@"<%@ %p requestSource=%@", v4, self, v5];;

  uint64_t v7 = [(SASRequestOptions *)self activationDeviceIdentifier];

  if (v7)
  {
    id v8 = [(SASRequestOptions *)self activationDeviceIdentifier];
    [v6 appendFormat:@";activationDeviceIdentifier=%@", v8];
  }
  uint64_t v9 = [(SASRequestOptions *)self bulletin];

  if (v9)
  {
    id v10 = [(SASRequestOptions *)self bulletin];
    [v6 appendFormat:@";bulletin=%@", v10];
  }
  uint64_t v11 = [(SASRequestOptions *)self appBundleIdentifier];

  if (v11)
  {
    uint64_t v12 = [(SASRequestOptions *)self appBundleIdentifier];
    [v6 appendFormat:@";appBundleIdentifier=%@", v12];
  }
  [(SASRequestOptions *)self directActionEvent];
  uint64_t v13 = AFDirectActionEventGetName();
  [v6 appendFormat:@";directActionEvent=%@", v13];

  uint64_t v14 = [(SASRequestOptions *)self serverCommandId];

  if (v14)
  {
    v15 = [(SASRequestOptions *)self serverCommandId];
    [v6 appendFormat:@";serverCommandId=%@", v15];
  }
  objc_msgSend(v6, "appendFormat:", @";isPronunciationRequest=%i",
    [(SASRequestOptions *)self isPronunciationRequest]);
  v16 = [(SASRequestOptions *)self pronunciationContext];

  if (v16)
  {
    uint64_t v17 = [(SASRequestOptions *)self pronunciationContext];
    [v6 appendFormat:@";pronunciationContext=%@", v17];
  }
  objc_super v18 = [(SASRequestOptions *)self text];

  if (v18)
  {
    uint64_t v19 = [(SASRequestOptions *)self text];
    [v6 appendFormat:@";text=%@", v19];
  }
  v20 = [(SASRequestOptions *)self speechFileURL];

  if (v20)
  {
    v21 = [(SASRequestOptions *)self speechFileURL];
    [v6 appendFormat:@";speechFileURL=%@", v21];
  }
  [(SASRequestOptions *)self expectedTimestamp];
  uint64_t v23 = v22;
  [(SASRequestOptions *)self timestamp];
  uint64_t v25 = v24;
  [(SASRequestOptions *)self buttonDownTimestamp];
  uint64_t v27 = v26;
  [(SASRequestOptions *)self computedActivationTime];
  objc_msgSend(v6, "appendFormat:", @";expectedTimestamp=%0.1f;timestamp=%0.1f;buttonDownTimestamp=%0.1f;computedActivationTime=%0.1f;isInitialBringUp=%i;useAutomaticEndpointing=%i;useStreamingDictation=%i;acousticId=%i;releaseAudioSessionORC=%i;predictedZLL=%i",
    v23,
    v25,
    v27,
    v28,
    [(SASRequestOptions *)self isInitialBringUp],
    [(SASRequestOptions *)self useAutomaticEndpointing],
    [(SASRequestOptions *)self useStreamingDictation],
    [(SASRequestOptions *)self acousticIdEnabled],
    [(SASRequestOptions *)self releaseAudioSessionOnRecordingCompletion],
    [(SASRequestOptions *)self predictedRecordRouteIsZLL]);
  double v29 = [(SASRequestOptions *)self uiPresentationIdentifier];

  if (v29)
  {
    double v30 = [(SASRequestOptions *)self uiPresentationIdentifier];
    [v6 appendFormat:@";uiPresentationIdentifier=%@", v30];
  }
  uint64_t v31 = [(SASRequestOptions *)self testingContext];

  if (v31)
  {
    v32 = [(SASRequestOptions *)self testingContext];
    [v6 appendFormat:@";testingContext=%@", v32];
  }
  BOOL v62 = [(SASRequestOptions *)self inputType] == 2;
  BOOL v33 = [(SASRequestOptions *)self inputType] == 1;
  BOOL v34 = [(SASRequestOptions *)self isForStark];
  BOOL v35 = [(SASRequestOptions *)self isConnectedToCarPlay];
  BOOL v36 = [(SASRequestOptions *)self isForCarDND];
  BOOL v37 = [(SASRequestOptions *)self isRightHandDrive];
  BOOL v38 = [(SASRequestOptions *)self isForBluetoothCar];
  v39 = CARAutomaticFeatureStateGetName([(SASRequestOptions *)self carDNDStatus]);
  objc_msgSend(v6, "appendFormat:", @";is(speech=%i; textInput=%i;stark=%i;CPconnected=%i;dnd=%i;rightHandDrive=%i;isForBluetoothCar=%i);carDNDStatus=%@;remotePresentationBringUp=%i;supportsCarPlayVehicleData=%i",
    v62,
    v33,
    v34,
    v35,
    v36,
    v37,
    v38,
    v39,
    [(SASRequestOptions *)self isRemotePresentationBringUp],
    [(SASRequestOptions *)self supportsCarPlayVehicleData]);

  uint64_t v40 = [(SASRequestOptions *)self homeButtonUpFromBeep];

  if (v40)
  {
    v41 = [(SASRequestOptions *)self homeButtonUpFromBeep];
    [v6 appendFormat:@";homeButtonUpFromBeep=%@", v41];
  }
  uint64_t v42 = [(SASRequestOptions *)self continuityInfo];

  if (v42)
  {
    v43 = [(SASRequestOptions *)self continuityInfo];
    [v6 appendFormat:@";continuityInfo=%@", v43];
  }
  v44 = [(SASRequestOptions *)self requestInfo];

  if (v44)
  {
    v45 = [(SASRequestOptions *)self requestInfo];
    [v6 appendFormat:@";requestInfo=%@", v45];
  }
  v46 = SASLockStateGetName([(SASRequestOptions *)self currentLockState]);
  [v6 appendFormat:@";currentLockState=%@", v46];

  int64_t v47 = [(SASRequestOptions *)self previousInteractionInputType];
  if ((unint64_t)(v47 - 1) > 2) {
    v48 = @"SASRequestInputTypeNone";
  }
  else {
    v48 = *(&off_1E6B68380 + v47 - 1);
  }
  [v6 appendFormat:@";previousInteractionInputType=%@", v48];
  uint64_t v49 = [(SASRequestOptions *)self directActionApplicationContext];

  if (v49)
  {
    v50 = [(SASRequestOptions *)self directActionApplicationContext];
    [v6 appendFormat:@";directActionApplicationContext=%@", v50];
  }
  v51 = [(SASRequestOptions *)self currentCarPlaySupportedOEMAppIdList];

  if (v51)
  {
    uint64_t v52 = [(SASRequestOptions *)self currentCarPlaySupportedOEMAppIdList];
    [v6 appendFormat:@";carPlayOEMList=%@", v52];
  }
  objc_msgSend(v6, "appendFormat:", @";isShortButtonPressAction=%i",
    [(SASRequestOptions *)self isShortButtonPressAction]);
  v53 = [(SASRequestOptions *)self startRecordingSoundId];

  if (v53)
  {
    uint64_t v54 = [(SASRequestOptions *)self startRecordingSoundId];
    [v6 appendFormat:@";startRecordingSoundId=%@", v54];
  }
  v55 = [(SASRequestOptions *)self originalRequestOptions];

  if (v55)
  {
    uint64_t v56 = [(SASRequestOptions *)self originalRequestOptions];
    v57 = SASRequestSourceGetName([v56 requestSource]);
    [v6 appendFormat:@";originalRequestOptions.requestSource=%@", v57];
  }
  if ([(SASRequestOptions *)self presentationMode]) {
    objc_msgSend(v6, "appendFormat:", @";presentationMode=%zd",
  }
      [(SASRequestOptions *)self presentationMode]);
  if ([(SASRequestOptions *)self tvRemoteType])
  {
    uint64_t v58 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[SASRequestOptions tvRemoteType](self, "tvRemoteType"));
    [v6 appendFormat:@";tvRemoteType=%@", v58];
  }
  objc_msgSend(v6, "appendFormat:", @";isTVRemoteSourcePTTEligible=%i",
    [(SASRequestOptions *)self isTVRemoteSourcePTTEligible]);
  objc_msgSend(v6, "appendFormat:", @";longPressBehavior=%ld",
    [(SASRequestOptions *)self longPressBehavior]);
  v59 = [(SASRequestOptions *)self userEngagementContext];
  uint64_t v60 = [v59 description];
  [v6 appendFormat:@";userEngagementContext=%@>", v60];

  return v6;
}

- (int64_t)inputType
{
  if (-[SASRequestOptions _isTypeToSiriPermittedAndEnabledForRequestOptions](self, "_isTypeToSiriPermittedAndEnabledForRequestOptions")|| [MEMORY[0x1E4F4E638] isSAEEnabled]&& -[SASRequestOptions requestSource](self, "requestSource") == 32)
  {
    return 1;
  }
  if ([(SASRequestOptions *)self _isForSpeechRequest]) {
    return 2;
  }
  if ([(SASRequestOptions *)self requestSource] == 53) {
    return 3;
  }
  return 0;
}

- (BOOL)_isForSpeechRequest
{
  unint64_t v3 = [(SASRequestOptions *)self requestSource];
  BOOL v4 = [(SASRequestOptions *)self isAnnounceRequest];
  if (v3 <= 0x25 && ((1 << v3) & 0x2000006000) != 0
    || (v3 == 42 ? (char v7 = 1) : (char v7 = v4),
        (v7 & 1) != 0
     || [(SASRequestOptions *)self requestSource] == 18
     && ![(SASRequestOptions *)self isH1Activation]
     || [(SASRequestOptions *)self requestSource] == 21))
  {
    BOOL v5 = 1;
  }
  else
  {
    id v8 = [(SASRequestOptions *)self text];
    if ([v8 length])
    {
      BOOL v5 = 1;
    }
    else
    {
      uint64_t v9 = [(SASRequestOptions *)self speechFileURL];
      id v10 = [v9 absoluteString];
      BOOL v5 = [v10 length]
        || [(SASRequestOptions *)self requestSource] == 23
        || [(SASRequestOptions *)self _isTypeToSiriPermittedAndEnabledForRequestOptions]|| [(SASRequestOptions *)self requestSource] == 35|| [(SASRequestOptions *)self requestSource] == 39|| [(SASRequestOptions *)self requestSource] == 53;
    }
  }
  return !v5;
}

- (BOOL)isForAppleTV
{
  v2 = [(SASRequestOptions *)self uiPresentationIdentifier];
  char v3 = [v2 isEqualToString:@"com.apple.siri.SiriTVPresentation"];

  return v3;
}

- (BOOL)isSuggestionSourceWithTextInput
{
  return [(SASRequestOptions *)self requestSource] == 50
      && [(SASRequestOptions *)self previousInteractionInputType] == 1;
}

- (BOOL)isForStark
{
  char v3 = [(SASRequestOptions *)self uiPresentationIdentifier];
  if ([v3 isEqualToString:@"com.apple.siri.CarDisplay"])
  {
    char v4 = 1;
  }
  else
  {
    BOOL v5 = [(SASRequestOptions *)self uiPresentationIdentifier];
    char v4 = [v5 isEqualToString:@"com.apple.siri.CarDisplay.UIFree"];
  }
  return v4;
}

- (BOOL)isForEyesFree
{
  v2 = [(SASRequestOptions *)self uiPresentationIdentifier];
  char v3 = [v2 isEqualToString:@"com.apple.siri.EyesFree"];

  return v3;
}

- (BOOL)isForUIFree
{
  char v3 = [(SASRequestOptions *)self uiPresentationIdentifier];
  if ([v3 isEqualToString:@"com.apple.siri.UIFree"])
  {
    char v4 = 1;
  }
  else
  {
    BOOL v5 = [(SASRequestOptions *)self uiPresentationIdentifier];
    char v4 = [v5 isEqualToString:@"com.apple.siri.CarDisplay.UIFree"];
  }
  return v4;
}

- (BOOL)isAnnounceRequest
{
  int64_t v2 = [(SASRequestOptions *)self requestSource];
  return v2 == 37 || (v2 & 0xFFFFFFFFFFFFFFFELL) == 40;
}

- (BOOL)isRequestMadeWithPhysicalDeviceInteraction
{
  unint64_t v2 = [(SASRequestOptions *)self requestSource];
  return (v2 > 0x37) | (0x37880F1890000EuLL >> v2) & 1;
}

- (BOOL)userTypedInSiri
{
  BOOL v3 = [(SASRequestOptions *)self isSuggestionSourceWithTextInput];
  if ([(SASRequestOptions *)self requestSource] == 32) {
    return 1;
  }
  if ([(SASRequestOptions *)self requestSource] == 23) {
    return 1;
  }
  return v3;
}

- (BOOL)isVoiceTriggerRequest
{
  BOOL v3 = [(SASRequestOptions *)self requestInfo];
  char v4 = [v3 speechRequestOptions];
  uint64_t v5 = [v4 activationEvent];

  if ([(SASRequestOptions *)self requestSource] == 8) {
    return 1;
  }
  return [(SASRequestOptions *)self requestSource] == 18 && v5 == 15;
}

- (BOOL)isInAutoPrompt
{
  return [(SASRequestOptions *)self requestSource] == 9;
}

- (BOOL)isFlexibleFollowupRequest
{
  return [(SASRequestOptions *)self requestSource] == 38;
}

- (id)nullableProperties
{
  unint64_t v2 = [[SASRequestOptionsNullableAccess alloc] initWithActivationDeviceIdentifier:self->_activationDeviceIdentifier requestInfo:self->_requestInfo];
  return v2;
}

- (BOOL)isWiredMicOrBTHeadsetOrWx
{
  unint64_t v3 = [(SASRequestOptions *)self requestSource];
  BOOL v4 = v3 == 18 && [(SASRequestOptions *)self isH1Activation];
  return (v3 < 0x2E) & (0x240000000030uLL >> v3) | v4;
}

- (BOOL)isH1Activation
{
  unint64_t v2 = [(SASRequestOptions *)self requestInfo];
  unint64_t v3 = [v2 speechRequestOptions];
  unint64_t v4 = [v3 activationEvent];

  return (v4 < 0x23) & (0x40002C000uLL >> v4);
}

- (BOOL)isHTTRequestSource
{
  unint64_t v2 = [(SASRequestOptions *)self requestSource];
  return (v2 < 0x2C) & (0x810F0430C06uLL >> v2);
}

- (BOOL)isATVRemotePTTEligible
{
  if (!MGGetBoolAnswer()
    || (v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.siri.internal"], int v4 = objc_msgSend(v3, "BOOLForKey:", @"ForcePTTEligibility"), v3, !v4))
  {
    if ([(SASRequestOptions *)self requestSource] == 22
      || [(SASRequestOptions *)self requestSource] == 30
      || [(SASRequestOptions *)self requestSource] == 31)
    {
      int v6 = [MEMORY[0x1E4F4E488] isTVPushToTalkEnabled];
      if (!v6) {
        return v6;
      }
      unint64_t v7 = [(SASRequestOptions *)self tvRemoteType];
      if (v7 - 5 < 2)
      {
        int v6 = _os_feature_enabled_impl();
        if (!v6) {
          return v6;
        }
        goto LABEL_14;
      }
      if (v7 == 1)
      {
LABEL_14:
        LOBYTE(v6) = self->_isTVRemoteSourcePTTEligible;
        return v6;
      }
    }
    LOBYTE(v6) = 0;
    return v6;
  }
  uint64_t v5 = *MEMORY[0x1E4F4E360];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEBUG)) {
    -[SASRequestOptions isATVRemotePTTEligible](v5);
  }
  LOBYTE(v6) = 1;
  return v6;
}

- (void)updateIfNeededWithSystemState:(id)a3
{
}

- (void)_updateWithSystemState:(id)a3 forcefully:(BOOL)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unint64_t v7 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v8 = [v6 isConnectedToCarPlay];
  if (a4)
  {
    [(SASRequestOptions *)self setIsConnectedToCarPlay:v8];
    -[SASRequestOptions setSupportsCarPlayVehicleData:](self, "setSupportsCarPlayVehicleData:", [v6 supportsCarPlayVehicleData]);
    -[SASRequestOptions setRightHandDrive:](self, "setRightHandDrive:", [v6 isRightHandDrive]);
    -[SASRequestOptions setIsForCarDND:](self, "setIsForCarDND:", [v6 carDNDActive]);
    -[SASRequestOptions setCarDNDStatus:](self, "setCarDNDStatus:", [v6 carDNDStatus]);
    uint64_t v9 = [v6 currentCarPlaySupportedOEMAppIdList];
    [(SASRequestOptions *)self setCurrentCarPlaySupportedOEMAppIdList:v9];
  }
  else
  {
    if (v8 != [(SASRequestOptions *)self isConnectedToCarPlay])
    {
      [(SASRequestOptions *)self setIsConnectedToCarPlay:v8];
      [v7 addObject:@"isConnectedToCarPlay"];
    }
    uint64_t v10 = [v6 supportsCarPlayVehicleData];
    if (v10 != [(SASRequestOptions *)self supportsCarPlayVehicleData])
    {
      [(SASRequestOptions *)self setSupportsCarPlayVehicleData:v10];
      [v7 addObject:@"supportsCarPlayVehicleData"];
    }
    uint64_t v11 = [v6 isRightHandDrive];
    if (v11 != [(SASRequestOptions *)self isRightHandDrive])
    {
      [(SASRequestOptions *)self setRightHandDrive:v11];
      [v7 addObject:@"rightHandDrive"];
    }
    uint64_t v12 = [v6 carDNDActive];
    if (v12 != [(SASRequestOptions *)self isForCarDND])
    {
      [(SASRequestOptions *)self setIsForCarDND:v12];
      [v7 addObject:@"isForCarDND"];
    }
    uint64_t v13 = [v6 carDNDStatus];
    if ([(SASRequestOptions *)self carDNDStatus] != v13)
    {
      [(SASRequestOptions *)self setCarDNDStatus:v13];
      [v7 addObject:@"carDNDStatus"];
    }
    uint64_t v9 = [v6 currentCarPlaySupportedOEMAppIdList];
    uint64_t v14 = [(SASRequestOptions *)self currentCarPlaySupportedOEMAppIdList];
    char v15 = [v14 isEqualToArray:v9];

    if ((v15 & 1) == 0)
    {
      [(SASRequestOptions *)self setCurrentCarPlaySupportedOEMAppIdList:v9];
      [v7 addObject:@"currentCarPlaySupportedOEMAppIdList"];
    }
  }
  if ([v7 count])
  {
    v16 = *MEMORY[0x1E4F4E360];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E360], OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315394;
      objc_super v18 = "-[SASRequestOptions _updateWithSystemState:forcefully:]";
      __int16 v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_1D9588000, v16, OS_LOG_TYPE_DEFAULT, "%s #activation Updated properties from system state: %@", (uint8_t *)&v17, 0x16u);
    }
  }
}

- (BOOL)_isTypeToSiriPermittedAndEnabledForRequestOptions
{
  if (AFPreferencesTypeToSiriEnabled()) {
    int v3 = [MEMORY[0x1E4F4E638] isSAEEnabled] ^ 1;
  }
  else {
    int v3 = 0;
  }
  if ([(SASRequestOptions *)self requestSource] == 32) {
    char v4 = [MEMORY[0x1E4F4E638] isSAEEnabled];
  }
  else {
    char v4 = 0;
  }
  BOOL v6 = [(SASRequestOptions *)self requestSource] == 47
    || ([(SASRequestOptions *)self requestSource] == 23 ? (char v5 = 1) : (char v5 = v4),
        (v5 & 1) != 0
     || [(SASRequestOptions *)self requestSource] == 49
     || [(SASRequestOptions *)self isSuggestionSourceWithTextInput]
     || [(SASRequestOptions *)self requestSource] == 52
     || [(SASRequestOptions *)self requestSource] == 54)
    || [(SASRequestOptions *)self requestSource] == 55;
  BOOL v7 = [(SASRequestOptions *)self isForStark];
  BOOL v8 = [(SASRequestOptions *)self requestSource] == 8
    || [(SASRequestOptions *)self requestSource] == 9;
  BOOL v9 = [(SASRequestOptions *)self isH1Activation]
    || [(SASRequestOptions *)self requestSource] == 5;
  int64_t v10 = [(SASRequestOptions *)self requestSource];
  BOOL v11 = [(SASRequestOptions *)self isForEyesFree];
  BOOL result = 0;
  if ((((v3 | v6) ^ 1 | (v7 || v8)) & 1) == 0 && !v9)
  {
    BOOL v13 = !v11;
    return v10 != 4 && v13;
  }
  return result;
}

- (NSString)activationDeviceIdentifier
{
  return self->_activationDeviceIdentifier;
}

- (void)setActivationDeviceIdentifier:(id)a3
{
}

- (AFBulletin)bulletin
{
  return self->_bulletin;
}

- (void)setBulletin:(id)a3
{
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (void)setAppBundleIdentifier:(id)a3
{
}

- (AFApplicationContext)directActionApplicationContext
{
  return self->_directActionApplicationContext;
}

- (void)setDirectActionApplicationContext:(id)a3
{
}

- (int64_t)directActionEvent
{
  return self->_directActionEvent;
}

- (void)setDirectActionEvent:(int64_t)a3
{
  self->_directActionEvent = a3;
}

- (NSString)serverCommandId
{
  return self->_serverCommandId;
}

- (void)setServerCommandId:(id)a3
{
}

- (BOOL)isPronunciationRequest
{
  return self->_pronunciationRequest;
}

- (void)setPronunciationRequest:(BOOL)a3
{
  self->_pronunciationRequest = a3;
}

- (SASPronunciationContext)pronunciationContext
{
  return self->_pronunciationContext;
}

- (void)setPronunciationContext:(id)a3
{
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (NSURL)speechFileURL
{
  return self->_speechFileURL;
}

- (void)setSpeechFileURL:(id)a3
{
}

- (double)expectedTimestamp
{
  return self->_expectedTimestamp;
}

- (void)setExpectedTimestamp:(double)a3
{
  self->_expectedTimestamp = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (double)buttonDownTimestamp
{
  return self->_buttonDownTimestamp;
}

- (void)setButtonDownTimestamp:(double)a3
{
  self->_buttonDownTimestamp = a3;
}

- (double)computedActivationTime
{
  return self->_computedActivationTime;
}

- (void)setComputedActivationTime:(double)a3
{
  self->_computedActivationTime = a3;
}

- (BOOL)isForBluetoothCar
{
  return self->_isForBluetoothCar;
}

- (void)setIsForBluetoothCar:(BOOL)a3
{
  self->_isForBluetoothCar = a3;
}

- (int64_t)longPressBehavior
{
  return self->_longPressBehavior;
}

- (void)setLongPressBehavior:(int64_t)a3
{
  self->_longPressBehavior = a3;
}

- (NSArray)currentCarPlaySupportedOEMAppIdList
{
  return self->_currentCarPlaySupportedOEMAppIdList;
}

- (void)setCurrentCarPlaySupportedOEMAppIdList:(id)a3
{
}

- (BOOL)isForCarDND
{
  return self->_isForCarDND;
}

- (void)setIsForCarDND:(BOOL)a3
{
  self->_isForCarDND = a3;
}

- (BOOL)isConnectedToCarPlay
{
  return self->_isConnectedToCarPlay;
}

- (void)setIsConnectedToCarPlay:(BOOL)a3
{
  self->_isConnectedToCarPlay = a3;
}

- (unint64_t)carDNDStatus
{
  return self->_carDNDStatus;
}

- (void)setCarDNDStatus:(unint64_t)a3
{
  self->_carDNDStatus = a3;
}

- (BOOL)supportsCarPlayVehicleData
{
  return self->_supportsCarPlayVehicleData;
}

- (void)setSupportsCarPlayVehicleData:(BOOL)a3
{
  self->_supportsCarPlayVehicleData = a3;
}

- (BOOL)isRightHandDrive
{
  return self->_rightHandDrive;
}

- (void)setRightHandDrive:(BOOL)a3
{
  self->_rightHandDrive = a3;
}

- (BOOL)isInitialBringUp
{
  return self->_initialBringUp;
}

- (void)setInitialBringUp:(BOOL)a3
{
  self->_initialBringUp = a3;
}

- (BOOL)useAutomaticEndpointing
{
  return self->_useAutomaticEndpointing;
}

- (void)setUseAutomaticEndpointing:(BOOL)a3
{
  self->_useAutomaticEndpointing = a3;
}

- (BOOL)useStreamingDictation
{
  return self->_useStreamingDictation;
}

- (void)setUseStreamingDictation:(BOOL)a3
{
  self->_useStreamingDictation = a3;
}

- (NSNumber)homeButtonUpFromBeep
{
  return self->_homeButtonUpFromBeep;
}

- (void)setHomeButtonUpFromBeep:(id)a3
{
}

- (NSDictionary)continuityInfo
{
  return self->_continuityInfo;
}

- (void)setContinuityInfo:(id)a3
{
}

- (AFRequestInfo)requestInfo
{
  return self->_requestInfo;
}

- (void)setRequestInfo:(id)a3
{
}

- (AFSpeechRequestOptions)speechRequestOptions
{
  return self->_speechRequestOptions;
}

- (void)setSpeechRequestOptions:(id)a3
{
}

- (BOOL)acousticIdEnabled
{
  return self->_acousticIdEnabled;
}

- (void)setAcousticIdEnabled:(BOOL)a3
{
  self->_acousticIdEnabled = a3;
}

- (BOOL)releaseAudioSessionOnRecordingCompletion
{
  return self->_releaseAudioSessionOnRecordingCompletion;
}

- (void)setReleaseAudioSessionOnRecordingCompletion:(BOOL)a3
{
  self->_releaseAudioSessionOnRecordingCompletion = a3;
}

- (BOOL)predictedRecordRouteIsZLL
{
  return self->_predictedRecordRouteIsZLL;
}

- (void)setPredictedRecordRouteIsZLL:(BOOL)a3
{
  self->_predictedRecordRouteIsZLL = a3;
}

- (BOOL)isRemotePresentationBringUp
{
  return self->_isRemotePresentationBringUp;
}

- (NSString)uiPresentationIdentifier
{
  return self->_uiPresentationIdentifier;
}

- (void)setUiPresentationIdentifier:(id)a3
{
}

- (NSMutableArray)instrumentationEvents
{
  return self->_instrumentationEvents;
}

- (void)setInstrumentationEvents:(id)a3
{
}

- (NSUUID)previousTurnIdentifier
{
  return self->_previousTurnIdentifier;
}

- (void)setPreviousTurnIdentifier:(id)a3
{
}

- (NSArray)contextAppInfosForSiriViewController
{
  return self->_contextAppInfosForSiriViewController;
}

- (void)setContextAppInfosForSiriViewController:(id)a3
{
}

- (NSDictionary)testingContext
{
  return self->_testingContext;
}

- (void)setTestingContext:(id)a3
{
}

- (unint64_t)currentLockState
{
  return self->_currentLockState;
}

- (void)setCurrentLockState:(unint64_t)a3
{
  self->_currentLockState = a3;
}

- (int64_t)previousInteractionInputType
{
  return self->_previousInteractionInputType;
}

- (void)setPreviousInteractionInputType:(int64_t)a3
{
  self->_previousInteractionInputType = a3;
}

- (NSUUID)activationEventInstrumentationIdenifier
{
  return self->_activationEventInstrumentationIdenifier;
}

- (void)setActivationEventInstrumentationIdenifier:(id)a3
{
}

- (NSString)startRecordingSoundId
{
  return self->_startRecordingSoundId;
}

- (void)setStartRecordingSoundId:(id)a3
{
}

- (BOOL)isShortButtonPressAction
{
  return self->_shortButtonPressAction;
}

- (void)setShortButtonPressAction:(BOOL)a3
{
  self->_shortButtonPressAction = a3;
}

- (SASRequestOptions)originalRequestOptions
{
  return self->_originalRequestOptions;
}

- (void)setOriginalRequestOptions:(id)a3
{
}

- (int64_t)presentationMode
{
  return self->_presentationMode;
}

- (void)setPresentationMode:(int64_t)a3
{
  self->_presentationMode = a3;
}

- (unint64_t)tvRemoteType
{
  return self->_tvRemoteType;
}

- (void)setTvRemoteType:(unint64_t)a3
{
  self->_tvRemoteType = a3;
}

- (BOOL)isTVRemoteSourcePTTEligible
{
  return self->_isTVRemoteSourcePTTEligible;
}

- (void)setIsTVRemoteSourcePTTEligible:(BOOL)a3
{
  self->_isTVRemoteSourcePTTEligible = a3;
}

- (SASUserEngagementContext)userEngagementContext
{
  return self->_userEngagementContext;
}

- (void)setUserEngagementContext:(id)a3
{
}

- (NSSet)launchActions
{
  return self->_launchActions;
}

- (void)setLaunchActions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchActions, 0);
  objc_storeStrong((id *)&self->_userEngagementContext, 0);
  objc_storeStrong((id *)&self->_originalRequestOptions, 0);
  objc_storeStrong((id *)&self->_startRecordingSoundId, 0);
  objc_storeStrong((id *)&self->_activationEventInstrumentationIdenifier, 0);
  objc_storeStrong((id *)&self->_testingContext, 0);
  objc_storeStrong((id *)&self->_contextAppInfosForSiriViewController, 0);
  objc_storeStrong((id *)&self->_previousTurnIdentifier, 0);
  objc_storeStrong((id *)&self->_instrumentationEvents, 0);
  objc_storeStrong((id *)&self->_uiPresentationIdentifier, 0);
  objc_storeStrong((id *)&self->_speechRequestOptions, 0);
  objc_storeStrong((id *)&self->_requestInfo, 0);
  objc_storeStrong((id *)&self->_continuityInfo, 0);
  objc_storeStrong((id *)&self->_homeButtonUpFromBeep, 0);
  objc_storeStrong((id *)&self->_currentCarPlaySupportedOEMAppIdList, 0);
  objc_storeStrong((id *)&self->_speechFileURL, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_pronunciationContext, 0);
  objc_storeStrong((id *)&self->_serverCommandId, 0);
  objc_storeStrong((id *)&self->_directActionApplicationContext, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_bulletin, 0);
  objc_storeStrong((id *)&self->_activationDeviceIdentifier, 0);
}

- (void)setRequestSource:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  unint64_t v2 = "-[SASRequestOptions setRequestSource:]";
  _os_log_error_impl(&dword_1D9588000, log, OS_LOG_TYPE_ERROR, "%s #activation Cannot set requestSource to SASRequestSourceKeyboard when keyboard input is disabled", (uint8_t *)&v1, 0xCu);
}

- (void)isATVRemotePTTEligible
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  unint64_t v2 = "-[SASRequestOptions isATVRemotePTTEligible]";
  _os_log_debug_impl(&dword_1D9588000, log, OS_LOG_TYPE_DEBUG, "%s #ptt Overriding Siri's eligibility to true", (uint8_t *)&v1, 0xCu);
}

@end