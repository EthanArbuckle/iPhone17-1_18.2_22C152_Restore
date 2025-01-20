@interface NavTrayHeaderView
- (BOOL)_alternateButtonTypeContains:(unint64_t)a3;
- (BOOL)_isArrivalState;
- (BOOL)_isParkingRouteState;
- (BOOL)_isResumeRouteState;
- (BOOL)_shouldPostBacklightSceneRequiresUpdateNotification:(id)a3;
- (BOOL)isExpanded;
- (BOOL)showFeedbackView;
- (GuidanceETA)ETA;
- (NSString)destinationName;
- (NavTrayHeaderView)initWithDelegate:(id)a3 metrics:(id)a4;
- (NavTrayHeaderViewDelegate)delegate;
- (UIView)hairlineView;
- (int64_t)_textAlignmentForCurrentLanguage;
- (int64_t)arrivalState;
- (unint64_t)alternateButtonTypes;
- (unint64_t)currentAlternateButtonType;
- (unint64_t)state;
- (void)_pressedHeaderView;
- (void)_updateContentAndReloadStackView:(BOOL)a3;
- (void)_updateFonts;
- (void)_updateLayout;
- (void)_updateTextAlignment;
- (void)applyArrivalState;
- (void)applyArrivalStateAndReloadStackView:(BOOL)a3;
- (void)clearAnimations;
- (void)resetContent;
- (void)setAlternateButtonTypes:(unint64_t)a3;
- (void)setArrivalState:(int64_t)a3;
- (void)setDestinationName:(id)a3;
- (void)setETA:(id)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setShowFeedbackView:(BOOL)a3;
- (void)showRecalculating;
- (void)stackViewDidChangeLayout:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation NavTrayHeaderView

- (NavTrayHeaderView)initWithDelegate:(id)a3 metrics:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v213.receiver = self;
  v213.super_class = (Class)NavTrayHeaderView;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v11 = -[NavTrayHeaderView initWithFrame:](&v213, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  if (v11)
  {
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = v210 = v11;
    [(NavTrayHeaderView *)v210 setAccessibilityIdentifier:v13];

    objc_storeWeak((id *)&v210->_delegate, v6);
    objc_storeStrong((id *)&v210->_metrics, a4);
    uint64_t v14 = +[UIFont _maps_fontProviderWeight:UIContentSizeCategoryLarge minimumPointSize:UIContentSizeCategoryExtraExtraExtraLarge minimumSizeCategory:UIFontWeightBold maximumPointSize:25.0 maximumSizeCategory:33.0];
    id minimizedValueFontProvider = v210->_minimizedValueFontProvider;
    v210->_id minimizedValueFontProvider = (id)v14;

    [(NavTrayHeaderView *)v210 setUserInteractionEnabled:1];
    id v205 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v210 action:"_pressedHeaderView"];
    [(NavTrayHeaderView *)v210 addGestureRecognizer:v205];
    id v16 = objc_alloc((Class)UIImageView);
    +[UIImage imageNamed:@"NavTrayChevron"];
    v17 = id v206 = v6;
    v18 = (UIImageView *)[v16 initWithImage:v17];
    chevronImageView = v210->_chevronImageView;
    v210->_chevronImageView = v18;

    [(UIImageView *)v210->_chevronImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v210->_chevronImageView setContentMode:1];
    [(UIImageView *)v210->_chevronImageView setAccessibilityIdentifier:@"ChevronImageView"];
    [(NavTrayHeaderView *)v210 addSubview:v210->_chevronImageView];
    v211[0] = _NSConcreteStackBlock;
    v211[1] = 3221225472;
    v211[2] = sub_100606178;
    v211[3] = &unk_1012F2260;
    v20 = v210;
    v212 = v20;
    v21 = objc_retainBlock(v211);
    v22 = (void (**)(char *, float))(v21 + 16);
    v23 = v21;
    v204 = v21;
    uint64_t v24 = (*((void (**)(float))v21 + 2))(750.0);
    id v209 = v7;
    id v25 = v20[7];
    v20[7] = (id)v24;

    uint64_t v26 = (*v22)(v23, 999.0);
    id v27 = v20[8];
    v20[8] = (id)v26;

    uint64_t v28 = (*v22)(v23, 999.0);
    id v29 = v20[9];
    v20[9] = (id)v28;

    uint64_t v30 = (*v22)(v23, 999.0);
    id v31 = v20[10];
    v20[10] = (id)v30;

    v32 = +[GuidanceETA defaultArrivalString];
    v33 = [v20[7] bottomLabel];
    [v33 setText:v32];

    v34 = +[GuidanceETA defaultBatteryOnArrivalString];
    v35 = [v20[10] bottomLabel];
    [v35 setText:v34];

    [v20[7] setAccessibilityIdentifier:@"ArrivalLabel"];
    [v20[8] setAccessibilityIdentifier:@"TimeLabel"];
    [v20[9] setAccessibilityIdentifier:@"DistanceLabel"];
    [v20[10] setAccessibilityIdentifier:@"BatteryLabel"];
    [v20 _updateTextAlignment];
    id v36 = objc_alloc((Class)UIStackView);
    v216[0] = v20[7];
    v216[1] = v20[8];
    v216[2] = v20[9];
    v37 = +[NSArray arrayWithObjects:v216 count:3];
    id v38 = [v36 initWithArrangedSubviews:v37];
    id v39 = v20[4];
    v20[4] = v38;

    [v20[4] setTranslatesAutoresizingMaskIntoConstraints:0];
    [v20[4] setAxis:0];
    [v20[4] setDistribution:2];
    [v20[4] setAlignment:1];
    [v7 minimizedValueInterLabelPadding];
    [v20[4] setSpacing:];
    LODWORD(v40) = 1148846080;
    [v20[4] setContentHuggingPriority:0 forAxis:v40];
    [v20[4] setAccessibilityIdentifier:@"MinimizedStackView"];
    [v20 addSubview:v20[4]];
    v41 = -[MapsFadingLabel initWithFrame:]([MapsFadingLabel alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    id v42 = v20[11];
    v20[11] = v41;

    [v20[11] setTranslatesAutoresizingMaskIntoConstraints:0];
    [v20[11] setNumberOfLines:1];
    v43 = [(NavTrayMetrics *)v210->_metrics expandedTextColor];
    [v20[11] setTextColor:v43];

    LODWORD(v44) = 1148846080;
    [v20[11] setContentHuggingPriority:1 forAxis:v44];
    [v20[11] setAccessibilityIdentifier:@"ExpandedTitleLabel"];
    [v20 addSubview:v20[11]];
    uint64_t v45 = objc_opt_new();
    id v46 = v20[12];
    v20[12] = (id)v45;

    [v20[12] setTranslatesAutoresizingMaskIntoConstraints:0];
    [v20[12] setAlpha:0.0];
    [v20[12] setAccessibilityIdentifier:@"ArrivedContainerView"];
    [v20 addSubview:v20[12]];
    uint64_t v47 = objc_opt_new();
    id v48 = v20[13];
    v20[13] = (id)v47;

    [v20[13] setTranslatesAutoresizingMaskIntoConstraints:0];
    [v20[13] setUserInteractionEnabled:0];
    [v20[13] setAccessibilityIdentifier:@"ArrivedHeaderView"];
    [v20[12] addSubview:v20[13]];
    uint64_t v49 = objc_opt_new();
    id v50 = v20[14];
    v20[14] = (id)v49;

    [v20[14] setTranslatesAutoresizingMaskIntoConstraints:0];
    [v20[14] setAccessibilityIdentifier:@"ArrivedTitleLabel"];
    [v20[14] setTextAlignment:1];
    [v20[13] addSubview:v20[14]];
    v51 = -[MapsFadingLabel initWithFrame:]([MapsFadingLabel alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    id v52 = v20[15];
    v20[15] = v51;

    [v20[15] setTranslatesAutoresizingMaskIntoConstraints:0];
    [v20[15] setAccessibilityIdentifier:@"ArrivedSubtitleLabel"];
    v53 = +[UIColor secondaryLabelColor];
    [v20[15] setTextColor:v53];

    [v20[15] setNumberOfLines:2];
    [v20[15] setTextAlignment:1];
    [v20[13] addSubview:v20[15]];
    v54 = [NavTrayFeedbackView alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&v210->_delegate);
    v56 = [(NavTrayFeedbackView *)v54 initWithDelegate:WeakRetained];
    id v57 = v20[16];
    v20[16] = v56;

    [v20[16] setTranslatesAutoresizingMaskIntoConstraints:0];
    [v20[12] addSubview:v20[16]];
    [v20[16] setAccessibilityIdentifier:@"FeedbackView"];
    uint64_t v58 = objc_opt_new();
    id v59 = v20[18];
    v20[18] = (id)v58;

    [v20[18] setTranslatesAutoresizingMaskIntoConstraints:0];
    v60 = [v20 delegate];
    [v60 styleButton:v20[18] ofType:4];

    LODWORD(v61) = 1148846080;
    [v20[18] setContentCompressionResistancePriority:1 forAxis:v61];
    [v20[18] setAccessibilityIdentifier:@"AlternativeActionButton"];
    uint64_t v62 = objc_opt_new();
    id v63 = v20[17];
    v20[17] = (id)v62;

    [v20[17] setTranslatesAutoresizingMaskIntoConstraints:0];
    v64 = [v20 delegate];
    [v64 styleButton:v20[17] ofType:1];

    LODWORD(v65) = 1148846080;
    [v20[17] setContentCompressionResistancePriority:1 forAxis:v65];
    [v20[17] setAccessibilityIdentifier:@"EndButton"];
    v66 = [AxisAdjustingStackView alloc];
    id v215 = v20[17];
    v67 = +[NSArray arrayWithObjects:&v215 count:1];
    v68 = [(AxisAdjustingStackView *)v66 initWithArrangedTruncatableSubviews:v67];
    id v69 = v20[5];
    v20[5] = v68;

    [v20[5] setDelegate:v20];
    [v20[5] setTranslatesAutoresizingMaskIntoConstraints:0];
    [v20[5] setDistribution:1];
    [v20[5] setAlignment:0];
    [(NavTrayMetrics *)v210->_metrics actionButtonInterButtonPadding];
    [v20[5] setSpacing:];
    [v20[5] setAccessibilityIdentifier:@"EndRouteButtonStackView"];
    [v20[12] addSubview:v20[5]];
    uint64_t v70 = objc_opt_new();
    id v71 = v20[26];
    v20[26] = (id)v70;

    [v20[26] setTranslatesAutoresizingMaskIntoConstraints:0];
    [v20[26] setHidden:1];
    [v20 addSubview:v20[26]];
    v72 = [v20[12] topAnchor];
    v73 = [v20 topAnchor];
    [(NavTrayMetrics *)v210->_metrics defaultVerticalPadding];
    uint64_t v74 = [v72 constraintEqualToAnchor:v73];
    id v75 = v20[19];
    v20[19] = (id)v74;

    v76 = [v20[5] topAnchor];
    v77 = [v20[16] bottomAnchor];
    [(NavTrayMetrics *)v210->_metrics actionButtonInterButtonPadding];
    uint64_t v78 = [v76 constraintEqualToAnchor:v77];
    id v79 = v20[20];
    v20[20] = (id)v78;

    v80 = [v20[5] topAnchor];
    v81 = [v20[13] bottomAnchor];
    [(NavTrayMetrics *)v210->_metrics defaultVerticalPadding];
    uint64_t v82 = [v80 constraintEqualToAnchor:v81];
    id v83 = v20[21];
    v20[21] = (id)v82;

    LODWORD(v84) = 1144750080;
    [v20[21] setPriority:v84];
    v85 = [v20[11] bottomAnchor];
    v86 = [v20 bottomAnchor];
    [(NavTrayMetrics *)v210->_metrics minimizedHeaderVerticalPadding];
    uint64_t v88 = [v85 constraintEqualToAnchor:v86 constant:-v87];
    id v89 = v20[22];
    v20[22] = (id)v88;

    v90 = [v20[4] bottomAnchor];
    v91 = [v20 bottomAnchor];
    [(NavTrayMetrics *)v210->_metrics defaultVerticalPadding];
    uint64_t v93 = [v90 constraintEqualToAnchor:v91 constant:-v92];
    id v94 = v20[23];
    v20[23] = (id)v93;

    v203 = [(UIImageView *)v210->_chevronImageView trailingAnchor];
    v202 = [v20 trailingAnchor];
    [(NavTrayMetrics *)v210->_metrics minimizedHeaderHorizontalPadding];
    v201 = [v203 constraintEqualToAnchor:v202 constant:-v95];
    v214[0] = v201;
    v200 = [(UIImageView *)v210->_chevronImageView centerYAnchor];
    v199 = [v20 centerYAnchor];
    v198 = [v200 constraintEqualToAnchor:v199];
    v214[1] = v198;
    v197 = [(UIImageView *)v210->_chevronImageView widthAnchor];
    [(NavTrayMetrics *)v210->_metrics expandCollapseImageSize];
    v196 = [v197 constraintEqualToConstant:];
    v214[2] = v196;
    v195 = [(UIImageView *)v210->_chevronImageView heightAnchor];
    [(NavTrayMetrics *)v210->_metrics expandCollapseImageSize];
    v194 = [v195 constraintEqualToConstant:v96];
    v214[3] = v194;
    v193 = [v20[11] leadingAnchor];
    v192 = [v20 leadingAnchor];
    [(NavTrayMetrics *)v210->_metrics minimizedHeaderHorizontalPadding];
    v191 = [v193 constraintEqualToAnchor:v192];
    v214[4] = v191;
    v190 = [v20[11] trailingAnchor];
    v189 = [(UIImageView *)v210->_chevronImageView leadingAnchor];
    [(NavTrayMetrics *)v210->_metrics defaultHorizontalPadding];
    v187 = [v190 constraintEqualToAnchor:v189 constant:-v97];
    v214[5] = v187;
    v186 = [v20[11] topAnchor];
    v185 = [v20 topAnchor];
    [(NavTrayMetrics *)v210->_metrics minimizedHeaderVerticalPadding];
    v184 = [v186 constraintEqualToAnchor:v185];
    v214[6] = v184;
    v183 = [v20[4] leadingAnchor];
    v182 = [v20 leadingAnchor];
    [(NavTrayMetrics *)v210->_metrics minimizedHeaderHorizontalPadding];
    v181 = [v183 constraintEqualToAnchor:v182];
    v214[7] = v181;
    v178 = [v20[4] trailingAnchor];
    v188 = [(UIImageView *)v210->_chevronImageView leadingAnchor];
    [(NavTrayMetrics *)v210->_metrics minimizedHeaderHorizontalPadding];
    v177 = [v178 constraintLessThanOrEqualToAnchor:v188 constant:-v98];
    v214[8] = v177;
    v207 = [v20[4] topAnchor];
    v176 = [v20 topAnchor];
    [(NavTrayMetrics *)v210->_metrics defaultVerticalPadding];
    v175 = [v207 constraintEqualToAnchor:v176];
    v214[9] = v175;
    v174 = [v20[12] leadingAnchor];
    v173 = [v20 leadingAnchor];
    [(NavTrayMetrics *)v210->_metrics defaultHorizontalPadding];
    v172 = [v174 constraintEqualToAnchor:v173];
    v214[10] = v172;
    v171 = [v20[12] trailingAnchor];
    v170 = [v20 trailingAnchor];
    [(NavTrayMetrics *)v210->_metrics defaultHorizontalPadding];
    v169 = [v171 constraintEqualToAnchor:v170 constant:-v99];
    v214[11] = v169;
    v168 = [v20[12] bottomAnchor];
    v167 = [v20 bottomAnchor];
    v165 = [v168 constraintLessThanOrEqualToAnchor:v167];
    v214[12] = v165;
    v164 = [v20[13] topAnchor];
    v163 = [v20[12] topAnchor];
    v162 = [v164 constraintEqualToAnchor:v163];
    v214[13] = v162;
    v160 = [v20[13] leadingAnchor];
    v159 = [v20[12] leadingAnchor];
    [(NavTrayMetrics *)v210->_metrics arrivedTitleContainerHorizontalPadding];
    v158 = [v160 constraintEqualToAnchor:v159];
    v214[14] = v158;
    v157 = [v20[13] trailingAnchor];
    v156 = [v20[12] trailingAnchor];
    [(NavTrayMetrics *)v210->_metrics arrivedTitleContainerHorizontalPadding];
    v155 = [v157 constraintEqualToAnchor:v156 constant:-v100];
    v214[15] = v155;
    v154 = [v20[14] topAnchor];
    v153 = [v20[13] topAnchor];
    v152 = [v154 constraintEqualToAnchor:v153];
    v214[16] = v152;
    v151 = [v20[14] leadingAnchor];
    v150 = [v20[13] leadingAnchor];
    v149 = [v151 constraintEqualToAnchor:v150];
    v214[17] = v149;
    v148 = [v20[14] trailingAnchor];
    v147 = [v20[13] trailingAnchor];
    v146 = [v148 constraintEqualToAnchor:v147];
    v214[18] = v146;
    v145 = [v20[15] topAnchor];
    v180 = [v20[14] bottomAnchor];
    v144 = [v145 constraintEqualToAnchor:v180 constant:2.0];
    v214[19] = v144;
    v143 = [v20[15] leadingAnchor];
    v142 = [v20[13] leadingAnchor];
    v141 = [v143 constraintEqualToAnchor:v142];
    v214[20] = v141;
    v140 = [v20[15] trailingAnchor];
    v139 = [v20[13] trailingAnchor];
    v138 = [v140 constraintEqualToAnchor:v139];
    v214[21] = v138;
    v179 = [v20[15] bottomAnchor];
    v137 = [v20[13] bottomAnchor];
    v136 = [v179 constraintEqualToAnchor:v137];
    v214[22] = v136;
    v135 = [v20[16] heightAnchor];
    [(NavTrayMetrics *)v210->_metrics feedbackButtonHeight];
    v134 = [v135 constraintGreaterThanOrEqualToConstant:];
    v214[23] = v134;
    v133 = [v20[16] topAnchor];
    v132 = [v20[13] bottomAnchor];
    [(NavTrayMetrics *)v210->_metrics defaultVerticalPadding];
    v131 = [v133 constraintEqualToAnchor:v132];
    v214[24] = v131;
    v130 = [v20[16] leadingAnchor];
    v129 = [v20[12] leadingAnchor];
    v128 = [v130 constraintEqualToAnchor:v129];
    v214[25] = v128;
    location = [v20[16] trailingAnchor];
    v127 = [v20[12] trailingAnchor];
    v126 = [location constraintEqualToAnchor:v127];
    v214[26] = v126;
    v125 = [v20[5] heightAnchor];
    [(NavTrayMetrics *)v210->_metrics endButtonHeight];
    v124 = [v125 constraintGreaterThanOrEqualToConstant:];
    v214[27] = v124;
    v214[28] = v20[20];
    v214[29] = v20[21];
    v166 = [v20[5] leadingAnchor];
    v161 = [v20[12] leadingAnchor];
    v123 = [v166 constraintEqualToAnchor:v161];
    v214[30] = v123;
    v122 = [v20[5] trailingAnchor];
    v121 = [v20[12] trailingAnchor];
    v120 = [v122 constraintEqualToAnchor:v121];
    v214[31] = v120;
    v119 = [v20[5] bottomAnchor];
    v118 = [v20[12] bottomAnchor];
    [(NavTrayMetrics *)v210->_metrics actionButtonBottomPadding];
    v117 = [v119 constraintEqualToAnchor:v118 constant:-v101];
    v214[32] = v117;
    v116 = [v20[26] leadingAnchor];
    v115 = [v20 leadingAnchor];
    v114 = [v116 constraintEqualToAnchor:v115];
    v214[33] = v114;
    v113 = [v20[26] trailingAnchor];
    v112 = [v20 trailingAnchor];
    v102 = [v113 constraintEqualToAnchor:v112];
    v214[34] = v102;
    v103 = [v20[26] bottomAnchor];
    v104 = [v20 bottomAnchor];
    v105 = [v103 constraintEqualToAnchor:v104];
    v214[35] = v105;
    v106 = [v20[17] heightAnchor];
    [(NavTrayMetrics *)v210->_metrics endButtonHeight];
    v107 = [v106 constraintEqualToConstant:];
    v214[36] = v107;
    v108 = [v20[18] heightAnchor];
    [(NavTrayMetrics *)v210->_metrics endButtonHeight];
    v109 = [v108 constraintEqualToConstant:];
    v214[37] = v109;
    v110 = +[NSArray arrayWithObjects:v214 count:38];
    +[NSLayoutConstraint activateConstraints:v110];

    v11 = v210;
    id v7 = v209;

    id v6 = v206;
    [v20 _updateFonts];
    [v20 _updateLayout];
    [v20 _updateContentAndReloadStackView:0];
  }
  return v11;
}

- (void)setETA:(id)a3
{
  id v5 = a3;
  unint64_t v6 = self->_ETA;
  unint64_t v7 = (unint64_t)v5;
  if (v7 | v6)
  {
    id v15 = (id)v7;
    unsigned __int8 v8 = [(id)v6 isEqual:v7];

    unint64_t v7 = (unint64_t)v15;
    if ((v8 & 1) == 0)
    {
      v9 = [(NavTrayStackedLabel *)self->_batteryLabel superview];
      BOOL v10 = v9 != 0;

      v11 = [v15 arrivalBatteryCharge];
      BOOL v12 = v11 != 0;

      uint64_t v13 = v10 ^ v12;
      objc_storeStrong((id *)&self->_ETA, a3);
      if (v15)
      {
        self->_isRerouting = 0;
        self->_hasReceivedGuidance = 1;
        uint64_t v14 = [v15 arrivalBatteryCharge];
        self->_isInEVMode = v14 != 0;
      }
      [(NavTrayHeaderView *)self applyArrivalStateAndReloadStackView:v13];
      unint64_t v7 = (unint64_t)v15;
    }
  }
}

- (void)setExpanded:(BOOL)a3
{
  if (self->_expanded != a3)
  {
    self->_expanded = a3;
    v3[4] = self;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1006064BC;
    v4[3] = &unk_1012E5D08;
    v4[4] = self;
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100606504;
    v3[3] = &unk_1012E7D28;
    +[UIView animateWithDuration:v4 animations:v3 completion:0.25];
  }
}

- (unint64_t)state
{
  if ([(NavTrayHeaderView *)self _isArrivalState]
    || [(NavTrayHeaderView *)self _isResumeRouteState])
  {
    return 3;
  }
  if (self->_isRerouting) {
    return 2;
  }
  return self->_hasReceivedGuidance;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NavTrayHeaderView;
  [(NavTrayHeaderView *)&v14 traitCollectionDidChange:v4];
  id v5 = [(NavTrayHeaderView *)self traitCollection];
  unint64_t v6 = [v5 preferredContentSizeCategory];
  unint64_t v7 = [v4 preferredContentSizeCategory];
  uint64_t v8 = sub_1000E93B0(v6, v7);

  if (v8)
  {
    [(NavTrayHeaderView *)self applyArrivalState];
    [(NavTrayHeaderView *)self _updateFonts];
  }
  v9 = [(NavTrayHeaderView *)self traitCollection];
  int v10 = sub_100045060(v4, v9);

  if (v10)
  {
    v11 = [(NavTrayHeaderView *)self traitCollection];
    id v12 = [v11 isLuminanceReduced];

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100606708;
    v13[3] = &unk_1012E5D08;
    v13[4] = self;
    +[UIView _maps_animateForAndromeda:v12 animations:v13];
  }
}

- (void)_updateFonts
{
  id minimizedValueFontProvider = (void (**)(id, void *))self->_minimizedValueFontProvider;
  id v4 = [(NavTrayHeaderView *)self traitCollection];
  minimizedValueFontProvider[2](minimizedValueFontProvider, v4);
  id v31 = (id)objc_claimAutoreleasedReturnValue();

  id v5 = [(NavTrayMetrics *)self->_metrics minimizedTitleTextStyle];
  [(NavTrayMetrics *)self->_metrics minimizedTitleFontWeight];
  double v7 = v6;
  uint64_t v8 = [(NavTrayHeaderView *)self traitCollection];
  v9 = [v8 _maps_traitCollectionWithMaximumContentSizeCategory:UIContentSizeCategoryExtraExtraExtraLarge];
  int v10 = +[UIFont _maps_fontWithTextStyle:v5 weight:v9 compatibleWithTraitCollection:v7];

  v11 = [(NavTrayMetrics *)self->_metrics expandedTitleTextStyle];
  [(NavTrayMetrics *)self->_metrics expandedTitleFontWeight];
  double v13 = v12;
  objc_super v14 = [(NavTrayHeaderView *)self traitCollection];
  id v15 = [v14 _maps_traitCollectionWithMaximumContentSizeCategory:UIContentSizeCategoryAccessibilityLarge];
  id v16 = +[UIFont _maps_fontWithTextStyle:v11 weight:v15 compatibleWithTraitCollection:v13];

  v17 = [(NavTrayHeaderView *)self traitCollection];
  v18 = [v17 _maps_traitCollectionWithMaximumContentSizeCategory:UIContentSizeCategoryExtraExtraExtraLarge];
  v19 = +[UIFont _maps_fontWithTextStyle:UIFontTextStyleTitle1 weight:v18 compatibleWithTraitCollection:UIFontWeightBold];

  v20 = [(NavTrayHeaderView *)self traitCollection];
  v21 = [v20 _maps_traitCollectionWithMaximumContentSizeCategory:UIContentSizeCategoryExtraExtraExtraLarge];
  v22 = +[UIFont _maps_fontWithTextStyle:UIFontTextStyleTitle3 weight:v21 compatibleWithTraitCollection:UIFontWeightRegular];

  v23 = [(NavTrayStackedLabel *)self->_minimizedArrivalLabel topLabel];
  [v23 setFont:v31];

  uint64_t v24 = [(NavTrayStackedLabel *)self->_minimizedArrivalLabel bottomLabel];
  [v24 setFont:v10];

  id v25 = [(NavTrayStackedLabel *)self->_timeLabel topLabel];
  [v25 setFont:v31];

  uint64_t v26 = [(NavTrayStackedLabel *)self->_timeLabel bottomLabel];
  [v26 setFont:v10];

  id v27 = [(NavTrayStackedLabel *)self->_distanceLabel topLabel];
  [v27 setFont:v31];

  uint64_t v28 = [(NavTrayStackedLabel *)self->_distanceLabel bottomLabel];
  [v28 setFont:v10];

  id v29 = [(NavTrayStackedLabel *)self->_batteryLabel topLabel];
  [v29 setFont:v31];

  uint64_t v30 = [(NavTrayStackedLabel *)self->_batteryLabel bottomLabel];
  [v30 setFont:v10];

  [(MapsFadingLabel *)self->_expandedTitleLabel setFont:v16];
  [(UILabel *)self->_arrivedTitleLabel setFont:v19];
  [(MapsFadingLabel *)self->_arrivedSubtitleLabel setFont:v22];
}

- (int64_t)_textAlignmentForCurrentLanguage
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 preferredLocalizations];
  id v4 = [v3 firstObject];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [&off_1013ADC98 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    int64_t v8 = 2;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(&off_1013ADC98);
      }
      if ([v4 hasPrefix:*(void *)(*((void *)&v11 + 1) + 8 * v9)]) {
        break;
      }
      if (v6 == (id)++v9)
      {
        id v6 = [&off_1013ADC98 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    int64_t v8 = 4;
  }

  return v8;
}

- (void)_updateContentAndReloadStackView:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_100607954();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    double v101 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Updating content", buf, 0xCu);
  }

  if (v3)
  {
    if (self->_isInEVMode)
    {
      batteryLabel = self->_batteryLabel;
      v109[0] = self->_minimizedArrivalLabel;
      v109[1] = batteryLabel;
      uint64_t v7 = v109;
      uint64_t v8 = 2;
    }
    else
    {
      timeLabel = self->_timeLabel;
      v108[0] = self->_minimizedArrivalLabel;
      v108[1] = timeLabel;
      v108[2] = self->_distanceLabel;
      uint64_t v7 = v108;
      uint64_t v8 = 3;
    }
    int v10 = +[NSArray arrayWithObjects:v7 count:v8];
    [(UIStackView *)self->_minimizedStackView _maps_setArrangedSubviews:v10];
  }
  long long v11 = +[NSBundle mainBundle];
  long long v12 = [v11 localizedStringForKey:@"Route Options [Nav Tray Header]" value:@"localized string not found" table:0];
  [(MapsFadingLabel *)self->_expandedTitleLabel setText:v12];

  switch([(NavTrayHeaderView *)self state])
  {
    case 0uLL:
      long long v13 = sub_100607954();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134349056;
        double v101 = self;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[%{public}p] Configuring loading state", buf, 0xCu);
      }

      long long v14 = +[GuidanceETA invalidValueString];
      id v15 = [(NavTrayStackedLabel *)self->_minimizedArrivalLabel topLabel];
      [v15 setText:v14];

      id v16 = [(NavTrayStackedLabel *)self->_timeLabel topLabel];
      [v16 setText:v14];

      v17 = +[GuidanceETA defaultTimeUnit];
      v18 = [(NavTrayStackedLabel *)self->_timeLabel bottomLabel];
      [v18 setText:v17];

      v19 = +[GuidanceETA defaultTimeUnitAccessibility];
      v20 = [(NavTrayStackedLabel *)self->_timeLabel bottomLabel];
      [v20 setAccessibilityLabel:v19];

      v21 = [(NavTrayStackedLabel *)self->_distanceLabel topLabel];
      [v21 setText:v14];

      v22 = +[GuidanceETA defaultDistanceUnit];
      v23 = [(NavTrayStackedLabel *)self->_distanceLabel bottomLabel];
      [v23 setText:v22];

      uint64_t v24 = +[GuidanceETA defaultDistanceUnitAccessibility];
      id v25 = [(NavTrayStackedLabel *)self->_distanceLabel bottomLabel];
      [v25 setAccessibilityLabel:v24];

      uint64_t v26 = [(NavTrayStackedLabel *)self->_batteryLabel topLabel];
      [v26 setText:v14];
      goto LABEL_50;
    case 1uLL:
      id v27 = sub_100607954();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134349056;
        double v101 = self;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "[%{public}p] Configuring guidance state", buf, 0xCu);
      }

      long long v14 = [(NavTrayHeaderView *)self ETA];
      unsigned int v28 = [(NavTrayHeaderView *)self _shouldPostBacklightSceneRequiresUpdateNotification:v14];
      id v29 = [v14 arrivalTimeStringIncludingAMPMSymbols:0];
      uint64_t v30 = [(NavTrayStackedLabel *)self->_minimizedArrivalLabel topLabel];
      [v30 setText:v29];

      id v31 = [v14 arrivalTimeBottomString];
      v32 = [(NavTrayStackedLabel *)self->_minimizedArrivalLabel bottomLabel];
      [v32 setText:v31];

      v33 = [v14 timeValue];
      v34 = [(NavTrayStackedLabel *)self->_timeLabel topLabel];
      [v34 setText:v33];

      v35 = [v14 timeUnit];
      id v36 = [(NavTrayStackedLabel *)self->_timeLabel bottomLabel];
      [v36 setText:v35];

      v37 = [v14 timeUnitAccessibility];
      id v38 = [(NavTrayStackedLabel *)self->_timeLabel bottomLabel];
      [v38 setAccessibilityLabel:v37];

      id v39 = [v14 distanceValue];
      double v40 = [(NavTrayStackedLabel *)self->_distanceLabel topLabel];
      [v40 setText:v39];

      v41 = [v14 distanceUnit];
      id v42 = [(NavTrayStackedLabel *)self->_distanceLabel bottomLabel];
      [v42 setText:v41];

      v43 = [v14 distanceUnitAccessibility];
      double v44 = [(NavTrayStackedLabel *)self->_distanceLabel bottomLabel];
      [v44 setAccessibilityLabel:v43];

      uint64_t v45 = [(NavTrayStackedLabel *)self->_batteryLabel topLabel];
      id v46 = [v45 font];
      uint64_t v47 = [v14 batteryChargeStringWithFont:v46];
      id v48 = [(NavTrayStackedLabel *)self->_batteryLabel topLabel];
      [v48 setAttributedText:v47];

      if (!v28) {
        goto LABEL_51;
      }
      uint64_t v26 = +[NSNotificationCenter defaultCenter];
      [v26 postNotificationName:@"NavContainerShouldUpdateBacklightSceneEnvironmentNotification" object:self];
      goto LABEL_50;
    case 2uLL:
      uint64_t v49 = sub_100607954();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134349056;
        double v101 = self;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "[%{public}p] Configuring rerouting state", buf, 0xCu);
      }

      if ([(NavTrayHeaderView *)self isExpanded]) {
        goto LABEL_52;
      }
      long long v14 = [(NavTrayHeaderView *)self destinationName];
      [(MapsFadingLabel *)self->_expandedTitleLabel setText:v14];
      goto LABEL_51;
    case 3uLL:
      long long v14 = +[MNNavigationService sharedService];
      double v98 = [v14 route];
      id v50 = [v14 arrivalInfo];
      v51 = [v50 destination];
      unsigned int v52 = [v14 isArrivedAtEVCharger];
      v53 = [v14 arrivalChargingStationInfo];
      v54 = +[MNNavigationService sharedService];
      double v99 = [v54 activeNavTrayGuidanceEvent];

      v55 = sub_100607954();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        int64_t arrivalState = self->_arrivalState;
        id v57 = [v51 uniqueID];
        *(_DWORD *)buf = 134349826;
        double v101 = self;
        __int16 v102 = 2048;
        int64_t v103 = arrivalState;
        __int16 v104 = 2112;
        v105 = v57;
        __int16 v106 = 2112;
        v107 = v53;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "[%{public}p] Configuring arrived state: %ld with destination: %@, charging info: %@", buf, 0x2Au);
      }
      if (v52)
      {
        uint64_t v58 = sub_100607954();
        BOOL v59 = os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG);

        if (v59)
        {
          v60 = [v14 route];
          double v61 = [v60 legs];
          uint64_t v62 = [v61 objectAtIndex:[v50 legIndex]];

          id v63 = sub_100607954();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
          {
            v64 = [v51 chargingInfo];
            double v65 = [v62 chargingStationInfo];
            [v98 waypointDisplayInfoForWaypoint:v51];
            v66 = double v95 = v53;
            [v66 evChargingInfo];
            double v96 = v51;
            v68 = v67 = v50;
            *(_DWORD *)buf = 134349826;
            double v101 = self;
            __int16 v102 = 2112;
            int64_t v103 = (int64_t)v64;
            __int16 v104 = 2112;
            v105 = v65;
            __int16 v106 = 2112;
            v107 = v68;
            _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEBUG, "[%{public}p] EV Charging info from waypoint: %@, leg: %@, displayInfo: %@", buf, 0x2Au);

            id v50 = v67;
            v51 = v96;

            v53 = v95;
          }
        }
        [v53 chargingTime];
        double v97 = v50;
        if (v69 <= 0.0)
        {
          uint64_t v70 = +[NSBundle mainBundle];
          id v71 = [v70 localizedStringForKey:@"Charged [Nav Tray Header Title]" value:@"localized string not found" table:0];
          v76 = +[NSString stringWithFormat:v71];
          [(UILabel *)self->_arrivedTitleLabel setText:v76];
        }
        else
        {
          if (!v99)
          {
            v81 = +[NSBundle mainBundle];
            [v81 localizedStringForKey:@"Charging [Nav Tray Header Title]" value:@"localized string not found" table:0];
            v83 = uint64_t v82 = v53;
            [v82 batteryPercentageAfterCharging];
            v85 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v83, (uint64_t)v84);
            [(UILabel *)self->_arrivedTitleLabel setText:v85];

            v53 = v82;
            [v82 chargingTime];
            if (v86 > 0.0)
            {
LABEL_45:
              uint64_t v78 = +[NSBundle mainBundle];
              double v87 = [v78 localizedStringForKey:@"Charging [Nav Tray Header Subtitle]" value:@"localized string not found" table:0];
              uint64_t v88 = v53;
              [v53 chargingTime];
              v90 = +[NSString _navigation_stringWithSeconds:v89 abbreviated:1];
              v91 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v87, v90);
              [(MapsFadingLabel *)self->_arrivedSubtitleLabel setText:v91];

LABEL_47:
              v53 = v88;

              goto LABEL_48;
            }
LABEL_46:
            uint64_t v78 = +[NSBundle mainBundle];
            double v87 = [v78 localizedStringForKey:@"Charged [Nav Tray Header Subtitle]" value:@"localized string not found" table:0];
            +[MNNavigationService sharedService];
            v90 = uint64_t v88 = v53;
            double v92 = [v90 stopAfterCharging];
            uint64_t v93 = [v92 navDisplayName];
            id v94 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v87, v93);
            [(MapsFadingLabel *)self->_arrivedSubtitleLabel setText:v94];

            goto LABEL_47;
          }
          uint64_t v70 = [v99 title];
          id v71 = [v70 stringWithDefaultOptions];
          [(UILabel *)self->_arrivedTitleLabel setText:v71];
        }

        [v53 chargingTime];
        if (v77 > 0.0)
        {
          if (v99)
          {
            uint64_t v78 = [v99 detail];
            id v79 = [v78 stringWithDefaultOptions];
            [(MapsFadingLabel *)self->_arrivedSubtitleLabel setText:v79];

LABEL_48:
            uint64_t v26 = v98;
            id v50 = v97;
            goto LABEL_49;
          }
          goto LABEL_45;
        }
        goto LABEL_46;
      }
      int64_t v72 = self->_arrivalState;
      switch(v72)
      {
        case 1:
          v73 = +[NSBundle mainBundle];
          uint64_t v74 = v73;
          CFStringRef v75 = @"Arriving [Nav Tray Header]";
          goto LABEL_39;
        case 2:
          v73 = +[NSBundle mainBundle];
          uint64_t v74 = v73;
          CFStringRef v75 = @"Arrived [Nav Tray Header]";
          goto LABEL_39;
        case 3:
          v73 = +[NSBundle mainBundle];
          uint64_t v74 = v73;
          CFStringRef v75 = @"Parking [Nav Tray Header]";
          goto LABEL_39;
        case 4:
          v73 = +[NSBundle mainBundle];
          uint64_t v74 = v73;
          CFStringRef v75 = @"Parked [Nav Tray Header]";
LABEL_39:
          v80 = [v73 localizedStringForKey:v75 value:@"localized string not found" table:0];
          [(UILabel *)self->_arrivedTitleLabel setText:v80];

          int64_t v72 = self->_arrivalState;
          break;
        default:
          break;
      }
      uint64_t v26 = v98;
      if ((unint64_t)(v72 - 1) > 1) {
        [v51 parkingDisplayName];
      }
      else {
      uint64_t v78 = [v98 arrivalInstructionStringForLegIndex:[v50 legIndex]];
      }
      [(MapsFadingLabel *)self->_arrivedSubtitleLabel setText:v78];
LABEL_49:

LABEL_50:
LABEL_51:

LABEL_52:
      [(NavTrayStackedLabel *)self->_minimizedArrivalLabel invalidateIntrinsicContentSize];
      [(MapsFadingLabel *)self->_expandedTitleLabel invalidateIntrinsicContentSize];
      [(UILabel *)self->_arrivedTitleLabel invalidateIntrinsicContentSize];
      [(MapsFadingLabel *)self->_arrivedSubtitleLabel invalidateIntrinsicContentSize];
      [(NavTrayStackedLabel *)self->_timeLabel invalidateIntrinsicContentSize];
      [(NavTrayStackedLabel *)self->_distanceLabel invalidateIntrinsicContentSize];
      [(NavTrayStackedLabel *)self->_batteryLabel invalidateIntrinsicContentSize];
      [(NavTrayHeaderView *)self invalidateIntrinsicContentSize];
      return;
    default:
      goto LABEL_52;
  }
}

- (void)_updateLayout
{
  BOOL v3 = [(NavTrayHeaderView *)self isExpanded];
  unsigned int v4 = [(NavTrayHeaderView *)self _isResumeRouteState];
  unsigned int v5 = [(NavTrayHeaderView *)self _alternateButtonTypeContains:1];
  unsigned int v6 = [(NavTrayHeaderView *)self _alternateButtonTypeContains:2];
  unsigned int v7 = [(NavTrayHeaderView *)self _alternateButtonTypeContains:16];
  BOOL v8 = 0;
  int v9 = v4 | v5 | v6 | v7;
  if ((v4 & 1) == 0 && (v7 & 1) == 0) {
    BOOL v8 = ![(NavTrayHeaderView *)self _isParkingRouteState]
  }
      && [(NavTrayHeaderView *)self showFeedbackView];
  int v10 = [(NavTrayHeaderView *)self traitCollection];
  unsigned int v11 = [v10 isLuminanceReduced];

  if (v11) {
    double v12 = 0.300000012;
  }
  else {
    double v12 = 1.0;
  }
  switch([(NavTrayHeaderView *)self state])
  {
    case 0uLL:
    case 1uLL:
      if (v3) {
        double v13 = 1.0;
      }
      else {
        double v13 = 0.0;
      }
      if (v3) {
        double v14 = 0.0;
      }
      else {
        double v14 = 1.0;
      }
      [(MapsFadingLabel *)self->_expandedTitleLabel setAlpha:v13];
      id v15 = &OBJC_IVAR___NavTrayHeaderView__minimizedStackView;
      goto LABEL_18;
    case 2uLL:
      [(MapsFadingLabel *)self->_expandedTitleLabel setAlpha:1.0];
      id v15 = &OBJC_IVAR___NavTrayHeaderView__minimizedStackView;
      double v14 = 0.0;
LABEL_18:
      id v16 = &OBJC_IVAR___NavTrayHeaderView__chevronImageView;
      goto LABEL_25;
    case 3uLL:
      double v14 = 0.0;
      [(MapsFadingLabel *)self->_expandedTitleLabel setAlpha:0.0];
      [(UIStackView *)self->_minimizedStackView setAlpha:0.0];
      [(UIImageView *)self->_chevronImageView setAlpha:0.0];
      if (v9) {
        double v17 = v12;
      }
      else {
        double v17 = 0.0;
      }
      [(UIButton *)self->_alternativeActionButton setAlpha:v17];
      if (v8) {
        double v14 = v12;
      }
      id v16 = &OBJC_IVAR___NavTrayHeaderView__endButton;
      id v15 = &OBJC_IVAR___NavTrayHeaderView__feedbackView;
LABEL_25:
      [*(id *)((char *)&self->super.super.super.isa + *v15) setAlpha:v14];
      [*(id *)((char *)&self->super.super.super.isa + *v16) setAlpha:v12];
      break;
    default:
      break;
  }
  endRouteButtonStackView = self->_endRouteButtonStackView;
  alternativeActionButton = self->_alternativeActionButton;
  if (v9)
  {
    [(AxisAdjustingStackView *)endRouteButtonStackView insertArrangedTruncatableSubview:alternativeActionButton atIndex:0];
  }
  else
  {
    [(AxisAdjustingStackView *)endRouteButtonStackView removeArrangedTruncatableSubview:alternativeActionButton];
    [(UIButton *)self->_alternativeActionButton removeFromSuperview];
  }
  unint64_t v20 = [(NavTrayHeaderView *)self state];
  BOOL v21 = v20 == 3;
  double v22 = 0.0;
  if (v20 == 3) {
    double v22 = 1.0;
  }
  [(UIView *)self->_arrivedContainerView setAlpha:v22];
  [(NSLayoutConstraint *)self->_arrivedContainerTopConstraint setActive:v21];
  [(NSLayoutConstraint *)self->_feedbackViewBottomConstraint setActive:v8];
  [(NSLayoutConstraint *)self->_minimizedStackViewBottomConstraint setActive:v3 ^ 1];
  [(NSLayoutConstraint *)self->_expandedTitleLabelBottomConstraint setActive:v3];
  float v23 = 0.0;
  if (v3) {
    float v23 = 1.0;
  }
  CGAffineTransformMakeRotation(&v26, (float)((float)(v23 * 2.0) + -1.0) * 1.57079633);
  chevronImageView = self->_chevronImageView;
  CGAffineTransform v25 = v26;
  [(UIImageView *)chevronImageView setTransform:&v25];
}

- (void)_updateTextAlignment
{
  int64_t v3 = [(NavTrayHeaderView *)self _textAlignmentForCurrentLanguage];
  unsigned int v4 = [(NavTrayStackedLabel *)self->_minimizedArrivalLabel bottomLabel];
  [v4 setTextAlignment:v3];

  int64_t v5 = [(NavTrayHeaderView *)self _textAlignmentForCurrentLanguage];
  unsigned int v6 = [(NavTrayStackedLabel *)self->_timeLabel bottomLabel];
  [v6 setTextAlignment:v5];

  int64_t v7 = [(NavTrayHeaderView *)self _textAlignmentForCurrentLanguage];
  BOOL v8 = [(NavTrayStackedLabel *)self->_distanceLabel bottomLabel];
  [v8 setTextAlignment:v7];

  int64_t v9 = [(NavTrayHeaderView *)self _textAlignmentForCurrentLanguage];
  id v10 = [(NavTrayStackedLabel *)self->_batteryLabel bottomLabel];
  [v10 setTextAlignment:v9];
}

- (BOOL)_alternateButtonTypeContains:(unint64_t)a3
{
  return ([(NavTrayHeaderView *)self alternateButtonTypes] & a3) != 0;
}

- (BOOL)_isResumeRouteState
{
  if ([(NavTrayHeaderView *)self _alternateButtonTypeContains:4]) {
    return 1;
  }

  return [(NavTrayHeaderView *)self _alternateButtonTypeContains:8];
}

- (BOOL)_isArrivalState
{
  return self->_arrivalState != 0;
}

- (BOOL)_isParkingRouteState
{
  return (unint64_t)(self->_arrivalState - 3) < 2;
}

- (void)showRecalculating
{
  if (![(NavTrayHeaderView *)self _isArrivalState])
  {
    self->_isRerouting = 1;
    [(NavTrayHeaderView *)self setETA:0];
  }
}

- (void)applyArrivalState
{
}

- (void)applyArrivalStateAndReloadStackView:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v5 = sub_100607954();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id v36 = 134349056;
    *(void *)&v36[4] = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Applying arrival state", v36, 0xCu);
  }

  unsigned int v6 = [(NavTrayHeaderView *)self _isResumeRouteState];
  int64_t v7 = sub_100607954();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v8)
    {
      *(_DWORD *)id v36 = 134349056;
      *(void *)&v36[4] = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Configuring pause button", v36, 0xCu);
    }

    int64_t v9 = [(NavTrayHeaderView *)self delegate];
    id v10 = v9;
    endButton = self->_endButton;
    uint64_t v12 = 2;
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)id v36 = 134349056;
      *(void *)&v36[4] = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Configuring end route button", v36, 0xCu);
    }

    int64_t v9 = [(NavTrayHeaderView *)self delegate];
    id v10 = v9;
    endButton = self->_endButton;
    uint64_t v12 = 1;
  }
  [v9 styleButton:endButton ofType:v12];

  unint64_t currentAlternateButtonType = self->_currentAlternateButtonType;
  if (([(NavTrayHeaderView *)self alternateButtonTypes] & 4) != 0)
  {
    double v14 = sub_100607954();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
LABEL_28:

      BOOL v21 = [(NavTrayHeaderView *)self delegate];
      double v22 = v21;
      alternativeActionButton = self->_alternativeActionButton;
      unint64_t v24 = 4;
      uint64_t v25 = 4;
LABEL_29:
      [v21 styleButton:alternativeActionButton ofType:v25 *(_OWORD *)v36];

      self->_unint64_t currentAlternateButtonType = v24;
      goto LABEL_30;
    }
    *(_DWORD *)id v36 = 134349056;
    *(void *)&v36[4] = self;
    id v15 = "[%{public}p] Configuring resume button";
LABEL_27:
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, v15, v36, 0xCu);
    goto LABEL_28;
  }
  if (([(NavTrayHeaderView *)self alternateButtonTypes] & 8) != 0)
  {
    id v16 = +[MNNavigationService sharedService];
    double v17 = [v16 arrivalChargingStationInfo];
    [v17 chargingTime];
    double v19 = v18;

    double v14 = sub_100607954();
    BOOL v20 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
    if (v19 > 0.0)
    {
      if (v20)
      {
        *(_DWORD *)id v36 = 134349056;
        *(void *)&v36[4] = self;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "[%{public}p] Configuring other stations button", v36, 0xCu);
      }

      BOOL v21 = [(NavTrayHeaderView *)self delegate];
      double v22 = v21;
      alternativeActionButton = self->_alternativeActionButton;
      unint64_t v24 = 3;
      uint64_t v25 = 3;
      goto LABEL_29;
    }
    if (!v20) {
      goto LABEL_28;
    }
    *(_DWORD *)id v36 = 134349056;
    *(void *)&v36[4] = self;
    id v15 = "[%{public}p] Configuring resume from charging button";
    goto LABEL_27;
  }
  if (([(NavTrayHeaderView *)self alternateButtonTypes] & 2) != 0)
  {
    CGAffineTransform v26 = sub_100607954();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)id v36 = 134349056;
      *(void *)&v36[4] = self;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "[%{public}p] Configuring walking button", v36, 0xCu);
    }

    id v27 = [(NavTrayHeaderView *)self delegate];
    [v27 styleButton:self->_alternativeActionButton ofType:6];

    self->_unint64_t currentAlternateButtonType = 6;
    unsigned int v28 = +[NavigationFeedbackCollector sharedFeedbackCollector];
    [v28 didSuggestWalkingRoute];
    goto LABEL_43;
  }
  if ([(NavTrayHeaderView *)self alternateButtonTypes])
  {
    v33 = sub_100607954();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)id v36 = 134349056;
      *(void *)&v36[4] = self;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "[%{public}p] Configuring find my button", v36, 0xCu);
    }

    v34 = [(NavTrayHeaderView *)self delegate];
    [v34 styleButton:self->_alternativeActionButton ofType:5];

    self->_unint64_t currentAlternateButtonType = 5;
    unsigned int v28 = +[NavigationFeedbackCollector sharedFeedbackCollector];
    [v28 didSuggestFindMy];
LABEL_43:

    goto LABEL_30;
  }
  if (([(NavTrayHeaderView *)self alternateButtonTypes] & 0x10) != 0)
  {
    v35 = sub_100607954();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)id v36 = 134349056;
      *(void *)&v36[4] = self;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "[%{public}p] Configuring custom route button", v36, 0xCu);
    }

    BOOL v21 = [(NavTrayHeaderView *)self delegate];
    double v22 = v21;
    alternativeActionButton = self->_alternativeActionButton;
    unint64_t v24 = 7;
    uint64_t v25 = 7;
    goto LABEL_29;
  }
  self->_unint64_t currentAlternateButtonType = 0;
LABEL_30:
  if (self->_arrivalState)
  {
    unint64_t v29 = self->_currentAlternateButtonType;
    if (currentAlternateButtonType != v29)
    {
      switch(v29)
      {
        case 5uLL:
          uint64_t v30 = 125;
          goto LABEL_37;
        case 7uLL:
          id v31 = [(NavTrayHeaderView *)self delegate];
          v32 = [v31 mapItemMuid];
          +[GEOAPPortal captureUserAction:45 target:136 value:v32];

          break;
        case 6uLL:
          uint64_t v30 = 124;
LABEL_37:
          +[GEOAPPortal captureUserAction:45 target:v30 value:0];
          break;
      }
    }
  }
  [(NavTrayHeaderView *)self _updateContentAndReloadStackView:v3];
  [(NavTrayHeaderView *)self _updateLayout];
}

- (void)resetContent
{
  BOOL v3 = sub_100607954();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 134349056;
    int64_t v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Resetting content", (uint8_t *)&v4, 0xCu);
  }

  self->_int64_t arrivalState = 0;
  self->_alternateButtonTypes = 0;
  self->_showFeedbackView = 0;
  [(AxisAdjustingStackView *)self->_endRouteButtonStackView invalidateStackViewAxis];
}

- (void)clearAnimations
{
  BOOL v3 = [(NavTrayHeaderView *)self layer];
  [v3 removeAllAnimations];

  int v4 = [(MapsFadingLabel *)self->_expandedTitleLabel layer];
  [v4 removeAllAnimations];

  int64_t v5 = [(UIStackView *)self->_minimizedStackView layer];
  [v5 removeAllAnimations];

  unsigned int v6 = [(UIImageView *)self->_chevronImageView layer];
  [v6 removeAllAnimations];

  id v7 = [(UIView *)self->_arrivedContainerView layer];
  [v7 removeAllAnimations];
}

- (BOOL)_shouldPostBacklightSceneRequiresUpdateNotification:(id)a3
{
  id v4 = a3;
  if (GEOConfigGetBOOL()
    && ([(NavTrayHeaderView *)self traitCollection],
        int64_t v5 = objc_claimAutoreleasedReturnValue(),
        unsigned int v6 = [v5 isLuminanceReduced],
        v5,
        v6))
  {
    id v7 = [(NavTrayStackedLabel *)self->_minimizedArrivalLabel topLabel];
    BOOL v8 = [v7 text];
    int64_t v9 = [v4 arrivalTimeStringIncludingAMPMSymbols:0];
    unsigned __int8 v10 = [v8 isEqualToString:v9];

    unsigned int v11 = [(NavTrayStackedLabel *)self->_timeLabel topLabel];
    uint64_t v12 = [v11 text];
    uint64_t v13 = [v4 timeValue];
    unsigned __int8 v14 = [v12 isEqualToString:v13];

    id v15 = [(NavTrayStackedLabel *)self->_distanceLabel topLabel];
    id v16 = [v15 text];
    double v17 = [v4 distanceValue];
    LOBYTE(v13) = [v16 isEqualToString:v17];

    char v18 = v10 & v14 & v13 ^ 1;
  }
  else
  {
    char v18 = 0;
  }

  return v18;
}

- (void)_pressedHeaderView
{
  if (![(NavTrayHeaderView *)self _isArrivalState])
  {
    id v3 = [(NavTrayHeaderView *)self delegate];
    [v3 pressedHeaderView];
  }
}

- (void)stackViewDidChangeLayout:(id)a3
{
  [(NavTrayHeaderView *)self setNeedsLayout];
  [(NavTrayHeaderView *)self invalidateIntrinsicContentSize];
  id v4 = [(NavTrayHeaderView *)self delegate];
  [v4 updatedHeight];
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (NSString)destinationName
{
  return self->_destinationName;
}

- (void)setDestinationName:(id)a3
{
}

- (UIView)hairlineView
{
  return self->_hairlineView;
}

- (int64_t)arrivalState
{
  return self->_arrivalState;
}

- (void)setArrivalState:(int64_t)a3
{
  self->_int64_t arrivalState = a3;
}

- (unint64_t)alternateButtonTypes
{
  return self->_alternateButtonTypes;
}

- (void)setAlternateButtonTypes:(unint64_t)a3
{
  self->_alternateButtonTypes = a3;
}

- (unint64_t)currentAlternateButtonType
{
  return self->_currentAlternateButtonType;
}

- (BOOL)showFeedbackView
{
  return self->_showFeedbackView;
}

- (void)setShowFeedbackView:(BOOL)a3
{
  self->_showFeedbackView = a3;
}

- (NavTrayHeaderViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NavTrayHeaderViewDelegate *)WeakRetained;
}

- (GuidanceETA)ETA
{
  return self->_ETA;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ETA, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_hairlineView, 0);
  objc_storeStrong((id *)&self->_destinationName, 0);
  objc_storeStrong((id *)&self->_minimizedStackViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_expandedTitleLabelBottomConstraint, 0);
  objc_storeStrong((id *)&self->_endRouteButtonStackViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_feedbackViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_arrivedContainerTopConstraint, 0);
  objc_storeStrong((id *)&self->_alternativeActionButton, 0);
  objc_storeStrong((id *)&self->_endButton, 0);
  objc_storeStrong((id *)&self->_feedbackView, 0);
  objc_storeStrong((id *)&self->_arrivedSubtitleLabel, 0);
  objc_storeStrong((id *)&self->_arrivedTitleLabel, 0);
  objc_storeStrong((id *)&self->_arrivedHeaderView, 0);
  objc_storeStrong((id *)&self->_arrivedContainerView, 0);
  objc_storeStrong((id *)&self->_expandedTitleLabel, 0);
  objc_storeStrong((id *)&self->_batteryLabel, 0);
  objc_storeStrong((id *)&self->_distanceLabel, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);
  objc_storeStrong((id *)&self->_minimizedArrivalLabel, 0);
  objc_storeStrong(&self->_minimizedValueFontProvider, 0);
  objc_storeStrong((id *)&self->_endRouteButtonStackView, 0);
  objc_storeStrong((id *)&self->_minimizedStackView, 0);
  objc_storeStrong((id *)&self->_chevronImageView, 0);

  objc_storeStrong((id *)&self->_metrics, 0);
}

@end