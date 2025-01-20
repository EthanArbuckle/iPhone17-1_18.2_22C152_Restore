@interface VUIDebugMetricsEventValidatorTableViewController
- (NSArray)results;
- (NSDictionary)event;
- (VUIDebugMetricsEventValidatorTableViewController)initWithEvent:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_reloadResults:(id)a3;
- (void)setEvent:(id)a3;
- (void)setResults:(id)a3;
@end

@implementation VUIDebugMetricsEventValidatorTableViewController

- (VUIDebugMetricsEventValidatorTableViewController)initWithEvent:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VUIDebugMetricsEventValidatorTableViewController;
  v6 = [(VUIDebugMetricsEventValidatorTableViewController *)&v14 initWithStyle:1];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_event, a3);
    objc_initWeak(&location, v7);
    v8 = [(VUIDebugMetricsEventValidatorTableViewController *)v7 tableView];
    [v8 registerClass:objc_opt_class() forCellReuseIdentifier:@"validateCell"];

    v15[0] = v5;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __66__VUIDebugMetricsEventValidatorTableViewController_initWithEvent___block_invoke;
    v11[3] = &unk_1E6DF8938;
    objc_copyWeak(&v12, &location);
    +[VUIDebugMetricsEventValidator validateEvents:v9 forRuleset:@"com.apple.amp.ae.validator.manifest.Video.AllRulesets" withCompletion:v11];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __66__VUIDebugMetricsEventValidatorTableViewController_initWithEvent___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v4 = +[VUIDebugMetricsEventValidator validationResults:v3 fromIndex:0];

  [WeakRetained _reloadResults:v4];
}

- (void)_reloadResults:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__VUIDebugMetricsEventValidatorTableViewController__reloadResults___block_invoke;
  block[3] = &unk_1E6DF5490;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __67__VUIDebugMetricsEventValidatorTableViewController__reloadResults___block_invoke(uint64_t a1)
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [MEMORY[0x1E4F1CA48] array];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v33 = a1;
  id obj = [*(id *)(a1 + 32) valueForKey:@"failedRulesets"];
  uint64_t v3 = [obj countByEnumeratingWithState:&v45 objects:v57 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v46;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v46 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v45 + 1) + 8 * v6);
        v55[0] = @"title";
        id v8 = [v7 valueForKey:@"ruleset"];
        v56[0] = v8;
        v55[1] = @"failedRules";
        v9 = objc_msgSend(v7, "valueForKey:");
        v56[1] = v9;
        v55[2] = @"passedRules";
        v10 = objc_msgSend(v7, "valueForKey:");
        v56[2] = v10;
        v55[3] = @"filteredRules";
        v11 = [v7 valueForKey:@"filteredRules"];
        v56[3] = v11;
        id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:4];
        [v2 addObject:v12];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [obj countByEnumeratingWithState:&v45 objects:v57 count:16];
    }
    while (v4);
  }

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obja = [*(id *)(v33 + 32) valueForKey:@"passedRulesets"];
  uint64_t v13 = [obja countByEnumeratingWithState:&v41 objects:v54 count:16];
  uint64_t v14 = MEMORY[0x1E4F1CBF0];
  if (v13)
  {
    uint64_t v15 = v13;
    uint64_t v16 = *(void *)v42;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v42 != v16) {
          objc_enumerationMutation(obja);
        }
        v18 = *(void **)(*((void *)&v41 + 1) + 8 * v17);
        v52[0] = @"title";
        v19 = [v18 valueForKey:@"ruleset"];
        v53[0] = v19;
        v53[1] = v14;
        v52[1] = @"failedRules";
        v52[2] = @"passedRules";
        v20 = objc_msgSend(v18, "valueForKey:");
        v53[2] = v20;
        v52[3] = @"filteredRules";
        v21 = [v18 valueForKey:@"filteredRules"];
        v53[3] = v21;
        v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:4];
        [v2 addObject:v22];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [obja countByEnumeratingWithState:&v41 objects:v54 count:16];
    }
    while (v15);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id objb = [*(id *)(v33 + 32) valueForKey:@"filteredRulesets"];
  uint64_t v23 = [objb countByEnumeratingWithState:&v37 objects:v51 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v38;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v38 != v25) {
          objc_enumerationMutation(objb);
        }
        v27 = *(void **)(*((void *)&v37 + 1) + 8 * v26);
        v49[0] = @"title";
        v28 = [v27 valueForKey:@"ruleset"];
        v50[0] = v28;
        v50[1] = v14;
        v49[1] = @"failedRules";
        v49[2] = @"passedRules";
        v50[2] = v14;
        v49[3] = @"filteredRules";
        v29 = [v27 valueForKey:@"filteredRules"];
        v50[3] = v29;
        v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:4];
        [v2 addObject:v30];

        ++v26;
      }
      while (v24 != v26);
      uint64_t v24 = [objb countByEnumeratingWithState:&v37 objects:v51 count:16];
    }
    while (v24);
  }

  [WeakRetained setResults:v2];
  v31 = [WeakRetained tableView];
  [v31 reloadData];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  uint64_t v3 = [(VUIDebugMetricsEventValidatorTableViewController *)self results];
  int64_t v4 = [v3 count];

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t result = [(NSArray *)self->_results count];
  if (result)
  {
    id v7 = [(NSArray *)self->_results objectAtIndexedSubscript:a4];
    id v8 = [v7 valueForKey:@"failedRules"];
    uint64_t v9 = [v8 count];

    return v9 + 2;
  }
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithIdentifier:@"validateCell" forIndexPath:v6];
  uint64_t v8 = [v6 section];
  uint64_t v9 = [v6 row];
  v10 = [(VUIDebugMetricsEventValidatorTableViewController *)self results];
  v11 = [v10 objectAtIndexedSubscript:v8];
  id v12 = [v11 valueForKey:@"failedRules"];
  uint64_t v13 = [v12 count];

  if (v9 == v13)
  {
    id v57 = v6;
    uint64_t v14 = [v7 textLabel];
    [v14 setText:@"Passed Rules"];

    uint64_t v58 = v7;
    uint64_t v15 = [v7 detailTextLabel];
    [v15 setNumberOfLines:0];

    uint64_t v16 = [(VUIDebugMetricsEventValidatorTableViewController *)self results];
    uint64_t v17 = [v16 objectAtIndexedSubscript:v8];
    v18 = [v17 valueForKey:@"passedRules"];

    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id obj = v18;
    uint64_t v19 = [obj countByEnumeratingWithState:&v65 objects:v70 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      v21 = &stru_1F3E921E0;
      uint64_t v22 = *(void *)v66;
      do
      {
        uint64_t v23 = 0;
        uint64_t v24 = v21;
        do
        {
          if (*(void *)v66 != v22) {
            objc_enumerationMutation(obj);
          }
          uint64_t v25 = [*(id *)(*((void *)&v65 + 1) + 8 * v23) valueForKey:@"ruleLabel"];
          uint64_t v26 = [NSString stringWithFormat:@"\"%@\", ", v25];
          v21 = [(__CFString *)v24 stringByAppendingString:v26];

          ++v23;
          uint64_t v24 = v21;
        }
        while (v20 != v23);
        uint64_t v20 = [obj countByEnumeratingWithState:&v65 objects:v70 count:16];
      }
      while (v20);
      goto LABEL_20;
    }
LABEL_19:
    v21 = &stru_1F3E921E0;
LABEL_20:

    id v6 = v57;
    id v7 = v58;
    goto LABEL_25;
  }
  if (v9 == v13 + 1)
  {
    id v57 = v6;
    uint64_t v58 = v7;
    v27 = [v7 textLabel];
    [v27 setText:@"Filtered Rules"];

    v28 = [(VUIDebugMetricsEventValidatorTableViewController *)self results];
    v29 = [v28 objectAtIndexedSubscript:v8];
    v30 = [v29 valueForKey:@"filteredRules"];

    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id obj = v30;
    uint64_t v31 = [obj countByEnumeratingWithState:&v61 objects:v69 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      v21 = &stru_1F3E921E0;
      uint64_t v33 = *(void *)v62;
      do
      {
        uint64_t v34 = 0;
        v35 = v21;
        do
        {
          if (*(void *)v62 != v33) {
            objc_enumerationMutation(obj);
          }
          v36 = [*(id *)(*((void *)&v61 + 1) + 8 * v34) valueForKey:@"ruleLabel"];
          long long v37 = [NSString stringWithFormat:@"\"%@\", ", v36];
          v21 = [(__CFString *)v35 stringByAppendingString:v37];

          ++v34;
          v35 = v21;
        }
        while (v32 != v34);
        uint64_t v32 = [obj countByEnumeratingWithState:&v61 objects:v69 count:16];
      }
      while (v32);
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  long long v38 = [(VUIDebugMetricsEventValidatorTableViewController *)self results];
  long long v39 = [v38 objectAtIndexedSubscript:v8];
  long long v40 = [v39 valueForKey:@"failedRules"];
  long long v41 = [v40 objectAtIndexedSubscript:v9];

  long long v42 = [v41 valueForKey:@"ruleLabel"];
  long long v43 = [v7 textLabel];
  [v43 setText:v42];

  long long v44 = [v41 valueForKey:@"onFailMapList"];
  if ([v44 count])
  {
    long long v45 = [v41 valueForKey:@"onFailMapList"];
    long long v46 = [v45 objectAtIndexedSubscript:0];
    long long v47 = [v46 description];
    long long v48 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    id obja = [v47 componentsSeparatedByCharactersInSet:v48];

    v49 = [obja componentsJoinedByString:&stru_1F3E921E0];
    v50 = [v41 valueForKey:@"ruleResult"];
    v21 = [NSString stringWithFormat:@"%@\n%@", v50, v49];
    v51 = [v7 detailTextLabel];
    [MEMORY[0x1E4FB1618] redColor];
    v53 = v52 = v42;
    [v51 setTextColor:v53];

    long long v42 = v52;
  }
  else
  {
    v21 = &stru_1F3E921E0;
  }

LABEL_25:
  v54 = [v7 detailTextLabel];
  [v54 setNumberOfLines:0];

  if (![(__CFString *)v21 length])
  {

    v21 = @"none";
  }
  v55 = [v7 detailTextLabel];
  [v55 setText:v21];

  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  uint64_t v5 = [(VUIDebugMetricsEventValidatorTableViewController *)self results];
  id v6 = [v5 objectAtIndexedSubscript:a4];
  id v7 = [v6 valueForKey:@"title"];
  uint64_t v8 = +[VUIDebugMetricsEventValidator removeGladiatorPrefix:v7];

  return v8;
}

- (NSDictionary)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
}

- (NSArray)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

@end