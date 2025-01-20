@interface SBCaptureButtonInteraction
+ (id)fromString:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)launched;
- (BOOL)mitigated;
- (NSArray)responseLogs;
- (SBCaptureButtonBehaviorsResponse)response;
- (SBCaptureButtonContext)context;
- (SBCaptureButtonInteraction)initWithContext:(id)a3 response:(id)a4 responseLogs:(id)a5;
- (SBCaptureButtonInteraction)initWithDictionary:(id)a3;
- (id)JSONString;
- (id)_coreAnalyticsDictionaryRepresentation;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)intention;
- (unint64_t)launchIntentDecidingBehavior;
- (void)logToCoreAnalytics;
- (void)setIntention:(unint64_t)a3;
@end

@implementation SBCaptureButtonInteraction

- (SBCaptureButtonInteraction)initWithContext:(id)a3 response:(id)a4 responseLogs:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SBCaptureButtonInteraction;
  v12 = [(SBCaptureButtonInteraction *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_context, a3);
    objc_storeStrong((id *)&v13->_response, a4);
    objc_storeStrong((id *)&v13->_responseLogs, a5);
    v13->_intention = 0;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  context = self->_context;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __38__SBCaptureButtonInteraction_isEqual___block_invoke;
  v20[3] = &unk_1E6AF9E90;
  id v7 = v4;
  id v21 = v7;
  id v8 = (id)[v5 appendObject:context counterpart:v20];
  response = self->_response;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __38__SBCaptureButtonInteraction_isEqual___block_invoke_2;
  v18[3] = &unk_1E6AF9E90;
  id v10 = v7;
  id v19 = v10;
  id v11 = (id)[v5 appendObject:response counterpart:v18];
  responseLogs = self->_responseLogs;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __38__SBCaptureButtonInteraction_isEqual___block_invoke_3;
  v16[3] = &unk_1E6AF9E90;
  id v17 = v10;
  id v13 = v10;
  id v14 = (id)[v5 appendObject:responseLogs counterpart:v16];
  LOBYTE(responseLogs) = [v5 isEqual];

  return (char)responseLogs;
}

id __38__SBCaptureButtonInteraction_isEqual___block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 8);
}

id __38__SBCaptureButtonInteraction_isEqual___block_invoke_2(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 16);
}

id __38__SBCaptureButtonInteraction_isEqual___block_invoke_3(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 24);
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendObject:self->_context];
  id v5 = (id)[v3 appendObject:self->_response];
  id v6 = (id)[v3 appendObject:self->_responseLogs];
  unint64_t v7 = [v3 hash];

  return v7;
}

- (SBCaptureButtonInteraction)initWithDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [SBCaptureButtonContext alloc];
  id v6 = [v4 objectForKeyedSubscript:@"Context"];
  unint64_t v7 = [(SBCaptureButtonContext *)v5 initWithDictionary:v6];
  id v8 = [SBCaptureButtonBehaviorsResponse alloc];
  id v9 = [v4 objectForKeyedSubscript:@"Response"];
  id v10 = [(SBCaptureButtonBehaviorsResponse *)v8 initWithDictionary:v9];
  id v11 = [v4 objectForKeyedSubscript:@"ResponseLogs"];
  v12 = objc_msgSend(v11, "bs_compactMap:", &__block_literal_global_235);
  id v13 = [(SBCaptureButtonInteraction *)self initWithContext:v7 response:v10 responseLogs:v12];

  id v14 = [v4 objectForKeyedSubscript:@"Intentional"];

  -[SBCaptureButtonInteraction setIntention:](v13, "setIntention:", [v14 integerValue]);
  return v13;
}

SBCaptureButtonBehaviorsResponseLog *__49__SBCaptureButtonInteraction_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[SBCaptureButtonBehaviorsResponseLog alloc] initWithDictionary:v2];

  return v3;
}

- (id)dictionaryRepresentation
{
  v11[5] = *MEMORY[0x1E4F143B8];
  v10[0] = @"Context";
  v3 = [(SBCaptureButtonContext *)self->_context dictionaryRepresentation];
  v11[0] = v3;
  v10[1] = @"ComputedContext";
  id v4 = [(SBCaptureButtonContext *)self->_context computedContext];
  v11[1] = v4;
  v10[2] = @"Response";
  id v5 = [(SBCaptureButtonBehaviorsResponse *)self->_response dictionaryRepresentation];
  v11[2] = v5;
  v10[3] = @"ResponseLogs";
  id v6 = [(NSArray *)self->_responseLogs bs_compactMap:&__block_literal_global_22_1];
  v11[3] = v6;
  v10[4] = @"Intentional";
  unint64_t v7 = [NSNumber numberWithUnsignedInteger:self->_intention];
  v11[4] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:5];

  return v8;
}

uint64_t __54__SBCaptureButtonInteraction_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 dictionaryRepresentation];
}

- (id)JSONString
{
  id v2 = [(SBCaptureButtonInteraction *)self dictionaryRepresentation];
  v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:2 error:0];
  id v4 = (void *)[[NSString alloc] initWithData:v3 encoding:4];

  return v4;
}

+ (id)fromString:(id)a3
{
  v3 = [a3 dataUsingEncoding:4];
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v3 options:0 error:0];
  id v5 = [[SBCaptureButtonInteraction alloc] initWithDictionary:v4];

  return v5;
}

- (void)logToCoreAnalytics
{
}

uint64_t __48__SBCaptureButtonInteraction_logToCoreAnalytics__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _coreAnalyticsDictionaryRepresentation];
}

- (id)_coreAnalyticsDictionaryRepresentation
{
  v88[42] = *MEMORY[0x1E4F143B8];
  v87[0] = @"allowLaunchIfUnobstructedPromptlyAfterButtonUp";
  v3 = NSNumber;
  v86 = [(SBCaptureButtonContext *)self->_context policy];
  v85 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v86, "launchIfUnobstructedPromptlyAfterButtonUpEnabled"));
  v88[0] = v85;
  v87[1] = @"allowLaunchIfUnobstructedWhileButtonDown";
  id v4 = NSNumber;
  v84 = [(SBCaptureButtonContext *)self->_context policy];
  v83 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(v84, "launchIfUnobstructedWhileButtonDownEnabled"));
  v88[1] = v83;
  v87[2] = @"backlightState";
  v82 = objc_msgSend(NSNumber, "numberWithInteger:", -[SBCaptureButtonContext backlightState](self->_context, "backlightState"));
  v88[2] = v82;
  v87[3] = @"buttonEvent";
  v81 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SBCaptureButtonContext event](self->_context, "event"));
  v88[3] = v81;
  v87[4] = @"cameraLaunchIntent";
  v80 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SBCaptureButtonBehaviorsResponse launchIntent](self->_response, "launchIntent"));
  v88[4] = v80;
  v87[5] = @"cameraLaunchIntentDecider";
  v79 = SBCaptureButtonBehaviorIdentifierDescription([(SBCaptureButtonInteraction *)self launchIntentDecidingBehavior]);
  v88[5] = v79;
  v87[6] = @"cameraPrewarmed";
  v78 = objc_msgSend(NSNumber, "numberWithBool:", -[SBCaptureButtonContext cameraPrewarmed](self->_context, "cameraPrewarmed"));
  v88[6] = v78;
  v87[7] = @"coachIntent";
  v77 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SBCaptureButtonBehaviorsResponse coachIntent](self->_response, "coachIntent"));
  v88[7] = v77;
  v87[8] = @"connectedToWirelessCharger";
  v76 = objc_msgSend(NSNumber, "numberWithBool:", -[SBCaptureButtonContext isConnectedToWirelessCharger](self->_context, "isConnectedToWirelessCharger"));
  v88[8] = v76;
  v87[9] = @"consoleModeMitigationEnabled";
  id v5 = NSNumber;
  v75 = [(SBCaptureButtonContext *)self->_context policy];
  v74 = objc_msgSend(v5, "numberWithBool:", objc_msgSend(v75, "consoleModeMitigationEnabled"));
  v88[9] = v74;
  v87[10] = @"deviceAngleX";
  id v6 = NSNumber;
  v73 = [(SBCaptureButtonContext *)self->_context gravity];
  [v73 x];
  v72 = objc_msgSend(v6, "numberWithDouble:");
  v88[10] = v72;
  v87[11] = @"deviceAngleY";
  unint64_t v7 = NSNumber;
  v71 = [(SBCaptureButtonContext *)self->_context gravity];
  [v71 y];
  v70 = objc_msgSend(v7, "numberWithDouble:");
  v88[11] = v70;
  v87[12] = @"deviceAngleZ";
  id v8 = NSNumber;
  v69 = [(SBCaptureButtonContext *)self->_context gravity];
  [v69 z];
  v68 = objc_msgSend(v8, "numberWithDouble:");
  v88[12] = v68;
  v87[13] = @"deviceOrientation";
  v67 = objc_msgSend(NSNumber, "numberWithInteger:", -[SBCaptureButtonContext deviceOrientation](self->_context, "deviceOrientation"));
  v88[13] = v67;
  v87[14] = @"deviceStationaryDetectionEnabled";
  id v9 = NSNumber;
  v66 = [(SBCaptureButtonContext *)self->_context policy];
  v65 = objc_msgSend(v9, "numberWithBool:", objc_msgSend(v66, "deviceStationaryDetectionEnabled"));
  v88[14] = v65;
  v87[15] = @"deviceStationaryDetectionEnabledWhenUnlocked";
  id v10 = NSNumber;
  v64 = [(SBCaptureButtonContext *)self->_context policy];
  v63 = objc_msgSend(v10, "numberWithBool:", objc_msgSend(v64, "deviceStationaryDetectionEnabledWhenUnlocked"));
  v88[15] = v63;
  v87[16] = @"deviceStationaryDetectionStationaryDebounceInterval";
  id v11 = NSNumber;
  v62 = [(SBCaptureButtonContext *)self->_context policy];
  [v62 deviceStationaryDetectionStationaryDebounceInterval];
  v61 = objc_msgSend(v11, "numberWithDouble:");
  v88[16] = v61;
  v87[17] = @"deviceStationaryDetectionStationaryPickUpBuffer";
  v12 = NSNumber;
  v60 = [(SBCaptureButtonContext *)self->_context policy];
  [v60 deviceStationaryDetectionStationaryPickUpBuffer];
  v59 = objc_msgSend(v12, "numberWithDouble:");
  v88[17] = v59;
  v87[18] = @"deviceStationaryDetectionStationaryThreshold";
  id v13 = NSNumber;
  v58 = [(SBCaptureButtonContext *)self->_context policy];
  [v58 deviceStationaryDetectionStationaryThreshold];
  v57 = objc_msgSend(v13, "numberWithDouble:");
  v88[18] = v57;
  v87[19] = @"directLaunchAfterUnsuppressEnabled";
  id v14 = NSNumber;
  v56 = [(SBCaptureButtonContext *)self->_context policy];
  v55 = objc_msgSend(v14, "numberWithBool:", objc_msgSend(v56, "directLaunchAfterUnsuppressEnabled"));
  v88[19] = v55;
  v87[20] = @"directLaunchAfterUnsuppressGracePeriod";
  objc_super v15 = NSNumber;
  v54 = [(SBCaptureButtonContext *)self->_context policy];
  [v54 directLaunchAfterUnsuppressGracePeriod];
  v53 = objc_msgSend(v15, "numberWithDouble:");
  v88[20] = v53;
  v87[21] = @"captureAppBundleID";
  uint64_t v16 = [(SBCaptureButtonContext *)self->_context captureAppBundleID];
  v52 = (void *)v16;
  if (v16) {
    id v17 = (__CFString *)v16;
  }
  else {
    id v17 = &stru_1F3084718;
  }
  v88[21] = v17;
  v87[22] = @"foregroundAppBundleID";
  v51 = [(SBCaptureButtonContext *)self->_context foregroundAppBundleID];
  uint64_t v18 = objc_msgSend(v51, "sb_filteredFirstPartyAppBundleID");
  v50 = (void *)v18;
  if (v18) {
    id v19 = (__CFString *)v18;
  }
  else {
    id v19 = &stru_1F3084718;
  }
  v88[22] = v19;
  v87[23] = @"inAmbientPresentationMode";
  v49 = objc_msgSend(NSNumber, "numberWithBool:", -[SBCaptureButtonContext isInAmbientPresentationMode](self->_context, "isInAmbientPresentationMode"));
  v88[23] = v49;
  v87[24] = @"inGameMode";
  v48 = objc_msgSend(NSNumber, "numberWithBool:", -[SBCaptureButtonContext inGameMode](self->_context, "inGameMode"));
  v88[24] = v48;
  v87[25] = @"inGameModeStreakCount";
  v47 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SBCaptureButtonContext inGameModeStreakCount](self->_context, "inGameModeStreakCount"));
  v88[25] = v47;
  v87[26] = @"inCameraPose";
  v46 = objc_msgSend(NSNumber, "numberWithBool:", -[SBCaptureButtonContext inCameraPose](self->_context, "inCameraPose"));
  v88[26] = v46;
  v87[27] = @"launchClickCount";
  v45 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SBCaptureButtonContext gesture](self->_context, "gesture"));
  v88[27] = v45;
  v87[28] = @"prewarmIntent";
  v44 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SBCaptureButtonBehaviorsResponse prewarmIntent](self->_response, "prewarmIntent"));
  v88[28] = v44;
  v87[29] = @"suppressedOnButtonDown";
  v43 = objc_msgSend(NSNumber, "numberWithBool:", -[SBCaptureButtonContext suppressedOnButtonDown](self->_context, "suppressedOnButtonDown"));
  v88[29] = v43;
  v87[30] = @"suppressionState";
  v42 = objc_msgSend(NSNumber, "numberWithInteger:", -[SBCaptureButtonContext suppressionState](self->_context, "suppressionState"));
  v88[30] = v42;
  v87[31] = @"timeSinceLastNonStationary";
  v20 = NSNumber;
  [(SBCaptureButtonContext *)self->_context timeSinceLastNonStationary];
  v41 = objc_msgSend(v20, "numberWithDouble:");
  v88[31] = v41;
  v87[32] = @"timeSinceLastStationary";
  id v21 = NSNumber;
  [(SBCaptureButtonContext *)self->_context timeSinceLastStationary];
  v40 = objc_msgSend(v21, "numberWithDouble:");
  v88[32] = v40;
  v87[33] = @"timeSinceLastStationarySquelch";
  v22 = NSNumber;
  [(SBCaptureButtonContext *)self->_context timeSinceLastStationarySquelch];
  v39 = objc_msgSend(v22, "numberWithDouble:");
  v88[33] = v39;
  v87[34] = @"timeSinceLastViewUnobstructed";
  v23 = NSNumber;
  [(SBCaptureButtonContext *)self->_context timeSinceLastViewUnobstructed];
  v24 = objc_msgSend(v23, "numberWithDouble:");
  v88[34] = v24;
  v87[35] = @"lowLatencyTimeSinceLastStationary";
  v25 = NSNumber;
  [(SBCaptureButtonContext *)self->_context lowLatencyTimeSinceLastStationary];
  v26 = objc_msgSend(v25, "numberWithDouble:");
  v88[35] = v26;
  v87[36] = @"lowLatencyTimeSinceLastNonStationary";
  v27 = NSNumber;
  [(SBCaptureButtonContext *)self->_context lowLatencyTimeSinceLastNonStationary];
  v28 = objc_msgSend(v27, "numberWithDouble:");
  v88[36] = v28;
  v87[37] = @"uiLocked";
  v29 = objc_msgSend(NSNumber, "numberWithBool:", -[SBCaptureButtonContext uiLocked](self->_context, "uiLocked"));
  v88[37] = v29;
  v87[38] = @"wakeEnabled";
  v30 = NSNumber;
  v31 = [(SBCaptureButtonContext *)self->_context policy];
  v32 = objc_msgSend(v30, "numberWithBool:", objc_msgSend(v31, "wakeEnabled"));
  v88[38] = v32;
  v87[39] = @"wakeIntent";
  v33 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SBCaptureButtonBehaviorsResponse wakeIntent](self->_response, "wakeIntent"));
  v88[39] = v33;
  v87[40] = @"intention";
  v34 = [NSNumber numberWithUnsignedInteger:self->_intention];
  v88[40] = v34;
  v87[41] = @"pressDuration";
  v35 = NSNumber;
  [(SBCaptureButtonContext *)self->_context pressDuration];
  v36 = objc_msgSend(v35, "numberWithDouble:");
  v88[41] = v36;
  v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v88 forKeys:v87 count:42];

  return v37;
}

- (SBCaptureButtonContext)context
{
  return self->_context;
}

- (SBCaptureButtonBehaviorsResponse)response
{
  return self->_response;
}

- (NSArray)responseLogs
{
  return self->_responseLogs;
}

- (unint64_t)intention
{
  return self->_intention;
}

- (void)setIntention:(unint64_t)a3
{
  self->_intention = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseLogs, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (BOOL)launched
{
  id v2 = [(SBCaptureButtonInteraction *)self response];
  BOOL v3 = [v2 launchIntent] == 2;

  return v3;
}

- (BOOL)mitigated
{
  id v2 = [(SBCaptureButtonInteraction *)self response];
  BOOL v3 = [v2 launchIntent] == 1;

  return v3;
}

- (unint64_t)launchIntentDecidingBehavior
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v3 = self->_responseLogs;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "response", (void)v13);
        uint64_t v11 = [v10 launchIntent];

        if (v11 && v11 == [(SBCaptureButtonBehaviorsResponse *)self->_response launchIntent]) {
          unint64_t v6 = [v9 behaviorIdentifier];
        }
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

@end