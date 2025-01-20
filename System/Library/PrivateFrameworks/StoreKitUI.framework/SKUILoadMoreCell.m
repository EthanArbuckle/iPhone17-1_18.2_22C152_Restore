@interface SKUILoadMoreCell
- (SKUILoadMoreCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)startAnimating;
- (void)stopAnimating;
@end

@implementation SKUILoadMoreCell

- (SKUILoadMoreCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUILoadMoreCell initWithStyle:reuseIdentifier:]();
  }
  v21.receiver = self;
  v21.super_class = (Class)SKUILoadMoreCell;
  v7 = [(SKUITableViewCell *)&v21 initWithStyle:a3 reuseIdentifier:v6];
  v8 = v7;
  if (v7)
  {
    v9 = [(SKUILoadMoreCell *)v7 contentView];
    [v9 bounds];
    double v11 = v10;
    double v13 = v12;
    uint64_t v14 = [objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:2];
    indicator = v8->_indicator;
    v8->_indicator = (UIActivityIndicatorView *)v14;

    [(UIActivityIndicatorView *)v8->_indicator setAutoresizingMask:45];
    [(UIActivityIndicatorView *)v8->_indicator sizeToFit];
    [(UIActivityIndicatorView *)v8->_indicator frame];
    float v17 = (v11 - v16) * 0.5;
    float v19 = (v13 - v18) * 0.5;
    -[UIActivityIndicatorView setFrame:](v8->_indicator, "setFrame:", floorf(v17), floorf(v19));
    [v9 addSubview:v8->_indicator];
  }
  return v8;
}

- (void)startAnimating
{
}

- (void)stopAnimating
{
}

- (void).cxx_destruct
{
}

- (void)initWithStyle:reuseIdentifier:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUILoadMoreCell initWithStyle:reuseIdentifier:]";
}

@end