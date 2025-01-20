@interface UIStatusBarItemView
+ (id)createViewForItem:(id)a3 withData:(id)a4 actions:(int)a5 foregroundStyle:(id)a6;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (BOOL)_shouldReverseLayoutDirection;
- (BOOL)allowsUpdates;
- (BOOL)allowsUserInteraction;
- (BOOL)animatesDataChange;
- (BOOL)isVisible;
- (BOOL)shouldTintContentImage;
- (BOOL)updateForNewData:(id)a3 actions:(int)a4;
- (UIStatusBarForegroundStyleAttributes)foregroundStyle;
- (UIStatusBarItem)item;
- (UIStatusBarItemView)initWithItem:(id)a3 data:(id)a4 actions:(int)a5 style:(id)a6;
- (UIStatusBarLayoutManager)layoutManager;
- (double)addContentOverlap:(double)a3;
- (double)adjustFrameToNewSize:(double)a3;
- (double)currentLeftOverlap;
- (double)currentOverlap;
- (double)currentRightOverlap;
- (double)extraLeftPadding;
- (double)extraRightPadding;
- (double)legibilityStrength;
- (double)maximumOverlap;
- (double)neededSizeForImageSet:(id)a3;
- (double)resetContentOverlap;
- (double)setStatusBarData:(id)a3 actions:(int)a4;
- (double)shadowPadding;
- (double)standardPadding;
- (double)updateContentsAndWidth;
- (id)accessibilityHUDRepresentation;
- (id)cachedImageWithText:(id)a3 truncatedWithEllipsesAtMaxWidth:(double)a4 letterSpacing:(double)a5;
- (id)contentsIOSurface;
- (id)contentsImage;
- (id)description;
- (id)foregroundView;
- (id)imageFromImageContextClippedToWidth:(double)a3;
- (id)imageWithShadowNamed:(id)a3;
- (id)imageWithText:(id)a3;
- (id)imageWithText:(id)a3 shouldCache:(BOOL)a4;
- (id)textFont;
- (int64_t)legibilityStyle;
- (int64_t)textAlignment;
- (int64_t)textStyle;
- (void)_tintContentLayerIfNeeded;
- (void)beginDisablingRasterization;
- (void)beginImageContextWithMinimumWidth:(double)a3;
- (void)clearCachedTextImage;
- (void)dealloc;
- (void)endDisablingRasterization;
- (void)endImageContext;
- (void)setAllowsUpdates:(BOOL)a3;
- (void)setContentMode:(int64_t)a3;
- (void)setCurrentOverlap:(double)a3;
- (void)setLayerContentsImage:(id)a3;
- (void)setLayoutManager:(id)a3;
- (void)setVisible:(BOOL)a3;
- (void)setVisible:(BOOL)a3 frame:(CGRect)a4 duration:(double)a5;
- (void)setVisible:(BOOL)a3 settingAlpha:(BOOL)a4;
- (void)willMoveToWindow:(id)a3;
@end

@implementation UIStatusBarItemView

+ (id)createViewForItem:(id)a3 withData:(id)a4 actions:(int)a5 foregroundStyle:(id)a6
{
  if (!a3) {
    return 0;
  }
  uint64_t v6 = *(void *)&a5;
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  v12 = objc_msgSend(objc_alloc((Class)objc_msgSend(v11, "viewClass")), "initWithItem:data:actions:style:", v11, v10, v6, v9);

  return v12;
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UIStatusBarItemView;
  if ([(UIView *)&v7 _shouldAnimatePropertyWithKey:v4]) {
    char v5 = 1;
  }
  else {
    char v5 = [v4 isEqualToString:@"contents"];
  }

  return v5;
}

- (UIStatusBarItemView)initWithItem:(id)a3 data:(id)a4 actions:(int)a5 style:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  [v13 height];
  double v15 = v14;
  double v16 = *MEMORY[0x1E4F1DB28];
  double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v18 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v19 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  int v20 = [v13 usesVerticalLayout];
  if (v20) {
    double v21 = v15;
  }
  else {
    double v21 = v18;
  }
  if (v20) {
    double v22 = v19;
  }
  else {
    double v22 = v15;
  }
  v23 = -[UIView initWithFrame:](self, "initWithFrame:", v16, v17, v21, v22);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_item, a3);
    v24->_imageContext = 0;
    [v13 scale];
    v24->_imageContextScale = v25;
    objc_storeStrong((id *)&v24->_foregroundStyle, a6);
    [(UIStatusBarItemView *)v24 updateForNewStyle:v13];
    v26 = [(UIView *)v24 layer];
    [v26 setAllowsGroupOpacity:0];

    [(UIStatusBarItemView *)v24 setAllowsUpdates:1];
    [(UIView *)v24 setUserInteractionEnabled:[(UIStatusBarItemView *)v24 allowsUserInteraction]];
    [(UIStatusBarItemView *)v24 updateForNewData:v12 actions:v7];
    [(UIStatusBarItemView *)v24 updateContentsAndWidth];
  }

  return v24;
}

- (BOOL)allowsUserInteraction
{
  return 0;
}

- (void)dealloc
{
  imageContext = self->_imageContext;
  if (imageContext) {
    CFRelease(imageContext);
  }
  v4.receiver = self;
  v4.super_class = (Class)UIStatusBarItemView;
  [(UIView *)&v4 dealloc];
}

- (id)foregroundView
{
  v3 = [(UIView *)self superview];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    char v5 = [(UIView *)self superview];
  }
  else
  {
    char v5 = 0;
  }
  return v5;
}

- (void)setVisible:(BOOL)a3
{
}

- (void)setVisible:(BOOL)a3 settingAlpha:(BOOL)a4
{
  self->_visible = a3;
  if (a4)
  {
    double v4 = 0.0;
    if (a3) {
      double v4 = 1.0;
    }
    [(UIView *)self setAlpha:v4];
  }
}

- (void)setVisible:(BOOL)a3 frame:(CGRect)a4 duration:(double)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  BOOL v12 = a5 > 0.0
     && +[UIView _isInAnimationBlockWithAnimationsEnabled];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __49__UIStatusBarItemView_setVisible_frame_duration___block_invoke;
  v15[3] = &__block_descriptor_41_e24_v24__0___v___8___v__B_16l;
  *(double *)&v15[4] = a5;
  BOOL v16 = a3;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __49__UIStatusBarItemView_setVisible_frame_duration___block_invoke_2;
  v13[3] = &unk_1E52D9FC0;
  v13[4] = self;
  BOOL v14 = a3;
  +[UIView conditionallyAnimate:v12 withAnimation:v15 layout:v13 completion:0];
  -[UIView setFrame:](self, "setFrame:", x, y, width, height);
}

uint64_t __49__UIStatusBarItemView_setVisible_frame_duration___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double v3 = *(double *)(a1 + 32);
  double v4 = v3 * 0.333333333;
  if (!*(unsigned char *)(a1 + 40)) {
    double v4 = 0.0;
  }
  return +[UIView animateWithDuration:32 delay:a2 options:a3 animations:v3 * 0.666666667 completion:v4];
}

uint64_t __49__UIStatusBarItemView_setVisible_frame_duration___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setVisible:*(unsigned __int8 *)(a1 + 40)];
}

- (void)setCurrentOverlap:(double)a3
{
  self->_currentOverlap = a3;
}

- (double)currentOverlap
{
  return self->_currentOverlap;
}

- (double)currentLeftOverlap
{
  return ceil(self->_currentOverlap * 0.5);
}

- (double)currentRightOverlap
{
  return floor(self->_currentOverlap * 0.5);
}

- (double)setStatusBarData:(id)a3 actions:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  double v7 = 0.0;
  if ([(UIStatusBarItemView *)self allowsUpdates]
    && [(UIStatusBarItemView *)self updateForNewData:v6 actions:v4])
  {
    [(UIStatusBarItemView *)self updateContentsAndWidth];
    double v7 = v8;
  }

  return v7;
}

- (int64_t)legibilityStyle
{
  v2 = [(UIStatusBarItemView *)self foregroundStyle];
  int64_t v3 = [v2 legibilityStyle];

  return v3;
}

- (double)legibilityStrength
{
  return 0.3;
}

- (void)setLayerContentsImage:(id)a3
{
  id v4 = a3;
  char v5 = v4;
  if (!v4 || ([v4 image], id v6 = objc_claimAutoreleasedReturnValue(), v6, !v6))
  {
    double v17 = [(UIView *)self layer];
    [v17 setContents:0];

    double v18 = [(UIView *)self layer];
    [v18 setMask:0];

    legibilityView = self->_legibilityView;
    if (legibilityView)
    {
      [(UIView *)legibilityView removeFromSuperview];
      int v20 = self->_legibilityView;
      self->_legibilityView = 0;
    }
    double v15 = [(UIView *)self layer];
    [v15 setContentsMultiplyColor:0];
    goto LABEL_10;
  }
  int64_t v7 = [(UIStatusBarItemView *)self legibilityStyle];
  if (v7)
  {
    int64_t v8 = v7;
    id v9 = [(UIView *)self layer];
    [v9 setContents:0];

    id v10 = self->_legibilityView;
    if (!v10)
    {
      id v11 = [[_UILegibilitySettings alloc] initWithStyle:v8];
      BOOL v12 = [_UILegibilityView alloc];
      [(UIStatusBarItemView *)self legibilityStrength];
      id v13 = -[_UILegibilityView initWithSettings:strength:image:](v12, "initWithSettings:strength:image:", v11, 0);
      BOOL v14 = self->_legibilityView;
      self->_legibilityView = v13;

      [(UIView *)self bounds];
      -[UIView setFrame:](self->_legibilityView, "setFrame:");
      [(UIView *)self->_legibilityView setAutoresizingMask:18];
      [(UIView *)self->_legibilityView setContentMode:[(UIView *)self contentMode]];
      [(UIView *)self insertSubview:self->_legibilityView atIndex:0];

      id v10 = self->_legibilityView;
    }
    double v15 = [v5 image];
    BOOL v16 = [v5 shadowImage];
    [(_UILegibilityView *)v10 setImage:v15 shadowImage:v16];

LABEL_10:
    goto LABEL_11;
  }
  double v21 = self->_legibilityView;
  if (v21)
  {
    [(UIView *)v21 removeFromSuperview];
    double v22 = self->_legibilityView;
    self->_legibilityView = 0;
  }
  if ([(UIStatusBarItemView *)self _shouldReverseLayoutDirection])
  {
    v23 = [v5 image];
    uint64_t v24 = [v23 imageOrientation];

    if (v24 == 4)
    {
      memset(&v31, 0, sizeof(v31));
      CGAffineTransformMakeScale(&v31, -1.0, 1.0);
      double v25 = [(UIView *)self layer];
      CGAffineTransform v30 = v31;
      [v25 setAffineTransform:&v30];
    }
  }
  id v26 = [v5 image];
  uint64_t v27 = [v26 CGImage];
  v28 = [(UIView *)self layer];
  [v28 setContents:v27];

  v29 = [v5 image];
  [v29 scale];
  -[UIView setContentScaleFactor:](self, "setContentScaleFactor:");

  [(UIStatusBarItemView *)self _tintContentLayerIfNeeded];
LABEL_11:
}

- (double)adjustFrameToNewSize:(double)a3
{
  [(UIView *)self frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  id v13 = [(UIStatusBarItemView *)self foregroundStyle];
  int v14 = [v13 usesVerticalLayout];

  if (v14) {
    double v15 = v12;
  }
  else {
    double v15 = v10;
  }
  if (v15 == a3) {
    return 0.0;
  }
  double v16 = a3 - v15;
  if (v14) {
    double v17 = v10;
  }
  else {
    double v17 = a3;
  }
  if (v14) {
    double v18 = a3;
  }
  else {
    double v18 = v12;
  }
  -[UIView setFrame:](self, "setFrame:", v6, v8, v17, v18);
  return v16;
}

- (double)neededSizeForImageSet:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  double v6 = 0.0;
  if (v4)
  {
    double v7 = [v4 image];

    if (v7)
    {
      double v8 = [v5 image];
      [v8 size];
      double v6 = v9;
      double v11 = v10;

      double v12 = [(UIStatusBarItemView *)self foregroundStyle];
      if ([v12 usesVerticalLayout]) {
        double v6 = v11;
      }
    }
  }

  return v6;
}

- (void)_tintContentLayerIfNeeded
{
  if ([(UIStatusBarItemView *)self shouldTintContentImage])
  {
    id v6 = [(UIStatusBarItemView *)self foregroundStyle];
    id v3 = [v6 tintColor];
    uint64_t v4 = [v3 CGColor];
    double v5 = [(UIView *)self layer];
    [v5 setContentsMultiplyColor:v4];
  }
  else
  {
    id v6 = [(UIView *)self layer];
    [v6 setContentsMultiplyColor:0];
  }
}

- (double)updateContentsAndWidth
{
  id v3 = [(UIStatusBarItemView *)self contentsImage];
  if (v3)
  {
    [(UIStatusBarItemView *)self neededSizeForImageSet:v3];
    -[UIStatusBarItemView adjustFrameToNewSize:](self, "adjustFrameToNewSize:");
    double v5 = v4;
    id v6 = [v3 image];

    if (v6) {
      [(UIStatusBarItemView *)self setLayerContentsImage:v3];
    }
  }
  else
  {
    uint64_t v7 = [(UIStatusBarItemView *)self contentsIOSurface];
    if (v7)
    {
      double v8 = (void *)v7;
      [(UIStatusBarItemView *)self setLayerContentsImage:0];
      [(UIView *)self _currentScreenScale];
      double v10 = v9;
      double v11 = [(UIView *)self layer];
      [v11 setContents:v8];

      double v12 = [(UIView *)self layer];
      [v12 setContentsScale:v10];

      [(UIStatusBarItemView *)self _tintContentLayerIfNeeded];
      -[UIStatusBarItemView adjustFrameToNewSize:](self, "adjustFrameToNewSize:", (double)[v8 width] / v10);
      double v5 = v13;
    }
    else
    {
      [(UIStatusBarItemView *)self neededSizeForImageSet:0];
      -[UIStatusBarItemView adjustFrameToNewSize:](self, "adjustFrameToNewSize:");
      double v5 = v14;
    }
  }

  return v5;
}

- (void)setContentMode:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIStatusBarItemView;
  -[UIView setContentMode:](&v5, sel_setContentMode_);
  [(UIView *)self->_legibilityView setContentMode:a3];
}

- (int64_t)textStyle
{
  return 1;
}

- (id)textFont
{
  id v3 = [(UIStatusBarItemView *)self foregroundStyle];
  double v4 = objc_msgSend(v3, "textFontForStyle:", -[UIStatusBarItemView textStyle](self, "textStyle"));

  return v4;
}

- (int64_t)textAlignment
{
  v2 = [(UIStatusBarItemView *)self foregroundStyle];
  int64_t v3 = [v2 usesVerticalLayout];

  return v3;
}

- (double)standardPadding
{
  v2 = [(UIStatusBarItemView *)self foregroundStyle];
  [v2 standardPadding];
  double v4 = v3;

  return v4;
}

- (double)shadowPadding
{
  v2 = [(UIStatusBarItemView *)self foregroundStyle];
  [v2 shadowPadding];
  double v4 = v3;

  return v4;
}

- (double)extraLeftPadding
{
  return 0.0;
}

- (double)extraRightPadding
{
  return 0.0;
}

- (double)resetContentOverlap
{
  return 0.0;
}

- (double)addContentOverlap:(double)a3
{
  return 0.0;
}

- (double)maximumOverlap
{
  return 0.0;
}

- (BOOL)updateForNewData:(id)a3 actions:(int)a4
{
  return 0;
}

- (BOOL)animatesDataChange
{
  return 0;
}

- (id)contentsImage
{
  return 0;
}

- (id)contentsIOSurface
{
  return 0;
}

- (void)beginImageContextWithMinimumWidth:(double)a3
{
  double v4 = ceil(a3);
  objc_super v5 = [(UIStatusBarItemView *)self foregroundStyle];
  int v6 = [v5 usesVerticalLayout];

  imageContext = self->_imageContext;
  if (!imageContext) {
    goto LABEL_7;
  }
  if (v6) {
    size_t Height = CGBitmapContextGetHeight(imageContext);
  }
  else {
    size_t Height = CGBitmapContextGetWidth(imageContext);
  }
  if (v4 != (double)Height / self->_imageContextScale)
  {
    CFRelease(self->_imageContext);
    self->_imageContext = 0;
    goto LABEL_7;
  }
  double v16 = self->_imageContext;
  if (!v16)
  {
LABEL_7:
    if (v4 > 0.0)
    {
      double v9 = [(UIStatusBarItemView *)self foregroundStyle];
      [v9 height];
      double v11 = v10;

      if (v6) {
        CGFloat v12 = v11;
      }
      else {
        CGFloat v12 = v4;
      }
      if (v6) {
        CGFloat v13 = v4;
      }
      else {
        CGFloat v13 = v11;
      }
      _UIGraphicsBeginImageContextWithOptions(0, 0, v12, v13, self->_imageContextScale);
      ContextStack = GetContextStack(0);
      if (*(int *)ContextStack <= 0)
      {
        self->_imageContext = 0;
      }
      else
      {
        double v15 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
        self->_imageContext = v15;
        if (v15)
        {
          CFRetain(v15);
        }
      }
    }
    return;
  }
  CGFloat Width = (double)CGBitmapContextGetWidth(self->_imageContext);
  v20.size.double height = (double)CGBitmapContextGetHeight(self->_imageContext);
  v20.origin.double x = 0.0;
  v20.origin.double y = 0.0;
  v20.size.double width = Width;
  CGContextClearRect(v16, v20);
  double v18 = self->_imageContext;
  UIGraphicsPushContext(v18);
}

- (id)imageFromImageContextClippedToWidth:(double)a3
{
  imageContext = self->_imageContext;
  if (imageContext && (CGImageRef Image = CGBitmapContextCreateImage(imageContext)) != 0)
  {
    uint64_t v7 = Image;
    double v8 = [(UIStatusBarItemView *)self foregroundStyle];
    if ([v8 usesVerticalLayout])
    {
      double Width = (double)CGImageGetWidth(v7);
      double Height = self->_imageContextScale * a3;
    }
    else
    {
      double Width = self->_imageContextScale * a3;
      double Height = (double)CGImageGetHeight(v7);
    }

    v16.origin.double x = *(CGFloat *)MEMORY[0x1E4F1DAD8];
    v16.origin.double y = *(CGFloat *)(MEMORY[0x1E4F1DAD8] + 8);
    v16.size.double width = Width;
    v16.size.double height = Height;
    CGImageRef v12 = CGImageCreateWithImageInRect(v7, v16);
    if (v12)
    {
      CGImageRef v13 = v12;
      double v11 = +[UIImage imageWithCGImage:v12 scale:0 orientation:self->_imageContextScale];
      CFRelease(v13);
    }
    else
    {
      double v11 = 0;
    }
    CFRelease(v7);
  }
  else
  {
    double v11 = 0;
  }
  return v11;
}

- (void)endImageContext
{
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1) {
    double v4 = 0;
  }
  else {
    double v4 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  }
  if (v4 == self->_imageContext)
  {
    objc_super v5 = (int *)GetContextStack(0);
    PopContextFromStack(v5);
  }
}

- (id)imageWithText:(id)a3
{
  return [(UIStatusBarItemView *)self imageWithText:a3 shouldCache:1];
}

- (id)imageWithText:(id)a3 shouldCache:(BOOL)a4
{
  id v6 = a3;
  if ([v6 length])
  {
    uint64_t v7 = [(UIStatusBarItemView *)self foregroundStyle];
    double v8 = [(UIStatusBarItemView *)self item];
    uint64_t v9 = [v8 type];
    int64_t v10 = [(UIStatusBarItemView *)self textAlignment];
    int64_t v11 = [(UIStatusBarItemView *)self textStyle];
    int64_t v12 = [(UIStatusBarItemView *)self legibilityStyle];
    [(UIStatusBarItemView *)self legibilityStrength];
    LOBYTE(v16) = a4;
    double v14 = [v7 imageWithText:v6 ofItemType:v9 forWidth:2 lineBreakMode:v10 letterSpacing:v11 textAlignment:v12 style:1.79769313e308 withLegibilityStyle:0.0 legibilityStrength:v13 shouldCache:v16];
  }
  else
  {
    double v14 = 0;
  }

  return v14;
}

- (id)cachedImageWithText:(id)a3 truncatedWithEllipsesAtMaxWidth:(double)a4 letterSpacing:(double)a5
{
  id v8 = a3;
  if (![v8 length])
  {
    int64_t v12 = 0;
    goto LABEL_10;
  }
  if (![(NSString *)self->_lastGeneratedTextImageText isEqualToString:v8]) {
    goto LABEL_8;
  }
  lastGeneratedTextCGImageRef Image = self->_lastGeneratedTextImage;
  if (!lastGeneratedTextImage) {
    goto LABEL_8;
  }
  int64_t v10 = [(_UILegibilityImageSet *)lastGeneratedTextImage image];
  [v10 size];
  if (v11 > a4)
  {

LABEL_8:
    double v14 = [(UIStatusBarItemView *)self foregroundStyle];
    double v15 = [(UIStatusBarItemView *)self item];
    uint64_t v16 = [v15 type];
    int64_t v17 = [(UIStatusBarItemView *)self textAlignment];
    int64_t v18 = [(UIStatusBarItemView *)self textStyle];
    int64_t v19 = [(UIStatusBarItemView *)self legibilityStyle];
    [(UIStatusBarItemView *)self legibilityStrength];
    double v21 = [v14 imageWithText:v8 ofItemType:v16 forWidth:4 lineBreakMode:v17 letterSpacing:v18 textAlignment:v19 style:a4 withLegibilityStyle:a5 legibilityStrength:v20];
    double v22 = self->_lastGeneratedTextImage;
    self->_lastGeneratedTextCGImageRef Image = v21;

    self->_lastGeneratedTextImageLetterSpacing = a5;
    goto LABEL_9;
  }
  double v13 = vabdd_f64(self->_lastGeneratedTextImageLetterSpacing, a5);

  if (v13 > 2.22044605e-16) {
    goto LABEL_8;
  }
LABEL_9:
  int64_t v12 = self->_lastGeneratedTextImage;
LABEL_10:

  return v12;
}

- (void)clearCachedTextImage
{
  lastGeneratedTextImageText = self->_lastGeneratedTextImageText;
  self->_lastGeneratedTextImageText = 0;

  lastGeneratedTextCGImageRef Image = self->_lastGeneratedTextImage;
  self->_lastGeneratedTextCGImageRef Image = 0;

  self->_lastGeneratedTextImageLetterSpacing = 0.0;
}

- (id)imageWithShadowNamed:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(UIStatusBarItemView *)self foregroundStyle];
  int64_t v6 = [(UIStatusBarItemView *)self legibilityStyle];
  [(UIStatusBarItemView *)self legibilityStrength];
  uint64_t v7 = objc_msgSend(v5, "imageNamed:withLegibilityStyle:legibilityStrength:", v4, v6);

  return v7;
}

- (void)beginDisablingRasterization
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:0x1ED16A120 object:self];
}

- (void)endDisablingRasterization
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:0x1ED16A140 object:self];
}

- (void)willMoveToWindow:(id)a3
{
  id v4 = a3;
  if (!v4) {
    [(UIStatusBarItemView *)self endDisablingRasterization];
  }
  v5.receiver = self;
  v5.super_class = (Class)UIStatusBarItemView;
  [(UIView *)&v5 willMoveToWindow:v4];
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)UIStatusBarItemView;
  id v3 = [(UIView *)&v8 description];
  id v4 = [(UIStatusBarItemView *)self item];
  objc_super v5 = [v4 description];
  int64_t v6 = [v3 stringByAppendingFormat:@" [Item = %@]", v5];

  return v6;
}

- (BOOL)_shouldReverseLayoutDirection
{
  return +[UIStatusBar _deviceUserInterfaceLayoutDirection] == 1;
}

- (id)accessibilityHUDRepresentation
{
  return 0;
}

- (UIStatusBarItem)item
{
  return self->_item;
}

- (UIStatusBarLayoutManager)layoutManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutManager);
  return (UIStatusBarLayoutManager *)WeakRetained;
}

- (void)setLayoutManager:(id)a3
{
}

- (UIStatusBarForegroundStyleAttributes)foregroundStyle
{
  return self->_foregroundStyle;
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (BOOL)allowsUpdates
{
  return self->_allowsUpdates;
}

- (void)setAllowsUpdates:(BOOL)a3
{
  self->_allowsUpdates = a3;
}

- (BOOL)shouldTintContentImage
{
  return self->_shouldTintContentImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foregroundStyle, 0);
  objc_destroyWeak((id *)&self->_layoutManager);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_lastGeneratedTextImageText, 0);
  objc_storeStrong((id *)&self->_lastGeneratedTextImage, 0);
  objc_storeStrong((id *)&self->_legibilityView, 0);
}

@end