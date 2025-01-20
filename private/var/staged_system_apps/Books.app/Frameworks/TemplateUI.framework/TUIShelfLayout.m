@interface TUIShelfLayout
- (BOOL)validatesAllChildren;
- (TUILayout)background;
- (TUILayout)content;
- (TUILayout)contentBackground;
- (void)computeLayout;
- (void)onChildrenUpdated;
@end

@implementation TUIShelfLayout

- (void)onChildrenUpdated
{
  v14.receiver = self;
  v14.super_class = (Class)TUIShelfLayout;
  [(TUILayout *)&v14 onChildrenUpdated];
  v3 = [(TUILayout *)self box];
  v4 = [(TUILayout *)self controller];
  v5 = [v3 content];
  v6 = [v4 layoutForModel:v5];
  content = self->_content;
  self->_content = v6;

  v8 = [v3 contentBackground];
  v9 = [v4 layoutForModel:v8];
  contentBackground = self->_contentBackground;
  self->_contentBackground = v9;

  v11 = [v3 background];
  v12 = [v4 layoutForModel:v11];
  background = self->_background;
  self->_background = v12;
}

- (BOOL)validatesAllChildren
{
  return 0;
}

- (void)computeLayout
{
  [(TUILayout *)self computeWidth];
  double v4 = v3;
  v5 = [(TUILayout *)self box];
  id v6 = [v5 contentWidth];
  uint64_t v8 = v7;
  float v9 = *(float *)&v7;

  double v10 = *(float *)&v6;
  double v11 = fmin(v9, fmax(*((float *)&v6 + 1), v4));
  if ((v8 & 0x8000000000000) != 0) {
    double v10 = v11;
  }
  -[TUILayout setContainingWidth:](self->_content, "setContainingWidth:", v10, v11);
  [(TUILayout *)self containingHeight];
  -[TUILayout setContainingHeight:](self->_content, "setContainingHeight:");
  [(TUILayout *)self->_content validateLayout];
  [(TUILayout *)self->_content computedTransformedSize];
  double v13 = v12;
  double v15 = v14;
  double v16 = (v4 - v12) * 0.5;
  -[TUILayout setComputedOrigin:](self->_content, "setComputedOrigin:", v16, 0.0);
  contentBackground = self->_contentBackground;
  if (contentBackground)
  {
    [(TUILayout *)contentBackground setContainingWidth:v13];
    [(TUILayout *)self->_contentBackground setContainingHeight:v15];
    [(TUILayout *)self->_contentBackground computedWidth];
    if ((v18 & 0x8000000000000) != 0) {
      double v19 = v13;
    }
    else {
      double v19 = NAN;
    }
    [(TUILayout *)self->_contentBackground setFlexedWidth:v19];
    [(TUILayout *)self->_contentBackground computedHeight];
    if ((v20 & 0x8000000000000) != 0) {
      double v21 = v15;
    }
    else {
      double v21 = NAN;
    }
    [(TUILayout *)self->_contentBackground setFlexedHeight:v21];
    [(TUILayout *)self->_contentBackground validateLayout];
    -[TUILayout setComputedOrigin:](self->_contentBackground, "setComputedOrigin:", v16, 0.0);
  }
  background = self->_background;
  if (background)
  {
    [(TUILayout *)background setContainingWidth:v4];
    [(TUILayout *)self->_background setContainingHeight:v15];
    [(TUILayout *)self->_background computedWidth];
    if ((v23 & 0x8000000000000) != 0) {
      double v24 = v4;
    }
    else {
      double v24 = NAN;
    }
    [(TUILayout *)self->_background setFlexedWidth:v24];
    [(TUILayout *)self->_background computedHeight];
    if ((v25 & 0x8000000000000) != 0) {
      double v26 = v15;
    }
    else {
      double v26 = NAN;
    }
    [(TUILayout *)self->_background setFlexedHeight:v26];
    [(TUILayout *)self->_background validateLayout];
    -[TUILayout setComputedOrigin:](self->_background, "setComputedOrigin:", CGPointZero.x, CGPointZero.y);
  }

  -[TUILayout setComputedNaturalSize:](self, "setComputedNaturalSize:", v4, v15);
}

- (TUILayout)content
{
  return self->_content;
}

- (TUILayout)contentBackground
{
  return self->_contentBackground;
}

- (TUILayout)background
{
  return self->_background;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_background, 0);
  objc_storeStrong((id *)&self->_contentBackground, 0);

  objc_storeStrong((id *)&self->_content, 0);
}

@end