@interface _PSFamilyUtilities
+ (BOOL)contactMarkedAsFamilyInFeatureDict:(id)a3;
+ (BOOL)featureDictionaryPassesHeuristic:(id)a3;
+ (id)featureSet;
@end

@implementation _PSFamilyUtilities

+ (id)featureSet
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:&unk_1EF6762D8];

  return v2;
}

+ (BOOL)contactMarkedAsFamilyInFeatureDict:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [&unk_1EF6762F0 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(&unk_1EF6762F0);
        }
        v8 = [v3 objectForKeyedSubscript:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        char v9 = [v8 BOOLValue];

        if (v9)
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [&unk_1EF6762F0 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

+ (BOOL)featureDictionaryPassesHeuristic:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v29;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v29 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          BOOL v10 = objc_msgSend(v4, "objectForKeyedSubscript:", v9, (void)v28);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            uint64_t v17 = +[_PSLogging familyRecommenderChannel];
            if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
              +[_PSFamilyUtilities featureDictionaryPassesHeuristic:v17];
            }
            BOOL v16 = 0;
            goto LABEL_17;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    v11 = [v4 allValues];
    long long v12 = [v11 valueForKeyPath:@"@sum.self"];
    [v12 doubleValue];
    double v14 = v13;

    if (v14 > 0.0)
    {
      long long v15 = [v4 objectForKeyedSubscript:@"contactParent"];
      if ([v15 integerValue] == 1)
      {
        BOOL v16 = 1;
      }
      else
      {
        BOOL v10 = [v4 objectForKeyedSubscript:@"contactFamilyRelation"];
        if ([v10 integerValue] == 1)
        {
          BOOL v16 = 1;
        }
        else
        {
          uint64_t v17 = [v4 objectForKeyedSubscript:@"contactEmergencyFamily"];
          if ([v17 integerValue] == 1)
          {
            BOOL v16 = 1;
            id v4 = v15;
LABEL_17:

            long long v15 = v4;
          }
          else
          {
            v19 = [v4 objectForKeyedSubscript:@"contactInHome"];
            uint64_t v20 = [v19 integerValue];

            if (v20 == 1)
            {
              BOOL v16 = 1;
              goto LABEL_20;
            }
            long long v15 = [v4 objectForKeyedSubscript:@"callOutgoingRatio"];
            [v15 doubleValue];
            double v22 = v21;
            if (v21 <= 0.0
              && ([v4 objectForKeyedSubscript:@"firstPartyMsgOutgoingRatio"],
                  BOOL v10 = objc_claimAutoreleasedReturnValue(),
                  [v10 doubleValue],
                  v23 <= 0.0))
            {
              BOOL v16 = 0;
            }
            else
            {
              v24 = objc_msgSend(v4, "objectForKeyedSubscript:", @"firstPartyMsgSixWeeks", (void)v28);
              [v24 doubleValue];
              if (v25 <= 0.0)
              {
                v26 = [v4 objectForKeyedSubscript:@"thirdPartyMsgTwoWeeks"];
                [v26 doubleValue];
                BOOL v16 = v27 > 0.0;
              }
              else
              {
                BOOL v16 = 1;
              }

              if (v22 > 0.0) {
                goto LABEL_19;
              }
            }
          }
        }
      }
LABEL_19:

      goto LABEL_20;
    }
  }
  BOOL v16 = 0;
LABEL_20:

  return v16;
}

+ (void)featureDictionaryPassesHeuristic:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v5 = 138412546;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  id v8 = (id)objc_opt_class();
  id v4 = v8;
  _os_log_fault_impl(&dword_1A314B000, a3, OS_LOG_TYPE_FAULT, "Feature value for key: %@ contained an unsupported type of %@", (uint8_t *)&v5, 0x16u);
}

@end