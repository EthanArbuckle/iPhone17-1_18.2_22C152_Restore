@interface MTGenericCell
+ (BOOL)showsArtwork;
+ (CGSize)artworkSizeForViewWidth:(double)a3;
+ (Class)textStackViewClass;
+ (double)heightForWidth:(double)a3;
+ (double)maxHeight;
- (BOOL)_isSideViewHidden;
- (BOOL)hidesSideViewWhenEditing;
- (BOOL)showsArtwork;
- (CGRect)artworkFrameForContentViewSize:(CGSize)a3;
- (CGRect)sideViewFrameForContentViewSize:(CGSize)a3;
- (CGRect)textStackFrameForContentViewSize:(CGSize)a3 artworkFrame:(CGRect)a4 sideViewFrame:(CGRect)a5;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MTArtworkView)artworkView;
- (MTGenericCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (MTLabelStackView)textStackView;
- (NSString)artworkKey;
- (NSString)subtitle;
- (NSString)title;
- (UIView)sideView;
- (double)textViewMaxXForArtworkFrame:(CGRect)a3 sideViewFrame:(CGRect)a4;
- (double)textViewMinXForArtworkFrame:(CGRect)a3 sideViewFrame:(CGRect)a4;
- (void)_setSideViewHidden:(BOOL)a3;
- (void)_updateSideViewHiddenForCurrentState;
- (void)_updateSideViewHiddenForState:(unint64_t)a3;
- (void)configureSubviews;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setArtworkKey:(id)a3;
- (void)setArtworkView:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHidesSideViewWhenEditing:(BOOL)a3;
- (void)setShowsArtwork:(BOOL)a3;
- (void)setSideView:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTextStackView:(id)a3;
- (void)setTitle:(id)a3;
- (void)updateFonts;
- (void)willTransitionToState:(unint64_t)a3;
@end

@implementation MTGenericCell

+ (double)heightForWidth:(double)a3
{
  if ([a1 showsArtwork])
  {
    [a1 artworkSizeForViewWidth:a3];
    return v5 + 13.0 + 13.0;
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

- (MTGenericCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MTGenericCell;
  double v4 = [(MTTableViewCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  double v5 = v4;
  if (v4)
  {
    v4->_hidesSideViewWhenEditing = 1;
    [(MTGenericCell *)v4 configureSubviews];
  }
  return v5;
}

- (NSString)title
{
  v2 = [(MTGenericCell *)self textStackView];
  unint64_t v3 = [v2 title];

  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(MTGenericCell *)self textStackView];
  [v5 setTitle:v4];
}

- (NSString)subtitle
{
  v2 = [(MTGenericCell *)self textStackView];
  unint64_t v3 = [v2 subtitle];

  return (NSString *)v3;
}

- (void)setSubtitle:(id)a3
{
  id v4 = a3;
  id v5 = [(MTGenericCell *)self textStackView];
  [v5 setSubtitle:v4];
}

- (NSString)artworkKey
{
  if ([(MTGenericCell *)self showsArtwork])
  {
    unint64_t v3 = [(MTGenericCell *)self artworkView];
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
  if ([(MTGenericCell *)self showsArtwork])
  {
    id v4 = [(MTGenericCell *)self artworkView];
    [v4 setArtworkKey:v5];
  }
}

- (void)setHidesSideViewWhenEditing:(BOOL)a3
{
  if ([(MTGenericCell *)self hidesSideViewWhenEditing] != a3)
  {
    self->_hidesSideViewWhenEditing = a3;
    [(MTGenericCell *)self _updateSideViewHiddenForCurrentState];
  }
}

- (void)configureSubviews
{
  self->_showsArtwork = [(id)objc_opt_class() showsArtwork];
  if ([(MTGenericCell *)self showsArtwork])
  {
    unint64_t v3 = [(MTGenericCell *)self contentView];
    id v4 = [(MTGenericCell *)self artworkView];
    [v3 addSubview:v4];
  }
  id v5 = [(MTGenericCell *)self contentView];
  double v6 = [(MTGenericCell *)self textStackView];
  [v5 addSubview:v6];

  [(MTGenericCell *)self updateFonts];
  [(MTGenericCell *)self updateColors];

  [(MTGenericCell *)self setNeedsLayout];
}

- (void)updateFonts
{
  unint64_t v3 = [(MTGenericCell *)self textStackView];
  [v3 updateFonts];

  [(MTGenericCell *)self setNeedsLayout];
}

- (void)setShowsArtwork:(BOOL)a3
{
  if (self->_showsArtwork != a3)
  {
    self->_showsArtwork = a3;
    if (a3)
    {
      id v5 = [(MTGenericCell *)self contentView];
      id v4 = [(MTGenericCell *)self artworkView];
      [v5 addSubview:v4];
    }
    else
    {
      id v5 = [(MTGenericCell *)self artworkView];
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
        objc_super v7 = [(MTGenericCell *)self contentView];
        [v7 addSubview:v8];
      }
      sideView = (UIView *)[(MTGenericCell *)self setNeedsLayout];
      id v5 = v8;
    }
  }

  _objc_release_x1(sideView, v5);
}

- (void)layoutSubviews
{
  v40.receiver = self;
  v40.super_class = (Class)MTGenericCell;
  [(MTTableViewCell *)&v40 layoutSubviews];
  unint64_t v3 = [(MTGenericCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  -[MTGenericCell artworkFrameForContentViewSize:](self, "artworkFrameForContentViewSize:", v5, v7);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v16 = [(MTGenericCell *)self artworkView];
  double v38 = v11;
  double v39 = v9;
  [v16 setFrame:v9, v11, v13, v15];

  -[MTGenericCell sideViewFrameForContentViewSize:](self, "sideViewFrameForContentViewSize:", v5, v7);
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  unsigned int v25 = [(MTGenericCell *)self _isSideViewHidden];
  v26 = [(MTGenericCell *)self sideView];
  v27 = v26;
  if (v25)
  {
    double v28 = 0.0;
  }
  else
  {
    [v26 setFrame:v18, v20, v22, v24];

    v26 = [(MTGenericCell *)self sideView];
    v27 = v26;
    double v28 = 1.0;
  }
  [v26 setAlpha:v28];

  -[MTGenericCell textStackFrameForContentViewSize:artworkFrame:sideViewFrame:](self, "textStackFrameForContentViewSize:artworkFrame:sideViewFrame:", v5, v7, v39, v38, v13, v15, *(void *)&v18, *(void *)&v20, *(void *)&v22, *(void *)&v24);
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  v37 = [(MTGenericCell *)self textStackView];
  [v37 setFrame:v30, v32, v34, v36];
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

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)MTGenericCell;
  [(MTTableViewCell *)&v3 prepareForReuse];
  if ([(MTGenericCell *)self showsArtwork]) {
    [(MTGenericCell *)self setArtworkKey:0];
  }
  [(MTGenericCell *)self _updateSideViewHiddenForCurrentState];
  [(MTGenericCell *)self updateFonts];
}

- (void)willTransitionToState:(unint64_t)a3
{
  -[MTGenericCell _updateSideViewHiddenForState:](self, "_updateSideViewHiddenForState:");
  v5.receiver = self;
  v5.super_class = (Class)MTGenericCell;
  [(MTGenericCell *)&v5 willTransitionToState:a3];
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MTGenericCell;
  -[MTTableViewCell setEnabled:](&v7, "setEnabled:");
  [(MTGenericCell *)self setUserInteractionEnabled:v3];
  objc_super v5 = [(MTGenericCell *)self textStackView];
  [v5 setEnabled:v3];

  double v6 = [(MTGenericCell *)self artworkView];
  [v6 setEnabled:v3];
}

- (CGRect)artworkFrameForContentViewSize:(CGSize)a3
{
  double width = a3.width;
  [(id)objc_opt_class() artworkSizeForViewWidth:a3.width];
  double v6 = v5;
  double v8 = v7;
  [(MTGenericCell *)self layoutMargins];
  double v10 = v9;
  if ([(MTGenericCell *)self mt_isRTL]) {
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
  [(MTGenericCell *)self layoutMargins];
  double v6 = v5;
  if ([(MTGenericCell *)self _isSideViewHidden])
  {
    double v7 = CGSizeZero.width;
    CGFloat height = CGSizeZero.height;
  }
  else
  {
    double v9 = [(MTGenericCell *)self sideView];
    [v9 frame];
    double v7 = v10;
    CGFloat height = v11;
  }
  IMRoundToPixel();
  double v13 = v12;
  unsigned int v14 = [(MTGenericCell *)self mt_isRTL];
  double v15 = width - v6 - v7;
  if (v14) {
    double v15 = v6;
  }
  double v16 = v13;
  double v17 = v7;
  double v18 = height;
  result.size.CGFloat height = v18;
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
  -[MTGenericCell textViewMinXForArtworkFrame:sideViewFrame:](self, "textViewMinXForArtworkFrame:sideViewFrame:", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  double v10 = v9;
  -[MTGenericCell textViewMaxXForArtworkFrame:sideViewFrame:](self, "textViewMaxXForArtworkFrame:sideViewFrame:", x, y, width, height, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  double v12 = v11 - v10;
  double v13 = [(MTGenericCell *)self textStackView];
  [v13 sizeThatFits:v12, 1.79769313e308];
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
  if (![(MTGenericCell *)self mt_isRTL])
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
  if ([(MTGenericCell *)self mt_isRTL])
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

- (void)_updateSideViewHiddenForCurrentState
{
  id v3 = [(MTGenericCell *)self currentStateMask];

  [(MTGenericCell *)self _updateSideViewHiddenForState:v3];
}

- (void)_updateSideViewHiddenForState:(unint64_t)a3
{
  BOOL v4 = (a3 & 1) != 0 && [(MTGenericCell *)self hidesSideViewWhenEditing];

  [(MTGenericCell *)self _setSideViewHidden:v4];
}

- (void)_setSideViewHidden:(BOOL)a3
{
  if ([(MTGenericCell *)self _isSideViewHidden] != a3)
  {
    self->_sideViewHidden = a3;
    [(MTGenericCell *)self setNeedsLayout];
  }
}

- (MTArtworkView)artworkView
{
  artworkView = self->_artworkView;
  if (!artworkView)
  {
    BOOL v4 = (MTArtworkView *)objc_opt_new();
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
    BOOL v4 = (MTLabelStackView *)objc_opt_new();
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

- (BOOL)hidesSideViewWhenEditing
{
  return self->_hidesSideViewWhenEditing;
}

- (void)setArtworkView:(id)a3
{
}

- (void)setTextStackView:(id)a3
{
}

- (BOOL)_isSideViewHidden
{
  return self->_sideViewHidden;
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