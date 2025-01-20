@interface CACCorrectionsCollectionViewCell
- (BOOL)isAccessibilityElement;
- (CACCorrectionsCollectionViewCell)initWithFrame:(CGRect)a3;
- (NSLayoutConstraint)widthConstraint;
- (UILabel)textLabel;
- (id)accessibilityLabel;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (unint64_t)accessibilityTraits;
- (void)setHighlighted:(BOOL)a3;
- (void)setWidthConstraint:(id)a3;
@end

@implementation CACCorrectionsCollectionViewCell

- (CACCorrectionsCollectionViewCell)initWithFrame:(CGRect)a3
{
  v41[4] = *MEMORY[0x263EF8340];
  v40.receiver = self;
  v40.super_class = (Class)CACCorrectionsCollectionViewCell;
  v3 = -[CACCorrectionsCollectionViewCell initWithFrame:](&v40, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = *MEMORY[0x263F83570];
    v5 = [MEMORY[0x263F82770] metricsForTextStyle:*MEMORY[0x263F83570]];
    v6 = [MEMORY[0x263F825C8] whiteColor];
    [(CACCorrectionsCollectionViewCell *)v3 setBackgroundColor:v6];

    id v7 = [MEMORY[0x263F825C8] lightGrayColor];
    uint64_t v8 = [v7 CGColor];
    v9 = [(CACCorrectionsCollectionViewCell *)v3 layer];
    [v9 setBorderColor:v8];

    [v5 scaledValueForValue:0.0];
    double v11 = round(v10);
    v12 = [(CACCorrectionsCollectionViewCell *)v3 layer];
    [v12 setBorderWidth:v11];

    [v5 scaledValueForValue:8.0];
    double v14 = round(v13);
    v15 = [(CACCorrectionsCollectionViewCell *)v3 layer];
    [v15 setCornerRadius:v14];

    uint64_t v16 = objc_opt_new();
    textLabel = v3->_textLabel;
    v3->_textLabel = (UILabel *)v16;

    [(UILabel *)v3->_textLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v18 = [MEMORY[0x263F82760] preferredFontForTextStyle:v4];
    [(UILabel *)v3->_textLabel setFont:v18];

    [(UILabel *)v3->_textLabel setTextAlignment:1];
    [(UILabel *)v3->_textLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v3->_textLabel setNumberOfLines:0];
    v19 = [(CACCorrectionsCollectionViewCell *)v3 contentView];
    [v19 addSubview:v3->_textLabel];
    v39 = v5;
    [v5 scaledValueForValue:8.0];
    double v21 = v20;
    [v5 scaledValueForValue:8.0];
    double v23 = v22;
    v33 = (void *)MEMORY[0x263F08938];
    v38 = [(UILabel *)v3->_textLabel leadingAnchor];
    v37 = [v19 leadingAnchor];
    v36 = [v38 constraintEqualToAnchor:v37 constant:v21];
    v41[0] = v36;
    v35 = [(UILabel *)v3->_textLabel trailingAnchor];
    v34 = [v19 trailingAnchor];
    v24 = [v35 constraintEqualToAnchor:v34 constant:-v21];
    v41[1] = v24;
    v25 = [(UILabel *)v3->_textLabel topAnchor];
    v26 = [v19 topAnchor];
    v27 = [v25 constraintEqualToAnchor:v26 constant:v23];
    v41[2] = v27;
    v28 = [(UILabel *)v3->_textLabel bottomAnchor];
    v29 = [v19 bottomAnchor];
    v30 = [v28 constraintEqualToAnchor:v29 constant:-v23];
    v41[3] = v30;
    v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:4];
    [v33 activateConstraints:v31];
  }
  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(UILabel *)self->_textLabel accessibilityLabel];
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F83260];
}

- (void)setHighlighted:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CACCorrectionsCollectionViewCell;
  -[CACCorrectionsCollectionViewCell setHighlighted:](&v6, sel_setHighlighted_);
  if (a3) {
    [MEMORY[0x263F825C8] grayColor];
  }
  else {
  v5 = [MEMORY[0x263F825C8] whiteColor];
  }
  [(CACCorrectionsCollectionViewCell *)self setBackgroundColor:v5];
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CACCorrectionsCollectionViewCell;
  v3 = [(CACCorrectionsCollectionViewCell *)&v7 preferredLayoutAttributesFittingAttributes:a3];
  [v3 size];
  objc_msgSend(v3, "setSize:", fmax(v4, 40.0), fmax(v5, 40.0));
  return v3;
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (NSLayoutConstraint)widthConstraint
{
  return self->_widthConstraint;
}

- (void)setWidthConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widthConstraint, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
}

@end