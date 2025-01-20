@interface ICAppRemovalServiceClient
+ (id)sharedClient;
- (ICAppRemovalServiceClient)init;
- (OS_dispatch_queue)requestCountQueue;
- (unint64_t)requestCount;
- (void)dealloc;
- (void)removeAppWithReply:(id)a3;
- (void)resumeConnectionIfNeeded;
- (void)setRequestCount:(unint64_t)a3;
- (void)setRequestCountQueue:(id)a3;
- (void)suspendConnectionIfNeeded;
@end

@implementation ICAppRemovalServiceClient

+ (id)sharedClient
{
  if (qword_1006AA148 != -1) {
    dispatch_once(&qword_1006AA148, &stru_1006277B0);
  }
  v2 = (void *)qword_1006AA140;

  return v2;
}

- (ICAppRemovalServiceClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)ICAppRemovalServiceClient;
  v2 = [(ICAppRemovalServiceClient *)&v6 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.notes.appremoval", v3);
    [(ICAppRemovalServiceClient *)v2 setRequestCountQueue:v4];

    [(ICAppRemovalServiceClient *)v2 setRequestCount:0];
  }
  return v2;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connectionToService invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ICAppRemovalServiceClient;
  [(ICAppRemovalServiceClient *)&v3 dealloc];
}

- (void)removeAppWithReply:(id)a3
{
  id v4 = a3;
  [(ICAppRemovalServiceClient *)self resumeConnectionIfNeeded];
  connectionToService = self->_connectionToService;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10008B79C;
  v11[3] = &unk_1006267D8;
  id v6 = v4;
  id v12 = v6;
  v7 = [(NSXPCConnection *)connectionToService remoteObjectProxyWithErrorHandler:v11];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10008B878;
  v9[3] = &unk_100625230;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 removeAppWithReply:v9];
}

- (void)resumeConnectionIfNeeded
{
  objc_super v3 = [(ICAppRemovalServiceClient *)self requestCountQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008B990;
  block[3] = &unk_100625AF0;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void)suspendConnectionIfNeeded
{
  objc_super v3 = [(ICAppRemovalServiceClient *)self requestCountQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008BAE4;
  block[3] = &unk_100625AF0;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (OS_dispatch_queue)requestCountQueue
{
  return self->_requestCountQueue;
}

- (void)setRequestCountQueue:(id)a3
{
}

- (unint64_t)requestCount
{
  return self->_requestCount;
}

- (void)setRequestCount:(unint64_t)a3
{
  self->_requestCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestCountQueue, 0);

  objc_storeStrong((id *)&self->_connectionToService, 0);
}

@end