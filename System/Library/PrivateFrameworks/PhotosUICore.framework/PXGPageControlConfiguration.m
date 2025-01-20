@interface PXGPageControlConfiguration
- (BOOL)hidesForSinglePage;
- (BOOL)isEqual:(id)a3;
- (SEL)action;
- (id)copyWithZone:(_NSZone *)a3;
- (id)target;
- (int64_t)currentPage;
- (int64_t)numberOfPages;
- (unint64_t)hash;
- (void)setAction:(SEL)a3;
- (void)setCurrentPage:(int64_t)a3;
- (void)setHidesForSinglePage:(BOOL)a3;
- (void)setNumberOfPages:(int64_t)a3;
- (void)setTarget:(id)a3;
@end

@implementation PXGPageControlConfiguration

- (void).cxx_destruct
{
}

- (void)setAction:(SEL)a3
{
  self->_action = a3;
}

- (SEL)action
{
  return self->_action;
}

- (void)setTarget:(id)a3
{
}

- (id)target
{
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  return WeakRetained;
}

- (void)setHidesForSinglePage:(BOOL)a3
{
  self->_hidesForSinglePage = a3;
}

- (BOOL)hidesForSinglePage
{
  return self->_hidesForSinglePage;
}

- (void)setCurrentPage:(int64_t)a3
{
  self->_currentPage = a3;
}

- (int64_t)currentPage
{
  return self->_currentPage;
}

- (void)setNumberOfPages:(int64_t)a3
{
  self->_numberOfPages = a3;
}

- (int64_t)numberOfPages
{
  return self->_numberOfPages;
}

- (unint64_t)hash
{
  int64_t v3 = [(PXGPageControlConfiguration *)self numberOfPages];
  return v3 ^ (2 * [(PXGPageControlConfiguration *)self currentPage]);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PXGPageControlConfiguration *)a3;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = (SEL *)v5;
      BOOL v9 = v5->_numberOfPages == self->_numberOfPages
        && v5->_currentPage == self->_currentPage
        && (id WeakRetained = objc_loadWeakRetained(&v5->_target),
            id v8 = objc_loadWeakRetained(&self->_target),
            v8,
            WeakRetained,
            WeakRetained == v8)
        && v6[5] == self->_action;
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  *((void *)v4 + 2) = self->_numberOfPages;
  *((void *)v4 + 3) = self->_currentPage;
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  objc_storeWeak((id *)v4 + 4, WeakRetained);

  *((void *)v4 + 5) = self->_action;
  return v4;
}

@end