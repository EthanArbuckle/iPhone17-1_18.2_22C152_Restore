@interface ICPushNotificationsResponse
- (ICPushNotificationsResponse)initWithResponseDictionary:(id)a3;
- (int64_t)statusCode;
@end

@implementation ICPushNotificationsResponse

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (ICPushNotificationsResponse)initWithResponseDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(ICPushNotificationsResponse *)self init];
  if (v5)
  {
    v6 = [v4 objectForKey:@"status"];
    if (objc_opt_respondsToSelector()) {
      v5->_statusCode = [v6 integerValue];
    }
  }
  return v5;
}

@end