@interface SKUIContentUnavailableTableViewCell
- (NSString)message;
- (NSString)title;
- (SKUIContentUnavailableTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)layoutSubviews;
- (void)setMessage:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation SKUIContentUnavailableTableViewCell

- (SKUIContentUnavailableTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIContentUnavailableTableViewCell initWithStyle:reuseIdentifier:]();
  }
  v14.receiver = self;
  v14.super_class = (Class)SKUIContentUnavailableTableViewCell;
  v7 = [(SKUITableViewCell *)&v14 initWithStyle:a3 reuseIdentifier:v6];
  v8 = v7;
  if (v7)
  {
    [(SKUIContentUnavailableTableViewCell *)v7 setUserInteractionEnabled:0];
    id v9 = objc_alloc(MEMORY[0x1E4FB2070]);
    uint64_t v10 = objc_msgSend(v9, "initWithFrame:title:style:", 0, 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    view = v8->_view;
    v8->_view = (_UIContentUnavailableView *)v10;

    v12 = [(SKUIContentUnavailableTableViewCell *)v8 contentView];
    [v12 addSubview:v8->_view];
  }
  return v8;
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
  v12.super_class = (Class)SKUIContentUnavailableTableViewCell;
  [(SKUITableViewCell *)&v12 layoutSubviews];
  v3 = [(SKUIContentUnavailableTableViewCell *)self contentView];
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

- (void)initWithStyle:reuseIdentifier:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIContentUnavailableTableViewCell initWithStyle:reuseIdentifier:]";
}

@end