@interface TUIAspectLayout
- (double)computeIntrinsicAspectRatio;
- (void)computeLayout;
@end

@implementation TUIAspectLayout

- (double)computeIntrinsicAspectRatio
{
  v2 = [(TUILayout *)self box];
  [v2 aspectRatio];
  double v4 = v3;

  return v4;
}

- (void)computeLayout
{
  [(TUILayout *)self computeWidth];
  double v4 = v3;
  [(TUILayout *)self computeHeight];
  double v6 = v5;
  v7 = [(TUILayout *)self children];
  id v23 = [v7 firstObject];

  [v23 setContainingWidth:v4];
  [v23 setContainingHeight:v6];
  [v23 computedWidth];
  if ((v8 & 0x8000000000000) != 0) {
    double v9 = v4;
  }
  else {
    double v9 = NAN;
  }
  [v23 setFlexedWidth:v9];
  [v23 computedHeight];
  if ((v10 & 0x8000000000000) != 0) {
    double v11 = v6;
  }
  else {
    double v11 = NAN;
  }
  [v23 setFlexedHeight:v11];
  [v23 validateLayout];
  [v23 computedTransformedSize];
  double v13 = v12;
  double v15 = v14;
  unint64_t v16 = [(TUILayout *)self computedLayoutDirection];
  v17 = [v23 box];
  id v18 = [v17 halign];

  switch((unint64_t)v18)
  {
    case 0uLL:
    case 2uLL:
      double x = 0.5;
      break;
    case 1uLL:
      if (v16 == 2) {
        double x = 1.0;
      }
      else {
        double x = 0.0;
      }
      break;
    case 3uLL:
      if (v16 == 2) {
        double x = 0.0;
      }
      else {
        double x = 1.0;
      }
      break;
    default:
      double x = CGPointZero.x;
      break;
  }
  v20 = [v23 box];
  unint64_t v21 = (unint64_t)[v20 valign];

  if (v21 > 4) {
    double y = CGPointZero.y;
  }
  else {
    double y = dbl_243560[v21];
  }
  [v23 setComputedOrigin:(v4 - v13) * x, (v6 - v15) * y];
  -[TUILayout setComputedNaturalSize:](self, "setComputedNaturalSize:", v4, v6);
}

@end