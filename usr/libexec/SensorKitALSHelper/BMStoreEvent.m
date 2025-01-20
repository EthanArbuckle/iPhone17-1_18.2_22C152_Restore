@interface BMStoreEvent
- (double)sr_eventTimestamp;
@end

@implementation BMStoreEvent

- (double)sr_eventTimestamp
{
  [(BMStoreEvent *)self eventBody];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
LABEL_2:
    [(BMStoreEvent *)self timestamp];
    return result;
  }
  [(BMStoreEvent *)self eventBody];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v5 = [(BMStoreEvent *)self eventBody];
  if (isKindOfClass)
  {
    id v6 = [v5 timestamp];
LABEL_11:
    [v6 timeIntervalSinceReferenceDate];
    return result;
  }
  objc_opt_class();
  char v7 = objc_opt_isKindOfClass();
  id v8 = [(BMStoreEvent *)self eventBody];
  if (v7) {
    goto LABEL_8;
  }
  objc_opt_class();
  char v9 = objc_opt_isKindOfClass();
  id v10 = [(BMStoreEvent *)self eventBody];
  if (v9)
  {
    id v6 = [v10 startDate];
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_2;
  }
  [(BMStoreEvent *)self eventBody];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_2;
  }
  [(BMStoreEvent *)self eventBody];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_2;
  }
  [(BMStoreEvent *)self eventBody];
  objc_opt_class();
  char v11 = objc_opt_isKindOfClass();
  id v8 = [(BMStoreEvent *)self eventBody];
  if ((v11 & 1) != 0
    || (objc_opt_class(),
        char v12 = objc_opt_isKindOfClass(),
        id v8 = [(BMStoreEvent *)self eventBody],
        (v12 & 1) != 0))
  {
LABEL_8:
    id v6 = [v8 absoluteTimestamp];
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_2;
  }
  if (qword_10002AA28 != -1) {
    dispatch_once(&qword_10002AA28, &stru_100024B28);
  }
  v13 = qword_10002AA30;
  if (os_log_type_enabled((os_log_t)qword_10002AA30, OS_LOG_TYPE_ERROR))
  {
    v14 = (objc_class *)objc_opt_class();
    int v15 = 138412290;
    v16 = NSStringFromClass(v14);
    _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Got event with unknown type: %@", (uint8_t *)&v15, 0xCu);
  }
  return NAN;
}

@end