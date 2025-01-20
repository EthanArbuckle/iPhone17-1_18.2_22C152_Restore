@interface CarplayAttendeeTableViewCell
- (CarplayAttendeeTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)_createAndActivateConstraints;
- (void)cellWasTapped;
- (void)updateWithEvent:(id)a3;
@end

@implementation CarplayAttendeeTableViewCell

- (CarplayAttendeeTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v23.receiver = self;
  v23.super_class = (Class)CarplayAttendeeTableViewCell;
  v4 = [(CarplayAttendeeTableViewCell *)&v23 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = (EKUILabeledAvatarView *)[objc_alloc((Class)EKUILabeledAvatarView) initWithPlacement:0 options:0];
    avatar = v4->_avatar;
    v4->_avatar = v5;

    [(EKUILabeledAvatarView *)v4->_avatar setTranslatesAutoresizingMaskIntoConstraints:0];
    v7 = [(CarplayAttendeeTableViewCell *)v4 contentView];
    [v7 addSubview:v4->_avatar];

    uint64_t v8 = objc_opt_new();
    attendeeRelationship = v4->_attendeeRelationship;
    v4->_attendeeRelationship = (UILabel *)v8;

    [(UILabel *)v4->_attendeeRelationship setNumberOfLines:1];
    v10 = +[UIColor _carSystemPrimaryColor];
    [(UILabel *)v4->_attendeeRelationship setTextColor:v10];

    v11 = +[UIColor _carSystemFocusPrimaryColor];
    [(UILabel *)v4->_attendeeRelationship setHighlightedTextColor:v11];

    [(UILabel *)v4->_attendeeRelationship setTranslatesAutoresizingMaskIntoConstraints:0];
    v12 = [(CarplayAttendeeTableViewCell *)v4 traitCollection];
    v13 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCaption1 compatibleWithTraitCollection:v12];
    [(UILabel *)v4->_attendeeRelationship setFont:v13];

    v14 = [(CarplayAttendeeTableViewCell *)v4 contentView];
    [v14 addSubview:v4->_attendeeRelationship];

    uint64_t v15 = objc_opt_new();
    attendeeName = v4->_attendeeName;
    v4->_attendeeName = (UILabel *)v15;

    [(UILabel *)v4->_attendeeName setNumberOfLines:1];
    v17 = +[UIColor labelColor];
    [(UILabel *)v4->_attendeeName setTextColor:v17];

    v18 = +[UIColor _carSystemFocusLabelColor];
    [(UILabel *)v4->_attendeeName setHighlightedTextColor:v18];

    [(UILabel *)v4->_attendeeName setTranslatesAutoresizingMaskIntoConstraints:0];
    v19 = [(CarplayAttendeeTableViewCell *)v4 traitCollection];
    v20 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCallout compatibleWithTraitCollection:v19];
    [(UILabel *)v4->_attendeeName setFont:v20];

    v21 = [(CarplayAttendeeTableViewCell *)v4 contentView];
    [v21 addSubview:v4->_attendeeName];

    [(CarplayAttendeeTableViewCell *)v4 setAccessoryType:1];
    [(CarplayAttendeeTableViewCell *)v4 _createAndActivateConstraints];
  }
  return v4;
}

- (void)_createAndActivateConstraints
{
  v38 = [(EKUILabeledAvatarView *)self->_avatar leadingAnchor];
  v39 = [(CarplayAttendeeTableViewCell *)self contentView];
  v37 = [v39 leadingAnchor];
  v36 = [v38 constraintEqualToAnchor:v37 constant:8.0];
  v40[0] = v36;
  v35 = [(EKUILabeledAvatarView *)self->_avatar widthAnchor];
  v34 = [v35 constraintEqualToConstant:30.0];
  v40[1] = v34;
  v33 = [(EKUILabeledAvatarView *)self->_avatar heightAnchor];
  v32 = [v33 constraintEqualToConstant:30.0];
  v40[2] = v32;
  v30 = [(EKUILabeledAvatarView *)self->_avatar centerYAnchor];
  v31 = [(CarplayAttendeeTableViewCell *)self contentView];
  v29 = [v31 centerYAnchor];
  v28 = [v30 constraintEqualToAnchor:v29];
  v40[3] = v28;
  v27 = [(UILabel *)self->_attendeeName leadingAnchor];
  v26 = [(EKUILabeledAvatarView *)self->_avatar trailingAnchor];
  v25 = [v27 constraintEqualToAnchor:v26 constant:8.0];
  v40[4] = v25;
  objc_super v23 = [(UILabel *)self->_attendeeName trailingAnchor];
  v24 = [(CarplayAttendeeTableViewCell *)self contentView];
  v22 = [v24 trailingAnchor];
  v21 = [v23 constraintEqualToAnchor:v22];
  v40[5] = v21;
  v20 = [(UILabel *)self->_attendeeRelationship leadingAnchor];
  v19 = [(EKUILabeledAvatarView *)self->_avatar trailingAnchor];
  v18 = [v20 constraintEqualToAnchor:v19 constant:8.0];
  v40[6] = v18;
  v16 = [(UILabel *)self->_attendeeRelationship trailingAnchor];
  v17 = [(CarplayAttendeeTableViewCell *)self contentView];
  uint64_t v15 = [v17 trailingAnchor];
  v14 = [v16 constraintEqualToAnchor:v15];
  v40[7] = v14;
  v13 = [(UILabel *)self->_attendeeName firstBaselineAnchor];
  v3 = [(UILabel *)self->_attendeeRelationship lastBaselineAnchor];
  v4 = [v13 constraintEqualToAnchor:v3 constant:18.0];
  v40[8] = v4;
  v5 = [(UILabel *)self->_attendeeRelationship firstBaselineAnchor];
  v6 = [(CarplayAttendeeTableViewCell *)self contentView];
  v7 = [v6 topAnchor];
  uint64_t v8 = [v5 constraintEqualToAnchor:v7 constant:18.0];
  v40[9] = v8;
  v9 = [(CarplayAttendeeTableViewCell *)self contentView];
  v10 = [v9 heightAnchor];
  v11 = [v10 constraintGreaterThanOrEqualToConstant:44.0];
  v40[10] = v11;
  v12 = +[NSArray arrayWithObjects:v40 count:11];
  +[NSLayoutConstraint activateConstraints:v12];
}

- (void)updateWithEvent:(id)a3
{
  p_event = &self->_event;
  objc_storeStrong((id *)&self->_event, a3);
  id v6 = a3;
  v7 = [(EKEvent *)*p_event organizer];
  uint64_t v8 = DisplayAddressForIdentity();
  v9 = [v7 name];
  v10 = [v7 firstName];
  v11 = [v7 lastName];
  v12 = +[ContactsUtils defaultContactKeysToFetch];
  v13 = +[ContactsUtils contactForAddress:v8 fullName:v9 firstName:v10 lastName:v11 keysToFetch:v12];
  contact = self->_contact;
  self->_contact = v13;

  avatar = self->_avatar;
  v20 = self->_contact;
  v16 = +[NSArray arrayWithObjects:&v20 count:1];
  [(EKUILabeledAvatarView *)avatar updateWithContacts:v16];

  v17 = +[NSBundle bundleForClass:objc_opt_class()];
  v18 = [v17 localizedStringForKey:@"Invitation from" value:&stru_1001D6918 table:0];
  [(UILabel *)self->_attendeeRelationship setText:v18];

  v19 = [(id)EKWeakLinkClass() stringFromContact:self->_contact style:0];
  [(UILabel *)self->_attendeeName setText:v19];
}

- (void)cellWasTapped
{
  v3 = kCalUILogCarplayHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogCarplayHandle, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Attendee cell was tapped", v6, 2u);
  }
  v4 = +[CNStarkCardViewController starkCardControllerForCalendarEventWithContact:self->_contact];
  v5 = [(CarplayDetailTableViewCell *)self delegate];
  [v5 pushViewController:v4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attendeeName, 0);
  objc_storeStrong((id *)&self->_attendeeRelationship, 0);
  objc_storeStrong((id *)&self->_avatar, 0);
  objc_storeStrong((id *)&self->_contact, 0);

  objc_storeStrong((id *)&self->_event, 0);
}

@end