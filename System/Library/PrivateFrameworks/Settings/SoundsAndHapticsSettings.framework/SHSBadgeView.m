@interface SHSBadgeView
- (CGSize)intrinsicContentSize;
- (NSString)text;
- (SHSBadgeView)init;
- (UILabel)badgeLabel;
- (double)baseline;
- (double)cornerRadius;
- (double)fontSize;
- (double)minPadding;
- (void)setBadgeLabel:(id)a3;
- (void)setBaseline:(double)a3;
- (void)setCornerRadius:(double)a3;
- (void)setFontSize:(double)a3;
- (void)setMinPadding:(double)a3;
- (void)setText:(id)a3;
@end

@implementation SHSBadgeView

- (SHSBadgeView)init
{
  v56.receiver = self;
  v56.super_class = (Class)SHSBadgeView;
  v2 = [(SHSBadgeView *)&v56 init];
  v3 = v2;
  if (v2)
  {
    v2->_fontSize = 9.2;
    v2->_cornerRadius = 2.0;
    v2->_minPadding = 3.5;
    v2->_baseline = 3.2;
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    badgeLabel = v3->_badgeLabel;
    v3->_badgeLabel = v4;

    v6 = [MEMORY[0x263F82770] defaultMetrics];
    v7 = [MEMORY[0x263F81708] systemFontOfSize:v3->_fontSize];
    v8 = [v6 scaledFontForFont:v7];

    v9 = [v8 fontDescriptor];
    v10 = [v9 fontDescriptorWithSymbolicTraits:2];

    v11 = [MEMORY[0x263F81708] fontWithDescriptor:v10 size:0.0];
    [(UILabel *)v3->_badgeLabel setFont:v11];

    [(UILabel *)v3->_badgeLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v3->_badgeLabel setNumberOfLines:1];
    v12 = [MEMORY[0x263F825C8] whiteColor];
    [(UILabel *)v3->_badgeLabel setTextColor:v12];

    [(UILabel *)v3->_badgeLabel setTextAlignment:1];
    [(UILabel *)v3->_badgeLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_badgeLabel setAdjustsFontForContentSizeCategory:1];
    [(SHSBadgeView *)v3 addSubview:v3->_badgeLabel];
    v13 = [MEMORY[0x263F825C8] systemGrayColor];
    [(SHSBadgeView *)v3 setBackgroundColor:v13];

    v14 = [MEMORY[0x263F82770] defaultMetrics];
    [v14 scaledValueForValue:v3->_cornerRadius];
    double v16 = v15;
    v17 = [(SHSBadgeView *)v3 layer];
    [v17 setCornerRadius:v16];

    v18 = [(SHSBadgeView *)v3 layer];
    [v18 setMasksToBounds:1];

    [(SHSBadgeView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v19) = 1148846080;
    [(SHSBadgeView *)v3 setContentCompressionResistancePriority:0 forAxis:v19];
    LODWORD(v20) = 1148846080;
    [(SHSBadgeView *)v3 setContentCompressionResistancePriority:1 forAxis:v20];
    LODWORD(v21) = 1148846080;
    [(SHSBadgeView *)v3 setContentHuggingPriority:0 forAxis:v21];
    v22 = [(SHSBadgeView *)v3 widthAnchor];
    v23 = [(SHSBadgeView *)v3 heightAnchor];
    v24 = [v22 constraintGreaterThanOrEqualToAnchor:v23 multiplier:1.0];
    [v24 setActive:1];

    v25 = [(SHSBadgeView *)v3 widthAnchor];
    v26 = [MEMORY[0x263F82770] defaultMetrics];
    [v26 scaledValueForValue:13.0];
    v27 = objc_msgSend(v25, "constraintGreaterThanOrEqualToConstant:");
    [v27 setActive:1];

    v28 = [(SHSBadgeView *)v3 heightAnchor];
    v29 = [MEMORY[0x263F82770] defaultMetrics];
    [v29 scaledValueForValue:13.0];
    v30 = objc_msgSend(v28, "constraintGreaterThanOrEqualToConstant:");
    [v30 setActive:1];

    v31 = [(SHSBadgeView *)v3 topAnchor];
    v32 = [(UILabel *)v3->_badgeLabel topAnchor];
    v33 = [MEMORY[0x263F82770] defaultMetrics];
    [v33 scaledValueForValue:v3->_minPadding];
    v34 = objc_msgSend(v31, "constraintGreaterThanOrEqualToAnchor:constant:", v32);
    [v34 setActive:1];

    v35 = [(SHSBadgeView *)v3 trailingAnchor];
    v36 = [(UILabel *)v3->_badgeLabel trailingAnchor];
    v37 = [MEMORY[0x263F82770] defaultMetrics];
    [v37 scaledValueForValue:v3->_minPadding];
    v38 = objc_msgSend(v35, "constraintGreaterThanOrEqualToAnchor:constant:", v36);
    [v38 setActive:1];

    v39 = [(UILabel *)v3->_badgeLabel leadingAnchor];
    v40 = [(SHSBadgeView *)v3 leadingAnchor];
    v41 = [MEMORY[0x263F82770] defaultMetrics];
    [v41 scaledValueForValue:v3->_minPadding];
    v42 = objc_msgSend(v39, "constraintGreaterThanOrEqualToAnchor:constant:", v40);
    [v42 setActive:1];

    v43 = [(UILabel *)v3->_badgeLabel bottomAnchor];
    v44 = [(SHSBadgeView *)v3 bottomAnchor];
    v45 = [MEMORY[0x263F82770] defaultMetrics];
    [v45 scaledValueForValue:v3->_minPadding];
    v46 = objc_msgSend(v43, "constraintGreaterThanOrEqualToAnchor:constant:", v44);
    [v46 setActive:1];

    v47 = [(SHSBadgeView *)v3 badgeLabel];
    v48 = [v47 centerYAnchor];
    v49 = [(SHSBadgeView *)v3 centerYAnchor];
    v50 = [v48 constraintEqualToAnchor:v49];
    [v50 setActive:1];

    v51 = [(SHSBadgeView *)v3 badgeLabel];
    v52 = [v51 centerXAnchor];
    v53 = [(SHSBadgeView *)v3 centerXAnchor];
    v54 = [v52 constraintEqualToAnchor:v53];
    [v54 setActive:1];
  }
  return v3;
}

- (NSString)text
{
  return [(UILabel *)self->_badgeLabel text];
}

- (void)setText:(id)a3
{
}

- (CGSize)intrinsicContentSize
{
  [(UILabel *)self->_badgeLabel intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;
  v7 = [MEMORY[0x263F82770] defaultMetrics];
  [v7 scaledValueForValue:self->_minPadding];
  double v9 = v4 + v8 * 2.0;
  v10 = [MEMORY[0x263F82770] defaultMetrics];
  [v10 scaledValueForValue:13.0];
  double v12 = v11;

  if (v6 < v12) {
    double v6 = v12;
  }

  double v13 = v9;
  double v14 = v6;
  result.height = v14;
  result.width = v13;
  return result;
}

- (UILabel)badgeLabel
{
  return self->_badgeLabel;
}

- (void)setBadgeLabel:(id)a3
{
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (double)minPadding
{
  return self->_minPadding;
}

- (void)setMinPadding:(double)a3
{
  self->_minPadding = a3;
}

- (double)baseline
{
  return self->_baseline;
}

- (void)setBaseline:(double)a3
{
  self->_baseline = a3;
}

- (void).cxx_destruct
{
}

@end