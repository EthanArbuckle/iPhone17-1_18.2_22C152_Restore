@interface PKAnalyticsReporter(PKIdentity)
+ (id)identityViewDidAppearReportEvent:()PKIdentity;
+ (uint64_t)_maximumRetentionPeriodForElements:()PKIdentity;
@end

@implementation PKAnalyticsReporter(PKIdentity)

+ (id)identityViewDidAppearReportEvent:()PKIdentity
{
  v43[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 releasedData];
  v6 = [v5 elements];

  id v40 = 0;
  id v41 = 0;
  id v39 = 0;
  PKISO180135AcceptedFieldsFromElements(v6, 0, &v41, &v40, &v39);
  id v7 = v41;
  id v8 = v40;
  id v9 = v39;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v10 addObjectsFromArray:v7];
  [v10 addObjectsFromArray:v8];
  [v10 addObjectsFromArray:v9];
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v11 addObjectsFromArray:v8];
  [v11 addObjectsFromArray:v9];
  id v12 = objc_alloc(MEMORY[0x1E4F1CA60]);
  uint64_t v13 = *MEMORY[0x1E4F864A0];
  uint64_t v14 = *MEMORY[0x1E4F86730];
  v42[0] = *MEMORY[0x1E4F86308];
  v42[1] = v14;
  uint64_t v15 = *MEMORY[0x1E4F86608];
  v43[0] = v13;
  v43[1] = v15;
  v42[2] = *MEMORY[0x1E4F867D0];
  v43[2] = *MEMORY[0x1E4F86540];
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:3];
  v17 = (void *)[v12 initWithDictionary:v16];

  v18 = __68__PKAnalyticsReporter_PKIdentity__identityViewDidAppearReportEvent___block_invoke(v10);
  [v17 setObject:v18 forKeyedSubscript:*MEMORY[0x1E4F86270]];

  v19 = __68__PKAnalyticsReporter_PKIdentity__identityViewDidAppearReportEvent___block_invoke(v7);

  [v17 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F86278]];
  v20 = __68__PKAnalyticsReporter_PKIdentity__identityViewDidAppearReportEvent___block_invoke(v11);
  [v17 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F86268]];

  uint64_t v21 = [a1 _maximumRetentionPeriodForElements:v6];
  v22 = [NSNumber numberWithInteger:v21];
  v23 = [v22 stringValue];
  [v17 setObject:v23 forKeyedSubscript:*MEMORY[0x1E4F86280]];

  v24 = [v4 releasedData];
  v25 = [v24 application];
  uint64_t v26 = [v25 client];

  v27 = (void *)MEMORY[0x1E4F86538];
  v28 = (void *)MEMORY[0x1E4F86548];
  if (v26 != 2) {
    v28 = (void *)MEMORY[0x1E4F86D78];
  }
  if (v26 != 1) {
    v27 = v28;
  }
  [v17 setObject:*v27 forKeyedSubscript:*MEMORY[0x1E4F86550]];
  v29 = [v4 transactionDate];
  v30 = PKDateIgnoringTime();

  v31 = NSString;
  [v30 timeIntervalSince1970];
  v33 = objc_msgSend(v31, "stringWithFormat:", @"%f", v32);
  [v17 setObject:v33 forKeyedSubscript:*MEMORY[0x1E4F86E08]];

  v34 = [v4 merchant];
  v35 = [v34 displayName];
  [v17 setObject:v35 forKeyedSubscript:*MEMORY[0x1E4F86618]];

  v36 = [v4 merchant];
  v37 = [v36 merchantIdentifier];
  [v17 setObject:v37 forKeyedSubscript:*MEMORY[0x1E4F86638]];

  return v17;
}

+ (uint64_t)_maximumRetentionPeriodForElements:()PKIdentity
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 retentionPeriod] > v6) {
          uint64_t v6 = [v9 retentionPeriod];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

@end