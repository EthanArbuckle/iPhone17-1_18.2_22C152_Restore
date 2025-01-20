@interface SBFObliterationController
+ (id)sharedInstance;
- (void)_doObliterateWithType:(__CFString *)a3 eraseDataPlan:(BOOL)a4 showingProgress:(BOOL)a5 options:(id)a6;
- (void)markObliterationStart;
- (void)obliterateDataPartitionShowingProgress:(BOOL)a3 skipDataObliteration:(BOOL)a4 eraseDataPlan:(BOOL)a5 reason:(id)a6;
- (void)wipeAndBrickShowingProgress:(BOOL)a3 reason:(id)a4;
@end

@implementation SBFObliterationController

+ (id)sharedInstance
{
  if (sharedInstance_once != -1) {
    dispatch_once(&sharedInstance_once, &__block_literal_global);
  }
  v2 = (void *)sharedInstance_instance;
  return v2;
}

uint64_t __43__SBFObliterationController_sharedInstance__block_invoke()
{
  kdebug_trace();
  v0 = objc_alloc_init(SBFObliterationController);
  v1 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v0;

  return kdebug_trace();
}

- (void)_doObliterateWithType:(__CFString *)a3 eraseDataPlan:(BOOL)a4 showingProgress:(BOOL)a5 options:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  id v9 = a6;
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v9];
  [v10 setObject:a3 forKeyedSubscript:*MEMORY[0x1E4F78180]];
  v11 = [NSNumber numberWithBool:v6];
  [v10 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F78168]];

  v12 = objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle", 0, 0, 0, 0, 0);
  uint64_t v13 = [v12 bundleIdentifier];
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  v14 = (uint64_t (*)(void, uint64_t, uint64_t (*)(), long long *))get_CTServerConnectionCreateWithIdentifierSymbolLoc_ptr;
  v39 = get_CTServerConnectionCreateWithIdentifierSymbolLoc_ptr;
  if (!get_CTServerConnectionCreateWithIdentifierSymbolLoc_ptr)
  {
    uint64_t v31 = MEMORY[0x1E4F143A8];
    uint64_t v32 = 3221225472;
    v33 = __get_CTServerConnectionCreateWithIdentifierSymbolLoc_block_invoke;
    v34 = &unk_1E548C938;
    v35 = &v36;
    v15 = (void *)CoreTelephonyLibrary();
    v37[3] = (uint64_t)dlsym(v15, "_CTServerConnectionCreateWithIdentifier");
    get_CTServerConnectionCreateWithIdentifierSymbolLoc_ptr = *(_UNKNOWN **)(v35[1] + 24);
    v14 = (uint64_t (*)(void, uint64_t, uint64_t (*)(), long long *))v37[3];
  }
  _Block_object_dispose(&v36, 8);
  if (!v14) {
    -[SBFObliterationController _doObliterateWithType:eraseDataPlan:showingProgress:options:]();
  }
  v16 = (const void *)v14(*MEMORY[0x1E4F1CF80], v13, _ResetCTServerConnectionCallback, &v30);

  if (v16)
  {
    if (v7)
    {
      uint64_t v36 = 0;
      v37 = &v36;
      uint64_t v38 = 0x2020000000;
      v17 = (void (*)(const void *))get_CTServerConnectionEraseAllUserProfilesSymbolLoc_ptr;
      v39 = get_CTServerConnectionEraseAllUserProfilesSymbolLoc_ptr;
      if (!get_CTServerConnectionEraseAllUserProfilesSymbolLoc_ptr)
      {
        uint64_t v31 = MEMORY[0x1E4F143A8];
        uint64_t v32 = 3221225472;
        v33 = __get_CTServerConnectionEraseAllUserProfilesSymbolLoc_block_invoke;
        v34 = &unk_1E548C938;
        v35 = &v36;
        v18 = (void *)CoreTelephonyLibrary();
        v19 = dlsym(v18, "_CTServerConnectionEraseAllUserProfiles");
        *(void *)(v35[1] + 24) = v19;
        get_CTServerConnectionEraseAllUserProfilesSymbolLoc_ptr = *(_UNKNOWN **)(v35[1] + 24);
        v17 = (void (*)(const void *))v37[3];
      }
      _Block_object_dispose(&v36, 8);
      if (!v17) {
        -[SBFObliterationController _doObliterateWithType:eraseDataPlan:showingProgress:options:].cold.5();
      }
      v17(v16);
    }
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x2020000000;
    v20 = (id *)getkCTBasebandSettingsEraseEFSSymbolLoc_ptr;
    v39 = (void *)getkCTBasebandSettingsEraseEFSSymbolLoc_ptr;
    if (!getkCTBasebandSettingsEraseEFSSymbolLoc_ptr)
    {
      uint64_t v31 = MEMORY[0x1E4F143A8];
      uint64_t v32 = 3221225472;
      v33 = __getkCTBasebandSettingsEraseEFSSymbolLoc_block_invoke;
      v34 = &unk_1E548C938;
      v35 = &v36;
      v21 = (void *)CoreTelephonyLibrary();
      v22 = dlsym(v21, "kCTBasebandSettingsEraseEFS");
      *(void *)(v35[1] + 24) = v22;
      getkCTBasebandSettingsEraseEFSSymbolLoc_ptr = *(void *)(v35[1] + 24);
      v20 = (id *)v37[3];
    }
    _Block_object_dispose(&v36, 8);
    if (!v20) {
      -[SBFObliterationController _doObliterateWithType:eraseDataPlan:showingProgress:options:].cold.6();
    }
    id v23 = *v20;
    uint64_t v36 = 0;
    v37 = &v36;
    uint64_t v38 = 0x2020000000;
    v24 = (void (*)(const void *, id))get_CTServerConnectionEraseBasebandSettingsSymbolLoc_ptr;
    v39 = get_CTServerConnectionEraseBasebandSettingsSymbolLoc_ptr;
    if (!get_CTServerConnectionEraseBasebandSettingsSymbolLoc_ptr)
    {
      uint64_t v31 = MEMORY[0x1E4F143A8];
      uint64_t v32 = 3221225472;
      v33 = __get_CTServerConnectionEraseBasebandSettingsSymbolLoc_block_invoke;
      v34 = &unk_1E548C938;
      v35 = &v36;
      v25 = (void *)CoreTelephonyLibrary();
      v26 = dlsym(v25, "_CTServerConnectionEraseBasebandSettings");
      *(void *)(v35[1] + 24) = v26;
      get_CTServerConnectionEraseBasebandSettingsSymbolLoc_ptr = *(_UNKNOWN **)(v35[1] + 24);
      v24 = (void (*)(const void *, id))v37[3];
    }
    _Block_object_dispose(&v36, 8);
    if (!v24) {
      -[SBFObliterationController _doObliterateWithType:eraseDataPlan:showingProgress:options:].cold.7();
    }
    v24(v16, v23);
    CFRelease(v16);
  }
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  v27 = (void (*)(uint64_t, void))getSOSCCBailFromCircle_BestEffortSymbolLoc_ptr;
  v39 = getSOSCCBailFromCircle_BestEffortSymbolLoc_ptr;
  if (!getSOSCCBailFromCircle_BestEffortSymbolLoc_ptr)
  {
    uint64_t v31 = MEMORY[0x1E4F143A8];
    uint64_t v32 = 3221225472;
    v33 = __getSOSCCBailFromCircle_BestEffortSymbolLoc_block_invoke;
    v34 = &unk_1E548C938;
    v35 = &v36;
    __getSOSCCBailFromCircle_BestEffortSymbolLoc_block_invoke((uint64_t)&v31);
    v27 = (void (*)(uint64_t, void))v37[3];
  }
  _Block_object_dispose(&v36, 8);
  if (!v27) {
    -[SBFObliterationController _doObliterateWithType:eraseDataPlan:showingProgress:options:]();
  }
  v27(5, 0);
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  v28 = (void (*)(uint64_t))getIDSHardDeregisterSymbolLoc_ptr;
  v39 = getIDSHardDeregisterSymbolLoc_ptr;
  if (!getIDSHardDeregisterSymbolLoc_ptr)
  {
    uint64_t v31 = MEMORY[0x1E4F143A8];
    uint64_t v32 = 3221225472;
    v33 = __getIDSHardDeregisterSymbolLoc_block_invoke;
    v34 = &unk_1E548C938;
    v35 = &v36;
    __getIDSHardDeregisterSymbolLoc_block_invoke((uint64_t)&v31);
    v28 = (void (*)(uint64_t))v37[3];
  }
  _Block_object_dispose(&v36, 8);
  if (!v28) {
    -[SBFObliterationController _doObliterateWithType:eraseDataPlan:showingProgress:options:]();
  }
  v28(5);
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x2020000000;
  v29 = (void (*)(uint64_t))getAKUnregisterAllAppleIDsSymbolLoc_ptr;
  v39 = getAKUnregisterAllAppleIDsSymbolLoc_ptr;
  if (!getAKUnregisterAllAppleIDsSymbolLoc_ptr)
  {
    uint64_t v31 = MEMORY[0x1E4F143A8];
    uint64_t v32 = 3221225472;
    v33 = __getAKUnregisterAllAppleIDsSymbolLoc_block_invoke;
    v34 = &unk_1E548C938;
    v35 = &v36;
    __getAKUnregisterAllAppleIDsSymbolLoc_block_invoke((uint64_t)&v31);
    v29 = (void (*)(uint64_t))v37[3];
  }
  _Block_object_dispose(&v36, 8);
  if (!v29) {
    -[SBFObliterationController _doObliterateWithType:eraseDataPlan:showingProgress:options:].cold.4();
  }
  v29(5);
  Mobile_Obliterate();
}

- (void)wipeAndBrickShowingProgress:(BOOL)a3 reason:(id)a4
{
  BOOL v4 = a3;
  v10[1] = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    uint64_t v9 = *MEMORY[0x1E4F78178];
    v10[0] = a4;
    BOOL v6 = (void *)MEMORY[0x1E4F1C9E8];
    id v7 = a4;
    v8 = [v6 dictionaryWithObjects:v10 forKeys:&v9 count:1];
  }
  else
  {
    v8 = 0;
  }
  [(SBFObliterationController *)self _doObliterateWithType:*MEMORY[0x1E4F78190] eraseDataPlan:1 showingProgress:v4 options:v8];
}

- (void)obliterateDataPartitionShowingProgress:(BOOL)a3 skipDataObliteration:(BOOL)a4 eraseDataPlan:(BOOL)a5 reason:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v12 = a6;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v11 = v10;
  if (v7) {
    [v10 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F78198]];
  }
  if (v12) {
    [v11 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F78178]];
  }
  [(SBFObliterationController *)self _doObliterateWithType:*MEMORY[0x1E4F78170] eraseDataPlan:v6 showingProgress:v8 options:v11];
}

- (void)markObliterationStart
{
  v3[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F78180];
  v3[0] = *MEMORY[0x1E4F78188];
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:&v2 count:1];
  Mobile_Obliterate();
}

- (void)_doObliterateWithType:eraseDataPlan:showingProgress:options:.cold.1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = objc_msgSend(NSString, "stringWithUTF8String:", "CTServerConnectionRef soft_CTServerConnectionCreateWithIdentifier(CFAllocatorRef, CFStringRef, CTServerConnectionCallback, _CTServerConnectionContext *)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBFObliterationController.m", 25, @"%s", dlerror());

  __break(1u);
}

- (void)_doObliterateWithType:eraseDataPlan:showingProgress:options:.cold.2()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = objc_msgSend(NSString, "stringWithUTF8String:", "_Bool soft_SOSCCBailFromCircle_BestEffort(uint64_t, CFErrorRef *)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBFObliterationController.m", 36, @"%s", dlerror());

  __break(1u);
}

- (void)_doObliterateWithType:eraseDataPlan:showingProgress:options:.cold.3()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"void soft_IDSHardDeregister(uint32_t)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBFObliterationController.m", 32, @"%s", dlerror());

  __break(1u);
}

- (void)_doObliterateWithType:eraseDataPlan:showingProgress:options:.cold.4()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"void soft_AKUnregisterAllAppleIDs(uint32_t)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBFObliterationController.m", 40, @"%s", dlerror());

  __break(1u);
}

- (void)_doObliterateWithType:eraseDataPlan:showingProgress:options:.cold.5()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"CTError soft_CTServerConnectionEraseAllUserProfiles(CTServerConnectionRef)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBFObliterationController.m", 27, @"%s", dlerror());

  __break(1u);
}

- (void)_doObliterateWithType:eraseDataPlan:showingProgress:options:.cold.6()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getkCTBasebandSettingsEraseEFS(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBFObliterationController.m", 23, @"%s", dlerror());

  __break(1u);
}

- (void)_doObliterateWithType:eraseDataPlan:showingProgress:options:.cold.7()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = objc_msgSend(NSString, "stringWithUTF8String:", "CTError soft_CTServerConnectionEraseBasebandSettings(CTServerConnectionRef, CFStringRef)");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SBFObliterationController.m", 26, @"%s", dlerror());

  __break(1u);
}

@end