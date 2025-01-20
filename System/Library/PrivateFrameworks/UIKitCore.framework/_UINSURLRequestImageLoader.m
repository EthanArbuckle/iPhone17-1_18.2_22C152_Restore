@interface _UINSURLRequestImageLoader
- (BOOL)_really_cancel;
- (_UINSURLRequestImageLoader)initWithURLRequest:(id)a3 session:(id)a4;
- (id)_error;
- (void)_really_loadImage:(id)a3;
@end

@implementation _UINSURLRequestImageLoader

- (_UINSURLRequestImageLoader)initWithURLRequest:(id)a3 session:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_UINSURLRequestImageLoader;
  v9 = [(_UIImageLoader *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    objc_storeStrong((id *)&v10->_session, a4);
  }

  return v10;
}

- (void)_really_loadImage:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  session = self->_session;
  request = self->_request;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __48___UINSURLRequestImageLoader__really_loadImage___block_invoke;
  v15 = &unk_1E52EC160;
  v16 = self;
  id v7 = v4;
  id v17 = v7;
  id v8 = [(NSURLSession *)session dataTaskWithRequest:request completionHandler:&v12];
  objc_storeWeak((id *)&self->_task, v8);
  v9 = _UIImageLoadingLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = [(NSURLRequest *)self->_request HTTPMethod];
    v11 = [(NSURLRequest *)self->_request URL];
    *(_DWORD *)buf = 134218499;
    v19 = self;
    __int16 v20 = 2113;
    v21 = v10;
    __int16 v22 = 2113;
    v23 = v11;
    _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_INFO, "Image loader %p issuing URL request: %{private}@ %{private}@", buf, 0x20u);
  }
  [v8 resume];
}

- (BOOL)_really_cancel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_task);
  [WeakRetained cancel];

  return 1;
}

- (id)_error
{
  v6.receiver = self;
  v6.super_class = (Class)_UINSURLRequestImageLoader;
  v2 = [(_UIImageLoader *)&v6 _error];
  if ([v2 code] == -999) {
    v3 = 0;
  }
  else {
    v3 = v2;
  }
  id v4 = v3;

  return v4;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_task);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end