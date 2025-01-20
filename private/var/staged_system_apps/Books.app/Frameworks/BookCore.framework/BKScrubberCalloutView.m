@interface BKScrubberCalloutView
- (BKScrubberCalloutView)initWithCoder:(id)a3;
- (BKScrubberCalloutView)initWithFrame:(CGRect)a3;
- (BKScrubberCalloutView)initWithFrame:(CGRect)a3 style:(unint64_t)a4;
- (BOOL)_useWideRadiusRoundedCorners;
- (BOOL)shouldDisplayPageInfo;
- (BOOL)usesMonospacedDigitFontForSubtitle;
- (CALayer)innerBorderLayer;
- (CALayer)outerBorderLayer;
- (CALayer)shadowLayer;
- (CGSize)contentSize;
- (CGSize)contentSizeForThumbnailAspectRatio:(double)a3 spread:(BOOL)a4;
- (CGSize)thumbnailSizeForAspectRatio:(double)a3 showSpreads:(BOOL)a4;
- (NSString)leftPageShortenString;
- (NSString)leftPageString;
- (NSString)rightPageShortenString;
- (NSString)rightPageString;
- (UIColor)innerBorderColor;
- (UIColor)outerBorderColor;
- (UIColor)shadowColor;
- (UILabel)leftPageLabel;
- (UILabel)rightPageLabel;
- (UILabel)subtitle;
- (UILabel)title;
- (UIView)pageView;
- (UIVisualEffectView)blurView;
- (id)_pageLabelFont;
- (id)_subtitleFont;
- (id)createPageLabel;
- (id)stringForLeftPageLabel;
- (id)stringForRightPageLabel;
- (unint64_t)_effectiveStyle;
- (unint64_t)style;
- (void)_stylize;
- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4;
- (void)addToViewController:(id)a3;
- (void)dealloc;
- (void)layoutContent;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setBlurView:(id)a3;
- (void)setInnerBorderColor:(id)a3;
- (void)setInnerBorderLayer:(id)a3;
- (void)setIsShowing:(BOOL)a3 animated:(BOOL)a4;
- (void)setLeftPageShortenString:(id)a3;
- (void)setLeftPageString:(id)a3;
- (void)setLeftPageText:(id)a3 shortenString:(id)a4;
- (void)setOuterBorderColor:(id)a3;
- (void)setOuterBorderLayer:(id)a3;
- (void)setPageView:(id)a3;
- (void)setRightPageShortenString:(id)a3;
- (void)setRightPageString:(id)a3;
- (void)setRightPageText:(id)a3 shortenString:(id)a4;
- (void)setShadowColor:(id)a3;
- (void)setShadowLayer:(id)a3;
- (void)setShouldDisplayPageInfo:(BOOL)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setUsesMonospacedDigitFontForSubtitle:(BOOL)a3;
@end

@implementation BKScrubberCalloutView

- (BKScrubberCalloutView)initWithFrame:(CGRect)a3 style:(unint64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)BKScrubberCalloutView;
  v5 = -[BKScrubberCalloutView initWithFrame:](&v10, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_style = a4;
    v5->_shouldDisplayPageInfo = 1;
    [(BKScrubberCalloutView *)v5 _stylize];
    [(BKScrubberCalloutView *)v6 setAlpha:0.0];
    v7 = +[UITraitCollection bc_allAPITraits];
    id v8 = [(BKScrubberCalloutView *)v6 registerForTraitChanges:v7 withAction:"_traitCollectionDidChange:previousTraitCollection:"];
  }
  return v6;
}

- (BKScrubberCalloutView)initWithFrame:(CGRect)a3
{
  return -[BKScrubberCalloutView initWithFrame:style:](self, "initWithFrame:style:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (BKScrubberCalloutView)initWithCoder:(id)a3
{
  return -[BKScrubberCalloutView initWithFrame:style:](self, "initWithFrame:style:", 0, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
}

- (void)dealloc
{
  contentView = self->_contentView;
  self->_contentView = 0;

  title = self->_title;
  self->_title = 0;

  subtitle = self->_subtitle;
  self->_subtitle = 0;

  pageView = self->_pageView;
  self->_pageView = 0;

  v7.receiver = self;
  v7.super_class = (Class)BKScrubberCalloutView;
  [(BKScrubberCalloutView *)&v7 dealloc];
}

- (void)addToViewController:(id)a3
{
  id v4 = [a3 view];
  [v4 addSubview:self];
}

- (void)setIsShowing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  double v7 = (double)a3;
  [(BKScrubberCalloutView *)self alpha];
  if (v8 != v7)
  {
    if (v5)
    {
      [(BKScrubberCalloutView *)self setAlpha:1.0];
    }
    else
    {
      [(BKScrubberCalloutView *)self alpha];
      if (v9 == 1.0)
      {
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_E08B8;
        v12[3] = &unk_2C3C50;
        v12[4] = self;
        objc_super v10 = objc_retainBlock(v12);
        v11 = v10;
        if (v4) {
          +[UIView animateWithDuration:4 delay:v10 options:0 animations:0.2 completion:0.3];
        }
        else {
          ((void (*)(void *))v10[2])(v10);
        }
      }
    }
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)BKScrubberCalloutView;
  [(BKScrubberCalloutView *)&v3 layoutSubviews];
  [(BKScrubberCalloutView *)self layoutContent];
  [(BKScrubberCalloutView *)self bringSubviewToFront:self->_contentView];
}

- (void)setBackgroundColor:(id)a3
{
}

- (UILabel)title
{
  title = self->_title;
  if (!title)
  {
    BOOL v4 = [(UILabel *)[objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height]];
    BOOL v5 = self->_title;
    self->_title = v4;

    v6 = +[UIColor clearColor];
    [(UILabel *)self->_title setBackgroundColor:v6];

    double v7 = +[UIColor whiteColor];
    [(UILabel *)self->_title setTextColor:v7];

    double v8 = +[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    [(UILabel *)self->_title setFont:v8];

    [(UILabel *)self->_title setTextAlignment:1];
    unsigned int v9 = [(BKScrubberCalloutView *)self shouldDisplayPageInfo];
    title = self->_title;
    if (v9)
    {
      [(UIView *)self->_contentView addSubview:title];
      title = self->_title;
    }
  }

  return title;
}

- (id)createPageLabel
{
  id v2 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  objc_super v3 = +[UIColor clearColor];
  [v2 setBackgroundColor:v3];

  BOOL v4 = +[UIColor bc_booksSecondaryLabelColor];
  [v2 setTextColor:v4];

  [v2 setTextAlignment:1];

  return v2;
}

- (UILabel)subtitle
{
  subtitle = self->_subtitle;
  if (!subtitle)
  {
    BOOL v4 = [(BKScrubberCalloutView *)self createPageLabel];
    BOOL v5 = self->_subtitle;
    self->_subtitle = v4;

    v6 = [(BKScrubberCalloutView *)self _subtitleFont];
    [(UILabel *)self->_subtitle setFont:v6];

    double v7 = +[UIColor whiteColor];
    [(UILabel *)self->_subtitle setTextColor:v7];

    unsigned int v8 = [(BKScrubberCalloutView *)self shouldDisplayPageInfo];
    subtitle = self->_subtitle;
    if (v8)
    {
      [(UIView *)self->_contentView addSubview:subtitle];
      subtitle = self->_subtitle;
    }
  }

  return subtitle;
}

- (UILabel)leftPageLabel
{
  leftPageLabel = self->_leftPageLabel;
  if (!leftPageLabel)
  {
    BOOL v4 = [(BKScrubberCalloutView *)self createPageLabel];
    BOOL v5 = self->_leftPageLabel;
    self->_leftPageLabel = v4;

    [(UILabel *)self->_leftPageLabel setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)self->_leftPageLabel setAdjustsFontForContentSizeCategory:1];
    v6 = [(BKScrubberCalloutView *)self _pageLabelFont];
    [(UILabel *)self->_leftPageLabel setFont:v6];

    unsigned int v7 = [(BKScrubberCalloutView *)self shouldDisplayPageInfo];
    leftPageLabel = self->_leftPageLabel;
    if (v7)
    {
      [(UIView *)self->_contentView addSubview:leftPageLabel];
      leftPageLabel = self->_leftPageLabel;
    }
  }

  return leftPageLabel;
}

- (UILabel)rightPageLabel
{
  rightPageLabel = self->_rightPageLabel;
  if (!rightPageLabel)
  {
    BOOL v4 = [(BKScrubberCalloutView *)self createPageLabel];
    BOOL v5 = self->_rightPageLabel;
    self->_rightPageLabel = v4;

    v6 = [(BKScrubberCalloutView *)self _pageLabelFont];
    [(UILabel *)self->_rightPageLabel setFont:v6];

    [(UILabel *)self->_rightPageLabel setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)self->_rightPageLabel setAdjustsFontForContentSizeCategory:1];
    unsigned int v7 = [(BKScrubberCalloutView *)self shouldDisplayPageInfo];
    rightPageLabel = self->_rightPageLabel;
    if (v7)
    {
      [(UIView *)self->_contentView addSubview:rightPageLabel];
      rightPageLabel = self->_rightPageLabel;
    }
  }

  return rightPageLabel;
}

- (void)setPageView:(id)a3
{
  BOOL v5 = (UIView *)a3;
  p_pageView = &self->_pageView;
  pageView = self->_pageView;
  if (pageView != v5)
  {
    unsigned int v9 = v5;
    [(UIView *)pageView removeFromSuperview];
    unsigned int v8 = *p_pageView;
    *p_pageView = 0;

    objc_storeStrong((id *)&self->_pageView, a3);
    if (*p_pageView) {
      -[UIView addSubview:](self->_contentView, "addSubview:");
    }
    pageView = (UIView *)[(BKScrubberCalloutView *)self setNeedsLayout];
    BOOL v5 = v9;
  }

  _objc_release_x1(pageView, v5);
}

- (CGSize)contentSizeForThumbnailAspectRatio:(double)a3 spread:(BOOL)a4
{
  if (!a4)
  {
    if (a3 >= 1.0)
    {
      if (a3 == 1.0)
      {
        double v7 = 146.0;
        double v6 = 146.0;
        goto LABEL_16;
      }
      if (a3 > 1.56)
      {
        double v6 = 194.0;
        goto LABEL_13;
      }
      double v7 = 124.0;
    }
    else
    {
      if (a3 > 0.64)
      {
        double v6 = 124.0;
        goto LABEL_13;
      }
      double v7 = 194.0;
    }
    double v6 = a3 * v7;
    goto LABEL_16;
  }
  double v5 = a3 + a3;
  if (v5 > 1.56451613)
  {
    a3 = v5 * 0.5;
    double v6 = 97.0;
LABEL_13:
    double v7 = v6 / a3;
    goto LABEL_16;
  }
  double v7 = 124.0;
  double v6 = v5 * 124.0 * 0.5;
LABEL_16:
  if (([(BKScrubberCalloutView *)self im_isCompactWidth] & 1) == 0
    && ([(BKScrubberCalloutView *)self im_isCompactHeight] & 1) == 0)
  {
    double v7 = v7 * 1.25;
    double v6 = v6 * 1.25;
  }
  double v8 = v6;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)thumbnailSizeForAspectRatio:(double)a3 showSpreads:(BOOL)a4
{
  [(BKScrubberCalloutView *)self contentSizeForThumbnailAspectRatio:a4 spread:a3];
  double v6 = ceil(v4 + -10.0);
  double v7 = ceil(v5 + -10.0);
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)contentSize
{
  double height = CGSizeZero.height;
  -[UILabel sizeThatFits:](self->_title, "sizeThatFits:", CGSizeZero.width, height);
  double v5 = v4;
  double v7 = v6;
  -[UILabel sizeThatFits:](self->_subtitle, "sizeThatFits:", CGSizeZero.width, height);
  double v9 = v8;
  double v11 = v10;
  -[UILabel sizeThatFits:](self->_leftPageLabel, "sizeThatFits:", CGSizeZero.width, height);
  double v13 = v12;
  double v15 = v14;
  -[UILabel sizeThatFits:](self->_rightPageLabel, "sizeThatFits:", CGSizeZero.width, height);
  double v17 = fmax(fmax(v9, v13), v16);
  double v18 = fmax(fmax(v11, v15), v16);
  pageView = self->_pageView;
  if (pageView)
  {
    [(UIView *)self->_pageView frame];
    -[UIView sizeThatFits:](pageView, "sizeThatFits:", v20, v21);
    double v23 = v22;
    double v25 = v24;
    unsigned int v26 = [(BKScrubberCalloutView *)self shouldDisplayPageInfo];
    double v27 = fmax(v17, v23);
    if (!v26) {
      double v27 = v23;
    }
    double v28 = v25 + 10.0;
    double v29 = v27 + 10.0;
    unsigned int v30 = [(BKScrubberCalloutView *)self shouldDisplayPageInfo];
    double v31 = fmax(v18, 27.0) + v28;
    if (v30) {
      double v32 = v31;
    }
    else {
      double v32 = v28;
    }
  }
  else
  {
    double v29 = ceil(fmax(v5, v17) + 40.0);
    double v32 = ceil(v7 + v18 + 13.0);
  }
  double v33 = v29;
  result.double height = v32;
  result.width = v33;
  return result;
}

- (void)layoutContent
{
  [(BKScrubberCalloutView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double height = CGSizeZero.height;
  -[UILabel sizeThatFits:](self->_title, "sizeThatFits:", CGSizeZero.width, height);
  double v13 = v12;
  -[UILabel sizeThatFits:](self->_subtitle, "sizeThatFits:", CGSizeZero.width, height);
  double v15 = v14;
  blurView = self->_blurView;
  if (!blurView) {
    blurView = (UIVisualEffectView *)self->_contentView;
  }
  -[UIVisualEffectView setFrame:](blurView, "setFrame:", v4, v6, v8, v10);
  +[CATransaction begin];
  +[CATransaction setValue:kCFBooleanTrue forKey:kCATransactionDisableActions];
  double v17 = [(BKScrubberCalloutView *)self layer];
  [v17 bounds];
  -[CALayer setFrame:](self->_shadowLayer, "setFrame:");

  [(CALayer *)self->_shadowLayer bounds];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  [(UIView *)self->_contentView _continuousCornerRadius];
  +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v19, v21, v23, v25, v26);
  id v27 = objc_claimAutoreleasedReturnValue();
  -[CALayer setShadowPath:](self->_shadowLayer, "setShadowPath:", [v27 CGPath]);

  double v28 = [(BKScrubberCalloutView *)self layer];
  [v28 bounds];
  -[CALayer setFrame:](self->_outerBorderLayer, "setFrame:");

  double v29 = [(BKScrubberCalloutView *)self layer];
  [v29 bounds];
  CGRect v62 = CGRectInset(v61, 0.5, 0.5);
  -[CALayer setFrame:](self->_innerBorderLayer, "setFrame:", v62.origin.x, v62.origin.y, v62.size.width, v62.size.height);

  if ((char *)[(BKScrubberCalloutView *)self _effectiveStyle] == (char *)&def_7D91C + 2)
  {
    if ([(BKScrubberCalloutView *)self _useWideRadiusRoundedCorners]) {
      double v30 = 16.0;
    }
    else {
      double v30 = 6.0;
    }
    double v31 = [(BKScrubberCalloutView *)self blurView];
    [v31 _setContinuousCornerRadius:v30];

    double v32 = [(BKScrubberCalloutView *)self shadowLayer];
    [v32 setCornerRadius:v30];

    double v33 = [(BKScrubberCalloutView *)self outerBorderLayer];
    [v33 setCornerRadius:v30];

    v34 = [(BKScrubberCalloutView *)self innerBorderLayer];
    [v34 setCornerRadius:v30 + -1.0];
  }
  +[CATransaction commit];
  pageView = self->_pageView;
  if (pageView)
  {
    if (self->_leftPageLabel)
    {
      if (self->_rightPageLabel) {
        double v36 = 2.0;
      }
      else {
        double v36 = 1.0;
      }
    }
    else
    {
      double v36 = 1.0;
    }
    [(UIView *)self->_pageView bounds];
    -[UIView sizeThatFits:](pageView, "sizeThatFits:", v43, v44);
    v64.size.width = v45;
    v64.size.double height = v46;
    double v47 = 5.0;
    v64.origin.x = fmax((v8 - v45) * 0.5, 5.0);
    v64.origin.y = 5.0;
    CGRect v65 = CGRectIntegral(v64);
    -[UIView setFrame:](self->_pageView, "setFrame:", v65.origin.x, v65.origin.y, v65.size.width, v65.size.height);
    [(UIView *)self->_pageView frame];
    double MaxY = CGRectGetMaxY(v66);
    -[UILabel setFrame:](self->_subtitle, "setFrame:", 5.0, MaxY, v8 + -10.0, v15 + 5.0);
    double v49 = v8 / v36 + -10.0;
    -[UILabel setFrame:](self->_leftPageLabel, "setFrame:", 5.0, MaxY, v49, v10 - MaxY);
    leftPageLabel = self->_leftPageLabel;
    if (leftPageLabel)
    {
      [(UILabel *)leftPageLabel frame];
      double v47 = CGRectGetMaxX(v67) + 5.0;
    }
    -[UILabel setFrame:](self->_rightPageLabel, "setFrame:", v47, MaxY, v49, v10 - MaxY);
    v51 = [(BKScrubberCalloutView *)self stringForRightPageLabel];
    [(UILabel *)self->_rightPageLabel setText:v51];

    v52 = [(BKScrubberCalloutView *)self stringForLeftPageLabel];
    [(UILabel *)self->_leftPageLabel setText:v52];

    [(UIView *)self->_pageView setClipsToBounds:1];
    unsigned int v53 = [(BKScrubberCalloutView *)self _useWideRadiusRoundedCorners];
    v54 = self->_pageView;
    if (v53)
    {
      [(UIView *)v54 _setContinuousCornerRadius:10.0];
      v55 = [(UIView *)self->_pageView layer];
      [v55 setBorderWidth:1.0];

      id v56 = +[UIColor bc_booksQuaternaryLabelColor];
      id v57 = [v56 CGColor];
      v58 = [(UIView *)self->_pageView layer];
      [v58 setBorderColor:v57];
    }
    else
    {
      [(UIView *)v54 _setContinuousCornerRadius:0.0];
      id v56 = [(UIView *)self->_pageView layer];
      [v56 setBorderWidth:0.0];
    }

    v59 = self->_pageView;
    [(UIView *)v59 setNeedsLayout];
  }
  else
  {
    [(BKScrubberCalloutView *)self frame];
    if (v8 >= v37 + -40.0) {
      double v38 = v37 + -40.0;
    }
    else {
      double v38 = v8;
    }
    -[UILabel setFrame:](self->_title, "setFrame:", 20.0, 5.0, v38, v13);
    [(UILabel *)self->_title frame];
    double v39 = CGRectGetMaxY(v63) + 1.0;
    [(BKScrubberCalloutView *)self frame];
    subtitle = self->_subtitle;
    if (v8 >= v40 + -40.0) {
      double v42 = v40 + -40.0;
    }
    else {
      double v42 = v8;
    }
    -[UILabel setFrame:](subtitle, "setFrame:", 20.0, v39, v42, v15);
  }
}

- (void)setLeftPageText:(id)a3 shortenString:(id)a4
{
  id v6 = a4;
  [(BKScrubberCalloutView *)self setLeftPageString:a3];
  [(BKScrubberCalloutView *)self setLeftPageShortenString:v6];

  double v7 = [(BKScrubberCalloutView *)self leftPageString];
  if ([v7 length])
  {

LABEL_4:
    double v12 = [(BKScrubberCalloutView *)self stringForLeftPageLabel];
    double v10 = [(BKScrubberCalloutView *)self leftPageLabel];
    [v10 setText:v12];

    leftPageLabel = v12;
    goto LABEL_5;
  }
  double v8 = [(BKScrubberCalloutView *)self leftPageShortenString];
  id v9 = [v8 length];

  if (v9) {
    goto LABEL_4;
  }
  [(UILabel *)self->_leftPageLabel removeFromSuperview];
  leftPageLabel = self->_leftPageLabel;
  self->_leftPageLabel = 0;
LABEL_5:
}

- (void)setRightPageText:(id)a3 shortenString:(id)a4
{
  id v6 = a4;
  [(BKScrubberCalloutView *)self setRightPageString:a3];
  [(BKScrubberCalloutView *)self setRightPageShortenString:v6];

  double v7 = [(BKScrubberCalloutView *)self rightPageString];
  if ([v7 length])
  {

LABEL_4:
    double v12 = [(BKScrubberCalloutView *)self stringForRightPageLabel];
    double v10 = [(BKScrubberCalloutView *)self rightPageLabel];
    [v10 setText:v12];

    rightPageLabel = v12;
    goto LABEL_5;
  }
  double v8 = [(BKScrubberCalloutView *)self rightPageShortenString];
  id v9 = [v8 length];

  if (v9) {
    goto LABEL_4;
  }
  [(UILabel *)self->_rightPageLabel removeFromSuperview];
  rightPageLabel = self->_rightPageLabel;
  self->_rightPageLabel = 0;
LABEL_5:
}

- (id)stringForLeftPageLabel
{
  if (self->_leftPageLabel)
  {
    double v3 = [(BKScrubberCalloutView *)self leftPageString];
    NSAttributedStringKey v15 = NSFontAttributeName;
    double v4 = [(UILabel *)self->_leftPageLabel font];
    double v16 = v4;
    double v5 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    [v3 sizeWithAttributes:v5];
    double v7 = v6;

    [(UILabel *)self->_leftPageLabel bounds];
    if (v7 >= v8
      && ([(BKScrubberCalloutView *)self leftPageShortenString],
          id v9 = objc_claimAutoreleasedReturnValue(),
          v9,
          v9))
    {
      uint64_t v10 = [(BKScrubberCalloutView *)self leftPageShortenString];
    }
    else
    {
      uint64_t v10 = [(BKScrubberCalloutView *)self leftPageString];
    }
    double v11 = (__CFString *)v10;
  }
  else
  {
    double v11 = 0;
  }
  if (v11) {
    double v12 = v11;
  }
  else {
    double v12 = &stru_2CE418;
  }
  double v13 = v12;

  return v13;
}

- (id)stringForRightPageLabel
{
  if (self->_rightPageLabel)
  {
    double v3 = [(BKScrubberCalloutView *)self rightPageString];
    NSAttributedStringKey v15 = NSFontAttributeName;
    double v4 = [(UILabel *)self->_rightPageLabel font];
    double v16 = v4;
    double v5 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    [v3 sizeWithAttributes:v5];
    double v7 = v6;

    [(UILabel *)self->_rightPageLabel bounds];
    if (v7 >= v8
      && ([(BKScrubberCalloutView *)self rightPageShortenString],
          id v9 = objc_claimAutoreleasedReturnValue(),
          v9,
          v9))
    {
      uint64_t v10 = [(BKScrubberCalloutView *)self rightPageShortenString];
    }
    else
    {
      uint64_t v10 = [(BKScrubberCalloutView *)self rightPageString];
    }
    double v11 = (__CFString *)v10;
  }
  else
  {
    double v11 = 0;
  }
  if (v11) {
    double v12 = v11;
  }
  else {
    double v12 = &stru_2CE418;
  }
  double v13 = v12;

  return v13;
}

- (id)_subtitleFont
{
  if (self->_usesMonospacedDigitFontForSubtitle) {
    +[UIFont monospacedDigitSystemFontOfSize:10.0 weight:UIFontWeightRegular];
  }
  else {
  id v2 = +[UIFont systemFontOfSize:10.0];
  }

  return v2;
}

- (id)_pageLabelFont
{
  if (self->_usesMonospacedDigitFontForSubtitle) {
    +[UIFont monospacedDigitSystemFontOfSize:15.0 weight:UIFontWeightSemibold];
  }
  else {
  id v2 = +[UIFont systemFontOfSize:15.0 weight:UIFontWeightSemibold];
  }
  double v3 = +[UIFontMetrics metricsForTextStyle:UIFontTextStyleHeadline];
  double v4 = [v3 scaledFontForFont:v2];

  return v4;
}

- (void)setUsesMonospacedDigitFontForSubtitle:(BOOL)a3
{
  if (self->_usesMonospacedDigitFontForSubtitle != a3)
  {
    self->_usesMonospacedDigitFontForSubtitle = a3;
    if (self->_subtitle)
    {
      double v4 = [(BKScrubberCalloutView *)self _subtitleFont];
      [(UILabel *)self->_subtitle setFont:v4];
    }
    if (self->_leftPageLabel)
    {
      double v5 = [(BKScrubberCalloutView *)self _pageLabelFont];
      [(UILabel *)self->_leftPageLabel setFont:v5];
    }
    if (self->_rightPageLabel)
    {
      id v6 = [(BKScrubberCalloutView *)self _pageLabelFont];
      [(UILabel *)self->_rightPageLabel setFont:v6];
    }
  }
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v5 = [(BKScrubberCalloutView *)self outerBorderColor];
  id v6 = [v5 CGColor];
  double v7 = [(BKScrubberCalloutView *)self outerBorderLayer];
  [v7 setBorderColor:v6];

  id v8 = [(BKScrubberCalloutView *)self innerBorderColor];
  id v9 = [v8 CGColor];
  uint64_t v10 = [(BKScrubberCalloutView *)self innerBorderLayer];
  [v10 setBorderColor:v9];

  id v13 = [(BKScrubberCalloutView *)self shadowColor];
  id v11 = [v13 CGColor];
  double v12 = [(BKScrubberCalloutView *)self shadowLayer];
  [v12 setShadowColor:v11];
}

- (BOOL)_useWideRadiusRoundedCorners
{
  return self->_pageView != 0;
}

- (unint64_t)_effectiveStyle
{
  unint64_t result = [(BKScrubberCalloutView *)self style];
  if (result <= 1) {
    return 1;
  }
  return result;
}

- (void)_stylize
{
  if ((char *)[(BKScrubberCalloutView *)self _effectiveStyle] == (char *)&def_7D91C + 2)
  {
    double v3 = +[UIColor clearColor];
    [(BKScrubberCalloutView *)self setBackgroundColor:v3];

    id v31 = +[UIBlurEffect effectWithStyle:8];
    double v4 = (UIVisualEffectView *)[objc_alloc((Class)UIVisualEffectView) initWithEffect:v31];
    blurView = self->_blurView;
    self->_blurView = v4;

    [(UIVisualEffectView *)self->_blurView setContentMode:0];
    [(UIVisualEffectView *)self->_blurView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)self->_contentView bounds];
    -[UIVisualEffectView setFrame:](self->_blurView, "setFrame:");
    [(UIVisualEffectView *)self->_blurView setAlpha:1.0];
    id v6 = [(UIVisualEffectView *)self->_blurView layer];
    [v6 setMasksToBounds:1];

    [(UIVisualEffectView *)self->_blurView setClipsToBounds:1];
    double v7 = [(UIVisualEffectView *)self->_blurView contentView];
    contentView = self->_contentView;
    self->_contentView = v7;

    [(BKScrubberCalloutView *)self addSubview:self->_blurView];
    id v9 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v10 = +[UIColor colorNamed:@"BKScrubberCalloutPopFloatOuterBorderColor" inBundle:v9 compatibleWithTraitCollection:0];
    [(BKScrubberCalloutView *)self setOuterBorderColor:v10];

    id v11 = +[NSBundle bundleForClass:objc_opt_class()];
    double v12 = +[UIColor colorNamed:@"BKScrubberCalloutPopFloatInnerBorderColor" inBundle:v11 compatibleWithTraitCollection:0];
    [(BKScrubberCalloutView *)self setInnerBorderColor:v12];

    id v13 = +[NSBundle bundleForClass:objc_opt_class()];
    double v14 = +[UIColor colorNamed:@"BKScrubberCalloutPopFloatShadowColor" inBundle:v13 compatibleWithTraitCollection:0];
    [(BKScrubberCalloutView *)self setShadowColor:v14];

    NSAttributedStringKey v15 = objc_opt_new();
    [v15 setMasksToBounds:0];
    LODWORD(v16) = 1.0;
    [v15 setShadowOpacity:v16];
    id v17 = [(BKScrubberCalloutView *)self shadowColor];
    [v15 setShadowColor:[v17 CGColor]];

    [v15 setShadowOffset:0.0, 4.0];
    [v15 setShadowRadius:16.0];
    [v15 setCornerCurve:kCACornerCurveContinuous];
    double v18 = [(BKScrubberCalloutView *)self layer];
    double v19 = [(UIVisualEffectView *)self->_blurView layer];
    [v18 insertSublayer:v15 below:v19];

    [(BKScrubberCalloutView *)self setShadowLayer:v15];
    double v20 = +[CALayer layer];
    [v20 setBorderWidth:0.5];
    id v21 = [(BKScrubberCalloutView *)self outerBorderColor];
    objc_msgSend(v20, "setBorderColor:", objc_msgSend(v21, "CGColor"));

    [v20 setCornerCurve:kCACornerCurveContinuous];
    double v22 = [(BKScrubberCalloutView *)self layer];
    double v23 = [(UIVisualEffectView *)self->_blurView layer];
    [v22 insertSublayer:v20 above:v23];

    [(BKScrubberCalloutView *)self setOuterBorderLayer:v20];
    double v24 = +[CALayer layer];
    [v24 setBorderWidth:1.0];
    id v25 = [(BKScrubberCalloutView *)self innerBorderColor];
    [v24 setBorderColor:[v25 CGColor]];

    [v24 setCornerCurve:kCACornerCurveContinuous];
    double v26 = [(BKScrubberCalloutView *)self layer];
    [v26 insertSublayer:v24 below:v20];

    [(BKScrubberCalloutView *)self setInnerBorderLayer:v24];
  }
  else
  {
    id v27 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    double v28 = self->_contentView;
    self->_contentView = v27;

    [(UIView *)self->_contentView setOpaque:0];
    double v29 = +[UIColor colorWithRed:0.15 green:0.15 blue:0.13 alpha:1.0];
    [(BKScrubberCalloutView *)self setBackgroundColor:v29];

    [(UIView *)self->_contentView _setContinuousCornerRadius:16.0];
    double v30 = self->_contentView;
    [(BKScrubberCalloutView *)self addSubview:v30];
  }
}

- (UIView)pageView
{
  return self->_pageView;
}

- (NSString)leftPageString
{
  return self->_leftPageString;
}

- (void)setLeftPageString:(id)a3
{
}

- (NSString)leftPageShortenString
{
  return self->_leftPageShortenString;
}

- (void)setLeftPageShortenString:(id)a3
{
}

- (NSString)rightPageString
{
  return self->_rightPageString;
}

- (void)setRightPageString:(id)a3
{
}

- (NSString)rightPageShortenString
{
  return self->_rightPageShortenString;
}

- (void)setRightPageShortenString:(id)a3
{
}

- (BOOL)usesMonospacedDigitFontForSubtitle
{
  return self->_usesMonospacedDigitFontForSubtitle;
}

- (BOOL)shouldDisplayPageInfo
{
  return self->_shouldDisplayPageInfo;
}

- (void)setShouldDisplayPageInfo:(BOOL)a3
{
  self->_shouldDisplayPageInfo = a3;
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (UIVisualEffectView)blurView
{
  return self->_blurView;
}

- (void)setBlurView:(id)a3
{
}

- (CALayer)shadowLayer
{
  return self->_shadowLayer;
}

- (void)setShadowLayer:(id)a3
{
}

- (CALayer)outerBorderLayer
{
  return self->_outerBorderLayer;
}

- (void)setOuterBorderLayer:(id)a3
{
}

- (CALayer)innerBorderLayer
{
  return self->_innerBorderLayer;
}

- (void)setInnerBorderLayer:(id)a3
{
}

- (UIColor)outerBorderColor
{
  return self->_outerBorderColor;
}

- (void)setOuterBorderColor:(id)a3
{
}

- (UIColor)innerBorderColor
{
  return self->_innerBorderColor;
}

- (void)setInnerBorderColor:(id)a3
{
}

- (UIColor)shadowColor
{
  return self->_shadowColor;
}

- (void)setShadowColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowColor, 0);
  objc_storeStrong((id *)&self->_innerBorderColor, 0);
  objc_storeStrong((id *)&self->_outerBorderColor, 0);
  objc_storeStrong((id *)&self->_innerBorderLayer, 0);
  objc_storeStrong((id *)&self->_outerBorderLayer, 0);
  objc_storeStrong((id *)&self->_shadowLayer, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_rightPageShortenString, 0);
  objc_storeStrong((id *)&self->_rightPageString, 0);
  objc_storeStrong((id *)&self->_leftPageShortenString, 0);
  objc_storeStrong((id *)&self->_leftPageString, 0);
  objc_storeStrong((id *)&self->_rightPageLabel, 0);
  objc_storeStrong((id *)&self->_leftPageLabel, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_pageView, 0);

  objc_storeStrong((id *)&self->_contentView, 0);
}

@end