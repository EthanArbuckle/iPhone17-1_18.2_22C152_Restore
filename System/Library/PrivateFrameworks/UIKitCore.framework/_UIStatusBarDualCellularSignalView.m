@interface _UIStatusBarDualCellularSignalView
+ (double)_interspaceForIconSize:(int64_t)a3;
- (BOOL)rounded;
- (CGSize)intrinsicContentSize;
- (NSLayoutConstraint)topConstraint;
- (NSLayoutConstraint)verticalInterspaceConstraint;
- (UIAccessibilityHUDItem)accessibilityHUDRepresentation;
- (UIEdgeInsets)alignmentRectInsets;
- (_UIStatusBarCellularSignalView)bottomSignalView;
- (_UIStatusBarCellularSignalView)topSignalView;
- (_UIStatusBarDualCellularSignalView)initWithCoder:(id)a3;
- (_UIStatusBarDualCellularSignalView)initWithFrame:(CGRect)a3;
- (id)viewForLastBaselineLayout;
- (int64_t)iconSize;
- (void)_commonInit;
- (void)_iconSizeDidChange;
- (void)applyStyleAttributes:(id)a3;
- (void)setAlignmentRectInsets:(UIEdgeInsets)a3;
- (void)setIconSize:(int64_t)a3;
- (void)setRounded:(BOOL)a3;
- (void)setTopConstraint:(id)a3;
- (void)setVerticalInterspaceConstraint:(id)a3;
@end

@implementation _UIStatusBarDualCellularSignalView

+ (double)_interspaceForIconSize:(int64_t)a3
{
  double result = 0.0;
  if ((unint64_t)(a3 - 1) <= 0x10) {
    return dbl_186B9CC40[a3 - 1];
  }
  return result;
}

- (void)_commonInit
{
  v23[4] = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(_UIStatusBarCellularSmallSignalView);
  topSignalView = self->_topSignalView;
  self->_topSignalView = &v3->super;

  [(UIView *)self->_topSignalView setTranslatesAutoresizingMaskIntoConstraints:0];
  v5 = objc_alloc_init(_UIStatusBarCellularFlatSignalView);
  bottomSignalView = self->_bottomSignalView;
  self->_bottomSignalView = &v5->super.super;

  [(UIView *)self->_bottomSignalView setTranslatesAutoresizingMaskIntoConstraints:0];
  self->_iconSize = -1;
  [(UIView *)self addSubview:self->_topSignalView];
  [(UIView *)self addSubview:self->_bottomSignalView];
  v7 = [(UIView *)self->_topSignalView topAnchor];
  v8 = [(UIView *)self topAnchor];
  v9 = [v7 constraintEqualToAnchor:v8 constant:0.0];
  topConstraint = self->_topConstraint;
  self->_topConstraint = v9;

  [(NSLayoutConstraint *)self->_topConstraint setIdentifier:@"dualCellularTopBarConstraint"];
  v11 = [(UIView *)self->_bottomSignalView topAnchor];
  v12 = [(UIView *)self->_topSignalView bottomAnchor];
  v13 = [v11 constraintEqualToAnchor:v12 constant:0.0];
  verticalInterspaceConstraint = self->_verticalInterspaceConstraint;
  self->_verticalInterspaceConstraint = v13;

  [(NSLayoutConstraint *)self->_verticalInterspaceConstraint setIdentifier:@"dualCellularBarSeparationConstraint"];
  v23[0] = self->_topConstraint;
  v15 = [(UIView *)self->_topSignalView centerXAnchor];
  v16 = [(UIView *)self centerXAnchor];
  v17 = [v15 constraintEqualToAnchor:v16];
  v18 = self->_verticalInterspaceConstraint;
  v23[1] = v17;
  v23[2] = v18;
  v19 = [(UIView *)self->_bottomSignalView centerXAnchor];
  v20 = [(UIView *)self centerXAnchor];
  v21 = [v19 constraintEqualToAnchor:v20];
  v23[3] = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:4];

  [MEMORY[0x1E4F5B268] activateConstraints:v22];
}

- (_UIStatusBarDualCellularSignalView)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarDualCellularSignalView;
  v3 = -[UIView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(_UIStatusBarDualCellularSignalView *)v3 _commonInit];
  return v3;
}

- (_UIStatusBarDualCellularSignalView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarDualCellularSignalView;
  v3 = [(UIView *)&v5 initWithCoder:a3];
  [(_UIStatusBarDualCellularSignalView *)v3 _commonInit];
  return v3;
}

- (void)_iconSizeDidChange
{
  [(_UIStatusBarSignalView *)self->_topSignalView setRounded:self->_rounded];
  [(_UIStatusBarSignalView *)self->_bottomSignalView setRounded:self->_rounded];
  [(_UIStatusBarSignalView *)self->_topSignalView setIconSize:self->_iconSize];
  [(_UIStatusBarSignalView *)self->_bottomSignalView setIconSize:self->_iconSize];
  [(_UIStatusBarCellularSignalView *)self->_topSignalView _iconSizeDidChange];
  [(_UIStatusBarCellularSignalView *)self->_bottomSignalView _iconSizeDidChange];
  [(id)objc_opt_class() _interspaceForIconSize:self->_iconSize];
  double v4 = v3;
  -[NSLayoutConstraint setConstant:](self->_verticalInterspaceConstraint, "setConstant:");
  [(_UIStatusBarCellularSignalView *)self->_topSignalView intrinsicContentSize];
  double v6 = v4 + v5;
  [(_UIStatusBarCellularSignalView *)self->_bottomSignalView intrinsicContentSize];
  double v8 = v6 + v7;
  [(_UIStatusBarDualCellularSignalView *)self intrinsicContentSize];
  topConstraint = self->_topConstraint;
  [(NSLayoutConstraint *)topConstraint setConstant:(v9 - v8) * 0.5];
}

- (id)viewForLastBaselineLayout
{
  if (_UIGetSecondarySIMUnderBaseline()) {
    self = (_UIStatusBarDualCellularSignalView *)self->_topSignalView;
  }
  return self;
}

- (void)applyStyleAttributes:(id)a3
{
  id v6 = a3;
  -[_UIStatusBarCellularSignalView setNeedsLargerScale:](self->_topSignalView, "setNeedsLargerScale:", [v6 isScaledFixedWidthBar]);
  -[_UIStatusBarCellularSignalView setNeedsLargerScale:](self->_bottomSignalView, "setNeedsLargerScale:", [v6 isScaledFixedWidthBar]);
  int v4 = [v6 isRounded];
  if (self->_iconSize != [v6 iconSize])
  {
    -[_UIStatusBarDualCellularSignalView setRounded:](self, "setRounded:", [v6 isRounded]);
    -[_UIStatusBarDualCellularSignalView setIconSize:](self, "setIconSize:", [v6 iconSize]);
    goto LABEL_5;
  }
  int rounded = self->_rounded;
  -[_UIStatusBarDualCellularSignalView setRounded:](self, "setRounded:", [v6 isRounded]);
  -[_UIStatusBarDualCellularSignalView setIconSize:](self, "setIconSize:", [v6 iconSize]);
  if (rounded != v4) {
LABEL_5:
  }
    [(_UIStatusBarDualCellularSignalView *)self _iconSizeDidChange];
}

- (CGSize)intrinsicContentSize
{
  int64_t v3 = [(_UIStatusBarSignalView *)self->_topSignalView numberOfBars];
  int64_t v4 = [(_UIStatusBarDualCellularSignalView *)self iconSize];
  +[_UIStatusBarCellularSignalView _intrinsicContentSizeForNumberOfBars:v3 iconSize:v4];
  result.height = v6;
  result.width = v5;
  return result;
}

- (UIAccessibilityHUDItem)accessibilityHUDRepresentation
{
  if (qword_1EB25D0E0 != -1) {
    dispatch_once(&qword_1EB25D0E0, &__block_literal_global_486);
  }
  int64_t v3 = NSString;
  int64_t v4 = [(_UIStatusBarDualCellularSignalView *)self topSignalView];
  if ([v4 signalMode] == 2)
  {
    double v5 = [(_UIStatusBarDualCellularSignalView *)self topSignalView];
    double v6 = objc_msgSend(v3, "stringWithFormat:", @"AXHUD_Cellular_%d", objc_msgSend(v5, "numberOfActiveBars"));
  }
  else
  {
    double v6 = objc_msgSend(v3, "stringWithFormat:", @"AXHUD_Cellular_%d", 0);
  }

  double v7 = NSString;
  double v8 = [(_UIStatusBarDualCellularSignalView *)self bottomSignalView];
  if ([v8 signalMode] == 2)
  {
    double v9 = [(_UIStatusBarDualCellularSignalView *)self bottomSignalView];
    v10 = objc_msgSend(v7, "stringWithFormat:", @"AXHUD_Cellular_%d", objc_msgSend(v9, "numberOfActiveBars"));
  }
  else
  {
    v10 = objc_msgSend(v7, "stringWithFormat:", @"AXHUD_Cellular_%d", 0);
  }

  v11 = [(UIView *)self _screen];
  [v11 scale];
  double v13 = v12;

  v14 = [v6 stringByAppendingString:v10];
  v15 = objc_msgSend(v14, "stringByAppendingFormat:", @"@%.1f", *(void *)&v13);

  v16 = [(id)_MergedGlobals_17_3 objectForKey:v15];
  if (!v16)
  {
    v17 = +[UIImage kitImageNamed:v6];
    v18 = +[UIImage kitImageNamed:v10];
    v16 = UIStatusBarCreateHUDDualSignalView(v17, v18, 1.0, v13);
    if (v16) {
      [(id)_MergedGlobals_17_3 setObject:v16 forKey:v15];
    }
  }
  v19 = -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:]([UIAccessibilityHUDItem alloc], "initWithTitle:image:imageInsets:", 0, v16, 0.0, 0.0, 0.0, 0.0);
  [(UIAccessibilityHUDItem *)v19 setScaleImage:1];

  return v19;
}

- (_UIStatusBarCellularSignalView)topSignalView
{
  return (_UIStatusBarCellularSignalView *)objc_getProperty(self, a2, 416, 1);
}

- (_UIStatusBarCellularSignalView)bottomSignalView
{
  return (_UIStatusBarCellularSignalView *)objc_getProperty(self, a2, 424, 1);
}

- (BOOL)rounded
{
  return self->_rounded;
}

- (void)setRounded:(BOOL)a3
{
  self->_int rounded = a3;
}

- (int64_t)iconSize
{
  return self->_iconSize;
}

- (void)setIconSize:(int64_t)a3
{
  self->_iconSize = a3;
}

- (NSLayoutConstraint)topConstraint
{
  return self->_topConstraint;
}

- (void)setTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)verticalInterspaceConstraint
{
  return self->_verticalInterspaceConstraint;
}

- (void)setVerticalInterspaceConstraint:(id)a3
{
}

- (UIEdgeInsets)alignmentRectInsets
{
  double top = self->_alignmentRectInsets.top;
  double left = self->_alignmentRectInsets.left;
  double bottom = self->_alignmentRectInsets.bottom;
  double right = self->_alignmentRectInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setAlignmentRectInsets:(UIEdgeInsets)a3
{
  self->_alignmentRectInsets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verticalInterspaceConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_bottomSignalView, 0);
  objc_storeStrong((id *)&self->_topSignalView, 0);
}

@end