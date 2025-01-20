@interface UIProgressView
+ (CGSize)defaultSize;
+ (id)_standardInnerImageForStyle:(int64_t)a3 barStyle:(int64_t)a4;
+ (id)_standardOuterImageForStyle:(int64_t)a3 barStyle:(int64_t)a4;
+ (id)_tintedImageWithTraitCollection:(id)a3 forHeight:(double)a4 andColors:(id)a5;
+ (id)_tintedImageWithTraitCollection:(id)a3 forHeight:(double)a4 andColors:(id)a5 roundingRectCorners:(unint64_t)a6;
+ (unint64_t)_indexForStyle:(int64_t)a3 barStyle:(int64_t)a4;
+ (void)_fillImagesForIndex:(unint64_t)a3 style:(int64_t)a4 barStyle:(int64_t)a5;
- (BOOL)_contentHuggingDefault_isUsuallyFixedHeight;
- (BOOL)_shouldTintProgress;
- (BOOL)_shouldTintTrack;
- (BOOL)isElementAccessibilityExposedToInterfaceBuilder;
- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3;
- (NSProgress)observedProgress;
- (UIColor)progressTintColor;
- (UIColor)trackTintColor;
- (UIEdgeInsets)alignmentRectInsets;
- (UIImage)progressImage;
- (UIImage)trackImage;
- (UIProgressView)initWithCoder:(NSCoder *)coder;
- (UIProgressView)initWithFrame:(CGRect)frame;
- (UIProgressView)initWithProgressViewStyle:(UIProgressViewStyle)style;
- (UIProgressViewStyle)progressViewStyle;
- (double)_shadowOpacityForUserInterfaceStyle:(int64_t)a3;
- (float)progress;
- (id)_appropriateProgressImage;
- (id)_appropriateTrackImage;
- (id)_defaultTrackColorForCurrentStyle;
- (id)_effectiveContentView;
- (int64_t)barStyle;
- (unint64_t)_roundedCornersForProgressForCurrentStyle;
- (unint64_t)_roundedCornersForTrackForCurrentStyle;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)_layoutShadow;
- (void)_populateArchivedSubviews:(id)a3;
- (void)_reducedTransparencyDidChange:(id)a3;
- (void)_setProgress:(float)a3;
- (void)_setProgressAnimated:(float)a3 duration:(double)a4 delay:(double)a5 options:(unint64_t)a6;
- (void)_setupShadow;
- (void)_updateImages;
- (void)encodeWithCoder:(id)a3;
- (void)layoutSubviews;
- (void)setBarStyle:(int64_t)a3;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)setObservedProgress:(NSProgress *)observedProgress;
- (void)setProgress:(float)progress;
- (void)setProgress:(float)progress animated:(BOOL)animated;
- (void)setProgressImage:(UIImage *)progressImage;
- (void)setProgressTintColor:(UIColor *)progressTintColor;
- (void)setProgressViewStyle:(UIProgressViewStyle)progressViewStyle;
- (void)setTrackImage:(UIImage *)trackImage;
- (void)setTrackTintColor:(UIColor *)trackTintColor;
- (void)tintColorDidChange;
@end

@implementation UIProgressView

- (UIEdgeInsets)alignmentRectInsets
{
  trackImage = self->_trackImage;
  progressImage = self->_progressImage;
  if (trackImage)
  {
    if (progressImage)
    {
      [(UIImage *)progressImage size];
      double v6 = v5;
      [(UIImage *)self->_trackImage size];
      if (v6 > v7)
      {
        progressImage = self->_progressImage;
LABEL_10:
        [(UIImage *)progressImage alignmentRectInsets];
        goto LABEL_12;
      }
      trackImage = self->_trackImage;
    }
    progressImage = trackImage;
    goto LABEL_10;
  }
  if (progressImage) {
    goto LABEL_10;
  }
  if (self->_progressViewStyle == 1)
  {
    double v8 = 0.0;
    double v9 = 1.0;
    double v10 = 0.0;
    double v11 = 0.0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)UIProgressView;
    [(UIView *)&v12 alignmentRectInsets];
  }
LABEL_12:
  result.right = v10;
  result.bottom = v9;
  result.left = v8;
  result.top = v11;
  return result;
}

- (void)_updateImages
{
  v35[2] = *MEMORY[0x1E4F143B8];
  if (!self->_trackView)
  {
    v3 = [UIImageView alloc];
    [(UIView *)self->_contentView bounds];
    v4 = -[UIImageView initWithFrame:](v3, "initWithFrame:");
    trackView = self->_trackView;
    self->_trackView = v4;

    double v6 = [(UIProgressView *)self _effectiveContentView];
    [v6 addSubview:self->_trackView];
  }
  if (!self->_progressView)
  {
    double v7 = [UIImageView alloc];
    double v8 = -[UIImageView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    progressView = self->_progressView;
    self->_progressView = v8;

    double v10 = [(UIProgressView *)self _effectiveContentView];
    [v10 addSubview:self->_progressView];

    [(UIView *)self->_progressView setAlpha:1.0];
  }
  [(UIView *)self bounds];
  double Height = CGRectGetHeight(v36);
  if (self->_trackImage)
  {
    objc_super v12 = self->_trackView;
    v13 = [(UIProgressView *)self _appropriateTrackImage];
    [(UIImageView *)v12 setImage:v13];
    goto LABEL_17;
  }
  uint64_t v14 = [(UIProgressView *)self trackTintColor];
  if (v14)
  {
    v15 = (void *)v14;
    double v30 = 0.0;
    double v31 = 0.0;
    double v28 = 0.0;
    double v29 = 0.0;
  }
  else
  {
    v15 = [(UIProgressView *)self _defaultTrackColorForCurrentStyle];
    double v30 = 0.0;
    double v31 = 0.0;
    double v28 = 0.0;
    double v29 = 0.0;
    if (!v15) {
      goto LABEL_12;
    }
  }
  if ([v15 getRed:&v31 green:&v30 blue:&v29 alpha:&v28])
  {
    v16 = +[UIColor colorWithRed:v31 * 0.978378378 green:v30 * 0.978378378 blue:v29 * 0.978378378 alpha:v28];
    v35[0] = v16;
    v35[1] = v15;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];

    goto LABEL_13;
  }
LABEL_12:
  v34 = v15;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
LABEL_13:
  if (![v13 isEqual:self->_trackColors]
    || ([(UIImageView *)self->_trackView image],
        v17 = objc_claimAutoreleasedReturnValue(),
        v17,
        !v17))
  {
    objc_storeStrong((id *)&self->_trackColors, v13);
    v18 = self->_trackView;
    v19 = [(UIView *)self traitCollection];
    v20 = +[UIProgressView _tintedImageWithTraitCollection:v19 forHeight:self->_trackColors andColors:[(UIProgressView *)self _roundedCornersForTrackForCurrentStyle] roundingRectCorners:Height];
    [(UIImageView *)v18 setImage:v20];
  }
LABEL_17:

  if (self->_progressImage)
  {
    v21 = [(UIProgressView *)self _appropriateProgressImage];
    [(UIImageView *)self->_progressView setImage:v21];
    if (([v21 _isResizable] & 1) == 0) {
      [(UIView *)self->_progressView setAlpha:1.0];
    }
    goto LABEL_31;
  }
  v21 = [(UIProgressView *)self progressTintColor];
  if (v21
    || ([(UIView *)self _inheritedInteractionTintColor],
        (v21 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    double v30 = 0.0;
    double v31 = 0.0;
    double v28 = 0.0;
    double v29 = 0.0;
  }
  else
  {
    v21 = +[UIColor blackColor];
    double v30 = 0.0;
    double v31 = 0.0;
    double v28 = 0.0;
    double v29 = 0.0;
    if (!v21) {
      goto LABEL_26;
    }
  }
  if ([v21 getRed:&v31 green:&v30 blue:&v29 alpha:&v28])
  {
    v22 = +[UIColor colorWithRed:v31 * 0.978378378 green:v30 * 0.978378378 blue:v29 * 0.978378378 alpha:v28];
    v33[0] = v22;
    v33[1] = v21;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];

    goto LABEL_27;
  }
LABEL_26:
  v32 = v21;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
LABEL_27:
  if (![v23 isEqual:self->_progressColors]
    || ([(UIImageView *)self->_progressView image],
        v24 = objc_claimAutoreleasedReturnValue(),
        v24,
        !v24))
  {
    objc_storeStrong((id *)&self->_progressColors, v23);
    v25 = self->_progressView;
    v26 = [(UIView *)self traitCollection];
    v27 = +[UIProgressView _tintedImageWithTraitCollection:v26 forHeight:self->_progressColors andColors:[(UIProgressView *)self _roundedCornersForProgressForCurrentStyle] roundingRectCorners:Height];
    [(UIImageView *)v25 setImage:v27];
  }
LABEL_31:
}

+ (id)_tintedImageWithTraitCollection:(id)a3 forHeight:(double)a4 andColors:(id)a5 roundingRectCorners:(unint64_t)a6
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  unint64_t v11 = [v10 count];
  BOOL v12 = v11 > 1;
  v13 = [MEMORY[0x1E4F1CA48] array];
  if (v11 < 2)
  {
    CGGradientRef v20 = 0;
  }
  else
  {
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v14 = v10;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v47 objects:v51 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v48 != v17) {
            objc_enumerationMutation(v14);
          }
          id v19 = [*(id *)(*((void *)&v47 + 1) + 8 * i) resolvedColorWithTraitCollection:v9];
          objc_msgSend(v13, "addObject:", objc_msgSend(v19, "CGColor"));
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v47 objects:v51 count:16];
      }
      while (v16);
    }

    CGGradientRef v20 = CGGradientCreateWithColors(0, (CFArrayRef)v13, 0);
  }
  v21 = [UIGraphicsImageRenderer alloc];
  v22 = +[UIGraphicsImageRendererFormat preferredFormat];
  v23 = -[UIGraphicsImageRenderer initWithSize:format:](v21, "initWithSize:format:", v22, a4 + a4 + 1.0, a4);

  uint64_t v31 = MEMORY[0x1E4F143A8];
  uint64_t v32 = 3221225472;
  v33 = __90__UIProgressView__tintedImageWithTraitCollection_forHeight_andColors_roundingRectCorners___block_invoke;
  v34 = &unk_1E5301F50;
  uint64_t v37 = 0;
  uint64_t v38 = 0;
  double v39 = a4 + a4 + 1.0;
  double v40 = a4;
  unint64_t v41 = a6;
  double v42 = a4 * 0.5;
  double v43 = a4 * 0.5;
  BOOL v46 = v12;
  CGGradientRef v44 = v20;
  double v45 = a4;
  id v35 = v10;
  id v36 = v9;
  id v24 = v9;
  id v25 = v10;
  v26 = [(UIGraphicsImageRenderer *)v23 imageWithActions:&v31];
  v27 = objc_msgSend(v26, "resizableImageWithCapInsets:resizingMode:", 1, 0.0, a4, 0.0, a4, v31, v32, v33, v34);
  double v28 = v27;
  if (a6 != -1)
  {
    uint64_t v29 = [v27 imageFlippedForRightToLeftLayoutDirection];

    double v28 = (void *)v29;
  }

  return v28;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (![(UIView *)self _canDrawContent])
  {
    -[UIProgressView sizeThatFits:](self, "sizeThatFits:", width, height);
    double width = v8;
    double height = v9;
  }
  [(UIView *)self frame];
  double v11 = v10;
  double v13 = v12;
  v15.receiver = self;
  v15.super_class = (Class)UIProgressView;
  -[UIView setFrame:](&v15, sel_setFrame_, x, y, width, height);
  if (width != v11 || height != v13)
  {
    if ([(UIView *)self _canDrawContent])
    {
      [(UIView *)self setNeedsDisplay];
    }
    else if (+[UIView _isInAnimationBlock])
    {
      [(UIView *)self setNeedsLayout];
      [(UIView *)self layoutBelowIfNeeded];
    }
  }
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  CGFloat width = a3.width;
  double v5 = [(id)objc_opt_class() _standardOuterImageForStyle:self->_progressViewStyle barStyle:self->_barStyle];
  [v5 size];
  if (self->_progressViewStyle)
  {
    UICeilToViewScale(self);
    double v7 = v6;
  }
  else if (dyld_program_sdk_at_least())
  {
    double v7 = 4.0;
  }
  else
  {
    double v7 = 2.0;
  }

  double v8 = width;
  double v9 = v7;
  result.double height = v9;
  result.CGFloat width = v8;
  return result;
}

+ (id)_standardOuterImageForStyle:(int64_t)a3 barStyle:(int64_t)a4
{
  uint64_t v7 = objc_msgSend(a1, "_indexForStyle:barStyle:");
  [a1 _fillImagesForIndex:v7 style:a3 barStyle:a4];
  double v8 = (void *)_MergedGlobals_11_12[v7 + 3];
  return v8;
}

+ (unint64_t)_indexForStyle:(int64_t)a3 barStyle:(int64_t)a4
{
  double v6 = +[UIDevice currentDevice];
  uint64_t v7 = [v6 userInterfaceIdiom];

  if (a3 == 1 && (v7 & 0xFFFFFFFFFFFFFFFBLL) == 1 && a4 == 3) {
    return (int)a3 + 1;
  }
  else {
    return (int)a3;
  }
}

+ (void)_fillImagesForIndex:(unint64_t)a3 style:(int64_t)a4 barStyle:(int64_t)a5
{
  v23 = __defaultImageSuffixes[a3];
  double v8 = +[UIDevice currentDevice];
  uint64_t v9 = [v8 userInterfaceIdiom];

  if (a5 != 3 && a4 == 1 && (v9 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    uint64_t v10 = [(__CFString *)v23 stringByAppendingString:@"_Silver"];

    double v11 = (void *)v10;
  }
  else
  {
    double v11 = v23;
  }
  if (!_MergedGlobals_11_12[a3])
  {
    id v24 = v11;
    double v12 = [NSString stringWithFormat:@"UIProgressBarInner%@.png", v11];
    double v13 = _UIImageWithName(v12);

    [v13 size];
    uint64_t v15 = objc_msgSend(v13, "resizableImageWithCapInsets:", 0.0, (v14 + -1.0) * 0.5, 0.0, (v14 + -1.0) * 0.5);

    uint64_t v16 = (void *)_MergedGlobals_11_12[a3];
    _MergedGlobals_11_12[a3] = v15;

    double v11 = v24;
  }
  uint64_t v17 = &_MergedGlobals_11_12[a3];
  if (!v17[3])
  {
    id v25 = v11;
    v18 = [NSString stringWithFormat:@"UIProgressBarOuter%@.png", v11];
    id v19 = _UIImageWithName(v18);

    [v19 size];
    uint64_t v21 = objc_msgSend(v19, "resizableImageWithCapInsets:", 0.0, (v20 + -1.0) * 0.5, 0.0, (v20 + -1.0) * 0.5);

    v22 = (void *)v17[3];
    v17[3] = v21;

    double v11 = v25;
  }
}

- (UIColor)trackTintColor
{
  return self->_trackTintColor;
}

- (UIColor)progressTintColor
{
  return self->_progressTintColor;
}

- (void)layoutSubviews
{
  [(UIView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIView alignmentRectForFrame:](self, "alignmentRectForFrame:");
  double v12 = v11;
  -[UIView setFrame:](self->_contentView, "setFrame:", v4, v6, v8, v10);
  double v13 = [(UIProgressView *)self _effectiveContentView];
  [v13 bounds];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  -[UIImageView setFrame:](self->_trackView, "setFrame:", v15, v17, v19, v21);
  float progress = self->_progress;
  double v23 = round(v12 * progress);
  uint64_t v24 = MEMORY[0x1E4F1DAD8];
  if ((*((_DWORD *)&self->super._viewFlags + 4) & 0x80000) != 0) {
    double v25 = v12 - v23;
  }
  else {
    double v25 = *MEMORY[0x1E4F1DAD8];
  }
  BOOL v26 = progress != 0.0;
  [(UIView *)self->_progressView alpha];
  if (((v26 ^ (v27 == 0.0)) & 1) == 0)
  {
    double v28 = [(UIImageView *)self->_progressView image];
    int v29 = [v28 _isResizable];

    if (v29)
    {
      double v30 = 1.0;
      if (self->_progress == 0.0) {
        double v30 = 0.0;
      }
      [(UIView *)self->_progressView setAlpha:v30];
    }
  }
  uint64_t v31 = [(UIImageView *)self->_progressView image];
  int v32 = [v31 _isResizable];

  if (!v32) {
    goto LABEL_14;
  }
  v33 = [(UIImageView *)self->_progressView image];
  [v33 capInsets];
  double v35 = v34;
  double v37 = v36;

  float v38 = v35 + v37;
  double v39 = v38;
  if (v23 < v38)
  {
    double v40 = v39 - v23;
    if ((*((_DWORD *)&self->super._viewFlags + 4) & 0x80000) == 0) {
      double v40 = 0.0;
    }
    double v25 = v25 - v40;
  }
  else
  {
LABEL_14:
    double v39 = v23;
  }
  double v41 = *(double *)(v24 + 8);
  progressImage = self->_progressImage;
  if (progressImage)
  {
    [(UIImage *)progressImage alignmentRectInsets];
    double v45 = v43 + v44;
    double v39 = v39 + v43 + v44;
    if ((*((_DWORD *)&self->super._viewFlags + 4) & 0x80000) == 0) {
      double v45 = 0.0;
    }
    double v25 = v25 - v45;
  }
  progressView = self->_progressView;
  -[UIImageView setFrame:](progressView, "setFrame:", v25, v41, v39, v21);
}

- (id)_effectiveContentView
{
  if (self->_contentView) {
    self = (UIProgressView *)self->_contentView;
  }
  return self;
}

- (id)_defaultTrackColorForCurrentStyle
{
  if (self->_progressViewStyle)
  {
    v2 = +[UIColor clearColor];
  }
  else
  {
    if (dyld_program_sdk_at_least()) {
      +[UIColor systemFillColor];
    }
    else {
    v2 = +[UIColor colorWithRed:0.72265625 green:0.72265625 blue:0.72265625 alpha:1.0];
    }
  }
  return v2;
}

- (unint64_t)_roundedCornersForTrackForCurrentStyle
{
  if (self->_progressViewStyle) {
    return 0;
  }
  else {
    return -1;
  }
}

- (unint64_t)_roundedCornersForProgressForCurrentStyle
{
  if (self->_progressViewStyle) {
    return 0;
  }
  else {
    return -1;
  }
}

void __90__UIProgressView__tintedImageWithTraitCollection_forHeight_andColors_roundingRectCorners___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 80);
  double v4 = *(double *)(a1 + 48);
  double v5 = *(double *)(a1 + 56);
  double v6 = *(double *)(a1 + 64);
  double v7 = *(double *)(a1 + 72);
  double v8 = *(double *)(a1 + 88);
  double v9 = *(double *)(a1 + 96);
  id v10 = a2;
  double v11 = +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:](UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", v3, v4, v5, v6, v7, v8, v9);
  double v12 = (CGContext *)[v10 CGContext];

  id v15 = v11;
  CGContextAddPath(v12, (CGPathRef)[v15 CGPath]);
  CGContextClip(v12);
  if (*(unsigned char *)(a1 + 120))
  {
    v17.double y = *(CGFloat *)(a1 + 112);
    v17.double x = 0.0;
    CGContextDrawLinearGradient(v12, *(CGGradientRef *)(a1 + 104), *MEMORY[0x1E4F1DAD8], v17, 0);
    CGGradientRelease(*(CGGradientRef *)(a1 + 104));
  }
  else
  {
    double v13 = [*(id *)(a1 + 32) firstObject];
    double v14 = [v13 resolvedColorWithTraitCollection:*(void *)(a1 + 40)];
    [v14 setFill];

    CGContextFillRect(v12, *(CGRect *)(a1 + 48));
  }
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)UIProgressView;
  [(UIView *)&v3 tintColorDidChange];
  [(UIProgressView *)self _updateImages];
}

- (UIProgressView)initWithProgressViewStyle:(UIProgressViewStyle)style
{
  double v4 = -[UIProgressView initWithFrame:](self, "initWithFrame:", 0.0, 0.0, 160.0, 11.0);
  double v5 = v4;
  if (v4) {
    [(UIProgressView *)v4 setProgressViewStyle:style];
  }
  return v5;
}

- (void)setProgressViewStyle:(UIProgressViewStyle)progressViewStyle
{
  if (progressViewStyle < 2)
  {
    if (self->_progressViewStyle != progressViewStyle)
    {
      self->_progressViewStyle = progressViewStyle;
      [(UIImageView *)self->_trackView setImage:0];
      [(UIImageView *)self->_progressView setImage:0];
      [(UIProgressView *)self _updateImages];
      [(UIView *)self sizeToFit];
      [(UIView *)self setNeedsLayout];
      [(UIView *)self invalidateIntrinsicContentSize];
    }
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__UIProgressView_setProgressViewStyle___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = progressViewStyle;
    if (setProgressViewStyle__onceToken != -1) {
      dispatch_once(&setProgressViewStyle__onceToken, block);
    }
  }
}

- (UIProgressView)initWithFrame:(CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)UIProgressView;
  objc_super v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
  double v4 = v3;
  if (v3)
  {
    [(UIProgressView *)v3 _setupProgressViewCommon];
    [(UIView *)v4 setOpaque:0];
    [(UIProgressView *)v4 setProgress:0.0];
    [(UIView *)v4 setClipsToBounds:0];
  }
  return v4;
}

- (void)setProgress:(float)progress
{
  double v3 = fmin(progress, 1.0);
  if (v3 < 0.0) {
    double v3 = 0.0;
  }
  float v4 = v3;
  if (self->_progress != v4)
  {
    -[UIProgressView _setProgress:](self, "_setProgress:");
    if ([(UIView *)self _canDrawContent])
    {
      [(UIView *)self setNeedsDisplay];
    }
    else
    {
      [(UIView *)self setNeedsLayout];
    }
  }
}

- (BOOL)isElementAccessibilityExposedToInterfaceBuilder
{
  return 0;
}

uint64_t __66___UIProgressView_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateProgressValue];
}

+ (id)_standardInnerImageForStyle:(int64_t)a3 barStyle:(int64_t)a4
{
  uint64_t v7 = objc_msgSend(a1, "_indexForStyle:barStyle:");
  [a1 _fillImagesForIndex:v7 style:a3 barStyle:a4];
  double v8 = (void *)_MergedGlobals_11_12[v7];
  return v8;
}

- (UIProgressView)initWithCoder:(NSCoder *)coder
{
  float v4 = coder;
  v15.receiver = self;
  v15.super_class = (Class)UIProgressView;
  double v5 = [(UIView *)&v15 initWithCoder:v4];
  if (v5)
  {
    if ([(NSCoder *)v4 containsValueForKey:@"UIProgressTrackTintColor"])
    {
      uint64_t v6 = [(NSCoder *)v4 decodeObjectForKey:@"UIProgressTrackTintColor"];
      trackTintColor = v5->_trackTintColor;
      v5->_trackTintColor = (UIColor *)v6;
    }
    if ([(NSCoder *)v4 containsValueForKey:@"UIProgressProgressTintColor"])
    {
      uint64_t v8 = [(NSCoder *)v4 decodeObjectForKey:@"UIProgressProgressTintColor"];
      progressTintColor = v5->_progressTintColor;
      v5->_progressTintColor = (UIColor *)v8;
    }
    if ([(NSCoder *)v4 containsValueForKey:@"UIProgressProgressImage"])
    {
      uint64_t v10 = [(NSCoder *)v4 decodeObjectForKey:@"UIProgressProgressImage"];
      progressImage = v5->_progressImage;
      v5->_progressImage = (UIImage *)v10;
    }
    if ([(NSCoder *)v4 containsValueForKey:@"UIProgressTrackImage"])
    {
      uint64_t v12 = [(NSCoder *)v4 decodeObjectForKey:@"UIProgressTrackImage"];
      trackImage = v5->_trackImage;
      v5->_trackImage = (UIImage *)v12;
    }
    [(UIProgressView *)v5 _setupProgressViewCommon];
    [(UIProgressView *)v5 setProgressViewStyle:[(NSCoder *)v4 decodeIntegerForKey:@"UIProgressViewStyle"]];
    [(NSCoder *)v4 decodeFloatForKey:@"UIProgress"];
    -[UIProgressView setProgress:](v5, "setProgress:");
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UIProgressView;
  [(UIView *)&v10 encodeWithCoder:v4];
  int64_t progressViewStyle = self->_progressViewStyle;
  if (progressViewStyle) {
    [v4 encodeInteger:progressViewStyle forKey:@"UIProgressViewStyle"];
  }
  if (self->_progress != 0.0) {
    objc_msgSend(v4, "encodeFloat:forKey:", @"UIProgress");
  }
  trackTintColor = self->_trackTintColor;
  if (trackTintColor) {
    [v4 encodeObject:trackTintColor forKey:@"UIProgressTrackTintColor"];
  }
  progressTintColor = self->_progressTintColor;
  if (progressTintColor) {
    [v4 encodeObject:progressTintColor forKey:@"UIProgressProgressTintColor"];
  }
  trackImage = self->_trackImage;
  if (trackImage) {
    [v4 encodeObject:trackImage forKey:@"UIProgressTrackImage"];
  }
  progressImage = self->_progressImage;
  if (progressImage) {
    [v4 encodeObject:progressImage forKey:@"UIProgressProgressImage"];
  }
}

- (void)_populateArchivedSubviews:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UIProgressView;
  [(UIView *)&v5 _populateArchivedSubviews:v4];
  if (self->_progressView) {
    objc_msgSend(v4, "removeObject:");
  }
  if (self->_trackView) {
    objc_msgSend(v4, "removeObject:");
  }
  if (self->_effectView) {
    objc_msgSend(v4, "removeObject:");
  }
  if (self->_contentView) {
    objc_msgSend(v4, "removeObject:");
  }
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (![(UIView *)self _canDrawContent]
    && (*(void *)&self->super._viewFlags & 0x400000000000000) == 0)
  {
    -[UIProgressView sizeThatFits:](self, "sizeThatFits:", width, height);
    double width = v8;
    double height = v9;
  }
  [(UIView *)self bounds];
  double v11 = v10;
  double v13 = v12;
  v15.receiver = self;
  v15.super_class = (Class)UIProgressView;
  -[UIView setBounds:](&v15, sel_setBounds_, x, y, width, height);
  if (width != v11 || height != v13)
  {
    if ([(UIView *)self _canDrawContent])
    {
      [(UIView *)self setNeedsDisplay];
    }
    else if (+[UIView _isInAnimationBlock] {
           || (*(void *)&self->super._viewFlags & 0x400000000000000) != 0)
    }
    {
      [(UIView *)self setNeedsLayout];
      [(UIView *)self layoutBelowIfNeeded];
    }
  }
}

- (BOOL)_contentHuggingDefault_isUsuallyFixedHeight
{
  return 1;
}

void __39__UIProgressView_setProgressViewStyle___block_invoke(uint64_t a1)
{
}

- (BOOL)_shouldTintProgress
{
  return self->_progressTintColor != 0;
}

- (BOOL)_shouldTintTrack
{
  return self->_trackTintColor != 0;
}

- (id)_appropriateTrackImage
{
  if ([(UIView *)self _canDrawContent])
  {
    double v3 = 0;
    goto LABEL_13;
  }
  double v3 = [(UIImageView *)self->_trackView image];
  if (![(UIProgressView *)self _shouldTintTrack] || v3)
  {
    trackImage = self->_trackImage;
    if (trackImage)
    {
      double v14 = trackImage;

      double v3 = v14;
      goto LABEL_13;
    }
  }
  else
  {
    if (self->_progressViewStyle == 1) {
      id v4 = @"Bar";
    }
    else {
      id v4 = @"Default";
    }
    objc_super v5 = NSString;
    uint64_t v6 = v4;
    uint64_t v7 = [v5 stringWithFormat:@"UIProgressBarCustomMaskOuter_%@.png", v6];
    double v8 = [NSString stringWithFormat:@"UIProgressBarCustomShineOuter_%@.png", v6];

    double v9 = _UIImageWithName(v7);
    double v10 = _UIImageWithName(v8);
    [v9 size];
    double v11 = +[UIImage _tintedImageForSize:withTint:effectsImage:maskImage:style:](UIImage, "_tintedImageForSize:withTint:effectsImage:maskImage:style:", self->_trackTintColor, v10, v9, 0);
    [v9 size];
    double v3 = objc_msgSend(v11, "resizableImageWithCapInsets:", 0.0, (v12 + -1.0) * 0.5, 0.0, (v12 + -1.0) * 0.5);
  }
  if (!v3)
  {
    double v3 = [(id)objc_opt_class() _standardOuterImageForStyle:self->_progressViewStyle barStyle:self->_barStyle];
  }
LABEL_13:
  return v3;
}

- (id)_appropriateProgressImage
{
  if ([(UIView *)self _canDrawContent])
  {
    double v3 = 0;
    goto LABEL_13;
  }
  double v3 = [(UIImageView *)self->_progressView image];
  if (![(UIProgressView *)self _shouldTintProgress] || v3)
  {
    progressImage = self->_progressImage;
    if (progressImage)
    {
      double v14 = progressImage;

      double v3 = v14;
      goto LABEL_13;
    }
  }
  else
  {
    if (self->_progressViewStyle == 1) {
      id v4 = @"Bar";
    }
    else {
      id v4 = @"Default";
    }
    objc_super v5 = NSString;
    uint64_t v6 = v4;
    uint64_t v7 = [v5 stringWithFormat:@"UIProgressBarCustomMaskInner_%@.png", v6];
    double v8 = [NSString stringWithFormat:@"UIProgressBarCustomShineInner_%@.png", v6];

    double v9 = _UIImageWithName(v7);
    double v10 = _UIImageWithName(v8);
    [v9 size];
    double v11 = +[UIImage _tintedImageForSize:withTint:effectsImage:maskImage:style:](UIImage, "_tintedImageForSize:withTint:effectsImage:maskImage:style:", self->_progressTintColor, v10, v9, 0);
    [v9 size];
    double v3 = objc_msgSend(v11, "resizableImageWithCapInsets:", 0.0, (v12 + -1.0) * 0.5, 0.0, (v12 + -1.0) * 0.5);
  }
  if (!v3)
  {
    double v3 = [(id)objc_opt_class() _standardInnerImageForStyle:self->_progressViewStyle barStyle:self->_barStyle];
  }
LABEL_13:
  return v3;
}

- (void)_setupShadow
{
  if (!self->_shadowView)
  {
    double v3 = [UIView alloc];
    [(UIView *)self bounds];
    id v4 = -[UIView initWithFrame:](v3, "initWithFrame:");
    shadowView = self->_shadowView;
    self->_shadowView = v4;

    [(UIView *)self->_shadowView setOpaque:0];
    [(UIView *)self->_shadowView setBackgroundColor:0];
    [(UIView *)self insertSubview:self->_shadowView atIndex:0];
    id v9 = [(UIView *)self->_shadowView layer];
    [(UIView *)self->_contentView frame];
    objc_msgSend(v9, "setContents:", +[_UIStretchableShadow shadowWithRadius:cornerRadius:](_UIStretchableShadow, "shadowWithRadius:cornerRadius:", 5.0, floor(v6 * 0.5)));
    objc_msgSend(v9, "setContentsCenter:", 0.5, 0.5, 0.0, 0.0);
    uint64_t v7 = [(UIView *)self traitCollection];
    -[UIProgressView _shadowOpacityForUserInterfaceStyle:](self, "_shadowOpacityForUserInterfaceStyle:", [v7 userInterfaceStyle]);
    *(float *)&double v8 = v8;
    [v9 setOpacity:v8];

    [(UIProgressView *)self _layoutShadow];
    [(UIView *)self setNeedsLayout];
  }
}

- (void)_layoutShadow
{
  [(UIView *)self bounds];
  double v3 = CGRectGetHeight(v9) * 0.5;
  if (v3 >= 3.0) {
    double v4 = -2.0;
  }
  else {
    double v4 = v3 + -5.0;
  }
  [(UIView *)self bounds];
  double v5 = CGRectGetWidth(v10) + 10.0 + 6.0;
  [(UIView *)self bounds];
  double Height = CGRectGetHeight(v11);
  shadowView = self->_shadowView;
  -[UIView setFrame:](shadowView, "setFrame:", -8.0, v4, v5, Height + 10.0);
}

- (double)_shadowOpacityForUserInterfaceStyle:(int64_t)a3
{
  BOOL v3 = a3 == 2 || a3 == 1000;
  double result = 0.2;
  if (v3) {
    return 0.5;
  }
  return result;
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)UIProgressView;
  [(UIView *)&v3 _dynamicUserInterfaceTraitDidChange];
  if (dyld_program_sdk_at_least()) {
    [(UIProgressView *)self _updateImages];
  }
}

- (void)setObservedProgress:(NSProgress *)observedProgress
{
  double v5 = observedProgress;
  if (([(NSProgress *)v5 isEqual:self->_observedProgress] & 1) == 0)
  {
    [(NSObservation *)self->_progressObservation finishObserving];
    progressObservation = self->_progressObservation;
    self->_progressObservation = 0;

    objc_storeStrong((id *)&self->_observedProgress, observedProgress);
    if (self->_observedProgress)
    {
      objc_initWeak(&location, self);
      uint64_t v7 = [MEMORY[0x1E4F28EE8] keyPathWithRootObject:self path:"observedProgress.fractionCompleted"];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __38__UIProgressView_setObservedProgress___block_invoke;
      v10[3] = &unk_1E5301E28;
      objc_copyWeak(&v11, &location);
      double v8 = [v7 addObserverBlock:v10];
      CGRect v9 = self->_progressObservation;
      self->_progressObservation = v8;

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }
}

void __38__UIProgressView_setObservedProgress___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__UIProgressView_setObservedProgress___block_invoke_2;
  v5[3] = &unk_1E52D9960;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __38__UIProgressView_setObservedProgress___block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained observedProgress];

  if (v4)
  {
    id v6 = objc_loadWeakRetained(v2);
    [*(id *)(a1 + 32) doubleValue];
    *(float *)&double v5 = v5;
    [v6 _setProgressAnimated:4 duration:v5 delay:0.1 options:0.0];
  }
}

- (void)_setProgress:(float)a3
{
  self->_float progress = a3;
}

- (void)setProgress:(float)progress animated:(BOOL)animated
{
  float v4 = progress;
  if (!animated)
  {
LABEL_5:
    float progress = v4;
    [(UIProgressView *)self setProgress:*(double *)&progress];
    return;
  }
  if ([(UIView *)self _canDrawContent])
  {
    if (setProgress_animated__onceToken != -1) {
      dispatch_once(&setProgress_animated__onceToken, &__block_literal_global_451);
    }
    goto LABEL_5;
  }
  float v6 = vabds_f32(self->_progress, v4);
  id v7 = [(UIImageView *)self->_progressView image];
  if ([v7 _isResizable])
  {
    if (v4 == 0.0)
    {

      goto LABEL_13;
    }
    [(UIView *)self->_progressView alpha];
    double v10 = v9;

    if (v10 == 0.0)
    {
LABEL_13:
      double v8 = v6;
      if (v6 <= 0.2) {
        float v6 = 0.2;
      }
    }
  }
  else
  {
  }
  *(float *)&double v8 = v4;
  [(UIProgressView *)self _setProgressAnimated:196612 duration:v8 delay:v6 options:0.0];
}

void __39__UIProgressView_setProgress_animated___block_invoke()
{
}

- (void)_setProgressAnimated:(float)a3 duration:(double)a4 delay:(double)a5 options:(unint64_t)a6
{
  double v7 = fmin(a3, 1.0);
  if (v7 < 0.0) {
    double v7 = 0.0;
  }
  float v8 = v7;
  if (self->_progress != v8)
  {
    self->_isAnimating = 1;
    -[UIProgressView _setProgress:](self, "_setProgress:");
    [(UIView *)self setNeedsLayout];
    v12[4] = self;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __62__UIProgressView__setProgressAnimated_duration_delay_options___block_invoke;
    v13[3] = &unk_1E52D9F70;
    v13[4] = self;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __62__UIProgressView__setProgressAnimated_duration_delay_options___block_invoke_2;
    v12[3] = &unk_1E52DC3A0;
    +[UIView animateWithDuration:a6 delay:v13 options:v12 animations:a4 completion:a5];
  }
}

uint64_t __62__UIProgressView__setProgressAnimated_duration_delay_options___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutBelowIfNeeded];
}

uint64_t __62__UIProgressView__setProgressAnimated_duration_delay_options___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 472) = 0;
  return result;
}

- (void)setProgressTintColor:(UIColor *)progressTintColor
{
  double v5 = progressTintColor;
  if (self->_progressTintColor != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)&self->_progressTintColor, progressTintColor);
    progressImage = self->_progressImage;
    self->_progressImage = 0;

    [(UIImageView *)self->_progressView setImage:0];
    [(UIProgressView *)self _updateImages];
    double v5 = v7;
    if (!self->_isAnimating)
    {
      [(UIView *)self setNeedsLayout];
      double v5 = v7;
    }
  }
}

- (void)setProgressImage:(UIImage *)progressImage
{
  double v5 = progressImage;
  if (self->_progressImage != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)&self->_progressImage, progressImage);
    progressTintColor = self->_progressTintColor;
    self->_progressTintColor = 0;

    [(UIImageView *)self->_progressView setImage:0];
    [(UIProgressView *)self _updateImages];
    [(UIView *)self invalidateIntrinsicContentSize];
    double v5 = v7;
    if (!self->_isAnimating)
    {
      [(UIView *)self setNeedsLayout];
      double v5 = v7;
    }
  }
}

- (void)setTrackTintColor:(UIColor *)trackTintColor
{
  double v5 = trackTintColor;
  if (self->_trackTintColor != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)&self->_trackTintColor, trackTintColor);
    trackImage = self->_trackImage;
    self->_trackImage = 0;

    [(UIImageView *)self->_trackView setImage:0];
    [(UIProgressView *)self _updateImages];
    [(UIView *)self setNeedsLayout];
    double v5 = v7;
  }
}

- (void)setTrackImage:(UIImage *)trackImage
{
  double v5 = trackImage;
  if (self->_trackImage != v5)
  {
    trackTintColor = self->_trackTintColor;
    self->_trackTintColor = 0;
    double v7 = v5;

    objc_storeStrong((id *)&self->_trackImage, trackImage);
    [(UIImageView *)self->_trackView setImage:0];
    [(UIProgressView *)self _updateImages];
    [(UIView *)self setNeedsLayout];
    [(UIView *)self invalidateIntrinsicContentSize];
    double v5 = v7;
  }
}

+ (id)_tintedImageWithTraitCollection:(id)a3 forHeight:(double)a4 andColors:(id)a5
{
  return +[UIProgressView _tintedImageWithTraitCollection:a3 forHeight:a5 andColors:-1 roundingRectCorners:a4];
}

- (void)_reducedTransparencyDidChange:(id)a3
{
  if (_AXSEnhanceBackgroundContrastEnabled()) {
    uint64_t v4 = 4010;
  }
  else {
    uint64_t v4 = 5001;
  }
  id v5 = +[UIBlurEffect _effectWithStyle:v4 invertAutomaticStyle:1];
  [(UIVisualEffectView *)self->_effectView setEffect:v5];
}

- (UIProgressViewStyle)progressViewStyle
{
  return self->_progressViewStyle;
}

- (float)progress
{
  return self->_progress;
}

- (UIImage)trackImage
{
  return self->_trackImage;
}

- (UIImage)progressImage
{
  return self->_progressImage;
}

- (NSProgress)observedProgress
{
  return self->_observedProgress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressImage, 0);
  objc_storeStrong((id *)&self->_trackImage, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_progressObservation, 0);
  objc_storeStrong((id *)&self->_observedProgress, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_progressColors, 0);
  objc_storeStrong((id *)&self->_trackColors, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_trackView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_trackTintColor, 0);
  objc_storeStrong((id *)&self->_progressTintColor, 0);
}

- (int64_t)barStyle
{
  return self->_barStyle;
}

- (void)setBarStyle:(int64_t)a3
{
  if (self->_barStyle != a3)
  {
    self->_barStyle = a3;
    [(UIProgressView *)self _updateImages];
    [(UIView *)self setNeedsLayout];
  }
}

+ (CGSize)defaultSize
{
  double v2 = 160.0;
  double v3 = 11.0;
  result.double height = v3;
  result.double width = v2;
  return result;
}

@end