@interface APPCPolicyAdProcessor
- (APPCPolicyAdProcessor)init;
- (APPCPolicySettings)policySettings;
- (BOOL)isValidPolicy:(id)a3;
- (NSMutableArray)adPolicies;
- (id)aliasTransformedPolicies:(id)a3 alias:(id)a4;
- (id)buildFinalPolicies:(id)a3 policyValue:(id)a4 policyType:(int64_t)a5 expression:(id)a6;
- (id)cartesianProduct:(id)a3;
- (id)flattenPolicy:(id)a3 policyType:(int64_t)a4;
- (void)generatePolicyDataObjects:(id)a3;
- (void)processAdPolicyData;
- (void)setAdPolicies:(id)a3;
@end

@implementation APPCPolicyAdProcessor

- (APPCPolicyAdProcessor)init
{
  v11.receiver = self;
  v11.super_class = (Class)APPCPolicyAdProcessor;
  v2 = [(APPCPolicyAdProcessor *)&v11 init];
  if (v2)
  {
    v3 = APLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = objc_opt_class();
      *(_DWORD *)buf = 138477827;
      v13 = v4;
      id v5 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{private}@] Initializing Policy Settings for APPCPolicyAdProcessor", buf, 0xCu);
    }
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    adPolicies = v2->_adPolicies;
    v2->_adPolicies = v6;

    v8 = objc_alloc_init(APPCPolicySettings);
    policySettings = v2->_policySettings;
    v2->_policySettings = v8;
  }
  return v2;
}

- (BOOL)isValidPolicy:(id)a3
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v20;
    *(void *)&long long v5 = 138478083;
    long long v18 = v5;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v19 + 1) + 8 * (void)v8);
        if ((objc_msgSend(v9, "isEqualToString:", @"timer", v18) & 1) != 0
          || ([v9 isEqualToString:@"spacing"] & 1) != 0
          || ([v9 isEqualToString:@"adsAllowed"] & 1) != 0
          || [v9 isEqualToString:@"timerOrSpacing"]
          || ([v9 isEqualToString:@"adSessionBefore"] & 1) != 0
          || [v9 isEqualToString:@"adSessionAfter"])
        {
          v10 = [v3 objectForKey:v9];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) == 0)
          {
            BOOL v16 = 0;
            goto LABEL_22;
          }
        }
        else
        {
          v12 = APLogForCategory();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            v13 = objc_opt_class();
            *(_DWORD *)buf = v18;
            v24 = v13;
            __int16 v25 = 2114;
            v26 = v9;
            id v14 = v13;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "[%{private}@] FILE A RADAR. There was an unknown key in policies: %{public}@", buf, 0x16u);
          }
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v15 = [v3 countByEnumeratingWithState:&v19 objects:v27 count:16];
      id v6 = v15;
    }
    while (v15);
  }
  BOOL v16 = 1;
LABEL_22:

  return v16;
}

- (void)processAdPolicyData
{
  id v3 = dispatch_get_global_queue(9, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000648B8;
  block[3] = &unk_100233D50;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)generatePolicyDataObjects:(id)a3
{
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = a3;
  id v21 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v21)
  {
    uint64_t v19 = *(void *)v30;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v30 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = v3;
        id v4 = *(void **)(*((void *)&v29 + 1) + 8 * v3);
        uint64_t v5 = [v4 objectForKey:@"value"];
        uint64_t v6 = [v4 objectForKey:@"isXLFormat"];
        uint64_t v7 = [v4 valueForKey:@"policyType"];
        uint64_t v8 = (int)[v7 intValue];

        long long v22 = (void *)v6;
        v23 = (void *)v5;
        v9 = [[APPCPolicyData alloc] initWithPolicyType:v8 policyValue:v5 isXLFormat:v6];
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v10 = v4;
        id v11 = [v10 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v26;
          do
          {
            for (i = 0; i != v12; i = (char *)i + 1)
            {
              if (*(void *)v26 != v13) {
                objc_enumerationMutation(v10);
              }
              id v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
              if (([v15 isEqualToString:@"value"] & 1) == 0
                && ([v15 isEqualToString:@"policyType"] & 1) == 0)
              {
                if ([v15 isEqualToString:@"containerType"])
                {
                  BOOL v16 = [v10 objectForKey:v15];
                  [(APPCPolicyData *)v9 setContainerType:v16];
                }
                else if ([v15 isEqualToString:@"adType"])
                {
                  BOOL v16 = [v10 objectForKey:v15];
                  [(APPCPolicyData *)v9 setAdType:v16];
                }
                else if ([v15 isEqualToString:@"placementDescriptor"])
                {
                  BOOL v16 = [v10 objectForKey:v15];
                  [(APPCPolicyData *)v9 setPlacementDescriptor:v16];
                }
                else if ([v15 isEqualToString:@"adFormatType"])
                {
                  BOOL v16 = [v10 objectForKey:v15];
                  [(APPCPolicyData *)v9 setAdFormatType:v16];
                }
                else if ([v15 isEqualToString:@"userStatus"])
                {
                  BOOL v16 = [v10 objectForKey:v15];
                  [(APPCPolicyData *)v9 setUserStatus:v16];
                }
                else if ([v15 isEqualToString:@"expression"])
                {
                  BOOL v16 = [v10 objectForKey:v15];
                  [(APPCPolicyData *)v9 setExpression:v16];
                }
                else if ([v15 isEqualToString:@"targetingExpression"])
                {
                  BOOL v16 = [v10 objectForKey:v15];
                  [(APPCPolicyData *)v9 setTargetingExpression:v16];
                }
                else
                {
                  if (![v15 isEqualToString:@"dataAdapters"]) {
                    continue;
                  }
                  BOOL v16 = [v10 objectForKey:v15];
                  [(APPCPolicyData *)v9 setDataAdapters:v16];
                }
              }
            }
            id v12 = [v10 countByEnumeratingWithState:&v25 objects:v33 count:16];
          }
          while (v12);
        }

        v17 = [(APPCPolicyAdProcessor *)self adPolicies];
        [v17 addObject:v9];

        uint64_t v3 = v24 + 1;
      }
      while ((id)(v24 + 1) != v21);
      id v21 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v21);
  }
}

- (id)flattenPolicy:(id)a3 policyType:(int64_t)a4
{
  id v5 = a3;
  id v40 = objc_alloc_init((Class)NSMutableArray);
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id obj = v5;
  id v41 = [obj countByEnumeratingWithState:&v54 objects:v61 count:16];
  if (v41)
  {
    uint64_t v37 = *(void *)v55;
    int64_t v38 = a4;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v55 != v37) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v54 + 1) + 8 * v6);
        uint64_t v8 = [v7 objectForKey:@"value"];
        if (!v8)
        {
          uint64_t v8 = +[NSNumber numberWithInt:0];
        }
        v44 = (void *)v8;
        uint64_t v45 = v6;
        if (a4 == 7)
        {
          v43 = [v7 objectForKey:@"expression"];
        }
        else
        {
          v43 = 0;
        }
        v60[0] = @"containerType";
        v60[1] = @"adType";
        v60[2] = @"placementDescriptor";
        v60[3] = @"adFormatType";
        v60[4] = @"userStatus";
        v9 = +[NSArray arrayWithObjects:v60 count:5];
        id v10 = objc_alloc_init((Class)NSMutableDictionary);
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        id v11 = v7;
        id v12 = [v11 countByEnumeratingWithState:&v50 objects:v59 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v51;
          unint64_t v15 = 1;
          do
          {
            for (i = 0; i != v13; i = (char *)i + 1)
            {
              if (*(void *)v51 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v17 = *(void *)(*((void *)&v50 + 1) + 8 * i);
              if ([v9 containsObject:v17])
              {
                long long v18 = [v11 objectForKey:v17];
                id v19 = [v18 count];
                if (v18) {
                  BOOL v20 = v19 == 0;
                }
                else {
                  BOOL v20 = 1;
                }
                if (!v20)
                {
                  v15 *= (void)v19;
                  [v10 setObject:v18 forKey:v17];
                }
              }
            }
            id v13 = [v11 countByEnumeratingWithState:&v50 objects:v59 count:16];
          }
          while (v13);
        }
        else
        {
          unint64_t v15 = 1;
        }
        v42 = v9;

        id v21 = objc_alloc_init((Class)NSMutableDictionary);
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        id v22 = v10;
        id v23 = [v22 countByEnumeratingWithState:&v46 objects:v58 count:16];
        if (v23)
        {
          id v24 = v23;
          uint64_t v25 = *(void *)v47;
          do
          {
            for (j = 0; j != v24; j = (char *)j + 1)
            {
              if (*(void *)v47 != v25) {
                objc_enumerationMutation(v22);
              }
              uint64_t v27 = *(void *)(*((void *)&v46 + 1) + 8 * (void)j);
              id v28 = objc_alloc_init((Class)NSMutableArray);
              long long v29 = [v22 objectForKey:v27];
              unint64_t v30 = (unint64_t)[v29 count];
              unint64_t v31 = v15;
              if (v30) {
                unint64_t v31 = v15 / v30;
              }
              for (; v31; --v31)
                [v28 addObjectsFromArray:v29];
              id v32 = [v28 copy];
              [v21 setObject:v32 forKey:v27];
            }
            id v24 = [v22 countByEnumeratingWithState:&v46 objects:v58 count:16];
          }
          while (v24);
        }

        a4 = v38;
        v33 = [(APPCPolicyAdProcessor *)self buildFinalPolicies:v21 policyValue:v44 policyType:v38 expression:v43];
        [v40 addObjectsFromArray:v33];

        uint64_t v6 = v45 + 1;
      }
      while ((id)(v45 + 1) != v41);
      id v41 = [obj countByEnumeratingWithState:&v54 objects:v61 count:16];
    }
    while (v41);
  }

  id v34 = [v40 copy];

  return v34;
}

- (id)cartesianProduct:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v40;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v40 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = +[NSSet setWithArray:*(void *)(*((void *)&v39 + 1) + 8 * i)];
        id v11 = [v10 allObjects];
        [v4 addObject:v11];
      }
      id v7 = [v5 countByEnumeratingWithState:&v39 objects:v45 count:16];
    }
    while (v7);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v12 = v4;
  id v13 = [v12 countByEnumeratingWithState:&v35 objects:v44 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v36;
    uint64_t v16 = 1;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v36 != v15) {
          objc_enumerationMutation(v12);
        }
        v16 *= (void)[*(id *)(*((void *)&v35 + 1) + 8 * (void)j) count];
      }
      id v14 = [v12 countByEnumeratingWithState:&v35 objects:v44 count:16];
    }
    while (v14);
  }
  else
  {
    uint64_t v16 = 1;
  }
  id v28 = v5;

  id v29 = objc_alloc_init((Class)NSMutableArray);
  if (v16)
  {
    for (unint64_t k = 0; k != v16; ++k)
    {
      id v18 = objc_alloc_init((Class)NSMutableArray);
      [v29 addObject:v18];
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v19 = v12;
      id v20 = [v19 countByEnumeratingWithState:&v31 objects:v43 count:16];
      if (v20)
      {
        id v21 = v20;
        uint64_t v22 = *(void *)v32;
        unint64_t v23 = k;
        do
        {
          for (m = 0; m != v21; m = (char *)m + 1)
          {
            if (*(void *)v32 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v25 = *(void **)(*((void *)&v31 + 1) + 8 * (void)m);
            long long v26 = [v25 objectAtIndex:v23 % (unint64_t)[v25 count]];
            [v18 addObject:v26];

            if ([v25 count]) {
              v23 /= (unint64_t)[v25 count];
            }
          }
          id v21 = [v19 countByEnumeratingWithState:&v31 objects:v43 count:16];
        }
        while (v21);
      }
    }
  }

  return v29;
}

- (id)buildFinalPolicies:(id)a3 policyValue:(id)a4 policyType:(int64_t)a5 expression:(id)a6
{
  id v10 = a3;
  id v35 = a4;
  id v33 = a6;
  id v36 = objc_alloc_init((Class)NSMutableArray);
  id v11 = +[NSMutableArray array];
  id v12 = +[NSMutableArray array];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v13 = v10;
  id v14 = [v13 countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v42;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v42 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v41 + 1) + 8 * i);
        [v11 addObject:v18];
        id v19 = [v13 objectForKey:v18];
        [v12 addObject:v19];
      }
      id v15 = [v13 countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v15);
  }
  long long v32 = v13;

  long long v31 = v12;
  [(APPCPolicyAdProcessor *)self cartesianProduct:v12];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v20 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v38;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(void *)v38 != v22) {
          objc_enumerationMutation(obj);
        }
        id v24 = *(void **)(*((void *)&v37 + 1) + 8 * (void)j);
        id v25 = objc_alloc_init((Class)NSMutableDictionary);
        [v25 setObject:v35 forKey:@"value"];
        long long v26 = +[NSNumber numberWithInteger:a5];
        [v25 setObject:v26 forKey:@"policyType"];

        if (a5 == 7) {
          [v25 setObject:v33 forKey:@"expression"];
        }
        if ([v24 count])
        {
          unint64_t v27 = 0;
          do
          {
            id v28 = [v24 objectAtIndex:v27];
            id v29 = [v11 objectAtIndex:v27];
            [v25 setObject:v28 forKey:v29];

            ++v27;
          }
          while (v27 < (unint64_t)[v24 count]);
        }
        [v36 addObject:v25];
      }
      id v21 = [obj countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v21);
  }

  return v36;
}

- (id)aliasTransformedPolicies:(id)a3 alias:(id)a4
{
  long long v54 = self;
  id v5 = a3;
  id v6 = a4;
  v60 = v5;
  id v7 = [v5 mutableCopy];
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  id v8 = v6;
  id v57 = [v8 countByEnumeratingWithState:&v94 objects:v101 count:16];
  id obj = v8;
  if (!v57)
  {

    goto LABEL_58;
  }
  char v9 = 0;
  uint64_t v56 = *(void *)v95;
  do
  {
    uint64_t v10 = 0;
    do
    {
      if (*(void *)v95 != v56)
      {
        uint64_t v11 = v10;
        objc_enumerationMutation(obj);
        uint64_t v10 = v11;
      }
      uint64_t v59 = v10;
      uint64_t v12 = *(void *)(*((void *)&v94 + 1) + 8 * v10);
      id v13 = [obj objectForKey:v12, v54];
      if (v13)
      {
        id v14 = v13;
        if ([v13 count])
        {
          long long v92 = 0u;
          long long v93 = 0u;
          long long v90 = 0u;
          long long v91 = 0u;
          long long v55 = v14;
          id v63 = v14;
          id v62 = [v63 countByEnumeratingWithState:&v90 objects:v100 count:16];
          if (!v62) {
            goto LABEL_51;
          }
          uint64_t v61 = *(void *)v91;
          while (1)
          {
            uint64_t v15 = 0;
            do
            {
              if (*(void *)v91 != v61)
              {
                uint64_t v16 = v15;
                objc_enumerationMutation(v63);
                uint64_t v15 = v16;
              }
              uint64_t v64 = v15;
              uint64_t v17 = *(void *)(*((void *)&v90 + 1) + 8 * v15);
              uint64_t v18 = [v63 objectForKey:v17];
              id v19 = v18;
              if (v18 && [v18 count])
              {
                long long v88 = 0u;
                long long v89 = 0u;
                long long v86 = 0u;
                long long v87 = 0u;
                id v67 = v60;
                id v66 = [v67 countByEnumeratingWithState:&v86 objects:v99 count:16];
                if (!v66) {
                  goto LABEL_48;
                }
                uint64_t v65 = *(void *)v87;
                v74 = v19;
                uint64_t v75 = v17;
                while (1)
                {
                  uint64_t v20 = 0;
                  do
                  {
                    if (*(void *)v87 != v65)
                    {
                      uint64_t v21 = v20;
                      objc_enumerationMutation(v67);
                      uint64_t v20 = v21;
                    }
                    uint64_t v68 = v20;
                    uint64_t v22 = *(void **)(*((void *)&v86 + 1) + 8 * v20);
                    v81 = v22;
                    if (([v22 isEqualToString:@"timer"] & 1) != 0
                      || ([v22 isEqualToString:@"spacing"] & 1) != 0
                      || ([v22 isEqualToString:@"timerOrSpacing"] & 1) != 0
                      || [v22 isEqualToString:@"adsAllowed"])
                    {
                      unint64_t v23 = [v67 objectForKey:v22];
                      if ([v23 count])
                      {
                        unint64_t v24 = 0;
                        v71 = v23;
                        do
                        {
                          id v25 = [v23 objectAtIndexedSubscript:v24];
                          long long v26 = [v25 objectForKey:v12];

                          if ([v26 containsObject:v17])
                          {
                            id v79 = [v26 mutableCopy];
                            [v79 addObjectsFromArray:v19];
                            [v79 removeObject:v17];
                            unint64_t v27 = +[NSOrderedSet orderedSetWithArray:v79];
                            id v28 = [v27 array];

                            id v29 = [v7 objectForKey:v81];
                            unint64_t v30 = [v29 objectAtIndex:v24];
                            id v31 = [v30 mutableCopy];

                            [v31 setObject:v28 forKey:v12];
                            long long v32 = [v7 objectForKey:v81];
                            id v33 = [v32 mutableCopy];

                            uint64_t v17 = v75;
                            [v33 replaceObjectAtIndex:v24 withObject:v31];
                            [v7 setObject:v33 forKey:v81];

                            unint64_t v23 = v71;
                            char v9 = 1;
                          }

                          ++v24;
                        }
                        while (v24 < (unint64_t)[v23 count]);
                      }
LABEL_29:

                      goto LABEL_30;
                    }
                    if (([v22 isEqualToString:@"adSessionBefore"] & 1) != 0
                      || [v22 isEqualToString:@"adSessionAfter"])
                    {
                      unint64_t v23 = [v67 objectForKey:v22];
                      long long v82 = 0u;
                      long long v83 = 0u;
                      long long v84 = 0u;
                      long long v85 = 0u;
                      id v70 = [v23 countByEnumeratingWithState:&v82 objects:v98 count:16];
                      if (v70)
                      {
                        uint64_t v69 = *(void *)v83;
                        v72 = v23;
                        do
                        {
                          uint64_t v34 = 0;
                          do
                          {
                            if (*(void *)v83 != v69) {
                              objc_enumerationMutation(v23);
                            }
                            uint64_t v73 = v34;
                            uint64_t v77 = *(void *)(*((void *)&v82 + 1) + 8 * v34);
                            id v35 = [v23 objectForKey:x0];
                            if ([v35 count])
                            {
                              unint64_t v36 = 0;
                              v76 = v35;
                              do
                              {
                                long long v37 = [v35 objectAtIndexedSubscript:v36];
                                long long v38 = [v37 objectForKey:v12];

                                if ([v38 containsObject:v17])
                                {
                                  id v39 = [v38 mutableCopy];
                                  [v39 addObjectsFromArray:v19];
                                  [v39 removeObject:v17];
                                  long long v40 = +[NSOrderedSet orderedSetWithArray:v39];
                                  v78 = [v40 array];

                                  long long v41 = [v7 objectForKey:v22];
                                  id v80 = [v41 mutableCopy];

                                  long long v42 = [v80 objectForKey:v77];
                                  [v42 objectAtIndex:v36];
                                  v44 = long long v43 = v7;
                                  id v45 = [v44 mutableCopy];

                                  [v45 setObject:v78 forKey:v12];
                                  long long v46 = +[NSArray arrayWithObject:v45];
                                  long long v47 = [v43 objectForKey:v81];
                                  uint64_t v48 = v12;
                                  id v49 = [v47 mutableCopy];

                                  id v7 = v43;
                                  uint64_t v22 = v81;
                                  [v49 setObject:v46 forKey:v77];
                                  [v7 setObject:v49 forKey:v81];

                                  uint64_t v12 = v48;
                                  id v19 = v74;

                                  uint64_t v17 = v75;
                                  id v35 = v76;
                                  char v9 = 1;
                                }

                                ++v36;
                              }
                              while (v36 < (unint64_t)[v35 count]);
                            }

                            unint64_t v23 = v72;
                            uint64_t v34 = v73 + 1;
                          }
                          while ((id)(v73 + 1) != v70);
                          id v70 = [v72 countByEnumeratingWithState:&v82 objects:v98 count:16];
                        }
                        while (v70);
                      }
                      goto LABEL_29;
                    }
LABEL_30:
                    uint64_t v20 = v68 + 1;
                  }
                  while ((id)(v68 + 1) != v66);
                  id v50 = [v67 countByEnumeratingWithState:&v86 objects:v99 count:16];
                  id v66 = v50;
                  if (!v50)
                  {
LABEL_48:

                    break;
                  }
                }
              }

              uint64_t v15 = v64 + 1;
            }
            while ((id)(v64 + 1) != v62);
            id v62 = [v63 countByEnumeratingWithState:&v90 objects:v100 count:16];
            if (!v62)
            {
LABEL_51:

              id v13 = v55;
              goto LABEL_53;
            }
          }
        }
        id v13 = v14;
      }
LABEL_53:

      uint64_t v10 = v59 + 1;
    }
    while ((id)(v59 + 1) != v57);
    id v57 = [obj countByEnumeratingWithState:&v94 objects:v101 count:16];
  }
  while (v57);

  if (v9)
  {
    long long v51 = obj;
    id v52 = [(APPCPolicyAdProcessor *)v54 aliasTransformedPolicies:v7 alias:obj];
    goto LABEL_59;
  }
LABEL_58:
  id v52 = v7;
  long long v51 = obj;
LABEL_59:

  return v52;
}

- (APPCPolicySettings)policySettings
{
  return self->_policySettings;
}

- (NSMutableArray)adPolicies
{
  return self->_adPolicies;
}

- (void)setAdPolicies:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adPolicies, 0);

  objc_storeStrong((id *)&self->_policySettings, 0);
}

@end