@interface WiFiUsageLQMWindowAnalysisDataTriggered
- (NSArray)triggerCriteriaList;
- (NSString)dataTriggerReason;
- (WiFiUsageLQMWindowAnalysisDataTriggered)initWithRollingWindow:(id)a3 andSubReason:(id)a4 andContext:(context)a5 andTimestamp:(id)a6 onQueue:(id)a7;
- (id)addDimensionsTo:(id)a3;
- (void)performAnalysis;
- (void)setDataTriggerReason:(id)a3;
@end

@implementation WiFiUsageLQMWindowAnalysisDataTriggered

- (WiFiUsageLQMWindowAnalysisDataTriggered)initWithRollingWindow:(id)a3 andSubReason:(id)a4 andContext:(context)a5 andTimestamp:(id)a6 onQueue:(id)a7
{
  int v9 = *(_DWORD *)&a5.var0;
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v16 = (id)[v12 evaluateCriteriaWithStopUponFirstMatch:0];
  v55.receiver = self;
  v55.super_class = (Class)WiFiUsageLQMWindowAnalysisDataTriggered;
  v17 = [(WiFiUsageLQMWindowAnalysis *)&v55 initWithRollingWindow:v12 andReason:@"DataTriggered" andContext:*(void *)&v9 & 0xFFFFFFLL andTimestamp:v14 onQueue:v15];
  v18 = v17;
  if (v17)
  {
    id v43 = v15;
    id v44 = v14;
    id v45 = v13;
    p_dataTriggerReason = &v17->_dataTriggerReason;
    objc_storeStrong((id *)&v17->_dataTriggerReason, a4);
    uint64_t v19 = [v12 getTriggerCriteriaList];
    triggerCriteriaList = v18->_triggerCriteriaList;
    v18->_triggerCriteriaList = (NSArray *)v19;

    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v46 = v12;
    id obj = [v12 features];
    uint64_t v21 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v52 != v23) {
            objc_enumerationMutation(obj);
          }
          v25 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          v26 = NSString;
          v27 = [v25 fieldName];
          int v28 = [v25 isPerSecond];
          v29 = &stru_1F2B5AC50;
          if (v28) {
            v29 = @"PerSecond";
          }
          v30 = [v26 stringWithFormat:@"median_%@%@", v27, v29];

          v31 = objc_opt_new();
          v50.receiver = v18;
          v50.super_class = (Class)WiFiUsageLQMWindowAnalysisDataTriggered;
          v32 = [(WiFiUsageLQMWindowAnalysis *)&v50 lqmWindowsFeatures];
          [v32 setObject:v31 forKeyedSubscript:v30];

          v33 = [v25 median];
          v49.receiver = v18;
          v49.super_class = (Class)WiFiUsageLQMWindowAnalysisDataTriggered;
          v34 = [(WiFiUsageLQMWindowAnalysis *)&v49 lqmWindowsFeatures];
          v35 = [v34 objectForKeyedSubscript:v30];
          [v35 setObject:v33 forKeyedSubscript:@"before"];
        }
        uint64_t v22 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
      }
      while (v22);
    }

    v48.receiver = v18;
    v48.super_class = (Class)WiFiUsageLQMWindowAnalysisDataTriggered;
    v36 = [(WiFiUsageLQMWindowAnalysis *)&v48 reason];
    v37 = *p_dataTriggerReason;
    v38 = v18->_triggerCriteriaList;
    v39 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"matched == YES OR lastTriggered != NIL"];
    v40 = [(NSArray *)v38 filteredArrayUsingPredicate:v39];
    NSLog(&cfstr_SLqmWindowAnal.isa, "-[WiFiUsageLQMWindowAnalysisDataTriggered initWithRollingWindow:andSubReason:andContext:andTimestamp:onQueue:]", v36, v37, v40);

    id v13 = v45;
    id v12 = v46;
    id v15 = v43;
    id v14 = v44;
  }

  return v18;
}

- (void)performAnalysis
{
  v9.receiver = self;
  v9.super_class = (Class)WiFiUsageLQMWindowAnalysisDataTriggered;
  v3 = [(WiFiUsageLQMWindowAnalysis *)&v9 reason];
  dataTriggerReason = self->_dataTriggerReason;
  triggerCriteriaList = self->_triggerCriteriaList;
  v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"matched == YES OR lastTriggered != NIL"];
  v7 = [(NSArray *)triggerCriteriaList filteredArrayUsingPredicate:v6];
  NSLog(&cfstr_SPerformingLqm.isa, "-[WiFiUsageLQMWindowAnalysisDataTriggered performAnalysis]", v3, dataTriggerReason, v7);

  v8.receiver = self;
  v8.super_class = (Class)WiFiUsageLQMWindowAnalysisDataTriggered;
  [(WiFiUsageLQMWindowAnalysis *)&v8 performAnalysis];
}

- (id)addDimensionsTo:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)WiFiUsageLQMWindowAnalysisDataTriggered;
  id v5 = [(WiFiUsageLQMWindowAnalysis *)&v27 addDimensionsTo:v4];
  uint64_t v21 = v4;
  [v4 setObject:self->_dataTriggerReason forKeyedSubscript:@"datatriggeredReason"];
  v6 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = self->_triggerCriteriaList;
  uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if (([v11 valid] & 1) != 0
          || ![(NSString *)self->_dataTriggerReason isEqualToString:@"Match Start"])
        {
          id v12 = [v11 shortPredicateNoSpaces];
          int v13 = [v11 matched];
          id v14 = @"false";
          if (v13) {
            id v14 = @"true";
          }
          [v6 appendFormat:@"%@:%@&", v12, v14];

          id v15 = [v11 lastTriggered];

          if (v15)
          {
            id v16 = [v11 lastTriggered];
            v17 = [v11 firstTriggered];
            [v16 timeIntervalSinceDate:v17];
            v18 = +[WiFiUsageLQMTransformations getBinTimeIntervalUpTo12h:As:](WiFiUsageLQMTransformations, "getBinTimeIntervalUpTo12h:As:", 1);
            uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"datatriggered_criteria%lu_duration", -[NSArray indexOfObject:](self->_triggerCriteriaList, "indexOfObject:", v11));
            [v21 setObject:v18 forKeyedSubscript:v19];
          }
        }
      }
      uint64_t v8 = [(NSArray *)obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v8);
  }

  [v21 setObject:v6 forKeyedSubscript:@"datatriggeredCriteria"];

  return v21;
}

- (NSArray)triggerCriteriaList
{
  return self->_triggerCriteriaList;
}

- (NSString)dataTriggerReason
{
  return self->_dataTriggerReason;
}

- (void)setDataTriggerReason:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataTriggerReason, 0);

  objc_storeStrong((id *)&self->_triggerCriteriaList, 0);
}

@end