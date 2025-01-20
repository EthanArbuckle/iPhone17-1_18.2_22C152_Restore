@interface CompletionListTableHeaderView
- (BOOL)showsSeparator;
- (CompletionListTableHeaderView)initWithReuseIdentifier:(id)a3;
- (void)layoutSubviews;
- (void)setShowsSeparator:(BOOL)a3;
@end

@implementation CompletionListTableHeaderView

- (CompletionListTableHeaderView)initWithReuseIdentifier:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CompletionListTableHeaderView;
  v3 = [(CompletionListTableHeaderView *)&v10 initWithReuseIdentifier:a3];
  v4 = v3;
  if (v3)
  {
    v3->_showsSeparator = 1;
    v5 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    separator = v4->_separator;
    v4->_separator = v5;

    v7 = [MEMORY[0x1E4FB1618] separatorColor];
    [(UIView *)v4->_separator setBackgroundColor:v7];

    [(CompletionListTableHeaderView *)v4 addSubview:v4->_separator];
    v8 = v4;
  }

  return v4;
}

- (void)layoutSubviews
{
  v31.receiver = self;
  v31.super_class = (Class)CompletionListTableHeaderView;
  [(CompletionListTableHeaderView *)&v31 layoutSubviews];
  v3 = [(CompletionListTableHeaderView *)self contentConfiguration];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v4 = [(CompletionListTableHeaderView *)self _sf_usesLeftToRightLayout];
    [(CompletionListTableHeaderView *)self bounds];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    [v3 directionalLayoutMargins];
    double v14 = v13;
    double v16 = v15;
    v17 = [(CompletionListTableHeaderView *)self contentView];
    [v17 frame];
    double MinX = CGRectGetMinX(v32);

    v33.origin.x = v6;
    v33.origin.y = v8;
    v33.size.width = v10;
    v33.size.height = v12;
    double Width = CGRectGetWidth(v33);
    v20 = [(CompletionListTableHeaderView *)self contentView];
    [v20 frame];
    double MaxX = CGRectGetMaxX(v34);
    if (v4) {
      double v22 = v14;
    }
    else {
      double v22 = v16;
    }
    double v23 = v22 + MinX;
    double v24 = Width - MaxX;
    if (v4) {
      double v25 = v16;
    }
    else {
      double v25 = v14;
    }
    double v26 = v25 + v24;

    _SFOnePixel();
    double v28 = v27;
    v35.origin.x = v6;
    v35.origin.y = v8;
    v35.size.width = v10;
    v35.size.height = v12;
    CGFloat v29 = CGRectGetHeight(v35) - v28;
    v36.origin.x = v6;
    v36.origin.y = v8;
    v36.size.width = v10;
    v36.size.height = v12;
    -[UIView setFrame:](self->_separator, "setFrame:", v23, v29, CGRectGetWidth(v36) - v23 - v26, v28);
    LOBYTE(v30) = self->_showsSeparator;
    [(UIView *)self->_separator setAlpha:(double)v30];
  }
}

- (void)setShowsSeparator:(BOOL)a3
{
  if (self->_showsSeparator != a3)
  {
    self->_showsSeparator = a3;
    [(CompletionListTableHeaderView *)self setNeedsLayout];
  }
}

- (BOOL)showsSeparator
{
  return self->_showsSeparator;
}

- (void).cxx_destruct
{
}

@end