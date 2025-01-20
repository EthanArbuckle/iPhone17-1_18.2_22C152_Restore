@interface PXGAsyncScrollController
- (BOOL)isActive;
- (BOOL)respectsContentZOrder;
- (CGRect)activeRect;
- (CGRect)contentBounds;
- (CGRect)visibleRect;
- (CGSize)presentedContentSize;
- (CGSize)referenceSize;
- (OS_dispatch_queue)queue;
- (PXGAsyncScrollController)init;
- (PXGAsyncScrollController)initWithQueue:(id)a3;
- (PXScrollControllerUpdateDelegate)updateDelegate;
- (PXScrollInfo)scrollInfo;
- (UIEdgeInsets)contentInset;
- (void)didScroll;
- (void)setContentBounds:(CGRect)a3;
- (void)setIsActive:(BOOL)a3;
- (void)setNeedsUpdate;
- (void)setPresentedContentSize:(CGSize)a3;
- (void)setReferenceSize:(CGSize)a3;
- (void)setRespectsContentZOrder:(BOOL)a3;
- (void)setScrollInfo:(id)a3;
- (void)setUpdateDelegate:(id)a3;
- (void)setVisibleOrigin:(CGPoint)a3;
- (void)setVisibleRect:(CGRect)a3;
- (void)updateIfNeeded;
@end

@implementation PXGAsyncScrollController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_scrollInfo, 0);
  objc_destroyWeak((id *)&self->_updateDelegate);
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setContentBounds:(CGRect)a3
{
  self->_contentBounds = a3;
}

- (CGRect)contentBounds
{
  double x = self->_contentBounds.origin.x;
  double y = self->_contentBounds.origin.y;
  double width = self->_contentBounds.size.width;
  double height = self->_contentBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPresentedContentSize:(CGSize)a3
{
  self->_presentedContentSize = a3;
}

- (CGSize)presentedContentSize
{
  double width = self->_presentedContentSize.width;
  double height = self->_presentedContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setRespectsContentZOrder:(BOOL)a3
{
  self->_respectsContentZOrder = a3;
}

- (BOOL)respectsContentZOrder
{
  return self->_respectsContentZOrder;
}

- (void)setScrollInfo:(id)a3
{
}

- (PXScrollInfo)scrollInfo
{
  return self->_scrollInfo;
}

- (CGRect)visibleRect
{
  double x = self->_visibleRect.origin.x;
  double y = self->_visibleRect.origin.y;
  double width = self->_visibleRect.size.width;
  double height = self->_visibleRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)activeRect
{
  double x = self->_activeRect.origin.x;
  double y = self->_activeRect.origin.y;
  double width = self->_activeRect.size.width;
  double height = self->_activeRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (UIEdgeInsets)contentInset
{
  double top = self->_contentInset.top;
  double left = self->_contentInset.left;
  double bottom = self->_contentInset.bottom;
  double right = self->_contentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CGSize)referenceSize
{
  double width = self->_referenceSize.width;
  double height = self->_referenceSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (PXScrollControllerUpdateDelegate)updateDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_updateDelegate);
  return (PXScrollControllerUpdateDelegate *)WeakRetained;
}

- (void)didScroll
{
  if (self->_delegateRespondsToDidScroll)
  {
    id v3 = [(PXGAsyncScrollController *)self updateDelegate];
    objc_msgSend(v3, "px_scrollControllerDidScroll:", self);
  }
}

- (void)updateIfNeeded
{
  if (self->_needsUpdate && [(PXGAsyncScrollController *)self isActive])
  {
    self->_needsUpdate = 0;
    id v3 = [(PXGAsyncScrollController *)self updateDelegate];
    objc_msgSend(v3, "px_scrollControllerDidUpdate:", self);
  }
}

- (void)setNeedsUpdate
{
  self->_needsUpdate = 1;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__PXGAsyncScrollController_setNeedsUpdate__block_invoke;
  v4[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __42__PXGAsyncScrollController_setNeedsUpdate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateIfNeeded];
}

- (void)setVisibleRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (!CGRectEqualToRect(self->_visibleRect, a3))
  {
    self->_visibleRect.origin.CGFloat x = x;
    self->_visibleRect.origin.CGFloat y = y;
    self->_visibleRect.size.CGFloat width = width;
    self->_visibleRect.size.CGFloat height = height;
    [(PXGAsyncScrollController *)self didScroll];
  }
}

- (void)setVisibleOrigin:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(PXGAsyncScrollController *)self visibleRect];
  -[PXGAsyncScrollController setVisibleRect:](self, "setVisibleRect:", x, y);
}

- (void)setIsActive:(BOOL)a3
{
  if (self->_isActive != a3)
  {
    self->_isActive = a3;
    [(PXGAsyncScrollController *)self setNeedsUpdate];
  }
}

- (void)setReferenceSize:(CGSize)a3
{
  if (self->_referenceSize.width != a3.width || self->_referenceSize.height != a3.height)
  {
    self->_referenceSize = a3;
    [(PXGAsyncScrollController *)self visibleRect];
    -[PXGAsyncScrollController setVisibleRect:](self, "setVisibleRect:");
    [(PXGAsyncScrollController *)self setNeedsUpdate];
  }
}

- (void)setUpdateDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_updateDelegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_updateDelegate, obj);
    self->_delegateRespondsToDidScroll = objc_opt_respondsToSelector() & 1;
  }
}

- (PXGAsyncScrollController)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXGAsyncScrollController.m", 42, @"%s is not available as initializer", "-[PXGAsyncScrollController init]");

  abort();
}

- (PXGAsyncScrollController)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXGAsyncScrollController;
  v6 = [(PXGAsyncScrollController *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v7->_isActive = 1;
  }

  return v7;
}

@end