@interface SUUIContentUnavailableTableViewCell
- (NSString)message;
- (NSString)title;
- (SUUIContentUnavailableTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)layoutSubviews;
- (void)setMessage:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SUUIContentUnavailableTableViewCell

- (SUUIContentUnavailableTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)SUUIContentUnavailableTableViewCell;
  v4 = [(SUUITableViewCell *)&v11 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(SUUIContentUnavailableTableViewCell *)v4 setUserInteractionEnabled:0];
    id v6 = objc_alloc(MEMORY[0x263F82EF0]);
    uint64_t v7 = objc_msgSend(v6, "initWithFrame:title:style:", 0, 0, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    view = v5->_view;
    v5->_view = (_UIContentUnavailableView *)v7;

    v9 = [(SUUIContentUnavailableTableViewCell *)v5 contentView];
    [v9 addSubview:v5->_view];
  }
  return v5;
}

- (NSString)title
{
  return (NSString *)[(_UIContentUnavailableView *)self->_view title];
}

- (void)setTitle:(id)a3
{
}

- (NSString)message
{
  return (NSString *)[(_UIContentUnavailableView *)self->_view message];
}

- (void)setMessage:(id)a3
{
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)SUUIContentUnavailableTableViewCell;
  [(SUUITableViewCell *)&v12 layoutSubviews];
  v3 = [(SUUIContentUnavailableTableViewCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[_UIContentUnavailableView setFrame:](self->_view, "setFrame:", v5, v7, v9, v11);
}

- (void).cxx_destruct
{
}

@end