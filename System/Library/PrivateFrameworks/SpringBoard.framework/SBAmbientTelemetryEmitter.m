@interface SBAmbientTelemetryEmitter
+ (id)_faceDescriptionFromConfiguration:(id)a3;
+ (int64_t)_ambientActiveFaceTypeForConfiguration:(id)a3;
+ (int64_t)_ambientClockFaceDescriptorForConfiguration:(id)a3;
+ (int64_t)_ambientPhotosFaceDescriptorForConfiguration:(id)a3;
+ (int64_t)_ambientTimeOfDay;
+ (void)_ambientCoreAnalyticsActiveFaceDescription:(id)a3 duration:(double)a4 sessionIdString:(id)a5;
+ (void)_ambientCoreAnalyticsActiveFaceDescription:(id)a3 screenOffDuration:(double)a4 sessionIdString:(id)a5;
+ (void)_ambientCoreAnalyticsAmbientEnabled:(BOOL)a3 userTriggered:(BOOL)a4;
+ (void)_ambientCoreAnalyticsConfigurationUpdateForEventType:(int64_t)a3 activeFace:(id)a4 metadata:(id)a5 sessionIdString:(id)a6 timeOfDay:(int64_t)a7;
+ (void)_ambientCoreAnalyticsSystemEventForBumpIgnored:(BOOL)a3 sessionIdString:(id)a4;
+ (void)_ambientCoreAnalyticsSystemEventForSleepSuppressionActive:(BOOL)a3 sessionIdString:(id)a4;
+ (void)_ambientCoreAnalyticsTotalAmbientDuration:(double)a3 sessionIdString:(id)a4;
+ (void)_ambientCoreAnalyticsUserSettingsForAmbientDefaults:(id)a3 userTriggered:(BOOL)a4;
+ (void)_ambientPowerLogActiveFaceUpdateWithFaceType:(unint64_t)a3 activeFaceDescriptor:(unint64_t)a4;
+ (void)_ambientPowerLogAmbientModeEnabled:(BOOL)a3;
+ (void)_ambientPowerLogAmbientMotionToWakeEnabled:(BOOL)a3;
+ (void)_ambientPowerLogAmbientPresented:(BOOL)a3 displayStyle:(int64_t)a4;
+ (void)_ambientPowerLogLifetimePresentationCounterUpdate:(unint64_t)a3;
+ (void)_ambientPowerLogWithEventName:(id)a3 dictionary:(id)a4;
- (SBAmbientTelemetryEmitter)initWithAmbientDefaults:(id)a3;
- (void)_logAmbientEnabled:(BOOL)a3 userTriggered:(BOOL)a4;
- (void)_logAmbientUserSettingsUserTriggered:(BOOL)a3;
- (void)_setupAmbientEnabledDailyTimerForLogging;
- (void)_setupAmbientEnabledLogging;
- (void)_setupUserSettingUpdateLogging;
- (void)_updateActiveFaceDurationForPreviousConfiguration:(id)a3 currentConfiguration:(id)a4 sessionIdString:(id)a5;
- (void)_updateActiveFaceScreenOffForBacklightState:(int64_t)a3 forConfiguration:(id)a4 sessionIdString:(id)a5;
- (void)_updateSessionIdForAmbientPresented:(BOOL)a3;
- (void)_updateTotalDurationLoggingForAmbientPresented:(BOOL)a3 sessionIdString:(id)a4;
- (void)dealloc;
- (void)logTelemetryForAmbientConfigurationUpdate:(id)a3 metadata:(id)a4;
- (void)logTelemetryForAmbientPresented:(BOOL)a3 displayStyle:(int64_t)a4;
- (void)logTelemetryForAmbientPresented:(BOOL)a3 withBacklightState:(int64_t)a4 screenOffWithConfiguration:(id)a5;
- (void)logTelemetryForBumpEventIgnored:(BOOL)a3;
- (void)logTelemetryForMotionToWakeEnabled:(BOOL)a3;
- (void)logTelemetryForSleepSuppressionActive:(BOOL)a3;
@end

@implementation SBAmbientTelemetryEmitter

- (SBAmbientTelemetryEmitter)initWithAmbientDefaults:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBAmbientTelemetryEmitter;
  v6 = [(SBAmbientTelemetryEmitter *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_ambientDefaults, a3);
    [(SBAmbientTelemetryEmitter *)v7 _setupAmbientEnabledLogging];
    [(SBAmbientTelemetryEmitter *)v7 _setupUserSettingUpdateLogging];
    objc_msgSend((id)objc_opt_class(), "_ambientPowerLogLifetimePresentationCounterUpdate:", -[AMAmbientDefaults lifetimePresentationCounter](v7->_ambientDefaults, "lifetimePresentationCounter"));
  }

  return v7;
}

- (void)dealloc
{
  [(NSTimer *)self->_ambientEnabledDailyTimer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBAmbientTelemetryEmitter;
  [(SBAmbientTelemetryEmitter *)&v3 dealloc];
}

- (void)logTelemetryForAmbientPresented:(BOOL)a3 displayStyle:(int64_t)a4
{
  BOOL v4 = a3;
  [(id)objc_opt_class() _ambientPowerLogAmbientPresented:a3 displayStyle:a4];
  id v15 = [(NSUUID *)self->_sessionId UUIDString];
  [(SBAmbientTelemetryEmitter *)self _updateSessionIdForAmbientPresented:v4];
  if (v4)
  {
    id v6 = [(NSUUID *)self->_sessionId UUIDString];
    uint64_t v7 = [(id)objc_opt_class() _ambientTimeOfDay];
    [(id)objc_opt_class() _ambientCoreAnalyticsConfigurationUpdateForEventType:1 activeFace:0 metadata:0 sessionIdString:v6 timeOfDay:v7];
    v8 = objc_opt_class();
    if (AMUIAmbientDisplayStyleIsRedMode()) {
      uint64_t v9 = 4;
    }
    else {
      uint64_t v9 = 3;
    }
    [v8 _ambientCoreAnalyticsConfigurationUpdateForEventType:v9 activeFace:0 metadata:0 sessionIdString:v6 timeOfDay:v7];
    [(SBAmbientTelemetryEmitter *)self _updateTotalDurationLoggingForAmbientPresented:1 sessionIdString:v6];
    objc_msgSend((id)objc_opt_class(), "_ambientPowerLogLifetimePresentationCounterUpdate:", -[AMAmbientDefaults lifetimePresentationCounter](self->_ambientDefaults, "lifetimePresentationCounter"));
  }
  else
  {
    id v6 = v15;
    uint64_t v10 = [(id)objc_opt_class() _ambientTimeOfDay];
    [(id)objc_opt_class() _ambientCoreAnalyticsConfigurationUpdateForEventType:0 activeFace:0 metadata:0 sessionIdString:v6 timeOfDay:v10];
    v11 = objc_opt_class();
    if (AMUIAmbientDisplayStyleIsRedMode()) {
      uint64_t v12 = 4;
    }
    else {
      uint64_t v12 = 3;
    }
    [v11 _ambientCoreAnalyticsConfigurationUpdateForEventType:v12 activeFace:0 metadata:0 sessionIdString:v6 timeOfDay:v10];
    [(SBAmbientTelemetryEmitter *)self _updateTotalDurationLoggingForAmbientPresented:0 sessionIdString:v6];
    [(SBAmbientTelemetryEmitter *)self _updateActiveFaceDurationForPreviousConfiguration:self->_activePosterConfiguration currentConfiguration:0 sessionIdString:v6];
    activePosterConfiguration = self->_activePosterConfiguration;
    self->_activePosterConfiguration = 0;

    ambientActiveFaceTimestamp = self->_ambientActiveFaceTimestamp;
    self->_ambientActiveFaceTimestamp = 0;
  }
}

- (void)logTelemetryForAmbientPresented:(BOOL)a3 withBacklightState:(int64_t)a4 screenOffWithConfiguration:(id)a5
{
  if (a3)
  {
    sessionId = self->_sessionId;
    id v8 = a5;
    id v9 = [(NSUUID *)sessionId UUIDString];
    [(SBAmbientTelemetryEmitter *)self _updateActiveFaceScreenOffForBacklightState:a4 forConfiguration:v8 sessionIdString:v9];
  }
}

- (void)logTelemetryForAmbientConfigurationUpdate:(id)a3 metadata:(id)a4
{
  id v6 = (PRSPosterConfiguration *)a3;
  id v7 = a4;
  id v17 = [(id)objc_opt_class() _faceDescriptionFromConfiguration:v6];
  uint64_t v8 = [(id)objc_opt_class() _ambientActiveFaceTypeForConfiguration:v6];
  uint64_t v9 = v8;
  if (v8 == 1)
  {
    uint64_t v10 = [(id)objc_opt_class() _ambientPhotosFaceDescriptorForConfiguration:v6];
    goto LABEL_5;
  }
  if (v8 == 2)
  {
    uint64_t v10 = [(id)objc_opt_class() _ambientClockFaceDescriptorForConfiguration:v6];
LABEL_5:
    uint64_t v11 = v10;
    goto LABEL_7;
  }
  uint64_t v11 = 0;
LABEL_7:
  [(id)objc_opt_class() _ambientPowerLogActiveFaceUpdateWithFaceType:v9 activeFaceDescriptor:v11];
  uint64_t v12 = objc_opt_class();
  v13 = [(NSUUID *)self->_sessionId UUIDString];
  objc_msgSend(v12, "_ambientCoreAnalyticsConfigurationUpdateForEventType:activeFace:metadata:sessionIdString:timeOfDay:", 2, v17, v7, v13, objc_msgSend((id)objc_opt_class(), "_ambientTimeOfDay"));

  activePosterConfiguration = self->_activePosterConfiguration;
  id v15 = [(NSUUID *)self->_sessionId UUIDString];
  [(SBAmbientTelemetryEmitter *)self _updateActiveFaceDurationForPreviousConfiguration:activePosterConfiguration currentConfiguration:v6 sessionIdString:v15];

  v16 = self->_activePosterConfiguration;
  self->_activePosterConfiguration = v6;
}

- (void)logTelemetryForMotionToWakeEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = objc_opt_class();
  [v4 _ambientPowerLogAmbientMotionToWakeEnabled:v3];
}

- (void)logTelemetryForBumpEventIgnored:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_opt_class();
  id v6 = [(NSUUID *)self->_sessionId UUIDString];
  [v5 _ambientCoreAnalyticsSystemEventForBumpIgnored:v3 sessionIdString:v6];
}

- (void)logTelemetryForSleepSuppressionActive:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_opt_class();
  id v6 = [(NSUUID *)self->_sessionId UUIDString];
  [v5 _ambientCoreAnalyticsSystemEventForSleepSuppressionActive:v3 sessionIdString:v6];
}

- (void)_setupAmbientEnabledLogging
{
  v15[1] = *MEMORY[0x1E4F143B8];
  p_ambientDefaults = &self->_ambientDefaults;
  [(SBAmbientTelemetryEmitter *)self _logAmbientEnabled:[(AMAmbientDefaults *)self->_ambientDefaults enableAmbientMode] userTriggered:0];
  objc_initWeak(&location, self);
  BOOL v4 = *p_ambientDefaults;
  id v5 = [NSString stringWithUTF8String:"enableAmbientMode"];
  v15[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  id v7 = MEMORY[0x1E4F14428];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __56__SBAmbientTelemetryEmitter__setupAmbientEnabledLogging__block_invoke;
  uint64_t v12 = &unk_1E6AF4B10;
  objc_copyWeak(&v13, &location);
  id v8 = (id)[(AMAmbientDefaults *)v4 observeDefaults:v6 onQueue:MEMORY[0x1E4F14428] withBlock:&v9];

  [(SBAmbientTelemetryEmitter *)self _setupAmbientEnabledDailyTimerForLogging];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __56__SBAmbientTelemetryEmitter__setupAmbientEnabledLogging__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_logAmbientEnabled:userTriggered:", objc_msgSend(WeakRetained[2], "enableAmbientMode"), 1);
}

- (void)_setupUserSettingUpdateLogging
{
  v14[4] = *MEMORY[0x1E4F143B8];
  [(SBAmbientTelemetryEmitter *)self _logAmbientUserSettingsUserTriggered:0];
  objc_initWeak(&location, self);
  ambientDefaults = self->_ambientDefaults;
  BOOL v4 = [NSString stringWithUTF8String:"enableAmbientMode"];
  v14[0] = v4;
  id v5 = [NSString stringWithUTF8String:"alwaysOnMode"];
  v14[1] = v5;
  id v6 = [NSString stringWithUTF8String:"nightModeEnabled"];
  v14[2] = v6;
  id v7 = [NSString stringWithUTF8String:"motionToWakeEnabled"];
  v14[3] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:4];
  id v9 = MEMORY[0x1E4F14428];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__SBAmbientTelemetryEmitter__setupUserSettingUpdateLogging__block_invoke;
  v11[3] = &unk_1E6AF4B10;
  objc_copyWeak(&v12, &location);
  id v10 = (id)[(AMAmbientDefaults *)ambientDefaults observeDefaults:v8 onQueue:MEMORY[0x1E4F14428] withBlock:v11];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __59__SBAmbientTelemetryEmitter__setupUserSettingUpdateLogging__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _logAmbientUserSettingsUserTriggered:1];
}

- (void)_logAmbientEnabled:(BOOL)a3 userTriggered:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  [(id)objc_opt_class() _ambientPowerLogAmbientModeEnabled:a3];
  id v6 = objc_opt_class();
  [v6 _ambientCoreAnalyticsAmbientEnabled:v5 userTriggered:v4];
}

- (void)_logAmbientUserSettingsUserTriggered:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = objc_opt_class();
  ambientDefaults = self->_ambientDefaults;
  [v5 _ambientCoreAnalyticsUserSettingsForAmbientDefaults:ambientDefaults userTriggered:v3];
}

- (void)_setupAmbientEnabledDailyTimerForLogging
{
  BOOL v3 = [MEMORY[0x1E4F1C9C8] date];
  BOOL v4 = [v3 dateByAddingTimeInterval:5.0];

  objc_initWeak(&location, self);
  id v5 = objc_alloc(MEMORY[0x1E4F1CB00]);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__SBAmbientTelemetryEmitter__setupAmbientEnabledDailyTimerForLogging__block_invoke;
  v8[3] = &unk_1E6AF61A0;
  objc_copyWeak(&v9, &location);
  id v6 = (NSTimer *)[v5 initWithFireDate:v4 interval:1 repeats:v8 block:86400.0];
  ambientEnabledDailyTimer = self->_ambientEnabledDailyTimer;
  self->_ambientEnabledDailyTimer = v6;

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __69__SBAmbientTelemetryEmitter__setupAmbientEnabledDailyTimerForLogging__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend((id)objc_opt_class(), "_ambientCoreAnalyticsAmbientEnabled:userTriggered:", objc_msgSend(WeakRetained[2], "enableAmbientMode"), 0);
    [(id)objc_opt_class() _ambientCoreAnalyticsUserSettingsForAmbientDefaults:v2[2] userTriggered:0];
    id WeakRetained = v2;
  }
}

- (void)_updateSessionIdForAmbientPresented:(BOOL)a3
{
  sessionId = self->_sessionId;
  if (a3)
  {
    if (sessionId) {
      return;
    }
    id v5 = [MEMORY[0x1E4F29128] UUID];
    sessionId = self->_sessionId;
  }
  else
  {
    if (!sessionId) {
      return;
    }
    id v5 = 0;
  }
  self->_sessionId = v5;
}

- (void)_updateTotalDurationLoggingForAmbientPresented:(BOOL)a3 sessionIdString:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  ambientPresentationTimestamp = self->_ambientPresentationTimestamp;
  if (v4)
  {
    if (ambientPresentationTimestamp) {
      goto LABEL_7;
    }
    id v13 = v6;
    id v8 = [MEMORY[0x1E4F1C9C8] date];
  }
  else
  {
    if (!ambientPresentationTimestamp) {
      goto LABEL_7;
    }
    id v13 = v6;
    id v9 = [MEMORY[0x1E4F1C9C8] date];
    [v9 timeIntervalSinceDate:self->_ambientPresentationTimestamp];
    double v11 = v10;

    [(id)objc_opt_class() _ambientCoreAnalyticsTotalAmbientDuration:v13 sessionIdString:v11];
    id v8 = 0;
  }
  id v12 = self->_ambientPresentationTimestamp;
  self->_ambientPresentationTimestamp = v8;

  id v6 = v13;
LABEL_7:
}

- (void)_updateActiveFaceDurationForPreviousConfiguration:(id)a3 currentConfiguration:(id)a4 sessionIdString:(id)a5
{
  id v17 = a5;
  id v8 = a4;
  id v9 = a3;
  double v10 = [(id)objc_opt_class() _faceDescriptionFromConfiguration:v9];

  double v11 = [(id)objc_opt_class() _faceDescriptionFromConfiguration:v8];

  if (([v10 isEqualToString:v11] & 1) == 0)
  {
    if (self->_ambientActiveFaceTimestamp)
    {
      id v12 = [MEMORY[0x1E4F1C9C8] date];
      [v12 timeIntervalSinceDate:self->_ambientActiveFaceTimestamp];
      double v14 = v13;

      [(id)objc_opt_class() _ambientCoreAnalyticsActiveFaceDescription:v10 duration:v17 sessionIdString:v14];
    }
    id v15 = [MEMORY[0x1E4F1C9C8] date];
    ambientActiveFaceTimestamp = self->_ambientActiveFaceTimestamp;
    self->_ambientActiveFaceTimestamp = v15;
  }
}

- (void)_updateActiveFaceScreenOffForBacklightState:(int64_t)a3 forConfiguration:(id)a4 sessionIdString:(id)a5
{
  id v15 = a5;
  id v8 = a4;
  id v9 = [(id)objc_opt_class() _faceDescriptionFromConfiguration:v8];

  if (a3 == 4)
  {
    double v10 = [MEMORY[0x1E4F1C9C8] date];
    ambientActiveFaceSceenOffTimestamp = self->_ambientActiveFaceSceenOffTimestamp;
    self->_ambientActiveFaceSceenOffTimestamp = v10;
  }
  else
  {
    ambientActiveFaceSceenOffTimestamp = self->_ambientActiveFaceSceenOffTimestamp;
    if (ambientActiveFaceSceenOffTimestamp)
    {
      id v12 = [MEMORY[0x1E4F1C9C8] date];
      [v12 timeIntervalSinceDate:self->_ambientActiveFaceSceenOffTimestamp];
      double v14 = v13;

      [(id)objc_opt_class() _ambientCoreAnalyticsActiveFaceDescription:v9 screenOffDuration:v15 sessionIdString:v14];
      ambientActiveFaceSceenOffTimestamp = self->_ambientActiveFaceSceenOffTimestamp;
    }
    self->_ambientActiveFaceSceenOffTimestamp = 0;
  }
}

+ (id)_faceDescriptionFromConfiguration:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 providerBundleIdentifier];
  id v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = @"Unknown";
  }
  id v7 = [v3 descriptorIdentifier];

  if (v7)
  {
    uint64_t v8 = [NSString stringWithFormat:@"%@:%@", v6, v7];

    id v6 = (__CFString *)v8;
  }
  id v9 = v6;

  return v9;
}

+ (void)_ambientPowerLogWithEventName:(id)a3 dictionary:(id)a4
{
}

+ (void)_ambientPowerLogAmbientPresented:(BOOL)a3 displayStyle:(int64_t)a4
{
  BOOL v5 = a3;
  id v8 = [MEMORY[0x1E4F1CA60] dictionary];
  id v6 = [NSNumber numberWithBool:v5];
  [v8 setObject:v6 forKeyedSubscript:@"Enabled"];

  id v7 = [NSNumber numberWithInteger:a4];
  [v8 setObject:v7 forKeyedSubscript:@"Mode"];

  [(id)objc_opt_class() _ambientPowerLogWithEventName:@"AmbientMode" dictionary:v8];
}

+ (void)_ambientPowerLogAmbientModeEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  BOOL v4 = [NSNumber numberWithBool:v3];
  [v5 setObject:v4 forKeyedSubscript:@"Enabled"];

  [(id)objc_opt_class() _ambientPowerLogWithEventName:@"AmbientModeEnabled" dictionary:v5];
}

+ (void)_ambientPowerLogAmbientMotionToWakeEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v8 = [MEMORY[0x1E4F1CA60] dictionary];
  BOOL v4 = [NSNumber numberWithBool:v3];
  [v8 setObject:v4 forKeyedSubscript:@"Enabled"];

  id v5 = NSNumber;
  id v6 = [MEMORY[0x1E4F1C9C8] now];
  [v6 timeIntervalSince1970];
  id v7 = objc_msgSend(v5, "numberWithDouble:");
  [v8 setObject:v7 forKeyedSubscript:@"Timestamp"];

  [(id)objc_opt_class() _ambientPowerLogWithEventName:@"AmbientModeMotionToWake" dictionary:v8];
}

+ (int64_t)_ambientActiveFaceTypeForConfiguration:(id)a3
{
  BOOL v3 = [a3 providerBundleIdentifier];
  if ([v3 isEqualToString:@"com.apple.ambient.AmbientUI.InfographPoster"])
  {
    int64_t v4 = 0;
  }
  else if ([v3 isEqualToString:@"com.apple.ClockPoster.ClockPosterExtension"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"com.apple.PhotosUIPrivate.PhotosAmbientPosterProvider"])
  {
    int64_t v4 = 1;
  }
  else
  {
    int64_t v4 = -1;
  }

  return v4;
}

+ (int64_t)_ambientClockFaceDescriptorForConfiguration:(id)a3
{
  BOOL v3 = [a3 descriptorIdentifier];
  if ([v3 isEqualToString:@"digital"])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"analog"])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"play"])
  {
    int64_t v4 = 0;
  }
  else if ([v3 isEqualToString:@"solar"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"world"])
  {
    int64_t v4 = 2;
  }
  else
  {
    int64_t v4 = -1;
  }

  return v4;
}

+ (int64_t)_ambientPhotosFaceDescriptorForConfiguration:(id)a3
{
  BOOL v3 = [a3 descriptorIdentifier];
  if ([v3 isEqualToString:@"featured"])
  {
    int64_t v4 = 0;
  }
  else if ([v3 isEqualToString:@"pets"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"people"])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"nature"])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"cities"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"album"])
  {
    int64_t v4 = 5;
  }
  else
  {
    int64_t v4 = -1;
  }

  return v4;
}

+ (void)_ambientPowerLogActiveFaceUpdateWithFaceType:(unint64_t)a3 activeFaceDescriptor:(unint64_t)a4
{
  id v8 = [MEMORY[0x1E4F1CA60] dictionary];
  id v6 = [NSNumber numberWithUnsignedInteger:a3];
  [v8 setObject:v6 forKeyedSubscript:@"ActiveFaceType"];

  id v7 = [NSNumber numberWithUnsignedInteger:a4];
  [v8 setObject:v7 forKeyedSubscript:@"ActiveFaceDescriptor"];

  [(id)objc_opt_class() _ambientPowerLogWithEventName:@"AmbientModeActiveFace" dictionary:v8];
}

+ (void)_ambientPowerLogLifetimePresentationCounterUpdate:(unint64_t)a3
{
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  int64_t v4 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setObject:v4 forKeyedSubscript:@"LifetimePresentationCounter"];

  [(id)objc_opt_class() _ambientPowerLogWithEventName:@"AmbientModeLifetimePresentationCounter" dictionary:v5];
}

+ (void)_ambientCoreAnalyticsAmbientEnabled:(BOOL)a3 userTriggered:(BOOL)a4
{
}

id __79__SBAmbientTelemetryEmitter__ambientCoreAnalyticsAmbientEnabled_userTriggered___block_invoke(uint64_t a1)
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"enabledSetting";
  v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  v6[1] = @"userTriggered";
  v7[0] = v2;
  BOOL v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 33)];
  v7[1] = v3;
  int64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

+ (void)_ambientCoreAnalyticsActiveFaceDescription:(id)a3 duration:(double)a4 sessionIdString:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v6 = v9;
  id v7 = v8;
  AnalyticsSendEventLazy();
}

id __97__SBAmbientTelemetryEmitter__ambientCoreAnalyticsActiveFaceDescription_duration_sessionIdString___block_invoke(uint64_t a1)
{
  void v7[3] = *MEMORY[0x1E4F143B8];
  v7[0] = *(void *)(a1 + 32);
  v6[0] = @"activeFaceType";
  v6[1] = @"activeFaceDuration";
  v2 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
  void v6[2] = @"sessionId";
  uint64_t v3 = *(void *)(a1 + 40);
  v7[1] = v2;
  v7[2] = v3;
  int64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:3];

  return v4;
}

+ (void)_ambientCoreAnalyticsActiveFaceDescription:(id)a3 screenOffDuration:(double)a4 sessionIdString:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v6 = v9;
  id v7 = v8;
  AnalyticsSendEventLazy();
}

id __106__SBAmbientTelemetryEmitter__ambientCoreAnalyticsActiveFaceDescription_screenOffDuration_sessionIdString___block_invoke(uint64_t a1)
{
  void v7[3] = *MEMORY[0x1E4F143B8];
  v7[0] = *(void *)(a1 + 32);
  v6[0] = @"activeFaceType";
  v6[1] = @"activeFaceScreenOffDuration";
  v2 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
  void v6[2] = @"sessionId";
  uint64_t v3 = *(void *)(a1 + 40);
  v7[1] = v2;
  v7[2] = v3;
  int64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:3];

  return v4;
}

+ (void)_ambientCoreAnalyticsTotalAmbientDuration:(double)a3 sessionIdString:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  AnalyticsSendEventLazy();
}

id __87__SBAmbientTelemetryEmitter__ambientCoreAnalyticsTotalAmbientDuration_sessionIdString___block_invoke(uint64_t a1)
{
  void v6[2] = *MEMORY[0x1E4F143B8];
  v5[0] = @"totalDuration";
  v2 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
  v5[1] = @"sessionId";
  v6[0] = v2;
  v6[1] = *(void *)(a1 + 32);
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];

  return v3;
}

+ (void)_ambientCoreAnalyticsConfigurationUpdateForEventType:(int64_t)a3 activeFace:(id)a4 metadata:(id)a5 sessionIdString:(id)a6 timeOfDay:(int64_t)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  v23 = __128__SBAmbientTelemetryEmitter__ambientCoreAnalyticsConfigurationUpdateForEventType_activeFace_metadata_sessionIdString_timeOfDay___block_invoke;
  v24 = &unk_1E6AFC938;
  int64_t v27 = a3;
  id v14 = v13;
  id v25 = v14;
  id v15 = v11;
  id v26 = v15;
  int64_t v28 = a7;
  AnalyticsSendEventLazy();
  if (a3 == 2 && v12)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __128__SBAmbientTelemetryEmitter__ambientCoreAnalyticsConfigurationUpdateForEventType_activeFace_metadata_sessionIdString_timeOfDay___block_invoke_2;
    v16[3] = &unk_1E6AFC988;
    uint64_t v19 = 2;
    id v17 = v15;
    id v18 = v14;
    int64_t v20 = a7;
    [v12 enumerateKeysAndObjectsUsingBlock:v16];
  }
}

id __128__SBAmbientTelemetryEmitter__ambientCoreAnalyticsConfigurationUpdateForEventType_activeFace_metadata_sessionIdString_timeOfDay___block_invoke(void *a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v3 = [NSNumber numberWithInteger:a1[6]];
  [v2 setObject:v3 forKeyedSubscript:@"eventType"];

  [v2 setObject:a1[4] forKeyedSubscript:@"sessionId"];
  uint64_t v4 = a1[5];
  if (v4) {
    [v2 setObject:v4 forKeyedSubscript:@"activeFaceType"];
  }
  id v5 = [NSNumber numberWithInteger:a1[7]];
  [v2 setObject:v5 forKeyedSubscript:@"timeOfDay"];

  return v2;
}

void __128__SBAmbientTelemetryEmitter__ambientCoreAnalyticsConfigurationUpdateForEventType_activeFace_metadata_sessionIdString_timeOfDay___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v9 = *(id *)(a1 + 32);
  double v10 = v6;
  id v11 = *(id *)(a1 + 40);
  id v7 = v6;
  id v8 = v5;
  AnalyticsSendEventLazy();
}

id __128__SBAmbientTelemetryEmitter__ambientCoreAnalyticsConfigurationUpdateForEventType_activeFace_metadata_sessionIdString_timeOfDay___block_invoke_3(void *a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v3 = [NSNumber numberWithInteger:a1[8]];
  [v2 setObject:v3 forKeyedSubscript:@"eventType"];

  uint64_t v4 = a1[4];
  if (v4) {
    [v2 setObject:v4 forKeyedSubscript:@"activeFaceType"];
  }
  [v2 setObject:a1[5] forKeyedSubscript:@"activeFacePropertyAttribute"];
  [v2 setObject:a1[6] forKeyedSubscript:@"activeFacePropertyValue"];
  [v2 setObject:a1[7] forKeyedSubscript:@"sessionId"];
  id v5 = [NSNumber numberWithInteger:a1[9]];
  [v2 setObject:v5 forKeyedSubscript:@"timeOfDay"];

  return v2;
}

+ (void)_ambientCoreAnalyticsUserSettingsForAmbientDefaults:(id)a3 userTriggered:(BOOL)a4
{
  id v5 = a3;
  id v4 = v5;
  AnalyticsSendEventLazy();
}

id __95__SBAmbientTelemetryEmitter__ambientCoreAnalyticsUserSettingsForAmbientDefaults_userTriggered___block_invoke(uint64_t a1)
{
  v11[6] = *MEMORY[0x1E4F143B8];
  v10[0] = @"ambientEnabled";
  id v2 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "enableAmbientMode"));
  v11[0] = v2;
  v10[1] = @"alwaysOnEnabled";
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "alwaysOnMode") != 0);
  v11[1] = v3;
  v10[2] = @"alwaysOnMode";
  id v4 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "alwaysOnMode"));
  v11[2] = v4;
  v10[3] = @"nightModeEnabled";
  id v5 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "nightModeEnabled"));
  v11[3] = v5;
  v10[4] = @"motionToWakeEnabled";
  id v6 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "motionToWakeEnabled"));
  void v11[4] = v6;
  v10[5] = @"userTriggered";
  id v7 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  v11[5] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:6];

  return v8;
}

+ (void)_ambientCoreAnalyticsSystemEventForBumpIgnored:(BOOL)a3 sessionIdString:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  AnalyticsSendEventLazy();
}

id __92__SBAmbientTelemetryEmitter__ambientCoreAnalyticsSystemEventForBumpIgnored_sessionIdString___block_invoke(uint64_t a1)
{
  void v6[2] = *MEMORY[0x1E4F143B8];
  v5[0] = @"eventType";
  id v2 = [NSNumber numberWithInteger:*(unsigned __int8 *)(a1 + 40)];
  v5[1] = @"sessionId";
  v6[0] = v2;
  v6[1] = *(void *)(a1 + 32);
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];

  return v3;
}

+ (void)_ambientCoreAnalyticsSystemEventForSleepSuppressionActive:(BOOL)a3 sessionIdString:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  AnalyticsSendEventLazy();
}

id __103__SBAmbientTelemetryEmitter__ambientCoreAnalyticsSystemEventForSleepSuppressionActive_sessionIdString___block_invoke(uint64_t a1)
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"eventType";
  if (*(unsigned char *)(a1 + 40)) {
    uint64_t v2 = 2;
  }
  else {
    uint64_t v2 = 3;
  }
  uint64_t v3 = [NSNumber numberWithInteger:v2];
  v6[1] = @"sessionId";
  v7[0] = v3;
  v7[1] = *(void *)(a1 + 32);
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

+ (int64_t)_ambientTimeOfDay
{
  uint64_t v2 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  id v4 = [v2 components:32 fromDate:v3];

  unint64_t v5 = [v4 hour];
  uint64_t v6 = 2;
  if (v5 - 18 >= 6) {
    uint64_t v6 = -1;
  }
  if (v5 - 12 >= 6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 1;
  }
  if (v5 - 5 >= 7) {
    int64_t v8 = v7;
  }
  else {
    int64_t v8 = 0;
  }
  if (v5 >= 5) {
    int64_t v9 = v8;
  }
  else {
    int64_t v9 = 3;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_ambientEnabledDailyTimer, 0);
  objc_storeStrong((id *)&self->_ambientActiveFaceSceenOffTimestamp, 0);
  objc_storeStrong((id *)&self->_ambientActiveFaceTimestamp, 0);
  objc_storeStrong((id *)&self->_ambientPresentationTimestamp, 0);
  objc_storeStrong((id *)&self->_ambientDefaults, 0);
  objc_storeStrong((id *)&self->_activePosterConfiguration, 0);
}

@end