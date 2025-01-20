@interface MTAStopwatchTableView
- (MTAStopwatchTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4;
- (UIView)topKeylineView;
- (void)layoutSubviews;
- (void)setTopKeylineView:(id)a3;
@end

@implementation MTAStopwatchTableView

- (MTAStopwatchTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)MTAStopwatchTableView;
  v4 = -[MTAStopwatchTableView initWithFrame:style:](&v10, "initWithFrame:style:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v4)
  {
    v5 = objc_opt_new();
    [(MTAStopwatchTableView *)v4 setTopKeylineView:v5];

    v6 = +[UIColor mtui_cellSeparatorColor];
    v7 = [(MTAStopwatchTableView *)v4 topKeylineView];
    [v7 setBackgroundColor:v6];

    v8 = [(MTAStopwatchTableView *)v4 topKeylineView];
    [(MTAStopwatchTableView *)v4 addSubview:v8];
  }
  return v4;
}

- (void)layoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)MTAStopwatchTableView;
  [(MTAStopwatchTableView *)&v17 layoutSubviews];
  v3 = [(MTAStopwatchTableView *)self topKeylineView];
  [(MTAStopwatchTableView *)self bringSubviewToFront:v3];

  LODWORD(v3) = [(MTAStopwatchTableView *)self mtui_isRTL];
  [(MTAStopwatchTableView *)self separatorInset];
  if (v3) {
    double v6 = v5;
  }
  else {
    double v6 = v4;
  }
  [(MTAStopwatchTableView *)self contentOffset];
  double v8 = fmax(v7, 0.0);
  [(MTAStopwatchTableView *)self bounds];
  double Width = CGRectGetWidth(v18);
  [(MTAStopwatchTableView *)self separatorInset];
  double v11 = Width - v10;
  [(MTAStopwatchTableView *)self separatorInset];
  double v13 = v11 - v12;
  MTUIMainScreenScale();
  double v15 = 1.0 / v14;
  v16 = [(MTAStopwatchTableView *)self topKeylineView];
  [v16 setFrame:v6, v8, v13, v15];
}

- (UIView)topKeylineView
{
  return self->_topKeylineView;
}

- (void)setTopKeylineView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end