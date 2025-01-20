@interface WBSHistoryExporter
+ (id)dataType;
+ (id)xpcInterface;
+ (unint64_t)schemaVersion;
- (WBSHistoryExporter)initWithJSONWriter:(id)a3 error:(id *)a4;
- (void)addEntryWithURLString:(id)a3 visitTime:(double)a4 title:(id)a5 loadSuccessful:(BOOL)a6 httpGet:(BOOL)a7 redirectSourceURLString:(id)a8 redirectSourceVisitTime:(double)a9 redirectDestinationURLString:(id)a10 redirectDestinationVisitTime:(double)a11 visitCount:(unint64_t)a12;
- (void)finishWithCompletionHandler:(id)a3;
@end

@implementation WBSHistoryExporter

+ (id)xpcInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1090C80];
}

+ (id)dataType
{
  return @"history";
}

+ (unint64_t)schemaVersion
{
  return 1;
}

- (WBSHistoryExporter)initWithJSONWriter:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSHistoryExporter;
  v7 = [(WBSJSONExporter *)&v10 initWithJSONWriter:v6 error:a4];
  if (v7 && [v6 beginArrayForKey:@"history" error:a4]) {
    v8 = v7;
  }
  else {
    v8 = 0;
  }

  return v8;
}

- (void)addEntryWithURLString:(id)a3 visitTime:(double)a4 title:(id)a5 loadSuccessful:(BOOL)a6 httpGet:(BOOL)a7 redirectSourceURLString:(id)a8 redirectSourceVisitTime:(double)a9 redirectDestinationURLString:(id)a10 redirectDestinationVisitTime:(double)a11 visitCount:(unint64_t)a12
{
  id v19 = a5;
  id v20 = a8;
  id v21 = a10;
  id v22 = a3;
  v23 = [(WBSJSONExporter *)self jsonWriter];
  id v65 = 0;
  [v23 appendAndBeginObjectWithError:&v65];
  id v24 = v65;

  v25 = [(WBSJSONExporter *)self jsonWriter];
  id v64 = v24;
  [v25 addEntry:v22 forKey:@"url" error:&v64];

  id v26 = v64;
  v27 = [(WBSJSONExporter *)self jsonWriter];
  v28 = [NSNumber numberWithUnsignedLongLong:WBSTimeIntervalToUnixTimeInMicroseconds(a4)];
  id v63 = v26;
  [v27 addEntry:v28 forKey:@"time_usec" error:&v63];
  id v29 = v63;

  v30 = [(WBSJSONExporter *)self jsonWriter];
  v31 = [NSNumber numberWithUnsignedInteger:a12];
  id v62 = v29;
  [v30 addEntry:v31 forKey:@"visit_count" error:&v62];
  id v32 = v62;

  v33 = v19;
  if ([v19 length])
  {
    v34 = [(WBSJSONExporter *)self jsonWriter];
    id v61 = v32;
    [v34 addEntry:v19 forKey:@"title" error:&v61];
    id v35 = v61;

    id v32 = v35;
  }
  v36 = v20;
  if (!a6)
  {
    v37 = [(WBSJSONExporter *)self jsonWriter];
    id v60 = v32;
    [v37 addEntry:MEMORY[0x1E4F1CC38] forKey:@"latest_visit_was_load_failure" error:&v60];
    id v38 = v60;

    id v32 = v38;
  }
  if (!a7)
  {
    v39 = [(WBSJSONExporter *)self jsonWriter];
    id v59 = v32;
    [v39 addEntry:MEMORY[0x1E4F1CC28] forKey:@"latest_visit_was_http_get" error:&v59];
    id v40 = v59;

    id v32 = v40;
  }
  if ([v36 length])
  {
    v41 = [(WBSJSONExporter *)self jsonWriter];
    id v58 = v32;
    [v41 addEntry:v36 forKey:@"source_url" error:&v58];
    id v42 = v58;

    v43 = [(WBSJSONExporter *)self jsonWriter];
    v44 = [NSNumber numberWithUnsignedLongLong:WBSTimeIntervalToUnixTimeInMicroseconds(a9)];
    id v57 = v42;
    [v43 addEntry:v44 forKey:@"source_time_usec" error:&v57];
    id v32 = v57;
  }
  if ([v21 length])
  {
    v45 = [(WBSJSONExporter *)self jsonWriter];
    id v56 = v32;
    [v45 addEntry:v21 forKey:@"destination_url" error:&v56];
    id v46 = v56;

    v47 = [(WBSJSONExporter *)self jsonWriter];
    v48 = [NSNumber numberWithUnsignedLongLong:WBSTimeIntervalToUnixTimeInMicroseconds(a11)];
    id v55 = v46;
    [v47 addEntry:v48 forKey:@"destination_time_usec" error:&v55];
    id v32 = v55;
  }
  v49 = [(WBSJSONExporter *)self jsonWriter];
  id v54 = v32;
  [v49 closeCurrentEntryWithError:&v54];
  id v50 = v54;

  if (v50)
  {
    v51 = WBS_LOG_CHANNEL_PREFIXExport();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
      -[WBSHistoryExporter addEntryWithURLString:visitTime:title:loadSuccessful:httpGet:redirectSourceURLString:redirectSourceVisitTime:redirectDestinationURLString:redirectDestinationVisitTime:visitCount:]((uint64_t)v50, v51);
    }
  }
}

- (void)finishWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__WBSHistoryExporter_finishWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E615BAF0;
  id v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)WBSHistoryExporter;
  id v5 = v4;
  [(WBSJSONExporter *)&v6 finishWithCompletionHandler:v7];
}

void __50__WBSHistoryExporter_finishWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = WBS_LOG_CHANNEL_PREFIXExport();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __50__WBSHistoryExporter_finishWithCompletionHandler___block_invoke_cold_1((uint64_t)v3, v4);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)addEntryWithURLString:(uint64_t)a1 visitTime:(NSObject *)a2 title:loadSuccessful:httpGet:redirectSourceURLString:redirectSourceVisitTime:redirectDestinationURLString:redirectDestinationVisitTime:visitCount:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B728F000, a2, OS_LOG_TYPE_ERROR, "Failed to serialize history entry: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __50__WBSHistoryExporter_finishWithCompletionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B728F000, a2, OS_LOG_TYPE_ERROR, "Failed to finalize history export: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end