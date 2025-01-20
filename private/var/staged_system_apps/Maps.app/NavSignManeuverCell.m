@interface NavSignManeuverCell
+ (double)heightForItem:(id)a3 width:(double)a4 maximumHeight:(double)a5;
- (BOOL)_shouldPostBacklightSceneRequiresUpdateNotification:(id)a3;
- (BOOL)hideManeuverArrow;
- (GuidanceManeuverView)guidanceManeuverView;
- (NSLayoutConstraint)exitShieldTrailingConstraint;
- (NSLayoutConstraint)imageAreaWidthConstraint;
- (NSLayoutConstraint)imageHeightConstraint;
- (NSLayoutConstraint)imageLeadingConstraint;
- (NSLayoutConstraint)imageWidthConstraint;
- (NSLayoutConstraint)primaryLeadingConstraint;
- (NSLayoutConstraint)primaryToExitShieldConstraint;
- (NSLayoutConstraint)primaryTopConstraint;
- (NSLayoutConstraint)primaryTrailingConstraint;
- (NSLayoutConstraint)secondaryTopConstraint;
- (NSLayoutConstraint)secondaryTrailingConstraint;
- (NSLayoutConstraint)tertiaryBottomConstraint;
- (NSLayoutConstraint)tertiaryTopConstraint;
- (NavSignManeuverCell)initWithFrame:(CGRect)a3;
- (NavSignManeuverCellDelegate)delegate;
- (UIImageView)exitShieldImageView;
- (UIImageView)shieldImageView;
- (UILabel)primaryTextLabel;
- (UILabel)secondaryTextLabel;
- (UILabel)tertiaryTextLabel;
- (UIView)mapsBackgroundView;
- (unint64_t)state;
- (void)_updateStateWithLayoutProgress:(double)a3;
- (void)redrawContent;
- (void)setDelegate:(id)a3;
- (void)setExitShieldImageView:(id)a3;
- (void)setExitShieldTrailingConstraint:(id)a3;
- (void)setGuidanceManeuverView:(id)a3;
- (void)setHideManeuverArrow:(BOOL)a3;
- (void)setImageAreaWidthConstraint:(id)a3;
- (void)setImageHeightConstraint:(id)a3;
- (void)setImageLeadingConstraint:(id)a3;
- (void)setImageWidthConstraint:(id)a3;
- (void)setItem:(id)a3;
- (void)setMapsBackgroundView:(id)a3;
- (void)setPrimaryLeadingConstraint:(id)a3;
- (void)setPrimaryTextLabel:(id)a3;
- (void)setPrimaryToExitShieldConstraint:(id)a3;
- (void)setPrimaryTopConstraint:(id)a3;
- (void)setPrimaryTrailingConstraint:(id)a3;
- (void)setSecondaryTextLabel:(id)a3;
- (void)setSecondaryTopConstraint:(id)a3;
- (void)setSecondaryTrailingConstraint:(id)a3;
- (void)setSelectedWithLayoutProgress:(double)a3;
- (void)setShieldImageView:(id)a3;
- (void)setState:(unint64_t)a3 layoutProgress:(double)a4;
- (void)setTertiaryBottomConstraint:(id)a3;
- (void)setTertiaryTextLabel:(id)a3;
- (void)setTertiaryTopConstraint:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation NavSignManeuverCell

- (NavSignManeuverCell)initWithFrame:(CGRect)a3
{
  v159.receiver = self;
  v159.super_class = (Class)NavSignManeuverCell;
  v3 = -[RouteStepListCollectionCell initWithFrame:](&v159, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    [(NavSignManeuverCell *)v3 setAccessibilityIdentifier:v5];

    uint64_t v6 = objc_opt_new();
    mapsBackgroundView = v3->_mapsBackgroundView;
    v3->_mapsBackgroundView = (UIView *)v6;

    [(UIView *)v3->_mapsBackgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
    v8 = [(NavSignManeuverCell *)v3 contentView];
    [v8 setAccessibilityIdentifier:@"NavSignManeuverCellContent"];

    v9 = [(NavSignManeuverCell *)v3 contentView];
    [v9 addSubview:v3->_mapsBackgroundView];

    v10 = objc_opt_new();
    [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v10 setAccessibilityIdentifier:@"ImageContainerView"];
    v11 = [(NavSignManeuverCell *)v3 contentView];
    [v11 addSubview:v10];

    v12 = [GuidanceManeuverView alloc];
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v16 = -[GuidanceManeuverView initWithFrame:textureProvider:](v12, "initWithFrame:textureProvider:", 0, CGRectZero.origin.x, y, width, height);
    guidanceManeuverView = v3->_guidanceManeuverView;
    v3->_guidanceManeuverView = v16;

    [(GuidanceManeuverView *)v3->_guidanceManeuverView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(GuidanceManeuverView *)v3->_guidanceManeuverView setFraming:1];
    [v10 addSubview:v3->_guidanceManeuverView];
    v18 = [objc_alloc((Class)UIImageView) initWithFrame:CGRectZero.origin.x, y, width, height];
    shieldImageView = v3->_shieldImageView;
    v3->_shieldImageView = v18;

    [(UIImageView *)v3->_shieldImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v3->_shieldImageView setAccessibilityIdentifier:@"ShieldImageView"];
    [v10 addSubview:v3->_shieldImageView];
    uint64_t v20 = objc_opt_new();
    primaryTextLabel = v3->_primaryTextLabel;
    v3->_primaryTextLabel = (UILabel *)v20;

    [(UILabel *)v3->_primaryTextLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_primaryTextLabel setNumberOfLines:0];
    [(UILabel *)v3->_primaryTextLabel setAccessibilityIdentifier:@"PrimaryTextLabel"];
    LODWORD(v22) = 1148829696;
    [(UILabel *)v3->_primaryTextLabel setContentCompressionResistancePriority:1 forAxis:v22];
    v23 = [(NavSignManeuverCell *)v3 contentView];
    [v23 addSubview:v3->_primaryTextLabel];

    uint64_t v24 = objc_opt_new();
    exitShieldImageView = v3->_exitShieldImageView;
    v3->_exitShieldImageView = (UIImageView *)v24;

    [(UIImageView *)v3->_exitShieldImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v3->_exitShieldImageView setContentMode:1];
    [(UIImageView *)v3->_exitShieldImageView setIsAccessibilityElement:1];
    [(UIImageView *)v3->_exitShieldImageView setAccessibilityIdentifier:@"ExitShieldImageView"];
    LODWORD(v26) = 1148846080;
    [(UIImageView *)v3->_exitShieldImageView setContentHuggingPriority:0 forAxis:v26];
    LODWORD(v27) = 1148829696;
    [(UIImageView *)v3->_exitShieldImageView setContentCompressionResistancePriority:1 forAxis:v27];
    v28 = [(NavSignManeuverCell *)v3 contentView];
    [v28 addSubview:v3->_exitShieldImageView];

    uint64_t v29 = objc_opt_new();
    secondaryTextLabel = v3->_secondaryTextLabel;
    v3->_secondaryTextLabel = (UILabel *)v29;

    [(UILabel *)v3->_secondaryTextLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_secondaryTextLabel setNumberOfLines:0];
    [(UILabel *)v3->_secondaryTextLabel setAccessibilityIdentifier:@"SecondaryTextLabel"];
    v31 = [(NavSignManeuverCell *)v3 contentView];
    [v31 addSubview:v3->_secondaryTextLabel];

    uint64_t v32 = objc_opt_new();
    tertiaryTextLabel = v3->_tertiaryTextLabel;
    v3->_tertiaryTextLabel = (UILabel *)v32;

    [(UILabel *)v3->_tertiaryTextLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_tertiaryTextLabel setNumberOfLines:0];
    [(UILabel *)v3->_tertiaryTextLabel setAccessibilityIdentifier:@"TertiaryTextLabel"];
    v34 = [(NavSignManeuverCell *)v3 contentView];
    [v34 addSubview:v3->_tertiaryTextLabel];

    v35 = [v10 leadingAnchor];
    v36 = [(NavSignManeuverCell *)v3 contentView];
    v37 = [v36 leadingAnchor];
    uint64_t v38 = [v35 constraintEqualToAnchor:v37];
    imageLeadingConstraint = v3->_imageLeadingConstraint;
    v3->_imageLeadingConstraint = (NSLayoutConstraint *)v38;

    v158 = v10;
    v40 = [v10 widthAnchor];
    uint64_t v41 = [v40 constraintEqualToConstant:0.0];
    imageAreaWidthConstraint = v3->_imageAreaWidthConstraint;
    v3->_imageAreaWidthConstraint = (NSLayoutConstraint *)v41;

    v43 = [(GuidanceManeuverView *)v3->_guidanceManeuverView widthAnchor];
    uint64_t v44 = [v43 constraintEqualToConstant:0.0];
    imageWidthConstraint = v3->_imageWidthConstraint;
    v3->_imageWidthConstraint = (NSLayoutConstraint *)v44;

    v46 = [(GuidanceManeuverView *)v3->_guidanceManeuverView heightAnchor];
    uint64_t v47 = [v46 constraintEqualToConstant:0.0];
    imageHeightConstraint = v3->_imageHeightConstraint;
    v3->_imageHeightConstraint = (NSLayoutConstraint *)v47;

    v49 = [(UILabel *)v3->_primaryTextLabel leadingAnchor];
    v50 = [v10 trailingAnchor];
    uint64_t v51 = [v49 constraintEqualToAnchor:v50];
    primaryLeadingConstraint = v3->_primaryLeadingConstraint;
    v3->_primaryLeadingConstraint = (NSLayoutConstraint *)v51;

    v53 = [(UILabel *)v3->_primaryTextLabel trailingAnchor];
    v54 = [(NavSignManeuverCell *)v3 contentView];
    v55 = [v54 trailingAnchor];
    uint64_t v56 = [v53 constraintEqualToAnchor:v55];
    primaryTrailingConstraint = v3->_primaryTrailingConstraint;
    v3->_primaryTrailingConstraint = (NSLayoutConstraint *)v56;

    v58 = [(UILabel *)v3->_primaryTextLabel trailingAnchor];
    v59 = [(UIImageView *)v3->_exitShieldImageView leadingAnchor];
    uint64_t v60 = [v58 constraintEqualToAnchor:v59];
    primaryToExitShieldConstraint = v3->_primaryToExitShieldConstraint;
    v3->_primaryToExitShieldConstraint = (NSLayoutConstraint *)v60;

    v62 = [(UIImageView *)v3->_exitShieldImageView trailingAnchor];
    v63 = [(NavSignManeuverCell *)v3 contentView];
    v64 = [v63 trailingAnchor];
    uint64_t v65 = [v62 constraintEqualToAnchor:v64];
    exitShieldTrailingConstraint = v3->_exitShieldTrailingConstraint;
    v3->_exitShieldTrailingConstraint = (NSLayoutConstraint *)v65;

    v67 = [(UILabel *)v3->_secondaryTextLabel trailingAnchor];
    v68 = [(NavSignManeuverCell *)v3 contentView];
    v69 = [v68 trailingAnchor];
    uint64_t v70 = [v67 constraintEqualToAnchor:v69];
    secondaryTrailingConstraint = v3->_secondaryTrailingConstraint;
    v3->_secondaryTrailingConstraint = (NSLayoutConstraint *)v70;

    v72 = [(UILabel *)v3->_tertiaryTextLabel bottomAnchor];
    v73 = [(NavSignManeuverCell *)v3 contentView];
    v74 = [v73 bottomAnchor];
    uint64_t v75 = [v72 constraintLessThanOrEqualToAnchor:v74];
    tertiaryBottomConstraint = v3->_tertiaryBottomConstraint;
    v3->_tertiaryBottomConstraint = (NSLayoutConstraint *)v75;

    v77 = [(UILabel *)v3->_primaryTextLabel topAnchor];
    v78 = [(NavSignManeuverCell *)v3 contentView];
    v79 = [v78 topAnchor];
    uint64_t v80 = [v77 constraintEqualToAnchor:v79];
    primaryTopConstraint = v3->_primaryTopConstraint;
    v3->_primaryTopConstraint = (NSLayoutConstraint *)v80;

    v82 = [(UILabel *)v3->_secondaryTextLabel topAnchor];
    v83 = [(UILabel *)v3->_primaryTextLabel bottomAnchor];
    uint64_t v84 = [v82 constraintEqualToAnchor:v83];
    secondaryTopConstraint = v3->_secondaryTopConstraint;
    v3->_secondaryTopConstraint = (NSLayoutConstraint *)v84;

    v86 = [(UILabel *)v3->_tertiaryTextLabel topAnchor];
    v87 = [(UILabel *)v3->_secondaryTextLabel bottomAnchor];
    uint64_t v88 = [v86 constraintEqualToAnchor:v87];
    tertiaryTopConstraint = v3->_tertiaryTopConstraint;
    v3->_tertiaryTopConstraint = (NSLayoutConstraint *)v88;

    v162[0] = v3->_primaryTopConstraint;
    v162[1] = v3->_tertiaryBottomConstraint;
    uint64_t v90 = +[NSArray arrayWithObjects:v162 count:2];
    primaryTopAnchoredConstraints = v3->_primaryTopAnchoredConstraints;
    v3->_primaryTopAnchoredConstraints = (NSArray *)v90;

    v92 = [(UILabel *)v3->_primaryTextLabel centerYAnchor];
    v93 = [(NavSignManeuverCell *)v3 contentView];
    v94 = [v93 centerYAnchor];
    v95 = [v92 constraintEqualToAnchor:v94];
    v161 = v95;
    uint64_t v96 = +[NSArray arrayWithObjects:&v161 count:1];
    primaryCenteredAnchoredConstraints = v3->_primaryCenteredAnchoredConstraints;
    v3->_primaryCenteredAnchoredConstraints = (NSArray *)v96;

    v150 = [(UIView *)v3->_mapsBackgroundView leadingAnchor];
    v151 = [(NavSignManeuverCell *)v3 contentView];
    v148 = [v151 leadingAnchor];
    v146 = [v150 constraintEqualToAnchor:v148];
    v160[0] = v146;
    v143 = [(UIView *)v3->_mapsBackgroundView trailingAnchor];
    v144 = [(NavSignManeuverCell *)v3 contentView];
    v142 = [v144 trailingAnchor];
    v141 = [v143 constraintEqualToAnchor:v142];
    v160[1] = v141;
    v138 = [(UIView *)v3->_mapsBackgroundView topAnchor];
    v139 = [(NavSignManeuverCell *)v3 contentView];
    v137 = [v139 topAnchor];
    v136 = [v138 constraintEqualToAnchor:v137];
    v160[2] = v136;
    v135 = [(UIView *)v3->_mapsBackgroundView bottomAnchor];
    v156 = [(NavSignManeuverCell *)v3 contentView];
    v134 = [v156 bottomAnchor];
    v133 = [v135 constraintEqualToAnchor:v134];
    v160[3] = v133;
    v160[4] = v3->_imageLeadingConstraint;
    v132 = [v158 topAnchor];
    v147 = [(NavSignManeuverCell *)v3 contentView];
    v131 = [v147 topAnchor];
    v130 = [v132 constraintEqualToAnchor:v131];
    v160[5] = v130;
    v128 = [v158 bottomAnchor];
    v129 = [(NavSignManeuverCell *)v3 contentView];
    v127 = [v129 bottomAnchor];
    v126 = [v128 constraintEqualToAnchor:v127];
    v160[6] = v126;
    v160[7] = v3->_imageAreaWidthConstraint;
    v152 = [(GuidanceManeuverView *)v3->_guidanceManeuverView centerXAnchor];
    v125 = [v158 centerXAnchor];
    v124 = [v152 constraintEqualToAnchor:v125];
    v160[8] = v124;
    v123 = [(GuidanceManeuverView *)v3->_guidanceManeuverView centerYAnchor];
    v122 = [v158 centerYAnchor];
    v121 = [v123 constraintEqualToAnchor:v122];
    v160[9] = v121;
    v160[10] = v3->_imageWidthConstraint;
    v160[11] = v3->_imageHeightConstraint;
    v154 = [(UIImageView *)v3->_shieldImageView topAnchor];
    v149 = [(GuidanceManeuverView *)v3->_guidanceManeuverView topAnchor];
    v120 = [v154 constraintEqualToAnchor:v149];
    v160[12] = v120;
    v119 = [(UIImageView *)v3->_shieldImageView bottomAnchor];
    v118 = [(GuidanceManeuverView *)v3->_guidanceManeuverView bottomAnchor];
    v117 = [v119 constraintEqualToAnchor:v118];
    v160[13] = v117;
    v116 = [(UIImageView *)v3->_shieldImageView leadingAnchor];
    v115 = [(GuidanceManeuverView *)v3->_guidanceManeuverView leadingAnchor];
    v114 = [v116 constraintEqualToAnchor:v115];
    v160[14] = v114;
    v157 = [(UIImageView *)v3->_shieldImageView trailingAnchor];
    v145 = [(GuidanceManeuverView *)v3->_guidanceManeuverView trailingAnchor];
    v113 = [v157 constraintEqualToAnchor:v145];
    v160[15] = v113;
    v160[16] = v3->_primaryLeadingConstraint;
    v160[17] = v3->_primaryTrailingConstraint;
    v160[18] = v3->_primaryTopConstraint;
    v160[19] = v3->_exitShieldTrailingConstraint;
    v153 = [(UIImageView *)v3->_exitShieldImageView widthAnchor];
    v155 = [(NavSignManeuverCell *)v3 contentView];
    v140 = [v155 widthAnchor];
    v112 = [v153 constraintLessThanOrEqualToAnchor:v140 multiplier:0.349999994];
    v160[20] = v112;
    v111 = [(UIImageView *)v3->_exitShieldImageView centerYAnchor];
    v110 = [(UILabel *)v3->_primaryTextLabel centerYAnchor];
    v109 = [v111 constraintEqualToAnchor:v110];
    v160[21] = v109;
    v108 = [(UILabel *)v3->_secondaryTextLabel leadingAnchor];
    v98 = [(UILabel *)v3->_primaryTextLabel leadingAnchor];
    v99 = [v108 constraintEqualToAnchor:v98];
    v160[22] = v99;
    v160[23] = v3->_secondaryTrailingConstraint;
    v160[24] = v3->_secondaryTopConstraint;
    v100 = [(UILabel *)v3->_tertiaryTextLabel leadingAnchor];
    v101 = [(UILabel *)v3->_secondaryTextLabel leadingAnchor];
    v102 = [v100 constraintEqualToAnchor:v101];
    v160[25] = v102;
    v103 = [(UILabel *)v3->_tertiaryTextLabel trailingAnchor];
    v104 = [(UILabel *)v3->_secondaryTextLabel trailingAnchor];
    v105 = [v103 constraintEqualToAnchor:v104];
    v160[26] = v105;
    v160[27] = v3->_tertiaryTopConstraint;
    v160[28] = v3->_tertiaryBottomConstraint;
    v106 = +[NSArray arrayWithObjects:v160 count:29];
    +[NSLayoutConstraint activateConstraints:v106];

    [(NavSignManeuverCell *)v3 setSelectedWithLayoutProgress:0.0];
  }
  return v3;
}

+ (double)heightForItem:(id)a3 width:(double)a4 maximumHeight:(double)a5
{
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v8 = v7;
  }
  else {
    v8 = 0;
  }
  id v9 = v8;
  v10 = [v9 metrics];
  [v10 imageAreaWidth];
  double v12 = a4 - v11;

  v13 = [v9 metrics];
  [v13 textTrailingMargin];
  double v15 = v14;

  v16 = [v9 metrics];
  [v16 imageTopMargin];
  double v18 = v17;
  v19 = [v9 metrics];
  [v19 stepImageHeight];
  double v21 = v20;
  double v22 = [v9 metrics];
  [v22 imageBottomMargin];
  double v24 = v23;

  v25 = [v9 primaryText];
  if (v25)
  {
    double v66 = v18;
    double v67 = v24;
    double v26 = v15;
    double v27 = a5;
    double v28 = a4 * 0.349999994;
    uint64_t v29 = [v9 exitSignImage];
    [v29 size];
    double v31 = v30;
    double v32 = v28;
    if (v28 >= v30)
    {
      double v22 = [v9 exitSignImage];
      [v22 size];
      double v32 = v33;
    }
    v34 = [v9 metrics];
    [v34 exitSignPadding];
    double v36 = v35;

    if (v28 >= v31) {
    v37 = [v9 exitSignImage];
    }
    a5 = v27;
    if (v37)
    {
      double v38 = v32 + v36 * 2.0;
    }
    else
    {
      v40 = [v9 metrics];
      [v40 textTrailingMargin];
      double v38 = v41;
    }
    double v15 = v26;

    v42 = [v9 metrics];
    [v42 primaryTextTopMargin];
    double v44 = v43 + 0.0;

    [v25 boundingRectWithSize:1 options:0 context:v12 - v38 1.79769313e308];
    double v39 = v44 + ceil(CGRectGetHeight(v68) + v68.origin.y);
    double v18 = v66;
    double v24 = v67;
  }
  else
  {
    double v39 = 0.0;
  }
  double v45 = v18 + v21;
  double v46 = v12 - v15;
  uint64_t v47 = [v9 secondaryText];
  if (v47)
  {
    v48 = [v9 metrics];
    [v48 secondaryTextTopMargin];
    double v50 = v39 + v49;

    [v47 boundingRectWithSize:1 options:0 context:v46];
    double v39 = v50 + ceil(CGRectGetHeight(v69) + v69.origin.y);
  }
  double v51 = v45 + v24;
  v52 = [v9 tertiaryText];
  v54 = v52;
  if (v52)
  {
    [v52 boundingRectWithSize:1 options:0 context:v46];
    double y = v70.origin.y;
    double Height = CGRectGetHeight(v70);
    v57 = [v9 metrics];
    [v57 tertiaryTextTopMargin];
    double v59 = v58 + ceil(Height + y);

    double v53 = v39 + v59;
    uint64_t v60 = 4 * (v39 + v59 > a5);
    if (v39 + v59 <= a5) {
      double v39 = v39 + v59;
    }
  }
  else
  {
    uint64_t v60 = 4;
  }
  [v9 setExcludedFieldsMask:v60, v53];
  v61 = [v9 metrics];
  [v61 textBottomMargin];
  double v63 = v39 + v62;

  if (v51 <= v63) {
    double v51 = v63;
  }
  if (sub_100C58A2C()) {
    double v64 = 98.0;
  }
  else {
    double v64 = 110.0;
  }
  if (v51 <= v64)
  {
    if (sub_100C58A2C()) {
      double v51 = 98.0;
    }
    else {
      double v51 = 110.0;
    }
  }

  return v51;
}

- (void)setItem:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NavSignManeuverCell;
  [(RouteStepListCollectionCell *)&v4 setItem:a3];
  [(NavSignManeuverCell *)self redrawContent];
}

- (void)setHideManeuverArrow:(BOOL)a3
{
  if (self->_hideManeuverArrow != a3)
  {
    self->_hideManeuverArrow = a3;
    [(NavSignManeuverCell *)self redrawContent];
  }
}

- (void)setState:(unint64_t)a3 layoutProgress:(double)a4
{
  self->_state = a3;
  [(NavSignManeuverCell *)self _updateStateWithLayoutProgress:a4];
}

- (void)setSelectedWithLayoutProgress:(double)a3
{
  if (self->_state == 1
    && ([(NavSignManeuverCell *)self traitCollection],
        v5 = objc_claimAutoreleasedReturnValue(),
        unsigned int v6 = [v5 isLuminanceReduced],
        v5,
        v6))
  {
    id v7 = sub_1008265CC();
    id v11 = v7;
    double v8 = a3;
  }
  else
  {
    id v7 = sub_10082634C();
    double v8 = a3 * 0.239999995;
    id v11 = v7;
  }
  id v9 = [v7 colorWithAlphaComponent:v8];
  v10 = [(NavSignManeuverCell *)self mapsBackgroundView];
  [v10 setBackgroundColor:v9];
}

- (void)redrawContent
{
  v3 = [(RouteStepListCollectionCell *)self item];
  unsigned int v4 = [(NavSignManeuverCell *)self _shouldPostBacklightSceneRequiresUpdateNotification:v3];
  unsigned __int8 v5 = [v3 excludedFieldsMask];
  unsigned int v6 = [v3 metrics];
  [v6 imageAreaWidth];
  double v8 = v7;
  id v9 = [(NavSignManeuverCell *)self imageAreaWidthConstraint];
  [v9 setConstant:v8];

  v10 = [v3 metrics];
  [v10 stepImageWidth];
  double v12 = v11;
  v13 = [(NavSignManeuverCell *)self imageWidthConstraint];
  [v13 setConstant:v12];

  double v14 = [v3 metrics];
  [v14 stepImageHeight];
  double v16 = v15;
  double v17 = [(NavSignManeuverCell *)self imageHeightConstraint];
  [v17 setConstant:v16];

  double v18 = [v3 metrics];
  [v18 exitSignPadding];
  double v20 = -v19;
  double v21 = [(NavSignManeuverCell *)self primaryToExitShieldConstraint];
  [v21 setConstant:v20];

  double v22 = [v3 metrics];
  [v22 exitSignPadding];
  double v24 = -v23;
  v25 = [(NavSignManeuverCell *)self exitShieldTrailingConstraint];
  [v25 setConstant:v24];

  double v26 = [v3 metrics];
  [v26 primaryTextTopMargin];
  double v28 = v27;
  uint64_t v29 = [(NavSignManeuverCell *)self primaryTopConstraint];
  [v29 setConstant:v28];

  double v30 = [v3 metrics];
  [v30 secondaryTextTopMargin];
  double v32 = v31;
  double v33 = [(NavSignManeuverCell *)self secondaryTopConstraint];
  [v33 setConstant:v32];

  if ((v5 & 4) != 0)
  {
    double v35 = 0.0;
  }
  else
  {
    double v30 = [v3 metrics];
    [v30 tertiaryTextTopMargin];
    double v35 = v34;
  }
  double v36 = [(NavSignManeuverCell *)self tertiaryTopConstraint];
  [v36 setConstant:v35];

  if ((v5 & 4) == 0) {
  v37 = [v3 metrics];
  }
  [v37 textBottomMargin];
  double v39 = -v38;
  v40 = [(NavSignManeuverCell *)self tertiaryBottomConstraint];
  [v40 setConstant:v39];

  if ([(NavSignManeuverCell *)self hideManeuverArrow])
  {
    double v41 = [v3 metrics];
    [v41 imageAreaWidth];
    double v43 = -v42;
    double v44 = [(NavSignManeuverCell *)self imageLeadingConstraint];
    [v44 setConstant:v43];

    double v45 = [v3 metrics];
    [v45 textTrailingMargin];
    double v47 = v46;
    v48 = [(NavSignManeuverCell *)self primaryLeadingConstraint];
    [v48 setConstant:v47];

    double v49 = [v3 metrics];
    [v49 imageAreaWidth];
    double v51 = -v50;
    v52 = [(NavSignManeuverCell *)self primaryTrailingConstraint];
    [v52 setConstant:v51];

    double v53 = [v3 metrics];
    [v53 imageAreaWidth];
  }
  else
  {
    v55 = [(NavSignManeuverCell *)self imageLeadingConstraint];
    [v55 setConstant:0.0];

    uint64_t v56 = [(NavSignManeuverCell *)self primaryLeadingConstraint];
    [v56 setConstant:0.0];

    v57 = [v3 metrics];
    [v57 textTrailingMargin];
    double v59 = -v58;
    uint64_t v60 = [(NavSignManeuverCell *)self primaryTrailingConstraint];
    [v60 setConstant:v59];

    double v53 = [v3 metrics];
    [v53 textTrailingMargin];
  }
  double v61 = -v54;
  double v62 = [(NavSignManeuverCell *)self secondaryTrailingConstraint];
  [v62 setConstant:v61];

  double v63 = [v3 primaryText];
  double v64 = [(NavSignManeuverCell *)self primaryTextLabel];
  [v64 setAttributedText:v63];

  uint64_t v65 = [v3 secondaryText];
  double v66 = [(NavSignManeuverCell *)self secondaryTextLabel];
  [v66 setAttributedText:v65];

  if ((v5 & 4) != 0)
  {
    double v67 = 0;
  }
  else
  {
    double v67 = [v3 tertiaryText];
  }
  CGRect v68 = [(NavSignManeuverCell *)self tertiaryTextLabel];
  [v68 setAttributedText:v67];

  if ((v5 & 4) == 0) {
  CGRect v69 = [v3 exitSignImage];
  }
  CGRect v70 = [(NavSignManeuverCell *)self exitShieldImageView];
  [v70 setImage:v69];

  v71 = [(NavSignManeuverCell *)self shieldImageView];
  [v71 setImage:0];

  v72 = [(NavSignManeuverCell *)self guidanceManeuverView];
  [v72 setManeuverArtwork:0];

  v73 = [v3 shieldImage];

  if (v73)
  {
    v74 = [v3 shieldImage];
    uint64_t v75 = [(NavSignManeuverCell *)self shieldImageView];
    [v75 setImage:v74];
  }
  else
  {
    v76 = [v3 maneuverArtwork];

    if (!v76) {
      goto LABEL_25;
    }
    v77 = [v3 maneuverArtwork];
    v78 = [(NavSignManeuverCell *)self guidanceManeuverView];
    [v78 setManeuverArtwork:v77];

    v79 = [v3 metrics];
    uint64_t v80 = v79;
    if (v79) {
      [v79 arrowMetrics];
    }
    else {
      memset(__src, 0, sizeof(__src));
    }
    v81 = [(NavSignManeuverCell *)self guidanceManeuverView];
    memcpy(__dst, __src, sizeof(__dst));
    [v81 setArrowMetrics:__dst];

    v82 = [v3 metrics];
    v83 = v82;
    if (v82) {
      [v82 junctionArrowMetrics];
    }
    else {
      memset(v106, 0, sizeof(v106));
    }
    uint64_t v84 = [(NavSignManeuverCell *)self guidanceManeuverView];
    memcpy(v105, v106, sizeof(v105));
    [v84 setJunctionArrowMetrics:v105];

    v85 = [v3 metrics];
    v86 = [v85 arrowColor];
    v87 = [(NavSignManeuverCell *)self guidanceManeuverView];
    [v87 setArrowColor:v86];

    v74 = [v3 metrics];
    uint64_t v75 = [v74 arrowAccentColor];
    uint64_t v88 = [(NavSignManeuverCell *)self guidanceManeuverView];
    [v88 setAccentColor:v75];
  }
LABEL_25:
  v89 = [v3 backgroundColor];
  uint64_t v90 = [(NavSignManeuverCell *)self contentView];
  [v90 setBackgroundColor:v89];

  v91 = [(NavSignManeuverCell *)self exitShieldImageView];
  v92 = [v91 image];

  if (v92)
  {
    v93 = [(NavSignManeuverCell *)self primaryTrailingConstraint];
    [v93 setActive:0];

    [(NavSignManeuverCell *)self primaryToExitShieldConstraint];
  }
  else
  {
    v94 = [(NavSignManeuverCell *)self primaryToExitShieldConstraint];
    [v94 setActive:0];

    [(NavSignManeuverCell *)self primaryTrailingConstraint];
  v95 = };
  [v95 setActive:1];

  uint64_t v96 = [(NavSignManeuverCell *)self secondaryTextLabel];
  v97 = [v96 attributedText];
  id v98 = [v97 length];

  v99 = [(NavSignManeuverCell *)self secondaryTextLabel];
  v100 = v99;
  if (v98)
  {
    [v99 setHidden:0];

    v101 = [(NavSignManeuverCell *)self tertiaryTextLabel];
    [v101 setHidden:0];
    v102 = &OBJC_IVAR___NavSignManeuverCell__primaryTopAnchoredConstraints;
    v103 = &OBJC_IVAR___NavSignManeuverCell__primaryCenteredAnchoredConstraints;
  }
  else
  {
    [v99 setHidden:1];

    v101 = [(NavSignManeuverCell *)self tertiaryTextLabel];
    [v101 setHidden:1];
    v103 = &OBJC_IVAR___NavSignManeuverCell__primaryTopAnchoredConstraints;
    v102 = &OBJC_IVAR___NavSignManeuverCell__primaryCenteredAnchoredConstraints;
  }

  +[NSLayoutConstraint deactivateConstraints:*(Class *)((char *)&self->super.super.super.super.super.super.isa + *v103)];
  +[NSLayoutConstraint activateConstraints:*(Class *)((char *)&self->super.super.super.super.super.super.isa + *v102)];
  if (v4)
  {
    v104 = +[NSNotificationCenter defaultCenter];
    [v104 postNotificationName:@"NavContainerShouldUpdateBacklightSceneEnvironmentNotification" object:self];
  }
}

- (void)_updateStateWithLayoutProgress:(double)a3
{
  unint64_t v5 = [(NavSignManeuverCell *)self state];
  if (v5 == 2)
  {
    [(NavSignManeuverCell *)self setSelectedWithLayoutProgress:0.0];
    double v16 = [(NavSignManeuverCell *)self guidanceManeuverView];
    [v16 setAlpha:1.0];

    CGAffineTransformMakeScale(&v37, 0.800000012, 0.800000012);
    double v17 = [(NavSignManeuverCell *)self guidanceManeuverView];
    CGAffineTransform v36 = v37;
    [v17 setTransform:&v36];

    double v18 = [(NavSignManeuverCell *)self shieldImageView];
    [v18 setAlpha:1.0];

    CGAffineTransformMakeScale(&v35, 0.800000012, 0.800000012);
    double v19 = [(NavSignManeuverCell *)self shieldImageView];
    double v20 = v19;
    CGAffineTransform v34 = v35;
    double v21 = &v34;
LABEL_7:
    [v19 setTransform:v21];

    v25 = [(NavSignManeuverCell *)self primaryTextLabel];
    [v25 setAlpha:1.0];

    double v26 = [(NavSignManeuverCell *)self exitShieldImageView];
    [v26 setAlpha:1.0];

    double v27 = [(NavSignManeuverCell *)self secondaryTextLabel];
    [v27 setAlpha:1.0];

    v13 = [(NavSignManeuverCell *)self tertiaryTextLabel];
    double v14 = v13;
    double v15 = 1.0;
    goto LABEL_8;
  }
  if (v5 == 1)
  {
    [(NavSignManeuverCell *)self setSelectedWithLayoutProgress:a3];
    double v22 = [(NavSignManeuverCell *)self guidanceManeuverView];
    [v22 setAlpha:1.0];

    double v23 = [(NavSignManeuverCell *)self guidanceManeuverView];
    long long v33 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v39[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    long long v31 = v39[0];
    v39[1] = v33;
    long long v40 = *(_OWORD *)&CGAffineTransformIdentity.tx;
    long long v29 = v40;
    [v23 setTransform:v39];

    double v24 = [(NavSignManeuverCell *)self shieldImageView];
    [v24 setAlpha:1.0];

    double v19 = [(NavSignManeuverCell *)self shieldImageView];
    double v20 = v19;
    v38[0] = v31;
    v38[1] = v33;
    v38[2] = v29;
    double v21 = (CGAffineTransform *)v38;
    goto LABEL_7;
  }
  if (v5) {
    return;
  }
  [(NavSignManeuverCell *)self setSelectedWithLayoutProgress:0.0];
  unsigned int v6 = [(NavSignManeuverCell *)self guidanceManeuverView];
  [v6 setAlpha:0.150000006];

  double v7 = [(NavSignManeuverCell *)self guidanceManeuverView];
  long long v32 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v42[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  long long v30 = v42[0];
  v42[1] = v32;
  long long v43 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  long long v28 = v43;
  [v7 setTransform:v42];

  double v8 = [(NavSignManeuverCell *)self shieldImageView];
  [v8 setAlpha:0.150000006];

  id v9 = [(NavSignManeuverCell *)self shieldImageView];
  v41[0] = v30;
  v41[1] = v32;
  v41[2] = v28;
  [v9 setTransform:v41];

  v10 = [(NavSignManeuverCell *)self primaryTextLabel];
  [v10 setAlpha:0.150000006];

  double v11 = [(NavSignManeuverCell *)self exitShieldImageView];
  [v11 setAlpha:0.150000006];

  double v12 = [(NavSignManeuverCell *)self secondaryTextLabel];
  [v12 setAlpha:0.150000006];

  v13 = [(NavSignManeuverCell *)self tertiaryTextLabel];
  double v14 = v13;
  double v15 = 0.150000006;
LABEL_8:
  [v13 setAlpha:v15];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)NavSignManeuverCell;
  [(NavSignManeuverCell *)&v6 touchesBegan:a3 withEvent:a4];
  unint64_t v5 = [(NavSignManeuverCell *)self delegate];
  [v5 cell:self setPressed:1];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)NavSignManeuverCell;
  [(NavSignManeuverCell *)&v6 touchesCancelled:a3 withEvent:a4];
  unint64_t v5 = [(NavSignManeuverCell *)self delegate];
  [v5 cell:self setPressed:0];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)NavSignManeuverCell;
  [(NavSignManeuverCell *)&v6 touchesEnded:a3 withEvent:a4];
  unint64_t v5 = [(NavSignManeuverCell *)self delegate];
  [v5 cell:self setPressed:0];
}

- (BOOL)_shouldPostBacklightSceneRequiresUpdateNotification:(id)a3
{
  id v4 = a3;
  if (!GEOConfigGetBOOL()) {
    goto LABEL_7;
  }
  unint64_t v5 = [(NavSignManeuverCell *)self traitCollection];
  if (![v5 isLuminanceReduced])
  {

    goto LABEL_7;
  }
  unint64_t state = self->_state;

  if (state != 1)
  {
LABEL_7:
    char v25 = 0;
    goto LABEL_8;
  }
  unsigned __int8 v7 = [v4 excludedFieldsMask];
  double v8 = [(NavSignManeuverCell *)self primaryTextLabel];
  id v9 = [v8 attributedText];
  v10 = [v9 string];
  double v11 = [v4 primaryText];
  double v12 = [v11 string];
  unsigned __int8 v44 = [v10 isEqualToString:v12];

  v13 = [(NavSignManeuverCell *)self secondaryTextLabel];
  double v14 = [v13 attributedText];
  double v15 = [v14 string];
  double v16 = [v4 secondaryText];
  double v17 = [v16 string];
  unsigned __int8 v43 = [v15 isEqualToString:v17];

  double v18 = [(NavSignManeuverCell *)self tertiaryTextLabel];
  double v19 = [v18 attributedText];
  uint64_t v20 = [v19 string];
  double v21 = (void *)v20;
  if ((v7 & 4) != 0)
  {
    LOBYTE(v24) = v20 != 0;
  }
  else
  {
    double v22 = [v4 tertiaryText];
    double v23 = [v22 string];
    unsigned int v24 = [v21 isEqualToString:v23] ^ 1;
  }
  double v27 = [(NavSignManeuverCell *)self shieldImageView];
  double v42 = [v27 image];
  long long v28 = [v4 shieldImage];

  long long v29 = [(NavSignManeuverCell *)self exitShieldImageView];
  long long v30 = [v29 image];
  long long v31 = [v4 exitSignImage];

  long long v32 = [(NavSignManeuverCell *)self guidanceManeuverView];
  long long v33 = [v32 maneuverArtwork];
  [v4 maneuverArtwork];
  CGAffineTransform v35 = v34 = v24;
  unsigned __int8 v36 = [v33 isEqual:v35];

  CGAffineTransform v37 = [(NavSignManeuverCell *)self contentView];
  double v38 = [v37 backgroundColor];
  double v39 = [v4 backgroundColor];
  BOOL v40 = v38 != v39;

  char v41 = v44 & v43 ^ 1 | v34;
  if (v42 != v28) {
    char v41 = 1;
  }
  if (v30 != v31) {
    char v41 = 1;
  }
  char v25 = v41 | v36 ^ 1 | v40;
LABEL_8:

  return v25 & 1;
}

- (NavSignManeuverCellDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (NavSignManeuverCellDelegate *)a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (BOOL)hideManeuverArrow
{
  return self->_hideManeuverArrow;
}

- (UIView)mapsBackgroundView
{
  return self->_mapsBackgroundView;
}

- (void)setMapsBackgroundView:(id)a3
{
}

- (GuidanceManeuverView)guidanceManeuverView
{
  return self->_guidanceManeuverView;
}

- (void)setGuidanceManeuverView:(id)a3
{
}

- (UIImageView)shieldImageView
{
  return self->_shieldImageView;
}

- (void)setShieldImageView:(id)a3
{
}

- (UILabel)primaryTextLabel
{
  return self->_primaryTextLabel;
}

- (void)setPrimaryTextLabel:(id)a3
{
}

- (UIImageView)exitShieldImageView
{
  return self->_exitShieldImageView;
}

- (void)setExitShieldImageView:(id)a3
{
}

- (UILabel)secondaryTextLabel
{
  return self->_secondaryTextLabel;
}

- (void)setSecondaryTextLabel:(id)a3
{
}

- (UILabel)tertiaryTextLabel
{
  return self->_tertiaryTextLabel;
}

- (void)setTertiaryTextLabel:(id)a3
{
}

- (NSLayoutConstraint)imageLeadingConstraint
{
  return self->_imageLeadingConstraint;
}

- (void)setImageLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)imageAreaWidthConstraint
{
  return self->_imageAreaWidthConstraint;
}

- (void)setImageAreaWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)imageWidthConstraint
{
  return self->_imageWidthConstraint;
}

- (void)setImageWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)imageHeightConstraint
{
  return self->_imageHeightConstraint;
}

- (void)setImageHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)primaryLeadingConstraint
{
  return self->_primaryLeadingConstraint;
}

- (void)setPrimaryLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)primaryTrailingConstraint
{
  return self->_primaryTrailingConstraint;
}

- (void)setPrimaryTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)primaryToExitShieldConstraint
{
  return self->_primaryToExitShieldConstraint;
}

- (void)setPrimaryToExitShieldConstraint:(id)a3
{
}

- (NSLayoutConstraint)exitShieldTrailingConstraint
{
  return self->_exitShieldTrailingConstraint;
}

- (void)setExitShieldTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)secondaryTrailingConstraint
{
  return self->_secondaryTrailingConstraint;
}

- (void)setSecondaryTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)tertiaryBottomConstraint
{
  return self->_tertiaryBottomConstraint;
}

- (void)setTertiaryBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)primaryTopConstraint
{
  return self->_primaryTopConstraint;
}

- (void)setPrimaryTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)secondaryTopConstraint
{
  return self->_secondaryTopConstraint;
}

- (void)setSecondaryTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)tertiaryTopConstraint
{
  return self->_tertiaryTopConstraint;
}

- (void)setTertiaryTopConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tertiaryTopConstraint, 0);
  objc_storeStrong((id *)&self->_secondaryTopConstraint, 0);
  objc_storeStrong((id *)&self->_primaryTopConstraint, 0);
  objc_storeStrong((id *)&self->_tertiaryBottomConstraint, 0);
  objc_storeStrong((id *)&self->_secondaryTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_exitShieldTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_primaryToExitShieldConstraint, 0);
  objc_storeStrong((id *)&self->_primaryTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_primaryLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_imageHeightConstraint, 0);
  objc_storeStrong((id *)&self->_imageWidthConstraint, 0);
  objc_storeStrong((id *)&self->_imageAreaWidthConstraint, 0);
  objc_storeStrong((id *)&self->_imageLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_tertiaryTextLabel, 0);
  objc_storeStrong((id *)&self->_secondaryTextLabel, 0);
  objc_storeStrong((id *)&self->_exitShieldImageView, 0);
  objc_storeStrong((id *)&self->_primaryTextLabel, 0);
  objc_storeStrong((id *)&self->_shieldImageView, 0);
  objc_storeStrong((id *)&self->_guidanceManeuverView, 0);
  objc_storeStrong((id *)&self->_mapsBackgroundView, 0);
  objc_storeStrong((id *)&self->_primaryCenteredAnchoredConstraints, 0);

  objc_storeStrong((id *)&self->_primaryTopAnchoredConstraints, 0);
}

@end