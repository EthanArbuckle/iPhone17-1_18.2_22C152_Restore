@interface UIKBBackgroundView
- (BOOL)_canDrawContent;
- (BOOL)cacheDeferable;
- (BOOL)displaysColorImage;
- (BOOL)keepNonPersistent;
- (NSObject)geometryCacheKey;
- (NSString)cacheKey;
- (UIKBBackgroundView)initWithFrame:(CGRect)a3;
- (UIKBRenderConfig)renderConfig;
- (UIKBScreenTraits)screenTraits;
- (double)cachedWidth;
- (id)cacheKeysForRenderFlags:(id)a3;
- (int64_t)assetIdiom;
- (void)displayLayer:(id)a3;
- (void)drawContentsOfRenderers:(id)a3;
- (void)refreshStyleForKeyplane:(id)a3 inputTraits:(id)a4;
- (void)setGeometryCacheKey:(id)a3;
- (void)setRenderConfig:(id)a3;
- (void)setScreenTraits:(id)a3;
@end

@implementation UIKBBackgroundView

- (UIKBBackgroundView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)UIKBBackgroundView;
  v3 = -[UIKBSplitImageView initWithFrame:canStretchAsFullWidth:](&v8, sel_initWithFrame_canStretchAsFullWidth_, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    geometryCacheKey = v3->_geometryCacheKey;
    v3->_geometryCacheKey = &stru_1ED0E84C0;

    [(UIView *)v4 setUserInteractionEnabled:0];
    v6 = v4;
  }

  return v4;
}

- (void)refreshStyleForKeyplane:(id)a3 inputTraits:(id)a4
{
  id v27 = a3;
  id v7 = a4;
  objc_storeStrong((id *)&self->_keyplane, a3);
  objc_storeStrong((id *)&self->_inputTraits, a4);
  [(UIView *)self setOpaque:0];
  objc_super v8 = [(UIKBTree *)self->_keyplane cachedKeysByKeyName:@"Candidate-Selection"];
  self->_hasCandidateKeys = v8 != 0;

  if (self->_hasCandidateKeys) {
    int v9 = 101;
  }
  else {
    int v9 = [v27 visualStyle];
  }
  self->_visualStyle = v9;
  self->_isSplit = [(UIKBTree *)self->_keyplane isSplit];
  self->_centerFilled = [(UIKBScreenTraits *)self->_screenTraits centerFilled];
  if (!self->_isSplit) {
    goto LABEL_7;
  }
  [(UIKBSplitImageView *)self prepareForDisplay:1];
  [v27 frameForKeylayoutName:@"split-left"];
  self->_splitLeftRect.origin.x = v10;
  self->_splitLeftRect.origin.y = v11;
  self->_splitLeftRect.size.width = v12;
  self->_splitLeftRect.size.height = v13;
  [v27 frameForKeylayoutName:@"split-right"];
  self->_splitRightRect.origin.x = v14;
  self->_splitRightRect.origin.y = v15;
  self->_splitRightRect.size.width = v16;
  self->_splitRightRect.size.height = v17;
  CGSize size = self->_splitLeftRect.size;
  self->_splitLeftCacheRect.origin = self->_splitLeftRect.origin;
  self->_splitLeftCacheRect.CGSize size = size;
  CGSize v19 = self->_splitRightRect.size;
  self->_splitRightCacheRect.origin = self->_splitRightRect.origin;
  self->_splitRightCacheRect.CGSize size = v19;
  if (!self->_isSplit) {
    goto LABEL_7;
  }
  if (!self->_centerFilled)
  {
    [(UIKBSplitImageView *)self prepareForDisplay:1];
    unint64_t v23 = [(UIView *)self _clipCornersOfView:self];
    self->_topCorners = v23 | 0xC;
    v24 = objc_msgSend(NSString, "stringWithFormat:", @"%lu,%g:%g", v23 | 0xC, *(void *)&self->_splitLeftRect.size.height, *(void *)&self->_splitRightRect.size.height);
    [(UIKBBackgroundView *)self setGeometryCacheKey:v24];

    double v25 = UIKBCornerRadius();
    CGFloat v26 = v25 + v25;
    self->_splitLeftCacheRect.size.width = v26;
    self->_splitRightCacheRect.size.width = v26;
    self->_splitRightCacheRect.origin.x = self->_splitLeftCacheRect.size.width + 3.0;
  }
  else
  {
LABEL_7:
    [(UIKBSplitImageView *)self prepareForDisplay:0];
    v20 = NSNumber;
    [(UIView *)self size];
    v22 = [v20 numberWithInt:(int)v21];
    [(UIKBBackgroundView *)self setGeometryCacheKey:v22];
  }
  [(UIView *)self setNeedsDisplay];
}

- (BOOL)_canDrawContent
{
  return 1;
}

- (void)drawContentsOfRenderers:(id)a3
{
  id v21 = a3;
  v4 = +[UIKBRenderingContext renderingContextForRenderConfig:self->_renderConfig];
  v5 = +[UIKBRenderFactory lightweightFactoryForVisualStyle:[(UIKBTree *)self->_keyplane visualStyling] renderingContext:v4];
  if (v5)
  {
    [(UIView *)self contentScaleFactor];
    objc_msgSend(v5, "setScale:");
    [(UIKBScreenTraits *)self->_screenTraits stretchFactor];
    objc_msgSend(v5, "setStretchFactor:");
    v6 = [v5 backgroundTraitsForKeyplane:self->_keyplane];
    id v7 = [v6 geometry];
    uint64_t v8 = [v7 splitLeftRect];
    if (v8)
    {
      int v9 = (void *)v8;
      CGFloat v10 = [v6 geometry];
      CGFloat v11 = [v10 splitRightRect];

      if (!v11)
      {
LABEL_8:
        v20 = [v21 objectAtIndex:0];
        [v20 renderBackgroundTraits:v6];

        goto LABEL_9;
      }
      if (self->_centerFilled)
      {
        CGFloat v12 = [v6 geometry];
        [v12 setSplitLeftRect:0];

        id v7 = [v6 geometry];
        [v7 setSplitRightRect:0];
      }
      else
      {
        unint64_t topCorners = self->_topCorners;
        CGFloat v14 = [v6 geometry];
        [v14 setRoundRectCorners:topCorners];

        CGFloat v15 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", self->_splitLeftCacheRect.origin.x, self->_splitLeftCacheRect.origin.y, self->_splitLeftCacheRect.size.width, self->_splitLeftCacheRect.size.height);
        CGFloat v16 = [v6 geometry];
        [v16 setSplitLeftRect:v15];

        CGFloat v17 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", self->_splitRightCacheRect.origin.x, self->_splitRightCacheRect.origin.y, self->_splitRightCacheRect.size.width, self->_splitRightCacheRect.size.height);
        v18 = [v6 geometry];
        [v18 setSplitRightRect:v17];

        double v19 = UIKBCornerRadius();
        id v7 = [v6 geometry];
        [v7 setRoundRectRadius:v19];
      }
    }

    goto LABEL_8;
  }
LABEL_9:
}

- (NSString)cacheKey
{
  v3 = (void *)MEMORY[0x1E4F1C978];
  v4 = [NSNumber numberWithInt:self->_visualStyle];
  v5 = [NSNumber numberWithBool:self->_centerFilled];
  v6 = objc_msgSend(v3, "arrayWithObjects:", v4, v5, self->_geometryCacheKey, 0);
  id v7 = [v6 componentsJoinedByString:@";"];

  return (NSString *)v7;
}

- (id)cacheKeysForRenderFlags:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(UIKBBackgroundView *)self cacheKey];
  v6 = [v4 firstObject];

  id v7 = [(UIKBBackgroundView *)self renderConfig];
  uint64_t v8 = +[UIKBRenderingContext renderingContextForRenderConfig:v7];

  int v9 = +[UIKBRenderFactory cacheKeyForString:withRenderFlags:renderingContext:](UIKBRenderFactory, "cacheKeyForString:withRenderFlags:renderingContext:", v5, [v6 integerValue], v8);
  CGFloat v12 = v6;
  v13[0] = v9;
  CGFloat v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];

  return v10;
}

- (void)setRenderConfig:(id)a3
{
  id v4 = (UIKBRenderConfig *)a3;
  v5 = [(UIKBBackgroundView *)self renderConfig];
  if (v5)
  {
    v6 = [(UIKBBackgroundView *)self renderConfig];
    int v7 = [v6 lightKeyboard];
    int v8 = v7 ^ [(UIKBRenderConfig *)v4 lightKeyboard];
  }
  else
  {
    int v8 = 1;
  }

  renderConfig = self->_renderConfig;
  self->_renderConfig = v4;

  if (v4)
  {
    if (v8) {
      [(UIView *)self setNeedsDisplay];
    }
    CGFloat v10 = [(UIView *)self layer];
    CGFloat v11 = [v10 contents];

    if (!v11)
    {
      [(UIView *)self setNeedsDisplay];
    }
  }
}

- (void)displayLayer:(id)a3
{
  if ([(UIView *)self isHidden]) {
    return;
  }
  if (self->_isSplit)
  {
    double v4 = self->_splitRightCacheRect.size.width + 3.0;
    double v5 = self->_splitLeftCacheRect.size.width + 3.0;
    [(UIKBBackgroundView *)self cachedWidth];
    double v7 = v6;
    [(UIKBBackgroundView *)self cachedWidth];
    double v9 = v8;
    double v10 = self->_splitLeftCacheRect.size.width + 1.0;
    double v11 = self->_splitRightCacheRect.size.width + 1.0;
  }
  else
  {
    double v4 = 0.0;
    double v9 = 0.0;
    double v5 = 0.0;
    double v7 = 0.0;
    double v11 = 0.0;
    double v10 = 0.0;
  }
  CGFloat v12 = [(UIView *)self layer];
  [v12 setBackgroundColor:0];

  int visualStyle = self->_visualStyle;
  if (visualStyle == 5
    || visualStyle == 105
    || [(UITextInputTraits *)self->_inputTraits keyboardType] == 127)
  {
    CGFloat v14 = [(UIView *)self layer];
    [v14 setContents:0];

    [(UIKBSplitImageView *)self setImage:0 splitLeft:0 splitRight:0 keyplane:0];
    if ([(UITextInputTraits *)self->_inputTraits keyboardType] != 127
      && [(UITextInputTraits *)self->_inputTraits keyboardType] != 4
      && [(UITextInputTraits *)self->_inputTraits keyboardType] != 11
      && ([(id)UIApp _isSpringBoard] & 1) != 0)
    {
      return;
    }
    CGFloat v15 = [(UIView *)self window];
    char v16 = [v15 _isTextEffectsWindow];

    if (v16) {
      return;
    }
    CGFloat v17 = [(UIKBBackgroundView *)self renderConfig];
    +[_UIBackdropViewSettings settingsForStyle:graphicsQuality:](_UIBackdropViewSettings, "settingsForStyle:graphicsQuality:", [v17 backdropStyle], +[UIKBRenderFactory _graphicsQuality](UIKBRenderFactory, "_graphicsQuality"));
    id v31 = (id)objc_claimAutoreleasedReturnValue();

    [v31 grayscaleTintLevel];
    double v19 = v18;
    [v31 grayscaleTintAlpha];
    id v21 = +[UIColor colorWithWhite:v19 alpha:v20];
    uint64_t v22 = [v21 CGColor];
    unint64_t v23 = [(UIView *)self layer];
    [v23 setBackgroundColor:v22];

LABEL_15:

    return;
  }
  if ([(UIKBRenderConfig *)self->_renderConfig lightKeyboard])
  {
    v24 = +[UIKeyboardCache sharedInstance];
    double v25 = [(UIKBTree *)self->_keyplane layoutName];
    CGFloat v26 = [v24 displayImagesForView:self fromLayout:v25 imageFlags:&unk_1ED3F0250];

    id v31 = [v26 objectForKey:&unk_1ED3F4A88];

    if (v31)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v21 = v31;
        if ([v21 hasFormatColor])
        {
          id v31 = [v21 imageWithRenderingMode:2];
        }
        else
        {
          id v31 = v21;
        }
      }
      else
      {
        id v21 = 0;
      }
      id v27 = [(UIView *)self layer];
      [v27 setContents:0];

      if (self->_isSplit)
      {
        if (self->_centerFilled)
        {
          v28 = objc_msgSend(v31, "resizableImageWithCapInsets:", 0.0, v10, 0.0, v11);
          [(UIKBSplitImageView *)self setImage:v28 splitLeft:0 splitRight:0 keyplane:0];
        }
        else
        {
          v28 = objc_msgSend(v31, "_resizableImageWithSubimageInsets:resizeInsets:", 0.0, 0.0, 0.0, v4, 0.0, 0.0, 0.0, v7);
          v29 = objc_msgSend(v31, "_resizableImageWithSubimageInsets:resizeInsets:", 0.0, v5, 0.0, 0.0, 0.0, v9, 0.0, 0.0);
          [(UIKBSplitImageView *)self setImage:0 splitLeft:v28 splitRight:v29 keyplane:self->_keyplane];
        }
      }
      else
      {
        [(UIKBSplitImageView *)self setImage:v31 splitLeft:0 splitRight:0 keyplane:0];
      }
      if (v21)
      {
        v30 = [v21 formatColor];
        [(UIKBSplitImageView *)self setContentsMultiplyColor:v30];
      }
      else
      {
        [(UIKBSplitImageView *)self setContentsMultiplyColor:0];
      }
      goto LABEL_15;
    }
  }
  [(UIKBSplitImageView *)self setImage:0 splitLeft:0 splitRight:0 keyplane:0];
}

- (BOOL)cacheDeferable
{
  return 0;
}

- (double)cachedWidth
{
  if (+[UIKeyboardCache enabled])
  {
    if (self->_isSplit) {
      return self->_splitLeftCacheRect.size.width + self->_splitRightCacheRect.size.width + 3.0;
    }
    else {
      return 1.0;
    }
  }
  else
  {
    [(UIView *)self size];
  }
  return result;
}

- (BOOL)keepNonPersistent
{
  return 0;
}

- (BOOL)displaysColorImage
{
  return 0;
}

- (int64_t)assetIdiom
{
  v2 = [(UIView *)self traitCollection];
  int64_t v3 = [v2 userInterfaceIdiom];

  return v3;
}

- (UIKBRenderConfig)renderConfig
{
  return self->_renderConfig;
}

- (NSObject)geometryCacheKey
{
  return self->_geometryCacheKey;
}

- (void)setGeometryCacheKey:(id)a3
{
}

- (UIKBScreenTraits)screenTraits
{
  return self->_screenTraits;
}

- (void)setScreenTraits:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenTraits, 0);
  objc_storeStrong((id *)&self->_renderConfig, 0);
  objc_storeStrong((id *)&self->_geometryCacheKey, 0);
  objc_storeStrong((id *)&self->_inputTraits, 0);
  objc_storeStrong((id *)&self->_keyplane, 0);
}

@end