@interface SXComponentVisiblePercentageProvider
- (SXComponentVisiblePercentageProvider)initWithViewport:(id)a3;
- (SXViewport)viewport;
- (double)visiblePercentageOfObject:(id)a3;
@end

@implementation SXComponentVisiblePercentageProvider

- (SXComponentVisiblePercentageProvider)initWithViewport:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXComponentVisiblePercentageProvider;
  v6 = [(SXComponentVisiblePercentageProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_viewport, a3);
  }

  return v7;
}

- (double)visiblePercentageOfObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  double v5 = 0.0;
  if (objc_opt_isKindOfClass())
  {
    [v4 absoluteFrame];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    v14 = [(SXComponentVisiblePercentageProvider *)self viewport];
    [v14 dynamicBounds];
    v25.origin.CGFloat x = v7;
    v25.origin.CGFloat y = v9;
    v25.size.CGFloat width = v11;
    v25.size.CGFloat height = v13;
    CGRect v22 = CGRectIntersection(v21, v25);
    CGFloat x = v22.origin.x;
    CGFloat y = v22.origin.y;
    CGFloat width = v22.size.width;
    CGFloat height = v22.size.height;

    v23.origin.CGFloat x = x;
    v23.origin.CGFloat y = y;
    v23.size.CGFloat width = width;
    v23.size.CGFloat height = height;
    double v19 = CGRectGetHeight(v23);
    v24.origin.CGFloat x = v7;
    v24.origin.CGFloat y = v9;
    v24.size.CGFloat width = v11;
    v24.size.CGFloat height = v13;
    double v5 = v19 / fmax(CGRectGetHeight(v24), 1.0);
  }

  return v5;
}

- (SXViewport)viewport
{
  return self->_viewport;
}

- (void).cxx_destruct
{
}

@end