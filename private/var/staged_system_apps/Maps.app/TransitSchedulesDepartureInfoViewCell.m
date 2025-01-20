@interface TransitSchedulesDepartureInfoViewCell
- (NSString)content;
- (NSString)title;
- (TransitSchedulesDepartureInfoViewCell)initWithFrame:(CGRect)a3;
- (void)setContent:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation TransitSchedulesDepartureInfoViewCell

- (TransitSchedulesDepartureInfoViewCell)initWithFrame:(CGRect)a3
{
  v40.receiver = self;
  v40.super_class = (Class)TransitSchedulesDepartureInfoViewCell;
  v3 = -[TransitSchedulesDepartureInfoViewCell initWithFrame:](&v40, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIColor clearColor];
    [(TransitSchedulesDepartureInfoViewCell *)v3 setBackgroundColor:v4];

    v5 = [(TransitSchedulesDepartureInfoViewCell *)v3 contentView];
    id v6 = objc_alloc((Class)UILabel);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v10 = [v6 initWithFrame:CGRectMake(0, y, width, height)];
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v10;

    [(UILabel *)v3->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v12 = +[UIColor secondaryLabelColor];
    [(UILabel *)v3->_titleLabel setTextColor:v12];

    +[DynamicTypeWizard autorefreshLabel:v3->_titleLabel withFontProvider:&stru_1013213A0];
    [v5 addSubview:v3->_titleLabel];
    v13 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    subtitleLabel = v3->_subtitleLabel;
    v3->_subtitleLabel = v13;

    [(UILabel *)v3->_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v15 = +[UIColor labelColor];
    [(UILabel *)v3->_subtitleLabel setTextColor:v15];

    +[DynamicTypeWizard autorefreshLabel:v3->_subtitleLabel withFontProvider:&stru_1013214C0];
    [v5 addSubview:v3->_subtitleLabel];
    v39 = [(UILabel *)v3->_titleLabel topAnchor];
    v38 = [v5 topAnchor];
    v37 = [v39 constraintEqualToAnchor:v38 constant:12.0];
    v41[0] = v37;
    v36 = [(UILabel *)v3->_titleLabel leadingAnchor];
    v35 = [v5 leadingAnchor];
    v34 = [v36 constraintEqualToAnchor:v35 constant:16.0];
    v41[1] = v34;
    [(UILabel *)v3->_titleLabel trailingAnchor];
    v33 = v32 = v5;
    v31 = [v5 trailingAnchor];
    v30 = [v33 constraintEqualToAnchor:v31 constant:-16.0];
    v41[2] = v30;
    v29 = [(UILabel *)v3->_subtitleLabel topAnchor];
    v28 = [(UILabel *)v3->_titleLabel bottomAnchor];
    v27 = [v29 constraintEqualToAnchor:v28 constant:5.0];
    v41[3] = v27;
    v26 = [(UILabel *)v3->_subtitleLabel bottomAnchor];
    v16 = [v5 bottomAnchor];
    v17 = [v26 constraintEqualToAnchor:v16 constant:-12.0];
    v41[4] = v17;
    v18 = [(UILabel *)v3->_subtitleLabel leadingAnchor];
    v19 = [(UILabel *)v3->_titleLabel leadingAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    v41[5] = v20;
    v21 = [(UILabel *)v3->_subtitleLabel trailingAnchor];
    v22 = [(UILabel *)v3->_titleLabel trailingAnchor];
    v23 = [v21 constraintEqualToAnchor:v22];
    v41[6] = v23;
    v24 = +[NSArray arrayWithObjects:v41 count:7];
    +[NSLayoutConstraint activateConstraints:v24];
  }
  return v3;
}

- (void)setTitle:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_title, "isEqualToString:"))
  {
    v4 = (NSString *)[v6 copy];
    title = self->_title;
    self->_title = v4;

    [(UILabel *)self->_titleLabel setText:self->_title];
  }
}

- (void)setContent:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_content, "isEqualToString:"))
  {
    v4 = (NSString *)[v6 copy];
    content = self->_content;
    self->_content = v4;

    [(UILabel *)self->_subtitleLabel setText:self->_content];
  }
}

- (NSString)title
{
  return self->_title;
}

- (NSString)content
{
  return self->_content;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end