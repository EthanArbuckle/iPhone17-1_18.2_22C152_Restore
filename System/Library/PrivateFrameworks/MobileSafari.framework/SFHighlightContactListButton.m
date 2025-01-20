@interface SFHighlightContactListButton
- (NSString)title;
- (SFHighlightContactListButton)initWithFrame:(CGRect)a3;
- (UIImage)image;
- (void)_updateBackgroundColor;
- (void)setHighlighted:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SFHighlightContactListButton

- (SFHighlightContactListButton)initWithFrame:(CGRect)a3
{
  v42[7] = *MEMORY[0x1E4F143B8];
  v41.receiver = self;
  v41.super_class = (Class)SFHighlightContactListButton;
  v3 = -[SFHighlightContactListButton initWithFrame:](&v41, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v4;

    uint64_t v6 = *MEMORY[0x1E4FB28C8];
    v7 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [(UILabel *)v3->_titleLabel setFont:v7];

    [(UILabel *)v3->_titleLabel setNumberOfLines:0];
    [(UILabel *)v3->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_titleLabel setAdjustsFontForContentSizeCategory:1];
    [(SFHighlightContactListButton *)v3 addSubview:v3->_titleLabel];
    v8 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    imageView = v3->_imageView;
    v3->_imageView = v8;

    [(UIImageView *)v3->_imageView setContentMode:4];
    v10 = objc_msgSend(MEMORY[0x1E4FB1618], "sf_safariAccentColor");
    [(UIImageView *)v3->_imageView setTintColor:v10];

    v11 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:v6 scale:3];
    [(UIImageView *)v3->_imageView setPreferredSymbolConfiguration:v11];

    [(UIImageView *)v3->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v12) = 1144766464;
    [(UIImageView *)v3->_imageView setContentCompressionResistancePriority:0 forAxis:v12];
    [(SFHighlightContactListButton *)v3 addSubview:v3->_imageView];
    v13 = [(SFHighlightContactListButton *)v3 layoutMarginsGuide];
    v31 = (void *)MEMORY[0x1E4F28DC8];
    v40 = [(UILabel *)v3->_titleLabel leadingAnchor];
    v39 = [v13 leadingAnchor];
    v38 = [v40 constraintEqualToAnchor:v39];
    v42[0] = v38;
    v37 = [(UILabel *)v3->_titleLabel topAnchor];
    v36 = [v13 topAnchor];
    v35 = [v37 constraintGreaterThanOrEqualToAnchor:v36];
    v42[1] = v35;
    v34 = [(UILabel *)v3->_titleLabel centerYAnchor];
    v33 = [(SFHighlightContactListButton *)v3 centerYAnchor];
    v32 = [v34 constraintEqualToAnchor:v33];
    v42[2] = v32;
    v29 = [(UIImageView *)v3->_imageView leadingAnchor];
    v28 = [(UILabel *)v3->_titleLabel trailingAnchor];
    v27 = [v29 constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:v28 multiplier:1.0];
    v42[3] = v27;
    v26 = [(UIImageView *)v3->_imageView centerYAnchor];
    v14 = [(SFHighlightContactListButton *)v3 centerYAnchor];
    v15 = [v26 constraintEqualToAnchor:v14];
    v42[4] = v15;
    v16 = [(UIImageView *)v3->_imageView topAnchor];
    v30 = v13;
    v17 = [v13 topAnchor];
    v18 = [v16 constraintGreaterThanOrEqualToAnchor:v17];
    v42[5] = v18;
    v19 = [(UIImageView *)v3->_imageView trailingAnchor];
    v20 = [v13 trailingAnchor];
    v21 = [v19 constraintEqualToAnchor:v20];
    v42[6] = v21;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:7];
    [v31 activateConstraints:v22];

    v23 = [MEMORY[0x1E4FB1618] labelColor];
    [(SFHighlightContactListButton *)v3 setTintColor:v23];

    [(SFHighlightContactListButton *)v3 _updateBackgroundColor];
    v24 = v3;
  }
  return v3;
}

- (UIImage)image
{
  return [(UIImageView *)self->_imageView image];
}

- (void)setImage:(id)a3
{
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)setTitle:(id)a3
{
}

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFHighlightContactListButton;
  [(SFHighlightContactListButton *)&v4 setHighlighted:a3];
  [(SFHighlightContactListButton *)self _updateBackgroundColor];
}

- (void)_updateBackgroundColor
{
  if ([(SFHighlightContactListButton *)self isHighlighted]) {
    [MEMORY[0x1E4FB1618] systemGray4Color];
  }
  else {
  id v3 = [MEMORY[0x1E4FB1618] secondarySystemGroupedBackgroundColor];
  }
  [(SFHighlightContactListButton *)self setBackgroundColor:v3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end