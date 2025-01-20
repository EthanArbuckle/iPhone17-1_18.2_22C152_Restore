@interface TSRTRoutineManager
+ (id)parseLocation:(id)a3;
+ (void)fetchMostFrequentLocationWithCompletion:(id)a3;
@end

@implementation TSRTRoutineManager

void __62__TSRTRoutineManager_fetchMostFrequentLocationWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = (void *)*MEMORY[0x1E4F7E080];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7E080], OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      v9 = [v6 localizedDescription];
      int v16 = 138412290;
      v17 = v9;
      _os_log_impl(&dword_1BFC31000, v8, OS_LOG_TYPE_DEFAULT, "Error when trying to fetch frequent locations: %@", (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    if ([v5 count])
    {
      v10 = [v5 sortedArrayUsingComparator:&__block_literal_global_7];

      uint64_t v11 = *(void *)(a1 + 32);
      v12 = *(void **)(a1 + 40);
      v13 = [v10 firstObject];
      v14 = [v12 parseLocation:v13];
      (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v14);

      id v5 = v10;
      goto LABEL_7;
    }
    v15 = *MEMORY[0x1E4F7E080];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7E080], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_1BFC31000, v15, OS_LOG_TYPE_DEFAULT, "No frequent locations found", (uint8_t *)&v16, 2u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_7:
}

+ (void)fetchMostFrequentLocationWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F5CEB8] defaultManager];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__TSRTRoutineManager_fetchMostFrequentLocationWithCompletion___block_invoke;
  v7[3] = &unk_1E6415938;
  id v8 = v4;
  id v9 = a1;
  id v6 = v4;
  [v5 fetchLocationsOfInterestOfType:0 withHandler:v7];
}

void __62__TSRTRoutineManager_fetchMostFrequentLocationWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = (void *)*MEMORY[0x1E4F7E080];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7E080], OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v7;
      id v9 = [v6 localizedDescription];
      *(_DWORD *)buf = 138412290;
      v23 = v9;
      _os_log_impl(&dword_1BFC31000, v8, OS_LOG_TYPE_DEFAULT, "Error when trying to fetch home locations: %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else if ([v5 count])
  {
    v10 = [v5 sortedArrayUsingComparator:&__block_literal_global_0];

    uint64_t v11 = *(void *)(a1 + 32);
    v12 = *(void **)(a1 + 40);
    v13 = [v10 firstObject];
    v14 = [v12 parseLocation:v13];
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v14);

    id v5 = v10;
  }
  else
  {
    v15 = [MEMORY[0x1E4F5CEB8] defaultManager];
    int v16 = [MEMORY[0x1E4F1C9C8] distantPast];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __62__TSRTRoutineManager_fetchMostFrequentLocationWithCompletion___block_invoke_2;
    v19[3] = &unk_1E6415938;
    id v17 = *(id *)(a1 + 32);
    uint64_t v18 = *(void *)(a1 + 40);
    id v20 = v17;
    uint64_t v21 = v18;
    [v15 fetchLocationsOfInterestVisitedSinceDate:v16 withHandler:v19];
  }
}

+ (id)parseLocation:(id)a3
{
  if (a3)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F1E5F0];
    id v5 = a3;
    id v6 = [v4 alloc];
    [v5 latitude];
    double v8 = v7;
    [v5 longitude];
    double v10 = v9;

    uint64_t v11 = (void *)[v6 initWithLatitude:v8 longitude:v10];
  }
  else
  {
    uint64_t v11 = 0;
  }
  return v11;
}

uint64_t __62__TSRTRoutineManager_fetchMostFrequentLocationWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a2;
  id v6 = [a3 visits];
  double v7 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
  double v8 = NSNumber;
  double v9 = [v5 visits];

  double v10 = objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
  uint64_t v11 = [v7 compare:v10];

  return v11;
}

uint64_t __62__TSRTRoutineManager_fetchMostFrequentLocationWithCompletion___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a2;
  id v6 = [a3 visits];
  double v7 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
  double v8 = NSNumber;
  double v9 = [v5 visits];

  double v10 = objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
  uint64_t v11 = [v7 compare:v10];

  return v11;
}

@end