void __HKSPPropertiesByIdentifier_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;
  uint64_t vars8;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = [v3 identifier];
  [v2 setObject:v3 forKeyedSubscript:v4];
}

void sub_1A7E76270(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t HKSPSyncAnchorClass()
{
  return objc_opt_class();
}

void *HKSPSyncAnchorDefaultValue()
{
  return &unk_1EFE65150;
}

void HKSPCopyFromObject(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v10 = [MEMORY[0x1E4F28B00] currentHandler];
      v11 = objc_msgSend(NSString, "stringWithUTF8String:", "void HKSPCopyFromObject(id<HKSPObject>  _Nonnull __strong, id<HKSPObject>  _Nonnull __strong)");
      [v10 handleFailureInFunction:v11 file:@"HKSPObject.m" lineNumber:197 description:@"objects must be subclasses"];
    }
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = objc_msgSend((id)objc_opt_class(), "allProperties", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v9++) copyValueFromObject:v3 toObject:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

id HKSPSleepScheduleOccurrenceProperties()
{
  v10[3] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v1 = [(HKSPProperty *)[_HKSPUnsignedIntegerProperty alloc] initWithIdentifier:@"HKSPOccurrenceVersion" propertyName:@"version"];
  v10[0] = v1;
  v2 = [_HKSPRelationshipProperty alloc];
  v9[0] = objc_opt_class();
  v9[1] = objc_opt_class();
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  id v4 = [(_HKSPObjectProperty *)v2 initWithIdentifier:@"HKSPOccurrenceBackingOccurrence", @"backingOccurrence", v3, v9[0] propertyName expectedValueClasses];
  v10[1] = v4;
  v5 = [(HKSPProperty *)[_HKSPUnsignedIntegerProperty alloc] initWithIdentifier:@"HKSPOccurrenceWeekdays" propertyName:@"weekdays"];
  v10[2] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];
  uint64_t v7 = [v0 setWithArray:v6];

  return v7;
}

void __HKSPSleepServerInterface_block_invoke()
{
  v126[1] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFE7E8D8];
  v1 = (void *)_MergedGlobals_12;
  _MergedGlobals_12 = v0;

  v2 = (void *)_MergedGlobals_12;
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  v126[0] = objc_opt_class();
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v126 count:1];
  v5 = [v3 setWithArray:v4];
  [v2 setClasses:v5 forSelector:sel_connectWithCompletion_ argumentIndex:0 ofReply:1];

  uint64_t v6 = (void *)_MergedGlobals_12;
  uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v125 = objc_opt_class();
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v125 count:1];
  uint64_t v9 = [v7 setWithArray:v8];
  [v6 setClasses:v9 forSelector:sel_checkInWithSyncAnchorContainer_completion_ argumentIndex:0 ofReply:0];

  v10 = (void *)_MergedGlobals_12;
  v11 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v124 = objc_opt_class();
  long long v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v124 count:1];
  long long v13 = [v11 setWithArray:v12];
  [v10 setClasses:v13 forSelector:sel_getSleepScheduleWithCompletion_ argumentIndex:0 ofReply:1];

  long long v14 = (void *)_MergedGlobals_12;
  long long v15 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v123 = objc_opt_class();
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v123 count:1];
  uint64_t v17 = [v15 setWithArray:v16];
  [v14 setClasses:v17 forSelector:sel_getSleepScheduleWithCompletion_ argumentIndex:1 ofReply:1];

  v18 = (void *)_MergedGlobals_12;
  v19 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v122 = objc_opt_class();
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v122 count:1];
  v21 = [v19 setWithArray:v20];
  [v18 setClasses:v21 forSelector:sel_saveSleepSchedule_completion_ argumentIndex:0 ofReply:0];

  v22 = (void *)_MergedGlobals_12;
  v23 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v121 = objc_opt_class();
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v121 count:1];
  v25 = [v23 setWithArray:v24];
  [v22 setClasses:v25 forSelector:sel_saveSleepSchedule_completion_ argumentIndex:0 ofReply:1];

  v26 = (void *)_MergedGlobals_12;
  v27 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v120 = objc_opt_class();
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v120 count:1];
  v29 = [v27 setWithArray:v28];
  [v26 setClasses:v29 forSelector:sel_getSleepSettingsWithCompletion_ argumentIndex:0 ofReply:1];

  v30 = (void *)_MergedGlobals_12;
  v31 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v119 = objc_opt_class();
  v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v119 count:1];
  v33 = [v31 setWithArray:v32];
  [v30 setClasses:v33 forSelector:sel_getSleepSettingsWithCompletion_ argumentIndex:1 ofReply:1];

  v34 = (void *)_MergedGlobals_12;
  v35 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v118 = objc_opt_class();
  v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v118 count:1];
  v37 = [v35 setWithArray:v36];
  [v34 setClasses:v37 forSelector:sel_saveSleepSettings_completion_ argumentIndex:0 ofReply:0];

  v38 = (void *)_MergedGlobals_12;
  v39 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v117 = objc_opt_class();
  v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v117 count:1];
  v41 = [v39 setWithArray:v40];
  [v38 setClasses:v41 forSelector:sel_saveSleepSettings_completion_ argumentIndex:0 ofReply:1];

  v42 = (void *)_MergedGlobals_12;
  v43 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v116 = objc_opt_class();
  v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v116 count:1];
  v45 = [v43 setWithArray:v44];
  [v42 setClasses:v45 forSelector:sel_getSleepEventRecordWithCompletion_ argumentIndex:0 ofReply:1];

  v46 = (void *)_MergedGlobals_12;
  v47 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v115 = objc_opt_class();
  v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v115 count:1];
  v49 = [v47 setWithArray:v48];
  [v46 setClasses:v49 forSelector:sel_getSleepEventRecordWithCompletion_ argumentIndex:1 ofReply:1];

  v50 = (void *)_MergedGlobals_12;
  v51 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v114 = objc_opt_class();
  v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v114 count:1];
  v53 = [v51 setWithArray:v52];
  [v50 setClasses:v53 forSelector:sel_saveSleepEventRecord_completion_ argumentIndex:0 ofReply:0];

  v54 = (void *)_MergedGlobals_12;
  v55 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v113 = objc_opt_class();
  v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v113 count:1];
  v57 = [v55 setWithArray:v56];
  [v54 setClasses:v57 forSelector:sel_saveSleepEventRecord_completion_ argumentIndex:0 ofReply:1];

  v58 = (void *)_MergedGlobals_12;
  v59 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v112 = objc_opt_class();
  v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v112 count:1];
  v61 = [v59 setWithArray:v60];
  [v58 setClasses:v61 forSelector:sel_getSleepScheduleModelWithCompletion_ argumentIndex:0 ofReply:1];

  v62 = (void *)_MergedGlobals_12;
  v63 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v111 = objc_opt_class();
  v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v111 count:1];
  v65 = [v63 setWithArray:v64];
  [v62 setClasses:v65 forSelector:sel_getSleepScheduleModelWithCompletion_ argumentIndex:1 ofReply:1];

  v66 = (void *)_MergedGlobals_12;
  v67 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v110 = objc_opt_class();
  v68 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v110 count:1];
  v69 = [v67 setWithArray:v68];
  [v66 setClasses:v69 forSelector:sel_getSleepModeWithCompletion_ argumentIndex:1 ofReply:1];

  v70 = (void *)_MergedGlobals_12;
  v71 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v109 = objc_opt_class();
  v72 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v109 count:1];
  v73 = [v71 setWithArray:v72];
  [v70 setClasses:v73 forSelector:sel_setSleepMode_reason_completion_ argumentIndex:0 ofReply:1];

  v74 = (void *)_MergedGlobals_12;
  v75 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v108 = objc_opt_class();
  v76 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v108 count:1];
  v77 = [v75 setWithArray:v76];
  [v74 setClasses:v77 forSelector:sel_getSleepScheduleStateWithCompletion_ argumentIndex:1 ofReply:1];

  v78 = (void *)_MergedGlobals_12;
  v79 = (void *)MEMORY[0x1E4F1CAD0];
  v107[0] = objc_opt_class();
  v107[1] = objc_opt_class();
  v107[2] = objc_opt_class();
  v80 = [MEMORY[0x1E4F1C978] arrayWithObjects:v107 count:3];
  v81 = [v79 setWithArray:v80];
  [v78 setClasses:v81 forSelector:sel_publishNotificationWithIdentifier_userInfo_completion_ argumentIndex:1 ofReply:0];

  v82 = (void *)_MergedGlobals_12;
  v83 = (void *)MEMORY[0x1E4F1CAD0];
  v106[0] = objc_opt_class();
  v106[1] = objc_opt_class();
  v106[2] = objc_opt_class();
  v84 = [MEMORY[0x1E4F1C978] arrayWithObjects:v106 count:3];
  v85 = [v83 setWithArray:v84];
  [v82 setClasses:v85 forSelector:sel_publishWakeUpResultsNotificationWithCompletion_ argumentIndex:0 ofReply:1];

  v86 = (void *)_MergedGlobals_12;
  v87 = (void *)MEMORY[0x1E4F1CAD0];
  v105[0] = objc_opt_class();
  v105[1] = objc_opt_class();
  v105[2] = objc_opt_class();
  v105[3] = objc_opt_class();
  v88 = [MEMORY[0x1E4F1C978] arrayWithObjects:v105 count:4];
  v89 = [v87 setWithArray:v88];
  [v86 setClasses:v89 forSelector:sel_setLockScreenOverrideState_userInfo_completion_ argumentIndex:1 ofReply:0];

  v90 = (void *)_MergedGlobals_12;
  v91 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v104 = objc_opt_class();
  v92 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v104 count:1];
  v93 = [v91 setWithArray:v92];
  [v90 setClasses:v93 forSelector:sel_createSleepFocusInState_completion_ argumentIndex:1 ofReply:1];

  v94 = (void *)_MergedGlobals_12;
  v95 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v103 = objc_opt_class();
  v96 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v103 count:1];
  v97 = [v95 setWithArray:v96];
  [v94 setClasses:v97 forSelector:sel_deleteSleepFocusModeWithCompletion_ argumentIndex:1 ofReply:1];

  v98 = (void *)_MergedGlobals_12;
  v99 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v102 = objc_opt_class();
  v100 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v102 count:1];
  v101 = [v99 setWithArray:v100];
  [v98 setClasses:v101 forSelector:sel_configureSleepFocusWithState_completion_ argumentIndex:1 ofReply:1];
}

void HKSPDecodeObjectWithCoder(void *a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = objc_msgSend((id)objc_opt_class(), "allProperties", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) decodeValueForObject:v3 fromCoder:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

id HKSPSleepEventRecordProperties()
{
  v18[14] = *MEMORY[0x1E4F143B8];
  uint64_t v15 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v17 = [(HKSPProperty *)[_HKSPUnsignedIntegerProperty alloc] initWithIdentifier:@"HKSPEventRecordVersion" propertyName:@"version"];
  v18[0] = v17;
  v16 = [[_HKSPObjectProperty alloc] initWithIdentifier:@"HKSPEventRecordLastModifiedDate" propertyName:@"lastModifiedDate" expectedValueClass:objc_opt_class()];
  v18[1] = v16;
  long long v14 = [[_HKSPObjectProperty alloc] initWithIdentifier:@"HKSPWakeUpEarlyNotificationConfirmedDate" propertyName:@"wakeUpEarlyNotificationConfirmedDate" expectedValueClass:objc_opt_class()];
  v18[2] = v14;
  long long v13 = _WakeUpConfirmedUntilDateProperty();
  v18[3] = v13;
  long long v12 = [[_HKSPObjectProperty alloc] initWithIdentifier:@"HKSPWakeUpAlarmDismissedDate" propertyName:@"wakeUpAlarmDismissedDate" expectedValueClass:objc_opt_class()];
  v18[4] = v12;
  long long v11 = [[_HKSPObjectProperty alloc] initWithIdentifier:@"HKSPWakeUpOverriddenDate" propertyName:@"wakeUpOverriddenDate" expectedValueClass:objc_opt_class()];
  v18[5] = v11;
  uint64_t v0 = [[_HKSPObjectProperty alloc] initWithIdentifier:@"HKSPWakeUpAlarmSnoozedUntilDate" propertyName:@"wakeUpAlarmSnoozedUntilDate" expectedValueClass:objc_opt_class()];
  v18[6] = v0;
  v1 = [[_HKSPObjectProperty alloc] initWithIdentifier:@"HKSPGoodMorningDismissedDate" propertyName:@"goodMorningDismissedDate" expectedValueClass:objc_opt_class()];
  v18[7] = v1;
  v2 = [[_HKSPObjectProperty alloc] initWithIdentifier:@"HKSPSleepCoachingOnboardingFirstCompletedDate" propertyName:@"sleepCoachingOnboardingFirstCompletedDate" expectedValueClass:objc_opt_class()];
  v18[8] = v2;
  id v3 = [(HKSPProperty *)[_HKSPUnsignedIntegerProperty alloc] initWithIdentifier:@"HKSPSleepCoachingOnboardingCompletedVersion" propertyName:@"sleepCoachingOnboardingCompletedVersion"];
  v18[9] = v3;
  id v4 = [[_HKSPObjectProperty alloc] initWithIdentifier:@"HKSPSleepTrackingOnboardingFirstCompletedDate" propertyName:@"sleepTrackingOnboardingFirstCompletedDate" expectedValueClass:objc_opt_class()];
  v18[10] = v4;
  v5 = [(HKSPProperty *)[_HKSPUnsignedIntegerProperty alloc] initWithIdentifier:@"HKSPSleepTrackingOnboardingCompletedVersion" propertyName:@"sleepTrackingOnboardingCompletedVersion"];
  v18[11] = v5;
  uint64_t v6 = [[_HKSPObjectProperty alloc] initWithIdentifier:@"HKSPSleepWindDownShortcutsOnboardingFirstCompletedDate" propertyName:@"sleepWindDownShortcutsOnboardingFirstCompletedDate" expectedValueClass:objc_opt_class()];
  v18[12] = v6;
  uint64_t v7 = [(HKSPProperty *)[_HKSPUnsignedIntegerProperty alloc] initWithIdentifier:@"HKSPSleepWindDownShortcutsOnboardingCompletedVersion" propertyName:@"sleepWindDownShortcutsOnboardingCompletedVersion"];
  v18[13] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:14];
  uint64_t v9 = [v15 setWithArray:v8];

  return v9;
}

id HKSPAlarmConfigurationProperties()
{
  v11[7] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (void *)MEMORY[0x1E4F1CAD0];
  v1 = [(HKSPProperty *)[_HKSPUnsignedIntegerProperty alloc] initWithIdentifier:@"HKSPAlarmVersion" propertyName:@"version"];
  v2 = [(HKSPProperty *)[_HKSPBoolProperty alloc] initWithIdentifier:@"HKSPAlarmEnabled", @"enabled", v1 propertyName];
  v11[1] = v2;
  id v3 = [(HKSPProperty *)[_HKSPBoolProperty alloc] initWithIdentifier:@"HKSPAlarmAllowsSnooze" propertyName:@"allowsSnooze"];
  v11[2] = v3;
  id v4 = [(HKSPProperty *)[_HKSPUnsignedIntegerProperty alloc] initWithIdentifier:@"HKSPAlarmSilentModeOptions" propertyName:@"breaksThroughSilentModeOptions"];
  v11[3] = v4;
  v5 = [[_HKSPObjectProperty alloc] initWithIdentifier:@"HKSPAlarmToneIdentifier" propertyName:@"toneIdentifier" expectedValueClass:objc_opt_class()];
  v11[4] = v5;
  uint64_t v6 = [[_HKSPObjectProperty alloc] initWithIdentifier:@"HKSPAlarmVibrationIdentifier" propertyName:@"vibrationIdentifier" expectedValueClass:objc_opt_class()];
  v11[5] = v6;
  uint64_t v7 = [[_HKSPObjectProperty alloc] initWithIdentifier:@"HKSPAlarmSoundVolume" propertyName:@"soundVolume" expectedValueClass:objc_opt_class()];
  v11[6] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:7];
  uint64_t v9 = [v0 setWithArray:v8];

  return v9;
}

_HKSPObjectProperty *_WakeUpConfirmedUntilDateProperty()
{
  uint64_t v0 = [[_HKSPObjectProperty alloc] initWithIdentifier:@"HKSPWakeUpConfirmedUntilDate" propertyName:@"wakeUpConfirmedUntilDate" expectedValueClass:objc_opt_class()];
  return v0;
}

void __HKSPObjectsAreEqual_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = [(id)objc_opt_class() allProperties];
  uint64_t v9 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        long long v14 = objc_msgSend(v6, "hksp_valueForProperty:", v13);
        uint64_t v15 = objc_msgSend(v7, "hksp_valueForProperty:", v13);
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __HKSPObjectsAreEqual_block_invoke_2;
        v19[3] = &unk_1E5D34230;
        id v20 = v15;
        id v16 = v15;
        id v17 = (id)[v8 appendObject:v14 counterpart:v19];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }
}

uint64_t HKSPHashValue(void *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v2 = [MEMORY[0x1E4F4F758] builder];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v3 = objc_msgSend((id)objc_opt_class(), "allProperties", 0);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v13;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = objc_msgSend(v1, "hksp_valueForProperty:", *(void *)(*((void *)&v12 + 1) + 8 * v7));
          id v9 = (id)[v2 appendObject:v8];

          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v5);
    }

    uint64_t v10 = [v2 hash];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

void HKSPEncodeObjectWithCoder(void *a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = objc_msgSend((id)objc_opt_class(), "allProperties", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) encodeValueForObject:v3 fromCoder:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

id HKSPSleepScheduleDayOccurrenceProperties()
{
  v11[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (void *)MEMORY[0x1E4F1CAD0];
  id v1 = [(HKSPProperty *)[_HKSPUnsignedIntegerProperty alloc] initWithIdentifier:@"HKSPDayOccurrenceVersion" propertyName:@"version"];
  v10[0] = v1;
  v2 = [[_HKSPObjectProperty alloc] initWithIdentifier:@"HKSPDayOccurrenceWakeUpComponents" propertyName:@"wakeUpComponents" expectedValueClass:objc_opt_class()];
  v10[1] = v2;
  id v3 = [[_HKSPObjectProperty alloc] initWithIdentifier:@"HKSPDayOccurrenceBedtimeComponents" propertyName:@"bedtimeComponents" expectedValueClass:objc_opt_class()];
  v10[2] = v3;
  id v4 = [_HKSPRelationshipProperty alloc];
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  uint64_t v6 = [(_HKSPObjectProperty *)v4 initWithIdentifier:@"HKSPDayOccurrenceAlarm" propertyName:@"alarmConfiguration" expectedValueClasses:v5];

  v10[3] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:4];
  uint64_t v8 = [v0 setWithArray:v7];

  return v8;
}

id HKSPSleepSettingsProperties()
{
  v17[13] = *MEMORY[0x1E4F143B8];
  long long v14 = (void *)MEMORY[0x1E4F1CAD0];
  id v16 = [(HKSPProperty *)[_HKSPUnsignedIntegerProperty alloc] initWithIdentifier:@"HKSPSettingsVersion" propertyName:@"version"];
  v17[0] = v16;
  uint64_t v15 = [[_HKSPObjectProperty alloc] initWithIdentifier:@"HKSPSettingsLastModifiedDate" propertyName:@"lastModifiedDate" expectedValueClass:objc_opt_class()];
  v17[1] = v15;
  long long v13 = [(HKSPProperty *)[_HKSPBoolProperty alloc] initWithIdentifier:@"HKSPWatchSleepFeaturesEnabled" propertyName:@"watchSleepFeaturesEnabled"];
  v17[2] = v13;
  long long v12 = [(HKSPProperty *)[_HKSPBoolProperty alloc] initWithIdentifier:@"HKSPScheduledSleepMode" propertyName:@"scheduledSleepMode"];
  v17[3] = v12;
  long long v11 = [(HKSPProperty *)[_HKSPUnsignedIntegerProperty alloc] initWithIdentifier:@"HKSPSleepModeOptions" propertyName:@"sleepModeOptions"];
  v17[4] = v11;
  uint64_t v0 = [(HKSPProperty *)[_HKSPBoolProperty alloc] initWithIdentifier:@"HKSPTimeInBedTracking" propertyName:@"timeInBedTracking"];
  v17[5] = v0;
  id v1 = [(HKSPProperty *)[_HKSPBoolProperty alloc] initWithIdentifier:@"HKSPWakeUpResults" propertyName:@"wakeUpResults"];
  v17[6] = v1;
  v2 = [(HKSPProperty *)[_HKSPBoolProperty alloc] initWithIdentifier:@"HKSPSleepTracking" propertyName:@"sleepTracking"];
  v17[7] = v2;
  id v3 = [(HKSPProperty *)[_HKSPBoolProperty alloc] initWithIdentifier:@"HKSPBedtimeReminders" propertyName:@"bedtimeReminders"];
  v17[8] = v3;
  id v4 = [(HKSPProperty *)[_HKSPBoolProperty alloc] initWithIdentifier:@"HKSPChargingReminders" propertyName:@"chargingReminders"];
  v17[9] = v4;
  uint64_t v5 = [(HKSPProperty *)[_HKSPBoolProperty alloc] initWithIdentifier:@"HKSPShareAcrossDevices" propertyName:@"shareAcrossDevices"];
  v17[10] = v5;
  uint64_t v6 = [(HKSPProperty *)[_HKSPBoolProperty alloc] initWithIdentifier:@"HKSPSpringBoardGreetingDisabled" propertyName:@"springBoardGreetingDisabled"];
  v17[11] = v6;
  uint64_t v7 = [(HKSPProperty *)[_HKSPBoolProperty alloc] initWithIdentifier:@"HKSPSpringBoardSuggestedPageCreated" propertyName:@"springBoardSuggestedPageCreated"];
  v17[12] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:13];
  uint64_t v9 = [v14 setWithArray:v8];

  return v9;
}

id HKSPSleepScheduleProperties()
{
  v41[13] = *MEMORY[0x1E4F143B8];
  v28 = (void *)MEMORY[0x1E4F1CAD0];
  v32 = [(HKSPProperty *)[_HKSPUnsignedIntegerProperty alloc] initWithIdentifier:@"HKSPScheduleVersion" propertyName:@"version"];
  v41[0] = v32;
  v31 = [[_HKSPObjectProperty alloc] initWithIdentifier:@"HKSPScheduleLastModifiedDate" propertyName:@"lastModifiedDate" expectedValueClass:objc_opt_class()];
  v41[1] = v31;
  v30 = [(HKSPProperty *)[_HKSPBoolProperty alloc] initWithIdentifier:@"HKSPScheduleEnabled" propertyName:@"enabled"];
  v41[2] = v30;
  v29 = [(HKSPProperty *)[_HKSPTimeIntervalProperty alloc] initWithIdentifier:@"HKSPWindDownTimeInterval" propertyName:@"windDownTime"];
  v41[3] = v29;
  v27 = [(HKSPProperty *)[_HKSPTimeIntervalProperty alloc] initWithIdentifier:@"HKSPSleepDurationGoal" propertyName:@"sleepDurationGoal"];
  v41[4] = v27;
  uint64_t v0 = [_HKSPRelationshipProperty alloc];
  v40[0] = objc_opt_class();
  v40[1] = objc_opt_class();
  uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
  v25 = [(_HKSPObjectProperty *)v0 initWithIdentifier:@"HKSPMondayOccurrence" propertyName:@"mondayOccurrence" expectedValueClasses:v26];
  v41[5] = v25;
  id v1 = [_HKSPRelationshipProperty alloc];
  v39[0] = objc_opt_class();
  v39[1] = objc_opt_class();
  long long v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
  long long v23 = [(_HKSPObjectProperty *)v1 initWithIdentifier:@"HKSPTuesdayOccurrence" propertyName:@"tuesdayOccurrence" expectedValueClasses:v24];
  v41[6] = v23;
  v2 = [_HKSPRelationshipProperty alloc];
  v38[0] = objc_opt_class();
  v38[1] = objc_opt_class();
  long long v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
  long long v21 = [(_HKSPObjectProperty *)v2 initWithIdentifier:@"HKSPWednesdayOccurrence" propertyName:@"wednesdayOccurrence" expectedValueClasses:v22];
  v41[7] = v21;
  id v3 = [_HKSPRelationshipProperty alloc];
  v37[0] = objc_opt_class();
  v37[1] = objc_opt_class();
  id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
  v19 = [(_HKSPObjectProperty *)v3 initWithIdentifier:@"HKSPThursdayOccurrence" propertyName:@"thursdayOccurrence" expectedValueClasses:v20];
  v41[8] = v19;
  id v4 = [_HKSPRelationshipProperty alloc];
  v36[0] = objc_opt_class();
  v36[1] = objc_opt_class();
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
  uint64_t v5 = [(_HKSPObjectProperty *)v4 initWithIdentifier:@"HKSPFridayOccurrence" propertyName:@"fridayOccurrence" expectedValueClasses:v18];
  v41[9] = v5;
  uint64_t v6 = [_HKSPRelationshipProperty alloc];
  v35[0] = objc_opt_class();
  v35[1] = objc_opt_class();
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
  uint64_t v8 = [(_HKSPObjectProperty *)v6 initWithIdentifier:@"HKSPSaturdayOccurrence" propertyName:@"saturdayOccurrence" expectedValueClasses:v7];
  v41[10] = v8;
  uint64_t v9 = [_HKSPRelationshipProperty alloc];
  v34[0] = objc_opt_class();
  v34[1] = objc_opt_class();
  long long v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
  long long v11 = [(_HKSPObjectProperty *)v9 initWithIdentifier:@"HKSPSundayOccurrence" propertyName:@"sundayOccurrence" expectedValueClasses:v10];
  v41[11] = v11;
  long long v12 = [_HKSPRelationshipProperty alloc];
  v33[0] = objc_opt_class();
  v33[1] = objc_opt_class();
  long long v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
  long long v14 = [(_HKSPObjectProperty *)v12 initWithIdentifier:@"HKSPOverrideOccurrence" propertyName:@"overrideDayOccurrence" expectedValueClasses:v13];
  v41[12] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:13];
  id v16 = [v28 setWithArray:v15];

  return v16;
}

uint64_t __HKSPResolvedSleepScheduleOccurrenceComparator_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __HKSPLogForCategory_block_invoke()
{
  for (unint64_t i = 0; i != 22; ++i)
  {
    id v1 = (const char *)HKSPSleepLogSubsystem;
    v2 = HKSPLogCategoryForCategory(i);
    os_log_t v3 = os_log_create(v1, v2);
    id v4 = (void *)HKSPLogForCategory_logObjects[i];
    HKSPLogForCategory_logObjects[i] = v3;
  }
}

const char *HKSPLogCategoryForCategory(unint64_t a1)
{
  if (a1 >= 0x16) {
    __assert_rtn("HKSPLogCategoryForCategory", "HKSPLogging.m", 38, "category < HKSPLogCount");
  }
  if (a1 - 1 > 0x14) {
    return "default";
  }
  else {
    return off_1E5D32250[a1 - 1];
  }
}

id __HKSPObjectsAreEqual_block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id NSStringFromHKSPSleepModeOptions(__int16 a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  os_log_t v3 = v2;
  if ((a1 & 0x4000) != 0) {
    [v2 addObject:@".sleepScreen"];
  }
  if ((a1 & 8) != 0) {
    [v3 addObject:@".hideTime"];
  }
  if ((a1 & 0x700) == 0) {
    [v3 addObject:@"!legacyOptions"];
  }
  id v4 = NSString;
  uint64_t v5 = [v3 componentsJoinedByString:@"|"];
  uint64_t v6 = [v4 stringWithFormat:@"[%@]", v5];

  return v6;
}

void sub_1A7E7B180(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A7E7B3A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7E7B838(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

HKSPFeatureAvailabilityStore *getSleepFeatureAvailabilityProviding(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  if (qword_1EB538580 != -1) {
    dispatch_once(&qword_1EB538580, &__block_literal_global_7);
  }
  uint64_t v8 = [(id)_MergedGlobals_11 sleepStoreForIdentifier:v5 healthStore:v6];
  if (v8) {
    uint64_t v9 = [[HKSPFeatureAvailabilityStore alloc] initWithFeatureIdentifier:v7 sleepStore:v8];
  }
  else {
    uint64_t v9 = 0;
  }

  return v9;
}

id HKSPGenerateSleepStoreIdentifier(void *a1)
{
  id v1 = a1;
  id v2 = [MEMORY[0x1E4F28F80] processInfo];
  os_log_t v3 = [v2 processName];

  if ([v1 length])
  {
    id v4 = [NSString stringWithFormat:@"%@.%@", v3, v1];
  }
  else
  {
    id v4 = v3;
  }
  id v5 = v4;

  return v5;
}

void sub_1A7E7C7D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7E7CAF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A7E7CCB8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1A7E7D238(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location,id a27)
{
  objc_destroyWeak(v31);
  objc_destroyWeak(v30);
  objc_destroyWeak(v29);
  objc_destroyWeak(v28);
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a27);
  _Unwind_Resume(a1);
}

void sub_1A7E7D3F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7E7D52C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7E7D96C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

void sub_1A7E7DC58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromHKSPWeekdays(uint64_t a1)
{
  switch(a1)
  {
    case 127:
      id v2 = @"Every Day";
      break;
    case 96:
      id v2 = @"Weekends";
      break;
    case 31:
      id v2 = @"Weekdays";
      break;
    default:
      HKSPIdentifierStringForWeekdays(a1);
      id v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v2;
}

id HKSPCurrentDateProvider()
{
  if (qword_1EB538530 != -1) {
    dispatch_once(&qword_1EB538530, &__block_literal_global_12);
  }
  uint64_t v0 = (void *)MEMORY[0x1AD0DD220](qword_1EB538528);
  return v0;
}

void sub_1A7E7E880(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

_HKSPQueueBackedScheduler *HKSPQueueBackedScheduler(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [[_HKSPQueueBackedScheduler alloc] initWithQueue:v1];

  return v2;
}

_HKSPQueueBackedScheduler *HKSPMainQueueBackedScheduler()
{
  uint64_t v0 = [_HKSPQueueBackedScheduler alloc];
  id v1 = [(_HKSPQueueBackedScheduler *)v0 initWithQueue:MEMORY[0x1E4F14428]];
  return v1;
}

void sub_1A7E7F274(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A7E7FB40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A7E80174(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1A7E804AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A7E805B0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

id HKSPSleepServerInterface()
{
  if (qword_1EB538590 != -1) {
    dispatch_once(&qword_1EB538590, &__block_literal_global_8);
  }
  uint64_t v0 = (void *)_MergedGlobals_12;
  return v0;
}

id HKSPSleepClientInterface()
{
  if (qword_1EB5385A0 != -1) {
    dispatch_once(&qword_1EB5385A0, &__block_literal_global_370);
  }
  uint64_t v0 = (void *)qword_1EB538598;
  return v0;
}

_HKSPDarwinNotificationHeartbeatListener *HKSPStandardHeartbeatListener(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [_HKSPDarwinNotificationHeartbeatListener alloc];
  os_log_t v3 = [v1 lifecycleNotification];

  id v4 = [(_HKSPDarwinNotificationHeartbeatListener *)v2 initWithLifecycleNotification:v3];
  return v4;
}

void sub_1A7E81834(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A7E81B50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id HKSPNullify(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    id v3 = v1;
  }
  else
  {
    id v3 = [MEMORY[0x1E4F1CA98] null];
  }
  id v4 = v3;

  return v4;
}

void sub_1A7E81EC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __getSleepFeatureAvailabilityProviding_block_invoke()
{
  _MergedGlobals_11 = +[HKSPSleepStoreCache weakCache];
  return MEMORY[0x1F41817F8]();
}

uint64_t HKSPCompareWeekdaysInCurrentCalendar(uint64_t a1, uint64_t a2)
{
  id v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v5 = HKSPCompareWeekdaysInCalendar(a1, a2, v4);

  return v5;
}

uint64_t HKSPCompareWeekdaysInCalendar(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v9 = 0;
  long long v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __HKSPCompareWeekdaysInCalendar_block_invoke;
  v8[3] = &unk_1E5D340E0;
  v8[5] = a1;
  v8[6] = a2;
  v8[4] = &v9;
  HKSPEnumerateDaysOfWeekInCalendar(v5, v8, 0);
  uint64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void sub_1A7E831D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7E83AF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void HKSPWeekdaysEnumerateDays(uint64_t a1, void *a2, char a3)
{
  id v5 = (void *)MEMORY[0x1E4F1C9A8];
  id v6 = a2;
  objc_msgSend(v5, "hk_gregorianCalendar");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  HKSPWeekdaysEnumerateDaysInCalendar(v7, a1, v6, a3);
}

void HKSPWeekdaysEnumerateDaysInCalendar(void *a1, uint64_t a2, void *a3, char a4)
{
  id v7 = a3;
  uint64_t v8 = v7;
  if (a2 != 0xFFFFFFFFLL)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __HKSPWeekdaysEnumerateDaysInCalendar_block_invoke;
    v9[3] = &unk_1E5D34018;
    uint64_t v11 = a2;
    id v10 = v7;
    HKSPEnumerateDaysOfWeekInCalendar(a1, v9, a4);
  }
}

void HKSPEnumerateDaysOfWeekInCalendar(void *a1, void *a2, char a3)
{
  id v6 = a2;
  if ((a3 & 2) != 0) {
    uint64_t v5 = [a1 firstWeekday];
  }
  else {
    uint64_t v5 = objc_msgSend(a1, "hksp_firstNonWeekendDay");
  }
  HKSPEnumerateDaysOfWeekStartingOnDay(v5, (uint64_t)v6, a3);
}

void sub_1A7E83DC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7E84818(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t HKSPEnumerateDaysOfWeekStartingOnDay(uint64_t result, uint64_t a2, char a3)
{
  char v9 = 0;
  uint64_t v3 = *MEMORY[0x1E4F29998];
  if (*MEMORY[0x1E4F29998])
  {
    uint64_t v5 = result;
    if (a3) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = 7;
    }
    if (a3) {
      uint64_t v7 = -1;
    }
    else {
      uint64_t v7 = 1;
    }
    if (a3) {
      uint64_t v8 = 7;
    }
    else {
      uint64_t v8 = 1;
    }
    do
    {
      result = (*(uint64_t (**)(uint64_t, uint64_t, char *))(a2 + 16))(a2, v5, &v9);
      if (v9) {
        break;
      }
      if (v5 == v6) {
        uint64_t v5 = v8;
      }
      else {
        v5 += v7;
      }
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t __HKSPWeekdaysEnumerateDaysInCalendar_block_invoke(uint64_t result, uint64_t a2)
{
  if ((unint64_t)(a2 + 2) > 9) {
    uint64_t v2 = 0;
  }
  else {
    uint64_t v2 = qword_1A7ED55E0[a2 + 2];
  }
  if ((v2 & *(void *)(result + 40)) != 0) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

_HKSPUnfairLock *__HKSPUnfairLockGenerator_block_invoke()
{
  uint64_t v0 = objc_alloc_init(_HKSPUnfairLock);
  return v0;
}

_HKSPOrderPreservingScheduler *HKSPOrderPreservingScheduler(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  uint64_t v5 = [[_HKSPOrderPreservingScheduler alloc] initWithScheduler:v4 mutexProvider:v3];

  return v5;
}

id HKSPLogForCategory(unint64_t a1)
{
  if (a1 >= 0x16) {
    __assert_rtn("HKSPLogForCategory", "HKSPLogging.m", 69, "category < HKSPLogCount");
  }
  if (HKSPLogForCategory_onceToken != -1) {
    dispatch_once(&HKSPLogForCategory_onceToken, &__block_literal_global_3);
  }
  uint64_t v2 = (void *)HKSPLogForCategory_logObjects[a1];
  return v2;
}

void *__HKSPCompareWeekdaysInCalendar_block_invoke(void *result, uint64_t a2, unsigned char *a3)
{
  if ((unint64_t)(a2 + 2) > 9) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = qword_1A7ED55E0[a2 + 2];
  }
  uint64_t v4 = result[5] & v3;
  if (v4 != (result[6] & v3))
  {
    if (v4) {
      uint64_t v5 = -1;
    }
    else {
      uint64_t v5 = 1;
    }
    *(void *)(*(void *)(result[4] + 8) + 24) = v5;
    *a3 = 1;
  }
  return result;
}

void sub_1A7E86134(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id HKSPNilify(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x1E4F1CA98] null];
  char v3 = [v1 isEqual:v2];

  if (v3) {
    id v4 = 0;
  }
  else {
    id v4 = v1;
  }

  return v4;
}

uint64_t HKSPObjectsAreEqual(void *a1, void *a2)
{
  id v3 = a1;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __HKSPObjectsAreEqual_block_invoke;
  v7[3] = &unk_1E5D34258;
  id v8 = v3;
  id v4 = v3;
  uint64_t v5 = _HKSPEquateObjectsWithBlock(v4, a2, v7);

  return v5;
}

uint64_t _HKSPEquateObjectsWithBlock(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  uint64_t v7 = a3;
  if (v5 == v6)
  {
    uint64_t v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
       || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
    {
      id v8 = [MEMORY[0x1E4F4F738] builder];
      v7[2](v7, v5, v6, v8);
      uint64_t v9 = [v8 isEqual];
    }
    else
    {
      uint64_t v9 = 0;
    }
  }

  return v9;
}

id HKSPPropertiesByIdentifier(void *a1)
{
  id v1 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v2 = a1;
  id v3 = objc_alloc_init(v1);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __HKSPPropertiesByIdentifier_block_invoke;
  v6[3] = &unk_1E5D341E0;
  id v4 = v3;
  id v7 = v4;
  [v2 enumerateObjectsUsingBlock:v6];

  return v4;
}

void __HKSPCurrentDateProvider_block_invoke()
{
  uint64_t v0 = (void *)qword_1EB538528;
  qword_1EB538528 = (uint64_t)&__block_literal_global_15;
}

uint64_t HKSPIsValidDate(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    id v2 = [MEMORY[0x1E4F1C9C8] distantPast];
    if ([v1 isEqualToDate:v2])
    {
      uint64_t v3 = 0;
    }
    else
    {
      id v4 = [MEMORY[0x1E4F1C9C8] distantFuture];
      uint64_t v3 = [v1 isEqualToDate:v4] ^ 1;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void __HKSPSleepClientInterface_block_invoke()
{
  v56[1] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFE6FC20];
  id v1 = (void *)qword_1EB538598;
  qword_1EB538598 = v0;

  id v2 = (void *)qword_1EB538598;
  uint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];
  v56[0] = objc_opt_class();
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:1];
  id v5 = [v3 setWithArray:v4];
  [v2 setClasses:v5 forSelector:sel_getClientIdentifierWithCompletion_ argumentIndex:0 ofReply:1];

  id v6 = (void *)qword_1EB538598;
  id v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v55 = objc_opt_class();
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v55 count:1];
  uint64_t v9 = [v7 setWithArray:v8];
  [v6 setClasses:v9 forSelector:sel_clientShouldCheckInWithCompletion_ argumentIndex:0 ofReply:1];

  id v10 = (void *)qword_1EB538598;
  uint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
  v54[0] = objc_opt_class();
  v54[1] = objc_opt_class();
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:2];
  long long v13 = [v11 setWithArray:v12];
  [v10 setClasses:v13 forSelector:sel_sleepScheduleChanged_clientIdentifier_ argumentIndex:0 ofReply:0];

  long long v14 = (void *)qword_1EB538598;
  uint64_t v15 = (void *)MEMORY[0x1E4F1CAD0];
  v53[0] = objc_opt_class();
  v53[1] = objc_opt_class();
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:2];
  uint64_t v17 = [v15 setWithArray:v16];
  [v14 setClasses:v17 forSelector:sel_sleepScheduleChanged_clientIdentifier_ argumentIndex:1 ofReply:0];

  v18 = (void *)qword_1EB538598;
  v19 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v52 = objc_opt_class();
  id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];
  long long v21 = [v19 setWithArray:v20];
  [v18 setClasses:v21 forSelector:sel_sleepSettingsChanged_clientIdentifier_ argumentIndex:0 ofReply:0];

  long long v22 = (void *)qword_1EB538598;
  long long v23 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v51 = objc_opt_class();
  long long v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
  v25 = [v23 setWithArray:v24];
  [v22 setClasses:v25 forSelector:sel_sleepSettingsChanged_clientIdentifier_ argumentIndex:1 ofReply:0];

  uint64_t v26 = (void *)qword_1EB538598;
  v27 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v50 = objc_opt_class();
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
  v29 = [v27 setWithArray:v28];
  [v26 setClasses:v29 forSelector:sel_sleepEventRecordChanged_clientIdentifier_ argumentIndex:0 ofReply:0];

  v30 = (void *)qword_1EB538598;
  v31 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v49 = objc_opt_class();
  v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1];
  v33 = [v31 setWithArray:v32];
  [v30 setClasses:v33 forSelector:sel_sleepEventRecordChanged_clientIdentifier_ argumentIndex:1 ofReply:0];

  v34 = (void *)qword_1EB538598;
  v35 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v48 = objc_opt_class();
  v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
  v37 = [v35 setWithArray:v36];
  [v34 setClasses:v37 forSelector:sel_sleepEventOccurred_ argumentIndex:0 ofReply:0];

  v38 = (void *)qword_1EB538598;
  v39 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v47 = objc_opt_class();
  v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
  v41 = [v39 setWithArray:v40];
  [v38 setClasses:v41 forSelector:sel_sleepScheduleStateChanged_ argumentIndex:0 ofReply:0];

  v42 = (void *)qword_1EB538598;
  v43 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v46 = objc_opt_class();
  v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
  v45 = [v43 setWithArray:v44];
  [v42 setClasses:v45 forSelector:sel_sleepModeChanged_ argumentIndex:0 ofReply:0];
}

uint64_t __HKSPCurrentDateProvider_block_invoke_2()
{
  return [MEMORY[0x1E4F1C9C8] date];
}

void sub_1A7E89EB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7E8A04C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7E8A294(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A7E8A424(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

id HKSPSleepScheduleDayOccurrencePropertiesForEquivalency()
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (void *)MEMORY[0x1E4F1CAD0];
  v9[0] = @"HKSPDayOccurrenceVersion";
  id v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  id v2 = [v0 setWithArray:v1];

  uint64_t v3 = HKSPSleepScheduleDayOccurrenceProperties();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __HKSPSleepScheduleDayOccurrencePropertiesForEquivalency_block_invoke;
  v7[3] = &unk_1E5D31978;
  id v8 = v2;
  id v4 = v2;
  id v5 = objc_msgSend(v3, "na_filter:", v7);

  return v5;
}

uint64_t __HKSPSleepScheduleDayOccurrencePropertiesForEquivalency_block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 identifier];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

__CFString *NSStringFromHKSPSleepWidgetState(unint64_t a1)
{
  if (a1 > 7) {
    return 0;
  }
  else {
    return off_1E5D31998[a1];
  }
}

BOOL HKSPWidgetStateShowsSleepData(uint64_t a1)
{
  return (unint64_t)(a1 - 6) < 0xFFFFFFFFFFFFFFFCLL;
}

id HKSPSleepSchedulePropertiesForEquivalency()
{
  void v9[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (void *)MEMORY[0x1E4F1CAD0];
  v9[0] = @"HKSPScheduleVersion";
  v9[1] = @"HKSPScheduleLastModifiedDate";
  id v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  id v2 = [v0 setWithArray:v1];

  uint64_t v3 = HKSPSleepScheduleProperties();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __HKSPSleepSchedulePropertiesForEquivalency_block_invoke;
  v7[3] = &unk_1E5D31978;
  id v8 = v2;
  id v4 = v2;
  id v5 = objc_msgSend(v3, "na_filter:", v7);

  return v5;
}

uint64_t __HKSPSleepSchedulePropertiesForEquivalency_block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 identifier];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

id HKSPSleepSchedulePropertiesForSignificance()
{
  void v9[3] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (void *)MEMORY[0x1E4F1CAD0];
  v9[0] = @"HKSPScheduleVersion";
  v9[1] = @"HKSPScheduleLastModifiedDate";
  void v9[2] = @"HKSPSleepDurationGoal";
  id v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:3];
  id v2 = [v0 setWithArray:v1];

  uint64_t v3 = HKSPSleepScheduleProperties();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __HKSPSleepSchedulePropertiesForSignificance_block_invoke;
  v7[3] = &unk_1E5D31978;
  id v8 = v2;
  id v4 = v2;
  id v5 = objc_msgSend(v3, "na_filter:", v7);

  return v5;
}

uint64_t __HKSPSleepSchedulePropertiesForSignificance_block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 identifier];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

uint64_t _handleLifeCycleNotification(uint64_t a1, void *a2)
{
  return [a2 didReceiveLifecycleNotification];
}

uint64_t HKSPIsCharging()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CB18], "hksp_sleepdUserDefaults");
  id v1 = [v0 objectForKey:@"HKSPSimulatedOnCharger"];

  if (v1) {
    uint64_t v2 = [v1 BOOLValue];
  }
  else {
    uint64_t v2 = IOPSDrawingUnlimitedPower();
  }
  uint64_t v3 = v2;

  return v3;
}

float HKSPBatteryLevel()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CB18], "hksp_sleepdUserDefaults");
  id v1 = [v0 objectForKey:@"HKSPSimulatedBatteryLevel"];

  if (v1)
  {
    [v1 floatValue];
    float v3 = v2;
  }
  else
  {
    IOPSGetPercentRemaining();
    float v3 = (float)0 / 100.0;
  }

  return v3;
}

_HKSPDarwinNotificationHeartbeatGenerator *HKSPStandardHeartbeatGenerator(void *a1)
{
  id v1 = a1;
  float v2 = [_HKSPDarwinNotificationHeartbeatGenerator alloc];
  float v3 = [v1 lifecycleNotification];

  uint64_t v4 = [(_HKSPDarwinNotificationHeartbeatGenerator *)v2 initWithLifecycleNotification:v3];
  return v4;
}

uint64_t HKSPAnalyticsEventsEqual(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ([v3 conformsToProtocol:&unk_1EFE66800]
    && [v4 conformsToProtocol:&unk_1EFE66800])
  {
    id v5 = [v3 eventName];
    id v6 = [v4 eventName];
    if ([v5 isEqualToString:v6])
    {
      uint64_t v7 = [v3 eventPayload];
      id v8 = [v4 eventPayload];
      uint64_t v9 = [v7 isEqualToDictionary:v8];
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

uint64_t HKSPAnalyticsEventHash(void *a1)
{
  id v1 = a1;
  float v2 = [v1 eventName];
  uint64_t v3 = [v2 hash];
  id v4 = [v1 eventPayload];

  uint64_t v5 = objc_msgSend(v4, "hksp_hash") ^ v3;
  return v5;
}

uint64_t HKSPIsHomePod()
{
  if (qword_1EB538520 != -1) {
    dispatch_once(&qword_1EB538520, &__block_literal_global_2);
  }
  return _MergedGlobals_8;
}

uint64_t __HKSPIsHomePod_block_invoke()
{
  uint64_t result = MGGetProductType();
  if (result == 4240173202 || result == 2702125347) {
    _MergedGlobals_8 = 1;
  }
  return result;
}

id HKSPLocalizedString(void *a1)
{
  uint64_t v1 = qword_1EB538540;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&qword_1EB538540, &__block_literal_global_18);
  }
  uint64_t v3 = [(id)qword_1EB538538 localizedStringForKey:v2 value:&stru_1EFE54160 table:@"Localizable"];

  return v3;
}

uint64_t __HKSPLocalizedString_block_invoke()
{
  qword_1EB538538 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.Sleep"];
  return MEMORY[0x1F41817F8]();
}

id HKSPWatchKitApplicationLaunchURL(void *a1)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if (v1) {
    id v2 = v1;
  }
  else {
    id v2 = (void *)MEMORY[0x1E4F1CC08];
  }
  long long v14 = @"uai";
  v15[0] = v2;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  if (v3)
  {
    id v13 = 0;
    id v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v13];
    id v5 = v13;
    if (!v4)
    {
      uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v12 = [NSString stringWithUTF8String:"NSData * _Nonnull _serializeObject(id  _Nonnull __strong)"];
      [v11 handleFailureInFunction:v12, @"HKSPUtilities.m", 91, @"Failed to archive object. Got error %@, object: %@", v5, v3 file lineNumber description];
    }
  }
  else
  {
    id v4 = 0;
  }

  if ([v4 length])
  {
    id v6 = [v4 base64EncodedStringWithOptions:0];
    if (qword_1EB538550 != -1) {
      dispatch_once(&qword_1EB538550, &__block_literal_global_50);
    }
    uint64_t v7 = [v6 stringByAddingPercentEncodingWithAllowedCharacters:qword_1EB538548];
  }
  else
  {
    id v6 = 0;
    uint64_t v7 = 0;
  }
  id v8 = [NSString stringWithFormat:@"%@:///%@?userActivity=%@", @"watchkit", @"nativecomplication", v7];
  uint64_t v9 = [MEMORY[0x1E4F1CB10] URLWithString:v8];

  return v9;
}

uint64_t HKSPAnalyticsSleepScheduleChangeApplicationFromValue(void *a1)
{
  id v1 = a1;
  id v2 = v1;
  if (v1)
  {
    uint64_t v3 = [v1 unsignedIntegerValue];
    if ((unint64_t)(v3 - 1) >= 4) {
      uint64_t v4 = 0;
    }
    else {
      uint64_t v4 = v3;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

id HKSPAnalyticsScheduleChangeContext(void *a1, uint64_t a2)
{
  void v9[2] = *MEMORY[0x1E4F143B8];
  v8[0] = @"HKSPAnalyticsSleepScheduleChangeProvenanceInfo";
  v8[1] = @"HKSPAnalyticsSleepScheduleChangeApplication";
  v9[0] = a1;
  uint64_t v3 = (void *)MEMORY[0x1E4F28ED0];
  id v4 = a1;
  id v5 = [v3 numberWithUnsignedInteger:a2];
  v9[1] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v6;
}

void sub_1A7E94C24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromHKSPSleepMode(unint64_t a1)
{
  if (a1 > 2) {
    return &stru_1EFE54160;
  }
  else {
    return off_1E5D32010[a1];
  }
}

__CFString *NSStringFromHKSPSleepModeChangeReason(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 9) {
    return &stru_1EFE54160;
  }
  else {
    return off_1E5D32028[a1 - 1];
  }
}

uint64_t HKSPSleepModeChangeReasonTreatedAsUserRequested(unint64_t a1)
{
  return (a1 > 0xA) | (0x1F3u >> a1) & 1;
}

uint64_t HKSPSleepModeChangeReasonTreatedAsUserRequestedLocally(unint64_t a1)
{
  return (a1 > 0xA) | (0xC3u >> a1) & 1;
}

uint64_t HKSPSleepModeChangeReasonTreatedAsExpected(unint64_t a1)
{
  return (a1 > 0xA) | (5u >> a1) & 1;
}

uint64_t HKSPSleepModeChangeReasonTreatedAsAutomation(unint64_t a1)
{
  return (a1 > 0xA) | (0x181u >> a1) & 1;
}

void sub_1A7E95E44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_1A7E960C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7E961D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7E96308(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t HKSPSerializableKeyForClass(uint64_t a1)
{
  return [NSString stringWithFormat:@"%@%@", @"$", a1];
}

id _HKSPDeserializedObject(void *a1, void *a2, unsigned char *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v5, "hksp_isSerialized"))
  {
    id v9 = v5;
LABEL_8:
    id v9 = v9;
    uint64_t v12 = v9;
    goto LABEL_9;
  }
  uint64_t v7 = [[HKSPDictionaryDeserializer alloc] initWithAllowedClasses:v6 serializedDictionary:v5 serializationOptions:0];
  objc_msgSend(v5, "hksp_serializedClassName");
  id v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  id v14 = 0;
  id v9 = [(HKSPDictionaryDeserializer *)v7 deserializeObjectOfClass:NSClassFromString(v8) error:&v14];
  id v10 = v14;

  if (!v10)
  {

    goto LABEL_8;
  }
  uint64_t v11 = HKSPLogForCategory(6uLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    id v16 = v9;
    __int16 v17 = 2114;
    id v18 = v10;
    _os_log_error_impl(&dword_1A7E74000, v11, OS_LOG_TYPE_ERROR, "[HKSPObject] failed to deserialize %{public}@ with error %{public}@", buf, 0x16u);
  }

  *a3 = 1;
  uint64_t v12 = 0;
LABEL_9:

  return v12;
}

HKSPChangeSet *HKSPGenerateChangeSetBetweenObjects(void *a1, void *a2)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  id v5 = v4;
  if (!v3 || !v4)
  {
    HKSPLogForCategory(6uLL);
    id v6 = (HKSPDictionarySerializer *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v6->super.super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v27 = "[HKSPObject] objects must be non-nil";
      goto LABEL_28;
    }
LABEL_17:
    uint64_t v26 = 0;
    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      HKSPLogForCategory(6uLL);
      id v6 = (HKSPDictionarySerializer *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v6->super.super, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v27 = "[HKSPObject] objects must be of the same class";
LABEL_28:
        _os_log_error_impl(&dword_1A7E74000, &v6->super.super, OS_LOG_TYPE_ERROR, v27, buf, 2u);
        goto LABEL_17;
      }
      goto LABEL_17;
    }
  }
  id v6 = [[HKSPDictionarySerializer alloc] initWithSerializationOptions:0];
  id v43 = 0;
  BOOL v7 = [(HKSPDictionarySerializer *)v6 serialize:v3 error:&v43];
  id v8 = v43;
  if (v8)
  {
    id v9 = HKSPLogForCategory(6uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v45 = v3;
      __int16 v46 = 2114;
      id v47 = v8;
      _os_log_error_impl(&dword_1A7E74000, v9, OS_LOG_TYPE_ERROR, "[HKSPObject] failed to serialize %{public}@ with error %{public}@", buf, 0x16u);
    }
  }
  if (v7)
  {
    id v10 = [(HKSPDictionarySerializer *)v6 serializedDictionary];
    uint64_t v11 = objc_msgSend(v10, "hksp_serializedProperties");

    id v42 = 0;
    BOOL v12 = [(HKSPDictionarySerializer *)v6 serialize:v5 error:&v42];
    id v8 = v42;
    if (v8)
    {
      id v13 = HKSPLogForCategory(6uLL);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v45 = v5;
        __int16 v46 = 2114;
        id v47 = v8;
        _os_log_error_impl(&dword_1A7E74000, v13, OS_LOG_TYPE_ERROR, "[HKSPObject] failed to serialize %{public}@ with error %{public}@", buf, 0x16u);
      }
    }
    if (v12)
    {
      id v14 = [(HKSPDictionarySerializer *)v6 serializedDictionary];
      uint64_t v15 = objc_msgSend(v14, "hksp_serializedProperties");

      id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      __int16 v17 = [(id)objc_opt_class() allProperties];
      id v18 = HKSPPropertiesByIdentifier(v17);

      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      void v37[2] = __HKSPGenerateChangeSetBetweenObjects_block_invoke;
      v37[3] = &unk_1E5D32370;
      uint64_t v19 = v6;
      v38 = v19;
      id v39 = v15;
      id v20 = v18;
      id v40 = v20;
      id v21 = v16;
      id v41 = v21;
      id v22 = v15;
      [v11 enumerateKeysAndObjectsUsingBlock:v37];
      uint64_t v29 = MEMORY[0x1E4F143A8];
      uint64_t v30 = 3221225472;
      v31 = __HKSPGenerateChangeSetBetweenObjects_block_invoke_2;
      v32 = &unk_1E5D32370;
      id v33 = v11;
      v34 = v19;
      id v35 = v20;
      id v36 = v21;
      id v23 = v21;
      id v24 = v20;
      [v22 enumerateKeysAndObjectsUsingBlock:&v29];
      v25 = [HKSPChangeSet alloc];
      uint64_t v26 = -[HKSPChangeSet initWithChangeDictionary:](v25, "initWithChangeDictionary:", v23, v29, v30, v31, v32);
    }
    else
    {
      uint64_t v26 = 0;
    }
  }
  else
  {
    uint64_t v26 = 0;
  }

LABEL_24:
  return v26;
}

void __HKSPGenerateChangeSetBetweenObjects_block_invoke(id *a1, void *a2, void *a3, unsigned char *a4)
{
  id v19 = a2;
  id v7 = a1[4];
  id v8 = a3;
  id v9 = [v7 serializedClasses];
  id v10 = _HKSPDeserializedObject(v8, v9, a4);

  if (!*a4)
  {
    uint64_t v11 = [a1[5] objectForKeyedSubscript:v19];
    BOOL v12 = [a1[4] serializedClasses];
    id v13 = _HKSPDeserializedObject(v11, v12, a4);

    if (!*a4 && (NAEqualObjects() & 1) == 0)
    {
      id v14 = v10;
      id v15 = v13;
      id v13 = v15;
      if ([v14 conformsToProtocol:&unk_1EFE6C930])
      {
        id v13 = v15;
        if ([v15 conformsToProtocol:&unk_1EFE6C930])
        {
          id v16 = HKSPGenerateChangeSetBetweenObjects(v14, v15);
          id v13 = (void *)[v14 mutableCopy];
          HKSPApplyChangesToObject(v13, v16);
        }
      }

      __int16 v17 = [a1[6] objectForKeyedSubscript:v19];
      [v17 isRelationshipProperty];
      id v18 = (void *)[objc_alloc((Class)objc_opt_class()) initWithProperty:v17 changedValue:v13 originalValue:v14];
      [a1[7] setObject:v18 forKeyedSubscript:v19];
    }
  }
}

void __HKSPGenerateChangeSetBetweenObjects_block_invoke_2(id *a1, void *a2, void *a3, unsigned char *a4)
{
  id v13 = a2;
  id v7 = a3;
  id v8 = [a1[4] objectForKeyedSubscript:v13];
  if (!v8)
  {
    id v9 = [a1[5] serializedClasses];
    id v10 = _HKSPDeserializedObject(v7, v9, a4);

    if (!*a4)
    {
      uint64_t v11 = [a1[6] objectForKeyedSubscript:v13];
      [v11 isRelationshipProperty];
      BOOL v12 = (void *)[objc_alloc((Class)objc_opt_class()) initWithProperty:v11 changedValue:v10 originalValue:0];
      [a1[7] setObject:v12 forKeyedSubscript:v13];
    }
  }
}

_HKSPDefaultScheduleProvider *HKSPDefaultScheduleProvider()
{
  uint64_t v0 = objc_alloc_init(_HKSPDefaultScheduleProvider);
  return v0;
}

void HKSPPowerLog(void *a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  id v5 = HKSPLogForCategory(7uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138543618;
    id v7 = v3;
    __int16 v8 = 2114;
    id v9 = v4;
    _os_log_impl(&dword_1A7E74000, v5, OS_LOG_TYPE_INFO, "[HKSPPowerLog] eventName: %{public}@ eventData: %{public}@", (uint8_t *)&v6, 0x16u);
  }

  PLLogRegisteredEvent();
}

void sub_1A7E997A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_1A7E9995C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7E99B58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

id HKSPAlarmConfigurationPropertiesForEquivalency()
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (void *)MEMORY[0x1E4F1CAD0];
  v9[0] = @"HKSPAlarmVersion";
  id v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  id v2 = [v0 setWithArray:v1];

  id v3 = HKSPAlarmConfigurationProperties();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __HKSPAlarmConfigurationPropertiesForEquivalency_block_invoke;
  v7[3] = &unk_1E5D31978;
  id v8 = v2;
  id v4 = v2;
  id v5 = objc_msgSend(v3, "na_filter:", v7);

  return v5;
}

uint64_t __HKSPAlarmConfigurationPropertiesForEquivalency_block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

id HKSPAlarmConfigurationPropertiesForSignificance()
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (void *)MEMORY[0x1E4F1CAD0];
  v9[0] = @"HKSPAlarmEnabled";
  id v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  id v2 = [v0 setWithArray:v1];

  id v3 = HKSPAlarmConfigurationProperties();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __HKSPAlarmConfigurationPropertiesForSignificance_block_invoke;
  v7[3] = &unk_1E5D31978;
  id v8 = v2;
  id v4 = v2;
  id v5 = objc_msgSend(v3, "na_filter:", v7);

  return v5;
}

uint64_t __HKSPAlarmConfigurationPropertiesForSignificance_block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

void *HKSPSleepEventComparator()
{
  return &__block_literal_global_5;
}

uint64_t __HKSPSleepEventComparator_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

id HKSPSleepURLWithOptionsFromSource(void *a1, char a2, void *a3, void *a4)
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [MEMORY[0x1E4F2B860] sharedBehavior];
  int v11 = [v10 isDeviceSupported];

  if (v11)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F29088]);
    id v13 = [MEMORY[0x1E4F2B860] sharedBehavior];
    int v14 = [v13 isAppleWatch];

    if (v14)
    {
      [v12 setScheme:@"nanosleep"];
      id v15 = @"com.apple.NanoSleep.watchkitapp";
    }
    else
    {
      [v12 setScheme:*MEMORY[0x1E4F29E20]];
      id v15 = @"SleepHealthAppPlugin.healthplugin";
    }
    [v12 setHost:v15];
    __int16 v17 = &stru_1EFE54160;
    if (v7) {
      __int16 v17 = v7;
    }
    id v18 = [NSString stringWithFormat:@"/%@", v17];
    [v12 setPath:v18];

    id v19 = objc_alloc(MEMORY[0x1E4F1CA48]);
    id v20 = [MEMORY[0x1E4F290C8] queryItemWithName:@"source" value:v8];
    v28[0] = v20;
    id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
    id v22 = (void *)[v19 initWithArray:v21];

    if (v9)
    {
      id v23 = [MEMORY[0x1E4F290C8] queryItemWithName:@"presentation" value:v9];
      [v22 addObject:v23];
    }
    int v24 = [(__CFString *)v7 isEqualToString:@"viewSchedule"];
    if ((a2 & 2) != 0 && v24)
    {
      v25 = [MEMORY[0x1E4F290C8] queryItemWithName:@"delayScrollToSchedule" value:@"1"];
      [v22 addObject:v25];
    }
    uint64_t v26 = (void *)[v22 copy];
    [v12 setQueryItems:v26];

    id v16 = [v12 URL];
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

id HKSPSleepURL(void *a1, void *a2)
{
  return HKSPSleepURLWithOptionsFromSource(a1, 0, a2, 0);
}

id HKSPSleepURLWithOptions(void *a1, char a2, void *a3)
{
  return HKSPSleepURLWithOptionsFromSource(a1, a2, a3, 0);
}

id HKSPSleepURLWithProvenanceInfo(void *a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = a1;
  id v7 = [v5 source];
  id v8 = [v5 presentation];

  id v9 = HKSPSleepURLWithOptionsFromSource(v6, a2, v7, v8);

  return v9;
}

uint64_t HKSPSleepFocusConfigurationURL()
{
  return objc_msgSend(MEMORY[0x1E4F1CB10], "dnd_settingsURLWithModeIdentifier:", @"com.apple.sleep.sleep-mode");
}

uint64_t HKSPSleepFocusOnboardingURL()
{
  return objc_msgSend(MEMORY[0x1E4F1CB10], "dnd_setupURLWithSemanticType:", 1);
}

uint64_t HKSPSleepWatchAppURL()
{
  return [MEMORY[0x1E4F1CB10] URLWithString:@"bridge:root=com.apple.NanoBedtimeBridgeSettings"];
}

uint64_t HKSPScreenTimeURL()
{
  return [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=SCREEN_TIME&path=CONTENT_PRIVACY/ALLOWED_APPS"];
}

uint64_t HKSPIsRemoveSpacesForTimeFormatEnabled()
{
  uint64_t v0 = HKSPLocalizedString(@"ENABLE_REMOVE_SPACES_FOR_TIME_FORMAT");
  uint64_t v1 = [v0 isEqualToString:@"1"];

  return v1;
}

__CFString *NSStringFromHKSPDevice(uint64_t a1)
{
  uint64_t v1 = a1 - 1;
  uint64_t result = @"Phone";
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = @"Watch";
      break;
    case 2:
      uint64_t result = @"iPod";
      break;
    case 3:
      uint64_t result = @"iPad";
      break;
    case 4:
      uint64_t result = @"Mac";
      break;
    case 5:
      uint64_t result = @"Reality";
      break;
    default:
      uint64_t result = @"Other";
      break;
  }
  return result;
}

uint64_t HKSPIsUnitTesting()
{
  if (qword_1EB538570 != -1) {
    dispatch_once(&qword_1EB538570, &__block_literal_global_6);
  }
  return _MergedGlobals_10;
}

Class __HKSPIsUnitTesting_block_invoke()
{
  Class result = NSClassFromString(&cfstr_Xctest.isa);
  _MergedGlobals_10 = result != 0;
  return result;
}

id HKSPActivePairedDeviceApplicationsInstalledDistributedNotification()
{
  return (id)*MEMORY[0x1E4F4AC48];
}

id HKSPActivePairedDeviceApplicationsUninstalledDistributedNotification()
{
  return (id)*MEMORY[0x1E4F4AC50];
}

void sub_1A7EA0338(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

uint64_t HKSPSleepLockScreenServerInterface()
{
  return [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFE7E938];
}

id HKSPSleepLockScreenClientInterface()
{
  if (qword_1EB5385B0 != -1) {
    dispatch_once(&qword_1EB5385B0, &__block_literal_global_409);
  }
  uint64_t v0 = (void *)qword_1EB5385A8;
  return v0;
}

void __HKSPSleepLockScreenClientInterface_block_invoke()
{
  void v6[4] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFE7E998];
  uint64_t v1 = (void *)qword_1EB5385A8;
  qword_1EB5385A8 = v0;

  id v2 = (void *)qword_1EB5385A8;
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  v6[2] = objc_opt_class();
  v6[3] = objc_opt_class();
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:4];
  id v5 = [v3 setWithArray:v4];
  [v2 setClasses:v5 forSelector:sel_setLockScreenState_userInfo_ argumentIndex:1 ofReply:0];
}

id HKSPSleepLockScreenRemoteContentHostInterface()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFE7E9F8];
  [v0 setXPCType:MEMORY[0x1E4F14590] forSelector:sel_getContentBoundsWithReplyBlock_ argumentIndex:0 ofReply:1];
  return v0;
}

id HKSPSleepLockScreenRemoteContentServiceInterface()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFE7EA58];
  uint64_t v1 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v6 count:3];
  id v3 = objc_msgSend(v1, "setWithArray:", v2, v6, v7);
  [v0 setClasses:v3 forSelector:sel_configureWithUserInfo_contentBounds_endpoint_ argumentIndex:0 ofReply:0];

  uint64_t v4 = MEMORY[0x1E4F14590];
  [v0 setXPCType:MEMORY[0x1E4F14590] forSelector:sel_configureWithUserInfo_contentBounds_endpoint_ argumentIndex:1 ofReply:0];
  [v0 setXPCType:MEMORY[0x1E4F145A0] forSelector:sel_configureWithUserInfo_contentBounds_endpoint_ argumentIndex:2 ofReply:0];
  [v0 setXPCType:v4 forSelector:sel_getInlinePresentationContentFrameWithReplyBlock_ argumentIndex:0 ofReply:1];
  return v0;
}

void sub_1A7EA3B0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7EA5100(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_1A7EA5690(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

id HKSPSleepScheduleWrapWithSyncAnchor(void *a1, uint64_t a2)
{
  if (a1) {
    [a1 objectWithSyncAnchor:a2];
  }
  else {
  id v2 = +[HKSPSleepSchedule emptyScheduleWithSyncAnchor:a2];
  }
  return v2;
}

id HKSPSleepScheduleUnwrap(void *a1)
{
  id v1 = a1;
  if ([v1 isEmptySleepSchedule]) {
    id v2 = 0;
  }
  else {
    id v2 = v1;
  }
  id v3 = v2;

  return v3;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void sub_1A7EAA3CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7EAAB4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7EAB490(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromHKSPAlarmSource(uint64_t a1)
{
  id v1 = @"Local";
  if (a1 == 1) {
    id v1 = @"NanoSync";
  }
  if (a1 == 2) {
    return @"CloudSync";
  }
  else {
    return v1;
  }
}

void sub_1A7EB659C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_1A7EB73F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7EB74DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getCHSTimelineControllerClass_block_invoke(uint64_t a1)
{
  ChronoServicesLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("CHSTimelineController");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCHSTimelineControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getCHSTimelineControllerClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"HKSPSleepWidgetManager.m", 20, @"Unable to find class %s", "CHSTimelineController");

    __break(1u);
  }
}

void ChronoServicesLibrary()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  if (!ChronoServicesLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x1E4F143A8];
    v3[2] = (void *)3221225472;
    v3[3] = __ChronoServicesLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_1E5D33708;
    uint64_t v5 = 0;
    ChronoServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!ChronoServicesLibraryCore_frameworkLibrary)
  {
    id v1 = [MEMORY[0x1E4F28B00] currentHandler];
    id v2 = [NSString stringWithUTF8String:"void *ChronoServicesLibrary(void)"];
    objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v2, @"HKSPSleepWidgetManager.m", 19, @"%s", v3[0]);

    __break(1u);
    goto LABEL_7;
  }
  uint64_t v0 = v3[0];
  if (v3[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __ChronoServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ChronoServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void __getCHSWidgetServiceClass_block_invoke(uint64_t a1)
{
  ChronoServicesLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("CHSWidgetService");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCHSWidgetServiceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    id v2 = [MEMORY[0x1E4F28B00] currentHandler];
    id v3 = [NSString stringWithUTF8String:"Class getCHSWidgetServiceClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"HKSPSleepWidgetManager.m", 21, @"Unable to find class %s", "CHSWidgetService");

    __break(1u);
  }
}

_HKSPUserDefaultsStatePersistence *HKSPUserDefaultsStatePersistence()
{
  uint64_t v0 = [_HKSPUserDefaultsStatePersistence alloc];
  id v1 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v2 = [(_HKSPUserDefaultsStatePersistence *)v0 initWithUserDefaults:v1];

  return v2;
}

void sub_1A7EBCD18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id HKSPSleepSettingsPropertiesForPersist()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v1 = HKSPSleepSettingsProperties();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __HKSPSleepSettingsPropertiesForPersist_block_invoke;
  v5[3] = &unk_1E5D31978;
  id v6 = v0;
  id v2 = v0;
  id v3 = objc_msgSend(v1, "na_filter:", v5);

  return v3;
}

uint64_t __HKSPSleepSettingsPropertiesForPersist_block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

id HKSPSleepSettingsPropertiesForSync()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  [v0 addObject:@"HKSPShareAcrossDevices"];
  id v1 = HKSPSleepSettingsPerGizmoProperties();
  id v2 = objc_msgSend(v1, "na_map:", &__block_literal_global_16);
  [v0 unionSet:v2];

  id v3 = HKSPSleepSettingsPropertiesForPersist();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __HKSPSleepSettingsPropertiesForSync_block_invoke_2;
  v7[3] = &unk_1E5D31978;
  id v8 = v0;
  id v4 = v0;
  uint64_t v5 = objc_msgSend(v3, "na_filter:", v7);

  return v5;
}

id HKSPSleepSettingsPerGizmoProperties()
{
  id v0 = (void *)MEMORY[0x1E4F1CAD0];
  id v1 = [(HKSPProperty *)[_HKSPBoolProperty alloc] initWithIdentifier:@"HKSPWatchSleepFeaturesEnabled" propertyName:@"watchSleepFeaturesEnabled"];
  id v2 = [v0 setWithObject:v1];

  return v2;
}

uint64_t __HKSPSleepSettingsPropertiesForSync_block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

uint64_t __HKSPSleepSettingsPropertiesForSync_block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

id HKSPSleepSettingsPropertiesForEquivalency()
{
  void v9[2] = *MEMORY[0x1E4F143B8];
  id v0 = (void *)MEMORY[0x1E4F1CAD0];
  v9[0] = @"HKSPSettingsVersion";
  v9[1] = @"HKSPSettingsLastModifiedDate";
  id v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  id v2 = [v0 setWithArray:v1];

  id v3 = HKSPSleepSettingsProperties();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __HKSPSleepSettingsPropertiesForEquivalency_block_invoke;
  v7[3] = &unk_1E5D31978;
  id v8 = v2;
  id v4 = v2;
  uint64_t v5 = objc_msgSend(v3, "na_filter:", v7);

  return v5;
}

uint64_t __HKSPSleepSettingsPropertiesForEquivalency_block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

id HKSPSleepSettingsPropertiesForSignificance()
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v0 = (void *)MEMORY[0x1E4F1CAD0];
  id v1 = [MEMORY[0x1E4F2B860] sharedBehavior];
  if ([v1 isAppleWatch])
  {
    v10[0] = @"HKSPWatchSleepFeaturesEnabled";
    id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    id v3 = [v0 setWithArray:v2];
  }
  else
  {
    id v3 = [v0 setWithArray:MEMORY[0x1E4F1CBF0]];
  }

  uint64_t v4 = HKSPSleepSettingsProperties();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __HKSPSleepSettingsPropertiesForSignificance_block_invoke;
  v8[3] = &unk_1E5D31978;
  id v9 = v3;
  id v5 = v3;
  id v6 = objc_msgSend(v4, "na_filter:", v8);

  return v6;
}

uint64_t __HKSPSleepSettingsPropertiesForSignificance_block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

id HKSPSleepSettingsDefaultValues()
{
  v6[2] = *MEMORY[0x1E4F143B8];
  id v0 = [(HKSPProperty *)[_HKSPBoolProperty alloc] initWithIdentifier:@"HKSPWatchSleepFeaturesEnabled" propertyName:@"watchSleepFeaturesEnabled"];
  v5[0] = v0;
  uint64_t v1 = MEMORY[0x1E4F1CC38];
  v6[0] = MEMORY[0x1E4F1CC38];
  id v2 = [(HKSPProperty *)[_HKSPBoolProperty alloc] initWithIdentifier:@"HKSPShareAcrossDevices" propertyName:@"shareAcrossDevices"];
  v5[1] = v2;
  v6[1] = v1;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:2];

  return v3;
}

void sub_1A7EBE5EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

void sub_1A7EBE7E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7EBE9CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7EBEC48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7EBEFF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void sub_1A7EC0910(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7EC17B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{
}

void sub_1A7EC1D98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7EC2058(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7EC24B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

_HKSPImmediateScheduler *HKSPImmediateScheduler()
{
  id v0 = objc_alloc_init(_HKSPImmediateScheduler);
  return v0;
}

_HKSPQueueBackedScheduler *HKSPSerialQueueBackedScheduler(void *a1)
{
  return HKSPSerialQueueBackedSchedulerWithQoS(a1, QOS_CLASS_UNSPECIFIED);
}

_HKSPQueueBackedScheduler *HKSPSerialQueueBackedSchedulerWithQoS(void *a1, dispatch_qos_class_t a2)
{
  uint64_t v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v5 = dispatch_queue_attr_make_with_qos_class(v4, a2, 0);
  id v6 = a1;

  id v7 = v6;
  id v8 = (const char *)[v7 UTF8String];

  dispatch_queue_t v9 = dispatch_queue_create(v8, v5);
  uint64_t v10 = [[_HKSPQueueBackedScheduler alloc] initWithQueue:v9];

  return v10;
}

id HKSPDispatchQueueName(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = a2;
  if (v3)
  {
    int v5 = [(id)objc_opt_class() isEqual:v3];
    id v6 = NSString;
    id v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    dispatch_queue_t v9 = (void *)v8;
    uint64_t v10 = @".";
    int v11 = &stru_1EFE54160;
    if (v4) {
      int v11 = v4;
    }
    else {
      uint64_t v10 = &stru_1EFE54160;
    }
    if (v5) {
      [v6 stringWithFormat:@"com.apple.sleep.%@%@%@", v8, v10, v11, v15];
    }
    else {
    id v13 = [v6 stringWithFormat:@"com.apple.sleep.%@%@%@.%p", v8, v10, v11, v3];
    }
  }
  else
  {
    id v12 = &stru_1EFE54160;
    if (v4) {
      id v12 = v4;
    }
    id v13 = [NSString stringWithFormat:@"com.apple.sleep.%@", v12];
  }

  return v13;
}

void HKSPResetUserDefaults(void *a1)
{
  id v1 = a1;
  objc_msgSend(v1, "hksp_dictionaryRepresentation");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = [v5 allKeys];
  uint64_t v4 = [v2 setWithArray:v3];
  objc_msgSend(v1, "hksp_removeObjectsForKeys:", v4);

  objc_msgSend(v1, "hksp_synchronize");
}

__CFString *NSStringFromHKSPAlarmSilentModeOptions(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return &stru_1EFE54160;
  }
  else {
    return off_1E5D33E28[a1 - 1];
  }
}

id HKSPSleepEventRecordPropertiesForEquivalency()
{
  void v9[2] = *MEMORY[0x1E4F143B8];
  id v0 = (void *)MEMORY[0x1E4F1CAD0];
  v9[0] = @"HKSPEventRecordVersion";
  v9[1] = @"HKSPEventRecordLastModifiedDate";
  id v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  id v2 = [v0 setWithArray:v1];

  id v3 = HKSPSleepEventRecordProperties();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __HKSPSleepEventRecordPropertiesForEquivalency_block_invoke;
  v7[3] = &unk_1E5D31978;
  id v8 = v2;
  id v4 = v2;
  id v5 = objc_msgSend(v3, "na_filter:", v7);

  return v5;
}

uint64_t __HKSPSleepEventRecordPropertiesForEquivalency_block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

id HKSPSleepEventRecordPropertiesForSignificance()
{
  id v0 = (void *)MEMORY[0x1E4F1CAD0];
  id v1 = _WakeUpConfirmedUntilDateProperty();
  id v2 = [v0 setWithObject:v1];

  return v2;
}

__CFString *NSStringFromHKSPSleepLockScreenState(unint64_t a1)
{
  if (a1 > 3) {
    return &stru_1EFE54160;
  }
  else {
    return off_1E5D33EB8[a1];
  }
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void sub_1A7EC79E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A7EC8E50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10(uint64_t a1)
{
}

uint64_t HKSPWeekdaysFromDay(uint64_t a1)
{
  if ((unint64_t)(a1 + 2) > 9) {
    return 0;
  }
  else {
    return qword_1A7ED55E0[a1 + 2];
  }
}

uint64_t HKSPDayForWeekdays(uint64_t result)
{
  if (result > 15)
  {
    if (result <= 63)
    {
      if (result == 16) {
        return 6;
      }
      if (result == 32) {
        return 7;
      }
    }
    else
    {
      switch(result)
      {
        case 0x40:
          return 1;
        case 0x7FLL:
          return -1;
        case 0xFFFFFFFFLL:
          return -2;
      }
    }
    return 0;
  }
  else
  {
    switch(result)
    {
      case 0:
      case 4:
        return result;
      case 1:
        uint64_t result = 2;
        break;
      case 2:
        uint64_t result = 3;
        break;
      case 8:
        uint64_t result = 5;
        break;
      default:
        return 0;
    }
  }
  return result;
}

void HKSPEnumerateWeekdays(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1 != 0xFFFFFFFFLL)
  {
    char v5 = 0;
    for (unint64_t i = 1; ; i *= 2)
    {
      if ((i & a1) != 0)
      {
        v3[2](v3, i, &v5);
        if (i > 0x20 || v5) {
          break;
        }
      }
      else if (i > 0x20)
      {
        break;
      }
    }
  }
}

void HKSPEnumerateDaysOfWeek(void *a1, char a2)
{
  id v3 = (void *)MEMORY[0x1E4F1C9A8];
  id v4 = a1;
  objc_msgSend(v3, "hk_gregorianCalendar");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  HKSPEnumerateDaysOfWeekInCalendar(v5, v4, a2);
}

uint64_t HKSPPreviousDay(uint64_t a1)
{
  if (a1 == 1) {
    return 7;
  }
  else {
    return a1 - 1;
  }
}

uint64_t HKSPNextDay(uint64_t a1)
{
  if (a1 == 7) {
    return 1;
  }
  else {
    return a1 + 1;
  }
}

uint64_t HKSPPreviousDayInWeekdays(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = a1;
  if (a1 == 1) {
    uint64_t v2 = 7;
  }
  else {
    uint64_t v2 = a1 - 1;
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __HKSPPreviousDayInWeekdays_block_invoke;
  v5[3] = &unk_1E5D329E0;
  void v5[4] = &v6;
  v5[5] = a2;
  HKSPEnumerateDaysOfWeekStartingOnDay(v2, (uint64_t)v5, 1);
  uint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void sub_1A7EC978C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __HKSPPreviousDayInWeekdays_block_invoke(uint64_t result, uint64_t a2, unsigned char *a3)
{
  if ((unint64_t)(a2 + 2) > 9) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = qword_1A7ED55E0[a2 + 2];
  }
  if ((*(void *)(result + 40) & v3) != 0)
  {
    *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
    *a3 = 1;
  }
  return result;
}

unint64_t HKSPWeekdaysShiftBackOneDay(unint64_t result)
{
  uint64_t v1 = ((result & 1) << 6) | (result >> 1);
  if (result == 0xFFFFFFFF) {
    uint64_t v1 = 0xFFFFFFFFLL;
  }
  if (result) {
    return v1;
  }
  return result;
}

id HKSPIdentifierStringForWeekdays(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __HKSPIdentifierStringForWeekdays_block_invoke;
  v5[3] = &unk_1E5D31A58;
  id v3 = v2;
  id v6 = v3;
  HKSPWeekdaysEnumerateDays(a1, v5, 0);

  return v3;
}

uint64_t __HKSPIdentifierStringForWeekdays_block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  if ((unint64_t)(a2 + 2) > 9) {
    id v3 = @"M";
  }
  else {
    id v3 = off_1E5D34128[a2 + 2];
  }
  return [v2 appendString:v3];
}

__CFString *NSStringForHKSPDay(uint64_t a1)
{
  if ((unint64_t)(a1 + 2) > 9) {
    return @"M";
  }
  else {
    return off_1E5D34128[a1 + 2];
  }
}

BOOL HKSPWeekdaysIsSingleDay(uint64_t a1)
{
  return a1 && (a1 & (a1 - 1)) == 0;
}

uint64_t NSGregorianCalendarDayForHKSPDay(uint64_t result)
{
  if ((unint64_t)(result - 1) >= 7) {
    return 0;
  }
  return result;
}

uint64_t HKSPDayForNSGregorianCalendarDay(uint64_t result)
{
  if ((unint64_t)(result - 1) >= 7) {
    return 0;
  }
  return result;
}

id NSGregorianCalendarDaysForWeekdays(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __NSGregorianCalendarDaysForWeekdays_block_invoke;
  void v6[3] = &unk_1E5D34040;
  id v7 = v2;
  id v3 = v2;
  HKSPEnumerateWeekdays(a1, v6);
  id v4 = (void *)[v3 copy];

  return v4;
}

uint64_t __NSGregorianCalendarDaysForWeekdays_block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = HKSPDayForWeekdays(a2);
  if ((unint64_t)(v3 - 1) >= 7) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = v3;
  }
  return [v2 addIndex:v4];
}

id HKSPDaysForWeekdays(uint64_t a1)
{
  id v2 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendar");
  uint64_t v3 = HKSPDaysForWeekdaysInCalendar(a1, v2);

  return v3;
}

id HKSPDaysForWeekdaysInCalendar(uint64_t a1, void *a2)
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F28E60];
  id v4 = a2;
  id v5 = objc_alloc_init(v3);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __HKSPDaysForWeekdaysInCalendar_block_invoke;
  void v9[3] = &unk_1E5D31A58;
  id v10 = v5;
  id v6 = v5;
  HKSPWeekdaysEnumerateDaysInCalendar(v4, a1, v9, 0);

  id v7 = (void *)[v6 copy];
  return v7;
}

uint64_t __HKSPDaysForWeekdaysInCalendar_block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addIndex:a2];
}

BOOL HKSPWeekdaysAreConsecutive(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  id v6 = objc_msgSend(MEMORY[0x1E4F1C9A8], "hk_gregorianCalendar");
  BOOL v7 = HKSPWeekdaysAreConsecutiveInCalendar(v6, a1, a2, a3);

  return v7;
}

BOOL HKSPWeekdaysAreConsecutiveInCalendar(void *a1, uint64_t a2, uint64_t *a3, uint64_t *a4)
{
  id v7 = a1;
  uint64_t v8 = v7;
  BOOL v9 = 0;
  if (a2 && a2 != 0xFFFFFFFFLL)
  {
    if (a2 == 127)
    {
      if (a3) {
        *a3 = 0;
      }
      if (a4) {
        *a4 = 0;
      }
LABEL_13:
      BOOL v9 = 1;
      goto LABEL_20;
    }
    if ((a2 & (a2 - 1)) == 0)
    {
      if (a3) {
        *a3 = a2;
      }
      if (a4) {
        *a4 = a2;
      }
      goto LABEL_13;
    }
    uint64_t v21 = 0;
    id v22 = &v21;
    uint64_t v23 = 0x2020000000;
    char v24 = 1;
    uint64_t v17 = 0;
    id v18 = &v17;
    uint64_t v19 = 0x2020000000;
    uint64_t v20 = 0;
    uint64_t v13 = 0;
    int v14 = &v13;
    uint64_t v15 = 0x2020000000;
    uint64_t v16 = 0;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __HKSPWeekdaysAreConsecutiveInCalendar_block_invoke;
    v12[3] = &unk_1E5D34068;
    v12[4] = &v17;
    v12[5] = &v13;
    v12[6] = &v21;
    v12[7] = a2;
    HKSPWeekdaysEnumerateDaysInCalendar(v7, a2, v12, 0);
    id v10 = v22;
    if (*((unsigned char *)v22 + 24))
    {
      if (a3) {
        *a3 = v18[3];
      }
      if (a4) {
        *a4 = v14[3];
      }
    }
    BOOL v9 = *((unsigned __int8 *)v10 + 24) != 0;
    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v21, 8);
  }
LABEL_20:

  return v9;
}

void sub_1A7EC9D8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void __HKSPWeekdaysAreConsecutiveInCalendar_block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  v8[0] = 0;
  v8[1] = v8;
  void v8[2] = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __HKSPWeekdaysAreConsecutiveInCalendar_block_invoke_2;
  v5[3] = &unk_1E5D34068;
  uint64_t v7 = *(void *)(a1 + 56);
  void v5[4] = v8;
  int8x16_t v6 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  HKSPEnumerateDaysOfWeekStartingOnDay(a2, (uint64_t)v5, 0);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    *a3 = 1;
  }
  _Block_object_dispose(v8, 8);
}

void sub_1A7EC9EBC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void *__HKSPWeekdaysAreConsecutiveInCalendar_block_invoke_2(void *result, uint64_t a2, unsigned char *a3)
{
  if ((unint64_t)(a2 + 2) > 9) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = qword_1A7ED55E0[a2 + 2];
  }
  uint64_t v4 = *(void *)(result[4] + 8);
  if ((v3 & result[7]) != 0)
  {
    if (*(unsigned char *)(v4 + 24))
    {
      *(unsigned char *)(*(void *)(result[5] + 8) + 24) = 0;
      *a3 = 1;
    }
    else
    {
      *(void *)(*(void *)(result[6] + 8) + 24) = a2;
    }
  }
  else
  {
    *(unsigned char *)(v4 + 24) = 1;
  }
  return result;
}

uint64_t HKSPWeekdaysFromDays(void *a1)
{
  id v1 = a1;
  uint64_t v5 = 0;
  int8x16_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __HKSPWeekdaysFromDays_block_invoke;
  v4[3] = &unk_1E5D34090;
  v4[4] = &v5;
  [v1 enumerateIndexesUsingBlock:v4];
  uint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void sub_1A7EC9FF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __HKSPWeekdaysFromDays_block_invoke(uint64_t result, uint64_t a2)
{
  if ((unint64_t)(a2 + 2) > 9) {
    uint64_t v2 = 0;
  }
  else {
    uint64_t v2 = qword_1A7ED55E0[a2 + 2];
  }
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) |= v2;
  return result;
}

BOOL NSDateIsOnHKSPDayInCalendar(uint64_t a1, uint64_t a2, void *a3)
{
  if ((unint64_t)(a2 - 1) >= 7) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = a2;
  }
  return v3 == [a3 component:512 fromDate:a1];
}

uint64_t HKSPWeekendDaysInCurrentCalendar()
{
  id v0 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v1 = HKSPWeekendDaysInCalendar(v0);

  return v1;
}

uint64_t HKSPWeekendDaysInCalendar(void *a1)
{
  id v1 = a1;
  uint64_t v2 = objc_msgSend(v1, "hk_weekendDays");
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __HKSPWeekendDaysInCalendar_block_invoke;
  v5[3] = &unk_1E5D340B8;
  void v5[4] = &v6;
  objc_msgSend(v2, "na_each:", v5);
  uint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void sub_1A7ECA18C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __HKSPWeekendDaysInCalendar_block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 unsignedIntegerValue];
  if ((unint64_t)(result + 2) > 9) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = qword_1A7ED55E0[result + 2];
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) |= v4;
  return result;
}

uint64_t HKSPWeekdayDaysInCurrentCalendar()
{
  id v0 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v1 = ~HKSPWeekendDaysInCalendar(v0) & 0x7F;

  return v1;
}

uint64_t HKSPWeekdayDaysInCalendar(void *a1)
{
  return ~HKSPWeekendDaysInCalendar(a1) & 0x7F;
}

uint64_t HKSleepScheduleWeekdaysFromHKSPWeekdays(uint64_t a1)
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v7 = 0;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __HKSleepScheduleWeekdaysFromHKSPWeekdays_block_invoke;
  v3[3] = &unk_1E5D34108;
  v3[4] = &v4;
  HKSPWeekdaysEnumerateDays(a1, v3, 0);
  uint64_t v1 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A7ECA30C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __HKSleepScheduleWeekdaysFromHKSPWeekdays_block_invoke(uint64_t result, uint64_t a2)
{
  if ((unint64_t)(a2 - 1) <= 6) {
    *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) |= qword_1A7ED5630[a2 - 1];
  }
  return result;
}

__CFString *NSStringFromHKSPSleepEventTimelineResultsSleepScheduleInvalidReason(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"None";
  }
  else {
    return off_1E5D34178[a1 - 1];
  }
}

void sub_1A7ECA60C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

_HKSPUnfairLock *HKSPUnfairLock()
{
  id v0 = objc_alloc_init(_HKSPUnfairLock);
  return v0;
}

_HKSPSynchronized *HKSPSynchronized()
{
  id v0 = objc_alloc_init(_HKSPSynchronized);
  return v0;
}

_HKSPNoop *HKSPNoop()
{
  id v0 = objc_alloc_init(_HKSPNoop);
  return v0;
}

void *HKSPUnfairLockGenerator()
{
  return &__block_literal_global_21;
}

void *HKSPSynchronizedGenerator()
{
  return &__block_literal_global_65;
}

_HKSPSynchronized *__HKSPSynchronizedGenerator_block_invoke()
{
  id v0 = objc_alloc_init(_HKSPSynchronized);
  return v0;
}

void *HKSPNoopGenerator()
{
  return &__block_literal_global_67;
}

_HKSPNoop *__HKSPNoopGenerator_block_invoke()
{
  id v0 = objc_alloc_init(_HKSPNoop);
  return v0;
}

void HKSPApplyChangesToObject(void *a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  if ((HKSPIsUnitTesting() & 1) == 0)
  {
    uint64_t v5 = HKSPLogForCategory(5uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      id v35 = v4;
      __int16 v36 = 2114;
      id v37 = v3;
      _os_log_impl(&dword_1A7E74000, v5, OS_LOG_TYPE_INFO, "[HKSPObject] applying changeSet: %{public}@ to: %{public}@", buf, 0x16u);
    }
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v6 = objc_msgSend(v4, "changes", v4);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v30;
    v28 = v6;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if ((HKSPIsUnitTesting() & 1) == 0)
        {
          id v12 = HKSPLogForCategory(5uLL);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543618;
            id v35 = v11;
            __int16 v36 = 2114;
            id v37 = v3;
            _os_log_impl(&dword_1A7E74000, v12, OS_LOG_TYPE_INFO, "[HKSPObject] applying change: %{public}@ to: %{public}@", buf, 0x16u);
          }
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v13 = v3;
          id v14 = v11;
          if (([v14 isAdd] & 1) != 0
            || ([v14 isRemove] & 1) != 0
            || ([v14 changedValue],
                uint64_t v15 = objc_claimAutoreleasedReturnValue(),
                char v16 = [v15 conformsToProtocol:&unk_1EFE6CE78],
                v15,
                (v16 & 1) == 0))
          {
            uint64_t v19 = [v13 changeSet];
            [v19 addChange:v14];
          }
          else
          {
            uint64_t v17 = [v14 property];
            id v18 = objc_msgSend(v13, "hksp_valueForProperty:", v17);
            uint64_t v19 = (void *)[v18 mutableCopy];

            uint64_t v20 = [v14 changedValue];
            uint64_t v21 = [v20 changeSet];
            HKSPApplyChangesToObject(v19, v21);

            id v22 = [HKSPRelationshipChange alloc];
            uint64_t v23 = [v14 property];
            char v24 = [v14 originalValue];
            v25 = [(HKSPRelationshipChange *)v22 initWithProperty:v23 changedObject:v19 originalObject:v24];

            uint64_t v26 = [v13 changeSet];
            [v26 addChange:v25];

            uint64_t v6 = v28;
          }
        }
        else
        {
          id v13 = [v3 changeSet];
          [v13 addChange:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v8);
  }
}

uint64_t HKSPCanResolveChangesToObject(void *a1, void *a2)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v4 = [a1 changeSet];
  uint64_t v5 = [v4 changes];

  uint64_t v29 = [v5 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v29)
  {
    uint64_t v28 = *(void *)v31;
    v27 = v5;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v31 != v28) {
        objc_enumerationMutation(v5);
      }
      id v7 = *(id *)(*((void *)&v30 + 1) + 8 * v6);
      id v8 = v3;
      uint64_t v9 = [v7 originalValue];
      id v10 = [v7 changedValue];
      uint64_t v11 = [v7 property];
      id v12 = objc_msgSend(v8, "hksp_valueForProperty:", v11);

      id v13 = HKSPLogForCategory(6uLL);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        id v14 = [v7 property];
        *(_DWORD *)buf = 138544130;
        id v36 = v14;
        __int16 v37 = 2114;
        uint64_t v38 = v9;
        __int16 v39 = 2114;
        id v40 = v10;
        __int16 v41 = 2114;
        id v42 = v12;
        _os_log_impl(&dword_1A7E74000, v13, OS_LOG_TYPE_INFO, "[HKSPObject] property: %{public}@, original value: %{public}@, changed value: %{public}@, saved value: %{public}@", buf, 0x2Au);
      }
      if (NAEqualObjects())
      {
        uint64_t v15 = HKSPLogForCategory(6uLL);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          char v16 = v15;
          uint64_t v17 = "[HKSPObject] original value == saved value, allowing update";
LABEL_14:
          _os_log_impl(&dword_1A7E74000, v16, OS_LOG_TYPE_INFO, v17, buf, 2u);
        }
      }
      else
      {
        if (!NAEqualObjects())
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_25;
          }
          id v18 = v3;
          uint64_t v19 = HKSPLogForCategory(6uLL);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A7E74000, v19, OS_LOG_TYPE_INFO, "[HKSPObject] checking relationship change...", buf, 2u);
          }

          id v20 = v7;
          uint64_t v21 = [v20 changedValue];
          id v22 = v12;
          if (![v21 conformsToProtocol:&unk_1EFE6CE78])
          {

            id v3 = v18;
            uint64_t v5 = v27;
LABEL_25:

LABEL_26:
            v25 = HKSPLogForCategory(6uLL);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              id v36 = v7;
              _os_log_impl(&dword_1A7E74000, v25, OS_LOG_TYPE_DEFAULT, "[HKSPObject] can't resolve %{public}@", buf, 0xCu);
            }

            uint64_t v24 = 0;
            goto LABEL_29;
          }
          char v23 = HKSPCanResolveChangesToObject(v21, v22);

          id v3 = v18;
          uint64_t v5 = v27;
          if ((v23 & 1) == 0) {
            goto LABEL_26;
          }
          goto LABEL_21;
        }
        uint64_t v15 = HKSPLogForCategory(6uLL);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          char v16 = v15;
          uint64_t v17 = "[HKSPObject] changed value == saved value, allowing update";
          goto LABEL_14;
        }
      }

LABEL_21:
      if (v29 == ++v6)
      {
        uint64_t v29 = [v5 countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v29) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  uint64_t v24 = 1;
LABEL_29:

  return v24;
}

uint64_t HKSPEvaluateChangesToObject(void *a1)
{
  id v1 = a1;
  if ([v1 conformsToProtocol:&unk_1EFE6CE78]
    && (objc_opt_class(), (objc_opt_respondsToSelector() & 1) != 0))
  {
    uint64_t v2 = [(id)objc_opt_class() significantProperties];
    id v3 = [v1 changeSet];
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x2020000000;
    uint64_t v14 = 1;
    id v4 = [v3 changes];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __HKSPEvaluateChangesToObject_block_invoke;
    void v8[3] = &unk_1E5D341B8;
    id v5 = v2;
    id v9 = v5;
    id v10 = &v11;
    [v4 enumerateObjectsUsingBlock:v8];

    uint64_t v6 = v12[3];
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    uint64_t v6 = 1;
  }

  return v6;
}

void sub_1A7ECB04C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __HKSPEvaluateChangesToObject_block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = *(void **)(a1 + 32);
  id v12 = v6;
  id v8 = [v6 property];
  LODWORD(v7) = [v7 containsObject:v8];

  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v12;
      if (([v9 isAdd] & 1) != 0
        || ([v9 isRemove] & 1) != 0
        || ([v9 changedValue],
            id v10 = objc_claimAutoreleasedReturnValue(),
            uint64_t v11 = HKSPEvaluateChangesToObject(),
            v10,
            v11 == 2))
      {
        *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 2;
        *a4 = 1;
      }
    }
    else
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 2;
      *a4 = 1;
    }
  }
}

uint64_t HKSPPropertyIdentifiersForProperties(void *a1, const char *a2)
{
  return objc_msgSend(a1, "na_map:", &__block_literal_global_22);
}

uint64_t __HKSPPropertyIdentifiersForProperties_block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

id HKSPDefaultValuesByIdentifier(void *a1)
{
  id v1 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v2 = a1;
  id v3 = objc_alloc_init(v1);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __HKSPDefaultValuesByIdentifier_block_invoke;
  void v6[3] = &unk_1E5D34208;
  id v4 = v3;
  id v7 = v4;
  [v2 enumerateKeysAndObjectsUsingBlock:v6];

  return v4;
}

void __HKSPDefaultValuesByIdentifier_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 identifier];
  [v4 setObject:v5 forKeyedSubscript:v6];
}

uint64_t HKSPObjectsAreEquivalent(void *a1, void *a2)
{
  return HKSPObjectsAreEquivalentWithTransformer(a1, a2, &__block_literal_global_381);
}

uint64_t HKSPObjectsAreEquivalentWithTransformer(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __HKSPObjectsAreEquivalentWithTransformer_block_invoke;
  void v11[3] = &unk_1E5D342C8;
  id v12 = v5;
  id v13 = v6;
  id v7 = v6;
  id v8 = v5;
  uint64_t v9 = _HKSPEquateObjectsWithBlock(v8, a2, v11);

  return v9;
}

id __HKSPObjectsAreEquivalent_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  return v3;
}

void __HKSPObjectsAreEquivalentWithTransformer_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v26 = a2;
  id v7 = a3;
  id v8 = a4;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = [(id)objc_opt_class() propertiesForEquivalence];
  uint64_t v9 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v33 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        uint64_t v14 = *(void *)(a1 + 40);
        uint64_t v15 = objc_msgSend(v26, "hksp_valueForProperty:", v13);
        char v16 = (*(void (**)(uint64_t, void *, void *))(v14 + 16))(v14, v13, v15);

        uint64_t v17 = *(void *)(a1 + 40);
        id v18 = objc_msgSend(v7, "hksp_valueForProperty:", v13);
        uint64_t v19 = (*(void (**)(uint64_t, void *, void *))(v17 + 16))(v17, v13, v18);

        if ([v13 isRelationshipProperty])
        {
          v29[0] = MEMORY[0x1E4F143A8];
          v29[1] = 3221225472;
          v29[2] = __HKSPObjectsAreEquivalentWithTransformer_block_invoke_2;
          v29[3] = &unk_1E5D342A0;
          id v30 = v16;
          id v31 = v19;
          id v20 = v19;
          id v21 = (id)objc_msgSend(v8, "appendEqualsBlocks:", v29, 0);

          id v22 = &v30;
        }
        else
        {
          v27[0] = MEMORY[0x1E4F143A8];
          v27[1] = 3221225472;
          v27[2] = __HKSPObjectsAreEquivalentWithTransformer_block_invoke_3;
          v27[3] = &unk_1E5D34230;
          uint64_t v28 = v19;
          id v23 = v19;
          id v24 = (id)[v8 appendObject:v16 counterpart:v27];
          id v22 = &v28;
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v10);
  }
}

uint64_t __HKSPObjectsAreEquivalentWithTransformer_block_invoke_2(uint64_t a1)
{
  return HKSPObjectsAreEquivalentWithTransformer(*(void *)(a1 + 32), *(void *)(a1 + 40), &__block_literal_global_381);
}

id __HKSPObjectsAreEquivalentWithTransformer_block_invoke_3(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

__CFString *NSStringFromHKSPSleepFocusConfigurationState(unint64_t a1)
{
  if (a1 > 3) {
    return @"Unconfigured";
  }
  else {
    return off_1E5D342E8[a1];
  }
}

id HKSPSleepScheduleOccurrencePropertiesForEquivalency()
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v0 = (void *)MEMORY[0x1E4F1CAD0];
  v9[0] = @"HKSPOccurrenceVersion";
  id v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  id v2 = [v0 setWithArray:v1];

  id v3 = HKSPSleepScheduleOccurrenceProperties();
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __HKSPSleepScheduleOccurrencePropertiesForEquivalency_block_invoke;
  v7[3] = &unk_1E5D31978;
  id v8 = v2;
  id v4 = v2;
  id v5 = objc_msgSend(v3, "na_filter:", v7);

  return v5;
}

uint64_t __HKSPSleepScheduleOccurrencePropertiesForEquivalency_block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

__CFString *NSStringFromHKSPSleepScheduleState(uint64_t a1)
{
  uint64_t result = 0;
  switch(a1)
  {
    case 0:
      uint64_t result = @"Disabled";
      break;
    case 1:
      uint64_t result = @"WakeUp";
      break;
    case 2:
      uint64_t result = @"Bedtime";
      break;
    case 3:
      uint64_t result = @"WindDown";
      break;
    case 4:
    case 5:
      return result;
    case 6:
      uint64_t result = @"DelayedWakeUp";
      break;
    default:
      if (a1 == 0xFFFFFFFFLL) {
        uint64_t result = @"None";
      }
      else {
        uint64_t result = 0;
      }
      break;
  }
  return result;
}

uint64_t NSStringFromHKSPSleepScheduleStateChangeReason(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 7) {
    return 0;
  }
  else {
    return (uint64_t)*(&off_1E5D34360 + a1 - 1);
  }
}

BOOL HKSPSleepScheduleStateIsForBedtime(uint64_t a1)
{
  return ((a1 - 2) & 0xFFFFFFFFFFFFFFFBLL) == 0;
}

BOOL HKSPSleepScheduleStateIsForWindDown(uint64_t a1)
{
  return a1 == 3;
}

BOOL HKSPSleepScheduleStateIsForSleep(uint64_t a1)
{
  return ((a1 - 2) & 0xFFFFFFFFFFFFFFFBLL) == 0 || a1 == 3;
}

uint64_t HKSPSleepScheduleStateChangeReasonIsExpected(unint64_t a1)
{
  return (a1 < 9) & (0x18Au >> a1);
}

__CFString *NSStringFromHKSPAnalyticsSleepNotificationType(uint64_t a1)
{
  if (a1) {
    return @"FocusIntroduction";
  }
  else {
    return @"BedtimeReminder";
  }
}

__CFString *NSStringFromHKSPAnalyticsSleepNotificationAction(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return @"Fired";
  }
  else {
    return off_1E5D343A0[a1 - 1];
  }
}

void sub_1A7ECE59C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11(uint64_t a1)
{
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1F41138A0]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

uint64_t HKFeatureIdentifierIsProvidedBySleepDaemon()
{
  return MEMORY[0x1F40E7CF0]();
}

uint64_t IOPSDrawingUnlimitedPower()
{
  return MEMORY[0x1F40E9100]();
}

uint64_t IOPSGetPercentRemaining()
{
  return MEMORY[0x1F40E9110]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x1F417CE18]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1F417CE38]();
}

uint64_t NAEmptyResult()
{
  return MEMORY[0x1F41307D0]();
}

uint64_t NAEqualObjects()
{
  return MEMORY[0x1F41307D8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1F40E7248](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

uint64_t PLLogRegisteredEvent()
{
  return MEMORY[0x1F4145D90]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _HKLogDroppedError()
{
  return MEMORY[0x1F40E81C0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1F40C9CD8]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

void free(void *a1)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x1F40CD570]();
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}