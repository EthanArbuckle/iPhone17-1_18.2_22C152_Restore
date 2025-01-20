@interface CCDEnrollmentUnenrollOperation
- (id)errorForStatusCode:(int64_t)a3 responseData:(id)a4;
- (id)responseWithResponseData:(id)a3 contentType:(id)a4 outError:(id *)a5;
@end

@implementation CCDEnrollmentUnenrollOperation

- (id)errorForStatusCode:(int64_t)a3 responseData:(id)a4
{
  id v5 = a4;
  if (a3 == 401)
  {
    v6 = +[CCDError cloudConfigErrorInResponse:v5];
    v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = +[CCDError internalErrorWithCode:34000];
    }
    v9 = v8;
  }
  else
  {
    if (a3 == 400) {
      +[CCDError cloudConfigErrorInResponse:v5];
    }
    else {
    v9 = +[CCDError teslaServiceDownError];
    }
  }

  return v9;
}

- (id)responseWithResponseData:(id)a3 contentType:(id)a4 outError:(id *)a5
{
  return 0;
}

@end