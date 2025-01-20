@interface IdentitySwitcherCell
+ (double)cellHeight;
+ (id)cellForSource:(id)a3 withModel:(id)a4 inTableView:(id)a5;
- (double)scaledValueForValue:(double)a3;
- (void)configureWithContact:(id)a3 displayName:(id)a4 address:(id)a5 notificationCount:(unint64_t)a6;
- (void)prepareForReuse;
@end

@implementation IdentitySwitcherCell

+ (double)cellHeight
{
  v2 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleHeadline addingSymbolicTraits:0x8000 options:0];
  v3 = +[UIFont fontWithDescriptor:v2 size:0.0];
  [v3 _scaledValueForValue:60.0];
  double v5 = v4;

  return v5;
}

+ (id)cellForSource:(id)a3 withModel:(id)a4 inTableView:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v7)
  {
    v17 = +[CalContactsProvider defaultProvider];
    v18 = [v17 unifiedMeContact];

    if (v18)
    {
      v19 = +[CalContactsProvider defaultProvider];
      v11 = [v19 myFullName];

      v20 = +[ContactsUtils defaultContactKeysToFetch];
      id v10 = +[ContactsUtils contactForContact:v18 keysToFetch:v20];

      if (v11)
      {
        v15 = 0;
        id v13 = 0;
        goto LABEL_12;
      }
    }
    else
    {
      id v10 = objc_alloc_init((Class)CNContact);
    }
    v15 = +[NSBundle mainBundle];
    v11 = [v15 localizedStringForKey:@"My Calendar" value:&stru_1001D6918 table:0];
    id v13 = 0;
    goto LABEL_11;
  }
  contactForSource(v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = CUIKDisplayedTitleForSource();
  v12 = [v8 eventNotificationReferencesForIdentity:v7];
  id v13 = [v12 count];

  v14 = [v10 CalEmailAddresses];
  v15 = [v14 firstObject];

  if (!v15)
  {
    v16 = [v10 CalPhoneNumbers];
    v15 = [v16 firstObject];
  }
  if ([v15 hasSuffix:@"@do_not_reply"])
  {
LABEL_11:

    v15 = 0;
  }
LABEL_12:
  v21 = [v9 dequeueReusableCellWithIdentifier:@"identityCell"];
  if (!v21) {
    v21 = [[IdentitySwitcherCell alloc] initWithStyle:0 reuseIdentifier:@"identityCell"];
  }
  [(IdentitySwitcherCell *)v21 configureWithContact:v10 displayName:v11 address:v15 notificationCount:v13];

  return v21;
}

- (void)prepareForReuse
{
  +[NSLayoutConstraint deactivateConstraints:self->_constraints];
  [(EKUILabeledAvatarView *)self->_avatarView removeFromSuperview];
  [(UILabel *)self->_nameLabel removeFromSuperview];
  [(UILabel *)self->_addressLabel removeFromSuperview];
  [(UILabel *)self->_notificationCountLabel removeFromSuperview];
  constraints = self->_constraints;
  self->_constraints = 0;

  avatarView = self->_avatarView;
  self->_avatarView = 0;

  nameLabel = self->_nameLabel;
  self->_nameLabel = 0;

  addressLabel = self->_addressLabel;
  self->_addressLabel = 0;

  notificationCountLabel = self->_notificationCountLabel;
  self->_notificationCountLabel = 0;

  v8.receiver = self;
  v8.super_class = (Class)IdentitySwitcherCell;
  [(IdentitySwitcherCell *)&v8 prepareForReuse];
}

- (void)configureWithContact:(id)a3 displayName:(id)a4 address:(id)a5 notificationCount:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (self->_constraints) {
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
  }
  id v13 = +[NSMutableArray array];
  constraints = self->_constraints;
  self->_constraints = v13;

  if (v10 && !self->_avatarView)
  {
    v15 = (EKUILabeledAvatarView *)[objc_alloc((Class)EKUILabeledAvatarView) initWithPlacement:0 options:0];
    avatarView = self->_avatarView;
    self->_avatarView = v15;

    [(EKUILabeledAvatarView *)self->_avatarView setTranslatesAutoresizingMaskIntoConstraints:0];
    v17 = [(IdentitySwitcherCell *)self contentView];
    [v17 addSubview:self->_avatarView];
  }
  if (v11 && !self->_nameLabel)
  {
    v18 = (UILabel *)objc_alloc_init((Class)UILabel);
    nameLabel = self->_nameLabel;
    self->_nameLabel = v18;

    [(UILabel *)self->_nameLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v20 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleHeadline addingSymbolicTraits:0x8000 options:0];
    v21 = +[UIFont fontWithDescriptor:v20 size:0.0];
    [(UILabel *)self->_nameLabel setFont:v21];

    v22 = [(IdentitySwitcherCell *)self contentView];
    [v22 addSubview:self->_nameLabel];
  }
  addressLabel = self->_addressLabel;
  v97 = v12;
  if (v12 && !addressLabel)
  {
    v24 = (UILabel *)objc_alloc_init((Class)UILabel);
    v25 = self->_addressLabel;
    self->_addressLabel = v24;

    v26 = +[UIColor secondaryLabelColor];
    [(UILabel *)self->_addressLabel setTextColor:v26];

    [(UILabel *)self->_addressLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v27 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleSubhead addingSymbolicTraits:0x8000 options:0];
    v28 = +[UIFont fontWithDescriptor:v27 size:0.0];
    [(UILabel *)self->_addressLabel setFont:v28];

    v29 = [(IdentitySwitcherCell *)self contentView];
    [v29 addSubview:self->_addressLabel];

LABEL_15:
    goto LABEL_16;
  }
  if (!v12 && addressLabel)
  {
    [(UILabel *)addressLabel removeFromSuperview];
    v27 = self->_addressLabel;
    self->_addressLabel = 0;
    goto LABEL_15;
  }
LABEL_16:
  notificationCountLabel = self->_notificationCountLabel;
  if (a6 && !notificationCountLabel)
  {
    v31 = (UILabel *)objc_alloc_init((Class)UILabel);
    v32 = self->_notificationCountLabel;
    self->_notificationCountLabel = v31;

    v33 = +[UIColor tertiaryLabelColor];
    [(UILabel *)self->_notificationCountLabel setTextColor:v33];

    [(UILabel *)self->_notificationCountLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v34) = 1148846080;
    [(UILabel *)self->_notificationCountLabel setContentHuggingPriority:0 forAxis:v34];
    v35 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleBody addingSymbolicTraits:0x8000 options:0];
    v36 = +[UIFont fontWithDescriptor:v35 size:0.0];
    [(UILabel *)self->_notificationCountLabel setFont:v36];

    v37 = [(IdentitySwitcherCell *)self contentView];
    [v37 addSubview:self->_notificationCountLabel];

LABEL_22:
    goto LABEL_23;
  }
  if (!a6 && notificationCountLabel)
  {
    [(UILabel *)notificationCountLabel removeFromSuperview];
    v35 = self->_notificationCountLabel;
    self->_notificationCountLabel = 0;
    goto LABEL_22;
  }
LABEL_23:
  [(EKUILabeledAvatarView *)self->_avatarView setContact:v10];
  [(UILabel *)self->_nameLabel setText:v11];
  if (v12) {
    [(UILabel *)self->_addressLabel setText:v12];
  }
  v95 = v11;
  v96 = v10;
  if (a6)
  {
    v38 = +[NSNumber numberWithUnsignedInteger:a6];
    v39 = +[NSNumberFormatter localizedStringFromNumber:v38 numberStyle:1];
    [(UILabel *)self->_notificationCountLabel setText:v39];
  }
  [(IdentitySwitcherCell *)self scaledValueForValue:37.0];
  double v41 = v40;
  [(IdentitySwitcherCell *)self scaledValueForValue:16.0];
  double v43 = v42;
  [(IdentitySwitcherCell *)self scaledValueForValue:12.0];
  double v45 = v44;
  [(IdentitySwitcherCell *)self scaledValueForValue:2.0];
  double v47 = v46;
  [(IdentitySwitcherCell *)self scaledValueForValue:60.0];
  double v49 = v48;
  v50 = self->_constraints;
  v51 = self->_avatarView;
  v52 = [(IdentitySwitcherCell *)self contentView];
  v53 = +[NSLayoutConstraint constraintWithItem:v51 attribute:5 relatedBy:0 toItem:v52 attribute:5 multiplier:1.0 constant:v43];
  v101[0] = v53;
  v54 = self->_avatarView;
  v55 = [(IdentitySwitcherCell *)self contentView];
  v56 = +[NSLayoutConstraint constraintWithItem:v54 attribute:10 relatedBy:0 toItem:v55 attribute:10 multiplier:1.0 constant:0.0];
  v101[1] = v56;
  v57 = +[NSLayoutConstraint constraintWithItem:self->_avatarView attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v41];
  v101[2] = v57;
  v58 = +[NSLayoutConstraint constraintWithItem:self->_avatarView attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v41];
  v101[3] = v58;
  v59 = +[NSArray arrayWithObjects:v101 count:4];
  [(NSMutableArray *)v50 addObjectsFromArray:v59];

  v60 = self->_notificationCountLabel;
  if (v60)
  {
    v61 = v60;
  }
  else
  {
    v61 = [(IdentitySwitcherCell *)self contentView];
  }
  v62 = v61;
  if (self->_notificationCountLabel) {
    uint64_t v63 = 5;
  }
  else {
    uint64_t v63 = 18;
  }
  if (self->_notificationCountLabel) {
    double v64 = -v43;
  }
  else {
    double v64 = 0.0;
  }
  uint64_t v65 = 3;
  if (!self->_addressLabel) {
    uint64_t v65 = 10;
  }
  uint64_t v92 = v65;
  v93 = self->_constraints;
  v94 = v61;
  if (self->_addressLabel) {
    uint64_t v66 = 15;
  }
  else {
    uint64_t v66 = 10;
  }
  v67 = +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_nameLabel, 5, 0, self->_avatarView, 6, 1.0, v45, 8);
  v100[0] = v67;
  uint64_t v91 = v63;
  v68 = +[NSLayoutConstraint constraintWithItem:self->_nameLabel attribute:6 relatedBy:0 toItem:v62 attribute:v63 multiplier:1.0 constant:v64];
  v100[1] = v68;
  v69 = self->_nameLabel;
  v70 = [(IdentitySwitcherCell *)self contentView];
  v71 = +[NSLayoutConstraint constraintWithItem:v69 attribute:v92 relatedBy:0 toItem:v70 attribute:v66 multiplier:1.0 constant:0.0];
  v100[2] = v71;
  v72 = +[NSArray arrayWithObjects:v100 count:3];
  [(NSMutableArray *)v93 addObjectsFromArray:v72];

  v73 = self->_addressLabel;
  if (v73)
  {
    v74 = self->_constraints;
    v75 = +[NSLayoutConstraint constraintWithItem:v73 attribute:5 relatedBy:0 toItem:*(Class *)((char *)&self->super.super.super.super.isa + v90) attribute:6 multiplier:1.0 constant:v45];
    v99[0] = v75;
    v76 = +[NSLayoutConstraint constraintWithItem:self->_addressLabel attribute:6 relatedBy:0 toItem:v94 attribute:v91 multiplier:1.0 constant:v64];
    v99[1] = v76;
    v77 = +[NSLayoutConstraint constraintWithItem:self->_addressLabel attribute:3 relatedBy:0 toItem:self->_nameLabel attribute:4 multiplier:1.0 constant:v47];
    v99[2] = v77;
    v78 = +[NSArray arrayWithObjects:v99 count:3];
    [(NSMutableArray *)v74 addObjectsFromArray:v78];
  }
  v79 = self->_notificationCountLabel;
  if (v79)
  {
    v80 = self->_constraints;
    v81 = [(IdentitySwitcherCell *)self contentView];
    v82 = +[NSLayoutConstraint constraintWithItem:v79 attribute:6 relatedBy:0 toItem:v81 attribute:18 multiplier:1.0 constant:0.0];
    v98[0] = v82;
    v83 = self->_notificationCountLabel;
    v84 = [(IdentitySwitcherCell *)self contentView];
    v85 = +[NSLayoutConstraint constraintWithItem:v83 attribute:10 relatedBy:0 toItem:v84 attribute:10 multiplier:1.0 constant:0.0];
    v98[1] = v85;
    v86 = +[NSArray arrayWithObjects:v98 count:2];
    [(NSMutableArray *)v80 addObjectsFromArray:v86];
  }
  v87 = self->_constraints;
  v88 = [(IdentitySwitcherCell *)self contentView];
  v89 = +[NSLayoutConstraint constraintWithItem:v88 attribute:8 relatedBy:1 toItem:0 attribute:0 multiplier:1.0 constant:v49];
  [(NSMutableArray *)v87 addObject:v89];

  +[NSLayoutConstraint activateConstraints:self->_constraints];
}

- (double)scaledValueForValue:(double)a3
{
  nameLabel = self->_nameLabel;
  if (nameLabel)
  {
    double v5 = [(UILabel *)nameLabel font];
    [v5 _scaledValueForValue:a3];
    a3 = v6;
  }
  return a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_notificationCountLabel, 0);
  objc_storeStrong((id *)&self->_addressLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);

  objc_storeStrong((id *)&self->_avatarView, 0);
}

@end