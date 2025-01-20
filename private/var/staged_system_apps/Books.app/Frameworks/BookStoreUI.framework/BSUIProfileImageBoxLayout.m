@interface BSUIProfileImageBoxLayout
- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4;
- (void)computeLayout;
@end

@implementation BSUIProfileImageBoxLayout

- (void)computeLayout
{
  [(BSUIProfileImageBoxLayout *)self computeWidth];
  double v4 = v3;
  [(BSUIProfileImageBoxLayout *)self computeHeight];

  -[BSUIProfileImageBoxLayout setComputedNaturalSize:](self, "setComputedNaturalSize:", v4, v5);
}

- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4
{
  id v5 = a4;
  [(BSUIProfileImageBoxLayout *)self computedNaturalSize];
  double v7 = v6;
  double v9 = v8;
  v10 = [_BSUIProfileImageLayerConfig alloc];
  [v5 contentsScale];
  double v12 = v11;

  v13 = [(BSUIProfileImageBoxLayout *)self box];
  [v13 cornerRadius];
  double v15 = v14;
  v16 = [(BSUIProfileImageBoxLayout *)self box];
  v17 = [v16 maskColor];
  v18 = -[_BSUIProfileImageLayerConfig initWithSize:contentsScale:cornerRadius:maskColor:](v10, "initWithSize:contentsScale:cornerRadius:maskColor:", v17, v7, v9, v12, v15);

  id v19 = [objc_alloc((Class)TUIRenderModelLayer) initWithSubmodels:0 config:v18 erasableInsets:UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right];
  [v19 setSize:v7, v9];
  v20 = [(BSUIProfileImageBoxLayout *)self box];
  v21 = [v20 identifier];
  [v19 setIdentifier:v21];

  id v22 = v19;
  return v22;
}

@end