@interface CHNoHeartRateDataViewController
+ (id)heartRateModalNavigationController;
- (UIButton)linkButton;
- (UIImageView)iconImageView;
- (UILabel)bodyLabel;
- (UILabel)linkLabel;
- (UILabel)titleLabel;
- (UILayoutGuide)containerGuide;
- (id)_constructKBURLWithLocale:(id)a3;
- (int64_t)urlRetryCount;
- (void)_openKBURLWithLocale:(id)a3 completionHandler:(id)a4;
- (void)_openKBURLWithRetry;
- (void)doneTapped:(id)a3;
- (void)loadView;
- (void)setBodyLabel:(id)a3;
- (void)setContainerGuide:(id)a3;
- (void)setIconImageView:(id)a3;
- (void)setLinkButton:(id)a3;
- (void)setLinkLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setUrlRetryCount:(int64_t)a3;
@end

@implementation CHNoHeartRateDataViewController

+ (id)heartRateModalNavigationController
{
  v2 = [[CHNoHeartRateDataViewController alloc] initWithNibName:0 bundle:0];
  id v3 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v2];

  return v3;
}

- (void)loadView
{
  v207.receiver = self;
  v207.super_class = (Class)CHNoHeartRateDataViewController;
  [(CHNoHeartRateDataViewController *)&v207 loadView];
  [(CHNoHeartRateDataViewController *)self setUrlRetryCount:0];
  id v3 = +[UIColor systemBackgroundColor];
  v4 = [(CHNoHeartRateDataViewController *)self view];
  [v4 setBackgroundColor:v3];

  id v5 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"doneTapped:"];
  v6 = [(CHNoHeartRateDataViewController *)self navigationItem];
  [v6 setRightBarButtonItem:v5];

  id v7 = objc_alloc_init((Class)UILayoutGuide);
  [(CHNoHeartRateDataViewController *)self setContainerGuide:v7];

  v8 = [(CHNoHeartRateDataViewController *)self view];
  v9 = [(CHNoHeartRateDataViewController *)self containerGuide];
  [v8 addLayoutGuide:v9];

  v10 = [(CHNoHeartRateDataViewController *)self containerGuide];
  v11 = [v10 centerYAnchor];
  v12 = [(CHNoHeartRateDataViewController *)self view];
  v13 = [v12 safeAreaLayoutGuide];
  v14 = [v13 centerYAnchor];
  v206 = [v11 constraintEqualToAnchor:v14];

  v15 = [(CHNoHeartRateDataViewController *)self containerGuide];
  v16 = [v15 leadingAnchor];
  v17 = [(CHNoHeartRateDataViewController *)self view];
  v18 = [v17 safeAreaLayoutGuide];
  v19 = [v18 leadingAnchor];
  v205 = [v16 constraintEqualToAnchor:v19];

  v20 = [(CHNoHeartRateDataViewController *)self containerGuide];
  v21 = [v20 trailingAnchor];
  v22 = [(CHNoHeartRateDataViewController *)self view];
  v23 = [v22 safeAreaLayoutGuide];
  v24 = [v23 trailingAnchor];
  v204 = [v21 constraintEqualToAnchor:v24];

  v213[0] = v206;
  v213[1] = v205;
  v213[2] = v204;
  v25 = +[NSArray arrayWithObjects:v213 count:3];
  +[NSLayoutConstraint activateConstraints:v25];

  v26 = +[UIImage systemImageNamed:@"info.circle"];
  v27 = +[UIImageSymbolConfiguration configurationWithTextStyle:](UIImageSymbolConfiguration, "configurationWithTextStyle:");
  v203 = [v26 imageWithSymbolConfiguration:v27];

  id v28 = [objc_alloc((Class)UIImageView) initWithImage:v203];
  [(CHNoHeartRateDataViewController *)self setIconImageView:v28];

  v29 = [(CHNoHeartRateDataViewController *)self iconImageView];
  [v29 setTranslatesAutoresizingMaskIntoConstraints:0];

  v30 = [(CHNoHeartRateDataViewController *)self iconImageView];
  LODWORD(v31) = 1148846080;
  [v30 setContentHuggingPriority:1 forAxis:v31];

  v32 = [(CHNoHeartRateDataViewController *)self iconImageView];
  LODWORD(v33) = 1148846080;
  [v32 setContentCompressionResistancePriority:1 forAxis:v33];

  v34 = [(CHNoHeartRateDataViewController *)self view];
  v35 = [(CHNoHeartRateDataViewController *)self iconImageView];
  [v34 addSubview:v35];

  v36 = [(CHNoHeartRateDataViewController *)self iconImageView];
  v37 = [v36 centerXAnchor];
  v38 = [(CHNoHeartRateDataViewController *)self containerGuide];
  v39 = [v38 centerXAnchor];
  v202 = [v37 constraintEqualToAnchor:v39];

  v40 = [(CHNoHeartRateDataViewController *)self iconImageView];
  v41 = [v40 topAnchor];
  v42 = [(CHNoHeartRateDataViewController *)self containerGuide];
  v43 = [v42 topAnchor];
  v201 = [v41 constraintEqualToAnchor:v43];

  v212[0] = v202;
  v212[1] = v201;
  v44 = +[NSArray arrayWithObjects:v212 count:2];
  +[NSLayoutConstraint activateConstraints:v44];

  id v45 = objc_alloc((Class)UILabel);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v49 = [v45 initWithFrame:CGRectZero.origin.x, y, width, height];
  [(CHNoHeartRateDataViewController *)self setTitleLabel:v49];

  v50 = [(CHNoHeartRateDataViewController *)self titleLabel];
  [v50 setTranslatesAutoresizingMaskIntoConstraints:0];

  v200 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleTitle2 addingSymbolicTraits:2 options:0];
  v51 = +[UIFont fontWithDescriptor:v200 size:0.0];
  v52 = [(CHNoHeartRateDataViewController *)self titleLabel];
  [v52 setFont:v51];

  v53 = +[UIColor labelColor];
  v54 = [(CHNoHeartRateDataViewController *)self titleLabel];
  [v54 setTextColor:v53];

  v55 = [(CHNoHeartRateDataViewController *)self titleLabel];
  [v55 setAllowsDefaultTighteningForTruncation:1];

  v56 = [(CHNoHeartRateDataViewController *)self titleLabel];
  [v56 setTextAlignment:1];

  v57 = [(CHNoHeartRateDataViewController *)self titleLabel];
  LODWORD(v58) = 1148846080;
  [v57 setContentCompressionResistancePriority:1 forAxis:v58];

  v59 = [(CHNoHeartRateDataViewController *)self titleLabel];
  LODWORD(v60) = 1148846080;
  [v59 setContentHuggingPriority:1 forAxis:v60];

  v61 = +[NSBundle mainBundle];
  v62 = [v61 localizedStringForKey:@"HEART_RATE_NO_DATA_MODAL_TITLE" value:&stru_1008D8AB8 table:@"Localizable"];
  v63 = [(CHNoHeartRateDataViewController *)self titleLabel];
  [v63 setText:v62];

  v64 = [(CHNoHeartRateDataViewController *)self view];
  v65 = [(CHNoHeartRateDataViewController *)self titleLabel];
  [v64 addSubview:v65];

  v66 = [(CHNoHeartRateDataViewController *)self titleLabel];
  v67 = [v66 centerXAnchor];
  v68 = [(CHNoHeartRateDataViewController *)self containerGuide];
  v69 = [v68 centerXAnchor];
  v199 = [v67 constraintEqualToAnchor:v69];

  v70 = [(CHNoHeartRateDataViewController *)self titleLabel];
  v71 = [v70 firstBaselineAnchor];
  v72 = [(CHNoHeartRateDataViewController *)self iconImageView];
  v73 = [v72 bottomAnchor];
  v74 = [(CHNoHeartRateDataViewController *)self titleLabel];
  v75 = [v74 font];
  [v75 _scaledValueForValue:44.0];
  v198 = [v71 constraintEqualToAnchor:v73];

  v76 = [(CHNoHeartRateDataViewController *)self titleLabel];
  v77 = [v76 leadingAnchor];
  v78 = [(CHNoHeartRateDataViewController *)self containerGuide];
  v79 = [v78 leadingAnchor];
  v197 = [v77 constraintGreaterThanOrEqualToAnchor:v79 constant:12.0];

  v80 = [(CHNoHeartRateDataViewController *)self titleLabel];
  v81 = [v80 trailingAnchor];
  v82 = [(CHNoHeartRateDataViewController *)self containerGuide];
  v83 = [v82 trailingAnchor];
  v196 = [v81 constraintGreaterThanOrEqualToAnchor:v83 constant:-12.0];

  v211[0] = v199;
  v211[1] = v198;
  v211[2] = v197;
  v211[3] = v196;
  v84 = +[NSArray arrayWithObjects:v211 count:4];
  +[NSLayoutConstraint activateConstraints:v84];

  id v85 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  [(CHNoHeartRateDataViewController *)self setBodyLabel:v85];

  v86 = [(CHNoHeartRateDataViewController *)self bodyLabel];
  [v86 setTranslatesAutoresizingMaskIntoConstraints:0];

  v87 = [(CHNoHeartRateDataViewController *)self bodyLabel];
  [v87 setNumberOfLines:0];

  v88 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  v89 = [(CHNoHeartRateDataViewController *)self bodyLabel];
  [v89 setFont:v88];

  v90 = +[UIColor labelColor];
  v91 = [(CHNoHeartRateDataViewController *)self bodyLabel];
  [v91 setTextColor:v90];

  v92 = [(CHNoHeartRateDataViewController *)self bodyLabel];
  [v92 setAllowsDefaultTighteningForTruncation:1];

  v93 = [(CHNoHeartRateDataViewController *)self bodyLabel];
  [v93 setTextAlignment:1];

  v94 = [(CHNoHeartRateDataViewController *)self bodyLabel];
  LODWORD(v95) = 1148846080;
  [v94 setContentCompressionResistancePriority:1 forAxis:v95];

  v96 = [(CHNoHeartRateDataViewController *)self bodyLabel];
  LODWORD(v97) = 1148846080;
  [v96 setContentHuggingPriority:1 forAxis:v97];

  v98 = +[NSBundle mainBundle];
  v99 = [v98 localizedStringForKey:@"HEART_RATE_NO_DATA_MODAL_BODY" value:&stru_1008D8AB8 table:@"Localizable"];
  v100 = [(CHNoHeartRateDataViewController *)self bodyLabel];
  [v100 setText:v99];

  v101 = [(CHNoHeartRateDataViewController *)self view];
  v102 = [(CHNoHeartRateDataViewController *)self bodyLabel];
  [v101 addSubview:v102];

  v103 = [(CHNoHeartRateDataViewController *)self bodyLabel];
  v104 = [v103 centerXAnchor];
  v105 = [(CHNoHeartRateDataViewController *)self containerGuide];
  v106 = [v105 centerXAnchor];
  v195 = [v104 constraintEqualToAnchor:v106];

  v107 = [(CHNoHeartRateDataViewController *)self bodyLabel];
  v108 = [v107 firstBaselineAnchor];
  v109 = [(CHNoHeartRateDataViewController *)self titleLabel];
  v110 = [v109 lastBaselineAnchor];
  v111 = [(CHNoHeartRateDataViewController *)self bodyLabel];
  v112 = [v111 font];
  [v112 _scaledValueForValue:32.0];
  v194 = [v108 constraintEqualToAnchor:v110];

  v113 = [(CHNoHeartRateDataViewController *)self bodyLabel];
  v114 = [v113 leadingAnchor];
  v115 = [(CHNoHeartRateDataViewController *)self containerGuide];
  v116 = [v115 leadingAnchor];
  v193 = [v114 constraintEqualToAnchor:v116 constant:12.0];

  v117 = [(CHNoHeartRateDataViewController *)self bodyLabel];
  v118 = [v117 trailingAnchor];
  v119 = [(CHNoHeartRateDataViewController *)self containerGuide];
  v120 = [v119 trailingAnchor];
  v192 = [v118 constraintEqualToAnchor:v120 constant:-12.0];

  v210[0] = v195;
  v210[1] = v194;
  v210[2] = v193;
  v210[3] = v192;
  v121 = +[NSArray arrayWithObjects:v210 count:4];
  +[NSLayoutConstraint activateConstraints:v121];

  id v122 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  [(CHNoHeartRateDataViewController *)self setLinkLabel:v122];

  v123 = [(CHNoHeartRateDataViewController *)self linkLabel];
  [v123 setTranslatesAutoresizingMaskIntoConstraints:0];

  v124 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  v125 = [(CHNoHeartRateDataViewController *)self linkLabel];
  [v125 setFont:v124];

  v126 = +[ARUIMetricColors energyColors];
  v127 = [v126 nonGradientTextColor];
  v128 = [(CHNoHeartRateDataViewController *)self linkLabel];
  [v128 setTextColor:v127];

  v129 = [(CHNoHeartRateDataViewController *)self linkLabel];
  [v129 setAllowsDefaultTighteningForTruncation:1];

  v130 = [(CHNoHeartRateDataViewController *)self linkLabel];
  [v130 setTextAlignment:1];

  v131 = [(CHNoHeartRateDataViewController *)self linkLabel];
  LODWORD(v132) = 1148846080;
  [v131 setContentCompressionResistancePriority:1 forAxis:v132];

  v133 = [(CHNoHeartRateDataViewController *)self linkLabel];
  LODWORD(v134) = 1148846080;
  [v133 setContentHuggingPriority:1 forAxis:v134];

  v135 = +[NSBundle mainBundle];
  v136 = [v135 localizedStringForKey:@"HEART_RATE_KB_LINK_TITLE" value:&stru_1008D8AB8 table:@"Localizable"];
  v137 = [(CHNoHeartRateDataViewController *)self linkLabel];
  [v137 setText:v136];

  v138 = [(CHNoHeartRateDataViewController *)self view];
  v139 = [(CHNoHeartRateDataViewController *)self linkLabel];
  [v138 addSubview:v139];

  v140 = [(CHNoHeartRateDataViewController *)self linkLabel];
  v141 = [v140 centerXAnchor];
  v142 = [(CHNoHeartRateDataViewController *)self containerGuide];
  v143 = [v142 centerXAnchor];
  v191 = [v141 constraintEqualToAnchor:v143];

  v144 = [(CHNoHeartRateDataViewController *)self linkLabel];
  v145 = [v144 firstBaselineAnchor];
  v146 = [(CHNoHeartRateDataViewController *)self bodyLabel];
  v147 = [v146 lastBaselineAnchor];
  v148 = [(CHNoHeartRateDataViewController *)self linkLabel];
  v149 = [v148 font];
  [v149 _scaledValueForValue:30.0];
  v190 = [v145 constraintEqualToAnchor:v147];

  v150 = [(CHNoHeartRateDataViewController *)self linkLabel];
  v151 = [v150 lastBaselineAnchor];
  v152 = [(CHNoHeartRateDataViewController *)self containerGuide];
  v153 = [v152 bottomAnchor];
  v189 = [v151 constraintEqualToAnchor:v153];

  v154 = [(CHNoHeartRateDataViewController *)self linkLabel];
  v155 = [v154 leadingAnchor];
  v156 = [(CHNoHeartRateDataViewController *)self containerGuide];
  v157 = [v156 leadingAnchor];
  v158 = [v155 constraintGreaterThanOrEqualToAnchor:v157 constant:12.0];

  v159 = [(CHNoHeartRateDataViewController *)self linkLabel];
  v160 = [v159 trailingAnchor];
  v161 = [(CHNoHeartRateDataViewController *)self containerGuide];
  v162 = [v161 trailingAnchor];
  v163 = [v160 constraintGreaterThanOrEqualToAnchor:v162 constant:-12.0];

  v209[0] = v191;
  v209[1] = v190;
  v209[2] = v189;
  v209[3] = v158;
  v209[4] = v163;
  v164 = +[NSArray arrayWithObjects:v209 count:5];
  +[NSLayoutConstraint activateConstraints:v164];

  v165 = +[UIButton buttonWithType:0];
  [(CHNoHeartRateDataViewController *)self setLinkButton:v165];

  v166 = [(CHNoHeartRateDataViewController *)self linkButton];
  [v166 setTranslatesAutoresizingMaskIntoConstraints:0];

  v167 = [(CHNoHeartRateDataViewController *)self linkButton];
  [v167 addTarget:self action:"kbLinkTapped:" forControlEvents:64];

  v168 = [(CHNoHeartRateDataViewController *)self view];
  v169 = [(CHNoHeartRateDataViewController *)self linkButton];
  [v168 addSubview:v169];

  v170 = [(CHNoHeartRateDataViewController *)self linkButton];
  v171 = [v170 centerXAnchor];
  v172 = [(CHNoHeartRateDataViewController *)self linkLabel];
  v173 = [v172 centerXAnchor];
  v174 = [v171 constraintEqualToAnchor:v173];

  v175 = [(CHNoHeartRateDataViewController *)self linkButton];
  v176 = [v175 centerYAnchor];
  v177 = [(CHNoHeartRateDataViewController *)self linkLabel];
  v178 = [v177 centerYAnchor];
  v179 = [v176 constraintEqualToAnchor:v178];

  v180 = [(CHNoHeartRateDataViewController *)self linkButton];
  v181 = [v180 heightAnchor];
  v182 = [v181 constraintEqualToConstant:44.0];

  v183 = [(CHNoHeartRateDataViewController *)self linkButton];
  v184 = [v183 widthAnchor];
  v185 = [(CHNoHeartRateDataViewController *)self containerGuide];
  v186 = [v185 widthAnchor];
  v187 = [v184 constraintEqualToAnchor:v186 constant:-24.0];

  v208[0] = v174;
  v208[1] = v179;
  v208[2] = v182;
  v208[3] = v187;
  v188 = +[NSArray arrayWithObjects:v208 count:4];
  +[NSLayoutConstraint activateConstraints:v188];
}

- (id)_constructKBURLWithLocale:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSURLComponents);
  [v4 setScheme:@"https"];
  [v4 setHost:@"support.apple.com"];
  id v5 = [v3 localeIdentifier];

  v6 = [v5 lowercaseString];

  id v7 = [v6 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];

  v8 = +[NSString stringWithFormat:@"/%@/%@", v7, @"HT204666"];
  [v4 setPath:v8];

  v9 = [v4 URL];

  return v9;
}

- (void)doneTapped:(id)a3
{
  id v3 = [(CHNoHeartRateDataViewController *)self navigationController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)_openKBURLWithRetry
{
  if ([(CHNoHeartRateDataViewController *)self urlRetryCount] > 1)
  {
    id v3 = +[NSLocale localeWithLocaleIdentifier:@"en_US"];
    id v4 = &stru_1008ACAC0;
  }
  else
  {
    id v3 = +[NSLocale currentLocale];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10011D58C;
    v5[3] = &unk_1008ACA80;
    v5[4] = self;
    id v4 = (Block_layout *)v5;
  }
  [(CHNoHeartRateDataViewController *)self _openKBURLWithLocale:v3 completionHandler:v4];

  [(CHNoHeartRateDataViewController *)self setUrlRetryCount:(char *)[(CHNoHeartRateDataViewController *)self urlRetryCount] + 1];
}

- (void)_openKBURLWithLocale:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = +[UIApplication sharedApplication];
  v8 = [(CHNoHeartRateDataViewController *)self _constructKBURLWithLocale:v7];

  [v9 openURL:v8 withCompletionHandler:v6];
}

- (UILayoutGuide)containerGuide
{
  return self->_containerGuide;
}

- (void)setContainerGuide:(id)a3
{
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)bodyLabel
{
  return self->_bodyLabel;
}

- (void)setBodyLabel:(id)a3
{
}

- (UILabel)linkLabel
{
  return self->_linkLabel;
}

- (void)setLinkLabel:(id)a3
{
}

- (UIButton)linkButton
{
  return self->_linkButton;
}

- (void)setLinkButton:(id)a3
{
}

- (int64_t)urlRetryCount
{
  return self->_urlRetryCount;
}

- (void)setUrlRetryCount:(int64_t)a3
{
  self->_urlRetryCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkButton, 0);
  objc_storeStrong((id *)&self->_linkLabel, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);

  objc_storeStrong((id *)&self->_containerGuide, 0);
}

@end