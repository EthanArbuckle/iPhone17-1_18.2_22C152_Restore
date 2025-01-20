@interface PFDUrlSchemeHandler
- (NSArray)supportedSchemes;
- (NSMapTable)taskToURLHandlerMap;
- (NSMapTable)urlHandlerToTaskMap;
- (PFDURLRequestScope)requestScope;
- (PFDUrlSchemeHandler)init;
- (PFDUrlSchemeHandler)initWithRequestScope:(id)a3;
- (id)_taskForHandler:(id)a3;
- (os_unfair_lock_s)accessLock;
- (void)_executeBlockWithLock:(id)a3;
- (void)_removeTaskForHandler:(id)a3;
- (void)setAccessLock:(os_unfair_lock_s)a3;
- (void)setRequestScope:(id)a3;
- (void)setTaskToURLHandlerMap:(id)a3;
- (void)setUrlHandlerToTaskMap:(id)a3;
- (void)urlHandler:(id)a3 didFailWithError:(id)a4;
- (void)urlHandler:(id)a3 didReceiveData:(id)a4;
- (void)urlHandler:(id)a3 didReceiveResponse:(id)a4;
- (void)urlHandlerDidFinish:(id)a3;
- (void)webView:(id)a3 startURLSchemeTask:(id)a4;
- (void)webView:(id)a3 stopURLSchemeTask:(id)a4;
@end

@implementation PFDUrlSchemeHandler

- (PFDUrlSchemeHandler)init
{
  v8.receiver = self;
  v8.super_class = (Class)PFDUrlSchemeHandler;
  v2 = [(PFDUrlSchemeHandler *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[NSMapTable mapTableWithKeyOptions:512 valueOptions:512];
    urlHandlerToTaskMap = v2->_urlHandlerToTaskMap;
    v2->_urlHandlerToTaskMap = (NSMapTable *)v3;

    uint64_t v5 = +[NSMapTable mapTableWithKeyOptions:512 valueOptions:512];
    taskToURLHandlerMap = v2->_taskToURLHandlerMap;
    v2->_taskToURLHandlerMap = (NSMapTable *)v5;

    v2->_accessLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (PFDUrlSchemeHandler)initWithRequestScope:(id)a3
{
  id v5 = a3;
  v6 = [(PFDUrlSchemeHandler *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_requestScope, a3);
  }

  return v7;
}

- (NSArray)supportedSchemes
{
  return +[PFDUrlHandler supportedSchemes];
}

- (void)webView:(id)a3 startURLSchemeTask:(id)a4
{
  id v5 = a4;
  if (!+[NSThread isMainThread])
  {
    v6 = +[TSUAssertionHandler currentHandler];
    v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[PFDUrlSchemeHandler webView:startURLSchemeTask:]");
    objc_super v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/DRM/PFDUrlSchemeHandler.m"];
    [v6 handleFailureInFunction:v7 file:v8 lineNumber:62 description:@"This operation must only be performed on the main thread."];
  }
  v9 = [PFDUrlHandler alloc];
  v10 = [(PFDUrlSchemeHandler *)self requestScope];
  v11 = [(PFDUrlHandler *)v9 initWithQueueMode:1 requestScope:v10];

  [(PFDUrlHandler *)v11 setDelegate:self];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_216F58;
  v15[3] = &unk_459288;
  v15[4] = self;
  id v16 = v5;
  v17 = v11;
  v12 = v11;
  id v13 = v5;
  [(PFDUrlSchemeHandler *)self _executeBlockWithLock:v15];
  v14 = [v13 request];
  [(PFDUrlHandler *)v12 loadRequest:v14];
}

- (void)webView:(id)a3 stopURLSchemeTask:(id)a4
{
  id v6 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = sub_2170F0;
  v15 = sub_217100;
  id v16 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_217108;
  v8[3] = &unk_45C160;
  v8[4] = self;
  v10 = &v11;
  id v7 = a4;
  id v9 = v7;
  [(PFDUrlSchemeHandler *)self _executeBlockWithLock:v8];
  [(id)v12[5] stopLoading];

  _Block_object_dispose(&v11, 8);
}

- (void)urlHandler:(id)a3 didReceiveResponse:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_217268;
  block[3] = &unk_459288;
  block[4] = self;
  id v8 = a3;
  id v9 = a4;
  id v5 = v9;
  id v6 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)urlHandler:(id)a3 didReceiveData:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_217384;
  block[3] = &unk_459288;
  block[4] = self;
  id v8 = a3;
  id v9 = a4;
  id v5 = v9;
  id v6 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)urlHandlerDidFinish:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_217474;
  v4[3] = &unk_456D90;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)urlHandler:(id)a3 didFailWithError:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_217594;
  block[3] = &unk_459288;
  block[4] = self;
  id v8 = a3;
  id v9 = a4;
  id v5 = v9;
  id v6 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)_taskForHandler:(id)a3
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = sub_2170F0;
  v14 = sub_217100;
  id v15 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_21771C;
  v6[3] = &unk_45C188;
  id v9 = &v10;
  id v7 = self;
  id v3 = a3;
  id v8 = v3;
  [(PFDUrlSchemeHandler *)v7 _executeBlockWithLock:v6];
  id v4 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v4;
}

- (void)_removeTaskForHandler:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_21781C;
  v4[3] = &unk_456D90;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(PFDUrlSchemeHandler *)v5 _executeBlockWithLock:v4];
}

- (void)_executeBlockWithLock:(id)a3
{
  if (a3)
  {
    p_accessLock = &self->_accessLock;
    id v4 = (void (**)(void))a3;
    os_unfair_lock_lock(p_accessLock);
    v4[2](v4);

    os_unfair_lock_unlock(p_accessLock);
  }
}

- (PFDURLRequestScope)requestScope
{
  return self->_requestScope;
}

- (void)setRequestScope:(id)a3
{
}

- (NSMapTable)urlHandlerToTaskMap
{
  return self->_urlHandlerToTaskMap;
}

- (void)setUrlHandlerToTaskMap:(id)a3
{
}

- (NSMapTable)taskToURLHandlerMap
{
  return self->_taskToURLHandlerMap;
}

- (void)setTaskToURLHandlerMap:(id)a3
{
}

- (os_unfair_lock_s)accessLock
{
  return self->_accessLock;
}

- (void)setAccessLock:(os_unfair_lock_s)a3
{
  self->_accessLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskToURLHandlerMap, 0);
  objc_storeStrong((id *)&self->_urlHandlerToTaskMap, 0);

  objc_storeStrong((id *)&self->_requestScope, 0);
}

@end