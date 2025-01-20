@interface WFBatteryLevelTrigger(BiomeConext)
- (id)publisherWithScheduler:()BiomeConext;
- (void)shouldFireInResponseToEvent:()BiomeConext triggerIdentifier:completion:;
@end

@implementation WFBatteryLevelTrigger(BiomeConext)

- (void)shouldFireInResponseToEvent:()BiomeConext triggerIdentifier:completion:
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v34 = a4;
  v9 = a5;
  v10 = [v8 eventBody];
  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v11 = v10;
    }
    else {
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }
  id v12 = v11;

  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__770;
  v40 = __Block_byref_object_dispose__771;
  id v41 = 0;
  v13 = BiomeLibrary();
  v14 = [v13 Device];
  v15 = [v14 Power];
  v16 = [v15 BatteryLevel];
  v17 = (void *)[objc_alloc(MEMORY[0x1E4F503E8]) initWithStartDate:0 endDate:0 maxEvents:1 lastN:2 reversed:0];
  v18 = [v16 publisherWithUseCase:@"SHORTCUTS_AUTOMATIONS" options:v17];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __95__WFBatteryLevelTrigger_BiomeConext__shouldFireInResponseToEvent_triggerIdentifier_completion___block_invoke_2;
  v35[3] = &unk_1E65402D0;
  v35[4] = &v36;
  id v19 = (id)[v18 sinkWithCompletion:&__block_literal_global_772 receiveInput:v35];

  uint64_t v20 = [a1 selection];
  if (!v20)
  {
    objc_msgSend(v12, "batteryPercentage", v34);
    BOOL v27 = v26 == (double)(unint64_t)[a1 level];
    goto LABEL_17;
  }
  if (v20 != 1)
  {
    if (v20 == 2)
    {
      objc_msgSend(v12, "batteryPercentage", v34);
      double v22 = v21;
      double v23 = (double)(unint64_t)[a1 level];
      if (v22 >= v23)
      {
        BOOL v25 = 0;
      }
      else
      {
        v13 = [(id)v37[5] eventBody];
        [v13 batteryPercentage];
        BOOL v25 = v24 == (double)(unint64_t)[a1 level];
      }
      v9[2](v9, v25);
      if (v22 >= v23) {
        goto LABEL_24;
      }
LABEL_23:

      goto LABEL_24;
    }
    v33 = getWFTriggersLogObject();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v43 = "-[WFBatteryLevelTrigger(BiomeConext) shouldFireInResponseToEvent:triggerIdentifier:completion:]";
      _os_log_impl(&dword_1C7D7E000, v33, OS_LOG_TYPE_FAULT, "%s Invalid case hit for WFBatteryLevelTrigger", buf, 0xCu);
    }

    BOOL v27 = 0;
LABEL_17:
    v9[2](v9, v27);
    goto LABEL_24;
  }
  objc_msgSend(v12, "batteryPercentage", v34);
  double v29 = v28;
  double v30 = (double)(unint64_t)[a1 level];
  if (v29 <= v30)
  {
    BOOL v32 = 0;
  }
  else
  {
    v13 = [(id)v37[5] eventBody];
    [v13 batteryPercentage];
    BOOL v32 = v31 == (double)(unint64_t)[a1 level];
  }
  v9[2](v9, v32);
  if (v29 > v30) {
    goto LABEL_23;
  }
LABEL_24:
  _Block_object_dispose(&v36, 8);
}

- (id)publisherWithScheduler:()BiomeConext
{
  id v3 = a3;
  v4 = BiomeLibrary();
  v5 = [v4 Device];
  v6 = [v5 Power];
  v7 = [v6 BatteryLevel];

  id v8 = [v7 DSLPublisher];
  v9 = [v8 subscribeOn:v3];

  return v9;
}

@end