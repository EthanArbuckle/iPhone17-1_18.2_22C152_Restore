@interface MTGenericCollectionCell
+ (BOOL)showsArtwork;
+ (CGSize)artworkSizeForViewWidth:(double)a3;
+ (Class)textStackViewClass;
+ (double)estimatedHeight;
+ (double)heightForWidth:(double)a3;
+ (double)maxHeight;
+ (double)preferredContentWidth;
- (BOOL)showsArtwork;
- (CGRect)artworkFrameForContentViewSize:(CGSize)a3;
- (CGRect)sideViewFrameForContentViewSize:(CGSize)a3;
- (CGRect)textStackFrameForContentViewSize:(CGSize)a3 artworkFrame:(CGRect)a4 sideViewFrame:(CGRect)a5;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MTArtworkView)artworkView;
- (MTLabelStackView)textStackView;
- (NSString)artworkKey;
- (NSString)subtitle;
- (NSString)title;
- (UIView)sideView;
- (double)textViewMaxXForArtworkFrame:(CGRect)a3 sideViewFrame:(CGRect)a4;
- (double)textViewMinXForArtworkFrame:(CGRect)a3 sideViewFrame:(CGRect)a4;
- (void)configureSubviews;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setArtworkKey:(id)a3;
- (void)setArtworkView:(id)a3;
- (void)setShowsArtwork:(BOOL)a3;
- (void)setSideView:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTextStackView:(id)a3;
- (void)setTitle:(id)a3;
- (void)updateColors;
@end

@implementation MTGenericCollectionCell

+ (double)heightForWidth:(double)a3
{
  if ([a1 showsArtwork])
  {
    [a1 artworkSizeForViewWidth:a3];
    return v5 + 5.0 + 5.0;
  }
  else
  {
    id v7 = [a1 textStackViewClass];
    v8 = [v7 defaultTitleFont];
    v9 = [v7 defaultSubtitleFont];
    BOOL v10 = [v7 defaultTitleNumberOfLines] != (id)1;
    [v8 lineHeight];
    double v12 = v11;
    [v8 mt_offsetFromCapHeightToAscent];
    double v14 = v12 - v13 + 10.0;
    [v7 distanceBetweenLabelFramesWithTitleFont:v8 subtitleFont:v9 multilineTitle:v10];
    double v16 = v15 + v14;
    [v9 lineHeight];
    double v18 = v17;
    [v9 mt_offsetFromLastBaselineToBottom];
    double v6 = v16 + v18 - v19 + 10.0;
  }
  return v6;
}

+ (double)maxHeight
{
  [a1 heightForWidth:1.79769313e308];
  return result;
}

+ (CGSize)artworkSizeForViewWidth:(double)a3
{
  unint64_t v3 = +[MTEpisodeLockup styleForWidth:showsArtwork:](MTEpisodeLockup, "styleForWidth:showsArtwork:", [a1 showsArtwork], a3);

  +[MTEpisodeLockup artworkSizeForStyle:v3];
  result.height = v5;
  result.width = v4;
  return result;
}

+ (BOOL)showsArtwork
{
  return 0;
}

+ (Class)textStackViewClass
{
  [a1 showsArtwork];
  v2 = objc_opt_class();

  return (Class)v2;
}

+ (double)preferredContentWidth
{
  v2 = objc_msgSend(objc_msgSend(a1, "textStackViewClass"), "defaultSubtitleTextStyle");
  unint64_t v3 = +[UIFont mt_preferredFontForTextStyle:v2];
  [v3 _scaledValueForValue:384.0];
  double v5 = v4;

  return v5;
}

+ (double)estimatedHeight
{
  _[a1 maxHeight];
  return result;
}

- (NSString)title
{
  v2 = [(MTGenericCollectionCell *)self textStackView];
  unint64_t v3 = [v2 title];

  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(MTGenericCollectionCell *)self textStackView];
  [v5 setTitle:v4];
}

- (NSString)subtitle
{
  v2 = [(MTGenericCollectionCell *)self textStackView];
  unint64_t v3 = [v2 subtitle];

  return (NSString *)v3;
}

- (void)setSubtitle:(id)a3
{
  id v4 = a3;
  id v5 = [(MTGenericCollectionCell *)self textStackView];
  [v5 setSubtitle:v4];
}

- (NSString)artworkKey
{
  if ([(MTGenericCollectionCell *)self showsArtwork])
  {
    unint64_t v3 = [(MTGenericCollectionCell *)self artworkView];
    id v4 = [v3 artworkKey];
  }
  else
  {
    id v4 = 0;
  }

  return (NSString *)v4;
}

- (void)setArtworkKey:(id)a3
{
  id v5 = a3;
  if ([(MTGenericCollectionCell *)self showsArtwork])
  {
    id v4 = [(MTGenericCollectionCell *)self artworkView];
    [v4 setArtworkKey:v5];
  }
}

- (void)configureSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)MTGenericCollectionCell;
  [(MTCollectionViewCell *)&v7 configureSubviews];
  [(MTGenericCollectionCell *)self setPreservesSuperviewLayoutMargins:1];
  [(MTCollectionViewCell *)self setShowsMoreButton:0];
  self->_showsArtwork = [(id)objc_opt_class() showsArtwork];
  if ([(MTGenericCollectionCell *)self showsArtwork])
  {
    unint64_t v3 = [(MTCollectionViewCell *)self contentView];
    id v4 = [(MTGenericCollectionCell *)self artworkView];
    [v3 addSubview:v4];
  }
  id v5 = [(MTCollectionViewCell *)self contentView];
  double v6 = [(MTGenericCollectionCell *)self textStackView];
  [v5 addSubview:v6];

  [(MTGenericCollectionCell *)self updateFonts];
  [(MTGenericCollectionCell *)self updateColors];
  [(MTGenericCollectionCell *)self setNeedsLayout];
}

- (void)updateColors
{
  unint64_t v3 = [(MTCollectionViewCell *)self contentView];
  [v3 setOpaque:1];

  id v5 = +[UIColor backgroundColor];
  id v4 = [(MTCollectionViewCell *)self contentView];
  [v4 setBackgroundColor:v5];
}

- (void)setShowsArtwork:(BOOL)a3
{
  if (self->_showsArtwork != a3)
  {
    self->_showsArtwork = a3;
    if (a3)
    {
      id v5 = [(MTCollectionViewCell *)self contentView];
      id v4 = [(MTGenericCollectionCell *)self artworkView];
      [v5 addSubview:v4];
    }
    else
    {
      id v5 = [(MTGenericCollectionCell *)self artworkView];
      [v5 removeFromSuperview];
    }
  }
}

- (void)setSideView:(id)a3
{
  id v5 = (UIView *)a3;
  sideView = self->_sideView;
  if (sideView != v5)
  {
    v8 = v5;
    sideView = (UIView *)[(UIView *)sideView isEqual:v5];
    id v5 = v8;
    if ((sideView & 1) == 0)
    {
      [(UIView *)self->_sideView removeFromSuperview];
      objc_storeStrong((id *)&self->_sideView, a3);
      if (v8)
      {
        objc_super v7 = [(MTCollectionViewCell *)self contentView];
        [v7 addSubview:v8];
      }
      sideView = (UIView *)[(MTGenericCollectionCell *)self setNeedsLayout];
      id v5 = v8;
    }
  }

  _objc_release_x1(sideView, v5);
}

- (void)layoutSubviews
{
  v37.receiver = self;
  v37.super_class = (Class)MTGenericCollectionCell;
  [(MTCollectionViewCell *)&v37 layoutSubviews];
  unint64_t v3 = [(MTCollectionViewCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  -[MTGenericCollectionCell artworkFrameForContentViewSize:](self, "artworkFrameForContentViewSize:", v5, v7);
  double v9 = v8;
  double v35 = v10;
  double v36 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v16 = [(MTGenericCollectionCell *)self artworkView];
  [v16 setFrame:v9, v11, v13, v15];

  -[MTGenericCollectionCell sideViewFrameForContentViewSize:](self, "sideViewFrameForContentViewSize:", v5, v7);
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  v25 = [(MTGenericCollectionCell *)self sideView];
  [v25 setFrame:v18, v20, v22, v24];

  -[MTGenericCollectionCell textStackFrameForContentViewSize:artworkFrame:sideViewFrame:](self, "textStackFrameForContentViewSize:artworkFrame:sideViewFrame:", v5, v7, v36, v35, v13, v15, *(void *)&v18, *(void *)&v20, *(void *)&v22, *(void *)&v24);
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  v34 = [(MTGenericCollectionCell *)self textStackView];
  [v34 setFrame:v27, v29, v31, v33];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)MTGenericCollectionCell;
  [(MTCollectionViewCell *)&v3 prepareForReuse];
  if ([(MTGenericCollectionCell *)self showsArtwork]) {
    [(MTGenericCollectionCell *)self setArtworkKey:0];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  [(id)objc_opt_class() heightForWidth:a3.width];
  double v5 = v4;
  double v6 = width;
  result.height = v5;
  result.CGFloat width = v6;
  return result;
}

- (CGRect)artworkFrameForContentViewSize:(CGSize)a3
{
  double width = a3.width;
  [(id)objc_opt_class() artworkSizeForViewWidth:a3.width];
  double v6 = v5;
  double v8 = v7;
  [(MTGenericCollectionCell *)self layoutMargins];
  double v10 = v9;
  if ([(MTGenericCollectionCell *)self mt_isRTL]) {
    double v11 = width - v10 - v6;
  }
  else {
    double v11 = v10;
  }
  IMRoundToPixel();
  double v13 = v12;
  double v14 = v11;
  double v15 = v6;
  double v16 = v8;
  result.size.height = v16;
  result.size.double width = v15;
  result.origin.y = v13;
  result.origin.x = v14;
  return result;
}

- (CGRect)sideViewFrameForContentViewSize:(CGSize)a3
{
  double width = a3.width;
  [(MTGenericCollectionCell *)self layoutMargins];
  double v6 = v5;
  double v7 = [(MTGenericCollectionCell *)self sideView];
  [v7 frame];
  double v9 = v8;
  double v11 = v10;

  IMRoundToPixel();
  double v13 = v12;
  unsigned int v14 = [(MTGenericCollectionCell *)self mt_isRTL];
  double v15 = width - v6 - v9;
  if (v14) {
    double v15 = v6;
  }
  double v16 = v13;
  double v17 = v9;
  double v18 = v11;
  result.size.height = v18;
  result.size.double width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)textStackFrameForContentViewSize:(CGSize)a3 artworkFrame:(CGRect)a4 sideViewFrame:(CGRect)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  -[MTGenericCollectionCell textViewMinXForArtworkFrame:sideViewFrame:](self, "textViewMinXForArtworkFrame:sideViewFrame:", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  double v10 = v9;
  -[MTGenericCollectionCell textViewMaxXForArtworkFrame:sideViewFrame:](self, "textViewMaxXForArtworkFrame:sideViewFrame:", x, y, width, height, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  double v12 = v11 - v10;
  double v13 = [(MTGenericCollectionCell *)self textStackView];
  [v13 sizeThatFits:v12];
  double v15 = v14;

  IMRoundToPixel();
  double v17 = v16;
  double v18 = v10;
  double v19 = v12;
  double v20 = v15;
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.double y = v17;
  result.origin.double x = v18;
  return result;
}

- (double)textViewMinXForArtworkFrame:(CGRect)a3 sideViewFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v8 = a3.size.height;
  double v9 = a3.size.width;
  double v10 = a3.origin.y;
  double v11 = a3.origin.x;
  if (![(MTGenericCollectionCell *)self mt_isRTL])
  {
    double x = v11;
    double y = v10;
    double width = v9;
    double height = v8;
  }
  v16.origin.double x = x;
  v16.origin.double y = y;
  v16.size.double width = width;
  v16.size.double height = height;
  double MaxX = CGRectGetMaxX(v16);
  v17.origin.double x = x;
  v17.origin.double y = y;
  v17.size.double width = width;
  v17.size.double height = height;
  IsEmptdouble y = CGRectIsEmpty(v17);
  double v14 = 10.0;
  if (IsEmpty) {
    double v14 = 0.0;
  }
  return MaxX + v14;
}

- (double)textViewMaxXForArtworkFrame:(CGRect)a3 sideViewFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v8 = a3.size.height;
  double v9 = a3.size.width;
  double v10 = a3.origin.y;
  double v11 = a3.origin.x;
  if ([(MTGenericCollectionCell *)self mt_isRTL])
  {
    double x = v11;
    double y = v10;
    double width = v9;
    double height = v8;
  }
  v16.origin.double x = x;
  v16.origin.double y = y;
  v16.size.double width = width;
  v16.size.double height = height;
  double MinX = CGRectGetMinX(v16);
  v17.origin.double x = x;
  v17.origin.double y = y;
  v17.size.double width = width;
  v17.size.double height = height;
  IsEmptdouble y = CGRectIsEmpty(v17);
  double v14 = 10.0;
  if (IsEmpty) {
    double v14 = 0.0;
  }
  return MinX - v14;
}

- (MTArtworkView)artworkView
{
  artworkView = self->_artworkView;
  if (!artworkView)
  {
    double v4 = (MTArtworkView *)objc_opt_new();
    double v5 = self->_artworkView;
    self->_artworkView = v4;

    artworkView = self->_artworkView;
  }

  return artworkView;
}

- (MTLabelStackView)textStackView
{
  textStackView = self->_textStackView;
  if (!textStackView)
  {
    [(id)objc_opt_class() textStackViewClass];
    double v4 = (MTLabelStackView *)objc_opt_new();
    double v5 = self->_textStackView;
    self->_textStackView = v4;

    textStackView = self->_textStackView;
  }

  return textStackView;
}

- (UIView)sideView
{
  return self->_sideView;
}

- (void)setArtworkView:(id)a3
{
}

- (void)setTextStackView:(id)a3
{
}

- (BOOL)showsArtwork
{
  return self->_showsArtwork;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textStackView, 0);
  objc_storeStrong((id *)&self->_artworkView, 0);

  objc_storeStrong((id *)&self->_sideView, 0);
}

@end