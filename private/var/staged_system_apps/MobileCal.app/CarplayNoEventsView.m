@interface CarplayNoEventsView
- (BOOL)anyCalendarsHiddenByFocus;
- (CarplayNoEventsView)init;
- (void)didMoveToWindow;
- (void)setAnyCalendarsHiddenByFocus:(BOOL)a3;
- (void)updateHeaderText:(id)a3;
@end

@implementation CarplayNoEventsView

- (CarplayNoEventsView)init
{
  v35.receiver = self;
  v35.super_class = (Class)CarplayNoEventsView;
  v2 = [(CarplayNoEventsView *)&v35 init];
  if (v2)
  {
    v3 = +[UIColor tableBackgroundColor];
    [(CarplayNoEventsView *)v2 setBackgroundColor:v3];

    [(CarplayNoEventsView *)v2 setTranslatesAutoresizingMaskIntoConstraints:0];
    v4 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    label = v2->_label;
    v2->_label = v4;

    [(UILabel *)v2->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    v6 = +[NSBundle bundleForClass:objc_opt_class()];
    v34 = [v6 localizedStringForKey:@"No Events Today" value:&stru_1001D6918 table:0];

    [(UILabel *)v2->_label setText:v34];
    v7 = +[UIColor labelColor];
    [(UILabel *)v2->_label setTextColor:v7];

    [(UILabel *)v2->_label setTextAlignment:1];
    v8 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCallout];
    [(UILabel *)v2->_label setFont:v8];

    [(CarplayNoEventsView *)v2 addSubview:v2->_label];
    uint64_t v9 = objc_opt_new();
    header = v2->_header;
    v2->_header = (CarplayTableViewHeaderContentView *)v9;

    v11 = [(CarplayTableViewHeaderContentView *)v2->_header separator];
    [v11 setHidden:1];

    [(CarplayTableViewHeaderContentView *)v2->_header setTranslatesAutoresizingMaskIntoConstraints:0];
    v12 = CUIKNowDate();
    v13 = CUIKStringForDateAndDayOfWeekInCalendarTimezoneWithFormattingContext();
    v14 = [(CarplayTableViewHeaderContentView *)v2->_header label];
    [v14 setText:v13];

    [(CarplayNoEventsView *)v2 addSubview:v2->_header];
    v15 = [(UILabel *)v2->_label firstBaselineAnchor];
    v16 = [(CarplayNoEventsView *)v2 topAnchor];
    v17 = [(CarplayNoEventsView *)v2 window];
    [v17 bounds];
    uint64_t v18 = [v15 constraintEqualToAnchor:v16 constant:CGRectGetHeight(v37) * 0.56];
    labelBaselineConstraint = v2->_labelBaselineConstraint;
    v2->_labelBaselineConstraint = (NSLayoutConstraint *)v18;

    v33 = [(CarplayTableViewHeaderContentView *)v2->_header leadingAnchor];
    v32 = [(CarplayNoEventsView *)v2 leadingAnchor];
    v31 = [v33 constraintEqualToAnchor:v32 constant:12.0];
    v36[0] = v31;
    v30 = [(CarplayTableViewHeaderContentView *)v2->_header topAnchor];
    v20 = [(CarplayNoEventsView *)v2 topAnchor];
    v21 = [v30 constraintEqualToAnchor:v20];
    v36[1] = v21;
    v36[2] = v2->_labelBaselineConstraint;
    v22 = [(CarplayTableViewHeaderContentView *)v2->_header trailingAnchor];
    v23 = [(CarplayNoEventsView *)v2 trailingAnchor];
    v24 = [v22 constraintEqualToAnchor:v23 constant:-12.0];
    v36[3] = v24;
    v25 = [(UILabel *)v2->_label centerXAnchor];
    v26 = [(CarplayNoEventsView *)v2 centerXAnchor];
    v27 = [v25 constraintEqualToAnchor:v26];
    v36[4] = v27;
    v28 = +[NSArray arrayWithObjects:v36 count:5];
    +[NSLayoutConstraint activateConstraints:v28];
  }
  return v2;
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)CarplayNoEventsView;
  [(CarplayNoEventsView *)&v4 didMoveToWindow];
  v3 = [(CarplayNoEventsView *)self window];
  [v3 bounds];
  [(NSLayoutConstraint *)self->_labelBaselineConstraint setConstant:CGRectGetHeight(v5) * 0.56];
}

- (void)updateHeaderText:(id)a3
{
  header = self->_header;
  id v4 = a3;
  id v5 = [(CarplayTableViewHeaderContentView *)header label];
  [v5 setText:v4];
}

- (void)setAnyCalendarsHiddenByFocus:(BOOL)a3
{
  self->_anyCalendarsHiddenByFocus = a3;
  -[CarplayTableViewHeaderContentView setAnyCalendarsHiddenByFocus:](self->_header, "setAnyCalendarsHiddenByFocus:");
}

- (BOOL)anyCalendarsHiddenByFocus
{
  return self->_anyCalendarsHiddenByFocus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_labelBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_header, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end