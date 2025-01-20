@interface SSQueryUnderstandingUtilities
+ (id)queryUnderstandingParseWithQueryUnderstanding:(id)a3;
+ (int)spotlightQueryIntent:(id)a3;
@end

@implementation SSQueryUnderstandingUtilities

+ (id)queryUnderstandingParseWithQueryUnderstanding:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F9A308]);
  v5 = [v3 objectForKeyedSubscript:@"kQPQUIntentIds"];
  if ([v5 count])
  {
    v6 = [v5 objectAtIndexedSubscript:0];
    int v7 = [v6 intValue];

    if (v7)
    {
      if (v7 != 1) {
        goto LABEL_7;
      }
      uint64_t v8 = 2;
    }
    else
    {
      uint64_t v8 = 1;
    }
    [v4 setQueryIntentType:v8];
  }
LABEL_7:
  v9 = [v3 objectForKeyedSubscript:@"kQPQUOutputTokenInfo"];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = [*(id *)(*((void *)&v18 + 1) + 8 * i) objectForKeyedSubscript:@"kQPQUOutputTokenArgIds"];
        if ([v14 count])
        {
          v15 = [v14 objectAtIndexedSubscript:0];
          int v16 = [v15 intValue];
          switch(v16)
          {
            case 0:
              [v4 setHasUnspecifiedTokens:1];
              break;
            case 1:
              [v4 setHasMediaTypeTokens:1];
              break;
            case 2:
              [v4 setHasPersonTokens:1];
              break;
            case 3:
              [v4 setHasPersonSenderTokens:1];
              break;
            case 4:
            case 6:
            case 13:
            case 14:
            case 15:
            case 16:
            case 17:
            case 18:
            case 19:
            case 20:
              break;
            case 5:
              [v4 setHasNounTokens:1];
              break;
            case 7:
              [v4 setHasVisualQualityTokens:1];
              break;
            case 8:
              [v4 setHasTimeTokens:1];
              break;
            case 9:
              [v4 setHasEventTokens:1];
              break;
            case 10:
              [v4 setHasLocationTokens:1];
              break;
            case 11:
              [v4 setHasGenericLocationTokens:1];
              break;
            case 12:
              [v4 setHasSourceAppTokens:1];
              break;
            case 21:
              [v4 setHasFavoritedTokens:1];
              break;
            default:
              if (v16 == 50) {
                [v4 setHasSortCriteriaTokens:1];
              }
              break;
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  return v4;
}

+ (int)spotlightQueryIntent:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    unsigned int v5 = +[SSQueryIntent intentStrength:](SSQueryIntent, "intentStrength:", [v3 intentType]);
    if (v5 >= 5) {
      int v6 = 0;
    }
    else {
      int v6 = v5;
    }
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

@end