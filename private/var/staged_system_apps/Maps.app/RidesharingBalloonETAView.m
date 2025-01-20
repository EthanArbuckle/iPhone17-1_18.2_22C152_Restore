@interface RidesharingBalloonETAView
+ (id)balloonFillColor;
+ (id)balloonStrokeColor;
- (NSNumber)minutes;
- (RidesharingBalloonETAView)initWithFrame:(CGRect)a3;
- (id)_minutesText;
- (unint64_t)balloonState;
- (void)crossfadeView:(id)a3 animations:(id)a4;
- (void)setBalloonState:(unint64_t)a3;
- (void)setMinutes:(id)a3;
- (void)setMinutes:(id)a3 withState:(unint64_t)a4;
- (void)setScheduledPickupWindowStart:(id)a3;
@end

@implementation RidesharingBalloonETAView

- (RidesharingBalloonETAView)initWithFrame:(CGRect)a3
{
  v36.receiver = self;
  v36.super_class = (Class)RidesharingBalloonETAView;
  v3 = -[RidesharingBalloonETAView initWithFrame:](&v36, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[RidesharingBalloonETAView balloonFillColor];
    [(RidesharingBalloonETAView *)v3 setBackgroundColor:v4];

    v5 = (UILabel *)objc_alloc_init((Class)UILabel);
    label = v3->_label;
    v3->_label = v5;

    [(UILabel *)v3->_label setNumberOfLines:1];
    v7 = +[UIFont _maps_boldSystemFontWithFixedSize:22.0];
    [(UILabel *)v3->_label setFont:v7];

    v8 = +[UIColor whiteColor];
    [(UILabel *)v3->_label setTextColor:v8];

    [(UILabel *)v3->_label setTextAlignment:1];
    [(RidesharingBalloonETAView *)v3 addSubview:v3->_label];
    [(UILabel *)v3->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    v9 = (UILabel *)objc_alloc_init((Class)UILabel);
    subLabel = v3->_subLabel;
    v3->_subLabel = v9;

    [(UILabel *)v3->_subLabel setNumberOfLines:1];
    v11 = +[UIFont _maps_systemFontWithFixedSize:12.0];
    [(UILabel *)v3->_subLabel setFont:v11];

    v12 = +[UIColor whiteColor];
    [(UILabel *)v3->_subLabel setTextColor:v12];

    [(UILabel *)v3->_subLabel setTextAlignment:1];
    [(RidesharingBalloonETAView *)v3 addSubview:v3->_subLabel];
    [(UILabel *)v3->_subLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v13 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
    spinner = v3->_spinner;
    v3->_spinner = v13;

    v15 = +[UIColor whiteColor];
    [(UIActivityIndicatorView *)v3->_spinner setColor:v15];

    [(UIActivityIndicatorView *)v3->_spinner setHidesWhenStopped:1];
    [(RidesharingBalloonETAView *)v3 addSubview:v3->_spinner];
    [(UIActivityIndicatorView *)v3->_spinner setTranslatesAutoresizingMaskIntoConstraints:0];
    v35 = [(UILabel *)v3->_label centerXAnchor];
    v34 = [(RidesharingBalloonETAView *)v3 centerXAnchor];
    v33 = [v35 constraintEqualToAnchor:v34];
    v37[0] = v33;
    v32 = [(UILabel *)v3->_label centerYAnchor];
    v31 = [(RidesharingBalloonETAView *)v3 centerYAnchor];
    v30 = [v32 constraintEqualToAnchor:v31 constant:-7.0];
    v37[1] = v30;
    v29 = [(UILabel *)v3->_subLabel firstBaselineAnchor];
    v28 = [(UILabel *)v3->_label lastBaselineAnchor];
    v27 = [v29 constraintEqualToAnchor:v28 constant:15.0];
    v37[2] = v27;
    v26 = [(UILabel *)v3->_subLabel centerXAnchor];
    v16 = [(RidesharingBalloonETAView *)v3 centerXAnchor];
    v17 = [v26 constraintEqualToAnchor:v16];
    v37[3] = v17;
    v18 = [(UIActivityIndicatorView *)v3->_spinner centerXAnchor];
    v19 = [(RidesharingBalloonETAView *)v3 centerXAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    v37[4] = v20;
    v21 = [(UIActivityIndicatorView *)v3->_spinner centerYAnchor];
    v22 = [(RidesharingBalloonETAView *)v3 centerYAnchor];
    v23 = [v21 constraintEqualToAnchor:v22];
    v37[5] = v23;
    v24 = +[NSArray arrayWithObjects:v37 count:6];
    +[NSLayoutConstraint activateConstraints:v24];
  }
  return v3;
}

- (void)setMinutes:(id)a3 withState:(unint64_t)a4
{
  v6 = (NSNumber *)[a3 copy];
  minutes = self->_minutes;
  self->_minutes = v6;

  self->_balloonState = a4;
  if (a4 == 2)
  {
    label = self->_label;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1009CAD78;
    v15[3] = &unk_1012E5D08;
    v15[4] = self;
    [(RidesharingBalloonETAView *)self crossfadeView:label animations:v15];
    subLabel = self->_subLabel;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1009CADF8;
    v14[3] = &unk_1012E5D08;
    v14[4] = self;
    [(RidesharingBalloonETAView *)self crossfadeView:subLabel animations:v14];
    [(UIActivityIndicatorView *)self->_spinner startAnimating];
  }
  else
  {
    if (a4 == 1)
    {
      v13 = self->_label;
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1009CACDC;
      v17[3] = &unk_1012E5D08;
      v17[4] = self;
      [(RidesharingBalloonETAView *)self crossfadeView:v13 animations:v17];
      v9 = self->_subLabel;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1009CAD5C;
      v16[3] = &unk_1012E5D08;
      v16[4] = self;
      v10 = v16;
    }
    else
    {
      if (a4) {
        return;
      }
      v8 = self->_label;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1009CABA4;
      v19[3] = &unk_1012E5D08;
      v19[4] = self;
      [(RidesharingBalloonETAView *)self crossfadeView:v8 animations:v19];
      v9 = self->_subLabel;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_1009CAC50;
      v18[3] = &unk_1012E5D08;
      v18[4] = self;
      v10 = v18;
    }
    [(RidesharingBalloonETAView *)self crossfadeView:v9 animations:v10];
    [(UIActivityIndicatorView *)self->_spinner stopAnimating];
  }
}

- (void)setScheduledPickupWindowStart:(id)a3
{
  id v4 = a3;
  if (qword_101610370 != -1) {
    dispatch_once(&qword_101610370, &stru_101313448);
  }
  v5 = +[NSLocale autoupdatingCurrentLocale];
  v6 = +[NSDateFormatter dateFormatFromTemplate:@"Jmm" options:0 locale:v5];
  [(id)qword_101610368 setDateFormat:v6];

  v7 = +[NSLocale autoupdatingCurrentLocale];
  [(id)qword_101610368 setLocale:v7];

  v8 = [v4 timeZone];
  [(id)qword_101610368 setTimeZone:v8];

  v9 = +[NSCalendar autoupdatingCurrentCalendar];
  v10 = [v9 dateFromComponents:v4];

  v11 = [(id)qword_101610368 stringFromDate:v10];
  v12 = +[NSLocale autoupdatingCurrentLocale];
  v13 = +[NSDateFormatter dateFormatFromTemplate:@"j" options:0 locale:v12];
  unsigned int v14 = [v13 containsString:@"a"];

  v15 = 0;
  if (v14)
  {
    [(id)qword_101610368 setDateFormat:@"a"];
    v15 = [(id)qword_101610368 stringFromDate:v10];
  }
  label = self->_label;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1009CB120;
  v24[3] = &unk_1012E5D58;
  v24[4] = self;
  id v25 = v11;
  id v17 = v11;
  [(RidesharingBalloonETAView *)self crossfadeView:label animations:v24];
  subLabel = self->_subLabel;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1009CB198;
  v21[3] = &unk_1012E66E0;
  v21[4] = self;
  id v22 = v15;
  id v23 = v4;
  id v19 = v4;
  id v20 = v15;
  [(RidesharingBalloonETAView *)self crossfadeView:subLabel animations:v21];
  [(UIActivityIndicatorView *)self->_spinner stopAnimating];
}

- (void)crossfadeView:(id)a3 animations:(id)a4
{
}

- (id)_minutesText
{
  v2 = [(RidesharingBalloonETAView *)self minutes];
  v3 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", @"%llu", [v2 unsignedLongLongValue]);

  return v3;
}

+ (id)balloonFillColor
{
  return +[UIColor blackColor];
}

+ (id)balloonStrokeColor
{
  return +[UIColor blackColor];
}

- (NSNumber)minutes
{
  return self->_minutes;
}

- (void)setMinutes:(id)a3
{
}

- (unint64_t)balloonState
{
  return self->_balloonState;
}

- (void)setBalloonState:(unint64_t)a3
{
  self->_balloonState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minutes, 0);
  objc_storeStrong((id *)&self->_subLabel, 0);
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_spinner, 0);
}

@end