@interface TUIMutableHStack
- ($881BB7C90C7D0DFCC1492E3DC022A30F)spacing;
- (BOOL)addChildLayout:(id)a3 ifFitting:(BOOL)a4;
- (TUIMutableHStack)initWithLayout:(id)a3 spacing:(id *)a4 maxWidth:(double)a5;
- (double)accumulatedWidth;
- (double)maxWidth;
- (id)children;
@end

@implementation TUIMutableHStack

- (TUIMutableHStack)initWithLayout:(id)a3 spacing:(id *)a4 maxWidth:(double)a5
{
  uint64_t v7 = v5;
  v14.receiver = self;
  v14.super_class = (Class)TUIMutableHStack;
  v9 = [(TUIHStack *)&v14 initWithLayout:a3];
  v10 = v9;
  if (v9)
  {
    *(void *)&v9->_accumulatedWidth = a4;
    *(void *)&v9->_spacing.value = v7;
    *(double *)&v9->_muChildren = a5;
    v9->_maxWidth = 0.0;
    uint64_t v11 = objc_opt_new();
    CGFloat height = v10->super._layoutSize.height;
    *(void *)&v10->super._layoutSize.CGFloat height = v11;
  }
  return v10;
}

- (id)children
{
  return *(id *)&self->super._layoutSize.height;
}

- (BOOL)addChildLayout:(id)a3 ifFitting:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [v6 computedTransformedSize];
  double v8 = v7;
  v9 = [(TUIHStack *)self guideLayoutController];
  [v6 setGuideLayoutController:v9];

  [v6 validateGuides];
  id v10 = [*(id *)&self->super._layoutSize.height count];
  if (v10) {
    double v8 = v8 + *(float *)&self->_accumulatedWidth;
  }
  uint64_t v11 = [(TUIHStack *)self guideLayoutController];
  if (v4 && !TUICGFloatIsLessThanOrAlmostEqualFloat(v8 + self->_maxWidth, *(double *)&self->_muChildren))
  {
    BOOL v17 = 0;
  }
  else
  {
    if (v10)
    {
      v12 = [_TUIHStackSpacer alloc];
      v13 = [(TUIHStack *)self layout];
      objc_super v14 = [(TUIHStack *)self layout];
      v15 = [v14 controller];
      v16 = [(TUILayout *)v12 initWithModel:0 parent:v13 controller:v15];

      -[_TUIHStackSpacer setSpecifiedWidth:](v16, "setSpecifiedWidth:", *(void *)&self->_accumulatedWidth, *(void *)&self->_spacing.value);
      [*(id *)&self->super._layoutSize.height addObject:v16];
      [(TUILayout *)v16 setGuideLayoutController:v11];
      if (v11) {
        [(TUILayout *)v16 validateGuides];
      }
      [(TUILayout *)v16 invalidateLayout];
    }
    [v6 setGuideLayoutController:v11];
    if (v11)
    {
      [v6 validateGuides];
      [v6 invalidateLayout];
    }
    [*(id *)&self->super._layoutSize.height addObject:v6];
    self->_maxWidth = v8 + self->_maxWidth;
    BOOL v17 = 1;
  }

  return v17;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)spacing
{
  return *($881BB7C90C7D0DFCC1492E3DC022A30F **)&self->_accumulatedWidth;
}

- (double)maxWidth
{
  return *(double *)&self->_muChildren;
}

- (double)accumulatedWidth
{
  return self->_maxWidth;
}

- (void).cxx_destruct
{
}

@end