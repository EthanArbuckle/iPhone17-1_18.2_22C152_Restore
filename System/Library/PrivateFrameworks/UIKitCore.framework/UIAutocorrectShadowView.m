@interface UIAutocorrectShadowView
- (void)drawRect:(CGRect)a3;
- (void)setEdgeType:(int)a3;
@end

@implementation UIAutocorrectShadowView

- (void)setEdgeType:(int)a3
{
  if (self->m_edgeType != a3)
  {
    self->m_edgeType = a3;
    [(UIView *)self setNeedsDisplay];
  }
}

- (void)drawRect:(CGRect)a3
{
  int m_edgeType = self->m_edgeType;
  if (m_edgeType == 2) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 8 * (m_edgeType == 1);
  }
  [(UIView *)self bounds];
  CGRect v26 = CGRectInset(v25, 8.0, 8.0);
  CGRect v27 = CGRectIntegral(v26);
  CGFloat x = v27.origin.x;
  CGFloat y = v27.origin.y;
  CGFloat width = v27.size.width;
  CGFloat height = v27.size.height;
  if (!_MergedGlobals_21_2)
  {
    v9 = [[UIColor alloc] initWithRed:0.0 green:0.0 blue:0.0 alpha:0.06];
    v10 = (void *)_MergedGlobals_21_2;
    _MergedGlobals_21_2 = (uint64_t)v9;
  }
  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.CGFloat width = width;
  v28.size.CGFloat height = height;
  CGRect v29 = CGRectInset(v28, 1.0, 1.0);
  v11 = +[UIBezierPath shadowBezierPath:withRoundedEdges:](UIBezierPath, "shadowBezierPath:withRoundedEdges:", v4, v29.origin.x, v29.origin.y + 1.0, v29.size.width, v29.size.height + 1.0);
  [(id)_MergedGlobals_21_2 set];
  [v11 fill];

  if (!qword_1EB25E7F0)
  {
    v12 = [[UIColor alloc] initWithRed:0.0 green:0.0 blue:0.0 alpha:0.05];
    v13 = (void *)qword_1EB25E7F0;
    qword_1EB25E7F0 = (uint64_t)v12;
  }
  v30.origin.CGFloat x = x;
  v30.origin.CGFloat y = y;
  v30.size.CGFloat width = width;
  v30.size.CGFloat height = height;
  CGRect v31 = CGRectInset(v30, 0.0, 1.0);
  v14 = +[UIBezierPath shadowBezierPath:withRoundedEdges:](UIBezierPath, "shadowBezierPath:withRoundedEdges:", v4, v31.origin.x, v31.origin.y + 1.0, v31.size.width, v31.size.height + 2.0);
  [(id)qword_1EB25E7F0 set];
  [v14 fill];

  if (!qword_1EB25E7F8)
  {
    v15 = [[UIColor alloc] initWithRed:0.0 green:0.0 blue:0.0 alpha:0.05];
    v16 = (void *)qword_1EB25E7F8;
    qword_1EB25E7F8 = (uint64_t)v15;
  }
  v32.origin.CGFloat x = x;
  v32.origin.CGFloat y = y;
  v32.size.CGFloat width = width;
  v32.size.CGFloat height = height;
  CGRect v33 = CGRectInset(v32, -1.0, 1.0);
  v17 = +[UIBezierPath shadowBezierPath:withRoundedEdges:](UIBezierPath, "shadowBezierPath:withRoundedEdges:", v4, v33.origin.x, v33.origin.y + 1.0, v33.size.width, v33.size.height + 3.0);
  [(id)qword_1EB25E7F8 set];
  [v17 fill];

  if (!qword_1EB25E800)
  {
    v18 = [[UIColor alloc] initWithRed:0.0 green:0.0 blue:0.0 alpha:0.04];
    v19 = (void *)qword_1EB25E800;
    qword_1EB25E800 = (uint64_t)v18;
  }
  v34.origin.CGFloat x = x;
  v34.origin.CGFloat y = y;
  v34.size.CGFloat width = width;
  v34.size.CGFloat height = height;
  CGRect v35 = CGRectInset(v34, -2.0, -1.0);
  v20 = +[UIBezierPath shadowBezierPath:withRoundedEdges:](UIBezierPath, "shadowBezierPath:withRoundedEdges:", v4, v35.origin.x, v35.origin.y, v35.size.width, v35.size.height + 4.0);
  [(id)qword_1EB25E800 set];
  [v20 fill];

  if (!qword_1EB25E808)
  {
    v21 = [[UIColor alloc] initWithRed:0.0 green:0.0 blue:0.0 alpha:0.02];
    v22 = (void *)qword_1EB25E808;
    qword_1EB25E808 = (uint64_t)v21;
  }
  v36.origin.CGFloat x = x;
  v36.origin.CGFloat y = y;
  v36.size.CGFloat width = width;
  v36.size.CGFloat height = height;
  CGRect v37 = CGRectInset(v36, -3.0, -2.0);
  +[UIBezierPath shadowBezierPath:withRoundedEdges:](UIBezierPath, "shadowBezierPath:withRoundedEdges:", v4, v37.origin.x, v37.origin.y + 0.0, v37.size.width, v37.size.height + 5.0);
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  [(id)qword_1EB25E808 set];
  [v23 fill];
}

@end