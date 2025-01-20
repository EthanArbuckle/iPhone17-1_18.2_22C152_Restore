@interface UIPreviewParameters
- (BOOL)_isSingleLineText;
- (BOOL)appliesShadow;
- (BOOL)hidesSourceViewDuringDropAnimation;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUsingCustomBackgroundColor;
- (NSArray)_textLineRects;
- (UIBezierPath)effectiveShadowPath;
- (UIBezierPath)shadowPath;
- (UIBezierPath)visiblePath;
- (UIColor)backgroundColor;
- (UIEdgeInsets)_textPathInsets;
- (UIPreviewParameters)init;
- (UIPreviewParameters)initWithTextLineRects:(NSArray *)textLineRects;
- (double)_textPathCornerRadius;
- (id)_initWithMode:(int64_t)a3 visiblePath:(id)a4 backgroundColor:(id)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)_previewMode;
- (unint64_t)hash;
- (void)_setPreviewMode:(int64_t)a3;
- (void)_setTextLineRects:(id)a3;
- (void)_setTextPathCornerRadius:(double)a3;
- (void)_setTextPathInsets:(UIEdgeInsets)a3;
- (void)setAppliesShadow:(BOOL)a3;
- (void)setBackgroundColor:(UIColor *)backgroundColor;
- (void)setHidesSourceViewDuringDropAnimation:(BOOL)a3;
- (void)setShadowPath:(UIBezierPath *)shadowPath;
- (void)setVisiblePath:(UIBezierPath *)visiblePath;
@end

@implementation UIPreviewParameters

- (UIPreviewParameters)init
{
  if (self)
  {
    _UIPreviewParametersDefaultBackgroundColor();
    v3 = (UIColor *)objc_claimAutoreleasedReturnValue();
    backgroundColor = self->_backgroundColor;
    self->_backgroundColor = v3;

    v5 = self;
  }

  return self;
}

- (UIPreviewParameters)initWithTextLineRects:(NSArray *)textLineRects
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v5 = textLineRects;
  if (!v5)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"UIPreviewParameters.m", 268, @"Invalid parameter not satisfying: %@", @"textLineRects != nil" object file lineNumber description];
  }
  objc_opt_class();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v6 = v5;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v11 = [MEMORY[0x1E4F28B00] currentHandler];
          [v11 handleFailureInMethod:a2, self, @"UIPreviewParameters.m", 273, @"Invalid parameter not satisfying: %@", @"[supposedValue isKindOfClass:valueClass]" object file lineNumber description];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  v12 = [(UIPreviewParameters *)self init];
  if (v12)
  {
    uint64_t v13 = [(NSArray *)v6 copy];
    v14 = v12->_textLineRects;
    v12->_textLineRects = (NSArray *)v13;

    *(_OWORD *)&v12->_textPathInsets.top = _UIPreviewParametersTextMargins;
    *(_OWORD *)&v12->_textPathInsets.bottom = unk_186B94E78;
    v12->_textPathCornerRadius = 13.0;
    v12->_previewMode = 1;
    v15 = v12;
  }

  return v12;
}

- (id)_initWithMode:(int64_t)a3 visiblePath:(id)a4 backgroundColor:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(UIPreviewParameters *)self init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    visiblePath = v10->_visiblePath;
    v10->_visiblePath = (UIBezierPath *)v11;

    uint64_t v13 = [v9 copy];
    backgroundColor = v10->_backgroundColor;
    v10->_backgroundColor = (UIColor *)v13;

    v10->_previewMode = a3;
    v10->_isUsingCustomBackgroundColor = 1;
    v15 = v10;
  }

  return v10;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
  v4 = backgroundColor;
  self->_isUsingCustomBackgroundColor = v4 != 0;
  id v9 = v4;
  v5 = (void *)[(UIColor *)v4 copy];
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = v5;
  }
  else
  {
    _UIPreviewParametersDefaultBackgroundColor();
    uint64_t v7 = (UIColor *)objc_claimAutoreleasedReturnValue();
  }
  id v8 = self->_backgroundColor;
  self->_backgroundColor = v7;
}

- (BOOL)appliesShadow
{
  return self->_appliesShadow && [(UIPreviewParameters *)self _previewMode] != 4;
}

- (BOOL)_isSingleLineText
{
  return [(NSArray *)self->_textLineRects count] == 1;
}

- (UIBezierPath)visiblePath
{
  if (self->_previewMode == 1 && !self->_visiblePath)
  {
    _UIPreviewParametersGenerateTextPlatter(self->_textLineRects, self->_textPathInsets.top, self->_textPathInsets.left, self->_textPathInsets.bottom, self->_textPathInsets.right, self->_textPathCornerRadius);
    v3 = (UIBezierPath *)objc_claimAutoreleasedReturnValue();
    visiblePath = self->_visiblePath;
    self->_visiblePath = v3;
  }
  v5 = self->_visiblePath;
  return v5;
}

- (void)_setTextPathInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_textPathInsets.left
    || a3.top != self->_textPathInsets.top
    || a3.right != self->_textPathInsets.right
    || a3.bottom != self->_textPathInsets.bottom)
  {
    self->_textPathInsets = a3;
    visiblePath = self->_visiblePath;
    self->_visiblePath = 0;
  }
}

- (void)_setTextPathCornerRadius:(double)a3
{
  if (self->_textPathCornerRadius != a3)
  {
    self->_textPathCornerRadius = a3;
    visiblePath = self->_visiblePath;
    self->_visiblePath = 0;
  }
}

- (UIBezierPath)effectiveShadowPath
{
  shadowPath = self->_shadowPath;
  if (!shadowPath) {
    shadowPath = self->_visiblePath;
  }
  return shadowPath;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v5 = [(NSArray *)self->_textLineRects copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  uint64_t v7 = [(UIBezierPath *)self->_visiblePath copy];
  id v8 = (void *)v4[4];
  v4[4] = v7;

  uint64_t v9 = [(UIColor *)self->_backgroundColor copy];
  uint64_t v10 = (void *)v4[6];
  v4[6] = v9;

  v4[7] = self->_previewMode;
  *((unsigned char *)v4 + 16) = self->_appliesShadow;
  *((unsigned char *)v4 + 17) = self->_hidesSourceViewDuringDropAnimation;
  long long v11 = *(_OWORD *)&self->_textPathInsets.bottom;
  *((_OWORD *)v4 + 4) = *(_OWORD *)&self->_textPathInsets.top;
  *((_OWORD *)v4 + 5) = v11;
  v4[3] = *(void *)&self->_textPathCornerRadius;
  uint64_t v12 = [(UIBezierPath *)self->_shadowPath copy];
  uint64_t v13 = (void *)v4[5];
  v4[5] = v12;

  return v4;
}

- (unint64_t)hash
{
  v3 = [(UIPreviewParameters *)self visiblePath];
  uint64_t v4 = [v3 hash];
  uint64_t v5 = [(UIPreviewParameters *)self backgroundColor];
  uint64_t v6 = [v5 hash] ^ v4;
  int64_t v7 = v6 ^ [(UIPreviewParameters *)self _previewMode];
  int64_t v8 = v7 ^ [(UIPreviewParameters *)self appliesShadow];
  [(UIPreviewParameters *)self _textPathCornerRadius];
  int64_t v10 = v8 ^ (int)v9;
  [(UIPreviewParameters *)self _textPathInsets];
  uint64_t v12 = (int)v11;
  [(UIPreviewParameters *)self _textPathInsets];
  int64_t v14 = v10 ^ v12 ^ (int)v13;
  [(UIPreviewParameters *)self _textPathInsets];
  uint64_t v16 = (int)v15;
  [(UIPreviewParameters *)self _textPathInsets];
  uint64_t v18 = v16 ^ (int)v17;
  long long v19 = [(UIPreviewParameters *)self shadowPath];
  unint64_t v20 = v14 ^ v18 ^ [v19 hash];

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [(UIPreviewParameters *)self visiblePath];
    int64_t v7 = [v5 visiblePath];
    if (v6 == v7)
    {
      int v10 = 1;
    }
    else
    {
      int64_t v8 = [(UIPreviewParameters *)self visiblePath];
      double v9 = [v5 visiblePath];
      int v10 = [v8 isEqual:v9];
    }
    uint64_t v12 = [(UIPreviewParameters *)self backgroundColor];
    double v13 = [v5 backgroundColor];
    if (v12 != v13)
    {
      int64_t v14 = [(UIPreviewParameters *)self backgroundColor];
      double v15 = [v5 backgroundColor];
      v10 &= [v14 isEqual:v15];
    }
    int64_t v16 = [(UIPreviewParameters *)self _previewMode];
    if (v16 == [v5 _previewMode]) {
      int v17 = v10;
    }
    else {
      int v17 = 0;
    }
    BOOL v18 = [(UIPreviewParameters *)self appliesShadow];
    int v19 = v17 & ~(v18 ^ [v5 appliesShadow]);
    [(UIPreviewParameters *)self _textPathInsets];
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    [v5 _textPathInsets];
    BOOL v31 = v23 == v30;
    if (v21 != v32) {
      BOOL v31 = 0;
    }
    if (v27 != v29) {
      BOOL v31 = 0;
    }
    if (v25 != v28) {
      BOOL v31 = 0;
    }
    int v33 = v19 & v31;
    [(UIPreviewParameters *)self _textPathCornerRadius];
    double v35 = v34;
    [v5 _textPathCornerRadius];
    if (v35 == v36) {
      int v37 = v33;
    }
    else {
      int v37 = 0;
    }
    v38 = [(UIPreviewParameters *)self shadowPath];
    v39 = [v5 shadowPath];
    if (v38 != v39)
    {
      v40 = [(UIPreviewParameters *)self shadowPath];
      v41 = [v5 shadowPath];
      v37 &= [v40 isEqual:v41];
    }
    BOOL v42 = [(UIPreviewParameters *)self hidesSourceViewDuringDropAnimation];
    int v11 = v37 & (v42 ^ [v5 hidesSourceViewDuringDropAnimation] ^ 1);
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v4 = objc_opt_class();
  id v5 = [(UIPreviewParameters *)self backgroundColor];
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p backgroundColor = %@", v4, self, v5];;

  int64_t v7 = [(UIPreviewParameters *)self visiblePath];

  if (v7)
  {
    int64_t v8 = [(UIPreviewParameters *)self visiblePath];
    [v6 appendFormat:@"; visiblePath = %@", v8];
  }
  double v9 = [(UIPreviewParameters *)self shadowPath];

  if (v9)
  {
    int v10 = [(UIPreviewParameters *)self shadowPath];
    [v6 appendFormat:@"; shadowPath = %@", v10];
  }
  [v6 appendString:@">"];
  return v6;
}

- (NSArray)_textLineRects
{
  return self->_textLineRects;
}

- (void)_setTextLineRects:(id)a3
{
}

- (UIEdgeInsets)_textPathInsets
{
  double top = self->_textPathInsets.top;
  double left = self->_textPathInsets.left;
  double bottom = self->_textPathInsets.bottom;
  double right = self->_textPathInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)_textPathCornerRadius
{
  return self->_textPathCornerRadius;
}

- (void)setVisiblePath:(UIBezierPath *)visiblePath
{
}

- (UIBezierPath)shadowPath
{
  return self->_shadowPath;
}

- (void)setShadowPath:(UIBezierPath *)shadowPath
{
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (int64_t)_previewMode
{
  return self->_previewMode;
}

- (void)_setPreviewMode:(int64_t)a3
{
  self->_previewMode = a3;
}

- (void)setAppliesShadow:(BOOL)a3
{
  self->_appliesShadow = a3;
}

- (BOOL)hidesSourceViewDuringDropAnimation
{
  return self->_hidesSourceViewDuringDropAnimation;
}

- (void)setHidesSourceViewDuringDropAnimation:(BOOL)a3
{
  self->_hidesSourceViewDuringDropAnimation = a3;
}

- (BOOL)isUsingCustomBackgroundColor
{
  return self->_isUsingCustomBackgroundColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_shadowPath, 0);
  objc_storeStrong((id *)&self->_visiblePath, 0);
  objc_storeStrong((id *)&self->_textLineRects, 0);
}

@end