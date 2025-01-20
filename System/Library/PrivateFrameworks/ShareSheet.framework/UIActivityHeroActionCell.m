@interface UIActivityHeroActionCell
+ (double)heightForNumberOfLines:(double)a3;
+ (int64_t)numberOfLinesForTitle:(id)a3 itemWidth:(double)a4;
- (NSLayoutConstraint)bottomInsetConstraint;
- (NSLayoutConstraint)tallBottomInsetConstraint;
- (UIActivityHeroActionCell)initWithFrame:(CGRect)a3;
- (UIImageView)activityImageView;
- (UILabel)titleLabel;
- (UIStackView)stackView;
- (void)applyLayoutAttributes:(id)a3;
- (void)prepareForReuse;
- (void)setActivityImageView:(id)a3;
- (void)setBottomInsetConstraint:(id)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setStackView:(id)a3;
- (void)setTallBottomInsetConstraint:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)updateConstraints;
@end

@implementation UIActivityHeroActionCell

- (UIActivityHeroActionCell)initWithFrame:(CGRect)a3
{
  v49[2] = *MEMORY[0x1E4F143B8];
  v48.receiver = self;
  v48.super_class = (Class)UIActivityHeroActionCell;
  v3 = -[UIActivityActionCell initWithFrame:](&v48, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    v5 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
    [v4 setFont:v5];

    [v4 setAdjustsFontForContentSizeCategory:1];
    [v4 setTextAlignment:1];
    [v4 setNumberOfLines:2];
    LODWORD(v6) = 1036831949;
    [v4 _setHyphenationFactor:v6];
    LODWORD(v7) = 1144766464;
    [v4 setContentCompressionResistancePriority:1 forAxis:v7];
    [(UIActivityHeroActionCell *)v3 setTitleLabel:v4];
    id v8 = objc_alloc_init(MEMORY[0x1E4FB1838]);
    v9 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB28C8] scale:3];
    [v8 setPreferredSymbolConfiguration:v9];

    v10 = [MEMORY[0x1E4FB1618] labelColor];
    [v8 setTintColor:v10];

    [v8 setContentMode:4];
    LODWORD(v11) = 1144766464;
    [v8 setContentHuggingPriority:1 forAxis:v11];
    [(UIActivityHeroActionCell *)v3 setActivityImageView:v8];
    id v12 = objc_alloc(MEMORY[0x1E4FB1C60]);
    v13 = [(UIActivityHeroActionCell *)v3 activityImageView];
    v49[0] = v13;
    v14 = [(UIActivityHeroActionCell *)v3 titleLabel];
    v49[1] = v14;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];
    v16 = (void *)[v12 initWithArrangedSubviews:v15];

    [v16 setAxis:1];
    [v16 setAlignment:0];
    [v16 setDistribution:0];
    [v16 setSpacing:10.0];
    [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIActivityHeroActionCell *)v3 setStackView:v16];
    v17 = [(UIActivityHeroActionCell *)v3 contentView];
    v18 = [(UIActivityHeroActionCell *)v3 stackView];
    [v17 addSubview:v18];

    v19 = [MEMORY[0x1E4F1CA48] array];
    v20 = [(UIActivityHeroActionCell *)v3 stackView];
    v21 = [v20 topAnchor];
    v22 = [v17 topAnchor];
    v23 = [v21 constraintEqualToAnchor:v22 constant:18.0];
    [v19 addObject:v23];

    v24 = [(UIActivityHeroActionCell *)v3 stackView];
    v25 = [v24 leadingAnchor];
    v26 = [v17 leadingAnchor];
    v27 = [v25 constraintEqualToAnchor:v26 constant:4.0];
    [v19 addObject:v27];

    v28 = [v17 trailingAnchor];
    v29 = [(UIActivityHeroActionCell *)v3 stackView];
    v30 = [v29 trailingAnchor];
    v31 = [v28 constraintEqualToAnchor:v30 constant:4.0];
    [v19 addObject:v31];

    v32 = [v17 bottomAnchor];
    v33 = [(UIActivityHeroActionCell *)v3 stackView];
    v34 = [v33 lastBaselineAnchor];
    v35 = [v32 constraintGreaterThanOrEqualToAnchor:v34 constant:14.0];
    [v19 addObject:v35];

    v36 = [v17 heightAnchor];
    v37 = [v36 constraintGreaterThanOrEqualToConstant:80.0];
    [v19 addObject:v37];

    [MEMORY[0x1E4F28DC8] activateConstraints:v19];
    v38 = [v17 bottomAnchor];
    v39 = [(UIActivityHeroActionCell *)v3 stackView];
    v40 = [v39 lastBaselineAnchor];
    v41 = [v38 constraintEqualToAnchor:v40 constant:18.0];
    [(UIActivityHeroActionCell *)v3 setBottomInsetConstraint:v41];

    v42 = [v17 bottomAnchor];
    v43 = [(UIActivityHeroActionCell *)v3 stackView];
    v44 = [v43 lastBaselineAnchor];
    v45 = [v42 constraintEqualToAnchor:v44 constant:14.0];
    [(UIActivityHeroActionCell *)v3 setTallBottomInsetConstraint:v45];

    v46 = [MEMORY[0x1E4FB1498] listGroupedCellConfiguration];
    [(UIActivityHeroActionCell *)v3 setBackgroundConfiguration:v46];
  }
  return v3;
}

- (void)updateConstraints
{
  v8.receiver = self;
  v8.super_class = (Class)UIActivityHeroActionCell;
  [(UIActivityHeroActionCell *)&v8 updateConstraints];
  [(UIActivityHeroActionCell *)self bounds];
  CGFloat Height = CGRectGetHeight(v9);
  BOOL v4 = Height > 80.0;
  BOOL v5 = Height <= 80.0;
  double v6 = [(UIActivityHeroActionCell *)self bottomInsetConstraint];
  [v6 setActive:v5];

  double v7 = [(UIActivityHeroActionCell *)self tallBottomInsetConstraint];
  [v7 setActive:v4];
}

- (void)prepareForReuse
{
  v6.receiver = self;
  v6.super_class = (Class)UIActivityHeroActionCell;
  [(UIActivityActionCell *)&v6 prepareForReuse];
  v3 = [(UIActivityHeroActionCell *)self titleLabel];
  [v3 setText:0];

  BOOL v4 = [(UIActivityHeroActionCell *)self activityImageView];
  [v4 setImage:0];

  BOOL v5 = [(UIActivityHeroActionCell *)self stackView];
  [v5 setNeedsLayout];
}

- (void)applyLayoutAttributes:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UIActivityHeroActionCell;
  [(UIActivityHeroActionCell *)&v4 applyLayoutAttributes:a3];
  [(UIActivityHeroActionCell *)self setClipsToBounds:1];
  [(UIActivityHeroActionCell *)self _setContinuousCornerRadius:12.0];
}

- (void)setDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UIActivityHeroActionCell;
  -[UIActivityActionCell setDisabled:](&v7, sel_setDisabled_);
  if (v3) {
    double v5 = 0.4;
  }
  else {
    double v5 = 1.0;
  }
  objc_super v6 = [(UIActivityHeroActionCell *)self stackView];
  [v6 setAlpha:v5];
}

+ (int64_t)numberOfLinesForTitle:(id)a3 itemWidth:(double)a4
{
  v21[2] = *MEMORY[0x1E4F143B8];
  double v4 = a4 + -8.0;
  double v5 = (objc_class *)MEMORY[0x1E4FB1378];
  id v6 = a3;
  id v7 = objc_alloc_init(v5);
  LODWORD(v8) = 1036831949;
  [v7 setHyphenationFactor:v8];
  id v9 = objc_alloc(MEMORY[0x1E4F28B18]);
  v20[0] = *MEMORY[0x1E4FB12B0];
  v10 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
  v20[1] = *MEMORY[0x1E4FB12D0];
  v21[0] = v10;
  v21[1] = v7;
  double v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
  CFAttributedStringRef v12 = (const __CFAttributedString *)[v9 initWithString:v6 attributes:v11];

  v13 = CTLineCreateWithAttributedString(v12);
  CFIndex v14 = [v6 length];

  double OffsetForStringIndex = CTLineGetOffsetForStringIndex(v13, v14, 0);
  CFRelease(v13);
  if (OffsetForStringIndex >= v4)
  {
    id v17 = objc_alloc_init(MEMORY[0x1E4FB21C8]);
    [v17 setAttributedText:v12];
    objc_msgSend(v17, "setBounds:", 0.0, 0.0, v4, 1.79769313e308);
    v18 = [MEMORY[0x1E4FB21D0] metricsWithConfiguration:v17];
    int64_t v16 = [v18 numberOfLines];
  }
  else
  {
    int64_t v16 = 1;
  }

  return v16;
}

+ (double)heightForNumberOfLines:(double)a3
{
  double v4 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
  [v4 lineHeight];
  double v6 = v5 + 64.0;
  if (a3 > 1.0)
  {
    [v4 lineHeight];
    double v8 = v7;
    [v4 leading];
    double v6 = v6 + v8 + v9;
  }

  return ceil(v6);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UIImageView)activityImageView
{
  return self->_activityImageView;
}

- (void)setActivityImageView:(id)a3
{
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (NSLayoutConstraint)bottomInsetConstraint
{
  return self->_bottomInsetConstraint;
}

- (void)setBottomInsetConstraint:(id)a3
{
}

- (NSLayoutConstraint)tallBottomInsetConstraint
{
  return self->_tallBottomInsetConstraint;
}

- (void)setTallBottomInsetConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tallBottomInsetConstraint, 0);
  objc_storeStrong((id *)&self->_bottomInsetConstraint, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_activityImageView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end