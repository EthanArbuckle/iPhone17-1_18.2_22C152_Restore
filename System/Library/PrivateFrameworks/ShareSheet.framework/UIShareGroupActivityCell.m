@interface UIShareGroupActivityCell
- (BOOL)didInstallSubviews;
- (BOOL)isDisabled;
- (BOOL)isLongPressable;
- (BOOL)isPulsing;
- (NSArray)largeTextConstraints;
- (NSArray)regularConstraints;
- (NSMutableArray)allConstraints;
- (NSString)title;
- (NSUUID)identifier;
- (SHSheetContentLayoutSpec)layoutSpec;
- (UIImage)image;
- (UIImageView)activityImageView;
- (UILabel)labelForPositioning;
- (UILabel)titleLabel;
- (UIView)badgeSlotView;
- (UIView)imageSlotView;
- (UIView)titleSlotView;
- (UIVisualEffectView)vibrantLabelView;
- (_UIHostActivityProxy)activityProxy;
- (id)_createTitleLabel;
- (id)_placeholderString;
- (id)_titleLabelFont;
- (id)createTargetedPreview;
- (unsigned)badgeSlotID;
- (unsigned)imageSlotID;
- (unsigned)titleSlotID;
- (void)_configureImageViewForPlaceholder:(BOOL)a3;
- (void)_installSubviewsIfNeeded;
- (void)_setLayoutSpec:(id)a3;
- (void)_updateBadgeSlotView;
- (void)_updateConstraints;
- (void)_updateDarkening;
- (void)_updateImageView;
- (void)_updateTitleView;
- (void)configureLayoutIfNeeded:(id)a3;
- (void)prepareForReuse;
- (void)setActivityImageView:(id)a3;
- (void)setActivityProxy:(id)a3;
- (void)setAllConstraints:(id)a3;
- (void)setBadgeSlotID:(unsigned int)a3;
- (void)setBadgeSlotView:(id)a3;
- (void)setDidInstallSubviews:(BOOL)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageSlotID:(unsigned int)a3;
- (void)setImageSlotView:(id)a3;
- (void)setIsPulsing:(BOOL)a3;
- (void)setLabelForPositioning:(id)a3;
- (void)setLargeTextConstraints:(id)a3;
- (void)setLayoutSpec:(id)a3;
- (void)setLongPressable:(BOOL)a3;
- (void)setRegularConstraints:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleSlotID:(unsigned int)a3;
- (void)setTitleSlotView:(id)a3;
- (void)setVibrantLabelView:(id)a3;
- (void)setupConstraints;
- (void)startPulsing;
- (void)stopPulsing;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation UIShareGroupActivityCell

- (id)_placeholderString
{
  v2 = [(UIShareGroupActivityCell *)self traitCollection];
  v3 = [v2 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);

  v5 = @"Apple\nInc";
  if (IsAccessibilityCategory) {
    v5 = @"Apple\nInc\n";
  }
  v6 = v5;
  return v6;
}

- (id)_titleLabelFont
{
  id SFUIShareSheetActivityCellSpecClass_0 = getSFUIShareSheetActivityCellSpecClass_0();
  v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  v5 = objc_msgSend(SFUIShareSheetActivityCellSpecClass_0, "titleLabelFontTextStyleForIdiom:", objc_msgSend(v4, "userInterfaceIdiom"));

  v6 = (NSString *)*MEMORY[0x1E4FB27B0];
  v7 = [(UIShareGroupActivityCell *)self traitCollection];
  v8 = [v7 preferredContentSizeCategory];
  NSComparisonResult v9 = UIContentSizeCategoryCompareToCategory(v6, v8);

  if (v9)
  {
    v10 = [MEMORY[0x1E4FB1798] preferredFontForTextStyle:v5];
  }
  else
  {
    v11 = (void *)MEMORY[0x1E4FB17A0];
    v12 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:*MEMORY[0x1E4FB27B8]];
    v13 = [v11 preferredFontDescriptorWithTextStyle:v5 compatibleWithTraitCollection:v12];

    v10 = [MEMORY[0x1E4FB1798] fontWithDescriptor:v13 size:0.0];
  }
  return v10;
}

- (id)_createTitleLabel
{
  v3 = [(UIShareGroupActivityCell *)self _placeholderString];
  id SFUIShareSheetActivityCellSpecClass_0 = getSFUIShareSheetActivityCellSpecClass_0();
  v5 = [MEMORY[0x1E4FB16C8] currentDevice];
  v6 = objc_msgSend(SFUIShareSheetActivityCellSpecClass_0, "titleLabelFontTextStyleForIdiom:", objc_msgSend(v5, "userInterfaceIdiom"));

  id v7 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  v8 = [(UIShareGroupActivityCell *)self _titleLabelFont];
  [v7 setFont:v8];

  NSComparisonResult v9 = [(UIShareGroupActivityCell *)self traitCollection];
  v10 = [v9 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v10);

  if (IsAccessibilityCategory) {
    uint64_t v12 = 4;
  }
  else {
    uint64_t v12 = 1;
  }
  [v7 setTextAlignment:v12];
  [v7 setNumberOfLines:0];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v7 _setHyphenationFactor:0.0];
  [v7 setText:v3];
  [v7 setAlpha:0.0];

  return v7;
}

- (void)_installSubviewsIfNeeded
{
  if (![(UIShareGroupActivityCell *)self didInstallSubviews])
  {
    [(UIShareGroupActivityCell *)self setDidInstallSubviews:1];
    id v91 = [MEMORY[0x1E4FB14C8] effectWithStyle:9];
    v3 = objc_msgSend(MEMORY[0x1E4FB1EA0], "effectForBlurEffect:style:");
    v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v3];
    [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIShareGroupActivityCell *)self setVibrantLabelView:v4];
    v5 = [(UIShareGroupActivityCell *)self contentView];
    v6 = [(UIShareGroupActivityCell *)self vibrantLabelView];
    [v5 addSubview:v6];

    id v7 = [(UIShareGroupActivityCell *)self _createTitleLabel];
    [(UIShareGroupActivityCell *)self setTitleLabel:v7];

    v8 = [(UIShareGroupActivityCell *)self contentView];
    NSComparisonResult v9 = [(UIShareGroupActivityCell *)self titleLabel];
    [v8 addSubview:v9];

    v10 = [(UIShareGroupActivityCell *)self _createTitleLabel];
    [(UIShareGroupActivityCell *)self setLabelForPositioning:v10];

    v11 = [(UIShareGroupActivityCell *)self vibrantLabelView];
    uint64_t v12 = [v11 contentView];
    v13 = [(UIShareGroupActivityCell *)self labelForPositioning];
    [v12 addSubview:v13];

    v14 = [MEMORY[0x1E4F6F258] imageDescriptorNamed:*MEMORY[0x1E4F6F298]];
    v15 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v16 = [v15 userInterfaceIdiom];

    double v17 = 13.5;
    if ((v16 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
      [v14 continuousCornerRadius];
      double v17 = v18;
    }
    id v19 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [(UIShareGroupActivityCell *)self setImageSlotView:v19];

    v20 = [(UIShareGroupActivityCell *)self imageSlotView];
    [v20 setAlpha:0.0];

    v21 = [(UIShareGroupActivityCell *)self imageSlotView];
    [v21 setClipsToBounds:1];

    v22 = [(UIShareGroupActivityCell *)self imageSlotView];
    [v22 setTranslatesAutoresizingMaskIntoConstraints:0];

    v23 = [(UIShareGroupActivityCell *)self imageSlotView];
    v24 = [v23 layer];
    [v24 setCornerRadius:v17];

    uint64_t v25 = *MEMORY[0x1E4F39EA8];
    v26 = [(UIShareGroupActivityCell *)self imageSlotView];
    v27 = [v26 layer];
    [v27 setCornerCurve:v25];

    id v28 = [MEMORY[0x1E4FB1618] blackColor];
    uint64_t v29 = [v28 CGColor];
    v30 = [(UIShareGroupActivityCell *)self imageSlotView];
    v31 = [v30 layer];
    [v31 setShadowColor:v29];

    v32 = [(UIShareGroupActivityCell *)self imageSlotView];
    v33 = [v32 layer];
    LODWORD(v34) = 1032805417;
    [v33 setShadowOpacity:v34];

    double v35 = *MEMORY[0x1E4F1DB30];
    double v36 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    v37 = [(UIShareGroupActivityCell *)self imageSlotView];
    v38 = [v37 layer];
    objc_msgSend(v38, "setShadowOffset:", v35, v36);

    v39 = [(UIShareGroupActivityCell *)self imageSlotView];
    v40 = [v39 layer];
    [v40 setShadowRadius:10.0];

    v41 = [(UIShareGroupActivityCell *)self imageSlotView];
    v42 = [v41 layer];
    [v42 setShadowPathIsBounds:1];

    v43 = [(UIShareGroupActivityCell *)self imageSlotView];
    v44 = [v43 layer];
    [v44 setShouldRasterize:0];

    v45 = [(UIShareGroupActivityCell *)self imageSlotView];
    v46 = [v45 layer];
    [v46 setMasksToBounds:0];

    v47 = [(UIShareGroupActivityCell *)self contentView];
    v48 = [(UIShareGroupActivityCell *)self imageSlotView];
    [v47 addSubview:v48];

    id v49 = objc_alloc_init(MEMORY[0x1E4FB1838]);
    [(UIShareGroupActivityCell *)self setActivityImageView:v49];

    v50 = [(UIShareGroupActivityCell *)self traitCollection];
    v51 = SHSheetUISpecPlaceholderColor([v50 userInterfaceStyle]);
    v52 = [(UIShareGroupActivityCell *)self activityImageView];
    [v52 setBackgroundColor:v51];

    v53 = [(UIShareGroupActivityCell *)self activityImageView];
    [v53 setClipsToBounds:1];

    v54 = [(UIShareGroupActivityCell *)self activityImageView];
    [v54 setTranslatesAutoresizingMaskIntoConstraints:0];

    v55 = [(UIShareGroupActivityCell *)self activityImageView];
    [v55 setContentMode:2];

    v56 = [(UIShareGroupActivityCell *)self activityImageView];
    v57 = [v56 layer];
    [v57 setCornerRadius:v17];

    v58 = [(UIShareGroupActivityCell *)self activityImageView];
    v59 = [v58 layer];
    [v59 setCornerCurve:v25];

    v60 = [(UIShareGroupActivityCell *)self activityImageView];
    v61 = [v60 layer];
    objc_msgSend(v61, "setShadowOffset:", v35, v36);

    v62 = [(UIShareGroupActivityCell *)self activityImageView];
    v63 = [v62 layer];
    [v63 setShadowRadius:10.0];

    v64 = [(UIShareGroupActivityCell *)self activityImageView];
    v65 = [v64 layer];
    [v65 setShadowPathIsBounds:1];

    v66 = [(UIShareGroupActivityCell *)self activityImageView];
    v67 = [v66 layer];
    [v67 setShouldRasterize:0];

    v68 = [(UIShareGroupActivityCell *)self activityImageView];
    v69 = [v68 layer];
    [v69 setMasksToBounds:0];

    v70 = [(UIShareGroupActivityCell *)self contentView];
    v71 = [(UIShareGroupActivityCell *)self activityImageView];
    [v70 addSubview:v71];

    id v72 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [(UIShareGroupActivityCell *)self setTitleSlotView:v72];

    v73 = [(UIShareGroupActivityCell *)self titleSlotView];
    [v73 setAlpha:0.0];

    v74 = [(UIShareGroupActivityCell *)self titleSlotView];
    [v74 setTranslatesAutoresizingMaskIntoConstraints:0];

    v75 = [(UIShareGroupActivityCell *)self vibrantLabelView];
    v76 = [v75 contentView];
    v77 = [(UIShareGroupActivityCell *)self titleSlotView];
    [v76 addSubview:v77];

    id v78 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    [(UIShareGroupActivityCell *)self setBadgeSlotView:v78];

    v79 = [(UIShareGroupActivityCell *)self badgeSlotView];
    [v79 setAlpha:0.0];

    v80 = [(UIShareGroupActivityCell *)self badgeSlotView];
    [v80 setTranslatesAutoresizingMaskIntoConstraints:0];

    v81 = [MEMORY[0x1E4FB1618] systemRedColor];
    v82 = [(UIShareGroupActivityCell *)self badgeSlotView];
    [v82 setBackgroundColor:v81];

    id SFUIShareSheetActivityCellSpecClass_0 = getSFUIShareSheetActivityCellSpecClass_0();
    v84 = [MEMORY[0x1E4FB16C8] currentDevice];
    objc_msgSend(SFUIShareSheetActivityCellSpecClass_0, "nearbyAirDropBadgeSizeForIdiom:", objc_msgSend(v84, "userInterfaceIdiom"));
    double v86 = v85 * 0.5;
    v87 = [(UIShareGroupActivityCell *)self badgeSlotView];
    v88 = [v87 layer];
    [v88 setCornerRadius:v86];

    v89 = [(UIShareGroupActivityCell *)self contentView];
    v90 = [(UIShareGroupActivityCell *)self badgeSlotView];
    [v89 addSubview:v90];

    [(UIShareGroupActivityCell *)self _configureImageViewForPlaceholder:1];
    [(UIShareGroupActivityCell *)self setupConstraints];
  }
}

- (void)_setLayoutSpec:(id)a3
{
  id v4 = a3;
  [(UIShareGroupActivityCell *)self setLayoutSpec:v4];
  uint64_t v5 = [v4 deviceClass];

  v6 = &regularHeight5_8Rounded_1;
  id v7 = &regularHeight_1;
  if (v5 == 10) {
    id v7 = &visionLarge_0;
  }
  if (v5 == 9) {
    id v7 = &visionCompact_0;
  }
  if ((v5 & 0xFFFFFFFFFFFFFFFDLL) == 0) {
    id v7 = &compactHeight_1;
  }
  if (v5 != 3) {
    v6 = v7;
  }
  layout_1 = (uint64_t)v6;
}

- (void)configureLayoutIfNeeded:(id)a3
{
  id v8 = a3;
  id v4 = [(UIShareGroupActivityCell *)self layoutSpec];

  [(UIShareGroupActivityCell *)self _setLayoutSpec:v8];
  if ([(UIShareGroupActivityCell *)self didInstallSubviews])
  {
    uint64_t v5 = v8;
    if (v4 == v8) {
      goto LABEL_6;
    }
    v6 = (void *)MEMORY[0x1E4F28DC8];
    id v7 = [(UIShareGroupActivityCell *)self allConstraints];
    [v6 deactivateConstraints:v7];

    [(UIShareGroupActivityCell *)self setupConstraints];
  }
  else
  {
    [(UIShareGroupActivityCell *)self _installSubviewsIfNeeded];
  }
  uint64_t v5 = v8;
LABEL_6:
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)UIShareGroupActivityCell;
  [(UIShareGroupActivityCell *)&v3 prepareForReuse];
  [(UIShareGroupActivityCell *)self setImage:0];
  [(UIShareGroupActivityCell *)self setImageSlotID:0];
  [(UIShareGroupActivityCell *)self _configureImageViewForPlaceholder:1];
  [(UIShareGroupActivityCell *)self stopPulsing];
}

- (void)setupConstraints
{
  v173[18] = *MEMORY[0x1E4F143B8];
  v170 = [(UIShareGroupActivityCell *)self contentView];
  objc_super v3 = [(UIShareGroupActivityCell *)self layoutSpec];
  [v3 sharingAppIconWidth];
  double v5 = v4;

  id SFUIShareSheetActivityCellSpecClass_0 = getSFUIShareSheetActivityCellSpecClass_0();
  id v7 = [MEMORY[0x1E4FB16C8] currentDevice];
  objc_msgSend(SFUIShareSheetActivityCellSpecClass_0, "nearbyAirDropBadgeSizeForIdiom:", objc_msgSend(v7, "userInterfaceIdiom"));
  double v9 = v8;

  v10 = [(UIShareGroupActivityCell *)self traitCollection];
  v11 = [v10 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v11);

  BOOL v168 = IsAccessibilityCategory;
  if (IsAccessibilityCategory) {
    [(UIShareGroupActivityCell *)self labelForPositioning];
  }
  else {
  v13 = [(UIShareGroupActivityCell *)self titleLabel];
  }
  v14 = (void *)MEMORY[0x1E4F1CA48];
  v165 = [(UIShareGroupActivityCell *)self imageSlotView];
  v162 = [v165 widthAnchor];
  v159 = [v162 constraintEqualToConstant:v5];
  v173[0] = v159;
  v156 = [(UIShareGroupActivityCell *)self imageSlotView];
  v153 = [v156 heightAnchor];
  v150 = [v153 constraintEqualToConstant:v5];
  v173[1] = v150;
  v147 = [(UIShareGroupActivityCell *)self activityImageView];
  v141 = [v147 widthAnchor];
  v144 = [(UIShareGroupActivityCell *)self imageSlotView];
  v138 = [v144 widthAnchor];
  v135 = [v141 constraintEqualToAnchor:v138];
  v173[2] = v135;
  v132 = [(UIShareGroupActivityCell *)self activityImageView];
  v126 = [v132 heightAnchor];
  v129 = [(UIShareGroupActivityCell *)self imageSlotView];
  v123 = [v129 heightAnchor];
  v120 = [v126 constraintEqualToAnchor:v123];
  v173[3] = v120;
  v117 = [(UIShareGroupActivityCell *)self activityImageView];
  v112 = [v117 centerXAnchor];
  v114 = [(UIShareGroupActivityCell *)self imageSlotView];
  v110 = [v114 centerXAnchor];
  v108 = [v112 constraintEqualToAnchor:v110];
  v173[4] = v108;
  v106 = [(UIShareGroupActivityCell *)self activityImageView];
  v102 = [v106 centerYAnchor];
  v104 = [(UIShareGroupActivityCell *)self imageSlotView];
  v100 = [v104 centerYAnchor];
  v98 = [v102 constraintEqualToAnchor:v100];
  v173[5] = v98;
  v96 = [(UIShareGroupActivityCell *)self titleSlotView];
  v94 = [v96 centerXAnchor];
  v92 = [v13 centerXAnchor];
  v90 = [v94 constraintEqualToAnchor:v92];
  v173[6] = v90;
  v88 = [(UIShareGroupActivityCell *)self titleSlotView];
  double v86 = [v88 centerYAnchor];
  v84 = [v13 centerYAnchor];
  v82 = [v86 constraintEqualToAnchor:v84];
  v173[7] = v82;
  v80 = [(UIShareGroupActivityCell *)self titleSlotView];
  id v78 = [v80 heightAnchor];
  v76 = [v13 heightAnchor];
  v75 = [v78 constraintEqualToAnchor:v76];
  v173[8] = v75;
  v74 = [(UIShareGroupActivityCell *)self titleSlotView];
  v73 = [v74 widthAnchor];
  id v72 = [v13 widthAnchor];
  v71 = [v73 constraintEqualToAnchor:v72];
  v173[9] = v71;
  v70 = [(UIShareGroupActivityCell *)self vibrantLabelView];
  v69 = [v70 centerXAnchor];
  v68 = [v13 centerXAnchor];
  v67 = [v69 constraintEqualToAnchor:v68];
  v173[10] = v67;
  v66 = [(UIShareGroupActivityCell *)self vibrantLabelView];
  v65 = [v66 centerYAnchor];
  v64 = [v13 centerYAnchor];
  v63 = [v65 constraintEqualToAnchor:v64];
  v173[11] = v63;
  v62 = [(UIShareGroupActivityCell *)self vibrantLabelView];
  v61 = [v62 heightAnchor];
  v60 = [v13 heightAnchor];
  v59 = [v61 constraintEqualToAnchor:v60];
  v173[12] = v59;
  v58 = [(UIShareGroupActivityCell *)self vibrantLabelView];
  v57 = [v58 widthAnchor];
  v169 = v13;
  v56 = [v13 widthAnchor];
  v55 = [v57 constraintEqualToAnchor:v56];
  v173[13] = v55;
  v54 = [(UIShareGroupActivityCell *)self badgeSlotView];
  v52 = [v54 trailingAnchor];
  v53 = [(UIShareGroupActivityCell *)self imageSlotView];
  v51 = [v53 trailingAnchor];
  v50 = [v52 constraintEqualToAnchor:v51 constant:*(double *)(layout_1 + 32)];
  v173[14] = v50;
  id v49 = [(UIShareGroupActivityCell *)self badgeSlotView];
  v47 = [v49 topAnchor];
  v48 = [(UIShareGroupActivityCell *)self imageSlotView];
  v46 = [v48 topAnchor];
  v15 = [v47 constraintEqualToAnchor:v46 constant:*(double *)(layout_1 + 24)];
  v173[15] = v15;
  uint64_t v16 = [(UIShareGroupActivityCell *)self badgeSlotView];
  double v17 = [v16 widthAnchor];
  double v18 = [v17 constraintEqualToConstant:v9];
  v173[16] = v18;
  id v19 = [(UIShareGroupActivityCell *)self badgeSlotView];
  v20 = [v19 heightAnchor];
  v21 = [v20 constraintEqualToConstant:v9];
  v173[17] = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v173 count:18];
  v23 = [v14 arrayWithArray:v22];
  [(UIShareGroupActivityCell *)self setAllConstraints:v23];

  v166 = [(UIShareGroupActivityCell *)self labelForPositioning];
  v163 = [v166 topAnchor];
  v160 = [v170 topAnchor];
  v157 = [v163 constraintGreaterThanOrEqualToAnchor:v160 constant:8.0];
  v172[0] = v157;
  v151 = [v170 bottomAnchor];
  v154 = [(UIShareGroupActivityCell *)self labelForPositioning];
  v148 = [v154 bottomAnchor];
  v145 = [v151 constraintGreaterThanOrEqualToAnchor:v148 constant:8.0];
  v172[1] = v145;
  v142 = [(UIShareGroupActivityCell *)self labelForPositioning];
  v136 = [v142 centerYAnchor];
  v139 = [(UIShareGroupActivityCell *)self activityImageView];
  v133 = [v139 centerYAnchor];
  v130 = [v136 constraintEqualToAnchor:v133];
  v172[2] = v130;
  v127 = [(UIShareGroupActivityCell *)self imageSlotView];
  v124 = [v127 leadingAnchor];
  v121 = [v170 leadingAnchor];
  v118 = [v124 constraintEqualToAnchor:v121 constant:0.0];
  v172[3] = v118;
  v115 = [(UIShareGroupActivityCell *)self imageSlotView];
  v113 = [v115 centerYAnchor];
  v111 = [v170 centerYAnchor];
  v109 = [v113 constraintEqualToAnchor:v111];
  v172[4] = v109;
  v107 = [(UIShareGroupActivityCell *)self labelForPositioning];
  v105 = [v107 trailingAnchor];
  v103 = [v170 trailingAnchor];
  v101 = [v105 constraintEqualToAnchor:v103];
  v172[5] = v101;
  v99 = [(UIShareGroupActivityCell *)self labelForPositioning];
  v95 = [v99 leadingAnchor];
  v97 = [(UIShareGroupActivityCell *)self imageSlotView];
  v93 = [v97 trailingAnchor];
  id v91 = [v95 constraintEqualToAnchor:v93 constant:14.0];
  v172[6] = v91;
  v89 = [(UIShareGroupActivityCell *)self labelForPositioning];
  double v85 = [v89 leadingAnchor];
  v87 = [(UIShareGroupActivityCell *)self titleLabel];
  v83 = [v87 leadingAnchor];
  v81 = [v85 constraintEqualToAnchor:v83];
  v172[7] = v81;
  v79 = [(UIShareGroupActivityCell *)self labelForPositioning];
  v77 = [v79 trailingAnchor];
  v24 = [(UIShareGroupActivityCell *)self titleLabel];
  uint64_t v25 = [v24 trailingAnchor];
  v26 = [v77 constraintEqualToAnchor:v25];
  v172[8] = v26;
  v27 = [(UIShareGroupActivityCell *)self labelForPositioning];
  id v28 = [v27 centerYAnchor];
  uint64_t v29 = [(UIShareGroupActivityCell *)self titleLabel];
  v30 = [v29 centerYAnchor];
  v31 = [v28 constraintEqualToAnchor:v30];
  v172[9] = v31;
  v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v172 count:10];
  [(UIShareGroupActivityCell *)self setLargeTextConstraints:v32];

  v167 = [(UIShareGroupActivityCell *)self imageSlotView];
  v164 = [v167 centerXAnchor];
  v161 = [v170 centerXAnchor];
  v158 = [v164 constraintEqualToAnchor:v161];
  v171[0] = v158;
  v155 = [(UIShareGroupActivityCell *)self imageSlotView];
  v149 = [v155 centerXAnchor];
  v152 = [(UIShareGroupActivityCell *)self titleLabel];
  v146 = [v152 centerXAnchor];
  v143 = [v149 constraintEqualToAnchor:v146];
  v171[1] = v143;
  v140 = [(UIShareGroupActivityCell *)self imageSlotView];
  v137 = [v140 topAnchor];
  v134 = [v170 topAnchor];
  v131 = [v137 constraintEqualToAnchor:v134 constant:*(double *)layout_1];
  v171[2] = v131;
  v128 = [(UIShareGroupActivityCell *)self titleLabel];
  v125 = [v128 widthAnchor];
  v122 = [v170 widthAnchor];
  v119 = [v125 constraintEqualToAnchor:v122 constant:*(double *)(layout_1 + 40)];
  v171[3] = v119;
  v116 = [(UIShareGroupActivityCell *)self titleLabel];
  v33 = [v116 topAnchor];
  double v34 = [(UIShareGroupActivityCell *)self imageSlotView];
  double v35 = [v34 bottomAnchor];
  double v36 = [v33 constraintEqualToAnchor:v35 constant:*(double *)(layout_1 + 8)];
  v171[4] = v36;
  v37 = [(UIShareGroupActivityCell *)self titleLabel];
  v38 = [v37 bottomAnchor];
  v39 = [v170 bottomAnchor];
  v40 = [v38 constraintLessThanOrEqualToAnchor:v39 constant:*(double *)(layout_1 + 16)];
  v171[5] = v40;
  v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v171 count:6];
  [(UIShareGroupActivityCell *)self setRegularConstraints:v41];

  v42 = [(UIShareGroupActivityCell *)self allConstraints];
  if (v168) {
    [(UIShareGroupActivityCell *)self largeTextConstraints];
  }
  else {
  v43 = [(UIShareGroupActivityCell *)self regularConstraints];
  }
  [v42 addObjectsFromArray:v43];

  v44 = (void *)MEMORY[0x1E4F28DC8];
  v45 = [(UIShareGroupActivityCell *)self allConstraints];
  [v44 activateConstraints:v45];
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)UIShareGroupActivityCell;
  id v4 = a3;
  [(UIShareGroupActivityCell *)&v8 traitCollectionDidChange:v4];
  double v5 = [(UIShareGroupActivityCell *)self traitCollection];
  v6 = [v5 preferredContentSizeCategory];
  id v7 = [v4 preferredContentSizeCategory];

  if (v6 != v7) {
    [(UIShareGroupActivityCell *)self _updateConstraints];
  }
}

- (id)createTargetedPreview
{
  objc_super v3 = [(UIShareGroupActivityCell *)self image];

  if (v3) {
    [(UIShareGroupActivityCell *)self activityImageView];
  }
  else {
  id v4 = [(UIShareGroupActivityCell *)self imageSlotView];
  }
  [v4 frame];
  double v5 = [MEMORY[0x1E4FB14C0] bezierPathWithRoundedRect:0.0 cornerRadius:0.0];
  id v6 = objc_alloc_init(MEMORY[0x1E4FB1B28]);
  [v6 setVisiblePath:v5];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:v4 parameters:v6];

  return v7;
}

- (void)_configureImageViewForPlaceholder:(BOOL)a3
{
  BOOL v4 = a3;
  if (a3)
  {
    double v6 = 1.0;
  }
  else
  {
    objc_super v3 = [(UIShareGroupActivityCell *)self activityImageView];
    [v3 alpha];
    double v6 = v7;
  }
  objc_super v8 = [(UIShareGroupActivityCell *)self activityImageView];
  [v8 setAlpha:v6];

  if (v4)
  {
    double v9 = [(UIShareGroupActivityCell *)self activityImageView];
    v10 = [v9 layer];
    [v10 setShadowOpacity:0.0];

    v11 = [(UIShareGroupActivityCell *)self traitCollection];
    SHSheetUISpecPlaceholderColor([v11 userInterfaceStyle]);
  }
  else
  {

    v11 = [(UIShareGroupActivityCell *)self activityImageView];
    uint64_t v12 = [v11 layer];
    LODWORD(v13) = 1032805417;
    [v12 setShadowOpacity:v13];

    [MEMORY[0x1E4FB1618] clearColor];
  }
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  v14 = [(UIShareGroupActivityCell *)self activityImageView];
  [v14 setBackgroundColor:v15];

  if (v4)
  {

    id v15 = v11;
  }
}

- (void)_updateConstraints
{
  objc_super v3 = [(UIShareGroupActivityCell *)self _titleLabelFont];
  BOOL v4 = [(UIShareGroupActivityCell *)self titleLabel];
  [v4 setFont:v3];

  double v5 = [(UIShareGroupActivityCell *)self traitCollection];
  double v6 = [v5 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);

  if (IsAccessibilityCategory) {
    uint64_t v8 = 4;
  }
  else {
    uint64_t v8 = 1;
  }
  double v9 = [(UIShareGroupActivityCell *)self titleLabel];
  [v9 setTextAlignment:v8];

  v10 = (void *)MEMORY[0x1E4F28DC8];
  if (IsAccessibilityCategory)
  {
    v11 = [(UIShareGroupActivityCell *)self regularConstraints];
    [v10 deactivateConstraints:v11];

    uint64_t v12 = (void *)MEMORY[0x1E4F28DC8];
    [(UIShareGroupActivityCell *)self largeTextConstraints];
  }
  else
  {
    double v13 = [(UIShareGroupActivityCell *)self largeTextConstraints];
    [v10 deactivateConstraints:v13];

    uint64_t v12 = (void *)MEMORY[0x1E4F28DC8];
    [(UIShareGroupActivityCell *)self regularConstraints];
  v14 = };
  [v12 activateConstraints:v14];

  [(UIShareGroupActivityCell *)self setNeedsLayout];
}

- (void)setDisabled:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_disabled != a3)
  {
    BOOL v3 = a3;
    double v5 = share_sheet_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [(UIShareGroupActivityCell *)self identifier];
      double v7 = (void *)v6;
      uint64_t v8 = "no";
      if (v3) {
        uint64_t v8 = "yes";
      }
      int v9 = 138412546;
      uint64_t v10 = v6;
      __int16 v11 = 2080;
      uint64_t v12 = v8;
      _os_log_impl(&dword_1A0AD8000, v5, OS_LOG_TYPE_DEFAULT, "Updating Activity Cell with identifier:%@ to disabled:%s", (uint8_t *)&v9, 0x16u);
    }
    self->_disabled = v3;
    [(UIShareGroupActivityCell *)self _updateDarkening];
  }
}

- (void)_updateDarkening
{
  v27[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(UIShareGroupActivityCell *)self imageSlotView];
  BOOL v4 = [v3 layer];
  double v5 = [v4 contents];

  uint64_t v6 = [(UIShareGroupActivityCell *)self titleSlotView];
  double v7 = [v6 layer];
  uint64_t v8 = [v7 contents];

  int v9 = [(UIShareGroupActivityCell *)self badgeSlotView];
  uint64_t v10 = [v9 layer];
  __int16 v11 = [v10 contents];

  uint64_t v12 = [(UIShareGroupActivityCell *)self imageSlotView];
  uint64_t v13 = [v12 layer];
  [v13 setContents:v5];

  v14 = [(UIShareGroupActivityCell *)self titleSlotView];
  id v15 = [v14 layer];
  [v15 setContents:v8];

  id v16 = [(UIShareGroupActivityCell *)self badgeSlotView];
  double v17 = [v16 layer];
  [v17 setContents:v11];

  if (([(UIShareGroupActivityCell *)self isHighlighted] & 1) != 0
    || [(UIShareGroupActivityCell *)self isDisabled])
  {
    id v16 = [MEMORY[0x1E4FB1618] grayColor];
    uint64_t v18 = [v16 CGColor];
    int v19 = 1;
  }
  else
  {
    int v19 = 0;
    uint64_t v18 = 0;
  }
  v20 = [(UIShareGroupActivityCell *)self imageSlotView];
  v21 = [v20 layer];
  [v21 setContentsMultiplyColor:v18];

  if (v19) {
  if (([(UIShareGroupActivityCell *)self isHighlighted] & 1) != 0
  }
    || [(UIShareGroupActivityCell *)self isDisabled])
  {
    v22 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2A8]];
    id v23 = [MEMORY[0x1E4FB1618] colorWithWhite:0.5 alpha:1.0];
    objc_msgSend(v22, "setValue:forKey:", objc_msgSend(v23, "CGColor"), @"inputColor");

    v27[0] = v22;
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  }
  else
  {
    v24 = 0;
  }
  uint64_t v25 = [(UIShareGroupActivityCell *)self activityImageView];
  v26 = [v25 layer];
  [v26 setFilters:v24];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIShareGroupActivityCell *)self isHighlighted] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIShareGroupActivityCell;
    [(UIShareGroupActivityCell *)&v5 setHighlighted:v3];
    [(UIShareGroupActivityCell *)self _updateDarkening];
  }
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(UIShareGroupActivityCell *)self imageSlotView];
  uint64_t v6 = [v5 layer];
  double v7 = [v6 contents];

  uint64_t v8 = [(UIShareGroupActivityCell *)self titleSlotView];
  int v9 = [v8 layer];
  uint64_t v10 = [v9 contents];

  __int16 v11 = [(UIShareGroupActivityCell *)self badgeSlotView];
  uint64_t v12 = [v11 layer];
  uint64_t v13 = [v12 contents];

  v20.receiver = self;
  v20.super_class = (Class)UIShareGroupActivityCell;
  [(UIShareGroupActivityCell *)&v20 setSelected:v3];
  v14 = [(UIShareGroupActivityCell *)self imageSlotView];
  id v15 = [v14 layer];
  [v15 setContents:v7];

  id v16 = [(UIShareGroupActivityCell *)self titleSlotView];
  double v17 = [v16 layer];
  [v17 setContents:v10];

  uint64_t v18 = [(UIShareGroupActivityCell *)self badgeSlotView];
  int v19 = [v18 layer];
  [v19 setContents:v13];
}

- (void)setTitle:(id)a3
{
  id v5 = a3;
  title = self->_title;
  int v9 = (NSString *)v5;
  double v7 = title;
  if (v7 == v9)
  {

    goto LABEL_8;
  }
  if ((v9 == 0) == (v7 != 0))
  {

    goto LABEL_7;
  }
  char v8 = [(NSString *)v9 isEqual:v7];

  if ((v8 & 1) == 0)
  {
LABEL_7:
    objc_storeStrong((id *)&self->_title, a3);
    [(UIShareGroupActivityCell *)self _updateTitleView];
  }
LABEL_8:
}

- (void)setImage:(id)a3
{
  id v5 = (UIImage *)a3;
  p_image = &self->_image;
  if (self->_image != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)p_image, a3);
    p_image = (UIImage **)[(UIShareGroupActivityCell *)self _updateImageView];
    id v5 = v7;
  }
  MEMORY[0x1F41817F8](p_image, v5);
}

- (void)setImageSlotID:(unsigned int)a3
{
  if (self->_imageSlotID != a3)
  {
    self->_imageSlotID = a3;
    [(UIShareGroupActivityCell *)self _updateImageView];
  }
}

- (void)setTitleSlotID:(unsigned int)a3
{
  if (self->_titleSlotID != a3)
  {
    self->_titleSlotID = a3;
    [(UIShareGroupActivityCell *)self _updateTitleView];
  }
}

- (void)setBadgeSlotID:(unsigned int)a3
{
  if (self->_badgeSlotID != a3)
  {
    self->_badgeSlotID = a3;
    [(UIShareGroupActivityCell *)self _updateBadgeSlotView];
  }
}

- (void)startPulsing
{
  if (![(UIShareGroupActivityCell *)self isPulsing])
  {
    [(UIShareGroupActivityCell *)self setIsPulsing:1];
    BOOL v3 = [(UIShareGroupActivityCell *)self title];
    if ([v3 length]) {
      [(UIShareGroupActivityCell *)self titleLabel];
    }
    else {
    BOOL v4 = [(UIShareGroupActivityCell *)self titleSlotView];
    }

    [v4 setAlpha:1.0];
    id v5 = (void *)MEMORY[0x1E4FB1EB0];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __40__UIShareGroupActivityCell_startPulsing__block_invoke;
    v7[3] = &unk_1E5A21900;
    id v8 = v4;
    id v6 = v4;
    [v5 animateWithDuration:24 delay:v7 options:0 animations:0.75 completion:0.0];
  }
}

uint64_t __40__UIShareGroupActivityCell_startPulsing__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.2];
}

- (void)stopPulsing
{
  if ([(UIShareGroupActivityCell *)self isPulsing])
  {
    [(UIShareGroupActivityCell *)self setIsPulsing:0];
    BOOL v3 = [(UIShareGroupActivityCell *)self titleLabel];
    BOOL v4 = [v3 layer];
    [v4 removeAllAnimations];

    id v5 = [(UIShareGroupActivityCell *)self titleLabel];
    [v5 alpha];
    double v7 = v6;

    if (v7 > 0.0)
    {
      id v8 = [(UIShareGroupActivityCell *)self titleLabel];
      [v8 setAlpha:1.0];
    }
    int v9 = [(UIShareGroupActivityCell *)self titleSlotView];
    uint64_t v10 = [v9 layer];
    [v10 removeAllAnimations];

    __int16 v11 = [(UIShareGroupActivityCell *)self titleSlotView];
    [v11 alpha];
    double v13 = v12;

    if (v13 > 0.0)
    {
      id v14 = [(UIShareGroupActivityCell *)self titleSlotView];
      [v14 setAlpha:1.0];
    }
  }
}

- (void)_updateImageView
{
  [(UIShareGroupActivityCell *)self _configureImageViewForPlaceholder:0];
  BOOL v3 = [(UIShareGroupActivityCell *)self image];
  BOOL v4 = [(UIShareGroupActivityCell *)self activityImageView];
  [v4 setImage:v3];

  id v5 = [(UIShareGroupActivityCell *)self image];

  double v6 = [(UIShareGroupActivityCell *)self activityImageView];
  double v7 = v6;
  double v8 = 0.0;
  if (v5)
  {
    double v8 = 1.0;
    float v9 = 0.07;
  }
  else
  {
    float v9 = 0.0;
  }
  [v6 setAlpha:v8];

  uint64_t v10 = [(UIShareGroupActivityCell *)self activityImageView];
  __int16 v11 = [v10 layer];
  *(float *)&double v12 = v9;
  [v11 setShadowOpacity:v12];

  unsigned int v13 = [(UIShareGroupActivityCell *)self imageSlotID];
  if (v13)
  {
    id v14 = objc_msgSend(MEMORY[0x1E4F39B58], "objectForSlot:", -[UIShareGroupActivityCell imageSlotID](self, "imageSlotID"));
    uint64_t v15 = *MEMORY[0x1E4F3A3D0];
    id v16 = [(UIShareGroupActivityCell *)self imageSlotView];
    double v17 = [v16 layer];
    [v17 setContentsGravity:v15];

    uint64_t v18 = [(UIShareGroupActivityCell *)self imageSlotView];
    int v19 = [v18 layer];
    [v19 setContents:v14];

    objc_super v20 = [(UIShareGroupActivityCell *)self imageSlotView];
    [v20 setBackgroundColor:0];
LABEL_6:

    goto LABEL_11;
  }
  v21 = [(UIShareGroupActivityCell *)self imageSlotView];
  v22 = [v21 layer];
  [v22 setContents:0];

  if (v5)
  {
    objc_super v20 = [MEMORY[0x1E4FB1618] clearColor];
    id v14 = v20;
  }
  else
  {
    id v14 = [(UIShareGroupActivityCell *)self traitCollection];
    objc_super v20 = SHSheetUISpecPlaceholderColor([v14 userInterfaceStyle]);
  }
  id v23 = [(UIShareGroupActivityCell *)self activityImageView];
  [v23 setBackgroundColor:v20];

  if (!v5) {
    goto LABEL_6;
  }
LABEL_11:

  if (v13) {
    double v24 = 1.0;
  }
  else {
    double v24 = 0.0;
  }
  id v25 = [(UIShareGroupActivityCell *)self imageSlotView];
  [v25 setAlpha:v24];
}

- (void)_updateTitleView
{
  BOOL v3 = [(UIShareGroupActivityCell *)self title];
  uint64_t v4 = [v3 length];

  if (v4) {
    [(UIShareGroupActivityCell *)self title];
  }
  else {
  id v5 = [(UIShareGroupActivityCell *)self _placeholderString];
  }
  double v6 = [(UIShareGroupActivityCell *)self titleLabel];
  [v6 setText:v5];

  if (v4) {
    double v7 = 1.0;
  }
  else {
    double v7 = 0.0;
  }
  double v8 = [(UIShareGroupActivityCell *)self titleLabel];
  [v8 setAlpha:v7];

  unsigned int v9 = [(UIShareGroupActivityCell *)self titleSlotID];
  if (v9)
  {
    uint64_t v10 = [(UIShareGroupActivityCell *)self traitCollection];
    uint64_t v11 = [v10 layoutDirection];

    double v12 = [(UIShareGroupActivityCell *)self traitCollection];
    unsigned int v13 = [v12 preferredContentSizeCategory];
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v13);

    uint64_t v15 = (id *)MEMORY[0x1E4F3A3E8];
    if (v11 != 1) {
      uint64_t v15 = (id *)MEMORY[0x1E4F3A3C8];
    }
    id v16 = (void *)MEMORY[0x1E4F39B58];
    id v17 = *v15;
    uint64_t v18 = objc_msgSend(v16, "objectForSlot:", -[UIShareGroupActivityCell titleSlotID](self, "titleSlotID"));
    double v19 = _ShareSheetDeviceScreenScale();
    objc_super v20 = [(UIShareGroupActivityCell *)self titleSlotView];
    v21 = [v20 layer];
    [v21 setContentsScale:v19];

    double v22 = _ShareSheetDeviceScreenScale();
    id v23 = [(UIShareGroupActivityCell *)self titleSlotView];
    double v24 = [v23 layer];
    [v24 setRasterizationScale:v22];

    if (IsAccessibilityCategory) {
      id v25 = v17;
    }
    else {
      id v25 = (id)*MEMORY[0x1E4F3A3A8];
    }
    v26 = [(UIShareGroupActivityCell *)self titleSlotView];
    v27 = [v26 layer];
    [v27 setContentsGravity:v25];

    id v28 = [(UIShareGroupActivityCell *)self titleSlotView];
    uint64_t v29 = [v28 layer];
    [v29 setContents:v18];
  }
  else
  {
    uint64_t v18 = [(UIShareGroupActivityCell *)self titleSlotView];
    id v28 = [v18 layer];
    [v28 setContents:0];
  }

  if (v9) {
    double v30 = 1.0;
  }
  else {
    double v30 = 0.0;
  }
  id v31 = [(UIShareGroupActivityCell *)self titleSlotView];
  [v31 setAlpha:v30];
}

- (void)_updateBadgeSlotView
{
  unsigned int v3 = [(UIShareGroupActivityCell *)self badgeSlotID];
  if (v3)
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F39B58], "objectForSlot:", -[UIShareGroupActivityCell badgeSlotID](self, "badgeSlotID"));
    double v5 = _ShareSheetDeviceScreenScale();
    double v6 = [(UIShareGroupActivityCell *)self badgeSlotView];
    double v7 = [v6 layer];
    [v7 setContentsScale:v5];

    double v8 = _ShareSheetDeviceScreenScale();
    unsigned int v9 = [(UIShareGroupActivityCell *)self badgeSlotView];
    uint64_t v10 = [v9 layer];
    [v10 setRasterizationScale:v8];

    uint64_t v11 = *MEMORY[0x1E4F3A3C0];
    double v12 = [(UIShareGroupActivityCell *)self badgeSlotView];
    unsigned int v13 = [v12 layer];
    [v13 setContentsGravity:v11];

    id v14 = [(UIShareGroupActivityCell *)self badgeSlotView];
    uint64_t v15 = [v14 layer];
    [v15 setContents:v4];
  }
  else
  {
    uint64_t v4 = [(UIShareGroupActivityCell *)self badgeSlotView];
    id v14 = [v4 layer];
    [v14 setContents:0];
  }

  if (v3) {
    double v16 = 1.0;
  }
  else {
    double v16 = 0.0;
  }
  id v17 = [(UIShareGroupActivityCell *)self badgeSlotView];
  [v17 setAlpha:v16];
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (_UIHostActivityProxy)activityProxy
{
  return self->_activityProxy;
}

- (void)setActivityProxy:(id)a3
{
}

- (unsigned)imageSlotID
{
  return self->_imageSlotID;
}

- (unsigned)titleSlotID
{
  return self->_titleSlotID;
}

- (unsigned)badgeSlotID
{
  return self->_badgeSlotID;
}

- (NSString)title
{
  return self->_title;
}

- (UIImage)image
{
  return self->_image;
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (BOOL)isLongPressable
{
  return self->_longPressable;
}

- (void)setLongPressable:(BOOL)a3
{
  self->_longPressable = a3;
}

- (BOOL)isPulsing
{
  return self->_isPulsing;
}

- (void)setIsPulsing:(BOOL)a3
{
  self->_isPulsing = a3;
}

- (BOOL)didInstallSubviews
{
  return self->_didInstallSubviews;
}

- (void)setDidInstallSubviews:(BOOL)a3
{
  self->_didInstallSubviews = a3;
}

- (SHSheetContentLayoutSpec)layoutSpec
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutSpec);
  return (SHSheetContentLayoutSpec *)WeakRetained;
}

- (void)setLayoutSpec:(id)a3
{
}

- (UIVisualEffectView)vibrantLabelView
{
  return self->_vibrantLabelView;
}

- (void)setVibrantLabelView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)labelForPositioning
{
  return self->_labelForPositioning;
}

- (void)setLabelForPositioning:(id)a3
{
}

- (UIImageView)activityImageView
{
  return self->_activityImageView;
}

- (void)setActivityImageView:(id)a3
{
}

- (UIView)imageSlotView
{
  return self->_imageSlotView;
}

- (void)setImageSlotView:(id)a3
{
}

- (UIView)titleSlotView
{
  return self->_titleSlotView;
}

- (void)setTitleSlotView:(id)a3
{
}

- (UIView)badgeSlotView
{
  return self->_badgeSlotView;
}

- (void)setBadgeSlotView:(id)a3
{
}

- (NSMutableArray)allConstraints
{
  return self->_allConstraints;
}

- (void)setAllConstraints:(id)a3
{
}

- (NSArray)regularConstraints
{
  return self->_regularConstraints;
}

- (void)setRegularConstraints:(id)a3
{
}

- (NSArray)largeTextConstraints
{
  return self->_largeTextConstraints;
}

- (void)setLargeTextConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_largeTextConstraints, 0);
  objc_storeStrong((id *)&self->_regularConstraints, 0);
  objc_storeStrong((id *)&self->_allConstraints, 0);
  objc_storeStrong((id *)&self->_badgeSlotView, 0);
  objc_storeStrong((id *)&self->_titleSlotView, 0);
  objc_storeStrong((id *)&self->_imageSlotView, 0);
  objc_storeStrong((id *)&self->_activityImageView, 0);
  objc_storeStrong((id *)&self->_labelForPositioning, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_vibrantLabelView, 0);
  objc_destroyWeak((id *)&self->_layoutSpec);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_activityProxy, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end