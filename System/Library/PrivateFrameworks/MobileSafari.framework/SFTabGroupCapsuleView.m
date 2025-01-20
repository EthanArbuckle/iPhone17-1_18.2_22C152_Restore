@interface SFTabGroupCapsuleView
- (NSString)title;
- (SFTabGroupCapsuleView)initWithFrame:(CGRect)a3;
- (void)setTitle:(id)a3;
@end

@implementation SFTabGroupCapsuleView

- (SFTabGroupCapsuleView)initWithFrame:(CGRect)a3
{
  v26[4] = *MEMORY[0x1E4F143B8];
  v25.receiver = self;
  v25.super_class = (Class)SFTabGroupCapsuleView;
  v3 = -[SFTabGroupCapsuleView initWithFrame:](&v25, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1930]);
    [(SFTabGroupCapsuleView *)v3 bounds];
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:");
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v5;

    [(UILabel *)v3->_titleLabel setAdjustsFontForContentSizeCategory:1];
    v7 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2908]];
    [(UILabel *)v3->_titleLabel setFont:v7];

    [(UILabel *)v3->_titleLabel setTextAlignment:1];
    [(UILabel *)v3->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SFTabGroupCapsuleView *)v3 addSubview:v3->_titleLabel];
    -[SFTabGroupCapsuleView setLayoutMargins:](v3, "setLayoutMargins:", *MEMORY[0x1E4FB3310], 12.0, *MEMORY[0x1E4FB3310], 12.0);
    v8 = [(SFTabGroupCapsuleView *)v3 layoutMarginsGuide];
    v19 = (void *)MEMORY[0x1E4F28DC8];
    v24 = [(UILabel *)v3->_titleLabel centerXAnchor];
    v23 = [v8 centerXAnchor];
    v22 = [v24 constraintEqualToAnchor:v23];
    v26[0] = v22;
    v21 = [(UILabel *)v3->_titleLabel centerYAnchor];
    v20 = [v8 centerYAnchor];
    v9 = [v21 constraintEqualToAnchor:v20];
    v26[1] = v9;
    v10 = [(UILabel *)v3->_titleLabel leadingAnchor];
    v11 = [v8 leadingAnchor];
    v12 = [v10 constraintEqualToAnchor:v11];
    v26[2] = v12;
    v13 = [(UILabel *)v3->_titleLabel topAnchor];
    v14 = [v8 topAnchor];
    v15 = [v13 constraintEqualToAnchor:v14];
    v26[3] = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:4];
    [v19 activateConstraints:v16];

    v17 = v3;
  }

  return v3;
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)setTitle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end