@interface BMEventSession
- (double)sr_eventTimestamp;
- (id)sr_data;
@end

@implementation BMEventSession

- (double)sr_eventTimestamp
{
  if (objc_msgSend(-[BMEventSession events](self, "events"), "count"))
  {
    id v3 = [[-[BMEventSession events](self, "events") firstObject];
    [v3 sr_eventTimestamp];
  }
  else
  {
    if (qword_10002A9F0 != -1) {
      dispatch_once(&qword_10002A9F0, &stru_1000249C8);
    }
    v5 = qword_10002A9F8;
    if (os_log_type_enabled((os_log_t)qword_10002A9F8, OS_LOG_TYPE_FAULT))
    {
      int v6 = 138412290;
      v7 = self;
      _os_log_fault_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "Event session is empty, impossible to get timestamp: %@", (uint8_t *)&v6, 0xCu);
    }
    return NAN;
  }
  return result;
}

- (id)sr_data
{
  if (objc_msgSend(-[BMEventSession events](self, "events"), "count"))
  {
    id v3 = [[-[BMEventSession events](self, "events") firstObject];
    return [v3 eventBody];
  }
  else
  {
    if (qword_10002A9F0 != -1) {
      dispatch_once(&qword_10002A9F0, &stru_1000249C8);
    }
    v5 = qword_10002A9F8;
    if (os_log_type_enabled((os_log_t)qword_10002A9F8, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      v7 = self;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Event session is empty, impossible to get data: %@", (uint8_t *)&v6, 0xCu);
    }
    return 0;
  }
}

@end