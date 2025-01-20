@interface MTATimeView
+ (double)defaultHeight;
- (BOOL)showSubseconds;
- (MTATimeView)init;
- (UILabel)timeLabel;
- (double)time;
- (void)configureTimeLabel;
- (void)handleLocaleChange;
- (void)layoutSubviews;
- (void)setTime:(double)a3;
- (void)setTimeLabelFrame:(CGRect)a3;
- (void)sizeLabelToFit;
@end

@implementation MTATimeView

+ (double)defaultHeight
{
  return 0.0;
}

- (BOOL)showSubseconds
{
  return 0;
}

- (void)configureTimeLabel
{
  v3 = +[UIColor whiteColor];
  [(UILabel *)self->_timeLabel setTextColor:v3];

  v4 = +[UIColor clearColor];
  [(UILabel *)self->_timeLabel setBackgroundColor:v4];

  [(UILabel *)self->_timeLabel setOpaque:0];
  v5 = +[UIColor blackColor];
  [(UILabel *)self->_timeLabel setShadowColor:v5];

  v6 = +[UIFont preferredFontForTextStyle:UIFontTextStyleTitle1];
  [(UILabel *)self->_timeLabel setFont:v6];

  [(UILabel *)self->_timeLabel setTextAlignment:2];
  [(UILabel *)self->_timeLabel setBaselineAdjustment:1];
  timeLabel = self->_timeLabel;

  [(UILabel *)timeLabel setLineBreakMode:2];
}

- (void)sizeLabelToFit
{
  [(MTATimeView *)self setTime:0.0];
  timeLabel = self->_timeLabel;

  [(UILabel *)timeLabel sizeToFit];
}

- (MTATimeView)init
{
  v11.receiver = self;
  v11.super_class = (Class)MTATimeView;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v5 = -[MTATimeView initWithFrame:](&v11, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v6 = v5;
  if (v5)
  {
    [(MTATimeView *)v5 setOpaque:1];
    if ((+[UIApplication shouldMakeUIForDefaultPNG] & 1) == 0)
    {
      v7 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
      timeLabel = v6->_timeLabel;
      v6->_timeLabel = v7;

      [(MTATimeView *)v6 configureTimeLabel];
      [(MTATimeView *)v6 sizeLabelToFit];
      [(MTATimeView *)v6 configureBackground];
      [(MTATimeView *)v6 setTime:0.0];
      [(MTATimeView *)v6 addSubview:v6->_timeLabel];
    }
    v9 = v6;
  }

  return v6;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)MTATimeView;
  [(MTATimeView *)&v13 layoutSubviews];
  [(UILabel *)self->_timeLabel frame];
  double v4 = v3;
  double v6 = v5;
  double maxTimeLabelWidth = self->_maxTimeLabelWidth;
  timeLabel = self->_timeLabel;
  [(MTATimeView *)self bounds];
  -[UILabel sizeThatFits:](timeLabel, "sizeThatFits:", v9, v10);
  if (maxTimeLabelWidth >= v11) {
    double maxTimeLabelWidth = v11;
  }
  [(MTATimeView *)self bounds];
  -[UILabel setFrame:](self->_timeLabel, "setFrame:", round((v12 - maxTimeLabelWidth) * 0.5), v4, maxTimeLabelWidth, v6);
}

- (void)handleLocaleChange
{
  ResetTimeFormatter();

  [(MTATimeView *)self setNeedsLayout];
}

- (void)setTimeLabelFrame:(CGRect)a3
{
  self->_double maxTimeLabelWidth = a3.size.width;
  -[UILabel setFrame:](self->_timeLabel, "setFrame:", a3.origin.x, a3.origin.y);
}

- (void)setTime:(double)a3
{
  self->_timeValue = a3;
  [(MTATimeView *)self showSubseconds];
  FormatTime();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(UILabel *)self->_timeLabel setText:v4];
}

- (double)time
{
  return self->_timeValue;
}

- (UILabel)timeLabel
{
  return self->_timeLabel;
}

- (void).cxx_destruct
{
}

@end