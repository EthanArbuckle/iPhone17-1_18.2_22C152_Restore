@interface PXGConcreteHostingControllerPresenter
- (BOOL)isEqual:(id)a3;
- (CGSize)size;
- (PXGHostingController)hostingController;
- (double)displayScale;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)dealloc;
- (void)performChanges:(id)a3;
- (void)setDisplayScale:(double)a3;
- (void)setHostingController:(id)a3;
- (void)setSize:(CGSize)a3;
@end

@implementation PXGConcreteHostingControllerPresenter

- (void).cxx_destruct
{
}

- (void)setHostingController:(id)a3
{
}

- (PXGHostingController)hostingController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostingController);
  return (PXGHostingController *)WeakRetained;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)displayScale
{
  return self->_displayScale;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostingController);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = [WeakRetained clientQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__PXGConcreteHostingControllerPresenter_dealloc__block_invoke;
    block[3] = &unk_1E5DD36F8;
    id v8 = v4;
    dispatch_async(v5, block);
  }
  v6.receiver = self;
  v6.super_class = (Class)PXGConcreteHostingControllerPresenter;
  [(PXGConcreteHostingControllerPresenter *)&v6 dealloc];
}

uint64_t __48__PXGConcreteHostingControllerPresenter_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "clientQueue_presenterDidChange:", 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    [(PXGConcreteHostingControllerPresenter *)self size];
    double v7 = v6;
    double v9 = v8;
    [v5 size];
    if (v7 == v11 && v9 == v10)
    {
      [(PXGConcreteHostingControllerPresenter *)self displayScale];
      double v15 = v14;
      [v5 displayScale];
      BOOL v13 = v15 == v16;
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (void)setSize:(CGSize)a3
{
}

- (void)setDisplayScale:(double)a3
{
  if (self->_displayScale != a3)
  {
    self->_displayScale = a3;
    self->_didChange = 1;
  }
}

- (void)performChanges:(id)a3
{
  if (self->_isPerformingChanges)
  {
    (*((void (**)(id, PXGConcreteHostingControllerPresenter *))a3 + 2))(a3, self);
    self->_isPerformingChanges = 1;
  }
  else
  {
    self->_didChange = 0;
    (*((void (**)(id, PXGConcreteHostingControllerPresenter *))a3 + 2))(a3, self);
    self->_isPerformingChanges = 0;
    if (self->_didChange)
    {
      self->_didChange = 0;
      id v4 = [(PXGConcreteHostingControllerPresenter *)self hostingController];
      objc_msgSend(v4, "clientQueue_presenterDidChange:", self);
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(PXGConcreteHostingControllerPresenter);
  [(PXGConcreteHostingControllerPresenter *)self size];
  -[PXGConcreteHostingControllerPresenter setSize:](v4, "setSize:");
  [(PXGConcreteHostingControllerPresenter *)self displayScale];
  -[PXGConcreteHostingControllerPresenter setDisplayScale:](v4, "setDisplayScale:");
  return v4;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  [(PXGConcreteHostingControllerPresenter *)self size];
  double v6 = NSStringFromCGSize(v11);
  [(PXGConcreteHostingControllerPresenter *)self displayScale];
  double v8 = [v3 stringWithFormat:@"<%@:%p; size:%@ displayScale:%.2f>", v5, self, v6, v7];

  return v8;
}

@end