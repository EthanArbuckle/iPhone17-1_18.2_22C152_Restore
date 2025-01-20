@interface ATSLoggingProvider
- (BOOL)shouldAmendWithFile:(ktrace_file *)a3 error:(id *)a4;
- (BOOL)shouldInitializeWithLogger:(id)a3 machine:(ktrace_machine *)a4 options:(id)a5 error:(id *)a6;
- (BOOL)shouldStartTracingWithConfiguration:(ktrace_config *)a3 error:(id *)a4;
- (id)describeChunk:(ktrace_chunk *)a3;
- (void)_appendLogsToFile:(ktrace_file *)a3;
- (void)_findStartAndEndTimeForFile:(ktrace_file *)a3;
- (void)postprocessingCompleteWithFile:(ktrace_file *)a3;
@end

@implementation ATSLoggingProvider

- (BOOL)shouldInitializeWithLogger:(id)a3 machine:(ktrace_machine *)a4 options:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  objc_storeStrong((id *)&self->_logger, a3);
  self->_streamingFlags = 615;
  v12 = [v11 objectForKeyedSubscript:@"predicate"];
  if (v12)
  {
    v13 = +[NSPredicate predicateWithFormat:v12];
    if (!v13)
    {
      if (a6)
      {
        uint64_t v32 = 0;
        v25 = @"Passed predicate is invalid ('%@'); logging will be disabled";
        goto LABEL_15;
      }
LABEL_16:
      BOOL v30 = 0;
      goto LABEL_17;
    }
    filterPredicate = self->_filterPredicate;
    self->_filterPredicate = v13;
  }
  v22 = [v11 objectForKeyedSubscript:@"archive"];
  archivePath = self->_archivePath;
  self->_archivePath = v22;

  v24 = [v11 objectForKeyedSubscript:@"redact-content"];
  self->_shouldRedactLogContent = v24 != 0;

  if (self->_shouldRedactLogContent && !&_SignpostSupportAllowlistedStringSetForCurrentDevice)
  {
    if (a6)
    {
      v25 = @"Cannot redact the content, allow-list is not available; logging will be disabled";
LABEL_15:
      sub_221C(v25, v14, v15, v16, v17, v18, v19, v20, v32);
      BOOL v30 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  endDate = self->_endDate;
  self->_endDate = 0;

  startDate = self->_startDate;
  self->_startDate = 0;

  v28 = [v11 objectForKeyedSubscript:@"enable-logs"];

  if (v28) {
    self->_streamingFlags &= ~0x200uLL;
  }
  v29 = [v11 objectForKeyedSubscript:@"disable-signposts"];

  if (v29)
  {
    self->_streamingFlags &= ~0x20uLL;
    if (!v28) {
      goto LABEL_16;
    }
  }
  BOOL v30 = 1;
LABEL_17:

  return v30;
}

- (BOOL)shouldAmendWithFile:(ktrace_file *)a3 error:(id *)a4
{
  v6 = +[NSFileManager defaultManager];
  v13 = v6;
  archivePath = self->_archivePath;
  if (!archivePath)
  {
    if (a4)
    {
      uint64_t v18 = @"Missing logarchive path. Use --Logging:archive=[path] to pass it";
LABEL_8:
      sub_221C(v18, v7, (uint64_t)archivePath, v8, v9, v10, v11, v12, v20);
      BOOL v17 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
LABEL_9:
    BOOL v17 = 0;
    goto LABEL_10;
  }
  if ((objc_msgSend(v6, "fileExistsAtPath:") & 1) == 0)
  {
    if (a4)
    {
      uint64_t v18 = @"Passed logarchive path doesn't exist";
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  uint64_t v15 = +[NSURL fileURLWithPath:self->_archivePath];
  archiveURL = self->_archiveURL;
  self->_archiveURL = v15;

  BOOL v17 = 1;
LABEL_10:

  return v17;
}

- (BOOL)shouldStartTracingWithConfiguration:(ktrace_config *)a3 error:(id *)a4
{
  return 1;
}

- (void)postprocessingCompleteWithFile:(ktrace_file *)a3
{
  -[ATSLoggingProvider _findStartAndEndTimeForFile:](self, "_findStartAndEndTimeForFile:");
  if (self->_startDate && self->_endDate)
  {
    [(ATSLoggingProvider *)self _appendLogsToFile:a3];
  }
  else
  {
    logger = self->_logger;
    [(KTProviderLogger *)logger warnWithMessage:@"os_signpost and os_log data will be missing from trace, due to error in extracting trace file start and end times."];
  }
}

- (void)_findStartAndEndTimeForFile:(ktrace_file *)a3
{
  if (ktrace_file_earliest_walltime() || ktrace_file_latest_walltime())
  {
    v4 = __error();
    endDate = +[NSString stringWithFormat:@"Failed to capture earliest trace timestamp with error: %s", strerror(*v4)];
    [(KTProviderLogger *)self->_logger failWithReason:endDate];
  }
  else
  {
    v6 = +[NSDate dateWithTimeIntervalSince1970:(double)0 / 1000000.0 + (double)0];
    startDate = self->_startDate;
    self->_startDate = v6;

    uint64_t v8 = +[NSDate dateWithTimeIntervalSince1970:(double)0 / 1000000.0 + (double)0];
    endDate = self->_endDate;
    self->_endDate = v8;
  }
}

- (void)_appendLogsToFile:(ktrace_file *)a3
{
  if (self->_archiveURL) {
    +[OSLogEventStore storeWithArchiveURL:](OSLogEventStore, "storeWithArchiveURL:");
  }
  else {
  v5 = +[OSLogEventStore localStore];
  }
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = sub_283C;
  v27 = sub_284C;
  id v28 = 0;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_2854;
  v22[3] = &unk_41E8;
  v22[4] = self;
  v22[5] = &v23;
  [v5 prepareWithCompletionHandler:v22];
  if (v24[5])
  {
    dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
    id v7 = objc_alloc((Class)OSLogEventSerializer);
    uint64_t v8 = v24[5];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_294C;
    v21[3] = &unk_4210;
    v21[4] = self;
    v21[5] = a3;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_2A0C;
    v18[3] = &unk_4238;
    v18[4] = self;
    uint64_t v20 = a3;
    uint64_t v9 = v6;
    uint64_t v19 = v9;
    id v10 = [v7 initWithSource:v8 dataProcessingBlock:v21 completionBlock:v18];
    [v10 setFlags:self->_streamingFlags];
    [v10 setFilterPredicate:self->_filterPredicate];
    if (self->_shouldRedactLogContent)
    {
      SignpostSupportAllowlistedStringSetForCurrentDevice();
      v13 = _NSConcreteStackBlock;
      uint64_t v14 = 3221225472;
      uint64_t v15 = sub_2B04;
      uint64_t v16 = &unk_4260;
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      id v11 = v17;
      uint64_t v12 = objc_retainBlock(&v13);
    }
    else
    {
      uint64_t v12 = 0;
    }
    objc_msgSend(v10, "setArgumentRedactionBlock:", v12, v13, v14, v15, v16);
    [v10 serializeFromDate:self->_startDate toDate:self->_endDate];
    dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  }
  _Block_object_dispose(&v23, 8);
}

- (id)describeChunk:(ktrace_chunk *)a3
{
  int v3 = ktrace_chunk_tag();
  CFStringRef v4 = @"log metadata";
  if (v3 != 32786) {
    CFStringRef v4 = 0;
  }
  if (v3 == 32785) {
    return @"log content";
  }
  else {
    return (id)v4;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_archiveURL, 0);
  objc_storeStrong((id *)&self->_archivePath, 0);
  objc_storeStrong((id *)&self->_filterPredicate, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);

  objc_storeStrong((id *)&self->_logger, 0);
}

@end