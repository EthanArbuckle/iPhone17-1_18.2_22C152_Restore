@interface SBCaptureButtonContext
+ (id)defaultContext;
+ (id)defaultGravity;
+ (id)defaultPolicy;
+ (id)defaultRotationRate;
- (BOOL)cameraPrewarmed;
- (BOOL)inCameraPose;
- (BOOL)inGameMode;
- (BOOL)isConnectedToWirelessCharger;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInAmbientPresentationMode;
- (BOOL)isPrewarmLockoutActive;
- (BOOL)isScreenOn;
- (BOOL)isSuppressed;
- (BOOL)isVoiceOverScreenCurtainActive;
- (BOOL)isWithinDirectLaunchGracePeriod;
- (BOOL)shouldSuspendLaunchOnButtonDown;
- (BOOL)suppressedOnButtonDown;
- (BOOL)uiLocked;
- (NSString)captureAppBundleID;
- (NSString)description;
- (NSString)foregroundAppBundleID;
- (SBCaptureButtonContext)initWithDictionary:(id)a3;
- (SBCaptureButtonContext)initWithEvent:(unint64_t)a3 gesture:(unint64_t)a4 machAbsoluteTimestamp:(unint64_t)a5 consoleModeActive:(BOOL)a6 consoleModeActiveStreakCount:(unint64_t)a7 backlightState:(int64_t)a8 timeSinceLastViewUnobstructed:(double)a9 uiLocked:(BOOL)a10 timeSinceLastStationary:(double)a11 timeSinceLastNonStationary:(double)a12 timeSinceLastStationarySquelch:(double)a13 lowLatencyTimeSinceLastStationary:(double)a14 lowLatencyTimeSinceLastNonStationary:(double)a15 inCameraPose:(BOOL)a16 gravity:(id)a17 rotationRate:(id)a18 deviceOrientation:(int64_t)a19 policy:(id)a20 cameraPrewarmed:(BOOL)a21 suppressedOnButtonDown:(BOOL)a22 suppressionState:(int64_t)a23 prewarmLockoutActive:(BOOL)a24 captureAppBundleID:(id)a25 pressDuration:(double)a26 foregroundAppBundleID:(id)a27 inAmbientPresentationMode:(BOOL)a28 connectedToWirelessCharger:(BOOL)a29 voiceOverScreenCurtainActive:(BOOL)a30;
- (SBCaptureButtonPolicy)policy;
- (SBDeviceMotionVector)gravity;
- (SBDeviceMotionVector)rotationRate;
- (double)lowLatencyTimeSinceLastNonStationary;
- (double)lowLatencyTimeSinceLastStationary;
- (double)pressDuration;
- (double)timeSinceLastNonStationary;
- (double)timeSinceLastStationary;
- (double)timeSinceLastStationarySquelch;
- (double)timeSinceLastViewUnobstructed;
- (id)computedContext;
- (id)dictionaryRepresentation;
- (int64_t)backlightState;
- (int64_t)deviceOrientation;
- (int64_t)stationaryState;
- (int64_t)suppressionState;
- (unint64_t)event;
- (unint64_t)gesture;
- (unint64_t)hash;
- (unint64_t)inGameModeStreakCount;
- (unint64_t)machAbsoluteTimestamp;
- (void)setBacklightState:(int64_t)a3;
- (void)setCameraPrewarmed:(BOOL)a3;
- (void)setCaptureAppBundleID:(id)a3;
- (void)setConnectedToWirelessCharger:(BOOL)a3;
- (void)setDeviceOrientation:(int64_t)a3;
- (void)setEvent:(unint64_t)a3;
- (void)setForegroundAppBundleID:(id)a3;
- (void)setGesture:(unint64_t)a3;
- (void)setGravity:(id)a3;
- (void)setInAmbientPresentationMode:(BOOL)a3;
- (void)setInCameraPose:(BOOL)a3;
- (void)setInGameMode:(BOOL)a3;
- (void)setInGameModeStreakCount:(unint64_t)a3;
- (void)setLowLatencyTimeSinceLastNonStationary:(double)a3;
- (void)setLowLatencyTimeSinceLastStationary:(double)a3;
- (void)setMachAbsoluteTimestamp:(unint64_t)a3;
- (void)setPolicy:(id)a3;
- (void)setPressDuration:(double)a3;
- (void)setPrewarmLockoutActive:(BOOL)a3;
- (void)setRotationRate:(id)a3;
- (void)setSuppressedOnButtonDown:(BOOL)a3;
- (void)setSuppressionState:(int64_t)a3;
- (void)setTimeSinceLastNonStationary:(double)a3;
- (void)setTimeSinceLastStationary:(double)a3;
- (void)setTimeSinceLastStationarySquelch:(double)a3;
- (void)setTimeSinceLastViewUnobstructed:(double)a3;
- (void)setUiLocked:(BOOL)a3;
- (void)setVoiceOverScreenCurtainActive:(BOOL)a3;
@end

@implementation SBCaptureButtonContext

- (SBCaptureButtonContext)initWithEvent:(unint64_t)a3 gesture:(unint64_t)a4 machAbsoluteTimestamp:(unint64_t)a5 consoleModeActive:(BOOL)a6 consoleModeActiveStreakCount:(unint64_t)a7 backlightState:(int64_t)a8 timeSinceLastViewUnobstructed:(double)a9 uiLocked:(BOOL)a10 timeSinceLastStationary:(double)a11 timeSinceLastNonStationary:(double)a12 timeSinceLastStationarySquelch:(double)a13 lowLatencyTimeSinceLastStationary:(double)a14 lowLatencyTimeSinceLastNonStationary:(double)a15 inCameraPose:(BOOL)a16 gravity:(id)a17 rotationRate:(id)a18 deviceOrientation:(int64_t)a19 policy:(id)a20 cameraPrewarmed:(BOOL)a21 suppressedOnButtonDown:(BOOL)a22 suppressionState:(int64_t)a23 prewarmLockoutActive:(BOOL)a24 captureAppBundleID:(id)a25 pressDuration:(double)a26 foregroundAppBundleID:(id)a27 inAmbientPresentationMode:(BOOL)a28 connectedToWirelessCharger:(BOOL)a29 voiceOverScreenCurtainActive:(BOOL)a30
{
  id v38 = a17;
  id v39 = a18;
  id v40 = a20;
  id v41 = a25;
  id v51 = a27;
  v52.receiver = self;
  v52.super_class = (Class)SBCaptureButtonContext;
  v42 = [(SBCaptureButtonContext *)&v52 init];
  v43 = v42;
  if (v42)
  {
    v42->_machAbsoluteTimestamp = a5;
    v42->_event = a3;
    v42->_inGameMode = a6;
    v42->_gesture = a4;
    v42->_inGameModeStreakCount = a7;
    v42->_backlightState = a8;
    v42->_uiLocked = a10;
    v42->_timeSinceLastViewUnobstructed = a9;
    v42->_timeSinceLastStationary = a11;
    v42->_timeSinceLastNonStationary = a12;
    v42->_timeSinceLastStationarySquelch = a13;
    v42->_lowLatencyTimeSinceLastStationary = a14;
    v42->_lowLatencyTimeSinceLastNonStationary = a15;
    v42->_inCameraPose = a16;
    objc_storeStrong((id *)&v42->_gravity, a17);
    objc_storeStrong((id *)&v43->_rotationRate, a18);
    v43->_deviceOrientation = a19;
    objc_storeStrong((id *)&v43->_policy, a20);
    v43->_cameraPrewarmed = a21;
    v43->_suppressedOnButtonDown = a22;
    v43->_suppressionState = a23;
    v43->_prewarmLockoutActive = a24;
    objc_storeStrong((id *)&v43->_captureAppBundleID, a25);
    v43->_pressDuration = a26;
    objc_storeStrong((id *)&v43->_foregroundAppBundleID, a27);
    v43->_inAmbientPresentationMode = a28;
    v43->_connectedToWirelessCharger = a29;
    v43->_voiceOverScreenCurtainActive = a30;
  }

  return v43;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  unint64_t event = self->_event;
  v148[0] = MEMORY[0x1E4F143A8];
  v148[1] = 3221225472;
  v148[2] = __34__SBCaptureButtonContext_isEqual___block_invoke;
  v148[3] = &unk_1E6AF9660;
  id v7 = v4;
  id v149 = v7;
  id v8 = (id)[v5 appendInteger:event counterpart:v148];
  unint64_t gesture = self->_gesture;
  v146[0] = MEMORY[0x1E4F143A8];
  v146[1] = 3221225472;
  v146[2] = __34__SBCaptureButtonContext_isEqual___block_invoke_2;
  v146[3] = &unk_1E6AF9660;
  id v10 = v7;
  id v147 = v10;
  id v11 = (id)[v5 appendInteger:gesture counterpart:v146];
  unint64_t machAbsoluteTimestamp = self->_machAbsoluteTimestamp;
  v144[0] = MEMORY[0x1E4F143A8];
  v144[1] = 3221225472;
  v144[2] = __34__SBCaptureButtonContext_isEqual___block_invoke_3;
  v144[3] = &unk_1E6AF9660;
  id v13 = v10;
  id v145 = v13;
  id v14 = (id)[v5 appendInt64:machAbsoluteTimestamp counterpart:v144];
  BOOL inGameMode = self->_inGameMode;
  v142[0] = MEMORY[0x1E4F143A8];
  v142[1] = 3221225472;
  v142[2] = __34__SBCaptureButtonContext_isEqual___block_invoke_4;
  v142[3] = &unk_1E6AF99E8;
  id v16 = v13;
  id v143 = v16;
  id v17 = (id)[v5 appendBool:inGameMode counterpart:v142];
  unint64_t inGameModeStreakCount = self->_inGameModeStreakCount;
  v140[0] = MEMORY[0x1E4F143A8];
  v140[1] = 3221225472;
  v140[2] = __34__SBCaptureButtonContext_isEqual___block_invoke_5;
  v140[3] = &unk_1E6AF9660;
  id v19 = v16;
  id v141 = v19;
  id v20 = (id)[v5 appendInteger:inGameModeStreakCount counterpart:v140];
  int64_t backlightState = self->_backlightState;
  v138[0] = MEMORY[0x1E4F143A8];
  v138[1] = 3221225472;
  v138[2] = __34__SBCaptureButtonContext_isEqual___block_invoke_6;
  v138[3] = &unk_1E6AF9660;
  id v22 = v19;
  id v139 = v22;
  id v23 = (id)[v5 appendInteger:backlightState counterpart:v138];
  double timeSinceLastViewUnobstructed = self->_timeSinceLastViewUnobstructed;
  v136[0] = MEMORY[0x1E4F143A8];
  v136[1] = 3221225472;
  v136[2] = __34__SBCaptureButtonContext_isEqual___block_invoke_7;
  v136[3] = &unk_1E6AFD028;
  id v25 = v22;
  id v137 = v25;
  id v26 = (id)[v5 appendDouble:v136 counterpart:timeSinceLastViewUnobstructed];
  BOOL uiLocked = self->_uiLocked;
  v134[0] = MEMORY[0x1E4F143A8];
  v134[1] = 3221225472;
  v134[2] = __34__SBCaptureButtonContext_isEqual___block_invoke_8;
  v134[3] = &unk_1E6AF99E8;
  id v28 = v25;
  id v135 = v28;
  id v29 = (id)[v5 appendBool:uiLocked counterpart:v134];
  double timeSinceLastStationary = self->_timeSinceLastStationary;
  v132[0] = MEMORY[0x1E4F143A8];
  v132[1] = 3221225472;
  v132[2] = __34__SBCaptureButtonContext_isEqual___block_invoke_9;
  v132[3] = &unk_1E6AFD028;
  id v31 = v28;
  id v133 = v31;
  id v32 = (id)[v5 appendDouble:v132 counterpart:timeSinceLastStationary];
  double timeSinceLastNonStationary = self->_timeSinceLastNonStationary;
  v130[0] = MEMORY[0x1E4F143A8];
  v130[1] = 3221225472;
  v130[2] = __34__SBCaptureButtonContext_isEqual___block_invoke_10;
  v130[3] = &unk_1E6AFD028;
  id v34 = v31;
  id v131 = v34;
  id v35 = (id)[v5 appendDouble:v130 counterpart:timeSinceLastNonStationary];
  double timeSinceLastStationarySquelch = self->_timeSinceLastStationarySquelch;
  v128[0] = MEMORY[0x1E4F143A8];
  v128[1] = 3221225472;
  v128[2] = __34__SBCaptureButtonContext_isEqual___block_invoke_11;
  v128[3] = &unk_1E6AFD028;
  id v37 = v34;
  id v129 = v37;
  id v38 = (id)[v5 appendDouble:v128 counterpart:timeSinceLastStationarySquelch];
  double lowLatencyTimeSinceLastStationary = self->_lowLatencyTimeSinceLastStationary;
  v126[0] = MEMORY[0x1E4F143A8];
  v126[1] = 3221225472;
  v126[2] = __34__SBCaptureButtonContext_isEqual___block_invoke_12;
  v126[3] = &unk_1E6AFD028;
  id v40 = v37;
  id v127 = v40;
  id v41 = (id)[v5 appendDouble:v126 counterpart:lowLatencyTimeSinceLastStationary];
  double lowLatencyTimeSinceLastNonStationary = self->_lowLatencyTimeSinceLastNonStationary;
  v124[0] = MEMORY[0x1E4F143A8];
  v124[1] = 3221225472;
  v124[2] = __34__SBCaptureButtonContext_isEqual___block_invoke_13;
  v124[3] = &unk_1E6AFD028;
  id v43 = v40;
  id v125 = v43;
  id v44 = (id)[v5 appendDouble:v124 counterpart:lowLatencyTimeSinceLastNonStationary];
  BOOL inCameraPose = self->_inCameraPose;
  v122[0] = MEMORY[0x1E4F143A8];
  v122[1] = 3221225472;
  v122[2] = __34__SBCaptureButtonContext_isEqual___block_invoke_14;
  v122[3] = &unk_1E6AF99E8;
  id v46 = v43;
  id v123 = v46;
  id v47 = (id)[v5 appendBool:inCameraPose counterpart:v122];
  gravity = self->_gravity;
  v120[0] = MEMORY[0x1E4F143A8];
  v120[1] = 3221225472;
  v120[2] = __34__SBCaptureButtonContext_isEqual___block_invoke_15;
  v120[3] = &unk_1E6AF9E90;
  id v49 = v46;
  id v121 = v49;
  id v50 = (id)[v5 appendObject:gravity counterpart:v120];
  rotationRate = self->_rotationRate;
  v118[0] = MEMORY[0x1E4F143A8];
  v118[1] = 3221225472;
  v118[2] = __34__SBCaptureButtonContext_isEqual___block_invoke_16;
  v118[3] = &unk_1E6AF9E90;
  id v52 = v49;
  id v119 = v52;
  id v53 = (id)[v5 appendObject:rotationRate counterpart:v118];
  policy = self->_policy;
  v116[0] = MEMORY[0x1E4F143A8];
  v116[1] = 3221225472;
  v116[2] = __34__SBCaptureButtonContext_isEqual___block_invoke_17;
  v116[3] = &unk_1E6AF9E90;
  id v55 = v52;
  id v117 = v55;
  id v56 = (id)[v5 appendObject:policy counterpart:v116];
  int64_t deviceOrientation = self->_deviceOrientation;
  v114[0] = MEMORY[0x1E4F143A8];
  v114[1] = 3221225472;
  v114[2] = __34__SBCaptureButtonContext_isEqual___block_invoke_18;
  v114[3] = &unk_1E6AF9660;
  id v58 = v55;
  id v115 = v58;
  id v59 = (id)[v5 appendInteger:deviceOrientation counterpart:v114];
  BOOL cameraPrewarmed = self->_cameraPrewarmed;
  v112[0] = MEMORY[0x1E4F143A8];
  v112[1] = 3221225472;
  v112[2] = __34__SBCaptureButtonContext_isEqual___block_invoke_19;
  v112[3] = &unk_1E6AF99E8;
  id v61 = v58;
  id v113 = v61;
  id v62 = (id)[v5 appendBool:cameraPrewarmed counterpart:v112];
  BOOL suppressedOnButtonDown = self->_suppressedOnButtonDown;
  v110[0] = MEMORY[0x1E4F143A8];
  v110[1] = 3221225472;
  v110[2] = __34__SBCaptureButtonContext_isEqual___block_invoke_20;
  v110[3] = &unk_1E6AF99E8;
  id v64 = v61;
  id v111 = v64;
  id v65 = (id)[v5 appendBool:suppressedOnButtonDown counterpart:v110];
  int64_t suppressionState = self->_suppressionState;
  v108[0] = MEMORY[0x1E4F143A8];
  v108[1] = 3221225472;
  v108[2] = __34__SBCaptureButtonContext_isEqual___block_invoke_21;
  v108[3] = &unk_1E6AF9660;
  id v67 = v64;
  id v109 = v67;
  id v68 = (id)[v5 appendInteger:suppressionState counterpart:v108];
  BOOL prewarmLockoutActive = self->_prewarmLockoutActive;
  v106[0] = MEMORY[0x1E4F143A8];
  v106[1] = 3221225472;
  v106[2] = __34__SBCaptureButtonContext_isEqual___block_invoke_22;
  v106[3] = &unk_1E6AF99E8;
  id v70 = v67;
  id v107 = v70;
  id v71 = (id)[v5 appendBool:prewarmLockoutActive counterpart:v106];
  captureAppBundleID = self->_captureAppBundleID;
  v104[0] = MEMORY[0x1E4F143A8];
  v104[1] = 3221225472;
  v104[2] = __34__SBCaptureButtonContext_isEqual___block_invoke_23;
  v104[3] = &unk_1E6AFD560;
  id v73 = v70;
  id v105 = v73;
  id v74 = (id)[v5 appendString:captureAppBundleID counterpart:v104];
  uint64_t pressDuration = (uint64_t)self->_pressDuration;
  v102[0] = MEMORY[0x1E4F143A8];
  v102[1] = 3221225472;
  v102[2] = __34__SBCaptureButtonContext_isEqual___block_invoke_24;
  v102[3] = &unk_1E6AF9660;
  id v76 = v73;
  id v103 = v76;
  id v77 = (id)[v5 appendInt64:pressDuration counterpart:v102];
  foregroundAppBundleID = self->_foregroundAppBundleID;
  v100[0] = MEMORY[0x1E4F143A8];
  v100[1] = 3221225472;
  v100[2] = __34__SBCaptureButtonContext_isEqual___block_invoke_25;
  v100[3] = &unk_1E6AFD560;
  id v79 = v76;
  id v101 = v79;
  id v80 = (id)[v5 appendString:foregroundAppBundleID counterpart:v100];
  BOOL inAmbientPresentationMode = self->_inAmbientPresentationMode;
  v98[0] = MEMORY[0x1E4F143A8];
  v98[1] = 3221225472;
  v98[2] = __34__SBCaptureButtonContext_isEqual___block_invoke_26;
  v98[3] = &unk_1E6AF99E8;
  id v82 = v79;
  id v99 = v82;
  id v83 = (id)[v5 appendBool:inAmbientPresentationMode counterpart:v98];
  BOOL connectedToWirelessCharger = self->_connectedToWirelessCharger;
  v96[0] = MEMORY[0x1E4F143A8];
  v96[1] = 3221225472;
  v96[2] = __34__SBCaptureButtonContext_isEqual___block_invoke_27;
  v96[3] = &unk_1E6AF99E8;
  id v85 = v82;
  id v97 = v85;
  id v86 = (id)[v5 appendBool:connectedToWirelessCharger counterpart:v96];
  BOOL voiceOverScreenCurtainActive = self->_voiceOverScreenCurtainActive;
  uint64_t v91 = MEMORY[0x1E4F143A8];
  uint64_t v92 = 3221225472;
  v93 = __34__SBCaptureButtonContext_isEqual___block_invoke_28;
  v94 = &unk_1E6AF99E8;
  id v95 = v85;
  id v88 = v85;
  id v89 = (id)[v5 appendBool:voiceOverScreenCurtainActive counterpart:&v91];
  LOBYTE(v85) = objc_msgSend(v5, "isEqual", v91, v92, v93, v94);

  return (char)v85;
}

uint64_t __34__SBCaptureButtonContext_isEqual___block_invoke(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 32);
}

uint64_t __34__SBCaptureButtonContext_isEqual___block_invoke_2(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 40);
}

uint64_t __34__SBCaptureButtonContext_isEqual___block_invoke_3(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 24);
}

uint64_t __34__SBCaptureButtonContext_isEqual___block_invoke_4(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 8);
}

uint64_t __34__SBCaptureButtonContext_isEqual___block_invoke_5(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 48);
}

uint64_t __34__SBCaptureButtonContext_isEqual___block_invoke_6(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 56);
}

double __34__SBCaptureButtonContext_isEqual___block_invoke_7(uint64_t a1)
{
  return *(double *)(*(void *)(a1 + 32) + 64);
}

uint64_t __34__SBCaptureButtonContext_isEqual___block_invoke_8(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 9);
}

double __34__SBCaptureButtonContext_isEqual___block_invoke_9(uint64_t a1)
{
  return *(double *)(*(void *)(a1 + 32) + 72);
}

double __34__SBCaptureButtonContext_isEqual___block_invoke_10(uint64_t a1)
{
  return *(double *)(*(void *)(a1 + 32) + 80);
}

double __34__SBCaptureButtonContext_isEqual___block_invoke_11(uint64_t a1)
{
  return *(double *)(*(void *)(a1 + 32) + 88);
}

double __34__SBCaptureButtonContext_isEqual___block_invoke_12(uint64_t a1)
{
  return *(double *)(*(void *)(a1 + 32) + 96);
}

double __34__SBCaptureButtonContext_isEqual___block_invoke_13(uint64_t a1)
{
  return *(double *)(*(void *)(a1 + 32) + 104);
}

uint64_t __34__SBCaptureButtonContext_isEqual___block_invoke_14(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 10);
}

id __34__SBCaptureButtonContext_isEqual___block_invoke_15(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 112);
}

id __34__SBCaptureButtonContext_isEqual___block_invoke_16(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 120);
}

id __34__SBCaptureButtonContext_isEqual___block_invoke_17(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 136);
}

uint64_t __34__SBCaptureButtonContext_isEqual___block_invoke_18(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 128);
}

uint64_t __34__SBCaptureButtonContext_isEqual___block_invoke_19(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 11);
}

uint64_t __34__SBCaptureButtonContext_isEqual___block_invoke_20(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 12);
}

uint64_t __34__SBCaptureButtonContext_isEqual___block_invoke_21(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 32) + 144);
}

uint64_t __34__SBCaptureButtonContext_isEqual___block_invoke_22(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 13);
}

id __34__SBCaptureButtonContext_isEqual___block_invoke_23(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 152);
}

uint64_t __34__SBCaptureButtonContext_isEqual___block_invoke_24(uint64_t a1)
{
  return (uint64_t)*(double *)(*(void *)(a1 + 32) + 168);
}

id __34__SBCaptureButtonContext_isEqual___block_invoke_25(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 160);
}

uint64_t __34__SBCaptureButtonContext_isEqual___block_invoke_26(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 14);
}

uint64_t __34__SBCaptureButtonContext_isEqual___block_invoke_27(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 15);
}

uint64_t __34__SBCaptureButtonContext_isEqual___block_invoke_28(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 16);
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendInteger:self->_event];
  id v5 = (id)[v3 appendInteger:self->_gesture];
  id v6 = (id)[v3 appendInt64:self->_machAbsoluteTimestamp];
  id v7 = (id)[v3 appendBool:self->_inGameMode];
  id v8 = (id)[v3 appendInteger:self->_inGameModeStreakCount];
  id v9 = (id)[v3 appendInteger:self->_backlightState];
  id v10 = (id)[v3 appendDouble:self->_timeSinceLastViewUnobstructed];
  id v11 = (id)[v3 appendBool:self->_uiLocked];
  id v12 = (id)[v3 appendDouble:self->_timeSinceLastStationary];
  id v13 = (id)[v3 appendDouble:self->_timeSinceLastNonStationary];
  id v14 = (id)[v3 appendDouble:self->_timeSinceLastStationarySquelch];
  id v15 = (id)[v3 appendBool:self->_lowLatencyTimeSinceLastStationary != 0.0];
  id v16 = (id)[v3 appendBool:self->_lowLatencyTimeSinceLastNonStationary != 0.0];
  id v17 = (id)[v3 appendBool:self->_inCameraPose];
  id v18 = (id)[v3 appendObject:self->_gravity];
  id v19 = (id)[v3 appendObject:self->_rotationRate];
  id v20 = (id)[v3 appendObject:self->_policy];
  id v21 = (id)[v3 appendInteger:self->_deviceOrientation];
  id v22 = (id)[v3 appendBool:self->_cameraPrewarmed];
  id v23 = (id)[v3 appendBool:self->_suppressedOnButtonDown];
  id v24 = (id)[v3 appendInteger:self->_suppressionState];
  id v25 = (id)[v3 appendBool:self->_prewarmLockoutActive];
  id v26 = (id)[v3 appendString:self->_captureAppBundleID];
  id v27 = (id)[v3 appendInt64:(uint64_t)self->_pressDuration];
  id v28 = (id)[v3 appendString:self->_foregroundAppBundleID];
  id v29 = (id)[v3 appendBool:self->_inAmbientPresentationMode];
  id v30 = (id)[v3 appendBool:self->_connectedToWirelessCharger];
  id v31 = (id)[v3 appendBool:self->_voiceOverScreenCurtainActive];
  unint64_t v32 = [v3 hash];

  return v32;
}

- (NSString)description
{
  v2 = [(SBCaptureButtonContext *)self dictionaryRepresentation];
  v3 = [v2 description];

  return (NSString *)v3;
}

- (SBCaptureButtonContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  id v74 = [v4 objectForKeyedSubscript:@"CaptureButtonEvent"];
  unint64_t v5 = SBCaptureButtonLoggingEventFromString(v74) - 1;
  if (v5 > 2) {
    uint64_t v66 = 0;
  }
  else {
    uint64_t v66 = qword_1D8FD1408[v5];
  }
  id v73 = [v4 objectForKeyedSubscript:@"CaptureButtonGesture"];
  uint64_t v64 = [v73 integerValue];
  v72 = [v4 objectForKeyedSubscript:@"Timestamp"];
  uint64_t v62 = [v72 unsignedLongLongValue];
  id v71 = [v4 objectForKeyedSubscript:@"InGameMode"];
  unsigned int v61 = [v71 BOOLValue];
  unint64_t inGameModeStreakCount = self->_inGameModeStreakCount;
  id v70 = [v4 objectForKeyedSubscript:@"BacklightState"];
  uint64_t v58 = SBBacklightStateFromString(v70);
  v69 = [v4 objectForKeyedSubscript:@"TimeSinceLastViewUnobstructed"];
  [v69 doubleValue];
  double v7 = v6;
  id v68 = [v4 objectForKeyedSubscript:@"UILocked"];
  char v55 = [v68 BOOLValue];
  id v67 = [v4 objectForKeyedSubscript:@"TimeSinceLastStationary"];
  [v67 doubleValue];
  double v9 = v8;
  id v65 = [v4 objectForKeyedSubscript:@"TimeSinceLastNonStationary"];
  [v65 doubleValue];
  double v11 = v10;
  v63 = [v4 objectForKeyedSubscript:@"TimeSinceLastStationarySquelch"];
  [v63 doubleValue];
  double v13 = v12;
  id v59 = [v4 objectForKeyedSubscript:@"LowLatencyTimeSinceLastStationary"];
  [v59 doubleValue];
  double v15 = v14;
  v57 = [v4 objectForKeyedSubscript:@"LowLatencyTimeSinceLastNonStationary"];
  [v57 doubleValue];
  double v17 = v16;
  id v56 = [v4 objectForKeyedSubscript:@"InCameraPose"];
  char v50 = [v56 BOOLValue];
  id v51 = self;
  id v18 = [SBDeviceMotionVector alloc];
  v54 = [v4 objectForKeyedSubscript:@"GravityVector"];
  v48 = [(SBDeviceMotionVector *)v18 initWithDictionary:v54];
  id v19 = [SBDeviceMotionVector alloc];
  id v53 = [v4 objectForKeyedSubscript:@"RotationRateVector"];
  v45 = [(SBDeviceMotionVector *)v19 initWithDictionary:v53];
  id v52 = [v4 objectForKeyedSubscript:@"UIDeviceOrientation"];
  uint64_t v44 = [v52 integerValue];
  id v20 = [SBCaptureButtonPolicy alloc];
  id v49 = [v4 objectForKeyedSubscript:@"Policy"];
  id v41 = [(SBCaptureButtonPolicy *)v20 initWithDictionary:v49];
  id v47 = [v4 objectForKeyedSubscript:@"CameraPrewarmed"];
  char v40 = [v47 BOOLValue];
  id v46 = [v4 objectForKeyedSubscript:@"SuppressedOnButtonDown"];
  char v39 = [v46 BOOLValue];
  id v43 = [v4 objectForKeyedSubscript:@"SuppressionState"];
  uint64_t v38 = SBCaptureButtonSuppressionStateFromString(v43);
  v42 = [v4 objectForKeyedSubscript:@"PrewarmLockoutActive"];
  char v21 = [v42 BOOLValue];
  id v22 = [v4 objectForKeyedSubscript:@"CaptureAppBundleID"];
  id v23 = [v4 objectForKeyedSubscript:@"PressDuration"];
  [v23 doubleValue];
  double v25 = v24;
  id v26 = [v4 objectForKeyedSubscript:@"ForegroundAppBundleID"];
  id v27 = [v4 objectForKeyedSubscript:@"InAmbientPresentationMode"];
  char v28 = [v27 BOOLValue];
  id v29 = [v4 objectForKeyedSubscript:@"ConnectedToWirelessCharger"];
  char v30 = [v29 BOOLValue];
  id v31 = [v4 objectForKeyedSubscript:@"VoiceOverScreenCurtainActiveKey"];

  BYTE2(v37) = [v31 BOOLValue];
  BYTE1(v37) = v30;
  LOBYTE(v37) = v28;
  LOBYTE(v36) = v21;
  BYTE1(v35) = v39;
  LOBYTE(v35) = v40;
  BYTE1(v34) = v50;
  LOBYTE(v34) = v55;
  unint64_t v32 = -[SBCaptureButtonContext initWithEvent:gesture:machAbsoluteTimestamp:consoleModeActive:consoleModeActiveStreakCount:backlightState:timeSinceLastViewUnobstructed:uiLocked:timeSinceLastStationary:timeSinceLastNonStationary:timeSinceLastStationarySquelch:lowLatencyTimeSinceLastStationary:lowLatencyTimeSinceLastNonStationary:inCameraPose:gravity:rotationRate:deviceOrientation:policy:cameraPrewarmed:suppressedOnButtonDown:suppressionState:prewarmLockoutActive:captureAppBundleID:pressDuration:foregroundAppBundleID:inAmbientPresentationMode:connectedToWirelessCharger:voiceOverScreenCurtainActive:](v51, "initWithEvent:gesture:machAbsoluteTimestamp:consoleModeActive:consoleModeActiveStreakCount:backlightState:timeSinceLastViewUnobstructed:uiLocked:timeSinceLastStationary:timeSinceLastNonStationary:timeSinceLastStationarySquelch:lowLatencyTimeSinceLastStationary:lowLatencyTimeSinceLastNonStationary:inCameraPose:gravity:rotationRate:deviceOrientation:policy:cameraPrewarmed:suppressedOnButtonDown:suppressionState:prewarmLockoutActive:captureAppBundleID:pressDuration:foregroundAppBundleID:inAmbientPresentationMode:connectedToWirelessCharger:voiceOverScreenCurtainActive:", v66, v64, v62, v61, inGameModeStreakCount, v58, v7, v9, v11, v13, v15, v17,
          v25,
          v34,
          v48,
          v45,
          v44,
          v41,
          v35,
          v38,
          v36,
          v22,
          v26,
          v37);

  return v32;
}

- (id)dictionaryRepresentation
{
  v38[29] = *MEMORY[0x1E4F143B8];
  v37[0] = @"CaptureButtonEvent";
  uint64_t v3 = SBCaptureButtonLoggingEventFromContext(self);
  if ((unint64_t)(v3 - 1) > 2) {
    id v4 = @"Unknown";
  }
  else {
    id v4 = off_1E6B00638[v3 - 1];
  }
  v38[0] = v4;
  v37[1] = @"CaptureButtonGesture";
  uint64_t v36 = [NSNumber numberWithUnsignedInteger:self->_gesture];
  v38[1] = v36;
  v37[2] = @"Timestamp";
  uint64_t v35 = [NSNumber numberWithUnsignedLongLong:self->_machAbsoluteTimestamp];
  v38[2] = v35;
  v37[3] = @"LaunchingClickCount";
  uint64_t v34 = [NSNumber numberWithUnsignedInteger:self->_gesture];
  v38[3] = v34;
  v37[4] = @"InGameMode";
  v33 = [NSNumber numberWithBool:self->_inGameMode];
  v38[4] = v33;
  v37[5] = @"InGameModeStreakCount";
  unint64_t v32 = [NSNumber numberWithUnsignedInteger:self->_inGameModeStreakCount];
  v38[5] = v32;
  v37[6] = @"BacklightState";
  id v31 = SBBacklightStateDescription(self->_backlightState);
  v38[6] = v31;
  v37[7] = @"TimeSinceLastViewUnobstructed";
  char v30 = [NSNumber numberWithDouble:self->_timeSinceLastViewUnobstructed];
  v38[7] = v30;
  v37[8] = @"UILocked";
  id v29 = [NSNumber numberWithBool:self->_uiLocked];
  v38[8] = v29;
  v37[9] = @"TimeSinceLastStationary";
  char v28 = [NSNumber numberWithDouble:self->_timeSinceLastStationary];
  v38[9] = v28;
  v37[10] = @"TimeSinceLastNonStationary";
  id v27 = [NSNumber numberWithDouble:self->_timeSinceLastNonStationary];
  v38[10] = v27;
  v37[11] = @"TimeSinceLastStationarySquelch";
  id v26 = [NSNumber numberWithDouble:self->_timeSinceLastStationarySquelch];
  v38[11] = v26;
  v37[12] = @"LowLatencyTimeSinceLastStationary";
  double v25 = [NSNumber numberWithDouble:self->_lowLatencyTimeSinceLastStationary];
  v38[12] = v25;
  v37[13] = @"LowLatencyTimeSinceLastNonStationary";
  double v24 = [NSNumber numberWithDouble:self->_lowLatencyTimeSinceLastNonStationary];
  v38[13] = v24;
  v37[14] = @"InCameraPose";
  id v23 = [NSNumber numberWithBool:self->_inCameraPose];
  v38[14] = v23;
  v37[15] = @"GravityVector";
  id v22 = [(SBDeviceMotionVector *)self->_gravity dictionaryRepresentation];
  v38[15] = v22;
  v37[16] = @"RotationRateVector";
  char v21 = [(SBDeviceMotionVector *)self->_rotationRate dictionaryRepresentation];
  v38[16] = v21;
  v37[17] = @"UIDeviceOrientation";
  id v20 = [NSNumber numberWithInteger:self->_deviceOrientation];
  v38[17] = v20;
  v37[18] = @"Policy";
  unint64_t v5 = [(SBCaptureButtonPolicy *)self->_policy dictionaryRepresentation];
  v38[18] = v5;
  v37[19] = @"CameraPrewarmed";
  double v6 = [NSNumber numberWithBool:self->_cameraPrewarmed];
  v38[19] = v6;
  v37[20] = @"SuppressedOnButtonDown";
  double v7 = [NSNumber numberWithBool:self->_suppressedOnButtonDown];
  v38[20] = v7;
  v37[21] = @"SuppressionState";
  double v8 = NSStringFromSBCaptureButtonSuppressionState(self->_suppressionState);
  v38[21] = v8;
  v37[22] = @"PrewarmLockoutActive";
  uint64_t v9 = [NSNumber numberWithBool:self->_prewarmLockoutActive];
  double v10 = (void *)v9;
  captureAppBundleID = (__CFString *)self->_captureAppBundleID;
  if (!captureAppBundleID) {
    captureAppBundleID = &stru_1F3084718;
  }
  v38[22] = v9;
  v38[23] = captureAppBundleID;
  v37[23] = @"CaptureAppBundleID";
  v37[24] = @"PressDuration";
  uint64_t v12 = [NSNumber numberWithDouble:self->_pressDuration];
  double v13 = (void *)v12;
  foregroundAppBundleID = (__CFString *)self->_foregroundAppBundleID;
  if (!foregroundAppBundleID) {
    foregroundAppBundleID = &stru_1F3084718;
  }
  v38[24] = v12;
  v38[25] = foregroundAppBundleID;
  v37[25] = @"ForegroundAppBundleID";
  v37[26] = @"InAmbientPresentationMode";
  double v15 = [NSNumber numberWithBool:self->_inAmbientPresentationMode];
  v38[26] = v15;
  v37[27] = @"ConnectedToWirelessCharger";
  double v16 = [NSNumber numberWithBool:self->_connectedToWirelessCharger];
  v38[27] = v16;
  v37[28] = @"VoiceOverScreenCurtainActiveKey";
  double v17 = [NSNumber numberWithBool:self->_voiceOverScreenCurtainActive];
  v38[28] = v17;
  id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:29];

  return v18;
}

- (unint64_t)machAbsoluteTimestamp
{
  return self->_machAbsoluteTimestamp;
}

- (void)setMachAbsoluteTimestamp:(unint64_t)a3
{
  self->_unint64_t machAbsoluteTimestamp = a3;
}

- (unint64_t)event
{
  return self->_event;
}

- (void)setEvent:(unint64_t)a3
{
  self->_unint64_t event = a3;
}

- (unint64_t)gesture
{
  return self->_gesture;
}

- (void)setGesture:(unint64_t)a3
{
  self->_unint64_t gesture = a3;
}

- (BOOL)inGameMode
{
  return self->_inGameMode;
}

- (void)setInGameMode:(BOOL)a3
{
  self->_BOOL inGameMode = a3;
}

- (unint64_t)inGameModeStreakCount
{
  return self->_inGameModeStreakCount;
}

- (void)setInGameModeStreakCount:(unint64_t)a3
{
  self->_unint64_t inGameModeStreakCount = a3;
}

- (int64_t)backlightState
{
  return self->_backlightState;
}

- (void)setBacklightState:(int64_t)a3
{
  self->_int64_t backlightState = a3;
}

- (double)timeSinceLastViewUnobstructed
{
  return self->_timeSinceLastViewUnobstructed;
}

- (void)setTimeSinceLastViewUnobstructed:(double)a3
{
  self->_double timeSinceLastViewUnobstructed = a3;
}

- (BOOL)uiLocked
{
  return self->_uiLocked;
}

- (void)setUiLocked:(BOOL)a3
{
  self->_BOOL uiLocked = a3;
}

- (double)timeSinceLastStationary
{
  return self->_timeSinceLastStationary;
}

- (void)setTimeSinceLastStationary:(double)a3
{
  self->_double timeSinceLastStationary = a3;
}

- (double)timeSinceLastNonStationary
{
  return self->_timeSinceLastNonStationary;
}

- (void)setTimeSinceLastNonStationary:(double)a3
{
  self->_double timeSinceLastNonStationary = a3;
}

- (double)timeSinceLastStationarySquelch
{
  return self->_timeSinceLastStationarySquelch;
}

- (void)setTimeSinceLastStationarySquelch:(double)a3
{
  self->_double timeSinceLastStationarySquelch = a3;
}

- (double)lowLatencyTimeSinceLastStationary
{
  return self->_lowLatencyTimeSinceLastStationary;
}

- (void)setLowLatencyTimeSinceLastStationary:(double)a3
{
  self->_double lowLatencyTimeSinceLastStationary = a3;
}

- (double)lowLatencyTimeSinceLastNonStationary
{
  return self->_lowLatencyTimeSinceLastNonStationary;
}

- (void)setLowLatencyTimeSinceLastNonStationary:(double)a3
{
  self->_double lowLatencyTimeSinceLastNonStationary = a3;
}

- (BOOL)inCameraPose
{
  return self->_inCameraPose;
}

- (void)setInCameraPose:(BOOL)a3
{
  self->_BOOL inCameraPose = a3;
}

- (SBDeviceMotionVector)gravity
{
  return self->_gravity;
}

- (void)setGravity:(id)a3
{
}

- (SBDeviceMotionVector)rotationRate
{
  return self->_rotationRate;
}

- (void)setRotationRate:(id)a3
{
}

- (int64_t)deviceOrientation
{
  return self->_deviceOrientation;
}

- (void)setDeviceOrientation:(int64_t)a3
{
  self->_int64_t deviceOrientation = a3;
}

- (SBCaptureButtonPolicy)policy
{
  return self->_policy;
}

- (void)setPolicy:(id)a3
{
}

- (BOOL)cameraPrewarmed
{
  return self->_cameraPrewarmed;
}

- (void)setCameraPrewarmed:(BOOL)a3
{
  self->_BOOL cameraPrewarmed = a3;
}

- (BOOL)suppressedOnButtonDown
{
  return self->_suppressedOnButtonDown;
}

- (void)setSuppressedOnButtonDown:(BOOL)a3
{
  self->_BOOL suppressedOnButtonDown = a3;
}

- (int64_t)suppressionState
{
  return self->_suppressionState;
}

- (void)setSuppressionState:(int64_t)a3
{
  self->_int64_t suppressionState = a3;
}

- (BOOL)isPrewarmLockoutActive
{
  return self->_prewarmLockoutActive;
}

- (void)setPrewarmLockoutActive:(BOOL)a3
{
  self->_BOOL prewarmLockoutActive = a3;
}

- (NSString)captureAppBundleID
{
  return self->_captureAppBundleID;
}

- (void)setCaptureAppBundleID:(id)a3
{
}

- (NSString)foregroundAppBundleID
{
  return self->_foregroundAppBundleID;
}

- (void)setForegroundAppBundleID:(id)a3
{
}

- (double)pressDuration
{
  return self->_pressDuration;
}

- (void)setPressDuration:(double)a3
{
  self->_uint64_t pressDuration = a3;
}

- (BOOL)isInAmbientPresentationMode
{
  return self->_inAmbientPresentationMode;
}

- (void)setInAmbientPresentationMode:(BOOL)a3
{
  self->_BOOL inAmbientPresentationMode = a3;
}

- (BOOL)isConnectedToWirelessCharger
{
  return self->_connectedToWirelessCharger;
}

- (void)setConnectedToWirelessCharger:(BOOL)a3
{
  self->_BOOL connectedToWirelessCharger = a3;
}

- (BOOL)isVoiceOverScreenCurtainActive
{
  return self->_voiceOverScreenCurtainActive;
}

- (void)setVoiceOverScreenCurtainActive:(BOOL)a3
{
  self->_BOOL voiceOverScreenCurtainActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foregroundAppBundleID, 0);
  objc_storeStrong((id *)&self->_captureAppBundleID, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_rotationRate, 0);
  objc_storeStrong((id *)&self->_gravity, 0);
}

+ (id)defaultContext
{
  v2 = [SBCaptureButtonContext alloc];
  uint64_t v3 = +[SBCaptureButtonContext defaultGravity];
  id v4 = +[SBCaptureButtonContext defaultRotationRate];
  unint64_t v5 = +[SBCaptureButtonContext defaultPolicy];
  BYTE2(v11) = 0;
  LOWORD(v11) = 0;
  LOBYTE(v10) = 0;
  LOWORD(v9) = 1;
  LOWORD(v8) = 1;
  double v6 = -[SBCaptureButtonContext initWithEvent:gesture:machAbsoluteTimestamp:consoleModeActive:consoleModeActiveStreakCount:backlightState:timeSinceLastViewUnobstructed:uiLocked:timeSinceLastStationary:timeSinceLastNonStationary:timeSinceLastStationarySquelch:lowLatencyTimeSinceLastStationary:lowLatencyTimeSinceLastNonStationary:inCameraPose:gravity:rotationRate:deviceOrientation:policy:cameraPrewarmed:suppressedOnButtonDown:suppressionState:prewarmLockoutActive:captureAppBundleID:pressDuration:foregroundAppBundleID:inAmbientPresentationMode:connectedToWirelessCharger:voiceOverScreenCurtainActive:](v2, "initWithEvent:gesture:machAbsoluteTimestamp:consoleModeActive:consoleModeActiveStreakCount:backlightState:timeSinceLastViewUnobstructed:uiLocked:timeSinceLastStationary:timeSinceLastNonStationary:timeSinceLastStationarySquelch:lowLatencyTimeSinceLastStationary:lowLatencyTimeSinceLastNonStationary:inCameraPose:gravity:rotationRate:deviceOrientation:policy:cameraPrewarmed:suppressedOnButtonDown:suppressionState:prewarmLockoutActive:captureAppBundleID:pressDuration:foregroundAppBundleID:inAmbientPresentationMode:connectedToWirelessCharger:voiceOverScreenCurtainActive:", 2, 1, 11121, 0, 0, 1, 10.0, 10.0, 8.0, 1.79769313e308, 9.0, 7.0,
         0.15,
         v8,
         v3,
         v4,
         1,
         v5,
         v9,
         2,
         v10,
         @"com.apple.camera",
         @"com.apple.lock-screen",
         v11);

  return v6;
}

+ (id)defaultPolicy
{
  LOBYTE(v5) = 0;
  LOWORD(v4) = 0;
  v2 = -[SBCaptureButtonPolicy initWithConsoleModeEnabled:wakeEnabled:directLaunchAfterUnsuppressEnabled:directLaunchAfterUnsuppressGracePeriod:deviceStationaryDetectionEnabled:deviceStationaryDetectionEnabledWhenUnlocked:deviceStationaryDetectionStationaryThreshold:deviceStationaryDetectionStationaryPickUpBuffer:deviceStationaryDetectionStationaryDebounceInterval:suppressionEnabled:launchIfUnobstructedWhileButtonDownEnabled:launchIfUnobstructedPromptlyAfterButtonUpEnabled:wakingBacklightStates:visionIntelligenceEnabled:]([SBCaptureButtonPolicy alloc], "initWithConsoleModeEnabled:wakeEnabled:directLaunchAfterUnsuppressEnabled:directLaunchAfterUnsuppressGracePeriod:deviceStationaryDetectionEnabled:deviceStationaryDetectionEnabledWhenUnlocked:deviceStationaryDetectionStationaryThreshold:deviceStationaryDetectionStationaryPickUpBuffer:deviceStationaryDetectionStationaryDebounceInterval:suppressionEnabled:launchIfUnobstructedWhileButtonDownEnabled:launchIfUnobstructedPromptlyAfterButtonUpEnabled:wakingBacklightStates:visionIntelligenceEnabled:", 1, 1, 1, 1, 1, 1, 2.0, 0.1, 0.4, 4.0, v4, &unk_1F3348090, v5);
  return v2;
}

+ (id)defaultGravity
{
  v2 = objc_alloc_init(SBDeviceMotionVector);
  return v2;
}

+ (id)defaultRotationRate
{
  v2 = objc_alloc_init(SBDeviceMotionVector);
  return v2;
}

- (int64_t)stationaryState
{
  [(SBCaptureButtonContext *)self timeSinceLastStationary];
  double v4 = v3;
  [(SBCaptureButtonContext *)self timeSinceLastNonStationary];
  double v6 = v5;
  double v7 = [(SBCaptureButtonContext *)self policy];
  [v7 deviceStationaryDetectionStationaryThreshold];
  double v9 = v8;
  uint64_t v10 = [(SBCaptureButtonContext *)self policy];
  [v10 deviceStationaryDetectionStationaryPickUpBuffer];
  int64_t v12 = +[SBDeviceStationaryMotionDetector stateFromTimeSinceLastStationary:v4 timeSinceLastNonStationary:v6 stationaryThreshold:v9 pickUpBuffer:v11];

  return v12;
}

- (BOOL)isWithinDirectLaunchGracePeriod
{
  [(SBCaptureButtonContext *)self timeSinceLastViewUnobstructed];
  double v4 = v3;
  double v5 = [(SBCaptureButtonContext *)self policy];
  [v5 directLaunchAfterUnsuppressGracePeriod];
  BOOL v7 = v4 <= v6;

  return v7;
}

- (id)computedContext
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"StationaryState";
  double v3 = NSStringFromSBEmbeddedDeviceStationaryState([(SBCaptureButtonContext *)self stationaryState]);
  v7[1] = @"IsWithinDirectLaunchGracePeriod";
  v8[0] = v3;
  double v4 = objc_msgSend(NSNumber, "numberWithBool:", -[SBCaptureButtonContext isWithinDirectLaunchGracePeriod](self, "isWithinDirectLaunchGracePeriod"));
  v8[1] = v4;
  double v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (BOOL)isScreenOn
{
  return [(SBCaptureButtonContext *)self backlightState] == 1;
}

- (BOOL)shouldSuspendLaunchOnButtonDown
{
  if ([(SBCaptureButtonContext *)self event] != 1) {
    return 0;
  }
  double v3 = [(SBCaptureButtonContext *)self policy];
  if ([v3 suppressionEnabled])
  {
    double v4 = [(SBCaptureButtonContext *)self policy];
    if ([v4 launchIfUnobstructedWhileButtonDownEnabled]) {
      BOOL v5 = [(SBCaptureButtonContext *)self isSuppressed];
    }
    else {
      BOOL v5 = 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isSuppressed
{
  double v3 = [(SBCaptureButtonContext *)self policy];
  if ([v3 suppressionEnabled]) {
    BOOL v4 = [(SBCaptureButtonContext *)self suppressionState] == 1;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

@end