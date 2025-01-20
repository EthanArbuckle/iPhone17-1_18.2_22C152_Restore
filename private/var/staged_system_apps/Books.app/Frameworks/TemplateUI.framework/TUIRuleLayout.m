@interface TUIRuleLayout
- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4;
- (void)computeLayout;
@end

@implementation TUIRuleLayout

- (void)computeLayout
{
  uint64_t v3 = [(TUILayout *)self layoutAncestor];
  if (v3)
  {
    while (1)
    {
      id v16 = (id)v3;
      if (objc_opt_respondsToSelector()) {
        break;
      }
      uint64_t v4 = [v16 layoutAncestor];

      uint64_t v3 = v4;
      if (!v4) {
        goto LABEL_4;
      }
    }
  }
  else
  {
LABEL_4:
    id v16 = 0;
  }
  v5 = [(TUILayout *)self box];
  v6 = (char *)[v5 axis];

  if (v6 || (v6 = (char *)[v16 ruleLayoutAxis]) != 0)
  {
    if (v6 == (unsigned char *)&def_141F14 + 2)
    {
      v10 = [(TUILayout *)self controller];
      [v10 contentsScale];
      double v8 = 1.0 / v14;
      [(TUILayout *)self computeHeight];
      double v7 = v15;
    }
    else
    {
      double v7 = 0.0;
      double v8 = 0.0;
      if (v6 != (unsigned char *)&def_141F14 + 1) {
        goto LABEL_13;
      }
      [(TUILayout *)self computeWidth];
      double v8 = v9;
      v10 = [(TUILayout *)self controller];
      [v10 contentsScale];
      double v7 = 1.0 / v11;
    }
  }
  else
  {
    [(TUILayout *)self computeWidth];
    double v8 = v12;
    [(TUILayout *)self computeHeight];
    double v7 = v13;
  }
LABEL_13:
  -[TUILayout setComputedNaturalSize:](self, "setComputedNaturalSize:", v8, v7);
}

- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4
{
  id v5 = a4;
  v6 = [_TUIRuleLayerConfig alloc];
  double v7 = [(TUILayout *)self box];
  double v8 = [v7 color];
  double v9 = [(_TUIRuleLayerConfig *)v6 initWithColor:v8];

  v10 = -[TUIRenderModelLayer initWithSubmodels:config:erasableInsets:]([TUIRenderModelLayer alloc], "initWithSubmodels:config:erasableInsets:", 0, v9, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  double v11 = [(TUILayout *)self box];
  double v12 = [v11 identifier];
  [(TUIRenderModelLayer *)v10 setIdentifier:v12];

  [(TUILayout *)self renderModelSizeWithContext:v5];
  double v14 = v13;
  double v16 = v15;

  -[TUIRenderModelLayer setSize:](v10, "setSize:", v14, v16);
  return v10;
}

@end