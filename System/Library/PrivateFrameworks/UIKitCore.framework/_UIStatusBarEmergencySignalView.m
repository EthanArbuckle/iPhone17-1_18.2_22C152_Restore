@interface _UIStatusBarEmergencySignalView
+ (double)_fontSizeForIconSize:(int64_t)a3;
+ (double)_interspaceForIconSize:(int64_t)a3;
- (BOOL)rounded;
- (CGSize)intrinsicContentSize;
- (NSLayoutConstraint)topConstraint;
- (NSLayoutConstraint)verticalInterspaceConstraint;
- (UIAccessibilityHUDItem)accessibilityHUDRepresentation;
- (UIEdgeInsets)alignmentRectInsets;
- (UIImageView)sosView;
- (_UIStatusBarCellularSignalView)signalView;
- (_UIStatusBarEmergencySignalView)initWithCoder:(id)a3;
- (_UIStatusBarEmergencySignalView)initWithFrame:(CGRect)a3;
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

@implementation _UIStatusBarEmergencySignalView

+ (double)_fontSizeForIconSize:(int64_t)a3
{
  double result = 0.0;
  if ((unint64_t)(a3 - 1) <= 0x10) {
    return dbl_186B9CCC8[a3 - 1];
  }
  return result;
}

+ (double)_interspaceForIconSize:(int64_t)a3
{
  double result = 0.0;
  if ((unint64_t)(a3 - 1) <= 0x10) {
    return dbl_186B9CD50[a3 - 1];
  }
  return result;
}

- (void)_commonInit
{
  v23[4] = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(UIImageView);
  sosView = self->_sosView;
  self->_sosView = v3;

  [(UIImageView *)self->_sosView setTranslatesAutoresizingMaskIntoConstraints:0];
  v5 = objc_alloc_init(_UIStatusBarCellularFlatSignalView);
  signalView = self->_signalView;
  self->_signalView = &v5->super.super;

  [(UIView *)self->_signalView setTranslatesAutoresizingMaskIntoConstraints:0];
  self->_iconSize = -1;
  [(UIView *)self addSubview:self->_sosView];
  [(UIView *)self addSubview:self->_signalView];
  v7 = [(UIView *)self->_sosView topAnchor];
  v8 = [(UIView *)self topAnchor];
  v9 = [v7 constraintEqualToAnchor:v8 constant:0.0];
  topConstraint = self->_topConstraint;
  self->_topConstraint = v9;

  [(NSLayoutConstraint *)self->_topConstraint setIdentifier:@"sosCellularTopConstraint"];
  v11 = [(UIView *)self->_signalView topAnchor];
  v12 = [(UIView *)self->_sosView lastBaselineAnchor];
  v13 = [v11 constraintEqualToAnchor:v12 constant:0.0];
  verticalInterspaceConstraint = self->_verticalInterspaceConstraint;
  self->_verticalInterspaceConstraint = v13;

  [(NSLayoutConstraint *)self->_verticalInterspaceConstraint setIdentifier:@"sosCellularSeparationConstraint"];
  v23[0] = self->_topConstraint;
  v15 = [(UIView *)self->_sosView centerXAnchor];
  v16 = [(UIView *)self centerXAnchor];
  v17 = [v15 constraintEqualToAnchor:v16];
  v18 = self->_verticalInterspaceConstraint;
  v23[1] = v17;
  v23[2] = v18;
  v19 = [(UIView *)self->_signalView centerXAnchor];
  v20 = [(UIView *)self centerXAnchor];
  v21 = [v19 constraintEqualToAnchor:v20];
  v23[3] = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:4];

  [MEMORY[0x1E4F5B268] activateConstraints:v22];
}

- (_UIStatusBarEmergencySignalView)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarEmergencySignalView;
  v3 = -[UIView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(_UIStatusBarEmergencySignalView *)v3 _commonInit];
  return v3;
}

- (_UIStatusBarEmergencySignalView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarEmergencySignalView;
  v3 = [(UIView *)&v5 initWithCoder:a3];
  [(_UIStatusBarEmergencySignalView *)v3 _commonInit];
  return v3;
}

- (void)_iconSizeDidChange
{
  [(id)objc_opt_class() _fontSizeForIconSize:self->_iconSize];
  +[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:");
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  v3 = +[UIImage _systemImageNamed:@"sos" withConfiguration:v11];
  [(UIImageView *)self->_sosView setImage:v3];

  [(_UIStatusBarSignalView *)self->_signalView setRounded:self->_rounded];
  [(_UIStatusBarSignalView *)self->_signalView setIconSize:self->_iconSize];
  [(_UIStatusBarCellularSignalView *)self->_signalView _iconSizeDidChange];
  [(id)objc_opt_class() _interspaceForIconSize:self->_iconSize];
  double v5 = v4;
  -[NSLayoutConstraint setConstant:](self->_verticalInterspaceConstraint, "setConstant:");
  [(id)objc_opt_class() _fontSizeForIconSize:self->_iconSize];
  double v7 = v5 + v6;
  [(_UIStatusBarCellularSignalView *)self->_signalView intrinsicContentSize];
  double v9 = v7 + v8;
  [(_UIStatusBarEmergencySignalView *)self intrinsicContentSize];
  [(NSLayoutConstraint *)self->_topConstraint setConstant:(v10 - v9) * 0.5];
}

- (void)applyStyleAttributes:(id)a3
{
  id v7 = a3;
  -[_UIStatusBarCellularSignalView setNeedsLargerScale:](self->_signalView, "setNeedsLargerScale:", [v7 isScaledFixedWidthBar]);
  int v4 = [v7 isRounded];
  BOOL v5 = self->_iconSize != [v7 iconSize] || self->_rounded != v4;
  -[_UIStatusBarEmergencySignalView setRounded:](self, "setRounded:", [v7 isRounded]);
  -[_UIStatusBarEmergencySignalView setIconSize:](self, "setIconSize:", [v7 iconSize]);
  double v6 = [v7 imageTintColor];
  [(UIView *)self->_sosView setTintColor:v6];

  if (v5) {
    [(_UIStatusBarEmergencySignalView *)self _iconSizeDidChange];
  }
}

- (CGSize)intrinsicContentSize
{
  int64_t v3 = [(_UIStatusBarSignalView *)self->_signalView numberOfBars];
  int64_t v4 = [(_UIStatusBarEmergencySignalView *)self iconSize];
  +[_UIStatusBarCellularSignalView _intrinsicContentSizeForNumberOfBars:v3 iconSize:v4];
  result.height = v6;
  result.width = v5;
  return result;
}

- (UIAccessibilityHUDItem)accessibilityHUDRepresentation
{
  if (qword_1EB25D0F0 != -1) {
    dispatch_once(&qword_1EB25D0F0, &__block_literal_global_235_1);
  }
  int64_t v3 = NSString;
  int64_t v4 = [(_UIStatusBarEmergencySignalView *)self signalView];
  if ([v4 signalMode] == 2)
  {
    double v5 = [(_UIStatusBarEmergencySignalView *)self signalView];
    double v6 = objc_msgSend(v3, "stringWithFormat:", @"AXHUD_Cellular_%d", objc_msgSend(v5, "numberOfActiveBars"));
  }
  else
  {
    double v6 = objc_msgSend(v3, "stringWithFormat:", @"AXHUD_Cellular_%d", 0);
  }

  id v7 = [(UIView *)self _screen];
  [v7 scale];
  double v9 = v8;

  [(UIView *)self->_sosView alpha];
  id v11 = objc_msgSend(v6, "stringByAppendingFormat:", @"-%.1f@%.1f", v10, *(void *)&v9);
  v12 = [(id)qword_1EB25D0E8 objectForKey:v11];
  if (!v12)
  {
    v13 = +[UIImage kitImageNamed:@"Split_SOS"];
    v14 = +[UIImage kitImageNamed:v6];
    [(UIView *)self->_sosView alpha];
    v12 = UIStatusBarCreateHUDDualSignalView(v13, v14, v15, v9);
    if (v12) {
      [(id)qword_1EB25D0E8 setObject:v12 forKey:v11];
    }
  }
  v16 = -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:]([UIAccessibilityHUDItem alloc], "initWithTitle:image:imageInsets:", 0, v12, 0.0, 0.0, 0.0, 0.0);
  [(UIAccessibilityHUDItem *)v16 setScaleImage:1];

  return v16;
}

- (UIImageView)sosView
{
  return (UIImageView *)objc_getProperty(self, a2, 416, 1);
}

- (_UIStatusBarCellularSignalView)signalView
{
  return (_UIStatusBarCellularSignalView *)objc_getProperty(self, a2, 424, 1);
}

- (BOOL)rounded
{
  return self->_rounded;
}

- (void)setRounded:(BOOL)a3
{
  self->_rounded = a3;
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
  objc_storeStrong((id *)&self->_signalView, 0);
  objc_storeStrong((id *)&self->_sosView, 0);
}

@end