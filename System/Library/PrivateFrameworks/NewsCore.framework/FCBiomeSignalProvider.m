@interface FCBiomeSignalProvider
+ (void)fetchSignalsFromBiomeWithSafariBlockoutDuration:(double)a3 maxExternalSignalEventCount:(int64_t)a4 resultsBlock:(id)a5;
@end

@implementation FCBiomeSignalProvider

+ (void)fetchSignalsFromBiomeWithSafariBlockoutDuration:(double)a3 maxExternalSignalEventCount:(int64_t)a4 resultsBlock:(id)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  v7 = (void (**)(void, void *, void *))a5;
  v8 = v7;
  if (a4 <= 0)
  {
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __114__FCBiomeSignalProvider_fetchSignalsFromBiomeWithSafariBlockoutDuration_maxExternalSignalEventCount_resultsBlock___block_invoke;
    v42[3] = &unk_1E5B5B6E0;
    int64_t v44 = a4;
    v43 = v7;
    __114__FCBiomeSignalProvider_fetchSignalsFromBiomeWithSafariBlockoutDuration_maxExternalSignalEventCount_resultsBlock___block_invoke((uint64_t)v42);
    v32 = v43;
  }
  else
  {
    if (!v7 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v33 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "resultsBlock");
      *(_DWORD *)buf = 136315906;
      v46 = "+[FCBiomeSignalProvider fetchSignalsFromBiomeWithSafariBlockoutDuration:maxExternalSignalEventCount:resultsBlock:]";
      __int16 v47 = 2080;
      v48 = "FCBiomeSignalProvider.m";
      __int16 v49 = 1024;
      int v50 = 32;
      __int16 v51 = 2114;
      v52 = v33;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    v34 = v8;
    v9 = FCBiomeLog;
    if (os_log_type_enabled((os_log_t)FCBiomeLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v46 = (const char *)a4;
      _os_log_impl(&dword_1A460D000, v9, OS_LOG_TYPE_DEFAULT, "Querying Biome for Safari and App Signals with maxExternalSignalEventCount %ld", buf, 0xCu);
    }
    v10 = BiomeLibrary();
    v11 = [v10 App];
    v12 = [v11 InFocus];

    v13 = BiomeLibrary();
    v14 = [v13 App];
    v15 = [v14 WebUsage];

    v16 = objc_opt_new();
    v17 = objc_opt_new();
    v18 = (void *)[objc_alloc(MEMORY[0x1E4F503E8]) initWithStartDate:0 endDate:0 maxEvents:0 lastN:a4 reversed:0];
    v19 = [v12 publisherWithUseCase:@"AutoFavorites" options:v18];
    v20 = objc_opt_new();
    v21 = [v19 reduceWithInitial:v20 nextPartialResult:&__block_literal_global_76_0];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __114__FCBiomeSignalProvider_fetchSignalsFromBiomeWithSafariBlockoutDuration_maxExternalSignalEventCount_resultsBlock___block_invoke_81;
    v39[3] = &unk_1E5B4D7B0;
    id v22 = v16;
    id v40 = v22;
    id v41 = &__block_literal_global_177;
    id v23 = (id)[v21 sinkWithCompletion:&__block_literal_global_80 receiveInput:v39];

    v24 = v15;
    v25 = [v15 publisherWithUseCase:@"AutoFavorites" options:v18];
    v26 = objc_opt_new();
    v27 = [v25 reduceWithInitial:v26 nextPartialResult:&__block_literal_global_85];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __114__FCBiomeSignalProvider_fetchSignalsFromBiomeWithSafariBlockoutDuration_maxExternalSignalEventCount_resultsBlock___block_invoke_88;
    v35[3] = &unk_1E5B5B7B0;
    id v28 = v17;
    id v36 = v28;
    id v37 = &__block_literal_global_177;
    double v38 = a3;
    id v29 = (id)[v27 sinkWithCompletion:&__block_literal_global_87 receiveInput:v35];

    v8 = v34;
    if (v34)
    {
      v30 = (void *)[v22 copy];
      v31 = (void *)[v28 copy];
      v34[2](v34, v30, v31);
    }
    v32 = v12;
  }
}

uint64_t __114__FCBiomeSignalProvider_fetchSignalsFromBiomeWithSafariBlockoutDuration_maxExternalSignalEventCount_resultsBlock___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = FCBiomeLog;
  if (os_log_type_enabled((os_log_t)FCBiomeLog, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v5 = 134217984;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1A460D000, v2, OS_LOG_TYPE_DEFAULT, "See maxExternalSignalEventCount specified as %ld, skipping query for external signals", (uint8_t *)&v5, 0xCu);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, MEMORY[0x1E4F1CBF0], MEMORY[0x1E4F1CBF0]);
  }
  return result;
}

id __114__FCBiomeSignalProvider_fetchSignalsFromBiomeWithSafariBlockoutDuration_maxExternalSignalEventCount_resultsBlock___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  objc_opt_class();
  if (v2)
  {
    if (objc_opt_isKindOfClass()) {
      uint64_t v3 = v2;
    }
    else {
      uint64_t v3 = 0;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = v3;
  int v5 = objc_msgSend(v4, "fc_arrayOfObjectsPassingTest:", &__block_literal_global_10_3);
  uint64_t v6 = [v5 sortedArrayUsingComparator:&__block_literal_global_68_1];

  uint64_t v7 = FCBiomeLog;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)FCBiomeLog, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      int v11 = 134217984;
      uint64_t v12 = [v6 count];
      _os_log_impl(&dword_1A460D000, v8, OS_LOG_TYPE_DEFAULT, "Got back %lu results from Biome", (uint8_t *)&v11, 0xCu);
    }
    id v9 = v6;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)FCBiomeLog, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138543362;
      uint64_t v12 = (uint64_t)v2;
      _os_log_error_impl(&dword_1A460D000, v7, OS_LOG_TYPE_ERROR, "Didn't get an array back from Biome, instead got %{public}@", (uint8_t *)&v11, 0xCu);
    }
    id v9 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v9;
}

BOOL __114__FCBiomeSignalProvider_fetchSignalsFromBiomeWithSafariBlockoutDuration_maxExternalSignalEventCount_resultsBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = v2;
  if (v2)
  {
    if ([v2 conformsToProtocol:&unk_1EF9613C8]) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }
  id v5 = v4;

  if (!v5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = (void *)[[NSString alloc] initWithFormat:@"Got back an array from Biome that had an object that didn't conform to FCPersonalizationExternalSignal : %@", v3];
    *(_DWORD *)buf = 136315906;
    id v9 = "+[FCBiomeSignalProvider fetchSignalsFromBiomeWithSafariBlockoutDuration:maxExternalSignalEventCount:resultsBloc"
         "k:]_block_invoke_2";
    __int16 v10 = 2080;
    int v11 = "FCBiomeSignalProvider.m";
    __int16 v12 = 1024;
    int v13 = 56;
    __int16 v14 = 2114;
    v15 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  return v5 != 0;
}

uint64_t __114__FCBiomeSignalProvider_fetchSignalsFromBiomeWithSafariBlockoutDuration_maxExternalSignalEventCount_resultsBlock___block_invoke_65(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = [a3 date];
  uint64_t v6 = [v4 date];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

id __114__FCBiomeSignalProvider_fetchSignalsFromBiomeWithSafariBlockoutDuration_maxExternalSignalEventCount_resultsBlock___block_invoke_73(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = [a3 eventBody];
  [v4 addObject:v5];

  return v4;
}

void __114__FCBiomeSignalProvider_fetchSignalsFromBiomeWithSafariBlockoutDuration_maxExternalSignalEventCount_resultsBlock___block_invoke_2_77(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = [v2 error];

  id v4 = FCBiomeLog;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)FCBiomeLog, OS_LOG_TYPE_ERROR))
    {
      id v5 = v4;
      uint64_t v6 = [v2 error];
      uint64_t v7 = [v6 localizedDescription];
      int v8 = 138543362;
      id v9 = v7;
      _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "Encountered an error getting appsStream. Error=%{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)FCBiomeLog, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "AppsStream completed with no error.", (uint8_t *)&v8, 2u);
  }
}

void __114__FCBiomeSignalProvider_fetchSignalsFromBiomeWithSafariBlockoutDuration_maxExternalSignalEventCount_resultsBlock___block_invoke_81(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 addObjectsFromArray:v2];
}

id __114__FCBiomeSignalProvider_fetchSignalsFromBiomeWithSafariBlockoutDuration_maxExternalSignalEventCount_resultsBlock___block_invoke_2_83(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = [a3 eventBody];
  [v4 addObject:v5];

  return v4;
}

void __114__FCBiomeSignalProvider_fetchSignalsFromBiomeWithSafariBlockoutDuration_maxExternalSignalEventCount_resultsBlock___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = [v2 error];

  id v4 = FCBiomeLog;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)FCBiomeLog, OS_LOG_TYPE_ERROR))
    {
      id v5 = v4;
      uint64_t v6 = [v2 error];
      uint64_t v7 = [v6 localizedDescription];
      int v8 = 138543362;
      id v9 = v7;
      _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "Encountered an error getting WebUsageStream. Error=%{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)FCBiomeLog, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_1A460D000, v4, OS_LOG_TYPE_DEFAULT, "WebUsageStream completed with no error.", (uint8_t *)&v8, 2u);
  }
}

void __114__FCBiomeSignalProvider_fetchSignalsFromBiomeWithSafariBlockoutDuration_maxExternalSignalEventCount_resultsBlock___block_invoke_88(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __114__FCBiomeSignalProvider_fetchSignalsFromBiomeWithSafariBlockoutDuration_maxExternalSignalEventCount_resultsBlock___block_invoke_2_89;
  v20[3] = &unk_1E5B5B7B0;
  id v5 = *(void **)(a1 + 32);
  id v22 = *(id *)(a1 + 40);
  id v6 = v3;
  id v21 = v6;
  uint64_t v23 = *(void *)(a1 + 48);
  uint64_t v7 = objc_msgSend(v4, "fc_array:", v20);
  [v5 addObjectsFromArray:v7];

  int v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  LODWORD(v7) = [v8 BOOLForKey:@"personalization_disregard_time_for_suggestions"];

  id v9 = (void *)FCBiomeLog;
  BOOL v10 = os_log_type_enabled((os_log_t)FCBiomeLog, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v10)
    {
      int v11 = v9;
      objc_opt_class();
      if (v6)
      {
        if (objc_opt_isKindOfClass()) {
          __int16 v12 = v6;
        }
        else {
          __int16 v12 = 0;
        }
      }
      else
      {
        __int16 v12 = 0;
      }
      id v14 = v12;
      uint64_t v15 = [v14 count];
      uint64_t v16 = [*(id *)(a1 + 32) count];
      *(_DWORD *)buf = 134218240;
      uint64_t v25 = v15;
      __int16 v26 = 2048;
      uint64_t v27 = v16;
      v17 = "Asked to disregard time for Safari results, Raw results count %lu and final results count %lu";
LABEL_16:
      _os_log_impl(&dword_1A460D000, v11, OS_LOG_TYPE_DEFAULT, v17, buf, 0x16u);
    }
  }
  else if (v10)
  {
    int v11 = v9;
    objc_opt_class();
    if (v6)
    {
      if (objc_opt_isKindOfClass()) {
        int v13 = v6;
      }
      else {
        int v13 = 0;
      }
    }
    else
    {
      int v13 = 0;
    }
    id v14 = v13;
    uint64_t v18 = [v14 count];
    uint64_t v19 = [*(id *)(a1 + 32) count];
    *(_DWORD *)buf = 134218240;
    uint64_t v25 = v18;
    __int16 v26 = 2048;
    uint64_t v27 = v19;
    v17 = "Raw Safari results pruned from %lu to %lu after applying blackout duration";
    goto LABEL_16;
  }
}

void __114__FCBiomeSignalProvider_fetchSignalsFromBiomeWithSafariBlockoutDuration_maxExternalSignalEventCount_resultsBlock___block_invoke_2_89(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v6 = [v5 BOOLForKey:@"personalization_disregard_time_for_suggestions"];

  if (v6)
  {
    [v3 addObjectsFromArray:v4];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
    uint64_t v8 = *(void *)(a1 + 48);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __114__FCBiomeSignalProvider_fetchSignalsFromBiomeWithSafariBlockoutDuration_maxExternalSignalEventCount_resultsBlock___block_invoke_3_92;
    v10[3] = &unk_1E5B5B788;
    id v11 = v7;
    uint64_t v13 = v8;
    id v12 = v3;
    id v9 = v7;
    [v4 enumerateObjectsUsingBlock:v10];
  }
}

void __114__FCBiomeSignalProvider_fetchSignalsFromBiomeWithSafariBlockoutDuration_maxExternalSignalEventCount_resultsBlock___block_invoke_3_92(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 content];
  id v5 = +[FCPersonalizationURLMapping domainForURL:v4];

  if (v5)
  {
    int v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
    if (!v6
      || ([v3 date],
          uint64_t v7 = objc_claimAutoreleasedReturnValue(),
          [v6 timeIntervalSinceDate:v7],
          double v9 = v8,
          double v10 = *(double *)(a1 + 48),
          v7,
          v9 >= v10))
    {
      id v11 = *(void **)(a1 + 32);
      id v12 = [v3 date];
      objc_msgSend(v11, "fc_safelySetObject:forKey:", v12, v5);

      objc_msgSend(*(id *)(a1 + 40), "fc_safelyAddObject:", v3);
    }
  }
  else
  {
    uint64_t v13 = (void *)FCProgressivePersonalizationLog;
    if (!os_log_type_enabled((os_log_t)FCProgressivePersonalizationLog, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    id v14 = v13;
    int v6 = [v3 content];
    uint64_t v15 = [v6 description];
    int v16 = 138543362;
    v17 = v15;
    _os_log_error_impl(&dword_1A460D000, v14, OS_LOG_TYPE_ERROR, "Encountered signal resulting in a nil-domain: %{public}@", (uint8_t *)&v16, 0xCu);
  }
LABEL_7:
}

@end