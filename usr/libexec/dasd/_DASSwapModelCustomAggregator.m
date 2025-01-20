@interface _DASSwapModelCustomAggregator
- (_DASSwapModelCustomAggregator)initWithAlgorithms:(id)a3;
- (_DASSwapModeling)applicationUsageModeling;
- (double)scoreForApplication:(id)a3 atDate:(id)a4;
- (id)scoresForAllApplicationsAtDate:(id)a3;
- (void)setApplicationUsageModeling:(id)a3;
@end

@implementation _DASSwapModelCustomAggregator

- (_DASSwapModelCustomAggregator)initWithAlgorithms:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)_DASSwapModelCustomAggregator;
  v3 = [(_DASSwapModelAbstractAggregator *)&v16 initWithAlgorithms:a3];
  v4 = v3;
  if (v3)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v5 = [(_DASSwapModelAbstractAggregator *)v3 algorithms];
    id v6 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v9);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_storeStrong((id *)&v4->_applicationUsageModeling, v10);
          }
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v7);
    }
  }
  return v4;
}

- (id)scoresForAllApplicationsAtDate:(id)a3
{
  id v70 = a3;
  v5 = [(_DASSwapModelAbstractAggregator *)self algorithms];
  id v6 = [v5 count];

  if (!v6) {
    goto LABEL_4;
  }
  if (v6 == (id)1)
  {
    id v7 = [(_DASSwapModelAbstractAggregator *)self algorithms];
    uint64_t v8 = [v7 firstObject];
    id v6 = [v8 scoresForAllApplicationsAtDate:v70];

LABEL_4:
    id v9 = 0;
    goto LABEL_5;
  }
  v11 = +[NSMutableSet set];
  long long v12 = +[NSMutableArray array];
  long long v13 = [(_DASSwapModeling *)self->_applicationUsageModeling scoresForAllApplicationsAtDate:v70];
  id v14 = [v13 count];
  [v12 addObject:v13];
  long long v15 = [v13 allKeys];
  v69 = v11;
  [v11 addObjectsFromArray:v15];

  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  objc_super v16 = [(_DASSwapModelAbstractAggregator *)self algorithms];
  id v17 = [v16 countByEnumeratingWithState:&v75 objects:v80 count:16];
  if (v17)
  {
    id v18 = v17;
    id v65 = v14;
    obuint64_t j = v16;
    id v60 = v6;
    v62 = v13;
    v63 = v4;
    id v6 = *(id *)v76;
    char v19 = 1;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(id *)v76 != v6) {
          objc_enumerationMutation(obj);
        }
        v21 = *(_DASSwapModeling **)(*((void *)&v75 + 1) + 8 * i);
        if (v21 != self->_applicationUsageModeling)
        {
          v23 = [(_DASSwapModeling *)v21 scoresForAllApplicationsAtDate:v70];
          v19 &= [v23 count] == 0;
          [v12 addObject:v23];
          v24 = [v23 allKeys];
          [v69 addObjectsFromArray:v24];
        }
      }
      id v18 = [obj countByEnumeratingWithState:&v75 objects:v80 count:16];
    }
    while (v18);

    long long v13 = v62;
    v4 = v63;
    if ((v19 & 1) == 0)
    {
      if (!v65 && (unint64_t)[v69 count] < 0xA)
      {
        int v25 = 0;
        id v9 = 0;
        id v6 = &__NSDictionary0__struct;
        goto LABEL_42;
      }
      id obja = +[NSMutableDictionary dictionary];
      long long v71 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      id v66 = v69;
      id v26 = [v66 countByEnumeratingWithState:&v71 objects:v79 count:16];
      if (!v26) {
        goto LABEL_41;
      }
      id v6 = v26;
      uint64_t v27 = *(void *)v72;
      v28 = &AnalyticsSendEvent_ptr;
LABEL_25:
      uint64_t v29 = 0;
      id v64 = v6;
      while (1)
      {
        if (*(void *)v72 != v27) {
          objc_enumerationMutation(v66);
        }
        uint64_t v30 = *(void *)(*((void *)&v71 + 1) + 8 * v29);
        if (v61 == 3) {
          break;
        }
        if (v61 != 2)
        {
          v52 = [v12 objectAtIndexedSubscript:0];
          v53 = [v52 objectForKeyedSubscript:v30];
          [v53 doubleValue];
          double v55 = v54;

          if (v61 >= 2)
          {
            for (uint64_t j = 1; j != v61; ++j)
            {
              v57 = [v12 objectAtIndexedSubscript:j];
              v58 = [v57 objectForKeyedSubscript:v30];
              [v58 doubleValue];
              double v55 = v55 + v59;
            }
          }
          v50 = v28[400];
          double v51 = v55 / (double)v61;
          goto LABEL_38;
        }
        v31 = v28[400];
        v32 = [v12 firstObject];
        v33 = [v32 objectForKeyedSubscript:v30];
        [v33 doubleValue];
        double v35 = v34;
        [v12 lastObject];
        v37 = uint64_t v36 = v27;
        v38 = [v37 objectForKeyedSubscript:v30];
        [v38 doubleValue];
        v40 = [v31 numberWithDouble:v39 * 0.75 + v35 * 0.25];
        [obja setObject:v40 forKeyedSubscript:v30];

        uint64_t v27 = v36;
        id v6 = v64;

        v28 = &AnalyticsSendEvent_ptr;
LABEL_39:

        if ((id)++v29 == v6)
        {
          id v6 = [v66 countByEnumeratingWithState:&v71 objects:v79 count:16];
          if (!v6)
          {
LABEL_41:

            id v9 = [obja copy];
            int v25 = 1;
            long long v13 = v62;
            v4 = v63;
            goto LABEL_42;
          }
          goto LABEL_25;
        }
      }
      v41 = [v12 firstObject];
      v42 = [v41 objectForKeyedSubscript:v30];
      [v42 doubleValue];
      double v44 = v43;

      double v45 = 0.0;
      for (uint64_t k = 1; k != 3; ++k)
      {
        v47 = [v12 objectAtIndexedSubscript:k];
        v48 = [v47 objectForKeyedSubscript:v30];
        [v48 doubleValue];
        double v45 = v45 + v49;
      }
      v50 = v28[400];
      double v51 = v45 * 0.75 * 0.5 + v44 * 0.25;
LABEL_38:
      v32 = [v50 numberWithDouble:v51];
      [obja setObject:v32 forKeyedSubscript:v30];
      goto LABEL_39;
    }
  }
  else
  {
  }
  [v12 firstObject:v60];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  int v25 = 0;
  id v9 = 0;
LABEL_42:

  if (v25)
  {
    id v9 = v9;
    id v6 = v9;
  }
LABEL_5:

  return v6;
}

- (double)scoreForApplication:(id)a3 atDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(_DASSwapModelAbstractAggregator *)self algorithms];
  id v9 = [v8 count];

  if (v9)
  {
    if (v9 == (id)1)
    {
      v10 = [(_DASSwapModelAbstractAggregator *)self algorithms];
      v11 = [v10 firstObject];
      [v11 scoreForApplication:v6 atDate:v7];
      double v13 = v12;
    }
    else
    {
      [(_DASSwapModeling *)self->_applicationUsageModeling scoreForApplication:v6 atDate:v7];
      double v13 = v14;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v15 = [(_DASSwapModelAbstractAggregator *)self algorithms];
      id v16 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v26;
        double v19 = 0.0;
        do
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(void *)v26 != v18) {
              objc_enumerationMutation(v15);
            }
            v21 = *(_DASSwapModeling **)(*((void *)&v25 + 1) + 8 * i);
            if (v21 != self->_applicationUsageModeling)
            {
              [(_DASSwapModeling *)v21 scoreForApplication:v6 atDate:v7];
              double v19 = v19 + v22;
            }
          }
          id v17 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v17);

        if (v19 != 0.0)
        {
          if (v9 == (id)3)
          {
            double v23 = v19 * 0.5 * 0.75;
          }
          else
          {
            if (v9 != (id)2)
            {
              double v13 = (v13 + v19) / (double)(unint64_t)v9;
              goto LABEL_22;
            }
            double v23 = v19 * 0.75;
          }
          double v13 = v23 + v13 * 0.25;
        }
      }
      else
      {
      }
    }
  }
  else
  {
    double v13 = 0.0;
  }
LABEL_22:

  return v13;
}

- (_DASSwapModeling)applicationUsageModeling
{
  return (_DASSwapModeling *)objc_getProperty(self, a2, 16, 1);
}

- (void)setApplicationUsageModeling:(id)a3
{
}

- (void).cxx_destruct
{
}

@end