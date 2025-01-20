@interface SKUINavigationBarContext
- (NSOperationQueue)operationQueue;
- (SKUIClientContext)clientContext;
- (SKUILayoutCache)textLayoutCache;
- (SKUIResourceLoader)resourceLoader;
- (UIViewController)parentViewController;
- (double)maximumNavigationBarWidth;
- (void)setClientContext:(id)a3;
- (void)setMaximumNavigationBarWidth:(double)a3;
- (void)setOperationQueue:(id)a3;
- (void)setParentViewController:(id)a3;
- (void)setResourceLoader:(id)a3;
- (void)setTextLayoutCache:(id)a3;
@end

@implementation SKUINavigationBarContext

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
}

- (double)maximumNavigationBarWidth
{
  return self->_maximumNavigationBarWidth;
}

- (void)setMaximumNavigationBarWidth:(double)a3
{
  self->_maximumNavigationBarWidth = a3;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (UIViewController)parentViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setParentViewController:(id)a3
{
}

- (SKUIResourceLoader)resourceLoader
{
  return self->_resourceLoader;
}

- (void)setResourceLoader:(id)a3
{
}

- (SKUILayoutCache)textLayoutCache
{
  return self->_textLayoutCache;
}

- (void)setTextLayoutCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLayoutCache, 0);
  objc_storeStrong((id *)&self->_resourceLoader, 0);
  objc_destroyWeak((id *)&self->_parentViewController);
  objc_storeStrong((id *)&self->_operationQueue, 0);

  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end