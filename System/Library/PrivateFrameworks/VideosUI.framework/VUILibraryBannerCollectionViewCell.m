@interface VUILibraryBannerCollectionViewCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (VUILabel)titleLabel;
- (VUILibraryBannerCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation VUILibraryBannerCollectionViewCell

- (VUILibraryBannerCollectionViewCell)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)VUILibraryBannerCollectionViewCell;
  v3 = -[VUILibraryBannerCollectionViewCell initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(VUITextLayout);
    [(VUITextLayout *)v4 setFontSize:13.0];
    [(VUITextLayout *)v4 setFontWeight:7];
    [(VUITextLayout *)v4 setAlignment:1];
    v5 = [MEMORY[0x1E4FB1618] whiteColor];
    [(VUITextLayout *)v4 setColor:v5];

    -[VUITextLayout setMargin:](v4, "setMargin:", 6.0, 0.0, 7.0, 0.0);
    uint64_t v6 = +[VUILabel labelWithString:&stru_1F3E921E0 textLayout:v4 existingLabel:0];
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (VUILabel *)v6;

    v8 = [(VUILibraryBannerCollectionViewCell *)v3 contentView];
    [v8 addSubview:v3->_titleLabel];

    v9 = [MEMORY[0x1E4FB1618] systemGrayColor];
    [(VUILibraryBannerCollectionViewCell *)v3 setBackgroundColor:v9];

    [(VUILibraryBannerCollectionViewCell *)v3 setUserInteractionEnabled:0];
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  objc_msgSend(MEMORY[0x1E4FB1F48], "vui_padding", a3.width, a3.height);
  -[VUILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", width - v5 - v6, 1.79769313e308);
  double v8 = v7;
  v9 = [(VUILabel *)self->_titleLabel textLayout];
  [v9 margin];
  double v11 = v8 + v10;

  v12 = [(VUILabel *)self->_titleLabel textLayout];
  [v12 margin];
  double v14 = v11 + v13;

  double v15 = width;
  double v16 = v14;
  result.height = v16;
  result.double width = v15;
  return result;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)VUILibraryBannerCollectionViewCell;
  [(VUILibraryBannerCollectionViewCell *)&v13 layoutSubviews];
  [(VUILibraryBannerCollectionViewCell *)self bounds];
  double Width = CGRectGetWidth(v14);
  objc_msgSend(MEMORY[0x1E4FB1F48], "vui_padding");
  double v5 = v4;
  double v7 = Width - v4 - v6;
  -[VUILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v7, 1.79769313e308);
  double v9 = v8;
  titleLabel = self->_titleLabel;
  double v11 = [(VUILabel *)titleLabel textLayout];
  [v11 margin];
  -[VUILabel setFrame:](titleLabel, "setFrame:", v5, v12, v7, v9);
}

- (VUILabel)titleLabel
{
  return self->_titleLabel;
}

- (void).cxx_destruct
{
}

@end