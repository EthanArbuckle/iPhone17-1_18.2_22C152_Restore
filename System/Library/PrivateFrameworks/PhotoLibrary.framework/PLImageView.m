@interface PLImageView
+ (BOOL)shouldDrawShadows;
+ (CGSize)badgeOffset;
+ (id)textBadgeForString:(id)a3 photoSize:(CGSize)a4;
+ (void)initialize;
- (BOOL)drawsBorder;
- (BOOL)isBorderAndAccessoriesVisible;
- (BOOL)isDimmed;
- (BOOL)isShadowEnabled;
- (BOOL)showsPlaceholder;
- (CGAffineTransform)_transformForFullSizeImageTiledLayer;
- (CGRect)_bottomRightAccessoryViewFrame;
- (CGRect)_leftAccessoryViewFrame;
- (CGSize)leftAccessoryViewOffset;
- (CGSize)placeholderSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3 allowRounding:(BOOL)a4;
- (NSString)name;
- (PLImageView)initWithFrame:(CGRect)a3;
- (PLVideoView)videoView;
- (UIView)bottomRightAccessoryView;
- (UIView)leftAccessoryView;
- (double)accessoryViewsAlpha;
- (double)placeholderScale;
- (double)transitionProgress;
- (float)borderAndAccessoriesAlpha;
- (id)textBadgeString;
- (void)_setShadowEnabled:(BOOL)a3 force:(BOOL)a4;
- (void)_updatePlaceholderAlpha;
- (void)_updatePlaceholderLayout;
- (void)_updateShadowPath;
- (void)dealloc;
- (void)layoutSubviews;
- (void)parentDidLayout;
- (void)renderSnapshotInContext:(CGContext *)a3;
- (void)setAccessoryViewsAlpha:(double)a3;
- (void)setBorderAndAccessoriesAlpha:(float)a3;
- (void)setBorderAndAccessoriesAlpha:(float)a3 forced:(BOOL)a4;
- (void)setBorderAndAccessoriesVisible:(BOOL)a3;
- (void)setBottomRightAccessoryView:(id)a3;
- (void)setBottomRightAccessoryView:(id)a3 animated:(BOOL)a4;
- (void)setDimmed:(BOOL)a3;
- (void)setDrawsBorder:(BOOL)a3;
- (void)setEdgeAntialiasingEnabled:(BOOL)a3;
- (void)setFullSizeImageJPEGData:(id)a3 size:(CGSize)a4 orientation:(int64_t)a5;
- (void)setImage:(id)a3;
- (void)setLeftAccessoryView:(id)a3;
- (void)setLeftAccessoryView:(id)a3 animated:(BOOL)a4;
- (void)setLeftAccessoryViewOffset:(CGSize)a3;
- (void)setName:(id)a3;
- (void)setPlaceholderScale:(double)a3;
- (void)setShadowEnabled:(BOOL)a3;
- (void)setShowsPlaceholder:(BOOL)a3;
- (void)setTextBadgeString:(id)a3;
- (void)setTransitionProgress:(double)a3;
- (void)setVideoView:(id)a3;
- (void)updateFullSizeImageVisibleArea;
@end

@implementation PLImageView

- (double)placeholderScale
{
  return self->_placeholderScale;
}

- (BOOL)showsPlaceholder
{
  return self->_showsPlaceholder;
}

- (double)accessoryViewsAlpha
{
  return self->_accessoryViewsAlpha;
}

- (UIView)bottomRightAccessoryView
{
  return self->_bottomRightAccessoryView;
}

- (CGSize)leftAccessoryViewOffset
{
  double width = self->_leftAccessoryViewOffset.width;
  double height = self->_leftAccessoryViewOffset.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UIView)leftAccessoryView
{
  return self->_leftAccessoryView;
}

- (double)transitionProgress
{
  return self->_transitionProgress;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setVideoView:(id)a3
{
  videoView = self->_videoView;
  if (videoView != a3)
  {
    if ((PLImageView *)[(PLVideoView *)videoView superview] == self) {
      [(PLVideoView *)self->_videoView removeFromSuperview];
    }

    v6 = (PLVideoView *)a3;
    self->_videoView = v6;
    if (v6)
    {
      [(PLVideoView *)v6 setAlpha:1.0];
      v7 = self->_videoView;
      if (self->_borderView)
      {
        -[PLImageView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v7);
      }
      else
      {
        [(PLImageView *)self addSubview:v7];
      }
    }
  }
}

- (PLVideoView)videoView
{
  return self->_videoView;
}

- (void)setAccessoryViewsAlpha:(double)a3
{
  if (self->_accessoryViewsAlpha != a3)
  {
    self->_accessoryViewsAlpha = a3;
    [(UIView *)self->_leftAccessoryView setAlpha:a3];
    bottomRightAccessoryView = self->_bottomRightAccessoryView;
    [(UIView *)bottomRightAccessoryView setAlpha:a3];
  }
}

- (void)setBottomRightAccessoryView:(id)a3 animated:(BOOL)a4
{
  bottomRightAccessoryView = self->_bottomRightAccessoryView;
  if (bottomRightAccessoryView != a3)
  {
    BOOL v5 = a4;
    v8 = bottomRightAccessoryView;

    v9 = (UIView *)a3;
    self->_bottomRightAccessoryView = v9;
    if (v8)
    {
      if (v5)
      {
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __52__PLImageView_setBottomRightAccessoryView_animated___block_invoke;
        v12[3] = &unk_1E63D2660;
        v12[4] = v8;
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __52__PLImageView_setBottomRightAccessoryView_animated___block_invoke_2;
        v11[3] = &unk_1E63D2050;
        v11[4] = v8;
        v11[5] = self;
        [MEMORY[0x1E4F42FF0] animateWithDuration:v12 animations:v11 completion:0.2];
      }
      else
      {
        [(UIView *)v8 removeFromSuperview];
      }
      if (!self->_bottomRightAccessoryView) {
        goto LABEL_11;
      }
    }
    else if (!v9)
    {
LABEL_11:
      [(PLImageView *)self setNeedsLayout];
      return;
    }
    -[UIView addSubview:](self->_borderView, "addSubview:");
    [(PLImageView *)self _bottomRightAccessoryViewFrame];
    -[UIView setFrame:](self->_bottomRightAccessoryView, "setFrame:");
    [(UIView *)self->_bottomRightAccessoryView setAlpha:self->_accessoryViewsAlpha];
    if (v5)
    {
      [(UIView *)self->_bottomRightAccessoryView setAlpha:0.0];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __52__PLImageView_setBottomRightAccessoryView_animated___block_invoke_3;
      v10[3] = &unk_1E63D2660;
      v10[4] = self;
      [MEMORY[0x1E4F42FF0] animateWithDuration:v10 animations:0.2];
    }
    goto LABEL_11;
  }
}

uint64_t __52__PLImageView_setBottomRightAccessoryView_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __52__PLImageView_setBottomRightAccessoryView_animated___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDescendantOfView:*(void *)(a1 + 40)];
  if (result)
  {
    v3 = *(void **)(a1 + 32);
    return [v3 removeFromSuperview];
  }
  return result;
}

uint64_t __52__PLImageView_setBottomRightAccessoryView_animated___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 544) setAlpha:1.0];
}

- (void)setBottomRightAccessoryView:(id)a3
{
}

- (void)setLeftAccessoryViewOffset:(CGSize)a3
{
  if (a3.width != self->_leftAccessoryViewOffset.width || a3.height != self->_leftAccessoryViewOffset.height)
  {
    self->_leftAccessoryViewOffset = a3;
    [(PLImageView *)self setNeedsLayout];
  }
}

- (void)setLeftAccessoryView:(id)a3 animated:(BOOL)a4
{
  leftAccessoryView = self->_leftAccessoryView;
  if (leftAccessoryView != a3)
  {
    BOOL v5 = a4;
    v8 = leftAccessoryView;

    v9 = (UIView *)a3;
    self->_leftAccessoryView = v9;
    if (v9)
    {
      [(UIView *)self->_borderView addSubview:v9];
      [(CALayer *)[(UIView *)self->_borderView layer] setAllowsGroupOpacity:1];
      [(PLImageView *)self _leftAccessoryViewFrame];
      -[UIView setFrame:](self->_leftAccessoryView, "setFrame:");
      [(UIView *)self->_leftAccessoryView setAlpha:self->_accessoryViewsAlpha];
      if (v5)
      {
        [(UIView *)self->_leftAccessoryView setAlpha:0.0];
        [(UIView *)self->_leftAccessoryView bounds];
        long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
        *(_OWORD *)&v17.a = *MEMORY[0x1E4F1DAB8];
        *(_OWORD *)&v17.c = v10;
        *(_OWORD *)&v17.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
        *(_OWORD *)&v16.a = *(_OWORD *)&v17.a;
        *(_OWORD *)&v16.c = v10;
        *(_OWORD *)&v16.tx = *(_OWORD *)&v17.tx;
        CGAffineTransformTranslate(&v17, &v16, v11 * -2.0, 0.0);
        CGAffineTransform v15 = v17;
        CGAffineTransformScale(&v16, &v15, 0.1, 1.0);
        CGAffineTransform v17 = v16;
        [(UIView *)self->_leftAccessoryView setTransform:&v16];
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __45__PLImageView_setLeftAccessoryView_animated___block_invoke;
        v14[3] = &unk_1E63D2660;
        v14[4] = self;
        [MEMORY[0x1E4F42FF0] animateWithDuration:v14 animations:0.4];
      }
    }
    else
    {
      if (v5)
      {
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __45__PLImageView_setLeftAccessoryView_animated___block_invoke_2;
        v13[3] = &unk_1E63D2660;
        v13[4] = v8;
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __45__PLImageView_setLeftAccessoryView_animated___block_invoke_3;
        v12[3] = &unk_1E63D2050;
        v12[4] = v8;
        void v12[5] = self;
        [MEMORY[0x1E4F42FF0] animateWithDuration:v13 animations:v12 completion:0.4];
      }
      else
      {
        [(UIView *)v8 removeFromSuperview];
      }
      [(CALayer *)[(UIView *)self->_borderView layer] setAllowsGroupOpacity:0];
    }
    [(PLImageView *)self setNeedsLayout];
  }
}

uint64_t __45__PLImageView_setLeftAccessoryView_animated___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 536) setAlpha:1.0];
  v2 = *(void **)(*(void *)(a1 + 32) + 536);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v2 setTransform:v5];
}

uint64_t __45__PLImageView_setLeftAccessoryView_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __45__PLImageView_setLeftAccessoryView_animated___block_invoke_3(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isDescendantOfView:*(void *)(a1 + 40)];
  if (result)
  {
    long long v3 = *(void **)(a1 + 32);
    return [v3 removeFromSuperview];
  }
  return result;
}

- (void)setLeftAccessoryView:(id)a3
{
}

- (void)setTextBadgeString:(id)a3
{
  textBadge = self->_textBadge;
  if (textBadge)
  {
    [(UILabel *)textBadge removeFromSuperview];

    self->_textBadge = 0;
  }
  if (a3)
  {
    v6 = objc_opt_class();
    [(PLImageView *)self bounds];
    v9 = (UILabel *)objc_msgSend(v6, "textBadgeForString:photoSize:", a3, v7, v8);
    self->_textBadge = v9;
    long long v10 = v9;
    double v11 = self->_textBadge;
    [(PLImageView *)self addSubview:v11];
  }
}

- (id)textBadgeString
{
  return [(UILabel *)self->_textBadge text];
}

- (void)_updatePlaceholderAlpha
{
  [(UIView *)self->_borderView alpha];
  double v4 = fmin(fmax(log(v3 + 0.08) * -0.4, 0.0), 1.0);
  placeholderView = self->_placeholderView;
  [(PLPhotoTilePlaceholderView *)placeholderView setAlpha:v4];
}

- (void)_updatePlaceholderLayout
{
  if (self->_placeholderView)
  {
    [(PLImageView *)self bounds];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    [(PLImageView *)self placeholderSize];
    double placeholderScale = self->_placeholderScale;
    double v13 = v12 / placeholderScale;
    memset(&v18, 0, sizeof(v18));
    double v15 = v14 / placeholderScale;
    CGAffineTransformMakeScale(&v18, placeholderScale, placeholderScale);
    -[PLPhotoTilePlaceholderView setFrame:](self->_placeholderView, "setFrame:", v4, v6, v13, v15);
    -[PLPhotoTilePlaceholderView setCenter:](self->_placeholderView, "setCenter:", floor(v8 * 0.5), floor(v10 * 0.5));
    placeholderView = self->_placeholderView;
    CGAffineTransform v17 = v18;
    [(PLPhotoTilePlaceholderView *)placeholderView setTransform:&v17];
  }
}

- (CGSize)placeholderSize
{
  [(PLImageView *)self bounds];
  double v3 = v2 + 1.0;
  double v5 = v4 + 1.0;
  result.double height = v3;
  result.double width = v5;
  return result;
}

- (void)setPlaceholderScale:(double)a3
{
  if (self->_placeholderScale != a3)
  {
    self->_double placeholderScale = a3;
    [(PLImageView *)self _updatePlaceholderLayout];
  }
}

- (void)setShowsPlaceholder:(BOOL)a3
{
  BOOL v4 = self->_showsPlaceholder != a3 || !a3;
  if (v4 || !self->_placeholderView)
  {
    self->_showsPlaceholder = a3;
    placeholderView = self->_placeholderView;
    if (a3)
    {

      double v6 = [PLPhotoTilePlaceholderView alloc];
      [(PLImageView *)self bounds];
      double v7 = -[PLPhotoTilePlaceholderView initWithFrame:](v6, "initWithFrame:");
      self->_placeholderView = v7;
      [(PLPhotoTilePlaceholderView *)v7 setAutoresizingMask:18];
      double v8 = self->_placeholderView;
      if (self->_borderView) {
        -[PLImageView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v8);
      }
      else {
        [(PLImageView *)self addSubview:v8];
      }
      [(PLImageView *)self _updatePlaceholderLayout];
      [(PLImageView *)self _updatePlaceholderAlpha];
    }
    else
    {
      [(PLPhotoTilePlaceholderView *)placeholderView removeFromSuperview];

      self->_placeholderView = 0;
    }
  }
}

- (void)setEdgeAntialiasingEnabled:(BOOL)a3
{
  if (self->_edgeAntialiasingEnabled != a3)
  {
    self->_edgeAntialiasingEnabled = a3;
    if (a3) {
      uint64_t v4 = 15;
    }
    else {
      uint64_t v4 = 0;
    }
    objc_msgSend((id)-[PLImageView layer](self, "layer"), "setEdgeAntialiasingMask:", v4);
    double v5 = [(UIView *)self->_borderView layer];
    [(CALayer *)v5 setEdgeAntialiasingMask:v4];
  }
}

- (BOOL)isDimmed
{
  objc_msgSend((id)-[PLImageView layer](self, "layer"), "opacity");
  return v2 < 1.0;
}

- (void)setDimmed:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = (void *)[(PLImageView *)self layer];
  LODWORD(v5) = 1.0;
  if (v3) {
    *(float *)&double v5 = 0.5;
  }
  [v4 setOpacity:v5];
}

- (BOOL)drawsBorder
{
  return (*((unsigned __int8 *)self + 576) >> 3) & 1;
}

- (void)setDrawsBorder:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 576);
  if (((((v3 & 8) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v5 = 8;
    }
    else {
      char v5 = 0;
    }
    *((unsigned char *)self + 576) = v3 & 0xF7 | v5;
    double v6 = [(UIView *)self->_borderView layer];
    double v7 = v6;
    if ((*((unsigned char *)self + 576) & 8) != 0)
    {
      pl_dispatch_once();
      [(CALayer *)v7 setContents:__BorderImage___borderImage];
      PLPhysicalScreenScale();
      -[CALayer setContentsScale:](v7, "setContentsScale:");
      -[CALayer setContentsCenter:](v7, "setContentsCenter:", 0.5, 0.5, 0.0, 0.0);
    }
    else
    {
      [(CALayer *)v6 setContents:0];
    }
  }
}

- (float)borderAndAccessoriesAlpha
{
  [(UIView *)self->_borderView alpha];
  return v2;
}

- (void)setBorderAndAccessoriesAlpha:(float)a3
{
}

- (void)setBorderAndAccessoriesAlpha:(float)a3 forced:(BOOL)a4
{
  BOOL v4 = a4;
  if ((*((unsigned char *)self + 576) & 4) == 0) {
    [(PLImageView *)self setBorderAndAccessoriesVisible:1];
  }
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  if (a3 == 1.0
    || a3 == 0.0
    || v4
    || ([(UIView *)self->_borderView alpha], *(float *)&double v8 = v8, vabds_f32(*(float *)&v8, a3) >= 0.035)
    || Current - self->_lastBorderAlphaTime >= 0.0333333333)
  {
    self->_lastBorderAlphaTime = Current;
    [(UIView *)self->_borderView setAlpha:a3];
    [(PLImageView *)self _updatePlaceholderAlpha];
  }
}

- (void)parentDidLayout
{
}

- (BOOL)isBorderAndAccessoriesVisible
{
  return (*((unsigned __int8 *)self + 576) >> 2) & 1;
}

- (void)setBorderAndAccessoriesVisible:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 576);
  if (((((v3 & 4) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v4 = 4;
    }
    else {
      char v4 = 0;
    }
    *((unsigned char *)self + 576) = v3 & 0xFB | v4;
    [(UIView *)self->_borderView setHidden:!a3];
  }
}

- (BOOL)isShadowEnabled
{
  return *((unsigned char *)self + 576) & 1;
}

- (void)_setShadowEnabled:(BOOL)a3 force:(BOOL)a4
{
  BOOL v4 = a3;
  if (((*((unsigned __int8 *)self + 576) ^ a3) & 1) != 0 || a4)
  {
    double v6 = (void *)[(PLImageView *)self layer];
    double v7 = v6;
    if (v4 && self->_transitionProgress < 1.0)
    {
      objc_msgSend(v6, "setShadowColor:", objc_msgSend((id)__shadowColor, "CGColor"));
      LODWORD(v8) = 1060320051;
      [v7 setShadowOpacity:v8];
      PLPhysicalScreenScale();
      double v10 = v9 * 0.0;
      PLPhysicalScreenScale();
      objc_msgSend(v7, "setShadowOffset:", v10, v11 * 3.0);
      PLPhysicalScreenScale();
      [v7 setShadowRadius:v12 * 4.0];
      if ([(PLImageView *)self image]) {
        [(PLImageView *)self _updateShadowPath];
      }
    }
    else
    {
      [v6 setShadowColor:0];
      [v7 setShadowOpacity:0.0];
    }
  }
  *((unsigned char *)self + 576) = *((unsigned char *)self + 576) & 0xFE | v4;
}

- (void)setShadowEnabled:(BOOL)a3
{
}

- (void)setTransitionProgress:(double)a3
{
  double transitionProgress = self->_transitionProgress;
  BOOL v6 = a3 < 1.0;
  if (transitionProgress < 1.0) {
    BOOL v6 = 0;
  }
  uint64_t v8 = a3 >= 1.0 && transitionProgress < 1.0 || v6;
  if (transitionProgress >= 1.0)
  {
    if (*((unsigned char *)self + 576)) {
      *((unsigned char *)self + 576) |= 2u;
    }
    [(PLImageView *)self _setShadowEnabled:0 force:v8];
  }
  else
  {
    if (*((unsigned char *)self + 576)) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = (*((unsigned __int8 *)self + 576) >> 1) & 1;
    }
    [(PLImageView *)self _setShadowEnabled:v9 force:v8];
    *((unsigned char *)self + 576) &= ~2u;
    if (*((unsigned char *)self + 576))
    {
      double v10 = (void *)[(PLImageView *)self layer];
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      if (self->_transitionProgress * -3.0 + 1.0 >= 0.0) {
        double v12 = self->_transitionProgress * -3.0 + 1.0;
      }
      else {
        double v12 = 0.0;
      }
      [v10 shadowOpacity];
      float v14 = v13 - v12;
      double v15 = fabsf(v14);
      if (v15 > 0.035 || (double v15 = Current - self->_lastShadowAlphaTime, v15 > 0.0333333333))
      {
        self->_lastShadowAlphaTime = Current;
        *(float *)&double v15 = v12;
        [v10 setShadowOpacity:v15];
      }
    }
  }
  self->_double transitionProgress = a3;
}

- (void)setImage:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PLImageView;
  [(PLImageView *)&v4 setImage:a3];
  if (*((unsigned char *)self + 576)) {
    [(PLImageView *)self _updateShadowPath];
  }
}

- (CGAffineTransform)_transformForFullSizeImageTiledLayer
{
  uint64_t v5 = MEMORY[0x1E4F1DAB8];
  long long v22 = *MEMORY[0x1E4F1DAB8];
  long long v23 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->c = v23;
  long long v21 = *(_OWORD *)(v5 + 32);
  *(_OWORD *)&retstr->tx = v21;
  [(PLTiledLayer *)self->_fullSizeImageTiledLayer bounds];
  double v7 = v6;
  double v9 = v8;
  [(PLImageView *)self bounds];
  CGFloat Width = CGRectGetWidth(v28);
  CGFloat v11 = Width / v7;
  *(_OWORD *)&v27.a = v22;
  *(_OWORD *)&v27.c = v23;
  *(_OWORD *)&v27.tx = v21;
  CGAffineTransformTranslate(retstr, &v27, v7 * ((Width / v7 + -1.0) * 0.5), v9 * ((Width / v7 + -1.0) * 0.5));
  long long v12 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v26.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v26.c = v12;
  *(_OWORD *)&v26.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransformScale(&v27, &v26, v11, v11);
  long long v13 = *(_OWORD *)&v27.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v27.a;
  *(_OWORD *)&retstr->c = v13;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v27.tx;
  memset(&v27, 0, sizeof(v27));
  PLTransformForImageOrientationAndSize(self->_fullSizeImageOrientation, (uint64_t)&v27, v7, v9);
  long long v14 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&t1.c = v14;
  *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransformTranslate(&v26, &t1, -(v7 * 0.5), -(v9 * 0.5));
  long long v15 = *(_OWORD *)&v26.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v26.a;
  *(_OWORD *)&retstr->c = v15;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v26.tx;
  CGAffineTransform t1 = v27;
  long long v16 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&t2.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&t2.c = v16;
  *(_OWORD *)&t2.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransformConcat(&v26, &t1, &t2);
  long long v17 = *(_OWORD *)&v26.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v26.a;
  *(_OWORD *)&retstr->c = v17;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v26.tx;
  long long v18 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&t1.c = v18;
  *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
  CGSize result = CGAffineTransformTranslate(&v26, &t1, v7 * 0.5, v9 * 0.5);
  long long v20 = *(_OWORD *)&v26.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v26.a;
  *(_OWORD *)&retstr->c = v20;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v26.tx;
  return result;
}

- (void)updateFullSizeImageVisibleArea
{
  char v3 = self;
  while (1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      break;
    }
    char v3 = (PLImageView *)[(PLImageView *)v3 superview];
    if (!v3) {
      return;
    }
  }
  [(PLImageView *)v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  -[PLTiledLayer convertRect:fromLayer:](self->_fullSizeImageTiledLayer, "convertRect:fromLayer:", [(PLImageView *)v3 layer], v4, v6, v8, v10);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v25.origin.x = v5;
  v25.origin.y = v7;
  v25.size.double width = v9;
  v25.size.double height = v11;
  double Width = CGRectGetWidth(v25);
  v26.origin.x = v13;
  v26.origin.y = v15;
  v26.size.double width = v17;
  v26.size.double height = v19;
  double v21 = Width / CGRectGetWidth(v26);
  PLPhysicalScreenScale();
  fullSizeImageTiledLayer = self->_fullSizeImageTiledLayer;
  -[PLTiledLayer setVisibleRectangle:zoomScale:](fullSizeImageTiledLayer, "setVisibleRectangle:zoomScale:", v13, v15, v17, v19, v21 * v22);
}

- (void)setFullSizeImageJPEGData:(id)a3 size:(CGSize)a4 orientation:(int64_t)a5
{
  double height = a4.height;
  double width = a4.width;
  PLPhysicalScreenScale();
  double v11 = v10;
  double v12 = (void *)[(PLImageView *)self window];
  if (!v12) {
    double v12 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42738], "sharedApplication"), "pl_firstKeyWindow");
  }
  objc_msgSend((id)objc_msgSend(v12, "screen"), "bounds");
  double v14 = v11 * v13;
  double v16 = v11 * v15;
  [(PLTiledLayer *)self->_fullSizeImageTiledLayer removeFromSuperlayer];

  double v17 = -[PLTiledLayer initWithJPEGData:placeholderImage:screenSize:]([PLTiledLayer alloc], "initWithJPEGData:placeholderImage:screenSize:", a3, 0, v14, v16);
  self->_fullSizeImageTiledLayer = v17;
  -[PLTiledLayer setFrame:](v17, "setFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), width, height);
  self->_fullSizeImageOrientation = a5;
  objc_msgSend((id)-[PLImageView layer](self, "layer"), "addSublayer:", self->_fullSizeImageTiledLayer);
  [(PLImageView *)self setNeedsLayout];
}

- (void)_updateShadowPath
{
  char v3 = (void *)[(PLImageView *)self layer];
  if (*((unsigned char *)self + 576))
  {
    double v4 = v3;
    [v3 bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    id v13 = +[PLCGPathCache sharedPathCache];
    Mutable = CGPathRetain((CGPathRef)objc_msgSend(v13, "pathForKey:", v6, v8, v10, v12));
    if (!Mutable)
    {
      Mutable = CGPathCreateMutable();
      v16.origin.x = v6;
      v16.origin.y = v8;
      v16.size.double width = v10;
      v16.size.double height = v12;
      CGPathAddRect(Mutable, 0, v16);
      objc_msgSend(v13, "setPath:forKey:", Mutable, v6, v8, v10, v12);
    }
    [v4 setShadowPath:Mutable];
    CGPathRelease(Mutable);
  }
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)PLImageView;
  [(PLImageView *)&v7 layoutSubviews];
  [(PLImageView *)self bounds];
  v8.origin.x = *(CGFloat *)MEMORY[0x1E4F1DAD8];
  v8.origin.y = *(CGFloat *)(MEMORY[0x1E4F1DAD8] + 8);
  CGRect v9 = CGRectInset(v8, -1.0, -1.0);
  -[UIView setFrame:](self->_borderView, "setFrame:", v9.origin.x, v9.origin.y, v9.size.width, v9.size.height);
  if (self->_leftAccessoryView)
  {
    [(PLImageView *)self _leftAccessoryViewFrame];
    -[UIView setFrame:](self->_leftAccessoryView, "setFrame:");
  }
  if (self->_bottomRightAccessoryView)
  {
    [(PLImageView *)self _bottomRightAccessoryViewFrame];
    -[UIView setFrame:](self->_bottomRightAccessoryView, "setFrame:");
  }
  if (*((unsigned char *)self + 576)) {
    [(PLImageView *)self _updateShadowPath];
  }
  if (self->_fullSizeImageTiledLayer)
  {
    memset(&v6, 0, sizeof(v6));
    [(PLImageView *)self _transformForFullSizeImageTiledLayer];
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setValue:*MEMORY[0x1E4F1CFD0] forKey:*MEMORY[0x1E4F3A5A8]];
    fullSizeImageTiledLayer = self->_fullSizeImageTiledLayer;
    CGAffineTransform v4 = v6;
    CATransform3DMakeAffineTransform(&v5, &v4);
    [(PLTiledLayer *)fullSizeImageTiledLayer setTransform:&v5];
    [MEMORY[0x1E4F39CF8] commit];
    [(PLImageView *)self updateFullSizeImageVisibleArea];
  }
}

- (CGRect)_bottomRightAccessoryViewFrame
{
  bottomRightAccessoryView = self->_bottomRightAccessoryView;
  if (bottomRightAccessoryView)
  {
    [(UIView *)bottomRightAccessoryView frame];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat rect_8 = v8;
    CGFloat v10 = v9;
    [(UIView *)self->_borderView bounds];
    CGFloat v12 = v11;
    CGFloat rect = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    +[PLImageView badgeOffset];
    double v20 = v19;
    double rect_16 = v21;
    v34.origin.x = v12;
    v34.origin.y = v14;
    v34.size.double width = v16;
    v34.size.double height = v18;
    double MaxX = CGRectGetMaxX(v34);
    v35.origin.x = v5;
    CGFloat v23 = v7;
    v35.origin.y = v7;
    CGFloat v24 = rect_8;
    v35.size.double width = rect_8;
    v35.size.double height = v10;
    double v25 = MaxX - CGRectGetWidth(v35) - v20 + -1.0;
    v36.origin.x = rect;
    v36.origin.y = v14;
    v36.size.double width = v16;
    v36.size.double height = v18;
    double MaxY = CGRectGetMaxY(v36);
    v37.origin.x = v25;
    v37.origin.y = v23;
    v37.size.double width = rect_8;
    v37.size.double height = v10;
    double v27 = MaxY - CGRectGetHeight(v37) - rect_16 + -1.0;
  }
  else
  {
    double v25 = *MEMORY[0x1E4F1DB28];
    double v27 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat v24 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  double v28 = v25;
  double v29 = v24;
  double v30 = v10;
  result.size.double height = v30;
  result.size.double width = v29;
  result.origin.y = v27;
  result.origin.x = v28;
  return result;
}

- (CGRect)_leftAccessoryViewFrame
{
  leftAccessoryView = self->_leftAccessoryView;
  if (leftAccessoryView)
  {
    [(UIView *)leftAccessoryView frame];
    [(UIView *)self->_borderView bounds];
    CGRectGetMinX(v4);
    UIRectCenteredYInRect();
    return CGRectOffset(v5, self->_leftAccessoryViewOffset.width, self->_leftAccessoryViewOffset.height);
  }
  else
  {
    return *(CGRect *)*(void *)&MEMORY[0x1E4F1DB28];
  }
}

- (void)renderSnapshotInContext:(CGContext *)a3
{
  BOOL edgeAntialiasingEnabled = self->_edgeAntialiasingEnabled;
  if (!self->_edgeAntialiasingEnabled) {
    [(PLImageView *)self setEdgeAntialiasingEnabled:1];
  }
  double v6 = (void *)[(PLImageView *)self layer];
  if (*((unsigned char *)self + 576))
  {
    CGContextGetCTM(&t1, a3);
    CGContextGetBaseCTM();
    CGAffineTransformInvert(&t2, &v13);
    CGAffineTransformConcat(&v16, &t1, &t2);
    double a = v16.a;
    double b = v16.b;
    double c = v16.c;
    double d = v16.d;
    PLPhysicalScreenScale();
    [v6 setShadowRadius:sqrt((d * 0.0 + b * (v11 * 4.0)) * (d * 0.0 + b * (v11 * 4.0))+ (c * 0.0 + a * (v11 * 4.0)) * (c * 0.0 + a * (v11 * 4.0)))];
  }
  [v6 renderInContext:a3];
  if (*((unsigned char *)self + 576))
  {
    PLPhysicalScreenScale();
    [v6 setShadowRadius:v12 * 4.0];
  }
  [(PLImageView *)self setEdgeAntialiasingEnabled:edgeAntialiasingEnabled];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PLImageView sizeThatFits:allowRounding:](self, "sizeThatFits:allowRounding:", 1, a3.width, a3.height);
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3 allowRounding:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.height;
  double width = a3.width;
  objc_msgSend((id)-[PLImageView image](self, "image"), "size");
  BOOL v9 = v8 == *(double *)(MEMORY[0x1E4F1DB30] + 8) && v7 == *MEMORY[0x1E4F1DB30];
  double v10 = v7 / v8;
  if (v9) {
    double v10 = 1.5;
  }
  if (v10 > 1.0)
  {
    double height = width / v10;
    if (!v4) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  double width = height * v10;
  if (v4)
  {
LABEL_10:
    PLPhysicalScreenScale();
    double width = rint(width * v11) / v11;
    double height = rint(height * v11) / v11;
  }
LABEL_11:
  double v12 = width;
  double v13 = height;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (void)dealloc
{
  [(PLImageView *)self setTextBadgeString:0];
  [(PLImageView *)self setVideoView:0];
  [(UIView *)self->_borderView removeFromSuperview];

  v3.receiver = self;
  v3.super_class = (Class)PLImageView;
  [(PLImageView *)&v3 dealloc];
}

- (PLImageView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PLImageView;
  objc_super v3 = -[PLImageView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  BOOL v4 = v3;
  if (v3)
  {
    [(PLImageView *)v3 setContentMode:1];
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42948], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      [(PLImageView *)v4 bounds];
      CGRect v10 = CGRectInset(v9, -1.0, -1.0);
      CGRect v5 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v10.origin.x, v10.origin.y, v10.size.width, v10.size.height);
      v4->_borderView = v5;
      [(UIView *)v5 setAutoresizingMask:18];
      double v6 = [(UIView *)v4->_borderView layer];
      [(PLImageView *)v4 setDrawsBorder:1];
      [(CALayer *)v6 setEdgeAntialiasingMask:0];
      [(CALayer *)v6 setAllowsEdgeAntialiasing:1];
      [(PLImageView *)v4 addSubview:v4->_borderView];
      [(UIView *)v4->_borderView setHidden:1];
    }
    objc_msgSend((id)-[PLImageView layer](v4, "layer"), "setEdgeAntialiasingMask:", 0);
    objc_msgSend((id)-[PLImageView layer](v4, "layer"), "setAllowsEdgeAntialiasing:", 1);
    objc_msgSend((id)-[PLImageView layer](v4, "layer"), "setContentsOpaque:", 1);
    objc_msgSend((id)-[PLImageView layer](v4, "layer"), "setAllowsDisplayCompositing:", 0);
    v4->_accessoryViewsAlphdouble a = 1.0;
    v4->_double placeholderScale = 1.0;
  }
  return v4;
}

+ (id)textBadgeForString:(id)a3 photoSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  if (!__textBadgeTextColor)
  {
    __textBadgeTextColor = [objc_alloc(MEMORY[0x1E4F428B8]) initWithWhite:1.0 alpha:1.0];
    __textBadgeShadowColor = [objc_alloc(MEMORY[0x1E4F428B8]) initWithWhite:0.25 alpha:1.0];
    __textBadgeBackgroundColor = [objc_alloc(MEMORY[0x1E4F428B8]) initWithWhite:0.1 alpha:0.5];
    if (a3) {
      goto LABEL_3;
    }
LABEL_7:
    id v7 = 0;
    goto LABEL_8;
  }
  if (!a3) {
    goto LABEL_7;
  }
LABEL_3:
  id v7 = objc_alloc_init(MEMORY[0x1E4F42B38]);
  [v7 setTextAlignment:1];
  [v7 setLineBreakMode:5];
  [v7 setBaselineAdjustment:1];
  [v7 setTextColor:__textBadgeTextColor];
  [v7 setBackgroundColor:__textBadgeBackgroundColor];
  [v7 setShadowColor:__textBadgeShadowColor];
  objc_msgSend(v7, "setShadowOffset:", 1.0, 1.0);
  [v7 setFont:UISystemFontBoldForSize()];
  [v7 setMinimumScaleFactor:0.7];
  objc_msgSend((id)objc_msgSend(v7, "layer"), "setCornerRadius:", 3.0);
  [v7 setAutoresizingMask:13];
  [v7 setText:a3];
  [v7 sizeToFit];
  [v7 frame];
  double v9 = v8;
  double v11 = v10 + 6.0;
  if (v11 > width + -12.0 + -6.0)
  {
    [v7 setAdjustsFontSizeToFitWidth:1];
    double v11 = width + -12.0 + -6.0;
  }
  double v12 = (width - v11) * 0.5;
  double v13 = height - v9 + -6.0 + -3.0;
  double v14 = v9;
  CGRect v17 = CGRectIntegral(*(CGRect *)(&v11 - 2));
  objc_msgSend(v7, "setFrame:", v17.origin.x, v17.origin.y, v17.size.width, v17.size.height);
LABEL_8:
  return v7;
}

+ (CGSize)badgeOffset
{
  double v2 = 6.0;
  double v3 = 6.0;
  result.double height = v3;
  result.double width = v2;
  return result;
}

+ (BOOL)shouldDrawShadows
{
  return __shouldDrawShadows;
}

+ (void)initialize
{
  if (MGGetBoolAnswer())
  {
    if ((id)objc_opt_class() == a1) {
      __shadowColor = [MEMORY[0x1E4F428B8] blackColor];
    }
  }
}

@end