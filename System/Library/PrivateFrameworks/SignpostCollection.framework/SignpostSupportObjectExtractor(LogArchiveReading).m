@interface SignpostSupportObjectExtractor(LogArchiveReading)
+ (BOOL)dateRangeOfLogArchiveWithPath:()LogArchiveReading startDateOut:endDateOut:errorOut:;
+ (id)_eventSourceForPath:()LogArchiveReading errorOut:;
- (uint64_t)processLogArchiveWithPath:()LogArchiveReading startDate:endDate:errorOut:;
@end

@implementation SignpostSupportObjectExtractor(LogArchiveReading)

+ (id)_eventSourceForPath:()LogArchiveReading errorOut:
{
  v5 = a3;
  if (!v5) {
    goto LABEL_9;
  }
  v6 = [NSURL fileURLWithPath:v5 isDirectory:0];
  id v22 = 0;
  char v7 = [v6 checkResourceIsReachableAndReturnError:&v22];
  id v8 = v22;
  v9 = v8;
  if (v7)
  {

    if (v6)
    {
      v9 = [MEMORY[0x263F52748] storeWithArchiveURL:v6];
      if (!v9) {
        goto LABEL_5;
      }
      goto LABEL_10;
    }
LABEL_9:
    v9 = [MEMORY[0x263F52748] localStore];
    v6 = 0;
    if (!v9)
    {
LABEL_5:
      if (a4)
      {
        v10 = (void *)MEMORY[0x263F087E8];
        v11 = @"Local Store";
        if (v5) {
          v11 = v5;
        }
        [NSString stringWithFormat:@"Could not create OSLogEventStore for path: %@", v11];
        v13 = LABEL_15:;
        *a4 = [v10 errorWithCode:4 description:v13];

        goto LABEL_16;
      }
      goto LABEL_16;
    }
LABEL_10:
    [v9 setUpgradeConfirmationHandler:&__block_literal_global];
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__0;
    v20 = __Block_byref_object_dispose__0;
    id v21 = 0;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __82__SignpostSupportObjectExtractor_LogArchiveReading___eventSourceForPath_errorOut___block_invoke_11;
    v15[3] = &unk_264487F90;
    v15[4] = &v16;
    v15[5] = a4;
    [v9 prepareWithCompletionHandler:v15];
    id v12 = (id)v17[5];
    _Block_object_dispose(&v16, 8);

    goto LABEL_17;
  }
  if (a4)
  {
    if (v8)
    {
      id v12 = 0;
      *a4 = (id)[v8 copy];
      goto LABEL_17;
    }
    v10 = (void *)MEMORY[0x263F087E8];
    [NSString stringWithFormat:@"Unknown error opening file: %@", v5];
    goto LABEL_15;
  }
LABEL_16:
  id v12 = 0;
LABEL_17:

  return v12;
}

- (uint64_t)processLogArchiveWithPath:()LogArchiveReading startDate:endDate:errorOut:
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([a1 _hasProcessingBlock])
  {
    v13 = [(id)objc_opt_class() _eventSourceForPath:v10 errorOut:a6];
    if (v13)
    {
      if (v10
        || ([a1 logMessageProcessingBlock],
            v14 = objc_claimAutoreleasedReturnValue(),
            v14,
            v14))
      {
        uint64_t v15 = [objc_alloc(MEMORY[0x263F52750]) initWithSource:v13];
      }
      else
      {
        uint64_t v15 = [objc_alloc(MEMORY[0x263F52750]) initWithSource:v13 skipNonSignpostFiles:1];
      }
      uint64_t v16 = (void *)v15;
      uint64_t v17 = [a1 _processLogEventStream:v15 startDate:v11 endDate:v12 errorOut:a6];
    }
    else
    {
      uint64_t v17 = 0;
    }
  }
  else if (a6)
  {
    [MEMORY[0x263F087E8] errorWithCode:8 description:@"No processing blocks specified"];
    uint64_t v17 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

+ (BOOL)dateRangeOfLogArchiveWithPath:()LogArchiveReading startDateOut:endDateOut:errorOut:
{
  id v9 = a3;
  if (a6) {
    *a6 = 0;
  }
  if (a4 | a5)
  {
    id v11 = [(id)objc_opt_class() _eventSourceForPath:v9 errorOut:a6];
    id v12 = v11;
    BOOL v10 = v11 != 0;
    if (v11)
    {
      if (a4)
      {
        *(void *)a4 = [v11 oldestDate];
      }
      if (a5)
      {
        *(void *)a5 = [v12 newestDate];
      }
    }
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

@end