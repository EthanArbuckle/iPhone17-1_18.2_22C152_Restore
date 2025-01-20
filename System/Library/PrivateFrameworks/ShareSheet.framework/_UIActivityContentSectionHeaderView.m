@interface _UIActivityContentSectionHeaderView
- (NSLayoutConstraint)titleLabelTopConstraint;
- (UILabel)titleLabel;
- (_UIActivityContentSectionHeaderView)initWithFrame:(CGRect)a3;
- (void)prepareForReuse;
- (void)setTitleLabel:(id)a3;
- (void)setTitleLabelTopConstraint:(id)a3;
@end

@implementation _UIActivityContentSectionHeaderView

- (_UIActivityContentSectionHeaderView)initWithFrame:(CGRect)a3
{
  v29.receiver = self;
  v29.super_class = (Class)_UIActivityContentSectionHeaderView;
  v3 = -[_UIActivityContentSectionHeaderView initWithFrame:](&v29, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v4;

    v6 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
    [(UILabel *)v3->_titleLabel setFont:v6];

    [(UILabel *)v3->_titleLabel setTextAlignment:1];
    v7 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v3->_titleLabel setTextColor:v7];

    [(UILabel *)v3->_titleLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v3->_titleLabel setNumberOfLines:0];
    [(UILabel *)v3->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v8) = 1148846080;
    [(UILabel *)v3->_titleLabel setContentCompressionResistancePriority:0 forAxis:v8];
    v9 = [(_UIActivityContentSectionHeaderView *)v3 titleLabel];
    [(_UIActivityContentSectionHeaderView *)v3 addSubview:v9];

    v10 = [MEMORY[0x1E4F1CA48] array];
    v11 = [(UILabel *)v3->_titleLabel topAnchor];
    v12 = [(_UIActivityContentSectionHeaderView *)v3 layoutMarginsGuide];
    v13 = [v12 topAnchor];
    uint64_t v14 = [v11 constraintEqualToAnchor:v13 constant:10.0];
    titleLabelTopConstraint = v3->_titleLabelTopConstraint;
    v3->_titleLabelTopConstraint = (NSLayoutConstraint *)v14;

    [v10 addObject:v3->_titleLabelTopConstraint];
    v16 = [(UILabel *)v3->_titleLabel bottomAnchor];
    v17 = [(_UIActivityContentSectionHeaderView *)v3 layoutMarginsGuide];
    v18 = [v17 bottomAnchor];
    v19 = [v16 constraintEqualToAnchor:v18];
    [v10 addObject:v19];

    v20 = [(UILabel *)v3->_titleLabel leadingAnchor];
    v21 = [(_UIActivityContentSectionHeaderView *)v3 layoutMarginsGuide];
    v22 = [v21 leadingAnchor];
    v23 = [v20 constraintEqualToAnchor:v22];
    [v10 addObject:v23];

    v24 = [(UILabel *)v3->_titleLabel trailingAnchor];
    v25 = [(_UIActivityContentSectionHeaderView *)v3 layoutMarginsGuide];
    v26 = [v25 trailingAnchor];
    v27 = [v24 constraintEqualToAnchor:v26];
    [v10 addObject:v27];

    [MEMORY[0x1E4F28DC8] activateConstraints:v10];
  }
  return v3;
}

- (void)prepareForReuse
{
  v2.receiver = self;
  v2.super_class = (Class)_UIActivityContentSectionHeaderView;
  [(_UIActivityContentSectionHeaderView *)&v2 prepareForReuse];
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (NSLayoutConstraint)titleLabelTopConstraint
{
  return self->_titleLabelTopConstraint;
}

- (void)setTitleLabelTopConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabelTopConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end