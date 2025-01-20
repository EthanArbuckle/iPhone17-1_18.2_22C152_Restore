@interface STUIStatusBarEmergencySignalView
+ (double)_fontSizeForIconSize:(int64_t)a3;
+ (double)_interspaceForIconSize:(int64_t)a3;
- (BOOL)rounded;
- (CGSize)intrinsicContentSize;
- (NSLayoutConstraint)topConstraint;
- (NSLayoutConstraint)verticalInterspaceConstraint;
- (STUIStatusBarCellularSignalView)signalView;
- (STUIStatusBarEmergencySignalView)initWithCoder:(id)a3;
- (STUIStatusBarEmergencySignalView)initWithFrame:(CGRect)a3;
- (UIAccessibilityHUDItem)accessibilityHUDRepresentation;
- (UIEdgeInsets)alignmentRectInsets;
- (UIImageView)sosView;
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

@implementation STUIStatusBarEmergencySignalView

- (STUIStatusBarCellularSignalView)signalView
{
  return (STUIStatusBarCellularSignalView *)objc_getProperty(self, a2, 424, 1);
}

- (UIImageView)sosView
{
  return (UIImageView *)objc_getProperty(self, a2, 416, 1);
}

- (void)_iconSizeDidChange
{
  v3 = (void *)MEMORY[0x1E4FB1830];
  [(id)objc_opt_class() _fontSizeForIconSize:self->_iconSize];
  objc_msgSend(v3, "configurationWithPointSize:");
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  v4 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"sos" withConfiguration:v12];
  [(UIImageView *)self->_sosView setImage:v4];

  [(STUIStatusBarSignalView *)self->_signalView setRounded:self->_rounded];
  [(STUIStatusBarSignalView *)self->_signalView setIconSize:self->_iconSize];
  [(STUIStatusBarCellularSignalView *)self->_signalView _iconSizeDidChange];
  [(id)objc_opt_class() _interspaceForIconSize:self->_iconSize];
  double v6 = v5;
  -[NSLayoutConstraint setConstant:](self->_verticalInterspaceConstraint, "setConstant:");
  [(id)objc_opt_class() _fontSizeForIconSize:self->_iconSize];
  double v8 = v6 + v7;
  [(STUIStatusBarCellularSignalView *)self->_signalView intrinsicContentSize];
  double v10 = v8 + v9;
  [(STUIStatusBarEmergencySignalView *)self intrinsicContentSize];
  [(NSLayoutConstraint *)self->_topConstraint setConstant:(v11 - v10) * 0.5];
}

+ (double)_fontSizeForIconSize:(int64_t)a3
{
  double result = 0.0;
  if ((unint64_t)(a3 - 1) <= 0x10) {
    return dbl_1D7ED62C8[a3 - 1];
  }
  return result;
}

- (CGSize)intrinsicContentSize
{
  int64_t v3 = [(STUIStatusBarSignalView *)self->_signalView numberOfBars];
  int64_t v4 = [(STUIStatusBarEmergencySignalView *)self iconSize];
  +[STUIStatusBarCellularSignalView _intrinsicContentSizeForNumberOfBars:v3 iconSize:v4];
  result.height = v6;
  result.width = v5;
  return result;
}

- (int64_t)iconSize
{
  return self->_iconSize;
}

+ (double)_interspaceForIconSize:(int64_t)a3
{
  double result = 0.0;
  if ((unint64_t)(a3 - 1) <= 0x10) {
    return dbl_1D7ED6350[a3 - 1];
  }
  return result;
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

- (void)_commonInit
{
  v23[4] = *MEMORY[0x1E4F143B8];
  int64_t v3 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
  sosView = self->_sosView;
  self->_sosView = v3;

  [(UIImageView *)self->_sosView setTranslatesAutoresizingMaskIntoConstraints:0];
  double v5 = objc_alloc_init(STUIStatusBarCellularFlatSignalView);
  signalView = self->_signalView;
  self->_signalView = &v5->super.super;

  [(STUIStatusBarCellularSignalView *)self->_signalView setTranslatesAutoresizingMaskIntoConstraints:0];
  self->_iconSize = -1;
  [(STUIStatusBarEmergencySignalView *)self addSubview:self->_sosView];
  [(STUIStatusBarEmergencySignalView *)self addSubview:self->_signalView];
  double v7 = [(UIImageView *)self->_sosView topAnchor];
  double v8 = [(STUIStatusBarEmergencySignalView *)self topAnchor];
  double v9 = [v7 constraintEqualToAnchor:v8 constant:0.0];
  topConstraint = self->_topConstraint;
  self->_topConstraint = v9;

  [(NSLayoutConstraint *)self->_topConstraint setIdentifier:@"sosCellularTopConstraint"];
  double v11 = [(STUIStatusBarCellularSignalView *)self->_signalView topAnchor];
  id v12 = [(UIImageView *)self->_sosView lastBaselineAnchor];
  v13 = [v11 constraintEqualToAnchor:v12 constant:0.0];
  verticalInterspaceConstraint = self->_verticalInterspaceConstraint;
  self->_verticalInterspaceConstraint = v13;

  [(NSLayoutConstraint *)self->_verticalInterspaceConstraint setIdentifier:@"sosCellularSeparationConstraint"];
  v23[0] = self->_topConstraint;
  v15 = [(UIImageView *)self->_sosView centerXAnchor];
  v16 = [(STUIStatusBarEmergencySignalView *)self centerXAnchor];
  v17 = [v15 constraintEqualToAnchor:v16];
  v18 = self->_verticalInterspaceConstraint;
  v23[1] = v17;
  v23[2] = v18;
  v19 = [(STUIStatusBarCellularSignalView *)self->_signalView centerXAnchor];
  v20 = [(STUIStatusBarEmergencySignalView *)self centerXAnchor];
  v21 = [v19 constraintEqualToAnchor:v20];
  v23[3] = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:4];

  [MEMORY[0x1E4F28DC8] activateConstraints:v22];
}

- (void)applyStyleAttributes:(id)a3
{
  id v7 = a3;
  -[STUIStatusBarCellularSignalView setNeedsLargerScale:](self->_signalView, "setNeedsLargerScale:", [v7 isScaledFixedWidthBar]);
  int v4 = [v7 isRounded];
  BOOL v5 = self->_iconSize != [v7 iconSize] || self->_rounded != v4;
  -[STUIStatusBarEmergencySignalView setRounded:](self, "setRounded:", [v7 isRounded]);
  -[STUIStatusBarEmergencySignalView setIconSize:](self, "setIconSize:", [v7 iconSize]);
  double v6 = [v7 imageTintColor];
  [(UIImageView *)self->_sosView setTintColor:v6];

  if (v5) {
    [(STUIStatusBarEmergencySignalView *)self _iconSizeDidChange];
  }
}

- (void)setRounded:(BOOL)a3
{
  self->_rounded = a3;
}

- (void)setIconSize:(int64_t)a3
{
  self->_iconSize = a3;
}

- (STUIStatusBarEmergencySignalView)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STUIStatusBarEmergencySignalView;
  int64_t v3 = -[STUIStatusBarEmergencySignalView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(STUIStatusBarEmergencySignalView *)v3 _commonInit];
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verticalInterspaceConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_signalView, 0);
  objc_storeStrong((id *)&self->_sosView, 0);
}

- (STUIStatusBarEmergencySignalView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STUIStatusBarEmergencySignalView;
  int64_t v3 = [(STUIStatusBarEmergencySignalView *)&v5 initWithCoder:a3];
  [(STUIStatusBarEmergencySignalView *)v3 _commonInit];
  return v3;
}

- (UIAccessibilityHUDItem)accessibilityHUDRepresentation
{
  if (qword_1EA87ED20 != -1) {
    dispatch_once(&qword_1EA87ED20, &__block_literal_global_226);
  }
  int64_t v3 = NSString;
  int v4 = [(STUIStatusBarEmergencySignalView *)self signalView];
  if ([v4 signalMode] == 2)
  {
    objc_super v5 = [(STUIStatusBarEmergencySignalView *)self signalView];
    double v6 = objc_msgSend(v3, "stringWithFormat:", @"AXHUD_Cellular_%d", objc_msgSend(v5, "numberOfActiveBars"));
  }
  else
  {
    double v6 = objc_msgSend(v3, "stringWithFormat:", @"AXHUD_Cellular_%d", 0);
  }

  id v7 = [(STUIStatusBarEmergencySignalView *)self _screen];
  [v7 scale];
  CGFloat v9 = v8;

  [(UIImageView *)self->_sosView alpha];
  double v11 = objc_msgSend(v6, "stringByAppendingFormat:", @"-%.1f@%.1f", v10, *(void *)&v9);
  id v12 = [(id)qword_1EA87ED18 objectForKey:v11];
  if (!v12)
  {
    v13 = [MEMORY[0x1E4FB1818] kitImageNamed:@"Split_SOS"];
    v14 = [MEMORY[0x1E4FB1818] kitImageNamed:v6];
    [(UIImageView *)self->_sosView alpha];
    id v12 = UIStatusBarCreateHUDDualSignalView(v13, v14, v15, 1.0, v9);
    if (v12) {
      [(id)qword_1EA87ED18 setObject:v12 forKey:v11];
    }
  }
  id v16 = objc_alloc(MEMORY[0x1E4FB13E0]);
  v17 = objc_msgSend(v16, "initWithTitle:image:imageInsets:", 0, v12, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  [v17 setScaleImage:1];

  return (UIAccessibilityHUDItem *)v17;
}

uint64_t __66__STUIStatusBarEmergencySignalView_accessibilityHUDRepresentation__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  uint64_t v1 = qword_1EA87ED18;
  qword_1EA87ED18 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (BOOL)rounded
{
  return self->_rounded;
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

- (void)setAlignmentRectInsets:(UIEdgeInsets)a3
{
  self->_alignmentRectInsets = a3;
}

@end