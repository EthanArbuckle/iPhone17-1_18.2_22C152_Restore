@interface MOEventBundleLabelTemplate
+ (id)conditionsFromCapitalizations:(id)a3;
+ (id)conditionsFromConditionStrings:(id)a3;
+ (id)conditionsFromExtendStrings:(id)a3;
+ (id)conditionsFromLabels:(id)a3;
+ (id)formatsFromLabels:(id)a3;
+ (unint64_t)capitalizationTypeFromString:(id)a3;
- (BOOL)checkConditionForMetaData:(id)a3;
- (BOOL)needCapitalizationForKeyword:(id)a3;
- (BOOL)needExtensionForKeyword:(id)a3;
- (MOEventBundleLabelTemplate)initWithConditionStrings:(id)a3 labels:(id)a4 context:(id)a5;
- (MOEventBundleLabelTemplate)initWithConditions:(id)a3 formats:(id)a4 context:(id)a5;
- (MOEventBundleLabelTemplate)initWithConditions:(id)a3 labels:(id)a4 context:(id)a5;
- (NSArray)formats;
- (NSDictionary)context;
- (NSSet)conditions;
- (id)description;
- (id)formattedStringsForMetaData:(id)a3;
- (void)setConditions:(id)a3;
- (void)setContext:(id)a3;
- (void)setFormats:(id)a3;
@end

@implementation MOEventBundleLabelTemplate

- (MOEventBundleLabelTemplate)initWithConditionStrings:(id)a3 labels:(id)a4 context:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v10)
  {
    v12 = +[MOEventBundleLabelTemplate conditionsFromLabels:v10];
    v13 = +[MOEventBundleLabelTemplate conditionsFromConditionStrings:v9];
    v14 = [v13 setByAddingObjectsFromSet:v12];
    self = [(MOEventBundleLabelTemplate *)self initWithConditions:v14 labels:v10 context:v11];

    v15 = self;
  }
  else
  {
    v16 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[MOEventBundleLabelTemplate initWithConditionStrings:labels:context:](v16, v17, v18, v19, v20, v21, v22, v23);
    }

    v24 = +[NSAssertionHandler currentHandler];
    [v24 handleFailureInMethod:a2 object:self file:@"MOEventBundleLabelTemplate.m" lineNumber:46 description:@"Invalid parameter not satisfying: labels"];

    v15 = 0;
  }

  return v15;
}

- (MOEventBundleLabelTemplate)initWithConditions:(id)a3 labels:(id)a4 context:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v10)
  {
    id v29 = v9;
    v12 = objc_opt_new();
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v13 = v10;
    id v14 = [v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v31;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v31 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = [[MOEventBundleLabelFormat alloc] initWithFormat:*(void *)(*((void *)&v30 + 1) + 8 * (void)v17)];
          [v12 addObject:v18];

          uint64_t v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        id v15 = [v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v15);
    }

    id v9 = v29;
    self = [(MOEventBundleLabelTemplate *)self initWithConditions:v29 formats:v12 context:v11];
    uint64_t v19 = self;
  }
  else
  {
    uint64_t v20 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[MOEventBundleLabelTemplate initWithConditionStrings:labels:context:](v20, v21, v22, v23, v24, v25, v26, v27);
    }

    v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"MOEventBundleLabelTemplate.m" lineNumber:57 description:@"Invalid parameter not satisfying: labels"];
    uint64_t v19 = 0;
  }

  return v19;
}

- (MOEventBundleLabelTemplate)initWithConditions:(id)a3 formats:(id)a4 context:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v11)
  {
    v26.receiver = self;
    v26.super_class = (Class)MOEventBundleLabelTemplate;
    id v13 = [(MOEventBundleLabelTemplate *)&v26 init];
    p_isa = (id *)&v13->super.isa;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_conditions, a3);
      objc_storeStrong(p_isa + 2, a4);
      objc_storeStrong(p_isa + 3, a5);
    }
    self = p_isa;
    id v15 = self;
  }
  else
  {
    uint64_t v16 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[MOEventBundleLabelTemplate initWithConditions:formats:context:](v16, v17, v18, v19, v20, v21, v22, v23);
    }

    uint64_t v24 = +[NSAssertionHandler currentHandler];
    [v24 handleFailureInMethod:a2 object:self file:@"MOEventBundleLabelTemplate.m" lineNumber:68 description:@"Invalid parameter not satisfying: formats"];

    id v15 = 0;
  }

  return v15;
}

+ (id)conditionsFromLabels:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  id v31 = 0;
  uint64_t v21 = +[NSRegularExpression regularExpressionWithPattern:@"\\{([0-9a-zA-Z\\-\\_]+)\\}" options:1 error:&v31];
  id v18 = v31;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v3;
  id v22 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v22)
  {
    uint64_t v20 = *(void *)v28;
    do
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(obj);
        }
        v6 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v7 = [v21 matchesInString:v6 options:0 range:[v6 length]];
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v8 = [v7 countByEnumeratingWithState:&v23 objects:v32 count:16];
        if (v8)
        {
          id v9 = v8;
          uint64_t v10 = *(void *)v24;
          do
          {
            for (j = 0; j != v9; j = (char *)j + 1)
            {
              if (*(void *)v24 != v10) {
                objc_enumerationMutation(v7);
              }
              id v12 = *(void **)(*((void *)&v23 + 1) + 8 * (void)j);
              if ([v12 numberOfRanges])
              {
                id v13 = objc_opt_new();
                id v14 = [v12 rangeAtIndex:1];
                uint64_t v16 = [v6 substringWithRange:v14, v15];
                [v13 setKeyword:v16];

                [v4 addObject:v13];
              }
            }
            id v9 = [v7 countByEnumeratingWithState:&v23 objects:v32 count:16];
          }
          while (v9);
        }
      }
      id v22 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v22);
  }

  return v4;
}

+ (id)formatsFromLabels:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = [*(id *)(*((void *)&v15 + 1) + 8 * i) componentsSeparatedByString:@"|"];
        uint64_t v10 = [v9 objectAtIndex:0];
        id v11 = 0;
        if ((unint64_t)[v9 count] >= 2)
        {
          id v11 = [v9 objectAtIndex:1];
        }
        id v12 = [[MOEventBundleLabelFormat alloc] initWithFormat:v10 capitalizationType:+[MOEventBundleLabelTemplate capitalizationTypeFromString:v11]];
        [v4 addObject:v12];
      }
      id v6 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  return v4;
}

+ (id)conditionsFromConditionStrings:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  id v52 = 0;
  v38 = +[NSRegularExpression regularExpressionWithPattern:@"(!)?([0-9a-zA-Z\\-\\_]+)(\\s?(=|==|>|<|>=|<=|!=)\\s?([-+]?[0-9]*\\.?[0-9]+|[0-9a-zA-Z\\-\\_]+)(:(f|d|s))?)?" options:1 error:&v52];
  id v35 = v52;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = v3;
  id v39 = [obj countByEnumeratingWithState:&v48 objects:v54 count:16];
  if (v39)
  {
    uint64_t v37 = *(void *)v49;
    p_cache = MOGraph.cache;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v49 != v37) {
          objc_enumerationMutation(obj);
        }
        uint64_t v40 = v6;
        uint64_t v7 = *(void **)(*((void *)&v48 + 1) + 8 * v6);
        id v8 = [v38 matchesInString:v7 options:0 range:[v7 length]];
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        id v42 = [v8 countByEnumeratingWithState:&v44 objects:v53 count:16];
        if (v42)
        {
          uint64_t v9 = *(void *)v45;
          uint64_t v41 = *(void *)v45;
          do
          {
            for (i = 0; i != v42; i = (char *)i + 1)
            {
              if (*(void *)v45 != v9) {
                objc_enumerationMutation(v8);
              }
              id v11 = *(void **)(*((void *)&v44 + 1) + 8 * i);
              if ([v11 numberOfRanges])
              {
                id v12 = [v11 rangeAtIndex:2];
                v43 = [v7 substringWithRange:v12, v13];
                id v14 = [objc_alloc((Class)(p_cache + 498)) initWithKeyword:v43];
                id v15 = [v11 rangeAtIndex:1];
                if (v16)
                {
                  long long v17 = [v7 substringWithRange:v15, v16];
                  id v18 = [p_cache + 498 templateOperatorFromString:v17];

                  if (v18) {
                    [v14 setTemplateOperator:v18];
                  }
                }
                if ([v14 templateOperator] != (id)8)
                {
                  id v19 = [v11 rangeAtIndex:4];
                  if (v20)
                  {
                    uint64_t v21 = p_cache + 498;
                    [v7 substringWithRange:v19, v20];
                    id v22 = v7;
                    long long v23 = v8;
                    long long v24 = p_cache;
                    v26 = long long v25 = v4;
                    id v27 = [v21 templateOperatorFromString:v26];

                    v4 = v25;
                    p_cache = v24;
                    id v8 = v23;
                    uint64_t v7 = v22;
                    uint64_t v9 = v41;
                    if (v27)
                    {
                      [v14 setTemplateOperator:v27];
                      id v28 = [v11 rangeAtIndex:5];
                      if (v29)
                      {
                        long long v30 = [v7 substringWithRange:v28, v29];
                        [v14 setValue:v30];
                      }
                      else
                      {
                        [v14 setTemplateOperator:0];
                      }
                      id v31 = [v11 rangeAtIndex:7];
                      if (v32)
                      {
                        long long v33 = [v7 substringWithRange:v31, v32];
                        [v14 setValueType:[p_cache + 498 valueTypeFromString:v33]];
                      }
                    }
                  }
                  else
                  {
                    [v14 setTemplateOperator:7];
                  }
                }
                [v4 addObject:v14];
              }
            }
            id v42 = [v8 countByEnumeratingWithState:&v44 objects:v53 count:16];
          }
          while (v42);
        }

        uint64_t v6 = v40 + 1;
      }
      while ((id)(v40 + 1) != v39);
      id v39 = [obj countByEnumeratingWithState:&v48 objects:v54 count:16];
    }
    while (v39);
  }

  return v4;
}

+ (id)conditionsFromExtendStrings:(id)a3
{
  id v3 = a3;
  id v47 = (id)objc_opt_new();
  id v63 = 0;
  uint64_t v40 = +[NSRegularExpression regularExpressionWithPattern:@"([0-9a-zA-Z\\-\\_]+)\\s?(:)\\s?([0-9a-zA-Z\\-\\_\\,\\s]+)" options:1 error:&v63];
  id v37 = v63;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id obj = v3;
  id v41 = [obj countByEnumeratingWithState:&v59 objects:v66 count:16];
  if (v41)
  {
    uint64_t v39 = *(void *)v60;
    p_cache = MOGraph.cache;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v60 != v39) {
          objc_enumerationMutation(obj);
        }
        uint64_t v42 = v5;
        uint64_t v6 = *(void **)(*((void *)&v59 + 1) + 8 * v5);
        uint64_t v7 = [v40 matchesInString:v6 options:0 range:[v6 length]];
        long long v55 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        id v48 = v7;
        id v50 = [v7 countByEnumeratingWithState:&v55 objects:v65 count:16];
        if (v50)
        {
          uint64_t v49 = *(void *)v56;
          v43 = v6;
          do
          {
            for (i = 0; i != v50; i = (char *)i + 1)
            {
              if (*(void *)v56 != v49) {
                objc_enumerationMutation(v48);
              }
              uint64_t v9 = *(void **)(*((void *)&v55 + 1) + 8 * i);
              if ([v9 numberOfRanges])
              {
                id v10 = [v9 rangeAtIndex:1];
                id v12 = [v6 substringWithRange:v10, v11];
                id v13 = [objc_alloc((Class)(p_cache + 498)) initWithKeyword:v12];
                id v14 = [v9 rangeAtIndex:2];
                if (v15)
                {
                  [v6 substringWithRange:v14, v15];
                  long long v17 = v16 = v12;
                  id v18 = [p_cache + 498 templateOperatorFromString:v17];

                  id v12 = v16;
                  if (v18) {
                    [v13 setTemplateOperator:v18];
                  }
                }
                id v19 = [v9 rangeAtIndex:3];
                if (v20)
                {
                  uint64_t v21 = [v6 substringWithRange:v19, v20];
                  if ([v21 length])
                  {
                    id v22 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
                    long long v23 = [v21 stringByTrimmingCharactersInSet:v22];

                    if ([v23 isEqualToString:@"_ANY_"])
                    {
                      [v13 setValue:@"_ANY_"];
                    }
                    else
                    {
                      long long v44 = v23;
                      long long v46 = v12;
                      long long v24 = objc_opt_new();
                      long long v51 = 0u;
                      long long v52 = 0u;
                      long long v53 = 0u;
                      long long v54 = 0u;
                      long long v45 = v21;
                      long long v25 = [v21 componentsSeparatedByString:@","];
                      id v26 = [v25 countByEnumeratingWithState:&v51 objects:v64 count:16];
                      if (v26)
                      {
                        id v27 = v26;
                        uint64_t v28 = *(void *)v52;
                        do
                        {
                          for (j = 0; j != v27; j = (char *)j + 1)
                          {
                            if (*(void *)v52 != v28) {
                              objc_enumerationMutation(v25);
                            }
                            long long v30 = *(void **)(*((void *)&v51 + 1) + 8 * (void)j);
                            id v31 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
                            uint64_t v32 = [v30 stringByTrimmingCharactersInSet:v31];

                            [v24 addObject:v32];
                          }
                          id v27 = [v25 countByEnumeratingWithState:&v51 objects:v64 count:16];
                        }
                        while (v27);
                      }

                      if ([v24 count])
                      {
                        id v33 = [v24 copy];
                        [v13 setValues:v33];
                      }
                      p_cache = (void **)(MOGraph + 16);
                      uint64_t v6 = v43;
                      long long v23 = v44;
                      uint64_t v21 = v45;
                      id v12 = v46;
                    }
                  }
                }
                if ([v13 templateOperator])
                {
                  v34 = [v13 values];
                  if ([v34 count])
                  {

                    goto LABEL_35;
                  }
                  id v35 = [v13 value];

                  if (v35) {
LABEL_35:
                  }
                    [v47 addObject:v13];
                }

                continue;
              }
            }
            id v50 = [v48 countByEnumeratingWithState:&v55 objects:v65 count:16];
          }
          while (v50);
        }

        uint64_t v5 = v42 + 1;
      }
      while ((id)(v42 + 1) != v41);
      id v41 = [obj countByEnumeratingWithState:&v59 objects:v66 count:16];
    }
    while (v41);
  }

  return v47;
}

+ (id)conditionsFromCapitalizations:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = [MOEventBundleLabelCondition alloc];
        id v12 = -[MOEventBundleLabelCondition initWithKeyword:](v11, "initWithKeyword:", v10, (void)v14);
        [(MOEventBundleLabelCondition *)v12 setTemplateOperator:7];
        [(MOEventBundleLabelCondition *)v12 setCapitalized:1];
        [v4 addObject:v12];
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (unint64_t)capitalizationTypeFromString:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    id v5 = [v3 lowercaseString];
    unsigned __int8 v6 = [@"nop" isEqualToString:v5];

    if (v6)
    {
      unint64_t v7 = 0;
    }
    else
    {
      uint64_t v8 = [v4 lowercaseString];
      unsigned __int8 v9 = [@"titlecap" isEqualToString:v8];

      if (v9)
      {
        unint64_t v7 = 2;
      }
      else
      {
        uint64_t v10 = [v4 lowercaseString];
        unsigned __int8 v11 = [@"cap" isEqualToString:v10];

        if (v11)
        {
          unint64_t v7 = 3;
        }
        else
        {
          id v12 = [v4 lowercaseString];
          unsigned int v13 = [@"fpo" isEqualToString:v12];

          if (v13) {
            unint64_t v7 = 3;
          }
          else {
            unint64_t v7 = 1;
          }
        }
      }
    }
  }
  else
  {
    unint64_t v7 = 1;
  }

  return v7;
}

- (BOOL)checkConditionForMetaData:(id)a3
{
  id v4 = a3;
  id v5 = [(MOEventBundleLabelTemplate *)self conditions];
  id v6 = [v5 count];

  if (v6)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    unint64_t v7 = [(MOEventBundleLabelTemplate *)self conditions];
    id v8 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v8)
    {
      id v9 = v8;
      id v19 = self;
      uint64_t v10 = *(void *)v21;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          unsigned int v13 = [v12 yieldConditionForMetaData:v4];
          long long v14 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            long long v15 = [v12 keyword];
            *(_DWORD *)buf = 138412802;
            *(void *)long long v25 = v15;
            *(_WORD *)&v25[8] = 2112;
            *(void *)&v25[10] = v12;
            __int16 v26 = 1024;
            unsigned int v27 = v13;
            _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "template yieldConditionForMetaData, keyword, %@, condition, %@, output, %d", buf, 0x1Cu);
          }
          if (!v13)
          {
            BOOL v16 = 0;
            goto LABEL_14;
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v9) {
          continue;
        }
        break;
      }
      BOOL v16 = 1;
LABEL_14:
      self = v19;
    }
    else
    {
      BOOL v16 = 1;
    }

    long long v17 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)long long v25 = v16;
      *(_WORD *)&v25[4] = 2112;
      *(void *)&v25[6] = self;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "template checkConditionForMetaData, output, %d, template, %@", buf, 0x12u);
    }
  }
  else
  {
    LOBYTE(v16) = 1;
  }

  return v16;
}

- (BOOL)needExtensionForKeyword:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(MOEventBundleLabelTemplate *)self conditions];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v9 templateOperator] == (id)9)
        {
          uint64_t v10 = [v9 keyword];
          unsigned __int8 v11 = [v10 isEqualToString:v4];

          if (v11)
          {
            LOBYTE(v6) = 1;
            goto LABEL_12;
          }
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return (char)v6;
}

- (BOOL)needCapitalizationForKeyword:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 length])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = [(MOEventBundleLabelTemplate *)self conditions];
    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v15;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          unsigned __int8 v11 = [v10 keyword];
          if ([v11 isEqualToString:v5])
          {
            unsigned __int8 v12 = [v10 capitalized];

            if (v12)
            {
              LOBYTE(v7) = 1;
              goto LABEL_16;
            }
          }
          else
          {
          }
        }
        id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
LABEL_16:
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return (char)v7;
}

- (id)formattedStringsForMetaData:(id)a3
{
  id v4 = a3;
  id v101 = 0;
  v79 = +[NSRegularExpression regularExpressionWithPattern:@"\\{([0-9a-zA-Z\\-\\_]+)\\}" options:1 error:&v101];
  id v75 = v101;
  v76 = objc_opt_new();
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  v92 = self;
  id obj = [(MOEventBundleLabelTemplate *)self formats];
  id v80 = [obj countByEnumeratingWithState:&v97 objects:v115 count:16];
  if (v80)
  {
    uint64_t v78 = *(void *)v98;
    p_info = MOPersonRelationship.info;
    id v85 = v4;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v98 != v78) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v97 + 1) + 8 * (void)v6);
        uint64_t v8 = [v7 format];
        id v87 = [v8 copy];
        id v9 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v103 = (uint64_t)v8;
          _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "template, %@", buf, 0xCu);
        }

        v82 = objc_opt_new();
        v84 = v7;
        uint64_t v10 = [v7 format];
        unsigned __int8 v11 = [v79 matchesInString:v10 options:0 range:[v8 length]];

        long long v95 = 0u;
        long long v96 = 0u;
        long long v93 = 0u;
        long long v94 = 0u;
        id v12 = v11;
        id v90 = [v12 countByEnumeratingWithState:&v93 objects:v114 count:16];
        if (!v90)
        {

LABEL_76:
          long long v56 = [p_info + 256 _Moments_LocalizedStringWithFormat:v8, v82];
          long long v57 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
          {
            long long v62 = [v82 count];
            id v63 = [v87 mask];
            v64 = [v56 mask];
            *(_DWORD *)buf = 138413058;
            uint64_t v103 = (uint64_t)v8;
            __int16 v104 = 2048;
            v105 = v62;
            __int16 v106 = 2112;
            uint64_t v107 = (uint64_t)v63;
            __int16 v108 = 2112;
            v109 = v64;
            _os_log_debug_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEBUG, "template, %@, args, %lu, outputString, %@, localizedString, %@, formatting completed", buf, 0x2Au);
          }
          if (v56)
          {
            if ([v84 capitalizationType] == (id)1 || objc_msgSend(v84, "capitalizationType") == (id)2)
            {
              uint64_t v58 = [p_info + 256 _Moments_CapitalizedStringForKey:v56];
              goto LABEL_82;
            }
            if ([v84 capitalizationType] != (id)3) {
              goto LABEL_83;
            }
            uint64_t v58 = [p_info + 256 _Moments_AllCapitalizedStringForKey:v56];
LABEL_82:
            long long v59 = (void *)v58;

            long long v56 = v59;
            if (!v59)
            {
              long long v61 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
              if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
              {
                v68 = [v82 count];
                v69 = [v87 mask];
                v70 = [0 mask];
                id v71 = [v84 capitalizationType];
                *(_DWORD *)buf = 138413314;
                uint64_t v103 = (uint64_t)v8;
                __int16 v104 = 2048;
                v105 = v68;
                __int16 v106 = 2112;
                uint64_t v107 = (uint64_t)v69;
                __int16 v108 = 2112;
                v109 = v70;
                __int16 v110 = 2048;
                id v111 = v71;
                _os_log_error_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, "template, %@, args, %lu, outputString, %@, localizedString, %@, capitalization failure, %lu", buf, 0x34u);
              }
              long long v56 = 0;
LABEL_91:
            }
            else
            {
LABEL_83:
              long long v60 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
              if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
              {
                v65 = [v82 count];
                v66 = [v87 mask];
                v67 = [v56 mask];
                *(_DWORD *)buf = 138413058;
                uint64_t v103 = (uint64_t)v8;
                __int16 v104 = 2048;
                v105 = v65;
                __int16 v106 = 2112;
                uint64_t v107 = (uint64_t)v66;
                __int16 v108 = 2112;
                v109 = v67;
                _os_log_debug_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEBUG, "template, %@, args, %lu, outputString, %@, localizedString, %@, localization completed", buf, 0x2Au);
              }
              [v76 addObject:v56];
              if ([v56 containsString:@"{"])
              {
                long long v61 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
                if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v103 = (uint64_t)v56;
                  _os_log_error_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, "The string contains a symbol. %@", buf, 0xCu);
                }
                goto LABEL_91;
              }
            }
          }

          goto LABEL_93;
        }
        id v83 = v12;
        v81 = v6;
        uint64_t v89 = *(void *)v94;
        char v86 = 1;
        long long v13 = v84;
        do
        {
          long long v14 = 0;
          long long v15 = v8;
          do
          {
            if (*(void *)v94 != v89) {
              objc_enumerationMutation(v83);
            }
            id v16 = [*(id *)(*((void *)&v93 + 1) + 8 * (void)v14) rangeAtIndex:1];
            uint64_t v18 = v17;
            id v19 = [v13 format];
            long long v20 = [v19 substringWithRange:v16, v18];

            unsigned int v21 = [(MOEventBundleLabelTemplate *)v92 needCapitalizationForKeyword:v20];
            long long v22 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v103 = (uint64_t)v15;
              __int16 v104 = 2112;
              v105 = v20;
              _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "template, %@, keyword, %@", buf, 0x16u);
            }

            long long v23 = [v4 objectForKey:v20];
            long long v24 = +[MOEventBundleLabelLocalizer _Moments_CapitalizedStringForKey:v20];
            long long v25 = [v4 objectForKey:v24];

            if (v23)
            {
              unsigned int v88 = v21;
              if ([(MOEventBundleLabelTemplate *)v92 needExtensionForKeyword:v20])
              {
                __int16 v26 = v4;
                unsigned int v27 = +[NSString stringWithFormat:@"{%@}", v20, v75];
                uint64_t v28 = +[NSString stringWithFormat:@"{%@}", v23];
                uint64_t v29 = [v15 stringByReplacingOccurrencesOfString:v27 withString:v28];

                long long v30 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412802;
                  uint64_t v103 = v29;
                  __int16 v104 = 2112;
                  v105 = v20;
                  __int16 v106 = 2112;
                  uint64_t v107 = (uint64_t)v23;
                  _os_log_debug_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "extended template, %@, keyword, %@, extended keyword, %@", buf, 0x20u);
                }

                uint64_t v31 = [v26 objectForKey:v23];
                uint64_t v32 = +[MOEventBundleLabelLocalizer _Moments_CapitalizedStringForKey:v23];
                id v33 = [v26 objectForKey:v32];

                v34 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
                uint64_t v8 = (void *)v29;
                if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138413058;
                  uint64_t v103 = v29;
                  __int16 v104 = 2112;
                  v105 = v23;
                  __int16 v106 = 2112;
                  uint64_t v107 = v31;
                  __int16 v108 = 2112;
                  v109 = v33;
                  _os_log_debug_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "extended template, %@, extended keyword, %@, value, %@, value.cap, %@", buf, 0x2Au);
                }

                long long v13 = v84;
                if (!v31)
                {
                  id v48 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
                  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    uint64_t v103 = (uint64_t)v20;
                    _os_log_error_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "extended keyword is not found, %@", buf, 0xCu);
                  }

                  int v35 = 0;
                  char v86 = 0;
                  id v4 = v85;
                  goto LABEL_66;
                }

                long long v23 = v31;
                id v4 = v85;
              }
              else
              {
                id v33 = v25;
                uint64_t v8 = v15;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v36 = v23;
                v91 = v8;
                if (v33 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
                  id v37 = v33;
                }
                else {
                  id v37 = 0;
                }
                id v41 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
                if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
                {
                  long long v53 = [v36 mask];
                  long long v54 = [v37 mask];
                  *(_DWORD *)buf = 138412802;
                  uint64_t v103 = (uint64_t)v20;
                  __int16 v104 = 2112;
                  v105 = v53;
                  __int16 v106 = 2112;
                  uint64_t v107 = (uint64_t)v54;
                  _os_log_debug_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEBUG, "keyword, %@, value type, NSString, value, %@, value.cap, %@", buf, 0x20u);
                }
LABEL_44:
                uint64_t v42 = +[NSString stringWithFormat:@"{%@}", v20];
                v43 = +[NSString stringWithFormat:@"{%@}", v36];
                uint64_t v44 = [v91 stringByReplacingOccurrencesOfString:v42 withString:v43];

                if ([v13 capitalizationType] == (id)2
                  && +[MOEventBundleLabelLocalizer isPreferredLanguageTitlecaseCapable])
                {
                  if (v37)
                  {
                    id v45 = v37;
                  }
                  else
                  {
                    id v45 = +[MOEventBundleLabelLocalizer _Moments_TitleCapitalizedStringForKey:v36];
                  }
                  uint64_t v46 = (uint64_t)v45;
                  id v4 = v85;
LABEL_61:

                  v36 = v46;
                  goto LABEL_62;
                }
                if (v88)
                {
                  id v4 = v85;
                  if (+[MOEventBundleLabelLocalizer isPreferredLanguageMidSentenceCaseCapable])
                  {
                    uint64_t v46 = +[MOEventBundleLabelLocalizer _Moments_CapitalizedStringForKey:v36];
                    goto LABEL_61;
                  }
LABEL_62:
                  long long v13 = v84;
                }
                else
                {
                  id v4 = v85;
                }
                [v82 addObject:v36];

                id v87 = (id)v44;
                goto LABEL_64;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v38 = v23;
                v36 = [v38 stringValue];
                if (!v36)
                {
                  uint64_t v39 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
                  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
                    [(MOEventBundleLabelTemplate *)v112 formattedStringsForMetaData:v39];
                  }

                  v36 = +[NSString stringWithFormat:@"%d", [v38 intValue]];
                }
                v91 = v8;
                uint64_t v40 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
                if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412546;
                  uint64_t v103 = (uint64_t)v20;
                  __int16 v104 = 2112;
                  v105 = v36;
                  _os_log_debug_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEBUG, "keyword, %@, value type, NSNumber, value, %@", buf, 0x16u);
                }

                if (v36)
                {
                  id v37 = 0;
                  goto LABEL_44;
                }
                char v86 = 0;
LABEL_64:
                uint64_t v49 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
                uint64_t v8 = v91;
                if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
                {
                  uint64_t v50 = [v87 mask];
                  long long v51 = (void *)v50;
                  *(_DWORD *)buf = 138412546;
                  CFStringRef v52 = @"NO";
                  if (v86) {
                    CFStringRef v52 = @"YES";
                  }
                  uint64_t v103 = v50;
                  __int16 v104 = 2112;
                  v105 = v52;
                  _os_log_debug_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEBUG, "outputString, %@, formattingCompleted, %@", buf, 0x16u);
                }
                int v35 = 1;
                goto LABEL_66;
              }
              id v47 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
              if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v103 = (uint64_t)v20;
                __int16 v104 = 2112;
                v105 = v23;
                _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "keyword, %@, value type is not supported, %@", buf, 0x16u);
              }

              int v35 = 0;
              char v86 = 0;
            }
            else
            {
              long long v23 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v103 = (uint64_t)v20;
                _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "keyword is not found, %@", buf, 0xCu);
              }
              int v35 = 0;
              char v86 = 0;
              id v33 = v25;
              uint64_t v8 = v15;
            }
LABEL_66:

            if (!v35) {
              goto LABEL_73;
            }
            long long v14 = (char *)v14 + 1;
            long long v15 = v8;
          }
          while (v90 != v14);
          id v55 = [v83 countByEnumeratingWithState:&v93 objects:v114 count:16];
          id v90 = v55;
        }
        while (v55);
LABEL_73:
        id v12 = v83;

        p_info = (__objc2_class_ro **)(MOPersonRelationship + 32);
        id v6 = v81;
        if (v86) {
          goto LABEL_76;
        }
LABEL_93:

        id v6 = (char *)v6 + 1;
      }
      while (v6 != v80);
      id v72 = [obj countByEnumeratingWithState:&v97 objects:v115 count:16];
      id v80 = v72;
    }
    while (v72);
  }

  id v73 = [v76 copy];

  return v73;
}

- (id)description
{
  id v3 = [(MOEventBundleLabelTemplate *)self conditions];
  id v4 = [(MOEventBundleLabelTemplate *)self formats];
  id v5 = +[NSString stringWithFormat:@"condidionts, %@, labels, %@", v3, v4];

  return v5;
}

- (NSSet)conditions
{
  return self->_conditions;
}

- (void)setConditions:(id)a3
{
}

- (NSArray)formats
{
  return self->_formats;
}

- (void)setFormats:(id)a3
{
}

- (NSDictionary)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_formats, 0);

  objc_storeStrong((id *)&self->_conditions, 0);
}

- (void)initWithConditionStrings:(uint64_t)a3 labels:(uint64_t)a4 context:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithConditions:(uint64_t)a3 formats:(uint64_t)a4 context:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)formattedStringsForMetaData:(os_log_t)log .cold.1(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "stringValue %@", buf, 0xCu);
}

@end