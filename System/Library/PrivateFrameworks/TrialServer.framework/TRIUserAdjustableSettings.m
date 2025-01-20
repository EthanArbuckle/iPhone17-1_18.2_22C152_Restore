@interface TRIUserAdjustableSettings
+ (BOOL)getExperimentOptOut:(id)a3;
+ (unsigned)_optOutSoftwareUpdatePreferenceForAnyUser;
+ (void)_deactivateAllActiveExperimentsWithServerContext:(id)a3;
+ (void)updateExperimentOptOutStateWithServerContext:(id)a3;
@end

@implementation TRIUserAdjustableSettings

+ (void)updateExperimentOptOutStateWithServerContext:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, a1, @"TRIUserAdjustableSettings.m", 37, @"Invalid parameter not satisfying: %@", @"serverContext" object file lineNumber description];
  }
  v6 = [v5 keyValueStore];

  if (!v6)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"TRIUserAdjustableSettings.m", 38, @"Invalid parameter not satisfying: %@", @"serverContext.keyValueStore" object file lineNumber description];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__TRIUserAdjustableSettings_updateExperimentOptOutStateWithServerContext___block_invoke;
  block[3] = &unk_1E6BB8450;
  id v14 = v5;
  id v15 = a1;
  uint64_t v7 = qword_1EA8D8098;
  id v8 = v5;
  if (v7 != -1) {
    dispatch_once(&qword_1EA8D8098, block);
  }
  v9 = v14;
  id v10 = (id)_MergedGlobals_39;

  [v10 runAfterDelaySeconds:1 coalescingBehavior:5.0];
}

void __74__TRIUserAdjustableSettings_updateExperimentOptOutStateWithServerContext___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E016E7F0]();
  id v3 = objc_alloc(MEMORY[0x1E4F93B98]);
  v4 = [MEMORY[0x1E4F93B18] autoreleasingSerialQueueWithLabel:"com.apple.trial.user-optout-check-coalesce" qosClass:17];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__TRIUserAdjustableSettings_updateExperimentOptOutStateWithServerContext___block_invoke_2;
  v9[3] = &unk_1E6BB8450;
  long long v8 = *(_OWORD *)(a1 + 32);
  id v5 = (id)v8;
  long long v10 = v8;
  uint64_t v6 = [v3 initWithQueue:v4 operation:v9];

  uint64_t v7 = (void *)_MergedGlobals_39;
  _MergedGlobals_39 = v6;
}

void __74__TRIUserAdjustableSettings_updateExperimentOptOutStateWithServerContext___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 40) _optOutSoftwareUpdatePreferenceForAnyUser];
  id v3 = [*(id *)(a1 + 32) keyValueStore];
  v4 = +[TRIPersistentUserSettings settingsWithKeyValueStore:v3];

  int v5 = [v4 persistedOptOutStatus];
  uint64_t v6 = TRILogCategory_Server();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109376;
    v7[1] = v5;
    __int16 v8 = 1024;
    int v9 = v2;
    _os_log_impl(&dword_1DA291000, v6, OS_LOG_TYPE_DEFAULT, "Updating persisted experiment opt-out from: %d to: %d", (uint8_t *)v7, 0xEu);
  }

  [v4 persistOptOutStatus:v2];
  if (v2 == 1 && v5 != 1) {
    +[TRIUserAdjustableSettings _deactivateAllActiveExperimentsWithServerContext:*(void *)(a1 + 32)];
  }
}

+ (BOOL)getExperimentOptOut:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"TRIUserAdjustableSettings.m", 70, @"Invalid parameter not satisfying: %@", @"serverContext" object file lineNumber description];
  }
  uint64_t v6 = [v5 keyValueStore];

  if (!v6)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"TRIUserAdjustableSettings.m", 71, @"Invalid parameter not satisfying: %@", @"serverContext.keyValueStore" object file lineNumber description];
  }
  uint64_t v7 = [v5 keyValueStore];
  __int16 v8 = +[TRIPersistentUserSettings settingsWithKeyValueStore:v7];

  int v9 = [v8 persistedOptOutStatus];
  if (v9)
  {
    int v10 = v9;
    v11 = TRILogCategory_Server();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      BOOL v17 = v10 == 1;
      v12 = "Using persisted experiment opt-out: '%d'";
LABEL_10:
      _os_log_impl(&dword_1DA291000, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 8u);
    }
  }
  else
  {
    int v10 = [a1 _optOutSoftwareUpdatePreferenceForAnyUser];
    v11 = TRILogCategory_Server();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      BOOL v17 = v10 == 1;
      v12 = "No persisted opt-out state, returning current setting: '%d'";
      goto LABEL_10;
    }
  }

  return v10 == 1;
}

+ (void)_deactivateAllActiveExperimentsWithServerContext:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"TRIUserAdjustableSettings.m", 88, @"Invalid parameter not satisfying: %@", @"serverContext" object file lineNumber description];
  }
  uint64_t v6 = [v5 taskQueue];

  uint64_t v7 = TRILogCategory_Server();
  __int16 v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA291000, v8, OS_LOG_TYPE_DEFAULT, "Deactivating all experiments per opt-out", buf, 2u);
    }

    *(void *)buf = 0;
    v22 = buf;
    uint64_t v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__31;
    v25 = __Block_byref_object_dispose__31;
    id v26 = +[TRISequenceTask task];
    int v9 = [v5 experimentDatabase];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __78__TRIUserAdjustableSettings__deactivateAllActiveExperimentsWithServerContext___block_invoke;
    v20[3] = &unk_1E6BBB310;
    v20[4] = buf;
    char v10 = [v9 enumerateExperimentRecordsWithBlock:v20];

    if ((v10 & 1) == 0)
    {
      v11 = TRILogCategory_Server();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v19 = 0;
        _os_log_error_impl(&dword_1DA291000, v11, OS_LOG_TYPE_ERROR, "Unable to deactivate all active experiments (database query failed)", v19, 2u);
      }
    }
    v12 = +[TRITaskQueuingOptions defaultOptionsWithIgnoreDuplicates];
    v13 = [v5 taskQueue];
    char v14 = [v13 addTask:*((void *)v22 + 5) options:v12];

    id v15 = [v5 taskQueue];
    id v16 = [[TRIRunningXPCActivityDescriptor alloc] initForImmediateWorkWithCapabilities:0];
    [v15 resumeWithXPCActivityDescriptor:v16 executeWhenSuspended:0];

    if (v14 == 2)
    {
      BOOL v17 = TRILogCategory_Server();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v19 = 0;
        _os_log_error_impl(&dword_1DA291000, v17, OS_LOG_TYPE_ERROR, "Unable to deactivate all active experiments (failed to enqueue deactivation tasks)", v19, 2u);
      }
    }
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1DA291000, v8, OS_LOG_TYPE_ERROR, "Skipping deactivation due to uninitialized task queue", buf, 2u);
    }
  }
}

void __78__TRIUserAdjustableSettings__deactivateAllActiveExperimentsWithServerContext___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (![v7 deploymentEnvironment] && objc_msgSend(v7, "status") == 1)
  {
    id v3 = [v7 treatmentId];

    if (v3)
    {
      v4 = [v7 experimentDeployment];
      id v5 = [v4 experimentId];
      uint64_t v6 = +[TRIDeactivateTreatmentTask taskWithExperimentId:v5 deploymentId:0xFFFFFFFFLL failOnUnrecognizedExperiment:1 triggerEvent:12 taskAttribution:0];

      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addTaskToEndOfSequence:v6];
    }
  }
}

+ (unsigned)_optOutSoftwareUpdatePreferenceForAnyUser
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  CFStringRef v2 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
  CFStringRef v3 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
  CFPreferencesSynchronize(@"com.apple.softwareupdateservicesd", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  CFBooleanRef v4 = (const __CFBoolean *)CFPreferencesCopyValue(@"SUAutoInstallSystemDataFiles", @"com.apple.softwareupdateservicesd", v2, v3);
  if (!v4)
  {
    __int16 v8 = TRILogCategory_Server();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      CFBooleanRef v14 = 0;
      _os_log_impl(&dword_1DA291000, v8, OS_LOG_TYPE_DEFAULT, "Nothing to convert, value of opt-out preference: %{public}@", buf, 0xCu);
    }

    return 2;
  }
  CFBooleanRef v5 = v4;
  CFTypeID v6 = CFGetTypeID(v4);
  if (v6 == CFBooleanGetTypeID())
  {
    int Value = CFBooleanGetValue(v5);
    goto LABEL_10;
  }
  CFTypeID v9 = CFGetTypeID(v5);
  if (v9 != CFNumberGetTypeID())
  {
LABEL_15:
    CFRelease(v5);
    return 2;
  }
  int valuePtr = -1;
  if (!CFNumberGetValue(v5, kCFNumberIntType, &valuePtr))
  {
    v11 = TRILogCategory_Server();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      CFBooleanRef v14 = v5;
      _os_log_error_impl(&dword_1DA291000, v11, OS_LOG_TYPE_ERROR, "Failed to convert CFNumberRef value into int when getting opt-out preference: %{public}@", buf, 0xCu);
    }

    goto LABEL_15;
  }
  int Value = valuePtr;
LABEL_10:
  CFRelease(v5);
  if (!Value) {
    return 1;
  }
  return 2;
}

@end