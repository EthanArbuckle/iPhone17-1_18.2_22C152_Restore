@interface MTConstraintTreatmentFilter
- (id)apply:(id)a3;
@end

@implementation MTConstraintTreatmentFilter

- (id)apply:(id)a3
{
  v13[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(MTObject *)self metricsKit];
  v6 = [v5 config];
  v7 = [v6 sources];

  if (v7)
  {
    v13[0] = v4;
    v13[1] = v7;
    v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
    v9 = +[MTPromise promiseWithAll:v8];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __37__MTConstraintTreatmentFilter_apply___block_invoke;
    v12[3] = &unk_26430F708;
    v12[4] = self;
    id v10 = [v9 thenWithBlock:v12];
  }
  else
  {
    id v10 = v4;
  }

  return v10;
}

id __37__MTConstraintTreatmentFilter_apply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) metricsKit];
  v5 = [v4 system];
  v6 = [v5 queue];

  if (!v6)
  {
    v6 = dispatch_get_global_queue(0, 0);
  }
  v7 = objc_opt_new();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__MTConstraintTreatmentFilter_apply___block_invoke_2;
  block[3] = &unk_26430FD40;
  uint64_t v8 = *(void *)(a1 + 32);
  id v15 = v3;
  uint64_t v16 = v8;
  id v9 = v7;
  id v17 = v9;
  id v10 = v3;
  dispatch_async(v6, block);
  v11 = v17;
  id v12 = v9;

  return v12;
}

void __37__MTConstraintTreatmentFilter_apply___block_invoke_2(id *a1)
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  v2 = [a1[4] objectAtIndexedSubscript:0];
  id v3 = [a1[4] objectAtIndexedSubscript:1];
  id v4 = [a1[5] metricsKit];
  v5 = [v4 config];
  v6 = [v5 configValueForKeyPath:@"treatmentProfiles" sources:v3];

  v7 = [a1[5] metricsKit];
  uint64_t v8 = [v7 config];
  id v9 = [v8 configValueForKeyPath:@"defaultTreatmentProfiles" sources:v3];

  if (!v6 || !v9)
  {
    [a1[6] finishWithResult:v2];
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v18 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = [a1[5] metricsKit];
      v20 = [v19 topic];
      *(_DWORD *)buf = 138412290;
      v54 = v20;
      _os_log_impl(&dword_218211000, v18, OS_LOG_TYPE_ERROR, "MetricsKit: Configuration for treatment profiles is not valid for topic %@", buf, 0xCu);
    }
    MTError(303, @"Configuration for treatment profiles is not valid", v21, v22, v23, v24, v25, v26, v47);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    [a1[6] finishWithError:v10];
    goto LABEL_19;
  }
  [v6 objectsForKeys:v9 notFoundMarker:MEMORY[0x263EFFA78]];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 countByEnumeratingWithState:&v49 objects:v57 count:16];
  if (!v11) {
    goto LABEL_14;
  }
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)v50;
  id obj = v10;
  while (2)
  {
    uint64_t v14 = 0;
    id v15 = v2;
    do
    {
      if (*(void *)v50 != v13) {
        objc_enumerationMutation(obj);
      }
      uint64_t v16 = +[MTTreatmentProfile treatmentProfileWithConfigData:*(void *)(*((void *)&v49 + 1) + 8 * v14)];
      id v17 = v16;
      if (!v16)
      {
        v27 = MTMetricsKitOSLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v28 = [a1[5] metricsKit];
          v29 = [v28 topic];
          *(_DWORD *)buf = 138412290;
          v54 = v29;
          _os_log_impl(&dword_218211000, v27, OS_LOG_TYPE_ERROR, "MetricsKit: A treatment profile configuration is not valid for topic %@", buf, 0xCu);
        }
        v36 = MTError(303, @"A treatment profile configuration is not valid", v30, v31, v32, v33, v34, v35, v47);
        goto LABEL_27;
      }
      v2 = [v16 performTreatments:v15];

      if (!v2)
      {
        v37 = MTMetricsKitOSLog();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          v38 = [0 objectForKeyedSubscript:@"eventType"];
          v39 = [a1[5] metricsKit];
          v40 = [v39 topic];
          *(_DWORD *)buf = 138412546;
          v54 = v38;
          __int16 v55 = 2112;
          v56 = v40;
          _os_log_impl(&dword_218211000, v37, OS_LOG_TYPE_DEBUG, "MetricsKit: Event %@ in topic %@ has been denylisted by one of the configured treatments", buf, 0x16u);
        }
        v36 = MTError(304, @"The event has been denylisted by one of the configured treatments", v41, v42, v43, v44, v45, v46, v47);
        id v15 = 0;
LABEL_27:
        id v10 = obj;
        [a1[6] finishWithError:v36];

        v2 = v15;
        goto LABEL_19;
      }

      ++v14;
      id v15 = v2;
    }
    while (v12 != v14);
    id v10 = obj;
    uint64_t v12 = [obj countByEnumeratingWithState:&v49 objects:v57 count:16];
    if (v12) {
      continue;
    }
    break;
  }
LABEL_14:

  [a1[6] finishWithResult:v2];
LABEL_19:

LABEL_20:
}

@end