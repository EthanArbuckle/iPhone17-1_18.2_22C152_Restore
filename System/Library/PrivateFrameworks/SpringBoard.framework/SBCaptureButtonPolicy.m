@interface SBCaptureButtonPolicy
- (BOOL)consoleModeMitigationEnabled;
- (BOOL)deviceStationaryDetectionEnabled;
- (BOOL)deviceStationaryDetectionEnabledWhenUnlocked;
- (BOOL)directLaunchAfterUnsuppressEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isVisionIntelligenceEnabled;
- (BOOL)launchIfUnobstructedPromptlyAfterButtonUpEnabled;
- (BOOL)launchIfUnobstructedWhileButtonDownEnabled;
- (BOOL)suppressionEnabled;
- (BOOL)wakeEnabled;
- (NSArray)wakingBacklightStates;
- (NSString)description;
- (SBCaptureButtonPolicy)initWithConsoleModeEnabled:(BOOL)a3 wakeEnabled:(BOOL)a4 directLaunchAfterUnsuppressEnabled:(BOOL)a5 directLaunchAfterUnsuppressGracePeriod:(double)a6 deviceStationaryDetectionEnabled:(BOOL)a7 deviceStationaryDetectionEnabledWhenUnlocked:(BOOL)a8 deviceStationaryDetectionStationaryThreshold:(double)a9 deviceStationaryDetectionStationaryPickUpBuffer:(double)a10 deviceStationaryDetectionStationaryDebounceInterval:(double)a11 suppressionEnabled:(BOOL)a12 launchIfUnobstructedWhileButtonDownEnabled:(BOOL)a13 launchIfUnobstructedPromptlyAfterButtonUpEnabled:(BOOL)a14 wakingBacklightStates:(id)a15 visionIntelligenceEnabled:(BOOL)a16;
- (SBCaptureButtonPolicy)initWithDictionary:(id)a3;
- (double)deviceStationaryDetectionStationaryDebounceInterval;
- (double)deviceStationaryDetectionStationaryPickUpBuffer;
- (double)deviceStationaryDetectionStationaryThreshold;
- (double)directLaunchAfterUnsuppressGracePeriod;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
@end

@implementation SBCaptureButtonPolicy

- (SBCaptureButtonPolicy)initWithConsoleModeEnabled:(BOOL)a3 wakeEnabled:(BOOL)a4 directLaunchAfterUnsuppressEnabled:(BOOL)a5 directLaunchAfterUnsuppressGracePeriod:(double)a6 deviceStationaryDetectionEnabled:(BOOL)a7 deviceStationaryDetectionEnabledWhenUnlocked:(BOOL)a8 deviceStationaryDetectionStationaryThreshold:(double)a9 deviceStationaryDetectionStationaryPickUpBuffer:(double)a10 deviceStationaryDetectionStationaryDebounceInterval:(double)a11 suppressionEnabled:(BOOL)a12 launchIfUnobstructedWhileButtonDownEnabled:(BOOL)a13 launchIfUnobstructedPromptlyAfterButtonUpEnabled:(BOOL)a14 wakingBacklightStates:(id)a15 visionIntelligenceEnabled:(BOOL)a16
{
  id v27 = a15;
  v31.receiver = self;
  v31.super_class = (Class)SBCaptureButtonPolicy;
  v28 = [(SBCaptureButtonPolicy *)&v31 init];
  v29 = v28;
  if (v28)
  {
    v28->_consoleModeMitigationEnabled = a3;
    v28->_wakeEnabled = a4;
    v28->_directLaunchAfterUnsuppressEnabled = a5;
    v28->_deviceStationaryDetectionEnabled = a7;
    v28->_deviceStationaryDetectionEnabledWhenUnlocked = a8;
    v28->_directLaunchAfterUnsuppressGracePeriod = a6;
    v28->_deviceStationaryDetectionStationaryThreshold = a9;
    v28->_deviceStationaryDetectionStationaryPickUpBuffer = a10;
    v28->_deviceStationaryDetectionStationaryDebounceInterval = a11;
    v28->_suppressionEnabled = a12;
    v28->_launchIfUnobstructedWhileButtonDownEnabled = a13;
    v28->_launchIfUnobstructedPromptlyAfterButtonUpEnabled = a14;
    objc_storeStrong((id *)&v28->_wakingBacklightStates, a15);
    v29->_visionIntelligenceEnabled = a16;
  }

  return v29;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  BOOL consoleModeMitigationEnabled = self->_consoleModeMitigationEnabled;
  v78[0] = MEMORY[0x1E4F143A8];
  v78[1] = 3221225472;
  v78[2] = __33__SBCaptureButtonPolicy_isEqual___block_invoke;
  v78[3] = &unk_1E6AF99E8;
  id v7 = v4;
  id v79 = v7;
  id v8 = (id)[v5 appendBool:consoleModeMitigationEnabled counterpart:v78];
  BOOL wakeEnabled = self->_wakeEnabled;
  v76[0] = MEMORY[0x1E4F143A8];
  v76[1] = 3221225472;
  v76[2] = __33__SBCaptureButtonPolicy_isEqual___block_invoke_2;
  v76[3] = &unk_1E6AF99E8;
  id v10 = v7;
  id v77 = v10;
  id v11 = (id)[v5 appendBool:wakeEnabled counterpart:v76];
  BOOL directLaunchAfterUnsuppressEnabled = self->_directLaunchAfterUnsuppressEnabled;
  v74[0] = MEMORY[0x1E4F143A8];
  v74[1] = 3221225472;
  v74[2] = __33__SBCaptureButtonPolicy_isEqual___block_invoke_3;
  v74[3] = &unk_1E6AF99E8;
  id v13 = v10;
  id v75 = v13;
  id v14 = (id)[v5 appendBool:directLaunchAfterUnsuppressEnabled counterpart:v74];
  double directLaunchAfterUnsuppressGracePeriod = self->_directLaunchAfterUnsuppressGracePeriod;
  v72[0] = MEMORY[0x1E4F143A8];
  v72[1] = 3221225472;
  v72[2] = __33__SBCaptureButtonPolicy_isEqual___block_invoke_4;
  v72[3] = &unk_1E6AFD028;
  id v16 = v13;
  id v73 = v16;
  id v17 = (id)[v5 appendDouble:v72 counterpart:directLaunchAfterUnsuppressGracePeriod];
  BOOL deviceStationaryDetectionEnabled = self->_deviceStationaryDetectionEnabled;
  v70[0] = MEMORY[0x1E4F143A8];
  v70[1] = 3221225472;
  v70[2] = __33__SBCaptureButtonPolicy_isEqual___block_invoke_5;
  v70[3] = &unk_1E6AF99E8;
  id v19 = v16;
  id v71 = v19;
  id v20 = (id)[v5 appendBool:deviceStationaryDetectionEnabled counterpart:v70];
  BOOL deviceStationaryDetectionEnabledWhenUnlocked = self->_deviceStationaryDetectionEnabledWhenUnlocked;
  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v68[2] = __33__SBCaptureButtonPolicy_isEqual___block_invoke_6;
  v68[3] = &unk_1E6AF99E8;
  id v22 = v19;
  id v69 = v22;
  id v23 = (id)[v5 appendBool:deviceStationaryDetectionEnabledWhenUnlocked counterpart:v68];
  double deviceStationaryDetectionStationaryThreshold = self->_deviceStationaryDetectionStationaryThreshold;
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = __33__SBCaptureButtonPolicy_isEqual___block_invoke_7;
  v66[3] = &unk_1E6AFD028;
  id v25 = v22;
  id v67 = v25;
  id v26 = (id)[v5 appendDouble:v66 counterpart:deviceStationaryDetectionStationaryThreshold];
  double deviceStationaryDetectionStationaryPickUpBuffer = self->_deviceStationaryDetectionStationaryPickUpBuffer;
  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = __33__SBCaptureButtonPolicy_isEqual___block_invoke_8;
  v64[3] = &unk_1E6AFD028;
  id v28 = v25;
  id v65 = v28;
  id v29 = (id)[v5 appendDouble:v64 counterpart:deviceStationaryDetectionStationaryPickUpBuffer];
  double deviceStationaryDetectionStationaryDebounceInterval = self->_deviceStationaryDetectionStationaryDebounceInterval;
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __33__SBCaptureButtonPolicy_isEqual___block_invoke_9;
  v62[3] = &unk_1E6AFD028;
  id v31 = v28;
  id v63 = v31;
  id v32 = (id)[v5 appendDouble:v62 counterpart:deviceStationaryDetectionStationaryDebounceInterval];
  BOOL suppressionEnabled = self->_suppressionEnabled;
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __33__SBCaptureButtonPolicy_isEqual___block_invoke_10;
  v60[3] = &unk_1E6AF99E8;
  id v34 = v31;
  id v61 = v34;
  id v35 = (id)[v5 appendBool:suppressionEnabled counterpart:v60];
  BOOL launchIfUnobstructedWhileButtonDownEnabled = self->_launchIfUnobstructedWhileButtonDownEnabled;
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __33__SBCaptureButtonPolicy_isEqual___block_invoke_11;
  v58[3] = &unk_1E6AF99E8;
  id v37 = v34;
  id v59 = v37;
  id v38 = (id)[v5 appendBool:launchIfUnobstructedWhileButtonDownEnabled counterpart:v58];
  BOOL launchIfUnobstructedPromptlyAfterButtonUpEnabled = self->_launchIfUnobstructedPromptlyAfterButtonUpEnabled;
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __33__SBCaptureButtonPolicy_isEqual___block_invoke_12;
  v56[3] = &unk_1E6AF99E8;
  id v40 = v37;
  id v57 = v40;
  id v41 = (id)[v5 appendBool:launchIfUnobstructedPromptlyAfterButtonUpEnabled counterpart:v56];
  wakingBacklightStates = self->_wakingBacklightStates;
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __33__SBCaptureButtonPolicy_isEqual___block_invoke_13;
  v54[3] = &unk_1E6B00680;
  id v43 = v40;
  id v55 = v43;
  id v44 = (id)[v5 appendObject:wakingBacklightStates counterpart:v54];
  BOOL visionIntelligenceEnabled = self->_visionIntelligenceEnabled;
  uint64_t v49 = MEMORY[0x1E4F143A8];
  uint64_t v50 = 3221225472;
  v51 = __33__SBCaptureButtonPolicy_isEqual___block_invoke_14;
  v52 = &unk_1E6AF99E8;
  id v53 = v43;
  id v46 = v43;
  id v47 = (id)[v5 appendBool:visionIntelligenceEnabled counterpart:&v49];
  LOBYTE(v43) = objc_msgSend(v5, "isEqual", v49, v50, v51, v52);

  return (char)v43;
}

uint64_t __33__SBCaptureButtonPolicy_isEqual___block_invoke(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 8);
}

uint64_t __33__SBCaptureButtonPolicy_isEqual___block_invoke_2(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 9);
}

uint64_t __33__SBCaptureButtonPolicy_isEqual___block_invoke_3(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 10);
}

double __33__SBCaptureButtonPolicy_isEqual___block_invoke_4(uint64_t a1)
{
  return *(double *)(*(void *)(a1 + 32) + 32);
}

uint64_t __33__SBCaptureButtonPolicy_isEqual___block_invoke_5(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 11);
}

uint64_t __33__SBCaptureButtonPolicy_isEqual___block_invoke_6(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 12);
}

double __33__SBCaptureButtonPolicy_isEqual___block_invoke_7(uint64_t a1)
{
  return *(double *)(*(void *)(a1 + 32) + 40);
}

double __33__SBCaptureButtonPolicy_isEqual___block_invoke_8(uint64_t a1)
{
  return *(double *)(*(void *)(a1 + 32) + 48);
}

double __33__SBCaptureButtonPolicy_isEqual___block_invoke_9(uint64_t a1)
{
  return *(double *)(*(void *)(a1 + 32) + 56);
}

uint64_t __33__SBCaptureButtonPolicy_isEqual___block_invoke_10(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 13);
}

uint64_t __33__SBCaptureButtonPolicy_isEqual___block_invoke_11(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 14);
}

uint64_t __33__SBCaptureButtonPolicy_isEqual___block_invoke_12(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 15);
}

id __33__SBCaptureButtonPolicy_isEqual___block_invoke_13(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 24);
}

uint64_t __33__SBCaptureButtonPolicy_isEqual___block_invoke_14(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 16);
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendBool:self->_consoleModeMitigationEnabled];
  id v5 = (id)[v3 appendBool:self->_wakeEnabled];
  id v6 = (id)[v3 appendBool:self->_directLaunchAfterUnsuppressEnabled];
  id v7 = (id)[v3 appendDouble:self->_directLaunchAfterUnsuppressGracePeriod];
  id v8 = (id)[v3 appendBool:self->_deviceStationaryDetectionEnabled];
  id v9 = (id)[v3 appendBool:self->_deviceStationaryDetectionEnabledWhenUnlocked];
  id v10 = (id)[v3 appendDouble:self->_deviceStationaryDetectionStationaryThreshold];
  id v11 = (id)[v3 appendDouble:self->_deviceStationaryDetectionStationaryPickUpBuffer];
  id v12 = (id)[v3 appendDouble:self->_deviceStationaryDetectionStationaryDebounceInterval];
  id v13 = (id)[v3 appendBool:self->_suppressionEnabled];
  id v14 = (id)[v3 appendBool:self->_launchIfUnobstructedWhileButtonDownEnabled];
  id v15 = (id)[v3 appendBool:self->_launchIfUnobstructedPromptlyAfterButtonUpEnabled];
  id v16 = (id)[v3 appendObject:self->_wakingBacklightStates];
  id v17 = (id)[v3 appendBool:self->_visionIntelligenceEnabled];
  unint64_t v18 = [v3 hash];

  return v18;
}

- (NSString)description
{
  v2 = [(SBCaptureButtonPolicy *)self dictionaryRepresentation];
  v3 = [v2 description];

  return (NSString *)v3;
}

- (id)dictionaryRepresentation
{
  v20[14] = *MEMORY[0x1E4F143B8];
  v19[0] = @"ConsoleModeMitigationEnabled";
  unint64_t v18 = [NSNumber numberWithBool:self->_consoleModeMitigationEnabled];
  v20[0] = v18;
  v19[1] = @"WakeEnabled";
  id v17 = [NSNumber numberWithBool:self->_wakeEnabled];
  v20[1] = v17;
  v19[2] = @"DirectLaunchAfterUnsuppressEnabled";
  id v16 = [NSNumber numberWithBool:self->_directLaunchAfterUnsuppressEnabled];
  v20[2] = v16;
  v19[3] = @"DirectLaunchAfterUnsuppressGracePeriod";
  id v15 = [NSNumber numberWithDouble:self->_directLaunchAfterUnsuppressGracePeriod];
  v20[3] = v15;
  v19[4] = @"DeviceStationaryDetectionEnabled";
  id v14 = [NSNumber numberWithBool:self->_deviceStationaryDetectionEnabled];
  v20[4] = v14;
  v19[5] = @"DeviceStationaryDetectionEnabledWhenUnlocked";
  v3 = [NSNumber numberWithBool:self->_deviceStationaryDetectionEnabledWhenUnlocked];
  v20[5] = v3;
  v19[6] = @"DeviceStationaryDetectionStationaryThreshold";
  id v4 = [NSNumber numberWithDouble:self->_deviceStationaryDetectionStationaryThreshold];
  v20[6] = v4;
  v19[7] = @"DeviceStationaryDetectionStationaryPickUpBuffer";
  id v5 = [NSNumber numberWithDouble:self->_deviceStationaryDetectionStationaryPickUpBuffer];
  v20[7] = v5;
  v19[8] = @"DeviceStationaryDetectionStationaryDebounceInterval";
  id v6 = [NSNumber numberWithDouble:self->_deviceStationaryDetectionStationaryDebounceInterval];
  v20[8] = v6;
  v19[9] = @"SuppressionEnabled";
  id v7 = [NSNumber numberWithBool:self->_suppressionEnabled];
  v20[9] = v7;
  v19[10] = @"LaunchIfUnobstructedWhileButtonDownEnabled";
  id v8 = [NSNumber numberWithBool:self->_launchIfUnobstructedWhileButtonDownEnabled];
  v20[10] = v8;
  v19[11] = @"LaunchIfUnobstructedPromptlyAfterButtonUpEnabled";
  id v9 = [NSNumber numberWithBool:self->_launchIfUnobstructedPromptlyAfterButtonUpEnabled];
  v20[11] = v9;
  v19[12] = @"WakingBacklightStates";
  id v10 = [(NSArray *)self->_wakingBacklightStates bs_compactMap:&__block_literal_global_137];
  v20[12] = v10;
  v19[13] = @"VisionIntelligenceEnabled";
  id v11 = [NSNumber numberWithBool:self->_visionIntelligenceEnabled];
  v20[13] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:14];

  return v12;
}

__CFString *__49__SBCaptureButtonPolicy_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (int)[a2 intValue];
  return SBBacklightStateDescription(v2);
}

- (SBCaptureButtonPolicy)initWithDictionary:(id)a3
{
  id v3 = a3;
  v39 = [v3 objectForKeyedSubscript:@"ConsoleModeMitigationEnabled"];
  unsigned int v33 = [v39 BOOLValue];
  id v38 = [v3 objectForKeyedSubscript:@"WakeEnabled"];
  unsigned int v32 = [v38 BOOLValue];
  id v37 = [v3 objectForKeyedSubscript:@"DirectLaunchAfterUnsuppressEnabled"];
  unsigned int v30 = [v37 BOOLValue];
  v36 = [v3 objectForKeyedSubscript:@"DirectLaunchAfterUnsuppressGracePeriod"];
  [v36 doubleValue];
  double v5 = v4;
  id v34 = [v3 objectForKeyedSubscript:@"DeviceStationaryDetectionEnabled"];
  unsigned int v28 = [v34 BOOLValue];
  id v31 = [v3 objectForKeyedSubscript:@"DeviceStationaryDetectionEnabledWhenUnlocked"];
  unsigned int v26 = [v31 BOOLValue];
  id v29 = [v3 objectForKeyedSubscript:@"DeviceStationaryDetectionStationaryThreshold"];
  [v29 doubleValue];
  double v7 = v6;
  id v27 = [v3 objectForKeyedSubscript:@"DeviceStationaryDetectionStationaryPickUpBuffer"];
  [v27 doubleValue];
  double v9 = v8;
  id v25 = [v3 objectForKeyedSubscript:@"DeviceStationaryDetectionStationaryDebounceInterval"];
  [v25 doubleValue];
  double v11 = v10;
  id v12 = [v3 objectForKeyedSubscript:@"SuppressionEnabled"];
  uint64_t v13 = [v12 BOOLValue];
  id v14 = [v3 objectForKeyedSubscript:@"LaunchIfUnobstructedWhileButtonDownEnabled"];
  char v15 = [v14 BOOLValue];
  id v16 = [v3 objectForKeyedSubscript:@"LaunchIfUnobstructedPromptlyAfterButtonUpEnabled"];
  char v17 = [v16 BOOLValue];
  unint64_t v18 = [v3 objectForKeyedSubscript:@"WakingBacklightStates"];
  id v19 = objc_msgSend(v18, "bs_compactMap:", &__block_literal_global_50_0);
  id v20 = [v3 objectForKeyedSubscript:@"VisionIntelligenceEnabled"];

  LOBYTE(v24) = [v20 BOOLValue];
  BYTE1(v23) = v17;
  LOBYTE(v23) = v15;
  v21 = -[SBCaptureButtonPolicy initWithConsoleModeEnabled:wakeEnabled:directLaunchAfterUnsuppressEnabled:directLaunchAfterUnsuppressGracePeriod:deviceStationaryDetectionEnabled:deviceStationaryDetectionEnabledWhenUnlocked:deviceStationaryDetectionStationaryThreshold:deviceStationaryDetectionStationaryPickUpBuffer:deviceStationaryDetectionStationaryDebounceInterval:suppressionEnabled:launchIfUnobstructedWhileButtonDownEnabled:launchIfUnobstructedPromptlyAfterButtonUpEnabled:wakingBacklightStates:visionIntelligenceEnabled:](self, "initWithConsoleModeEnabled:wakeEnabled:directLaunchAfterUnsuppressEnabled:directLaunchAfterUnsuppressGracePeriod:deviceStationaryDetectionEnabled:deviceStationaryDetectionEnabledWhenUnlocked:deviceStationaryDetectionStationaryThreshold:deviceStationaryDetectionStationaryPickUpBuffer:deviceStationaryDetectionStationaryDebounceInterval:suppressionEnabled:launchIfUnobstructedWhileButtonDownEnabled:launchIfUnobstructedPromptlyAfterButtonUpEnabled:wakingBacklightStates:visionIntelligenceEnabled:", v33, v32, v30, v28, v26, v13, v5, v7, v9, v11, v23, v19, v24);

  return v21;
}

uint64_t __44__SBCaptureButtonPolicy_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = NSNumber;
  uint64_t v3 = SBBacklightStateFromString(a2);
  return [v2 numberWithInteger:v3];
}

- (BOOL)consoleModeMitigationEnabled
{
  return self->_consoleModeMitigationEnabled;
}

- (BOOL)wakeEnabled
{
  return self->_wakeEnabled;
}

- (NSArray)wakingBacklightStates
{
  return self->_wakingBacklightStates;
}

- (BOOL)directLaunchAfterUnsuppressEnabled
{
  return self->_directLaunchAfterUnsuppressEnabled;
}

- (double)directLaunchAfterUnsuppressGracePeriod
{
  return self->_directLaunchAfterUnsuppressGracePeriod;
}

- (BOOL)deviceStationaryDetectionEnabled
{
  return self->_deviceStationaryDetectionEnabled;
}

- (BOOL)deviceStationaryDetectionEnabledWhenUnlocked
{
  return self->_deviceStationaryDetectionEnabledWhenUnlocked;
}

- (double)deviceStationaryDetectionStationaryThreshold
{
  return self->_deviceStationaryDetectionStationaryThreshold;
}

- (double)deviceStationaryDetectionStationaryPickUpBuffer
{
  return self->_deviceStationaryDetectionStationaryPickUpBuffer;
}

- (double)deviceStationaryDetectionStationaryDebounceInterval
{
  return self->_deviceStationaryDetectionStationaryDebounceInterval;
}

- (BOOL)suppressionEnabled
{
  return self->_suppressionEnabled;
}

- (BOOL)launchIfUnobstructedWhileButtonDownEnabled
{
  return self->_launchIfUnobstructedWhileButtonDownEnabled;
}

- (BOOL)launchIfUnobstructedPromptlyAfterButtonUpEnabled
{
  return self->_launchIfUnobstructedPromptlyAfterButtonUpEnabled;
}

- (BOOL)isVisionIntelligenceEnabled
{
  return self->_visionIntelligenceEnabled;
}

- (void).cxx_destruct
{
}

@end