@interface CCDDeviceUploadSubmitDeviceOperation
- (id)responseWithResponseData:(id)a3 contentType:(id)a4 statusCode:(int64_t)a5 retryNeeded:(BOOL *)a6 outError:(id *)a7;
@end

@implementation CCDDeviceUploadSubmitDeviceOperation

- (id)responseWithResponseData:(id)a3 contentType:(id)a4 statusCode:(int64_t)a5 retryNeeded:(BOOL *)a6 outError:(id *)a7
{
  id v9 = a3;
  *a6 = 0;
  if (v9)
  {
    v10 = *(NSObject **)(DEPLogObjects() + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      id v12 = [objc_alloc((Class)NSString) initWithData:v9 encoding:4];
      int v15 = 138543362;
      id v16 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Response: %{public}@", (uint8_t *)&v15, 0xCu);
    }
    v13 = +[NSJSONSerialization JSONObjectWithData:v9 options:1 error:a7];
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end