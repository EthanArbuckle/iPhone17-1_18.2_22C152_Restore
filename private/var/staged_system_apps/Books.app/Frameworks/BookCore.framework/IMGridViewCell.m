@interface IMGridViewCell
+ (CGRect)imageRectForBounds:(CGRect)a3 image:(id)a4 gravity:(int)a5;
+ (CGSize)scaledImageSizeForBounds:(CGRect)a3 image:(id)a4;
+ (id)_jitterPositionAnimation;
+ (id)_jitterTransformAnimation;
- (BOOL)canDelete;
- (BOOL)highlighted;
- (BOOL)ignoreChangesToHidden;
- (BOOL)isAccessibilityElement;
- (BOOL)isEditing;
- (BOOL)isSelected;
- (BOOL)isWorking;
- (BOOL)jiggleWhenEditing;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)showSelectionView;
- (BOOL)useMaskForHighlightView;
- (CGRect)imageRectForBounds:(CGRect)a3;
- (CGRect)selectionFrame;
- (CGRect)titleRectForBounds:(CGRect)a3;
- (CGSize)scaledImageSizeForBounds:(CGRect)a3;
- (IMGridView)gridView;
- (IMGridViewCell)initWithFrame:(CGRect)a3;
- (NSString)reuseIdentifier;
- (NSString)title;
- (UIColor)borderColor;
- (UIEdgeInsets)snapshotEdgeInsets;
- (UIImageView)badgeView;
- (UIImageView)imageView;
- (UIImageView)selectedBadgeView;
- (UILabel)badgeLabel;
- (UILabel)textLabel;
- (UIView)contentView;
- (UIView)selectedWhitewashView;
- (id)_gridView;
- (id)closeBox;
- (id)description;
- (id)highlightView;
- (id)workingView;
- (int)imageGravity;
- (void)_removeCloseBox;
- (void)_removeHighlightView;
- (void)_removeSelectedBadgeView;
- (void)_removeWorkingView;
- (void)dealloc;
- (void)deleteConfirmationControlWasClicked:(id)a3;
- (void)layoutSubviews;
- (void)loadImageView;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)prepareForReuse;
- (void)setBadgeLabel:(id)a3;
- (void)setBadgeLabelNumber:(id)a3;
- (void)setBadgeText:(id)a3;
- (void)setBadgeView:(id)a3;
- (void)setBorderColor:(id)a3;
- (void)setCanDelete:(BOOL)a3;
- (void)setEditing:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setGrabbed:(BOOL)a3;
- (void)setGridView:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setHidesWhitewash:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setIgnoreChangesToHidden:(BOOL)a3;
- (void)setImageGravity:(int)a3;
- (void)setImageView:(id)a3;
- (void)setJiggleWhenEditing:(BOOL)a3;
- (void)setJiggling:(BOOL)a3;
- (void)setReuseIdentifier:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelectedBadgeView:(id)a3;
- (void)setSelectedWhitewashView:(id)a3;
- (void)setShowCloseBox:(BOOL)a3;
- (void)setShowSelectionView:(BOOL)a3;
- (void)setTextLabel:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUseMaskForHighlightView:(BOOL)a3;
- (void)setWorking:(BOOL)a3;
@end

@implementation IMGridViewCell

- (IMGridViewCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)IMGridViewCell;
  v3 = -[IMGridViewCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(IMGridViewCell *)v3 prepareForReuse];
    [(IMGridViewCell *)v4 setHidden:0];
  }
  return v4;
}

- (void)dealloc
{
  [(UIImageView *)self->_imageView removeObserver:self forKeyPath:@"image"];
  self->_showSelectionView = 1;
  v3.receiver = self;
  v3.super_class = (Class)IMGridViewCell;
  [(IMGridViewCell *)&v3 dealloc];
}

- (void)setHidden:(BOOL)a3
{
  if (!self->_ignoreChangesToHidden)
  {
    v3.receiver = self;
    v3.super_class = (Class)IMGridViewCell;
    [(IMGridViewCell *)&v3 setHidden:a3];
  }
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)IMGridViewCell;
  objc_super v3 = [(IMGridViewCell *)&v7 description];
  v4 = [(IMGridViewCell *)self title];
  v5 = +[NSString stringWithFormat:@"%@ Title:%@", v3, v4];

  return v5;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (self->_imageView == a6)
  {
    [(IMGridViewCell *)self setNeedsLayout];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)IMGridViewCell;
    -[IMGridViewCell observeValueForKeyPath:ofObject:change:context:](&v6, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (UIImageView)badgeView
{
  badgeView = self->_badgeView;
  if (!badgeView)
  {
    id v4 = objc_alloc((Class)UIImageView);
    v5 = IMCommonCoreBundle();
    objc_super v6 = [(IMGridViewCell *)self traitCollection];
    objc_super v7 = +[UIImage imageNamed:@"TVBadge" inBundle:v5 compatibleWithTraitCollection:v6];
    v8 = [v7 stretchableImageWithLeftCapWidth:15 topCapHeight:0];
    v9 = (UIImageView *)[v4 initWithImage:v8];
    v10 = self->_badgeView;
    self->_badgeView = v9;

    -[UIImageView setFrame:](self->_badgeView, "setFrame:", 0.0, 0.0, 31.0, 31.0);
    v11 = [(IMGridViewCell *)self contentView];
    [v11 addSubview:self->_badgeView];

    badgeView = self->_badgeView;
  }

  return badgeView;
}

- (UILabel)badgeLabel
{
  badgeLabel = self->_badgeLabel;
  if (!badgeLabel)
  {
    id v4 = [(IMGridViewCell *)self badgeView];
    [v4 bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;

    v13 = [objc_alloc((Class)UILabel) initWithFrame:v6, v8, v10, v12];
    v14 = self->_badgeLabel;
    self->_badgeLabel = v13;

    [(UILabel *)self->_badgeLabel setTextAlignment:1];
    v15 = +[UIFont boldSystemFontOfSize:17.0];
    [(UILabel *)self->_badgeLabel setFont:v15];

    v16 = +[UIColor whiteColor];
    [(UILabel *)self->_badgeLabel setTextColor:v16];

    v17 = +[UIColor clearColor];
    [(UILabel *)self->_badgeLabel setBackgroundColor:v17];

    [(UILabel *)self->_badgeLabel setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)self->_badgeLabel setMinimumScaleFactor:0.47];
    v18 = [(IMGridViewCell *)self badgeView];
    [v18 addSubview:self->_badgeLabel];

    badgeLabel = self->_badgeLabel;
  }

  return badgeLabel;
}

- (void)setBadgeLabelNumber:(id)a3
{
  id v8 = a3;
  if ([v8 intValue])
  {
    id v4 = objc_alloc((Class)NSString);
    double v5 = IMCommonCoreBundle();
    double v6 = [v5 localizedStringForKey:@"%@" value:&stru_2CE418 table:@"BCCommonCoreLocalizable"];
    id v7 = [v4 initWithFormat:v6, v8];
  }
  else
  {
    id v7 = 0;
  }
  [(IMGridViewCell *)self setBadgeText:v7];
}

- (void)setBadgeText:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    double v6 = [(IMGridViewCell *)self badgeLabel];
    [v6 setText:v5];

    [(IMGridViewCell *)self badgeView];
    [(IMGridViewCell *)self setNeedsLayout];
  }
  BOOL v7 = a3 == 0;
  [(UIImageView *)self->_badgeView setHidden:v7];
  badgeLabel = self->_badgeLabel;

  [(UILabel *)badgeLabel setHidden:v7];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  closeBodouble x = self->_closeBox;
  -[UIButton convertPoint:fromView:](closeBox, "convertPoint:fromView:", self, x, y);
  if (-[UIButton pointInside:withEvent:](closeBox, "pointInside:withEvent:", v7))
  {
    BOOL v9 = 1;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)IMGridViewCell;
    BOOL v9 = -[IMGridViewCell pointInside:withEvent:](&v11, "pointInside:withEvent:", v7, x, y);
  }

  return v9;
}

- (UIView)contentView
{
  contentView = self->_contentView;
  if (!contentView)
  {
    id v4 = objc_alloc((Class)UIView);
    [(IMGridViewCell *)self bounds];
    id v5 = [v4 initWithFrame:];
    double v6 = self->_contentView;
    self->_contentView = v5;

    [(UIView *)self->_contentView setAccessibilityIgnoresInvertColors:1];
    [(UIView *)self->_contentView setAutoresizingMask:18];
    [(IMGridViewCell *)self addSubview:self->_contentView];
    contentView = self->_contentView;
  }

  return contentView;
}

- (BOOL)useMaskForHighlightView
{
  return self->_useMaskForHighlightView;
}

- (void)setUseMaskForHighlightView:(BOOL)a3
{
  if ([(IMGridViewCell *)self useMaskForHighlightView] != a3)
  {
    self->_useMaskForHighlightView = a3;
    [(IMGridViewCell *)self _removeHighlightView];
  }
}

- (BOOL)highlighted
{
  return self->_highlighted;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  self->_highlighted = a3;
  -[UIImageView setHighlighted:](self->_imageView, "setHighlighted:");
  if (v3)
  {
    if (self->_showSelectionView)
    {
      id v5 = [(IMGridViewCell *)self highlightView];
      [v5 setHidden:0];
    }
  }
  else
  {
    [(IMGridViewCell *)self _removeHighlightView];
  }

  [(IMGridViewCell *)self setNeedsLayout];
}

- (BOOL)isWorking
{
  return self->_working;
}

- (void)setWorking:(BOOL)a3
{
  self->_working = a3;
  if (a3)
  {
    id v4 = [(IMGridViewCell *)self workingView];
    [v4 startAnimating];
  }
  else
  {
    workingView = self->_workingView;
    if (workingView)
    {
      [(UIActivityIndicatorView *)workingView stopAnimating];
      [(IMGridViewCell *)self _removeWorkingView];
    }
  }

  [(IMGridViewCell *)self setNeedsLayout];
}

- (void)setTitle:(id)a3
{
  if (self->_title != a3)
  {
    id v6 = a3;
    id v4 = (NSString *)[v6 copy];
    title = self->_title;
    self->_title = v4;

    [(UILabel *)self->_textLabel setText:v6];
  }
}

- (UIImageView)imageView
{
  imageView = self->_imageView;
  if (!imageView)
  {
    [(IMGridViewCell *)self loadImageView];
    imageView = self->_imageView;
  }

  return imageView;
}

- (void)loadImageView
{
  BOOL v3 = [objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  imageView = self->_imageView;
  self->_imageView = v3;

  if ([(IMGridViewCell *)self imageGravity] == 1) {
    uint64_t v5 = 4;
  }
  else {
    uint64_t v5 = 1;
  }
  [(UIImageView *)self->_imageView setContentMode:v5];
  [(UIImageView *)self->_imageView setClipsToBounds:0];
  [(UIImageView *)self->_imageView setOpaque:1];
  [(UIImageView *)self->_imageView setClearsContextBeforeDrawing:0];
  id v6 = [(IMGridViewCell *)self contentView];
  [v6 insertSubview:self->_imageView atIndex:0];

  id v7 = self->_imageView;

  [(UIImageView *)v7 addObserver:self forKeyPath:@"image" options:4 context:v7];
}

- (id)highlightView
{
  if (!self->_highlightView)
  {
    if ([(IMGridViewCell *)self useMaskForHighlightView]
      && ([(UIImageView *)self->_imageView image],
          BOOL v3 = objc_claimAutoreleasedReturnValue(),
          v3,
          v3))
    {
      id v4 = [(UIImageView *)self->_imageView image];
      uint64_t v5 = +[UIColor colorWithWhite:0.0 alpha:0.3];
      id v6 = [v4 imageMaskWithColor:v5];

      id v7 = (UIView *)[objc_alloc((Class)UIImageView) initWithImage:v6];
      highlightView = self->_highlightView;
      self->_highlightView = v7;

      if ([(IMGridViewCell *)self imageGravity] == 1) {
        [(UIView *)self->_highlightView setContentMode:[(UIImageView *)self->_imageView contentMode]];
      }
    }
    else
    {
      id v9 = objc_alloc((Class)UIView);
      [(IMGridViewCell *)self selectionFrame];
      double v10 = [v9 initWithFrame:];
      objc_super v11 = self->_highlightView;
      self->_highlightView = v10;

      [(UIView *)self->_highlightView setOpaque:0];
      id v6 = +[UIColor colorWithWhite:0.0 alpha:0.3];
      [(UIView *)self->_highlightView setBackgroundColor:v6];
    }

    double v12 = [(IMGridViewCell *)self contentView];
    [v12 addSubview:self->_highlightView];

    if (self->_badgeView)
    {
      v13 = [(IMGridViewCell *)self contentView];
      v14 = [(IMGridViewCell *)self badgeView];
      [v13 bringSubviewToFront:v14];
    }
  }
  v15 = self->_highlightView;

  return v15;
}

- (id)workingView
{
  workingView = self->_workingView;
  if (!workingView)
  {
    id v4 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
    uint64_t v5 = self->_workingView;
    self->_workingView = v4;

    [(UIActivityIndicatorView *)self->_workingView setHidesWhenStopped:1];
    id v6 = [(IMGridViewCell *)self contentView];
    [v6 addSubview:self->_workingView];

    workingView = self->_workingView;
  }

  return workingView;
}

- (UILabel)textLabel
{
  textLabel = self->_textLabel;
  if (!textLabel)
  {
    id v4 = (UILabel *)objc_alloc_init((Class)UILabel);
    uint64_t v5 = self->_textLabel;
    self->_textLabel = v4;

    [(UILabel *)self->_textLabel setContentMode:2];
    [(UILabel *)self->_textLabel setClipsToBounds:1];
    id v6 = +[UIFont systemFontOfSize:11.0];
    [(UILabel *)self->_textLabel setFont:v6];

    id v7 = +[UIColor clearColor];
    [(UILabel *)self->_textLabel setBackgroundColor:v7];

    [(UILabel *)self->_textLabel setTextAlignment:1];
    id v8 = [(IMGridViewCell *)self title];
    [(UILabel *)self->_textLabel setText:v8];

    id v9 = [(IMGridViewCell *)self contentView];
    [v9 addSubview:self->_textLabel];

    textLabel = self->_textLabel;
  }

  return textLabel;
}

- (void)prepareForReuse
{
  [(IMGridViewCell *)self setHidden:1];
  self->_showSelectionView = 0;
  [(UIImageView *)self->_imageView setImage:0];
  [(UILabel *)self->_textLabel setText:0];
  [(IMGridViewCell *)self setHighlighted:0];
  [(IMGridViewCell *)self setWorking:0];
  [(IMGridViewCell *)self setEditing:0];
  long long v3 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v4[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v4[1] = v3;
  v4[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  [(IMGridViewCell *)self setTransform:v4];
  [(IMGridViewCell *)self setBadgeLabelNumber:0];
  [(IMGridViewCell *)self setSelected:0];
  [(IMGridViewCell *)self _removeSelectedBadgeView];
  [(IMGridViewCell *)self _removeHighlightView];
  [(IMGridViewCell *)self _removeCloseBox];
}

+ (CGSize)scaledImageSizeForBounds:(CGRect)a3 image:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    [v6 size];
    double v10 = v8 / v9;
    double v11 = width / height;
    if (v10 <= width / height)
    {
      if (v10 < width / height)
      {
        float v13 = width * (v10 / v11);
        double width = roundf(v13);
      }
    }
    else
    {
      float v12 = height * (v11 / v10);
      double height = roundf(v12);
    }
  }

  double v14 = width;
  double v15 = height;
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (CGSize)scaledImageSizeForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = objc_opt_class();
  double v9 = [(UIImageView *)self->_imageView image];
  [v8 scaledImageSizeForBounds:v9 image:x, y, width, height];
  double v11 = v10;
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.double height = v15;
  result.double width = v14;
  return result;
}

+ (CGRect)imageRectForBounds:(CGRect)a3 image:(id)a4 gravity:(int)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  [a1 scaledImageSizeForBounds:a4 image:a3.origin.x, a3.origin.y];
  double v10 = CGRectZero.size.width;
  double v11 = CGRectZero.size.height;
  double v12 = ceil((width - v8) * 0.5);
  double y = height - v9;
  double v14 = ceil((height - v9) * 0.5);
  if (a5)
  {
    double y = CGRectZero.origin.y;
    double x = CGRectZero.origin.x;
  }
  else
  {
    double v11 = v9;
    double v10 = v8;
    double x = v12;
  }
  if (a5 == 1) {
    double v16 = v9;
  }
  else {
    double v16 = v11;
  }
  if (a5 == 1) {
    double v17 = v8;
  }
  else {
    double v17 = v10;
  }
  if (a5 == 1) {
    double v18 = v14;
  }
  else {
    double v18 = y;
  }
  if (a5 == 1) {
    double v19 = v12;
  }
  else {
    double v19 = x;
  }
  result.size.double height = v16;
  result.size.double width = v17;
  result.origin.double y = v18;
  result.origin.double x = v19;
  return result;
}

- (CGRect)imageRectForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = objc_opt_class();
  double v9 = [(UIImageView *)self->_imageView image];
  [v8 imageRectForBounds:v9 image:self->_imageGravity x:x y:y width:width height:height];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  double v18 = v11;
  double v19 = v13;
  double v20 = v15;
  double v21 = v17;
  result.size.double height = v21;
  result.size.double width = v20;
  result.origin.double y = v19;
  result.origin.double x = v18;
  return result;
}

- (CGRect)titleRectForBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  -[IMGridViewCell contentRectForBounds:](self, "contentRectForBounds:");
  CGFloat v8 = CGRectGetMaxY(v17) + 5.0;
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  CGFloat v9 = CGRectGetWidth(v18);
  double v10 = [(UILabel *)self->_textLabel font];
  [v10 leading];
  double v12 = ceil(v11);

  double v13 = 0.0;
  double v14 = v8;
  double v15 = v9;
  double v16 = v12;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (void)layoutSubviews
{
  [(IMGridViewCell *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(UILabel *)self->_textLabel text];
  id v12 = [v11 length];

  if (v12)
  {
    -[IMGridViewCell titleRectForBounds:](self, "titleRectForBounds:", v4, v6, v8, v10);
    -[UILabel setFrame:](self->_textLabel, "setFrame:");
  }
  -[IMGridViewCell imageRectForBounds:](self, "imageRectForBounds:", v4, v6, v8, v10);
  CGFloat v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  -[UIImageView setFrame:](self->_imageView, "setFrame:");
  -[IMGridViewCell contentRectForBounds:](self, "contentRectForBounds:", v4, v6, v8, v10);
  double v22 = v21;
  double v24 = v23;
  if (self->_highlightView && self->_showSelectionView)
  {
    [(IMGridViewCell *)self selectionFrame];
    -[UIView setFrame:](self->_highlightView, "setFrame:");
    [(IMGridViewCell *)self bringSubviewToFront:self->_highlightView];
  }
  closeBoCGFloat x = self->_closeBox;
  if (closeBox && (*((unsigned char *)self + 132) & 4) != 0 && (*((unsigned char *)self + 132) & 2) != 0)
  {
    -[UIButton setCenter:](closeBox, "setCenter:", v22 + 1.0, v24 + 1.5);
    [(IMGridViewCell *)self bringSubviewToFront:self->_closeBox];
  }
  if (self->_badgeView)
  {
    v26 = [(IMGridViewCell *)self badgeView];
    [v26 bounds];
    double v28 = v27;
    double v30 = v29;

    v71.origin.CGFloat x = v14;
    v71.origin.CGFloat y = v16;
    v71.size.CGFloat width = v18;
    v71.size.CGFloat height = v20;
    -[UIImageView setFrame:](self->_badgeView, "setFrame:", CGRectGetMaxX(v71) - round(v28) + 10.0, v16 - round(v30 * 0.5) + 4.0, v28, v30);
    v31 = +[UIScreen mainScreen];
    [v31 scale];
    double v33 = v32;

    [(UIImageView *)self->_badgeView bounds];
    if (v33 <= 1.0) {
      *(CGRect *)&double v34 = CGRectOffset(*(CGRect *)&v34, 0.0, -1.0);
    }
    -[UILabel setFrame:](self->_badgeLabel, "setFrame:", v34, v35, v36, v37);
    v38 = [(IMGridViewCell *)self contentView];
    v39 = [(IMGridViewCell *)self badgeView];
    [v38 bringSubviewToFront:v39];
  }
  if ([(IMGridViewCell *)self isSelected])
  {
    if ((*((unsigned char *)self + 132) & 0x20) == 0)
    {
      imageView = self->_imageView;
      if (imageView)
      {
        [(UIImageView *)imageView frame];
        double v42 = v41;
        double v44 = v43;
        double v46 = v45;
        double v48 = v47;
        v49 = [(IMGridViewCell *)self selectedWhitewashView];
        [v49 setFrame:v42, v44, v46, v48];

        v50 = [(IMGridViewCell *)self contentView];
        v51 = [(IMGridViewCell *)self selectedWhitewashView];
        [v50 addSubview:v51];
      }
    }
    v52 = [(IMGridViewCell *)self selectedBadgeView];
    [v52 bounds];
    double v54 = v53;
    double v56 = v55;

    v72.origin.CGFloat x = v14;
    v72.origin.CGFloat y = v16;
    v72.size.CGFloat width = v18;
    v72.size.CGFloat height = v20;
    CGFloat v57 = CGRectGetMaxX(v72) - v54 + -3.0;
    v73.origin.CGFloat x = v14;
    v73.origin.CGFloat y = v16;
    v73.size.CGFloat width = v18;
    v73.size.CGFloat height = v20;
    CGFloat v58 = CGRectGetMaxY(v73) - v56 + -2.0;
    v59 = [(IMGridViewCell *)self selectedBadgeView];
    [v59 setFrame:v57, v58, v54, v56];

    v60 = [(IMGridViewCell *)self contentView];
    v61 = [(IMGridViewCell *)self selectedBadgeView];
    [v60 bringSubviewToFront:v61];
  }
  if ([(IMGridViewCell *)self isWorking])
  {
    v62 = [(IMGridViewCell *)self workingView];
    [v62 bounds];
    double v64 = v63;
    double v66 = v65;

    v74.origin.CGFloat x = v14;
    v74.origin.CGFloat y = v16;
    v74.size.CGFloat width = v18;
    v74.size.CGFloat height = v20;
    CGFloat v67 = CGRectGetMaxY(v74) - round(v20 * 0.5) - round(v66 * 0.5);
    v75.origin.CGFloat x = v14;
    v75.origin.CGFloat y = v16;
    v75.size.CGFloat width = v18;
    v75.size.CGFloat height = v20;
    -[UIActivityIndicatorView setFrame:](self->_workingView, "setFrame:", CGRectGetMaxX(v75) - round(v18 * 0.5) - round(v64 * 0.5), v67, v64, v66);
    [(UIActivityIndicatorView *)self->_workingView startAnimating];
    workingView = self->_workingView;
    [(IMGridViewCell *)self bringSubviewToFront:workingView];
  }
  else
  {
    v69 = self->_workingView;
    [(UIActivityIndicatorView *)v69 stopAnimating];
  }
}

- (CGRect)selectionFrame
{
  [(IMGridViewCell *)self bounds];

  -[IMGridViewCell contentRectForBounds:](self, "contentRectForBounds:");
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (id)_gridView
{
  v2 = [(IMGridViewCell *)self superview];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    double v3 = v2;
  }
  else {
    double v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (void)setGrabbed:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 132);
  if (((((v3 & 1) == 0) ^ a3) & 1) == 0)
  {
    *((unsigned char *)self + 132) = v3 & 0xFE | a3;
    highlightView = self->_highlightView;
    double v5 = 1.0;
    if (a3) {
      double v5 = 0.0;
    }
    [(UIView *)highlightView setAlpha:v5];
  }
}

- (BOOL)isEditing
{
  return (*((unsigned __int8 *)self + 132) >> 1) & 1;
}

- (void)setEditing:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 132);
  if (((((v3 & 2) == 0) ^ a3) & 1) == 0)
  {
    BOOL v4 = a3;
    if ((*((unsigned char *)self + 132) & 1) == 0 || !a3)
    {
      if (a3) {
        char v6 = 2;
      }
      else {
        char v6 = 0;
      }
      *((unsigned char *)self + 132) = v3 & 0xFD | v6;
      unsigned int v7 = *((unsigned __int8 *)self + 132);
      uint64_t v8 = (v7 >> 2) & 1;
      if ((v7 & 4) != 0 && !v4) {
        uint64_t v8 = *((unsigned char *)self + 132) & 1;
      }
      [(IMGridViewCell *)self setShowCloseBox:v8];
      if (v4) {
        [(IMGridViewCell *)self setHighlighted:0];
      }
      [(IMGridViewCell *)self setJiggling:[(IMGridViewCell *)self jiggleWhenEditing] & v4];
      [(IMGridViewCell *)self setNeedsLayout];
    }
  }
}

- (BOOL)canDelete
{
  return (*((unsigned __int8 *)self + 132) >> 2) & 1;
}

- (void)setCanDelete:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 132);
  if (((((v3 & 4) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v4 = 4;
    }
    else {
      char v4 = 0;
    }
    *((unsigned char *)self + 132) = v3 & 0xFB | v4;
    if ((*((unsigned char *)self + 132) & 2) != 0) {
      -[IMGridViewCell setShowCloseBox:](self, "setShowCloseBox:");
    }
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  [(IMGridViewCell *)self transform];
  if ((*((unsigned char *)self + 132) & 1) == 0)
  {
    long long v8 = *(_OWORD *)&CGAffineTransformIdentity.c;
    long long v13 = *(_OWORD *)&CGAffineTransformIdentity.a;
    long long v14 = v8;
    long long v15 = *(_OWORD *)&CGAffineTransformIdentity.tx;
    [(IMGridViewCell *)self setTransform:&v13];
  }
  v12.receiver = self;
  v12.super_class = (Class)IMGridViewCell;
  -[IMGridViewCell setFrame:](&v12, "setFrame:", x, y, width, height);
  if ((*((unsigned char *)self + 132) & 1) == 0)
  {
    double v9 = [(IMGridViewCell *)self layer];
    [v9 position];
    self->_unjitterPoint.double x = v10;
    self->_unjitterPoint.double y = v11;

    long long v13 = v16;
    long long v14 = v17;
    long long v15 = v18;
    [(IMGridViewCell *)self setTransform:&v13];
  }
}

- (void)setHidesWhitewash:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 132) = *((unsigned char *)self + 132) & 0xDF | v3;
}

- (BOOL)isSelected
{
  return (*((unsigned __int8 *)self + 132) >> 4) & 1;
}

- (void)setSelected:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 132);
  if (((((v3 & 0x10) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v6 = 16;
    }
    else {
      char v6 = 0;
    }
    *((unsigned char *)self + 132) = v3 & 0xEF | v6;
    if ([(IMGridViewCell *)self highlighted] && !a3) {
      [(IMGridViewCell *)self setHighlighted:0];
    }
    if (![(IMGridViewCell *)self isSelected]) {
      [(IMGridViewCell *)self _removeSelectedBadgeView];
    }
    [(IMGridViewCell *)self setNeedsLayout];
  }
}

- (UIView)selectedWhitewashView
{
  selectedWhitewashView = self->_selectedWhitewashView;
  if (!selectedWhitewashView)
  {
    char v4 = [(UIView *)objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    double v5 = self->_selectedWhitewashView;
    self->_selectedWhitewashView = v4;

    char v6 = +[UIColor colorWithWhite:1.0 alpha:0.5];
    [(UIView *)self->_selectedWhitewashView setBackgroundColor:v6];

    [(UIView *)self->_selectedWhitewashView setOpaque:0];
    selectedWhitewashView = self->_selectedWhitewashView;
  }

  return selectedWhitewashView;
}

- (UIImageView)selectedBadgeView
{
  selectedBadgeView = self->_selectedBadgeView;
  if (!selectedBadgeView)
  {
    char v4 = IMCommonCoreBundle();
    double v5 = [(IMGridViewCell *)self traitCollection];
    char v6 = +[UIImage imageNamed:@"blue_circle_checkmark" inBundle:v4 compatibleWithTraitCollection:v5];

    unsigned int v7 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:v6];
    long long v8 = self->_selectedBadgeView;
    self->_selectedBadgeView = v7;

    -[UIImageView setFrame:](self->_selectedBadgeView, "setFrame:", 0.0, 0.0, 29.0, 29.0);
    double v9 = [(IMGridViewCell *)self contentView];
    [v9 addSubview:self->_selectedBadgeView];

    selectedBadgeView = self->_selectedBadgeView;
  }

  return selectedBadgeView;
}

- (BOOL)jiggleWhenEditing
{
  return (*((unsigned __int8 *)self + 132) >> 3) & 1;
}

- (void)setJiggleWhenEditing:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 132);
  if (((((v3 & 8) == 0) ^ a3) & 1) == 0)
  {
    BOOL v5 = 0;
    if (a3) {
      char v6 = 8;
    }
    else {
      char v6 = 0;
    }
    *((unsigned char *)self + 132) = v3 & 0xF7 | v6;
    if (a3) {
      BOOL v5 = [(IMGridViewCell *)self isEditing];
    }
    [(IMGridViewCell *)self setJiggling:v5];
  }
}

- (void)setJiggling:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(IMGridViewCell *)self layer];
  uint64_t v14 = [v5 animationForKey:@"JitterPosition"];

  char v6 = [(IMGridViewCell *)self layer];
  uint64_t v7 = [v6 animationForKey:@"JitterTransform"];

  if (v3)
  {
    if (v14)
    {
      if (v7) {
        goto LABEL_10;
      }
    }
    else
    {
      CGFloat v11 = [(IMGridViewCell *)self layer];
      objc_super v12 = [(id)objc_opt_class() _jitterPositionAnimation];
      [v11 addAnimation:v12 forKey:@"JitterPosition"];

      if (v7) {
        goto LABEL_10;
      }
    }
    CGFloat v10 = [(IMGridViewCell *)self layer];
    long long v13 = [(id)objc_opt_class() _jitterTransformAnimation];
    [v10 addAnimation:v13 forKey:@"JitterTransform"];
  }
  else
  {
    if (!(v14 | v7)) {
      goto LABEL_10;
    }
    long long v8 = [(IMGridViewCell *)self layer];
    [v8 removeAnimationForKey:@"JitterPosition"];

    double v9 = [(IMGridViewCell *)self layer];
    [v9 removeAnimationForKey:@"JitterTransform"];

    CGFloat v10 = [(IMGridViewCell *)self layer];
    [v10 setPosition:self->_unjitterPoint.x, self->_unjitterPoint.y];
  }

LABEL_10:
}

+ (id)_jitterPositionAnimation
{
  v2 = +[CAKeyframeAnimation animation];
  [v2 setKeyPath:@"position"];
  [v2 setDuration:0.25];
  [v2 setAdditive:1];
  LODWORD(v3) = 2139095039;
  [v2 setRepeatCount:v3];
  id v4 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v5 = random();
  float v6 = ((double)(v5 % 1000) / 1000.0 + (double)(v5 % 1000) / 1000.0) * 0.25 + -0.25;
  double v7 = floorf(v6);
  uint64_t v8 = random();
  float v9 = ((double)(v8 % 1000) / 1000.0 + (double)(v8 % 1000) / 1000.0) * 0.25 + -0.25;
  CGFloat v10 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v7, floorf(v9));
  [v4 addObject:v10];
  uint64_t v11 = random();
  float v12 = ((double)(v11 % 1000) / 1000.0 + (double)(v11 % 1000) / 1000.0) * 0.25 + -0.25;
  double v13 = floorf(v12);
  uint64_t v14 = random();
  float v15 = ((double)(v14 % 1000) / 1000.0 + (double)(v14 % 1000) / 1000.0) * 0.25 + -0.25;
  long long v16 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v13, floorf(v15));
  [v4 addObject:v16];

  uint64_t v17 = random();
  float v18 = ((double)(v17 % 1000) / 1000.0 + (double)(v17 % 1000) / 1000.0) * 0.25 + -0.25;
  double v19 = floorf(v18);
  uint64_t v20 = random();
  float v21 = ((double)(v20 % 1000) / 1000.0 + (double)(v20 % 1000) / 1000.0) * 0.25 + -0.25;
  double v22 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v19, floorf(v21));
  [v4 addObject:v22];

  uint64_t v23 = random();
  float v24 = ((double)(v23 % 1000) / 1000.0 + (double)(v23 % 1000) / 1000.0) * 0.25 + -0.25;
  double v25 = floorf(v24);
  uint64_t v26 = random();
  float v27 = ((double)(v26 % 1000) / 1000.0 + (double)(v26 % 1000) / 1000.0) * 0.25 + -0.25;
  double v28 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v25, floorf(v27));
  [v4 addObject:v28];

  [v4 addObject:v10];
  id v29 = objc_alloc((Class)NSNumber);
  LODWORD(v30) = 1028443341;
  id v31 = [v29 initWithFloat:v30];
  id v32 = [objc_alloc((Class)NSMutableArray) initWithObjects:v31, v31, v31, v31, v31, v31, 0];
  [v2 setBeginTime:ceilf((float)(random() % 1000 + 1) * 0.2) * 0.05];
  [v2 setValues:v4];
  [v2 setKeyTimes:v32];

  return v2;
}

+ (id)_jitterTransformAnimation
{
  v2 = +[CAKeyframeAnimation animation];
  [v2 setKeyPath:@"transform"];
  [v2 setDuration:0.25];
  double v3 = +[CAValueFunction functionWithName:kCAValueFunctionRotateZ];
  [v2 setValueFunction:v3];

  [v2 setAdditive:1];
  LODWORD(v4) = 2139095039;
  [v2 setRepeatCount:v4];
  id v5 = objc_alloc_init((Class)NSMutableArray);
  LODWORD(v6) = -1129606490;
  double v7 = +[NSNumber numberWithFloat:v6];
  [v5 addObject:v7];

  LODWORD(v8) = 1017877158;
  float v9 = +[NSNumber numberWithFloat:v8];
  [v5 addObject:v9];

  LODWORD(v10) = -1129606490;
  uint64_t v11 = +[NSNumber numberWithFloat:v10];
  [v5 addObject:v11];

  id v12 = objc_alloc((Class)NSNumber);
  LODWORD(v13) = 1028443341;
  id v14 = [v12 initWithFloat:v13];
  id v15 = [objc_alloc((Class)NSMutableArray) initWithObjects:v14, v14, v14, nil];
  [v2 setBeginTime:ceilf((float)(random() % 1000 + 1) * 0.2) * 0.05];
  [v2 setValues:v5];
  [v2 setKeyTimes:v15];

  return v2;
}

- (void)deleteConfirmationControlWasClicked:(id)a3
{
  id v4 = [(IMGridViewCell *)self _gridView];
  [v4 animateDeletionOfCell:self];
}

- (id)closeBox
{
  closeBodouble x = self->_closeBox;
  if (!closeBox)
  {
    id v4 = +[UIImage imageNamed:@"closebox"];
    id v5 = +[UIButton buttonWithType:0];
    double v6 = self->_closeBox;
    self->_closeBodouble x = v5;

    [(UIButton *)self->_closeBox setImage:v4 forState:0];
    [(UIButton *)self->_closeBox sizeToFit];
    [(UIButton *)self->_closeBox setAlpha:0.0];
    [(UIButton *)self->_closeBox addTarget:self action:"deleteConfirmationControlWasClicked:" forControlEvents:64];
    double v7 = [(IMGridViewCell *)self contentView];
    [v7 addSubview:self->_closeBox];

    closeBodouble x = self->_closeBox;
  }

  return closeBox;
}

- (void)_removeSelectedBadgeView
{
  [(UIImageView *)self->_selectedBadgeView removeFromSuperview];
  selectedBadgeView = self->_selectedBadgeView;
  self->_selectedBadgeView = 0;

  [(UIView *)self->_selectedWhitewashView removeFromSuperview];
  selectedWhitewashView = self->_selectedWhitewashView;
  self->_selectedWhitewashView = 0;
}

- (void)_removeHighlightView
{
  [(UIView *)self->_highlightView removeFromSuperview];
  highlightView = self->_highlightView;
  self->_highlightView = 0;
}

- (void)_removeWorkingView
{
  workingView = self->_workingView;
  if (workingView)
  {
    [(UIActivityIndicatorView *)workingView removeFromSuperview];
    id v4 = self->_workingView;
    self->_workingView = 0;
  }
}

- (void)_removeCloseBox
{
  [(UIButton *)self->_closeBox removeFromSuperview];
  closeBodouble x = self->_closeBox;
  self->_closeBodouble x = 0;
}

- (void)setShowCloseBox:(BOOL)a3
{
  if (a3)
  {
    id v4 = [(IMGridViewCell *)self closeBox];
  }
  else
  {
    id v4 = self->_closeBox;
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_C4C7C;
  v6[3] = &unk_2C5308;
  double v7 = v4;
  BOOL v8 = a3;
  id v5 = v4;
  +[UIView animateWithDuration:v6 animations:0 completion:0.2];
}

- (UIEdgeInsets)snapshotEdgeInsets
{
  [(IMGridViewCell *)self bounds];
  CGFloat x = v3;
  CGFloat y = v5;
  CGFloat width = v7;
  CGFloat v10 = v9;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v11 = [(IMGridViewCell *)self subviews];
  id v12 = [v11 countByEnumeratingWithState:&v35 objects:v39 count:16];
  CGFloat v32 = y;
  CGFloat v33 = x;
  CGFloat rect1 = width;
  CGFloat height = v10;
  if (v12)
  {
    id v14 = v12;
    uint64_t v15 = *(void *)v36;
    CGFloat height = v10;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v36 != v15) {
          objc_enumerationMutation(v11);
        }
        [*(id *)(*((void *)&v35 + 1) + 8 * i) frame];
        v52.origin.CGFloat x = v17;
        v52.origin.CGFloat y = v18;
        v52.size.CGFloat width = v19;
        v52.size.CGFloat height = v20;
        v40.origin.CGFloat x = x;
        v40.origin.CGFloat y = y;
        v40.size.CGFloat width = width;
        v40.size.CGFloat height = height;
        CGRect v41 = CGRectUnion(v40, v52);
        CGFloat x = v41.origin.x;
        CGFloat y = v41.origin.y;
        CGFloat width = v41.size.width;
        CGFloat height = v41.size.height;
      }
      id v14 = [v11 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v14);
  }

  v42.origin.CGFloat y = v32;
  v42.origin.CGFloat x = v33;
  v42.size.CGFloat width = rect1;
  v42.size.CGFloat height = v10;
  v53.origin.CGFloat x = x;
  v53.origin.CGFloat y = y;
  v53.size.CGFloat width = width;
  v53.size.CGFloat height = height;
  if (CGRectEqualToRect(v42, v53))
  {
    double top = UIEdgeInsetsZero.top;
    double left = UIEdgeInsetsZero.left;
    double bottom = UIEdgeInsetsZero.bottom;
    double right = UIEdgeInsetsZero.right;
  }
  else
  {
    v43.origin.CGFloat x = x;
    v43.origin.CGFloat y = y;
    v43.size.CGFloat width = width;
    v43.size.CGFloat height = height;
    double MinY = CGRectGetMinY(v43);
    v44.origin.CGFloat x = v33;
    v44.origin.CGFloat y = v32;
    v44.size.CGFloat width = rect1;
    v44.size.CGFloat height = v10;
    double v31 = MinY - CGRectGetMinY(v44);
    v45.origin.CGFloat x = x;
    v45.origin.CGFloat y = y;
    v45.size.CGFloat width = width;
    v45.size.CGFloat height = height;
    double MinX = CGRectGetMinX(v45);
    v46.origin.CGFloat x = v33;
    v46.origin.CGFloat y = v32;
    v46.size.CGFloat width = rect1;
    v46.size.CGFloat height = v10;
    double v29 = MinX - CGRectGetMinX(v46);
    v47.origin.CGFloat x = v33;
    v47.origin.CGFloat y = v32;
    v47.size.CGFloat width = rect1;
    v47.size.CGFloat height = v10;
    double MaxY = CGRectGetMaxY(v47);
    v48.origin.CGFloat x = x;
    v48.origin.CGFloat y = y;
    v48.size.CGFloat width = width;
    v48.size.CGFloat height = height;
    double bottom = MaxY - CGRectGetMaxY(v48);
    v49.origin.CGFloat x = v33;
    v49.origin.CGFloat y = v32;
    v49.size.CGFloat width = rect1;
    v49.size.CGFloat height = v10;
    double MaxX = CGRectGetMaxX(v49);
    v50.origin.CGFloat x = x;
    v50.origin.CGFloat y = y;
    v50.size.CGFloat width = width;
    v50.size.CGFloat height = height;
    double right = MaxX - CGRectGetMaxX(v50);
    double left = v29;
    double top = v31;
  }
  double v27 = bottom;
  result.double right = right;
  result.double bottom = v27;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (int)imageGravity
{
  return self->_imageGravity;
}

- (void)setImageGravity:(int)a3
{
  self->_imageGravitCGFloat y = a3;
}

- (void)setBadgeView:(id)a3
{
}

- (void)setBadgeLabel:(id)a3
{
}

- (BOOL)showSelectionView
{
  return self->_showSelectionView;
}

- (void)setShowSelectionView:(BOOL)a3
{
  self->_showSelectionView = a3;
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (void)setBorderColor:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setImageView:(id)a3
{
}

- (void)setTextLabel:(id)a3
{
}

- (void)setSelectedWhitewashView:(id)a3
{
}

- (void)setSelectedBadgeView:(id)a3
{
}

- (IMGridView)gridView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_gridView);

  return (IMGridView *)WeakRetained;
}

- (void)setGridView:(id)a3
{
}

- (NSString)reuseIdentifier
{
  return self->_reuseIdentifier;
}

- (void)setReuseIdentifier:(id)a3
{
}

- (BOOL)ignoreChangesToHidden
{
  return self->_ignoreChangesToHidden;
}

- (void)setIgnoreChangesToHidden:(BOOL)a3
{
  self->_ignoreChangesToHidden = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reuseIdentifier, 0);
  objc_destroyWeak((id *)&self->_gridView);
  objc_storeStrong((id *)&self->_borderColor, 0);
  objc_storeStrong((id *)&self->_selectedBadgeView, 0);
  objc_storeStrong((id *)&self->_selectedWhitewashView, 0);
  objc_storeStrong((id *)&self->_badgeLabel, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_closeBox, 0);
  objc_storeStrong((id *)&self->_workingView, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);

  objc_storeStrong((id *)&self->_contentView, 0);
}

@end