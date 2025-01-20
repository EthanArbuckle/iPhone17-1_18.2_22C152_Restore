@interface RouteStepItem
- (BOOL)showsHairline;
- (Class)cellClass;
- (GEOComposedRoute)route;
- (RouteStepItem)initWithCellClass:(Class)a3 state:(unint64_t)a4 metrics:(id)a5 context:(int64_t)a6 route:(id)a7 scale:(double)a8;
- (RouteStepListMetrics)metrics;
- (UITraitCollection)traitCollection;
- (UIView)trailingView;
- (double)hairlineLeadingInset;
- (double)hairlineTrailingInset;
- (double)scale;
- (id)userInfo;
- (int64_t)context;
- (unint64_t)excludedFieldsMask;
- (unint64_t)state;
- (void)setExcludedFieldsMask:(unint64_t)a3;
- (void)setHairlineLeadingInset:(double)a3;
- (void)setHairlineTrailingInset:(double)a3;
- (void)setScale:(double)a3;
- (void)setShowsHairline:(BOOL)a3;
- (void)setState:(unint64_t)a3;
- (void)setTrailingView:(id)a3;
- (void)setTraitCollection:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation RouteStepItem

- (RouteStepItem)initWithCellClass:(Class)a3 state:(unint64_t)a4 metrics:(id)a5 context:(int64_t)a6 route:(id)a7 scale:(double)a8
{
  id v15 = a5;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)RouteStepItem;
  v17 = [(RouteStepItem *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_cellClass, a3);
    v18->_state = a4;
    objc_storeStrong((id *)&v18->_metrics, a5);
    v18->_context = a6;
    objc_storeStrong((id *)&v18->_route, a7);
    v18->_scale = a8;
  }

  return v18;
}

- (void)setTraitCollection:(id)a3
{
  id v5 = a3;
  unint64_t v6 = self->_traitCollection;
  unint64_t v7 = (unint64_t)v5;
  if (v7 | v6)
  {
    id v9 = (id)v7;
    unsigned __int8 v8 = [(id)v6 isEqual:v7];

    unint64_t v7 = (unint64_t)v9;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_traitCollection, a3);
      [(RouteStepItem *)self reset];
      unint64_t v7 = (unint64_t)v9;
    }
  }
}

- (void)setScale:(double)a3
{
  if (vabdd_f64(self->_scale, a3) > 2.22044605e-16)
  {
    self->_scale = a3;
    [(RouteStepItem *)self reset];
  }
}

- (void)setState:(unint64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    [(RouteStepItem *)self reset];
  }
}

- (void)setTrailingView:(id)a3
{
  id v5 = (UIView *)a3;
  if (self->_trailingView != v5)
  {
    unint64_t v6 = v5;
    objc_storeStrong((id *)&self->_trailingView, a3);
    [(RouteStepItem *)self reset];
    id v5 = v6;
  }
}

- (void)setShowsHairline:(BOOL)a3
{
  if (self->_showsHairline != a3)
  {
    self->_showsHairline = a3;
    [(RouteStepItem *)self reset];
  }
}

- (void)setHairlineLeadingInset:(double)a3
{
  if (vabdd_f64(self->_hairlineLeadingInset, a3) > 2.22044605e-16)
  {
    self->_hairlineLeadingInset = a3;
    [(RouteStepItem *)self reset];
  }
}

- (void)setHairlineTrailingInset:(double)a3
{
  if (vabdd_f64(self->_hairlineTrailingInset, a3) > 2.22044605e-16)
  {
    self->_hairlineTrailingInset = a3;
    [(RouteStepItem *)self reset];
  }
}

- (void)setUserInfo:(id)a3
{
  id v5 = a3;
  unint64_t v6 = (unint64_t)self->_userInfo;
  unint64_t v7 = (unint64_t)v5;
  if (v7 | v6)
  {
    id v9 = (id)v7;
    unsigned __int8 v8 = [(id)v6 isEqual:v7];

    unint64_t v7 = (unint64_t)v9;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong(&self->_userInfo, a3);
      [(RouteStepItem *)self reset];
      unint64_t v7 = (unint64_t)v9;
    }
  }
}

- (Class)cellClass
{
  return self->_cellClass;
}

- (RouteStepListMetrics)metrics
{
  return self->_metrics;
}

- (int64_t)context
{
  return self->_context;
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (double)scale
{
  return self->_scale;
}

- (unint64_t)state
{
  return self->_state;
}

- (BOOL)showsHairline
{
  return self->_showsHairline;
}

- (double)hairlineLeadingInset
{
  return self->_hairlineLeadingInset;
}

- (double)hairlineTrailingInset
{
  return self->_hairlineTrailingInset;
}

- (UIView)trailingView
{
  return self->_trailingView;
}

- (id)userInfo
{
  return self->_userInfo;
}

- (unint64_t)excludedFieldsMask
{
  return self->_excludedFieldsMask;
}

- (void)setExcludedFieldsMask:(unint64_t)a3
{
  self->_excludedFieldsMask = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_trailingView, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_metrics, 0);

  objc_storeStrong((id *)&self->_cellClass, 0);
}

@end