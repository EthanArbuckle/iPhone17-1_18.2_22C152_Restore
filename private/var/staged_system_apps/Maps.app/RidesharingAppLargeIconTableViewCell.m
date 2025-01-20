@interface RidesharingAppLargeIconTableViewCell
- (NSLayoutConstraint)majorLabelBaselineToTopConstraint;
- (NSLayoutConstraint)majorLabelToBottomConstraint;
- (NSLayoutConstraint)minorLabelBaselineToMajorLabelBaselineConstraint;
- (NSLayoutConstraint)minorLabelToBottomConsttraint;
- (NSLayoutConstraint)ratingsLabelBaselineToMinorLabelBaselineConstraint;
- (NSLayoutConstraint)ratingsLabelToBottomConstraint;
- (NSLayoutConstraint)textToActionButtonConstraint;
- (NSLayoutConstraint)textToActivityIndicatorConstraint;
- (NSString)applicationIdentifer;
- (NSURL)lastRequestedImageURL;
- (RidesharingAppLargeIconTableViewCell)initWithFrame:(CGRect)a3;
- (RidesharingAppLargeIconTableViewCellDelegate)delegate;
- (UIActivityIndicatorView)activityIndicatorView;
- (UIButton)actionButton;
- (UIImageView)iconImageView;
- (UILabel)majorLabel;
- (UILabel)minorLabel;
- (UILabel)ratingLabel;
- (UILayoutGuide)textLayoutGuide;
- (void)_actionButtonPressed:(id)a3;
- (void)_clearContent;
- (void)_setupConstraints;
- (void)_setupViews;
- (void)_updateContentSizeCategoryDependentFontsAndConstraints;
- (void)_updateViewsAndConstraintsForShowingDisabledApp:(BOOL)a3;
- (void)_updateViewsAndConstraintsForShowingErrorWithRideBookingRideOptionStatus:(id)a3;
- (void)_updateViewsAndConstraintsForShowingLoadingStateOfDisabledApp;
- (void)_updateViewsAndConstraintsForShowingLoadingStateOfEnabledApp;
- (void)_updateViewsAndConstraintsForShowingSuggestedApp;
- (void)configureForErrorMessageWithRideBookingRideOptionStatus:(id)a3;
- (void)configureForLoadingStateWithDisabledRideBookingApplication:(id)a3;
- (void)configureForLoadingStateWithEnabledRideBookingApplication:(id)a3;
- (void)configureWithDisabledRideBookingApplication:(id)a3 showActionButton:(BOOL)a4;
- (void)configureWithSuggestedApp:(id)a3;
- (void)dealloc;
- (void)prepareForReuse;
- (void)setActionButton:(id)a3;
- (void)setActivityIndicatorView:(id)a3;
- (void)setApplicationIdentifer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIconImageView:(id)a3;
- (void)setLastRequestedImageURL:(id)a3;
- (void)setMajorLabel:(id)a3;
- (void)setMajorLabelBaselineToTopConstraint:(id)a3;
- (void)setMajorLabelToBottomConstraint:(id)a3;
- (void)setMinorLabel:(id)a3;
- (void)setMinorLabelBaselineToMajorLabelBaselineConstraint:(id)a3;
- (void)setMinorLabelToBottomConsttraint:(id)a3;
- (void)setRatingLabel:(id)a3;
- (void)setRatingsLabelBaselineToMinorLabelBaselineConstraint:(id)a3;
- (void)setRatingsLabelToBottomConstraint:(id)a3;
- (void)setTextLayoutGuide:(id)a3;
- (void)setTextToActionButtonConstraint:(id)a3;
- (void)setTextToActivityIndicatorConstraint:(id)a3;
- (void)updateTheme;
@end

@implementation RidesharingAppLargeIconTableViewCell

- (RidesharingAppLargeIconTableViewCell)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)RidesharingAppLargeIconTableViewCell;
  v3 = -[MapsThemeCollectionViewCell initWithFrame:](&v9, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(RidesharingAppLargeIconTableViewCell *)v3 _setupViews];
    [(RidesharingAppLargeIconTableViewCell *)v4 _setupConstraints];
    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v4 selector:"_updateContentSizeCategoryDependentFontsAndConstraints" name:UIContentSizeCategoryDidChangeNotification object:0];

    [(RidesharingAppLargeIconTableViewCell *)v4 _updateContentSizeCategoryDependentFontsAndConstraints];
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    [(RidesharingAppLargeIconTableViewCell *)v4 setAccessibilityIdentifier:v7];
  }
  return v4;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)RidesharingAppLargeIconTableViewCell;
  [(RidesharingAppLargeIconTableViewCell *)&v4 dealloc];
}

- (void)_setupViews
{
  id v3 = objc_alloc((Class)UILabel);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v7 = [v3 initWithFrame:CGRectMake(0, y, width, height)];
  majorLabel = self->_majorLabel;
  self->_majorLabel = v7;

  [(UILabel *)self->_majorLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_majorLabel setNumberOfLines:0];
  LODWORD(v9) = 1148829696;
  [(UILabel *)self->_majorLabel setContentCompressionResistancePriority:1 forAxis:v9];
  [(UILabel *)self->_majorLabel setAccessibilityIdentifier:@"Title"];
  v10 = [(RidesharingAppLargeIconTableViewCell *)self contentView];
  [v10 addSubview:self->_majorLabel];

  v11 = +[UIColor labelColor];
  [(UILabel *)self->_majorLabel setTextColor:v11];

  v12 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  minorLabel = self->_minorLabel;
  self->_minorLabel = v12;

  [(UILabel *)self->_minorLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_minorLabel setNumberOfLines:0];
  LODWORD(v14) = 1148829696;
  [(UILabel *)self->_minorLabel setContentCompressionResistancePriority:1 forAxis:v14];
  [(UILabel *)self->_minorLabel setAccessibilityIdentifier:@"Subtitle"];
  v15 = [(RidesharingAppLargeIconTableViewCell *)self contentView];
  [v15 addSubview:self->_minorLabel];

  v16 = +[UIColor secondaryLabelColor];
  [(UILabel *)self->_minorLabel setTextColor:v16];

  v17 = +[UIButton buttonWithType:1];
  actionButton = self->_actionButton;
  self->_actionButton = v17;

  [(UIButton *)self->_actionButton setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v19) = 1148829696;
  [(UIButton *)self->_actionButton setContentCompressionResistancePriority:0 forAxis:v19];
  LODWORD(v20) = 1148829696;
  [(UIButton *)self->_actionButton setContentHuggingPriority:0 forAxis:v20];
  v21 = self->_actionButton;
  v22 = +[NSBundle mainBundle];
  v23 = [v22 localizedStringForKey:@"View" value:@"localized string not found" table:0];
  [(UIButton *)v21 setTitle:v23 forState:0];

  [(UIButton *)self->_actionButton addTarget:self action:"_actionButtonPressed:" forControlEvents:64];
  [(UIButton *)self->_actionButton setAccessibilityIdentifier:@"ActionButton"];
  v24 = [(RidesharingAppLargeIconTableViewCell *)self contentView];
  [v24 addSubview:self->_actionButton];

  v25 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
  activityIndicatorView = self->_activityIndicatorView;
  self->_activityIndicatorView = v25;

  [(UIActivityIndicatorView *)self->_activityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIActivityIndicatorView *)self->_activityIndicatorView setHidesWhenStopped:1];
  [(UIActivityIndicatorView *)self->_activityIndicatorView setAccessibilityIdentifier:@"RideSharingActivityIndicator"];
  v27 = [(RidesharingAppLargeIconTableViewCell *)self contentView];
  [v27 addSubview:self->_activityIndicatorView];

  v28 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  ratingLabel = self->_ratingLabel;
  self->_ratingLabel = v28;

  [(UILabel *)self->_ratingLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_ratingLabel setNumberOfLines:0];
  [(UILabel *)self->_ratingLabel setLineBreakMode:0];
  LODWORD(v30) = 1148829696;
  [(UILabel *)self->_ratingLabel setContentCompressionResistancePriority:1 forAxis:v30];
  [(UILabel *)self->_ratingLabel setAccessibilityIdentifier:@"Ratings"];
  v31 = [(RidesharingAppLargeIconTableViewCell *)self contentView];
  [v31 addSubview:self->_ratingLabel];

  v32 = [objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, y, width, height];
  iconImageView = self->_iconImageView;
  self->_iconImageView = v32;

  [(UIImageView *)self->_iconImageView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIImageView *)self->_iconImageView setAccessibilityIdentifier:@"Icon"];
  v34 = [(RidesharingAppLargeIconTableViewCell *)self contentView];
  [v34 addSubview:self->_iconImageView];

  v35 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  textLayoutGuide = self->_textLayoutGuide;
  self->_textLayoutGuide = v35;

  v37 = [(RidesharingAppLargeIconTableViewCell *)self contentView];
  [v37 addLayoutGuide:self->_textLayoutGuide];

  [(RidesharingAppLargeIconTableViewCell *)self updateTheme];
}

- (void)updateTheme
{
  v13.receiver = self;
  v13.super_class = (Class)RidesharingAppLargeIconTableViewCell;
  [(MapsThemeCollectionViewCell *)&v13 updateTheme];
  actionButton = self->_actionButton;
  objc_super v4 = [(RidesharingAppLargeIconTableViewCell *)self theme];
  v5 = [v4 keyColor];
  [(UIButton *)actionButton setTitleColor:v5 forState:0];

  v6 = self->_actionButton;
  v7 = [(RidesharingAppLargeIconTableViewCell *)self theme];
  v8 = [v7 darkKeyColor];
  [(UIButton *)v6 setTitleColor:v8 forState:1];

  double v9 = [(UILabel *)self->_ratingLabel attributedText];
  id v10 = [v9 mutableCopy];

  v11 = +[UIColor secondaryLabelColor];
  [v10 addAttribute:NSForegroundColorAttributeName value:v11 range:0, [v10 length]];

  [(UILabel *)self->_ratingLabel setAttributedText:v10];
  v12 = [(RidesharingAppLargeIconTableViewCell *)self theme];
  -[UIActivityIndicatorView setActivityIndicatorViewStyle:](self->_activityIndicatorView, "setActivityIndicatorViewStyle:", [v12 activityIndicatorStyle]);
}

- (void)_setupConstraints
{
  id v3 = [(RidesharingAppLargeIconTableViewCell *)self contentView];
  objc_super v4 = [v3 heightAnchor];
  +[RouteOverviewCell minimumRidesharingHeight];
  v149 = [v4 constraintEqualToConstant:];

  LODWORD(v5) = 1148813312;
  [v149 setPriority:v5];
  v6 = [(RidesharingAppLargeIconTableViewCell *)self majorLabel];
  v7 = [v6 firstBaselineAnchor];
  v8 = [(RidesharingAppLargeIconTableViewCell *)self contentView];
  double v9 = [v8 topAnchor];
  id v10 = [v7 constraintGreaterThanOrEqualToAnchor:v9];
  majorLabelBaselineToTopConstraint = self->_majorLabelBaselineToTopConstraint;
  self->_majorLabelBaselineToTopConstraint = v10;

  v12 = [(RidesharingAppLargeIconTableViewCell *)self minorLabel];
  objc_super v13 = [v12 firstBaselineAnchor];
  double v14 = [(RidesharingAppLargeIconTableViewCell *)self majorLabel];
  v15 = [v14 lastBaselineAnchor];
  v16 = [v13 constraintEqualToAnchor:v15];
  minorLabelBaselineToMajorLabelBaselineConstraint = self->_minorLabelBaselineToMajorLabelBaselineConstraint;
  self->_minorLabelBaselineToMajorLabelBaselineConstraint = v16;

  v18 = [(RidesharingAppLargeIconTableViewCell *)self ratingLabel];
  double v19 = [v18 firstBaselineAnchor];
  double v20 = [(RidesharingAppLargeIconTableViewCell *)self minorLabel];
  v21 = [v20 lastBaselineAnchor];
  v22 = [v19 constraintEqualToAnchor:v21];
  ratingsLabelBaselineToMinorLabelBaselineConstraint = self->_ratingsLabelBaselineToMinorLabelBaselineConstraint;
  self->_ratingsLabelBaselineToMinorLabelBaselineConstraint = v22;

  v24 = [(RidesharingAppLargeIconTableViewCell *)self ratingLabel];
  v25 = [v24 bottomAnchor];
  v26 = [(RidesharingAppLargeIconTableViewCell *)self textLayoutGuide];
  v27 = [v26 bottomAnchor];
  v28 = [v25 constraintEqualToAnchor:v27];
  ratingsLabelToBottomConstraint = self->_ratingsLabelToBottomConstraint;
  self->_ratingsLabelToBottomConstraint = v28;

  double v30 = [(RidesharingAppLargeIconTableViewCell *)self minorLabel];
  v31 = [v30 bottomAnchor];
  v32 = [(RidesharingAppLargeIconTableViewCell *)self textLayoutGuide];
  v33 = [v32 bottomAnchor];
  v34 = [v31 constraintEqualToAnchor:v33];
  minorLabelToBottomConsttraint = self->_minorLabelToBottomConsttraint;
  self->_minorLabelToBottomConsttraint = v34;

  v36 = [(RidesharingAppLargeIconTableViewCell *)self majorLabel];
  v37 = [v36 bottomAnchor];
  v38 = [(RidesharingAppLargeIconTableViewCell *)self textLayoutGuide];
  v39 = [v38 bottomAnchor];
  v40 = [v37 constraintEqualToAnchor:v39];
  majorLabelToBottomConstraint = self->_majorLabelToBottomConstraint;
  self->_majorLabelToBottomConstraint = v40;

  v42 = [(RidesharingAppLargeIconTableViewCell *)self actionButton];
  v43 = [v42 leadingAnchor];
  v44 = [(RidesharingAppLargeIconTableViewCell *)self textLayoutGuide];
  v45 = [v44 trailingAnchor];
  v46 = [v43 constraintEqualToAnchor:v45 constant:15.0];
  textToActionButtonConstraint = self->_textToActionButtonConstraint;
  self->_textToActionButtonConstraint = v46;

  v48 = [(RidesharingAppLargeIconTableViewCell *)self activityIndicatorView];
  v49 = [v48 leadingAnchor];
  v50 = [(RidesharingAppLargeIconTableViewCell *)self textLayoutGuide];
  v51 = [v50 trailingAnchor];
  v52 = [v49 constraintEqualToAnchor:v51 constant:25.0];
  textToActivityIndicatorConstraint = self->_textToActivityIndicatorConstraint;
  self->_textToActivityIndicatorConstraint = v52;

  id v148 = objc_alloc_init((Class)NSMutableArray);
  v147 = [(RidesharingAppLargeIconTableViewCell *)self textLayoutGuide];
  v145 = [v147 leadingAnchor];
  v146 = [(RidesharingAppLargeIconTableViewCell *)self ratingLabel];
  v144 = [v146 leadingAnchor];
  v143 = [v145 constraintEqualToAnchor:v144];
  v150[0] = v143;
  v142 = [(RidesharingAppLargeIconTableViewCell *)self iconImageView];
  v140 = [v142 leadingAnchor];
  v141 = [(RidesharingAppLargeIconTableViewCell *)self contentView];
  v138 = [v141 leadingAnchor];
  v137 = [v140 constraintEqualToAnchor:v138 constant:16.0];
  v150[1] = v137;
  v136 = [(RidesharingAppLargeIconTableViewCell *)self iconImageView];
  v135 = [v136 widthAnchor];
  v134 = [v135 constraintEqualToConstant:62.0];
  v150[2] = v134;
  v133 = [(RidesharingAppLargeIconTableViewCell *)self textLayoutGuide];
  v131 = [v133 leadingAnchor];
  v132 = [(RidesharingAppLargeIconTableViewCell *)self iconImageView];
  v130 = [v132 trailingAnchor];
  v129 = [v131 constraintEqualToAnchor:v130 constant:13.0];
  v150[3] = v129;
  v128 = [(RidesharingAppLargeIconTableViewCell *)self textLayoutGuide];
  v126 = [v128 leadingAnchor];
  v127 = [(RidesharingAppLargeIconTableViewCell *)self majorLabel];
  v125 = [v127 leadingAnchor];
  v124 = [v126 constraintEqualToAnchor:v125];
  v150[4] = v124;
  v123 = [(RidesharingAppLargeIconTableViewCell *)self textLayoutGuide];
  v121 = [v123 leadingAnchor];
  v122 = [(RidesharingAppLargeIconTableViewCell *)self minorLabel];
  v120 = [v122 leadingAnchor];
  v119 = [v121 constraintEqualToAnchor:v120];
  v150[5] = v119;
  v118 = [(RidesharingAppLargeIconTableViewCell *)self textLayoutGuide];
  v116 = [v118 trailingAnchor];
  v117 = [(RidesharingAppLargeIconTableViewCell *)self majorLabel];
  v115 = [v117 trailingAnchor];
  v114 = [v116 constraintEqualToAnchor:v115];
  v150[6] = v114;
  v113 = [(RidesharingAppLargeIconTableViewCell *)self textLayoutGuide];
  v111 = [v113 trailingAnchor];
  v112 = [(RidesharingAppLargeIconTableViewCell *)self minorLabel];
  v110 = [v112 trailingAnchor];
  v109 = [v111 constraintEqualToAnchor:v110];
  v150[7] = v109;
  v108 = [(RidesharingAppLargeIconTableViewCell *)self textLayoutGuide];
  v106 = [v108 trailingAnchor];
  v107 = [(RidesharingAppLargeIconTableViewCell *)self ratingLabel];
  v105 = [v107 trailingAnchor];
  v104 = [v106 constraintEqualToAnchor:v105];
  v150[8] = v104;
  v103 = [(RidesharingAppLargeIconTableViewCell *)self actionButton];
  v102 = [v103 widthAnchor];
  v101 = [v102 constraintGreaterThanOrEqualToConstant:47.0];
  v54 = self->_textToActionButtonConstraint;
  v150[9] = v101;
  v150[10] = v54;
  v100 = [(RidesharingAppLargeIconTableViewCell *)self actionButton];
  v98 = [v100 trailingAnchor];
  v99 = [(RidesharingAppLargeIconTableViewCell *)self contentView];
  v97 = [v99 trailingAnchor];
  v96 = [v98 constraintEqualToAnchor:v97 constant:-15.0];
  v150[11] = v96;
  v95 = [(RidesharingAppLargeIconTableViewCell *)self activityIndicatorView];
  v93 = [v95 trailingAnchor];
  v94 = [(RidesharingAppLargeIconTableViewCell *)self contentView];
  v92 = [v94 trailingAnchor];
  v91 = [v93 constraintEqualToAnchor:v92 constant:-37.0];
  v150[12] = v91;
  v150[13] = v149;
  v90 = [(RidesharingAppLargeIconTableViewCell *)self iconImageView];
  v88 = [v90 centerYAnchor];
  v89 = [(RidesharingAppLargeIconTableViewCell *)self contentView];
  v87 = [v89 centerYAnchor];
  v86 = [v88 constraintEqualToAnchor:v87];
  v150[14] = v86;
  v85 = [(RidesharingAppLargeIconTableViewCell *)self iconImageView];
  v83 = [v85 heightAnchor];
  v84 = [(RidesharingAppLargeIconTableViewCell *)self iconImageView];
  v82 = [v84 widthAnchor];
  v81 = [v83 constraintEqualToAnchor:v82];
  v150[15] = v81;
  v80 = [(RidesharingAppLargeIconTableViewCell *)self textLayoutGuide];
  v78 = [v80 centerYAnchor];
  v79 = [(RidesharingAppLargeIconTableViewCell *)self contentView];
  v77 = [v79 centerYAnchor];
  v76 = [v78 constraintEqualToAnchor:v77];
  v150[16] = v76;
  v75 = [(RidesharingAppLargeIconTableViewCell *)self majorLabel];
  v73 = [v75 topAnchor];
  v74 = [(RidesharingAppLargeIconTableViewCell *)self textLayoutGuide];
  v72 = [v74 topAnchor];
  v71 = [v73 constraintEqualToAnchor:v72];
  v55 = self->_majorLabelBaselineToTopConstraint;
  v56 = self->_minorLabelBaselineToMajorLabelBaselineConstraint;
  v57 = self->_ratingsLabelBaselineToMinorLabelBaselineConstraint;
  v150[17] = v71;
  v150[18] = v55;
  v150[19] = v56;
  v150[20] = v57;
  v150[21] = self->_ratingsLabelToBottomConstraint;
  v139 = [(RidesharingAppLargeIconTableViewCell *)self actionButton];
  v69 = [v139 centerYAnchor];
  v70 = [(RidesharingAppLargeIconTableViewCell *)self contentView];
  v68 = [v70 centerYAnchor];
  v58 = [v69 constraintEqualToAnchor:v68];
  v150[22] = v58;
  v59 = [(RidesharingAppLargeIconTableViewCell *)self activityIndicatorView];
  v60 = [v59 centerYAnchor];
  v61 = [(RidesharingAppLargeIconTableViewCell *)self contentView];
  v62 = [v61 centerYAnchor];
  v63 = [v60 constraintEqualToAnchor:v62];
  v150[23] = v63;
  v64 = [(RidesharingAppLargeIconTableViewCell *)self actionButton];
  v65 = [v64 heightAnchor];
  v66 = [v65 constraintGreaterThanOrEqualToConstant:26.0];
  v150[24] = v66;
  v67 = +[NSArray arrayWithObjects:v150 count:25];
  [v148 addObjectsFromArray:v67];

  +[NSLayoutConstraint activateConstraints:v148];
}

- (void)_updateContentSizeCategoryDependentFontsAndConstraints
{
  id v3 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleTitle3 addingSymbolicTraits:2];
  [(UILabel *)self->_majorLabel setFont:v3];

  objc_super v4 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleSubheadline addingSymbolicTraits:0];
  [(UILabel *)self->_minorLabel setFont:v4];

  double v5 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleCaption1 addingSymbolicTraits:0];
  [(UILabel *)self->_ratingLabel setFont:v5];

  v6 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleSubheadline addingSymbolicTraits:0];
  v7 = [(UIButton *)self->_actionButton titleLabel];
  [v7 setFont:v6];

  v8 = [(UILabel *)self->_majorLabel font];
  [v8 _mapkit_scaledValueForValue:37.0];
  UIRoundToViewScale();
  -[NSLayoutConstraint setConstant:](self->_majorLabelBaselineToTopConstraint, "setConstant:");

  double v9 = [(UILabel *)self->_minorLabel font];
  [v9 _mapkit_scaledValueForValue:21.0];
  UIRoundToViewScale();
  -[NSLayoutConstraint setConstant:](self->_minorLabelBaselineToMajorLabelBaselineConstraint, "setConstant:");

  id v10 = [(UILabel *)self->_ratingLabel font];
  [v10 _mapkit_scaledValueForValue:18.0];
  UIRoundToViewScale();
  -[NSLayoutConstraint setConstant:](self->_ratingsLabelBaselineToMinorLabelBaselineConstraint, "setConstant:");

  v11 = [(UIButton *)self->_actionButton titleLabel];
  v12 = [v11 font];
  [v12 _mapkit_scaledValueForValue:8.0];
  UIRoundToViewScale();
  double v14 = v13;

  v15 = [(UIButton *)self->_actionButton titleLabel];
  v16 = [v15 font];
  [v16 _mapkit_scaledValueForValue:8.0];
  UIRoundToViewScale();
  double v18 = v17;

  actionButton = self->_actionButton;

  -[UIButton setContentEdgeInsets:](actionButton, "setContentEdgeInsets:", v14, v18, v14, v18);
}

- (void)configureWithSuggestedApp:(id)a3
{
  id v4 = a3;
  [(RidesharingAppLargeIconTableViewCell *)self _clearContent];
  double v5 = [v4 iOSBundleIdentifier];
  applicationIdentifer = self->_applicationIdentifer;
  self->_applicationIdentifer = v5;

  v7 = [v4 displayName];
  [(UILabel *)self->_majorLabel setText:v7];

  [v4 ratingsValue];
  double v9 = v8;
  uint64_t v10 = (int)[v4 ratingsCount];
  ratingLabel = self->_ratingLabel;
  v12 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleCaption1 addingSymbolicTraits:0];
  double v13 = +[UIColor secondaryLabelColor];
  double v14 = [(RidesharingAppLargeIconTableViewCell *)self mk_theme];
  v15 = +[MKStarRatingAndLabelView ratingAndReviewsAsAttributedString:1 style:v12 font:v10 numberOfReviews:v13 textColor:v14 theme:v9];
  [(UILabel *)ratingLabel setAttributedText:v15];

  v16 = [v4 artworkURL];
  lastRequestedImageURL = self->_lastRequestedImageURL;
  self->_lastRequestedImageURL = v16;

  double v18 = +[MKAppImageManager sharedImageManager];
  double v19 = [v4 artworkURL];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1008D5F80;
  v20[3] = &unk_1012FFBA0;
  v20[4] = self;
  [v18 loadAppImageAtURL:v19 completionHandler:v20];

  [(RidesharingAppLargeIconTableViewCell *)self _updateViewsAndConstraintsForShowingSuggestedApp];
}

- (void)configureForErrorMessageWithRideBookingRideOptionStatus:(id)a3
{
  id v13 = a3;
  [(RidesharingAppLargeIconTableViewCell *)self _clearContent];
  id v4 = [v13 application];
  double v5 = [v4 identifier];
  applicationIdentifer = self->_applicationIdentifer;
  self->_applicationIdentifer = v5;

  v7 = [v13 application];
  uint64_t v8 = [v7 name];
  [(UILabel *)self->_majorLabel setText:v8];

  double v9 = [v13 errorMessage];
  [(UILabel *)self->_minorLabel setText:v9];

  uint64_t v10 = [v13 application];
  objc_opt_class();
  LOBYTE(v8) = objc_opt_isKindOfClass();

  if (v8)
  {
    v11 = [v13 application];
    v12 = [v11 iconWithFormat:2];
    [(UIImageView *)self->_iconImageView setImage:v12];
  }
  [(RidesharingAppLargeIconTableViewCell *)self _updateViewsAndConstraintsForShowingErrorWithRideBookingRideOptionStatus:v13];
}

- (void)configureForLoadingStateWithEnabledRideBookingApplication:(id)a3
{
  id v4 = a3;
  [(RidesharingAppLargeIconTableViewCell *)self _clearContent];
  double v5 = [v4 identifier];
  applicationIdentifer = self->_applicationIdentifer;
  self->_applicationIdentifer = v5;

  v7 = [v4 name];
  [(UILabel *)self->_majorLabel setText:v7];

  uint64_t v8 = +[NSBundle mainBundle];
  double v9 = [v8 localizedStringForKey:@"Checking for available rides..." value:@"localized string not found" table:0];
  [(UILabel *)self->_minorLabel setText:v9];

  uint64_t v10 = [v4 iconWithFormat:2];

  [(UIImageView *)self->_iconImageView setImage:v10];

  [(RidesharingAppLargeIconTableViewCell *)self _updateViewsAndConstraintsForShowingLoadingStateOfEnabledApp];
}

- (void)configureWithDisabledRideBookingApplication:(id)a3 showActionButton:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(RidesharingAppLargeIconTableViewCell *)self _clearContent];
  v7 = [v6 identifier];
  applicationIdentifer = self->_applicationIdentifer;
  self->_applicationIdentifer = v7;

  double v9 = [v6 name];
  [(UILabel *)self->_majorLabel setText:v9];

  uint64_t v10 = +[NSBundle mainBundle];
  v11 = [v10 localizedStringForKey:@"Installed [Ridesharing]" value:@"localized string not found" table:0];
  [(UILabel *)self->_minorLabel setText:v11];

  v12 = [v6 iconWithFormat:2];

  [(UIImageView *)self->_iconImageView setImage:v12];

  [(RidesharingAppLargeIconTableViewCell *)self _updateViewsAndConstraintsForShowingDisabledApp:v4];
}

- (void)configureForLoadingStateWithDisabledRideBookingApplication:(id)a3
{
  id v4 = a3;
  [(RidesharingAppLargeIconTableViewCell *)self _clearContent];
  double v5 = [v4 identifier];
  applicationIdentifer = self->_applicationIdentifer;
  self->_applicationIdentifer = v5;

  v7 = [v4 name];
  [(UILabel *)self->_majorLabel setText:v7];

  uint64_t v8 = [v4 iconWithFormat:2];

  [(UIImageView *)self->_iconImageView setImage:v8];

  [(RidesharingAppLargeIconTableViewCell *)self _updateViewsAndConstraintsForShowingLoadingStateOfDisabledApp];
}

- (void)_updateViewsAndConstraintsForShowingSuggestedApp
{
  [(UILabel *)self->_minorLabel setHidden:1];
  [(UILabel *)self->_ratingLabel setHidden:0];
  [(NSLayoutConstraint *)self->_ratingsLabelToBottomConstraint setActive:1];
  [(NSLayoutConstraint *)self->_minorLabelToBottomConsttraint setActive:0];
  [(NSLayoutConstraint *)self->_majorLabelToBottomConstraint setActive:0];
  [(UIButton *)self->_actionButton setHidden:0];
  [(UIActivityIndicatorView *)self->_activityIndicatorView stopAnimating];
  actionButton = self->_actionButton;
  id v4 = +[NSBundle mainBundle];
  double v5 = [v4 localizedStringForKey:@"View" value:@"localized string not found" table:0];
  [(UIButton *)actionButton setTitle:v5 forState:0];

  [(NSLayoutConstraint *)self->_textToActionButtonConstraint setActive:1];
  textToActivityIndicatorConstraint = self->_textToActivityIndicatorConstraint;

  [(NSLayoutConstraint *)textToActivityIndicatorConstraint setActive:0];
}

- (void)_updateViewsAndConstraintsForShowingLoadingStateOfEnabledApp
{
  [(UILabel *)self->_minorLabel setHidden:0];
  [(UILabel *)self->_ratingLabel setHidden:1];
  [(NSLayoutConstraint *)self->_ratingsLabelToBottomConstraint setActive:0];
  [(NSLayoutConstraint *)self->_minorLabelToBottomConsttraint setActive:1];
  [(NSLayoutConstraint *)self->_majorLabelToBottomConstraint setActive:0];
  [(UIButton *)self->_actionButton setHidden:1];
  [(UIActivityIndicatorView *)self->_activityIndicatorView startAnimating];
  [(NSLayoutConstraint *)self->_textToActionButtonConstraint setActive:0];
  textToActivityIndicatorConstraint = self->_textToActivityIndicatorConstraint;

  [(NSLayoutConstraint *)textToActivityIndicatorConstraint setActive:1];
}

- (void)_updateViewsAndConstraintsForShowingDisabledApp:(BOOL)a3
{
  BOOL v3 = a3;
  [(UILabel *)self->_minorLabel setHidden:0];
  [(UILabel *)self->_ratingLabel setHidden:1];
  [(NSLayoutConstraint *)self->_ratingsLabelToBottomConstraint setActive:0];
  [(NSLayoutConstraint *)self->_minorLabelToBottomConsttraint setActive:1];
  [(NSLayoutConstraint *)self->_majorLabelToBottomConstraint setActive:0];
  [(UIButton *)self->_actionButton setHidden:!v3];
  [(UIActivityIndicatorView *)self->_activityIndicatorView stopAnimating];
  actionButton = self->_actionButton;
  id v6 = +[NSBundle mainBundle];
  v7 = [v6 localizedStringForKey:@"Show Rides" value:@"localized string not found" table:0];
  [(UIButton *)actionButton setTitle:v7 forState:0];

  [(NSLayoutConstraint *)self->_textToActionButtonConstraint setActive:1];
  textToActivityIndicatorConstraint = self->_textToActivityIndicatorConstraint;

  [(NSLayoutConstraint *)textToActivityIndicatorConstraint setActive:0];
}

- (void)_updateViewsAndConstraintsForShowingLoadingStateOfDisabledApp
{
  [(UILabel *)self->_minorLabel setHidden:0];
  [(UILabel *)self->_ratingLabel setHidden:1];
  [(NSLayoutConstraint *)self->_ratingsLabelToBottomConstraint setActive:0];
  [(NSLayoutConstraint *)self->_minorLabelToBottomConsttraint setActive:0];
  [(NSLayoutConstraint *)self->_majorLabelToBottomConstraint setActive:1];
  [(UIButton *)self->_actionButton setHidden:1];
  [(UIActivityIndicatorView *)self->_activityIndicatorView startAnimating];
  actionButton = self->_actionButton;
  id v4 = +[NSBundle mainBundle];
  double v5 = [v4 localizedStringForKey:@"Show Rides" value:@"localized string not found" table:0];
  [(UIButton *)actionButton setTitle:v5 forState:0];

  [(NSLayoutConstraint *)self->_textToActionButtonConstraint setActive:0];
  textToActivityIndicatorConstraint = self->_textToActivityIndicatorConstraint;

  [(NSLayoutConstraint *)textToActivityIndicatorConstraint setActive:1];
}

- (void)_updateViewsAndConstraintsForShowingErrorWithRideBookingRideOptionStatus:(id)a3
{
  id v6 = a3;
  [(UILabel *)self->_minorLabel setHidden:0];
  [(UILabel *)self->_ratingLabel setHidden:1];
  [(NSLayoutConstraint *)self->_ratingsLabelToBottomConstraint setActive:0];
  [(NSLayoutConstraint *)self->_minorLabelToBottomConsttraint setActive:1];
  [(NSLayoutConstraint *)self->_majorLabelToBottomConstraint setActive:0];
  [(UIActivityIndicatorView *)self->_activityIndicatorView stopAnimating];
  [(NSLayoutConstraint *)self->_textToActionButtonConstraint setActive:1];
  [(NSLayoutConstraint *)self->_textToActivityIndicatorConstraint setActive:0];
  [(UIButton *)self->_actionButton setHidden:1];
  [(UIButton *)self->_actionButton setTitle:0 forState:0];
  if ([v6 rideOptionStatusError] == (id)11)
  {
    [(UIButton *)self->_actionButton setHidden:0];
    actionButton = self->_actionButton;
    double v5 = [v6 errorMessage];
    [(UIButton *)actionButton setTitle:v5 forState:0];
  }
}

- (void)_clearContent
{
  applicationIdentifer = self->_applicationIdentifer;
  self->_applicationIdentifer = 0;

  [(UILabel *)self->_majorLabel setText:0];
  [(UILabel *)self->_minorLabel setText:0];
  [(UILabel *)self->_ratingLabel setText:0];
  [(UILabel *)self->_ratingLabel setAttributedText:0];
  iconImageView = self->_iconImageView;

  [(UIImageView *)iconImageView setImage:0];
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)RidesharingAppLargeIconTableViewCell;
  [(RidesharingAppLargeIconTableViewCell *)&v4 prepareForReuse];
  BOOL v3 = +[MKAppImageManager sharedImageManager];
  [v3 cancelLoadAppImageAtURL:self->_lastRequestedImageURL];
}

- (void)_actionButtonPressed:(id)a3
{
  id v4 = a3;
  id v5 = [(RidesharingAppLargeIconTableViewCell *)self delegate];
  [v5 ridesharingAppLargeIconTableViewCell:self didSelectActionButton:v4];
}

- (RidesharingAppLargeIconTableViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RidesharingAppLargeIconTableViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)applicationIdentifer
{
  return self->_applicationIdentifer;
}

- (void)setApplicationIdentifer:(id)a3
{
}

- (UILabel)majorLabel
{
  return self->_majorLabel;
}

- (void)setMajorLabel:(id)a3
{
}

- (UILabel)minorLabel
{
  return self->_minorLabel;
}

- (void)setMinorLabel:(id)a3
{
}

- (UIButton)actionButton
{
  return self->_actionButton;
}

- (void)setActionButton:(id)a3
{
}

- (UILabel)ratingLabel
{
  return self->_ratingLabel;
}

- (void)setRatingLabel:(id)a3
{
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
}

- (UIActivityIndicatorView)activityIndicatorView
{
  return self->_activityIndicatorView;
}

- (void)setActivityIndicatorView:(id)a3
{
}

- (UILayoutGuide)textLayoutGuide
{
  return self->_textLayoutGuide;
}

- (void)setTextLayoutGuide:(id)a3
{
}

- (NSURL)lastRequestedImageURL
{
  return self->_lastRequestedImageURL;
}

- (void)setLastRequestedImageURL:(id)a3
{
}

- (NSLayoutConstraint)majorLabelBaselineToTopConstraint
{
  return self->_majorLabelBaselineToTopConstraint;
}

- (void)setMajorLabelBaselineToTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)minorLabelBaselineToMajorLabelBaselineConstraint
{
  return self->_minorLabelBaselineToMajorLabelBaselineConstraint;
}

- (void)setMinorLabelBaselineToMajorLabelBaselineConstraint:(id)a3
{
}

- (NSLayoutConstraint)ratingsLabelBaselineToMinorLabelBaselineConstraint
{
  return self->_ratingsLabelBaselineToMinorLabelBaselineConstraint;
}

- (void)setRatingsLabelBaselineToMinorLabelBaselineConstraint:(id)a3
{
}

- (NSLayoutConstraint)ratingsLabelToBottomConstraint
{
  return self->_ratingsLabelToBottomConstraint;
}

- (void)setRatingsLabelToBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)minorLabelToBottomConsttraint
{
  return self->_minorLabelToBottomConsttraint;
}

- (void)setMinorLabelToBottomConsttraint:(id)a3
{
}

- (NSLayoutConstraint)majorLabelToBottomConstraint
{
  return self->_majorLabelToBottomConstraint;
}

- (void)setMajorLabelToBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)textToActivityIndicatorConstraint
{
  return self->_textToActivityIndicatorConstraint;
}

- (void)setTextToActivityIndicatorConstraint:(id)a3
{
}

- (NSLayoutConstraint)textToActionButtonConstraint
{
  return self->_textToActionButtonConstraint;
}

- (void)setTextToActionButtonConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textToActionButtonConstraint, 0);
  objc_storeStrong((id *)&self->_textToActivityIndicatorConstraint, 0);
  objc_storeStrong((id *)&self->_majorLabelToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_minorLabelToBottomConsttraint, 0);
  objc_storeStrong((id *)&self->_ratingsLabelToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_ratingsLabelBaselineToMinorLabelBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_minorLabelBaselineToMajorLabelBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_majorLabelBaselineToTopConstraint, 0);
  objc_storeStrong((id *)&self->_lastRequestedImageURL, 0);
  objc_storeStrong((id *)&self->_textLayoutGuide, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_ratingLabel, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_minorLabel, 0);
  objc_storeStrong((id *)&self->_majorLabel, 0);
  objc_storeStrong((id *)&self->_applicationIdentifer, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end