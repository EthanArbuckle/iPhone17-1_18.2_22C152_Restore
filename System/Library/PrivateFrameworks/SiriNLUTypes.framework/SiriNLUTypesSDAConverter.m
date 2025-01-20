@interface SiriNLUTypesSDAConverter
+ (id)convertSystemDialogAct:(id)a3;
+ (id)convertSystemDialogActs:(id)a3;
+ (id)convertSystemGaveOptions:(id)a3;
+ (id)convertSystemInformed:(id)a3;
+ (id)convertSystemOffered:(id)a3;
+ (id)convertSystemPrompted:(id)a3;
+ (id)convertSystemReportedFailure:(id)a3;
+ (id)convertSystemReportedSuccess:(id)a3;
@end

@implementation SiriNLUTypesSDAConverter

+ (id)convertSystemReportedSuccess:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = [v3 task];

    if (v5)
    {
      v6 = [v4 task];
      v5 = +[SiriNLUTypesUsoGraphConverter convertUsoGraph:v6];
    }
    id v7 = objc_alloc(MEMORY[0x1E4FA3A10]);
    v8 = [v4 taskId];
    v9 = +[SiriNLUTypesConverter convertUUID:v8];
    v10 = (void *)[v7 initWithTaskId:v9 task:v5];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)convertSystemReportedFailure:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = [v3 reason];

    if (v5)
    {
      v6 = [v4 reason];
      v5 = +[SiriNLUTypesUsoGraphConverter convertUsoGraph:v6];
    }
    id v7 = [v4 task];

    if (v7)
    {
      v8 = [v4 task];
      id v7 = +[SiriNLUTypesUsoGraphConverter convertUsoGraph:v8];
    }
    id v9 = objc_alloc(MEMORY[0x1E4FA3A08]);
    v10 = [v4 taskId];
    v11 = +[SiriNLUTypesConverter convertUUID:v10];
    v12 = (void *)[v9 initWithTaskId:v11 reason:v5 task:v7];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)convertSystemPrompted:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = [v3 target];

    if (v5)
    {
      v6 = [v4 target];
      v5 = +[SiriNLUTypesUsoGraphConverter convertUsoGraph:v6];
    }
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4FA3A00]) initWithReference:v5];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)convertSystemOffered:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FA39F8]);
    v5 = [v3 offeredAct];
    v6 = +[SiriNLUTypesUDAConverter convertUserDialogAct:v5];
    id v7 = (void *)[v4 initWithOfferedAct:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)convertSystemInformed:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    v5 = [v3 entities];

    if (v5)
    {
      v6 = [v4 entities];
      v5 = +[SiriNLUTypesUsoGraphConverter convertUsoGraphs:v6];
    }
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4FA39F0]) initWithEntities:v5];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)convertSystemGaveOptions:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FA39E8]);
    v5 = [v3 choices];
    v6 = +[SiriNLUTypesUDAConverter convertUserDialogActs:v5];
    id v7 = (void *)[v4 initWithChoices:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)convertSystemDialogActs:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v4)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          v10 = objc_msgSend(a1, "convertSystemDialogAct:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
          if (v10) {
            [v5 addObject:v10];
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  return v5;
}

+ (id)convertSystemDialogAct:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
LABEL_20:
    uint64_t v8 = 0;
    goto LABEL_21;
  }
  if ([v4 hasGaveOptions])
  {
    id v6 = [v5 gaveOptions];
    uint64_t v7 = [a1 convertSystemGaveOptions:v6];
  }
  else if ([v5 hasInformed])
  {
    id v6 = [v5 informed];
    uint64_t v7 = [a1 convertSystemInformed:v6];
  }
  else if ([v5 hasOffered])
  {
    id v6 = [v5 offered];
    uint64_t v7 = [a1 convertSystemOffered:v6];
  }
  else if ([v5 hasPrompted])
  {
    id v6 = [v5 prompted];
    uint64_t v7 = [a1 convertSystemPrompted:v6];
  }
  else if ([v5 hasReportedFailure])
  {
    id v6 = [v5 reportedFailure];
    uint64_t v7 = [a1 convertSystemReportedFailure:v6];
  }
  else
  {
    if (![v5 hasReportedSuccess])
    {
LABEL_17:
      v11 = loggerContext(1);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v13 = 136315394;
        long long v14 = "+[SiriNLUTypesSDAConverter convertSystemDialogAct:]";
        __int16 v15 = 2112;
        v16 = v5;
        _os_log_impl(&dword_1C8881000, v11, OS_LOG_TYPE_INFO, "%s [WARN]: Encountered an unknown SDA %@", (uint8_t *)&v13, 0x16u);
      }

      goto LABEL_20;
    }
    id v6 = [v5 reportedSuccess];
    uint64_t v7 = [a1 convertSystemReportedSuccess:v6];
  }
  uint64_t v8 = (void *)v7;

  if (!v8) {
    goto LABEL_17;
  }
  if ([v5 hasRenderedText])
  {
    id v9 = [v5 renderedText];
    v10 = [v9 value];
    [v8 setRenderedText:v10];
  }
LABEL_21:

  return v8;
}

@end