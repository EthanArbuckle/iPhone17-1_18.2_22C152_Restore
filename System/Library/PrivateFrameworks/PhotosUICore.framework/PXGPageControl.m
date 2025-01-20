@interface PXGPageControl
- (BOOL)hidesForSinglePage;
- (CGRect)clippingRect;
- (PXGPageControl)initWithFrame:(CGRect)a3;
- (PXGPageControlConfiguration)userData;
- (int64_t)currentPage;
- (int64_t)numberOfPages;
- (void)_valueChanged:(id)a3;
- (void)prepareForReuse;
- (void)setClippingRect:(CGRect)a3;
- (void)setCurrentPage:(int64_t)a3;
- (void)setHidesForSinglePage:(BOOL)a3;
- (void)setNumberOfPages:(int64_t)a3;
- (void)setUserData:(id)a3;
@end

@implementation PXGPageControl

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userData, 0);
  objc_storeStrong((id *)&self->_pageControl, 0);
}

- (PXGPageControlConfiguration)userData
{
  return self->_userData;
}

- (void)setClippingRect:(CGRect)a3
{
  self->_clippingRect = a3;
}

- (CGRect)clippingRect
{
  double x = self->_clippingRect.origin.x;
  double y = self->_clippingRect.origin.y;
  double width = self->_clippingRect.size.width;
  double height = self->_clippingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)prepareForReuse
{
}

- (void)setUserData:(id)a3
{
  v8 = (PXGPageControlConfiguration *)a3;
  v4 = self->_userData;
  if (v4 == v8)
  {
  }
  else
  {
    BOOL v5 = [(PXGPageControlConfiguration *)v8 isEqual:v4];

    if (!v5)
    {
      v6 = (PXGPageControlConfiguration *)[(PXGPageControlConfiguration *)v8 copy];
      userData = self->_userData;
      self->_userData = v6;

      [(PXGPageControl *)self setNumberOfPages:[(PXGPageControlConfiguration *)self->_userData numberOfPages]];
      [(PXGPageControl *)self setCurrentPage:[(PXGPageControlConfiguration *)self->_userData currentPage]];
      [(PXGPageControl *)self setHidesForSinglePage:[(PXGPageControlConfiguration *)self->_userData hidesForSinglePage]];
    }
  }
}

- (void)_valueChanged:(id)a3
{
  uint64_t v4 = [(PXGPageControlConfiguration *)self->_userData target];
  if (v4)
  {
    BOOL v5 = (void *)v4;
    v6 = [(PXGPageControlConfiguration *)self->_userData action];

    if (v6)
    {
      id v7 = [(PXGPageControlConfiguration *)self->_userData target];
      objc_msgSend(v7, "performSelector:withObject:", -[PXGPageControlConfiguration action](self->_userData, "action"), self);
    }
  }
}

- (BOOL)hidesForSinglePage
{
  return [(UIPageControl *)self->_pageControl hidesForSinglePage];
}

- (void)setHidesForSinglePage:(BOOL)a3
{
}

- (void)setCurrentPage:(int64_t)a3
{
}

- (int64_t)currentPage
{
  return [(UIPageControl *)self->_pageControl currentPage];
}

- (void)setNumberOfPages:(int64_t)a3
{
}

- (int64_t)numberOfPages
{
  return [(UIPageControl *)self->_pageControl numberOfPages];
}

- (PXGPageControl)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PXGPageControl;
  v3 = -[PXGPageControl initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1A40]);
    [(PXGPageControl *)v3 bounds];
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:");
    pageControl = v3->_pageControl;
    v3->_pageControl = (UIPageControl *)v5;

    [(UIPageControl *)v3->_pageControl setAutoresizingMask:18];
    [(UIPageControl *)v3->_pageControl addTarget:v3 action:sel__valueChanged_ forControlEvents:4096];
    [(PXGPageControl *)v3 addSubview:v3->_pageControl];
  }
  return v3;
}

@end