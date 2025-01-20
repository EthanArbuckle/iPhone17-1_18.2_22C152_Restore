@interface BKTOCTableViewCell
+ (CGRect)pageLabelFrameForString:(id)a3 font:(id)a4 bounds:(CGRect)a5 layoutDirection:(int64_t)a6;
+ (CGRect)pageLabelFrameForString:(id)a3 font:(id)a4 bounds:(CGRect)a5 topMargin:(double)a6 layoutDirection:(int64_t)a7;
+ (CGSize)sizeForText:(id)a3 indentation:(int64_t)a4 font:(id)a5 width:(double)a6;
+ (CGSize)titleSizeForText:(id)a3 indentation:(int64_t)a4 font:(id)a5 width:(double)a6;
+ (double)cellHeightForCellWidth:(double)a3 pageLabelWidth:(double)a4 text:(id)a5 indentationLevel:(unint64_t)a6 indentationWidth:(double)a7 font:(id)a8 usesPopoverStyle:(BOOL)a9;
+ (double)maxSpanForTextWithIndentation:(int64_t)a3 font:(id)a4 width:(double)a5;
+ (id)tocWebTemplate;
- (BKTOCTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (BOOL)bkaxIsExcludedFromSample;
- (BOOL)isVertical;
- (BOOL)usesPopoverStyle;
- (NSString)cacheKey;
- (NSString)selectedCacheKey;
- (UIEdgeInsets)contentInsets;
- (UILabel)pageLabel;
- (UIView)highlightedBackgroundView;
- (id)makeSelectedBackgroundView;
- (void)_adjustLabelTextAlignment;
- (void)_setHighlightedPopoverAppearance:(BOOL)a3;
- (void)_setSelectedBackgroundViewFrame:(CGRect)a3;
- (void)_syncVerticalLabel;
- (void)configureFocusRing;
- (void)configureSelectedBackgroundView;
- (void)dealloc;
- (void)displayHTMLWithContents:(id)a3 fontFamily:(id)a4 fontSize:(double)a5 maxSpan:(double)a6 baseURL:(id)a7;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setBkaxIsExcludedFromSample:(BOOL)a3;
- (void)setCacheKey:(id)a3;
- (void)setContentInsets:(UIEdgeInsets)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setHighlightedBackgroundView:(id)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setSelectedCacheKey:(id)a3;
- (void)setUsesPopoverStyle:(BOOL)a3;
- (void)setVertical:(BOOL)a3;
- (void)setupSelectedBackgroundNil;
@end

@implementation BKTOCTableViewCell

+ (id)tocWebTemplate
{
  if (qword_22B620 != -1) {
    dispatch_once(&qword_22B620, &stru_1DD160);
  }
  v2 = (void *)qword_22B618;

  return v2;
}

- (BKTOCTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)BKTOCTableViewCell;
  v4 = [(BKTOCTableViewCell *)&v11 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(BKTOCTableViewCell *)v4 textLabel];
    [v6 setHighlightedTextColor:0];

    v7 = [(BKTOCTableViewCell *)v5 textLabel];
    [v7 setNumberOfLines:0];

    v8 = [(BKTOCTableViewCell *)v5 textLabel];
    [v8 setContentMode:5];

    v9 = [(BKTOCTableViewCell *)v5 textLabel];
    [v9 setOpaque:0];
  }
  return v5;
}

- (void)dealloc
{
  cacheKey = self->_cacheKey;
  self->_cacheKey = 0;

  selectedCacheKey = self->_selectedCacheKey;
  self->_selectedCacheKey = 0;

  v5.receiver = self;
  v5.super_class = (Class)BKTOCTableViewCell;
  [(BKTOCTableViewCell *)&v5 dealloc];
}

+ (CGRect)pageLabelFrameForString:(id)a3 font:(id)a4 bounds:(CGRect)a5 layoutDirection:(int64_t)a6
{
  [a1 pageLabelFrameForString:a3 font:a4 bounds:a6 topMargin:a5.origin.x layoutDirection:a5.origin.y width:a5.size.width height:a5.size.height];
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

+ (CGRect)pageLabelFrameForString:(id)a3 font:(id)a4 bounds:(CGRect)a5 topMargin:(double)a6 layoutDirection:(int64_t)a7
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  v13 = (__CFString *)a3;
  id v14 = a4;
  CGFloat v15 = CGRectZero.origin.y;
  if (![(__CFString *)v13 length])
  {

    v13 = @" ";
  }
  +[UILabel bkSizeForString:v13 font:v14];
  v32.size.CGFloat width = v16;
  CGFloat v18 = v17;
  v32.origin.CGFloat x = CGRectZero.origin.x;
  v32.origin.CGFloat y = v15;
  v32.size.CGFloat height = v18;
  double v19 = ceil(CGRectGetWidth(v32));
  v33.origin.CGFloat x = CGRectZero.origin.x;
  v33.origin.CGFloat y = v15;
  v33.size.CGFloat width = v19;
  v33.size.CGFloat height = v18;
  double v20 = ceil(CGRectGetHeight(v33));
  CGFloat v21 = x;
  CGFloat v22 = y;
  CGFloat v23 = width;
  CGFloat v24 = height;
  if (a7 == 1)
  {
    double MinX = CGRectGetMinX(*(CGRect *)&v21);
  }
  else
  {
    double MaxX = CGRectGetMaxX(*(CGRect *)&v21);
    v34.origin.CGFloat x = CGRectZero.origin.x;
    v34.origin.CGFloat y = v15;
    v34.size.CGFloat width = v19;
    v34.size.CGFloat height = v20;
    double MinX = MaxX - CGRectGetWidth(v34);
  }

  double v27 = MinX;
  double v28 = a6;
  double v29 = v19;
  double v30 = v20;
  result.size.CGFloat height = v30;
  result.size.CGFloat width = v29;
  result.origin.CGFloat y = v28;
  result.origin.CGFloat x = v27;
  return result;
}

+ (double)cellHeightForCellWidth:(double)a3 pageLabelWidth:(double)a4 text:(id)a5 indentationLevel:(unint64_t)a6 indentationWidth:(double)a7 font:(id)a8 usesPopoverStyle:(BOOL)a9
{
  BOOL v9 = a9;
  double v11 = (double)a6 * a7;
  double v12 = a4 + 20.0;
  BOOL v13 = a4 == 0.0;
  double v14 = 0.0;
  if (!v13) {
    double v14 = v12;
  }
  double v15 = a3 - v14 - v11;
  NSAttributedStringKey v23 = NSFontAttributeName;
  id v24 = a8;
  id v16 = a8;
  id v17 = a5;
  CGFloat v18 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];

  [v17 boundingRectWithSize:1 options:v18 attributes:0 context:v15];
  double v20 = v19;

  if (v9) {
    double v21 = 16.0;
  }
  else {
    double v21 = 28.0;
  }

  return v21 + ceil(v20);
}

- (void)layoutSubviews
{
  *(void *)&recta.size.CGFloat height = self;
  v94 = BKTOCTableViewCell;
  [(CGFloat *)(objc_super *)&recta.size.height layoutSubviews];
  unsigned int v3 = [(BKTOCTableViewCell *)self isVertical];
  uint64_t v4 = self->_vertical | self->_hasHTMLTitle;
  objc_super v5 = [(BKTOCTableViewCell *)self textLabel];
  [v5 setHidden:v4];

  [(BKVerticalLabel *)self->_verticalLabel setHidden:!self->_vertical];
  double v6 = [(BKTOCTableViewCell *)self contentView];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  [(BKTOCTableViewCell *)self contentInsets];
  double v16 = v8 + v15;
  double v18 = v10 + v17;
  double v20 = v12 - (v15 + v19);
  double v22 = v14 - (v17 + v21);

  NSAttributedStringKey v23 = [(BKTOCTableViewCell *)self pageLabel];
  [v23 sizeToFit];

  [(UILabel *)self->_pageLabel frame];
  CGFloat v28 = v25;
  double v29 = v26;
  double v30 = v27;
  recta.origin.CGFloat y = v20;
  recta.size.CGFloat width = v22;
  if (v3)
  {
    double v92 = v26;
    double Height = CGRectGetHeight(*(CGRect *)&v24);
    v95.origin.double x = v16;
    v95.origin.CGFloat y = v18;
    v95.size.CGFloat width = v20;
    v95.size.CGFloat height = v22;
    CGFloat v32 = v16;
    CGFloat v33 = v18;
    CGFloat v34 = v20;
    recta.origin.double x = Height;
    if (Height > CGRectGetHeight(v95) + -4.0)
    {
      [(UILabel *)self->_pageLabel setAdjustsFontSizeToFitWidth:1];
      [(UILabel *)self->_pageLabel setMinimumScaleFactor:0.5];
      v96.origin.double x = v32;
      v96.origin.CGFloat y = v33;
      v96.size.CGFloat width = v20;
      v96.size.CGFloat height = v22;
      double v30 = CGRectGetHeight(v96) + -4.0;
      recta.origin.double x = v30;
    }
    BOOL v35 = [(BKTOCTableViewCell *)self effectiveUserInterfaceLayoutDirection] == (char *)&dword_0 + 1;
    v97.origin.double x = v32;
    v97.origin.CGFloat y = v33;
    v97.size.CGFloat width = v20;
    v97.size.CGFloat height = v22;
    double MinX = CGRectGetMinX(v97);
    v98.origin.double x = v32;
    v98.origin.CGFloat y = v33;
    v98.size.CGFloat width = v34;
    v98.size.CGFloat height = v22;
    double v37 = CGRectGetHeight(v98);
    v99.origin.double x = MinX;
    v99.origin.CGFloat y = v28;
    double v29 = v91;
    v99.size.CGFloat width = v91;
    v99.size.CGFloat height = v30;
    double v38 = floor((v37 - CGRectGetHeight(v99)) * 0.5);
    double v18 = v33;
    double v16 = v32;
    double x = recta.origin.x;
  }
  else
  {
    double x = CGRectGetWidth(*(CGRect *)&v24);
    v40 = (char *)[(BKTOCTableViewCell *)self effectiveUserInterfaceLayoutDirection];
    BOOL v35 = v40 == (unsigned char *)&dword_0 + 1;
    double v41 = v16;
    double v42 = v18;
    double v43 = v20;
    double v44 = v22;
    if (v40 == (unsigned char *)&dword_0 + 1) {
      double MinX = CGRectGetMinX(*(CGRect *)&v41);
    }
    else {
      double MinX = CGRectGetMaxX(*(CGRect *)&v41) - (x + 8.0);
    }
    if ([(BKTOCTableViewCell *)self usesPopoverStyle]) {
      double v38 = 8.0;
    }
    else {
      double v38 = 15.0;
    }
  }
  -[UILabel setFrame:](self->_pageLabel, "setFrame:", MinX, v38, v29, v30);
  double v45 = MinX;
  double v46 = v38;
  double v47 = v29;
  double v48 = v30;
  if (v3) {
    double MaxX = CGRectGetMaxX(*(CGRect *)&v45);
  }
  else {
    double MaxX = CGRectGetMinX(*(CGRect *)&v45);
  }
  double v50 = MaxX;
  if (self->_cachedImageView)
  {
    double v51 = (double)(uint64_t)[(BKTOCTableViewCell *)self indentationLevel];
    [(BKTOCTableViewCell *)self indentationWidth];
    double v53 = v52 * v51;
    if (v3)
    {
      v100.origin.double x = v16;
      v100.origin.CGFloat y = v18;
      v100.size.CGFloat width = recta.origin.y;
      v100.size.CGFloat height = recta.size.width;
      double v54 = CGRectGetWidth(v100) - x - v53 + -10.0;
      v101.origin.double x = v16;
      v101.origin.CGFloat y = v18;
      v101.size.CGFloat width = recta.origin.y;
      v101.size.CGFloat height = recta.size.width;
      double v55 = CGRectGetHeight(v101);
      double v56 = v50 + 10.0;
      double v57 = 0.0;
    }
    else
    {
      [(UIImageView *)self->_cachedImageView frame];
      double v54 = v72;
      double v55 = v73;
      if (v35)
      {
        CGFloat v74 = v70;
        v105.origin.double x = v16;
        CGFloat v91 = v71;
        v105.origin.CGFloat y = v18;
        CGFloat v75 = v18;
        CGFloat y = recta.origin.y;
        CGFloat width = recta.size.width;
        v105.size.CGFloat width = recta.origin.y;
        v105.size.CGFloat height = recta.size.width;
        recta.origin.double x = CGRectGetMaxX(v105);
        v106.origin.double x = v74;
        v106.origin.CGFloat y = v91;
        v106.size.CGFloat width = v54;
        v106.size.CGFloat height = v55;
        double v56 = recta.origin.x - CGRectGetWidth(v106) - v53;
      }
      else
      {
        v111.origin.double x = v16;
        v111.origin.CGFloat y = v18;
        CGFloat v75 = v18;
        CGFloat y = recta.origin.y;
        CGFloat width = recta.size.width;
        v111.size.CGFloat width = recta.origin.y;
        v111.size.CGFloat height = recta.size.width;
        double v56 = v53 + CGRectGetMinX(v111);
      }
      v112.origin.double x = v16;
      v112.origin.CGFloat y = v75;
      v112.size.CGFloat width = y;
      v112.size.CGFloat height = width;
      double v85 = ceil((CGRectGetHeight(v112) - v55) * 0.5);
      int v86 = isPad();
      double v87 = 1.0;
      if (v86) {
        double v87 = 0.0;
      }
      double v57 = v87 + v85;
    }
    -[UIImageView setFrame:](self->_cachedImageView, "setFrame:", v56, v57, v54, v55, *(void *)&v91);
    [(BKTOCTableViewCell *)self bounds];
    -[BKTOCTableViewCell _setSelectedBackgroundViewFrame:](self, "_setSelectedBackgroundViewFrame:");
    goto LABEL_39;
  }
  v58 = [(BKTOCTableViewCell *)self textLabel];
  double v59 = (double)(uint64_t)[(BKTOCTableViewCell *)self indentationLevel];
  [(BKTOCTableViewCell *)self indentationWidth];
  double v61 = v60 * v59;
  if (x == 0.0) {
    double v62 = 0.0;
  }
  else {
    double v62 = x + 20.0;
  }
  [v58 frame];
  recta.origin.double x = v63;
  double v65 = v64;
  if ([(BKTOCTableViewCell *)self usesPopoverStyle]) {
    double v66 = 8.0;
  }
  else {
    double v66 = 14.0;
  }
  v102.origin.double x = v16;
  v102.origin.CGFloat y = v18;
  v102.size.CGFloat width = recta.origin.y;
  v102.size.CGFloat height = recta.size.width;
  double v67 = CGRectGetWidth(v102) - v62 - v61;
  if (v35)
  {
    v103.origin.double x = v16;
    v103.origin.CGFloat y = v18;
    v103.size.CGFloat width = recta.origin.y;
    v103.size.CGFloat height = recta.size.width;
    double v68 = CGRectGetMaxX(v103);
    v104.origin.double x = recta.origin.x;
    v104.origin.CGFloat y = v66;
    v104.size.CGFloat width = v67;
    v104.size.CGFloat height = v65;
    double v69 = v68 - CGRectGetWidth(v104) - v61;
LABEL_35:
    [v58 sizeThatFits:v67 v65];
    double v83 = v90;
    goto LABEL_36;
  }
  double v78 = v18;
  double v79 = v16;
  if ((v3 & 1) == 0)
  {
    CGFloat v88 = recta.origin.y;
    CGFloat v89 = recta.size.width;
    double v69 = v61 + CGRectGetMinX(*(CGRect *)&v79);
    goto LABEL_35;
  }
  CGFloat v80 = recta.origin.y;
  CGFloat v81 = recta.size.width;
  double v82 = CGRectGetMaxX(*(CGRect *)&v79);
  [(UILabel *)self->_pageLabel frame];
  double v67 = v82 - CGRectGetMaxX(v107) + -10.0 - v61;
  v108.origin.double x = v16;
  v108.origin.CGFloat y = v18;
  v108.size.CGFloat width = recta.origin.y;
  v108.size.CGFloat height = recta.size.width;
  double v83 = CGRectGetHeight(v108);
  v109.origin.double x = v16;
  v109.origin.CGFloat y = v18;
  v109.size.CGFloat width = recta.origin.y;
  v109.size.CGFloat height = recta.size.width;
  double v84 = CGRectGetMaxX(v109);
  v110.origin.double x = recta.origin.x;
  v110.origin.CGFloat y = v66;
  v110.size.CGFloat width = v67;
  v110.size.CGFloat height = v83;
  double v69 = v84 - CGRectGetWidth(v110) - v61;
  double v66 = 0.0;
LABEL_36:
  [v58 setFrame:v69, v66, v67, v83];
  if (v3) {
    [(BKTOCTableViewCell *)self _syncVerticalLabel];
  }
  [(BKTOCTableViewCell *)self bounds];
  -[BKTOCTableViewCell _setSelectedBackgroundViewFrame:](self, "_setSelectedBackgroundViewFrame:");

LABEL_39:
  [(BKTOCTableViewCell *)self configureFocusRing];
}

- (void)configureFocusRing
{
  [(BKTOCTableViewCell *)self bounds];
  CGRect v6 = CGRectInset(v5, 7.0, 1.0);
  +[UIFocusHaloEffect effectWithRoundedRect:cornerRadius:curve:](UIFocusHaloEffect, "effectWithRoundedRect:cornerRadius:curve:", kCACornerCurveContinuous, v6.origin.x, v6.origin.y, v6.size.width, v6.size.height, 4.0);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(BKTOCTableViewCell *)self setFocusEffect:v3];
}

- (void)_setSelectedBackgroundViewFrame:(CGRect)a3
{
  CGRect v10 = CGRectInset(a3, 7.0, 1.0);
  double x = v10.origin.x;
  double y = v10.origin.y;
  double width = v10.size.width;
  double height = v10.size.height;
  id v8 = [(BKTOCTableViewCell *)self selectedBackgroundView];
  [v8 setFrame:x, y, width, height];
}

- (void)prepareForReuse
{
  v7.receiver = self;
  v7.super_class = (Class)BKTOCTableViewCell;
  [(BKTOCTableViewCell *)&v7 prepareForReuse];
  [(UILabel *)self->_pageLabel setAlpha:1.0];
  [(UILabel *)self->_pageLabel setAdjustsFontSizeToFitWidth:0];
  cachedImageView = self->_cachedImageView;
  if (cachedImageView)
  {
    [(UIImageView *)cachedImageView removeFromSuperview];
    uint64_t v4 = self->_cachedImageView;
  }
  else
  {
    uint64_t v4 = 0;
  }
  self->_cachedImageView = 0;

  cacheKedouble y = self->_cacheKey;
  self->_cacheKedouble y = 0;

  selectedCacheKedouble y = self->_selectedCacheKey;
  self->_selectedCacheKedouble y = 0;

  self->_hasHTMLTitle = 0;
  [(BKTOCTableViewCell *)self setBkaxIsExcludedFromSample:0];
}

- (void)_setHighlightedPopoverAppearance:(BOOL)a3
{
  BOOL v3 = a3;
  CGRect v5 = [(BKTOCTableViewCell *)self highlightedBackgroundView];
  CGRect v6 = v5;
  if (v3)
  {

    if (!v6)
    {
      objc_super v7 = [(BKTOCTableViewCell *)self selectedBackgroundView];
      id v8 = [(BKTOCTableViewCell *)self traitCollection];
      double v9 = dbl_18EA10[[v8 userInterfaceStyle] == (char *)&dword_0 + 2];

      CGRect v10 = +[UIColor tintColor];
      double v11 = [v10 colorWithAlphaComponent:v9];
      [v7 setBackgroundColor:v11];

      [(BKTOCTableViewCell *)self setHighlightedBackgroundView:v7];
    }
    id v14 = [(BKTOCTableViewCell *)self contentView];
    double v12 = [(BKTOCTableViewCell *)self highlightedBackgroundView];
    double v13 = [(BKTOCTableViewCell *)self textLabel];
    [v14 insertSubview:v12 belowSubview:v13];
  }
  else
  {
    [v5 removeFromSuperview];

    [(BKTOCTableViewCell *)self setHighlightedBackgroundView:0];
  }
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)BKTOCTableViewCell;
  [(BKTOCTableViewCell *)&v6 setSelected:a3 animated:a4];
  [(BKTOCTableViewCell *)self _setSelectedAppearance:v4];
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)BKTOCTableViewCell;
  [(BKTOCTableViewCell *)&v6 setHighlighted:a3 animated:a4];
  if ([(BKTOCTableViewCell *)self usesPopoverStyle]) {
    [(BKTOCTableViewCell *)self _setHighlightedPopoverAppearance:v4];
  }
  [(BKTOCTableViewCell *)self _setSelectedAppearance:v4];
}

- (UILabel)pageLabel
{
  pageLabel = self->_pageLabel;
  if (!pageLabel)
  {
    BOOL v4 = [(UILabel *)[objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height]];
    CGRect v5 = self->_pageLabel;
    self->_pageLabel = v4;

    if (self->_vertical) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = 2
    }
         * ([(BKTOCTableViewCell *)self effectiveUserInterfaceLayoutDirection] != (char *)&dword_0 + 1);
    [(UILabel *)self->_pageLabel setTextAlignment:v6];
    [(UILabel *)self->_pageLabel setLineBreakMode:2];
    [(UILabel *)self->_pageLabel setOpaque:0];
    objc_super v7 = [(BKTOCTableViewCell *)self contentView];
    [v7 addSubview:self->_pageLabel];

    pageLabel = self->_pageLabel;
  }

  return pageLabel;
}

- (void)setupSelectedBackgroundNil
{
  id v3 = [objc_alloc((Class)UIImageView) initWithImage:0];
  [(BKTOCTableViewCell *)self setSelectedBackgroundView:v3];
}

- (void)configureSelectedBackgroundView
{
  id v3 = [(BKTOCTableViewCell *)self makeSelectedBackgroundView];
  [(BKTOCTableViewCell *)self setSelectedBackgroundView:v3];
}

- (id)makeSelectedBackgroundView
{
  [(BKTOCTableViewCell *)self bounds];
  CGRect v13 = CGRectInset(v12, 7.0, 1.0);
  id v3 = [objc_alloc((Class)UIView) initWithFrame:v13.origin.x, v13.origin.y, v13.size.width, v13.size.height];
  BOOL v4 = [v3 layer];
  [v4 setCornerRadius:4.0];

  CGRect v5 = [v3 layer];
  [v5 setCornerCurve:kCACornerCurveContinuous];

  uint64_t v6 = [(BKTOCTableViewCell *)self traitCollection];
  double v7 = dbl_18EA10[[v6 userInterfaceStyle] == (char *)&dword_0 + 2];

  id v8 = +[UIColor tintColor];
  double v9 = [v8 colorWithAlphaComponent:v7];
  [v3 setBackgroundColor:v9];

  return v3;
}

- (void)setVertical:(BOOL)a3
{
  if ([(BKTOCTableViewCell *)self isVertical] != a3)
  {
    self->_vertical = a3;
    [(BKTOCTableViewCell *)self _adjustLabelTextAlignment];
  }
}

- (void)displayHTMLWithContents:(id)a3 fontFamily:(id)a4 fontSize:(double)a5 maxSpan:(double)a6 baseURL:(id)a7
{
  id v10 = a4;
  id v11 = a3;
  CGRect v12 = [(BKTOCTableViewCell *)self contentView];
  [v12 bounds];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  [(BKTOCTableViewCell *)self contentInsets];
  double v22 = v14 + v21;
  double v24 = v16 + v23;
  double v26 = v18 - (v21 + v25);
  double v28 = v20 - (v23 + v27);

  BOOL vertical = self->_vertical;
  double v30 = [(BKTOCTableViewCell *)self pageLabel];
  [v30 frame];
  if (vertical) {
    double Height = CGRectGetHeight(*(CGRect *)&v31);
  }
  else {
    double Height = CGRectGetWidth(*(CGRect *)&v31);
  }
  double v36 = Height;

  v54.origin.double x = v22;
  v54.origin.double y = v24;
  v54.size.double width = v26;
  v54.size.double height = v28;
  double v37 = CGRectGetHeight(v54);
  v55.origin.double x = v22;
  v55.origin.double y = v24;
  v55.size.double width = v26;
  v55.size.double height = v28;
  double Width = CGRectGetWidth(v55);
  id v39 = [(BKTOCTableViewCell *)self indentationLevel];
  [(BKTOCTableViewCell *)self indentationWidth];
  double v41 = v40;
  self->_hasHTMLTitle = 1;
  id v42 = objc_alloc((Class)NSString);
  double v43 = +[NSNumber numberWithBool:self->_vertical];
  double v44 = (NSString *)[v42 initWithFormat:@"%@-%f.0-%@-%@", v10, *(void *)&a5, v43, v11];

  cacheKedouble y = self->_cacheKey;
  self->_cacheKedouble y = v44;

  double v46 = (NSString *)[objc_alloc((Class)NSString) initWithFormat:@"%@-selected", self->_cacheKey];
  selectedCacheKedouble y = self->_selectedCacheKey;
  self->_selectedCacheKedouble y = v46;

  if (!self->_cachedImageView)
  {
    double v48 = v36 + 10.0;
    if (v36 == 0.0) {
      double v48 = 0.0;
    }
    v49 = [objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, Width - v48 - (double)(uint64_t)v39 * v41, v37];
    cachedImageView = self->_cachedImageView;
    self->_cachedImageView = v49;

    [(UIImageView *)self->_cachedImageView setAutoresizingMask:2];
    [(UIImageView *)self->_cachedImageView setUserInteractionEnabled:0];
    [(UIImageView *)self->_cachedImageView setContentMode:8];
    id v51 = &dword_0 + 1;
    [(UIImageView *)self->_cachedImageView setClipsToBounds:1];
    double v52 = [(BKTOCTableViewCell *)self contentView];
    [v52 addSubview:self->_cachedImageView];

    if (([(BKTOCTableViewCell *)self isSelected] & 1) == 0) {
      id v51 = [(BKTOCTableViewCell *)self isHighlighted];
    }
    [(BKTOCTableViewCell *)self _setSelectedAppearance:v51];
  }
}

- (void)_syncVerticalLabel
{
  id v3 = [(BKTOCTableViewCell *)self textLabel];
  [v3 frame];
  -[BKVerticalLabel setFrame:](self->_verticalLabel, "setFrame:");

  BOOL v4 = [(BKTOCTableViewCell *)self textLabel];
  CGRect v5 = [v4 backgroundColor];
  [(BKVerticalLabel *)self->_verticalLabel setBackgroundColor:v5];

  uint64_t v6 = [(BKTOCTableViewCell *)self textLabel];
  -[BKVerticalLabel setAutoresizingMask:](self->_verticalLabel, "setAutoresizingMask:", [v6 autoresizingMask]);

  double v7 = [(BKTOCTableViewCell *)self textLabel];
  id v8 = [v7 text];
  [(BKVerticalLabel *)self->_verticalLabel setText:v8];

  double v9 = [(BKTOCTableViewCell *)self textLabel];
  id v10 = [v9 font];
  [(BKVerticalLabel *)self->_verticalLabel setFont:v10];

  id v11 = [(BKTOCTableViewCell *)self textLabel];
  CGRect v12 = [v11 textColor];
  [(BKVerticalLabel *)self->_verticalLabel setTextColor:v12];

  double v13 = [(BKTOCTableViewCell *)self textLabel];
  double v14 = [v13 shadowColor];
  [(BKVerticalLabel *)self->_verticalLabel setShadowColor:v14];

  double v15 = [(BKVerticalLabel *)self->_verticalLabel text];
  [v15 rangeOfString:@"“"];
  uint64_t v17 = v16;

  if (v17)
  {
    double v18 = [(BKVerticalLabel *)self->_verticalLabel text];
    double v19 = [v18 stringByReplacingOccurrencesOfString:@"“" withString:@"〝"];
    [(BKVerticalLabel *)self->_verticalLabel setText:v19];
  }
  double v20 = [(BKVerticalLabel *)self->_verticalLabel text];
  [v20 rangeOfString:@"”"];
  uint64_t v22 = v21;

  if (v22)
  {
    id v24 = [(BKVerticalLabel *)self->_verticalLabel text];
    double v23 = [v24 stringByReplacingOccurrencesOfString:@"”" withString:@"〟"];
    [(BKVerticalLabel *)self->_verticalLabel setText:v23];
  }
}

- (void)_adjustLabelTextAlignment
{
  if (self->_vertical)
  {
    verticalLabel = self->_verticalLabel;
    if (!verticalLabel)
    {
      BOOL v4 = [BKVerticalLabel alloc];
      CGRect v5 = [(BKTOCTableViewCell *)self textLabel];
      [v5 frame];
      uint64_t v6 = -[BKVerticalLabel initWithFrame:](v4, "initWithFrame:");
      double v7 = self->_verticalLabel;
      self->_verticalLabel = v6;

      id v8 = [(BKTOCTableViewCell *)self contentView];
      [v8 addSubview:self->_verticalLabel];

      [(BKTOCTableViewCell *)self _syncVerticalLabel];
      verticalLabel = self->_verticalLabel;
    }
    [(BKVerticalLabel *)verticalLabel setHidden:0];
    double v9 = [(BKTOCTableViewCell *)self pageLabel];
    id v14 = v9;
    uint64_t v10 = 1;
  }
  else
  {
    id v11 = (char *)[(BKTOCTableViewCell *)self effectiveUserInterfaceLayoutDirection];
    CGRect v12 = self->_verticalLabel;
    if (v12) {
      [(BKVerticalLabel *)v12 setHidden:1];
    }
    double v13 = [(BKTOCTableViewCell *)self textLabel];
    [v13 setTextAlignment:2 * (v11 == (unsigned char *)&dword_0 + 1)];

    double v9 = [(BKTOCTableViewCell *)self pageLabel];
    id v14 = v9;
    uint64_t v10 = 2 * (v11 != (unsigned char *)&dword_0 + 1);
  }
  [v9 setTextAlignment:v10];
}

+ (CGSize)titleSizeForText:(id)a3 indentation:(int64_t)a4 font:(id)a5 width:(double)a6
{
  NSAttributedStringKey v29 = NSFontAttributeName;
  id v30 = a5;
  id v9 = a5;
  id v10 = a3;
  id v11 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
  [@"8888" sizeWithAttributes:v11];
  double v13 = v12;
  double v15 = v14;

  int v16 = isPad();
  double v17 = 0.0;
  double v18 = 26.0;
  if (!v16) {
    double v18 = 0.0;
  }
  if (v13 > 0.0) {
    double v17 = v13 + 10.0;
  }
  double v19 = a6 - v17 - v18 - (double)(10 * a4);
  NSAttributedStringKey v27 = NSFontAttributeName;
  id v28 = v9;
  double v20 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];

  [v10 boundingRectWithSize:3 options:v20 attributes:0 context:v19];
  double v22 = v21;
  double v24 = v23;

  if (v15 * 5.0 < v24) {
    double v24 = v15 * 5.0;
  }

  double v25 = v22;
  double v26 = v24;
  result.double height = v26;
  result.double width = v25;
  return result;
}

+ (CGSize)sizeForText:(id)a3 indentation:(int64_t)a4 font:(id)a5 width:(double)a6
{
  [a1 titleSizeForText:a3 indentation:a4 font:a5];
  double v8 = v7 + 24.0;
  double v9 = a6;
  result.double height = v8;
  result.double width = v9;
  return result;
}

+ (double)maxSpanForTextWithIndentation:(int64_t)a3 font:(id)a4 width:(double)a5
{
  int v7 = isPad();
  double v8 = 0.0;
  if (v7) {
    double v8 = 26.0;
  }
  return a5 - v8 - (double)(10 * a3);
}

- (BOOL)isVertical
{
  return self->_vertical;
}

- (UIEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (BOOL)usesPopoverStyle
{
  return self->_usesPopoverStyle;
}

- (void)setUsesPopoverStyle:(BOOL)a3
{
  self->_usesPopoverStyle = a3;
}

- (NSString)cacheKey
{
  return self->_cacheKey;
}

- (void)setCacheKey:(id)a3
{
}

- (NSString)selectedCacheKey
{
  return self->_selectedCacheKey;
}

- (void)setSelectedCacheKey:(id)a3
{
}

- (BOOL)bkaxIsExcludedFromSample
{
  return self->_bkaxIsExcludedFromSample;
}

- (void)setBkaxIsExcludedFromSample:(BOOL)a3
{
  self->_bkaxIsExcludedFromSample = a3;
}

- (UIView)highlightedBackgroundView
{
  return self->_highlightedBackgroundView;
}

- (void)setHighlightedBackgroundView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightedBackgroundView, 0);
  objc_storeStrong((id *)&self->_selectedCacheKey, 0);
  objc_storeStrong((id *)&self->_cacheKey, 0);
  objc_storeStrong((id *)&self->_cachedImageView, 0);
  objc_storeStrong((id *)&self->_verticalLabel, 0);
  objc_storeStrong((id *)&self->_highlightImage, 0);

  objc_storeStrong((id *)&self->_pageLabel, 0);
}

@end