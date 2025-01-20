@interface CHListTableHeaderView
+ (double)preferredHeight;
+ (id)_monthYearDateFormatter;
- (CHListTableHeaderView)initWithFrame:(CGRect)a3;
- (CHListTableHeaderView)initWithReuseIdentifier:(id)a3;
- (void)_commonInit;
- (void)constrainViews;
- (void)prepareForReuse;
- (void)setDate:(id)a3;
@end

@implementation CHListTableHeaderView

+ (double)preferredHeight
{
  return 48.0;
}

+ (id)_monthYearDateFormatter
{
  if (qword_10096B548 != -1) {
    dispatch_once(&qword_10096B548, &stru_1008AD800);
  }
  v2 = (void *)qword_10096B540;

  return v2;
}

- (CHListTableHeaderView)initWithReuseIdentifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CHListTableHeaderView;
  v3 = [(CHListTableHeaderView *)&v6 initWithReuseIdentifier:a3];
  v4 = v3;
  if (v3) {
    [(CHListTableHeaderView *)v3 _commonInit];
  }
  return v4;
}

- (CHListTableHeaderView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CHListTableHeaderView;
  v3 = -[CHListTableHeaderView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(CHListTableHeaderView *)v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  id v3 = objc_alloc((Class)UIView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v16 = [v3 initWithFrame:CGRectZero.origin.x, y, width, height];
  v7 = +[UIColor blackColor];
  [v16 setBackgroundColor:v7];

  [(CHListTableHeaderView *)self setBackgroundView:v16];
  v8 = +[UIListContentConfiguration extraProminentInsetGroupedHeaderConfiguration];
  [v8 directionalLayoutMargins];
  [(CHListTableHeaderView *)self setDirectionalLayoutMargins:"setDirectionalLayoutMargins:"];
  v9 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  dateLabel = self->_dateLabel;
  self->_dateLabel = v9;

  [(UILabel *)self->_dateLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_dateLabel setAdjustsFontSizeToFitWidth:1];
  v11 = [v8 textProperties];
  v12 = [v11 font];
  [(UILabel *)self->_dateLabel setFont:v12];

  v13 = +[UIColor labelColor];
  [(UILabel *)self->_dateLabel setTextColor:v13];

  v14 = +[UIColor clearColor];
  [(UILabel *)self->_dateLabel setBackgroundColor:v14];

  v15 = [(CHListTableHeaderView *)self contentView];
  [v15 addSubview:self->_dateLabel];

  [(CHListTableHeaderView *)self constrainViews];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)CHListTableHeaderView;
  [(CHListTableHeaderView *)&v3 prepareForReuse];
  [(UILabel *)self->_dateLabel setText:0];
}

- (void)setDate:(id)a3
{
  id v4 = a3;
  id v6 = [(id)objc_opt_class() _monthYearDateFormatter];
  v5 = [v6 stringFromDate:v4];

  [(UILabel *)self->_dateLabel setText:v5];
  [(CHListTableHeaderView *)self setNeedsLayout];
}

- (void)constrainViews
{
  objc_super v3 = [(UILabel *)self->_dateLabel topAnchor];
  id v4 = [(CHListTableHeaderView *)self contentView];
  v5 = [v4 topAnchor];
  id v6 = [v3 constraintEqualToAnchor:v5 constant:14.0];

  v7 = [(UILabel *)self->_dateLabel leadingAnchor];
  v8 = [(CHListTableHeaderView *)self contentView];
  v9 = [v8 leadingAnchor];
  v10 = [v7 constraintEqualToAnchor:v9 constant:15.0];

  v11 = [(UILabel *)self->_dateLabel trailingAnchor];
  v12 = [(CHListTableHeaderView *)self contentView];
  v13 = [v12 trailingAnchor];
  v14 = [v11 constraintEqualToAnchor:v13 constant:-15.0];

  v15 = [(UILabel *)self->_dateLabel topAnchor];
  id v16 = [(CHListTableHeaderView *)self contentView];
  v17 = [v16 bottomAnchor];
  v18 = [v15 constraintEqualToAnchor:v17 constant:-0.0];

  LODWORD(v19) = 1132068864;
  [v18 setPriority:v19];
  v21[0] = v6;
  v21[1] = v10;
  v21[2] = v14;
  v21[3] = v18;
  v20 = +[NSArray arrayWithObjects:v21 count:4];
  +[NSLayoutConstraint activateConstraints:v20];
}

- (void).cxx_destruct
{
}

@end