@interface lite_job_t
+ (id)gatherLogInfo;
+ (void)cancelJob:(int)a3;
+ (void)checkJobsOnMainQueue;
+ (void)getAllJobsCompletionHandler:(id)a3;
+ (void)getJobAttributes:(int)a3 includeThumbnail:(BOOL)a4 completionHandler:(id)a5;
- (BOOL)_isCanceled:(id)a3;
- (BOOL)has_job_stream_http;
- (BOOL)is_canceled;
- (CGDataConsumer)createDataConsumer;
- (IPPSession)ippSession;
- (JobRequestAttributes_Base)request_attrs;
- (NSData)jobPassword;
- (NSData)thumbnail;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)jobHoldUntil;
- (NSString)jobPasswordEncryption;
- (NSString)printer_driverformat;
- (NSString)spoolDocumentFilename;
- (NSString)spoolDocumentFormat;
- (PKPrintSettings)printSettings;
- (id)addJobAndAllowToProceed;
- (id)addJobAndReturnLogMessageOnFailure;
- (id)allowThisJobToProceedNoLock;
- (id)getJobAttributes:(BOOL)a3;
- (id)getLogCategory;
- (id)getLogLeader;
- (id)logInfo;
- (int)closeDriver:(lite_driver_s *)a3;
- (int)destination_job_id;
- (int)numberOfSheetsPerCopy;
- (int)openDriver:(lite_driver_s *)a3 format:(id)a4 orient:(int)a5 num_sheets:(int)a6 passthru:(int)a7;
- (int)pdf_pages;
- (int)printd_job_id;
- (int)printer_preferred_landscape;
- (int)sheetsCompleted;
- (int64_t)completedTime;
- (int64_t)createdTime;
- (int64_t)localJobState;
- (int64_t)readyTime;
- (lite_job_t)initWithRequestParams:(id)a3 session:(id)a4 printer:(id)a5 printSettings:(id)a6;
- (lite_printer_t)printer;
- (unint64_t)payloadSent;
- (unint64_t)payloadTotal;
- (unint64_t)printTriesCount;
- (void)_clearCancelFlag:(id)a3;
- (void)_setCancelFlag:(id)a3;
- (void)_setupCancelSource;
- (void)_setupCancelSource0;
- (void)_withActivity:(id)a3;
- (void)_workAdded:(unint64_t)a3;
- (void)cancelNoLock;
- (void)cancelThisJob;
- (void)clear_cancel_flag;
- (void)dealloc;
- (void)finishJob:(int64_t)a3;
- (void)make_progress:(int64_t)a3;
- (void)notifyJobHeldPinRequired:(BOOL)a3 logMessage:(id)a4;
- (void)postGlobalNotification:(unsigned int)a3;
- (void)postGlobalNotification:(unsigned int)a3 logMsg:(id)a4;
- (void)resetJob;
- (void)setCompletedTime:(int64_t)a3;
- (void)setDestination_job_id:(int)a3;
- (void)setJobHoldUntil:(id)a3;
- (void)setJobPassword:(id)a3;
- (void)setJobPasswordEncryption:(id)a3;
- (void)setLocalJobState:(int64_t)a3;
- (void)setNumberOfSheetsPerCopy:(int)a3;
- (void)setPayloadSent:(unint64_t)a3;
- (void)setPayloadTotal:(unint64_t)a3;
- (void)setPdf_pages:(int)a3;
- (void)setPrintTriesCount:(unint64_t)a3;
- (void)setPrinter:(id)a3;
- (void)setReadyTime:(int64_t)a3;
- (void)setSheetsCompleted:(int)a3;
- (void)setSpoolDocumentFilename:(id)a3;
- (void)setSpoolDocumentFormat:(id)a3;
- (void)set_cancel_flag;
- (void)set_processing;
- (void)updateProgressAndPostNotification:(int)a3 logMsg:(id)a4;
- (void)updateSheetsAndPostNotification:(int)a3 logMsg:(id)a4;
- (void)updateThumbnail:(id)a3;
@end

@implementation lite_job_t

+ (void)checkJobsOnMainQueue
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v2 = _PKLogCategory(PKLogCategoryProgress[0]);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Checking for jobs to print.", buf, 2u);
  }

  time_t v3 = time(0);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v4 = (id)qword_1000C8AE8;
  int v5 = 0;
  id v6 = [v4 countByEnumeratingWithState:&v50 objects:v56 count:16];
  if (v6)
  {
    v7 = 0;
    uint64_t v8 = *(void *)v51;
    do
    {
      v9 = 0;
      v10 = v7;
      do
      {
        if (*(void *)v51 != v8) {
          objc_enumerationMutation(v4);
        }
        v7 = *(id *)(*((void *)&v50 + 1) + 8 * (void)v9);

        if (v7[48]) {
          ++v5;
        }
        v9 = (char *)v9 + 1;
        v10 = v7;
      }
      while (v6 != v9);
      id v6 = [v4 countByEnumeratingWithState:&v50 objects:v56 count:16];
    }
    while (v6);
  }
  v11 = 0;
  uint64_t v12 = v3 - 300;
  uint64_t v41 = v5;
  while (1)
  {
    if (MaxProcessingJobs >= 1)
    {
      v13 = (char *)[(id)qword_1000C8AE8 count];
      if ((unint64_t)&v13[-v41] >= MaxProcessingJobs) {
        break;
      }
    }
    pthread_mutex_lock(&stru_1000C8530);
    if (MaxProcessingJobs >= 1)
    {
      v14 = (char *)[(id)qword_1000C8AE8 count];
      if ((unint64_t)&v14[-v41] >= MaxProcessingJobs)
      {
        v15 = v11;
        goto LABEL_36;
      }
    }
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    v15 = (lite_job_t *)(id)qword_1000C8AE0;
    id v16 = [(lite_job_t *)v15 countByEnumeratingWithState:&v46 objects:v55 count:16];
    if (!v16)
    {
LABEL_34:

LABEL_36:
      v11 = 0;
      goto LABEL_37;
    }
    uint64_t v17 = *(void *)v47;
LABEL_20:
    uint64_t v18 = 0;
    while (1)
    {
      if (*(void *)v47 != v17) {
        objc_enumerationMutation(v15);
      }
      v19 = (lite_job_t *)*(id *)(*((void *)&v46 + 1) + 8 * v18);

      v11 = v19;
      v20 = [(lite_job_t *)v19 printer];
      v21 = [v20 currentJob];
      if (v21 || (id)[(lite_job_t *)v11 localJobState] != (id)3)
      {
      }
      else
      {
        v22 = [(lite_job_t *)v11 spoolDocumentFilename];
        BOOL v23 = v22 == 0;

        if (!v23) {
          break;
        }
      }
      if ((id)[(lite_job_t *)v11 localJobState] == (id)4
        && !v11->release_wait
        && [(lite_job_t *)v11 readyTime]
        && [(lite_job_t *)v11 readyTime] < v12)
      {
        break;
      }
      if (v16 == (id)++v18)
      {
        id v16 = [(lite_job_t *)v15 countByEnumeratingWithState:&v46 objects:v55 count:16];
        if (v16) {
          goto LABEL_20;
        }
        goto LABEL_34;
      }
    }
LABEL_37:

    pthread_mutex_unlock(&stru_1000C8530);
    if (!v11) {
      break;
    }
    if ((id)[(lite_job_t *)v11 localJobState] == (id)4)
    {
      [(lite_job_t *)v11 finishJob:8];
    }
    else
    {
      [(lite_job_t *)v11 setPrintTriesCount:(char *)[(lite_job_t *)v11 printTriesCount] + 1];
      pthread_mutex_lock(&stru_1000C8530);
      [(id)qword_1000C8AE8 addObject:v11];
      v24 = [(lite_job_t *)v11 printer];
      [v24 setCurrentJob:v11];

      pthread_mutex_unlock(&stru_1000C8530);
      liteDoPrint(v11);
    }
  }
  pthread_mutex_lock(&stru_1000C8530);
  time_t v25 = time(0);
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v26 = (id)qword_1000C8AD8;
  v27 = 0;
  v28 = 0;
  id v29 = [v26 countByEnumeratingWithState:&v42 objects:v54 count:16];
  if (v29)
  {
    uint64_t v30 = *(void *)v43;
    do
    {
      for (i = 0; i != v29; i = (char *)i + 1)
      {
        if (*(void *)v43 != v30) {
          objc_enumerationMutation(v26);
        }
        v32 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        if ((uint64_t)[v32 localJobState] >= 6)
        {
          v33 = (char *)[v32 completedTime];
          if ((uint64_t)(v33 + 60) <= v25)
          {
            if (!v28) {
              v28 = objc_opt_new();
            }
            [v28 addObject:v32];
          }
          else if ((uint64_t)(v33 + 60) < (uint64_t)v27 || v27 == 0)
          {
            v27 = v33 + 60;
          }
        }
      }
      id v29 = [v26 countByEnumeratingWithState:&v42 objects:v54 count:16];
    }
    while (v29);
  }

  if ([v28 count])
  {
    v35 = _PKLogCategory(PKLogCategoryProgress[0]);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v58 = v28;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Finalizing %{public}@", buf, 0xCu);
    }

    [(id)qword_1000C8AD8 removeObjectsInArray:v28];
  }
  if (v27)
  {
    if ((uint64_t)v27 >= v25) {
      int64_t v36 = 1000000000 * (void)&v27[-v25];
    }
    else {
      int64_t v36 = 1000000000;
    }
    dispatch_time_t v37 = dispatch_time(0, v36);
    dispatch_after(v37, (dispatch_queue_t)&_dispatch_main_q, &stru_1000A04C8);
  }
  if (![(id)qword_1000C8AE0 count])
  {
    v38 = (id)qword_1000C8AF0;
    v39 = (void *)qword_1000C8AF0;
    qword_1000C8AF0 = 0;

    if (v38)
    {
      v40 = _PKLogCategory(PKLogCategoryProgress[0]);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v58 = v38;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Disassociating from JobTimer and related transactions: %{public}@", buf, 0xCu);
      }

      dispatch_source_cancel(v38);
    }
  }
  pthread_mutex_unlock(&stru_1000C8530);
}

- (id)addJobAndReturnLogMessageOnFailure
{
  pthread_mutex_lock(&stru_1000C8530);
  [(lite_job_t *)self setReadyTime:time(0)];
  sub_10001A3FC();
  if (MaxJobs >= 1 && (id v3 = [(id)qword_1000C8AD8 count], (unint64_t)v3 >= MaxJobs))
  {
    id v6 = [(id)qword_1000C8AD8 count];
    int v5 = +[NSString stringWithFormat:@"Unable to create job: Too many jobs (%d >= %d).", v6, MaxJobs];
    pthread_mutex_unlock(&stru_1000C8530);
  }
  else if (MaxActiveJobs >= 1 {
         && (id v4 = [(id)qword_1000C8AE0 count], (unint64_t)v4 >= MaxActiveJobs))
  }
  {
    id v7 = [(id)qword_1000C8AE0 count];
    int v5 = +[NSString stringWithFormat:@"Unable to create job: Too many active jobs (%d >= %d).", v7, MaxActiveJobs];
    pthread_mutex_unlock(&stru_1000C8530);
  }
  else
  {
    [(id)qword_1000C8AD8 addObject:self];
    [(id)qword_1000C8AE0 addObject:self];
    pthread_mutex_unlock(&stru_1000C8530);
    [(lite_job_t *)self postGlobalNotification:4096 logMsg:@"Job created."];
    int v5 = 0;
  }

  return v5;
}

- (void)updateThumbnail:(id)a3
{
}

- (void)notifyJobHeldPinRequired:(BOOL)a3 logMessage:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  pthread_mutex_lock(&stru_1000C8530);
  [(lite_job_t *)self setLocalJobState:4];
  self->release_wait = 1;
  id v6 = [(lite_job_t *)self printer];
  [v6 setCurrentJob:0];

  [(lite_job_t *)self postGlobalNotification:2048 logMsg:v7];
  if (v4) {
    liteNotifyPINRequired(self);
  }
  pthread_mutex_unlock(&stru_1000C8530);
}

- (void)set_processing
{
  [(lite_job_t *)self setReadyTime:time(0)];
  [(lite_job_t *)self setLocalJobState:5];

  [(lite_job_t *)self postGlobalNotification:2048 logMsg:@"Job printing."];
}

- (void)updateSheetsAndPostNotification:(int)a3 logMsg:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  [(lite_job_t *)self setSheetsCompleted:v4];
  self->_mediaProgress = 0;
  [(lite_job_t *)self postGlobalNotification:0x10000 logMsg:v6];
}

- (void)updateProgressAndPostNotification:(int)a3 logMsg:(id)a4
{
  self->_mediaProgress = a3;
  [(lite_job_t *)self postGlobalNotification:0x10000 logMsg:a4];
}

- (id)allowThisJobToProceedNoLock
{
  if ((id)[(lite_job_t *)self localJobState] != (id)4) {
    return @"Job is in the wrong state to start";
  }
  [(lite_job_t *)self setLocalJobState:3];
  [(lite_job_t *)self setJobHoldUntil:0];
  [(lite_job_t *)self postGlobalNotification:2048 logMsg:@"Job released."];
  [(lite_job_t *)self postGlobalNotification:0x8000 logMsg:@"Job released."];
  id result = (id)qword_1000C8AF0;
  if (qword_1000C8AF0)
  {
    dispatch_source_set_timer((dispatch_source_t)qword_1000C8AF0, 0, 0xFFFFFFFFFFFFFFFFLL, 0);
    return 0;
  }
  return result;
}

- (void)resetJob
{
  pthread_mutex_lock(&stru_1000C8530);
  [(id)qword_1000C8AE8 removeObject:self];
  [(lite_job_t *)self setLocalJobState:3];
  [(lite_job_t *)self clear_cancel_flag];
  [(lite_job_t *)self setReadyTime:0];
  [(lite_job_t *)self setSheetsCompleted:0];
  id v3 = [(lite_job_t *)self printer];
  unsigned __int8 v4 = [v3 reasons];

  if ((v4 & 0x20) != 0)
  {
    pthread_mutex_unlock(&stru_1000C8530);
    sleep(3u);
    pthread_mutex_lock(&stru_1000C8530);
  }
  int v5 = [(lite_job_t *)self printer];
  id v6 = [(lite_job_t *)self printer];
  objc_msgSend(v5, "setReasonsBits:", (unint64_t)objc_msgSend(v6, "reasons") & 0xFFE6BFDD);

  [(lite_job_t *)self setDestination_job_id:0];
  [(lite_job_t *)self postGlobalNotification:2048 logMsg:@"Job restarting."];
  id v7 = [(lite_job_t *)self printer];
  [v7 setCurrentJob:0];
  uint64_t v8 = _PKLogCategory(PKLogCategoryProgress[0]);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v9 = [(lite_job_t *)self printd_job_id];
    if (self) {
      unsigned int v10 = [(lite_job_t *)self destination_job_id];
    }
    else {
      unsigned int v10 = -1;
    }
    v13[0] = 67109376;
    v13[1] = v9;
    __int16 v14 = 1024;
    unsigned int v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] Restarting JobTimer to this job to go again", (uint8_t *)v13, 0xEu);
  }

  v11 = qword_1000C8AF0;
  if (qword_1000C8AF0)
  {
    dispatch_time_t v12 = dispatch_time(0, 1000000000);
    dispatch_source_set_timer(v11, v12, 0xFFFFFFFFFFFFFFFFLL, 0x2540BE400uLL);
  }
  else
  {
    sub_10001A3FC();
  }
  pthread_mutex_unlock(&stru_1000C8530);
}

- (lite_job_t)initWithRequestParams:(id)a3 session:(id)a4 printer:(id)a5 printSettings:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v15.receiver = self;
  v15.super_class = (Class)lite_job_t;
  if ([(lite_job_t *)&v15 init]) {
    operator new();
  }

  return 0;
}

- (id)getLogLeader
{
  return +[NSString stringWithFormat:@"%@<%p - client id %d, job id %d>", objc_opt_class(), self, [(IPPSession *)self->_ippSession clientID], self->_printd_job_id];
}

- (id)getLogCategory
{
  return PKLogCategoryProgress[0];
}

- (void)dealloc
{
  id v3 = _PKLogCategory(PKLogCategoryProgress[0]);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v4 = [(lite_job_t *)self printd_job_id];
    if (self) {
      unsigned int v5 = [(lite_job_t *)self destination_job_id];
    }
    else {
      unsigned int v5 = -1;
    }
    *(_DWORD *)buf = 67109376;
    unsigned int v17 = v4;
    __int16 v18 = 1024;
    unsigned int v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] Freeing job.", buf, 0xEu);
  }

  id v6 = [(lite_job_t *)self spoolDocumentFilename];
  BOOL v7 = v6 == 0;

  if (PreserveJobFiles) {
    char v8 = 1;
  }
  else {
    char v8 = v7;
  }
  if ((v8 & 1) == 0)
  {
    unsigned int v9 = _PKLogCategory(PKLogCategoryProgress[0]);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v10 = [(lite_job_t *)self printd_job_id];
      if (self) {
        unsigned int v11 = [(lite_job_t *)self destination_job_id];
      }
      else {
        unsigned int v11 = -1;
      }
      id v12 = [(lite_job_t *)self spoolDocumentFilename];
      *(_DWORD *)buf = 67109634;
      unsigned int v17 = v10;
      __int16 v18 = 1024;
      unsigned int v19 = v11;
      __int16 v20 = 2112;
      v21 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] Removing \"%@\".", buf, 0x18u);
    }
    id v13 = [(lite_job_t *)self spoolDocumentFilename];
    unlink((const char *)[v13 UTF8String]);
  }
  request_attrs = self->_request_attrs;
  if (request_attrs) {
    (*((void (**)(JobRequestAttributes_Base *))request_attrs->var0 + 3))(request_attrs);
  }
  v15.receiver = self;
  v15.super_class = (Class)lite_job_t;
  [(lite_job_t *)&v15 dealloc];
}

- (void)finishJob:(int64_t)a3
{
  unsigned int v5 = _PKLogCategory(PKLogCategoryProgress[0]);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v6 = [(lite_job_t *)self printd_job_id];
    if (self) {
      unsigned int v7 = [(lite_job_t *)self destination_job_id];
    }
    else {
      unsigned int v7 = -1;
    }
    *(_DWORD *)buf = 67109632;
    unsigned int v16 = v6;
    __int16 v17 = 1024;
    unsigned int v18 = v7;
    __int16 v19 = 1024;
    int v20 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] Finishing job, new job-state %d", buf, 0x14u);
  }

  pthread_mutex_lock(&stru_1000C8530);
  [(id)qword_1000C8AE0 removeObject:self];
  [(id)qword_1000C8AE8 removeObject:self];
  [(lite_job_t *)self setLocalJobState:a3];
  [(lite_job_t *)self setCompletedTime:time(0)];
  char v8 = "completed.";
  if (a3 == 8) {
    char v8 = "aborted.";
  }
  if (a3 == 7) {
    char v8 = "canceled.";
  }
  unsigned int v9 = +[NSString stringWithFormat:@"Job %s", v8];
  [(lite_job_t *)self postGlobalNotification:0x2000 logMsg:v9];

  unsigned int v10 = [(lite_job_t *)self printer];
  [v10 setCurrentJob:0];

  cancel_source = self->_cancel_source;
  if (cancel_source)
  {
    self->_cancel_source = 0;
    id v12 = cancel_source;

    dispatch_source_cancel(v12);
  }
  if (qword_1000C8AF0) {
    dispatch_source_set_timer((dispatch_source_t)qword_1000C8AF0, 0, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
  if (self->_jobActivity)
  {
    os_activity_scope_leave(&self->_jobActivityState);
    jobActivity = self->_jobActivity;
    self->_jobActivity = 0;
  }
  jobTransaction = self->_jobTransaction;
  if (jobTransaction)
  {
    self->_jobTransaction = 0;
  }
  pthread_mutex_unlock(&stru_1000C8530);
}

- (void)_withActivity:(id)a3
{
  id v4 = a3;
  jobActivity = self->_jobActivity;
  if (!jobActivity) {
    jobActivity = (OS_os_activity *)&_os_activity_current;
  }
  unsigned int v7 = jobActivity;
  if (self->_jobTransaction) {
    os_transaction_needs_more_time();
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001B780;
  v10[3] = &unk_100095B70;
  id v8 = v4;
  unsigned int v11 = v7;
  id v12 = v8;
  unsigned int v9 = v7;
  os_activity_apply(v9, v10);
}

- (void)_workAdded:(unint64_t)a3
{
  id v4 = (char *)[(lite_job_t *)self payloadSent] + a3;

  [(lite_job_t *)self setPayloadSent:v4];
}

- (BOOL)_isCanceled:(id)a3
{
  intptr_t v4 = dispatch_source_testcancel((dispatch_source_t)a3);
  if (v4)
  {
    unsigned int v5 = _PKLogCategory(PKLogCategoryProgress[0]);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v6 = [(lite_job_t *)self printd_job_id];
      if (self) {
        unsigned int v7 = [(lite_job_t *)self destination_job_id];
      }
      else {
        unsigned int v7 = -1;
      }
      v9[0] = 67109376;
      v9[1] = v6;
      __int16 v10 = 1024;
      unsigned int v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] job shows as canceled", (uint8_t *)v9, 0xEu);
    }
  }
  return v4 != 0;
}

- (void)_setCancelFlag:(id)a3
{
  intptr_t v4 = a3;
  unsigned int v5 = _PKLogCategory(PKLogCategoryProgress[0]);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v6 = [(lite_job_t *)self printd_job_id];
    if (self) {
      unsigned int v7 = [(lite_job_t *)self destination_job_id];
    }
    else {
      unsigned int v7 = -1;
    }
    v8[0] = 67109376;
    v8[1] = v6;
    __int16 v9 = 1024;
    unsigned int v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] job being canceled", (uint8_t *)v8, 0xEu);
  }

  dispatch_source_cancel(v4);
}

- (void)_clearCancelFlag:(id)a3
{
  intptr_t v4 = (OS_dispatch_source *)a3;
  if (self->_cancel_source == v4)
  {
    __int16 v9 = _PKLogCategory(PKLogCategoryProgress[0]);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 67109634;
      unsigned int v11 = [(lite_job_t *)self printd_job_id];
      __int16 v12 = 1024;
      unsigned int v13 = [(lite_job_t *)self destination_job_id];
      __int16 v14 = 2112;
      objc_super v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] clearing cancel flag %@", (uint8_t *)&v10, 0x18u);
    }

    [(lite_job_t *)self _setupCancelSource];
  }
  else
  {
    unsigned int v5 = _PKLogCategory(PKLogCategoryProgress[0]);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v6 = [(lite_job_t *)self printd_job_id];
      unsigned int v7 = [(lite_job_t *)self destination_job_id];
      cancel_source = self->_cancel_source;
      int v10 = 67109890;
      unsigned int v11 = v6;
      __int16 v12 = 1024;
      unsigned int v13 = v7;
      __int16 v14 = 2112;
      objc_super v15 = cancel_source;
      __int16 v16 = 2112;
      __int16 v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] _clearCancelFlag - already cleared (%@ currently, trying to clear %@)", (uint8_t *)&v10, 0x22u);
    }
  }
}

- (void)_setupCancelSource
{
  obj = self;
  objc_sync_enter(obj);
  [(lite_job_t *)obj _setupCancelSource0];
  objc_sync_exit(obj);
}

- (void)_setupCancelSource0
{
  dispatch_source_t v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_data_add, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
  objc_initWeak(&location, self);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10001BF10;
  handler[3] = &unk_1000A04F0;
  objc_copyWeak(&v32, &location);
  intptr_t v4 = v3;
  v31 = v4;
  dispatch_source_set_event_handler(v4, handler);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10001BF80;
  v27[3] = &unk_1000A0518;
  objc_copyWeak(&v29, &location);
  unsigned int v5 = v4;
  v28 = v5;
  unsigned int v6 = objc_retainBlock(v27);
  id zis_canceled = self->zis_canceled;
  self->id zis_canceled = v6;

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10001BFD0;
  v24[3] = &unk_1000A04F0;
  objc_copyWeak(&v26, &location);
  id v8 = v5;
  time_t v25 = v8;
  __int16 v9 = objc_retainBlock(v24);
  id zset_cancel_flag = self->zset_cancel_flag;
  self->id zset_cancel_flag = v9;

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10001C034;
  v21[3] = &unk_1000A04F0;
  objc_copyWeak(&v23, &location);
  unsigned int v11 = v8;
  v22 = v11;
  __int16 v12 = objc_retainBlock(v21);
  id zclear_cancel_flag = self->zclear_cancel_flag;
  self->id zclear_cancel_flag = v12;

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10001C098;
  v19[3] = &unk_1000A0540;
  __int16 v14 = v11;
  int v20 = v14;
  objc_super v15 = objc_retainBlock(v19);
  id zmake_progress = self->zmake_progress;
  self->id zmake_progress = v15;

  cancel_source = self->_cancel_source;
  self->_cancel_source = (OS_dispatch_source *)v14;
  unsigned int v18 = v14;

  dispatch_resume((dispatch_object_t)self->_cancel_source);
  objc_destroyWeak(&v23);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&v29);

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);
}

- (void)cancelNoLock
{
  if ((id)[(lite_job_t *)self localJobState] == (id)5)
  {
    [(lite_job_t *)self set_cancel_flag];
    CFStringRef v3 = @"Canceling job.";
    intptr_t v4 = self;
    uint64_t v5 = 2048;
  }
  else
  {
    [(id)qword_1000C8AE0 removeObject:self];
    [(id)qword_1000C8AE8 removeObject:self];
    [(lite_job_t *)self setLocalJobState:7];
    [(lite_job_t *)self setCompletedTime:time(0)];
    [(lite_job_t *)self set_cancel_flag];
    CFStringRef v3 = @"Job canceled.";
    intptr_t v4 = self;
    uint64_t v5 = 0x2000;
  }
  [(lite_job_t *)v4 postGlobalNotification:v5 logMsg:v3];
  unsigned int v6 = qword_1000C8AF0;
  if (qword_1000C8AF0)
  {
    dispatch_source_set_timer(v6, 0, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
}

- (void)cancelThisJob
{
  pthread_mutex_lock(&stru_1000C8530);
  [(lite_job_t *)self cancelNoLock];

  pthread_mutex_unlock(&stru_1000C8530);
}

+ (void)cancelJob:(int)a3
{
  pthread_mutex_lock(&stru_1000C8530);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = (id)qword_1000C8AE0;
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v8, "printd_job_id", (void)v9) == a3)
        {
          [v8 cancelNoLock];
          goto LABEL_11;
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  pthread_mutex_unlock(&stru_1000C8530);
}

- (id)addJobAndAllowToProceed
{
  CFStringRef v3 = [(lite_job_t *)self addJobAndReturnLogMessageOnFailure];
  if (!v3)
  {
    pthread_mutex_lock(&stru_1000C8530);
    CFStringRef v3 = [(lite_job_t *)self allowThisJobToProceedNoLock];
    pthread_mutex_unlock(&stru_1000C8530);
  }

  return v3;
}

+ (id)gatherLogInfo
{
  pthread_mutex_lock(&stru_1000C8530);
  v2 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = (id)qword_1000C8AD8;
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v3);
        }
        unsigned int v7 = [*(id *)(*((void *)&v11 + 1) + 8 * i) logInfo];
        [v2 addObject:v7];
      }
      id v4 = [v3 countByEnumeratingWithState:&v11 objects:v17 count:16];
    }
    while (v4);
  }

  pthread_mutex_unlock(&stru_1000C8530);
  v15[0] = @"jobs";
  v15[1] = @"tick";
  v16[0] = v2;
  id v8 = +[NSString stringWithFormat:@"Timer<%@>", qword_1000C8AF0];
  v16[1] = v8;
  long long v9 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];

  return v9;
}

- (id)logInfo
{
  v19[0] = @"isCanceled";
  if ([(lite_job_t *)self is_canceled]) {
    CFStringRef v3 = @"yes";
  }
  else {
    CFStringRef v3 = @"no";
  }
  v20[0] = v3;
  v19[1] = @"printd_job_id";
  unsigned int v18 = +[NSNumber numberWithInt:self->_printd_job_id];
  v20[1] = v18;
  v19[2] = @"printer_job_id";
  __int16 v17 = +[NSNumber numberWithInt:[(lite_job_t *)self destination_job_id]];
  v20[2] = v17;
  v19[3] = @"printer";
  __int16 v16 = [(lite_job_t *)self printer];
  objc_super v15 = [v16 debugDescription];
  v20[3] = v15;
  void v19[4] = @"format";
  id v4 = [(lite_job_t *)self spoolDocumentFormat];
  v20[4] = v4;
  v19[5] = @"filename";
  uint64_t v5 = [(lite_job_t *)self spoolDocumentFilename];
  v20[5] = v5;
  v19[6] = @"state";
  uint64_t v6 = jobStateString(self->_localJobState);
  v20[6] = v6;
  v19[7] = @"mediaProgress";
  unsigned int v7 = +[NSNumber numberWithInt:self->_mediaProgress];
  v20[7] = v7;
  v19[8] = @"ready_time";
  id v8 = +[NSDate dateWithTimeIntervalSince1970:(double)[(lite_job_t *)self readyTime]];
  v20[8] = v8;
  v19[9] = @"ptr";
  long long v9 = +[NSString stringWithFormat:@"<%@@%p>", objc_opt_class(), self];
  v20[9] = v9;
  v19[10] = @"in_active_jobs";
  if ([(id)qword_1000C8AE0 containsObject:self]) {
    CFStringRef v10 = @"yes";
  }
  else {
    CFStringRef v10 = @"no";
  }
  v20[10] = v10;
  v19[11] = @"in_processing_jobs";
  if ([(id)qword_1000C8AE8 containsObject:self]) {
    CFStringRef v11 = @"yes";
  }
  else {
    CFStringRef v11 = @"no";
  }
  v20[11] = v11;
  v19[12] = @"try_count";
  long long v12 = +[NSNumber numberWithUnsignedInteger:[(lite_job_t *)self printTriesCount]];
  v20[12] = v12;
  long long v13 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:13];

  return v13;
}

- (NSString)description
{
  CFStringRef v3 = jobStateString(self->_localJobState);
  if (self->_localJobState == 5)
  {
    uint64_t v4 = +[NSString stringWithFormat:@"%@ %ld of %ld", v3, [(lite_job_t *)self payloadSent], [(lite_job_t *)self payloadTotal]];

    CFStringRef v3 = (void *)v4;
  }
  v8.receiver = self;
  v8.super_class = (Class)lite_job_t;
  uint64_t v5 = [(lite_job_t *)&v8 description];
  uint64_t v6 = +[NSString stringWithFormat:@"%@ { local %d / remote %d %@ }", v5, self->_printd_job_id, [(lite_job_t *)self destination_job_id], v3];

  return (NSString *)v6;
}

- (NSString)debugDescription
{
  CFStringRef v3 = [(lite_job_t *)self description];
  uint64_t v4 = [(lite_job_t *)self logInfo];
  uint64_t v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return (NSString *)v5;
}

+ (void)getJobAttributes:(int)a3 includeThumbnail:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  unsigned int v7 = (void (**)(id, id))a5;
  pthread_mutex_lock(&stru_1000C8530);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = (id)qword_1000C8AD8;
  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v8);
        }
        long long v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v12, "printd_job_id", (void)v13) == a3)
        {
          id v9 = [v12 getJobAttributes:v5];
          goto LABEL_11;
        }
      }
      id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  pthread_mutex_unlock(&stru_1000C8530);
  v7[2](v7, v9);
}

- (id)getJobAttributes:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = objc_opt_new();
  objc_msgSend(v5, "setLocalJobID:", -[lite_job_t printd_job_id](self, "printd_job_id"));
  uint64_t v6 = [(lite_job_t *)self printer];
  unsigned int v7 = [v6 bonjourName];
  id v8 = [v7 dataRepresentation];
  [v5 setPrinterEndpointData:v8];

  id v9 = [(lite_job_t *)self printer];
  uint64_t v10 = [v9 displayName];
  [v5 setPrinterDisplayName:v10];

  CFStringRef v11 = [(lite_job_t *)self printer];
  uint64_t v12 = [v11 location];
  long long v13 = (void *)v12;
  if (v12) {
    CFStringRef v14 = (const __CFString *)v12;
  }
  else {
    CFStringRef v14 = &stru_1000A4B68;
  }
  [v5 setPrinterLocation:v14];

  long long v15 = [(lite_job_t *)self printer];
  long long v16 = [v15 browseInfo];
  __int16 v17 = [v16 bonjourName];
  if ([v17 provenance] == 8) {
    uint64_t v18 = 3;
  }
  else {
    uint64_t v18 = 4;
  }
  [v5 setPrinterKind:v18];

  __int16 v19 = [(lite_job_t *)self printSettings];
  [v5 setSettings:v19];

  int v20 = +[NSDate dateWithTimeIntervalSince1970:(double)self->_createdTime];
  [v5 setTimeAtCreation:v20];

  if (v3) {
    [v5 setThumbnailImage:self->_thumbnail];
  }
  objc_msgSend(v5, "setMediaSheetsCompleted:", -[lite_job_t sheetsCompleted](self, "sheetsCompleted"));
  v21 = +[NSDate dateWithTimeIntervalSince1970:(double)[(lite_job_t *)self readyTime]];
  [v5 setTimeAtProcessing:v21];

  v22 = +[NSDate dateWithTimeIntervalSince1970:(double)[(lite_job_t *)self completedTime]];
  [v5 setTimeAtCompleted:v22];

  unsigned int v23 = [(lite_job_t *)self numberOfSheetsPerCopy];
  v24 = [(lite_job_t *)self request_attrs];
  unsigned int v25 = (*((uint64_t (**)(JobRequestAttributes_Base *))v24->var0 + 16))(v24);
  if (v25 <= 1) {
    int v26 = 1;
  }
  else {
    int v26 = v25;
  }
  [v5 setMediaSheets:(int)(v26 * v23)];
  [v5 setMediaProgress:self->_mediaProgress];
  objc_msgSend(v5, "setRemoteJobId:", -[lite_job_t destination_job_id](self, "destination_job_id"));
  v27 = [(lite_job_t *)self printer];
  v28 = [v27 currentJob];

  if (v28 == self)
  {
    id v29 = [(lite_job_t *)self printer];
    uint64_t v30 = [v29 printerStateMessage];
    [v5 setJobPrinterStateMessage:v30];

    v31 = [(lite_job_t *)self printer];
    id v32 = [v31 printerStateReasons];
    [v5 setJobPrinterStateReasons:v32];
  }
  [v5 setJobStateMessage:&stru_1000A4B68];
  v33 = self;
  v34 = @"none";
  switch([(lite_job_t *)v33 localJobState])
  {
    case 3:
      break;
    case 4:
      v35 = [(lite_job_t *)v33 jobPassword];

      if (v35)
      {
        v34 = @"job-password-wait";
      }
      else if (v33->release_wait)
      {
        v34 = @"job-release-wait";
      }
      else
      {
        long long v43 = [(lite_job_t *)v33 jobHoldUntil];

        if (v43) {
          v34 = @"job-hold-until-specified";
        }
        else {
          v34 = @"job-incoming";
        }
      }
      break;
    case 5:
      if ([(lite_job_t *)v33 is_canceled]) {
        v34 = @"processing-to-stop-point";
      }
      else {
        v34 = @"job-printing";
      }
      break;
    case 6:
      v34 = @"job-stopped";
      break;
    case 8:
      v34 = @"aborted-by-system";
      break;
    case 9:
      v34 = @"job-completed-successfully";
      break;
    default:
      v34 = @"job-canceled-by-user";
      break;
  }

  int64_t v36 = v34;
  long long v44 = v36;
  dispatch_time_t v37 = +[NSArray arrayWithObjects:&v44 count:1];
  [v5 setJobStateReasons:v37];

  if ((id)[(lite_job_t *)v33 localJobState] == (id)5 && [(lite_job_t *)v33 is_canceled]) {
    uint64_t v38 = 10;
  }
  else {
    uint64_t v38 = [(lite_job_t *)v33 localJobState];
  }
  [v5 setState:v38];
  v39 = [(lite_job_t *)v33 jobPassword];
  v40 = v39;
  if (v39)
  {
    uint64_t v41 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%.*s", [v39 length], objc_msgSend(v39, "bytes"));
    [v5 setPIN:v41];
  }

  return v5;
}

- (void)postGlobalNotification:(unsigned int)a3
{
}

- (void)postGlobalNotification:(unsigned int)a3 logMsg:(id)a4
{
  id v6 = a4;
  if ([v6 length])
  {
    unsigned int v7 = _PKLogCategory(PKLogCategoryProgress[0]);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v8 = [(lite_job_t *)self printd_job_id];
      if (self) {
        unsigned int v9 = [(lite_job_t *)self destination_job_id];
      }
      else {
        unsigned int v9 = -1;
      }
      int v16 = 67109634;
      unsigned int v17 = v8;
      __int16 v18 = 1024;
      unsigned int v19 = v9;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] postGlobalNotification(%@)", (uint8_t *)&v16, 0x18u);
    }
  }
  if ((int)a3 >= 0x4000)
  {
    if (a3 == 0x4000)
    {
LABEL_22:
      long long v13 = _PKLogCategory(PKLogCategoryProgress[0]);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v14 = [(lite_job_t *)self printd_job_id];
        if (self) {
          unsigned int v15 = [(lite_job_t *)self destination_job_id];
        }
        else {
          unsigned int v15 = -1;
        }
        int v16 = 67109376;
        unsigned int v17 = v14;
        __int16 v18 = 1024;
        unsigned int v19 = v15;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] Sending com.apple.printd.job-list event", (uint8_t *)&v16, 0xEu);
      }

      quantized_notify_post(2u);
      goto LABEL_28;
    }
    if (a3 != 0x10000 && a3 != 0x8000) {
      goto LABEL_28;
    }
  }
  else if (a3 != 2048)
  {
    if (a3 != 4096 && a3 != 0x2000) {
      goto LABEL_28;
    }
    goto LABEL_22;
  }
  uint64_t v10 = _PKLogCategory(PKLogCategoryProgress[0]);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v11 = [(lite_job_t *)self printd_job_id];
    if (self) {
      unsigned int v12 = [(lite_job_t *)self destination_job_id];
    }
    else {
      unsigned int v12 = -1;
    }
    int v16 = 67109376;
    unsigned int v17 = v11;
    __int16 v18 = 1024;
    unsigned int v19 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[Job %d][%d] Sending com.apple.printd.job-progress event", (uint8_t *)&v16, 0xEu);
  }

  quantized_notify_post(4u);
  if (a3 != 0x10000) {
    goto LABEL_22;
  }
LABEL_28:
}

- (int)openDriver:(lite_driver_s *)a3 format:(id)a4 orient:(int)a5 num_sheets:(int)a6 passthru:(int)a7
{
  return liteOpenDriver(self, a3, (NSString *)a4, (ipp_orient_e)a5, a6, a7);
}

- (int)closeDriver:(lite_driver_s *)a3
{
  return liteCloseDriver(self, a3);
}

- (CGDataConsumer)createDataConsumer
{
  return CGDataConsumerCreate(self->job_stream_http, (const CGDataConsumerCallbacks *)&off_1000A0560);
}

- (NSString)printer_driverformat
{
  v2 = [(lite_job_t *)self printer];
  BOOL v3 = [v2 driverformat];

  return (NSString *)v3;
}

- (int)printer_preferred_landscape
{
  v2 = [(lite_job_t *)self printer];
  int v3 = objc_msgSend(v2, "preferred_landscape");

  return v3;
}

- (BOOL)has_job_stream_http
{
  return self->job_stream_http != 0;
}

- (BOOL)is_canceled
{
  v2 = self;
  objc_sync_enter(v2);
  char v3 = (*((uint64_t (**)(void))v2->zis_canceled + 2))();
  objc_sync_exit(v2);

  return v3;
}

- (void)make_progress:(int64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  (*((void (**)(void))obj->zmake_progress + 2))();
  objc_sync_exit(obj);
}

- (void)set_cancel_flag
{
  obj = self;
  objc_sync_enter(obj);
  (*((void (**)(void))obj->zset_cancel_flag + 2))();
  objc_sync_exit(obj);
}

- (void)clear_cancel_flag
{
  obj = self;
  objc_sync_enter(obj);
  (*((void (**)(void))obj->zclear_cancel_flag + 2))();
  objc_sync_exit(obj);
}

+ (void)getAllJobsCompletionHandler:(id)a3
{
  char v3 = (void (**)(id, void *, void *))a3;
  uint64_t v4 = objc_opt_new();
  BOOL v5 = objc_opt_new();
  pthread_mutex_lock(&stru_1000C8530);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = (id)qword_1000C8AD8;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        unsigned int v11 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v10, "printd_job_id", (void)v13));
        [v4 addObject:v11];

        unsigned int v12 = [v10 getJobAttributes:1];
        [v5 addObject:v12];
      }
      id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  pthread_mutex_unlock(&stru_1000C8530);
  v3[2](v3, v4, v5);
}

- (NSData)thumbnail
{
  return (NSData *)objc_getProperty(self, a2, 168, 1);
}

- (NSData)jobPassword
{
  return (NSData *)objc_getProperty(self, a2, 176, 1);
}

- (void)setJobPassword:(id)a3
{
}

- (NSString)jobPasswordEncryption
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
}

- (void)setJobPasswordEncryption:(id)a3
{
}

- (int)numberOfSheetsPerCopy
{
  return self->_numberOfSheetsPerCopy;
}

- (void)setNumberOfSheetsPerCopy:(int)a3
{
  self->_numberOfSheetsPerCopy = a3;
}

- (PKPrintSettings)printSettings
{
  return (PKPrintSettings *)objc_getProperty(self, a2, 192, 1);
}

- (lite_printer_t)printer
{
  return (lite_printer_t *)objc_getProperty(self, a2, 200, 1);
}

- (void)setPrinter:(id)a3
{
}

- (IPPSession)ippSession
{
  return (IPPSession *)objc_getProperty(self, a2, 208, 1);
}

- (NSString)jobHoldUntil
{
  return (NSString *)objc_getProperty(self, a2, 216, 1);
}

- (void)setJobHoldUntil:(id)a3
{
}

- (unint64_t)payloadTotal
{
  return self->_payloadTotal;
}

- (void)setPayloadTotal:(unint64_t)a3
{
  self->_payloadTotal = a3;
}

- (unint64_t)payloadSent
{
  return self->_payloadSent;
}

- (void)setPayloadSent:(unint64_t)a3
{
  self->_payloadSent = a3;
}

- (NSString)spoolDocumentFilename
{
  return (NSString *)objc_getProperty(self, a2, 240, 1);
}

- (void)setSpoolDocumentFilename:(id)a3
{
}

- (NSString)spoolDocumentFormat
{
  return (NSString *)objc_getProperty(self, a2, 248, 1);
}

- (void)setSpoolDocumentFormat:(id)a3
{
}

- (unint64_t)printTriesCount
{
  return self->_printTriesCount;
}

- (void)setPrintTriesCount:(unint64_t)a3
{
  self->_printTriesCount = a3;
}

- (int64_t)createdTime
{
  return self->_createdTime;
}

- (int64_t)readyTime
{
  return self->_readyTime;
}

- (void)setReadyTime:(int64_t)a3
{
  self->_readyTime = a3;
}

- (int64_t)completedTime
{
  return self->_completedTime;
}

- (void)setCompletedTime:(int64_t)a3
{
  self->_completedTime = a3;
}

- (JobRequestAttributes_Base)request_attrs
{
  return self->_request_attrs;
}

- (int64_t)localJobState
{
  return self->_localJobState;
}

- (void)setLocalJobState:(int64_t)a3
{
  self->_localJobState = a3;
}

- (int)pdf_pages
{
  return self->_pdf_pages;
}

- (void)setPdf_pages:(int)a3
{
  self->_pdf_pages = a3;
}

- (int)destination_job_id
{
  return self->_destination_job_id;
}

- (void)setDestination_job_id:(int)a3
{
  self->_destination_job_id = a3;
}

- (int)sheetsCompleted
{
  return self->_sheetsCompleted;
}

- (void)setSheetsCompleted:(int)a3
{
  self->_sheetsCompleted = a3;
}

- (int)printd_job_id
{
  return self->_printd_job_id;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spoolDocumentFormat, 0);
  objc_storeStrong((id *)&self->_spoolDocumentFilename, 0);
  objc_storeStrong((id *)&self->_jobHoldUntil, 0);
  objc_storeStrong((id *)&self->_ippSession, 0);
  objc_storeStrong((id *)&self->_printer, 0);
  objc_storeStrong((id *)&self->_printSettings, 0);
  objc_storeStrong((id *)&self->_jobPasswordEncryption, 0);
  objc_storeStrong((id *)&self->_jobPassword, 0);
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_jobTransaction, 0);
  objc_storeStrong((id *)&self->_jobActivity, 0);
  objc_storeStrong(&self->zmake_progress, 0);
  objc_storeStrong(&self->zclear_cancel_flag, 0);
  objc_storeStrong(&self->zset_cancel_flag, 0);
  objc_storeStrong(&self->zis_canceled, 0);
  objc_storeStrong((id *)&self->_mutableJobState, 0);
  objc_storeStrong((id *)&self->_cancel_source, 0);

  objc_storeStrong((id *)&self->job_stream_http, 0);
}

@end