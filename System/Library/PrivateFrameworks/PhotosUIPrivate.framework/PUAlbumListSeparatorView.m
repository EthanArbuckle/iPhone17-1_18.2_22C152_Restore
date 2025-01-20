@interface PUAlbumListSeparatorView
- (PUAlbumListSeparatorView)initWithFrame:(CGRect)a3;
- (UIColor)lineColor;
- (void)layoutSubviews;
- (void)setLineColor:(id)a3;
@end

@implementation PUAlbumListSeparatorView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lineColor, 0);
  objc_storeStrong((id *)&self->_separatorLine, 0);
}

- (UIColor)lineColor
{
  return self->_lineColor;
}

- (void)setLineColor:(id)a3
{
  if (self->_lineColor != a3)
  {
    v4 = (UIColor *)[a3 copy];
    lineColor = self->_lineColor;
    self->_lineColor = v4;

    separatorLine = self->_separatorLine;
    v7 = self->_lineColor;
    [(UIView *)separatorLine setBackgroundColor:v7];
  }
}

- (void)layoutSubviews
{
  [(PUAlbumListSeparatorView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  PLPhysicalScreenScale();
  separatorLine = self->_separatorLine;
  -[UIView setFrame:](separatorLine, "setFrame:", v4, v6, v8, 1.0 / v9);
}

- (PUAlbumListSeparatorView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PUAlbumListSeparatorView;
  double v3 = -[PUAlbumListSeparatorView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    separatorLine = v3->_separatorLine;
    v3->_separatorLine = (UIView *)v5;

    [(PUAlbumListSeparatorView *)v3 addSubview:v3->_separatorLine];
  }
  return v3;
}

@end