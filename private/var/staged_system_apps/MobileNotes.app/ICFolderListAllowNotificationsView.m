@interface ICFolderListAllowNotificationsView
+ (double)backgroundBottomMargin;
+ (double)backgroundTopMargin;
+ (double)separatorTopMargin;
+ (double)titleTopMargin;
- (BOOL)hasGroupInset;
- (ICFolderListAllowNotificationsView)initWithFrame:(CGRect)a3;
- (UIButton)closeButton;
- (UIButton)settingsButton;
- (UIImageView)bellImageView;
- (UILabel)titleLabel;
- (UIView)bellBackgroundView;
- (UIView)roundedRectView;
- (UIView)separatorView;
- (id)closeHandler;
- (id)constraints;
- (id)createBell;
- (id)createCloseButton;
- (id)createRoundedRectView;
- (id)createSeparator;
- (id)createSettingsButton;
- (id)createTitle;
- (void)setBellBackgroundView:(id)a3;
- (void)setBellImageView:(id)a3;
- (void)setCloseButton:(id)a3;
- (void)setCloseHandler:(id)a3;
- (void)setHasGroupInset:(BOOL)a3;
- (void)setRoundedRectView:(id)a3;
- (void)setSeparatorView:(id)a3;
- (void)setSettingsButton:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)updateCloseButtonImage;
- (void)updateColors;
@end

@implementation ICFolderListAllowNotificationsView

+ (double)backgroundTopMargin
{
  unsigned int v2 = +[UIDevice ic_isVision];
  double result = 16.0;
  if (v2) {
    return 0.0;
  }
  return result;
}

+ (double)backgroundBottomMargin
{
  unsigned int v2 = +[UIDevice ic_isVision];
  double result = 16.0;
  if (v2) {
    return 12.0;
  }
  return result;
}

+ (double)titleTopMargin
{
  unsigned int v2 = +[UIDevice ic_isVision];
  double result = 11.0;
  if (v2) {
    return 12.0;
  }
  return result;
}

+ (double)separatorTopMargin
{
  unsigned int v2 = +[UIDevice ic_isVision];
  double result = 11.0;
  if (v2) {
    return 12.0;
  }
  return result;
}

- (ICFolderListAllowNotificationsView)initWithFrame:(CGRect)a3
{
  v27.receiver = self;
  v27.super_class = (Class)ICFolderListAllowNotificationsView;
  v3 = -[ICFolderListAllowNotificationsView initWithFrame:](&v27, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc_init((Class)UIView);
    v5 = +[UIColor clearColor];
    [v4 setBackgroundColor:v5];

    [(ICFolderListAllowNotificationsView *)v3 setBackgroundView:v4];
    v6 = [(ICFolderListAllowNotificationsView *)v3 createRoundedRectView];
    [(ICFolderListAllowNotificationsView *)v3 setRoundedRectView:v6];

    v7 = [(ICFolderListAllowNotificationsView *)v3 contentView];
    v8 = [(ICFolderListAllowNotificationsView *)v3 roundedRectView];
    [v7 addSubview:v8];

    v9 = [(ICFolderListAllowNotificationsView *)v3 createBell];
    [(ICFolderListAllowNotificationsView *)v3 setBellBackgroundView:v9];

    v10 = [(ICFolderListAllowNotificationsView *)v3 roundedRectView];
    v11 = [(ICFolderListAllowNotificationsView *)v3 bellBackgroundView];
    [v10 addSubview:v11];

    v12 = [(ICFolderListAllowNotificationsView *)v3 createTitle];
    [(ICFolderListAllowNotificationsView *)v3 setTitleLabel:v12];

    v13 = [(ICFolderListAllowNotificationsView *)v3 roundedRectView];
    v14 = [(ICFolderListAllowNotificationsView *)v3 titleLabel];
    [v13 addSubview:v14];

    v15 = [(ICFolderListAllowNotificationsView *)v3 createSeparator];
    [(ICFolderListAllowNotificationsView *)v3 setSeparatorView:v15];

    v16 = [(ICFolderListAllowNotificationsView *)v3 roundedRectView];
    v17 = [(ICFolderListAllowNotificationsView *)v3 separatorView];
    [v16 addSubview:v17];

    v18 = [(ICFolderListAllowNotificationsView *)v3 createCloseButton];
    [(ICFolderListAllowNotificationsView *)v3 setCloseButton:v18];

    v19 = [(ICFolderListAllowNotificationsView *)v3 roundedRectView];
    v20 = [(ICFolderListAllowNotificationsView *)v3 closeButton];
    [v19 addSubview:v20];

    v21 = [(ICFolderListAllowNotificationsView *)v3 createSettingsButton];
    [(ICFolderListAllowNotificationsView *)v3 setSettingsButton:v21];

    v22 = [(ICFolderListAllowNotificationsView *)v3 roundedRectView];
    v23 = [(ICFolderListAllowNotificationsView *)v3 settingsButton];
    [v22 addSubview:v23];

    v24 = [(ICFolderListAllowNotificationsView *)v3 constraints];
    +[NSLayoutConstraint activateConstraints:v24];

    [(ICFolderListAllowNotificationsView *)v3 updateCloseButtonImage];
    [(ICFolderListAllowNotificationsView *)v3 updateColors];
    v25 = +[NSNotificationCenter defaultCenter];
    [v25 addObserver:v3 selector:"contentSizeCategoryDidChange:" name:UIContentSizeCategoryDidChangeNotification object:0];
  }
  return v3;
}

- (void)setHasGroupInset:(BOOL)a3
{
  self->_hasGroupInset = a3;
  [(ICFolderListAllowNotificationsView *)self updateColors];
}

- (id)createRoundedRectView
{
  id v3 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v4 = [(ICFolderListAllowNotificationsView *)self traitCollection];
  _UITableViewDefaultSectionCornerRadiusForTraitCollection();
  double v6 = v5;

  [v3 ic_applyRoundedCornersWithRadius:v6];

  return v3;
}

- (id)createBell
{
  id v3 = [objc_alloc((Class)UIView) initWithFrame:0.0, 0.0, 32.0, 32.0];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  if ((+[UIDevice ic_isVision] & 1) == 0)
  {
    id v4 = +[UIColor secondaryLabelColor];
    [v3 setBackgroundColor:v4];

    [v3 ic_applyRoundedCornersWithRadius:16.0];
  }
  double v5 = +[UIImageSymbolConfiguration configurationWithPointSize:4 weight:-1 scale:20.0];
  double v6 = +[UIImage systemImageNamed:@"bell.badge.fill" withConfiguration:v5];

  id v7 = [objc_alloc((Class)UIImageView) initWithImage:v6];
  v8 = +[UIColor whiteColor];
  [v7 setTintColor:v8];

  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 addSubview:v7];
  [(ICFolderListAllowNotificationsView *)self setBellImageView:v7];

  return v3;
}

- (id)createTitle
{
  id v2 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v2 setNumberOfLines:0];
  if (+[UIDevice ic_isVision])
  {
    id v3 = +[UIColor secondaryLabelColor];
    id v4 = &UIFontTextStyleFootnote;
  }
  else
  {
    id v3 = +[UIColor labelColor];
    id v4 = &UIFontTextStyleHeadline;
  }
  [v2 setTextColor:v3];

  double v5 = +[UIFont preferredFontForTextStyle:*v4];
  [v2 setFont:v5];

  double v6 = +[NSBundle mainBundle];
  id v7 = [v6 localizedStringForKey:@"Do you want to be notified when mentioned in shared notes?" value:&stru_10063F3D8 table:0];
  [v2 setText:v7];

  return v2;
}

- (id)createSeparator
{
  id v2 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [v2 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v3 = +[UIColor separatorColor];
  [v2 setBackgroundColor:v3];

  return v2;
}

- (id)createCloseButton
{
  id v3 = +[UIButtonConfiguration borderlessButtonConfiguration];
  [v3 contentInsets];
  [v3 setContentInsets:4.0, 4.0, 4.0, 4.0];
  id v4 = +[UIColor tertiaryLabelColor];
  [v3 setBaseForegroundColor:v4];

  objc_initWeak(&location, self);
  v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  v14 = sub_100120DE4;
  v15 = &unk_100627240;
  objc_copyWeak(&v16, &location);
  double v5 = +[UIAction actionWithHandler:&v12];
  double v6 = +[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v3, v5, v12, v13, v14, v15);
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v7) = 1148846080;
  [v6 setContentCompressionResistancePriority:1 forAxis:v7];
  LODWORD(v8) = 1148846080;
  [v6 setContentCompressionResistancePriority:0 forAxis:v8];
  LODWORD(v9) = 1148846080;
  [v6 setContentHuggingPriority:1 forAxis:v9];
  LODWORD(v10) = 1148846080;
  [v6 setContentHuggingPriority:0 forAxis:v10];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v6;
}

- (id)createSettingsButton
{
  id v2 = +[UIButtonConfiguration ic_plainButtonConfiguration];
  [v2 contentInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if (+[UIDevice ic_isVision])
  {
    double v8 = 0.0;
    double v4 = 0.0;
  }
  else
  {
    [v2 setTitleAlignment:1];
    double v10 = 0.0;
    double v6 = 0.0;
  }
  [v2 setContentInsets:v4, v6, v8, v10];
  [v2 setCornerStyle:4];
  unsigned int v11 = +[UIDevice ic_isVision];
  v12 = &UIFontTextStyleBody;
  if (!v11) {
    v12 = &UIFontTextStyleSubheadline;
  }
  UIFontTextStyle v13 = *v12;
  NSAttributedStringKey v24 = NSFontAttributeName;
  v14 = v13;
  v15 = +[UIFont preferredFontForTextStyle:v14];
  v25 = v15;
  id v16 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];

  v17 = +[NSBundle mainBundle];
  v18 = [v17 localizedStringForKey:@"Go to Settings" value:&stru_10063F3D8 table:0];

  id v19 = [objc_alloc((Class)NSAttributedString) initWithString:v18 attributes:v16];
  [v2 setAttributedTitle:v19];
  v20 = +[UIAction actionWithHandler:&stru_10062A750];
  v21 = +[UIButton buttonWithConfiguration:v2 primaryAction:v20];
  [v21 setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v22) = 1148846080;
  [v21 setContentCompressionResistancePriority:1 forAxis:v22];

  return v21;
}

- (id)constraints
{
  double v3 = +[NSMutableArray array];
  double v4 = [(ICFolderListAllowNotificationsView *)self roundedRectView];
  double v5 = [v4 leadingAnchor];
  double v6 = [(ICFolderListAllowNotificationsView *)self contentView];
  double v7 = [v6 layoutMarginsGuide];
  double v8 = [v7 leadingAnchor];
  double v9 = [v5 constraintEqualToAnchor:v8];
  [v3 addObject:v9];

  double v10 = [(ICFolderListAllowNotificationsView *)self roundedRectView];
  unsigned int v11 = [v10 trailingAnchor];
  v12 = [(ICFolderListAllowNotificationsView *)self contentView];
  UIFontTextStyle v13 = [v12 layoutMarginsGuide];
  v14 = [v13 trailingAnchor];
  v15 = [v11 constraintEqualToAnchor:v14];
  [v3 addObject:v15];

  id v16 = [(ICFolderListAllowNotificationsView *)self roundedRectView];
  v17 = [v16 topAnchor];
  v18 = [(ICFolderListAllowNotificationsView *)self contentView];
  id v19 = [v18 topAnchor];
  [(id)objc_opt_class() backgroundTopMargin];
  v20 = [v17 constraintEqualToAnchor:v19];
  [v3 addObject:v20];

  v21 = [(ICFolderListAllowNotificationsView *)self roundedRectView];
  double v22 = [v21 bottomAnchor];
  v23 = [(ICFolderListAllowNotificationsView *)self contentView];
  NSAttributedStringKey v24 = [v23 bottomAnchor];
  [(id)objc_opt_class() backgroundBottomMargin];
  v26 = [v22 constraintEqualToAnchor:v24 constant:-v25];
  [v3 addObject:v26];

  objc_super v27 = [(ICFolderListAllowNotificationsView *)self bellBackgroundView];
  v28 = [v27 leadingAnchor];
  v29 = [(ICFolderListAllowNotificationsView *)self roundedRectView];
  v30 = [v29 leadingAnchor];
  v31 = [v28 constraintEqualToAnchor:v30 constant:12.0];
  [v3 addObject:v31];

  v32 = [(ICFolderListAllowNotificationsView *)self bellBackgroundView];
  v33 = [v32 topAnchor];
  v34 = [(ICFolderListAllowNotificationsView *)self roundedRectView];
  v35 = [v34 topAnchor];
  v36 = [v33 constraintEqualToAnchor:v35 constant:16.0];
  [v3 addObject:v36];

  v37 = [(ICFolderListAllowNotificationsView *)self bellBackgroundView];
  v38 = [v37 widthAnchor];
  v39 = [v38 constraintEqualToConstant:32.0];
  [v3 addObject:v39];

  v40 = [(ICFolderListAllowNotificationsView *)self bellBackgroundView];
  v41 = [v40 heightAnchor];
  v42 = [v41 constraintEqualToConstant:32.0];
  [v3 addObject:v42];

  v43 = [(ICFolderListAllowNotificationsView *)self bellImageView];
  v44 = [v43 centerXAnchor];
  v45 = [(ICFolderListAllowNotificationsView *)self bellBackgroundView];
  v46 = [v45 centerXAnchor];
  v47 = [v44 constraintEqualToAnchor:v46];
  [v3 addObject:v47];

  v48 = [(ICFolderListAllowNotificationsView *)self bellImageView];
  v49 = [v48 centerYAnchor];
  v50 = [(ICFolderListAllowNotificationsView *)self bellBackgroundView];
  v51 = [v50 centerYAnchor];
  v52 = [v49 constraintEqualToAnchor:v51];
  [v3 addObject:v52];

  v53 = [(ICFolderListAllowNotificationsView *)self titleLabel];
  v54 = [v53 topAnchor];
  v55 = [(ICFolderListAllowNotificationsView *)self roundedRectView];
  v56 = [v55 topAnchor];
  [(id)objc_opt_class() titleTopMargin];
  v57 = [v54 constraintEqualToAnchor:v56];
  [v3 addObject:v57];

  v58 = [(ICFolderListAllowNotificationsView *)self titleLabel];
  v59 = [v58 leadingAnchor];
  v60 = [(ICFolderListAllowNotificationsView *)self bellBackgroundView];
  v61 = [v60 trailingAnchor];
  v62 = [v59 constraintEqualToAnchor:v61 constant:12.0];
  [v3 addObject:v62];

  v63 = [(ICFolderListAllowNotificationsView *)self titleLabel];
  v64 = [v63 trailingAnchor];
  v65 = [(ICFolderListAllowNotificationsView *)self closeButton];
  v66 = [v65 leadingAnchor];
  v67 = [v64 constraintLessThanOrEqualToAnchor:v66 constant:-7.0];
  [v3 addObject:v67];

  v68 = [(ICFolderListAllowNotificationsView *)self titleLabel];
  v69 = [v68 font];
  [v69 ascender];
  double v71 = v70;
  v72 = [(ICFolderListAllowNotificationsView *)self titleLabel];
  v73 = [v72 font];
  [v73 descender];
  double v75 = v71 + v74;

  v76 = [(ICFolderListAllowNotificationsView *)self closeButton];
  v77 = [v76 centerYAnchor];
  v78 = [(ICFolderListAllowNotificationsView *)self titleLabel];
  v79 = [v78 firstBaselineAnchor];
  v80 = [v77 constraintEqualToAnchor:v79 constant:v75 * -0.5];
  [v3 addObject:v80];

  v81 = [(ICFolderListAllowNotificationsView *)self closeButton];
  v82 = [v81 trailingAnchor];
  v83 = [(ICFolderListAllowNotificationsView *)self roundedRectView];
  v84 = [v83 trailingAnchor];
  v85 = [v82 constraintEqualToAnchor:v84 constant:-7.0];
  [v3 addObject:v85];

  v86 = [(ICFolderListAllowNotificationsView *)self closeButton];
  v87 = [v86 heightAnchor];
  v88 = [(ICFolderListAllowNotificationsView *)self closeButton];
  v89 = [v88 widthAnchor];
  v90 = [v87 constraintEqualToAnchor:v89];
  [v3 addObject:v90];

  v91 = [(ICFolderListAllowNotificationsView *)self separatorView];
  v92 = [v91 topAnchor];
  v93 = [(ICFolderListAllowNotificationsView *)self titleLabel];
  v94 = [v93 bottomAnchor];
  [(id)objc_opt_class() separatorTopMargin];
  v95 = [v92 constraintEqualToAnchor:v94];
  [v3 addObject:v95];

  v96 = [(ICFolderListAllowNotificationsView *)self separatorView];
  v97 = [v96 leadingAnchor];
  v98 = [(ICFolderListAllowNotificationsView *)self titleLabel];
  v99 = [v98 leadingAnchor];
  v100 = [v97 constraintEqualToAnchor:v99];
  [v3 addObject:v100];

  v101 = [(ICFolderListAllowNotificationsView *)self separatorView];
  v102 = [v101 trailingAnchor];
  v103 = self;
  v104 = [v103 roundedRectView];
  v105 = [v104 trailingAnchor];
  v106 = [v102 constraintEqualToAnchor:v105 constant:-13.0];
  [v3 addObject:v106];

  v107 = [(ICFolderListAllowNotificationsView *)self separatorView];
  v108 = [v107 heightAnchor];
  [(ICFolderListAllowNotificationsView *)self ic_hairlineWidth];
  v109 = [v108 constraintEqualToConstant:];
  [v3 addObject:v109];

  if (+[UIDevice ic_isVision]) {
    double v110 = 12.0;
  }
  else {
    double v110 = 0.0;
  }
  v111 = [(ICFolderListAllowNotificationsView *)self settingsButton];
  v112 = [v111 topAnchor];
  v113 = [(ICFolderListAllowNotificationsView *)self separatorView];
  v114 = [v113 bottomAnchor];
  v115 = [v112 constraintEqualToAnchor:v114 constant:v110];
  [v3 addObject:v115];

  if (+[UIDevice ic_isVision])
  {
    v116 = +[UIButtonConfiguration plainButtonConfiguration];
    [v116 contentInsets];
    double v118 = v117;

    v119 = +[UIButtonConfiguration plainButtonConfiguration];
    [v119 contentInsets];
    double v121 = v120;

    v122 = [(ICFolderListAllowNotificationsView *)self settingsButton];
    v123 = [v122 leadingAnchor];
    v124 = [(ICFolderListAllowNotificationsView *)self separatorView];
    v125 = [v124 leadingAnchor];
    v126 = [v123 constraintEqualToAnchor:v125 constant:-v118];
    [v3 addObject:v126];

    v127 = [(ICFolderListAllowNotificationsView *)self settingsButton];
    v128 = [v127 trailingAnchor];
    v129 = [(ICFolderListAllowNotificationsView *)self separatorView];
    v130 = [v129 trailingAnchor];
    [v128 constraintLessThanOrEqualToAnchor:v130 constant:v121];
  }
  else
  {
    v131 = [(ICFolderListAllowNotificationsView *)self settingsButton];
    v132 = [v131 leadingAnchor];
    v133 = [(ICFolderListAllowNotificationsView *)self separatorView];
    v134 = [v133 leadingAnchor];
    v135 = [v132 constraintEqualToAnchor:v134];
    [v3 addObject:v135];

    v127 = [(ICFolderListAllowNotificationsView *)self settingsButton];
    v128 = [v127 trailingAnchor];
    v129 = [(ICFolderListAllowNotificationsView *)self separatorView];
    v130 = [v129 trailingAnchor];
    [v128 constraintEqualToAnchor:v130];
  v136 = };
  [v3 addObject:v136];

  v137 = [(ICFolderListAllowNotificationsView *)self settingsButton];
  v138 = [v137 heightAnchor];
  v139 = [v138 constraintEqualToConstant:44.0];

  LODWORD(v140) = 1144750080;
  [v139 setPriority:v140];
  [v3 addObject:v139];
  v141 = [(ICFolderListAllowNotificationsView *)self settingsButton];
  v142 = [v141 bottomAnchor];
  v143 = [(ICFolderListAllowNotificationsView *)self roundedRectView];
  v144 = [v143 bottomAnchor];
  v145 = [v142 constraintEqualToAnchor:v144 constant:-v110];
  [v3 addObject:v145];

  id v146 = [v3 copy];

  return v146;
}

- (void)updateColors
{
  double v3 = +[UIColor clearColor];
  [(ICFolderListAllowNotificationsView *)self setBackgroundColor:v3];

  if ([(ICFolderListAllowNotificationsView *)self hasGroupInset]) {
    +[UIColor tableCellGroupedBackgroundColor];
  }
  else {
  id v5 = +[UIColor quaternarySystemFillColor];
  }
  double v4 = [(ICFolderListAllowNotificationsView *)self roundedRectView];
  [v4 setBackgroundColor:v5];
}

- (void)updateCloseButtonImage
{
  unsigned int v3 = +[UIDevice ic_isVision];
  double v4 = &UIFontTextStyleBody;
  if (v3) {
    double v4 = &UIFontTextStyleTitle2;
  }
  UIFontTextStyle v5 = *v4;
  double v6 = &UIFontWeightRegular;
  if (!v3) {
    double v6 = &UIFontWeightSemibold;
  }
  id v12 = +[UIFont ic_preferredFontForStyle:v5 withFontWeight:UIContentSizeCategoryExtraExtraLarge maxContentSizeCategory:*v6];
  [v12 pointSize];
  double v7 = +[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 6, 1);
  double v8 = +[UIImage systemImageNamed:@"xmark" withConfiguration:v7];
  double v9 = [(ICFolderListAllowNotificationsView *)self closeButton];
  double v10 = [v9 configuration];

  [v10 setImage:v8];
  unsigned int v11 = [(ICFolderListAllowNotificationsView *)self closeButton];
  [v11 setConfiguration:v10];
}

- (id)closeHandler
{
  return self->_closeHandler;
}

- (void)setCloseHandler:(id)a3
{
}

- (BOOL)hasGroupInset
{
  return self->_hasGroupInset;
}

- (UIView)roundedRectView
{
  return self->_roundedRectView;
}

- (void)setRoundedRectView:(id)a3
{
}

- (UIView)bellBackgroundView
{
  return self->_bellBackgroundView;
}

- (void)setBellBackgroundView:(id)a3
{
}

- (UIImageView)bellImageView
{
  return self->_bellImageView;
}

- (void)setBellImageView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
}

- (UIButton)settingsButton
{
  return self->_settingsButton;
}

- (void)setSettingsButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsButton, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_bellImageView, 0);
  objc_storeStrong((id *)&self->_bellBackgroundView, 0);
  objc_storeStrong((id *)&self->_roundedRectView, 0);

  objc_storeStrong(&self->_closeHandler, 0);
}

@end