@interface _UISearchBarLayoutBase
- (BOOL)isHostedByNavigationBar;
- (BOOL)isLayoutRTL;
- (BOOL)isLayoutValid;
- (CGSize)layoutSize;
- (UIEdgeInsets)contentInset;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)barMetrics;
- (void)invalidateLayout;
- (void)setBarMetrics:(int64_t)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setHostedByNavigationBar:(BOOL)a3;
- (void)setLayoutRTL:(BOOL)a3;
- (void)setLayoutSize:(CGSize)a3;
- (void)updateLayoutIfNeeded;
@end

@implementation _UISearchBarLayoutBase

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

- (void)setLayoutSize:(CGSize)a3
{
  if (a3.width != self->_layoutSize.width || a3.height != self->_layoutSize.height)
  {
    self->_layoutSize = a3;
    [(_UISearchBarLayoutBase *)self invalidateLayout];
  }
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (a3.left != self->_contentInset.left
    || a3.top != self->_contentInset.top
    || a3.right != self->_contentInset.right
    || a3.bottom != self->_contentInset.bottom)
  {
    self->_contentInset = a3;
    [(_UISearchBarLayoutBase *)self invalidateLayout];
  }
}

- (int64_t)barMetrics
{
  return self->_barMetrics;
}

- (void)setLayoutRTL:(BOOL)a3
{
  if (self->_layoutRTL != a3)
  {
    self->_layoutRTL = a3;
    [(_UISearchBarLayoutBase *)self invalidateLayout];
  }
}

- (void)setHostedByNavigationBar:(BOOL)a3
{
  if (self->_hostedByNavigationBar != a3)
  {
    self->_hostedByNavigationBar = a3;
    [(_UISearchBarLayoutBase *)self invalidateLayout];
  }
}

- (void)setBarMetrics:(int64_t)a3
{
  if (self->_barMetrics != a3)
  {
    self->_barMetrics = a3;
    [(_UISearchBarLayoutBase *)self invalidateLayout];
  }
}

- (BOOL)isHostedByNavigationBar
{
  return self->_hostedByNavigationBar;
}

- (BOOL)isLayoutRTL
{
  return self->_layoutRTL;
}

- (void)invalidateLayout
{
  self->_isLayoutValid = 0;
}

- (CGSize)layoutSize
{
  double width = self->_layoutSize.width;
  double height = self->_layoutSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)updateLayoutIfNeeded
{
  if (!self->_isLayoutValid) {
    [(_UISearchBarLayoutBase *)self updateLayout];
  }
  self->_isLayoutValid = 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_alloc_init((Class)objc_opt_class());
  if (result)
  {
    *((void *)result + 2) = self->_barMetrics;
    long long v5 = *(_OWORD *)&self->_contentInset.top;
    *(_OWORD *)((char *)result + 56) = *(_OWORD *)&self->_contentInset.bottom;
    *(_OWORD *)((char *)result + 40) = v5;
    *((unsigned char *)result + 9) = self->_layoutRTL;
    *((unsigned char *)result + 10) = self->_hostedByNavigationBar;
    *(CGSize *)((char *)result + 24) = self->_layoutSize;
    *((unsigned char *)result + 8) = self->_isLayoutValid;
  }
  return result;
}

- (BOOL)isLayoutValid
{
  return self->_isLayoutValid;
}

- (id)description
{
  v15.receiver = self;
  v15.super_class = (Class)_UISearchBarLayoutBase;
  v3 = [(_UISearchBarLayoutBase *)&v15 description];
  if (os_variant_has_internal_diagnostics())
  {
    if (!self->_isLayoutValid)
    {
      uint64_t v5 = [v3 stringByAppendingString:@" STALE"];

      v3 = (void *)v5;
    }
    int64_t barMetrics = self->_barMetrics;
    if (barMetrics)
    {
      v7 = _UIBarMetricsDebugDescription(barMetrics);
      uint64_t v8 = [v3 stringByAppendingFormat:@" %@", v7];

      v3 = (void *)v8;
    }
    if (self->_layoutRTL)
    {
      uint64_t v9 = [v3 stringByAppendingString:@" RTL"];

      v3 = (void *)v9;
    }
    v10 = v3;
    v3 = [v3 stringByAppendingFormat:@" layoutSize={%g, %g}", *(void *)&self->_layoutSize.width, *(void *)&self->_layoutSize.height];

    double top = self->_contentInset.top;
    double left = self->_contentInset.left;
    double right = self->_contentInset.right;
    if (left != 0.0 || top != 0.0 || right != 0.0 || self->_contentInset.bottom != 0.0)
    {
      uint64_t v14 = [v3 stringByAppendingFormat:@" contentInset={%g, %g, %g, %g}", *(void *)&top, *(void *)&left, *(void *)&self->_contentInset.bottom, *(void *)&right];

      v3 = (void *)v14;
    }
  }
  return v3;
}

@end