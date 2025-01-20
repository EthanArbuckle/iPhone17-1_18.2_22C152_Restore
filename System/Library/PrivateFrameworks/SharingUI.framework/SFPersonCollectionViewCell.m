@interface SFPersonCollectionViewCell
+ (CGSize)_cachedPreferredItemSizeForString:(id)a3 viewWidth:(double)a4 sizeCategory:(id)a5;
+ (CGSize)_cachedPreferredItemSizeForViewWidth:(double)a3 sizeCategory:(id)a4;
- (BOOL)darkStyleOnLegacyApp;
- (BOOL)stateBeingRestored;
- (CGSize)calculatedContentSizeForSheetWidth:(double)a3 sizeCategory:(id)a4;
- (NSArray)largeTextConstraints;
- (NSArray)progressKeyPaths;
- (NSArray)regularConstraints;
- (NSArray)secondLabelVisibleConstraintsArray;
- (NSLayoutConstraint)cellWidthConstraint;
- (NSLayoutConstraint)chickletToTitleSpacingConstraint;
- (NSLayoutConstraint)largeTextNameCenterYConstraint;
- (NSLayoutConstraint)nameFirstBaselineConstraint;
- (NSLayoutConstraint)secondLabelFBConstraint;
- (NSProgress)progress;
- (NSString)sessionID;
- (SFAirDropNode)person;
- (SFCircleProgressView)circleProgressView;
- (SFPersonCollectionViewCell)initWithFrame:(CGRect)a3;
- (SFPersonCollectionViewCellDelegate)delegate;
- (SFPersonImageView)imageView;
- (UIColor)fadedSecondLabelColor;
- (UIImpactFeedbackGenerator)impactHaptic;
- (UILabel)labelForPositioning;
- (UILabel)nameLabel;
- (UILabel)secondLabel;
- (UINotificationFeedbackGenerator)notificationHaptic;
- (UISelectionFeedbackGenerator)selectionHaptic;
- (UIView)badgedContactView;
- (double)activitySheetWidth;
- (id)progressToken;
- (int64_t)cellState;
- (void)_updateForCurrentSizeCategory;
- (void)addObserverOfValuesForKeyPaths:(id)a3 ofObject:(id)a4;
- (void)deactivateHaptics;
- (void)dealloc;
- (void)fireHapticsForState:(int64_t)a3;
- (void)handleKVOUpdateForPerson:(id)a3 keyPath:(id)a4;
- (void)handleKVOUpdateForProgress:(id)a3 keyPath:(id)a4;
- (void)layoutSubviews;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)prepareForReuse;
- (void)prepareHaptics;
- (void)prepareHapticsPreWarm:(BOOL)a3;
- (void)removeObserverOfValuesForKeyPaths:(id)a3 ofObject:(id)a4;
- (void)resetTransferState;
- (void)restoreCellStateFromFinalTransferState:(int64_t)a3;
- (void)setActivitySheetWidth:(double)a3;
- (void)setBadgedContactView:(id)a3;
- (void)setCellState:(int64_t)a3;
- (void)setCellState:(int64_t)a3 animated:(BOOL)a4 silent:(BOOL)a5;
- (void)setCellWidthConstraint:(id)a3;
- (void)setChickletToTitleSpacingConstraint:(id)a3;
- (void)setCircleProgressView:(id)a3;
- (void)setDarkStyleOnLegacyApp:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setFadedSecondLabelColor:(id)a3;
- (void)setImageView:(id)a3;
- (void)setImpactHaptic:(id)a3;
- (void)setLabelForPositioning:(id)a3;
- (void)setLargeTextConstraints:(id)a3;
- (void)setLargeTextNameCenterYConstraint:(id)a3;
- (void)setNameFirstBaselineConstraint:(id)a3;
- (void)setNameLabel:(id)a3;
- (void)setNotificationHaptic:(id)a3;
- (void)setPerson:(id)a3;
- (void)setProgress:(id)a3;
- (void)setProgressKeyPaths:(id)a3;
- (void)setProgressToken:(id)a3;
- (void)setRegularConstraints:(id)a3;
- (void)setSecondLabel:(id)a3;
- (void)setSecondLabelFBConstraint:(id)a3;
- (void)setSecondLabelText:(id)a3 withTextColor:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)setSecondLabelVisibleConstraintsArray:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelectionHaptic:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setStateBeingRestored:(BOOL)a3;
- (void)setupConstraints;
- (void)setupConstraintsYukon;
- (void)traitCollectionDidChange:(id)a3;
- (void)triggerKVOForKeyPaths:(id)a3 ofObject:(id)a4;
- (void)updateNameLabel;
- (void)updatePersonIconView;
- (void)userDidCancel;
- (void)userDidSelect;
@end

@implementation SFPersonCollectionViewCell

+ (CGSize)_cachedPreferredItemSizeForViewWidth:(double)a3 sizeCategory:(id)a4
{
  [a1 _cachedPreferredItemSizeForString:@"Apple\nInc." viewWidth:a4 sizeCategory:a3];
  result.height = v5;
  result.width = v4;
  return result;
}

+ (CGSize)_cachedPreferredItemSizeForString:(id)a3 viewWidth:(double)a4 sizeCategory:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v9 = [NSString stringWithFormat:@"%@-%ld-%@", v7, (uint64_t)a4, v8];
  v10 = getCachedPreferredItemSizesByString();
  v11 = [v10 objectForKey:v9];

  if (!v11)
  {
    v12 = (SFPersonCollectionViewCell *)(id)__prototypeActivityCell;
    if (!v12)
    {
      v13 = objc_alloc_init(SFPersonCollectionViewCell);
      v14 = (void *)__prototypeActivityCell;
      __prototypeActivityCell = (uint64_t)v13;

      v12 = v13;
      v15 = [(SFPersonCollectionViewCell *)v12 nameLabel];
      [v15 setAdjustsFontSizeToFitWidth:0];
    }
    v16 = [(SFPersonCollectionViewCell *)v12 nameLabel];
    [v16 setText:v7];

    [(SFPersonCollectionViewCell *)v12 calculatedContentSizeForSheetWidth:v8 sizeCategory:a4];
    v11 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:");
    v17 = getCachedPreferredItemSizesByString();
    [v17 setObject:v11 forKey:v9];
  }
  [v11 CGSizeValue];
  double v19 = v18;
  double v21 = v20;

  double v22 = v19;
  double v23 = v21;
  result.height = v23;
  result.width = v22;
  return result;
}

- (SFPersonCollectionViewCell)initWithFrame:(CGRect)a3
{
  v52.receiver = self;
  v52.super_class = (Class)SFPersonCollectionViewCell;
  v3 = -[SFPersonCollectionViewCell initWithFrame:](&v52, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    progressKeyPaths = v3->_progressKeyPaths;
    v3->_progressKeyPaths = (NSArray *)&unk_26CE7E290;

    v6 = objc_alloc_init(SFPersonImageView);
    [(SFPersonImageView *)v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SFPersonImageView *)v6 setContentMode:2];
    id v7 = [MEMORY[0x263F825C8] blackColor];
    uint64_t v8 = [v7 CGColor];
    v9 = [(SFPersonImageView *)v6 layer];
    [v9 setShadowColor:v8];

    v10 = [(SFPersonImageView *)v6 layer];
    LODWORD(v11) = 1032805417;
    [v10 setShadowOpacity:v11];

    double v12 = *MEMORY[0x263F001B0];
    double v13 = *(double *)(MEMORY[0x263F001B0] + 8);
    v14 = [(SFPersonImageView *)v6 layer];
    objc_msgSend(v14, "setShadowOffset:", v12, v13);

    v15 = [(SFPersonImageView *)v6 layer];
    [v15 setShadowRadius:10.0];

    v16 = [(SFPersonImageView *)v6 layer];
    [v16 setShadowPathIsBounds:1];

    [(SFPersonCollectionViewCell *)v4 setImageView:v6];
    v17 = [(SFPersonCollectionViewCell *)v4 contentView];
    [v17 addSubview:v6];

    double v18 = [SFCircleProgressView alloc];
    double v19 = -[SFCircleProgressView initWithFrame:](v18, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [(SFCircleProgressView *)v19 setProgressLineWidth:2.0];
    [(SFCircleProgressView *)v19 setShowProgressTray:1];
    [(SFCircleProgressView *)v19 setAlpha:1.0];
    double v20 = [MEMORY[0x263F825C8] clearColor];
    [(SFCircleProgressView *)v19 setBackgroundColor:v20];

    [(SFCircleProgressView *)v19 setTranslatesAutoresizingMaskIntoConstraints:0];
    double v21 = [MEMORY[0x263F82670] currentDevice];
    -[SFCircleProgressView setUsesRoundedLineCap:](v19, "setUsesRoundedLineCap:", [v21 userInterfaceIdiom] == 6);

    [(SFPersonCollectionViewCell *)v4 setCircleProgressView:v19];
    double v22 = [(SFPersonCollectionViewCell *)v4 contentView];
    [v22 addSubview:v19];

    double v23 = [(SFPersonCollectionViewCell *)v4 traitCollection];
    v24 = [v23 preferredContentSizeCategory];
    v25 = createNameLabel(v24);
    [(SFPersonCollectionViewCell *)v4 setNameLabel:v25];

    v26 = [(SFPersonCollectionViewCell *)v4 contentView];
    v27 = [(SFPersonCollectionViewCell *)v4 nameLabel];
    [v26 addSubview:v27];

    v28 = [(SFPersonCollectionViewCell *)v4 traitCollection];
    v29 = [v28 preferredContentSizeCategory];
    id v30 = objc_alloc_init(MEMORY[0x263F828E0]);
    v31 = [MEMORY[0x263F825C8] secondaryLabelColor];
    [v30 setTextColor:v31];

    v32 = [v30 _screen];
    v33 = _SFPersonLabelFont();
    [v30 setFont:v33];

    v34 = [MEMORY[0x263F825C8] clearColor];
    [v30 setBackgroundColor:v34];

    if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)*MEMORY[0x263F83440], v29) == NSOrderedAscending) {
      uint64_t v35 = 4;
    }
    else {
      uint64_t v35 = 1;
    }
    [v30 setTextAlignment:v35];
    [v30 setNumberOfLines:1];
    [v30 setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v36) = 0.75;
    [v30 _setHyphenationFactor:v36];
    [(SFPersonCollectionViewCell *)v4 setSecondLabel:v30];

    v37 = [(SFPersonCollectionViewCell *)v4 contentView];
    v38 = [(SFPersonCollectionViewCell *)v4 secondLabel];
    [v37 addSubview:v38];

    v39 = [(SFPersonCollectionViewCell *)v4 traitCollection];
    v40 = [v39 preferredContentSizeCategory];
    v41 = createNameLabel(v40);
    [(SFPersonCollectionViewCell *)v4 setLabelForPositioning:v41];

    v42 = [(SFPersonCollectionViewCell *)v4 labelForPositioning];
    [v42 setAlpha:0.0];

    v43 = [(SFPersonCollectionViewCell *)v4 labelForPositioning];
    [v43 setText:@"Apple\nInc"];

    v44 = [(SFPersonCollectionViewCell *)v4 contentView];
    v45 = [(SFPersonCollectionViewCell *)v4 labelForPositioning];
    [v44 addSubview:v45];

    v46 = [(SFPersonCollectionViewCell *)v4 contentView];
    v47 = [MEMORY[0x263F825C8] clearColor];
    [v46 setBackgroundColor:v47];

    [v46 setTranslatesAutoresizingMaskIntoConstraints:1];
    [(SFPersonCollectionViewCell *)v4 setupConstraintsYukon];
    [(SFPersonCollectionViewCell *)v4 prepareHapticsPreWarm:0];
    v48 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v49 = [v48 userInterfaceIdiom];

    if (v49 == 6) {
      [(SFPersonCollectionViewCell *)v4 _setCornerRadius:12.0];
    }
    v50 = v4;
  }
  return v4;
}

- (void)dealloc
{
  [(SFPersonCollectionViewCell *)self setPerson:0];
  [(SFPersonCollectionViewCell *)self setProgress:0];
  v3.receiver = self;
  v3.super_class = (Class)SFPersonCollectionViewCell;
  [(SFPersonCollectionViewCell *)&v3 dealloc];
}

- (void)setupConstraints
{
  v99[9] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(SFPersonCollectionViewCell *)self circleProgressView];
  uint64_t v4 = [(SFPersonCollectionViewCell *)self contentView];
  double ChickletSize = getChickletSize();
  double v7 = v6;
  uint64_t v8 = (void *)MEMORY[0x263F08938];
  v90 = [(SFPersonCollectionViewCell *)self imageView];
  v87 = [v8 constraintWithItem:v3 attribute:7 relatedBy:0 toItem:v90 attribute:7 multiplier:1.0 constant:10.0];
  v99[0] = v87;
  v9 = (void *)MEMORY[0x263F08938];
  v84 = [(SFPersonCollectionViewCell *)self imageView];
  v81 = [v9 constraintWithItem:v3 attribute:8 relatedBy:0 toItem:v84 attribute:8 multiplier:1.0 constant:10.0];
  v99[1] = v81;
  v10 = (void *)MEMORY[0x263F08938];
  v80 = [(SFPersonCollectionViewCell *)self imageView];
  v94 = (void *)v3;
  v78 = [v10 constraintWithItem:v3 attribute:9 relatedBy:0 toItem:v80 attribute:9 multiplier:1.0 constant:0.0];
  v99[2] = v78;
  double v11 = (void *)MEMORY[0x263F08938];
  v76 = [(SFPersonCollectionViewCell *)self imageView];
  double v12 = [v11 constraintWithItem:v3 attribute:10 relatedBy:0 toItem:v76 attribute:10 multiplier:1.0 constant:0.0];
  v99[3] = v12;
  double v13 = [MEMORY[0x263F08938] constraintWithItem:v4 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:0.0];
  cellWidthConstraint = self->_cellWidthConstraint;
  self->_cellWidthConstraint = v13;

  v99[4] = v13;
  v15 = (void *)MEMORY[0x263F08938];
  v16 = [(SFPersonCollectionViewCell *)self imageView];
  v17 = [v15 constraintWithItem:v16 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v7];
  v99[5] = v17;
  double v18 = (void *)MEMORY[0x263F08938];
  double v19 = [(SFPersonCollectionViewCell *)self imageView];
  double v20 = [v18 constraintWithItem:v19 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v7];
  v99[6] = v20;
  double v21 = [MEMORY[0x263F08938] constraintWithItem:self->_nameLabel attribute:6 relatedBy:0 toItem:v4 attribute:6 multiplier:1.0 constant:-0.5];
  v99[7] = v21;
  double v22 = [MEMORY[0x263F08938] constraintWithItem:self->_secondLabel attribute:6 relatedBy:0 toItem:v4 attribute:6 multiplier:1.0 constant:-0.5];
  v99[8] = v22;
  v93 = [MEMORY[0x263EFF8C0] arrayWithObjects:v99 count:9];

  double v23 = (void *)MEMORY[0x263F08938];
  v91 = [(SFPersonCollectionViewCell *)self imageView];
  v88 = [v23 constraintWithItem:v91 attribute:3 relatedBy:0 toItem:v4 attribute:3 multiplier:1.0 constant:0.0];
  v98[0] = v88;
  v24 = (void *)MEMORY[0x263F08938];
  v85 = [(SFPersonCollectionViewCell *)self imageView];
  v25 = (void *)v4;
  v82 = [v24 constraintWithItem:v85 attribute:9 relatedBy:0 toItem:v4 attribute:9 multiplier:1.0 constant:0.0];
  v98[1] = v82;
  v26 = (void *)MEMORY[0x263F08938];
  nameLabel = self->_nameLabel;
  v28 = [(SFPersonCollectionViewCell *)self imageView];
  v29 = [v26 constraintWithItem:nameLabel attribute:12 relatedBy:0 toItem:v28 attribute:4 multiplier:1.0 constant:0.0];
  chickletToTitleSpacingConstraint = self->_chickletToTitleSpacingConstraint;
  self->_chickletToTitleSpacingConstraint = v29;

  v98[2] = v29;
  v31 = [MEMORY[0x263F08938] constraintWithItem:v25 attribute:4 relatedBy:0 toItem:self->_secondLabel attribute:11 multiplier:1.0 constant:0.0];
  v98[3] = v31;
  v95 = v25;
  v32 = [MEMORY[0x263F08938] constraintWithItem:self->_nameLabel attribute:5 relatedBy:0 toItem:v25 attribute:5 multiplier:1.0 constant:0.5];
  v98[4] = v32;
  v33 = [MEMORY[0x263F08938] constraintWithItem:self->_secondLabel attribute:5 relatedBy:0 toItem:v25 attribute:5 multiplier:1.0 constant:0.5];
  v98[5] = v33;
  v34 = [MEMORY[0x263F08938] constraintWithItem:self->_secondLabel attribute:3 relatedBy:0 toItem:self->_nameLabel attribute:12 multiplier:1.0 constant:3.0];
  secondLabelFBConstraint = self->_secondLabelFBConstraint;
  self->_secondLabelFBConstraint = v34;

  v98[6] = v34;
  double v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:v98 count:7];
  [(SFPersonCollectionViewCell *)self setRegularConstraints:v36];

  v89 = [(UILabel *)self->_labelForPositioning centerYAnchor];
  v92 = [(SFPersonCollectionViewCell *)self imageView];
  v86 = [v92 centerYAnchor];
  v83 = [v89 constraintEqualToAnchor:v86];
  v97[0] = v83;
  v77 = [(UILabel *)self->_labelForPositioning leadingAnchor];
  v79 = [(SFPersonCollectionViewCell *)self imageView];
  v75 = [v79 trailingAnchor];
  v74 = [v77 constraintEqualToAnchor:v75 constant:10.0];
  v97[1] = v74;
  v73 = [(UILabel *)self->_labelForPositioning trailingAnchor];
  v72 = [v25 trailingAnchor];
  v71 = [v73 constraintEqualToAnchor:v72 constant:-0.5];
  v97[2] = v71;
  v70 = [(UILabel *)self->_secondLabel firstBaselineAnchor];
  v69 = [(UILabel *)self->_labelForPositioning lastBaselineAnchor];
  v68 = [v70 constraintEqualToAnchor:v69];
  v97[3] = v68;
  v67 = [(SFPersonCollectionViewCell *)self imageView];
  v66 = [v67 topAnchor];
  v65 = [v25 topAnchor];
  v64 = [v66 constraintGreaterThanOrEqualToAnchor:v65 constant:5.0];
  v97[4] = v64;
  v63 = [(SFPersonCollectionViewCell *)self imageView];
  v62 = [v63 bottomAnchor];
  v61 = [v25 bottomAnchor];
  v60 = [v62 constraintLessThanOrEqualToAnchor:v61 constant:-5.0];
  v97[5] = v60;
  v58 = [(UILabel *)self->_nameLabel centerYAnchor];
  v59 = [(SFPersonCollectionViewCell *)self imageView];
  v57 = [v59 centerYAnchor];
  v37 = [v58 constraintEqualToAnchor:v57];
  largeTextNameCenterYConstraint = self->_largeTextNameCenterYConstraint;
  self->_largeTextNameCenterYConstraint = v37;

  v97[6] = v37;
  v39 = [(SFPersonCollectionViewCell *)self imageView];
  v40 = [v39 leadingAnchor];
  v41 = [v25 leadingAnchor];
  v42 = [v40 constraintEqualToAnchor:v41 constant:5.0];
  v97[7] = v42;
  v43 = (void *)MEMORY[0x263F08938];
  v44 = self->_nameLabel;
  v45 = [(SFPersonCollectionViewCell *)self imageView];
  v46 = [v43 constraintWithItem:v44 attribute:5 relatedBy:0 toItem:v45 attribute:6 multiplier:1.0 constant:10.0];
  v97[8] = v46;
  v47 = (void *)MEMORY[0x263F08938];
  secondLabel = self->_secondLabel;
  uint64_t v49 = [(SFPersonCollectionViewCell *)self imageView];
  v50 = [v47 constraintWithItem:secondLabel attribute:5 relatedBy:0 toItem:v49 attribute:6 multiplier:1.0 constant:10.0];
  v97[9] = v50;
  v51 = [MEMORY[0x263EFF8C0] arrayWithObjects:v97 count:10];
  [(SFPersonCollectionViewCell *)self setLargeTextConstraints:v51];

  objc_super v52 = [MEMORY[0x263F08938] constraintWithItem:self->_nameLabel attribute:11 relatedBy:0 toItem:self->_nameLabel attribute:12 multiplier:1.0 constant:0.0];
  v96[0] = v52;
  v53 = [(UILabel *)self->_nameLabel firstBaselineAnchor];
  v54 = [(UILabel *)self->_labelForPositioning firstBaselineAnchor];
  v55 = [v53 constraintEqualToAnchor:v54];
  v96[1] = v55;
  v56 = [MEMORY[0x263EFF8C0] arrayWithObjects:v96 count:2];
  [(SFPersonCollectionViewCell *)self setSecondLabelVisibleConstraintsArray:v56];

  [MEMORY[0x263F08938] activateConstraints:v93];
}

- (void)setupConstraintsYukon
{
  v196[16] = *MEMORY[0x263EF8340];
  v193 = [(SFPersonCollectionViewCell *)self circleProgressView];
  v192 = [(SFPersonCollectionViewCell *)self contentView];
  uint64_t v3 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  uint64_t v190 = v4;
  if (v4 == 6)
  {
    double v5 = 8.0;
    double v6 = -8.0;
    double v7 = 4.0;
    double v8 = 52.0;
    double v9 = -8.0;
  }
  else
  {
    v10 = [MEMORY[0x263F82B60] mainScreen];
    [v10 _referenceBounds];
    if (v11 >= 414.0)
    {
      double v12 = [MEMORY[0x263F82670] currentDevice];
      uint64_t v13 = [v12 userInterfaceIdiom];

      if ((v13 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
        double v8 = 62.0;
      }
      else {
        double v8 = 66.0;
      }
    }
    else
    {
      double v8 = 62.0;
    }

    double v9 = -5.0;
    double v6 = 0.0;
    double v7 = 10.0;
    double v5 = 0.0;
  }
  v14 = (void *)MEMORY[0x263EFF980];
  v187 = [(SFPersonCollectionViewCell *)self imageView];
  v184 = [v187 widthAnchor];
  v182 = [v184 constraintEqualToConstant:v8];
  v196[0] = v182;
  v180 = [(SFPersonCollectionViewCell *)self imageView];
  v178 = [v180 heightAnchor];
  v176 = [v178 constraintEqualToConstant:v8];
  v196[1] = v176;
  v174 = [(SFPersonCollectionViewCell *)self imageView];
  v172 = [v174 topAnchor];
  v170 = [v192 topAnchor];
  v168 = [v172 constraintEqualToAnchor:v170 constant:v5];
  v196[2] = v168;
  v166 = [(SFPersonCollectionViewCell *)self imageView];
  v164 = [v166 centerXAnchor];
  v162 = [v192 centerXAnchor];
  v160 = [v164 constraintEqualToAnchor:v162];
  v196[3] = v160;
  v158 = [(SFPersonCollectionViewCell *)self imageView];
  v154 = [v158 centerXAnchor];
  v156 = [(SFPersonCollectionViewCell *)self labelForPositioning];
  v152 = [v156 centerXAnchor];
  v150 = [v154 constraintEqualToAnchor:v152];
  v196[4] = v150;
  v148 = [(SFPersonCollectionViewCell *)self imageView];
  v144 = [v148 bottomAnchor];
  v146 = [(SFPersonCollectionViewCell *)self labelForPositioning];
  v142 = [v146 topAnchor];
  v140 = [v144 constraintEqualToAnchor:v142 constant:v9];
  v196[5] = v140;
  v138 = [(SFPersonCollectionViewCell *)self labelForPositioning];
  v136 = [v138 bottomAnchor];
  v134 = [v192 bottomAnchor];
  v132 = [v136 constraintEqualToAnchor:v134 constant:v6];
  v196[6] = v132;
  v130 = [(SFPersonCollectionViewCell *)self nameLabel];
  v126 = [v130 firstBaselineAnchor];
  v128 = [(SFPersonCollectionViewCell *)self labelForPositioning];
  v124 = [v128 firstBaselineAnchor];
  v122 = [v126 constraintEqualToAnchor:v124];
  v196[7] = v122;
  v120 = [(SFPersonCollectionViewCell *)self nameLabel];
  v118 = [v120 widthAnchor];
  v116 = [v192 widthAnchor];
  v114 = [v118 constraintEqualToAnchor:v116 constant:v6];
  v196[8] = v114;
  v112 = [(SFPersonCollectionViewCell *)self secondLabel];
  v108 = [v112 centerXAnchor];
  v110 = [(SFPersonCollectionViewCell *)self labelForPositioning];
  v106 = [v110 centerXAnchor];
  v104 = [v108 constraintEqualToAnchor:v106];
  v196[9] = v104;
  v102 = [(SFPersonCollectionViewCell *)self secondLabel];
  v100 = [v102 widthAnchor];
  v98 = [v192 widthAnchor];
  v96 = [v100 constraintEqualToAnchor:v98 constant:v6];
  v196[10] = v96;
  v94 = [(SFPersonCollectionViewCell *)self secondLabel];
  v90 = [v94 lastBaselineAnchor];
  v92 = [(SFPersonCollectionViewCell *)self labelForPositioning];
  v88 = [v92 lastBaselineAnchor];
  v86 = [v90 constraintEqualToAnchor:v88];
  v196[11] = v86;
  v82 = [v193 widthAnchor];
  v84 = [(SFPersonCollectionViewCell *)self imageView];
  v80 = [v84 widthAnchor];
  v78 = [v82 constraintEqualToAnchor:v80 constant:v7];
  v196[12] = v78;
  v74 = [v193 heightAnchor];
  v76 = [(SFPersonCollectionViewCell *)self imageView];
  v72 = [v76 heightAnchor];
  v70 = [v74 constraintEqualToAnchor:v72 constant:v7];
  v196[13] = v70;
  v68 = [v193 centerXAnchor];
  v15 = [(SFPersonCollectionViewCell *)self imageView];
  v16 = [v15 centerXAnchor];
  v17 = [v68 constraintEqualToAnchor:v16];
  v196[14] = v17;
  double v18 = [v193 centerYAnchor];
  double v19 = [(SFPersonCollectionViewCell *)self imageView];
  double v20 = [v19 centerYAnchor];
  double v21 = [v18 constraintEqualToAnchor:v20];
  v196[15] = v21;
  double v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v196 count:16];
  double v23 = [v14 arrayWithArray:v22];

  if (v190 == 6)
  {
    v24 = [(SFPersonCollectionViewCell *)self nameLabel];
    v25 = [v24 centerXAnchor];
    v26 = [(SFPersonCollectionViewCell *)self labelForPositioning];
    v27 = [v26 centerXAnchor];
    v28 = [v25 constraintEqualToAnchor:v27];
    [v23 addObject:v28];
  }
  v191 = v23;
  [(SFPersonCollectionViewCell *)self setRegularConstraints:v23];
  v29 = [(SFPersonCollectionViewCell *)self nameLabel];
  id v30 = [v29 centerYAnchor];
  v31 = [(SFPersonCollectionViewCell *)self imageView];
  v32 = [v31 centerYAnchor];
  v33 = [v30 constraintEqualToAnchor:v32];
  [(SFPersonCollectionViewCell *)self setLargeTextNameCenterYConstraint:v33];

  v34 = (void *)MEMORY[0x263EFF980];
  v188 = [(SFPersonCollectionViewCell *)self imageView];
  v185 = [v188 widthAnchor];
  v183 = [v185 constraintEqualToConstant:v8];
  v195[0] = v183;
  v181 = [(SFPersonCollectionViewCell *)self imageView];
  v179 = [v181 heightAnchor];
  v177 = [v179 constraintEqualToConstant:v8];
  v195[1] = v177;
  v175 = [(SFPersonCollectionViewCell *)self imageView];
  v173 = [v175 centerYAnchor];
  v171 = [v192 centerYAnchor];
  v169 = [v173 constraintEqualToAnchor:v171];
  v195[2] = v169;
  v167 = [(SFPersonCollectionViewCell *)self imageView];
  v165 = [v167 leadingAnchor];
  v163 = [v192 leadingAnchor];
  v161 = [v165 constraintEqualToAnchor:v163];
  v195[3] = v161;
  v159 = [(SFPersonCollectionViewCell *)self labelForPositioning];
  v157 = [v159 bottomAnchor];
  v155 = [v192 bottomAnchor];
  v153 = [v157 constraintEqualToAnchor:v155 constant:-8.0];
  v195[4] = v153;
  v151 = [(SFPersonCollectionViewCell *)self labelForPositioning];
  v149 = [v151 topAnchor];
  v147 = [v192 topAnchor];
  v145 = [v149 constraintEqualToAnchor:v147 constant:8.0];
  v195[5] = v145;
  v143 = [(SFPersonCollectionViewCell *)self labelForPositioning];
  v139 = [v143 leadingAnchor];
  v141 = [(SFPersonCollectionViewCell *)self imageView];
  v137 = [v141 trailingAnchor];
  v135 = [v139 constraintEqualToAnchor:v137 constant:13.0];
  v195[6] = v135;
  v133 = [(SFPersonCollectionViewCell *)self labelForPositioning];
  v131 = [v133 trailingAnchor];
  v129 = [v192 trailingAnchor];
  v127 = [v131 constraintEqualToAnchor:v129 constant:8.0];
  v195[7] = v127;
  v125 = [(SFPersonCollectionViewCell *)self nameLabel];
  v121 = [v125 firstBaselineAnchor];
  v123 = [(SFPersonCollectionViewCell *)self labelForPositioning];
  v119 = [v123 firstBaselineAnchor];
  v117 = [v121 constraintEqualToAnchor:v119];
  v195[8] = v117;
  v115 = [(SFPersonCollectionViewCell *)self nameLabel];
  v111 = [v115 leadingAnchor];
  v113 = [(SFPersonCollectionViewCell *)self imageView];
  v109 = [v113 trailingAnchor];
  v107 = [v111 constraintEqualToAnchor:v109 constant:13.0];
  v195[9] = v107;
  v105 = [(SFPersonCollectionViewCell *)self nameLabel];
  v103 = [v105 trailingAnchor];
  v101 = [v192 trailingAnchor];
  v99 = [v103 constraintEqualToAnchor:v101 constant:-8.0];
  v195[10] = v99;
  v95 = [v193 widthAnchor];
  v97 = [(SFPersonCollectionViewCell *)self imageView];
  v93 = [v97 widthAnchor];
  v91 = [v95 constraintEqualToAnchor:v93 constant:v7];
  v195[11] = v91;
  v87 = [v193 heightAnchor];
  v89 = [(SFPersonCollectionViewCell *)self imageView];
  v85 = [v89 heightAnchor];
  v83 = [v87 constraintEqualToAnchor:v85 constant:v7];
  v195[12] = v83;
  v79 = [v193 centerXAnchor];
  v81 = [(SFPersonCollectionViewCell *)self imageView];
  v77 = [v81 centerXAnchor];
  v75 = [v79 constraintEqualToAnchor:v77];
  v195[13] = v75;
  v71 = [v193 centerYAnchor];
  v73 = [(SFPersonCollectionViewCell *)self imageView];
  v69 = [v73 centerYAnchor];
  v67 = [v71 constraintEqualToAnchor:v69];
  v195[14] = v67;
  v66 = [(SFPersonCollectionViewCell *)self secondLabel];
  v64 = [v66 widthAnchor];
  v65 = [(SFPersonCollectionViewCell *)self nameLabel];
  v63 = [v65 widthAnchor];
  v62 = [v64 constraintEqualToAnchor:v63];
  v195[15] = v62;
  v61 = [(SFPersonCollectionViewCell *)self secondLabel];
  v59 = [v61 leadingAnchor];
  v60 = [(SFPersonCollectionViewCell *)self nameLabel];
  v58 = [v60 leadingAnchor];
  uint64_t v35 = [v59 constraintEqualToAnchor:v58];
  v195[16] = v35;
  double v36 = [(SFPersonCollectionViewCell *)self secondLabel];
  v37 = [v36 lastBaselineAnchor];
  v38 = [(SFPersonCollectionViewCell *)self labelForPositioning];
  v39 = [v38 lastBaselineAnchor];
  v40 = [v37 constraintEqualToAnchor:v39];
  v195[17] = v40;
  v41 = [(SFPersonCollectionViewCell *)self largeTextNameCenterYConstraint];
  v195[18] = v41;
  v42 = [MEMORY[0x263EFF8C0] arrayWithObjects:v195 count:19];
  v43 = [v34 arrayWithArray:v42];
  [(SFPersonCollectionViewCell *)self setLargeTextConstraints:v43];

  v189 = [(SFPersonCollectionViewCell *)self nameLabel];
  v186 = [v189 lastBaselineAnchor];
  v44 = [(SFPersonCollectionViewCell *)self nameLabel];
  v45 = [v44 firstBaselineAnchor];
  v46 = [v186 constraintEqualToAnchor:v45];
  v194[0] = v46;
  v47 = [(SFPersonCollectionViewCell *)self nameLabel];
  v48 = [v47 firstBaselineAnchor];
  uint64_t v49 = [(SFPersonCollectionViewCell *)self labelForPositioning];
  v50 = [v49 firstBaselineAnchor];
  v51 = [v48 constraintEqualToAnchor:v50];
  v194[1] = v51;
  objc_super v52 = [MEMORY[0x263EFF8C0] arrayWithObjects:v194 count:2];
  [(SFPersonCollectionViewCell *)self setSecondLabelVisibleConstraintsArray:v52];

  v53 = [(SFPersonCollectionViewCell *)self traitCollection];
  v54 = [v53 preferredContentSizeCategory];
  NSComparisonResult v55 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)*MEMORY[0x263F83440], v54);

  v56 = (void *)MEMORY[0x263F08938];
  if (v55 == NSOrderedAscending) {
    [(SFPersonCollectionViewCell *)self largeTextConstraints];
  }
  else {
  v57 = [(SFPersonCollectionViewCell *)self regularConstraints];
  }
  [v56 activateConstraints:v57];
}

- (void)setDarkStyleOnLegacyApp:(BOOL)a3
{
  self->_darkStyleOnLegacyApp = a3;
  nameLabel = self->_nameLabel;
  double v5 = [MEMORY[0x263F825C8] labelColor];
  [(UILabel *)nameLabel setColor:v5];

  id v6 = [MEMORY[0x263F825C8] secondaryLabelColor];
  [(SFPersonCollectionViewCell *)self setFadedSecondLabelColor:v6];
}

- (void)prepareForReuse
{
  v6.receiver = self;
  v6.super_class = (Class)SFPersonCollectionViewCell;
  [(SFPersonCollectionViewCell *)&v6 prepareForReuse];
  [(SFPersonCollectionViewCell *)self deactivateHaptics];
  [(SFPersonCollectionViewCell *)self setPerson:0];
  [(SFPersonCollectionViewCell *)self setProgress:0];
  [(SFPersonCollectionViewCell *)self setCellState:0];
  [(SFPersonCollectionViewCell *)self setSelected:0];
  uint64_t v3 = [(SFPersonCollectionViewCell *)self nameLabel];
  [v3 setText:0];

  uint64_t v4 = [(SFPersonCollectionViewCell *)self secondLabel];
  [v4 setText:0];

  double v5 = [(SFPersonCollectionViewCell *)self imageView];
  [v5 setImage:0];
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)SFPersonCollectionViewCell;
  [(SFPersonCollectionViewCell *)&v11 layoutSubviews];
  if ((dyld_program_sdk_at_least() & 1) == 0)
  {
    uint64_t v3 = [(SFPersonCollectionViewCell *)self contentView];
    [v3 frame];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;

    v10 = [(SFPersonCollectionViewCell *)self contentView];
    objc_msgSend(v10, "setFrame:", v5, 0.0, v7, v9);
  }
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SFPersonCollectionViewCell *)self isSelected] != a3)
  {
    uint64_t v5 = [(SFPersonCollectionViewCell *)self isHighlighted];
    v7.receiver = self;
    v7.super_class = (Class)SFPersonCollectionViewCell;
    [(SFPersonCollectionViewCell *)&v7 setSelected:v3];
    double v6 = [(SFPersonCollectionViewCell *)self imageView];
    [v6 setHighlighted:v5];
  }
}

- (void)setPerson:(id)a3
{
  p_person = &self->_person;
  double v6 = (SFAirDropNode *)a3;
  if (*p_person != v6)
  {
    -[SFPersonCollectionViewCell removeObserverOfValuesForKeyPaths:ofObject:](self, "removeObserverOfValuesForKeyPaths:ofObject:", &unk_26CE7E2A8);
    [(SFPersonCollectionViewCell *)self willChangeValueForKey:@"person"];
    objc_storeStrong((id *)&self->_person, a3);
    [(SFPersonCollectionViewCell *)self didChangeValueForKey:@"person"];
    [(SFPersonCollectionViewCell *)self addObserverOfValuesForKeyPaths:&unk_26CE7E2A8 ofObject:*p_person];
    if (*p_person)
    {
      [(SFPersonCollectionViewCell *)self updatePersonIconView];
      [(SFPersonCollectionViewCell *)self updateNameLabel];
    }
  }
}

- (void)setProgress:(id)a3
{
  uint64_t v5 = (NSProgress *)a3;
  p_progress = &self->_progress;
  if (self->_progress != v5)
  {
    objc_super v7 = v5;
    -[SFPersonCollectionViewCell removeObserverOfValuesForKeyPaths:ofObject:](self, "removeObserverOfValuesForKeyPaths:ofObject:", self->_progressKeyPaths);
    objc_storeStrong((id *)&self->_progress, a3);
    [(SFPersonCollectionViewCell *)self addObserverOfValuesForKeyPaths:self->_progressKeyPaths ofObject:*p_progress];
    [(SFPersonCollectionViewCell *)self triggerKVOForKeyPaths:self->_progressKeyPaths ofObject:*p_progress];
    uint64_t v5 = v7;
  }
}

- (void)setCellState:(int64_t)a3
{
}

- (void)setCellState:(int64_t)a3 animated:(BOOL)a4 silent:(BOOL)a5
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  int64_t cellState = self->_cellState;
  if (cellState != a3)
  {
    BOOL v7 = a4;
    unint64_t v10 = a3 - 2;
    if ((unint64_t)a3 < 2 || cellState <= a3)
    {
      progress = self->_progress;
      if (!progress || ([(NSProgress *)progress sf_initiator] & 1) != 0)
      {
        int v15 = 1;
      }
      else
      {
        if ((unint64_t)(a3 - 3) >= 4 && a3) {
          return;
        }
        [(SFCircleProgressView *)self->_circleProgressView setAlpha:0.0];
        int v15 = 0;
      }
      switch(a3)
      {
        case 0:
          [(SFPersonCollectionViewCell *)self prepareHaptics];
          [(SFPersonCollectionViewCell *)self setSecondLabelText:0 withTextColor:0 animated:v7 completion:0];
          [(SFCircleProgressView *)self->_circleProgressView setProgress:v7 animated:0 completion:0.0];
          circleProgressView = self->_circleProgressView;
          double v17 = 0.0;
          goto LABEL_33;
        case 1:
          *(void *)buf = 0;
          double v20 = [(SFPersonCollectionViewCell *)self secondLabel];
          objc_initWeak((id *)buf, v20);

          if (!a5) {
            [(SFPersonCollectionViewCell *)self fireHapticsForState:1];
          }
          double v21 = SFLocalizedStringForKey();
          double v22 = [(SFPersonCollectionViewCell *)self fadedSecondLabelColor];
          v59[0] = MEMORY[0x263EF8330];
          v59[1] = 3221225472;
          v59[2] = __59__SFPersonCollectionViewCell_setCellState_animated_silent___block_invoke;
          v59[3] = &unk_264472AD0;
          objc_copyWeak(&v60, (id *)buf);
          [(SFPersonCollectionViewCell *)self setSecondLabelText:v21 withTextColor:v22 animated:v7 completion:v59];

          [(SFCircleProgressView *)self->_circleProgressView setProgress:v7 animated:0 completion:0.0];
          if (v15) {
            [(SFCircleProgressView *)self->_circleProgressView setAlpha:1.0];
          }
          objc_destroyWeak(&v60);
          objc_destroyWeak((id *)buf);
          break;
        case 2:
          *(void *)buf = 0;
          double v23 = [(SFPersonCollectionViewCell *)self secondLabel];
          objc_initWeak((id *)buf, v23);

          if (!a5) {
            [(SFPersonCollectionViewCell *)self fireHapticsForState:2];
          }
          v24 = SFLocalizedStringForKey();
          v25 = [(SFPersonCollectionViewCell *)self fadedSecondLabelColor];
          v57[0] = MEMORY[0x263EF8330];
          v57[1] = 3221225472;
          v57[2] = __59__SFPersonCollectionViewCell_setCellState_animated_silent___block_invoke_3;
          v57[3] = &unk_264472AD0;
          objc_copyWeak(&v58, (id *)buf);
          [(SFPersonCollectionViewCell *)self setSecondLabelText:v24 withTextColor:v25 animated:v7 completion:v57];

          objc_destroyWeak(&v58);
          objc_destroyWeak((id *)buf);
          break;
        case 3:
          if (!a5) {
            [(SFPersonCollectionViewCell *)self fireHapticsForState:3];
          }
          v26 = SFLocalizedStringForKey();
          v27 = [(SFPersonCollectionViewCell *)self fadedSecondLabelColor];
          [(SFPersonCollectionViewCell *)self setSecondLabelText:v26 withTextColor:v27 animated:v7 completion:0];

          if (v15)
          {
            circleProgressView = self->_circleProgressView;
            double v17 = 1.0;
LABEL_33:
            [(SFCircleProgressView *)circleProgressView setAlpha:v17];
          }
          break;
        case 4:
          if (v7)
          {
            *(void *)buf = 0;
            objc_initWeak((id *)buf, self);
            v28 = self->_circleProgressView;
            v53[0] = MEMORY[0x263EF8330];
            v53[1] = 3221225472;
            v53[2] = __59__SFPersonCollectionViewCell_setCellState_animated_silent___block_invoke_5;
            v53[3] = &unk_264472AF8;
            BOOL v55 = a5;
            objc_copyWeak(&v54, (id *)buf);
            BOOL v56 = v7;
            [(SFCircleProgressView *)v28 animateProgressCompletedWithCompletion:v53];
            objc_destroyWeak(&v54);
            objc_destroyWeak((id *)buf);
          }
          else
          {
            uint64_t v35 = SFLocalizedStringForKey();
            double v36 = [MEMORY[0x263F825C8] systemBlueColor];
            [(SFPersonCollectionViewCell *)self setSecondLabelText:v35 withTextColor:v36 animated:0 completion:0];

            [(SFCircleProgressView *)self->_circleProgressView setAlpha:0.0];
            [(SFCircleProgressView *)self->_circleProgressView setProgress:1.0];
          }
          break;
        case 5:
          *(void *)buf = 0;
          objc_initWeak((id *)buf, self);
          v29 = SFLocalizedStringForKey();
          id v30 = [MEMORY[0x263F825C8] systemRedColor];
          [(SFPersonCollectionViewCell *)self setSecondLabelText:v29 withTextColor:v30 animated:v7 completion:0];

          v31 = self->_circleProgressView;
          v49[0] = MEMORY[0x263EF8330];
          v49[1] = 3221225472;
          v49[2] = __59__SFPersonCollectionViewCell_setCellState_animated_silent___block_invoke_7;
          v49[3] = &unk_264472AF8;
          BOOL v51 = v7;
          BOOL v52 = a5;
          objc_copyWeak(&v50, (id *)buf);
          [(SFCircleProgressView *)v31 setProgress:v7 animated:v49 completion:0.0];
          [(SFCircleProgressView *)self->_circleProgressView setAlpha:0.0];
          objc_destroyWeak(&v50);
          objc_destroyWeak((id *)buf);
          break;
        case 6:
          *(void *)buf = 0;
          objc_initWeak((id *)buf, self);
          v32 = SFLocalizedStringForKey();
          v33 = [MEMORY[0x263F825C8] systemRedColor];
          [(SFPersonCollectionViewCell *)self setSecondLabelText:v32 withTextColor:v33 animated:v7 completion:0];

          v34 = self->_circleProgressView;
          uint64_t v42 = MEMORY[0x263EF8330];
          uint64_t v43 = 3221225472;
          v44 = __59__SFPersonCollectionViewCell_setCellState_animated_silent___block_invoke_8;
          v45 = &unk_264472AF8;
          BOOL v47 = v7;
          BOOL v48 = a5;
          objc_copyWeak(&v46, (id *)buf);
          [(SFCircleProgressView *)v34 setProgress:v7 animated:&v42 completion:0.0];
          -[SFCircleProgressView setAlpha:](self->_circleProgressView, "setAlpha:", 0.0, v42, v43, v44, v45);
          objc_destroyWeak(&v46);
          objc_destroyWeak((id *)buf);
          break;
        default:
          break;
      }
      v37 = airdrop_ui_log();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v38 = self->_cellState;
        if (v38 > 6) {
          v39 = @"?";
        }
        else {
          v39 = off_264472B68[v38];
        }
        if ((unint64_t)a3 > 6) {
          v40 = @"?";
        }
        else {
          v40 = off_264472B68[a3];
        }
        v41 = [(SFAirDropNode *)self->_person displayName];
        *(_DWORD *)buf = 138412803;
        *(void *)&buf[4] = v39;
        __int16 v62 = 2112;
        v63 = v40;
        __int16 v64 = 2113;
        v65 = v41;
        _os_log_impl(&dword_21DB23000, v37, OS_LOG_TYPE_DEFAULT, "Changing cell state %@ -> %@ for person %{private}@", buf, 0x20u);
      }
      self->_int64_t cellState = a3;
    }
    else
    {
      objc_super v11 = airdrop_ui_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v12 = self->_cellState;
        if (v12 > 6) {
          uint64_t v13 = @"?";
        }
        else {
          uint64_t v13 = off_264472B68[v12];
        }
        if (v10 > 4) {
          double v18 = @"?";
        }
        else {
          double v18 = off_264472B40[v10];
        }
        double v19 = [(SFAirDropNode *)self->_person displayName];
        *(_DWORD *)buf = 138412803;
        *(void *)&buf[4] = v13;
        __int16 v62 = 2112;
        v63 = v18;
        __int16 v64 = 2113;
        v65 = v19;
        _os_log_impl(&dword_21DB23000, v11, OS_LOG_TYPE_DEFAULT, "Unsupported cell state transition %@ -> %@ for person %{private}@. Ignoring", buf, 0x20u);
      }
    }
  }
}

void __59__SFPersonCollectionViewCell_setCellState_animated_silent___block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F82E00];
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __59__SFPersonCollectionViewCell_setCellState_animated_silent___block_invoke_2;
  v2[3] = &unk_264471E48;
  objc_copyWeak(&v3, (id *)(a1 + 32));
  [v1 animateWithDuration:24 delay:v2 options:0 animations:0.75 completion:0.0];
  objc_destroyWeak(&v3);
}

void __59__SFPersonCollectionViewCell_setCellState_animated_silent___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setAlpha:0.2];
}

void __59__SFPersonCollectionViewCell_setCellState_animated_silent___block_invoke_3(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F82E00];
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __59__SFPersonCollectionViewCell_setCellState_animated_silent___block_invoke_4;
  v2[3] = &unk_264471E48;
  objc_copyWeak(&v3, (id *)(a1 + 32));
  [v1 animateWithDuration:24 delay:v2 options:0 animations:0.75 completion:0.0];
  objc_destroyWeak(&v3);
}

void __59__SFPersonCollectionViewCell_setCellState_animated_silent___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setAlpha:0.2];
}

void __59__SFPersonCollectionViewCell_setCellState_animated_silent___block_invoke_5(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 40))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained fireHapticsForState:4];
  }
  id v3 = objc_loadWeakRetained((id *)(a1 + 32));
  double v4 = SFLocalizedStringForKey();
  uint64_t v5 = [MEMORY[0x263F825C8] systemBlueColor];
  [v3 setSecondLabelText:v4 withTextColor:v5 animated:*(unsigned __int8 *)(a1 + 41) completion:0];

  double v6 = (void *)MEMORY[0x263F82E00];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__SFPersonCollectionViewCell_setCellState_animated_silent___block_invoke_6;
  v7[3] = &unk_264471E48;
  objc_copyWeak(&v8, (id *)(a1 + 32));
  [v6 animateWithDuration:v7 animations:0.5];
  objc_destroyWeak(&v8);
}

void __59__SFPersonCollectionViewCell_setCellState_animated_silent___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained circleProgressView];
  [v1 setAlpha:0.0];
}

void __59__SFPersonCollectionViewCell_setCellState_animated_silent___block_invoke_7(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40) && !*(unsigned char *)(a1 + 41))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained fireHapticsForState:5];
  }
}

void __59__SFPersonCollectionViewCell_setCellState_animated_silent___block_invoke_8(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40) && !*(unsigned char *)(a1 + 41))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained fireHapticsForState:6];
  }
}

- (void)restoreCellStateFromFinalTransferState:(int64_t)a3
{
  if ((unint64_t)(a3 - 4) <= 2)
  {
    [(SFPersonCollectionViewCell *)self setCellState:qword_21DBB22A8[a3 - 4]];
    [(SFPersonCollectionViewCell *)self updateNameLabel];
  }
}

- (void)prepareHaptics
{
}

- (void)prepareHapticsPreWarm:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = airdrop_ui_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SFPersonCollectionViewCell prepareHapticsPreWarm:]();
  }

  if (!self->_notificationHaptic)
  {
    double v6 = (UINotificationFeedbackGenerator *)objc_alloc_init(MEMORY[0x263F829D8]);
    notificationHaptic = self->_notificationHaptic;
    self->_notificationHaptic = v6;
  }
  if (!self->_impactHaptic)
  {
    id v8 = (UIImpactFeedbackGenerator *)[objc_alloc(MEMORY[0x263F82830]) initWithStyle:1];
    impactHaptic = self->_impactHaptic;
    self->_impactHaptic = v8;
  }
  if (self->_selectionHaptic)
  {
    if (!v3) {
      return;
    }
  }
  else
  {
    unint64_t v10 = (UISelectionFeedbackGenerator *)objc_alloc_init(MEMORY[0x263F82BC0]);
    selectionHaptic = self->_selectionHaptic;
    self->_selectionHaptic = v10;

    if (!v3) {
      return;
    }
  }
  unint64_t v12 = airdrop_ui_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[SFPersonCollectionViewCell prepareHapticsPreWarm:]();
  }

  [(UINotificationFeedbackGenerator *)self->_notificationHaptic prepare];
  [(UIImpactFeedbackGenerator *)self->_impactHaptic prepare];
  [(UISelectionFeedbackGenerator *)self->_selectionHaptic prepare];
}

- (void)deactivateHaptics
{
  notificationHaptic = self->_notificationHaptic;
  self->_notificationHaptic = 0;

  impactHaptic = self->_impactHaptic;
  self->_impactHaptic = 0;

  selectionHaptic = self->_selectionHaptic;
  self->_selectionHaptic = 0;
}

- (void)fireHapticsForState:(int64_t)a3
{
  uint64_t v4 = 0;
  switch(a3)
  {
    case 1:
    case 3:
      [(SFPersonCollectionViewCell *)self prepareHaptics];
      uint64_t v5 = airdrop_ui_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        -[SFPersonCollectionViewCell fireHapticsForState:]();
      }

      [(UIImpactFeedbackGenerator *)self->_impactHaptic impactOccurred];
      goto LABEL_16;
    case 2:
      [(SFPersonCollectionViewCell *)self prepareHaptics];
      BOOL v7 = airdrop_ui_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[SFPersonCollectionViewCell fireHapticsForState:].cold.4();
      }

      [(UISelectionFeedbackGenerator *)self->_selectionHaptic selectionChanged];
      goto LABEL_16;
    case 4:
      goto LABEL_13;
    case 5:
      uint64_t v4 = 1;
      goto LABEL_13;
    case 6:
      uint64_t v4 = 2;
LABEL_13:
      [(SFPersonCollectionViewCell *)self prepareHaptics];
      id v8 = airdrop_ui_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[SFPersonCollectionViewCell fireHapticsForState:]();
      }

      [(UINotificationFeedbackGenerator *)self->_notificationHaptic notificationOccurred:v4];
LABEL_16:
      [(SFPersonCollectionViewCell *)self prepareHaptics];
      break;
    default:
      double v6 = airdrop_ui_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        -[SFPersonCollectionViewCell fireHapticsForState:]();
      }

      break;
  }
}

- (void)updatePersonIconView
{
  BOOL stateBeingRestored = self->_stateBeingRestored;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__SFPersonCollectionViewCell_updatePersonIconView__block_invoke;
  aBlock[3] = &unk_264471EE0;
  aBlock[4] = self;
  uint64_t v4 = _Block_copy(aBlock);
  uint64_t v5 = v4;
  if (stateBeingRestored)
  {
    (*((void (**)(void *))v4 + 2))(v4);
  }
  else
  {
    double v6 = (void *)MEMORY[0x263F82E00];
    BOOL v7 = [(SFPersonCollectionViewCell *)self imageView];
    [v6 transitionWithView:v7 duration:5242880 options:v5 animations:0 completion:0.200000003];
  }
}

void __50__SFPersonCollectionViewCell_updatePersonIconView__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) person];
  uint64_t v3 = [v2 isClassroom];
  uint64_t v4 = [*(id *)(a1 + 32) imageView];
  [v4 setImageIsSquare:v3];

  id v5 = objc_alloc(MEMORY[0x263F827E8]);
  double v6 = [*(id *)(a1 + 32) person];
  id v8 = (id)objc_msgSend(v5, "initWithCGImage:", objc_msgSend(v6, "displayIcon"));

  BOOL v7 = [*(id *)(a1 + 32) imageView];
  [v7 setImage:v8];
}

- (void)updateNameLabel
{
  v35[3] = *MEMORY[0x263EF8340];
  person = self->_person;
  uint64_t v4 = [MEMORY[0x263EFF960] currentLocale];
  id v5 = [(SFAirDropNode *)person displayNameForLocale:v4];

  if (([(SFAirDropNode *)self->_person isMe] & 1) != 0
    || ([(SFAirDropNode *)self->_person isUnknown] & 1) != 0
    || ([(SFAirDropNode *)self->_person isClassroom] & 1) != 0
    || ([(SFPersonCollectionViewCell *)self traitCollection],
        double v6 = objc_claimAutoreleasedReturnValue(),
        [v6 preferredContentSizeCategory],
        BOOL v7 = (NSString *)objc_claimAutoreleasedReturnValue(),
        NSComparisonResult v8 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)*MEMORY[0x263F83440], v7),
        v7,
        v6,
        v8 == NSOrderedAscending))
  {
    if (([(SFAirDropNode *)self->_person isMe] & 1) != 0
      || [(SFAirDropNode *)self->_person isUnknown])
    {
      v28 = [(SFPersonCollectionViewCell *)self traitCollection];
      v29 = [v28 preferredContentSizeCategory];
      NSComparisonResult v30 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)*MEMORY[0x263F83440], v29);

      if (v30 != NSOrderedAscending)
      {
        uint64_t v31 = SFNonBreakingStringFromDeviceName();

        id v5 = (void *)v31;
      }
    }
  }
  else
  {
    id v9 = objc_alloc_init(MEMORY[0x263F81650]);
    [v9 setLineBreakMode:0];
    [v9 setHyphenationFactor:0.0];
    [v9 setLineBreakStrategy:0xFFFFLL];
    [v9 setAlignment:1];
    v34[0] = *MEMORY[0x263F81500];
    unint64_t v10 = [(UILabel *)self->_nameLabel textColor];
    v35[0] = v10;
    v34[1] = *MEMORY[0x263F814F0];
    objc_super v11 = [(UILabel *)self->_nameLabel font];
    v35[1] = v11;
    v34[2] = *MEMORY[0x263F81540];
    unint64_t v12 = (void *)[v9 copy];
    v35[2] = v12;
    uint64_t v13 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:3];

    v14 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    int v15 = [v5 componentsSeparatedByCharactersInSet:v14];

    if ([v15 count] == 2)
    {
      v16 = [v15 firstObject];
      double v17 = [v15 lastObject];
      if ([v16 length] && objc_msgSend(v17, "length"))
      {
        v33 = v17;
        double v18 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v16 attributes:v13];
        double v19 = [(SFPersonCollectionViewCell *)self nameLabel];
        [v19 frame];
        v32 = v18;
        objc_msgSend(v18, "boundingRectWithSize:options:context:", 35, 0, v20, v21);
        CGRect v37 = CGRectIntegral(v36);
        double height = v37.size.height;

        double v23 = [(SFPersonCollectionViewCell *)self nameLabel];
        v24 = [v23 font];
        [v24 lineHeight];
        *(float *)&double v25 = v25;
        LODWORD(v18) = llroundf(*(float *)&v25);

        float v26 = height;
        if ((int)llroundf(v26) / (int)v18 == 1)
        {
          double v17 = v33;
          uint64_t v27 = [NSString stringWithFormat:@"%@\n%@", v16, v33];

          id v5 = (void *)v27;
        }
        else
        {
          double v17 = v33;
        }
      }
    }
  }
  [(UILabel *)self->_nameLabel setText:v5];
}

- (void)setSecondLabelText:(id)a3 withTextColor:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  v40[1] = *MEMORY[0x263EF8340];
  unint64_t v9 = (unint64_t)a3;
  id v10 = a4;
  objc_super v11 = (void (**)(id, uint64_t))a6;
  unint64_t v12 = [(SFPersonCollectionViewCell *)self traitCollection];
  uint64_t v13 = [v12 preferredContentSizeCategory];
  NSComparisonResult v14 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)*MEMORY[0x263F83440], v13);

  if ([(id)v9 length])
  {
    if (v14 == NSOrderedAscending)
    {
      int v15 = (void *)MEMORY[0x263F08938];
      v16 = [(SFPersonCollectionViewCell *)self largeTextNameCenterYConstraint];
      v40[0] = v16;
      double v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:1];
      [v15 deactivateConstraints:v17];
    }
    double v18 = (void *)MEMORY[0x263F08938];
    double v19 = [(SFPersonCollectionViewCell *)self secondLabelVisibleConstraintsArray];
    [v18 activateConstraints:v19];

    double v20 = [(SFPersonCollectionViewCell *)self nameLabel];
    double v21 = v20;
    uint64_t v22 = 0;
  }
  else
  {
    if (v14 == NSOrderedAscending)
    {
      double v23 = (void *)MEMORY[0x263F08938];
      v24 = [(SFPersonCollectionViewCell *)self largeTextNameCenterYConstraint];
      v39 = v24;
      double v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v39 count:1];
      [v23 activateConstraints:v25];
    }
    float v26 = (void *)MEMORY[0x263F08938];
    uint64_t v27 = [(SFPersonCollectionViewCell *)self secondLabelVisibleConstraintsArray];
    [v26 deactivateConstraints:v27];

    double v20 = [(SFPersonCollectionViewCell *)self nameLabel];
    double v21 = v20;
    uint64_t v22 = 4;
  }
  [v20 setLineBreakMode:v22];

  v28 = [(SFPersonCollectionViewCell *)self secondLabel];
  uint64_t v29 = [v28 text];
  if (v9 | v29)
  {
    NSComparisonResult v30 = (void *)v29;
    uint64_t v31 = [(SFPersonCollectionViewCell *)self secondLabel];
    v32 = [v31 text];
    char v33 = [v32 isEqual:v9];

    if ((v33 & 1) == 0)
    {
      v34 = [(SFPersonCollectionViewCell *)self secondLabel];
      uint64_t v35 = [v34 layer];
      [v35 removeAllAnimations];

      CGRect v36 = [(SFPersonCollectionViewCell *)self secondLabel];
      [v36 setAlpha:1.0];

      CGRect v37 = [(SFPersonCollectionViewCell *)self secondLabel];
      [v37 setText:v9];

      unint64_t v38 = [(SFPersonCollectionViewCell *)self secondLabel];
      [v38 setTextColor:v10];

      [(SFPersonCollectionViewCell *)self setNeedsLayout];
      if (v11) {
        v11[2](v11, 1);
      }
    }
  }
  else
  {
  }
}

- (void)resetTransferState
{
  [(SFPersonCollectionViewCell *)self setCellState:0 animated:1 silent:1];
  [(SFPersonCollectionViewCell *)self updateNameLabel];
}

- (void)userDidSelect
{
  [(SFPersonCollectionViewCell *)self resetTransferState];
  [(SFPersonCollectionViewCell *)self setCellState:2 animated:1 silent:0];
}

- (void)userDidCancel
{
  if ((self->_cellState | 2) != 6)
  {
    [(NSProgress *)self->_progress cancel];
    [(SFAirDropNode *)self->_person cancelSend];
    [(SFPersonCollectionViewCell *)self setCellState:0 animated:1 silent:1];
    [(SFPersonCollectionViewCell *)self updateNameLabel];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = [MEMORY[0x263F08B88] mainThread];

  if (v13)
  {
    if ([v11 isEqual:self->_person])
    {
      [(SFPersonCollectionViewCell *)self handleKVOUpdateForPerson:self->_person keyPath:v10];
    }
    else if ([v11 isEqual:self->_progress])
    {
      [(SFPersonCollectionViewCell *)self handleKVOUpdateForProgress:self->_progress keyPath:v10];
    }
    else
    {
      NSComparisonResult v14 = airdrop_ui_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[SFPersonCollectionViewCell observeValueForKeyPath:ofObject:change:context:]((uint64_t)self, (uint64_t)v10, v14);
      }
    }
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __77__SFPersonCollectionViewCell_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_264472B20;
    block[4] = self;
    id v16 = v10;
    id v17 = v11;
    id v18 = v12;
    double v19 = a6;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __77__SFPersonCollectionViewCell_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) observeValueForKeyPath:*(void *)(a1 + 40) ofObject:*(void *)(a1 + 48) change:*(void *)(a1 + 56) context:*(void *)(a1 + 64)];
}

- (void)addObserverOfValuesForKeyPaths:(id)a3 ofObject:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v6);
          }
          [v7 addObserver:self forKeyPath:*(void *)(*((void *)&v12 + 1) + 8 * v11++) options:0 context:0];
        }
        while (v9 != v11);
        uint64_t v9 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (void)removeObserverOfValuesForKeyPaths:(id)a3 ofObject:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v6);
          }
          [v7 removeObserver:self forKeyPath:*(void *)(*((void *)&v12 + 1) + 8 * v11++)];
        }
        while (v9 != v11);
        uint64_t v9 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (void)triggerKVOForKeyPaths:(id)a3 ofObject:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v6);
          }
          [(SFPersonCollectionViewCell *)self observeValueForKeyPath:*(void *)(*((void *)&v12 + 1) + 8 * v11++) ofObject:v7 change:0 context:0];
        }
        while (v9 != v11);
        uint64_t v9 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SFPersonCollectionViewCell;
  id v4 = a3;
  [(SFPersonCollectionViewCell *)&v8 traitCollectionDidChange:v4];
  id v5 = [(SFPersonCollectionViewCell *)self traitCollection];
  id v6 = [v5 preferredContentSizeCategory];
  id v7 = [v4 preferredContentSizeCategory];

  if (v6 != v7) {
    [(SFPersonCollectionViewCell *)self _updateForCurrentSizeCategory];
  }
}

- (void)_updateForCurrentSizeCategory
{
  uint64_t v3 = [(SFPersonCollectionViewCell *)self traitCollection];
  rhs = [v3 preferredContentSizeCategory];

  NSComparisonResult v4 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)*MEMORY[0x263F83440], rhs);
  id v5 = [(SFPersonCollectionViewCell *)self _screen];
  id v6 = _SFPersonLabelFont();

  id v7 = [(SFPersonCollectionViewCell *)self secondLabel];
  [v7 setFont:v6];

  objc_super v8 = [(SFPersonCollectionViewCell *)self nameLabel];
  [v8 setFont:v6];

  uint64_t v9 = [(SFPersonCollectionViewCell *)self labelForPositioning];
  [v9 setFont:v6];

  nameLabel = self->_nameLabel;
  if (v4 == NSOrderedAscending)
  {
    [(UILabel *)nameLabel setTextAlignment:4];
    [(UILabel *)self->_secondLabel setTextAlignment:4];
    long long v14 = (void *)MEMORY[0x263F08938];
    long long v15 = [(SFPersonCollectionViewCell *)self regularConstraints];
    [v14 deactivateConstraints:v15];

    long long v13 = (void *)MEMORY[0x263F08938];
    [(SFPersonCollectionViewCell *)self largeTextConstraints];
  }
  else
  {
    [(UILabel *)nameLabel setTextAlignment:1];
    [(UILabel *)self->_secondLabel setTextAlignment:1];
    uint64_t v11 = (void *)MEMORY[0x263F08938];
    long long v12 = [(SFPersonCollectionViewCell *)self largeTextConstraints];
    [v11 deactivateConstraints:v12];

    long long v13 = (void *)MEMORY[0x263F08938];
    [(SFPersonCollectionViewCell *)self regularConstraints];
  id v16 = };
  [v13 activateConstraints:v16];

  [(SFPersonCollectionViewCell *)self setNeedsLayout];
}

- (void)handleKVOUpdateForPerson:(id)a3 keyPath:(id)a4
{
  id v5 = a4;
  if (([v5 isEqual:@"displayIcon"] & 1) != 0
    || ([v5 isEqual:@"monogram"] & 1) != 0
    || ([v5 isEqual:@"unknown"] & 1) != 0
    || [v5 isEqualToString:@"me"])
  {
    [(SFPersonCollectionViewCell *)self updatePersonIconView];
  }
  else if (([v5 isEqual:@"displayName"] & 1) != 0 {
         || [v5 isEqual:@"secondaryName"])
  }
  {
    [(SFPersonCollectionViewCell *)self updateNameLabel];
  }
}

- (void)handleKVOUpdateForProgress:(id)a3 keyPath:(id)a4
{
  id v5 = a4;
  BOOL stateBeingRestored = self->_stateBeingRestored;
  BOOL v7 = !self->_stateBeingRestored;
  if ([v5 isEqualToString:@"userInfo.sendState"])
  {
    switch([(NSProgress *)self->_progress sf_transferState])
    {
      case 0:
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained personCollectionViewCellDidStartTransfer:self];

        uint64_t v9 = self;
        uint64_t v10 = 2;
        BOOL v11 = v7;
        BOOL v12 = stateBeingRestored;
        goto LABEL_10;
      case 1:
        BOOL v12 = stateBeingRestored;
        uint64_t v9 = self;
        uint64_t v10 = 1;
        goto LABEL_9;
      case 2:
        BOOL v12 = stateBeingRestored;
        uint64_t v9 = self;
        uint64_t v10 = 2;
        goto LABEL_9;
      case 3:
        BOOL v12 = stateBeingRestored;
        uint64_t v9 = self;
        uint64_t v10 = 3;
LABEL_9:
        BOOL v11 = v7;
LABEL_10:
        [(SFPersonCollectionViewCell *)v9 setCellState:v10 animated:v11 silent:v12];
        break;
      case 4:
        long long v14 = airdrop_ui_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          -[SFPersonCollectionViewCell handleKVOUpdateForProgress:keyPath:]((uint64_t)self, v14);
        }

        long long v15 = self;
        uint64_t v16 = 5;
        BOOL v17 = v7;
        BOOL v18 = stateBeingRestored;
        goto LABEL_17;
      case 5:
        double v19 = airdrop_ui_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
          -[SFPersonCollectionViewCell handleKVOUpdateForProgress:keyPath:]((id *)&self->_progress, v19);
        }

        long long v15 = self;
        uint64_t v16 = 6;
        BOOL v17 = v7;
        BOOL v18 = stateBeingRestored;
LABEL_17:
        [(SFPersonCollectionViewCell *)v15 setCellState:v16 animated:v17 silent:v18];
        [(SFCircleProgressView *)self->_circleProgressView setProgress:v7 animated:0 completion:0.0];
        id v20 = objc_loadWeakRetained((id *)&self->_delegate);
        [v20 personCollectionViewCellDidTerminateTransfer:self];
        goto LABEL_19;
      case 6:
        [(SFPersonCollectionViewCell *)self setCellState:4 animated:v7 silent:stateBeingRestored];
        id v20 = objc_loadWeakRetained((id *)&self->_delegate);
        [v20 personCollectionViewCellDidFinishTransfer:self];
LABEL_19:

        break;
      default:
        break;
    }
  }
  else if ([v5 isEqualToString:@"fractionCompleted"])
  {
    circleProgressView = self->_circleProgressView;
    [(NSProgress *)self->_progress fractionCompleted];
    -[SFCircleProgressView setProgress:animated:completion:](circleProgressView, "setProgress:animated:completion:", v7, 0);
  }
}

- (CGSize)calculatedContentSizeForSheetWidth:(double)a3 sizeCategory:(id)a4
{
  id v5 = (NSString *)a4;
  id v6 = [(SFPersonCollectionViewCell *)self _screen];
  BOOL v7 = _SFPersonLabelFont();

  double ChickletSize = getChickletSize();
  id v9 = v7;
  NSComparisonResult v10 = UIContentSizeCategoryCompareToCategory(v5, (UIContentSizeCategory)*MEMORY[0x263F83450]);

  if (v10 == NSOrderedAscending)
  {
    double v13 = 1.0;
  }
  else
  {
    [v9 pointSize];
    double v12 = v11 / 11.0;
    if (v12 <= 2.0) {
      double v13 = v12;
    }
    else {
      double v13 = 2.0;
    }
  }

  [v9 ascender];
  long long v14 = [(SFPersonCollectionViewCell *)self nameLabel];
  long long v15 = [v14 text];
  id v16 = v9;
  BOOL v17 = (void *)sNameLabel;
  if (!sNameLabel)
  {
    uint64_t v18 = createNameLabel((void *)*MEMORY[0x263F83468]);
    double v19 = (void *)sNameLabel;
    sNameLabel = v18;

    BOOL v17 = (void *)sNameLabel;
  }
  [v17 setFont:v16];
  [(id)sNameLabel setText:v15];
  objc_msgSend((id)sNameLabel, "sizeThatFits:", v13 * ChickletSize + 10.0, 1.79769313e308);

  [v16 descender];
  id v20 = [MEMORY[0x263F82B60] mainScreen];
  [v20 scale];
  UIRectIntegralWithScale();
  double v22 = v21;
  double v24 = v23;

  double v25 = v22;
  double v26 = v24;
  result.double height = v26;
  result.width = v25;
  return result;
}

- (BOOL)darkStyleOnLegacyApp
{
  return self->_darkStyleOnLegacyApp;
}

- (SFAirDropNode)person
{
  return self->_person;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (int64_t)cellState
{
  return self->_cellState;
}

- (BOOL)stateBeingRestored
{
  return self->_stateBeingRestored;
}

- (void)setStateBeingRestored:(BOOL)a3
{
  self->_BOOL stateBeingRestored = a3;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (SFPersonCollectionViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SFPersonCollectionViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)activitySheetWidth
{
  return self->_activitySheetWidth;
}

- (void)setActivitySheetWidth:(double)a3
{
  self->_activitySheetWidth = a3;
}

- (SFPersonImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UIView)badgedContactView
{
  return self->_badgedContactView;
}

- (void)setBadgedContactView:(id)a3
{
}

- (SFCircleProgressView)circleProgressView
{
  return self->_circleProgressView;
}

- (void)setCircleProgressView:(id)a3
{
}

- (id)progressToken
{
  return self->_progressToken;
}

- (void)setProgressToken:(id)a3
{
}

- (NSArray)progressKeyPaths
{
  return self->_progressKeyPaths;
}

- (void)setProgressKeyPaths:(id)a3
{
}

- (UILabel)secondLabel
{
  return self->_secondLabel;
}

- (void)setSecondLabel:(id)a3
{
}

- (NSArray)secondLabelVisibleConstraintsArray
{
  return self->_secondLabelVisibleConstraintsArray;
}

- (void)setSecondLabelVisibleConstraintsArray:(id)a3
{
}

- (UIColor)fadedSecondLabelColor
{
  return self->_fadedSecondLabelColor;
}

- (void)setFadedSecondLabelColor:(id)a3
{
}

- (UILabel)labelForPositioning
{
  return self->_labelForPositioning;
}

- (void)setLabelForPositioning:(id)a3
{
}

- (UINotificationFeedbackGenerator)notificationHaptic
{
  return self->_notificationHaptic;
}

- (void)setNotificationHaptic:(id)a3
{
}

- (UISelectionFeedbackGenerator)selectionHaptic
{
  return self->_selectionHaptic;
}

- (void)setSelectionHaptic:(id)a3
{
}

- (UIImpactFeedbackGenerator)impactHaptic
{
  return self->_impactHaptic;
}

- (void)setImpactHaptic:(id)a3
{
}

- (NSLayoutConstraint)secondLabelFBConstraint
{
  return self->_secondLabelFBConstraint;
}

- (void)setSecondLabelFBConstraint:(id)a3
{
}

- (NSLayoutConstraint)cellWidthConstraint
{
  return self->_cellWidthConstraint;
}

- (void)setCellWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)chickletToTitleSpacingConstraint
{
  return self->_chickletToTitleSpacingConstraint;
}

- (void)setChickletToTitleSpacingConstraint:(id)a3
{
}

- (NSLayoutConstraint)nameFirstBaselineConstraint
{
  return self->_nameFirstBaselineConstraint;
}

- (void)setNameFirstBaselineConstraint:(id)a3
{
}

- (NSLayoutConstraint)largeTextNameCenterYConstraint
{
  return self->_largeTextNameCenterYConstraint;
}

- (void)setLargeTextNameCenterYConstraint:(id)a3
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

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_largeTextConstraints, 0);
  objc_storeStrong((id *)&self->_regularConstraints, 0);
  objc_storeStrong((id *)&self->_largeTextNameCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_nameFirstBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_chickletToTitleSpacingConstraint, 0);
  objc_storeStrong((id *)&self->_cellWidthConstraint, 0);
  objc_storeStrong((id *)&self->_secondLabelFBConstraint, 0);
  objc_storeStrong((id *)&self->_impactHaptic, 0);
  objc_storeStrong((id *)&self->_selectionHaptic, 0);
  objc_storeStrong((id *)&self->_notificationHaptic, 0);
  objc_storeStrong((id *)&self->_labelForPositioning, 0);
  objc_storeStrong((id *)&self->_fadedSecondLabelColor, 0);
  objc_storeStrong((id *)&self->_secondLabelVisibleConstraintsArray, 0);
  objc_storeStrong((id *)&self->_secondLabel, 0);
  objc_storeStrong((id *)&self->_progressKeyPaths, 0);
  objc_storeStrong(&self->_progressToken, 0);
  objc_storeStrong((id *)&self->_circleProgressView, 0);
  objc_storeStrong((id *)&self->_badgedContactView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_person, 0);
}

- (void)prepareHapticsPreWarm:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_21DB23000, v0, v1, "Preparing haptics.", v2, v3, v4, v5, v6);
}

- (void)prepareHapticsPreWarm:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_21DB23000, v0, v1, "Ensuring haptics initialized...", v2, v3, v4, v5, v6);
}

- (void)fireHapticsForState:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3(&dword_21DB23000, v0, v1, "Haptics not supported for cell state: (%ld)", v2);
}

- (void)fireHapticsForState:.cold.2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3(&dword_21DB23000, v0, v1, "Firing haptic (type = %ld)", v2);
}

- (void)fireHapticsForState:.cold.3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_21DB23000, v0, v1, "Firing haptic (type = impact)", v2, v3, v4, v5, v6);
}

- (void)fireHapticsForState:.cold.4()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_21DB23000, v0, v1, "Firing haptic (type = selection)", v2, v3, v4, v5, v6);
}

- (void)observeValueForKeyPath:(NSObject *)a3 ofObject:change:context:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint8_t v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0_0();
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_21DB23000, a3, OS_LOG_TYPE_ERROR, "%@: incorrect object for keypath %@", v7, 0x16u);
}

- (void)handleKVOUpdateForProgress:(uint64_t)a1 keyPath:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [*(id *)(a1 + 648) displayName];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3(&dword_21DB23000, a2, v4, "SFAirDropTransferProgressStateCanceled by: %@", v5);
}

- (void)handleKVOUpdateForProgress:(id *)a1 keyPath:(NSObject *)a2 .cold.2(id *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_msgSend(*a1, "sf_error");
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3(&dword_21DB23000, a2, v4, "SFAirDropTransferProgressStateFailed with error: %@", v5);
}

@end