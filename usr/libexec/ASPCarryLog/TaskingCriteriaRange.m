@interface TaskingCriteriaRange
- (BOOL)_checkForWholeCriteriaArray:(id)a3;
- (BOOL)_elementExistsInStats:(id)a3 statsProvider:(id)a4 forCriteriaDict:(id)a5;
- (BOOL)_elementPassesWhiteListCheck:(id)a3 whiteListRef:(id)a4 forCriteriaDict:(id)a5;
- (BOOL)_evaluateWholeCriteriaArray:(id)a3;
- (BOOL)_validateElement:(id)a3 isOptional:(BOOL)isKindOfClass forCriteriaDict:(id)a5;
- (BOOL)allStatIdsExistInStatsProvider:(id)a3;
- (BOOL)evaluateCriteriaUsingStatsProvider:(id)a3 doWhiteListCheck:(BOOL)a4;
- (BOOL)passWhiteListCheck;
- (BOOL)validateCriteria;
- (NSArray)myTaskingCriteria;
- (float)_getElementValue:(id)a3 forElementName:(id)a4 criteriaDict:(id)a5;
- (float)getCriteriaValueUsingStatsProvider:(id)a3 forCriteriaDict:(id)a4;
- (id)initFromTaskingCrit:(id)a3;
- (void)setMyTaskingCriteria:(id)a3;
@end

@implementation TaskingCriteriaRange

- (id)initFromTaskingCrit:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TaskingCriteriaRange;
  v6 = [(TaskingCriteriaRange *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_myTaskingCriteria, a3);
    v8 = v7;
  }

  return v7;
}

- (BOOL)validateCriteria
{
  v3 = [(TaskingCriteriaRange *)self myTaskingCriteria];
  v4 = (char *)[v3 count];

  if ((unint64_t)(v4 - 5) < 0xFFFFFFFFFFFFFFFCLL) {
    return 0;
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v6 = [(TaskingCriteriaRange *)self myTaskingCriteria];
  id v7 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v7)
  {
    id v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v31;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(id *)(*((void *)&v30 + 1) + 8 * i);

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || (char *)[v12 count] - 5 < (char *)0xFFFFFFFFFFFFFFFCLL)
        {
          BOOL v5 = 0;
          goto LABEL_32;
        }
        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v9 = v12;
        id v13 = [v9 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v13)
        {
          id v14 = v13;
          v22 = i;
          uint64_t v23 = v10;
          id v24 = v8;
          v25 = v6;
          id v15 = 0;
          uint64_t v16 = *(void *)v27;
          while (2)
          {
            v17 = 0;
            v18 = v15;
            do
            {
              if (*(void *)v27 != v16) {
                objc_enumerationMutation(v9);
              }
              id v15 = *(id *)(*((void *)&v26 + 1) + 8 * (void)v17);

              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                goto LABEL_31;
              }
              v19 = [v15 objectForKeyedSubscript:@"START_RANGE"];

              if (v19)
              {
                if (![(TaskingCriteriaRange *)self _validateElement:@"START_RANGE" isOptional:0 forCriteriaDict:v15])goto LABEL_31; {
              }
                }
              v20 = [v15 objectForKeyedSubscript:@"END_RANGE" withObjects:v22, v23, v24];

              if (v20)
              {
                if (![(TaskingCriteriaRange *)self _validateElement:@"END_RANGE" isOptional:0 forCriteriaDict:v15])goto LABEL_31; {
              }
                }
              else if (!v19)
              {
                goto LABEL_31;
              }
              if (![(TaskingCriteriaRange *)self _validateElement:@"A" isOptional:0 forCriteriaDict:v15]|| ![(TaskingCriteriaRange *)self _validateElement:@"B" isOptional:0 forCriteriaDict:v15]|| ![(TaskingCriteriaRange *)self _validateElement:@"C" isOptional:1 forCriteriaDict:v15])
              {
LABEL_31:

                BOOL v5 = 0;
                v6 = v25;
                goto LABEL_32;
              }
              v17 = (char *)v17 + 1;
              v18 = v15;
            }
            while (v14 != v17);
            id v14 = [v9 countByEnumeratingWithState:&v26 objects:v34 count:16];
            if (v14) {
              continue;
            }
            break;
          }

          id v8 = v24;
          v6 = v25;
          i = v22;
          uint64_t v10 = v23;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (v8) {
        continue;
      }
      break;
    }
    BOOL v5 = 1;
LABEL_32:
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (BOOL)_validateElement:(id)a3 isOptional:(BOOL)isKindOfClass forCriteriaDict:(id)a5
{
  v6 = [a5 objectForKeyedSubscript:a3];
  id v7 = v6;
  if (!v6)
  {
    id v8 = 0;
    goto LABEL_11;
  }
  id v8 = [v6 objectForKeyedSubscript:@"TYPE"];
  if (![v8 isEqualToString:@"TYPE_STAT"])
  {
    if ([v8 isEqualToString:@"TYPE_CONST"])
    {
      uint64_t v16 = [v7 objectForKeyedSubscript:@"VALUE"];
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      goto LABEL_11;
    }
    goto LABEL_10;
  }
  id v9 = [v7 objectForKeyedSubscript:@"STAT_ID"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_10;
  }
  uint64_t v10 = [v7 objectForKeyedSubscript:@"STAT_TIME_DELTA"];
  objc_opt_class();
  char v11 = objc_opt_isKindOfClass();

  if ((v11 & 1) == 0)
  {
LABEL_10:
    isKindOfClass = 0;
    goto LABEL_11;
  }
  id v12 = [v7 objectForKeyedSubscript:@"START_IDX"];
  objc_opt_class();
  int v13 = objc_opt_isKindOfClass();
  id v14 = [v7 objectForKeyedSubscript:@"END_IDX"];
  objc_opt_class();
  int v15 = v13 ^ objc_opt_isKindOfClass();

  isKindOfClass = v15 ^ 1;
LABEL_11:

  return isKindOfClass;
}

- (BOOL)_checkForWholeCriteriaArray:(id)a3
{
  v4 = (unsigned int (**)(id, id))a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  BOOL v5 = [(TaskingCriteriaRange *)self myTaskingCriteria];
  id v6 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v6)
  {
    id v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v27;
    uint64_t v20 = *(void *)v27;
    do
    {
      uint64_t v10 = 0;
      id v21 = v7;
      do
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(id *)(*((void *)&v26 + 1) + 8 * (void)v10);

        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v8 = v11;
        id v12 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v12)
        {
          id v13 = v12;
          id v14 = 0;
          uint64_t v15 = *(void *)v23;
          while (2)
          {
            uint64_t v16 = 0;
            v17 = v14;
            do
            {
              if (*(void *)v23 != v15) {
                objc_enumerationMutation(v8);
              }
              id v14 = *(id *)(*((void *)&v22 + 1) + 8 * (void)v16);

              if (!v4[2](v4, v14))
              {

                BOOL v18 = 0;
                goto LABEL_19;
              }
              uint64_t v16 = (char *)v16 + 1;
              v17 = v14;
            }
            while (v13 != v16);
            id v13 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
            if (v13) {
              continue;
            }
            break;
          }

          uint64_t v9 = v20;
          id v7 = v21;
        }

        uint64_t v10 = (char *)v10 + 1;
      }
      while (v10 != v7);
      id v7 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v7);
    BOOL v18 = 1;
LABEL_19:
  }
  else
  {
    BOOL v18 = 1;
  }

  return v18;
}

- (BOOL)_evaluateWholeCriteriaArray:(id)a3
{
  v4 = (uint64_t (**)(id, id))a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = [(TaskingCriteriaRange *)self myTaskingCriteria];
  id v19 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v19)
  {
    id v5 = 0;
    int v6 = 0;
    uint64_t v18 = *(void *)v26;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(id *)(*((void *)&v25 + 1) + 8 * i);

        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v5 = v8;
        id v9 = [v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v9)
        {
          id v10 = v9;
          int v20 = v6;
          id v11 = 0;
          uint64_t v12 = *(void *)v22;
          int v13 = 1;
          do
          {
            id v14 = 0;
            uint64_t v15 = v11;
            do
            {
              if (*(void *)v22 != v12) {
                objc_enumerationMutation(v5);
              }
              id v11 = *(id *)(*((void *)&v21 + 1) + 8 * (void)v14);

              v13 &= v4[2](v4, v11);
              id v14 = (char *)v14 + 1;
              uint64_t v15 = v11;
            }
            while (v10 != v14);
            id v10 = [v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }
          while (v10);

          int v6 = v20;
        }
        else
        {
          int v13 = 1;
        }

        v6 |= v13;
      }
      id v19 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v19);
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6 & 1;
}

- (float)_getElementValue:(id)a3 forElementName:(id)a4 criteriaDict:(id)a5
{
  id v7 = a3;
  id v8 = [a5 objectForKeyedSubscript:a4];
  id v9 = [v8 objectForKeyedSubscript:@"TYPE"];
  if ([v9 isEqualToString:@"TYPE_CONST"])
  {
    id v10 = [v8 objectForKeyedSubscript:@"VALUE"];
    [v10 floatValue];
    float v12 = v11;
  }
  else
  {
    float v12 = 1.0;
    if ([v9 isEqualToString:@"TYPE_STAT"])
    {
      int v13 = [v8 objectForKeyedSubscript:@"STAT_ID"];
      id v14 = [v13 integerValue];

      uint64_t v15 = [v8 objectForKeyedSubscript:@"STAT_TIME_DELTA"];
      id v16 = [v15 unsignedIntValue];

      v17 = [v8 objectForKeyedSubscript:@"START_IDX"];

      if (v17)
      {
        uint64_t v18 = [v8 objectForKeyedSubscript:@"START_IDX"];
        id v19 = [v18 unsignedIntValue];

        int v20 = [v8 objectForKeyedSubscript:@"END_IDX"];
        id v21 = [v20 unsignedIntValue];

        [v7 getStatsDeltaForArr:v14 startIdx:v19 endIdx:v21 :v16];
      }
      else
      {
        [v7 getStatsDelta:v14 :v16];
      }
      float v12 = v22;
    }
  }

  return v12;
}

- (float)getCriteriaValueUsingStatsProvider:(id)a3 forCriteriaDict:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(TaskingCriteriaRange *)self _getElementValue:v6 forElementName:@"A" criteriaDict:v7];
  float v9 = v8;
  [(TaskingCriteriaRange *)self _getElementValue:v6 forElementName:@"B" criteriaDict:v7];
  float v11 = v10;
  float v12 = [v7 objectForKeyedSubscript:@"C"];

  if (!v12)
  {
    float v13 = 1.0;
LABEL_5:
    float v14 = (float)(v9 - v11) / v13;
    goto LABEL_6;
  }
  [(TaskingCriteriaRange *)self _getElementValue:v6 forElementName:@"C" criteriaDict:v7];
  float v14 = 0.0;
  if (v13 != 0.0) {
    goto LABEL_5;
  }
LABEL_6:

  return v14;
}

- (BOOL)_elementPassesWhiteListCheck:(id)a3 whiteListRef:(id)a4 forCriteriaDict:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v9 objectForKeyedSubscript:v7];
  if (!v10) {
    goto LABEL_4;
  }
  float v11 = (void *)v10;
  float v12 = [v9 objectForKeyedSubscript:v7];
  float v13 = [v12 objectForKeyedSubscript:@"TYPE"];
  unsigned int v14 = [v13 isEqualToString:@"TYPE_STAT"];

  if (v14)
  {
    uint64_t v15 = [v9 objectForKeyedSubscript:v7];
    id v16 = [v15 objectForKeyedSubscript:@"STAT_ID"];
    unsigned __int8 v17 = [v8 containsObject:v16];
  }
  else
  {
LABEL_4:
    unsigned __int8 v17 = 1;
  }

  return v17;
}

- (BOOL)passWhiteListCheck
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001351C;
  v5[3] = &unk_100090AD8;
  id v6 = &off_1000C1690;
  id v7 = self;
  id v8 = &off_1000C1678;
  LOBYTE(self) = [(TaskingCriteriaRange *)self _checkForWholeCriteriaArray:v5];

  return (char)self;
}

- (BOOL)_elementExistsInStats:(id)a3 statsProvider:(id)a4 forCriteriaDict:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v9 objectForKeyedSubscript:v7];
  if (v10
    && ([v9 objectForKeyedSubscript:v7],
        float v11 = objc_claimAutoreleasedReturnValue(),
        [v11 objectForKeyedSubscript:@"TYPE"],
        float v12 = objc_claimAutoreleasedReturnValue(),
        unsigned int v13 = [v12 isEqualToString:@"TYPE_STAT"],
        v12,
        v11,
        v13))
  {
    unsigned int v14 = [v10 objectForKeyedSubscript:@"STAT_ID"];
    id v15 = [v14 integerValue];

    id v16 = [v10 objectForKeyedSubscript:@"STAT_TIME_DELTA"];
    id v17 = [v16 unsignedIntValue];

    uint64_t v18 = [v10 objectForKeyedSubscript:@"START_IDX"];

    if (v18)
    {
      id v19 = [v10 objectForKeyedSubscript:@"START_IDX"];
      id v20 = [v19 unsignedIntValue];

      uint64_t v22 = [v10 objectForKeyedSubscript:@"END_IDX"];
      id v21 = [(id)v22 unsignedIntValue];

      LOBYTE(v22) = [v8 doesStatIdExistOnDeviceForArr:v15 startIdx:v20 endIdx:v21 timeAgo:0];
      if (v17)
      {
        unsigned __int8 v23 = [v8 doesStatIdExistOnDeviceForArr:v15 startIdx:v20 endIdx:v21 timeAgo:v17];
LABEL_9:
        LOBYTE(v22) = v22 & v23;
      }
    }
    else
    {
      uint64_t v22 = [v8 doesStatIdExistOnDevice:v15 timeAgo:0];
      if (v17)
      {
        unsigned __int8 v23 = [v8 doesStatIdExistOnDevice:v15 timeAgo:v17];
        goto LABEL_9;
      }
    }
  }
  else
  {
    LOBYTE(v22) = 1;
  }

  return v22;
}

- (BOOL)allStatIdsExistInStatsProvider:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100013904;
  v6[3] = &unk_100090AD8;
  id v7 = &off_1000C16A8;
  id v8 = self;
  id v9 = a3;
  id v3 = v9;
  unsigned __int8 v4 = [(TaskingCriteriaRange *)v8 _checkForWholeCriteriaArray:v6];

  return v4;
}

- (BOOL)evaluateCriteriaUsingStatsProvider:(id)a3 doWhiteListCheck:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (![(TaskingCriteriaRange *)self validateCriteria])
  {
    id v9 = +[NSException exceptionWithName:@"CriteriaValidationFail" reason:@"Tasking criteria failed basic validation" userInfo:0];
    objc_exception_throw(v9);
  }
  if (v4 && ![(TaskingCriteriaRange *)self passWhiteListCheck])
  {
    id v11 = +[NSException exceptionWithName:@"NonWhitelistedStatsKey" reason:@"Non-whitelisted key exists in tasking information" userInfo:0];
    objc_exception_throw(v11);
  }
  if (![(TaskingCriteriaRange *)self allStatIdsExistInStatsProvider:v6])
  {
    id v10 = +[NSException exceptionWithName:@"StatsKeyNotOnDevice" reason:@"Stat key absent from device stats exists in tasking information" userInfo:0];
    objc_exception_throw(v10);
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100013D34;
  v12[3] = &unk_100090B00;
  v12[4] = self;
  id v13 = v6;
  BOOL v7 = [(TaskingCriteriaRange *)self _evaluateWholeCriteriaArray:v12];

  return v7;
}

- (NSArray)myTaskingCriteria
{
  return self->_myTaskingCriteria;
}

- (void)setMyTaskingCriteria:(id)a3
{
}

- (void).cxx_destruct
{
}

@end