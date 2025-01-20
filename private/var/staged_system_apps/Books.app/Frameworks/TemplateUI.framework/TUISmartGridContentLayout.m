@interface TUISmartGridContentLayout
- (BOOL)layoutScrollContentShouldClipVertically;
- (CGSize)layoutScrollContentScrollSizeWithProposedSize:(CGSize)a3;
- (UIEdgeInsets)layoutScrollGradientFraction;
- (UIEdgeInsets)layoutScrollGradientInsets;
- (double)layoutScrollPageGap;
- (id)hoverIdentifierWithName:(id)a3 forDescdendent:(id)a4;
- (id)scrollPolicy;
- (void)appendAnchorsToSet:(id)a3 inRoot:(id)a4;
- (void)appendChildRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4 transform:(CGAffineTransform *)a5 toModels:(id)a6;
- (void)appendHoverRegions:(id)a3 relativeToLayout:(id)a4;
- (void)computeLayout;
@end

@implementation TUISmartGridContentLayout

- (id)hoverIdentifierWithName:(id)a3 forDescdendent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"cell"])
  {
    v8 = [v7 model];
    v9 = [v8 parentModel];

    uint64_t v10 = objc_opt_class();
    v11 = [(TUILayout *)self model];
    if (v9)
    {
      do
      {
        if (objc_opt_class() == v10) {
          break;
        }
        if (v9 == v11) {
          break;
        }
        uint64_t v12 = [v9 parentModel];

        v9 = (void *)v12;
      }
      while (v12);
    }
    v13 = 0;
    if (v9 != v11 && v9)
    {
      id v14 = v9;
      v15 = [TUIHoverIdentifier alloc];
      v16 = [v14 identifier];

      v13 = [(TUIHoverIdentifier *)v15 initWithName:v6 identifier:v16];
    }
  }
  else
  {
    v9 = [(TUILayout *)self layoutAncestor];
    v13 = [v9 hoverIdentifierWithName:v6];
  }

  return v13;
}

- (void)appendHoverRegions:(id)a3 relativeToLayout:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(TUILayout *)self layoutAncestor];
  v9 = [v8 layoutAncestor];

  uint64_t v10 = [v9 layoutManager];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  [(TUILayout *)self computedTransformInAncestorLayout:v6];

  v11[0] = v12;
  v11[1] = v13;
  v11[2] = v14;
  [v10 appendHoverRegions:v7 transform:v11];
}

- (void)appendAnchorsToSet:(id)a3 inRoot:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(TUILayout *)self layoutAncestor];
  id v10 = [v8 layoutAncestor];

  v9 = [v10 layoutManager];
  [v9 appendAnchorsToSet:v7 forLayout:self inRoot:v6];
}

- (void)computeLayout
{
  v3 = [(TUILayout *)self layoutAncestor];
  id v6 = [v3 layoutAncestor];

  v4 = [v6 layoutManager];
  [v4 layoutContent:self];
  v5 = [(TUILayout *)self layoutAncestor];
  [v4 positionContainerLayout:v5];

  [v4 contentLayoutSize];
  -[TUILayout setComputedNaturalSize:](self, "setComputedNaturalSize:");
}

- (void)appendChildRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4 transform:(CGAffineTransform *)a5 toModels:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  long long v12 = [(TUILayout *)self layoutAncestor];
  long long v13 = [v12 layoutAncestor];

  long long v14 = [v13 layoutManager];
  if (objc_opt_respondsToSelector())
  {
    long long v15 = *(_OWORD *)&a5->c;
    *(_OWORD *)&v31.a = *(_OWORD *)&a5->a;
    *(_OWORD *)&v31.c = v15;
    *(_OWORD *)&v31.tx = *(_OWORD *)&a5->tx;
    [v14 appendChildRenderModelCompatibleWithKind:a3 context:v10 transform:&v31 toModels:v11];
  }
  else
  {
    v30.receiver = self;
    v30.super_class = (Class)TUISmartGridContentLayout;
    long long v16 = *(_OWORD *)&a5->c;
    *(_OWORD *)&v31.a = *(_OWORD *)&a5->a;
    *(_OWORD *)&v31.c = v16;
    *(_OWORD *)&v31.tx = *(_OWORD *)&a5->tx;
    [(TUILayout *)&v30 appendChildRenderModelCompatibleWithKind:a3 context:v10 transform:&v31 toModels:v11];
  }
  double y = CGPointZero.y;
  CGFloat v18 = a5->tx + y * a5->c + a5->a * CGPointZero.x;
  CGFloat v19 = a5->ty + y * a5->d + a5->b * CGPointZero.x;
  [(TUILayout *)self computedNaturalSize];
  float64x2_t v27 = vaddq_f64(*(float64x2_t *)&a5->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a5->c, v21 * 0.5), *(float64x2_t *)&a5->a, v20 * 0.5));
  [v10 contentsScale];
  double v23 = TUIPointRoundedForScale(v27.f64[0], v27.f64[1], v22);
  memset(&v31, 0, sizeof(v31));
  CGAffineTransformMakeTranslation(&t2, -(v18 + v23 - v27.f64[0]), -(v19 + v24 - v27.f64[1]));
  long long v25 = *(_OWORD *)&a5->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a5->a;
  *(_OWORD *)&t1.c = v25;
  *(_OWORD *)&t1.tx = *(_OWORD *)&a5->tx;
  CGAffineTransformConcat(&v31, &t1, &t2);
  v26 = [v13 box];
  CGAffineTransform t1 = v31;
  [v14 appendAdornmentRenderModelsCompatibleWithKind:a3 transform:&t1 context:v10 box:v26 toModels:v11];
}

- (CGSize)layoutScrollContentScrollSizeWithProposedSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = [(TUILayout *)self layoutAncestor];
  id v6 = [v5 layoutAncestor];

  id v7 = [v6 layoutManager];
  if (objc_opt_respondsToSelector())
  {
    [v7 scrollLayoutSizeWithSize:width, height];
    double width = v8;
    double height = v9;
  }
  else
  {
    id v10 = [v6 box];
    [v10 height];
    if ((v11 & 0x6000000000000) == 0x2000000000000)
    {
      [v7 contentLayoutSize];
      double height = v12;
    }
  }
  double v13 = width;
  double v14 = height;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (id)scrollPolicy
{
  v2 = [(TUILayout *)self layoutAncestor];
  v3 = [v2 layoutAncestor];

  v4 = [v3 layoutManager];
  if (objc_opt_respondsToSelector())
  {
    v5 = [v4 scrollPolicy];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (double)layoutScrollPageGap
{
  v2 = [(TUILayout *)self layoutAncestor];
  v3 = [v2 layoutAncestor];

  v4 = [v3 layoutManager];
  v5 = [v4 configuration];
  double v6 = 0.0;
  if ([v5 paginated])
  {
    [v4 computedColumnSpacing];
    double v6 = v7;
  }

  return v6;
}

- (UIEdgeInsets)layoutScrollGradientInsets
{
  v2 = [(TUILayout *)self layoutAncestor];
  v3 = [v2 layoutAncestor];

  v4 = [v3 layoutManager];
  if (objc_opt_respondsToSelector())
  {
    [v4 scrollGradientInsets];
    CGFloat top = v5;
    CGFloat left = v7;
    CGFloat bottom = v9;
    CGFloat right = v11;
  }
  else
  {
    CGFloat top = UIEdgeInsetsZero.top;
    CGFloat left = UIEdgeInsetsZero.left;
    CGFloat bottom = UIEdgeInsetsZero.bottom;
    CGFloat right = UIEdgeInsetsZero.right;
  }

  double v13 = top;
  double v14 = left;
  double v15 = bottom;
  double v16 = right;
  result.CGFloat right = v16;
  result.CGFloat bottom = v15;
  result.CGFloat left = v14;
  result.CGFloat top = v13;
  return result;
}

- (UIEdgeInsets)layoutScrollGradientFraction
{
  v2 = [(TUILayout *)self layoutAncestor];
  v3 = [v2 layoutAncestor];

  v4 = [v3 layoutManager];
  if (objc_opt_respondsToSelector())
  {
    [v4 scrollGradientFraction];
    CGFloat top = v5;
    CGFloat left = v7;
    CGFloat bottom = v9;
    CGFloat right = v11;
  }
  else
  {
    CGFloat top = UIEdgeInsetsZero.top;
    CGFloat left = UIEdgeInsetsZero.left;
    CGFloat bottom = UIEdgeInsetsZero.bottom;
    CGFloat right = UIEdgeInsetsZero.right;
  }

  double v13 = top;
  double v14 = left;
  double v15 = bottom;
  double v16 = right;
  result.CGFloat right = v16;
  result.CGFloat bottom = v15;
  result.CGFloat left = v14;
  result.CGFloat top = v13;
  return result;
}

- (BOOL)layoutScrollContentShouldClipVertically
{
  v2 = [(TUILayout *)self layoutAncestor];
  v3 = [v2 layoutAncestor];

  v4 = [v3 box];
  [v4 height];
  BOOL v6 = (v5 & 0x6000000000000) != 0x2000000000000;

  return v6;
}

- (void).cxx_destruct
{
}

@end