@interface WFSoundRecognitionTrigger(BiomeContext)
- (id)publisherWithScheduler:()BiomeContext;
- (void)shouldFireInResponseToEvent:()BiomeContext triggerIdentifier:completion:;
@end

@implementation WFSoundRecognitionTrigger(BiomeContext)

- (void)shouldFireInResponseToEvent:()BiomeContext triggerIdentifier:completion:
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = a5;
  v11 = [v8 eventBody];
  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }
  }
  else
  {
    v12 = 0;
  }
  id v13 = v12;

  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  v14 = (void *)MEMORY[0x1E4F1CAD0];
  v15 = [a1 soundDetectionTypes];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __100__WFSoundRecognitionTrigger_BiomeContext__shouldFireInResponseToEvent_triggerIdentifier_completion___block_invoke;
  v22[3] = &unk_1E6540288;
  v22[4] = &v23;
  v16 = objc_msgSend(v15, "if_map:", v22);
  v17 = [v14 setWithSet:v16];

  if (*((unsigned char *)v24 + 24))
  {
    v18 = [MEMORY[0x1E4FB70B8] allBMApplianceTypes];
    uint64_t v19 = [v17 setByAddingObjectsFromArray:v18];

    v17 = (void *)v19;
  }
  v20 = getWFTriggersLogObject();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v28 = "-[WFSoundRecognitionTrigger(BiomeContext) shouldFireInResponseToEvent:triggerIdentifier:completion:]";
    __int16 v29 = 2114;
    id v30 = v13;
    __int16 v31 = 2114;
    v32 = v17;
    _os_log_impl(&dword_1C7D7E000, v20, OS_LOG_TYPE_DEFAULT, "%s Received sound detection event %{public}@ for trigger containing sound detection types %{public}@", buf, 0x20u);
  }

  v21 = [v13 type];
  v10[2](v10, [v17 containsObject:v21]);

  _Block_object_dispose(&v23, 8);
}

- (id)publisherWithScheduler:()BiomeContext
{
  v3 = (void *)MEMORY[0x1E4F504C8];
  id v4 = a3;
  v5 = [v3 soundDetection];
  v6 = [v5 publisher];
  v7 = [v6 subscribeOn:v4];

  return v7;
}

@end