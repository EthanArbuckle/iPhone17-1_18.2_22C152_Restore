@interface TUITriggerLayout
- (void)appendAnchorsToSet:(id)a3 inRoot:(id)a4;
- (void)computeLayout;
@end

@implementation TUITriggerLayout

- (void)computeLayout
{
}

- (void)appendAnchorsToSet:(id)a3 inRoot:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (char *)[v7 axis];
  [(TUILayout *)self computedTransformInAncestorLayout:v6];

  double y = CGPointZero.y;
  double v10 = y * 0.0 + 0.0 * CGPointZero.x;
  double v11 = v10 + 0.0;
  double v12 = y * 0.0;
  if (v8 == (unsigned char *)&def_141F14 + 1) {
    double v13 = v10 + 0.0;
  }
  else {
    double v13 = v12 + 0.0 * CGPointZero.x + 0.0;
  }
  if (v8 == (unsigned char *)&def_141F14 + 1
    && (char *)[(TUILayout *)self computedLayoutDirection] == (char *)&def_141F14 + 2)
  {
    v14 = [(TUILayout *)self box];
    [v14 anchorOffset];
    double v16 = v11 - v15;
  }
  else
  {
    v14 = [(TUILayout *)self box];
    [v14 anchorOffset];
    double v16 = v13 + v17;
  }

  v18 = [TUITrigger alloc];
  v19 = [(TUILayout *)self box];
  v20 = [v19 name];
  v21 = [(TUILayout *)self box];
  v22 = -[TUITrigger initWithName:observationMode:](v18, "initWithName:observationMode:", v20, [v21 observationMode]);

  [v7 appendTriggerAnchorWithOffset:v22 trigger:[v7 axis] axis:v16];
}

@end