@interface CCDEnrollmentUploadPushTokenOperation
- (id)errorForStatusCode:(int64_t)a3 responseData:(id)a4;
- (id)responseWithResponseData:(id)a3 contentType:(id)a4 outError:(id *)a5;
@end

@implementation CCDEnrollmentUploadPushTokenOperation

- (id)errorForStatusCode:(int64_t)a3 responseData:(id)a4
{
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 0x190)
  {
    v4 = +[CCDError cloudConfigErrorInResponse:a4];
    v5 = v4;
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      id v6 = +[CCDError internalErrorWithCode:34000];
    }
    v7 = v6;
  }
  else
  {
    v7 = +[CCDError teslaServiceDownError];
  }

  return v7;
}

- (id)responseWithResponseData:(id)a3 contentType:(id)a4 outError:(id *)a5
{
  id v9 = 0;
  v5 = +[NSJSONSerialization JSONObjectWithData:a3 options:1 error:&v9];
  id v6 = v9;
  v7 = *(NSObject **)(DEPLogObjects() + 8);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Upload push token Response: %{public}@", buf, 0xCu);
  }

  return v5;
}

@end