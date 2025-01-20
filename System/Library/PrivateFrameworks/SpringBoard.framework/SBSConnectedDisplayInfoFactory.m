@interface SBSConnectedDisplayInfoFactory
- (id)_effectiveSettingsForDisplayConfiguration:(id)a3 defaults:(id)a4;
- (id)connectedDisplayInfoForDisplayConfiguration:(id)a3 externalDisplayDefaults:(id)a4;
- (unint64_t)_supportedScalesForDisplayConfiguration:(id)a3 defaults:(id)a4 error:(id *)a5;
@end

@implementation SBSConnectedDisplayInfoFactory

- (id)connectedDisplayInfoForDisplayConfiguration:(id)a3 externalDisplayDefaults:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 hardwareIdentifier];
  v9 = [MEMORY[0x1E4F39B60] displays];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __102__SBSConnectedDisplayInfoFactory_connectedDisplayInfoForDisplayConfiguration_externalDisplayDefaults___block_invoke;
  v27[3] = &unk_1E6B09AD8;
  id v25 = v8;
  id v28 = v25;
  v10 = objc_msgSend(v9, "bs_firstObjectPassingTest:", v27);

  id v11 = objc_alloc(MEMORY[0x1E4FA6B80]);
  uint64_t v12 = [v7 arrangementEdge];
  [v7 arrangementOffset];
  v26 = objc_msgSend(v11, "initWithDisplayIdentifier:edge:offset:", 0, v12);
  if (v10)
  {
    unint64_t v13 = [(SBSConnectedDisplayInfoFactory *)self _supportedScalesForDisplayConfiguration:v6 defaults:v7 error:0];
    v14 = [(SBSConnectedDisplayInfoFactory *)self _effectiveSettingsForDisplayConfiguration:v6 defaults:v7];
  }
  else
  {
    v14 = 0;
    unint64_t v13 = 0;
  }
  v15 = (void *)[v10 immutableCopy];
  v16 = [v15 productName];
  if (![(__CFString *)v16 length])
  {
    v17 = [v6 deviceName];

    if ([(__CFString *)v17 length])
    {
      v16 = v17;
    }
    else
    {
      v18 = SBLogDisplayControlling();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543874;
        v30 = v15;
        __int16 v31 = 2114;
        v32 = v10;
        __int16 v33 = 2114;
        id v34 = v6;
        _os_log_fault_impl(&dword_1D85BA000, v18, OS_LOG_TYPE_FAULT, "failed to retrieve productName and deviceName for display. immutableCADisplay: %{public}@; caDisplay: %{public"
          "}@; displayConfiguration: %{public}@",
          buf,
          0x20u);
      }

      v16 = @"External Display";
    }
  }
  id v19 = objc_alloc(MEMORY[0x1E4FA6A58]);
  v20 = [v6 deviceName];
  [v6 bounds];
  v23 = objc_msgSend(v19, "initWithIdentifier:deviceName:displayName:size:mirrored:supportedScales:displayModeSettings:arrangement:", v25, v20, v16, objc_msgSend(v7, "isMirroringEnabled"), v13, v14, v21, v22, v26);

  return v23;
}

uint64_t __102__SBSConnectedDisplayInfoFactory_connectedDisplayInfoForDisplayConfiguration_externalDisplayDefaults___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 uniqueId];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (unint64_t)_supportedScalesForDisplayConfiguration:(id)a3 defaults:(id)a4 error:(id *)a5
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"SBSConnectedDisplayInfoFactory.m", 53, @"Invalid parameter not satisfying: %@", @"displayConfiguration" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  id v25 = [MEMORY[0x1E4F28B00] currentHandler];
  [v25 handleFailureInMethod:a2, self, @"SBSConnectedDisplayInfoFactory.m", 54, @"Invalid parameter not satisfying: %@", @"defaults" object file lineNumber description];

LABEL_3:
  uint64_t v12 = objc_msgSend(MEMORY[0x1E4FA5E58], "withDisplay:useNativeSize:", v9, objc_msgSend(v11, "chamois"));
  unint64_t v13 = [v12 supportedScales];

  if (v13)
  {
    id v14 = 0;
  }
  else
  {
    v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4FA6FD0];
    v30 = @"displayHardwareIdentifier";
    uint64_t v17 = [v9 hardwareIdentifier];
    v18 = (void *)v17;
    id v19 = @"<nil>";
    if (v17) {
      id v19 = (__CFString *)v17;
    }
    v31[0] = v19;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
    id v14 = [v15 errorWithDomain:v16 code:2 userInfo:v20];

    if (a5 && v14)
    {
      double v21 = SBLogDisplayControlling();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v23 = _SBFLoggingMethodProem();
        *(_DWORD *)buf = 138543618;
        v27 = v23;
        __int16 v28 = 2114;
        id v29 = v14;
        _os_log_error_impl(&dword_1D85BA000, v21, OS_LOG_TYPE_ERROR, "[%{public}@] error:%{public}@", buf, 0x16u);
      }
      id v14 = v14;
      *a5 = v14;
    }
  }

  return v13;
}

- (id)_effectiveSettingsForDisplayConfiguration:(id)a3 defaults:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SBSConnectedDisplayInfoFactory.m", 71, @"Invalid parameter not satisfying: %@", @"displayConfiguration" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  unint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
  [v13 handleFailureInMethod:a2, self, @"SBSConnectedDisplayInfoFactory.m", 72, @"Invalid parameter not satisfying: %@", @"defaults" object file lineNumber description];

LABEL_3:
  id v10 = [v9 displayModeSettingsForDisplay:v7];

  return v10;
}

@end