@interface WiFiUsageLQMTriggerCriteriaFilter
- (NSMutableArray)criterias;
- (NSMutableSet)features;
- (NSPredicate)filterSamplesPredicate;
- (WiFiUsageLQMTriggerCriteriaFilter)initWith:(id)a3 forFields:(id)a4 andFeatures:(id)a5;
- (id)description;
- (void)setCriterias:(id)a3;
- (void)setFeatures:(id)a3;
- (void)setFilterSamplesPredicate:(id)a3;
@end

@implementation WiFiUsageLQMTriggerCriteriaFilter

- (NSMutableSet)features
{
  return self->_features;
}

- (NSPredicate)filterSamplesPredicate
{
  return self->_filterSamplesPredicate;
}

- (NSMutableArray)criterias
{
  return self->_criterias;
}

- (WiFiUsageLQMTriggerCriteriaFilter)initWith:(id)a3 forFields:(id)a4 andFeatures:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [v9 objectForKey:@"type"];
  if (v12)
  {
  }
  else
  {
    v13 = [v9 objectForKey:@"test"];

    if (!v13)
    {
      NSLog(&cfstr_SFailedToParse.isa, "-[WiFiUsageLQMTriggerCriteriaFilter initWith:forFields:andFeatures:]", v9);
LABEL_36:
      v5 = 0;
      goto LABEL_37;
    }
  }
  id v36 = (id)objc_opt_new();
  v14 = objc_opt_new();
  v15 = [v9 objectForKey:@"type"];
  if (v15)
  {
    v16 = [v9 objectForKey:@"type"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [v9 objectForKey:@"type"];
      int v17 = [(WiFiUsageLQMTriggerCriteriaFilter *)v5 isEqualToString:@"filter"];

      if (v17)
      {
        v18 = [v9 objectForKey:@"filterconditions"];
        if (v18)
        {
          v19 = [v9 objectForKey:@"filterconditions"];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && ([v9 objectForKey:@"conditions"],
                (v5 = (WiFiUsageLQMTriggerCriteriaFilter *)objc_claimAutoreleasedReturnValue()) != 0))
          {
            v20 = [v9 objectForKey:@"conditions"];
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if (isKindOfClass)
            {
              v32 = [v9 objectForKey:@"filterconditions"];
              v22 = [(id)objc_opt_class() parseCriteria:v32 intoRequiredFields:0 andFeatures:0 forFields:v10 withType:0 isFilter:1];
              if (v22)
              {
                v23 = [MEMORY[0x1E4F28F60] predicateWithFormat:v22];
                long long v40 = 0u;
                long long v41 = 0u;
                long long v38 = 0u;
                long long v39 = 0u;
                id obj = [v9 objectForKey:@"conditions"];
                uint64_t v35 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
                if (v35)
                {
                  uint64_t v34 = *(void *)v39;
                  while (2)
                  {
                    for (uint64_t i = 0; i != v35; ++i)
                    {
                      if (*(void *)v39 != v34) {
                        objc_enumerationMutation(obj);
                      }
                      uint64_t v25 = *(void *)(*((void *)&v38 + 1) + 8 * i);
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        NSLog(&cfstr_SFailedToParse_2.isa, "-[WiFiUsageLQMTriggerCriteriaFilter initWith:forFields:andFeatures:]", v9);

                        goto LABEL_34;
                      }
                      v26 = [[WiFiUsageLQMTriggerCriteria alloc] initWith:v25 forFields:v10 andFeatures:v36];
                      if (v26)
                      {
                        v5 = +[WiFiUsageLQMTriggerCriteria predicateNoQuotes:v23];
                        [(WiFiUsageLQMTriggerCriteria *)v26 setFilterCriteria:v5];

                        [v14 addObject:v26];
                      }
                    }
                    uint64_t v35 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
                    if (v35) {
                      continue;
                    }
                    break;
                  }
                }
              }
              else
              {
                v23 = 0;
              }

              goto LABEL_26;
            }
          }
          else
          {
          }
        }
        NSLog(&cfstr_SFailedToParse_0.isa, "-[WiFiUsageLQMTriggerCriteriaFilter initWith:forFields:andFeatures:]", v9);
        goto LABEL_33;
      }
    }
    else
    {
    }
  }
  v27 = [v9 objectForKey:@"test"];

  if (v27)
  {
    v28 = [[WiFiUsageLQMTriggerCriteria alloc] initWith:v9 forFields:v10 andFeatures:v11];
    [v14 addObject:v28];

    v22 = 0;
    v23 = 0;
LABEL_26:
    if ([v14 count])
    {
      v37.receiver = self;
      v37.super_class = (Class)WiFiUsageLQMTriggerCriteriaFilter;
      v29 = [(WiFiUsageLQMTriggerCriteriaFilter *)&v37 init];
      objc_storeStrong((id *)&v29->_filterSamplesPredicate, v23);
      objc_storeStrong((id *)&v29->_features, v36);
      objc_storeStrong((id *)&v29->_criterias, v14);
      self = v29;
      int v30 = 0;
      v5 = self;
    }
    else
    {
      int v30 = 0;
      v5 = 0;
    }
    goto LABEL_35;
  }
  NSLog(&cfstr_SFailedToParse_3.isa, "-[WiFiUsageLQMTriggerCriteriaFilter initWith:forFields:andFeatures:]", v9);
LABEL_33:
  v22 = 0;
  v23 = 0;
LABEL_34:
  int v30 = 1;
LABEL_35:

  if (v30) {
    goto LABEL_36;
  }
LABEL_37:

  return v5;
}

- (id)description
{
  return (id)[(NSMutableArray *)self->_criterias description];
}

- (void)setFilterSamplesPredicate:(id)a3
{
}

- (void)setCriterias:(id)a3
{
}

- (void)setFeatures:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_criterias, 0);

  objc_storeStrong((id *)&self->_filterSamplesPredicate, 0);
}

@end