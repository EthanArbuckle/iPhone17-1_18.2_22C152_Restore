@interface CHCachedRecognizerWrapper
- (CHCachedRecognizerWrapper)initWithRecognizer:(id)a3;
- (double)lastActiveTimestamp;
- (double)targetIdleLifetime;
- (id)checkOutRecognizer;
- (int64_t)activeRequestCount;
- (void)checkInRecognizer;
- (void)dealloc;
@end

@implementation CHCachedRecognizerWrapper

- (CHCachedRecognizerWrapper)initWithRecognizer:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CHCachedRecognizerWrapper;
  v6 = [(CHCachedRecognizerWrapper *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_recognizer, a3);
    v7->_activeRequestCount = 0;
    +[NSDate timeIntervalSinceReferenceDate];
    v7->_lastActiveTimestamp = v8;
    v7->_targetIdleLifetime = 120.0;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v5 recognitionMode] == 6) {
      v7->_targetIdleLifetime = 12.0;
    }
  }

  return v7;
}

- (id)checkOutRecognizer
{
  return self->_recognizer;
}

- (void)checkInRecognizer
{
  int64_t activeRequestCount = self->_activeRequestCount;
  self->_int64_t activeRequestCount = activeRequestCount - 1;
  if (activeRequestCount <= 0)
  {
    if (qword_10002B188 != -1) {
      dispatch_once(&qword_10002B188, &stru_100024A60);
    }
    v4 = (id)qword_10002B118;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "Recognizer is already fully checked in.", v6, 2u);
    }
  }
  +[NSDate timeIntervalSinceReferenceDate];
  self->_lastActiveTimestamp = v5;
}

- (void)dealloc
{
  recognizer = self->_recognizer;
  self->_recognizer = 0;

  v4.receiver = self;
  v4.super_class = (Class)CHCachedRecognizerWrapper;
  [(CHCachedRecognizerWrapper *)&v4 dealloc];
}

- (double)lastActiveTimestamp
{
  return self->_lastActiveTimestamp;
}

- (double)targetIdleLifetime
{
  return self->_targetIdleLifetime;
}

- (int64_t)activeRequestCount
{
  return self->_activeRequestCount;
}

- (void).cxx_destruct
{
}

@end