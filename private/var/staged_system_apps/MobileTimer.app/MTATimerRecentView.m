@interface MTATimerRecentView
+ (double)estimatedHeightForTimerWithTitle:(id)a3;
- (MTARecentCellViewDelegate)delegate;
- (MTATimerRecentView)initWithFrame:(CGRect)a3;
- (MTTimerDuration)duration;
- (NSDateComponentsFormatter)durationFormatter;
- (NSDateComponentsFormatter)titleFormatter;
- (UIButton)controlButton;
- (UILabel)countDownLabel;
- (UILabel)durationLabel;
- (void)didTapStartButton:(id)a3;
- (void)localSetup;
- (void)setControlButton:(id)a3;
- (void)setCountDownLabel:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegate:(id)a3 duration:(id)a4;
- (void)setDuration:(id)a3;
- (void)setDurationFormatter:(id)a3;
- (void)setDurationLabel:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setTitleFormatter:(id)a3;
- (void)setupControlButton;
- (void)setupCountdownLabel;
- (void)setupDateFormatters;
- (void)setupDurationLabel;
- (void)setupLayoutConstraints;
- (void)updateDuration:(id)a3;
@end

@implementation MTATimerRecentView

+ (double)estimatedHeightForTimerWithTitle:(id)a3
{
  +[MTATimerCellView estimatedHeightForTimerWithTitle:a3];
  return result;
}

- (void)setDelegate:(id)a3 duration:(id)a4
{
  id v6 = a4;
  [(MTATimerRecentView *)self setDelegate:a3];
  [(MTATimerRecentView *)self setDuration:v6];

  id v7 = [(MTATimerRecentView *)self duration];
  [(MTATimerRecentView *)self updateDuration:v7];
}

- (MTATimerRecentView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MTATimerRecentView;
  v3 = -[MTATimerRecentView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(MTATimerRecentView *)v3 localSetup];
  }
  return v4;
}

- (void)localSetup
{
  [(MTATimerRecentView *)self setupCountdownLabel];
  [(MTATimerRecentView *)self setupDurationLabel];
  [(MTATimerRecentView *)self setupControlButton];
  [(MTATimerRecentView *)self setupLayoutConstraints];
  [(MTATimerRecentView *)self setupDateFormatters];
  v3 = [(MTATimerRecentView *)self countDownLabel];
  [v3 setText:@"5:00"];

  id v4 = [(MTATimerRecentView *)self durationLabel];
  [v4 setText:@"15:00"];
}

- (void)setupCountdownLabel
{
  v3 = objc_opt_new();
  [(MTATimerRecentView *)self setCountDownLabel:v3];

  id v4 = [(MTATimerRecentView *)self countDownLabel];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  v5 = +[UIColor secondaryLabelColor];
  objc_super v6 = [(MTATimerRecentView *)self countDownLabel];
  [v6 setTextColor:v5];

  id v7 = +[UIFont mtui_thinTimeFont];
  v8 = [(MTATimerRecentView *)self countDownLabel];
  [v8 setFont:v7];

  id v9 = [(MTATimerRecentView *)self countDownLabel];
  [(MTATimerRecentView *)self addSubview:v9];
}

- (void)setupDurationLabel
{
  v3 = objc_opt_new();
  [(MTATimerRecentView *)self setDurationLabel:v3];

  id v4 = [(MTATimerRecentView *)self durationLabel];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  v5 = +[UIColor secondaryLabelColor];
  objc_super v6 = [(MTATimerRecentView *)self durationLabel];
  [v6 setTextColor:v5];

  id v7 = [(MTATimerRecentView *)self durationLabel];
  [v7 setNumberOfLines:0];

  v8 = [(MTATimerRecentView *)self durationLabel];
  [v8 setLineBreakMode:0];

  id v9 = [(MTATimerRecentView *)self durationLabel];
  [v9 setAdjustsFontSizeToFitWidth:0];

  id v10 = [(MTATimerRecentView *)self durationLabel];
  [(MTATimerRecentView *)self addSubview:v10];
}

- (void)setupControlButton
{
  v3 = -[MTATimerRecentStartButton initWithFrame:]([MTATimerRecentStartButton alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(MTATimerRecentView *)self setControlButton:v3];

  id v4 = [(MTATimerRecentView *)self controlButton];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  v5 = [(MTATimerRecentView *)self controlButton];
  objc_super v6 = [v5 layer];
  [v6 setCornerRadius:33.0];

  id v7 = [(MTATimerRecentView *)self controlButton];
  [v7 setClipsToBounds:1];

  v8 = [(MTATimerRecentView *)self controlButton];
  id v9 = +[UIColor systemGreenColor];
  id v10 = +[UIImage mtui_imageWithSymbolName:@"play.fill" pointSize:v9 color:24.0];
  [v8 setImage:v10 forState:0];

  v11 = [(MTATimerRecentView *)self controlButton];
  [v11 addTarget:self action:"didTapStartButton:" forControlEvents:64];

  id v12 = [(MTATimerRecentView *)self controlButton];
  [(MTATimerRecentView *)self addSubview:v12];
}

- (void)setupDateFormatters
{
  v3 = objc_opt_new();
  [(MTATimerRecentView *)self setDurationFormatter:v3];

  id v4 = [(MTATimerRecentView *)self durationFormatter];
  [v4 setAllowedUnits:224];

  v5 = [(MTATimerRecentView *)self durationFormatter];
  [v5 setUnitsStyle:2];

  objc_super v6 = objc_opt_new();
  [(MTATimerRecentView *)self setTitleFormatter:v6];

  id v7 = [(MTATimerRecentView *)self titleFormatter];
  [v7 setAllowedUnits:224];

  id v8 = [(MTATimerRecentView *)self titleFormatter];
  [v8 setUnitsStyle:0];
}

- (void)setupLayoutConstraints
{
  id v65 = (id)objc_opt_new();
  v3 = objc_opt_new();
  [v3 setIdentifier:@"cellContentLayoutGuide"];
  [(MTATimerRecentView *)self addLayoutGuide:v3];
  id v4 = [v3 leadingAnchor];
  v5 = [(MTATimerRecentView *)self leadingAnchor];
  objc_super v6 = [v4 constraintEqualToAnchor:v5 constant:16.0];
  [v65 addObject:v6];

  id v7 = [v3 trailingAnchor];
  id v8 = [(MTATimerRecentView *)self trailingAnchor];
  id v9 = [v7 constraintEqualToAnchor:v8 constant:-16.0];
  [v65 addObject:v9];

  id v10 = [v3 topAnchor];
  v11 = [(MTATimerRecentView *)self topAnchor];
  id v12 = [v10 constraintEqualToAnchor:v11 constant:8.0];
  [v65 addObject:v12];

  v13 = [v3 bottomAnchor];
  v14 = [(MTATimerRecentView *)self bottomAnchor];
  v15 = [v13 constraintEqualToAnchor:v14 constant:-8.0];
  [v65 addObject:v15];

  v16 = [(MTATimerRecentView *)self countDownLabel];
  v17 = [v16 leadingAnchor];
  v18 = [v3 leadingAnchor];
  v19 = [v17 constraintEqualToAnchor:v18];
  [v65 addObject:v19];

  v20 = [(MTATimerRecentView *)self countDownLabel];
  v21 = [v20 trailingAnchor];
  v22 = [(MTATimerRecentView *)self controlButton];
  v23 = [v22 leadingAnchor];
  v24 = [v21 constraintEqualToAnchor:v23 constant:16.0 * -0.5];
  [v65 addObject:v24];

  v25 = [(MTATimerRecentView *)self countDownLabel];
  v26 = [v25 topAnchor];
  v27 = [v3 topAnchor];
  v28 = [v26 constraintEqualToAnchor:v27];
  [v65 addObject:v28];

  v29 = [(MTATimerRecentView *)self countDownLabel];
  v30 = [v29 bottomAnchor];
  v31 = [(MTATimerRecentView *)self durationLabel];
  v32 = [v31 topAnchor];
  v33 = [v30 constraintEqualToAnchor:v32];
  [v65 addObject:v33];

  v34 = [(MTATimerRecentView *)self durationLabel];
  v35 = [v34 leadingAnchor];
  v36 = [v3 leadingAnchor];
  v37 = [v35 constraintEqualToAnchor:v36];
  [v65 addObject:v37];

  v38 = [(MTATimerRecentView *)self durationLabel];
  v39 = [v38 trailingAnchor];
  v40 = [(MTATimerRecentView *)self countDownLabel];
  v41 = [v40 trailingAnchor];
  v42 = [v39 constraintEqualToAnchor:v41];
  [v65 addObject:v42];

  v43 = [(MTATimerRecentView *)self durationLabel];
  v44 = [v43 bottomAnchor];
  v45 = [v3 bottomAnchor];
  v46 = [v44 constraintEqualToAnchor:v45];
  [v65 addObject:v46];

  v47 = [(MTATimerRecentView *)self controlButton];
  v48 = [v47 heightAnchor];
  v49 = [v48 constraintEqualToConstant:66.0];
  [v65 addObject:v49];

  v50 = [(MTATimerRecentView *)self controlButton];
  v51 = [v50 widthAnchor];
  v52 = [v51 constraintEqualToConstant:66.0];
  [v65 addObject:v52];

  v53 = [(MTATimerRecentView *)self controlButton];
  v54 = [v53 topAnchor];
  v55 = [(MTATimerRecentView *)self countDownLabel];
  v56 = [v55 firstBaselineAnchor];
  v57 = [(MTATimerRecentView *)self countDownLabel];
  v58 = [v57 font];
  [v58 capHeight];
  v60 = [v54 constraintEqualToAnchor:v56 constant:-(v59 + 2.0)];
  [v65 addObject:v60];

  v61 = [(MTATimerRecentView *)self controlButton];
  v62 = [v61 trailingAnchor];
  v63 = [v3 trailingAnchor];
  v64 = [v62 constraintEqualToAnchor:v63 constant:(84.0 + -66.0) * -0.5];
  [v65 addObject:v64];

  +[NSLayoutConstraint activateConstraints:v65];
}

- (void)setEditing:(BOOL)a3
{
  if (a3) {
    double v3 = 0.0;
  }
  else {
    double v3 = 1.0;
  }
  id v4 = [(MTATimerRecentView *)self controlButton];
  [v4 setAlpha:v3];
}

- (void)updateDuration:(id)a3
{
  id v12 = a3;
  id v4 = [(MTATimerRecentView *)self titleFormatter];
  [v12 duration];
  v5 = [v4 stringFromTimeInterval:];

  objc_super v6 = [(MTATimerRecentView *)self countDownLabel];
  [v6 setText:v5];

  id v7 = [v12 title];
  id v8 = [v7 length];

  if (v8)
  {
    id v9 = [v12 title];
    id v10 = [(MTATimerRecentView *)self durationLabel];
    [v10 setText:v9];
  }
  else
  {
    id v9 = [(MTATimerRecentView *)self durationFormatter];
    [v12 duration];
    id v10 = [v9 stringFromTimeInterval:];
    v11 = [(MTATimerRecentView *)self durationLabel];
    [v11 setText:v10];
  }
}

- (void)didTapStartButton:(id)a3
{
  id v5 = [(MTATimerRecentView *)self delegate];
  id v4 = [(MTATimerRecentView *)self duration];
  [v5 didSelectRecentDuration:v4];
}

- (UILabel)countDownLabel
{
  return self->_countDownLabel;
}

- (void)setCountDownLabel:(id)a3
{
}

- (UILabel)durationLabel
{
  return self->_durationLabel;
}

- (void)setDurationLabel:(id)a3
{
}

- (UIButton)controlButton
{
  return self->_controlButton;
}

- (void)setControlButton:(id)a3
{
}

- (NSDateComponentsFormatter)durationFormatter
{
  return self->_durationFormatter;
}

- (void)setDurationFormatter:(id)a3
{
}

- (NSDateComponentsFormatter)titleFormatter
{
  return self->_titleFormatter;
}

- (void)setTitleFormatter:(id)a3
{
}

- (MTARecentCellViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MTARecentCellViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MTTimerDuration)duration
{
  return self->_duration;
}

- (void)setDuration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_duration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_titleFormatter, 0);
  objc_storeStrong((id *)&self->_durationFormatter, 0);
  objc_storeStrong((id *)&self->_controlButton, 0);
  objc_storeStrong((id *)&self->_durationLabel, 0);

  objc_storeStrong((id *)&self->_countDownLabel, 0);
}

@end