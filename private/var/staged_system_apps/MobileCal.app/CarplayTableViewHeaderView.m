@interface CarplayTableViewHeaderView
+ (double)height;
- (BOOL)anyCalendarsHiddenByFocus;
- (CarplayTableViewHeaderView)initWithReuseIdentifier:(id)a3;
- (NSString)headerText;
- (void)layoutSubviews;
- (void)setAnyCalendarsHiddenByFocus:(BOOL)a3;
- (void)setFloating:(BOOL)a3;
- (void)setHeaderText:(id)a3;
@end

@implementation CarplayTableViewHeaderView

+ (double)height
{
  +[CarplayTableViewHeaderContentView height];
  return result;
}

- (void)setHeaderText:(id)a3
{
  p_headerText = &self->_headerText;
  objc_storeStrong((id *)&self->_headerText, a3);
  id v6 = a3;
  v7 = *p_headerText;
  id v8 = [(CarplayTableViewHeaderContentView *)self->_contentView label];
  [v8 setText:v7];
}

- (void)setAnyCalendarsHiddenByFocus:(BOOL)a3
{
  self->_anyCalendarsHiddenByFocus = a3;
  -[CarplayTableViewHeaderContentView setAnyCalendarsHiddenByFocus:](self->_contentView, "setAnyCalendarsHiddenByFocus:");
}

- (void)setFloating:(BOOL)a3
{
  v25.receiver = self;
  v25.super_class = (Class)CarplayTableViewHeaderView;
  -[CarplayTableViewHeaderView setFloating:](&v25, "setFloating:");
  [(CarplayTableViewHeaderView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  v13 = [(CarplayTableViewHeaderView *)self superview];
  -[CarplayTableViewHeaderView convertRect:toView:](self, "convertRect:toView:", v13, v6, v8, v10, v12);
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;

  if (a3)
  {
    BOOL v22 = 1;
  }
  else
  {
    v26.origin.x = v15;
    v26.origin.y = v17;
    v26.size.width = v19;
    v26.size.height = v21;
    BOOL v22 = CGRectGetMinY(v26) == 0.0;
  }
  self->_headerFloatingOrAtTop = v22;
  v23 = [(CarplayTableViewHeaderContentView *)self->_contentView separator];
  [v23 setHidden:v22];

  BOOL v24 = self->_anyCalendarsHiddenByFocus && self->_headerFloatingOrAtTop;
  [(CarplayTableViewHeaderContentView *)self->_contentView setAnyCalendarsHiddenByFocus:v24];
}

- (void)layoutSubviews
{
  v32.receiver = self;
  v32.super_class = (Class)CarplayTableViewHeaderView;
  [(CarplayTableViewHeaderView *)&v32 layoutSubviews];
  v3 = [(CarplayTableViewHeaderView *)self tableView];
  v4 = [(CarplayTableViewHeaderView *)self backgroundView];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  v13 = [(CarplayTableViewHeaderView *)self backgroundView];
  [v3 convertRect:v13 fromView:v6];
  double v15 = v14;
  double v17 = v16;

  double v18 = [(CarplayTableViewHeaderView *)self tableView];
  [v18 bounds];
  double Width = CGRectGetWidth(v33);

  double v20 = [(CarplayTableViewHeaderView *)self backgroundView];
  CGFloat v21 = [v20 superview];
  BOOL v22 = [(CarplayTableViewHeaderView *)self tableView];
  [v21 convertRect:v22 fromView:0.0, v15, Width, v17];
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;

  v31 = [(CarplayTableViewHeaderView *)self backgroundView];
  [v31 setFrame:v24, v26, v28, v30];
}

- (CarplayTableViewHeaderView)initWithReuseIdentifier:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)CarplayTableViewHeaderView;
  v3 = [(CarplayTableViewHeaderView *)&v13 initWithReuseIdentifier:a3];
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    contentView = v3->_contentView;
    v3->_contentView = (CarplayTableViewHeaderContentView *)v4;

    [(CarplayTableViewHeaderContentView *)v3->_contentView setAutoresizingMask:18];
    [(CarplayTableViewHeaderView *)v3 addSubview:v3->_contentView];
    id v6 = objc_alloc_init((Class)UIVisualEffectView);
    double v7 = +[UIColor tableBackgroundColor];
    double v8 = [v7 colorWithAlphaComponent:0.8];
    [v6 setBackgroundColor:v8];

    double v9 = +[UIColorEffect colorEffectSaturate:1.5];
    double v10 = +[UIBlurEffect effectWithBlurRadius:10.0];
    v14[0] = v9;
    v14[1] = v10;
    double v11 = +[NSArray arrayWithObjects:v14 count:2];
    [v6 setBackgroundEffects:v11];

    [(CarplayTableViewHeaderView *)v3 setBackgroundView:v6];
  }
  return v3;
}

- (NSString)headerText
{
  return self->_headerText;
}

- (BOOL)anyCalendarsHiddenByFocus
{
  return self->_anyCalendarsHiddenByFocus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerText, 0);

  objc_storeStrong((id *)&self->_contentView, 0);
}

@end