@interface RKCoreAnalytics
+ (id)assignCoreAnalyticsCategory:(id)a3 forAction:(id)a4 withLanguageID:(id)a5;
+ (void)sendCoreAnalyticsEvent:(id)a3 forAction:(id)a4 withLanguageID:(id)a5;
@end

@implementation RKCoreAnalytics

+ (id)assignCoreAnalyticsCategory:(id)a3 forAction:(id)a4 withLanguageID:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    if (v7 && ([v7 isEqualToString:&stru_26C8AEFC8] & 1) == 0)
    {
      v10 = @"StatementExpressEmotion";
      switch(RKLinguisticCategoryFromPreferenceKey(v7))
      {
        case 2:
        case 3:
        case 4:
        case 5:
          uint64_t v12 = 2;
          goto LABEL_14;
        case 6:
        case 7:
        case 8:
        case 10:
        case 15:
        case 18:
        case 44:
        case 45:
          v11 = (__CFString *)v7;
          goto LABEL_15;
        case 11:
        case 12:
          uint64_t v12 = 11;
          goto LABEL_14;
        case 13:
        case 14:
          uint64_t v12 = 13;
          goto LABEL_14;
        case 21:
        case 22:
        case 23:
        case 24:
        case 25:
        case 26:
        case 27:
        case 28:
          uint64_t v12 = 21;
          goto LABEL_14;
        case 34:
        case 35:
          break;
        case 37:
        case 38:
        case 39:
        case 42:
          v10 = @"StatementSpecialEvent";
          break;
        default:
          uint64_t v12 = 0;
LABEL_14:
          RKLinguisticCategoryToPreferenceKey(v12);
          v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_15:
          v10 = v11;
          break;
      }
    }
    else
    {
      v10 = @"allCategories";
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (void)sendCoreAnalyticsEvent:(id)a3 forAction:(id)a4 withLanguageID:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [a1 assignCoreAnalyticsCategory:a3 forAction:v8 withLanguageID:v9];
  v11 = (void *)v10;
  if (v8 && v9 && v10)
  {
    id v12 = v8;
    id v13 = v9;
    id v14 = v11;
    AnalyticsSendEventLazy();
  }
}

id __67__RKCoreAnalytics_sendCoreAnalyticsEvent_forAction_withLanguageID___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  long long v1 = *(_OWORD *)(a1 + 32);
  v4[0] = @"ACTION";
  v4[1] = @"LOCALE";
  long long v5 = v1;
  v4[2] = @"CATEGORY";
  uint64_t v6 = *(void *)(a1 + 48);
  v2 = [NSDictionary dictionaryWithObjects:&v5 forKeys:v4 count:3];

  return v2;
}

@end