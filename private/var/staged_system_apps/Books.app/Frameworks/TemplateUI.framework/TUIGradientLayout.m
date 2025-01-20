@interface TUIGradientLayout
- (TUIGradientLayout)initWithModel:(id)a3 parent:(id)a4 controller:(id)a5;
- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4;
@end

@implementation TUIGradientLayout

- (TUIGradientLayout)initWithModel:(id)a3 parent:(id)a4 controller:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)TUIGradientLayout;
  v5 = [(TUILayout *)&v8 initWithModel:a3 parent:a4 controller:a5];
  v6 = v5;
  if (v5)
  {
    [(TUILayout *)v5 setSpecifiedWidthComputeInherited:1];
    [(TUILayout *)v6 setSpecifiedHeightComputeInherited:1];
  }
  return v6;
}

- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4
{
  id v5 = a4;
  v6 = [[_TUIGradientStyler alloc] initWithLayout:self];
  v7 = [[_TUIGradientContainerLayerConfig alloc] initWithStyle:v6];
  objc_super v8 = -[TUIRenderModelLayer initWithSubmodels:config:erasableInsets:]([TUIRenderModelLayer alloc], "initWithSubmodels:config:erasableInsets:", 0, v7, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  v9 = [(TUILayout *)self box];
  v10 = [v9 identifier];
  [(TUIRenderModelLayer *)v8 setIdentifier:v10];

  [(TUILayout *)self renderModelSizeWithContext:v5];
  double v12 = v11;
  double v14 = v13;

  -[TUIRenderModelLayer setSize:](v8, "setSize:", v12, v14);
  return v8;
}

@end