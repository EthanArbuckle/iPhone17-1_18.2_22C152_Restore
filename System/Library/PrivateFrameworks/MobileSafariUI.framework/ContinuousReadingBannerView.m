@interface ContinuousReadingBannerView
+ (UIColor)hairlineColor;
+ (id)makeHairlineSeparator;
- (CGRect)titleRect;
- (CGSize)_scaledImageSize;
- (ContinuousReadingBannerView)initWithContinuousReadingItem:(id)a3;
- (ContinuousReadingBannerView)initWithFrame:(CGRect)a3;
- (ContinuousReadingItem)continuousReadingItem;
- (NSString)subtitle;
- (NSString)title;
- (SFBannerTheme)theme;
- (UIEdgeInsets)topHairlineInsets;
- (UIImage)image;
- (UIImageView)imageView;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (double)_textBaseline;
- (id)_bottomHairline;
- (id)_topHairline;
- (void)_updateLabels;
- (void)dealloc;
- (void)layoutSubviews;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setFrame:(CGRect)a3;
- (void)setImage:(id)a3;
- (void)setImageView:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTheme:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTopHairlineInsets:(UIEdgeInsets)a3;
@end

@implementation ContinuousReadingBannerView

- (ContinuousReadingBannerView)initWithFrame:(CGRect)a3
{
  return 0;
}

- (ContinuousReadingBannerView)initWithContinuousReadingItem:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ContinuousReadingBannerView;
  v6 = -[ContinuousReadingBannerView initWithFrame:](&v20, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_continuousReadingItem, a3);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v8 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"title", @"subtitle", 0, 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          [v5 addObserver:v7 forKeyPath:*(void *)(*((void *)&v16 + 1) + 8 * v12++) options:0 context:kContinuousReadingItemObserverContext];
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v10);
    }

    [(ContinuousReadingBannerView *)v7 _updateLabels];
    [(ContinuousReadingBannerView *)v7 setOpaque:1];
    v13 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
    [(ContinuousReadingBannerView *)v7 setBackgroundColor:v13];

    [(ContinuousReadingBannerView *)v7 _updateImage];
    [(ContinuousReadingBannerView *)v7 setAutoresizingMask:34];
    v14 = v7;
  }

  return v7;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"title", @"subtitle", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [(ContinuousReadingItem *)self->_continuousReadingItem removeObserver:self forKeyPath:*(void *)(*((void *)&v9 + 1) + 8 * v7++) context:kContinuousReadingItemObserverContext];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)ContinuousReadingBannerView;
  [(ContinuousReadingBannerView *)&v8 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)kContinuousReadingItemObserverContext == a6)
  {
    [(ContinuousReadingBannerView *)self _updateLabels];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)ContinuousReadingBannerView;
    -[ContinuousReadingBannerView observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)layoutSubviews
{
  [(ContinuousReadingBannerView *)self bounds];
  double v4 = v3;
  [(ContinuousReadingBannerView *)self _textBaseline];
  double v6 = v5;
  [(ContinuousReadingBannerView *)self safeAreaInsets];
  double v8 = fmax(v7, 15.0);
  double v10 = fmax(v9, 15.0);
  long long v11 = [(ContinuousReadingBannerView *)self image];

  if (v11) {
    double v12 = v8 + 50.0;
  }
  else {
    double v12 = v8;
  }
  id v23 = [(ContinuousReadingBannerView *)self titleLabel];
  double v13 = v4 - v12 - v10;
  objc_msgSend(v23, "sizeThatFits:", v13, 1.79769313e308);
  _SFRoundRectToPixels();
  objc_msgSend(v23, "setFrame:");
  _SFRoundFloatToPixels();
  [v23 _setFirstLineBaselineFrameOriginY:v6 - v14];
  v15 = [(ContinuousReadingBannerView *)self subtitleLabel];
  objc_msgSend(v15, "sizeThatFits:", v13, 1.79769313e308);
  _SFRoundRectToPixels();
  objc_msgSend(v15, "setFrame:");
  _SFRoundFloatToPixels();
  [v15 _setFirstLineBaselineFrameOriginY:v6 - v16];
  long long v17 = [(ContinuousReadingBannerView *)self imageView];
  [v17 frame];
  double width = v25.size.width;
  double height = v25.size.height;
  v25.origin.x = v8;
  CGRectGetHeight(v25);
  _SFRoundFloatToPixels();
  objc_msgSend(v17, "setFrame:", v8, v20, width, height);
  v21 = [(ContinuousReadingBannerView *)self _topHairline];
  [v21 frame];
  _SFRoundRectToPixels();
  objc_msgSend(v21, "setFrame:");
  uint64_t v22 = [(ContinuousReadingBannerView *)self _bottomHairline];
  [v22 frame];
  _SFOnePixel();
  _SFRoundRectToPixels();
  objc_msgSend(v22, "setFrame:");
}

- (void)setFrame:(CGRect)a3
{
  v3.receiver = self;
  v3.super_class = (Class)ContinuousReadingBannerView;
  -[ContinuousReadingBannerView setFrame:](&v3, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, 60.0);
}

+ (id)makeHairlineSeparator
{
  id v2 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  _SFOnePixel();
  double v4 = objc_msgSend(v2, "initWithFrame:", 0.0, 0.0, 0.0, v3);
  [v4 setAutoresizingMask:2];
  double v5 = [MEMORY[0x1E4FB1618] opaqueSeparatorColor];
  [v4 setBackgroundColor:v5];

  return v4;
}

+ (UIColor)hairlineColor
{
  return (UIColor *)[MEMORY[0x1E4FB1618] opaqueSeparatorColor];
}

- (void)setTitle:(id)a3
{
  id v7 = a3;
  double v4 = [(ContinuousReadingBannerView *)self title];
  char v5 = [v7 isEqual:v4];

  if ((v5 & 1) == 0)
  {
    double v6 = [(ContinuousReadingBannerView *)self titleLabel];
    [v6 setText:v7];

    [(ContinuousReadingBannerView *)self setNeedsLayout];
  }
}

- (NSString)title
{
  id v2 = [(ContinuousReadingBannerView *)self titleLabel];
  double v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setSubtitle:(id)a3
{
  id v8 = a3;
  double v4 = [(ContinuousReadingBannerView *)self subtitle];
  char v5 = [v8 isEqual:v4];

  if ((v5 & 1) == 0)
  {
    double v6 = [(ContinuousReadingBannerView *)self subtitleLabel];
    if ([v8 length]) {
      id v7 = v8;
    }
    else {
      id v7 = 0;
    }
    [v6 setText:v7];

    [(ContinuousReadingBannerView *)self setNeedsLayout];
  }
}

- (NSString)subtitle
{
  id v2 = [(ContinuousReadingBannerView *)self subtitleLabel];
  double v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setImage:(id)a3
{
  id v11 = a3;
  double v4 = [(ContinuousReadingBannerView *)self image];
  if (([v11 isEqual:v4] & 1) == 0)
  {
    if ((v11 == 0) == (v4 != 0)) {
      [(ContinuousReadingBannerView *)self setNeedsLayout];
    }
    char v5 = [(ContinuousReadingBannerView *)self imageView];
    if (v11)
    {
      v13.double width = 40.0;
      v13.double height = 40.0;
      UIGraphicsBeginImageContextWithOptions(v13, 0, 0.0);
      double v6 = *MEMORY[0x1E4F1DAD8];
      double v7 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      CurrentContext = UIGraphicsGetCurrentContext();
      v14.origin.x = v6;
      v14.origin.y = v7;
      v14.size.double width = 40.0;
      v14.size.double height = 40.0;
      double v9 = CGPathCreateWithEllipseInRect(v14, 0);
      CGContextAddPath(CurrentContext, v9);
      CGContextClip(CurrentContext);
      objc_msgSend(v11, "drawInRect:", v6, v7, 40.0, 40.0);
      CGPathRelease(v9);
      double v10 = UIGraphicsGetImageFromCurrentImageContext();
      [v5 setImage:v10];

      UIGraphicsEndImageContext();
    }
    else
    {
      [v5 setImage:0];
    }
  }
}

- (UIImage)image
{
  id v2 = [(ContinuousReadingBannerView *)self imageView];
  double v3 = [v2 image];

  return (UIImage *)v3;
}

- (UILabel)titleLabel
{
  titleLabel = self->_titleLabel;
  if (!titleLabel)
  {
    double v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    char v5 = self->_titleLabel;
    self->_titleLabel = v4;

    double v6 = self->_titleLabel;
    double v7 = [MEMORY[0x1E4FB08E0] defaultFontForTextStyle:*MEMORY[0x1E4FB28D0]];
    [(UILabel *)v6 setFont:v7];

    id v8 = self->_titleLabel;
    double v9 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v8 setTextColor:v9];

    [(UILabel *)self->_titleLabel setNumberOfLines:1];
    [(ContinuousReadingBannerView *)self addSubview:self->_titleLabel];
    titleLabel = self->_titleLabel;
  }
  double v10 = titleLabel;
  return v10;
}

- (UILabel)subtitleLabel
{
  subtitleLabel = self->_subtitleLabel;
  if (!subtitleLabel)
  {
    double v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    char v5 = self->_subtitleLabel;
    self->_subtitleLabel = v4;

    double v6 = self->_subtitleLabel;
    double v7 = [MEMORY[0x1E4FB08E0] defaultFontForTextStyle:*MEMORY[0x1E4FB28E0]];
    [(UILabel *)v6 setFont:v7];

    id v8 = self->_subtitleLabel;
    double v9 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v8 setTextColor:v9];

    [(UILabel *)self->_subtitleLabel setNumberOfLines:1];
    [(ContinuousReadingBannerView *)self addSubview:self->_subtitleLabel];
    subtitleLabel = self->_subtitleLabel;
  }
  double v10 = subtitleLabel;
  return v10;
}

- (UIImageView)imageView
{
  imageView = self->_imageView;
  if (!imageView)
  {
    double v4 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", 15.0, 0.0, 40.0, 40.0);
    char v5 = self->_imageView;
    self->_imageView = v4;

    imageView = self->_imageView;
  }
  [(ContinuousReadingBannerView *)self addSubview:imageView];
  double v6 = self->_imageView;
  return v6;
}

- (void)setTopHairlineInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_topHairlineInsets.left
    || a3.top != self->_topHairlineInsets.top
    || a3.right != self->_topHairlineInsets.right
    || a3.bottom != self->_topHairlineInsets.bottom)
  {
    self->_topHairlineInsets = a3;
    [(ContinuousReadingBannerView *)self setNeedsLayout];
  }
}

- (CGRect)titleRect
{
  id v2 = [(ContinuousReadingBannerView *)self titleLabel];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setTheme:(id)a3
{
  id v15 = a3;
  char v4 = WBSIsEqual();
  double v5 = v15;
  if ((v4 & 1) == 0)
  {
    double v6 = [v15 traitCollection];
    [(ContinuousReadingBannerView *)self _setLocalOverrideTraitCollection:v6];

    double v7 = [v15 themeColor];
    if (v7)
    {
      [(ContinuousReadingBannerView *)self setBackgroundColor:v7];
    }
    else
    {
      double v8 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
      [(ContinuousReadingBannerView *)self setBackgroundColor:v8];
    }
    double v9 = [v15 separatorColor];
    double v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [MEMORY[0x1E4FB1618] opaqueSeparatorColor];
    }
    double v12 = v11;

    double v13 = [(ContinuousReadingBannerView *)self _topHairline];
    [v13 setBackgroundColor:v12];

    double v14 = [(ContinuousReadingBannerView *)self _bottomHairline];
    [v14 setBackgroundColor:v12];

    double v5 = v15;
  }
}

- (id)_topHairline
{
  topHairline = self->_topHairline;
  if (!topHairline)
  {
    char v4 = [(id)objc_opt_class() makeHairlineSeparator];
    double v5 = self->_topHairline;
    self->_topHairline = v4;

    [(ContinuousReadingBannerView *)self addSubview:self->_topHairline];
    topHairline = self->_topHairline;
  }
  double v6 = topHairline;
  return v6;
}

- (id)_bottomHairline
{
  bottomHairline = self->_bottomHairline;
  if (!bottomHairline)
  {
    char v4 = [(id)objc_opt_class() makeHairlineSeparator];
    double v5 = self->_bottomHairline;
    self->_bottomHairline = v4;

    [(ContinuousReadingBannerView *)self addSubview:self->_bottomHairline];
    bottomHairline = self->_bottomHairline;
  }
  double v6 = bottomHairline;
  return v6;
}

- (void)_updateLabels
{
  double v3 = [(ContinuousReadingItem *)self->_continuousReadingItem title];
  [(ContinuousReadingBannerView *)self setTitle:v3];

  id v4 = [(ContinuousReadingItem *)self->_continuousReadingItem subtitle];
  [(ContinuousReadingBannerView *)self setSubtitle:v4];
}

- (CGSize)_scaledImageSize
{
  if (_scaledImageSize_hasComputedSize == 1)
  {
    double v2 = *(double *)&_scaledImageSize_imageSize_0;
    double v3 = *(double *)&_scaledImageSize_imageSize_1;
  }
  else
  {
    id v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v4 scale];
    double v6 = v5;

    double v3 = v6 * 40.0;
    *(double *)&_scaledImageSize_imageSize_0 = v6 * 40.0;
    *(double *)&_scaledImageSize_imageSize_1 = v6 * 40.0;
    _scaledImageSize_hasComputedSize = 1;
    double v2 = v6 * 40.0;
  }
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (double)_textBaseline
{
  [(ContinuousReadingBannerView *)self bounds];
  return v2;
}

- (ContinuousReadingItem)continuousReadingItem
{
  return self->_continuousReadingItem;
}

- (UIEdgeInsets)topHairlineInsets
{
  double top = self->_topHairlineInsets.top;
  double left = self->_topHairlineInsets.left;
  double bottom = self->_topHairlineInsets.bottom;
  double right = self->_topHairlineInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (SFBannerTheme)theme
{
  return self->_theme;
}

- (void)setTitleLabel:(id)a3
{
}

- (void)setSubtitleLabel:(id)a3
{
}

- (void)setImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_theme, 0);
  objc_storeStrong((id *)&self->_continuousReadingItem, 0);
  objc_storeStrong((id *)&self->_bottomHairline, 0);
  objc_storeStrong((id *)&self->_topHairline, 0);
}

@end