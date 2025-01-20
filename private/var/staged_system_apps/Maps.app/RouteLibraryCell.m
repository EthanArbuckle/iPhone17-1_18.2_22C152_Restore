@interface RouteLibraryCell
- (GEOComposedGeometryRoutePersistentData)routeData;
- (MapDataSubscriptionInfo)offlineSubscription;
- (RouteLibraryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (RouteLibraryCellDelegate)delegate;
- (id)_greyScaleImageIfNeeded:(id)a3;
- (void)_pressedDelete;
- (void)_pressedDirections;
- (void)_pressedDownload;
- (void)_pressedEdit;
- (void)_pressedMore;
- (void)_refreshOfflineSubscription;
- (void)_setImageForSnapshot:(id)a3;
- (void)_updateMenu;
- (void)_updateMoreButton;
- (void)dealloc;
- (void)fadingLabelTruncationChanged:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)prepareForReuse;
- (void)setOfflineSubscription:(id)a3;
- (void)setRouteData:(id)a3 delegate:(id)a4 userInterfaceStyle:(int64_t)a5 inWidth:(double)a6;
- (void)setSnapshotWithRouteData:(id)a3 scale:(double)a4 userInterfaceStyle:(int64_t)a5;
- (void)valueChangedForGEOConfigKey:(id)a3;
@end

@implementation RouteLibraryCell

- (RouteLibraryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v233.receiver = self;
  v233.super_class = (Class)RouteLibraryCell;
  v4 = [(RouteLibraryCell *)&v233 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    [(RouteLibraryCell *)v4 setAccessibilityIdentifier:v6];

    v7 = [(RouteLibraryCell *)v4 contentView];
    uint64_t v8 = objc_opt_new();
    snapshotImageView = v4->_snapshotImageView;
    v4->_snapshotImageView = (UIImageView *)v8;

    [(UIImageView *)v4->_snapshotImageView setAccessibilityIdentifier:@"SnapshotImageView"];
    [(UIImageView *)v4->_snapshotImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v4->_snapshotImageView setContentMode:4];
    [(UIImageView *)v4->_snapshotImageView _setContinuousCornerRadius:8.0];
    [(UIImageView *)v4->_snapshotImageView setClipsToBounds:1];
    v10 = [(UIImageView *)v4->_snapshotImageView layer];
    [v10 setBorderWidth:0.5];

    id v11 = +[UIColor colorWithWhite:0.0 alpha:0.0799999982];
    id v12 = [v11 CGColor];
    v13 = [(UIImageView *)v4->_snapshotImageView layer];
    [v13 setBorderColor:v12];

    [v7 addSubview:v4->_snapshotImageView];
    uint64_t v14 = objc_opt_new();
    placeholderImageView = v4->_placeholderImageView;
    v4->_placeholderImageView = (UIImageView *)v14;

    [(UIImageView *)v4->_placeholderImageView setAccessibilityIdentifier:@"PlaceholderImageView"];
    [(UIImageView *)v4->_placeholderImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v4->_placeholderImageView setContentMode:4];
    v16 = +[UIImage systemImageNamed:@"figure.walk"];
    [(UIImageView *)v4->_placeholderImageView setImage:v16];

    v17 = +[UIColor tertiaryLabelColor];
    [(UIImageView *)v4->_placeholderImageView setBackgroundColor:v17];

    v18 = +[UIColor labelColor];
    [(UIImageView *)v4->_placeholderImageView setTintColor:v18];

    [(UIImageView *)v4->_placeholderImageView _setContinuousCornerRadius:8.0];
    [(UIImageView *)v4->_placeholderImageView setClipsToBounds:1];
    v19 = [(UIImageView *)v4->_placeholderImageView layer];
    [v19 setBorderWidth:0.5];

    id v20 = +[UIColor colorWithWhite:0.0 alpha:0.0799999982];
    id v21 = [v20 CGColor];
    v22 = [(UIImageView *)v4->_placeholderImageView layer];
    [v22 setBorderColor:v21];

    [v7 addSubview:v4->_placeholderImageView];
    v23 = objc_opt_new();
    [v23 setTranslatesAutoresizingMaskIntoConstraints:0];
    v24 = [v23 layer];
    [v24 setShadowOffset:0.0, 4.0];

    id v25 = +[UIColor blackColor];
    id v26 = [v25 CGColor];
    v27 = [v23 layer];
    [v27 setShadowColor:v26];

    v28 = [v23 layer];
    [v28 setShadowRadius:8.0];

    v29 = [v23 layer];
    LODWORD(v30) = 1042536202;
    [v29 setShadowOpacity:v30];

    +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, 20.0, 20.0, 10.0);
    id v31 = objc_claimAutoreleasedReturnValue();
    id v32 = [v31 CGPath];
    v33 = [v23 layer];
    [v33 setShadowPath:v32];

    v232 = v23;
    [v7 addSubview:v23];
    uint64_t v34 = objc_opt_new();
    transportTypeContainerView = v4->_transportTypeContainerView;
    v4->_transportTypeContainerView = (UIView *)v34;

    [(UIView *)v4->_transportTypeContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v4->_transportTypeContainerView _setCornerRadius:10.0];
    [(UIView *)v4->_transportTypeContainerView setClipsToBounds:1];
    [v23 addSubview:v4->_transportTypeContainerView];
    uint64_t v36 = objc_opt_new();
    transportTypeImageView = v4->_transportTypeImageView;
    v4->_transportTypeImageView = (UIImageView *)v36;

    [(UIImageView *)v4->_transportTypeImageView setAccessibilityIdentifier:@"TransportTypeImageView"];
    [(UIImageView *)v4->_transportTypeImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v4->_transportTypeImageView setContentMode:4];
    [(UIImageView *)v4->_transportTypeImageView setClipsToBounds:1];
    [(UIView *)v4->_transportTypeContainerView addSubview:v4->_transportTypeImageView];
    uint64_t v38 = objc_opt_new();
    textContainerView = v4->_textContainerView;
    v4->_textContainerView = (UIView *)v38;

    [(UIView *)v4->_textContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
    [v7 addSubview:v4->_textContainerView];
    uint64_t v40 = objc_opt_new();
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v40;

    [(UILabel *)v4->_titleLabel setAccessibilityIdentifier:@"TitleLabel"];
    [(UILabel *)v4->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v42 = +[UIFont _preferredFontForTextStyle:UIFontTextStyleBody weight:UIFontWeightSemibold];
    [(UILabel *)v4->_titleLabel setFont:v42];

    LODWORD(v43) = 1148846080;
    [(UILabel *)v4->_titleLabel setContentHuggingPriority:1 forAxis:v43];
    LODWORD(v44) = 1148846080;
    [(UILabel *)v4->_titleLabel setContentCompressionResistancePriority:1 forAxis:v44];
    [(UIView *)v4->_textContainerView addSubview:v4->_titleLabel];
    uint64_t v45 = objc_opt_new();
    addressLabel = v4->_addressLabel;
    v4->_addressLabel = (UILabel *)v45;

    [(UILabel *)v4->_addressLabel setAccessibilityIdentifier:@"AddressLabel"];
    [(UILabel *)v4->_addressLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v47 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
    [(UILabel *)v4->_addressLabel setFont:v47];

    v48 = +[UIColor secondaryLabelColor];
    [(UILabel *)v4->_addressLabel setTextColor:v48];

    LODWORD(v49) = 1148846080;
    [(UILabel *)v4->_addressLabel setContentHuggingPriority:1 forAxis:v49];
    LODWORD(v50) = 1148846080;
    [(UILabel *)v4->_addressLabel setContentCompressionResistancePriority:1 forAxis:v50];
    [(UIView *)v4->_textContainerView addSubview:v4->_addressLabel];
    uint64_t v51 = objc_opt_new();
    descriptionLabel = v4->_descriptionLabel;
    v4->_descriptionLabel = (MapsThemeMultiPartLabel *)v51;

    [(MapsThemeMultiPartLabel *)v4->_descriptionLabel setAccessibilityIdentifier:@"DescriptionLabel"];
    [(MapsThemeMultiPartLabel *)v4->_descriptionLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MapsThemeMultiPartLabel *)v4->_descriptionLabel setUserInteractionEnabled:0];
    v53 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
    [(MapsThemeMultiPartLabel *)v4->_descriptionLabel setFont:v53];

    v54 = +[UIColor secondaryLabelColor];
    [(MapsThemeMultiPartLabel *)v4->_descriptionLabel setTextColor:v54];

    [(MapsThemeMultiPartLabel *)v4->_descriptionLabel setNumberOfLines:1];
    LODWORD(v55) = 1148846080;
    [(MapsThemeMultiPartLabel *)v4->_descriptionLabel setContentHuggingPriority:1 forAxis:v55];
    LODWORD(v56) = 1148846080;
    [(MapsThemeMultiPartLabel *)v4->_descriptionLabel setContentCompressionResistancePriority:1 forAxis:v56];
    [(UIView *)v4->_textContainerView addSubview:v4->_descriptionLabel];
    v57 = -[MapsFadingLabel initWithFrame:]([MapsFadingLabel alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    notesLabel = v4->_notesLabel;
    v4->_notesLabel = v57;

    [(MapsFadingLabel *)v4->_notesLabel setAccessibilityIdentifier:@"NotesLabel"];
    [(MapsFadingLabel *)v4->_notesLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v59 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
    [(MapsFadingLabel *)v4->_notesLabel setFont:v59];

    v60 = +[UIColor secondaryLabelColor];
    [(MapsFadingLabel *)v4->_notesLabel setTextColor:v60];

    [(MapsFadingLabel *)v4->_notesLabel setNumberOfLines:2];
    [(MapsFadingLabel *)v4->_notesLabel setDelegate:v4];
    [v7 addSubview:v4->_notesLabel];
    uint64_t v61 = objc_opt_new();
    moreButton = v4->_moreButton;
    v4->_moreButton = (UIButton *)v61;

    [(UIButton *)v4->_moreButton setAccessibilityIdentifier:@"MoreButton"];
    [(UIButton *)v4->_moreButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v63 = v4->_moreButton;
    v64 = +[UIColor systemBlueColor];
    [(UIButton *)v63 setTitleColor:v64 forState:0];

    v65 = v4->_moreButton;
    v66 = +[NSBundle mainBundle];
    v67 = [v66 localizedStringForKey:@"[Route Creation] More Notes" value:@"localized string not found" table:0];
    [(UIButton *)v65 setTitle:v67 forState:0];

    [(UIButton *)v4->_moreButton addTarget:v4 action:"_pressedMore" forControlEvents:64];
    LODWORD(v68) = 1148846080;
    [(UIButton *)v4->_moreButton setContentHuggingPriority:0 forAxis:v68];
    LODWORD(v69) = 1148846080;
    [(UIButton *)v4->_moreButton setContentHuggingPriority:1 forAxis:v69];
    v70 = [(MapsFadingLabel *)v4->_notesLabel font];
    v71 = [(UIButton *)v4->_moreButton titleLabel];
    [v71 setFont:v70];

    v72 = +[UIColor clearColor];
    [(UIButton *)v4->_moreButton setBackgroundColor:v72];

    [(UIButton *)v4->_moreButton setHidden:1];
    [v7 addSubview:v4->_moreButton];
    uint64_t v73 = objc_opt_new();
    menuButton = v4->_menuButton;
    v4->_menuButton = (UIButton *)v73;

    [(UIButton *)v4->_menuButton setAccessibilityIdentifier:@"MenuButton"];
    [(UIButton *)v4->_menuButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v75 = +[UIColor systemBlueColor];
    [(UIButton *)v4->_menuButton setTintColor:v75];

    [(UIButton *)v4->_menuButton setShowsMenuAsPrimaryAction:1];
    v76 = +[UIFont systemFontOfSize:17.0 weight:UIFontWeightSemibold];
    v228 = +[UIImageSymbolConfiguration configurationWithFont:v76];

    v77 = v4->_menuButton;
    v78 = +[UIImage systemImageNamed:@"ellipsis" withConfiguration:v228];
    [(UIButton *)v77 setImage:v78 forState:0];

    LODWORD(v79) = 1148846080;
    [(UIButton *)v4->_menuButton setContentHuggingPriority:0 forAxis:v79];
    LODWORD(v80) = 1148846080;
    [(UIButton *)v4->_menuButton setContentCompressionResistancePriority:0 forAxis:v80];
    -[UIButton _setTouchInsets:](v4->_menuButton, "_setTouchInsets:", -11.0, -11.0, -11.0, -11.0);
    v231 = v7;
    [v7 addSubview:v4->_menuButton];
    [(RouteLibraryCell *)v4 _updateMenu];
    uint64_t v81 = objc_opt_new();
    offlineDownloadStateView = v4->_offlineDownloadStateView;
    v4->_offlineDownloadStateView = (RouteLibraryOfflineDownloadStateView *)v81;

    [(RouteLibraryOfflineDownloadStateView *)v4->_offlineDownloadStateView setAccessibilityIdentifier:@"OfflineDownloadState"];
    [(RouteLibraryOfflineDownloadStateView *)v4->_offlineDownloadStateView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(RouteLibraryOfflineDownloadStateView *)v4->_offlineDownloadStateView setHidden:1];
    [v7 addSubview:v4->_offlineDownloadStateView];
    v83 = [(UILabel *)v4->_titleLabel trailingAnchor];
    v84 = [(UIButton *)v4->_menuButton leadingAnchor];
    v85 = [v83 constraintEqualToAnchor:v84 constant:-8.0];
    v238 = v85;
    uint64_t v86 = +[NSArray arrayWithObjects:&v238 count:1];
    noOfflineDownloadConstraints = v4->_noOfflineDownloadConstraints;
    v4->_noOfflineDownloadConstraints = (NSArray *)v86;

    v88 = [(UILabel *)v4->_titleLabel trailingAnchor];
    v89 = [(RouteLibraryOfflineDownloadStateView *)v4->_offlineDownloadStateView leadingAnchor];
    v90 = [v88 constraintEqualToAnchor:v89 constant:-8.0];
    v237 = v90;
    uint64_t v91 = +[NSArray arrayWithObjects:&v237 count:1];
    offlineDownloadConstraints = v4->_offlineDownloadConstraints;
    v4->_offlineDownloadConstraints = (NSArray *)v91;

    v93 = [(UIButton *)v4->_moreButton lastBaselineAnchor];
    v94 = [(MapsFadingLabel *)v4->_notesLabel lastBaselineAnchor];
    uint64_t v95 = [v93 constraintEqualToAnchor:v94];
    moreButtonBottomConstraint = v4->_moreButtonBottomConstraint;
    v4->_moreButtonBottomConstraint = (NSLayoutConstraint *)v95;

    if (sub_1000BBB44(v4) == 5) {
      double v97 = 4.0;
    }
    else {
      double v97 = 8.0;
    }
    if (sub_1000BBB44(v4) == 5) {
      double v98 = 8.0;
    }
    else {
      double v98 = 12.0;
    }
    v224 = [(UIImageView *)v4->_snapshotImageView leadingAnchor];
    v223 = [v7 leadingAnchor];
    v222 = [v224 constraintEqualToAnchor:v223 constant:16.0];
    v236[0] = v222;
    v220 = [(UIImageView *)v4->_snapshotImageView topAnchor];
    v219 = [v7 topAnchor];
    v218 = [v220 constraintEqualToAnchor:v219 constant:16.0];
    v236[1] = v218;
    v217 = [(UIImageView *)v4->_snapshotImageView widthAnchor];
    v214 = [v217 constraintEqualToConstant:64.0];
    v236[2] = v214;
    v225 = [(UIImageView *)v4->_snapshotImageView heightAnchor];
    v213 = [v225 constraintEqualToConstant:64.0];
    v236[3] = v213;
    v212 = [(UIImageView *)v4->_placeholderImageView leadingAnchor];
    v211 = [v7 leadingAnchor];
    v210 = [v212 constraintEqualToAnchor:v211 constant:16.0];
    v236[4] = v210;
    v208 = [(UIImageView *)v4->_placeholderImageView topAnchor];
    v207 = [v7 topAnchor];
    v206 = [v208 constraintEqualToAnchor:v207 constant:16.0];
    v236[5] = v206;
    v205 = [(UIImageView *)v4->_placeholderImageView widthAnchor];
    v204 = [v205 constraintEqualToConstant:64.0];
    v236[6] = v204;
    v203 = [(UIImageView *)v4->_placeholderImageView heightAnchor];
    v202 = [v203 constraintEqualToConstant:64.0];
    v236[7] = v202;
    v201 = [v23 leadingAnchor];
    v200 = [(UIImageView *)v4->_placeholderImageView leadingAnchor];
    v199 = [v201 constraintEqualToAnchor:v200 constant:48.0];
    v236[8] = v199;
    v198 = [v23 topAnchor];
    v197 = [(UIImageView *)v4->_placeholderImageView topAnchor];
    v196 = [v198 constraintEqualToAnchor:v197 constant:48.0];
    v236[9] = v196;
    v195 = [v23 widthAnchor];
    v194 = [v195 constraintEqualToConstant:20.0];
    v236[10] = v194;
    v193 = [v23 heightAnchor];
    v192 = [v193 constraintEqualToConstant:20.0];
    v236[11] = v192;
    v191 = [(UIView *)v4->_transportTypeContainerView leadingAnchor];
    v190 = [v23 leadingAnchor];
    v189 = [v191 constraintEqualToAnchor:v190];
    v236[12] = v189;
    v188 = [(UIView *)v4->_transportTypeContainerView trailingAnchor];
    v187 = [v23 trailingAnchor];
    v186 = [v188 constraintEqualToAnchor:v187];
    v236[13] = v186;
    v185 = [(UIView *)v4->_transportTypeContainerView topAnchor];
    v184 = [v23 topAnchor];
    v183 = [v185 constraintEqualToAnchor:v184];
    v236[14] = v183;
    v182 = [(UIView *)v4->_transportTypeContainerView bottomAnchor];
    v181 = [v23 bottomAnchor];
    v180 = [v182 constraintEqualToAnchor:v181];
    v236[15] = v180;
    v179 = [(UIImageView *)v4->_transportTypeImageView centerXAnchor];
    v178 = [(UIView *)v4->_transportTypeContainerView centerXAnchor];
    v177 = [v179 constraintEqualToAnchor:v178];
    v236[16] = v177;
    v215 = [(UIImageView *)v4->_transportTypeImageView centerYAnchor];
    v209 = [(UIView *)v4->_transportTypeContainerView centerYAnchor];
    v176 = [v215 constraintEqualToAnchor:v209];
    v236[17] = v176;
    v175 = [(UIButton *)v4->_menuButton trailingAnchor];
    v174 = [v7 trailingAnchor];
    v173 = [v175 constraintEqualToAnchor:v174 constant:-16.0];
    v236[18] = v173;
    v172 = [(UIButton *)v4->_menuButton centerYAnchor];
    v171 = [(UILabel *)v4->_titleLabel centerYAnchor];
    v170 = [v172 constraintEqualToAnchor:v171];
    v236[19] = v170;
    v169 = [(UIView *)v4->_textContainerView leadingAnchor];
    v168 = [(UIImageView *)v4->_placeholderImageView trailingAnchor];
    v167 = [v169 constraintEqualToAnchor:v168 constant:v98];
    v236[20] = v167;
    v166 = [(UIView *)v4->_textContainerView trailingAnchor];
    v165 = [v7 trailingAnchor];
    v164 = [v166 constraintEqualToAnchor:v165 constant:-16.0];
    v236[21] = v164;
    v163 = [(UIView *)v4->_textContainerView topAnchor];
    v162 = [v7 topAnchor];
    v161 = [v163 constraintGreaterThanOrEqualToAnchor:v162 constant:16.0];
    v236[22] = v161;
    v160 = [(UIView *)v4->_textContainerView topAnchor];
    v159 = [v7 topAnchor];
    LODWORD(v99) = 1148813312;
    v158 = [v160 constraintEqualToAnchor:v159 constant:16.0 priority:v99];
    v236[23] = v158;
    v157 = [(UIView *)v4->_textContainerView centerYAnchor];
    v156 = [(UIImageView *)v4->_placeholderImageView centerYAnchor];
    LODWORD(v100) = 1148829696;
    v155 = [v157 constraintEqualToAnchor:v156 constant:0.0 priority:v100];
    v236[24] = v155;
    v154 = [(UILabel *)v4->_titleLabel leadingAnchor];
    v153 = [(UIView *)v4->_textContainerView leadingAnchor];
    v152 = [v154 constraintEqualToAnchor:v153];
    v236[25] = v152;
    v151 = [(UILabel *)v4->_titleLabel topAnchor];
    v150 = [(UIView *)v4->_textContainerView topAnchor];
    v149 = [v151 constraintEqualToAnchor:v150];
    v236[26] = v149;
    v148 = [(UILabel *)v4->_addressLabel leadingAnchor];
    v147 = [(UILabel *)v4->_titleLabel leadingAnchor];
    v146 = [v148 constraintEqualToAnchor:v147];
    v236[27] = v146;
    v145 = [(UILabel *)v4->_addressLabel trailingAnchor];
    v144 = [(UILabel *)v4->_titleLabel trailingAnchor];
    v143 = [v145 constraintEqualToAnchor:v144];
    v236[28] = v143;
    v142 = [(UILabel *)v4->_addressLabel topAnchor];
    v141 = [(UILabel *)v4->_titleLabel bottomAnchor];
    v140 = [v142 constraintEqualToAnchor:v141 constant:1.0];
    v236[29] = v140;
    v139 = [(MapsThemeMultiPartLabel *)v4->_descriptionLabel leadingAnchor];
    v229 = [(UILabel *)v4->_titleLabel leadingAnchor];
    v138 = [v139 constraintEqualToAnchor:v229];
    v236[30] = v138;
    v137 = [(MapsThemeMultiPartLabel *)v4->_descriptionLabel trailingAnchor];
    v136 = [(UIView *)v4->_textContainerView trailingAnchor];
    v135 = [v137 constraintEqualToAnchor:v136];
    v236[31] = v135;
    v134 = [(MapsThemeMultiPartLabel *)v4->_descriptionLabel topAnchor];
    v221 = [(UILabel *)v4->_addressLabel bottomAnchor];
    v133 = [v134 constraintEqualToAnchor:v221 constant:-6.0];
    v236[32] = v133;
    v216 = [(MapsThemeMultiPartLabel *)v4->_descriptionLabel bottomAnchor];
    v132 = [(UIView *)v4->_textContainerView bottomAnchor];
    v131 = [v216 constraintEqualToAnchor:v132 constant:8.0];
    v236[33] = v131;
    v130 = [(MapsFadingLabel *)v4->_notesLabel leadingAnchor];
    v129 = [(UIView *)v4->_textContainerView leadingAnchor];
    v128 = [v130 constraintEqualToAnchor:v129];
    v236[34] = v128;
    v127 = [(MapsFadingLabel *)v4->_notesLabel trailingAnchor];
    v126 = [(UIView *)v4->_textContainerView trailingAnchor];
    v125 = [v127 constraintEqualToAnchor:v126];
    v236[35] = v125;
    v124 = [(MapsFadingLabel *)v4->_notesLabel topAnchor];
    v101 = [(UIView *)v4->_textContainerView bottomAnchor];
    v102 = [v124 constraintEqualToAnchor:v101 constant:v97];
    v236[36] = v102;
    v103 = [v7 bottomAnchor];
    v104 = [(MapsFadingLabel *)v4->_notesLabel bottomAnchor];
    LODWORD(v105) = 1132068864;
    v106 = [v103 constraintEqualToAnchor:v104 constant:16.0 priority:v105];
    v236[37] = v106;
    v107 = [(UIButton *)v4->_moreButton trailingAnchor];
    v108 = [(MapsFadingLabel *)v4->_notesLabel trailingAnchor];
    v109 = [v107 constraintEqualToAnchor:v108];
    v236[38] = v109;
    v236[39] = v4->_moreButtonBottomConstraint;
    v110 = +[NSArray arrayWithObjects:v236 count:40];
    +[NSLayoutConstraint activateConstraints:v110];

    [(RouteLibraryCell *)v4 _updateMoreButton];
    +[NSLayoutConstraint activateConstraints:v4->_noOfflineDownloadConstraints];
    v230 = [(RouteLibraryOfflineDownloadStateView *)v4->_offlineDownloadStateView centerYAnchor];
    v227 = [(UIButton *)v4->_menuButton centerYAnchor];
    v226 = [v230 constraintEqualToAnchor:v227];
    v235[0] = v226;
    v111 = [(RouteLibraryOfflineDownloadStateView *)v4->_offlineDownloadStateView widthAnchor];
    v112 = [v111 constraintEqualToConstant:16.0];
    v235[1] = v112;
    v113 = [(RouteLibraryOfflineDownloadStateView *)v4->_offlineDownloadStateView heightAnchor];
    v114 = [(RouteLibraryOfflineDownloadStateView *)v4->_offlineDownloadStateView widthAnchor];
    v115 = [v113 constraintEqualToAnchor:v114];
    v235[2] = v115;
    v116 = [(RouteLibraryOfflineDownloadStateView *)v4->_offlineDownloadStateView trailingAnchor];
    v117 = [(UIButton *)v4->_menuButton leadingAnchor];
    v118 = [v116 constraintEqualToAnchor:v117 constant:-8.0];
    v235[3] = v118;
    v119 = +[NSArray arrayWithObjects:v235 count:4];
    +[NSLayoutConstraint activateConstraints:v119];

    v120 = +[NSNotificationCenter defaultCenter];
    [v120 addObserver:v4 selector:"_refreshOfflineSubscription" name:@"OfflineMapsSubscriptionsDidChangeNotification" object:0];

    uint64_t v234 = objc_opt_class();
    v121 = +[NSArray arrayWithObjects:&v234 count:1];
    id v122 = [(RouteLibraryCell *)v4 registerForTraitChanges:v121 withTarget:v4 action:"_userInterfaceStyleDidChange"];

    _GEOConfigAddDelegateListenerForKey();
  }
  return v4;
}

- (void)_updateMoreButton
{
  [(UIButton *)self->_moreButton intrinsicContentSize];
  notesLabel = self->_notesLabel;

  -[MapsFadingLabel setTrailingPadding:](notesLabel, "setTrailingPadding:");
}

- (void)_updateMenu
{
  objc_initWeak(location, self);
  int BOOL = GEOConfigGetBOOL();
  double v30 = self;
  if (([(GEOComposedGeometryRoutePersistentData *)self->_routeData isAvailableForCurrentCountry] & BOOL) == 1)
  {
    if (GEOSupportsOfflineMaps())
    {
      offlineSubscription = self->_offlineSubscription;
      if (offlineSubscription
        && ([(MapDataSubscriptionInfo *)offlineSubscription state],
            v5 = objc_claimAutoreleasedReturnValue(),
            v6 = (char *)[v5 loadState],
            v5,
            (unint64_t)(v6 - 1) < 2))
      {
        v7 = +[NSBundle mainBundle];
        uint64_t v8 = [v7 localizedStringForKey:@"[Route Creation] Offline Data Downloaded" value:@"localized string not found" table:0];

        uint64_t v9 = +[UIImage systemImageNamed:@"checkmark.circle"];
      }
      else
      {
        id v11 = +[NSBundle mainBundle];
        uint64_t v8 = [v11 localizedStringForKey:@"[Route Creation] Download Offline Data" value:@"localized string not found" table:0];

        uint64_t v9 = +[UIImage systemImageNamed:@"arrow.down.circle"];
      }
      id v12 = (void *)v9;
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_10062BE44;
      v39[3] = &unk_1012E8CD0;
      objc_copyWeak(&v40, location);
      id v32 = +[UIAction actionWithTitle:v8 image:v12 identifier:0 handler:v39];
      objc_destroyWeak(&v40);
    }
    else
    {
      id v32 = 0;
    }
    v13 = +[NSBundle mainBundle];
    uint64_t v14 = [v13 localizedStringForKey:@"[Route Creation] Directions on Route" value:@"localized string not found" table:0];
    v15 = +[UIImage systemImageNamed:@"arrow.triangle.turn.up.right.circle"];
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10062BE84;
    v37[3] = &unk_1012E8CD0;
    objc_copyWeak(&v38, location);
    v10 = +[UIAction actionWithTitle:v14 image:v15 identifier:0 handler:v37];

    objc_destroyWeak(&v38);
  }
  else
  {
    id v32 = 0;
    v10 = 0;
  }
  v16 = +[NSBundle mainBundle];
  v17 = [v16 localizedStringForKey:@"[Route Creation] Edit Route" value:@"localized string not found" table:0];
  v18 = +[UIImage systemImageNamed:@"pencil"];
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_10062BEC4;
  v35[3] = &unk_1012E8CD0;
  objc_copyWeak(&v36, location);
  v19 = +[UIAction actionWithTitle:v17 image:v18 identifier:0 handler:v35];

  id v20 = +[NSBundle mainBundle];
  id v21 = [v20 localizedStringForKey:@"[Route Creation] Delete Route" value:@"localized string not found" table:0];
  v22 = +[UIImage systemImageNamed:@"trash"];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10062BF04;
  v33[3] = &unk_1012E8CD0;
  objc_copyWeak(&v34, location);
  v23 = +[UIAction actionWithTitle:v21 image:v22 identifier:0 handler:v33];

  [v23 setAttributes:2];
  v24 = objc_opt_new();
  id v25 = v24;
  if (v10) {
    [v24 addObject:v10];
  }
  if (v32) {
    [v25 addObject:v32];
  }
  if ([v25 count])
  {
    id v26 = +[UIMenu menuWithTitle:&stru_101324E70 image:0 identifier:0 options:1 children:v25];
    if ((unint64_t)[v25 count] >= 2) {
      [v26 setPreferredElementSize:1];
    }
  }
  else
  {
    id v26 = 0;
  }
  v27 = objc_opt_new();
  v28 = v27;
  if (v26) {
    [v27 addObject:v26];
  }
  [v28 addObject:v19];
  [v28 addObject:v23];
  v29 = +[UIMenu menuWithTitle:&stru_101324E70 image:0 identifier:0 options:0 children:v28];
  [*(id *)(v31 + 96) setMenu:v29];

  objc_destroyWeak(&v34);
  objc_destroyWeak(&v36);

  objc_destroyWeak(location);
}

- (void)dealloc
{
  if (self->_offlineSubscription)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v3 = [&off_1013ADCB0 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v9;
      do
      {
        v6 = 0;
        do
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(&off_1013ADCB0);
          }
          [(MapDataSubscriptionInfo *)self->_offlineSubscription removeObserver:self forKeyPath:*(void *)(*((void *)&v8 + 1) + 8 * (void)v6) context:off_1015E79C0];
          v6 = (char *)v6 + 1;
        }
        while (v4 != v6);
        id v4 = [&off_1013ADCB0 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v4);
    }
  }
  GEOConfigRemoveDelegateListenerForAllKeys();
  v7.receiver = self;
  v7.super_class = (Class)RouteLibraryCell;
  [(RouteLibraryCell *)&v7 dealloc];
}

- (void)setOfflineSubscription:(id)a3
{
  uint64_t v5 = (MapDataSubscriptionInfo *)a3;
  p_offlineSubscription = &self->_offlineSubscription;
  offlineSubscription = self->_offlineSubscription;
  if (offlineSubscription != v5)
  {
    if (offlineSubscription)
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v8 = [&off_1013ADCC8 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v24;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v24 != v10) {
              objc_enumerationMutation(&off_1013ADCC8);
            }
            [(MapDataSubscriptionInfo *)*p_offlineSubscription removeObserver:self forKeyPath:*(void *)(*((void *)&v23 + 1) + 8 * i) context:off_1015E79C0];
          }
          id v9 = [&off_1013ADCC8 countByEnumeratingWithState:&v23 objects:v28 count:16];
        }
        while (v9);
      }
    }
    objc_storeStrong((id *)&self->_offlineSubscription, a3);
    [(RouteLibraryOfflineDownloadStateView *)self->_offlineDownloadStateView setSubscriptionInfo:v5];
    id v12 = *p_offlineSubscription;
    if (*p_offlineSubscription)
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v13 = [&off_1013ADCE0 countByEnumeratingWithState:&v19 objects:v27 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v20;
        do
        {
          for (j = 0; j != v14; j = (char *)j + 1)
          {
            if (*(void *)v20 != v15) {
              objc_enumerationMutation(&off_1013ADCE0);
            }
            [(MapDataSubscriptionInfo *)*p_offlineSubscription addObserver:self forKeyPath:*(void *)(*((void *)&v19 + 1) + 8 * (void)j) options:0 context:off_1015E79C0];
          }
          id v14 = [&off_1013ADCE0 countByEnumeratingWithState:&v19 objects:v27 count:16];
        }
        while (v14);
      }
      if (offlineSubscription) {
        goto LABEL_23;
      }
      v17 = &OBJC_IVAR___RouteLibraryCell__noOfflineDownloadConstraints;
      v18 = &OBJC_IVAR___RouteLibraryCell__offlineDownloadConstraints;
    }
    else
    {
      if (!offlineSubscription)
      {
LABEL_23:
        [(RouteLibraryCell *)self _updateMenu];
        goto LABEL_24;
      }
      v18 = &OBJC_IVAR___RouteLibraryCell__noOfflineDownloadConstraints;
      v17 = &OBJC_IVAR___RouteLibraryCell__offlineDownloadConstraints;
    }
    +[NSLayoutConstraint deactivateConstraints:*(Class *)((char *)&self->super.super.super.super.isa + *v17)];
    +[NSLayoutConstraint activateConstraints:*(Class *)((char *)&self->super.super.super.super.isa + *v18)];
    [(RouteLibraryOfflineDownloadStateView *)self->_offlineDownloadStateView setHidden:v12 == 0];
    goto LABEL_23;
  }
LABEL_24:
}

- (void)_refreshOfflineSubscription
{
  routeData = self->_routeData;
  if (routeData)
  {
    id v4 = [(GEOComposedGeometryRoutePersistentData *)routeData boundingMapRegion];
    id v7 = +[GEOMapRegion _maps_offlineCoverageRegionForRouteBounds:v4];

    uint64_t v5 = +[MapsOfflineUIHelper sharedHelper];
    v6 = [v5 subscriptionInfoForRegion:v7];
    [(RouteLibraryCell *)self setOfflineSubscription:v6];
  }
  else
  {
    [(RouteLibraryCell *)self setOfflineSubscription:0];
  }
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)RouteLibraryCell;
  [(RouteLibraryCell *)&v4 prepareForReuse];
  cacheKey = self->_cacheKey;
  self->_cacheKey = 0;

  [(UIImageView *)self->_snapshotImageView setImage:0];
  [(UIImageView *)self->_snapshotImageView setAlpha:0.0];
  [(UIImageView *)self->_placeholderImageView setAlpha:1.0];
}

- (void)setRouteData:(id)a3 delegate:(id)a4 userInterfaceStyle:(int64_t)a5 inWidth:(double)a6
{
  id v10 = a3;
  objc_storeStrong((id *)&self->_routeData, a3);
  id v11 = a4;
  objc_storeWeak((id *)&self->_delegate, v11);

  id v12 = [v10 userProvidedName];
  [(UILabel *)self->_titleLabel setText:v12];

  unsigned int v13 = [v10 isAvailableForCurrentCountry];
  if ([v10 transportType] == 2)
  {
    id v14 = +[UIImageSymbolConfiguration configurationWithPointSize:8 weight:2 scale:12.0];
    uint64_t v15 = +[UIImage systemImageNamed:@"figure.walk" withConfiguration:v14];
    v16 = [v15 imageWithRenderingMode:2];
  }
  else
  {
    v16 = 0;
  }
  [(UIImageView *)self->_transportTypeImageView setImage:v16];

  if (v13)
  {
    if (a5 == 2)
    {
      v17 = +[UIColor whiteColor];
      [(UIImageView *)self->_transportTypeImageView setTintColor:v17];

LABEL_8:
      uint64_t v19 = +[UIColor tertiarySystemBackgroundColor];
      goto LABEL_11;
    }
    long long v20 = +[UIColor systemBlueColor];
    [(UIImageView *)self->_transportTypeImageView setTintColor:v20];
  }
  else
  {
    v18 = +[UIColor secondaryLabelColor];
    [(UIImageView *)self->_transportTypeImageView setTintColor:v18];

    if (a5 == 2) {
      goto LABEL_8;
    }
  }
  uint64_t v19 = +[UIColor systemWhiteColor];
LABEL_11:
  long long v21 = (void *)v19;
  [(UIView *)self->_transportTypeContainerView setBackgroundColor:v19];

  if (v13) {
    +[UIColor labelColor];
  }
  else {
  long long v22 = +[UIColor secondaryLabelColor];
  }
  [(UILabel *)self->_titleLabel setTextColor:v22];

  v34[0] = NSFontAttributeName;
  long long v23 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
  v35[0] = v23;
  v34[1] = NSForegroundColorAttributeName;
  if (v13) {
    +[UIColor secondaryLabelColor];
  }
  else {
  long long v24 = +[UIColor tertiaryLabelColor];
  }
  v35[1] = v24;
  long long v25 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];

  long long v26 = [v10 addressStringWithAttributes:v25];
  [(UILabel *)self->_addressLabel setAttributedText:v26];

  v27 = [v10 distanceAndElevationDescriptionStringWithAttributes:v25];
  [(MapsThemeMultiPartLabel *)self->_descriptionLabel setMultiPartString:v27];

  v28 = [v10 userProvidedNotes];
  id v29 = [v28 length];

  if (v29)
  {
    double v30 = +[NSBundle mainBundle];
    uint64_t v31 = [v30 localizedStringForKey:@"[Route Creation] Notes Quotes" value:@"localized string not found" table:0];
    id v32 = [v10 userProvidedNotes];
    v33 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v31, v32);
    [(MapsFadingLabel *)self->_notesLabel setText:v33];
  }
  else
  {
    [(MapsFadingLabel *)self->_notesLabel setText:0];
  }
  [(RouteLibraryCell *)self _updateMenu];
}

- (void)setSnapshotWithRouteData:(id)a3 scale:(double)a4 userInterfaceStyle:(int64_t)a5
{
  id v8 = a3;
  id v9 = objc_alloc((Class)MURouteSnapshotKey);
  id v10 = [v8 storageID];
  id v11 = [v9 initWithIdentifier:v10 width:a5 == 2 height:64.0 scale:64.0 padding:a4 darkMode:10.0 10.0 10.0 10.0];

  if (([(MURouteSnapshotKey *)self->_cacheKey isEqual:v11] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_cacheKey, v11);
    id v12 = +[MURouteSnapshotManager sharedInstance];
    unsigned int v13 = [v12 checkCacheForKey:v11];

    [(RouteLibraryCell *)self _setImageForSnapshot:v13];
    if (!v13)
    {
      id v14 = [objc_alloc((Class)GEORouteBuilder_PersistentData) initWithPersistentData:v8];
      uint64_t v15 = [v14 buildRoute];
      v16 = +[MURouteSnapshotManager sharedInstance];
      v17 = _NSConcreteStackBlock;
      uint64_t v18 = 3221225472;
      uint64_t v19 = sub_10062CA38;
      long long v20 = &unk_1012F25F8;
      long long v21 = self;
      id v22 = v11;
      [v16 getSnapshotForKey:v22 route:v15 completion:&v17];
    }
  }
  [(RouteLibraryCell *)self _refreshOfflineSubscription];
}

- (void)_setImageForSnapshot:(id)a3
{
  uint64_t v5 = -[RouteLibraryCell _greyScaleImageIfNeeded:](self, "_greyScaleImageIfNeeded:");
  [(UIImageView *)self->_snapshotImageView setImage:v5];

  if (a3) {
    double v6 = 1.0;
  }
  else {
    double v6 = 0.0;
  }
  if (a3) {
    double v7 = 0.0;
  }
  else {
    double v7 = 1.0;
  }
  [(UIImageView *)self->_snapshotImageView setAlpha:v6];
  placeholderImageView = self->_placeholderImageView;

  [(UIImageView *)placeholderImageView setAlpha:v7];
}

- (id)_greyScaleImageIfNeeded:(id)a3
{
  id v4 = a3;
  if ([(GEOComposedGeometryRoutePersistentData *)self->_routeData isAvailableForCurrentCountry])
  {
    id v5 = v4;
  }
  else
  {
    double v6 = +[UIColor grayColor];
    [v4 _maps_colorMonochromeImageWithColor:v6];
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (void)_pressedDelete
{
  id v3 = [(RouteLibraryCell *)self delegate];
  [v3 cell:self didSelectDeleteRouteData:self->_routeData];
}

- (void)_pressedEdit
{
  id v3 = [(RouteLibraryCell *)self delegate];
  [v3 cell:self didSelectEditRouteData:self->_routeData];
}

- (void)_pressedDirections
{
  id v3 = [(RouteLibraryCell *)self delegate];
  [v3 cell:self didSelectDirectionsRouteData:self->_routeData];
}

- (void)_pressedMore
{
  id v3 = [(RouteLibraryCell *)self delegate];
  [v3 cell:self didSelectViewMoreNotesForRouteData:self->_routeData];
}

- (void)_pressedDownload
{
  id v3 = [(RouteLibraryCell *)self delegate];
  [v3 cell:self didSelectDownloadRouteData:self->_routeData];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_1015E79C0 == a6)
  {
    [(RouteLibraryCell *)self _updateMenu];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)RouteLibraryCell;
    -[RouteLibraryCell observeValueForKeyPath:ofObject:change:context:](&v6, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (void)fadingLabelTruncationChanged:(id)a3
{
  uint64_t v4 = [a3 isTruncated] ^ 1;
  moreButton = self->_moreButton;

  [(UIButton *)moreButton setHidden:v4];
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  if (a3.var0 == MapsConfig_RouteCreationAvailable && a3.var1 == off_1015F1498) {
    [(RouteLibraryCell *)self _updateMenu];
  }
}

- (GEOComposedGeometryRoutePersistentData)routeData
{
  return self->_routeData;
}

- (RouteLibraryCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RouteLibraryCellDelegate *)WeakRetained;
}

- (MapDataSubscriptionInfo)offlineSubscription
{
  return self->_offlineSubscription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offlineSubscription, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_routeData, 0);
  objc_storeStrong((id *)&self->_offlineDownloadConstraints, 0);
  objc_storeStrong((id *)&self->_noOfflineDownloadConstraints, 0);
  objc_storeStrong((id *)&self->_offlineDownloadStateView, 0);
  objc_storeStrong((id *)&self->_downloadAction, 0);
  objc_storeStrong((id *)&self->_menu, 0);
  objc_storeStrong((id *)&self->_cacheKey, 0);
  objc_storeStrong((id *)&self->_menuButton, 0);
  objc_storeStrong((id *)&self->_moreButtonBottomConstraint, 0);
  objc_storeStrong((id *)&self->_moreButton, 0);
  objc_storeStrong((id *)&self->_notesLabel, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_addressLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_transportTypeContainerView, 0);
  objc_storeStrong((id *)&self->_textContainerView, 0);
  objc_storeStrong((id *)&self->_transportTypeImageView, 0);
  objc_storeStrong((id *)&self->_placeholderImageView, 0);

  objc_storeStrong((id *)&self->_snapshotImageView, 0);
}

@end