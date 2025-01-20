@interface MFURLRoutingRequest
+ (OS_os_log)log;
+ (id)externalRequestWithOpenURLContext:(id)a3;
+ (id)requestWithURL:(id)a3;
+ (id)requestWithURL:(id)a3 builderBlock:(id)a4;
- (BOOL)isExternal;
- (BOOL)isPossibleStoreURL;
- (EFFuture)future;
- (EFPromise)promise;
- (EMMessageListItem)sourceMessageListItem;
- (MFURLRoutingRequest)initWithURL:(id)a3;
- (NSString)ef_publicDescription;
- (NSURL)URL;
- (void)completeWithResultOfFuture:(id)a3;
- (void)setExternal:(BOOL)a3;
- (void)setPossibleStoreURL:(BOOL)a3;
- (void)setPromise:(id)a3;
- (void)setSourceMessageListItem:(id)a3;
@end

@implementation MFURLRoutingRequest

+ (OS_os_log)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001FF2E0;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_100699DE8 != -1) {
    dispatch_once(&qword_100699DE8, block);
  }
  v2 = (void *)qword_100699DE0;

  return (OS_os_log *)v2;
}

+ (id)requestWithURL:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithURL:v4];

  return v5;
}

+ (id)requestWithURL:(id)a3 builderBlock:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, id))a4;
  id v8 = [objc_alloc((Class)a1) initWithURL:v6];
  v7[2](v7, v8);

  return v8;
}

+ (id)externalRequestWithOpenURLContext:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  id v6 = [v4 URL];
  id v7 = [v5 initWithURL:v6];

  [v7 setExternal:1];

  return v7;
}

- (MFURLRoutingRequest)initWithURL:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MFURLRoutingRequest;
  id v5 = [(MFURLRoutingRequest *)&v11 init];
  if (v5)
  {
    id v6 = (NSURL *)[v4 copy];
    URL = v5->_URL;
    v5->_URL = v6;

    uint64_t v8 = +[EFPromise promise];
    promise = v5->_promise;
    v5->_promise = (EFPromise *)v8;
  }
  return v5;
}

- (EFFuture)future
{
  v2 = [(MFURLRoutingRequest *)self promise];
  v3 = [v2 future];

  return (EFFuture *)v3;
}

- (void)completeWithResultOfFuture:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1001FF84C;
  v16[3] = &unk_10060D938;
  objc_copyWeak(&v17, &location);
  id v5 = [v4 map:v16];
  [(MFURLRoutingRequest *)self ef_publicDescription];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1001FF878;
  v14[3] = &unk_10060D960;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v15 = v6;
  [v5 addSuccessBlock:v14];
  v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  objc_super v11 = sub_1001FF92C;
  v12 = &unk_100604F70;
  id v7 = v6;
  id v13 = v7;
  [v5 addFailureBlock:&v9];
  uint64_t v8 = [(MFURLRoutingRequest *)self promise];
  [v8 finishWithFuture:v5];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (NSString)ef_publicDescription
{
  v3 = [(MFURLRoutingRequest *)self sourceMessageListItem];

  uint64_t v4 = objc_opt_class();
  id v5 = [(MFURLRoutingRequest *)self URL];
  id v6 = [v5 scheme];
  id v7 = +[NSString stringWithFormat:@"<%@: %p> scheme=%@ isExternal=%d hasSourceItem=%d", v4, self, v6, [(MFURLRoutingRequest *)self isExternal], v3 != 0];

  return (NSString *)v7;
}

- (BOOL)isExternal
{
  return self->external;
}

- (void)setExternal:(BOOL)a3
{
  self->external = a3;
}

- (BOOL)isPossibleStoreURL
{
  return self->possibleStoreURL;
}

- (void)setPossibleStoreURL:(BOOL)a3
{
  self->possibleStoreURL = a3;
}

- (NSURL)URL
{
  return self->_URL;
}

- (EMMessageListItem)sourceMessageListItem
{
  return self->_sourceMessageListItem;
}

- (void)setSourceMessageListItem:(id)a3
{
}

- (EFPromise)promise
{
  return self->_promise;
}

- (void)setPromise:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promise, 0);
  objc_storeStrong((id *)&self->_sourceMessageListItem, 0);

  objc_storeStrong((id *)&self->_URL, 0);
}

@end