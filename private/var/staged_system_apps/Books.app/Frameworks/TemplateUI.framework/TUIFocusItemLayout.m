@interface TUIFocusItemLayout
- (CGRect)computedErasableBoundsPrimitive;
- (id)collectLinkEntities;
- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4;
@end

@implementation TUIFocusItemLayout

- (id)collectLinkEntities
{
  v2 = [(TUILayout *)self box];
  v3 = [v2 linkEntities];

  return v3;
}

- (id)newRenderModelCompatibleWithKind:(unint64_t)a3 context:(id)a4
{
  if (a3 < 4) {
    return 0;
  }
  v5 = [a4 renderModelForContainerLayout:self kind:6];
  v15 = [(TUILayout *)self box];
  v6 = [v15 identifier];
  v7 = [(TUILayout *)self box];
  v8 = [v7 focusStyle];
  v9 = [(TUILayout *)self box];
  v10 = [v9 actionHandler];
  v11 = [(TUILayout *)self box];
  v12 = [v11 linkEntities];
  v13 = +[TUIFocusContainerView renderModelWithSubviewsModel:v5 identifier:v6 focusStyle:v8 actionHandler:v10 linkEntities:v12];

  return v13;
}

- (CGRect)computedErasableBoundsPrimitive
{
  v21.receiver = self;
  v21.super_class = (Class)TUIFocusItemLayout;
  [(TUILayout *)&v21 computedErasableBoundsPrimitive];
  CGFloat x = v3;
  CGFloat y = v5;
  CGFloat width = v7;
  CGFloat height = v9;
  v11 = [(TUILayout *)self box];
  v12 = [v11 focusStyle];

  if (v12)
  {
    [(TUILayout *)self computedBounds];
    [v12 erasableBoundsWithBounds:];
    v25.origin.CGFloat x = v13;
    v25.origin.CGFloat y = v14;
    v25.size.CGFloat width = v15;
    v25.size.CGFloat height = v16;
    v22.origin.CGFloat x = x;
    v22.origin.CGFloat y = y;
    v22.size.CGFloat width = width;
    v22.size.CGFloat height = height;
    CGRect v23 = CGRectUnion(v22, v25);
    CGFloat x = v23.origin.x;
    CGFloat y = v23.origin.y;
    CGFloat width = v23.size.width;
    CGFloat height = v23.size.height;
  }

  double v17 = x;
  double v18 = y;
  double v19 = width;
  double v20 = height;
  result.size.CGFloat height = v20;
  result.size.CGFloat width = v19;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v17;
  return result;
}

@end