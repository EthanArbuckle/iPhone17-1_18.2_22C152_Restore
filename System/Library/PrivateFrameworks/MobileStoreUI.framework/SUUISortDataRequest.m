@interface SUUISortDataRequest
- (NSURL)sortURL;
- (SUUISortDataRequest)initWithSortURL:(id)a3;
- (SUUISortDataRequestDelegate)delegate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newLoadOperation;
- (void)finishWithResource:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SUUISortDataRequest

- (SUUISortDataRequest)initWithSortURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUISortDataRequest;
  v5 = [(SUUIResourceRequest *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    sortURL = v5->_sortURL;
    v5->_sortURL = (NSURL *)v6;
  }
  return v5;
}

- (void)finishWithResource:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained sortDataRequest:self didFinishWithLockups:v5];
  }
}

- (id)newLoadOperation
{
  v3 = [SUUILoadSortDataOperation alloc];
  return [(SUUILoadSortDataOperation *)v3 initWithResourceRequest:self];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SUUISortDataRequest;
  id v5 = -[SUUIResourceRequest copyWithZone:](&v9, sel_copyWithZone_);
  uint64_t v6 = [(NSURL *)self->_sortURL copyWithZone:a3];
  v7 = (void *)v5[4];
  v5[4] = v6;

  return v5;
}

- (SUUISortDataRequestDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUUISortDataRequestDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSURL)sortURL
{
  return self->_sortURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortURL, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end