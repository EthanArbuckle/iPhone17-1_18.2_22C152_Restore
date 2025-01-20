@interface PFDURLProtocol
+ (BOOL)canInitWithRequest:(id)a3;
+ (BOOL)requestIsCacheEquivalent:(id)a3 toRequest:(id)a4;
+ (id)canonicalRequestForRequest:(id)a3;
+ (void)_performWithProtocolLock:(id)a3;
+ (void)registerHost:(id)a3 bookRootURL:(id)a4 withDRMContext:(id)a5;
+ (void)unregisterHost:(id)a3;
- (PFDURLProtocol)selfReference;
- (PFDUrlHandler)urlHandler;
- (void)setSelfReference:(id)a3;
- (void)setUrlHandler:(id)a3;
- (void)startLoading;
- (void)stopLoading;
- (void)urlHandler:(id)a3 didFailWithError:(id)a4;
- (void)urlHandler:(id)a3 didReceiveData:(id)a4;
- (void)urlHandler:(id)a3 didReceiveResponse:(id)a4;
- (void)urlHandlerDidFinish:(id)a3;
@end

@implementation PFDURLProtocol

+ (void)_performWithProtocolLock:(id)a3
{
  v3 = (void (**)(void))a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_573788);
  if (v3) {
    v3[2]();
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_573788);
}

+ (void)registerHost:(id)a3 bookRootURL:(id)a4 withDRMContext:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_21EE2C;
  v11[3] = &unk_45C1F0;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a1;
  id v8 = v14;
  id v9 = v13;
  id v10 = v12;
  [a1 _performWithProtocolLock:v11];
}

+ (void)unregisterHost:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_21EF20;
  v5[3] = &unk_4591F8;
  id v6 = a3;
  id v7 = a1;
  id v4 = v6;
  [a1 _performWithProtocolLock:v5];
}

+ (BOOL)canInitWithRequest:(id)a3
{
  id v3 = a3;
  id v4 = +[PFDUrlHandler supportedSchemes];
  v5 = [v3 URL];

  id v6 = [v5 scheme];
  id v7 = [v6 lowercaseString];
  unsigned __int8 v8 = [v4 containsObject:v7];

  return v8;
}

+ (id)canonicalRequestForRequest:(id)a3
{
  id v3 = a3;
  id v4 = [v3 URL];
  id v5 = [v4 standardizedURL];
  if (!v5 || (id v6 = [v3 mutableCopy], objc_msgSend(v6, "setURL:", v5), !v6)) {
    id v6 = v3;
  }

  return v6;
}

+ (BOOL)requestIsCacheEquivalent:(id)a3 toRequest:(id)a4
{
  return 0;
}

- (void)startLoading
{
  [(PFDURLProtocol *)self setSelfReference:self];
  urlHandler = self->_urlHandler;
  if (!urlHandler)
  {
    id v4 = [[PFDUrlHandler alloc] initWithQueueMode:0 requestScope:0];
    id v5 = self->_urlHandler;
    self->_urlHandler = v4;

    [(PFDUrlHandler *)self->_urlHandler setDelegate:self];
    urlHandler = self->_urlHandler;
  }
  id v6 = [(PFDURLProtocol *)self request];
  [(PFDUrlHandler *)urlHandler loadRequest:v6];
}

- (void)stopLoading
{
}

- (void)urlHandler:(id)a3 didReceiveResponse:(id)a4
{
  id v5 = a4;
  id v6 = [(PFDURLProtocol *)self client];
  [v6 URLProtocol:self didReceiveResponse:v5 cacheStoragePolicy:1];
}

- (void)urlHandler:(id)a3 didReceiveData:(id)a4
{
  id v5 = a4;
  id v6 = [(PFDURLProtocol *)self client];
  [v6 URLProtocol:self didLoadData:v5];
}

- (void)urlHandlerDidFinish:(id)a3
{
  id v4 = [(PFDURLProtocol *)self client];
  [v4 URLProtocolDidFinishLoading:self];

  [(PFDURLProtocol *)self setSelfReference:0];
}

- (void)urlHandler:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  id v6 = [(PFDURLProtocol *)self client];
  [v6 URLProtocol:self didFailWithError:v5];

  [(PFDURLProtocol *)self setSelfReference:0];
}

- (PFDURLProtocol)selfReference
{
  return self->_selfReference;
}

- (void)setSelfReference:(id)a3
{
}

- (PFDUrlHandler)urlHandler
{
  return self->_urlHandler;
}

- (void)setUrlHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlHandler, 0);

  objc_storeStrong((id *)&self->_selfReference, 0);
}

@end