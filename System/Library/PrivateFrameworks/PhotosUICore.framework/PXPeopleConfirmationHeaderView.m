@interface PXPeopleConfirmationHeaderView
+ (CGSize)_sizeForString:(id)a3 width:(double)a4 multiline:(BOOL)a5 font:(id)a6;
+ (CGSize)sizeForTitle:(id)a3 boundingSize:(CGSize)a4;
+ (id)_titleFont;
- (NSString)title;
- (PXPeopleConfirmationHeaderView)initWithFrame:(CGRect)a3;
- (PXPerson)person;
- (UILabel)titleLabel;
- (void)_setupHeader;
- (void)prepareForReuse;
- (void)setPerson:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
@end

@implementation PXPeopleConfirmationHeaderView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_person, 0);
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (PXPerson)person
{
  return self->_person;
}

- (NSString)title
{
  v2 = [(PXPeopleConfirmationHeaderView *)self titleLabel];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(PXPeopleConfirmationHeaderView *)self titleLabel];
  [v5 setText:v4];
}

- (void)setPerson:(id)a3
{
}

- (void)_setupHeader
{
  v20[3] = *MEMORY[0x1E4F143B8];
  v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  [(UILabel *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)v3 setTextAlignment:4];
  id v4 = +[PXPeopleConfirmationHeaderView _titleFont];
  [(UILabel *)v3 setFont:v4];

  [(UILabel *)v3 setAdjustsFontForContentSizeCategory:1];
  [(PXPeopleConfirmationHeaderView *)self addSubview:v3];
  titleLabel = self->_titleLabel;
  self->_titleLabel = v3;
  v6 = v3;

  v7 = [(PXPeopleConfirmationHeaderView *)self safeAreaLayoutGuide];
  v19 = [v7 leadingAnchor];
  uint64_t v8 = [v7 trailingAnchor];
  v17 = (void *)MEMORY[0x1E4F28DC8];
  v18 = (void *)v8;
  v9 = [(UILabel *)v6 bottomAnchor];
  v10 = [v7 bottomAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  v20[0] = v11;
  v12 = [(UILabel *)v6 leadingAnchor];
  v13 = [v12 constraintEqualToAnchor:v19 constant:20.0];
  v20[1] = v13;
  v14 = [(UILabel *)v6 trailingAnchor];
  v15 = [v14 constraintEqualToAnchor:v8 constant:-20.0];
  v20[2] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];
  [v17 activateConstraints:v16];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)PXPeopleConfirmationHeaderView;
  [(PXPeopleConfirmationHeaderView *)&v3 prepareForReuse];
  [(PXPeopleConfirmationHeaderView *)self setTitle:&stru_1F00B0030];
  [(PXPeopleConfirmationHeaderView *)self setPerson:0];
}

- (PXPeopleConfirmationHeaderView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXPeopleConfirmationHeaderView;
  objc_super v3 = -[PXPeopleConfirmationHeaderView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3) {
    [(PXPeopleConfirmationHeaderView *)v3 _setupHeader];
  }
  return v4;
}

+ (id)_titleFont
{
  uint64_t v2 = *MEMORY[0x1E4FB2990];
  objc_super v3 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2990]];
  id v4 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:v2 addingSymbolicTraits:2 options:0];
  id v5 = (void *)MEMORY[0x1E4FB08E0];
  [v3 pointSize];
  objc_super v6 = objc_msgSend(v5, "fontWithDescriptor:size:", v4);

  return v6;
}

+ (CGSize)_sizeForString:(id)a3 width:(double)a4 multiline:(BOOL)a5 font:(id)a6
{
  BOOL v6 = a5;
  id v9 = a6;
  id v10 = a3;
  v11 = objc_opt_new();
  if (v6)
  {
    v12 = objc_opt_new();
    [v12 setLineBreakMode:0];
    [v11 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4FB0738]];
  }
  [v11 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4FB06F8]];
  objc_msgSend(v10, "boundingRectWithSize:options:attributes:context:", v6, v11, 0, a4, 0.0);
  double v14 = v13;
  double v16 = v15;

  double v17 = ceil(v14);
  double v18 = ceil(v16);
  result.height = v18;
  result.width = v17;
  return result;
}

+ (CGSize)sizeForTitle:(id)a3 boundingSize:(CGSize)a4
{
  CGFloat width = a4.width;
  CGFloat v5 = a4.width + -40.0;
  id v6 = a3;
  v7 = +[PXPeopleConfirmationHeaderView _titleFont];
  +[PXPeopleConfirmationHeaderView _sizeForString:v6 width:0 multiline:v7 font:v5];
  double v9 = v8;

  double v10 = v9 + 10.0 + 10.0;
  double v11 = width;
  result.height = v10;
  result.CGFloat width = v11;
  return result;
}

@end