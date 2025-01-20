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
    v16 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[MOEventBundleLabelTemplate initWithConditionStrings:labels:context:](v16, v17, v18, v19, v20, v21, v22, v23);
    }

    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2 object:self file:@"MOEventBundleLabelTemplate.m" lineNumber:46 description:@"Invalid parameter not satisfying: labels"];

    v15 = 0;
  }

  return v15;
}

- (MOEventBundleLabelTemplate)initWithConditions:(id)a3 labels:(id)a4 context:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
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
    uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v31;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v31 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = [[MOEventBundleLabelFormat alloc] initWithFormat:*(void *)(*((void *)&v30 + 1) + 8 * v17)];
          [v12 addObject:v18];

          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v15);
    }

    id v9 = v29;
    self = [(MOEventBundleLabelTemplate *)self initWithConditions:v29 formats:v12 context:v11];
    uint64_t v19 = self;
  }
  else
  {
    uint64_t v20 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[MOEventBundleLabelTemplate initWithConditionStrings:labels:context:](v20, v21, v22, v23, v24, v25, v26, v27);
    }

    v12 = [MEMORY[0x1E4F28B00] currentHandler];
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
    uint64_t v15 = self;
  }
  else
  {
    uint64_t v16 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[MOEventBundleLabelTemplate initWithConditions:formats:context:](v16, v17, v18, v19, v20, v21, v22, v23);
    }

    uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2 object:self file:@"MOEventBundleLabelTemplate.m" lineNumber:68 description:@"Invalid parameter not satisfying: formats"];

    uint64_t v15 = 0;
  }

  return v15;
}

+ (id)conditionsFromLabels:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_opt_new();
  id v31 = 0;
  uint64_t v21 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"\\{([0-9a-zA-Z\\-\\_]+)\\}" options:1 error:&v31];
  id v18 = v31;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obuint64_t j = v3;
  uint64_t v22 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v22)
  {
    uint64_t v20 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(obj);
        }
        v6 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v7 = objc_msgSend(v21, "matchesInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length"));
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v32 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v24;
          do
          {
            for (uint64_t j = 0; j != v9; ++j)
            {
              if (*(void *)v24 != v10) {
                objc_enumerationMutation(v7);
              }
              id v12 = *(void **)(*((void *)&v23 + 1) + 8 * j);
              if ([v12 numberOfRanges])
              {
                id v13 = objc_opt_new();
                uint64_t v14 = [v12 rangeAtIndex:1];
                uint64_t v16 = objc_msgSend(v6, "substringWithRange:", v14, v15);
                [v13 setKeyword:v16];

                [v4 addObject:v13];
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v32 count:16];
          }
          while (v9);
        }
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v22);
  }

  return v4;
}

+ (id)formatsFromLabels:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = [*(id *)(*((void *)&v15 + 1) + 8 * i) componentsSeparatedByString:@"|"];
        uint64_t v10 = [v9 objectAtIndex:0];
        id v11 = 0;
        if ((unint64_t)[v9 count] >= 2)
        {
          id v11 = [v9 objectAtIndex:1];
        }
        id v12 = [[MOEventBundleLabelFormat alloc] initWithFormat:v10 capitalizationType:+[MOEventBundleLabelTemplate capitalizationTypeFromString:v11]];
        [v4 addObject:v12];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  return v4;
}

+ (id)conditionsFromConditionStrings:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_opt_new();
  id v54 = 0;
  v40 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"(!)?([0-9a-zA-Z\\-\\_]+)(\\s?(=|==|>|<|>=|<=|!=)\\s?([-+]?[0-9]*\\.?[0-9]+|[0-9a-zA-Z\\-\\_]+)(:(f|d|s))?)?" options:1 error:&v54];
  id v37 = v54;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  obuint64_t j = v3;
  uint64_t v41 = [obj countByEnumeratingWithState:&v50 objects:v56 count:16];
  if (v41)
  {
    uint64_t v39 = *(void *)v51;
    unint64_t v5 = 0x1E691E000uLL;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v51 != v39) {
          objc_enumerationMutation(obj);
        }
        uint64_t v42 = v6;
        uint64_t v7 = *(void **)(*((void *)&v50 + 1) + 8 * v6);
        uint64_t v8 = objc_msgSend(v40, "matchesInString:options:range:", v7, 0, 0, objc_msgSend(v7, "length"));
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        uint64_t v44 = [v8 countByEnumeratingWithState:&v46 objects:v55 count:16];
        if (v44)
        {
          uint64_t v9 = *(void *)v47;
          uint64_t v43 = *(void *)v47;
          do
          {
            for (uint64_t i = 0; i != v44; ++i)
            {
              if (*(void *)v47 != v9) {
                objc_enumerationMutation(v8);
              }
              id v11 = *(void **)(*((void *)&v46 + 1) + 8 * i);
              if ([v11 numberOfRanges])
              {
                uint64_t v12 = [v11 rangeAtIndex:2];
                v45 = objc_msgSend(v7, "substringWithRange:", v12, v13);
                uint64_t v14 = (void *)[objc_alloc(*(Class *)(v5 + 1560)) initWithKeyword:v45];
                uint64_t v15 = [v11 rangeAtIndex:1];
                if (v16)
                {
                  long long v17 = *(void **)(v5 + 1560);
                  long long v18 = objc_msgSend(v7, "substringWithRange:", v15, v16);
                  uint64_t v19 = [v17 templateOperatorFromString:v18];

                  if (v19) {
                    [v14 setTemplateOperator:v19];
                  }
                }
                if ([v14 templateOperator] != 8)
                {
                  uint64_t v20 = [v11 rangeAtIndex:4];
                  if (v21)
                  {
                    uint64_t v22 = *(void **)(v5 + 1560);
                    objc_msgSend(v7, "substringWithRange:", v20, v21);
                    long long v23 = v7;
                    long long v24 = v8;
                    unint64_t v25 = v5;
                    v27 = long long v26 = v4;
                    uint64_t v28 = [v22 templateOperatorFromString:v27];

                    v4 = v26;
                    unint64_t v5 = v25;
                    uint64_t v8 = v24;
                    uint64_t v7 = v23;
                    uint64_t v9 = v43;
                    if (v28)
                    {
                      [v14 setTemplateOperator:v28];
                      uint64_t v29 = [v11 rangeAtIndex:5];
                      if (v30)
                      {
                        id v31 = objc_msgSend(v7, "substringWithRange:", v29, v30);
                        [v14 setValue:v31];
                      }
                      else
                      {
                        [v14 setTemplateOperator:0];
                      }
                      uint64_t v32 = [v11 rangeAtIndex:7];
                      if (v33)
                      {
                        uint64_t v34 = *(void **)(v5 + 1560);
                        uint64_t v35 = objc_msgSend(v7, "substringWithRange:", v32, v33);
                        objc_msgSend(v14, "setValueType:", objc_msgSend(v34, "valueTypeFromString:", v35));
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
            uint64_t v44 = [v8 countByEnumeratingWithState:&v46 objects:v55 count:16];
          }
          while (v44);
        }

        uint64_t v6 = v42 + 1;
      }
      while (v42 + 1 != v41);
      uint64_t v41 = [obj countByEnumeratingWithState:&v50 objects:v56 count:16];
    }
    while (v41);
  }

  return v4;
}

+ (id)conditionsFromExtendStrings:(id)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v48 = (id)objc_opt_new();
  id v64 = 0;
  uint64_t v41 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"([0-9a-zA-Z\\-\\_]+)\\s?(:)\\s?([0-9a-zA-Z\\-\\_\\,\\s]+)" options:1 error:&v64];
  id v38 = v64;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  obuint64_t j = v3;
  uint64_t v42 = [obj countByEnumeratingWithState:&v60 objects:v67 count:16];
  if (v42)
  {
    uint64_t v40 = *(void *)v61;
    unint64_t v4 = 0x1E691E000uLL;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v61 != v40) {
          objc_enumerationMutation(obj);
        }
        uint64_t v43 = v5;
        uint64_t v6 = *(void **)(*((void *)&v60 + 1) + 8 * v5);
        uint64_t v7 = objc_msgSend(v41, "matchesInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length", v38));
        long long v56 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        id v49 = v7;
        uint64_t v51 = [v7 countByEnumeratingWithState:&v56 objects:v66 count:16];
        if (v51)
        {
          uint64_t v50 = *(void *)v57;
          uint64_t v44 = v6;
          do
          {
            for (uint64_t i = 0; i != v51; ++i)
            {
              if (*(void *)v57 != v50) {
                objc_enumerationMutation(v49);
              }
              uint64_t v9 = *(void **)(*((void *)&v56 + 1) + 8 * i);
              if ([v9 numberOfRanges])
              {
                uint64_t v10 = [v9 rangeAtIndex:1];
                uint64_t v12 = objc_msgSend(v6, "substringWithRange:", v10, v11);
                uint64_t v13 = (void *)[objc_alloc(*(Class *)(v4 + 1560)) initWithKeyword:v12];
                uint64_t v14 = [v9 rangeAtIndex:2];
                if (v15)
                {
                  uint64_t v16 = *(void **)(v4 + 1560);
                  objc_msgSend(v6, "substringWithRange:", v14, v15);
                  v18 = long long v17 = v12;
                  uint64_t v19 = [v16 templateOperatorFromString:v18];

                  uint64_t v12 = v17;
                  if (v19) {
                    [v13 setTemplateOperator:v19];
                  }
                }
                uint64_t v20 = [v9 rangeAtIndex:3];
                if (v21)
                {
                  uint64_t v22 = objc_msgSend(v6, "substringWithRange:", v20, v21);
                  if ([v22 length])
                  {
                    long long v23 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
                    long long v24 = [v22 stringByTrimmingCharactersInSet:v23];

                    if ([v24 isEqualToString:@"_ANY_"])
                    {
                      [v13 setValue:@"_ANY_"];
                    }
                    else
                    {
                      v45 = v24;
                      long long v47 = v12;
                      unint64_t v25 = objc_opt_new();
                      long long v52 = 0u;
                      long long v53 = 0u;
                      long long v54 = 0u;
                      long long v55 = 0u;
                      long long v46 = v22;
                      long long v26 = [v22 componentsSeparatedByString:@","];
                      uint64_t v27 = [v26 countByEnumeratingWithState:&v52 objects:v65 count:16];
                      if (v27)
                      {
                        uint64_t v28 = v27;
                        uint64_t v29 = *(void *)v53;
                        do
                        {
                          for (uint64_t j = 0; j != v28; ++j)
                          {
                            if (*(void *)v53 != v29) {
                              objc_enumerationMutation(v26);
                            }
                            id v31 = *(void **)(*((void *)&v52 + 1) + 8 * j);
                            uint64_t v32 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
                            uint64_t v33 = [v31 stringByTrimmingCharactersInSet:v32];

                            [v25 addObject:v33];
                          }
                          uint64_t v28 = [v26 countByEnumeratingWithState:&v52 objects:v65 count:16];
                        }
                        while (v28);
                      }

                      if ([v25 count])
                      {
                        uint64_t v34 = (void *)[v25 copy];
                        [v13 setValues:v34];
                      }
                      unint64_t v4 = 0x1E691E000;
                      uint64_t v6 = v44;
                      long long v24 = v45;
                      uint64_t v22 = v46;
                      uint64_t v12 = v47;
                    }
                  }
                }
                if ([v13 templateOperator])
                {
                  uint64_t v35 = [v13 values];
                  if ([v35 count])
                  {

                    goto LABEL_35;
                  }
                  v36 = [v13 value];

                  if (v36) {
LABEL_35:
                  }
                    [v48 addObject:v13];
                }

                continue;
              }
            }
            uint64_t v51 = [v49 countByEnumeratingWithState:&v56 objects:v66 count:16];
          }
          while (v51);
        }

        uint64_t v5 = v43 + 1;
      }
      while (v43 + 1 != v42);
      uint64_t v42 = [obj countByEnumeratingWithState:&v60 objects:v67 count:16];
    }
    while (v42);
  }

  return v48;
}

+ (id)conditionsFromCapitalizations:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  unint64_t v4 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = [MOEventBundleLabelCondition alloc];
        uint64_t v12 = -[MOEventBundleLabelCondition initWithKeyword:](v11, "initWithKeyword:", v10, (void)v14);
        [(MOEventBundleLabelCondition *)v12 setTemplateOperator:7];
        [(MOEventBundleLabelCondition *)v12 setCapitalized:1];
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (unint64_t)capitalizationTypeFromString:(id)a3
{
  id v3 = a3;
  unint64_t v4 = v3;
  if (v3)
  {
    id v5 = [v3 lowercaseString];
    char v6 = [@"nop" isEqualToString:v5];

    if (v6)
    {
      unint64_t v7 = 0;
    }
    else
    {
      uint64_t v8 = [v4 lowercaseString];
      char v9 = [@"titlecap" isEqualToString:v8];

      if (v9)
      {
        unint64_t v7 = 2;
      }
      else
      {
        uint64_t v10 = [v4 lowercaseString];
        char v11 = [@"cap" isEqualToString:v10];

        if (v11)
        {
          unint64_t v7 = 3;
        }
        else
        {
          uint64_t v12 = [v4 lowercaseString];
          int v13 = [@"fpo" isEqualToString:v12];

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
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(MOEventBundleLabelTemplate *)self conditions];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    unint64_t v7 = [(MOEventBundleLabelTemplate *)self conditions];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v19 = self;
      uint64_t v10 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          int v13 = [v12 yieldConditionForMetaData:v4];
          long long v14 = _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            long long v15 = [v12 keyword];
            *(_DWORD *)buf = 138412802;
            *(void *)unint64_t v25 = v15;
            *(_WORD *)&v25[8] = 2112;
            *(void *)&v25[10] = v12;
            __int16 v26 = 1024;
            int v27 = v13;
            _os_log_debug_impl(&dword_1D24AE000, v14, OS_LOG_TYPE_DEBUG, "template yieldConditionForMetaData, keyword, %@, condition, %@, output, %d", buf, 0x1Cu);
          }
          if (!v13)
          {
            BOOL v16 = 0;
            goto LABEL_14;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v28 count:16];
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

    long long v17 = _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)unint64_t v25 = v16;
      *(_WORD *)&v25[4] = 2112;
      *(void *)&v25[6] = self;
      _os_log_impl(&dword_1D24AE000, v17, OS_LOG_TYPE_INFO, "template checkConditionForMetaData, output, %d, template, %@", buf, 0x12u);
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
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(MOEventBundleLabelTemplate *)self conditions];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v9 templateOperator] == 9)
        {
          uint64_t v10 = [v9 keyword];
          char v11 = [v10 isEqualToString:v4];

          if (v11)
          {
            LOBYTE(v6) = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v6;
}

- (BOOL)needCapitalizationForKeyword:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 length])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v6 = [(MOEventBundleLabelTemplate *)self conditions];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          char v11 = [v10 keyword];
          if ([v11 isEqualToString:v5])
          {
            char v12 = [v10 capitalized];

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
        uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
LABEL_16:
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (id)formattedStringsForMetaData:(id)a3
{
  uint64_t v116 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v101 = 0;
  v79 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"\\{([0-9a-zA-Z\\-\\_]+)\\}" options:1 error:&v101];
  id v75 = v101;
  v76 = objc_opt_new();
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  v92 = self;
  obuint64_t j = [(MOEventBundleLabelTemplate *)self formats];
  uint64_t v80 = [obj countByEnumeratingWithState:&v97 objects:v115 count:16];
  if (v80)
  {
    uint64_t v78 = *(void *)v98;
    unint64_t v5 = 0x1E691E000uLL;
    id v85 = v4;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v98 != v78) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v97 + 1) + 8 * v6);
        uint64_t v8 = [v7 format];
        v87 = (void *)[v8 copy];
        uint64_t v9 = _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v103 = (uint64_t)v8;
          _os_log_debug_impl(&dword_1D24AE000, v9, OS_LOG_TYPE_DEBUG, "template, %@", buf, 0xCu);
        }

        v82 = objc_opt_new();
        v84 = v7;
        uint64_t v10 = [v7 format];
        char v11 = objc_msgSend(v79, "matchesInString:options:range:", v10, 0, 0, objc_msgSend(v8, "length"));

        long long v95 = 0u;
        long long v96 = 0u;
        long long v93 = 0u;
        long long v94 = 0u;
        id v12 = v11;
        uint64_t v90 = [v12 countByEnumeratingWithState:&v93 objects:v114 count:16];
        if (!v90)
        {

LABEL_76:
          long long v56 = objc_msgSend(*(id *)(v5 + 1584), "_Moments_LocalizedStringWithFormat:arguments:", v8, v82);
          long long v57 = _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v62 = [v82 count];
            long long v63 = [v87 mask];
            id v64 = [v56 mask];
            *(_DWORD *)buf = 138413058;
            uint64_t v103 = (uint64_t)v8;
            __int16 v104 = 2048;
            v105 = v62;
            __int16 v106 = 2112;
            uint64_t v107 = (uint64_t)v63;
            __int16 v108 = 2112;
            v109 = v64;
            _os_log_debug_impl(&dword_1D24AE000, v57, OS_LOG_TYPE_DEBUG, "template, %@, args, %lu, outputString, %@, localizedString, %@, formatting completed", buf, 0x2Au);
          }
          if (v56)
          {
            if ([v84 capitalizationType] == 1 || objc_msgSend(v84, "capitalizationType") == 2)
            {
              uint64_t v58 = objc_msgSend(*(id *)(v5 + 1584), "_Moments_CapitalizedStringForKey:", v56);
              goto LABEL_82;
            }
            if ([v84 capitalizationType] != 3) {
              goto LABEL_83;
            }
            uint64_t v58 = objc_msgSend(*(id *)(v5 + 1584), "_Moments_AllCapitalizedStringForKey:", v56);
LABEL_82:
            long long v59 = (void *)v58;

            long long v56 = v59;
            if (!v59)
            {
              long long v61 = _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
              if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
              {
                uint64_t v68 = [v82 count];
                v69 = [v87 mask];
                v70 = [0 mask];
                uint64_t v71 = [v84 capitalizationType];
                *(_DWORD *)buf = 138413314;
                uint64_t v103 = (uint64_t)v8;
                __int16 v104 = 2048;
                v105 = v68;
                __int16 v106 = 2112;
                uint64_t v107 = (uint64_t)v69;
                __int16 v108 = 2112;
                v109 = v70;
                __int16 v110 = 2048;
                uint64_t v111 = v71;
                _os_log_error_impl(&dword_1D24AE000, v61, OS_LOG_TYPE_ERROR, "template, %@, args, %lu, outputString, %@, localizedString, %@, capitalization failure, %lu", buf, 0x34u);
              }
              long long v56 = 0;
LABEL_91:
            }
            else
            {
LABEL_83:
              long long v60 = _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
              if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v65 = [v82 count];
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
                _os_log_debug_impl(&dword_1D24AE000, v60, OS_LOG_TYPE_DEBUG, "template, %@, args, %lu, outputString, %@, localizedString, %@, localization completed", buf, 0x2Au);
              }
              [v76 addObject:v56];
              if ([v56 containsString:@"{"])
              {
                long long v61 = _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
                if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v103 = (uint64_t)v56;
                  _os_log_error_impl(&dword_1D24AE000, v61, OS_LOG_TYPE_ERROR, "The string contains a symbol. %@", buf, 0xCu);
                }
                goto LABEL_91;
              }
            }
          }

          goto LABEL_93;
        }
        id v83 = v12;
        uint64_t v81 = v6;
        uint64_t v89 = *(void *)v94;
        char v86 = 1;
        long long v13 = v84;
        do
        {
          uint64_t v14 = 0;
          long long v15 = v8;
          do
          {
            if (*(void *)v94 != v89) {
              objc_enumerationMutation(v83);
            }
            uint64_t v16 = [*(id *)(*((void *)&v93 + 1) + 8 * v14) rangeAtIndex:1];
            uint64_t v18 = v17;
            uint64_t v19 = [v13 format];
            long long v20 = objc_msgSend(v19, "substringWithRange:", v16, v18);

            BOOL v21 = [(MOEventBundleLabelTemplate *)v92 needCapitalizationForKeyword:v20];
            long long v22 = _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v103 = (uint64_t)v15;
              __int16 v104 = 2112;
              v105 = v20;
              _os_log_debug_impl(&dword_1D24AE000, v22, OS_LOG_TYPE_DEBUG, "template, %@, keyword, %@", buf, 0x16u);
            }

            long long v23 = [v4 objectForKey:v20];
            long long v24 = +[MOEventBundleLabelLocalizer _Moments_CapitalizedStringForKey:v20];
            unint64_t v25 = [v4 objectForKey:v24];

            if (v23)
            {
              BOOL v88 = v21;
              if ([(MOEventBundleLabelTemplate *)v92 needExtensionForKeyword:v20])
              {
                __int16 v26 = v4;
                int v27 = [NSString stringWithFormat:@"{%@}", v20, v75];
                uint64_t v28 = [NSString stringWithFormat:@"{%@}", v23];
                uint64_t v29 = [v15 stringByReplacingOccurrencesOfString:v27 withString:v28];

                uint64_t v30 = _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412802;
                  uint64_t v103 = v29;
                  __int16 v104 = 2112;
                  v105 = v20;
                  __int16 v106 = 2112;
                  uint64_t v107 = (uint64_t)v23;
                  _os_log_debug_impl(&dword_1D24AE000, v30, OS_LOG_TYPE_DEBUG, "extended template, %@, keyword, %@, extended keyword, %@", buf, 0x20u);
                }

                uint64_t v31 = [v26 objectForKey:v23];
                uint64_t v32 = +[MOEventBundleLabelLocalizer _Moments_CapitalizedStringForKey:v23];
                uint64_t v33 = [v26 objectForKey:v32];

                uint64_t v34 = _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
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
                  _os_log_debug_impl(&dword_1D24AE000, v34, OS_LOG_TYPE_DEBUG, "extended template, %@, extended keyword, %@, value, %@, value.cap, %@", buf, 0x2Au);
                }

                long long v13 = v84;
                if (!v31)
                {
                  id v48 = _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
                  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    uint64_t v103 = (uint64_t)v20;
                    _os_log_error_impl(&dword_1D24AE000, v48, OS_LOG_TYPE_ERROR, "extended keyword is not found, %@", buf, 0xCu);
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
                uint64_t v33 = v25;
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
                uint64_t v41 = _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
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
                  _os_log_debug_impl(&dword_1D24AE000, v41, OS_LOG_TYPE_DEBUG, "keyword, %@, value type, NSString, value, %@, value.cap, %@", buf, 0x20u);
                }
LABEL_44:
                uint64_t v42 = [NSString stringWithFormat:@"{%@}", v20];
                uint64_t v43 = [NSString stringWithFormat:@"{%@}", v36];
                uint64_t v44 = [v91 stringByReplacingOccurrencesOfString:v42 withString:v43];

                if ([v13 capitalizationType] == 2
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

                v87 = (void *)v44;
                goto LABEL_64;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v38 = v23;
                v36 = [v38 stringValue];
                if (!v36)
                {
                  uint64_t v39 = _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
                  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
                    [(MOEventBundleLabelTemplate *)v112 formattedStringsForMetaData:v39];
                  }

                  v36 = objc_msgSend(NSString, "stringWithFormat:", @"%d", -[NSObject intValue](v38, "intValue"));
                }
                v91 = v8;
                uint64_t v40 = _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
                if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412546;
                  uint64_t v103 = (uint64_t)v20;
                  __int16 v104 = 2112;
                  v105 = v36;
                  _os_log_debug_impl(&dword_1D24AE000, v40, OS_LOG_TYPE_DEBUG, "keyword, %@, value type, NSNumber, value, %@", buf, 0x16u);
                }

                if (v36)
                {
                  id v37 = 0;
                  goto LABEL_44;
                }
                char v86 = 0;
LABEL_64:
                id v49 = _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
                uint64_t v8 = v91;
                if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
                {
                  uint64_t v50 = [v87 mask];
                  uint64_t v51 = (void *)v50;
                  *(_DWORD *)buf = 138412546;
                  long long v52 = @"NO";
                  if (v86) {
                    long long v52 = @"YES";
                  }
                  uint64_t v103 = v50;
                  __int16 v104 = 2112;
                  v105 = v52;
                  _os_log_debug_impl(&dword_1D24AE000, v49, OS_LOG_TYPE_DEBUG, "outputString, %@, formattingCompleted, %@", buf, 0x16u);
                }
                int v35 = 1;
                goto LABEL_66;
              }
              long long v47 = _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
              if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v103 = (uint64_t)v20;
                __int16 v104 = 2112;
                v105 = v23;
                _os_log_error_impl(&dword_1D24AE000, v47, OS_LOG_TYPE_ERROR, "keyword, %@, value type is not supported, %@", buf, 0x16u);
              }

              int v35 = 0;
              char v86 = 0;
            }
            else
            {
              long long v23 = _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v103 = (uint64_t)v20;
                _os_log_error_impl(&dword_1D24AE000, v23, OS_LOG_TYPE_ERROR, "keyword is not found, %@", buf, 0xCu);
              }
              int v35 = 0;
              char v86 = 0;
              uint64_t v33 = v25;
              uint64_t v8 = v15;
            }
LABEL_66:

            if (!v35) {
              goto LABEL_73;
            }
            ++v14;
            long long v15 = v8;
          }
          while (v90 != v14);
          uint64_t v55 = [v83 countByEnumeratingWithState:&v93 objects:v114 count:16];
          uint64_t v90 = v55;
        }
        while (v55);
LABEL_73:
        id v12 = v83;

        unint64_t v5 = 0x1E691E000;
        uint64_t v6 = v81;
        if (v86) {
          goto LABEL_76;
        }
LABEL_93:

        ++v6;
      }
      while (v6 != v80);
      uint64_t v72 = [obj countByEnumeratingWithState:&v97 objects:v115 count:16];
      uint64_t v80 = v72;
    }
    while (v72);
  }

  v73 = (void *)[v76 copy];
  return v73;
}

- (id)description
{
  id v3 = NSString;
  id v4 = [(MOEventBundleLabelTemplate *)self conditions];
  unint64_t v5 = [(MOEventBundleLabelTemplate *)self formats];
  uint64_t v6 = [v3 stringWithFormat:@"condidionts, %@, labels, %@", v4, v5];

  return v6;
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
  _os_log_error_impl(&dword_1D24AE000, log, OS_LOG_TYPE_ERROR, "stringValue %@", buf, 0xCu);
}

@end