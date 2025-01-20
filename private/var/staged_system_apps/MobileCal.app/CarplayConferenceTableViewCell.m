@interface CarplayConferenceTableViewCell
- (BOOL)canBecomeFocused;
- (CarplayConferenceTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)cellWasTapped;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)updateWithEvent:(id)a3;
@end

@implementation CarplayConferenceTableViewCell

- (CarplayConferenceTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v49.receiver = self;
  v49.super_class = (Class)CarplayConferenceTableViewCell;
  v4 = [(CarplayConferenceTableViewCell *)&v49 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    uint64_t v5 = objc_opt_new();
    label = v4->_label;
    v4->_label = (UILabel *)v5;

    [(UILabel *)v4->_label setNumberOfLines:0];
    v7 = +[UIColor labelColor];
    [(UILabel *)v4->_label setTextColor:v7];

    v8 = +[UIColor _carSystemFocusLabelColor];
    [(UILabel *)v4->_label setHighlightedTextColor:v8];

    [(UILabel *)v4->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    v9 = [(CarplayConferenceTableViewCell *)v4 traitCollection];
    v10 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCallout compatibleWithTraitCollection:v9];
    [(UILabel *)v4->_label setFont:v10];

    [(CarplayConferenceTableViewCell *)v4 addSubview:v4->_label];
    uint64_t v11 = objc_opt_new();
    subLabel = v4->_subLabel;
    v4->_subLabel = (UILabel *)v11;

    [(UILabel *)v4->_subLabel setNumberOfLines:0];
    v13 = +[UIColor _carSystemPrimaryColor];
    [(UILabel *)v4->_subLabel setTextColor:v13];

    v14 = +[UIColor _carSystemFocusPrimaryColor];
    [(UILabel *)v4->_subLabel setHighlightedTextColor:v14];

    [(UILabel *)v4->_subLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v15 = [(CarplayConferenceTableViewCell *)v4 traitCollection];
    v16 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCaption1 compatibleWithTraitCollection:v15];
    [(UILabel *)v4->_subLabel setFont:v16];

    [(CarplayConferenceTableViewCell *)v4 addSubview:v4->_subLabel];
    v17 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    icon = v4->_icon;
    v4->_icon = v17;

    v19 = +[UIColor labelColor];
    [(UIImageView *)v4->_icon setTintColor:v19];

    v20 = +[UIImageSymbolConfiguration configurationWithTextStyle:UIFontTextStyleCallout scale:3];
    [(UIImageView *)v4->_icon setPreferredSymbolConfiguration:v20];

    [(UIImageView *)v4->_icon setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CarplayConferenceTableViewCell *)v4 addSubview:v4->_icon];
    v48 = [(UILabel *)v4->_label leadingAnchor];
    v47 = [(CarplayConferenceTableViewCell *)v4 leadingAnchor];
    v46 = [v48 constraintEqualToAnchor:v47 constant:12.0];
    v50[0] = v46;
    v45 = [(UILabel *)v4->_subLabel leadingAnchor];
    v44 = [(CarplayConferenceTableViewCell *)v4 leadingAnchor];
    v43 = [v45 constraintEqualToAnchor:v44 constant:12.0];
    v50[1] = v43;
    v42 = [(UIImageView *)v4->_icon leadingAnchor];
    v41 = [(UILabel *)v4->_subLabel trailingAnchor];
    v40 = [v42 constraintGreaterThanOrEqualToAnchor:v41 constant:12.0];
    v50[2] = v40;
    v39 = [(UIImageView *)v4->_icon leadingAnchor];
    v38 = [(UILabel *)v4->_label trailingAnchor];
    v37 = [v39 constraintGreaterThanOrEqualToAnchor:v38 constant:12.0];
    v50[3] = v37;
    v36 = [(UILabel *)v4->_label firstBaselineAnchor];
    v35 = [(CarplayConferenceTableViewCell *)v4 topAnchor];
    v34 = [v36 constraintEqualToAnchor:v35 constant:20.0];
    v50[4] = v34;
    v33 = [(UILabel *)v4->_subLabel firstBaselineAnchor];
    v32 = [(UILabel *)v4->_label lastBaselineAnchor];
    v31 = [v33 constraintEqualToAnchor:v32 constant:16.0];
    v50[5] = v31;
    v21 = [(CarplayConferenceTableViewCell *)v4 trailingAnchor];
    v22 = [(UIImageView *)v4->_icon centerXAnchor];
    v23 = [v21 constraintEqualToAnchor:v22 constant:23.0];
    v50[6] = v23;
    v24 = [(UIImageView *)v4->_icon centerYAnchor];
    v25 = [(CarplayConferenceTableViewCell *)v4 centerYAnchor];
    v26 = [v24 constraintEqualToAnchor:v25];
    v50[7] = v26;
    v27 = [(CarplayConferenceTableViewCell *)v4 heightAnchor];
    v28 = [v27 constraintGreaterThanOrEqualToConstant:44.0];
    v50[8] = v28;
    v29 = +[NSArray arrayWithObjects:v50 count:9];
    +[NSLayoutConstraint activateConstraints:v29];
  }
  return v4;
}

- (void)updateWithEvent:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_event, a3);
  v6 = [(EKEvent *)self->_event virtualConference];
  v7 = [v6 joinMethods];
  v8 = [v7 firstObject];
  v9 = [v8 URL];
  v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    id v11 = [(EKEvent *)self->_event conferenceURLForDisplay];
  }
  v12 = v11;

  unsigned int v13 = [v12 cal_hasSchemeTel];
  v14 = +[NSBundle bundleForClass:objc_opt_class()];
  v15 = v14;
  if (v13) {
    CFStringRef v16 = @"Call In";
  }
  else {
    CFStringRef v16 = @"Join";
  }
  v17 = [v14 localizedStringForKey:v16 value:&stru_1001D6918 table:0];
  [(UILabel *)self->_label setText:v17];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100078AE0;
  v19[3] = &unk_1001D3718;
  id v20 = v5;
  v21 = self;
  id v18 = v5;
  +[CUIKConferenceUtils displayDetailsForURL:v12 completionHandler:v19];
}

- (void)cellWasTapped
{
  v3 = [(EKEvent *)self->_event virtualConference];
  v4 = [v3 joinMethods];
  id v5 = [v4 firstObject];
  v6 = [v5 URL];
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [(EKEvent *)self->_event conferenceURLForDisplay];
  }
  v9 = v8;

  v10 = kCalUILogCarplayHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogCarplayHandle, OS_LOG_TYPE_INFO))
  {
    int v13 = 138477827;
    v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Conference cell was tapped, url: [%{private}@]", (uint8_t *)&v13, 0xCu);
  }
  id v11 = [(CarplayConferenceTableViewCell *)self window];
  v12 = [v11 windowScene];
  [v12 openURL:v9 options:0 completionHandler:&stru_1001D3738];
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CarplayConferenceTableViewCell;
  [(CarplayConferenceTableViewCell *)&v7 setHighlighted:a3 animated:a4];
  if (v4) {
    +[UIColor _carSystemFocusLabelColor];
  }
  else {
  v6 = +[UIColor labelColor];
  }
  [(UIImageView *)self->_icon setTintColor:v6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_subLabel, 0);
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_event, 0);
}

@end