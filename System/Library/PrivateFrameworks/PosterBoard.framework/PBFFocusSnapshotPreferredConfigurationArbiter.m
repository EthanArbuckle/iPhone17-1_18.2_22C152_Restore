@interface PBFFocusSnapshotPreferredConfigurationArbiter
+ (void)determineDesiredConfigurations:(id *)a3 preferredConfiguration:(id *)a4 snapshotDefinition:(id *)a5 fromSwitcherConfiguration:(id)a6 configurationType:(int64_t)a7 variantType:(int64_t)a8 options:(unint64_t)a9 andFocusModeUUID:(id)a10 maxCount:(unint64_t)a11;
@end

@implementation PBFFocusSnapshotPreferredConfigurationArbiter

+ (void)determineDesiredConfigurations:(id *)a3 preferredConfiguration:(id *)a4 snapshotDefinition:(id *)a5 fromSwitcherConfiguration:(id)a6 configurationType:(int64_t)a7 variantType:(int64_t)a8 options:(unint64_t)a9 andFocusModeUUID:(id)a10 maxCount:(unint64_t)a11
{
  unint64_t v16 = a11;
  v49[1] = *MEMORY[0x1E4F143B8];
  id v17 = a6;
  id v18 = a10;
  v19 = [v17 configurations];
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __212__PBFFocusSnapshotPreferredConfigurationArbiter_determineDesiredConfigurations_preferredConfiguration_snapshotDefinition_fromSwitcherConfiguration_configurationType_variantType_options_andFocusModeUUID_maxCount___block_invoke;
  v46[3] = &unk_1E6981CC8;
  id v20 = v18;
  id v47 = v20;
  id v21 = v17;
  id v48 = v21;
  v22 = objc_msgSend(v19, "bs_filter:", v46);

  if ((unint64_t)(a7 + 1) < 2)
  {
    v23 = [v21 selectedConfiguration];
    if (!v23) {
      goto LABEL_8;
    }
LABEL_6:
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __212__PBFFocusSnapshotPreferredConfigurationArbiter_determineDesiredConfigurations_preferredConfiguration_snapshotDefinition_fromSwitcherConfiguration_configurationType_variantType_options_andFocusModeUUID_maxCount___block_invoke_2;
    v44[3] = &unk_1E69813A0;
    id v24 = v23;
    id v45 = v24;
    uint64_t v25 = [v22 sortedArrayUsingComparator:v44];

    v22 = (void *)v25;
    if (!v20) {
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  if (a7 == 1)
  {
    v23 = [v21 activeConfiguration];
    if (v23) {
      goto LABEL_6;
    }
  }
LABEL_8:
  id v24 = 0;
  if (!v20) {
    goto LABEL_12;
  }
LABEL_9:
  uint64_t v26 = [v22 count];
  if ((a9 & 2) != 0 && !v26)
  {
    v27 = [v21 activeConfiguration];
    v49[0] = v27;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:1];
    id v28 = v24;
    id v29 = v21;
    v30 = a5;
    id v31 = v20;
    int64_t v32 = a8;
    id v33 = a1;
    uint64_t v35 = v34 = a3;

    v22 = (void *)v35;
    a3 = v34;
    a1 = v33;
    a8 = v32;
    id v20 = v31;
    a5 = v30;
    id v21 = v29;
    id v24 = v28;
    unint64_t v16 = a11;
  }
LABEL_12:
  if (v16)
  {
    unint64_t v36 = [v22 count];
    if (v36 >= v16) {
      unint64_t v37 = v16;
    }
    else {
      unint64_t v37 = v36;
    }
    uint64_t v38 = objc_msgSend(v22, "subarrayWithRange:", 0, v37);

    v22 = (void *)v38;
  }
  if ((unint64_t)(a8 + 1) >= 2)
  {
    if (a8 != 1) {
      goto LABEL_31;
    }
    uint64_t v39 = +[PBFPosterSnapshotDefinition switcherUnlockedSnapshotDefinition];
  }
  else
  {
    uint64_t v39 = +[PBFPosterSnapshotDefinition gallerySnapshotWithComplicationsDefinition];
  }
  v40 = (void *)v39;
  if (v39)
  {
    if (a4) {
      *a4 = v24;
    }
    if (a5) {
      *a5 = v40;
    }
    if (a3) {
      *a3 = v22;
    }
    if (a5) {
      *a5 = v40;
    }

    return;
  }
LABEL_31:
  v41 = [NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"snapshotDefinition != nil"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    +[PBFFocusSnapshotPreferredConfigurationArbiter determineDesiredConfigurations:preferredConfiguration:snapshotDefinition:fromSwitcherConfiguration:configurationType:variantType:options:andFocusModeUUID:maxCount:](a2, (uint64_t)a1, (uint64_t)v41);
  }
  [v41 UTF8String];
  _bs_set_crash_log_message();
  __break(0);
}

uint64_t __212__PBFFocusSnapshotPreferredConfigurationArbiter_determineDesiredConfigurations_preferredConfiguration_snapshotDefinition_fromSwitcherConfiguration_configurationType_variantType_options_andFocusModeUUID_maxCount___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!*(void *)(a1 + 32)) {
    return 1;
  }
  v3 = [*(id *)(a1 + 40) focusConfigurationForPoster:a2];
  v4 = [v3 activityUUID];

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    v6 = [v4 UUIDString];
    uint64_t v7 = [v5 isEqualToString:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t __212__PBFFocusSnapshotPreferredConfigurationArbiter_determineDesiredConfigurations_preferredConfiguration_snapshotDefinition_fromSwitcherConfiguration_configurationType_variantType_options_andFocusModeUUID_maxCount___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if ([a2 isEqual:*(void *)(a1 + 32)]) {
    uint64_t v6 = -1;
  }
  else {
    uint64_t v6 = [v5 isEqual:*(void *)(a1 + 32)];
  }

  return v6;
}

+ (void)determineDesiredConfigurations:(uint64_t)a3 preferredConfiguration:snapshotDefinition:fromSwitcherConfiguration:configurationType:variantType:options:andFocusModeUUID:maxCount:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = NSStringFromSelector(a1);
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  v9 = v5;
  __int16 v10 = 2114;
  v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  v15 = @"PBFFocusSnapshotPreferredConfigurationArbiter.m";
  __int16 v16 = 1024;
  int v17 = 82;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1D31CE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

@end