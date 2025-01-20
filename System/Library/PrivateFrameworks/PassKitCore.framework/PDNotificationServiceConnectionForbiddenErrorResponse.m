@interface PDNotificationServiceConnectionForbiddenErrorResponse
- (NSString)serverDebugDescription;
- (PDNotificationServiceConnectionForbiddenErrorResponse)initWithData:(id)a3;
- (int64_t)errorCode;
@end

@implementation PDNotificationServiceConnectionForbiddenErrorResponse

- (PDNotificationServiceConnectionForbiddenErrorResponse)initWithData:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v15 = 0;
    v5 = +[NSJSONSerialization JSONObjectWithData:v4 options:0 error:&v15];
    serverDebugDescription = (NSString *)v15;
    if (serverDebugDescription)
    {
      v7 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v17 = serverDebugDescription;
        v8 = "PDNotificationServiceConnectionForbiddenErrorResponse failed to parse response data with error: %@";
        v9 = v7;
        uint32_t v10 = 12;
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
        goto LABEL_14;
      }
      goto LABEL_14;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v8 = "PDNotificationServiceConnectionForbiddenErrorResponse body is not a dictionary";
        v9 = v7;
        uint32_t v10 = 2;
        goto LABEL_13;
      }
LABEL_14:

      v5 = 0;
      v11 = 0;
LABEL_15:

      goto LABEL_16;
    }
    if (v5)
    {
      v14.receiver = self;
      v14.super_class = (Class)PDNotificationServiceConnectionForbiddenErrorResponse;
      v11 = [(PDNotificationServiceConnectionForbiddenErrorResponse *)&v14 init];
      if (!v11)
      {
        self = 0;
        goto LABEL_16;
      }
      self = [v5 PKStringForKey:@"errorCode"];
      v11->_errorCode = (int64_t)[(PDNotificationServiceConnectionForbiddenErrorResponse *)self integerValue];
      uint64_t v12 = [v5 PKStringForKey:@"debugDescription"];
      serverDebugDescription = v11->_serverDebugDescription;
      v11->_serverDebugDescription = (NSString *)v12;
      goto LABEL_15;
    }
  }
  else
  {
    v5 = 0;
  }
  v11 = 0;
LABEL_16:

  return v11;
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (NSString)serverDebugDescription
{
  return self->_serverDebugDescription;
}

- (void).cxx_destruct
{
}

@end