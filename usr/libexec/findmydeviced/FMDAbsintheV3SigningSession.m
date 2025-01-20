@interface FMDAbsintheV3SigningSession
- (FMDAbsintheV3SigningSession)init;
- (NSError)pscError;
- (NSOperationQueue)queue;
- (NSString)cause;
- (NSUUID)activationLockRequestUUID;
- (PSCSessionInternal_)pscSessionRef;
- (id)signatureForData:(id)a3 error:(id *)a4;
- (unint64_t)mode;
- (void)_destroySession;
- (void)establishSessionWithServerInteractionController:(id)a3;
- (void)setActivationLockRequestUUID:(id)a3;
- (void)setCause:(id)a3;
- (void)setMode:(unint64_t)a3;
- (void)setPscError:(id)a3;
- (void)setPscSessionRef:(PSCSessionInternal_ *)a3;
- (void)setQueue:(id)a3;
@end

@implementation FMDAbsintheV3SigningSession

- (FMDAbsintheV3SigningSession)init
{
  v5.receiver = self;
  v5.super_class = (Class)FMDAbsintheV3SigningSession;
  v2 = [(FMDAbsintheV3SigningSession *)&v5 init];
  v3 = v2;
  if (v2) {
    [(FMDAbsintheV3SigningSession *)v2 setMode:0];
  }
  return v3;
}

- (void)establishSessionWithServerInteractionController:(id)a3
{
  id v4 = a3;
  [(FMDAbsintheV3SigningSession *)self _destroySession];
  objc_super v5 = sub_100004238();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Initializing session...", buf, 2u);
  }

  id v6 = [objc_alloc((Class)FMSynchronizer) initWithDescription:@"createSessionForSignature" andTimeout:-1.0];
  uint64_t v30 = 0;
  *(void *)buf = 0;
  unsigned int v29 = 0;
  [(FMDAbsintheV3SigningSession *)self setPscError:0];
  uint64_t v7 = sub_1002396E8((uint64_t)buf, (uint64_t)&v30, (uint64_t)&v29);
  if (v7)
  {
    uint64_t v8 = v7;
    v9 = sub_100004238();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      sub_10023DC00(v8, v9);
    }

    CFStringRef v32 = @"kFMDUnderlyingErrorCodeKey";
    v10 = +[NSNumber numberWithInt:v8];
    v33 = v10;
    v11 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    v12 = +[NSError errorWithDomain:@"FMDAbsintheV3SigningSessionErrorDomain" code:1 userInfo:v11];
    [(FMDAbsintheV3SigningSession *)self setPscError:v12];

    v13 = 0;
  }
  else
  {
    v10 = +[NSData dataWithBytes:v30 length:v29];
    v13 = [v10 base64EncodedStringWithOptions:0];
    [(FMDAbsintheV3SigningSession *)self setPscSessionRef:*(void *)buf];
    v14 = sub_100004238();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_10023DB84(self);
    }

    sub_1000FC54C(v30);
  }

  v15 = +[FMDServiceProvider activeServiceProvider];
  BOOL v16 = [(FMDAbsintheV3SigningSession *)self mode] == 0;
  v17 = [FMDRequestIdentityV3Session alloc];
  v18 = [(FMDAbsintheV3SigningSession *)self activationLockRequestUUID];
  v19 = [(FMDRequestIdentityV3Session *)v17 initWithProvider:v15 activationLockRequestUUID:v18 pscHelloMsg:v13];

  [(FMDRequestIdentityV3Session *)v19 setRequiresAuthentication:v16];
  v20 = [(FMDAbsintheV3SigningSession *)self cause];
  [(FMDRequestIdentityV3Session *)v19 setCause:v20];

  v23 = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472;
  v25 = sub_10004181C;
  v26 = &unk_1002DAE58;
  v27 = self;
  id v21 = v6;
  id v28 = v21;
  [(FMDRequest *)v19 setCompletionHandler:&v23];
  unsigned int v22 = [v4 enqueueRequest:v19, v23, v24, v25, v26, v27];

  if (v22) {
    [v21 wait];
  }
}

- (id)signatureForData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(FMDAbsintheV3SigningSession *)self pscSessionRef])
  {
    uint64_t v26 = 0;
    unsigned int v25 = 0;
    uint64_t v24 = 0;
    unsigned int v23 = 0;
    uint64_t v7 = sub_100004238();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [v6 base64EncodedStringWithOptions:4];
      *(_DWORD *)buf = 138412290;
      v31 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "FMDAbsintheV3SigningSession digest to sign : %@", buf, 0xCu);
    }
    v9 = [(FMDAbsintheV3SigningSession *)self pscSessionRef];
    id v10 = v6;
    uint64_t v11 = sub_10011AB24((uint64_t)v9, (uint64_t)[v10 bytes], (int)[v10 length], (uint64_t)&v26, (uint64_t)&v25, (uint64_t)&v24, (uint64_t)&v23);
    if (v11)
    {
      uint64_t v12 = v11;
      v13 = sub_100004238();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        sub_10023E018(v12, v13);
      }

      CFStringRef v28 = @"kFMDUnderlyingErrorCodeKey";
      v14 = +[NSNumber numberWithInt:v12];
      unsigned int v29 = v14;
      v15 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
      id v16 = +[NSError errorWithDomain:@"FMDAbsintheV3SigningSessionErrorDomain" code:3 userInfo:v15];
      v17 = 0;
    }
    else
    {
      v14 = +[NSData dataWithBytes:v26 length:v25];
      v15 = +[NSData dataWithBytes:v24 length:v23];
      v27[0] = v14;
      v27[1] = v15;
      v17 = +[NSArray arrayWithObjects:v27 count:2];
      id v16 = 0;
    }

    [(FMDAbsintheV3SigningSession *)self _destroySession];
    if (a4) {
      goto LABEL_12;
    }
  }
  else
  {
    id v16 = 0;
    v17 = 0;
    if (a4)
    {
LABEL_12:
      uint64_t v18 = [(FMDAbsintheV3SigningSession *)self pscError];
      v19 = (void *)v18;
      if (v18) {
        v20 = (void *)v18;
      }
      else {
        v20 = v16;
      }
      id v21 = v20;

      id v16 = v21;
      *a4 = v16;
    }
  }

  return v17;
}

- (void)_destroySession
{
  v3 = sub_100004238();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10023E090();
  }

  if ([(FMDAbsintheV3SigningSession *)self pscSessionRef])
  {
    id v4 = sub_100004238();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "AbsinthV3 invalidting psc session", v5, 2u);
    }

    sub_1001AD1D0((uint64_t)[(FMDAbsintheV3SigningSession *)self pscSessionRef]);
    [(FMDAbsintheV3SigningSession *)self setPscSessionRef:0];
  }
}

- (NSUUID)activationLockRequestUUID
{
  return self->_activationLockRequestUUID;
}

- (void)setActivationLockRequestUUID:(id)a3
{
}

- (NSString)cause
{
  return self->_cause;
}

- (void)setCause:(id)a3
{
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (PSCSessionInternal_)pscSessionRef
{
  return self->_pscSessionRef;
}

- (void)setPscSessionRef:(PSCSessionInternal_ *)a3
{
  self->_pscSessionRef = a3;
}

- (NSError)pscError
{
  return self->_pscError;
}

- (void)setPscError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pscError, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cause, 0);

  objc_storeStrong((id *)&self->_activationLockRequestUUID, 0);
}

@end