@interface MADArtworkServer
- (MADArtworkServer)init;
- (NSOperationQueue)artworkServiceQueue;
- (void)processArtworkColorAnalysisRequest:(id)a3 withReply:(id)a4;
- (void)processArtworkRequest:(id)a3 completionHandler:(id)a4;
- (void)setArtworkServiceQueue:(id)a3;
@end

@implementation MADArtworkServer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkServiceQueue, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
}

- (void)setArtworkServiceQueue:(id)a3
{
}

- (NSOperationQueue)artworkServiceQueue
{
  return self->_artworkServiceQueue;
}

- (void)processArtworkColorAnalysisRequest:(id)a3 withReply:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = sub_100002624(3);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [v7 debugDescription];
    *(_DWORD *)buf = 138543362;
    v26 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received artwork color analysis request: %{public}@", buf, 0xCu);
  }
  v11 = (objc_class *)[v7 operationClass];
  if (!v11)
  {
    v16 = +[NSAssertionHandler currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"MADArtworkServer.m" lineNumber:81 description:@"Artwork service color analysis request must specify an operationClass"];
  }
  id v12 = [[v11 alloc] initWithArtworkRequest:v7];
  objc_msgSend(v12, "setQueuePriority:", objc_msgSend(v7, "operationPriority"));
  objc_initWeak((id *)buf, v12);
  v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  v19 = sub_100001AAC;
  v20 = &unk_1000041E0;
  objc_copyWeak(&v24, (id *)buf);
  id v13 = v7;
  id v21 = v13;
  id v14 = v8;
  v22 = self;
  id v23 = v14;
  [v12 setCompletionBlock:&v17];
  v15 = [(MADArtworkServer *)self artworkServiceQueue];
  [v15 addOperation:v12];

  objc_destroyWeak(&v24);
  objc_destroyWeak((id *)buf);
}

- (void)processArtworkRequest:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = sub_100002624(3);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [v7 debugDescription];
    *(_DWORD *)buf = 138543362;
    v26 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received artwork request: %{public}@", buf, 0xCu);
  }
  v11 = (objc_class *)[v7 operationClass];
  if (!v11)
  {
    v16 = +[NSAssertionHandler currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"MADArtworkServer.m" lineNumber:45 description:@"Artwork service request must specify an operationClass"];
  }
  id v12 = [[v11 alloc] initWithArtworkRequest:v7];
  objc_msgSend(v12, "setQueuePriority:", objc_msgSend(v7, "operationPriority"));
  objc_initWeak((id *)buf, v12);
  v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  v19 = sub_100001FAC;
  v20 = &unk_1000041E0;
  objc_copyWeak(&v24, (id *)buf);
  id v13 = v7;
  id v21 = v13;
  id v14 = v8;
  v22 = self;
  id v23 = v14;
  [v12 setCompletionBlock:&v17];
  v15 = [(MADArtworkServer *)self artworkServiceQueue];
  [v15 addOperation:v12];

  objc_destroyWeak(&v24);
  objc_destroyWeak((id *)buf);
}

- (MADArtworkServer)init
{
  v9.receiver = self;
  v9.super_class = (Class)MADArtworkServer;
  v2 = [(MADArtworkServer *)&v9 init];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)NSOperationQueue);
    [(MADArtworkServer *)v2 setArtworkServiceQueue:v3];

    v4 = [(MADArtworkServer *)v2 artworkServiceQueue];
    [v4 setMaxConcurrentOperationCount:1];

    v5 = [(MADArtworkServer *)v2 artworkServiceQueue];
    [v5 setName:@"com.apple.mediaartworkd.artworkServiceQueue"];

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.mediaartworkd.calloutQueue", 0);
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v6;
  }
  return v2;
}

@end