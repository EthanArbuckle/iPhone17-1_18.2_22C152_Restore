@interface SSLocalRankingResultSignalManager
+ (id)_getSpotlightRecentEngagementAttributes;
+ (id)_getSpotlightRecentEngagementAttributesNonUnique;
+ (id)getSpotlightRecentEngagementAttributes;
+ (id)getSpotlightRecentEngagementAttributesNonUnique;
+ (id)updateRecentEngagementAttributes:(id)a3 queryString:(id)a4 renderPosition:(id)a5 engagementAttributes:(id)a6 unique:(BOOL)a7;
@end

@implementation SSLocalRankingResultSignalManager

+ (id)_getSpotlightRecentEngagementAttributes
{
  if (_getSpotlightRecentEngagementAttributes_onceToken != -1) {
    dispatch_once(&_getSpotlightRecentEngagementAttributes_onceToken, &__block_literal_global_36);
  }
  v2 = (void *)_getSpotlightRecentEngagementAttributes_attrNames;
  return v2;
}

void __76__SSLocalRankingResultSignalManager__getSpotlightRecentEngagementAttributes__block_invoke()
{
  v3[3] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F23468];
  v3[0] = *MEMORY[0x1E4F23478];
  v3[1] = v0;
  v3[2] = *MEMORY[0x1E4F23488];
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:3];
  v2 = (void *)_getSpotlightRecentEngagementAttributes_attrNames;
  _getSpotlightRecentEngagementAttributes_attrNames = v1;
}

+ (id)_getSpotlightRecentEngagementAttributesNonUnique
{
  if (_getSpotlightRecentEngagementAttributesNonUnique_onceToken != -1) {
    dispatch_once(&_getSpotlightRecentEngagementAttributesNonUnique_onceToken, &__block_literal_global_2_0);
  }
  v2 = (void *)_getSpotlightRecentEngagementAttributesNonUnique_attrNames;
  return v2;
}

void __85__SSLocalRankingResultSignalManager__getSpotlightRecentEngagementAttributesNonUnique__block_invoke()
{
  v3[3] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F23470];
  v3[0] = *MEMORY[0x1E4F23480];
  v3[1] = v0;
  v3[2] = *MEMORY[0x1E4F23490];
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:3];
  v2 = (void *)_getSpotlightRecentEngagementAttributesNonUnique_attrNames;
  _getSpotlightRecentEngagementAttributesNonUnique_attrNames = v1;
}

+ (id)updateRecentEngagementAttributes:(id)a3 queryString:(id)a4 renderPosition:(id)a5 engagementAttributes:(id)a6 unique:(BOOL)a7
{
  BOOL v7 = a7;
  v62[3] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v60 = a5;
  id v13 = a6;
  v59 = [MEMORY[0x1E4F1C9C8] date];
  v14 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:10];
  v15 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:10];
  v16 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:10];
  v58 = v11;
  if ([v11 count] == 3)
  {
    BOOL v53 = v7;
    v55 = v14;
    v17 = [v11 objectAtIndexedSubscript:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v18 = [v11 objectAtIndexedSubscript:1];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v19 = [v11 objectAtIndexedSubscript:2];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        BOOL v7 = v53;
        if ((isKindOfClass & 1) == 0) {
          goto LABEL_19;
        }
        v17 = [v11 objectAtIndexedSubscript:0];
        v21 = [v11 objectAtIndexedSubscript:1];
        v22 = [v11 objectAtIndexedSubscript:2];
        uint64_t v23 = [v17 count];
        v52 = v21;
        if (v23 == [v21 count])
        {
          uint64_t v24 = [v17 count];
          if (v24 == [v22 count])
          {
            if ([v17 count])
            {
              uint64_t v25 = 0;
              while (1)
              {
                v26 = [v17 objectAtIndexedSubscript:v25];
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  break;
                }
                v27 = [v52 objectAtIndexedSubscript:v25];
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {

                  break;
                }
                [v22 objectAtIndexedSubscript:v25];
                v28 = v16;
                v30 = id v29 = v13;
                objc_opt_class();
                char v51 = objc_opt_isKindOfClass();

                id v13 = v29;
                v16 = v28;

                if (v51)
                {
                  v31 = [v17 objectAtIndexedSubscript:v25];
                  [v55 addObject:v31];

                  v32 = [v52 objectAtIndexedSubscript:v25];
                  [v15 addObject:v32];

                  v33 = [v22 objectAtIndexedSubscript:v25];
                  [v28 addObject:v33];

                  if (++v25 < (unint64_t)[v17 count]) {
                    continue;
                  }
                }
                goto LABEL_16;
              }
            }
          }
        }
LABEL_16:

        v18 = v52;
      }
    }
    v14 = v55;

    BOOL v7 = v53;
  }
LABEL_19:
  if ([v12 length])
  {
    id v56 = v13;
    uint64_t v34 = [v14 count];
    unint64_t v35 = v34;
    if (v7)
    {
      uint64_t v36 = 0x7FFFFFFFFFFFFFFFLL;
      if (v34)
      {
        uint64_t v36 = 0;
        while (1)
        {
          v37 = [v14 objectAtIndexedSubscript:v36];
          char v38 = [v37 isEqualToString:v12];

          if (v38) {
            break;
          }
          if (v35 == ++v36) {
            goto LABEL_25;
          }
        }
      }
    }
    else
    {
LABEL_25:
      uint64_t v36 = 0x7FFFFFFFFFFFFFFFLL;
    }
    if (v36 == 0x7FFFFFFFFFFFFFFFLL && v35 >= 0xA)
    {
      uint64_t v36 = 0;
      for (uint64_t i = 1; i != v35; ++i)
      {
        v40 = [v15 objectAtIndexedSubscript:i];
        v41 = [v15 objectAtIndexedSubscript:v36];
        uint64_t v42 = [v40 compare:v41];

        if (v42 == -1) {
          uint64_t v36 = i;
        }
      }
      [v14 setObject:v12 atIndexedSubscript:v36];
    }
    if (v36 == 0x7FFFFFFFFFFFFFFFLL)
    {
      [v14 addObject:v12];
      [v15 addObject:v59];
      [v16 addObject:v60];
    }
    else
    {
      [v15 setObject:v59 atIndexedSubscript:v36];
      [v16 setObject:v60 atIndexedSubscript:v36];
    }
    id v13 = v56;
  }
  if ([v13 count] != 3) {
    +[SSLocalRankingResultSignalManager updateRecentEngagementAttributes:queryString:renderPosition:engagementAttributes:unique:]();
  }
  v43 = [v13 objectAtIndexedSubscript:0];
  v61[0] = v43;
  v44 = (void *)[v14 copy];
  v62[0] = v44;
  v45 = [v13 objectAtIndexedSubscript:1];
  v61[1] = v45;
  v46 = (void *)[v15 copy];
  v62[1] = v46;
  [v13 objectAtIndexedSubscript:2];
  v47 = v57 = v12;
  v61[2] = v47;
  v48 = v14;
  v49 = (void *)[v16 copy];
  v62[2] = v49;
  id v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:v61 count:3];

  return v54;
}

+ (id)getSpotlightRecentEngagementAttributes
{
  return +[SSLocalRankingResultSignalManager _getSpotlightRecentEngagementAttributes];
}

+ (id)getSpotlightRecentEngagementAttributesNonUnique
{
  return +[SSLocalRankingResultSignalManager _getSpotlightRecentEngagementAttributesNonUnique];
}

+ (void)updateRecentEngagementAttributes:queryString:renderPosition:engagementAttributes:unique:.cold.1()
{
  __assert_rtn("+[SSLocalRankingResultSignalManager updateRecentEngagementAttributes:queryString:renderPosition:engagementAttributes:unique:]", "SSLocalRankingResultSignalManager.m", 95, "engagementAttributes.count == 3");
}

@end