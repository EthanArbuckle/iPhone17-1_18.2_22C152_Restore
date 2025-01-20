@interface SiriNLUExternalTypesSDAConverter
+ (id)convertFromSystemDialogAct:(id)a3;
+ (id)convertFromSystemDialogActs:(id)a3;
+ (id)convertFromSystemGaveOptions:(id)a3;
+ (id)convertFromSystemInformed:(id)a3;
+ (id)convertFromSystemOffered:(id)a3;
+ (id)convertFromSystemPrompted:(id)a3;
+ (id)convertFromSystemReportedFailure:(id)a3;
+ (id)convertFromSystemReportedSuccess:(id)a3;
@end

@implementation SiriNLUExternalTypesSDAConverter

+ (id)convertFromSystemReportedSuccess:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(SIRINLUEXTERNALSystemReportedSuccess);
    v5 = [v3 task];

    if (v5)
    {
      v6 = [v3 task];
      v5 = +[SiriNLUExternalTypesUsoGraphConverter convertFromUsoGraph:v6];
    }
    [(SIRINLUEXTERNALSystemReportedSuccess *)v4 setTask:v5];
    v7 = [v3 taskId];
    v8 = +[SiriNLUExternalTypesConverter convertFromUUID:v7];
    [(SIRINLUEXTERNALSystemReportedSuccess *)v4 setTaskId:v8];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)convertFromSystemReportedFailure:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(SIRINLUEXTERNALSystemReportedFailure);
    v5 = [v3 reason];

    if (v5)
    {
      v6 = [v3 reason];
      v5 = +[SiriNLUExternalTypesUsoGraphConverter convertFromUsoGraph:v6];
    }
    [(SIRINLUEXTERNALSystemReportedFailure *)v4 setReason:v5];
    v7 = [v3 task];

    if (v7)
    {
      v8 = [v3 task];
      v7 = +[SiriNLUExternalTypesUsoGraphConverter convertFromUsoGraph:v8];
    }
    [(SIRINLUEXTERNALSystemReportedFailure *)v4 setTask:v7];
    v9 = [v3 taskId];
    v10 = +[SiriNLUExternalTypesConverter convertFromUUID:v9];
    [(SIRINLUEXTERNALSystemReportedFailure *)v4 setTaskId:v10];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)convertFromSystemPrompted:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(SIRINLUEXTERNALSystemPrompted);
    v5 = [v3 reference];

    if (v5)
    {
      v6 = [v3 reference];
      v5 = +[SiriNLUExternalTypesUsoGraphConverter convertFromUsoGraph:v6];
    }
    [(SIRINLUEXTERNALSystemPrompted *)v4 setTarget:v5];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)convertFromSystemOffered:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = objc_alloc_init(SIRINLUEXTERNALSystemOffered);
    v5 = [v3 offeredAct];

    v6 = +[SiriNLUExternalTypesUDAConverter convertFromUserDialogAct:v5];
    [(SIRINLUEXTERNALSystemOffered *)v4 setOfferedAct:v6];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)convertFromSystemInformed:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(SIRINLUEXTERNALSystemInformed);
    v5 = [v3 entities];

    if (v5)
    {
      v6 = [v3 entities];
      v5 = +[SiriNLUExternalTypesUsoGraphConverter convertFromUsoGraphs:v6];
    }
    [(SIRINLUEXTERNALSystemInformed *)v4 setEntities:v5];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)convertFromSystemGaveOptions:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    v4 = objc_alloc_init(SIRINLUEXTERNALSystemGaveOptions);
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v6 = objc_msgSend(v3, "choices", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = +[SiriNLUExternalTypesUDAConverter convertFromUserDialogAct:*(void *)(*((void *)&v13 + 1) + 8 * i)];
          [v5 addObject:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    [(SIRINLUEXTERNALSystemGaveOptions *)v4 setChoices:v5];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)convertFromSystemDialogAct:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v5 = 0;
    goto LABEL_17;
  }
  id v5 = objc_alloc_init(SIRINLUEXTERNALSystemDialogAct);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [a1 convertFromSystemGaveOptions:v4];
    [(SIRINLUEXTERNALSystemDialogAct *)v5 setGaveOptions:v6];
LABEL_15:

    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [a1 convertFromSystemInformed:v4];
    [(SIRINLUEXTERNALSystemDialogAct *)v5 setInformed:v6];
    goto LABEL_15;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [a1 convertFromSystemOffered:v4];
    [(SIRINLUEXTERNALSystemDialogAct *)v5 setOffered:v6];
    goto LABEL_15;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [a1 convertFromSystemPrompted:v4];
    [(SIRINLUEXTERNALSystemDialogAct *)v5 setPrompted:v6];
    goto LABEL_15;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [a1 convertFromSystemReportedFailure:v4];
    [(SIRINLUEXTERNALSystemDialogAct *)v5 setReportedFailure:v6];
    goto LABEL_15;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [a1 convertFromSystemReportedSuccess:v4];
    [(SIRINLUEXTERNALSystemDialogAct *)v5 setReportedSuccess:v6];
    goto LABEL_15;
  }
LABEL_16:
  uint64_t v7 = [v4 renderedText];
  uint64_t v8 = +[SiriNLUExternalTypesConverter convertFromString:v7];
  [(SIRINLUEXTERNALSystemDialogAct *)v5 setRenderedText:v8];

LABEL_17:
  return v5;
}

+ (id)convertFromSystemDialogActs:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = objc_msgSend(a1, "convertFromSystemDialogAct:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
          [v5 addObject:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

@end