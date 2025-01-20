@interface SDAppleIDURLResponse
- (NSDictionary)responseInfo;
- (SDAppleIDURLResponse)initWithHTTPUTLResponse:(id)a3 data:(id)a4;
- (int64_t)statusCode;
@end

@implementation SDAppleIDURLResponse

- (SDAppleIDURLResponse)initWithHTTPUTLResponse:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SDAppleIDURLResponse;
  v8 = [(SDAppleIDURLResponse *)&v16 init];
  if (v8)
  {
    v8->_statusCode = (int64_t)[v6 statusCode];
    v9 = [v6 MIMEType];
    unsigned int v10 = [v9 hasPrefix:@"application/json"];

    if (v10)
    {
      id v15 = 0;
      v11 = +[NSJSONSerialization JSONObjectWithData:v7 options:0 error:&v15];
      id v12 = v15;
      if (v11)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_storeStrong((id *)&v8->_responseInfo, v11);
        }
        else if (dword_100967E58 <= 60 && (dword_100967E58 != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
      }
      else
      {
        if (dword_100967E58 <= 60 && (dword_100967E58 != -1 || _LogCategory_Initialize()))
        {
          v14 = [v12 localizedDescription];
          LogPrintF();
        }
        v11 = 0;
      }
    }
    else
    {
      v11 = 0;
      id v12 = 0;
    }
  }
  return v8;
}

- (NSDictionary)responseInfo
{
  return self->_responseInfo;
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (void).cxx_destruct
{
}

@end