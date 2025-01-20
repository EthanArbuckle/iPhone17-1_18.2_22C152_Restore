@interface MLRExtensionHostContext
+ (id)_extensionAuxiliaryHostProtocol;
+ (id)_extensionAuxiliaryVendorProtocol;
- (id)issueSandBoxExtensionsForFileURLs:(id)a3 requireWrite:(BOOL)a4 outError:(id *)a5;
- (int)pid;
- (void)performOnRemoteObjectSynchronously:(BOOL)a3 WithBlock:(id)a4 errorHandler:(id)a5;
- (void)performOnRemoteObjectSynchronouslyWithBlock:(id)a3 errorHandler:(id)a4;
- (void)performOnRemoteObjectWithBlock:(id)a3 errorHandler:(id)a4;
@end

@implementation MLRExtensionHostContext

+ (id)_extensionAuxiliaryHostProtocol
{
  if (qword_10001F620 != -1) {
    dispatch_once(&qword_10001F620, &stru_100018B28);
  }
  v2 = (void *)qword_10001F628;

  return v2;
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (qword_10001F630 != -1) {
    dispatch_once(&qword_10001F630, &stru_100018B48);
  }
  v2 = (void *)qword_10001F638;

  return v2;
}

- (int)pid
{
  v2 = [(MLRExtensionHostContext *)self _auxiliaryConnection];
  int v3 = [v2 processIdentifier];

  return v3;
}

- (void)performOnRemoteObjectWithBlock:(id)a3 errorHandler:(id)a4
{
}

- (void)performOnRemoteObjectSynchronouslyWithBlock:(id)a3 errorHandler:(id)a4
{
}

- (void)performOnRemoteObjectSynchronously:(BOOL)a3 WithBlock:(id)a4 errorHandler:(id)a5
{
  BOOL v6 = a3;
  v8 = (void (**)(id, void *))a4;
  id v9 = a5;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = sub_10000FA4C;
  v24 = sub_10000FA5C;
  id v25 = 0;
  [(MLRExtensionHostContext *)self _auxiliaryConnection];
  if (v6) {
    v10 = {;
  }
    v11 = v19;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10000FA64;
    v19[3] = &unk_100018B70;
    v19[5] = &v20;
    v19[4] = v9;
    uint64_t v12 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v19];
  }
  else {
    v10 = {;
  }
    v11 = v18;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10000FAFC;
    v18[3] = &unk_100018B70;
    v18[5] = &v20;
    v18[4] = v9;
    uint64_t v12 = [v10 remoteObjectProxyWithErrorHandler:v18];
  }
  v13 = (void *)v12;

  if (!v13)
  {
    v14 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10000FC28(v14);
    }

    if (!v21[5])
    {
      NSErrorUserInfoKey v26 = NSLocalizedDescriptionKey;
      CFStringRef v27 = @"Fail to create remote object proxy.";
      v15 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      uint64_t v16 = +[NSError errorWithDomain:kDESDistributedEvaluationErrorDomain code:8000 userInfo:v15];
      v17 = (void *)v21[5];
      v21[5] = v16;
    }
    if (v9) {
      (*((void (**)(id, uint64_t))v9 + 2))(v9, v21[5]);
    }
  }
  if (v8) {
    v8[2](v8, v13);
  }

  _Block_object_dispose(&v20, 8);
}

- (id)issueSandBoxExtensionsForFileURLs:(id)a3 requireWrite:(BOOL)a4 outError:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = [(MLRExtensionHostContext *)self _auxiliaryConnection];
  v10 = +[DESSandBoxManager sandboxExtensionsToXPCConnection:v9 fileURLs:v8 requireWrite:v6 outError:a5];

  return v10;
}

@end