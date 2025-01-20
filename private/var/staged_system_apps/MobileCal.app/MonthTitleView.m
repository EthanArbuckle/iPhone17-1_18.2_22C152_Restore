@interface MonthTitleView
- (EKCalendarDate)calendarDate;
- (MonthTitleView)initWithFrame:(CGRect)a3;
- (id)backgroundImage;
- (void)animateVisible:(BOOL)a3 duration:(double)a4 completion:(id)a5;
- (void)setCalendarDate:(id)a3;
- (void)setFont:(id)a3;
@end

@implementation MonthTitleView

- (MonthTitleView)initWithFrame:(CGRect)a3
{
  double y = a3.origin.y;
  double x = a3.origin.x;
  v20.receiver = self;
  v20.super_class = (Class)MonthTitleView;
  v5 = -[MonthTitleView initWithFrame:](&v20, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v7 = [(MonthTitleView *)v5 backgroundImage];
    [v7 size];
    -[MonthTitleView setFrame:](v6, "setFrame:", x, y, v8, v9);
    v10 = +[UIColor colorWithPatternImage:v7];
    [(MonthTitleView *)v6 setBackgroundColor:v10];

    [(MonthTitleView *)v6 setAlpha:0.0];
    uint64_t v11 = objc_opt_new();
    titleLabel = v6->_titleLabel;
    v6->_titleLabel = (UILabel *)v11;

    [(UILabel *)v6->_titleLabel setAutoresizingMask:2];
    v13 = +[UIColor systemBackgroundColor];
    [(UILabel *)v6->_titleLabel setBackgroundColor:v13];

    [(UILabel *)v6->_titleLabel setOpaque:1];
    [(UILabel *)v6->_titleLabel setNumberOfLines:0];
    [(UILabel *)v6->_titleLabel setTextAlignment:1];
    [(MonthTitleView *)v6 addSubview:v6->_titleLabel];
    objc_initWeak(&location, v6);
    uint64_t v21 = objc_opt_class();
    v14 = +[NSArray arrayWithObjects:&v21 count:1];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100046A78;
    v17[3] = &unk_1001D2620;
    objc_copyWeak(&v18, &location);
    id v15 = [(MonthTitleView *)v6 registerForTraitChanges:v14 withHandler:v17];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  return v6;
}

- (void)setFont:(id)a3
{
}

- (id)backgroundImage
{
  v2 = +[UIImage imageNamed:@"monthScrollingHUDBackground"];
  v3 = +[UIColor systemBackgroundColor];
  v4 = [v2 _flatImageWithColor:v3];

  return v4;
}

- (void)animateVisible:(BOOL)a3 duration:(double)a4 completion:(id)a5
{
  BOOL v6 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100046D1C;
  v12[3] = &unk_1001D2718;
  v12[4] = self;
  BOOL v13 = a3;
  id v8 = a5;
  +[UIView animateWithDuration:327684 delay:v12 options:v8 animations:a4 completion:0.0];
  double v9 = a4 * 0.8;
  if (v6) {
    double v9 = a4;
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100046D38;
  v10[3] = &unk_1001D2718;
  v10[4] = self;
  BOOL v11 = v6;
  +[UIView animateWithDuration:327684 delay:v10 options:v8 animations:v9 completion:0.0];
}

- (void)setCalendarDate:(id)a3
{
  id v4 = a3;
  id v5 = [v4 year];
  if (v5 != [(EKCalendarDate *)self->_calendarDate year]
    || (id v6 = [v4 month], v6 != -[EKCalendarDate month](self->_calendarDate, "month")))
  {
    if (v4)
    {
      v7 = [v4 date];
      id v8 = CUIKStringForMonthYear();
      [(UILabel *)self->_titleLabel setText:v8];
    }
    else
    {
      [(UILabel *)self->_titleLabel setText:&stru_1001D6918];
    }
    [(UILabel *)self->_titleLabel sizeToFit];
    [(UILabel *)self->_titleLabel frame];
    double v10 = v9;
    double v12 = v11;
    [(MonthTitleView *)self bounds];
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", v10, 14.0, CGRectGetWidth(v15), v12);
  }
  calendarDate = self->_calendarDate;
  self->_calendarDate = (EKCalendarDate *)v4;
}

- (EKCalendarDate)calendarDate
{
  return self->_calendarDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarDate, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end