@interface MetricsController
+ (id)sharedInstance;
- (BOOL)_hasEntitlements:(id)a3;
- (MetricsController)init;
- (id)_operationQueue;
- (void)_cancelBackoffRetry;
- (void)_cancelBackoffRetryTimer;
- (void)_reportEvents;
- (void)_reportEventsIfNeeded;
- (void)_scheduleBackoffRetry;
- (void)_sendUnentitledResponseToMessage:(id)a3 connection:(id)a4;
- (void)configureDuet;
- (void)dealloc;
- (void)getInternalSettingsWithMessage:(id)a3 connection:(id)a4;
- (void)insertEventWithMessage:(id)a3 connection:(id)a4;
- (void)observeXPCServer:(id)a3;
- (void)recordAnalyticsWithMetricsDialogEvent:(id)a3 forTopic:(id)a4;
- (void)recordAnalyticsWithMetricsDialogEventWithMessage:(id)a3 connection:(id)a4;
- (void)reportEventsWithMessage:(id)a3 connection:(id)a4;
- (void)setInternalSettingsWithMessage:(id)a3 connection:(id)a4;
@end

@implementation MetricsController

- (MetricsController)init
{
  v10.receiver = self;
  v10.super_class = (Class)MetricsController;
  v2 = [(MetricsController *)&v10 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.itunesstored.MetricsController", 0);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    v5 = (SSMetricsEventController *)objc_alloc_init((Class)SSMetricsEventController);
    eventController = v2->_eventController;
    v2->_eventController = v5;

    id v8 = [objc_alloc((Class)SSMetricsConfiguration) initWithGlobalConfiguration:&off_1003CA018];
    [(SSMetricsEventController *)v2->_eventController setGlobalConfiguration:v8];

    [(MetricsController *)v2 configureDuet];
  }
  return v2;
}

- (void)dealloc
{
  backoffRetryTimer = self->_backoffRetryTimer;
  if (backoffRetryTimer) {
    dispatch_source_cancel((dispatch_source_t)backoffRetryTimer);
  }
  if (self->_operationQueue)
  {
    v4 = +[Daemon daemon];
    [v4 removeKeepAliveOperationQueue:self->_operationQueue];

    [(ISOperationQueue *)self->_operationQueue cancelAllOperations];
  }
  v5.receiver = self;
  v5.super_class = (Class)MetricsController;
  [(MetricsController *)&v5 dealloc];
}

+ (id)sharedInstance
{
  if (qword_100401F30 != -1) {
    dispatch_once(&qword_100401F30, &stru_1003A7F60);
  }
  v2 = (void *)qword_100401F28;

  return v2;
}

- (void)observeXPCServer:(id)a3
{
  id v4 = a3;
  [v4 addObserver:self selector:"getInternalSettingsWithMessage:connection:" forMessage:128];
  [v4 addObserver:self selector:"insertEventWithMessage:connection:" forMessage:110];
  [v4 addObserver:self selector:"reportEventsWithMessage:connection:" forMessage:114];
  [v4 addObserver:self selector:"recordAnalyticsWithMetricsDialogEventWithMessage:connection:" forMessage:197];
  [v4 addObserver:self selector:"setInternalSettingsWithMessage:connection:" forMessage:129];
}

- (void)recordAnalyticsWithMetricsDialogEvent:(id)a3 forTopic:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v5)
  {
    v9 = +[SSLogConfig sharedDaemonConfig];
    if (!v9)
    {
      v9 = +[SSLogConfig sharedConfig];
    }
    unsigned int v11 = [(AnalyticsRecordingOperation *)v9 shouldLog];
    if ([(AnalyticsRecordingOperation *)v9 shouldLogToDisk]) {
      int v12 = v11 | 2;
    }
    else {
      int v12 = v11;
    }
    v13 = [(AnalyticsRecordingOperation *)v9 OSLogObject];
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      v12 &= 2u;
    }
    if (v12)
    {
      int v18 = 138543362;
      id v19 = (id)objc_opt_class();
      id v14 = v19;
      LODWORD(v16) = 12;
      v15 = (void *)_os_log_send_and_compose_impl();

      if (!v15) {
        goto LABEL_16;
      }
      v13 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v15, 4, &v18, v16);
      free(v15);
      SSFileLog();
    }

    goto LABEL_16;
  }
  v7 = [AnalyticsRecordingOperation alloc];
  id v17 = v5;
  id v8 = +[NSArray arrayWithObjects:&v17 count:1];
  v9 = [(AnalyticsRecordingOperation *)v7 initWithMetricsEvents:v8];

  if (v6) {
    [(AnalyticsRecordingOperation *)v9 setEventTopicOverride:v6];
  }
  objc_super v10 = +[ISOperationQueue mainQueue];
  [v10 addOperation:v9];

LABEL_16:
}

- (void)configureDuet
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10015B540;
  block[3] = &unk_1003A3140;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)getInternalSettingsWithMessage:(id)a3 connection:(id)a4
{
  connection = (_xpc_connection_s *)a4;
  id v6 = a3;
  if ([(MetricsController *)self _hasEntitlements:connection])
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v6);

    id v8 = (__CFString *)SSVMetricsInternalSettingReportingFrequency;
    CFStringRef v9 = (const __CFString *)kSSUserDefaultsIdentifier;
    CFPreferencesAppSynchronize(kSSUserDefaultsIdentifier);
    CFPropertyListRef v10 = CFPreferencesCopyAppValue(v8, v9);
    if (v10)
    {
      unsigned int v11 = v10;
      [(__CFString *)v8 UTF8String];
      SSXPCDictionarySetCFObject();
      CFRelease(v11);
    }
    xpc_connection_send_message(connection, reply);
  }
  else
  {
    [(MetricsController *)self _sendUnentitledResponseToMessage:v6 connection:connection];
    xpc_object_t reply = v6;
  }
}

- (void)insertEventWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  v7 = (_xpc_connection_s *)a4;
  if (![(MetricsController *)self _hasEntitlements:v7])
  {
    [(MetricsController *)self _sendUnentitledResponseToMessage:v6 connection:v7];
    goto LABEL_21;
  }
  char v26 = 0;
  id v8 = (void *)SSXPCConnectionCopyClientIdentifier();
  objc_opt_class();
  CFStringRef v9 = (void *)SSXPCDictionaryCopyObjectWithClass();
  CFPropertyListRef v10 = +[SSLogConfig sharedDaemonConfig];
  if (!v10)
  {
    CFPropertyListRef v10 = +[SSLogConfig sharedConfig];
  }
  unsigned int v11 = [v10 shouldLog];
  if ([v10 shouldLogToDisk]) {
    int v12 = v11 | 2;
  }
  else {
    int v12 = v11;
  }
  v13 = [v10 OSLogObject];
  if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
    v12 &= 2u;
  }
  if (!v12) {
    goto LABEL_12;
  }
  id v14 = objc_opt_class();
  id v15 = v14;
  int v27 = 138412802;
  v28 = v14;
  __int16 v29 = 1024;
  unsigned int v30 = [v9 count];
  __int16 v31 = 2112;
  v32 = v8;
  LODWORD(v24) = 28;
  v23 = &v27;
  uint64_t v16 = (void *)_os_log_send_and_compose_impl();

  if (v16)
  {
    v13 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v16, 4, &v27, v24);
    free(v16);
    v23 = (int *)v13;
    SSFileLog();
LABEL_12:
  }
  eventController = self->_eventController;
  id v25 = 0;
  unsigned __int8 v18 = [(SSMetricsEventController *)eventController insertEventSummaries:v9 error:&v25];
  id v19 = v25;
  xpc_object_t reply = xpc_dictionary_create_reply(v6);
  if (v18)
  {
    uint64_t v21 = 0;
  }
  else
  {
    if (v19)
    {
      uint64_t v21 = (uint64_t)[v19 code];
    }
    else
    {
      uint64_t v21 = 100;
      SSError();
      id v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    SSXPCDictionarySetObject();
  }
  v22 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v21, v23);
  SSXPCDictionarySetObject();

  xpc_connection_send_message(v7, reply);
LABEL_21:
}

- (void)recordAnalyticsWithMetricsDialogEventWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  v7 = (_xpc_connection_s *)a4;
  if ([(MetricsController *)self _hasEntitlements:v7])
  {
    id v8 = objc_alloc((Class)SSMetricsDialogEvent);
    CFStringRef v9 = xpc_dictionary_get_value(v6, "1");
    id v10 = [v8 initWithXPCEncoding:v9];

    objc_opt_class();
    unsigned int v11 = (void *)SSXPCDictionaryCopyObjectWithClass();
    if (v10)
    {
      int v12 = [AnalyticsRecordingOperation alloc];
      id v24 = v10;
      v13 = +[NSArray arrayWithObjects:&v24 count:1];
      id v14 = [(AnalyticsRecordingOperation *)v12 initWithMetricsEvents:v13];

      if (v11) {
        [(AnalyticsRecordingOperation *)v14 setEventTopicOverride:v11];
      }
      id v15 = +[ISOperationQueue mainQueue];
      [v15 addOperation:v14];

      goto LABEL_18;
    }
    id v14 = +[SSLogConfig sharedDaemonConfig];
    if (!v14)
    {
      id v14 = +[SSLogConfig sharedConfig];
    }
    unsigned int v16 = [(AnalyticsRecordingOperation *)v14 shouldLog];
    if ([(AnalyticsRecordingOperation *)v14 shouldLogToDisk]) {
      int v17 = v16 | 2;
    }
    else {
      int v17 = v16;
    }
    unsigned __int8 v18 = [(AnalyticsRecordingOperation *)v14 OSLogObject];
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      v17 &= 2u;
    }
    if (v17)
    {
      LODWORD(v23) = 138543362;
      *(void *)((char *)&v23 + 4) = objc_opt_class();
      id v19 = *(id *)((char *)&v23 + 4);
      LODWORD(v22) = 12;
      v20 = (void *)_os_log_send_and_compose_impl();

      if (!v20)
      {
LABEL_18:

        xpc_object_t reply = xpc_dictionary_create_reply(v6);
        xpc_dictionary_set_BOOL(reply, "0", v10 != 0);
        xpc_connection_send_message(v7, reply);

        goto LABEL_19;
      }
      unsigned __int8 v18 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v20, 4, &v23, v22, v23);
      free(v20);
      SSFileLog();
    }

    goto LABEL_18;
  }
  [(MetricsController *)self _sendUnentitledResponseToMessage:v6 connection:v7];
LABEL_19:
}

- (void)reportEventsWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  v7 = (_xpc_connection_s *)a4;
  if ([(MetricsController *)self _hasEntitlements:v7])
  {
    char v26 = 0;
    id v8 = (void *)SSXPCConnectionCopyClientIdentifier();
    backoffRetryTimer = self->_backoffRetryTimer;
    uint64_t v10 = +[SSLogConfig sharedDaemonConfig];
    unsigned int v11 = (void *)v10;
    if (backoffRetryTimer)
    {
      if (!v10)
      {
        unsigned int v11 = +[SSLogConfig sharedConfig];
      }
      unsigned int v12 = [v11 shouldLog];
      if ([v11 shouldLogToDisk]) {
        int v13 = v12 | 2;
      }
      else {
        int v13 = v12;
      }
      id v14 = [v11 OSLogObject];
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        v13 &= 2u;
      }
      if (v13)
      {
        int v27 = 138412546;
        id v28 = (id)objc_opt_class();
        __int16 v29 = 2112;
        unsigned int v30 = v8;
        id v15 = v28;
        LODWORD(v24) = 22;
        unsigned int v16 = (void *)_os_log_send_and_compose_impl();

        if (!v16)
        {
LABEL_14:

LABEL_28:
          xpc_object_t reply = xpc_dictionary_create_reply(v6);
          SSXPCDictionarySetObject();
          xpc_connection_send_message(v7, reply);

          goto LABEL_29;
        }
        id v14 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v16, 4, &v27, v24);
        free(v16);
        SSFileLog();
      }

      goto LABEL_14;
    }
    if (!v10)
    {
      unsigned int v11 = +[SSLogConfig sharedConfig];
    }
    unsigned int v17 = [v11 shouldLog];
    if ([v11 shouldLogToDisk]) {
      int v18 = v17 | 2;
    }
    else {
      int v18 = v17;
    }
    id v19 = [v11 OSLogObject];
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
      v18 &= 2u;
    }
    if (v18)
    {
      int v27 = 138412546;
      id v28 = (id)objc_opt_class();
      __int16 v29 = 2112;
      unsigned int v30 = v8;
      id v20 = v28;
      LODWORD(v24) = 22;
      uint64_t v21 = (void *)_os_log_send_and_compose_impl();

      if (!v21)
      {
LABEL_27:

        dispatchQueue = self->_dispatchQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10015C6C8;
        block[3] = &unk_1003A3140;
        block[4] = self;
        dispatch_async(dispatchQueue, block);
        goto LABEL_28;
      }
      id v19 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v21, 4, &v27, v24);
      free(v21);
      SSFileLog();
    }

    goto LABEL_27;
  }
  [(MetricsController *)self _sendUnentitledResponseToMessage:v6 connection:v7];
LABEL_29:
}

- (void)setInternalSettingsWithMessage:(id)a3 connection:(id)a4
{
  xpc_object_t original = a3;
  id v6 = (_xpc_connection_s *)a4;
  if ([(MetricsController *)self _hasEntitlements:v6])
  {
    xpc_object_t reply = xpc_dictionary_create_reply(original);
    id v8 = xpc_dictionary_get_value(original, "1");
    CFStringRef v9 = v8;
    if (v8 && xpc_get_type(v8) == (xpc_type_t)&_xpc_type_dictionary)
    {
      uint64_t v10 = (__CFString *)SSVMetricsInternalSettingReportingFrequency;
      [(__CFString *)v10 UTF8String];
      unsigned int v11 = (const void *)SSXPCDictionaryCopyCFObject();
      if (v11)
      {
        unsigned int v12 = v11;
        CFTypeID v13 = CFGetTypeID(v11);
        CFTypeID TypeID = CFNullGetTypeID();
        CFStringRef v15 = (const __CFString *)kSSUserDefaultsIdentifier;
        if (v13 == TypeID)
        {
          CFStringRef v16 = v10;
          unsigned int v17 = 0;
        }
        else
        {
          CFStringRef v16 = v10;
          unsigned int v17 = v12;
        }
        CFPreferencesSetAppValue(v16, v17, kSSUserDefaultsIdentifier);
        CFRelease(v12);
      }
      else
      {
        CFStringRef v15 = (const __CFString *)kSSUserDefaultsIdentifier;
      }
      CFPreferencesAppSynchronize(v15);
    }
    xpc_connection_send_message(v6, reply);
  }
  else
  {
    [(MetricsController *)self _sendUnentitledResponseToMessage:original connection:v6];
  }
}

- (void)_cancelBackoffRetry
{
  self->_backoffRetryCount = 0;
}

- (void)_cancelBackoffRetryTimer
{
  backoffRetryTimer = self->_backoffRetryTimer;
  if (backoffRetryTimer)
  {
    dispatch_source_cancel((dispatch_source_t)backoffRetryTimer);
    id v4 = self->_backoffRetryTimer;
    self->_backoffRetryTimer = 0;
  }
}

- (BOOL)_hasEntitlements:(id)a3
{
  id v3 = a3;
  char HasEntitlement = SSXPCConnectionHasEntitlement();
  char v5 = SSXPCConnectionHasEntitlement();

  return HasEntitlement | v5;
}

- (id)_operationQueue
{
  operationQueue = self->_operationQueue;
  if (!operationQueue)
  {
    id v4 = (ISOperationQueue *)objc_alloc_init((Class)ISOperationQueue);
    char v5 = self->_operationQueue;
    self->_operationQueue = v4;

    [(ISOperationQueue *)self->_operationQueue setAdjustsMaxConcurrentOperationCount:0];
    [(ISOperationQueue *)self->_operationQueue setMaxConcurrentOperationCount:1];
    [(ISOperationQueue *)self->_operationQueue setName:@"com.apple.itunesstored.MetricsController.report"];
    id v6 = +[Daemon daemon];
    [v6 addKeepAliveOperationQueue:self->_operationQueue];

    operationQueue = self->_operationQueue;
  }

  return operationQueue;
}

- (void)_reportEvents
{
  id v3 = [(MetricsController *)self _operationQueue];
  uint64_t v4 = (uint64_t)[v3 operationCount];

  if (v4 < 4)
  {
    char v5 = [[AnalyticsReportingOperation alloc] initWithController:self->_eventController];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10015CBF0;
    v13[3] = &unk_1003A7F88;
    v13[4] = self;
    [(AnalyticsReportingOperation *)v5 setFinishBlock:v13];
    unsigned int v11 = [(MetricsController *)self _operationQueue];
    [v11 addOperation:v5];

    goto LABEL_14;
  }
  char v5 = +[SSLogConfig sharedDaemonConfig];
  if (!v5)
  {
    char v5 = +[SSLogConfig sharedConfig];
  }
  unsigned int v6 = [(AnalyticsReportingOperation *)v5 shouldLog];
  if ([(AnalyticsReportingOperation *)v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  id v8 = [(AnalyticsReportingOperation *)v5 OSLogObject];
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO)) {
    v7 &= 2u;
  }
  if (!v7) {
    goto LABEL_12;
  }
  int v14 = 138412546;
  id v15 = (id)objc_opt_class();
  __int16 v16 = 2112;
  unsigned int v17 = &off_1003C9468;
  id v9 = v15;
  LODWORD(v12) = 22;
  uint64_t v10 = (void *)_os_log_send_and_compose_impl();

  if (v10)
  {
    id v8 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v10, 4, &v14, v12);
    free(v10);
    SSFileLog();
LABEL_12:
  }
LABEL_14:
}

- (void)_reportEventsIfNeeded
{
  +[NSDate timeIntervalSinceReferenceDate];
  uint64_t v4 = (uint64_t)[(SSMetricsEventController *)self->_eventController countUnreportedEventsBefore:(uint64_t)v3];
  uint64_t v5 = +[SSLogConfig sharedDaemonConfig];
  unsigned int v6 = (void *)v5;
  if (v4 >= 501)
  {
    if (!v5)
    {
      unsigned int v6 = +[SSLogConfig sharedConfig];
    }
    unsigned int v7 = [v6 shouldLog];
    if ([v6 shouldLogToDisk]) {
      int v8 = v7 | 2;
    }
    else {
      int v8 = v7;
    }
    id v9 = [v6 OSLogObject];
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      v8 &= 2u;
    }
    if (v8)
    {
      *(_DWORD *)id v19 = 138543618;
      *(void *)&v19[4] = objc_opt_class();
      *(_WORD *)&v19[12] = 2048;
      *(void *)&v19[14] = v4;
      id v10 = *(id *)&v19[4];
      LODWORD(v18) = 22;
      unsigned int v11 = (void *)_os_log_send_and_compose_impl();

      if (!v11)
      {
LABEL_13:

        [(MetricsController *)self _reportEvents];
        return;
      }
      id v9 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4, v19, v18, *(_OWORD *)v19, *(void *)&v19[16]);
      free(v11);
      SSFileLog();
    }

    goto LABEL_13;
  }
  if (!v5)
  {
    unsigned int v6 = +[SSLogConfig sharedConfig];
  }
  unsigned int v12 = [v6 shouldLog];
  if ([v6 shouldLogToDisk]) {
    int v13 = v12 | 2;
  }
  else {
    int v13 = v12;
  }
  int v14 = [v6 OSLogObject];
  if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
    v13 &= 2u;
  }
  if (v13)
  {
    *(_DWORD *)id v19 = 138543618;
    *(void *)&v19[4] = objc_opt_class();
    *(_WORD *)&v19[12] = 2048;
    *(void *)&v19[14] = v4;
    id v15 = *(id *)&v19[4];
    LODWORD(v18) = 22;
    __int16 v16 = (void *)_os_log_send_and_compose_impl();

    if (v16)
    {
      unsigned int v17 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v16, 4, v19, v18, *(void *)v19, *(_OWORD *)&v19[8]);
      free(v16);
      SSFileLog();
    }
  }
  else
  {
  }
}

- (void)_scheduleBackoffRetry
{
  int64_t backoffRetryCount = self->_backoffRetryCount;
  if (backoffRetryCount >= 4)
  {
    uint64_t v4 = +[SSLogConfig sharedDaemonConfig];
    if (!v4)
    {
      uint64_t v4 = +[SSLogConfig sharedConfig];
    }
    unsigned int v5 = [v4 shouldLog];
    if ([v4 shouldLogToDisk]) {
      int v6 = v5 | 2;
    }
    else {
      int v6 = v5;
    }
    unsigned int v7 = [v4 OSLogObject];
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      v6 &= 2u;
    }
    if (v6)
    {
      int v8 = objc_opt_class();
      int64_t v9 = self->_backoffRetryCount + 1;
      int v27 = 138412546;
      id v28 = v8;
      __int16 v29 = 2048;
      int64_t v30 = v9;
      id v10 = v8;
      LODWORD(v25) = 22;
      unsigned int v11 = (void *)_os_log_send_and_compose_impl();

      if (!v11)
      {
LABEL_13:

        [(MetricsController *)self _cancelBackoffRetry];
        return;
      }
      unsigned int v7 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4, &v27, v25);
      free(v11);
      SSFileLog();
    }

    goto LABEL_13;
  }
  int v12 = 2 << backoffRetryCount;
  [(MetricsController *)self _cancelBackoffRetryTimer];
  int v13 = +[SSLogConfig sharedDaemonConfig];
  if (!v13)
  {
    int v13 = +[SSLogConfig sharedConfig];
  }
  int64_t v14 = v12;
  unsigned int v15 = [v13 shouldLog];
  if ([v13 shouldLogToDisk]) {
    int v16 = v15 | 2;
  }
  else {
    int v16 = v15;
  }
  unsigned int v17 = [v13 OSLogObject];
  if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO)) {
    v16 &= 2u;
  }
  if (!v16) {
    goto LABEL_24;
  }
  int v27 = 138412546;
  id v28 = (id)objc_opt_class();
  __int16 v29 = 2048;
  int64_t v30 = v14;
  id v18 = v28;
  LODWORD(v25) = 22;
  id v19 = (void *)_os_log_send_and_compose_impl();

  if (v19)
  {
    unsigned int v17 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v19, 4, &v27, v25);
    free(v19);
    SSFileLog();
LABEL_24:
  }
  id v20 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  backoffRetryTimer = self->_backoffRetryTimer;
  self->_backoffRetryTimer = v20;

  uint64_t v22 = self->_backoffRetryTimer;
  dispatch_time_t v23 = dispatch_time(0, 60000000000 * v14);
  dispatch_source_set_timer((dispatch_source_t)v22, v23, 0, 0);
  uint64_t v24 = self->_backoffRetryTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10015D2F8;
  handler[3] = &unk_1003A3140;
  handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v24, handler);
  dispatch_resume((dispatch_object_t)self->_backoffRetryTimer);
  ++self->_backoffRetryCount;
}

- (void)_sendUnentitledResponseToMessage:(id)a3 connection:(id)a4
{
  unsigned int v5 = (_xpc_connection_s *)a4;
  id v6 = a3;
  unsigned int v7 = +[SSLogConfig sharedDaemonConfig];
  if (!v7)
  {
    unsigned int v7 = +[SSLogConfig sharedConfig];
  }
  unsigned int v8 = [v7 shouldLog];
  if ([v7 shouldLogToDisk]) {
    int v9 = v8 | 2;
  }
  else {
    int v9 = v8;
  }
  id v10 = [v7 OSLogObject];
  if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    v9 &= 2u;
  }
  if (!v9) {
    goto LABEL_11;
  }
  LODWORD(v16) = 138412290;
  *(void *)((char *)&v16 + 4) = objc_opt_class();
  id v11 = *(id *)((char *)&v16 + 4);
  LODWORD(v15) = 12;
  int v12 = (void *)_os_log_send_and_compose_impl();

  if (v12)
  {
    id v10 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v16, v15, v16);
    free(v12);
    SSFileLog();
LABEL_11:
  }
  xpc_object_t reply = xpc_dictionary_create_reply(v6);

  int64_t v14 = SSError();
  SSXPCDictionarySetObject();
  SSXPCDictionarySetObject();
  xpc_connection_send_message(v5, reply);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_eventController, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_storeStrong((id *)&self->_backoffRetryTimer, 0);
}

@end