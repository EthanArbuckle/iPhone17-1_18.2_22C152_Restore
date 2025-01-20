@interface ContextAwareObject
- (BOOL)isContextTriggered;
- (BOOL)synchContext;
- (id)initCTXBase;
- (int)ctxType;
- (int)getContextState;
@end

@implementation ContextAwareObject

- (int)ctxType
{
  return self->ctxType;
}

- (id)initCTXBase
{
  v3.receiver = self;
  v3.super_class = (Class)ContextAwareObject;
  id result = [(ContextAwareObject *)&v3 init];
  if (result) {
    *((unsigned char *)result + 8) = 0;
  }
  return result;
}

- (int)getContextState
{
  v2 = qword_1000AABC0;
  if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
    sub_100054A1C(v2, v3, v4, v5, v6, v7, v8, v9);
  }
  return -1;
}

- (BOOL)isContextTriggered
{
  v2 = qword_1000AABC0;
  if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
    sub_100054A54(v2, v3, v4, v5, v6, v7, v8, v9);
  }
  return 0;
}

- (BOOL)synchContext
{
  v2 = qword_1000AABC0;
  if (os_log_type_enabled((os_log_t)qword_1000AABC0, OS_LOG_TYPE_ERROR)) {
    sub_100054A8C(v2, v3, v4, v5, v6, v7, v8, v9);
  }
  return 0;
}

@end