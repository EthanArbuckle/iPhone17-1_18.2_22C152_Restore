@interface THWPageControlLayout
- (BOOL)allowNoCurrentPage;
- (BOOL)forceTextOnly;
- (BOOL)wrapEnabled;
- (Class)repClassOverride;
- (THWPageControlLayout)initWithTag:(unint64_t)a3 index:(unint64_t)a4;
- (double)spacing;
- (unint64_t)currentPage;
- (unint64_t)numberOfPages;
- (void)setAllowNoCurrentPage:(BOOL)a3;
- (void)setCurrentPage:(unint64_t)a3;
- (void)setForceTextOnly:(BOOL)a3;
- (void)setNumberOfPages:(unint64_t)a3;
- (void)setSpacing:(double)a3;
- (void)setWrapEnabled:(BOOL)a3;
@end

@implementation THWPageControlLayout

- (THWPageControlLayout)initWithTag:(unint64_t)a3 index:(unint64_t)a4
{
  v5.receiver = self;
  v5.super_class = (Class)THWPageControlLayout;
  result = [(THWControlLayout *)&v5 initWithTag:a3 index:a4];
  if (result)
  {
    result->_currentPage = 0x7FFFFFFFFFFFFFFFLL;
    result->_spacing = 10.0;
  }
  return result;
}

- (Class)repClassOverride
{
  return (Class)objc_opt_class();
}

- (void)setCurrentPage:(unint64_t)a3
{
  if (self->_currentPage != a3 && (a3 != 0x7FFFFFFFFFFFFFFFLL || self->_allowNoCurrentPage))
  {
    self->_currentPage = a3;
    [(THWControlLayout *)self invalidateControl];
  }
}

- (void)setNumberOfPages:(unint64_t)a3
{
  if (self->_numberOfPages != a3)
  {
    self->_numberOfPages = a3;
    [(THWControlLayout *)self invalidateControl];
  }
}

- (unint64_t)numberOfPages
{
  return self->_numberOfPages;
}

- (unint64_t)currentPage
{
  return self->_currentPage;
}

- (BOOL)wrapEnabled
{
  return self->_wrapEnabled;
}

- (void)setWrapEnabled:(BOOL)a3
{
  self->_wrapEnabled = a3;
}

- (BOOL)forceTextOnly
{
  return self->_forceTextOnly;
}

- (void)setForceTextOnly:(BOOL)a3
{
  self->_forceTextOnly = a3;
}

- (BOOL)allowNoCurrentPage
{
  return self->_allowNoCurrentPage;
}

- (void)setAllowNoCurrentPage:(BOOL)a3
{
  self->_allowNoCurrentPage = a3;
}

- (double)spacing
{
  return self->_spacing;
}

- (void)setSpacing:(double)a3
{
  self->_spacing = a3;
}

@end