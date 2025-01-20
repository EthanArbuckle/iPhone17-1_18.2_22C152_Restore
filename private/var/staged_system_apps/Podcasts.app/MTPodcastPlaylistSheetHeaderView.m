@interface MTPodcastPlaylistSheetHeaderView
- (BOOL)on;
- (MTPodcastPlaylistSheetHeaderView)initWithFrame:(CGRect)a3;
- (id)action;
- (void)buttonTapped:(id)a3;
- (void)layoutSubviews;
- (void)setAction:(id)a3;
- (void)setOn:(BOOL)a3;
@end

@implementation MTPodcastPlaylistSheetHeaderView

- (MTPodcastPlaylistSheetHeaderView)initWithFrame:(CGRect)a3
{
  v23.receiver = self;
  v23.super_class = (Class)MTPodcastPlaylistSheetHeaderView;
  v3 = -[MTPodcastPlaylistSheetHeaderView initWithFrame:](&v23, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc((Class)UISwitch);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v8 = [v4 initWithFrame:CGRectZero.origin.x, y, width, height];
    v9 = v3->_switch;
    v3->_switch = v8;

    [(UISwitch *)v3->_switch addTarget:v3 action:"buttonTapped:" forControlEvents:4096];
    [(MTPodcastPlaylistSheetHeaderView *)v3 addSubview:v3->_switch];
    v10 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    title = v3->_title;
    v3->_title = v10;

    v12 = v3->_title;
    v13 = +[NSBundle mainBundle];
    v14 = [v13 localizedStringForKey:@"All Podcasts Button" value:&stru_10056A8A0 table:0];
    [(UILabel *)v12 setText:v14];

    v15 = v3->_title;
    v16 = +[UIFont headerTitleFont];
    [(UILabel *)v15 setFont:v16];

    v17 = v3->_title;
    v18 = +[UIColor clearColor];
    [(UILabel *)v17 setBackgroundColor:v18];

    v19 = v3->_title;
    v20 = +[UIColor cellTextColor];
    [(UILabel *)v19 setTextColor:v20];

    [(MTPodcastPlaylistSheetHeaderView *)v3 addSubview:v3->_title];
    v21 = v3;
  }

  return v3;
}

- (void)layoutSubviews
{
  v27.receiver = self;
  v27.super_class = (Class)MTPodcastPlaylistSheetHeaderView;
  [(MTPodcastPlaylistSheetHeaderView *)&v27 layoutSubviews];
  UIUserInterfaceLayoutDirection v3 = +[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:[(MTPodcastPlaylistSheetHeaderView *)self semanticContentAttribute]];
  title = self->_title;
  v5 = +[UIFont headerTitleFont];
  [(UILabel *)title setFont:v5];

  [(MTPodcastPlaylistSheetHeaderView *)self bounds];
  CGFloat x = v28.origin.x;
  CGFloat y = v28.origin.y;
  CGFloat width = v28.size.width;
  CGFloat height = v28.size.height;
  separator = self->_separator;
  double MaxY = CGRectGetMaxY(v28);
  v12 = +[UIScreen mainScreen];
  [v12 scale];
  double v14 = v13;

  double v15 = MaxY - 1.0 / v14;
  v29.origin.CGFloat x = x;
  v29.origin.CGFloat y = y;
  v29.size.CGFloat width = width;
  v29.size.CGFloat height = height;
  double v16 = CGRectGetWidth(v29);
  v17 = +[UIScreen mainScreen];
  [v17 scale];
  double v19 = v18;

  -[UIView setFrame:](separator, "setFrame:", 0.0, v15, v16, 1.0 / v19);
  [(UISwitch *)self->_switch sizeToFit];
  [(UILabel *)self->_title sizeToFit];
  v30.origin.CGFloat x = x;
  v30.origin.CGFloat y = y;
  v30.size.CGFloat width = width;
  v30.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v30);
  if (v3 == UIUserInterfaceLayoutDirectionRightToLeft)
  {
    [(UILabel *)self->_title bounds];
    double v21 = MaxX - CGRectGetWidth(v31) + -20.0;
    double v22 = 20.0;
  }
  else
  {
    [(UISwitch *)self->_switch bounds];
    double v22 = MaxX - CGRectGetWidth(v32) + -20.0;
    double v21 = 20.0;
  }
  v33.origin.CGFloat x = x;
  v33.origin.CGFloat y = y;
  v33.size.CGFloat width = width;
  v33.size.CGFloat height = height;
  double v23 = CGRectGetHeight(v33);
  [(UISwitch *)self->_switch bounds];
  double v24 = ceil((v23 - CGRectGetHeight(v34)) * 0.5);
  [(UISwitch *)self->_switch frame];
  -[UISwitch setFrame:](self->_switch, "setFrame:", v22, v24);
  v35.origin.CGFloat x = x;
  v35.origin.CGFloat y = y;
  v35.size.CGFloat width = width;
  v35.size.CGFloat height = height;
  double v25 = CGRectGetHeight(v35);
  [(UILabel *)self->_title bounds];
  double v26 = ceil((v25 - CGRectGetHeight(v36)) * 0.5);
  [(UILabel *)self->_title frame];
  -[UILabel setFrame:](self->_title, "setFrame:", v21, v26);
}

- (void)buttonTapped:(id)a3
{
  self->_on = [a3 isOn];
  id action = self->_action;
  if (action)
  {
    v5 = (void (*)(void))*((void *)action + 2);
    v5();
  }
}

- (void)setOn:(BOOL)a3
{
  self->_on = a3;
  -[UISwitch setOn:](self->_switch, "setOn:");
  id action = self->_action;
  if (action)
  {
    v5 = (void (*)(void))*((void *)action + 2);
    v5();
  }
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (BOOL)on
{
  return self->_on;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_switch, 0);

  objc_storeStrong((id *)&self->_separator, 0);
}

@end