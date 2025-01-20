@interface SignpostSupportObjectExtractor(AllFileReading)
+ (BOOL)getDataSourceDateRange:()AllFileReading earliestDateOut:latestDateOut:errorsOut:;
- (uint64_t)processFileWithPath:()AllFileReading startDate:endDate:errorsOut:;
@end

@implementation SignpostSupportObjectExtractor(AllFileReading)

- (uint64_t)processFileWithPath:()AllFileReading startDate:endDate:errorsOut:
{
  v26[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    id v23 = 0;
    int v13 = [a1 processLogArchiveWithPath:v10 startDate:v11 endDate:v12 errorOut:&v23];
    id v14 = v23;
    v15 = v14;
    if (v13)
    {
      if (a6) {
        *a6 = 0;
      }
      uint64_t v16 = 1;
      goto LABEL_22;
    }
    if (!v14)
    {
      v15 = [MEMORY[0x263F087E8] errorWithCode:4 description:@"Unknown error"];
    }
    id v22 = 0;
    uint64_t v16 = [a1 processTraceFileWithPath:v10 startDate:v11 endDate:v12 errorOut:&v22];
    id v18 = v22;
    v19 = v18;
    if (v16)
    {
      if (!a6)
      {
LABEL_21:

        goto LABEL_22;
      }
      id v20 = 0;
    }
    else
    {
      if (!v18)
      {
        v19 = [MEMORY[0x263F087E8] errorWithCode:4 description:@"Unknown error"];
      }
      if (!a6) {
        goto LABEL_21;
      }
      v25[0] = v15;
      v25[1] = v19;
      id v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
    }
    *a6 = v20;
    goto LABEL_21;
  }
  id v24 = 0;
  uint64_t v16 = [a1 processLogArchiveWithPath:0 startDate:v11 endDate:v12 errorOut:&v24];
  id v17 = v24;
  v15 = v17;
  if (a6 && (v16 & 1) == 0)
  {
    if (!v17)
    {
      v15 = [MEMORY[0x263F087E8] errorWithCode:4 description:@"Unknown error"];
    }
    v26[0] = v15;
    *a6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
  }
LABEL_22:

  return v16;
}

+ (BOOL)getDataSourceDateRange:()AllFileReading earliestDateOut:latestDateOut:errorsOut:
{
  v61[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  if (!v8)
  {
    id v10 = [MEMORY[0x263F52748] localStore];
    if (v10) {
      goto LABEL_4;
    }
    goto LABEL_8;
  }
  v9 = [NSURL fileURLWithPath:v8];
  if (!v9)
  {
    uint64_t v16 = (void *)MEMORY[0x263F087E8];
    id v14 = [NSString stringWithFormat:@"Bad input file: %@", v8];
    uint64_t v15 = [v16 errorWithCode:12 description:v14];
    goto LABEL_10;
  }
  id v10 = [MEMORY[0x263F52748] storeWithArchiveURL:v9];

  if (!v10)
  {
LABEL_8:
    int v13 = (void *)MEMORY[0x263F087E8];
    id v14 = [NSString stringWithFormat:@"Could not read file: %@", v8];
    uint64_t v15 = [v13 errorWithCode:5 description:v14];
LABEL_10:
    id v12 = (id)v15;

    goto LABEL_11;
  }
LABEL_4:
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__1;
  v59 = __Block_byref_object_dispose__1;
  id v60 = 0;
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__1;
  v53 = __Block_byref_object_dispose__1;
  id v54 = 0;
  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = ___dateRangeFromLogArchiveSource_block_invoke;
  v48[3] = &unk_264487FB8;
  v48[4] = &v49;
  v48[5] = &v55;
  [v10 prepareWithCompletionHandler:v48];
  id v11 = (void *)v56[5];
  if (v11)
  {
    id v12 = v11;
  }
  else
  {
    v30 = [(id)v50[5] oldestDate];
    BOOL v31 = v30 == 0;

    if (v31)
    {
      v43 = (void *)MEMORY[0x263F087E8];
      v44 = [NSString stringWithFormat:@"Could not determine earliest date from data source: %@", v8];
      id v12 = [v43 errorWithCode:5 description:v44];
    }
    else
    {
      v32 = [(id)v50[5] newestDate];
      BOOL v33 = v32 == 0;

      if (v33)
      {
        v45 = (void *)MEMORY[0x263F087E8];
        v46 = [NSString stringWithFormat:@"Could not determine latest date from data source: %@", v8];
        id v12 = [v45 errorWithCode:5 description:v46];
      }
      else
      {
        *a4 = [(id)v50[5] oldestDate];
        [(id)v50[5] newestDate];
        id v12 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  _Block_object_dispose(&v49, 8);

  _Block_object_dispose(&v55, 8);
LABEL_11:

  if (v12)
  {
    id v17 = v8;
    [v17 UTF8String];
    uint64_t v18 = ktrace_file_open();
    if (v18)
    {
      v19 = (void *)[objc_alloc(MEMORY[0x263F8AEB8]) initWithKtraceFile:v18];
      if (v19)
      {
        id v20 = (void *)[objc_alloc(MEMORY[0x263F52730]) initWithDataSourceDelegate:v19];
        v21 = v20;
        if (v20)
        {
          id v22 = [v20 firstDate];
          if (!v22
            || ([v21 lastDate],
                id v23 = objc_claimAutoreleasedReturnValue(),
                BOOL v24 = v23 == 0,
                v23,
                v22,
                v24))
          {
            ktrace_file_close();
            v37 = (void *)MEMORY[0x263F087E8];
            v38 = [NSString stringWithFormat:@"Could not determine date range for file: %@", v17];
            v25 = [v37 errorWithCode:7 description:v38];
          }
          else
          {
            *a4 = [v21 firstDate];
            [v21 lastDate];
            v25 = 0;
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          ktrace_file_close();
          v39 = (void *)MEMORY[0x263F087E8];
          v40 = [NSString stringWithFormat:@"Failed to instantiate deserializing stream for file: %@", v17];
          v25 = [v39 errorWithCode:7 description:v40];

          v21 = 0;
        }
      }
      else
      {
        ktrace_file_close();
        v34 = (void *)MEMORY[0x263F087E8];
        v35 = NSString;
        v36 = __error();
        v21 = [v35 stringWithFormat:@"Could not open trace file '%@' due to error: %s", v17, strerror(*v36)];
        v25 = [v34 errorWithCode:7 description:v21];
      }
    }
    else
    {
      v27 = (void *)MEMORY[0x263F087E8];
      v28 = NSString;
      v29 = __error();
      v19 = [v28 stringWithFormat:@"Could not open trace file '%@' due to error: %s", v17, strerror(*v29)];
      v25 = [v27 errorWithCode:7 description:v19];
    }

    BOOL v26 = v25 == 0;
    if (v25)
    {
      if (a6)
      {
        v61[0] = v12;
        v61[1] = v25;
        id v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:v61 count:2];
LABEL_34:
        *a6 = v41;
      }
    }
    else if (a6)
    {
      id v41 = 0;
      goto LABEL_34;
    }

    goto LABEL_36;
  }
  if (a6) {
    *a6 = 0;
  }
  BOOL v26 = 1;
LABEL_36:

  return v26;
}

@end