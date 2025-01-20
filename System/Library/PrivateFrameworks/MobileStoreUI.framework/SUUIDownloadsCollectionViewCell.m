@interface SUUIDownloadsCollectionViewCell
- (SUUIDownloadsCellView)cellView;
- (SUUIDownloadsCollectionViewCell)initWithFrame:(CGRect)a3;
- (int64_t)cellState;
- (void)_reloadEditState;
- (void)layoutSubviews;
- (void)setCellState:(int64_t)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation SUUIDownloadsCollectionViewCell

- (SUUIDownloadsCollectionViewCell)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SUUIDownloadsCollectionViewCell;
  v3 = -[SUUIDownloadsCollectionViewCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(SUUIDownloadsCellView);
    cellView = v3->_cellView;
    v3->_cellView = v4;

    v6 = [(SUUIDownloadsCollectionViewCell *)v3 contentView];
    [v6 addSubview:v3->_cellView];
  }
  return v3;
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(SUUIDownloadsCollectionViewCell *)self isSelected];
  v6.receiver = self;
  v6.super_class = (Class)SUUIDownloadsCollectionViewCell;
  [(SUUIDownloadsCollectionViewCell *)&v6 setSelected:v3];
  if (v5 != v3)
  {
    if (self->_cellState) {
      [(SUUIDownloadsCollectionViewCell *)self _reloadEditState];
    }
  }
}

- (void)setCellState:(int64_t)a3
{
  if (self->_cellState != a3)
  {
    self->_cellState = a3;
    [(SUUIDownloadsCollectionViewCell *)self _reloadEditState];
  }
}

- (void)layoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)SUUIDownloadsCollectionViewCell;
  [(SUUIDownloadsCollectionViewCell *)&v21 layoutSubviews];
  BOOL v3 = [(SUUIDownloadsCollectionViewCell *)self contentView];
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
    v22.origin.x = v5 + 15.0;
    v22.origin.y = v18;
    v22.size.width = v14;
    v22.size.height = v16;
    double MaxX = CGRectGetMaxX(v22);
  }
  else
  {
    double MaxX = v5;
  }
  v20 = [(SUUIDownloadsCollectionViewCell *)self contentView];
  [v20 bounds];

  -[SUUIDownloadsCellView setFrame:](self->_cellView, "setFrame:", MaxX, v7, v9 - (MaxX - v5), v11);
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
      double v5 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
      double v6 = self->_editIndicator;
      self->_editIndicator = v5;

      [(SUUIDownloadsCollectionViewCell *)self addSubview:self->_editIndicator];
      int64_t cellState = self->_cellState;
    }
    if (cellState == 2)
    {
      double v7 = (void *)MEMORY[0x263F827E8];
      double v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      double v9 = [v7 imageNamed:@"EditControl" inBundle:v8];

      uint64_t v10 = [MEMORY[0x263F825C8] clearColor];
    }
    else
    {
      char v12 = [(SUUIDownloadsCollectionViewCell *)self isSelected];
      double v13 = (void *)MEMORY[0x263F827E8];
      CGFloat v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      if (v12)
      {
        double v9 = [v13 imageNamed:@"EditControlSelected" inBundle:v14];

        [(SUUIDownloadsCollectionViewCell *)self tintColor];
      }
      else
      {
        double v9 = [v13 imageNamed:@"EditControl" inBundle:v14];

        [MEMORY[0x263F825C8] lightGrayColor];
      uint64_t v10 = };
    }
    double v15 = (void *)v10;
    double v11 = [v9 _flatImageWithColor:v10];

    [(UIImageView *)self->_editIndicator setImage:v11];
  }

  [(SUUIDownloadsCollectionViewCell *)self setNeedsLayout];
}

- (int64_t)cellState
{
  return self->_cellState;
}

- (SUUIDownloadsCellView)cellView
{
  return self->_cellView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editIndicator, 0);

  objc_storeStrong((id *)&self->_cellView, 0);
}

@end