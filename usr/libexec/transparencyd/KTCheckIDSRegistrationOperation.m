@interface KTCheckIDSRegistrationOperation
+ (BOOL)checkPCSKTSignature:(id)a3 data:(id)a4 signature:(id)a5;
- (BOOL)hasRecentlyDoneHSA2Upsell;
- (KTCheckIDSRegistrationInterface)idsRegistrationInterface;
- (KTCheckIDSRegistrationOperation)initWithDependencies:(id)a3 application:(id)a4 pcs:(id)a5 idsRegistrationInterface:(id)a6;
- (KTOperationDependencies)deps;
- (KTPCSOperationDependency)pcsOperation;
- (NSOperation)finishedOp;
- (NSString)application;
- (int64_t)checkIDSResult;
- (void)groupStart;
- (void)setApplication:(id)a3;
- (void)setCheckIDSError:(int64_t)a3;
- (void)setCheckIDSResult:(int64_t)a3;
- (void)setDeps:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setIdsRegistrationInterface:(id)a3;
- (void)setPcsOperation:(id)a3;
@end

@implementation KTCheckIDSRegistrationOperation

- (KTCheckIDSRegistrationOperation)initWithDependencies:(id)a3 application:(id)a4 pcs:(id)a5 idsRegistrationInterface:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)KTCheckIDSRegistrationOperation;
  v14 = [(KTGroupOperation *)&v18 init];
  v15 = v14;
  if (v14)
  {
    [(KTCheckIDSRegistrationOperation *)v14 setDeps:v10];
    [(KTCheckIDSRegistrationOperation *)v15 setApplication:v11];
    [(KTCheckIDSRegistrationOperation *)v15 setPcsOperation:v12];
    [(KTCheckIDSRegistrationOperation *)v15 setIdsRegistrationInterface:v13];
    [(KTCheckIDSRegistrationOperation *)v15 setCheckIDSResult:0];
    v16 = v15;
  }

  return v15;
}

+ (BOOL)checkPCSKTSignature:(id)a3 data:(id)a4 signature:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  uint64_t v8 = PCSPublicIdentityCreateWithPublicKeyInfo();
  if (v8)
  {
    v9 = (const void *)v8;
    char v10 = PCSValidateSignature();
    CFRelease(v9);
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)hasRecentlyDoneHSA2Upsell
{
  v3 = +[NSDate now];
  v4 = [v3 dateByAddingTimeInterval:-600.0];

  v5 = [(KTCheckIDSRegistrationOperation *)self deps];
  id v6 = [v5 idsAccountTracker];
  id v7 = [v6 timeOfLastUpsell];
  BOOL v8 = [v7 compare:v4] == (id)1;

  return v8;
}

- (void)groupStart
{
  v3 = [(KTCheckIDSRegistrationOperation *)self pcsOperation];
  id v16 = 0;
  v4 = [v3 getCurrentKTPCSIdentity:off_100325BD8 error:&v16];
  id v5 = v16;

  if (v4)
  {
    [v4 identity];
    id v6 = (void *)PCSIdentityCopyPublicKeyInfo();
    id v7 = objc_alloc_init((Class)NSOperation);
    [(KTCheckIDSRegistrationOperation *)self setFinishedOp:v7];

    BOOL v8 = [(KTCheckIDSRegistrationOperation *)self finishedOp];
    [(KTGroupOperation *)self dependOnBeforeGroupFinished:v8];

    id location = 0;
    objc_initWeak(&location, self);
    v9 = [(KTCheckIDSRegistrationOperation *)self deps];
    char v10 = [v9 idsOperations];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1001AEEB4;
    v12[3] = &unk_1002C5758;
    objc_copyWeak(&v14, &location);
    id v11 = v6;
    id v13 = v11;
    [v10 fetchKTRegistrationStatus:v12];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    [(KTCheckIDSRegistrationOperation *)self setCheckIDSError:7];
  }
}

- (void)setCheckIDSError:(int64_t)a3
{
  -[KTCheckIDSRegistrationOperation setCheckIDSResult:](self, "setCheckIDSResult:");
  CFStringRef v8 = @"checkIDSError";
  id v5 = +[NSNumber numberWithInteger:a3];
  v9 = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];

  id v7 = +[TransparencyError errorWithDomain:kTransparencyErrorServer code:-365 underlyingError:0 userinfo:v6 description:@"CheckIDS failed"];
  [(KTResultOperation *)self setError:v7];
}

- (int64_t)checkIDSResult
{
  return self->_checkIDSResult;
}

- (void)setCheckIDSResult:(int64_t)a3
{
  self->_checkIDSResult = a3;
}

- (KTOperationDependencies)deps
{
  return (KTOperationDependencies *)objc_getProperty(self, a2, 128, 1);
}

- (void)setDeps:(id)a3
{
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 136, 1);
}

- (void)setFinishedOp:(id)a3
{
}

- (KTCheckIDSRegistrationInterface)idsRegistrationInterface
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_idsRegistrationInterface);

  return (KTCheckIDSRegistrationInterface *)WeakRetained;
}

- (void)setIdsRegistrationInterface:(id)a3
{
}

- (KTPCSOperationDependency)pcsOperation
{
  return (KTPCSOperationDependency *)objc_getProperty(self, a2, 152, 1);
}

- (void)setPcsOperation:(id)a3
{
}

- (NSString)application
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (void)setApplication:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_application, 0);
  objc_storeStrong((id *)&self->_pcsOperation, 0);
  objc_destroyWeak((id *)&self->_idsRegistrationInterface);
  objc_storeStrong((id *)&self->_finishedOp, 0);

  objc_storeStrong((id *)&self->_deps, 0);
}

@end