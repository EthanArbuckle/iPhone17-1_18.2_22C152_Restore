@interface PXPhotosGridPromptHeaderView
+ (CGSize)_instanceLayoutSubviews:(id)a3 forTitle:(id)a4 inBounds:(CGRect)a5;
+ (CGSize)sizeThatFits:(CGSize)a3 forTitle:(id)a4;
+ (id)_newTitleLabel;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)title;
- (PXPhotosGridPromptHeaderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setTitle:(id)a3;
@end

@implementation PXPhotosGridPromptHeaderView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

- (NSString)title
{
  return self->_title;
}

- (void)layoutSubviews
{
  id v7 = [(PXPhotosGridPromptHeaderView *)self title];
  [(PXPhotosGridPromptHeaderView *)self bounds];
  objc_msgSend((id)objc_opt_class(), "_instanceLayoutSubviews:forTitle:inBounds:", self, v7, v3, v4, v5, v6);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = objc_opt_class();
  id v7 = [(PXPhotosGridPromptHeaderView *)self title];
  objc_msgSend(v6, "sizeThatFits:forTitle:", v7, width, height);
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (void)setTitle:(id)a3
{
  if (self->_title != a3)
  {
    id v4 = a3;
    double v5 = (NSString *)[v4 copy];
    title = self->_title;
    self->_title = v5;

    [(UILabel *)self->_titleLabel setText:v4];
    [(PXPhotosGridPromptHeaderView *)self setNeedsLayout];
  }
}

- (PXPhotosGridPromptHeaderView)initWithFrame:(CGRect)a3
{
  v19.receiver = self;
  v19.super_class = (Class)PXPhotosGridPromptHeaderView;
  double v3 = -[PXPhotosGridPromptHeaderView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [(id)objc_opt_class() _newTitleLabel];
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v4;

    [(PXPhotosGridPromptHeaderView *)v3 addSubview:v3->_titleLabel];
    double v6 = [(PXPhotosGridPromptHeaderView *)v3 traitCollection];
    [v6 displayScale];
    double v8 = 1.0 / v7;

    [(PXPhotosGridPromptHeaderView *)v3 bounds];
    double v12 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v10, v9 - v8, v11, v8);
    [(UIView *)v12 setAutoresizingMask:10];
    separatorView = v3->_separatorView;
    v14 = [MEMORY[0x1E4FB1618] separatorColor];
    [(UIView *)separatorView setBackgroundColor:v14];

    v15 = v3->_separatorView;
    v3->_separatorView = v12;
    v16 = v12;

    [(PXPhotosGridPromptHeaderView *)v3 addSubview:v16];
    v17 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];

    [(PXPhotosGridPromptHeaderView *)v3 setBackgroundColor:v17];
  }
  return v3;
}

+ (CGSize)sizeThatFits:(CGSize)a3 forTitle:(id)a4
{
  objc_msgSend(a1, "_instanceLayoutSubviews:forTitle:inBounds:", 0, a4, 0.0, 0.0, a3.width, a3.height);
  result.double height = v5;
  result.double width = v4;
  return result;
}

+ (CGSize)_instanceLayoutSubviews:(id)a3 forTitle:(id)a4 inBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double v9 = (id *)a3;
  id v10 = a4;
  if (v9)
  {
    id v11 = v9[61];
  }
  else
  {
    id v11 = (id)[a1 _newTitleLabel];
    [v11 setText:v10];
  }
  objc_msgSend(v11, "sizeThatFits:", fmax(width + -22.0, 0.0), height);
  double v13 = v12;
  double v15 = v14 + 28.0;
  if (v9)
  {
    [v11 frame];
    v19.origin.x = (width - v13) * 0.5;
    v19.origin.y = (height - v15) * 0.5;
    v19.size.double width = v13;
    v19.size.double height = v15;
    CGRect v20 = CGRectIntegral(v19);
    objc_msgSend(v11, "setFrame:", v20.origin.x, v20.origin.y, v20.size.width, v20.size.height);
  }

  double v16 = v13;
  double v17 = v15;
  result.double height = v17;
  result.double width = v16;
  return result;
}

+ (id)_newTitleLabel
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  double v3 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
  [v2 setFont:v3];

  double v4 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v2 setTextColor:v4];

  [v2 setNumberOfLines:0];
  return v2;
}

@end