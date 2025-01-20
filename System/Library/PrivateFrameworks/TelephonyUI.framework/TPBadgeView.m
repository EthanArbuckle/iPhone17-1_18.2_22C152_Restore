@interface TPBadgeView
- (BOOL)_hasBaseline;
- (CGSize)_layoutSizeThatFits:(CGSize)a3 fixedAxes:(unint64_t)a4;
- (NSLayoutConstraint)heightAnchorLayoutConstraint;
- (NSLayoutConstraint)titleLabelLeadingAnchorLayoutConstraint;
- (NSLayoutConstraint)titleLabelTrailingAnchorLayoutConstraint;
- (NSLayoutConstraint)widthAnchorLayoutConstraint;
- (NSString)title;
- (TPBadgeView)initWithTitle:(id)a3;
- (TPBadgeView)initWithTitle:(id)a3 theme:(unint64_t)a4;
- (UILabel)titleLabel;
- (double)heightAnchorLayoutConstraintConstantFontMultiplier;
- (double)layerCornerRadius;
- (double)scaledLayoutValueForBaseValue:(double)a3;
- (double)scaledLayoutValueForBaseValue:(double)a3 shouldLowerBound:(BOOL)a4;
- (double)suggestedHeight;
- (double)titleLabelFontSize;
- (double)titleLabelLeadingAnchorLayoutConstraintConstant;
- (double)titleLabelTrailingAnchorLayoutConstraintConstant;
- (unint64_t)sizeCategory;
- (unint64_t)theme;
- (void)commonInit;
- (void)loadConstraints;
- (void)setHeightAnchorLayoutConstraint:(id)a3;
- (void)setHeightAnchorLayoutConstraintConstantFontMultiplier:(double)a3;
- (void)setLayerCornerRadius:(double)a3;
- (void)setSizeCategory:(unint64_t)a3;
- (void)setTheme:(unint64_t)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabelFontSize:(double)a3;
- (void)setTitleLabelLeadingAnchorLayoutConstraint:(id)a3;
- (void)setTitleLabelLeadingAnchorLayoutConstraintConstant:(double)a3;
- (void)setTitleLabelTrailingAnchorLayoutConstraint:(id)a3;
- (void)setTitleLabelTrailingAnchorLayoutConstraintConstant:(double)a3;
- (void)setWidthAnchorLayoutConstraint:(id)a3;
- (void)unloadConstraints;
- (void)updateActiveHorizontalConstraints;
- (void)updateConstraintsConstants;
- (void)updateFonts;
- (void)updateSizeCategory;
- (void)updateTheme;
@end

@implementation TPBadgeView

- (TPBadgeView)initWithTitle:(id)a3
{
  return [(TPBadgeView *)self initWithTitle:a3 theme:0];
}

- (TPBadgeView)initWithTitle:(id)a3 theme:(unint64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TPBadgeView;
  v7 = -[TPView initWithFrame:](&v10, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v8 = v7;
  if (v7)
  {
    v7->_theme = a4;
    [(UILabel *)v7->_titleLabel setText:v6];
    [(TPBadgeView *)v8 updateTheme];
  }

  return v8;
}

- (void)commonInit
{
  v12.receiver = self;
  v12.super_class = (Class)TPBadgeView;
  [(TPView *)&v12 commonInit];
  [(TPBadgeView *)self _setHostsLayoutEngine:1];
  self->_sizeCategory = 0;
  [(TPBadgeView *)self updateSizeCategory];
  [(TPBadgeView *)self layerCornerRadius];
  [(TPBadgeView *)self scaledLayoutValueForBaseValue:"scaledLayoutValueForBaseValue:"];
  double v4 = v3;
  v5 = [(TPBadgeView *)self layer];
  [v5 setCornerRadius:v4];

  id v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v6;

  [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v8) = 1148846080;
  [(UILabel *)self->_titleLabel setContentCompressionResistancePriority:0 forAxis:v8];
  LODWORD(v9) = 1148846080;
  [(UILabel *)self->_titleLabel setContentCompressionResistancePriority:1 forAxis:v9];
  LODWORD(v10) = 1148846080;
  [(UILabel *)self->_titleLabel setContentHuggingPriority:0 forAxis:v10];
  LODWORD(v11) = 1148846080;
  [(UILabel *)self->_titleLabel setContentHuggingPriority:1 forAxis:v11];
  [(TPBadgeView *)self addSubview:self->_titleLabel];
}

- (void)loadConstraints
{
  v28.receiver = self;
  v28.super_class = (Class)TPBadgeView;
  [(TPView *)&v28 loadConstraints];
  double v3 = [(TPBadgeView *)self titleLabel];
  double v4 = [v3 centerXAnchor];
  v5 = [(TPBadgeView *)self centerXAnchor];
  id v6 = [v4 constraintEqualToAnchor:v5];

  [v6 setActive:1];
  v7 = [(TPBadgeView *)self widthAnchor];
  double v8 = [(TPBadgeView *)self heightAnchor];
  double v9 = [v7 constraintEqualToAnchor:v8];

  double v10 = NSStringFromSelector(sel_widthAnchorLayoutConstraint);
  [v9 setIdentifier:v10];

  [(TPBadgeView *)self setWidthAnchorLayoutConstraint:v9];
  double v11 = [(TPBadgeView *)self titleLabel];
  objc_super v12 = [v11 leadingAnchor];
  v13 = [(TPBadgeView *)self leadingAnchor];
  [(TPBadgeView *)self titleLabelLeadingAnchorLayoutConstraintConstant];
  -[TPBadgeView scaledLayoutValueForBaseValue:shouldLowerBound:](self, "scaledLayoutValueForBaseValue:shouldLowerBound:", 1);
  v14 = objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13);

  v15 = NSStringFromSelector(sel_titleLabelLeadingAnchorLayoutConstraint);
  [v14 setIdentifier:v15];

  [(TPBadgeView *)self setTitleLabelLeadingAnchorLayoutConstraint:v14];
  v16 = [(TPBadgeView *)self trailingAnchor];
  v17 = [(TPBadgeView *)self titleLabel];
  v18 = [v17 trailingAnchor];
  [(TPBadgeView *)self titleLabelTrailingAnchorLayoutConstraintConstant];
  -[TPBadgeView scaledLayoutValueForBaseValue:shouldLowerBound:](self, "scaledLayoutValueForBaseValue:shouldLowerBound:", 1);
  v19 = objc_msgSend(v16, "constraintEqualToAnchor:constant:", v18);

  v20 = NSStringFromSelector(sel_titleLabelTrailingAnchorLayoutConstraint);
  [v19 setIdentifier:v20];

  [(TPBadgeView *)self setTitleLabelTrailingAnchorLayoutConstraint:v19];
  [(TPBadgeView *)self updateActiveHorizontalConstraints];
  v21 = [(TPBadgeView *)self titleLabel];
  v22 = [v21 centerYAnchor];
  v23 = [(TPBadgeView *)self centerYAnchor];
  v24 = [v22 constraintEqualToAnchor:v23];

  [v24 setActive:1];
  v25 = [(TPBadgeView *)self heightAnchor];
  [(TPBadgeView *)self suggestedHeight];
  v26 = objc_msgSend(v25, "constraintEqualToConstant:");

  v27 = NSStringFromSelector(sel_heightAnchorLayoutConstraint);
  [v26 setIdentifier:v27];

  [v26 setActive:1];
  [(TPBadgeView *)self setHeightAnchorLayoutConstraint:v26];
}

- (void)updateConstraintsConstants
{
  v19.receiver = self;
  v19.super_class = (Class)TPBadgeView;
  [(TPView *)&v19 updateConstraintsConstants];
  [(TPBadgeView *)self layerCornerRadius];
  [(TPBadgeView *)self scaledLayoutValueForBaseValue:"scaledLayoutValueForBaseValue:"];
  double v4 = v3;
  v5 = [(TPBadgeView *)self layer];
  [v5 setCornerRadius:v4];

  id v6 = [(TPBadgeView *)self titleLabel];
  v7 = [v6 font];
  [v7 pointSize];
  double v9 = v8;
  [(TPBadgeView *)self heightAnchorLayoutConstraintConstantFontMultiplier];
  double v11 = v9 * v10;
  objc_super v12 = [(TPBadgeView *)self heightAnchorLayoutConstraint];
  [v12 setConstant:v11];

  [(TPBadgeView *)self titleLabelLeadingAnchorLayoutConstraintConstant];
  -[TPBadgeView scaledLayoutValueForBaseValue:shouldLowerBound:](self, "scaledLayoutValueForBaseValue:shouldLowerBound:", 1);
  double v14 = v13;
  v15 = [(TPBadgeView *)self titleLabelLeadingAnchorLayoutConstraint];
  [v15 setConstant:v14];

  [(TPBadgeView *)self titleLabelTrailingAnchorLayoutConstraintConstant];
  -[TPBadgeView scaledLayoutValueForBaseValue:shouldLowerBound:](self, "scaledLayoutValueForBaseValue:shouldLowerBound:", 1);
  double v17 = v16;
  v18 = [(TPBadgeView *)self titleLabelTrailingAnchorLayoutConstraint];
  [v18 setConstant:v17];
}

- (void)unloadConstraints
{
  double v3 = [(TPBadgeView *)self widthAnchorLayoutConstraint];
  [v3 setActive:0];

  [(TPBadgeView *)self setWidthAnchorLayoutConstraint:0];
  double v4 = [(TPBadgeView *)self titleLabelLeadingAnchorLayoutConstraint];
  [v4 setActive:0];

  [(TPBadgeView *)self setTitleLabelLeadingAnchorLayoutConstraint:0];
  v5 = [(TPBadgeView *)self titleLabelTrailingAnchorLayoutConstraint];
  [v5 setActive:0];

  [(TPBadgeView *)self setTitleLabelTrailingAnchorLayoutConstraint:0];
  id v6 = [(TPBadgeView *)self heightAnchorLayoutConstraint];
  [v6 setActive:0];

  [(TPBadgeView *)self setHeightAnchorLayoutConstraint:0];
  v7.receiver = self;
  v7.super_class = (Class)TPBadgeView;
  [(TPView *)&v7 unloadConstraints];
}

- (void)updateFonts
{
  v9.receiver = self;
  v9.super_class = (Class)TPBadgeView;
  [(TPView *)&v9 updateFonts];
  if ([(TPBadgeView *)self sizeCategory] == 3)
  {
    double v3 = [MEMORY[0x1E4FB17A8] metricsForTextStyle:*MEMORY[0x1E4FB28D8]];
    double v4 = (void *)MEMORY[0x1E4FB08E0];
    [(TPBadgeView *)self titleLabelFontSize];
    v5 = objc_msgSend(v4, "systemFontOfSize:weight:");
    id v6 = [v3 scaledFontForFont:v5 maximumPointSize:22.3125];

    objc_super v7 = [(TPBadgeView *)self titleLabel];
    [v7 setFont:v6];
  }
  else
  {
    double v8 = (void *)MEMORY[0x1E4FB08E0];
    [(TPBadgeView *)self titleLabelFontSize];
    [(TPBadgeView *)self scaledLayoutValueForBaseValue:"scaledLayoutValueForBaseValue:"];
    double v3 = objc_msgSend(v8, "systemFontOfSize:weight:");
    id v6 = [(TPBadgeView *)self titleLabel];
    [v6 setFont:v3];
  }
}

- (void)updateSizeCategory
{
  unint64_t v3 = [(TPBadgeView *)self sizeCategory];
  if (v3 <= 5)
  {
    double v4 = dbl_1C2F72C08[v3];
    double v5 = dbl_1C2F72C38[v3];
    double v6 = dbl_1C2F72C68[v3];
    [(TPBadgeView *)self setLayerCornerRadius:dbl_1C2F72BD8[v3]];
    [(TPBadgeView *)self setTitleLabelFontSize:v4];
    [(TPBadgeView *)self setHeightAnchorLayoutConstraintConstantFontMultiplier:v5];
    [(TPBadgeView *)self setTitleLabelLeadingAnchorLayoutConstraintConstant:v6];
    [(TPBadgeView *)self setTitleLabelTrailingAnchorLayoutConstraintConstant:v6];
  }
  [(TPBadgeView *)self updateConstraintsConstants];
}

- (void)updateTheme
{
  switch(self->_theme)
  {
    case 0uLL:
      unint64_t v3 = [MEMORY[0x1E4FB1618] dynamicTertiaryLabelColor];
      [(TPBadgeView *)self setBackgroundColor:v3];

      double v4 = [MEMORY[0x1E4FB1618] clearColor];
      double v5 = [(TPBadgeView *)self titleLabel];
      [v5 setBackgroundColor:v4];

      uint64_t v6 = [MEMORY[0x1E4FB1618] dynamicBackgroundColor];
      goto LABEL_12;
    case 1uLL:
      objc_super v7 = [MEMORY[0x1E4FB1618] whiteColor];
      [(TPBadgeView *)self setBackgroundColor:v7];

      double v8 = [MEMORY[0x1E4FB1618] whiteColor];
      objc_super v9 = [(TPBadgeView *)self titleLabel];
      [v9 setBackgroundColor:v8];

      uint64_t v6 = [MEMORY[0x1E4FB1618] blackColor];
      goto LABEL_12;
    case 2uLL:
      double v10 = [MEMORY[0x1E4FB1618] blackColor];
      [(TPBadgeView *)self setBackgroundColor:v10];

      uint64_t v11 = [MEMORY[0x1E4FB1618] blackColor];
      goto LABEL_11;
    case 3uLL:
      objc_super v12 = [MEMORY[0x1E4FB1618] whiteColor];
      [(TPBadgeView *)self setBackgroundColor:v12];

      double v13 = [MEMORY[0x1E4FB1618] whiteColor];
      double v14 = [(TPBadgeView *)self titleLabel];
      [v14 setBackgroundColor:v13];

      uint64_t v6 = objc_msgSend(MEMORY[0x1E4FB1618], "_tp_bluePillColor");
      goto LABEL_12;
    case 4uLL:
      v15 = [MEMORY[0x1E4FB1618] whiteColor];
      [(TPBadgeView *)self setBackgroundColor:v15];

      double v16 = [MEMORY[0x1E4FB1618] whiteColor];
      double v17 = [(TPBadgeView *)self titleLabel];
      [v17 setBackgroundColor:v16];

      uint64_t v6 = objc_msgSend(MEMORY[0x1E4FB1618], "_tp_greenPillColor");
      goto LABEL_12;
    case 5uLL:
      goto LABEL_8;
    case 6uLL:
      v18 = [MEMORY[0x1E4FB1618] labelColor];
      [(TPBadgeView *)self setBackgroundColor:v18];

      objc_super v19 = [MEMORY[0x1E4FB1618] clearColor];
      v20 = [(TPBadgeView *)self titleLabel];
      [v20 setBackgroundColor:v19];

      v21 = [MEMORY[0x1E4FB1618] tableBackgroundColor];
      v22 = [(TPBadgeView *)self titleLabel];
      [v22 setTextColor:v21];

LABEL_8:
      v23 = [MEMORY[0x1E4FB1618] dynamicCarSecondaryColor];
      [(TPBadgeView *)self setBackgroundColor:v23];

      v24 = [MEMORY[0x1E4FB1618] clearColor];
      v25 = [(TPBadgeView *)self titleLabel];
      [v25 setBackgroundColor:v24];

      uint64_t v6 = [MEMORY[0x1E4FB1618] tableBackgroundColor];
      goto LABEL_12;
    case 7uLL:
      v26 = [MEMORY[0x1E4FB1618] systemGrayColor];
      [(TPBadgeView *)self setBackgroundColor:v26];

      uint64_t v11 = [MEMORY[0x1E4FB1618] clearColor];
      goto LABEL_11;
    case 8uLL:
      v27 = [MEMORY[0x1E4FB1618] systemBlueColor];
      [(TPBadgeView *)self setBackgroundColor:v27];

      uint64_t v11 = [MEMORY[0x1E4FB1618] systemBlueColor];
LABEL_11:
      objc_super v28 = (void *)v11;
      v29 = [(TPBadgeView *)self titleLabel];
      [v29 setBackgroundColor:v28];

      uint64_t v6 = [MEMORY[0x1E4FB1618] whiteColor];
LABEL_12:
      id v31 = (id)v6;
      v30 = [(TPBadgeView *)self titleLabel];
      [v30 setTextColor:v31];

      break;
    default:
      return;
  }
}

- (void)updateActiveHorizontalConstraints
{
  unint64_t v3 = [(TPBadgeView *)self titleLabel];
  double v4 = [v3 text];
  unint64_t v5 = [v4 length];

  if (v5 < 2)
  {
    double v8 = [(TPBadgeView *)self titleLabelLeadingAnchorLayoutConstraint];
    [v8 setActive:0];

    objc_super v9 = [(TPBadgeView *)self titleLabelTrailingAnchorLayoutConstraint];
    [v9 setActive:0];

    [(TPBadgeView *)self widthAnchorLayoutConstraint];
  }
  else
  {
    uint64_t v6 = [(TPBadgeView *)self widthAnchorLayoutConstraint];
    [v6 setActive:0];

    objc_super v7 = [(TPBadgeView *)self titleLabelLeadingAnchorLayoutConstraint];
    [v7 setActive:1];

    [(TPBadgeView *)self titleLabelTrailingAnchorLayoutConstraint];
  }
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v10 setActive:1];
}

- (void)setSizeCategory:(unint64_t)a3
{
  if (self->_sizeCategory != a3)
  {
    self->_sizeCategory = a3;
    [(TPBadgeView *)self updateSizeCategory];
  }
}

- (void)setTheme:(unint64_t)a3
{
  if (self->_theme != a3)
  {
    self->_theme = a3;
    [(TPBadgeView *)self updateTheme];
  }
}

- (void)setTitle:(id)a3
{
  id v7 = a3;
  double v4 = [(TPBadgeView *)self titleLabel];
  unint64_t v5 = [v4 text];

  if (([v5 isEqualToString:v7] & 1) == 0)
  {
    [(UILabel *)self->_titleLabel setText:v7];
    [(UILabel *)self->_titleLabel sizeToFit];
    uint64_t v6 = [v5 length];
    if (v6 != [v7 length]) {
      [(TPBadgeView *)self updateActiveHorizontalConstraints];
    }
  }
}

- (NSString)title
{
  v2 = [(TPBadgeView *)self titleLabel];
  unint64_t v3 = [v2 text];

  return (NSString *)v3;
}

- (double)suggestedHeight
{
  [(TPBadgeView *)self heightAnchorLayoutConstraintConstantFontMultiplier];
  double v4 = v3;
  unint64_t v5 = [(TPBadgeView *)self titleLabel];
  uint64_t v6 = [v5 font];
  [v6 pointSize];
  double v8 = v4 * v7;

  return v8;
}

- (double)scaledLayoutValueForBaseValue:(double)a3
{
  [(TPBadgeView *)self scaledLayoutValueForBaseValue:0 shouldLowerBound:a3];
  return result;
}

- (double)scaledLayoutValueForBaseValue:(double)a3 shouldLowerBound:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D8]];
  [v7 _scaledValueForValue:a3];
  double v9 = v8;

  if ([(TPBadgeView *)self sizeCategory] == 3)
  {
    id v10 = [(TPBadgeView *)self titleLabel];
    uint64_t v11 = [v10 font];
    [v11 _scaledValueForValue:a3];
    double v9 = v12;
  }
  double result = fmax(v9, a3);
  if (!v4) {
    return v9;
  }
  return result;
}

- (CGSize)_layoutSizeThatFits:(CGSize)a3 fixedAxes:(unint64_t)a4
{
  LODWORD(v5) = 1148846080;
  if (a4) {
    *(float *)&double v4 = 1000.0;
  }
  else {
    *(float *)&double v4 = 50.0;
  }
  if ((a4 & 2) == 0) {
    *(float *)&double v5 = 50.0;
  }
  -[TPBadgeView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3.width, a3.height, v4, v5);
  result.height = v7;
  result.width = v6;
  return result;
}

- (BOOL)_hasBaseline
{
  return 1;
}

- (unint64_t)sizeCategory
{
  return self->_sizeCategory;
}

- (unint64_t)theme
{
  return self->_theme;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (double)titleLabelFontSize
{
  return self->_titleLabelFontSize;
}

- (void)setTitleLabelFontSize:(double)a3
{
  self->_titleLabelFontSize = a3;
}

- (double)layerCornerRadius
{
  return self->_layerCornerRadius;
}

- (void)setLayerCornerRadius:(double)a3
{
  self->_layerCornerRadius = a3;
}

- (NSLayoutConstraint)heightAnchorLayoutConstraint
{
  return self->_heightAnchorLayoutConstraint;
}

- (void)setHeightAnchorLayoutConstraint:(id)a3
{
}

- (NSLayoutConstraint)widthAnchorLayoutConstraint
{
  return self->_widthAnchorLayoutConstraint;
}

- (void)setWidthAnchorLayoutConstraint:(id)a3
{
}

- (NSLayoutConstraint)titleLabelLeadingAnchorLayoutConstraint
{
  return self->_titleLabelLeadingAnchorLayoutConstraint;
}

- (void)setTitleLabelLeadingAnchorLayoutConstraint:(id)a3
{
}

- (NSLayoutConstraint)titleLabelTrailingAnchorLayoutConstraint
{
  return self->_titleLabelTrailingAnchorLayoutConstraint;
}

- (void)setTitleLabelTrailingAnchorLayoutConstraint:(id)a3
{
}

- (double)heightAnchorLayoutConstraintConstantFontMultiplier
{
  return self->_heightAnchorLayoutConstraintConstantFontMultiplier;
}

- (void)setHeightAnchorLayoutConstraintConstantFontMultiplier:(double)a3
{
  self->_heightAnchorLayoutConstraintConstantFontMultiplier = a3;
}

- (double)titleLabelLeadingAnchorLayoutConstraintConstant
{
  return self->_titleLabelLeadingAnchorLayoutConstraintConstant;
}

- (void)setTitleLabelLeadingAnchorLayoutConstraintConstant:(double)a3
{
  self->_titleLabelLeadingAnchorLayoutConstraintConstant = a3;
}

- (double)titleLabelTrailingAnchorLayoutConstraintConstant
{
  return self->_titleLabelTrailingAnchorLayoutConstraintConstant;
}

- (void)setTitleLabelTrailingAnchorLayoutConstraintConstant:(double)a3
{
  self->_titleLabelTrailingAnchorLayoutConstraintConstant = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabelTrailingAnchorLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelLeadingAnchorLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_widthAnchorLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_heightAnchorLayoutConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end