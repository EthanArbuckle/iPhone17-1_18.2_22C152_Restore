@interface SUUILoadMoreCell
- (SUUILoadMoreCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)startAnimating;
- (void)stopAnimating;
@end

@implementation SUUILoadMoreCell

- (SUUILoadMoreCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v18.receiver = self;
  v18.super_class = (Class)SUUILoadMoreCell;
  v4 = [(SUUITableViewCell *)&v18 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(SUUILoadMoreCell *)v4 contentView];
    [v6 bounds];
    double v8 = v7;
    double v10 = v9;
    uint64_t v11 = [objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:2];
    indicator = v5->_indicator;
    v5->_indicator = (UIActivityIndicatorView *)v11;

    [(UIActivityIndicatorView *)v5->_indicator setAutoresizingMask:45];
    [(UIActivityIndicatorView *)v5->_indicator sizeToFit];
    [(UIActivityIndicatorView *)v5->_indicator frame];
    float v14 = (v8 - v13) * 0.5;
    float v16 = (v10 - v15) * 0.5;
    -[UIActivityIndicatorView setFrame:](v5->_indicator, "setFrame:", floorf(v14), floorf(v16));
    [v6 addSubview:v5->_indicator];
  }
  return v5;
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

@end