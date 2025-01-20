@interface CDIVowDyR1NTVdrU
+ (id)sharedInstance;
- (BOOL)l7UrdRfCzeduYqtA:(id)a3;
- (CDIVowDyR1NTVdrU)initWithServiceName:(id)a3;
- (id)BFzukpKGO3cStNGp:(id)a3;
- (void)JI0A3nkqsab9cUj8:(id)a3 completion:(id)a4;
- (void)QeMnG23X94qgz7jT:(id)a3 hostChallenge:(id)a4 challengeResponse:(id)a5 seid:(id)a6 nonce:(id)a7 completion:(id)a8;
- (void)Z8aAH7stm0EYhyxg:(id)a3 xz5EHXEN4FjlhJbi:(id)a4 uhVTXyAfCFn7u0Ue:(id)a5 EQUjQp7JcQbqcPcD:(id)a6 A5wDLa5TFdFZlz3A:(id)a7 TJKMyOe6zn5PdGIr:(id)a8 eCqgGM0WcnHOslnr:(unint64_t)a9 eCszfxdv3kUXvhgV:(unint64_t)a10 uWp4aZpP2vLhc04Q:(id)a11 QZYtNpvp0hKd248p:(id)a12 oCwPYmtRv8s31KUH:(id)a13 completion:(id)a14;
- (void)ZfE6lVphNUVrZcKx:(id)a3 completion:(id)a4;
- (void)evrtH713YbFfEOzk:(id)a3 completion:(id)a4;
- (void)llNEghuIdfPH7O8I:(BOOL)a3 all:(BOOL)a4 pregeneration:(BOOL)a5 workflowID:(id)a6 completion:(id)a7;
- (void)llNEghuIdfPH7O8I:(BOOL)a3 all:(BOOL)a4 workflowID:(id)a5 completion:(id)a6;
- (void)ofLBc0SV56ddaijH:(id)a3 i7D0Lridvo8oYoNd:(id)a4 completion:(id)a5;
- (void)uTtwJoGUgL3N0GVz;
- (void)updateRavioliWithCompletion:(id)a3;
- (void)vffg4lwI2HftPvpO:(id)a3;
@end

@implementation CDIVowDyR1NTVdrU

+ (id)sharedInstance
{
  if (qword_100760098 != -1) {
    dispatch_once(&qword_100760098, &stru_100709F90);
  }
  v2 = (void *)qword_100760090;

  return v2;
}

- (CDIVowDyR1NTVdrU)initWithServiceName:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CDIVowDyR1NTVdrU;
  v5 = [(CDIVowDyR1NTVdrU *)&v20 init];
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    disconnectionCallbacks = v5->_disconnectionCallbacks;
    v5->_disconnectionCallbacks = v6;

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.asd.interrupt", 0);
    syncQueue = v5->_syncQueue;
    v5->_syncQueue = (OS_dispatch_queue *)v8;

    v10 = (NSXPCConnection *)[objc_alloc((Class)NSXPCConnection) initWithMachServiceName:v4 options:4096];
    connection = v5->_connection;
    v5->_connection = v10;

    v12 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NNHzG8lq6aMxZpXq];
    [(NSXPCConnection *)v5->_connection setRemoteObjectInterface:v12];

    objc_initWeak(&location, v5);
    v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    v16 = sub_1005F875C;
    v17 = &unk_100709FB8;
    objc_copyWeak(&v18, &location);
    [(NSXPCConnection *)v5->_connection setInterruptionHandler:&v14];
    [(NSXPCConnection *)v5->_connection resume];
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)JI0A3nkqsab9cUj8:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_t v8 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&stru_100709FF8];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1005F8980;
  v21[3] = &unk_10070A020;
  id v9 = v7;
  id v22 = v9;
  v10 = objc_retainBlock(v21);
  v11 = [(CDIVowDyR1NTVdrU *)self BFzukpKGO3cStNGp:v10];
  objc_initWeak(&location, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1005F899C;
  v16[3] = &unk_10070A048;
  objc_copyWeak(&v19, &location);
  id v12 = v11;
  id v17 = v12;
  id v13 = v9;
  id v18 = v13;
  v14 = objc_retainBlock(v16);
  uint64_t v15 = [v6 toDictionary];
  [v8 k0p7Rchr49btq6wB:v15 HY6FXG20397zwmVg:v14];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (void)QeMnG23X94qgz7jT:(id)a3 hostChallenge:(id)a4 challengeResponse:(id)a5 seid:(id)a6 nonce:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v26 = a4;
  id v15 = a5;
  id v25 = a6;
  id v16 = a7;
  id v17 = a8;
  id v18 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&stru_10070A068];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1005F8C84;
  v32[3] = &unk_10070A020;
  id v19 = v17;
  id v33 = v19;
  objc_super v20 = objc_retainBlock(v32);
  v21 = [(CDIVowDyR1NTVdrU *)self BFzukpKGO3cStNGp:v20];
  objc_initWeak(&location, self);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1005F8C9C;
  v27[3] = &unk_10070A090;
  objc_copyWeak(&v30, &location);
  id v22 = v21;
  id v28 = v22;
  id v23 = v19;
  id v29 = v23;
  v24 = objc_retainBlock(v27);
  [v18 VE7BAlWGDSKrO5xc:v14 hostChallenge:v26 challengeResponse:v15 seid:v25 nonce:v16 HY6FXG20397zwmVg:v24];

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
}

- (void)ZfE6lVphNUVrZcKx:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_queue_t v8 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&stru_10070A0B0];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1005F8EFC;
  v20[3] = &unk_10070A020;
  id v9 = v7;
  id v21 = v9;
  v10 = objc_retainBlock(v20);
  v11 = [(CDIVowDyR1NTVdrU *)self BFzukpKGO3cStNGp:v10];
  objc_initWeak(&location, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1005F8F18;
  v15[3] = &unk_10070A0D8;
  objc_copyWeak(&v18, &location);
  id v12 = v11;
  id v16 = v12;
  id v13 = v9;
  id v17 = v13;
  id v14 = objc_retainBlock(v15);
  [v8 f9MGfLOgnHPuKTrU:v6 HY6FXG20397zwmVg:v14];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)vffg4lwI2HftPvpO:(id)a3
{
  id v4 = a3;
  v5 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&stru_10070A0F8];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1005F9164;
  v17[3] = &unk_10070A020;
  id v6 = v4;
  id v18 = v6;
  id v7 = objc_retainBlock(v17);
  dispatch_queue_t v8 = [(CDIVowDyR1NTVdrU *)self BFzukpKGO3cStNGp:v7];
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1005F917C;
  v12[3] = &unk_10070A090;
  objc_copyWeak(&v15, &location);
  id v9 = v8;
  id v13 = v9;
  id v10 = v6;
  id v14 = v10;
  v11 = objc_retainBlock(v12);
  [v5 xs00laTiKIpDUzDP:v11];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)Z8aAH7stm0EYhyxg:(id)a3 xz5EHXEN4FjlhJbi:(id)a4 uhVTXyAfCFn7u0Ue:(id)a5 EQUjQp7JcQbqcPcD:(id)a6 A5wDLa5TFdFZlz3A:(id)a7 TJKMyOe6zn5PdGIr:(id)a8 eCqgGM0WcnHOslnr:(unint64_t)a9 eCszfxdv3kUXvhgV:(unint64_t)a10 uWp4aZpP2vLhc04Q:(id)a11 QZYtNpvp0hKd248p:(id)a12 oCwPYmtRv8s31KUH:(id)a13 completion:(id)a14
{
  id v36 = a3;
  id v35 = a4;
  id v32 = a5;
  id v34 = a6;
  id v33 = a7;
  id v31 = a8;
  id v20 = a11;
  id v21 = a12;
  id v22 = a13;
  id v23 = a14;
  v24 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&stru_10070A118];
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_1005F94B0;
  v42[3] = &unk_10070A020;
  id v25 = v23;
  id v43 = v25;
  id v26 = objc_retainBlock(v42);
  v27 = [(CDIVowDyR1NTVdrU *)self BFzukpKGO3cStNGp:v26];
  objc_initWeak(&location, self);
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_1005F94D4;
  v37[3] = &unk_10070A140;
  objc_copyWeak(&v40, &location);
  id v28 = v27;
  id v38 = v28;
  id v29 = v25;
  id v39 = v29;
  id v30 = objc_retainBlock(v37);
  [v24 SOUWv5VjPwXYslMm:noUfOiGjp1iQmKZX:pPGyXmlDbN3mzzHm:iSOZt67ioKsVcqQZ:hjCrdFOLMJN0Cc5Q:lE40aye8U2u533Ka:JRuZv6Feh9qwrGmN:Wn0aIR2B54NCtGQc:B3l3lS18BITy5E4L:UywAszL6AB8Y6LTJ:uNao9X8A82jVmQkK:completion:v36, v35, v32, v34, v33, a9, a10, v20, v21, v22, v30];

  objc_destroyWeak(&v40);
  objc_destroyWeak(&location);
}

- (void)updateRavioliWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&stru_10070A160];
  objc_initWeak(&location, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1005F9748;
  v15[3] = &unk_10070A020;
  id v6 = v4;
  id v16 = v6;
  id v7 = objc_retainBlock(v15);
  dispatch_queue_t v8 = [(CDIVowDyR1NTVdrU *)self BFzukpKGO3cStNGp:v7];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1005F9758;
  v11[3] = &unk_10070A188;
  objc_copyWeak(&v14, &location);
  id v9 = v8;
  id v12 = v9;
  id v10 = v6;
  id v13 = v10;
  [v5 k4eQYhyzyebbQqys:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)llNEghuIdfPH7O8I:(BOOL)a3 all:(BOOL)a4 workflowID:(id)a5 completion:(id)a6
{
  id v7 = kCoreASErrorDomainCA[0];
  id v8 = a6;
  id v9 = +[NSString stringWithUTF8String:v7];
  NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
  CFStringRef v13 = @"Not implemented";
  id v10 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  v11 = +[NSError errorWithDomain:v9 code:-27006 userInfo:v10];
  (*((void (**)(id, void *))a6 + 2))(v8, v11);
}

- (void)evrtH713YbFfEOzk:(id)a3 completion:(id)a4
{
  v5 = kCoreASErrorDomainCA[0];
  id v6 = a4;
  id v7 = +[NSString stringWithUTF8String:v5];
  NSErrorUserInfoKey v10 = NSLocalizedDescriptionKey;
  CFStringRef v11 = @"Not implemented";
  id v8 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  id v9 = +[NSError errorWithDomain:v7 code:-27006 userInfo:v8];
  (*((void (**)(id, void, void *))a4 + 2))(v6, 0, v9);
}

- (void)ofLBc0SV56ddaijH:(id)a3 i7D0Lridvo8oYoNd:(id)a4 completion:(id)a5
{
  id v6 = kCoreASErrorDomainCA[0];
  id v7 = a5;
  id v8 = +[NSString stringWithUTF8String:v6];
  NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
  CFStringRef v12 = @"Not implemented";
  id v9 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  NSErrorUserInfoKey v10 = +[NSError errorWithDomain:v8 code:-27006 userInfo:v9];
  (*((void (**)(id, void, void *))a5 + 2))(v7, 0, v10);
}

- (void)llNEghuIdfPH7O8I:(BOOL)a3 all:(BOOL)a4 pregeneration:(BOOL)a5 workflowID:(id)a6 completion:(id)a7
{
  id v8 = kCoreASErrorDomainCA[0];
  id v9 = a7;
  NSErrorUserInfoKey v10 = +[NSString stringWithUTF8String:v8];
  NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
  CFStringRef v14 = @"Not implemented";
  NSErrorUserInfoKey v11 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  CFStringRef v12 = +[NSError errorWithDomain:v10 code:-27006 userInfo:v11];
  (*((void (**)(id, void *))a7 + 2))(v9, v12);
}

- (id)BFzukpKGO3cStNGp:(id)a3
{
  id v4 = a3;
  v5 = +[NSUUID UUID];
  id v6 = [v5 UUIDString];

  syncQueue = self->_syncQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1005F9D0C;
  block[3] = &unk_10070A1B0;
  block[4] = self;
  id v15 = v4;
  id v8 = v6;
  id v14 = v8;
  id v9 = v4;
  dispatch_sync(syncQueue, block);
  NSErrorUserInfoKey v10 = v14;
  id v11 = v8;

  return v11;
}

- (BOOL)l7UrdRfCzeduYqtA:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  CFStringRef v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  syncQueue = self->_syncQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1005F9E38;
  block[3] = &unk_10070A1D8;
  id v9 = v4;
  NSErrorUserInfoKey v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(syncQueue, block);
  LOBYTE(syncQueue) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)syncQueue;
}

- (void)uTtwJoGUgL3N0GVz
{
  syncQueue = self->_syncQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1005F9F0C;
  block[3] = &unk_10070A200;
  block[4] = self;
  dispatch_sync(syncQueue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_storeStrong((id *)&self->_disconnectionCallbacks, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end