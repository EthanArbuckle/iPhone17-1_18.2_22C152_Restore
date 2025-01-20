@interface ISUserNotification
- (ISUserNotification)init;
- (ISUserNotification)initWithDictionary:(id)a3 options:(unint64_t)a4;
- (NSDictionary)dictionary;
- (NSDictionary)userInfo;
- (__CFUserNotification)copyUserNotification;
- (int64_t)allowedRetryCount;
- (int64_t)currentRetryCount;
- (unint64_t)optionFlags;
- (void)dealloc;
- (void)setAllowedRetryCount:(int64_t)a3;
- (void)setCurrentRetryCount:(int64_t)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation ISUserNotification

- (ISUserNotification)init
{
  v3.receiver = self;
  v3.super_class = (Class)ISUserNotification;
  result = [(ISUserNotification *)&v3 init];
  if (result) {
    result->_allowedRetryCount = 3;
  }
  return result;
}

- (ISUserNotification)initWithDictionary:(id)a3 options:(unint64_t)a4
{
  v6 = [(ISUserNotification *)self init];
  if (v6)
  {
    v6->_dictionary = (NSDictionary *)[a3 copy];
    v6->_optionFlags = a4;
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ISUserNotification;
  [(ISUserNotification *)&v3 dealloc];
}

- (__CFUserNotification)copyUserNotification
{
  SInt32 error = 0;
  result = CFUserNotificationCreate(0, 0.0, self->_optionFlags, &error, (CFDictionaryRef)self->_dictionary);
  if (result) {
    BOOL v3 = error == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3)
  {
    CFRelease(result);
    return 0;
  }
  return result;
}

- (NSDictionary)dictionary
{
  v2 = self->_dictionary;

  return v2;
}

- (unint64_t)optionFlags
{
  return self->_optionFlags;
}

- (int64_t)allowedRetryCount
{
  return self->_allowedRetryCount;
}

- (void)setAllowedRetryCount:(int64_t)a3
{
  self->_allowedRetryCount = a3;
}

- (int64_t)currentRetryCount
{
  return self->_currentRetryCount;
}

- (void)setCurrentRetryCount:(int64_t)a3
{
  self->_currentRetryCount = a3;
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setUserInfo:(id)a3
{
}

@end