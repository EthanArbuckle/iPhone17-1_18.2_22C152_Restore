@interface CCDRetrieveClientCertificateOperation
- (BOOL)certificateRetrievalFailed;
- (BOOL)isAsynchronous;
- (NSTimer)timeoutTimer;
- (id)certificateRetrievalCompletionBlock;
- (int64_t)certificateRetrievalRequestCount;
- (void)_completeOperationWithReferenceKey:(id)a3 certificates:(id)a4 error:(id)a5;
- (void)_retryCertificateRetrievalIfAllowed:(BOOL)a3 afterDelay:(double)a4 orFailWithError:(id)a5;
- (void)_retryCertificateRetrievalIfAllowedAfterDelayOrFailWithError:(id)a3;
- (void)_startRetryTimerWithInterval:(double)a3;
- (void)retrieveClientCertificate;
- (void)setCertificateRetrievalCompletionBlock:(id)a3;
- (void)setCertificateRetrievalFailed:(BOOL)a3;
- (void)setCertificateRetrievalRequestCount:(int64_t)a3;
- (void)setTimeoutTimer:(id)a3;
- (void)start;
- (void)timeoutTimerDidFire:(id)a3;
@end

@implementation CCDRetrieveClientCertificateOperation

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)start
{
  [(CCDOperation *)self setOperationExecuting:1];
  [(CCDOperation *)self setOperationFinished:0];

  [(CCDRetrieveClientCertificateOperation *)self retrieveClientCertificate];
}

- (void)retrieveClientCertificate
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10000C1BC;
  v2[3] = &unk_10001CA50;
  v2[4] = self;
  +[CCDDeviceIdentitySupport retrieveClientCertificateWithCompletion:v2];
}

- (void)_completeOperationWithReferenceKey:(id)a3 certificates:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(CCDRetrieveClientCertificateOperation *)self certificateRetrievalCompletionBlock];

  if (v11)
  {
    if (v10)
    {
      v12 = *(NSObject **)(DEPLogObjects() + 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138543618;
        v17 = self;
        __int16 v18 = 2112;
        id v19 = v10;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Error: %@", (uint8_t *)&v16, 0x16u);
      }
    }
    v13 = *(NSObject **)(DEPLogObjects() + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543362;
      v17 = self;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ completed. Calling the completion block.", (uint8_t *)&v16, 0xCu);
    }
    v14 = [(CCDRetrieveClientCertificateOperation *)self certificateRetrievalCompletionBlock];
    ((void (**)(void, id, id, id))v14)[2](v14, v8, v9, v10);
  }
  else
  {
    v15 = *(NSObject **)(DEPLogObjects() + 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543362;
      v17 = self;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "No completion block, canceling %{public}@", (uint8_t *)&v16, 0xCu);
    }
    [(CCDRetrieveClientCertificateOperation *)self cancel];
  }
  [(CCDOperation *)self endOperation];
}

- (void)_retryCertificateRetrievalIfAllowed:(BOOL)a3 afterDelay:(double)a4 orFailWithError:(id)a5
{
  if (a3)
  {
    v7 = *(NSObject **)(DEPLogObjects() + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Retrying the request", buf, 2u);
    }
    [(CCDRetrieveClientCertificateOperation *)self _startRetryTimerWithInterval:a4];
  }
  else
  {
    +[CCDError maxRetriesExceededErrorWithUnderlyingError:](CCDError, "maxRetriesExceededErrorWithUnderlyingError:", a5, a4);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    [(CCDRetrieveClientCertificateOperation *)self _completeOperationWithReferenceKey:0 certificates:0 error:v8];
  }
}

- (void)_retryCertificateRetrievalIfAllowedAfterDelayOrFailWithError:(id)a3
{
  id v4 = a3;
  [(CCDRetrieveClientCertificateOperation *)self setCertificateRetrievalRequestCount:(char *)[(CCDRetrieveClientCertificateOperation *)self certificateRetrievalRequestCount]+ 1];
  [(CCDRetrieveClientCertificateOperation *)self _retryCertificateRetrievalIfAllowed:[(CCDRetrieveClientCertificateOperation *)self certificateRetrievalRequestCount] < 5 afterDelay:v4 orFailWithError:4.0];
}

- (void)_startRetryTimerWithInterval:(double)a3
{
  id v5 = objc_alloc((Class)NSTimer);
  v6 = +[NSDate dateWithTimeIntervalSinceNow:a3];
  id v7 = [v5 initWithFireDate:v6 interval:self target:"timeoutTimerDidFire:" selector:0 userInfo:0 repeats:0.0];
  [(CCDRetrieveClientCertificateOperation *)self setTimeoutTimer:v7];

  id v9 = +[NSRunLoop mainRunLoop];
  id v8 = [(CCDRetrieveClientCertificateOperation *)self timeoutTimer];
  [v9 addTimer:v8 forMode:NSRunLoopCommonModes];
}

- (void)timeoutTimerDidFire:(id)a3
{
  if ([(CCDRetrieveClientCertificateOperation *)self certificateRetrievalFailed])
  {
    [(CCDRetrieveClientCertificateOperation *)self retrieveClientCertificate];
  }
}

- (id)certificateRetrievalCompletionBlock
{
  return *(id *)(&self->_certificateRetrievalFailed + 3);
}

- (void)setCertificateRetrievalCompletionBlock:(id)a3
{
}

- (BOOL)certificateRetrievalFailed
{
  return *(&self->super._operationReady + 1);
}

- (void)setCertificateRetrievalFailed:(BOOL)a3
{
  *(&self->super._operationReady + 1) = a3;
}

- (int64_t)certificateRetrievalRequestCount
{
  return *(int64_t *)((char *)&self->_certificateRetrievalCompletionBlock + 3);
}

- (void)setCertificateRetrievalRequestCount:(int64_t)a3
{
  *(id *)((char *)&self->_certificateRetrievalCompletionBlock + 3) = (id)a3;
}

- (NSTimer)timeoutTimer
{
  return *(NSTimer **)((char *)&self->_certificateRetrievalRequestCount + 3);
}

- (void)setTimeoutTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_certificateRetrievalRequestCount + 3), 0);

  objc_storeStrong((id *)(&self->_certificateRetrievalFailed + 3), 0);
}

@end