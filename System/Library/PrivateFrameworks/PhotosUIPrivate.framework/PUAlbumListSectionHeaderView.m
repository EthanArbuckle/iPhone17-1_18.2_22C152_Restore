@interface PUAlbumListSectionHeaderView
- (NSArray)_constraints;
- (NSString)sectionHeaderTitle;
- (PUAlbumListSectionHeaderView)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)sectionHeaderInsets;
- (UIFont)sectionHeaderTitleFont;
- (UILabel)_titleLabel;
- (void)_setConstraints:(id)a3;
- (void)layoutSubviews;
- (void)setSectionHeaderInsets:(UIEdgeInsets)a3;
- (void)setSectionHeaderTitle:(id)a3;
- (void)setSectionHeaderTitleFont:(id)a3;
@end

@implementation PUAlbumListSectionHeaderView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__constraints, 0);
  objc_storeStrong((id *)&self->__titleLabel, 0);
  objc_storeStrong((id *)&self->_sectionHeaderTitleFont, 0);
  objc_storeStrong((id *)&self->_sectionHeaderTitle, 0);
}

- (void)_setConstraints:(id)a3
{
}

- (NSArray)_constraints
{
  return self->__constraints;
}

- (UILabel)_titleLabel
{
  return self->__titleLabel;
}

- (UIEdgeInsets)sectionHeaderInsets
{
  double top = self->_sectionHeaderInsets.top;
  double left = self->_sectionHeaderInsets.left;
  double bottom = self->_sectionHeaderInsets.bottom;
  double right = self->_sectionHeaderInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIFont)sectionHeaderTitleFont
{
  return self->_sectionHeaderTitleFont;
}

- (NSString)sectionHeaderTitle
{
  return self->_sectionHeaderTitle;
}

- (void)layoutSubviews
{
  v31.receiver = self;
  v31.super_class = (Class)PUAlbumListSectionHeaderView;
  [(PUAlbumListSectionHeaderView *)&v31 layoutSubviews];
  v3 = [(PUAlbumListSectionHeaderView *)self _titleLabel];
  char v4 = [(PUAlbumListSectionHeaderView *)self _shouldReverseLayoutDirection];
  [(PUAlbumListSectionHeaderView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(PUAlbumListSectionHeaderView *)self sectionHeaderInsets];
  double v14 = v6 + v13;
  double v16 = v8 + v15;
  double v18 = v10 - (v13 + v17);
  double v20 = v12 - (v15 + v19);
  objc_msgSend(v3, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  double v22 = v21;
  double v24 = v23;
  double v25 = v14;
  double v26 = v16;
  double v27 = v18;
  double v28 = v20;
  if (v4) {
    double MinX = CGRectGetMaxX(*(CGRect *)&v25) - v22;
  }
  else {
    double MinX = CGRectGetMinX(*(CGRect *)&v25);
  }
  v32.origin.x = v14;
  v32.origin.y = v16;
  v32.size.width = v18;
  v32.size.height = v20;
  CGFloat MaxY = CGRectGetMaxY(v32);
  objc_msgSend(v3, "setFrame:", PURoundRectToPixel(MinX, MaxY - v24, v22, v24));
}

- (void)setSectionHeaderTitleFont:(id)a3
{
  double v6 = (UIFont *)a3;
  if (self->_sectionHeaderTitleFont != v6)
  {
    objc_storeStrong((id *)&self->_sectionHeaderTitleFont, a3);
    double v5 = [(PUAlbumListSectionHeaderView *)self _titleLabel];
    [v5 setFont:v6];

    [(PUAlbumListSectionHeaderView *)self setNeedsLayout];
  }
}

- (void)setSectionHeaderTitle:(id)a3
{
  char v4 = (NSString *)a3;
  double v5 = v4;
  if (self->_sectionHeaderTitle != v4)
  {
    double v10 = v4;
    BOOL v6 = -[NSString isEqualToString:](v4, "isEqualToString:");
    double v5 = v10;
    if (!v6)
    {
      double v7 = (NSString *)[(NSString *)v10 copy];
      sectionHeaderTitle = self->_sectionHeaderTitle;
      self->_sectionHeaderTitle = v7;

      double v9 = [(PUAlbumListSectionHeaderView *)self _titleLabel];
      [v9 setText:v10];

      [(PUAlbumListSectionHeaderView *)self setNeedsLayout];
      double v5 = v10;
    }
  }
}

- (void)setSectionHeaderInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_sectionHeaderInsets.left
    || a3.top != self->_sectionHeaderInsets.top
    || a3.right != self->_sectionHeaderInsets.right
    || a3.bottom != self->_sectionHeaderInsets.bottom)
  {
    self->_sectionHeaderInsets = a3;
    [(PUAlbumListSectionHeaderView *)self setNeedsLayout];
  }
}

- (PUAlbumListSectionHeaderView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PUAlbumListSectionHeaderView;
  v3 = -[PUAlbumListSectionHeaderView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    char v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v3->__titleLabel;
    v3->__titleLabel = v4;

    BOOL v6 = +[PUInterfaceManager currentTheme];
    [v6 configureAlbumListSectionTitleLabel:v3->__titleLabel];
    [(PUAlbumListSectionHeaderView *)v3 addSubview:v3->__titleLabel];
  }
  return v3;
}

@end