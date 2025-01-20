@interface CarplayCollapsedAllDayTableViewCell
+ (id)reuseIdentifier;
- (BOOL)canBecomeFocused;
- (CarplayCollapsedAllDayTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (id)_cellTitle;
- (id)normalPlatterBackgroundColor;
- (id)normalPrimaryTextColor;
- (id)normalTopTimeTextColor;
- (id)primaryTextLabelFont;
- (void)_setupConstraints;
- (void)configureWithAllDayCount:(int64_t)a3 birthdayCount:(int64_t)a4;
- (void)crossfadeToCell:(id)a3;
- (void)forceUpdateOfAllElements;
- (void)layoutSubviews;
@end

@implementation CarplayCollapsedAllDayTableViewCell

+ (id)reuseIdentifier
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000D194C;
  block[3] = &unk_1001D2FA8;
  block[4] = a1;
  if (qword_100216870 != -1) {
    dispatch_once(&qword_100216870, block);
  }
  v2 = (void *)qword_100216868;

  return v2;
}

- (CarplayCollapsedAllDayTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v23.receiver = self;
  v23.super_class = (Class)CarplayCollapsedAllDayTableViewCell;
  v4 = [(CarplayCollapsedAllDayTableViewCell *)&v23 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = +[UIColor clearColor];
    [(CarplayCollapsedAllDayTableViewCell *)v4 setBackgroundColor:v5];

    uint64_t v6 = objc_opt_new();
    occurrenceCellSuperview = v4->_occurrenceCellSuperview;
    v4->_occurrenceCellSuperview = (UIView *)v6;

    v8 = +[UIColor clearColor];
    [(UIView *)v4->_occurrenceCellSuperview setBackgroundColor:v8];

    [(UIView *)v4->_occurrenceCellSuperview setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v4->_occurrenceCellSuperview setHidden:1];
    v9 = [(CarplayCollapsedAllDayTableViewCell *)v4 contentView];
    [v9 addSubview:v4->_occurrenceCellSuperview];

    uint64_t v10 = objc_opt_new();
    allDaySuperview = v4->_allDaySuperview;
    v4->_allDaySuperview = (UIView *)v10;

    v12 = +[UIColor clearColor];
    [(UIView *)v4->_allDaySuperview setBackgroundColor:v12];

    [(UIView *)v4->_allDaySuperview setTranslatesAutoresizingMaskIntoConstraints:0];
    v13 = [(CarplayCollapsedAllDayTableViewCell *)v4 contentView];
    [v13 addSubview:v4->_allDaySuperview];

    v14 = -[CollapsedCellBackgroundView initWithFrame:]([CollapsedCellBackgroundView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    coloredBackgroundView = v4->_coloredBackgroundView;
    v4->_coloredBackgroundView = &v14->super;

    [(UIView *)v4->_coloredBackgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
    v16 = [(CarplayCollapsedAllDayTableViewCell *)v4 normalPlatterBackgroundColor];
    [(UIView *)v4->_coloredBackgroundView setBackgroundColor:v16];

    v17 = [(UIView *)v4->_coloredBackgroundView layer];
    [v17 setMasksToBounds:1];

    [(UIView *)v4->_allDaySuperview addSubview:v4->_coloredBackgroundView];
    uint64_t v18 = objc_opt_new();
    primaryLabel = v4->_primaryLabel;
    v4->_primaryLabel = (UILabel *)v18;

    v20 = [(CarplayCollapsedAllDayTableViewCell *)v4 primaryTextLabelFont];
    [(UILabel *)v4->_primaryLabel setFont:v20];

    v21 = [(CarplayCollapsedAllDayTableViewCell *)v4 normalPrimaryTextColor];
    [(UILabel *)v4->_primaryLabel setTextColor:v21];

    [(UILabel *)v4->_primaryLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v4->_primaryLabel setNumberOfLines:1];
    [(UIView *)v4->_allDaySuperview addSubview:v4->_primaryLabel];
    [(CarplayCollapsedAllDayTableViewCell *)v4 _setupConstraints];
  }
  return v4;
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)CarplayCollapsedAllDayTableViewCell;
  [(CarplayCollapsedAllDayTableViewCell *)&v15 layoutSubviews];
  v3 = [(CarplayCollapsedAllDayTableViewCell *)self layer];
  v4 = [v3 mask];

  if (!v4)
  {
    v5 = [(CarplayCollapsedAllDayTableViewCell *)self layer];
    [v5 bounds];
    v17.origin.x = v6;
    v17.origin.y = v7;
    v17.size.width = v8;
    v17.size.height = v9;
    v16.origin.x = CGRectZero.origin.x;
    v16.origin.y = CGRectZero.origin.y;
    v16.size.width = CGRectZero.size.width;
    v16.size.height = CGRectZero.size.height;
    BOOL v10 = CGRectEqualToRect(v16, v17);

    if (!v10)
    {
      v11 = +[CALayer layer];
      id v12 = +[UIColor colorWithWhite:1.0 alpha:1.0];
      [v11 setBackgroundColor:[v12 CGColor]];

      v13 = [(CarplayCollapsedAllDayTableViewCell *)self layer];
      [v13 bounds];
      [v11 setFrame:];

      v14 = [(CarplayCollapsedAllDayTableViewCell *)self layer];
      [v14 setMask:v11];
    }
  }
}

- (void)configureWithAllDayCount:(int64_t)a3 birthdayCount:(int64_t)a4
{
  [(CarplayCollapsedAllDayTableViewCell *)self setSelectionStyle:0];
  self->_allDayCount = a3;
  self->_birthdayCount = a4;
  CGFloat v7 = [(CarplayCollapsedAllDayTableViewCell *)self _cellTitle];
  [(UILabel *)self->_primaryLabel setText:v7];

  [(CarplayCollapsedAllDayTableViewCell *)self forceUpdateOfAllElements];
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)forceUpdateOfAllElements
{
  v3 = [(CarplayCollapsedAllDayTableViewCell *)self normalPlatterBackgroundColor];
  [(UIView *)self->_coloredBackgroundView setBackgroundColor:v3];

  id v4 = [(CarplayCollapsedAllDayTableViewCell *)self normalPrimaryTextColor];
  [(UILabel *)self->_primaryLabel setTextColor:v4];
}

- (void)_setupConstraints
{
  v58 = [(UIView *)self->_allDaySuperview leadingAnchor];
  v59 = [(CarplayCollapsedAllDayTableViewCell *)self contentView];
  v57 = [v59 leadingAnchor];
  v56 = [v58 constraintEqualToAnchor:v57];
  v60[0] = v56;
  v54 = [(UIView *)self->_allDaySuperview trailingAnchor];
  v55 = [(CarplayCollapsedAllDayTableViewCell *)self contentView];
  v53 = [v55 trailingAnchor];
  v52 = [v54 constraintEqualToAnchor:v53];
  v60[1] = v52;
  v50 = [(UIView *)self->_allDaySuperview topAnchor];
  v51 = [(CarplayCollapsedAllDayTableViewCell *)self contentView];
  v49 = [v51 topAnchor];
  v48 = [v50 constraintEqualToAnchor:v49];
  v60[2] = v48;
  v46 = [(UIView *)self->_allDaySuperview bottomAnchor];
  v47 = [(CarplayCollapsedAllDayTableViewCell *)self contentView];
  v45 = [v47 bottomAnchor];
  v44 = [v46 constraintEqualToAnchor:v45];
  v60[3] = v44;
  v42 = [(UIView *)self->_occurrenceCellSuperview leadingAnchor];
  v43 = [(CarplayCollapsedAllDayTableViewCell *)self contentView];
  v41 = [v43 leadingAnchor];
  v40 = [v42 constraintEqualToAnchor:v41];
  v60[4] = v40;
  v38 = [(UIView *)self->_occurrenceCellSuperview trailingAnchor];
  v39 = [(CarplayCollapsedAllDayTableViewCell *)self contentView];
  v37 = [v39 trailingAnchor];
  v36 = [v38 constraintEqualToAnchor:v37];
  v60[5] = v36;
  v34 = [(UIView *)self->_occurrenceCellSuperview topAnchor];
  v35 = [(CarplayCollapsedAllDayTableViewCell *)self contentView];
  v33 = [v35 topAnchor];
  v32 = [v34 constraintEqualToAnchor:v33];
  v60[6] = v32;
  v30 = [(UIView *)self->_occurrenceCellSuperview bottomAnchor];
  v31 = [(CarplayCollapsedAllDayTableViewCell *)self contentView];
  v29 = [v31 bottomAnchor];
  v28 = [v30 constraintEqualToAnchor:v29];
  v60[7] = v28;
  v27 = [(UIView *)self->_coloredBackgroundView topAnchor];
  v26 = [(UIView *)self->_allDaySuperview topAnchor];
  v25 = [v27 constraintEqualToAnchor:v26];
  v60[8] = v25;
  v24 = [(UIView *)self->_coloredBackgroundView bottomAnchor];
  objc_super v23 = [(UIView *)self->_allDaySuperview bottomAnchor];
  v22 = [v24 constraintEqualToAnchor:v23];
  v60[9] = v22;
  v21 = [(UIView *)self->_coloredBackgroundView trailingAnchor];
  v20 = [(UIView *)self->_allDaySuperview trailingAnchor];
  v19 = [v21 constraintEqualToAnchor:v20];
  v60[10] = v19;
  uint64_t v18 = [(UIView *)self->_coloredBackgroundView leadingAnchor];
  CGRect v17 = [(UIView *)self->_allDaySuperview leadingAnchor];
  CGRect v16 = [v18 constraintEqualToAnchor:v17];
  v60[11] = v16;
  objc_super v15 = [(UILabel *)self->_primaryLabel topAnchor];
  v14 = [(UIView *)self->_coloredBackgroundView topAnchor];
  v13 = [v15 constraintEqualToAnchor:v14 constant:8.0];
  v60[12] = v13;
  v3 = [(UILabel *)self->_primaryLabel bottomAnchor];
  id v4 = [(UIView *)self->_coloredBackgroundView bottomAnchor];
  v5 = [v3 constraintEqualToAnchor:v4 constant:-8.0];
  v60[13] = v5;
  CGFloat v6 = [(UILabel *)self->_primaryLabel trailingAnchor];
  CGFloat v7 = [(UIView *)self->_coloredBackgroundView trailingAnchor];
  CGFloat v8 = [v6 constraintLessThanOrEqualToAnchor:v7 constant:-8.0];
  v60[14] = v8;
  CGFloat v9 = [(UILabel *)self->_primaryLabel leadingAnchor];
  BOOL v10 = [(UIView *)self->_coloredBackgroundView leadingAnchor];
  v11 = [v9 constraintEqualToAnchor:v10 constant:16.5];
  v60[15] = v11;
  id v12 = +[NSArray arrayWithObjects:v60 count:16];
  +[NSLayoutConstraint activateConstraints:v12];
}

- (id)primaryTextLabelFont
{
  return +[UIFont _preferredFontForTextStyle:UIFontTextStyleBody addingSymbolicTraits:2];
}

- (id)normalPrimaryTextColor
{
  if ([(CarplayCollapsedAllDayTableViewCell *)self isHighlighted]) {
    +[UIColor _carSystemFocusLabelColor];
  }
  else {
  v2 = +[UIColor _carSystemFocusColor];
  }

  return v2;
}

- (id)normalTopTimeTextColor
{
  return +[UIColor _carSystemPrimaryColor];
}

- (id)normalPlatterBackgroundColor
{
  if ([(CarplayCollapsedAllDayTableViewCell *)self isHighlighted]) {
    +[UIColor _carSystemFocusColor];
  }
  else {
  v2 = +[UIColor _carSystemQuaternaryColor];
  }

  return v2;
}

- (id)_cellTitle
{
  if (self->_allDayCount)
  {
    v3 = +[NSBundle bundleForClass:objc_opt_class()];
    id v4 = [v3 localizedStringForKey:@"num_all_day_events_carplay_list" value:&stru_1001D6918 table:0];
    v5 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v4, self->_allDayCount);

    p_birthdayCount = &self->_birthdayCount;
    if (!self->_birthdayCount)
    {
      if (v5)
      {
        CGFloat v7 = 0;
LABEL_11:
        v13 = v5;

        CGFloat v7 = v13;
        goto LABEL_14;
      }
      goto LABEL_13;
    }
  }
  else
  {
    p_birthdayCount = &self->_birthdayCount;
    if (!self->_birthdayCount)
    {
LABEL_13:
      CGFloat v7 = &stru_1001D6918;
      goto LABEL_14;
    }
    v5 = 0;
  }
  CGFloat v8 = +[NSBundle bundleForClass:objc_opt_class()];
  CGFloat v9 = [v8 localizedStringForKey:@"num_birthday_events_carplay_list" value:&stru_1001D6918 table:0];
  +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, *p_birthdayCount);
  CGFloat v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v5 && v7)
  {
    BOOL v10 = +[NSBundle bundleForClass:objc_opt_class()];
    v11 = [v10 localizedStringForKey:@"%@, %@", &stru_1001D6918, 0 value table];
    uint64_t v12 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v11, v5, v7);

    CGFloat v7 = (__CFString *)v12;
    goto LABEL_14;
  }
  if (v5) {
    goto LABEL_11;
  }
  if (!v7) {
    goto LABEL_13;
  }
LABEL_14:

  return v7;
}

- (void)crossfadeToCell:(id)a3
{
  id v4 = a3;
  v5 = [v4 contentView];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  occurrenceCellSuperview = self->_occurrenceCellSuperview;
  CGFloat v7 = [v4 contentView];
  [(UIView *)occurrenceCellSuperview addSubview:v7];

  v24 = [v4 contentView];
  objc_super v23 = [v24 leadingAnchor];
  v22 = [(UIView *)self->_occurrenceCellSuperview leadingAnchor];
  v21 = [v23 constraintEqualToAnchor:v22];
  v25[0] = v21;
  v20 = [v4 contentView];
  v19 = [v20 trailingAnchor];
  uint64_t v18 = [(UIView *)self->_occurrenceCellSuperview trailingAnchor];
  CGRect v17 = [v19 constraintEqualToAnchor:v18];
  v25[1] = v17;
  CGRect v16 = [v4 contentView];
  CGFloat v8 = [v16 topAnchor];
  CGFloat v9 = [(UIView *)self->_occurrenceCellSuperview topAnchor];
  BOOL v10 = [v8 constraintEqualToAnchor:v9];
  v25[2] = v10;
  v11 = [v4 contentView];

  uint64_t v12 = [v11 bottomAnchor];
  v13 = [(UIView *)self->_occurrenceCellSuperview bottomAnchor];
  v14 = [v12 constraintEqualToAnchor:v13];
  v25[3] = v14;
  objc_super v15 = +[NSArray arrayWithObjects:v25 count:4];
  +[NSLayoutConstraint activateConstraints:v15];

  +[UIView transitionFromView:self->_allDaySuperview toView:self->_occurrenceCellSuperview duration:5243136 options:0 completion:0.3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_occurrenceCellSuperview, 0);
  objc_storeStrong((id *)&self->_allDaySuperview, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);

  objc_storeStrong((id *)&self->_coloredBackgroundView, 0);
}

@end