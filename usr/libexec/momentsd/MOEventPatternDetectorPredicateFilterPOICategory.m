@interface MOEventPatternDetectorPredicateFilterPOICategory
- (BOOL)configure:(id)a3;
- (MOEventPatternDetectorPredicateFilterPOICategory)init;
- (id)filterEvents:(id)a3;
@end

@implementation MOEventPatternDetectorPredicateFilterPOICategory

- (MOEventPatternDetectorPredicateFilterPOICategory)init
{
  v7.receiver = self;
  v7.super_class = (Class)MOEventPatternDetectorPredicateFilterPOICategory;
  v2 = [(MOEventPatternDetectorPredicateFilterPOICategory *)&v7 init];
  if (v2)
  {
    uint64_t v3 = +[NSCalendar currentCalendar];
    cal = v2->_cal;
    v2->_cal = (NSCalendar *)v3;

    v5 = v2;
  }

  return v2;
}

- (id)filterEvents:(id)a3
{
  id v46 = a3;
  v4 = objc_opt_new();
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v5 = (id)interestingPOIcategories;
  id v47 = [v5 countByEnumeratingWithState:&v59 objects:v66 count:16];
  if (!v47)
  {

    goto LABEL_39;
  }
  int v51 = 0;
  v44 = v4;
  uint64_t v45 = *(void *)v60;
  id v43 = v5;
  do
  {
    for (i = 0; i != v47; i = (char *)i + 1)
    {
      if (*(void *)v60 != v45) {
        objc_enumerationMutation(v5);
      }
      objc_super v7 = +[NSPredicate predicateWithFormat:@"%K = %lu AND %K = %@", @"category", 1, @"poiCategory", *(void *)(*((void *)&v59 + 1) + 8 * i)];
      v8 = [v46 filteredArrayUsingPredicate:v7];
      if ([v8 count])
      {
        v49 = v7;
        v50 = i;
        unsigned int v48 = [v8 count];
        id v52 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"startDate" ascending:1];
        id v65 = v52;
        v9 = +[NSArray arrayWithObjects:&v65 count:1];
        v10 = [v8 sortedArrayUsingDescriptors:v9];

        v11 = objc_opt_new();
        long long v55 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        id v12 = v10;
        id v13 = [v12 countByEnumeratingWithState:&v55 objects:v64 count:16];
        id obj = v12;
        if (v13)
        {
          id v14 = v13;
          uint64_t v54 = *(void *)v56;
          int v15 = -1;
          uint64_t v16 = 0xFFFFFFFFLL;
          do
          {
            for (j = 0; j != v14; j = (char *)j + 1)
            {
              if (*(void *)v56 != v54) {
                objc_enumerationMutation(obj);
              }
              v18 = *(void **)(*((void *)&v55 + 1) + 8 * (void)j);
              cal = self->_cal;
              v20 = [v18 startDate];
              NSInteger v21 = [(NSCalendar *)cal component:0x2000 fromDate:v20];

              v22 = self->_cal;
              v23 = [v18 startDate];
              LODWORD(v22) = [(NSCalendar *)v22 isDateInWeekend:v23];

              if (v22) {
                BOOL v24 = v15 == v21;
              }
              else {
                BOOL v24 = 1;
              }
              if (!v24)
              {
                v29 = &off_1002F7B08;
                v30 = [v11 objectForKey:&off_1002F7B08];

                if (v30)
                {
                  int v15 = v21;
                }
                else
                {
                  v28 = objc_opt_new();
                  [v11 setObject:v28 forKeyedSubscript:&off_1002F7B08];
                  int v15 = v21;
LABEL_24:
                }
                NSInteger v21 = v16;
                goto LABEL_26;
              }
              v25 = self->_cal;
              v26 = [v18 startDate];
              LOBYTE(v25) = [(NSCalendar *)v25 isDateInWeekend:v26];

              if ((v25 & 1) == 0 && v16 != v21)
              {
                v29 = &off_1002F7B20;
                v27 = [v11 objectForKey:&off_1002F7B20];

                if (!v27)
                {
                  v28 = objc_opt_new();
                  [v11 setObject:v28 forKeyedSubscript:&off_1002F7B20];
                  uint64_t v16 = v21;
                  goto LABEL_24;
                }
LABEL_26:
                v31 = [v11 objectForKeyedSubscript:v29];
                [v31 addObject:v18];

                uint64_t v16 = v21;
                continue;
              }
            }
            id v12 = obj;
            id v14 = [obj countByEnumeratingWithState:&v55 objects:v64 count:16];
          }
          while (v14);
        }
        v51 += v48;

        uint64_t v32 = 0;
        char v33 = 1;
        v4 = v44;
        do
        {
          char v34 = v33;
          v35 = +[NSNumber numberWithInt:v32];
          v36 = [v11 objectForKeyedSubscript:v35];

          if (v36)
          {
            v37 = +[NSNumber numberWithInt:v32];
            v38 = [v11 objectForKeyedSubscript:v37];

            id v63 = v52;
            v39 = +[NSArray arrayWithObjects:&v63 count:1];
            v40 = [v38 sortedArrayUsingDescriptors:v39];
            [v44 addObject:v40];
          }
          char v33 = 0;
          uint64_t v32 = 1;
        }
        while ((v34 & 1) != 0);

        id v5 = v43;
        objc_super v7 = v49;
        i = v50;
        v8 = obj;
      }
    }
    id v47 = [v5 countByEnumeratingWithState:&v59 objects:v66 count:16];
  }
  while (v47);

  if (v51)
  {
    id v41 = v4;
    goto LABEL_40;
  }
LABEL_39:
  id v41 = 0;
LABEL_40:

  return v41;
}

- (BOOL)configure:(id)a3
{
  return 1;
}

- (void).cxx_destruct
{
}

@end