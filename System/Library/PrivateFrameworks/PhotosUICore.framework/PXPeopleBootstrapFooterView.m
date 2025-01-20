@interface PXPeopleBootstrapFooterView
+ (CGSize)sizeForBoundingSize:(CGSize)a3 descriptionText:(id)a4;
+ (id)_descriptionLabelFont;
- (NSString)descriptionText;
- (PXPeopleBootstrapFooterView)initWithFrame:(CGRect)a3;
- (UILabel)descriptionLabel;
- (void)setDescriptionText:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PXPeopleBootstrapFooterView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_descriptionText, 0);
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (NSString)descriptionText
{
  return self->_descriptionText;
}

- (void)setDescriptionText:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPeopleBootstrapFooterView *)self descriptionLabel];
  [v5 setText:v4];
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PXPeopleBootstrapFooterView;
  id v4 = a3;
  [(PXPeopleBootstrapFooterView *)&v8 traitCollectionDidChange:v4];
  id v5 = objc_msgSend(v4, "preferredContentSizeCategory", v8.receiver, v8.super_class);

  v6 = [(PXPeopleBootstrapFooterView *)self traitCollection];
  v7 = [v6 preferredContentSizeCategory];

  if (v5 != v7) {
    [(PXPeopleBootstrapFooterView *)self setNeedsLayout];
  }
}

- (PXPeopleBootstrapFooterView)initWithFrame:(CGRect)a3
{
  v25[4] = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)PXPeopleBootstrapFooterView;
  v3 = -[PXPeopleBootstrapFooterView initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    [(UILabel *)v4 setNumberOfLines:0];
    [(UILabel *)v4 setAdjustsFontForContentSizeCategory:1];
    id v5 = +[PXPeopleBootstrapFooterView _descriptionLabelFont];
    [(UILabel *)v4 setFont:v5];

    [(UILabel *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    v6 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v4 setTextColor:v6];

    [(PXPeopleBootstrapFooterView *)v3 addSubview:v4];
    descriptionLabel = v3->_descriptionLabel;
    v3->_descriptionLabel = v4;
    objc_super v8 = v4;

    v18 = (void *)MEMORY[0x1E4F28DC8];
    v23 = [(UILabel *)v8 leadingAnchor];
    v22 = [(PXPeopleBootstrapFooterView *)v3 leadingAnchor];
    v21 = [v23 constraintEqualToAnchor:v22 constant:20.0];
    v25[0] = v21;
    v20 = [(UILabel *)v8 trailingAnchor];
    v19 = [(PXPeopleBootstrapFooterView *)v3 trailingAnchor];
    v9 = [v20 constraintEqualToAnchor:v19 constant:-20.0];
    v25[1] = v9;
    v10 = [(UILabel *)v8 centerXAnchor];
    v11 = [(PXPeopleBootstrapFooterView *)v3 centerXAnchor];
    v12 = [v10 constraintEqualToAnchor:v11];
    v25[2] = v12;
    v13 = [(UILabel *)v8 lastBaselineAnchor];
    v14 = [(PXPeopleBootstrapFooterView *)v3 bottomAnchor];
    v15 = [v13 constraintEqualToAnchor:v14 constant:-20.0];
    v25[3] = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:4];
    [v18 activateConstraints:v16];
  }
  return v3;
}

+ (id)_descriptionLabelFont
{
  return (id)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
}

+ (CGSize)sizeForBoundingSize:(CGSize)a3 descriptionText:(id)a4
{
  CGFloat width = a3.width;
  v14[1] = *MEMORY[0x1E4F143B8];
  CGFloat v5 = a3.width + -40.0;
  uint64_t v13 = *MEMORY[0x1E4FB06F8];
  id v6 = a4;
  v7 = +[PXPeopleBootstrapFooterView _descriptionLabelFont];
  v14[0] = v7;
  objc_super v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  objc_msgSend(v6, "boundingRectWithSize:options:attributes:context:", 1, v8, 0, v5, 0.0);
  double v10 = v9;

  double v11 = ceil(v10) + 20.0;
  double v12 = width;
  result.height = v11;
  result.CGFloat width = v12;
  return result;
}

@end