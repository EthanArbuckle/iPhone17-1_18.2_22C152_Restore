@interface INAccountEventDetailsResponse
- (BOOL)showAlert;
- (INAccountEventDetailsResponse)initWithHTTPResponse:(id)a3 data:(id)a4;
- (NSString)alternateButtonTitle;
- (NSString)defaultButtonTitle;
- (NSString)message;
- (NSString)title;
- (NSURL)alternateButtonURL;
- (NSURL)defaultButtonURL;
- (id)_parseURLFromAlertParameterWithName:(id)a3;
@end

@implementation INAccountEventDetailsResponse

- (INAccountEventDetailsResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)INAccountEventDetailsResponse;
  v8 = [(INAccountEventDetailsResponse *)&v20 initWithHTTPResponse:a3 data:v7 bodyIsPlist:0];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_responseData, a4);
    if (v7)
    {
      id v19 = 0;
      uint64_t v10 = +[NSJSONSerialization JSONObjectWithData:v7 options:0 error:&v19];
      id v11 = v19;
      responseParameters = v9->_responseParameters;
      v9->_responseParameters = (NSDictionary *)v10;

      if (v11)
      {
        v13 = _INLogSystem();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_100028EC8((uint64_t)v7, (uint64_t)v11, v13);
        }
      }
      uint64_t v14 = [(NSDictionary *)v9->_responseParameters objectForKeyedSubscript:@"alert"];
      alertParameters = v9->_alertParameters;
      v9->_alertParameters = (NSDictionary *)v14;

      if (v9->_alertParameters) {
        goto LABEL_14;
      }
      v16 = _INLogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "No alert parameters in server response!", v18, 2u);
      }
    }
    else
    {
      v16 = _INLogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_100028E84(v16);
      }
      id v11 = 0;
    }

LABEL_14:
  }

  return v9;
}

- (BOOL)showAlert
{
  v2 = [(NSDictionary *)self->_responseParameters objectForKey:@"showMessage"];
  v3 = _INLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100028F8C((uint64_t)v2, v3);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned __int8 v4 = [v2 isEqualToString:@"true"];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v5 = 0;
      goto LABEL_9;
    }
    unsigned __int8 v4 = [v2 BOOLValue];
  }
  BOOL v5 = v4;
LABEL_9:

  return v5;
}

- (NSString)title
{
  return (NSString *)[(NSDictionary *)self->_alertParameters objectForKey:@"title"];
}

- (NSString)message
{
  return (NSString *)[(NSDictionary *)self->_alertParameters objectForKey:@"text"];
}

- (NSString)defaultButtonTitle
{
  return (NSString *)[(NSDictionary *)self->_alertParameters objectForKey:@"okButtonTitle"];
}

- (NSString)alternateButtonTitle
{
  return (NSString *)[(NSDictionary *)self->_alertParameters objectForKey:@"cancelButtonTitle"];
}

- (NSURL)defaultButtonURL
{
  return (NSURL *)[(INAccountEventDetailsResponse *)self _parseURLFromAlertParameterWithName:@"okButtonURL"];
}

- (NSURL)alternateButtonURL
{
  return (NSURL *)[(INAccountEventDetailsResponse *)self _parseURLFromAlertParameterWithName:@"cancelButtonURL"];
}

- (id)_parseURLFromAlertParameterWithName:(id)a3
{
  v3 = [(NSDictionary *)self->_alertParameters objectForKey:a3];
  if ([v3 length])
  {
    unsigned __int8 v4 = +[NSURL URLWithString:v3];
    if (!v4)
    {
      BOOL v5 = _INLogSystem();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_100029004((uint64_t)v3, v5);
      }
    }
  }
  else
  {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseData, 0);
  objc_storeStrong((id *)&self->_alertParameters, 0);
  objc_storeStrong((id *)&self->_responseParameters, 0);
}

@end