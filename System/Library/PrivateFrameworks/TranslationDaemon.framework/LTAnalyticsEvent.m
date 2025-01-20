@interface LTAnalyticsEvent
@end

@implementation LTAnalyticsEvent

void __39___LTAnalyticsEvent_timestampWithName___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
    [WeakRetained[5] setObject:v2 forKeyedSubscript:*(void *)(a1 + 32)];
  }
}

void __58___LTAnalyticsEvent_addFieldsFromDictionary_internalOnly___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    [WeakRetained[5] addEntriesFromDictionary:*(void *)(a1 + 32)];
    WeakRetained = v3;
  }
}

void __29___LTAnalyticsEvent_sendLazy__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_copyWeak(&v3, v1);
    AnalyticsSendEventLazy();
    objc_destroyWeak(&v3);
  }
}

id __29___LTAnalyticsEvent_sendLazy__block_invoke_2(uint64_t a1)
{
  v15[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    double v4 = *((double *)WeakRetained + 3) - *((double *)WeakRetained + 2);
    v5 = (void *)MEMORY[0x263EFF9A0];
    v14 = @"duration";
    v6 = [NSNumber numberWithDouble:v4];
    v15[0] = v6;
    v7 = [NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
    v8 = [v5 dictionaryWithDictionary:v7];

    v9 = [*(id *)(a1 + 32) sourceLocale];
    v10 = [v9 _ltLocaleIdentifier];

    v11 = [*(id *)(a1 + 32) targetLocale];
    v12 = [v11 _ltLocaleIdentifier];

    if (v10 && v12)
    {
      [v8 setObject:v10 forKeyedSubscript:@"sourceLocale"];
      [v8 setObject:v12 forKeyedSubscript:@"targetLocale"];
    }
    [v8 addEntriesFromDictionary:v3[5]];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end