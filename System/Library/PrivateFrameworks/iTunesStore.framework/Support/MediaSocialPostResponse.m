@interface MediaSocialPostResponse
+ (id)_unrecoverableErrors;
- (BOOL)_isUnrecoverable:(id)a3 statusCode:(int64_t)a4;
- (NSError)error;
- (NSString)activityIdentifier;
- (NSString)serviceErrorLabel;
- (NSString)serviceErrorMessage;
- (NSString)status;
- (NSURL)activityURL;
- (double)pollDuration;
- (double)pollingInterval;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)postIdentifier;
- (int64_t)result;
- (int64_t)statusCode;
- (void)setActivityIdentifier:(id)a3;
- (void)setActivityURL:(id)a3;
- (void)setError:(id)a3;
- (void)setPollDuration:(double)a3;
- (void)setPollingInterval:(double)a3;
- (void)setPostIdentifier:(int64_t)a3;
- (void)setResult:(int64_t)a3;
- (void)setServiceErrorLabel:(id)a3;
- (void)setServiceErrorMessage:(id)a3;
- (void)setStatus:(id)a3;
- (void)setStatusCode:(int64_t)a3;
- (void)setValuesWithResponseDictionary:(id)a3;
@end

@implementation MediaSocialPostResponse

- (void)setValuesWithResponseDictionary:(id)a3
{
  id v18 = a3;
  v4 = [v18 objectForKey:@"id"];
  if (!v4)
  {
    v4 = [v18 objectForKey:@"activityId"];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(MediaSocialPostResponse *)self setActivityIdentifier:v4];
  }
  v5 = [v18 objectForKey:@"pollInterval"];
  if (objc_opt_respondsToSelector())
  {
    [v5 doubleValue];
    -[MediaSocialPostResponse setPollingInterval:](self, "setPollingInterval:");
  }
  v6 = [v18 objectForKey:@"pollDuration"];
  if (objc_opt_respondsToSelector())
  {
    [v6 doubleValue];
    -[MediaSocialPostResponse setPollDuration:](self, "setPollDuration:");
  }
  v7 = [v18 objectForKey:@"state"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (([v7 isEqualToString:@"pending"] & 1) != 0
      || ([v7 isEqualToString:@"processing"] & 1) != 0)
    {
      int v8 = 1;
      goto LABEL_16;
    }
    if ([v7 isEqualToString:@"published"]) {
      [(MediaSocialPostResponse *)self setResult:4];
    }
  }
  int v8 = 0;
LABEL_16:
  v9 = [v18 objectForKey:@"status"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v11 = v18;
  if (isKindOfClass)
  {
    if (([v9 isEqualToString:@"success"] & 1) != 0
      || [v9 isEqualToString:@"published"])
    {
      if (v8) {
        uint64_t v12 = 3;
      }
      else {
        uint64_t v12 = 4;
      }
      [(MediaSocialPostResponse *)self setResult:v12];
    }
    else
    {
      [(MediaSocialPostResponse *)self setStatus:v9];
      v13 = [v18 objectForKey:@"serviceErrorLabel"];
      v14 = [v18 objectForKey:@"serviceErrorMessage"];
      if (v14) {
        [(MediaSocialPostResponse *)self setServiceErrorMessage:v14];
      }
      if ([(MediaSocialPostResponse *)self _isUnrecoverable:v13 statusCode:[(MediaSocialPostResponse *)self statusCode]])
      {
        uint64_t v15 = 2;
      }
      else
      {
        uint64_t v15 = v14 != 0;
      }
      [(MediaSocialPostResponse *)self setResult:v15];
    }
    v11 = v18;
  }
  v16 = [v11 objectForKey:@"url"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v17 = [objc_alloc((Class)NSURL) initWithString:v16];
    [(MediaSocialPostResponse *)self setActivityURL:v17];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 setActivityIdentifier:self->_activityIdentifier];
  [v4 setActivityURL:self->_activityURL];
  [v4 setError:self->_error];
  [v4 setPollingInterval:self->_pollingInterval];
  [v4 setPostIdentifier:self->_postIdentifier];
  [v4 setResult:self->_result];
  return v4;
}

- (BOOL)_isUnrecoverable:(id)a3 statusCode:(int64_t)a4
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  v5 = +[MediaSocialPostResponse _unrecoverableErrors];
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

+ (id)_unrecoverableErrors
{
  if (qword_100401EB0 != -1) {
    dispatch_once(&qword_100401EB0, &stru_1003A72A8);
  }
  v2 = (void *)qword_100401EA8;

  return v2;
}

- (NSString)activityIdentifier
{
  return self->_activityIdentifier;
}

- (void)setActivityIdentifier:(id)a3
{
}

- (NSURL)activityURL
{
  return self->_activityURL;
}

- (void)setActivityURL:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (double)pollDuration
{
  return self->_pollDuration;
}

- (void)setPollDuration:(double)a3
{
  self->_pollDuration = a3;
}

- (double)pollingInterval
{
  return self->_pollingInterval;
}

- (void)setPollingInterval:(double)a3
{
  self->_pollingInterval = a3;
}

- (int64_t)postIdentifier
{
  return self->_postIdentifier;
}

- (void)setPostIdentifier:(int64_t)a3
{
  self->_postIdentifier = a3;
}

- (int64_t)result
{
  return self->_result;
}

- (void)setResult:(int64_t)a3
{
  self->_result = a3;
}

- (NSString)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (void)setStatusCode:(int64_t)a3
{
  self->_statusCode = a3;
}

- (NSString)serviceErrorLabel
{
  return self->_serviceErrorLabel;
}

- (void)setServiceErrorLabel:(id)a3
{
}

- (NSString)serviceErrorMessage
{
  return self->_serviceErrorMessage;
}

- (void)setServiceErrorMessage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceErrorMessage, 0);
  objc_storeStrong((id *)&self->_serviceErrorLabel, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_activityURL, 0);

  objc_storeStrong((id *)&self->_activityIdentifier, 0);
}

@end