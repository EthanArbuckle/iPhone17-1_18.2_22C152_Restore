@interface SKUIDownloadsCollectionViewCell
- (SKUIDownloadsCellView)cellView;
- (SKUIDownloadsCollectionViewCell)initWithFrame:(CGRect)a3;
- (int64_t)cellState;
- (void)_reloadEditState;
- (void)layoutSubviews;
- (void)setCellState:(int64_t)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation SKUIDownloadsCollectionViewCell

- (SKUIDownloadsCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIDownloadsCollectionViewCell initWithFrame:]();
  }
  v13.receiver = self;
  v13.super_class = (Class)SKUIDownloadsCollectionViewCell;
  v8 = -[SKUIDownloadsCollectionViewCell initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  if (v8)
  {
    v9 = objc_alloc_init(SKUIDownloadsCellView);
    cellView = v8->_cellView;
    v8->_cellView = v9;

    v11 = [(SKUIDownloadsCollectionViewCell *)v8 contentView];
    [v11 addSubview:v8->_cellView];
  }
  return v8;
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(SKUIDownloadsCollectionViewCell *)self isSelected];
  v6.receiver = self;
  v6.super_class = (Class)SKUIDownloadsCollectionViewCell;
  [(SKUIDownloadsCollectionViewCell *)&v6 setSelected:v3];
  if (v5 != v3)
  {
    if (self->_cellState) {
      [(SKUIDownloadsCollectionViewCell *)self _reloadEditState];
    }
  }
}

- (void)setCellState:(int64_t)a3
{
  if (self->_cellState != a3)
  {
    self->_cellState = a3;
    [(SKUIDownloadsCollectionViewCell *)self _reloadEditState];
  }
}

- (void)layoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)SKUIDownloadsCollectionViewCell;
  [(SKUIDownloadsCollectionViewCell *)&v21 layoutSubviews];
  BOOL v3 = [(SKUIDownloadsCollectionViewCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  editIndicator = self->_editIndicator;
  if (editIndicator)
  {
    [(UIImageView *)editIndicator sizeToFit];
    [(UIImageView *)self->_editIndicator frame];
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    float v17 = (v11 - v15) * 0.5;
    CGFloat v18 = v7 + roundf(v17);
    -[UIImageView setFrame:](self->_editIndicator, "setFrame:", v5 + 15.0, v18);
    v22.origin.double x = v5 + 15.0;
    v22.origin.double y = v18;
    v22.size.double width = v14;
    v22.size.double height = v16;
    double MaxX = CGRectGetMaxX(v22);
  }
  else
  {
    double MaxX = v5;
  }
  v20 = [(SKUIDownloadsCollectionViewCell *)self contentView];
  [v20 bounds];

  -[SKUIDownloadsCellView setFrame:](self->_cellView, "setFrame:", MaxX, v7, v9 - (MaxX - v5), v11);
}

- (void)_reloadEditState
{
  int64_t cellState = self->_cellState;
  editIndicator = self->_editIndicator;
  if ((unint64_t)(cellState - 1) > 1)
  {
    [(UIImageView *)editIndicator removeFromSuperview];
    double v11 = self->_editIndicator;
    self->_editIndicator = 0;
  }
  else
  {
    if (!editIndicator)
    {
      double v5 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
      double v6 = self->_editIndicator;
      self->_editIndicator = v5;

      [(SKUIDownloadsCollectionViewCell *)self addSubview:self->_editIndicator];
      int64_t cellState = self->_cellState;
    }
    if (cellState == 2)
    {
      double v7 = (void *)MEMORY[0x1E4FB1818];
      double v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      double v9 = [v7 imageNamed:@"EditControl" inBundle:v8];

      uint64_t v10 = [MEMORY[0x1E4FB1618] clearColor];
    }
    else
    {
      char v12 = [(SKUIDownloadsCollectionViewCell *)self isSelected];
      double v13 = (void *)MEMORY[0x1E4FB1818];
      CGFloat v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      if (v12)
      {
        double v9 = [v13 imageNamed:@"EditControlSelected" inBundle:v14];

        [(SKUIDownloadsCollectionViewCell *)self tintColor];
      }
      else
      {
        double v9 = [v13 imageNamed:@"EditControl" inBundle:v14];

        [MEMORY[0x1E4FB1618] lightGrayColor];
      uint64_t v10 = };
    }
    double v15 = (void *)v10;
    double v11 = [v9 _flatImageWithColor:v10];

    [(UIImageView *)self->_editIndicator setImage:v11];
  }

  [(SKUIDownloadsCollectionViewCell *)self setNeedsLayout];
}

- (int64_t)cellState
{
  return self->_cellState;
}

- (SKUIDownloadsCellView)cellView
{
  return self->_cellView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editIndicator, 0);

  objc_storeStrong((id *)&self->_cellView, 0);
}

- (void)initWithFrame:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIDownloadsCollectionViewCell initWithFrame:]";
}

@end