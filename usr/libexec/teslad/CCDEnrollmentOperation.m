@interface CCDEnrollmentOperation
- (BOOL)certificateRetrievalFailed;
- (NSError)error;
- (NSTimer)timeoutTimer;
- (double)retryAfterInterval;
- (id)enrollmentCompletionBlock;
- (id)errorForStatusCode:(int64_t)a3 responseData:(id)a4;
- (id)responseWithResponseData:(id)a3 contentType:(id)a4 outError:(id *)a5;
- (id)responseWithResponseData:(id)a3 contentType:(id)a4 statusCode:(int64_t)a5 retryNeeded:(BOOL *)a6 outError:(id *)a7;
- (int64_t)certificateRetrievalRequestCount;
- (void)completeOperationWithResponse:(id)a3 error:(id)a4;
- (void)setCertificateRetrievalFailed:(BOOL)a3;
- (void)setCertificateRetrievalRequestCount:(int64_t)a3;
- (void)setEnrollmentCompletionBlock:(id)a3;
- (void)setError:(id)a3;
- (void)setRetryAfterInterval:(double)a3;
- (void)setTimeoutTimer:(id)a3;
@end

@implementation CCDEnrollmentOperation

- (id)responseWithResponseData:(id)a3 contentType:(id)a4 statusCode:(int64_t)a5 retryNeeded:(BOOL *)a6 outError:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  if (a5 <= 499)
  {
    if (a5 == 200 || a5 == 204)
    {
      v14 = [(CCDEnrollmentOperation *)self responseWithResponseData:v12 contentType:v13 outError:a7];
      goto LABEL_14;
    }
    goto LABEL_10;
  }
  if (a5 != 500)
  {
    if (a5 == 503)
    {
      v14 = 0;
      *a6 = 1;
      goto LABEL_14;
    }
LABEL_10:
    if (a7)
    {
      v15 = [(CCDEnrollmentOperation *)self errorForStatusCode:a5 responseData:v12];
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  if (a7)
  {
    v15 = +[CCDError teslaServiceDownError];
LABEL_12:
    v14 = 0;
    *a7 = v15;
    goto LABEL_14;
  }
LABEL_13:
  v14 = 0;
LABEL_14:

  return v14;
}

- (void)completeOperationWithResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CCDEnrollmentOperation *)self enrollmentCompletionBlock];

  if (v8)
  {
    if (v7)
    {
      v9 = *(NSObject **)(DEPLogObjects() + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412290;
        id v13 = v7;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Error: %@", (uint8_t *)&v12, 0xCu);
      }
    }
    v10 = [(CCDEnrollmentOperation *)self enrollmentCompletionBlock];
    ((void (**)(void, BOOL, id, id))v10)[2](v10, v7 == 0, v6, v7);
  }
  else
  {
    v11 = *(NSObject **)(DEPLogObjects() + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "No completion block, canceling operation", (uint8_t *)&v12, 2u);
    }
    [(CCDEnrollmentOperation *)self cancel];
  }
}

- (id)responseWithResponseData:(id)a3 contentType:(id)a4 outError:(id *)a5
{
  return 0;
}

- (id)errorForStatusCode:(int64_t)a3 responseData:(id)a4
{
  return 0;
}

- (id)enrollmentCompletionBlock
{
  return *(id *)(&self->_certificateRetrievalFailed + 3);
}

- (void)setEnrollmentCompletionBlock:(id)a3
{
}

- (int64_t)certificateRetrievalRequestCount
{
  return *(int64_t *)((char *)&self->_enrollmentCompletionBlock + 3);
}

- (void)setCertificateRetrievalRequestCount:(int64_t)a3
{
  *(id *)((char *)&self->_enrollmentCompletionBlock + 3) = (id)a3;
}

- (NSTimer)timeoutTimer
{
  return *(NSTimer **)((char *)&self->_certificateRetrievalRequestCount + 3);
}

- (void)setTimeoutTimer:(id)a3
{
}

- (BOOL)certificateRetrievalFailed
{
  return BYTE3(self->super._httpResponseContentType);
}

- (void)setCertificateRetrievalFailed:(BOOL)a3
{
  BYTE3(self->super._httpResponseContentType) = a3;
}

- (double)retryAfterInterval
{
  return *(double *)((char *)&self->_timeoutTimer + 3);
}

- (void)setRetryAfterInterval:(double)a3
{
  *(double *)((char *)&self->_timeoutTimer + 3) = a3;
}

- (NSError)error
{
  return *(NSError **)((char *)&self->_retryAfterInterval + 3);
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_retryAfterInterval + 3), 0);
  objc_storeStrong((id *)((char *)&self->_certificateRetrievalRequestCount + 3), 0);

  objc_storeStrong((id *)(&self->_certificateRetrievalFailed + 3), 0);
}

@end