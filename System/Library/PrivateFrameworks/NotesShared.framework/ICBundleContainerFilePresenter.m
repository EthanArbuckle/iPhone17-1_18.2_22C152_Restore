@interface ICBundleContainerFilePresenter
- (ICBundleContainerFilePresenter)initWithURL:(id)a3;
- (NSOperationQueue)operationQueue;
- (NSURL)url;
- (id)subitemBundleDidChange;
- (void)presentedSubitemDidChangeAtURL:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setSubitemBundleDidChange:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation ICBundleContainerFilePresenter

- (ICBundleContainerFilePresenter)initWithURL:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICBundleContainerFilePresenter;
  v5 = [(ICBundleContainerFilePresenter *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    v8 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    operationQueue = v5->_operationQueue;
    v5->_operationQueue = v8;

    [(NSOperationQueue *)v5->_operationQueue setName:@"com.apple.notes.bundle-container-file-presenter"];
    [(NSOperationQueue *)v5->_operationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v5->_operationQueue setQualityOfService:17];
  }

  return v5;
}

- (void)presentedSubitemDidChangeAtURL:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  performBlockOnMainThread();
}

void __65__ICBundleContainerFilePresenter_presentedSubitemDidChangeAtURL___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) subitemBundleDidChange];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) subitemBundleDidChange];
    v3[2](v3, *(void *)(a1 + 40));
  }
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (id)subitemBundleDidChange
{
  return self->_subitemBundleDidChange;
}

- (void)setSubitemBundleDidChange:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong(&self->_subitemBundleDidChange, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end