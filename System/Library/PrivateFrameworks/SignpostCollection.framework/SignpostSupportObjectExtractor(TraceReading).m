@interface SignpostSupportObjectExtractor(TraceReading)
- (uint64_t)_processTraceFileWithPath:()TraceReading startDate:endDate:errorOut:;
- (uint64_t)_processTraceUsingKtraceLoggingDataSource:()TraceReading startDate:endDate:errorOut:;
- (uint64_t)processTraceFileWithPath:()TraceReading errorOut:;
- (uint64_t)processTraceFileWithPath:()TraceReading startDate:endDate:errorOut:;
@end

@implementation SignpostSupportObjectExtractor(TraceReading)

- (uint64_t)_processTraceUsingKtraceLoggingDataSource:()TraceReading startDate:endDate:errorOut:
{
  id v10 = a4;
  id v11 = a5;
  v12 = (objc_class *)MEMORY[0x263F52730];
  id v13 = a3;
  v14 = (void *)[[v12 alloc] initWithDataSourceDelegate:v13];

  if (v14)
  {
    uint64_t v15 = [a1 _processLogEventStream:v14 startDate:v10 endDate:v11 errorOut:a6];
  }
  else if (a6)
  {
    [MEMORY[0x263F087E8] errorWithCode:8 description:@"Failed to instantiate deserializing stream"];
    uint64_t v15 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (uint64_t)_processTraceFileWithPath:()TraceReading startDate:endDate:errorOut:
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  [a1 _processingStarting];
  if (([a1 _hasProcessingBlock] & 1) == 0)
  {
    if (a6)
    {
      [MEMORY[0x263F087E8] errorWithCode:8 description:@"No processing blocks specified"];
      uint64_t v16 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
LABEL_12:
    uint64_t v16 = 0;
    goto LABEL_17;
  }
  if (a6) {
    *a6 = 0;
  }
  id v13 = v10;
  [v13 UTF8String];
  uint64_t v14 = ktrace_file_open();
  if (!v14)
  {
    if (a6)
    {
      v17 = (void *)MEMORY[0x263F087E8];
      v18 = NSString;
      v19 = __error();
      v20 = [v18 stringWithFormat:@"Could not open trace file '%@' due to error: %s", v13, strerror(*v19)];
      *a6 = [v17 errorWithCode:7 description:v20];
    }
    [a1 finishProcessingSerializedData];
    goto LABEL_12;
  }
  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x263F8AEB8]) initWithKtraceFile:v14];
  if (v15)
  {
    uint64_t v16 = [a1 _processTraceUsingKtraceLoggingDataSource:v15 startDate:v11 endDate:v12 errorOut:a6];
    ktrace_file_close();
  }
  else
  {
    char v21 = [a1 _hasSignpostProcessingBlock];
    v22 = [a1 logMessageProcessingBlock];
    BOOL v23 = v22 != 0;

    uint64_t v28 = MEMORY[0x263EF8330];
    LOBYTE(v30) = v21;
    BYTE1(v30) = v23;
    v29 = a1;
    int v24 = ktrace_file_iterate();
    ktrace_file_close();
    [a1 finishProcessingSerializedData];
    uint64_t v16 = v24 == 0;
    if (a6 && v24)
    {
      v25 = (void *)MEMORY[0x263F087E8];
      v26 = [NSString stringWithFormat:@"Could not process trace file '%@' due to error: %s", v13, strerror(v24), v28, 3221225472, __101__SignpostSupportObjectExtractor_TraceReading___processTraceFileWithPath_startDate_endDate_errorOut___block_invoke, &unk_264488168, v29, v30];
      *a6 = [v25 errorWithCode:7 description:v26];
    }
  }

LABEL_17:
  return v16;
}

- (uint64_t)processTraceFileWithPath:()TraceReading errorOut:
{
  return [a1 _processTraceFileWithPath:a3 startDate:0 endDate:0 errorOut:a4];
}

- (uint64_t)processTraceFileWithPath:()TraceReading startDate:endDate:errorOut:
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = v12;
  if (v11 && v12 && [v11 compare:v12] == 1)
  {
    if (a6)
    {
      [MEMORY[0x263F087E8] errorWithCode:8 description:@"Start date > end date"];
      uint64_t v14 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v14 = 0;
    }
  }
  else
  {
    uint64_t v14 = [a1 _processTraceFileWithPath:v10 startDate:v11 endDate:v13 errorOut:a6];
  }

  return v14;
}

@end