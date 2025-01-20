@interface COSPairedDeviceListTableCell
- (BOOL)_shouldUseSpaceConstrainedLayout;
- (BOOL)canBeChecked;
- (BOOL)enabled;
- (BOOL)skipAnimatingFirstSyncProgress;
- (COSPairedDeviceListCheckmark)checkmark;
- (COSPairedDeviceListTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (COSWatchView)watchView;
- (NSLayoutConstraint)horizontalStackBottomConstraint;
- (NSLayoutConstraint)leadingSpaceConstraint;
- (PSSpecifier)cellSpecifier;
- (UIImageView)profileImageView;
- (UILabel)watchBehavior;
- (UILabel)watchMaterial;
- (UILabel)watchMessage;
- (UILabel)watchName;
- (UILabel)watchSize;
- (UILabel)watchSubtitle;
- (UIProgressView)progressView;
- (UIStackView)horizontalStack;
- (UIStackView)labelStack;
- (unint64_t)deviceState;
- (void)_addProgressBar;
- (void)_configureWatchMessage;
- (void)contentSizeCategoryDidChangeNotification:(id)a3;
- (void)dealloc;
- (void)dimCellUI:(BOOL)a3;
- (void)displaySoftwareUpdatePane;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setCellSpecifier:(id)a3;
- (void)setChecked:(BOOL)a3;
- (void)setCheckmark:(id)a3;
- (void)setDeviceState:(unint64_t)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setHorizontalStack:(id)a3;
- (void)setHorizontalStackBottomConstraint:(id)a3;
- (void)setLabelStack:(id)a3;
- (void)setLeadingSpaceConstraint:(id)a3;
- (void)setLoading:(BOOL)a3;
- (void)setProfileImageView:(id)a3;
- (void)setProgressView:(id)a3;
- (void)setSkipAnimatingFirstSyncProgress:(BOOL)a3;
- (void)setWatchBehavior:(id)a3;
- (void)setWatchMaterial:(id)a3;
- (void)setWatchMessage:(id)a3;
- (void)setWatchName:(id)a3;
- (void)setWatchSize:(id)a3;
- (void)setWatchSubtitle:(id)a3;
- (void)setWatchView:(id)a3;
- (void)updateActiveWatchForFaceChange;
- (void)updateCellLayout;
- (void)updateCellState:(unint64_t)a3 percentageComplete:(double)a4 migratingDevice:(id)a5;
@end

@implementation COSPairedDeviceListTableCell

- (COSPairedDeviceListTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v5 = a5;
  id v9 = a5;
  v121.receiver = self;
  v121.super_class = (Class)COSPairedDeviceListTableCell;
  v10 = [(COSPairedDeviceListTableCell *)&v121 initWithStyle:a3 reuseIdentifier:a4 specifier:v9];
  if (v10)
  {
    uint64_t v11 = objc_opt_new();
    horizontalStack = v10->_horizontalStack;
    v10->_horizontalStack = (UIStackView *)v11;

    [(UIStackView *)v10->_horizontalStack setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v10->_horizontalStack setAlignment:3];
    v13 = [(COSPairedDeviceListTableCell *)v10 contentView];
    [v13 addSubview:v10->_horizontalStack];

    v14 = objc_opt_new();
    v15 = [(UIStackView *)v10->_horizontalStack leadingAnchor];
    v16 = [(COSPairedDeviceListTableCell *)v10 contentView];
    [v16 leadingAnchor];
    v17 = id v118 = v5;
    uint64_t v18 = [v15 constraintEqualToAnchor:v17 constant:18.0];
    leadingSpaceConstraint = v10->_leadingSpaceConstraint;
    v10->_leadingSpaceConstraint = (NSLayoutConstraint *)v18;

    LODWORD(v20) = 1148829696;
    [(NSLayoutConstraint *)v10->_leadingSpaceConstraint setPriority:v20];
    [v14 addObject:v10->_leadingSpaceConstraint];
    v21 = [(UIStackView *)v10->_horizontalStack trailingAnchor];
    v22 = [(COSPairedDeviceListTableCell *)v10 contentView];
    v23 = [v22 trailingAnchor];
    v24 = [v21 constraintEqualToAnchor:v23];
    [v14 addObject:v24];

    v25 = [(UIStackView *)v10->_horizontalStack topAnchor];
    v26 = [(COSPairedDeviceListTableCell *)v10 contentView];
    v27 = [v26 topAnchor];
    v28 = [v25 constraintEqualToAnchor:v27];
    v120 = v14;
    [v14 addObject:v28];

    v29 = [(COSPairedDeviceListTableCell *)v10 contentView];
    v30 = [v29 bottomAnchor];
    v31 = [(UIStackView *)v10->_horizontalStack bottomAnchor];
    uint64_t v32 = [v30 constraintEqualToAnchor:v31];
    horizontalStackBottomConstraint = v10->_horizontalStackBottomConstraint;
    v10->_horizontalStackBottomConstraint = (NSLayoutConstraint *)v32;

    [v14 addObject:v10->_horizontalStackBottomConstraint];
    v34 = objc_alloc_init(COSPairedDeviceListCheckmark);
    checkmark = v10->_checkmark;
    v10->_checkmark = v34;

    LODWORD(v36) = 1148764160;
    [(COSPairedDeviceListCheckmark *)v10->_checkmark setContentHuggingPriority:0 forAxis:v36];
    LODWORD(v37) = 1148829696;
    [(COSPairedDeviceListCheckmark *)v10->_checkmark setContentCompressionResistancePriority:0 forAxis:v37];
    [(UIStackView *)v10->_horizontalStack addArrangedSubview:v10->_checkmark];
    v38 = [[COSWatchView alloc] initWithStyle:7];
    watchView = v10->_watchView;
    v10->_watchView = v38;

    LODWORD(v40) = 1148682240;
    [(COSWatchView *)v10->_watchView setContentHuggingPriority:0 forAxis:v40];
    LODWORD(v41) = 1148829696;
    [(COSWatchView *)v10->_watchView setContentCompressionResistancePriority:0 forAxis:v41];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v10, (CFNotificationCallback)sub_1000D2018, @"com.apple.screenshotter.watchface-changed", 0, (CFNotificationSuspensionBehavior)0);
    +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
    v43 = id v119 = v9;
    v44 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
    v45 = [v44 _fontScaledByScaleFactor:0.933333333];

    uint64_t v46 = objc_opt_new();
    labelStack = v10->_labelStack;
    v10->_labelStack = (UIStackView *)v46;

    [(UIStackView *)v10->_labelStack setAxis:1];
    [(UIStackView *)v10->_labelStack setBaselineRelativeArrangement:1];
    [(UIStackView *)v10->_horizontalStack addArrangedSubview:v10->_labelStack];
    v48 = (UILabel *)objc_alloc_init((Class)UILabel);
    watchName = v10->_watchName;
    v10->_watchName = v48;

    [(UILabel *)v10->_watchName setNumberOfLines:2];
    [(UILabel *)v10->_watchName setFont:v43];
    v50 = v10->_watchName;
    v51 = BPSTextColor();
    [(UILabel *)v50 setTextColor:v51];

    LODWORD(v52) = 1045220557;
    [(UILabel *)v10->_watchName _setHyphenationFactor:v52];
    [(UILabel *)v10->_watchName setAdjustsFontForContentSizeCategory:1];
    [(UIStackView *)v10->_labelStack addArrangedSubview:v10->_watchName];
    v53 = (UILabel *)objc_alloc_init((Class)UILabel);
    watchSubtitle = v10->_watchSubtitle;
    v10->_watchSubtitle = v53;

    [(UILabel *)v10->_watchSubtitle setFont:v45];
    [(UILabel *)v10->_watchSubtitle setNumberOfLines:0];
    v55 = v10->_watchSubtitle;
    v56 = BPSTextColor();
    [(UILabel *)v55 setTextColor:v56];

    LODWORD(v57) = 1045220557;
    [(UILabel *)v10->_watchSubtitle _setHyphenationFactor:v57];
    [(UILabel *)v10->_watchSubtitle setLineBreakMode:0];
    [(UIStackView *)v10->_labelStack addArrangedSubview:v10->_watchSubtitle];
    [(UILabel *)v10->_watchSubtitle setHidden:1];
    id v58 = v45;
    v59 = (UILabel *)objc_alloc_init((Class)UILabel);
    [(UILabel *)v59 setFont:v58];

    [(UILabel *)v59 setNumberOfLines:0];
    v60 = +[UIColor systemMidGrayColor];
    [(UILabel *)v59 setTextColor:v60];

    LODWORD(v61) = 1045220557;
    [(UILabel *)v59 _setHyphenationFactor:v61];
    [(UILabel *)v59 setLineBreakMode:0];
    watchMaterial = v10->_watchMaterial;
    v10->_watchMaterial = v59;

    [(UIStackView *)v10->_labelStack addArrangedSubview:v10->_watchMaterial];
    id v63 = v58;
    v64 = (UILabel *)objc_alloc_init((Class)UILabel);
    [(UILabel *)v64 setFont:v63];

    [(UILabel *)v64 setNumberOfLines:0];
    v65 = +[UIColor systemMidGrayColor];
    [(UILabel *)v64 setTextColor:v65];

    LODWORD(v66) = 1045220557;
    [(UILabel *)v64 _setHyphenationFactor:v66];
    [(UILabel *)v64 setLineBreakMode:0];
    watchBehavior = v10->_watchBehavior;
    v10->_watchBehavior = v64;

    [(UIStackView *)v10->_labelStack addArrangedSubview:v10->_watchBehavior];
    id v117 = v63;
    v68 = (UILabel *)objc_alloc_init((Class)UILabel);
    [(UILabel *)v68 setFont:v117];

    [(UILabel *)v68 setNumberOfLines:0];
    v69 = +[UIColor systemMidGrayColor];
    [(UILabel *)v68 setTextColor:v69];

    LODWORD(v70) = 1045220557;
    [(UILabel *)v68 _setHyphenationFactor:v70];
    [(UILabel *)v68 setLineBreakMode:0];
    watchSize = v10->_watchSize;
    v10->_watchSize = v68;

    [(UIStackView *)v10->_labelStack addArrangedSubview:v10->_watchSize];
    id v116 = v43;
    v72 = (UILabel *)objc_alloc_init((Class)UILabel);
    [(UILabel *)v72 setFont:v116];

    [(UILabel *)v72 setNumberOfLines:0];
    v73 = +[UIColor systemMidGrayColor];
    [(UILabel *)v72 setTextColor:v73];

    LODWORD(v74) = 1045220557;
    [(UILabel *)v72 _setHyphenationFactor:v74];
    [(UILabel *)v72 setLineBreakMode:0];
    watchMessage = v10->_watchMessage;
    v10->_watchMessage = v72;

    v76 = v10->_watchMessage;
    v77 = +[UIColor systemRedColor];
    [(UILabel *)v76 setTextColor:v77];

    [(UILabel *)v10->_watchMessage _setHyphenationFactor:0.0];
    [(UIProgressView *)v10->_progressView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v10->_labelStack addArrangedSubview:v10->_watchMessage];
    +[NSLayoutConstraint activateConstraints:v14];
    [(COSPairedDeviceListTableCell *)v10 updateCellLayout];
    v78 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    profileImageView = v10->_profileImageView;
    v10->_profileImageView = v78;

    v80 = [(UIImageView *)v10->_profileImageView layer];
    double v81 = BPSTinkerSupportProfilePictureDiameter;
    [v80 setCornerRadius:BPSTinkerSupportProfilePictureDiameter * 0.5];

    v82 = [(UIImageView *)v10->_profileImageView layer];
    v83 = +[UIColor blackColor];
    [v82 setBorderColor:[v83 cgColor]];

    v84 = [(UIImageView *)v10->_profileImageView layer];
    [v84 setBorderWidth:2.0];

    v85 = [(UIImageView *)v10->_profileImageView layer];
    v86 = +[UIColor blackColor];
    [v85 setShadowColor:[v86 cgColor]];

    v87 = [(UIImageView *)v10->_profileImageView layer];
    [v87 setShadowOffset:CGSizeZero.width, CGSizeZero.height];

    v88 = [(UIImageView *)v10->_profileImageView layer];
    [v88 setShadowRadius:4.0];

    v89 = [(UIImageView *)v10->_profileImageView layer];
    LODWORD(v90) = 0.5;
    [v89 setShadowOpacity:v90];

    v91 = v10->_profileImageView;
    v92 = +[UIColor blackColor];
    [(UIImageView *)v91 setBackgroundColor:v92];

    [(UIImageView *)v10->_profileImageView setContentMode:2];
    v93 = [(COSPairedDeviceListTableCell *)v10 contentView];
    [v93 addSubview:v10->_profileImageView];

    [(UIImageView *)v10->_profileImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    v115 = [(UIImageView *)v10->_profileImageView bottomAnchor];
    v114 = [(COSWatchView *)v10->_watchView bottomAnchor];
    v113 = [v115 constraintEqualToAnchor:v114 constant:6.0];
    v122[0] = v113;
    v112 = [(UIImageView *)v10->_profileImageView rightAnchor];
    v111 = [(COSWatchView *)v10->_watchView rightAnchor];
    v110 = [v112 constraintEqualToAnchor:v111 constant:6.0];
    v122[1] = v110;
    v94 = [(UIImageView *)v10->_profileImageView heightAnchor];
    v95 = [v94 constraintEqualToConstant:v81];
    v122[2] = v95;
    v96 = [(UIImageView *)v10->_profileImageView widthAnchor];
    v97 = [v96 constraintEqualToConstant:v81];
    v122[3] = v97;
    v98 = [(UILabel *)v10->_watchMessage trailingAnchor];
    v99 = [(COSPairedDeviceListTableCell *)v10 trailingAnchor];
    v100 = [v98 constraintEqualToAnchor:v99 constant:-14.0];
    v122[4] = v100;
    v101 = +[NSArray arrayWithObjects:v122 count:5];
    +[NSLayoutConstraint activateConstraints:v101];

    id v5 = v118;
    id v9 = v119;

    [(UIImageView *)v10->_profileImageView setHidden:1];
    v102 = +[NSNotificationCenter defaultCenter];
    [v102 addObserver:v10 selector:"contentSizeCategoryDidChangeNotification:" name:UIContentSizeCategoryDidChangeNotification object:0];
  }
  v103 = [v9 propertyForKey:@"COSPairedDeviceListTableCellEnabled"];
  v10->_enabled = [v103 BOOLValue];

  objc_storeStrong((id *)&v10->_cellSpecifier, v5);
  v104 = [v9 propertyForKey:@"COSMigrationManager"];
  v105 = [v9 propertyForKey:@"COSAssociatedDevice"];
  if ([v104 currentState] == (id)2
    && [v104 isDeviceMigrating:v105]
    && v10->_deviceState != 6)
  {
    [(COSPairedDeviceListTableCell *)v10 _addProgressBar];
    progressView = v10->_progressView;
    v107 = [v104 currentSession];
    [v107 sessionProgress];
    *(float *)&double v108 = v108;
    [(UIProgressView *)progressView setProgress:0 animated:v108];
  }
  return v10;
}

- (void)_addProgressBar
{
  [(UILabel *)self->_watchMessage setHidden:1];
  v3 = (UIProgressView *)[objc_alloc((Class)UIProgressView) initWithProgressViewStyle:1];
  progressView = self->_progressView;
  self->_progressView = v3;

  id v5 = objc_alloc_init((Class)UILabel);
  v6 = +[NSBundle mainBundle];
  v7 = [v6 localizedStringForKey:@"SYNCING_YOUR_DATA" value:&stru_100249230 table:@"Pairing"];
  [v5 setText:v7];

  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  v8 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
  [v5 setFont:v8];

  [v5 setAdjustsFontForContentSizeCategory:1];
  id v9 = BPSTextColor();
  [v5 setTextColor:v9];

  [(UIProgressView *)self->_progressView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIProgressView *)self->_progressView addSubview:v5];
  v10 = [(COSPairedDeviceListTableCell *)self contentView];
  [v10 addSubview:self->_progressView];

  v29 = [v5 topAnchor];
  v28 = [(UIProgressView *)self->_progressView bottomAnchor];
  v27 = [v29 constraintEqualToAnchor:v28 constant:6.0];
  v30[0] = v27;
  v26 = [v5 leadingAnchor];
  v25 = [(UIProgressView *)self->_progressView leadingAnchor];
  v24 = [v26 constraintEqualToAnchor:v25];
  v30[1] = v24;
  v23 = [v5 trailingAnchor];
  v22 = [(UIProgressView *)self->_progressView trailingAnchor];
  v21 = [v23 constraintEqualToAnchor:v22];
  v30[2] = v21;
  double v20 = [(UIProgressView *)self->_progressView topAnchor];
  uint64_t v11 = [(UIStackView *)self->_labelStack bottomAnchor];
  v12 = [v20 constraintEqualToAnchor:v11 constant:6.0];
  v30[3] = v12;
  v13 = [(UIProgressView *)self->_progressView leadingAnchor];
  v14 = [(UIStackView *)self->_labelStack leadingAnchor];
  v15 = [v13 constraintEqualToAnchor:v14];
  v30[4] = v15;
  v16 = [(UIProgressView *)self->_progressView trailingAnchor];
  v17 = [(COSPairedDeviceListTableCell *)self trailingAnchor];
  uint64_t v18 = [v16 constraintEqualToAnchor:v17 constant:-14.0];
  v30[5] = v18;
  v19 = +[NSArray arrayWithObjects:v30 count:6];
  +[NSLayoutConstraint activateConstraints:v19];
}

- (void)contentSizeCategoryDidChangeNotification:(id)a3
{
  [(COSPairedDeviceListTableCell *)self layoutSubviews];

  [(COSPairedDeviceListTableCell *)self updateCellLayout];
}

- (BOOL)_shouldUseSpaceConstrainedLayout
{
  v2 = +[UIScreen mainScreen];
  [v2 bounds];
  if (v3 <= 320.0 && ([v2 scale], v4 >= 3.0)) {
    id v5 = (id *)&UIContentSizeCategoryExtraLarge;
  }
  else {
    id v5 = (id *)&UIContentSizeCategoryAccessibilityMedium;
  }
  id v6 = *v5;
  v7 = [UIApp preferredContentSizeCategory];
  BOOL v8 = _UIContentSizeCategoryCompareToContentSizeCategory() != 1;

  return v8;
}

- (void)updateCellLayout
{
  p_labelStack = &self->_labelStack;
  if (self->_labelStack)
  {
    p_horizontalStack = &self->_horizontalStack;
    if (self->_horizontalStack)
    {
      id v28 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
      [(UILabel *)self->_watchMessage setFont:v28];
      id v5 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
      id v6 = [v5 _fontScaledByScaleFactor:0.933333333];

      [(UILabel *)self->_watchMaterial setFont:v6];
      [(UILabel *)self->_watchBehavior setFont:v6];
      [(UILabel *)self->_watchSize setFont:v6];
      [v6 _bodyLeading];
      -[UIStackView setSpacing:](*p_labelStack, "setSpacing:");
      v7 = *p_labelStack;
      [v28 _scaledValueForValue:23.0];
      -[UIStackView setCustomSpacing:afterView:](v7, "setCustomSpacing:afterView:", self->_watchSubtitle);
      unsigned __int8 v8 = [(UILabel *)self->_watchSubtitle isHidden];
      id v9 = *p_labelStack;
      if (v8) {
        [v28 _scaledValueForValue:23.0];
      }
      else {
        [(UIStackView *)*p_labelStack spacing];
      }
      -[UIStackView setCustomSpacing:afterView:](v9, "setCustomSpacing:afterView:", self->_watchName);
      if (([(UILabel *)self->_watchMessage isHidden] & 1) == 0)
      {
        v10 = *p_labelStack;
        [v28 _scaledValueForValue:23.0];
        -[UIStackView setCustomSpacing:afterView:](v10, "setCustomSpacing:afterView:", self->_watchSize);
      }
      unsigned int v11 = [(COSPairedDeviceListTableCell *)self _shouldUseSpaceConstrainedLayout];
      if (v11) {
        v12 = (id *)p_labelStack;
      }
      else {
        v12 = (id *)p_horizontalStack;
      }
      id v13 = *v12;
      id v14 = [(COSWatchView *)self->_watchView superview];

      if (v14 != v13)
      {
        [(UIStackView *)*p_horizontalStack setSpacing:14.0];
        [(COSWatchView *)self->_watchView removeFromSuperview];
        [v13 insertArrangedSubview:self->_watchView atIndex:0];
        v15 = _NSDictionaryOfVariableBindings(@"_watchView", self->_watchView, 0);
        v16 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|-(>=WATCH_NAME_TO_MATERIAL_VERTICAL_SPACING)-[_watchView]-(>=WATCH_NAME_TO_MATERIAL_VERTICAL_SPACING)-|", 0, &off_10025C488, v15);
        +[NSLayoutConstraint activateConstraints:v16];

        [(COSPairedDeviceListCheckmark *)self->_checkmark removeFromSuperview];
        if (v11)
        {
          v17 = [(COSPairedDeviceListTableCell *)self contentView];
          [v17 addSubview:self->_checkmark];

          uint64_t v18 = _NSDictionaryOfVariableBindings(@"_checkmark, _horizontalStack", self->_checkmark, *p_horizontalStack, 0);
          v19 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-[_checkmark]-[_horizontalStack]", 0, 0, v18);
          +[NSLayoutConstraint activateConstraints:v19];

          double v20 = [(COSPairedDeviceListCheckmark *)self->_checkmark centerYAnchor];
          v21 = [(COSWatchView *)self->_watchView centerYAnchor];
          v22 = [v20 constraintEqualToAnchor:v21];
          [v22 setActive:1];

          double v23 = 16.0;
        }
        else
        {
          [(UIStackView *)*p_horizontalStack insertArrangedSubview:self->_checkmark atIndex:0];
          [(UIStackView *)*p_horizontalStack setCustomSpacing:self->_watchView afterView:24.0];
          double v23 = 0.0;
        }
        [(NSLayoutConstraint *)self->_horizontalStackBottomConstraint setConstant:v23];
      }
      v24 = [(PSSpecifier *)self->_cellSpecifier propertyForKey:@"COSMigrationManager"];
      v25 = [(PSSpecifier *)self->_cellSpecifier propertyForKey:@"COSAssociatedDevice"];
      v26 = [v25 valueForProperty:NRDevicePropertyIsAltAccount];
      unsigned __int8 v27 = [v26 BOOLValue];

      if ([v24 isDeviceWaitingToMigrate:v25] && (v27 & 1) == 0) {
        [(COSPairedDeviceListTableCell *)self dimCellUI:1];
      }
      [(COSPairedDeviceListTableCell *)self setEnabled:self->_enabled];
    }
  }
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.screenshotter.watchface-changed", 0);
  v4.receiver = self;
  v4.super_class = (Class)COSPairedDeviceListTableCell;
  [(COSPairedDeviceListTableCell *)&v4 dealloc];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)COSPairedDeviceListTableCell;
  [(COSPairedDeviceListTableCell *)&v4 layoutSubviews];
  double v3 = [(COSPairedDeviceListTableCell *)self textLabel];
  [v3 setHidden:1];

  [(NSLayoutConstraint *)self->_leadingSpaceConstraint setConstant:16.0];
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  v90.receiver = self;
  v90.super_class = (Class)COSPairedDeviceListTableCell;
  [(COSPairedDeviceListTableCell *)&v90 refreshCellContentsWithSpecifier:v4];
  id v5 = [v4 propertyForKey:@"COSAssociatedDevice"];
  [(COSWatchView *)self->_watchView setAssociatedDevice:v5];
  id v6 = [v4 propertyForKey:@"COSDeviceState"];
  self->_unint64_t deviceState = (unint64_t)[v6 integerValue];

  uint64_t v7 = [v5 valueForProperty:NRDevicePropertyProductType];
  unsigned __int8 v8 = [v5 valueForProperty:NRDevicePropertyArtworkTraits];
  int v9 = MGGetBoolAnswer();
  v10 = pbb_bridge_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  v84 = v5;
  id v85 = v4;
  v82 = v8;
  if (v9 && v8)
  {
    if (v11)
    {
      *(_DWORD *)buf = 136315138;
      v94 = "-[COSPairedDeviceListTableCell refreshCellContentsWithSpecifier:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s using NRDevicePropertyArtworkTraits to get PBBDeviceSize", buf, 0xCu);
    }

    v12 = [v8 objectForKeyedSubscript:@"ArtworkDeviceSubType"];
    [v12 unsignedIntegerValue];

    uint64_t v13 = BPSVariantSizeForArtworkDeviceSubType();
  }
  else
  {
    if (v11)
    {
      *(_DWORD *)buf = 136315138;
      v94 = "-[COSPairedDeviceListTableCell refreshCellContentsWithSpecifier:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s using NRDevicePropertyProductType to get PBBDeviceSize", buf, 0xCu);
    }

    uint64_t v13 = BPSVariantSizeForProductType();
  }
  uint64_t v79 = v13;
  v92[0] = @"COMPACT_VARIANT_ACTIVE_DEVICE";
  v92[1] = @"REGULAR_VARIANT_ACTIVE_DEVICE";
  v92[2] = @"394H_VARIANT_ACTIVE_DEVICE";
  v92[3] = @"448H_VARIANT_ACTIVE_DEVICE";
  v92[4] = @"430H_VARIANT_ACTIVE_DEVICE";
  v92[5] = @"484H_VARIANT_ACTIVE_DEVICE";
  v92[6] = @"502H_VARIANT_ACTIVE_DEVICE";
  id v14 = +[NSBundle mainBundle];
  v15 = [v14 localizedStringForKey:@"446H_VARIANT_ACTIVE_DEVICE" value:&stru_100249230 table:@"Pairing-N218"];
  v92[7] = v15;
  v16 = +[NSBundle mainBundle];
  v17 = [v16 localizedStringForKey:@"496H_VARIANT_ACTIVE_DEVICE" value:&stru_100249230 table:@"Pairing-N218"];
  v92[8] = v17;
  uint64_t v18 = +[NSArray arrayWithObjects:v92 count:9];
  v19 = +[BPSScreenStringObj screenStringsWithArray:v18];
  v83 = (void *)v7;
  uint64_t v20 = BPSGetRelevantScreenStringForProduct();

  v21 = (void *)v20;
  v22 = +[NSBundle mainBundle];
  double v23 = [v22 localizedStringForKey:v20 value:&stru_100249230 table:@"Pairing"];

  v24 = v5;
  id v25 = +[PBBridgeWatchAttributeController materialFromDevice:v5];
  v26 = BPSUnlocalizedNameForMaterial();
  uint64_t v27 = [v26 stringByAppendingString:@"_ACTIVE_DEVICE"];

  id v28 = +[NSBundle mainBundle];
  v78 = (void *)v27;
  uint64_t v29 = [v28 localizedStringForKey:v27 value:&stru_100249230 table:@"Pairing"];

  [(COSWatchView *)self->_watchView overrideMaterial:v25 size:v79];
  if (self->_deviceState == 1) {
    [(COSWatchView *)self->_watchView setAlpha:1.0];
  }
  v30 = [v5 valueForProperty:NRDevicePropertyDeviceBrand];
  v31 = v85;
  if ([v30 integerValue])
  {
    watchBehavior = self->_watchBehavior;
    [v30 intValue];
    v33 = BPSLocalizedShortEdition();
    [(UILabel *)watchBehavior setText:v33];
  }
  watchName = self->_watchName;
  v35 = [UIApp cachedNameForDevice:v84];
  [(UILabel *)watchName setText:v35];

  double v81 = (void *)v29;
  [(UILabel *)self->_watchMaterial setText:v29];
  [(UILabel *)self->_watchSize setText:v23];
  [(COSPairedDeviceListTableCell *)self _configureWatchMessage];
  [(UILabel *)self->_watchSubtitle setHidden:1];
  [(UIImageView *)self->_profileImageView setHidden:1];
  uint64_t v80 = NRDevicePropertyIsAltAccount;
  double v36 = [v84 valueForProperty:];
  LODWORD(v35) = [v36 BOOLValue];

  if (v35)
  {
    v77 = v23;
    double v37 = [v84 valueForProperty:@"_altAccountIdentifier"];
    v38 = +[BPSTinkerSupport sharedInstance];
    v39 = [v38 cachedFamilyCircle];

    v75 = v39;
    v76 = v30;
    if (v37 && v39)
    {
      long long v88 = 0u;
      long long v89 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      double v40 = [v39 members];
      id v41 = [v40 countByEnumeratingWithState:&v86 objects:v91 count:16];
      if (v41)
      {
        id v42 = v41;
        double v74 = (void *)v20;
        uint64_t v43 = *(void *)v87;
LABEL_18:
        uint64_t v44 = 0;
        while (1)
        {
          if (*(void *)v87 != v43) {
            objc_enumerationMutation(v40);
          }
          v45 = *(void **)(*((void *)&v86 + 1) + 8 * v44);
          uint64_t v46 = [v45 appleID];
          unsigned __int8 v47 = [v37 isEqualToString:v46];

          if (v47) {
            break;
          }
          if (v42 == (id)++v44)
          {
            id v42 = [v40 countByEnumeratingWithState:&v86 objects:v91 count:16];
            if (v42) {
              goto LABEL_18;
            }
            v24 = v84;
            v31 = v85;
            v21 = v74;
            goto LABEL_39;
          }
        }
        id v51 = v45;

        v24 = v84;
        v31 = v85;
        v21 = v74;
        if (!v51) {
          goto LABEL_40;
        }
        double v52 = pbb_bridge_log();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v94 = "-[COSPairedDeviceListTableCell refreshCellContentsWithSpecifier:]";
          _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "%s: tinker device found family member", buf, 0xCu);
        }

        [(UILabel *)self->_watchSubtitle setHidden:0];
        v53 = [v51 appleID];
        v54 = [v53 stringByReplacingOccurrencesOfString:@"@" withString:@"​@"];

        [(UILabel *)self->_watchSubtitle setText:v54];
        v55 = +[BPSTinkerSupport sharedInstance];
        v56 = [v55 cachedProfilePictureForFamilyMember:v51];

        double v57 = pbb_bridge_log();
        id v58 = v57;
        if (v56)
        {
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v94 = "-[COSPairedDeviceListTableCell refreshCellContentsWithSpecifier:]";
            _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "%s: tinker device found profile picture", buf, 0xCu);
          }

          [(UIImageView *)self->_profileImageView setHidden:0];
          [(UIImageView *)self->_profileImageView setImage:v56];
        }
        else
        {
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v94 = "-[COSPairedDeviceListTableCell refreshCellContentsWithSpecifier:]";
            _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "%s: tinker device, but did not find profile picture", buf, 0xCu);
          }
        }
        goto LABEL_44;
      }
LABEL_39:

LABEL_40:
      v54 = pbb_bridge_log();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v94 = "-[COSPairedDeviceListTableCell refreshCellContentsWithSpecifier:]";
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "%s: tinker device, but no tinker family member found!", buf, 0xCu);
      }
      id v51 = 0;
LABEL_44:

      v59 = [(UILabel *)self->_watchMessage text];

      if (v59)
      {
        [(UIStackView *)self->_labelStack spacing];
        double v61 = v60;
        [(UIStackView *)self->_labelStack spacing];
        -[UIStackView setLayoutMargins:](self->_labelStack, "setLayoutMargins:", v61, 0.0, v62, 0.0);
        [(UIStackView *)self->_labelStack setLayoutMarginsRelativeArrangement:1];
      }

      v30 = v76;
      double v23 = v77;
      goto LABEL_47;
    }
    v48 = pbb_bridge_log();
    v49 = v39;
    double v40 = v48;
    if (v49)
    {
      if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR) || !os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_39;
      }
      *(_DWORD *)buf = 136315138;
      v94 = "-[COSPairedDeviceListTableCell refreshCellContentsWithSpecifier:]";
      v50 = "%s: tinker device, but no alt account identifier found!";
    }
    else
    {
      if (!os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_39;
      }
      *(_DWORD *)buf = 136315138;
      v94 = "-[COSPairedDeviceListTableCell refreshCellContentsWithSpecifier:]";
      v50 = "%s: tinker device, but family circle is not loaded yet, waiting...";
    }
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, v50, buf, 0xCu);
    goto LABEL_39;
  }
LABEL_47:
  [(COSPairedDeviceListTableCell *)self updateCellLayout];
  id v63 = [v31 identifier];
  unsigned int v64 = [v63 isEqualToString:@"LOADING_WATCH_ITEM"];

  if (v64)
  {
    [(COSPairedDeviceListTableCell *)self setLoading:1];
  }
  else
  {
    [(COSPairedDeviceListTableCell *)self setLoading:0];
    v65 = [v24 valueForProperty:v80];
    unsigned int v66 = [v65 BOOLValue];

    v67 = -[COSTinkerHealthSharingSetupDelegate tinkerDevice]_0();
    unsigned int v68 = [v24 isEqual:v67];

    unint64_t deviceState = self->_deviceState;
    if (v66 && v68 && deviceState == 1)
    {
      double v70 = [v31 propertyForKey:@"COSPairedDeviceListTableCellEnabled"];
      self->_enabled = [v70 BOOLValue];

      checkmark = self->_checkmark;
      uint64_t v72 = 1;
    }
    else if (deviceState <= 7 && ((1 << deviceState) & 0xCA) != 0)
    {
      v73 = [v31 propertyForKey:@"COSPairedDeviceListTableCellEnabled"];
      self->_enabled = [v73 BOOLValue];

      checkmark = self->_checkmark;
      uint64_t v72 = self->PSTableCell_opaque[OBJC_IVAR___PSTableCell__checked];
    }
    else
    {
      checkmark = self->_checkmark;
      uint64_t v72 = 0;
    }
    [(COSPairedDeviceListCheckmark *)checkmark setChecked:v72];
  }
}

- (void)_configureWatchMessage
{
  double v3 = [(PSSpecifier *)self->_cellSpecifier propertyForKey:@"COSMigrationManager"];
  id v4 = [(PSSpecifier *)self->_cellSpecifier propertyForKey:@"COSAssociatedDevice"];
  [(UILabel *)self->_watchMessage setHidden:0];
  if ([v3 currentState] == (id)1 && objc_msgSend(v3, "isDeviceMigrating:", v4))
  {
    [(UILabel *)self->_watchMessage setAttributedText:0];
    watchMessage = self->_watchMessage;
    id v6 = BPSTextColor();
    [(UILabel *)watchMessage setTextColor:v6];

    uint64_t v7 = self->_watchMessage;
    id v8 = +[NSBundle mainBundle];
    id v9 = [v8 localizedStringForKey:@"MIGRATION_ESTABLISH_CONNECTION" value:&stru_100249230 table:@"Pairing"];
    [(UILabel *)v7 setText:v9];
LABEL_12:

    goto LABEL_13;
  }
  unint64_t deviceState = self->_deviceState;
  if (deviceState - 6 < 2)
  {
    NSAttributedStringKey v25 = NSUnderlineStyleAttributeName;
    v26 = &off_10025C280;
    id v8 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    unint64_t v15 = self->_deviceState;
    id v16 = objc_alloc((Class)NSAttributedString);
    v17 = +[NSBundle mainBundle];
    uint64_t v18 = v17;
    if (v15 == 6)
    {
      v19 = [v17 localizedStringForKey:@"UPDATE_REQUIRED" value:&stru_100249230 table:@"Pairing"];
      id v20 = [v16 initWithString:v19 attributes:v8];
      [(UILabel *)self->_watchMessage setAttributedText:v20];

      v21 = self->_watchMessage;
      +[UIColor systemRedColor];
    }
    else
    {
      v22 = [v17 localizedStringForKey:@"SOFTWARE_UPDATING" value:&stru_100249230 table:@"Pairing"];
      id v23 = [v16 initWithString:v22 attributes:v8];
      [(UILabel *)self->_watchMessage setAttributedText:v23];

      v21 = self->_watchMessage;
      BPSBridgeTintColor();
    v24 = };
    [(UILabel *)v21 setTextColor:v24];

    id v9 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"displaySoftwareUpdatePane"];
    [v9 setNumberOfTapsRequired:1];
    [(UILabel *)self->_watchMessage addGestureRecognizer:v9];
    [(UILabel *)self->_watchMessage setUserInteractionEnabled:1];
    goto LABEL_12;
  }
  if (deviceState - 4 <= 1)
  {
    id v11 = objc_alloc((Class)NSMutableAttributedString);
    v12 = +[NSBundle mainBundle];
    uint64_t v13 = [v12 localizedStringForKey:@"REQUIRES_MIGRATION" value:&stru_100249230 table:@"Pairing"];
    id v8 = [v11 initWithString:v13];

    [(UILabel *)self->_watchMessage setAttributedText:v8];
    id v14 = self->_watchMessage;
    id v9 = +[UIColor systemRedColor];
    [(UILabel *)v14 setTextColor:v9];
    goto LABEL_12;
  }
  [(UILabel *)self->_watchMessage setHidden:1];
LABEL_13:
}

- (void)displaySoftwareUpdatePane
{
  v2 = (id *)&self->PSTableCell_opaque[OBJC_IVAR___PSTableCell__specifier];
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [WeakRetained propertyForKey:@"COSDisplaySoftwareUpdate"];

  id v4 = objc_loadWeakRetained(v2);
  v5[2](v5, v4);
}

- (void)dimCellUI:(BOOL)a3
{
  BOOL v4 = !a3;
  [(UILabel *)self->_watchName setEnabled:v4];
  [(UILabel *)self->_watchSubtitle setEnabled:v4];
  [(COSWatchView *)self->_watchView setUserInteractionEnabled:v4];
  [(UILabel *)self->_watchBehavior setEnabled:v4];
  [(UILabel *)self->_watchSize setEnabled:v4];
  watchMaterial = self->_watchMaterial;

  [(UILabel *)watchMaterial setEnabled:v4];
}

- (void)updateActiveWatchForFaceChange
{
}

- (void)setChecked:(BOOL)a3
{
  self->PSTableCell_opaque[OBJC_IVAR___PSTableCell__checked] = a3;
  -[COSPairedDeviceListCheckmark setChecked:](self->_checkmark, "setChecked:");
}

- (void)setLoading:(BOOL)a3
{
}

- (BOOL)canBeChecked
{
  return 1;
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)COSPairedDeviceListTableCell;
  [(COSPairedDeviceListTableCell *)&v7 setHighlighted:a3 animated:a4];
  if (v4) {
    BPSDevicePickerCellHighlightColor();
  }
  else {
  id v6 = BPSDevicePickerCellBackgroundColor();
  }
  [(COSPairedDeviceListTableCell *)self setBackgroundColor:v6];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)COSPairedDeviceListTableCell;
  [(COSPairedDeviceListTableCell *)&v3 prepareForReuse];
  [(COSPairedDeviceListTableCell *)self dimCellUI:0];
}

- (void)updateCellState:(unint64_t)a3 percentageComplete:(double)a4 migratingDevice:(id)a5
{
  id v12 = a5;
  if (a3 != 2 || (double v8 = 1.0, a4 == 1.0) || (self->_deviceState & 0xFFFFFFFFFFFFFFFELL) == 6)
  {
    double v9 = 1.0;
    if (a4 == 1.0)
    {
      LODWORD(v9) = 1.0;
      [(UIProgressView *)self->_progressView setProgress:1 animated:v9];
    }
    v10 = [(COSPairedDeviceListTableCell *)self progressView];
    [v10 setHidden:1];

    if (!a3) {
      [(COSPairedDeviceListTableCell *)self _configureWatchMessage];
    }
  }
  else
  {
    progressView = self->_progressView;
    if (!progressView)
    {
      [(COSPairedDeviceListTableCell *)self _addProgressBar];
      progressView = self->_progressView;
    }
    *(float *)&double v8 = a4;
    [(UIProgressView *)progressView setProgress:1 animated:v8];
  }
  if (self->_cellSpecifier) {
    -[COSPairedDeviceListTableCell refreshCellContentsWithSpecifier:](self, "refreshCellContentsWithSpecifier:");
  }
}

- (UIStackView)horizontalStack
{
  return self->_horizontalStack;
}

- (void)setHorizontalStack:(id)a3
{
}

- (UIStackView)labelStack
{
  return self->_labelStack;
}

- (void)setLabelStack:(id)a3
{
}

- (NSLayoutConstraint)leadingSpaceConstraint
{
  return self->_leadingSpaceConstraint;
}

- (void)setLeadingSpaceConstraint:(id)a3
{
}

- (NSLayoutConstraint)horizontalStackBottomConstraint
{
  return self->_horizontalStackBottomConstraint;
}

- (void)setHorizontalStackBottomConstraint:(id)a3
{
}

- (COSWatchView)watchView
{
  return self->_watchView;
}

- (void)setWatchView:(id)a3
{
}

- (UIImageView)profileImageView
{
  return self->_profileImageView;
}

- (void)setProfileImageView:(id)a3
{
}

- (UILabel)watchName
{
  return self->_watchName;
}

- (void)setWatchName:(id)a3
{
}

- (UILabel)watchSubtitle
{
  return self->_watchSubtitle;
}

- (void)setWatchSubtitle:(id)a3
{
}

- (UILabel)watchBehavior
{
  return self->_watchBehavior;
}

- (void)setWatchBehavior:(id)a3
{
}

- (UILabel)watchMaterial
{
  return self->_watchMaterial;
}

- (void)setWatchMaterial:(id)a3
{
}

- (UILabel)watchSize
{
  return self->_watchSize;
}

- (void)setWatchSize:(id)a3
{
}

- (UILabel)watchMessage
{
  return self->_watchMessage;
}

- (void)setWatchMessage:(id)a3
{
}

- (COSPairedDeviceListCheckmark)checkmark
{
  return self->_checkmark;
}

- (void)setCheckmark:(id)a3
{
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)skipAnimatingFirstSyncProgress
{
  return self->_skipAnimatingFirstSyncProgress;
}

- (void)setSkipAnimatingFirstSyncProgress:(BOOL)a3
{
  self->_skipAnimatingFirstSyncProgress = a3;
}

- (unint64_t)deviceState
{
  return self->_deviceState;
}

- (void)setDeviceState:(unint64_t)a3
{
  self->_unint64_t deviceState = a3;
}

- (UIProgressView)progressView
{
  return self->_progressView;
}

- (void)setProgressView:(id)a3
{
}

- (PSSpecifier)cellSpecifier
{
  return self->_cellSpecifier;
}

- (void)setCellSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellSpecifier, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_checkmark, 0);
  objc_storeStrong((id *)&self->_watchMessage, 0);
  objc_storeStrong((id *)&self->_watchSize, 0);
  objc_storeStrong((id *)&self->_watchMaterial, 0);
  objc_storeStrong((id *)&self->_watchBehavior, 0);
  objc_storeStrong((id *)&self->_watchSubtitle, 0);
  objc_storeStrong((id *)&self->_watchName, 0);
  objc_storeStrong((id *)&self->_profileImageView, 0);
  objc_storeStrong((id *)&self->_watchView, 0);
  objc_storeStrong((id *)&self->_horizontalStackBottomConstraint, 0);
  objc_storeStrong((id *)&self->_leadingSpaceConstraint, 0);
  objc_storeStrong((id *)&self->_labelStack, 0);

  objc_storeStrong((id *)&self->_horizontalStack, 0);
}

@end