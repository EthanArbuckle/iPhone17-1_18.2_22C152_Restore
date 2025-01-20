@interface CHRemoteLineWrappingRequestHandler
- (BOOL)_hasIdleLifetimeElapsed:(double)a3;
- (BOOL)_isValidRemoteLineWrappingRequest:(id)a3 bundleIdentifier:(id)a4 error:(id *)a5;
- (CHRemoteLineWrappingRequestHandler)initWithServerQueue:(id)a3 lowPriorityQueue:(id)a4 highPriorityQueue:(id)a5;
- (void)_checkInLineWrapper;
- (void)_checkOutLineWrapper;
- (void)_stageEvictionOfLineWrapperWithTargetIdleLifetime:(double)a3;
- (void)handleRequest:(id)a3 withReply:(id)a4 bundleIdentifier:(id)a5;
- (void)optimizeResourceUsage;
@end

@implementation CHRemoteLineWrappingRequestHandler

- (CHRemoteLineWrappingRequestHandler)initWithServerQueue:(id)a3 lowPriorityQueue:(id)a4 highPriorityQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CHRemoteLineWrappingRequestHandler;
  v11 = [(CHRemoteProcessingRequestHandler *)&v15 initWithServerQueue:v8 lowPriorityQueue:v9 highPriorityQueue:v10];
  v12 = v11;
  if (v11)
  {
    v11->_activeRequestCount = 0;
    v11->_targetIdleLifetime = 120.0;
    +[NSDate timeIntervalSinceReferenceDate];
    v12->_lastActiveTimestamp = v13;
  }

  return v12;
}

- (BOOL)_hasIdleLifetimeElapsed:(double)a3
{
  return +[CHRemoteBasicRequestHandler _hasIdleLifetimeElapsed:self->_lastActiveTimestamp targetIdleLifetime:a3];
}

- (void)_stageEvictionOfLineWrapperWithTargetIdleLifetime:(double)a3
{
  if (qword_10002B188 != -1) {
    dispatch_once(&qword_10002B188, &stru_100024A60);
  }
  v5 = (id)qword_10002B170;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    double v8 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Line wrapper for eviction with idle lifetime=%1.2f", buf, 0xCu);
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100015FCC;
  v6[3] = &unk_100024C48;
  v6[4] = self;
  *(double *)&v6[5] = a3;
  [(CHRemoteBasicRequestHandler *)self _stageEvictionOfResourceWithTargetLifetime:v6 block:a3];
}

- (void)_checkOutLineWrapper
{
  ++self->_activeRequestCount;
  if (!self->_lineWrapper)
  {
    v3 = (CHLineWrapper *)objc_alloc_init((Class)CHLineWrapper);
    lineWrapper = self->_lineWrapper;
    self->_lineWrapper = v3;

    if (qword_10002B188 == -1)
    {
      v5 = (id)qword_10002B170;
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
LABEL_5:

        goto LABEL_6;
      }
    }
    else
    {
      dispatch_once(&qword_10002B188, &stru_100024A60);
      v5 = (id)qword_10002B170;
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_5;
      }
    }
    LOWORD(v8) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Loaded line wrapper", (uint8_t *)&v8, 2u);
    goto LABEL_5;
  }
LABEL_6:
  if (qword_10002B188 != -1)
  {
    dispatch_once(&qword_10002B188, &stru_100024A60);
    v6 = (id)qword_10002B170;
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  v6 = (id)qword_10002B170;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
LABEL_8:
    int64_t activeRequestCount = self->_activeRequestCount;
    int v8 = 134217984;
    int64_t v9 = activeRequestCount;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Currently active line wrapping requests: %li", (uint8_t *)&v8, 0xCu);
  }
LABEL_9:
}

- (void)_checkInLineWrapper
{
  --self->_activeRequestCount;
  +[NSDate timeIntervalSinceReferenceDate];
  self->_lastActiveTimestamp = v3;
  if (self->_activeRequestCount < 0)
  {
    if (qword_10002B188 != -1) {
      dispatch_once(&qword_10002B188, &stru_100024A60);
    }
    v4 = (id)qword_10002B118[0];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "Line wrapper is already fully checked in.", v5, 2u);
    }
  }
  [(CHRemoteLineWrappingRequestHandler *)self _stageEvictionOfLineWrapperWithTargetIdleLifetime:self->_targetIdleLifetime];
}

- (BOOL)_isValidRemoteLineWrappingRequest:(id)a3 bundleIdentifier:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v11 = +[NSBundle mainBundle];
    v12 = [v11 localizedStringForKey:@"The line wrapping request is invalid" value:&stru_1000257A0 table:0];

    double v13 = +[NSBundle mainBundle];
    v14 = [v13 localizedStringForKey:@"Remote line wrapping cannot process an empty request" value:&stru_1000257A0 table:0];

    objc_super v15 = +[NSBundle mainBundle];
    v16 = [v15 localizedStringForKey:@"Submit a new valid line wrapping request" value:&stru_1000257A0 table:0];

    int64_t v9 = [(id)objc_opt_class() invalidInputErrorWithDescription:v12 failureReason:v14 recoverySuggestion:v16 errorCode:-1002];

    if (!a5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  int64_t v9 = 0;
  if (a5) {
LABEL_3:
  }
    *a5 = v9;
LABEL_4:

  return v7 != 0;
}

- (void)handleRequest:(id)a3 withReply:(id)a4 bundleIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(CHRemoteBasicRequestHandler *)self serverQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10001671C;
  v15[3] = &unk_100024BD0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v10;
  id v18 = v9;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_sync(v11, v15);
}

- (void)optimizeResourceUsage
{
}

- (void).cxx_destruct
{
}

@end