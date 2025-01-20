@interface CarShareTripContactCell
- (BOOL)isSharing;
- (BOOL)showsSubtitleWhenNotSharing;
- (CarShareTripContactCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (CarShareTripContactCellDelegate)delegate;
- (MSPSharedTripContact)contactValue;
- (NSString)contactName;
- (NSString)sharingHandle;
- (UIImage)contactImage;
- (id)_contactNameStringFromContact:(id)a3;
- (id)_sharingLabelColor:(BOOL)a3;
- (id)_sharingRingColor:(BOOL)a3;
- (id)_subtitleString;
- (unint64_t)sharingState;
- (void)_redrawContactImage;
- (void)_setContactIdentifier:(id)a3;
- (void)_setSharingState:(unint64_t)a3 animated:(BOOL)a4;
- (void)_updateAppearance;
- (void)_updateSharingRingAnimated:(BOOL)a3;
- (void)_updateSubtitleLabel;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)configureWithMSPSharedTripContact:(id)a3;
- (void)configureWithSharedTrip:(id)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)prepareForReuse;
- (void)setCapabilityType:(unint64_t)a3 serviceName:(id)a4;
- (void)setContactImage:(id)a3;
- (void)setContactName:(id)a3;
- (void)setContactValue:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setSharingHandle:(id)a3;
- (void)setSharingState:(unint64_t)a3;
- (void)setSharingState:(unint64_t)a3 animated:(BOOL)a4;
- (void)setShowsSubtitleWhenNotSharing:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CarShareTripContactCell

- (CarShareTripContactCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v121.receiver = self;
  v121.super_class = (Class)CarShareTripContactCell;
  v4 = [(CarShareTripContactCell *)&v121 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(CarShareTripContactCell *)v4 setAccessibilityIdentifier:@"CarShareTripContactCell"];
    id v6 = objc_alloc((Class)UIImageView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v10 = [v6 initWithFrame:CGRectMake(0, 0, width, height)];
    contactImageView = v5->_contactImageView;
    v5->_contactImageView = v10;

    [(UIImageView *)v5->_contactImageView setAccessibilityIdentifier:@"ContactImageView"];
    [(UIImageView *)v5->_contactImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    v12 = [(CarShareTripContactCell *)v5 contentView];
    [v12 addSubview:v5->_contactImageView];

    v13 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    contactNameLabel = v5->_contactNameLabel;
    v5->_contactNameLabel = v13;

    [(UILabel *)v5->_contactNameLabel setAccessibilityIdentifier:@"ContactNameLabel"];
    [(UILabel *)v5->_contactNameLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v15 = +[UIFont boldSystemFontOfSize:17.0];
    [(UILabel *)v5->_contactNameLabel setFont:v15];

    [(UILabel *)v5->_contactNameLabel setMinimumScaleFactor:0.764705882];
    [(UILabel *)v5->_contactNameLabel setAdjustsFontSizeToFitWidth:1];
    v16 = objc_alloc_init(SharedTripCapabilityBadgeView);
    capabilityBadgeView = v5->_capabilityBadgeView;
    v5->_capabilityBadgeView = v16;

    [(SharedTripCapabilityBadgeView *)v5->_capabilityBadgeView setTranslatesAutoresizingMaskIntoConstraints:0];
    v18 = [(CarShareTripContactCell *)v5 contentView];
    [v18 addSubview:v5->_capabilityBadgeView];

    v19 = -[CarSharingRingView initWithFrame:]([CarSharingRingView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    sharingRingView = v5->_sharingRingView;
    v5->_sharingRingView = v19;

    [(CarSharingRingView *)v5->_sharingRingView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CarSharingRingView *)v5->_sharingRingView setAnimationDelegate:v5];
    v21 = [(CarShareTripContactCell *)v5 contentView];
    [v21 insertSubview:v5->_sharingRingView aboveSubview:v5->_contactImageView];

    v22 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    subtitleLabel = v5->_subtitleLabel;
    v5->_subtitleLabel = v22;

    [(UILabel *)v5->_subtitleLabel setAccessibilityIdentifier:@"SubtitleLabel"];
    [(UILabel *)v5->_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v24 = +[UIFont systemFontOfSize:13.0];
    [(UILabel *)v5->_subtitleLabel setFont:v24];

    [(UILabel *)v5->_subtitleLabel setMinimumScaleFactor:0.769230769];
    [(UILabel *)v5->_subtitleLabel setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)v5->_subtitleLabel setHidden:1];
    [(CarShareTripContactCell *)v5 _updateAppearance];
    id v25 = objc_alloc((Class)UIStackView);
    v123[0] = v5->_contactNameLabel;
    v123[1] = v5->_subtitleLabel;
    v26 = +[NSArray arrayWithObjects:v123 count:2];
    id v27 = [v25 initWithArrangedSubviews:v26];

    [v27 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v27 setAlignment:0];
    [v27 setDistribution:2];
    [v27 setAxis:1];
    [v27 setSpacing:0.0];
    LODWORD(v28) = 1148846080;
    [v27 setContentHuggingPriority:1 forAxis:v28];
    LODWORD(v29) = 1148846080;
    [v27 setContentCompressionResistancePriority:1 forAxis:v29];
    v30 = [(CarShareTripContactCell *)v5 contentView];
    [v30 addSubview:v27];

    v31 = [(UIImageView *)v5->_contactImageView leadingAnchor];
    v119 = [(CarShareTripContactCell *)v5 contentView];
    [v119 leadingAnchor];
    v118 = v120 = v31;
    v117 = [v31 constraintEqualToAnchor:6.0];
    v122[0] = v117;
    v32 = [v27 leadingAnchor];
    v115 = [(UIImageView *)v5->_contactImageView trailingAnchor];
    v116 = v32;
    v114 = [v32 constraintEqualToAnchor:v115 constant:6.0];
    v122[1] = v114;
    v113 = [(CarShareTripContactCell *)v5 contentView];
    v33 = [v113 trailingAnchor];
    v111 = [v27 trailingAnchor];
    v112 = v33;
    v110 = [v33 constraintEqualToAnchor:v111 constant:6.0];
    v122[2] = v110;
    v34 = [(UIImageView *)v5->_contactImageView topAnchor];
    v108 = [(CarShareTripContactCell *)v5 contentView];
    [v108 topAnchor];
    v107 = v109 = v34;
    v106 = [v34 constraintGreaterThanOrEqualToAnchor:6.0];
    v122[3] = v106;
    v35 = [(UIImageView *)v5->_contactImageView centerYAnchor];
    v104 = [(CarShareTripContactCell *)v5 contentView];
    [v104 centerYAnchor];
    v103 = v105 = v35;
    v102 = [v35 constraintEqualToAnchor:];
    v122[4] = v102;
    v36 = [v27 topAnchor];
    v100 = [(CarShareTripContactCell *)v5 contentView];
    [v100 topAnchor];
    v99 = v101 = v36;
    v98 = [v36 constraintGreaterThanOrEqualToAnchor:6.0];
    v122[5] = v98;
    v37 = [v27 centerYAnchor];
    v96 = [(UIImageView *)v5->_contactImageView centerYAnchor];
    v97 = v37;
    v95 = [v37 constraintEqualToAnchor:v96];
    v122[6] = v95;
    v94 = [(CarShareTripContactCell *)v5 contentView];
    v38 = [v94 bottomAnchor];
    v92 = [(UIImageView *)v5->_contactImageView bottomAnchor];
    v93 = v38;
    v91 = [v38 constraintGreaterThanOrEqualToAnchor:v92 constant:6.0];
    v122[7] = v91;
    v90 = [(CarShareTripContactCell *)v5 contentView];
    v39 = [v90 bottomAnchor];
    v88 = [v27 bottomAnchor];
    v89 = v39;
    v87 = [v39 constraintGreaterThanOrEqualToAnchor:v88 constant:6.0];
    v122[8] = v87;
    v40 = [(UIImageView *)v5->_contactImageView widthAnchor];
    v85 = [(UIImageView *)v5->_contactImageView heightAnchor];
    v86 = v40;
    v84 = [v40 constraintEqualToAnchor:v85];
    v122[9] = v84;
    v83 = [(UIImageView *)v5->_contactImageView widthAnchor];
    v82 = [v83 constraintEqualToConstant:34.0];
    v122[10] = v82;
    v41 = [(SharedTripCapabilityBadgeView *)v5->_capabilityBadgeView trailingAnchor];
    v80 = [(UIImageView *)v5->_contactImageView trailingAnchor];
    v81 = v41;
    v79 = [v41 constraintEqualToAnchor:v80 constant:2.0];
    v122[11] = v79;
    v42 = [(SharedTripCapabilityBadgeView *)v5->_capabilityBadgeView bottomAnchor];
    v77 = [(UIImageView *)v5->_contactImageView bottomAnchor];
    v78 = v42;
    v76 = [v42 constraintEqualToAnchor:v77 constant:2.0];
    v122[12] = v76;
    v43 = [(CarSharingRingView *)v5->_sharingRingView centerXAnchor];
    v74 = [(UIImageView *)v5->_contactImageView centerXAnchor];
    v75 = v43;
    v73 = [v43 constraintEqualToAnchor:v74];
    v122[13] = v73;
    v44 = [(CarSharingRingView *)v5->_sharingRingView centerYAnchor];
    v71 = [(UIImageView *)v5->_contactImageView centerYAnchor];
    v72 = v44;
    v70 = [v44 constraintEqualToAnchor:v71];
    v122[14] = v70;
    v45 = [(CarSharingRingView *)v5->_sharingRingView widthAnchor];
    v68 = [(UIImageView *)v5->_contactImageView widthAnchor];
    v69 = v45;
    v67 = [v45 constraintEqualToAnchor:v68 constant:4.0];
    v122[15] = v67;
    v46 = [(CarSharingRingView *)v5->_sharingRingView heightAnchor];
    v47 = [(UIImageView *)v5->_contactImageView heightAnchor];
    v66 = v46;
    v48 = [v46 constraintEqualToAnchor:v47 constant:4.0];
    v122[16] = v48;
    v49 = [(CarShareTripContactCell *)v5 contentView];
    v50 = [v49 heightAnchor];
    v51 = [(UILabel *)v5->_contactNameLabel font];
    [v51 lineHeight];
    double v53 = v52;
    v54 = [(UILabel *)v5->_subtitleLabel font];
    [v54 lineHeight];
    double v56 = v53 + v55;
    if (v56 <= 34.0)
    {
      double v60 = 46.0;
    }
    else
    {
      v65 = [(UILabel *)v5->_contactNameLabel font];
      [v65 lineHeight];
      double v58 = v57;
      v64 = [(UILabel *)v5->_subtitleLabel font];
      [v64 lineHeight];
      double v60 = v58 + v59 + 12.0;
    }
    v61 = [v50 constraintGreaterThanOrEqualToConstant:v60];
    v122[17] = v61;
    v62 = +[NSArray arrayWithObjects:v122 count:18];
    +[NSLayoutConstraint activateConstraints:v62];

    if (v56 > 34.0)
    {
    }
  }
  return v5;
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)CarShareTripContactCell;
  [(CarShareTripContactCell *)&v5 prepareForReuse];
  [(CarShareTripContactCell *)self _setSharingState:0 animated:0];
  [(CarShareTripContactCell *)self _setContactIdentifier:0];
  [(UILabel *)self->_contactNameLabel setText:0];
  [(UILabel *)self->_subtitleLabel setText:0];
  self->_showsSubtitleWhenNotSharing = 0;
  contactValue = self->_contactValue;
  self->_contactValue = 0;

  serviceName = self->_serviceName;
  self->_serviceName = 0;

  self->_capabilityType = 0;
  [(CarShareTripContactCell *)self setSharingHandle:0];
}

- (void)_updateSharingRingAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(CarShareTripContactCell *)self sharingState];
  if (v5 - 2 < 2)
  {
    sharingRingView = self->_sharingRingView;
    uint64_t v7 = 1;
LABEL_6:
    [(CarSharingRingView *)sharingRingView setFilled:v7];
    return;
  }
  if (v5 != 1)
  {
    if (v5) {
      return;
    }
    sharingRingView = self->_sharingRingView;
    uint64_t v7 = 0;
    goto LABEL_6;
  }
  v8 = self->_sharingRingView;

  [(CarSharingRingView *)v8 setFilled:1 animated:v3];
}

- (void)_updateAppearance
{
  if (([(CarShareTripContactCell *)self isFocused] & 1) != 0
    || ([(CarShareTripContactCell *)self isSelected] & 1) != 0
    || ([(CarShareTripContactCell *)self isHighlighted] & 1) != 0)
  {
    BOOL v3 = +[UIColor _carSystemFocusLabelColor];
    uint64_t v4 = 1;
  }
  else
  {
    BOOL v3 = +[UIColor labelColor];
    uint64_t v4 = 0;
  }
  [(UILabel *)self->_contactNameLabel setTextColor:v3];

  unint64_t v5 = [(CarShareTripContactCell *)self _sharingLabelColor:v4];
  [(UILabel *)self->_subtitleLabel setTextColor:v5];

  self->_monogrammerStyle = v4;
  [(CarShareTripContactCell *)self _redrawContactImage];
  id v9 = +[UITraitCollection _currentTraitCollection];
  id v6 = [(CarShareTripContactCell *)self traitCollection];
  +[UITraitCollection _setCurrentTraitCollection:v6];

  id v7 = [(CarShareTripContactCell *)self _sharingRingColor:v4];
  id v8 = [v7 CGColor];

  +[UITraitCollection _setCurrentTraitCollection:v9];
  [(CarSharingRingView *)self->_sharingRingView setColor:v8];
}

- (void)_updateSubtitleLabel
{
  BOOL v3 = [(CarShareTripContactCell *)self _subtitleString];
  [(UILabel *)self->_subtitleLabel setText:v3];

  uint64_t v4 = [(UILabel *)self->_subtitleLabel text];
  [(UILabel *)self->_subtitleLabel setHidden:v4 == 0];

  if (self->_capabilityType == 2) {
    uint64_t v5 = 5;
  }
  else {
    uint64_t v5 = 4;
  }
  subtitleLabel = self->_subtitleLabel;

  [(UILabel *)subtitleLabel setLineBreakMode:v5];
}

- (id)_subtitleString
{
  unint64_t sharingState = self->_sharingState;
  if (sharingState < 2)
  {
    if (self->_capabilityType == 2)
    {
      serviceName = self->_serviceName;
      if (serviceName)
      {
        id v7 = serviceName;
        goto LABEL_15;
      }
    }
    if (self->_showsSubtitleWhenNotSharing)
    {
      BOOL v3 = +[NSBundle mainBundle];
      uint64_t v4 = v3;
      CFStringRef v5 = @"[Shared Trip] Start Sharing";
      goto LABEL_14;
    }
LABEL_10:
    id v7 = 0;
    goto LABEL_15;
  }
  if (sharingState == 2)
  {
    id v8 = +[CarDisplayController sharedInstance];
    unsigned int v9 = [v8 supportsTouchInteractionModel];

    BOOL v3 = +[NSBundle mainBundle];
    uint64_t v4 = v3;
    if (v9) {
      CFStringRef v5 = @"CarPlay_SharedTrip_AlreadySharing";
    }
    else {
      CFStringRef v5 = @"CarPlay_SharedTrip_AlreadySharing_NoTouchInput";
    }
    goto LABEL_14;
  }
  if (sharingState != 3) {
    goto LABEL_10;
  }
  BOOL v3 = +[NSBundle mainBundle];
  uint64_t v4 = v3;
  CFStringRef v5 = @"CarPlay_SharedTrip_JustStartedSharing";
LABEL_14:
  id v7 = [v3 localizedStringForKey:v5 value:@"localized string not found" table:0];

LABEL_15:

  return v7;
}

- (void)_setContactIdentifier:(id)a3
{
  id v5 = a3;
  contactIdentifier = self->_contactIdentifier;
  unint64_t v10 = (unint64_t)v5;
  id v7 = contactIdentifier;
  id v8 = (void *)v10;
  if (v10 | (unint64_t)v7)
  {
    unsigned __int8 v9 = [(id)v10 isEqual:v7];

    id v8 = (void *)v10;
    if ((v9 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_contactIdentifier, a3);
      [(CarShareTripContactCell *)self _redrawContactImage];
      id v8 = (void *)v10;
    }
  }
}

- (void)_redrawContactImage
{
  BOOL v3 = +[AddressBookManager sharedManager];
  uint64_t v4 = [v3 contactForCNContactIdentifier:self->_contactIdentifier];

  if (v4)
  {
    id v5 = self->_contactIdentifier;
    monogrammerStyle = (void *)self->_monogrammerStyle;
    objc_initWeak(&location, self);
    id v7 = +[MapsUIImageCache sharedCache];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10097C510;
    v10[3] = &unk_101312218;
    objc_copyWeak(v12, &location);
    id v8 = v5;
    v11 = v8;
    v12[1] = monogrammerStyle;
    [v7 getImageForContact:v4 style:monogrammerStyle tintColor:0 size:v10 completion:34.0];

    objc_destroyWeak(v12);
    objc_destroyWeak(&location);
  }
  else
  {
    unsigned __int8 v9 = +[UIImage imageNamed:@"SharedTrip"];
    [(CarShareTripContactCell *)self setContactImage:v9];
  }
}

- (id)_sharingLabelColor:(BOOL)a3
{
  if (a3)
  {
    BOOL v3 = +[UIColor _carSystemFocusLabelColor];
    goto LABEL_8;
  }
  BOOL v3 = [(CarShareTripContactCell *)self sharingState];
  if ((unint64_t)(v3 - 1) < 3) {
    goto LABEL_4;
  }
  if (!v3)
  {
    unint64_t capabilityType = self->_capabilityType;
    if (capabilityType == 2)
    {
      BOOL v3 = +[UIColor externalSystemGreenColor];
    }
    else
    {
      if (self->_showsSubtitleWhenNotSharing || capabilityType > 1)
      {
LABEL_4:
        BOOL v3 = +[UIColor _carSystemFocusColor];
        goto LABEL_8;
      }
      BOOL v3 = +[UIColor secondaryLabelColor];
    }
  }
LABEL_8:

  return v3;
}

- (id)_sharingRingColor:(BOOL)a3
{
  if (a3) {
    +[UIColor labelColor];
  }
  else {
  BOOL v3 = +[UIColor _carSystemFocusColor];
  }

  return v3;
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CarShareTripContactCell;
  [(CarShareTripContactCell *)&v5 setHighlighted:a3 animated:a4];
  [(CarShareTripContactCell *)self _updateAppearance];
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CarShareTripContactCell;
  [(CarShareTripContactCell *)&v5 setSelected:a3 animated:a4];
  [(CarShareTripContactCell *)self _updateAppearance];
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CarShareTripContactCell;
  [(CarShareTripContactCell *)&v10 didUpdateFocusInContext:v6 withAnimationCoordinator:a4];
  id v7 = [v6 nextFocusedItem];
  if (v7 == self)
  {

LABEL_5:
    [(CarShareTripContactCell *)self _updateAppearance];
    goto LABEL_6;
  }
  id v8 = v7;
  unsigned __int8 v9 = [v6 previouslyFocusedItem];

  if (v9 == self) {
    goto LABEL_5;
  }
LABEL_6:
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CarShareTripContactCell;
  [(CarShareTripContactCell *)&v4 traitCollectionDidChange:a3];
  [(CarShareTripContactCell *)self _updateAppearance];
}

- (UIImage)contactImage
{
  return [(UIImageView *)self->_contactImageView image];
}

- (void)setContactImage:(id)a3
{
}

- (NSString)contactName
{
  return [(UILabel *)self->_contactNameLabel text];
}

- (void)setContactName:(id)a3
{
}

- (BOOL)isSharing
{
  return self->_sharingState != 0;
}

- (void)setSharingState:(unint64_t)a3
{
}

- (void)setSharingState:(unint64_t)a3 animated:(BOOL)a4
{
  if (self->_sharingState != a3) {
    -[CarShareTripContactCell _setSharingState:animated:](self, "_setSharingState:animated:");
  }
}

- (void)_setSharingState:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  self->_unint64_t sharingState = a3;
  [(CarShareTripContactCell *)self _updateSubtitleLabel];
  [(CarShareTripContactCell *)self _updateAppearance];

  [(CarShareTripContactCell *)self _updateSharingRingAnimated:v4];
}

- (void)setCapabilityType:(unint64_t)a3 serviceName:(id)a4
{
  id v12 = a4;
  if (self->_capabilityType != a3
    || (unint64_t v6 = self->_serviceName, v7 = (unint64_t)v12, v8 = v12, v7 | v6)
    && (unsigned __int8 v9 = [(id)v6 isEqual:v7],
        (id)v7,
        (id)v6,
        id v8 = v12,
        (v9 & 1) == 0))
  {
    self->_unint64_t capabilityType = a3;
    sub_100ACAE20();
    objc_super v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    serviceName = self->_serviceName;
    self->_serviceName = v10;

    [(SharedTripCapabilityBadgeView *)self->_capabilityBadgeView setCapabilityType:a3];
    [(CarShareTripContactCell *)self _updateSubtitleLabel];
    [(CarShareTripContactCell *)self _updateAppearance];
    id v8 = v12;
  }
}

- (void)setShowsSubtitleWhenNotSharing:(BOOL)a3
{
  if (self->_showsSubtitleWhenNotSharing != a3)
  {
    self->_showsSubtitleWhenNotSharing = a3;
    [(CarShareTripContactCell *)self _updateSubtitleLabel];
  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  if (a4)
  {
    id v5 = [(CarShareTripContactCell *)self delegate];
    [v5 carShareTripContactCellDidFinishRingAnimation:self];
  }
}

- (CarShareTripContactCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CarShareTripContactCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)sharingState
{
  return self->_sharingState;
}

- (BOOL)showsSubtitleWhenNotSharing
{
  return self->_showsSubtitleWhenNotSharing;
}

- (MSPSharedTripContact)contactValue
{
  return self->_contactValue;
}

- (void)setContactValue:(id)a3
{
}

- (NSString)sharingHandle
{
  return self->_sharingHandle;
}

- (void)setSharingHandle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingHandle, 0);
  objc_storeStrong((id *)&self->_contactValue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_capabilityBadgeView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_contactNameLabel, 0);
  objc_storeStrong((id *)&self->_sharingRingView, 0);

  objc_storeStrong((id *)&self->_contactImageView, 0);
}

- (id)_contactNameStringFromContact:(id)a3
{
  return [a3 displayName];
}

- (void)configureWithMSPSharedTripContact:(id)a3
{
  objc_storeStrong((id *)&self->_contactValue, a3);
  id v5 = a3;
  unint64_t v6 = [(CarShareTripContactCell *)self _contactNameStringFromContact:v5];
  [(CarShareTripContactCell *)self setContactName:v6];

  unint64_t v7 = [v5 stringValue];
  [(CarShareTripContactCell *)self setSharingHandle:v7];

  id v9 = [v5 contact];

  id v8 = [v9 identifier];
  [(CarShareTripContactCell *)self _setContactIdentifier:v8];
}

- (void)configureWithSharedTrip:(id)a3
{
  self->_unint64_t sharingState = 0;
  id v4 = a3;
  id v5 = [v4 carPlayListCellTitle];
  [(UILabel *)self->_contactNameLabel setText:v5];

  unint64_t v6 = [v4 carPlayListCellSubtitle];
  [(UILabel *)self->_subtitleLabel setText:v6];

  [(UILabel *)self->_subtitleLabel setHidden:0];
  [(CarShareTripContactCell *)self setSharingHandle:0];
  id v8 = [v4 senderInfo];

  unint64_t v7 = [v8 localContactIdentifier];
  [(CarShareTripContactCell *)self _setContactIdentifier:v7];
}

@end