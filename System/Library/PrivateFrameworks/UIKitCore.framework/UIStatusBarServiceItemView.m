@interface UIStatusBarServiceItemView
- (BOOL)_crossfaded;
- (BOOL)_loopingNecessary;
- (BOOL)animatesDataChange;
- (BOOL)updateForContentType:(int)a3 serviceString:(id)a4 serviceCrossfadeString:(id)a5 maxWidth:(double)a6 actions:(int)a7;
- (BOOL)updateForNewData:(id)a3 actions:(int)a4;
- (double)addContentOverlap:(double)a3;
- (double)extraRightPadding;
- (double)resetContentOverlap;
- (double)standardPadding;
- (double)updateContentsAndWidth;
- (id)_contentsImageFromString:(id)a3 withWidth:(double)a4 letterSpacing:(double)a5;
- (id)_crossfadeContentsImage;
- (id)_serviceContentsImage;
- (id)accessibilityHUDRepresentation;
- (id)contentsImage;
- (int64_t)legibilityStyle;
- (void)_crossfadeStepAnimation;
- (void)_loopAnimationDidStopInDirection:(BOOL)a3;
- (void)performPendedActions;
- (void)setVisible:(BOOL)a3 frame:(CGRect)a4 duration:(double)a5;
@end

@implementation UIStatusBarServiceItemView

- (double)standardPadding
{
  v4.receiver = self;
  v4.super_class = (Class)UIStatusBarServiceItemView;
  [(UIStatusBarItemView *)&v4 standardPadding];
  return v2 + -1.0;
}

- (double)resetContentOverlap
{
  if (![(UIStatusBarServiceItemView *)self updateForContentType:self->_contentType serviceString:self->_serviceString serviceCrossfadeString:self->_crossfadeString maxWidth:0 actions:1.79769313e308])return 0.0; {
  [(UIStatusBarServiceItemView *)self updateContentsAndWidth];
  }
  return result;
}

- (double)addContentOverlap:(double)a3
{
  [(UIView *)self frame];
  double v6 = v5 - a3;
  if (v5 - a3 < 20.0) {
    double v6 = 20.0;
  }
  if (![(UIStatusBarServiceItemView *)self updateForContentType:self->_contentType serviceString:self->_serviceString serviceCrossfadeString:self->_crossfadeString maxWidth:0 actions:v6])return 0.0; {
  [(UIStatusBarServiceItemView *)self updateContentsAndWidth];
  }
  return result;
}

- (BOOL)updateForContentType:(int)a3 serviceString:(id)a4 serviceCrossfadeString:(id)a5 maxWidth:(double)a6 actions:(int)a7
{
  char v7 = a7;
  id v12 = a4;
  id v13 = a5;
  int contentType = self->_contentType;
  BOOL v15 = contentType != a3;
  if (contentType != a3) {
    self->_int contentType = a3;
  }
  if (![v12 isEqualToString:self->_serviceString])
  {
    v19 = (NSString *)[v12 copy];
    serviceString = self->_serviceString;
    self->_serviceString = v19;

    goto LABEL_12;
  }
  if (self->_maxWidth != a6)
  {
LABEL_12:
    [(UIStatusBarItemView *)self clearCachedTextImage];
    self->_maxWidth = a6;
    self->_loopingNecessaryForString = 0;
    self->_double letterSpacing = 0.0;
    int v21 = self->_contentType;
    if (v21 != 1 && v21 != 6)
    {
      v23 = [(UIStatusBarServiceItemView *)self _contentsImageFromString:self->_serviceString withWidth:1.79769313e308 letterSpacing:0.0];
      v24 = [v23 image];

      if (!v24 || ([v24 size], v25 > self->_maxWidth))
      {
        v26 = [(UIStatusBarItemView *)self textFont];
        [(NSString *)self->_serviceString _legacy_sizeWithFont:v26];
        if (v27 <= self->_maxWidth)
        {
LABEL_21:
          double letterSpacing = self->_letterSpacing;
        }
        else
        {
          while (1)
          {
            double letterSpacing = self->_letterSpacing;
            if (letterSpacing < -1.0) {
              break;
            }
            self->_double letterSpacing = letterSpacing + -0.25;
            -[NSString sizeWithFont:forWidth:lineBreakMode:letterSpacing:](self->_serviceString, "sizeWithFont:forWidth:lineBreakMode:letterSpacing:", v26, 4, 1.79769313e308);
            if (v29 <= self->_maxWidth) {
              goto LABEL_21;
            }
          }
        }
        if (letterSpacing < -1.0)
        {
          self->_double letterSpacing = 0.0;
          self->_loopingNecessaryForString = 1;
          if (self->_loopNowIfNecessary) {
            [(UIView *)self setClipsToBounds:1];
          }
        }
      }
    }
    BOOL v16 = (v7 & 8) == 0;
    BOOL v15 = 1;
    goto LABEL_28;
  }
  BOOL v16 = (v7 & 8) == 0;
  if (contentType == a3 && (v7 & 8) == 0)
  {
    BOOL v18 = 0;
    goto LABEL_34;
  }
LABEL_28:
  if (self->_crossfadeStep) {
    BOOL v18 = 1;
  }
  else {
    BOOL v18 = v15;
  }
  self->_crossfadeStep = 0;
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__crossfadeStepAnimation object:0];
  if (!v16)
  {
    v30 = (NSString *)[v13 copy];
    crossfadeString = self->_crossfadeString;
    self->_crossfadeString = v30;

    if ([(NSString *)self->_crossfadeString length]) {
      self->_crossfadeStep = 1;
    }
  }
LABEL_34:
  if (self->_crossfadeStep)
  {
    self->_loopNowIfNecessary = 0;
  }
  else if (v7)
  {
    self->_loopNowIfNecessary = 1;
    if (self->_loopingNecessaryForString)
    {
      BOOL v18 = 1;
      [(UIView *)self setClipsToBounds:1];
    }
  }

  return v18;
}

- (BOOL)updateForNewData:(id)a3 actions:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v6 = [a3 rawData];
  uint64_t v7 = *(unsigned int *)(v6 + 2072);
  v8 = _UIKitPreferencesOnce();
  v9 = [v8 objectForKey:@"UIStatusBarShowBuildVersion"];
  if (([v9 BOOLValue] & 1) == 0)
  {

    goto LABEL_5;
  }
  v10 = [(UIStatusBarItemView *)self foregroundStyle];
  int v11 = [v10 supportsShowingBuildVersion];

  if (!v11)
  {
LABEL_5:
    id v13 = (void *)[[NSString alloc] initWithCString:v6 + 448 encoding:4];
    goto LABEL_6;
  }
  id v12 = +[UIDevice currentDevice];
  id v13 = [v12 buildVersion];

LABEL_6:
  v14 = (void *)[[NSString alloc] initWithCString:v6 + 648 encoding:4];
  BOOL v15 = [(UIStatusBarServiceItemView *)self updateForContentType:v7 serviceString:v13 serviceCrossfadeString:v14 maxWidth:v4 actions:1.79769313e308];

  return v15;
}

- (int64_t)legibilityStyle
{
  if ([(UIView *)self clipsToBounds]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)UIStatusBarServiceItemView;
  return [(UIStatusBarItemView *)&v4 legibilityStyle];
}

- (double)updateContentsAndWidth
{
  BOOL v3 = [(UIStatusBarServiceItemView *)self _crossfaded];
  if ([(UIStatusBarServiceItemView *)self _loopingNecessary]) {
    BOOL v4 = self->_loopNowIfNecessary || self->_loopingNow;
  }
  else {
    BOOL v4 = 0;
  }
  double v5 = [(UIStatusBarServiceItemView *)self contentsImage];
  uint64_t v6 = v5;
  double v7 = 0.0;
  double v8 = 0.0;
  double maxWidth = 0.0;
  if (v5)
  {
    v10 = [v5 image];

    if (v10)
    {
      int v11 = [v6 image];
      [v11 size];
      double v8 = v12;

      if (![(UIStatusBarServiceItemView *)self _loopingNecessary] || v3) {
        double maxWidth = v8;
      }
      else {
        double maxWidth = self->_maxWidth;
      }
    }
  }
  [(UIView *)self frame];
  if (v13 != maxWidth)
  {
    double v7 = maxWidth - v13;
    -[UIView setFrame:](self, "setFrame:");
  }
  uint64_t v14 = 9;
  if (v3) {
    uint64_t v14 = 10;
  }
  *(double *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___UIStatusBarServiceItemView__contentType[v14]) = maxWidth;
  [(UIStatusBarItemView *)self setLayerContentsImage:v6];
  BOOL v15 = [(UIView *)self layer];
  [v15 setContentsGravity:*MEMORY[0x1E4F3A3C8]];

  if (!self->_loopingNow)
  {
    if (v4 && !v3 && v8 > 0.0)
    {
      BOOL v16 = [(UIView *)self layer];
      v17 = v16;
      double v18 = 1.0;
      double v19 = maxWidth / v8;
    }
    else
    {
      BOOL v16 = [(UIView *)self layer];
      v17 = v16;
      double v19 = 1.0;
      double v18 = 1.0;
    }
    objc_msgSend(v16, "setContentsRect:", 0.0, 0.0, v19, v18);
  }
  v20 = [(UIView *)self layer];
  LODWORD(v21) = 1.0;
  [v20 setOpacity:v21];

  return v7;
}

- (id)_contentsImageFromString:(id)a3 withWidth:(double)a4 letterSpacing:(double)a5
{
  id v8 = a3;
  if ([v8 length])
  {
    if ([(NSString *)self->_serviceString isEqual:v8])
    {
      v9 = [(UIStatusBarItemView *)self cachedImageWithText:v8 truncatedWithEllipsesAtMaxWidth:a4 letterSpacing:a5];
    }
    else
    {
      v10 = [(UIStatusBarItemView *)self foregroundStyle];
      int64_t v11 = [(UIStatusBarItemView *)self textAlignment];
      int64_t v12 = [(UIStatusBarItemView *)self textStyle];
      int64_t v13 = [(UIStatusBarServiceItemView *)self legibilityStyle];
      [(UIStatusBarItemView *)self legibilityStrength];
      v9 = [v10 imageWithText:v8 ofItemType:6 forWidth:4 lineBreakMode:v11 letterSpacing:v12 textAlignment:v13 style:a4 withLegibilityStyle:a5 legibilityStrength:v14];
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_serviceContentsImage
{
  if (!self->_loopingNecessaryForString || self->_loopNowIfNecessary || self->_loopingNow) {
    double maxWidth = 1.79769313e308;
  }
  else {
    double maxWidth = self->_maxWidth;
  }
  return [(UIStatusBarServiceItemView *)self _contentsImageFromString:self->_serviceString withWidth:maxWidth letterSpacing:self->_letterSpacing];
}

- (id)_crossfadeContentsImage
{
  return [(UIStatusBarServiceItemView *)self _contentsImageFromString:self->_crossfadeString withWidth:1.79769313e308 letterSpacing:0.0];
}

- (id)contentsImage
{
  if ([(UIStatusBarServiceItemView *)self _crossfaded]) {
    [(UIStatusBarServiceItemView *)self _crossfadeContentsImage];
  }
  else {
  BOOL v3 = [(UIStatusBarServiceItemView *)self _serviceContentsImage];
  }
  return v3;
}

- (void)setVisible:(BOOL)a3 frame:(CGRect)a4 duration:(double)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  BOOL v10 = a3;
  if (a5 > 0.0 && a3)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __56__UIStatusBarServiceItemView_setVisible_frame_duration___block_invoke;
    v14[3] = &unk_1E52D9F70;
    v14[4] = self;
    +[UIView performWithoutAnimation:v14];
  }
  v13.receiver = self;
  v13.super_class = (Class)UIStatusBarServiceItemView;
  -[UIStatusBarItemView setVisible:frame:duration:](&v13, sel_setVisible_frame_duration_, v10, x, y, width, height, a5);
}

uint64_t __56__UIStatusBarServiceItemView_setVisible_frame_duration___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) frame];
  double v2 = *(void **)(a1 + 32);
  return objc_msgSend(v2, "setFrame:");
}

- (BOOL)animatesDataChange
{
  return 1;
}

- (double)extraRightPadding
{
  v8.receiver = self;
  v8.super_class = (Class)UIStatusBarServiceItemView;
  [(UIStatusBarItemView *)&v8 extraRightPadding];
  double v4 = v3;
  if (self->_crossfadeStep - 2 <= 4)
  {
    if (self->_serviceWidth >= self->_crossfadeWidth) {
      double serviceWidth = self->_serviceWidth;
    }
    else {
      double serviceWidth = self->_crossfadeWidth;
    }
    [(UIView *)self frame];
    return v4 + serviceWidth - v6;
  }
  return v4;
}

- (void)performPendedActions
{
  if ([(UIStatusBarServiceItemView *)self _loopingNecessary])
  {
    loopNowIfNecessardouble y = self->_loopNowIfNecessary;
    self->_loopNowIfNecessardouble y = 0;
    if (loopNowIfNecessary)
    {
      self->_loopingNow = 1;
      [(UIStatusBarItemView *)self beginDisablingRasterization];
      v4[4] = self;
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __50__UIStatusBarServiceItemView_performPendedActions__block_invoke;
      v5[3] = &unk_1E52D9F70;
      v5[4] = self;
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __50__UIStatusBarServiceItemView_performPendedActions__block_invoke_2;
      v4[3] = &unk_1E52DC3A0;
      +[UIView animateWithDuration:0 delay:v5 options:v4 animations:1.2 completion:0.3];
    }
  }
  else
  {
    self->_loopNowIfNecessardouble y = 0;
  }
  if (self->_crossfadeStep == 1) {
    [(UIStatusBarServiceItemView *)self performSelector:sel__crossfadeStepAnimation withObject:0 afterDelay:2.0];
  }
}

void __50__UIStatusBarServiceItemView_performPendedActions__block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) layer];
  [v2 contentsRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;

  id v9 = [*(id *)(a1 + 32) layer];
  objc_msgSend(v9, "setContentsRect:", 1.0 - v6, v4, v6, v8);
}

uint64_t __50__UIStatusBarServiceItemView_performPendedActions__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loopAnimationDidStopInDirection:1];
}

- (void)_loopAnimationDidStopInDirection:(BOOL)a3
{
  if (a3)
  {
    v11[4] = self;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __63__UIStatusBarServiceItemView__loopAnimationDidStopInDirection___block_invoke;
    v12[3] = &unk_1E52D9F70;
    v12[4] = self;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __63__UIStatusBarServiceItemView__loopAnimationDidStopInDirection___block_invoke_2;
    v11[3] = &unk_1E52DC3A0;
    +[UIView animateWithDuration:0 delay:v12 options:v11 animations:1.2 completion:0.3];
  }
  else
  {
    self->_loopingNow = 0;
    -[UIView setClipsToBounds:](self, "setClipsToBounds:");
    uint64_t v7 = 0;
    double v8 = (double *)&v7;
    uint64_t v9 = 0x2020000000;
    uint64_t v10 = 0;
    v5[4] = self;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __63__UIStatusBarServiceItemView__loopAnimationDidStopInDirection___block_invoke_3;
    v6[3] = &unk_1E52E3210;
    v6[4] = self;
    v6[5] = &v7;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __63__UIStatusBarServiceItemView__loopAnimationDidStopInDirection___block_invoke_4;
    v5[3] = &unk_1E52DC3A0;
    +[UIView animateWithDuration:0 delay:v6 options:v5 animations:0.25 completion:0.3];
    if (v8[3] != 0.0)
    {
      double v4 = [(UIStatusBarItemView *)self layoutManager];
      [v4 itemView:self sizeChangedBy:v8[3]];
    }
    _Block_object_dispose(&v7, 8);
  }
}

void __63__UIStatusBarServiceItemView__loopAnimationDidStopInDirection___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) layer];
  [v2 contentsRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;

  id v9 = [*(id *)(a1 + 32) layer];
  objc_msgSend(v9, "setContentsRect:", 0.0, v4, v6, v8);
}

uint64_t __63__UIStatusBarServiceItemView__loopAnimationDidStopInDirection___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _loopAnimationDidStopInDirection:0];
}

uint64_t __63__UIStatusBarServiceItemView__loopAnimationDidStopInDirection___block_invoke_3(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) updateContentsAndWidth];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

uint64_t __63__UIStatusBarServiceItemView__loopAnimationDidStopInDirection___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) endDisablingRasterization];
}

- (BOOL)_crossfaded
{
  unint64_t crossfadeStep = self->_crossfadeStep;
  return (crossfadeStep & 1) == 0 && crossfadeStep > 1;
}

- (void)_crossfadeStepAnimation
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:a2 object:0];
  unint64_t crossfadeStep = self->_crossfadeStep;
  if (crossfadeStep - 1 > 5)
  {
    if (crossfadeStep) {
      self->_unint64_t crossfadeStep = 0;
    }
  }
  else
  {
    self->_unint64_t crossfadeStep = crossfadeStep + 1;
    v5[4] = self;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __53__UIStatusBarServiceItemView__crossfadeStepAnimation__block_invoke;
    v6[3] = &unk_1E52D9F70;
    v6[4] = self;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __53__UIStatusBarServiceItemView__crossfadeStepAnimation__block_invoke_2;
    v5[3] = &unk_1E52DC3A0;
    +[UIView animateWithDuration:v6 animations:v5 completion:0.25];
    [(UIStatusBarServiceItemView *)self performSelector:a2 withObject:0 afterDelay:2.0];
  }
}

void __53__UIStatusBarServiceItemView__crossfadeStepAnimation__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) layer];
  [v1 setOpacity:0.0];
}

uint64_t __53__UIStatusBarServiceItemView__crossfadeStepAnimation__block_invoke_2(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) layoutManager];
  uint64_t v3 = *(void **)(a1 + 32);
  [v3 updateContentsAndWidth];
  objc_msgSend(v2, "itemView:sizeChangedBy:", v3);

  double v4 = [*(id *)(a1 + 32) layer];
  [v4 setOpacity:0.0];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__UIStatusBarServiceItemView__crossfadeStepAnimation__block_invoke_3;
  v6[3] = &unk_1E52D9F70;
  v6[4] = *(void *)(a1 + 32);
  return +[UIView animateWithDuration:v6 animations:0.25];
}

void __53__UIStatusBarServiceItemView__crossfadeStepAnimation__block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) layer];
  LODWORD(v1) = 1.0;
  [v2 setOpacity:v1];
}

- (BOOL)_loopingNecessary
{
  return self->_loopingNecessaryForString;
}

- (id)accessibilityHUDRepresentation
{
  id v2 = -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:]([UIAccessibilityHUDItem alloc], "initWithTitle:image:imageInsets:", self->_serviceString, 0, 0.0, 0.0, 0.0, 0.0);
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_crossfadeString, 0);
  objc_storeStrong((id *)&self->_serviceString, 0);
}

@end