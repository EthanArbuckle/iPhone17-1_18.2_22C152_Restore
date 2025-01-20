@interface UICollectionViewTableSeparatorView
- (_UITableViewCellSeparatorView)separatorView;
- (void)applyLayoutAttributes:(id)a3;
- (void)layoutSubviews;
- (void)setSeparatorView:(id)a3;
@end

@implementation UICollectionViewTableSeparatorView

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  v8 = [(UICollectionViewTableSeparatorView *)self separatorView];
  if (!v8)
  {
    v5 = [_UITableViewCellSeparatorView alloc];
    [(UIView *)self bounds];
    v8 = -[_UITableViewCellSeparatorView initWithFrame:](v5, "initWithFrame:");
    [(UICollectionViewTableSeparatorView *)self setSeparatorView:v8];
    [(UIView *)self addSubview:v8];
    [(UIView *)self setNeedsLayout];
  }
  v6 = [v4 separatorColor];
  [(UIView *)v8 setBackgroundColor:v6];

  v7 = [v4 separatorEffect];

  [(_UITableViewCellSeparatorView *)v8 setSeparatorEffect:v7];
}

- (void)layoutSubviews
{
  [(UIView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(UICollectionViewTableSeparatorView *)self separatorView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

- (_UITableViewCellSeparatorView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end