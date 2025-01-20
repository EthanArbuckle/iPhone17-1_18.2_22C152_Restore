@interface APOdmlAppDownloadVectorBuilder
- (double)weightForEvents:(id)a3;
- (id)eventName;
- (id)eventsBetween:(id)a3 and:(id)a4;
@end

@implementation APOdmlAppDownloadVectorBuilder

- (id)eventsBetween:(id)a3 and:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(APOdmlBiomeSQLQuery);
  v9 = objc_msgSend_query_startDate_endDate_(v7, v8, @"App.Install", v6, v5);

  return v9;
}

- (double)weightForEvents:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v7 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v5, v6);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v8 = v4;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v30, v34, 16);
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v31;
    double v14 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v31 != v13) {
          objc_enumerationMutation(v8);
        }
        v16 = objc_msgSend_objectForKey_(*(void **)(*((void *)&v30 + 1) + 8 * i), v11, @"absoluteTimestamp", (void)v30);
        v17 = (void *)MEMORY[0x1E4F1C9C8];
        objc_msgSend_doubleValue(v16, v18, v19);
        v22 = objc_msgSend_dateWithTimeIntervalSince1970_(v17, v20, v21);
        objc_msgSend_timeIntervalSinceDate_(v7, v23, (uint64_t)v22);
        double v25 = v24;

        objc_msgSend_exponentialDecayConstant(self, v26, v27);
        double v14 = v14 + exp(v25 / -86400.0 * v28);
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v30, v34, 16);
    }
    while (v12);
  }
  else
  {
    double v14 = 0.0;
  }

  return v14;
}

- (id)eventName
{
  return @"AppDownloadEvent";
}

@end