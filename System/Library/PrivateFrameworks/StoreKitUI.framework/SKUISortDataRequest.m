@interface SKUISortDataRequest
- (NSURL)sortURL;
- (SKUISortDataRequest)initWithSortURL:(id)a3;
- (SKUISortDataRequestDelegate)delegate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newLoadOperation;
- (void)finishWithResource:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SKUISortDataRequest

- (SKUISortDataRequest)initWithSortURL:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUISortDataRequest initWithSortURL:]();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUISortDataRequest;
  v5 = [(SKUIResourceRequest *)&v9 init];
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
  v3 = [SKUILoadSortDataOperation alloc];

  return [(SKUILoadSortDataOperation *)v3 initWithResourceRequest:self];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SKUISortDataRequest;
  id v5 = -[SKUIResourceRequest copyWithZone:](&v9, sel_copyWithZone_);
  uint64_t v6 = [(NSURL *)self->_sortURL copyWithZone:a3];
  v7 = (void *)v5[4];
  v5[4] = v6;

  return v5;
}

- (SKUISortDataRequestDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUISortDataRequestDelegate *)WeakRetained;
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

- (void)initWithSortURL:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUISortDataRequest initWithSortURL:]";
}

@end