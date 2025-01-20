@interface TableCell
- (REUpNextBaseCell)contentCell;
- (TableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)configureWithContent:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setContentCell:(id)a3;
@end

@implementation TableCell

- (TableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)TableCell;
  return [(TableCell *)&v5 initWithStyle:0 reuseIdentifier:a4];
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)TableCell;
  [(TableCell *)&v4 prepareForReuse];
  v3 = [(TableCell *)self contentCell];
  [v3 removeFromSuperview];

  [(TableCell *)self setContentCell:0];
}

- (void)configureWithContent:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 style];
  if (v5 > 6)
  {
    v7 = 0;
  }
  else
  {
    id v6 = objc_alloc(*off_2644B7F08[v5]);
    v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  }
  [v7 configureWithContent:v4];
  CGAffineTransformMakeScale(&v13, 2.0, 2.0);
  CGAffineTransform v12 = v13;
  [v7 setTransform:&v12];
  v8 = [(TableCell *)self contentView];
  [v8 bounds];
  double Width = CGRectGetWidth(v14);
  v10 = [(TableCell *)self contentView];
  [v10 bounds];
  objc_msgSend(v7, "setFrame:", 0.0, 0.0, Width, CGRectGetHeight(v15));

  [(TableCell *)self setContentCell:v7];
  v11 = [(TableCell *)self contentView];
  [v11 addSubview:v7];
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)TableCell;
  [(TableCell *)&v8 layoutSubviews];
  v3 = [(TableCell *)self contentView];
  [v3 bounds];
  double Width = CGRectGetWidth(v9);
  unint64_t v5 = [(TableCell *)self contentView];
  [v5 bounds];
  double Height = CGRectGetHeight(v10);
  v7 = [(TableCell *)self contentCell];
  objc_msgSend(v7, "setFrame:", 0.0, 0.0, Width, Height);
}

- (REUpNextBaseCell)contentCell
{
  return self->_contentCell;
}

- (void)setContentCell:(id)a3
{
}

- (void).cxx_destruct
{
}

@end