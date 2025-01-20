@interface TwoLinesContentView
- (BOOL)isParentCellSelected;
- (PlaceContextViewModelCellDelegate)placeContextViewModelDelegate;
- (TwoLinesContentView)initWithFrame:(CGRect)a3;
- (TwoLinesContentView)initWithFrame:(CGRect)a3 contentViewType:(int)a4;
- (TwoLinesContentViewModel)viewModel;
- (double)_imageDimension;
- (double)_imageToTextSpacing;
- (double)_labelVerticalSpacing;
- (double)_verticalMargin;
- (id)_labelColor;
- (id)_renderAttachmentImageWithImage:(id)a3 vibrant:(BOOL)a4;
- (id)_selectedLabelColor;
- (id)_subtitleFont;
- (id)_titleFont;
- (id)_titleRegularFont;
- (int)contentViewType;
- (void)_updateConstraintConstants;
- (void)_updateConstraints;
- (void)_updateDebugLabel;
- (void)_updateFonts;
- (void)_updateImage:(id)a3;
- (void)_updateLabelColors;
- (void)_updateNumberOfLines;
- (void)_updateViewsWithViewModel:(id)a3;
- (void)didTapOnThirdLabel:(id)a3;
- (void)setIsParentCellSelected:(BOOL)a3;
- (void)setPlaceContextViewModelDelegate:(id)a3;
- (void)setVibrant:(BOOL)a3;
- (void)setViewModel:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)twoLinesTableViewCellModelDidUpdate:(id)a3;
@end

@implementation TwoLinesContentView

- (TwoLinesContentView)initWithFrame:(CGRect)a3 contentViewType:(int)a4
{
  v5 = -[TwoLinesContentView initWithFrame:](self, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_contentViewType = a4;
    [(TwoLinesContentView *)v5 _updateLabelColors];
  }
  return v6;
}

- (TwoLinesContentView)initWithFrame:(CGRect)a3
{
  v34.receiver = self;
  v34.super_class = (Class)TwoLinesContentView;
  v3 = -[TwoLinesContentView initWithFrame:](&v34, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
    titleLayoutGuide = v3->_titleLayoutGuide;
    v3->_titleLayoutGuide = v4;

    [(TwoLinesContentView *)v3 addLayoutGuide:v3->_titleLayoutGuide];
    id v6 = objc_alloc((Class)UIImageView);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v10 = [v6 initWithFrame:CGRectZero.origin.x, y, width, height];
    leftImageView = v3->_leftImageView;
    v3->_leftImageView = v10;

    [(UIImageView *)v3->_leftImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v3->_leftImageView setAccessibilityIdentifier:@"LeftImage"];
    [(TwoLinesContentView *)v3 addSubview:v3->_leftImageView];
    v12 = (NSTextAttachment *)[objc_alloc((Class)NSTextAttachment) initWithData:0 ofType:0];
    attachment = v3->_attachment;
    v3->_attachment = v12;

    [(TwoLinesContentView *)v3 _imageDimension];
    double v15 = v14;
    [(TwoLinesContentView *)v3 _imageDimension];
    -[NSTextAttachment setBounds:](v3->_attachment, "setBounds:", 0.0, 0.0, v15, v16);
    v17 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
    badgeView = v3->_badgeView;
    v3->_badgeView = v17;

    [(UIView *)v3->_badgeView setTranslatesAutoresizingMaskIntoConstraints:0];
    v19 = +[UIColor redColor];
    [(UIView *)v3->_badgeView setBackgroundColor:v19];

    v20 = [(UIView *)v3->_badgeView layer];
    [v20 setCornerRadius:5.0];

    [(UIView *)v3->_badgeView setHidden:1];
    [(UIView *)v3->_badgeView setAccessibilityIdentifier:@"Badge"];
    [(TwoLinesContentView *)v3 addSubview:v3->_badgeView];
    v21 = (UILabel *)objc_alloc_init((Class)UILabel);
    mainTitleLabel = v3->_mainTitleLabel;
    v3->_mainTitleLabel = v21;

    [(UILabel *)v3->_mainTitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_mainTitleLabel setAccessibilityIdentifier:@"MainTitle"];
    [(TwoLinesContentView *)v3 addSubview:v3->_mainTitleLabel];
    v23 = (UILabel *)objc_alloc_init((Class)UILabel);
    secondTitleLabel = v3->_secondTitleLabel;
    v3->_secondTitleLabel = v23;

    [(UILabel *)v3->_secondTitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_secondTitleLabel setAccessibilityIdentifier:@"SecondTitle"];
    [(TwoLinesContentView *)v3 addSubview:v3->_secondTitleLabel];
    v25 = (UILabel *)objc_alloc_init((Class)UILabel);
    thirdTitleLabel = v3->_thirdTitleLabel;
    v3->_thirdTitleLabel = v25;

    [(UILabel *)v3->_thirdTitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    -[UILabel _setTouchInsets:](v3->_thirdTitleLabel, "_setTouchInsets:", -10.0, -10.0, -10.0, -10.0);
    [(UILabel *)v3->_thirdTitleLabel setAccessibilityIdentifier:@"ThirdTitle"];
    [(TwoLinesContentView *)v3 addSubview:v3->_thirdTitleLabel];
    v27 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v3 action:"didTapOnThirdLabel:"];
    thirdLabelTap = v3->_thirdLabelTap;
    v3->_thirdLabelTap = v27;

    [(UILabel *)v3->_thirdTitleLabel addGestureRecognizer:v3->_thirdLabelTap];
    v29 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    thirdLabelImageView = v3->_thirdLabelImageView;
    v3->_thirdLabelImageView = v29;

    [(UIImageView *)v3->_thirdLabelImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v3->_thirdLabelImageView setContentMode:1];
    v31 = +[UIColor clearColor];
    [(UIImageView *)v3->_thirdLabelImageView setBackgroundColor:v31];

    LODWORD(v32) = 1148846080;
    [(UIImageView *)v3->_thirdLabelImageView setContentCompressionResistancePriority:0 forAxis:v32];
    [(UIImageView *)v3->_thirdLabelImageView setClipsToBounds:1];
    [(UIImageView *)v3->_thirdLabelImageView setAccessibilityIdentifier:@"ThirdLabelImage"];
    [(TwoLinesContentView *)v3 addSubview:v3->_thirdLabelImageView];
    [(TwoLinesContentView *)v3 _updateDebugLabel];
    [(TwoLinesContentView *)v3 _updateFonts];
    [(TwoLinesContentView *)v3 _updateNumberOfLines];
    [(TwoLinesContentView *)v3 _updateConstraints];
    [(TwoLinesContentView *)v3 _updateConstraintConstants];
    [(TwoLinesContentView *)v3 _updateLabelColors];
  }
  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)TwoLinesContentView;
  [(MapsThemeView *)&v26 traitCollectionDidChange:v4];
  v5 = [(TwoLinesContentView *)self traitCollection];
  id v6 = [v5 preferredContentSizeCategory];
  v7 = [v4 preferredContentSizeCategory];
  uint64_t v8 = sub_1000E93B0(v6, v7);

  if (v8) {
    [(TwoLinesContentView *)self _updateFonts];
  }
  v9 = [(TwoLinesContentView *)self traitCollection];
  v10 = [v9 preferredContentSizeCategory];
  IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v10);
  v12 = [v4 preferredContentSizeCategory];
  if (IsAccessibilityCategory == UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v12))
  {
    v13 = [(TwoLinesContentView *)self traitCollection];
    id v14 = [v13 userInterfaceStyle];
    id v15 = [v4 userInterfaceStyle];

    if (v14 == v15) {
      goto LABEL_7;
    }
  }
  else
  {
  }
  double v16 = [(TwoLinesContentView *)self viewModel];
  [(TwoLinesContentView *)self _updateViewsWithViewModel:v16];

LABEL_7:
  v17 = [(TwoLinesContentView *)self traitCollection];
  v18 = [v17 preferredContentSizeCategory];
  int v19 = UIContentSizeCategoryIsAccessibilityCategory(v18);
  v20 = [v4 preferredContentSizeCategory];
  int v21 = UIContentSizeCategoryIsAccessibilityCategory(v20);

  if (v19 != v21)
  {
    [(TwoLinesContentView *)self _updateNumberOfLines];
    [(TwoLinesContentView *)self _updateConstraints];
  }
  v22 = [(TwoLinesContentView *)self traitCollection];
  v23 = [v22 preferredContentSizeCategory];
  v24 = [v4 preferredContentSizeCategory];
  uint64_t v25 = sub_1000E93B0(v23, v24);

  if (v25) {
    [(TwoLinesContentView *)self _updateConstraintConstants];
  }
}

- (void)setIsParentCellSelected:(BOOL)a3
{
  if (self->_isParentCellSelected != a3)
  {
    self->_isParentCellSelected = a3;
    [(TwoLinesContentView *)self _updateLabelColors];
    [(TwoLinesContentView *)self _updateVibrantColor];
    viewModel = self->_viewModel;
    [(TwoLinesContentView *)self _updateViewsWithViewModel:viewModel];
  }
}

- (void)_updateConstraints
{
  +[NSLayoutConstraint deactivateConstraints:self->_constraints];
  constraints = self->_constraints;
  self->_constraints = 0;

  minimumHeightConstraint = self->_minimumHeightConstraint;
  self->_minimumHeightConstraint = 0;

  v5 = [(UIImageView *)self->_thirdLabelImageView heightAnchor];
  id v6 = [v5 constraintEqualToConstant:0.0];
  thirdLabelImageViewHeightConstraint = self->_thirdLabelImageViewHeightConstraint;
  self->_thirdLabelImageViewHeightConstraint = v6;

  uint64_t v8 = [(UILabel *)self->_thirdTitleLabel topAnchor];
  v9 = [(UILabel *)self->_secondTitleLabel bottomAnchor];
  v10 = [v8 constraintEqualToAnchor:v9];
  thirdLabelTopConstraint = self->_thirdLabelTopConstraint;
  self->_thirdLabelTopConstraint = v10;

  LODWORD(v9) = [(TwoLinesContentViewModel *)self->_viewModel shouldCenterImage];
  v12 = [(UIImageView *)self->_leftImageView centerYAnchor];
  if (v9) {
    [(TwoLinesContentView *)self centerYAnchor];
  }
  else {
  v13 = [(TwoLinesContentView *)self topAnchor];
  }
  [v12 constraintEqualToAnchor:v13];
  id v14 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  imageVerticalConstraint = self->_imageVerticalConstraint;
  self->_imageVerticalConstraint = v14;

  double v16 = [(UIImageView *)self->_leftImageView heightAnchor];
  [(TwoLinesContentView *)self _imageDimension];
  [v16 constraintEqualToConstant:];
  v17 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  imageHeightConstraint = self->_imageHeightConstraint;
  self->_imageHeightConstraint = v17;

  int v19 = [(UIImageView *)self->_leftImageView widthAnchor];
  [(TwoLinesContentView *)self _imageDimension];
  [v19 constraintEqualToConstant:];
  v20 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  imageWidthConstraint = self->_imageWidthConstraint;
  self->_imageWidthConstraint = v20;

  v22 = [(UIImageView *)self->_thirdLabelImageView bottomAnchor];
  v23 = [(UILabel *)self->_thirdTitleLabel bottomAnchor];
  v24 = [v22 constraintEqualToAnchor:v23];
  thirdLabelImageViewBottomConstraint = self->_thirdLabelImageViewBottomConstraint;
  self->_thirdLabelImageViewBottomConstraint = v24;

  objc_super v26 = [(UIImageView *)self->_thirdLabelImageView trailingAnchor];
  v27 = [(UILabel *)self->_thirdTitleLabel leadingAnchor];
  v28 = [v26 constraintEqualToAnchor:v27 constant:-4.0];
  thirdLabelToThirdImageViewLeadingConstraint = self->_thirdLabelToThirdImageViewLeadingConstraint;
  self->_thirdLabelToThirdImageViewLeadingConstraint = v28;

  v30 = [(UILabel *)self->_thirdTitleLabel leadingAnchor];
  v31 = [(UILayoutGuide *)self->_titleLayoutGuide leadingAnchor];
  double v32 = [v30 constraintEqualToAnchor:v31];
  thirdLabelToLayoutGuideLeadingConstraint = self->_thirdLabelToLayoutGuideLeadingConstraint;
  self->_thirdLabelToLayoutGuideLeadingConstraint = v32;

  v119 = +[NSMutableArray array];
  v116 = [(UILabel *)self->_mainTitleLabel topAnchor];
  v114 = [(UILayoutGuide *)self->_titleLayoutGuide topAnchor];
  v113 = [v116 constraintEqualToAnchor:v114];
  v122[0] = v113;
  v112 = [(UILabel *)self->_secondTitleLabel topAnchor];
  v111 = [(UILabel *)self->_mainTitleLabel bottomAnchor];
  [(TwoLinesContentView *)self _labelVerticalSpacing];
  v110 = [v112 constraintEqualToAnchor:v111];
  objc_super v34 = self->_thirdLabelTopConstraint;
  v122[1] = v110;
  v122[2] = v34;
  v109 = [(UILabel *)self->_thirdTitleLabel bottomAnchor];
  v108 = [(UILayoutGuide *)self->_titleLayoutGuide bottomAnchor];
  v107 = [v109 constraintEqualToAnchor:v108];
  v122[3] = v107;
  v106 = [(UIImageView *)self->_thirdLabelImageView topAnchor];
  v105 = [(UILabel *)self->_thirdTitleLabel topAnchor];
  v104 = [v106 constraintEqualToAnchor:v105];
  v35 = self->_thirdLabelImageViewBottomConstraint;
  v36 = self->_imageVerticalConstraint;
  v37 = self->_imageHeightConstraint;
  v122[4] = v104;
  v122[5] = v35;
  v122[6] = v36;
  v122[7] = v37;
  v103 = [(UIView *)self->_badgeView centerYAnchor];
  v102 = [(TwoLinesContentView *)self centerYAnchor];
  v101 = [v103 constraintEqualToAnchor:v102];
  v122[8] = v101;
  v100 = [(UIView *)self->_badgeView heightAnchor];
  v99 = [v100 constraintEqualToConstant:10.0];
  v38 = self->_thirdLabelImageViewHeightConstraint;
  v122[9] = v99;
  v122[10] = v38;
  v98 = [(UILabel *)self->_mainTitleLabel leadingAnchor];
  v97 = [(UILayoutGuide *)self->_titleLayoutGuide leadingAnchor];
  v96 = [v98 constraintEqualToAnchor:v97];
  v122[11] = v96;
  v95 = [(UILabel *)self->_mainTitleLabel trailingAnchor];
  v94 = [(UILayoutGuide *)self->_titleLayoutGuide trailingAnchor];
  v93 = [v95 constraintEqualToAnchor:v94];
  v122[12] = v93;
  v92 = [(UILabel *)self->_secondTitleLabel leadingAnchor];
  v91 = [(UILayoutGuide *)self->_titleLayoutGuide leadingAnchor];
  v90 = [v92 constraintEqualToAnchor:v91];
  v122[13] = v90;
  v88 = [(UILabel *)self->_secondTitleLabel trailingAnchor];
  v87 = [(UILayoutGuide *)self->_titleLayoutGuide trailingAnchor];
  v86 = [v88 constraintEqualToAnchor:v87];
  v122[14] = v86;
  v85 = [(UIImageView *)self->_thirdLabelImageView leadingAnchor];
  v84 = [(UILayoutGuide *)self->_titleLayoutGuide leadingAnchor];
  v83 = [v85 constraintEqualToAnchor:v84];
  v39 = self->_thirdLabelToThirdImageViewLeadingConstraint;
  v122[15] = v83;
  v122[16] = v39;
  v89 = [(UILabel *)self->_thirdTitleLabel trailingAnchor];
  v82 = [(UILayoutGuide *)self->_titleLayoutGuide trailingAnchor];
  v81 = [v89 constraintEqualToAnchor:v82];
  v122[17] = v81;
  v80 = [(UIImageView *)self->_leftImageView leadingAnchor];
  v79 = [(TwoLinesContentView *)self leadingAnchor];
  v78 = [v80 constraintEqualToAnchor:v79];
  v122[18] = v78;
  v77 = [(UILayoutGuide *)self->_titleLayoutGuide trailingAnchor];
  v76 = [(TwoLinesContentView *)self trailingAnchor];
  v75 = [v77 constraintEqualToAnchor:v76];
  v122[19] = v75;
  v74 = [(UIImageView *)self->_leftImageView leadingAnchor];
  v73 = [(TwoLinesContentView *)self leadingAnchor];
  v40 = [v74 constraintEqualToAnchor:v73];
  v41 = self->_imageWidthConstraint;
  v122[20] = v40;
  v122[21] = v41;
  v42 = [(UIView *)self->_badgeView centerXAnchor];
  v43 = [(TwoLinesContentView *)self trailingAnchor];
  v44 = [v42 constraintEqualToAnchor:v43];
  v122[22] = v44;
  v45 = [(UIView *)self->_badgeView widthAnchor];
  v46 = [v45 constraintEqualToConstant:10.0];
  v122[23] = v46;
  v47 = [(UIImageView *)self->_thirdLabelImageView widthAnchor];
  v48 = [v47 constraintEqualToConstant:20.0];
  v122[24] = v48;
  v49 = +[NSArray arrayWithObjects:v122 count:25];
  [v119 addObjectsFromArray:v49];

  v50 = [(TwoLinesContentView *)self traitCollection];
  v51 = [v50 preferredContentSizeCategory];
  LODWORD(v43) = UIContentSizeCategoryIsAccessibilityCategory(v51);

  if (v43)
  {
    v52 = [(UILayoutGuide *)self->_titleLayoutGuide topAnchor];
    v53 = [(TwoLinesContentView *)self topAnchor];
    [(TwoLinesContentView *)self _verticalMargin];
    v118 = [v52 constraintEqualToAnchor:v53];
    v121[0] = v118;
    v54 = [(UILayoutGuide *)self->_titleLayoutGuide bottomAnchor];
    v55 = [(TwoLinesContentView *)self bottomAnchor];
    [(TwoLinesContentView *)self _verticalMargin];
    v57 = [v54 constraintEqualToAnchor:v55 constant:-v56];
    v121[1] = v57;
    v58 = [(UILayoutGuide *)self->_titleLayoutGuide leadingAnchor];
    v59 = [(TwoLinesContentView *)self leadingAnchor];
    v60 = [v58 constraintEqualToAnchor:v59];
    v121[2] = v60;
    v61 = +[NSArray arrayWithObjects:v121 count:3];
    [v119 addObjectsFromArray:v61];
  }
  else
  {
    v62 = [(TwoLinesContentView *)self heightAnchor];
    v63 = [v62 constraintGreaterThanOrEqualToConstant:0.0];
    v64 = *(Class *)((char *)&self->super.super.super.super.isa + v72);
    *(Class *)((char *)&self->super.super.super.super.isa + v72) = v63;

    v117 = [(UILayoutGuide *)self->_titleLayoutGuide leadingAnchor];
    uint64_t v115 = [(UIImageView *)self->_leftImageView trailingAnchor];
    [(TwoLinesContentView *)self _imageToTextSpacing];
    v118 = [v117 constraintEqualToAnchor:v115];
    v120[0] = v118;
    v54 = [(UILayoutGuide *)self->_titleLayoutGuide centerYAnchor];
    v55 = [(TwoLinesContentView *)self centerYAnchor];
    v57 = [v54 constraintEqualToAnchor:v55];
    uint64_t v65 = *(uint64_t *)((char *)&self->super.super.super.super.isa + v72);
    v120[1] = v57;
    v120[2] = v65;
    v58 = [(TwoLinesContentView *)self heightAnchor];
    LODWORD(v66) = 1140457472;
    v59 = [v58 constraintEqualToConstant:0.0 priority:v66];
    v120[3] = v59;
    v60 = [(TwoLinesContentView *)self heightAnchor];
    v61 = [(UILayoutGuide *)self->_titleLayoutGuide heightAnchor];
    [(TwoLinesContentView *)self _verticalMargin];
    v68 = [v60 constraintGreaterThanOrEqualToAnchor:v61 constant:v67 + v67];
    v120[4] = v68;
    v69 = +[NSArray arrayWithObjects:v120 count:5];
    [v119 addObjectsFromArray:v69];

    v53 = (void *)v115;
    v52 = v117;
  }

  v70 = (NSArray *)[v119 copy];
  v71 = self->_constraints;
  self->_constraints = v70;

  +[NSLayoutConstraint activateConstraints:self->_constraints];
}

- (void)_updateConstraintConstants
{
  v3 = [(TwoLinesContentView *)self traitCollection];
  id v4 = [v3 preferredContentSizeCategory];
  IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v4);

  if (!IsAccessibilityCategory)
  {
    id v6 = [(UILabel *)self->_mainTitleLabel font];
    v7 = [(TwoLinesContentView *)self traitCollection];
    [v7 displayScale];
    +[UILabel _maps_maximumHeightWithFont:numberOfLines:displayScale:](UILabel, "_maps_maximumHeightWithFont:numberOfLines:displayScale:", v6, 1);
    double v9 = v8;

    v10 = [(UILabel *)self->_secondTitleLabel font];
    v11 = [(TwoLinesContentView *)self traitCollection];
    [v11 displayScale];
    +[UILabel _maps_maximumHeightWithFont:numberOfLines:displayScale:](UILabel, "_maps_maximumHeightWithFont:numberOfLines:displayScale:", v10, 1);
    double v13 = v12;

    [(TwoLinesContentView *)self _verticalMargin];
    double v15 = v13 + v9 + v14 * 2.0;
    [(TwoLinesContentView *)self _labelVerticalSpacing];
    double v17 = v16 + v15;
    v18 = [(TwoLinesContentView *)self viewModel];
    int v19 = [v18 placeContextViewModel];
    id v20 = [v19 type];

    int v21 = [(TwoLinesContentView *)self viewModel];
    v22 = [v21 placeContextViewModel];
    v23 = [v22 attributedString];
    id v24 = [v23 length];

    thirdLabelToLayoutGuideLeadingConstraint = self->_thirdLabelToLayoutGuideLeadingConstraint;
    v35[0] = self->_thirdLabelImageViewBottomConstraint;
    v35[1] = thirdLabelToLayoutGuideLeadingConstraint;
    v35[2] = self->_thirdLabelToThirdImageViewLeadingConstraint;
    objc_super v26 = +[NSArray arrayWithObjects:v35 count:3];
    +[NSLayoutConstraint deactivateConstraints:v26];

    if (v20 == (id)9 && v24)
    {
      objc_super v34 = self->_thirdLabelToLayoutGuideLeadingConstraint;
      v27 = +[NSArray arrayWithObjects:&v34 count:1];
      +[NSLayoutConstraint activateConstraints:v27];
    }
    else
    {
      thirdLabelToThirdImageViewLeadingConstraint = self->_thirdLabelToThirdImageViewLeadingConstraint;
      v33[0] = self->_thirdLabelImageViewBottomConstraint;
      v33[1] = thirdLabelToThirdImageViewLeadingConstraint;
      v29 = +[NSArray arrayWithObjects:v33 count:2];
      +[NSLayoutConstraint activateConstraints:v29];

      thirdLabelImageViewHeightConstraint = self->_thirdLabelImageViewHeightConstraint;
      if (!v24)
      {
        double v31 = 0.0;
        [(NSLayoutConstraint *)thirdLabelImageViewHeightConstraint setConstant:0.0];
LABEL_8:
        [(NSLayoutConstraint *)self->_thirdLabelTopConstraint setConstant:v31];
        [(NSLayoutConstraint *)self->_minimumHeightConstraint setConstant:v17];
        if (([(TwoLinesContentViewModel *)self->_viewModel shouldCenterImage] & 1) == 0)
        {
          [(NSLayoutConstraint *)self->_minimumHeightConstraint constant];
          [(NSLayoutConstraint *)self->_imageVerticalConstraint setConstant:v32 * 0.5];
        }
        return;
      }
      [(NSLayoutConstraint *)thirdLabelImageViewHeightConstraint setConstant:20.0];
    }
    double v31 = 8.0;
    goto LABEL_8;
  }
}

- (void)_updateNumberOfLines
{
  v3 = [(TwoLinesContentView *)self traitCollection];
  id v4 = [v3 preferredContentSizeCategory];
  IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v4);

  if (IsAccessibilityCategory)
  {
    [(UILabel *)self->_mainTitleLabel setNumberOfLines:0];
    [(UILabel *)self->_secondTitleLabel setNumberOfLines:0];
  }
  else
  {
    unsigned int v6 = [(TwoLinesContentViewModel *)self->_viewModel allowsSubtitleWrapping];
    [(UILabel *)self->_mainTitleLabel setNumberOfLines:1];
    [(UILabel *)self->_secondTitleLabel setNumberOfLines:v6 == 0];
  }
  uint64_t v7 = [(TwoLinesContentViewModel *)self->_viewModel placeContextViewModel];
  if (v7
    && (double v8 = (void *)v7,
        [(TwoLinesContentViewModel *)self->_viewModel placeContextViewModel],
        double v9 = objc_claimAutoreleasedReturnValue(),
        id v10 = [v9 type],
        v9,
        v8,
        v10 == (id)9))
  {
    uint64_t v11 = 2;
  }
  else
  {
    uint64_t v11 = 1;
  }
  thirdTitleLabel = self->_thirdTitleLabel;

  [(UILabel *)thirdTitleLabel setNumberOfLines:v11];
}

- (void)_updateLabelColors
{
  int contentViewType = self->_contentViewType;
  if (contentViewType)
  {
    if (contentViewType != 1) {
      return;
    }
    if (sub_1000BBB44(self) != 5 || !self->_isParentCellSelected)
    {
      id v4 = [(TwoLinesContentView *)self _labelColor];
      [(UILabel *)self->_mainTitleLabel setTextColor:v4];

      v5 = +[UIColor secondaryLabelColor];
      [(UILabel *)self->_secondTitleLabel setTextColor:v5];

      uint64_t v6 = +[UIColor secondaryLabelColor];
LABEL_9:
      uint64_t v9 = v6;
      id v19 = (id)v6;
      thirdTitleLabel = self->_thirdTitleLabel;
      goto LABEL_10;
    }
LABEL_8:
    uint64_t v7 = [(TwoLinesContentView *)self _selectedLabelColor];
    [(UILabel *)self->_mainTitleLabel setTextColor:v7];

    double v8 = [(TwoLinesContentView *)self _selectedLabelColor];
    [(UILabel *)self->_secondTitleLabel setTextColor:v8];

    uint64_t v6 = [(TwoLinesContentView *)self _selectedLabelColor];
    goto LABEL_9;
  }
  if (sub_1000BBB44(self) == 5 && self->_isParentCellSelected) {
    goto LABEL_8;
  }
  double v12 = [(TwoLinesContentView *)self _labelColor];
  [(UILabel *)self->_mainTitleLabel setTextColor:v12];

  double v13 = [(TwoLinesContentViewModel *)self->_viewModel subtitleTextColor];
  if (v13)
  {
    [(UILabel *)self->_secondTitleLabel setTextColor:v13];
  }
  else
  {
    double v14 = +[UIColor secondaryLabelColor];
    [(UILabel *)self->_secondTitleLabel setTextColor:v14];
  }
  double v15 = [(TwoLinesContentViewModel *)self->_viewModel placeContextViewModel];

  if (!v15)
  {
    uint64_t v16 = [(TwoLinesContentViewModel *)self->_viewModel subtitleTextColor];
    if (!v16)
    {
      v18 = +[UIColor secondaryLabelColor];
      [(UILabel *)self->_thirdTitleLabel setTextColor:v18];

      uint64_t v11 = 0;
      goto LABEL_11;
    }
    double v17 = (void *)v16;
    thirdTitleLabel = self->_thirdTitleLabel;
    id v19 = v17;
    uint64_t v9 = (uint64_t)v17;
LABEL_10:
    [(UILabel *)thirdTitleLabel setTextColor:v9];
    uint64_t v11 = v19;
LABEL_11:
  }
}

- (id)_selectedLabelColor
{
  int contentViewType = self->_contentViewType;
  if (contentViewType == 1)
  {
    id v4 = +[UIColor whiteColor];
    v2 = [v4 colorWithAlphaComponent:0.7];
  }
  else if (!contentViewType)
  {
    v2 = +[UIColor whiteColor];
  }

  return v2;
}

- (id)_labelColor
{
  int contentViewType = self->_contentViewType;
  if (contentViewType != 1)
  {
    if (contentViewType) {
      goto LABEL_9;
    }
    if (([(TwoLinesContentViewModel *)self->_viewModel isDisabled] & 1) == 0)
    {
      v5 = [(TwoLinesContentViewModel *)self->_viewModel titleTextColor];
      uint64_t v6 = v5;
      if (v5)
      {
        id v7 = v5;
      }
      else
      {
        id v7 = +[UIColor labelColor];
      }
      v2 = v7;

      goto LABEL_9;
    }
  }
  v2 = +[UIColor secondaryLabelColor];
LABEL_9:

  return v2;
}

- (void)_updateImage:(id)a3
{
  id v4 = a3;
  v5 = [(TwoLinesContentView *)self traitCollection];
  uint64_t v6 = [v5 preferredContentSizeCategory];
  IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v6);

  if (IsAccessibilityCategory)
  {
    if (!v4) {
      id v4 = (id)objc_opt_new();
    }
    uint64_t v8 = [(TwoLinesContentView *)self _renderAttachmentImageWithImage:v4 vibrant:[(TwoLinesContentViewModel *)self->_viewModel hasVibrantBackground]];

    [(NSTextAttachment *)self->_attachment setImage:v8];
    uint64_t v9 = [(UILabel *)self->_mainTitleLabel attributedText];
    id v10 = [v9 mutableCopy];

    uint64_t v11 = [(UILabel *)self->_mainTitleLabel attributedText];
    double v12 = [(UILabel *)self->_mainTitleLabel attributedText];
    id v13 = [v12 length];
    id v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472;
    v22 = sub_1004FE0A0;
    v23 = &unk_1012ED540;
    id v24 = self;
    id v25 = v10;
    id v14 = v10;
    [v11 enumerateAttribute:NSAttachmentAttributeName inRange:0 options:v13 usingBlock:&v20];

    -[UILabel setAttributedText:](self->_mainTitleLabel, "setAttributedText:", v14, v20, v21, v22, v23, v24);
    [(UILabel *)self->_mainTitleLabel setNeedsDisplay];

    id v4 = (id)v8;
    if (!v8) {
      goto LABEL_11;
    }
  }
  else
  {
    if ([v4 isSymbolImage]) {
      uint64_t v15 = 4;
    }
    else {
      uint64_t v15 = 2;
    }
    [(UIImageView *)self->_leftImageView setContentMode:v15];
    [(UIImageView *)self->_leftImageView setImage:v4];
    if (!v4) {
      goto LABEL_11;
    }
  }
  uint64_t v16 = [(TwoLinesContentView *)self traitCollection];
  double v17 = [v16 preferredContentSizeCategory];
  BOOL v18 = UIContentSizeCategoryIsAccessibilityCategory(v17);

  if (!v18)
  {
    id v19 = [(TwoLinesContentViewModel *)self->_viewModel hasVibrantBackground];
    goto LABEL_13;
  }
LABEL_11:
  id v19 = 0;
LABEL_13:
  [(TwoLinesContentView *)self setVibrant:v19];
}

- (void)setVibrant:(BOOL)a3
{
  if (self->_vibrant != a3)
  {
    self->_vibrant = a3;
    if (a3)
    {
      [(TwoLinesContentView *)self _imageDimension];
      double v5 = v4;
      id v6 = [objc_alloc((Class)MKVibrantView) initWithFrame:0.0, 0.0, v5, v5];
      [v6 _setCornerRadius:v5 * 0.5];
      [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
      [(TwoLinesContentView *)self insertSubview:v6 belowSubview:self->_leftImageView];
      vibrantView = self->_vibrantView;
      self->_vibrantView = (MKVibrantView *)v6;
      id v8 = v6;

      [(TwoLinesContentView *)self _updateVibrantColor];
      v22 = [v8 centerXAnchor];
      uint64_t v21 = [(UIImageView *)self->_leftImageView centerXAnchor];
      id v20 = [v22 constraintEqualToAnchor:v21];
      v23[0] = v20;
      id v19 = [v8 centerYAnchor];
      uint64_t v9 = [(UIImageView *)self->_leftImageView centerYAnchor];
      id v10 = [v19 constraintEqualToAnchor:v9];
      v23[1] = v10;
      uint64_t v11 = [v8 widthAnchor];
      double v12 = [(UIImageView *)self->_leftImageView widthAnchor];
      id v13 = [v11 constraintEqualToAnchor:v12];
      v23[2] = v13;
      id v14 = [v8 heightAnchor];
      uint64_t v15 = [(UIImageView *)self->_leftImageView heightAnchor];
      uint64_t v16 = [v14 constraintEqualToAnchor:v15];
      v23[3] = v16;
      double v17 = +[NSArray arrayWithObjects:v23 count:4];
      +[NSLayoutConstraint activateConstraints:v17];
    }
    else
    {
      [(MKVibrantView *)self->_vibrantView removeFromSuperview];
      BOOL v18 = self->_vibrantView;
      self->_vibrantView = 0;
    }
  }
}

- (id)_renderAttachmentImageWithImage:(id)a3 vibrant:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    id v7 = [(TwoLinesContentView *)self traitCollection];
    id v8 = [v7 preferredContentSizeCategory];
    IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v8);

    if (IsAccessibilityCategory)
    {
      [(TwoLinesContentView *)self _imageDimension];
      double v11 = v10;
      id v12 = objc_alloc((Class)UIGraphicsImageRenderer);
      id v13 = [(TwoLinesContentView *)self traitCollection];
      id v14 = +[UIGraphicsImageRendererFormat formatForTraitCollection:v13];
      id v15 = [v12 initWithSize:v14 format:v11];

      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_1004FE5CC;
      v18[3] = &unk_1012ED568;
      id v19 = v6;
      id v16 = v6;
      id v6 = [v15 imageWithActions:v18];
    }
  }

  return v6;
}

- (void)setViewModel:(id)a3
{
  double v5 = (TwoLinesContentViewModel *)a3;
  p_viewModel = &self->_viewModel;
  if (self->_viewModel != v5)
  {
    double v11 = v5;
    unsigned int v7 = [(TwoLinesContentViewModel *)v5 shouldCenterImage];
    unsigned int v8 = [(TwoLinesContentViewModel *)*p_viewModel shouldCenterImage];
    uint64_t v9 = [(TwoLinesContentViewModel *)*p_viewModel observers];
    [v9 unregisterObserver:self];

    objc_storeStrong((id *)&self->_viewModel, a3);
    double v10 = [(TwoLinesContentViewModel *)*p_viewModel observers];
    [v10 registerObserver:self];

    if (v7 != v8) {
      [(TwoLinesContentView *)self _updateConstraints];
    }
    [(TwoLinesContentView *)self _updateViewsWithViewModel:v11];
    [(TwoLinesContentView *)self _updateLabelColors];
    [(TwoLinesContentView *)self _updateFonts];
    [(TwoLinesContentView *)self _updateNumberOfLines];
    [(TwoLinesContentView *)self _updateConstraintConstants];
    double v5 = v11;
  }
}

- (void)_updateViewsWithViewModel:(id)a3
{
  id v4 = a3;
  [(TwoLinesContentView *)self _updateImage:0];
  v100 = [v4 titleText];
  v98 = [v4 subtitleText];
  v101 = [v4 attributedSubtitleText];
  if (![v100 length]) {
    goto LABEL_7;
  }
  double v5 = [v4 titleHighlightRanges];
  id v6 = [v5 count];

  if (v6)
  {
    int contentViewType = self->_contentViewType;
    if (contentViewType)
    {
      if (contentViewType == 1)
      {
        BOOL v8 = !self->_isParentCellSelected;
        uint64_t v9 = [v4 titleHighlightRanges];
        double v10 = [(TwoLinesContentView *)self _titleFont];
        double v11 = [(TwoLinesContentView *)self _titleFont];
        if (v8) {
          +[UIColor labelColor];
        }
        else {
        id v12 = +[UIColor whiteColor];
        }
        id v13 = +[NSAttributedString attributedStringWithText:v100 highlightRanges:v9 font:v10 highlightedFont:v11 highlightedTextColor:v12];

        goto LABEL_17;
      }
LABEL_7:
      id v13 = 0;
      goto LABEL_18;
    }
    if (![v4 shouldEnableGrayscaleHighlighting]
      || ([(TwoLinesContentView *)self traitCollection],
          double v17 = objc_claimAutoreleasedReturnValue(),
          id v18 = [v17 userInterfaceIdiom],
          v17,
          v18 == (id)5))
    {
      uint64_t v9 = [v4 titleHighlightRanges];
      double v10 = [(TwoLinesContentView *)self _titleRegularFont];
      double v11 = [(TwoLinesContentView *)self _titleFont];
      id v13 = +[NSAttributedString attributedStringWithText:v100 boldInRange:v9 font:v10 bold:v11];
LABEL_17:

      goto LABEL_18;
    }
    v93 = [v4 titleHighlightRanges];
    v94 = [(TwoLinesContentView *)self _titleFont];
    v95 = [(TwoLinesContentView *)self _titleFont];
    v96 = +[UIColor labelColor];
    v97 = +[UIColor secondaryLabelColor];
    id v13 = +[NSAttributedString attributedStringWithText:v100 highlightRanges:v93 font:v94 highlightedFont:v95 highlightedTextColor:v96 unhighlightedTextColor:v97];
  }
  else
  {
    id v14 = [v4 titleTextFont];

    if (v14)
    {
      NSAttributedStringKey v106 = NSFontAttributeName;
      id v15 = [v4 titleTextFont];
      v107 = v15;
      id v16 = +[NSDictionary dictionaryWithObjects:&v107 forKeys:&v106 count:1];
    }
    else
    {
      id v16 = 0;
    }
    id v13 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v100 attributes:v16];
  }
LABEL_18:
  if ([v101 length])
  {
    id v99 = v101;
  }
  else if ([v98 length])
  {
    objc_super v34 = [v4 subtitleHighlightRanges];
    BOOL v35 = [v34 count] == 0;

    if (v35)
    {
      id v99 = [objc_alloc((Class)NSAttributedString) initWithString:v98];
    }
    else
    {
      v36 = [v4 subtitleHighlightRanges];
      v37 = +[UIFont system15];
      v38 = +[UIFont system15Bold];
      id v99 = +[NSAttributedString attributedStringWithText:v98 boldInRange:v36 font:v37 bold:v38];
    }
  }
  else
  {
    id v99 = 0;
  }
  id v19 = [(TwoLinesContentView *)self traitCollection];
  id v20 = [v19 preferredContentSizeCategory];
  IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v20);

  if (IsAccessibilityCategory)
  {
    v22 = +[NSAttributedString attributedStringWithAttachment:self->_attachment];
    id v23 = [objc_alloc((Class)NSMutableAttributedString) initWithAttributedString:v22];
    id v24 = [v4 titleText];

    if (v24)
    {
      id v25 = [objc_alloc((Class)NSAttributedString) initWithString:@" "];
      [v23 appendAttributedString:v25];

      id v26 = objc_alloc((Class)NSAttributedString);
      v27 = [v4 titleText];
      id v28 = [v26 initWithString:v27];
      [v23 appendAttributedString:v28];
    }
    [(UIImageView *)self->_leftImageView setHidden:1];
  }
  else
  {
    [(UIImageView *)self->_leftImageView setHidden:0];
    id v23 = v13;
  }
  [(UILabel *)self->_mainTitleLabel setAttributedText:v23];
  [(UILabel *)self->_secondTitleLabel setAttributedText:v99];
  -[UIView setHidden:](self->_badgeView, "setHidden:", [v4 showBadgeView] ^ 1);
  v29 = [(TwoLinesContentView *)self window];
  v30 = [v29 screen];
  double v31 = v30;
  if (v30)
  {
    [v30 scale];
    double v33 = v32;
  }
  else
  {
    v39 = +[UIScreen mainScreen];
    [v39 scale];
    double v33 = v40;
  }
  id v41 = [v4 imageShadowStyle];
  if (v41 == (id)1)
  {
    leftImageShadowView = self->_leftImageShadowView;
    if (!leftImageShadowView)
    {
      v44 = (UIView *)objc_alloc_init((Class)UIView);
      v45 = self->_leftImageShadowView;
      self->_leftImageShadowView = v44;

      [(UIView *)self->_leftImageShadowView setTranslatesAutoresizingMaskIntoConstraints:0];
      v46 = [(UIView *)self->_leftImageShadowView layer];
      [v46 setShadowPathIsBounds:1];

      v47 = [(UIView *)self->_leftImageShadowView layer];
      [v47 setPunchoutShadow:1];

      [(TwoLinesContentView *)self addSubview:self->_leftImageShadowView];
      LODWORD(v48) = 1148846080;
      v49 = [(UIView *)self->_leftImageShadowView _maps_constraintsEqualToEdgesOfView:self->_leftImageView priority:v48];
      v50 = [v49 allConstraints];
      +[NSLayoutConstraint activateConstraints:v50];

      leftImageShadowView = self->_leftImageShadowView;
    }
    v51 = [(UIView *)leftImageShadowView layer];
    [v51 setBorderWidth:1.0 / v33];

    id v52 = +[UIColor colorWithRed:0.454901963 green:0.454901963 blue:0.501960814 alpha:0.200000003];
    id v53 = [v52 CGColor];
    v54 = [(UIView *)self->_leftImageShadowView layer];
    [v54 setBorderColor:v53];

    v55 = [(UIView *)self->_leftImageShadowView layer];
    [v55 setShadowOffset:0.0, 1.0];

    double v56 = [(UIView *)self->_leftImageShadowView layer];
    [v56 setShadowRadius:5.0];

    v57 = [(UIView *)self->_leftImageShadowView layer];
    LODWORD(v58) = 1036831949;
    [v57 setShadowOpacity:v58];

    v42 = +[UIColor blackColor];
    id v59 = [(UIView *)v42 CGColor];
    v60 = [(UIView *)self->_leftImageShadowView layer];
    [v60 setShadowColor:v59];
  }
  else
  {
    if (v41) {
      goto LABEL_38;
    }
    [(UIView *)self->_leftImageShadowView removeFromSuperview];
    v42 = self->_leftImageShadowView;
    self->_leftImageShadowView = 0;
  }

LABEL_38:
  [(UIView *)self->_leftImageShadowView setHidden:[(UIImageView *)self->_leftImageView isHidden]];
  switch((unint64_t)[v4 imageStyle])
  {
    case 0uLL:
      [(TwoLinesContentView *)self _imageDimension];
      double v62 = v61;
      v63 = [(UIImageView *)self->_leftImageView layer];
      [v63 setCornerRadius:v62 * 0.5];

      [(TwoLinesContentView *)self _imageDimension];
      double v65 = v64;
      double v66 = [(UIView *)self->_leftImageShadowView layer];
      [v66 setCornerRadius:v65 * 0.5];

      break;
    case 1uLL:
      double v67 = [(UIImageView *)self->_leftImageView layer];
      [v67 setCornerRadius:5.0];

      v68 = [(UIView *)self->_leftImageShadowView layer];
      [v68 setCornerRadius:5.0];

      break;
    case 2uLL:
      [(UIImageView *)self->_leftImageView _setContinuousCornerRadius:4.0];
      [(UIView *)self->_leftImageShadowView _setContinuousCornerRadius:4.0];
      break;
    case 3uLL:
      [(UIImageView *)self->_leftImageView _setContinuousCornerRadius:7.0];
      [(UIView *)self->_leftImageShadowView _setContinuousCornerRadius:7.0];
      break;
    case 4uLL:
      v69 = [(UIImageView *)self->_leftImageView layer];
      [v69 setCornerRadius:0.0];

      v70 = [(UIView *)self->_leftImageShadowView layer];
      [v70 setCornerRadius:0.0];

      break;
    default:
      break;
  }
  [v4 imageSize];
  if (CGSizeZero.width != v72 || CGSizeZero.height != v71)
  {
    [v4 imageSize];
    -[NSLayoutConstraint setConstant:](self->_imageWidthConstraint, "setConstant:");
    [v4 imageSize];
    [(NSLayoutConstraint *)self->_imageHeightConstraint setConstant:v73];
  }
  v74 = [v4 leftImageTintColor];

  if (v74)
  {
    v75 = [v4 leftImageTintColor];
    [(UIImageView *)self->_leftImageView setTintColor:v75];
  }
  v76 = +[UIColor clearColor];
  [(UIImageView *)self->_leftImageView setBackgroundColor:v76];

  v77 = [v4 leadingImageBackgroundColor];

  if (v77)
  {
    v78 = [v4 leadingImageBackgroundColor];
    [(UIImageView *)self->_leftImageView setBackgroundColor:v78];
  }
  int v79 = self->_imageState + 1;
  self->_imageState = v79;
  objc_initWeak(&location, self);
  v102[0] = _NSConcreteStackBlock;
  v102[1] = 3221225472;
  v102[2] = sub_1004FF4B0;
  v102[3] = &unk_1012ED590;
  objc_copyWeak(&v103, &location);
  int v104 = v79;
  [v4 fetchImageForScreenScale:v102 withCompletionHandler:v33];
  v80 = [v4 placeContextViewModel];

  thirdTitleLabel = self->_thirdTitleLabel;
  if (v80)
  {
    [(UILabel *)thirdTitleLabel setHidden:0];
    v82 = [v4 placeContextViewModel];
    -[UILabel setUserInteractionEnabled:](self->_thirdTitleLabel, "setUserInteractionEnabled:", [v82 isTappable]);

    v83 = [v4 placeContextViewModel];
    v84 = [v83 attributedString];
    [(UILabel *)self->_thirdTitleLabel setAttributedText:v84];

    v85 = [v4 placeContextViewModel];
    v86 = [v85 image];
    [(UIImageView *)self->_thirdLabelImageView setHidden:v86 == 0];

    v87 = [v4 placeContextViewModel];
    v88 = [v87 image];
    [(UIImageView *)self->_thirdLabelImageView setImage:v88];

    v89 = [v4 placeContextViewModel];
    v90 = [v89 imageTintColor];
    [(UIImageView *)self->_thirdLabelImageView setTintColor:v90];

    v91 = [v4 placeContextViewModel];
    [v91 imageContinuousCornerRadius];
    -[UIImageView _setContinuousCornerRadius:](self->_thirdLabelImageView, "_setContinuousCornerRadius:");

    v92 = [v4 placeContextViewModel];
    -[UITapGestureRecognizer setEnabled:](self->_thirdLabelTap, "setEnabled:", [v92 isTappable]);
  }
  else
  {
    [(UILabel *)thirdTitleLabel setHidden:1];
    [(UILabel *)self->_thirdTitleLabel setUserInteractionEnabled:0];
    [(UILabel *)self->_thirdTitleLabel setAttributedText:0];
    [(UIImageView *)self->_thirdLabelImageView setHidden:1];
    [(UIImageView *)self->_thirdLabelImageView setImage:0];
  }
  [(TwoLinesContentView *)self _updateDebugLabel];
  objc_destroyWeak(&v103);
  objc_destroyWeak(&location);
}

- (void)twoLinesTableViewCellModelDidUpdate:(id)a3
{
  if (self->_viewModel == a3) {
    -[TwoLinesContentView _updateViewsWithViewModel:](self, "_updateViewsWithViewModel:");
  }
}

- (void)_updateDebugLabel
{
  v3 = [(TwoLinesContentViewModel *)self->_viewModel debugString];

  debugLabel = self->_debugLabel;
  if (v3)
  {
    if (!debugLabel)
    {
      double v5 = (UILabel *)objc_alloc_init((Class)UILabel);
      id v6 = self->_debugLabel;
      self->_debugLabel = v5;

      [(UILabel *)self->_debugLabel setAccessibilityIdentifier:@"SearchCellDebug"];
      [(UILabel *)self->_debugLabel setTranslatesAutoresizingMaskIntoConstraints:0];
      unsigned int v7 = +[UIFont system11];
      [(UILabel *)self->_debugLabel setFont:v7];

      BOOL v8 = +[UIColor redColor];
      [(UILabel *)self->_debugLabel setTextColor:v8];

      [(UILabel *)self->_debugLabel setAlpha:0.5];
      uint64_t v9 = +[UIColor clearColor];
      [(UILabel *)self->_debugLabel setBackgroundColor:v9];

      [(TwoLinesContentView *)self addSubview:self->_debugLabel];
      double v10 = [(UILabel *)self->_debugLabel leadingAnchor];
      double v11 = [(TwoLinesContentView *)self leadingAnchor];
      id v12 = [v10 constraintEqualToAnchor:v11 constant:10.0];
      [v12 setActive:1];

      id v13 = [(UILabel *)self->_debugLabel bottomAnchor];
      id v14 = [(TwoLinesContentView *)self bottomAnchor];
      id v15 = [v13 constraintEqualToAnchor:v14 constant:-2.0];
      [v15 setActive:1];
    }
    uint64_t v17 = [(TwoLinesContentViewModel *)self->_viewModel debugString];
    [(UILabel *)self->_debugLabel setText:v17];
    id v16 = (UILabel *)v17;
  }
  else
  {
    if (!debugLabel) {
      return;
    }
    [(UILabel *)debugLabel removeFromSuperview];
    id v16 = self->_debugLabel;
    self->_debugLabel = 0;
  }
}

- (id)_titleFont
{
  v2 = [(TwoLinesContentView *)self traitCollection];
  id v3 = [v2 userInterfaceIdiom];

  if (v3 == (id)5) {
    sub_100A9243C();
  }
  else {
  id v4 = +[UIFont system17SemiBold];
  }

  return v4;
}

- (id)_titleRegularFont
{
  v2 = [(TwoLinesContentView *)self traitCollection];
  id v3 = [v2 userInterfaceIdiom];

  if (v3 == (id)5) {
    sub_100A9243C();
  }
  else {
  id v4 = +[UIFont system17];
  }

  return v4;
}

- (id)_subtitleFont
{
  id v3 = [(TwoLinesContentView *)self traitCollection];
  id v4 = [v3 userInterfaceIdiom];

  if (v4 == (id)5)
  {
    double v5 = sub_100A92448();
  }
  else
  {
    unsigned int v6 = [(TwoLinesContentViewModel *)self->_viewModel subtitleUsesMonospacedNumbers];
    unsigned int v7 = +[UIFont system15];
    double v5 = v7;
    if (v6)
    {
      uint64_t v8 = [v7 _maps_fontWithMonospacedNumbers];

      double v5 = (void *)v8;
    }
  }

  return v5;
}

- (void)_updateFonts
{
  id v3 = [(TwoLinesContentView *)self _titleFont];
  [(UILabel *)self->_mainTitleLabel setFont:v3];

  id v4 = [(TwoLinesContentView *)self _subtitleFont];
  [(UILabel *)self->_secondTitleLabel setFont:v4];

  id v5 = [(TwoLinesContentView *)self _subtitleFont];
  [(UILabel *)self->_thirdTitleLabel setFont:v5];
}

- (double)_verticalMargin
{
  uint64_t v3 = sub_1000BBB44(self);
  double result = 16.0;
  if (v3 == 5)
  {
    double result = 3.0;
    if (self->_contentViewType == 1) {
      return 4.5;
    }
  }
  return result;
}

- (double)_imageDimension
{
  uint64_t v2 = sub_1000BBB44(self);
  double result = 30.0;
  if (v2 == 5) {
    return 24.0;
  }
  return result;
}

- (double)_imageToTextSpacing
{
  uint64_t v2 = sub_1000BBB44(self);
  double result = 12.0;
  if (v2 == 5) {
    return 8.0;
  }
  return result;
}

- (double)_labelVerticalSpacing
{
  uint64_t v2 = sub_1000BBB44(self);
  double result = 2.0;
  if (v2 == 5) {
    return 0.0;
  }
  return result;
}

- (void)didTapOnThirdLabel:(id)a3
{
  id v4 = [(TwoLinesContentView *)self viewModel];
  id v5 = [v4 placeContextViewModel];

  if (v5)
  {
    id v8 = [(TwoLinesContentView *)self placeContextViewModelDelegate];
    unsigned int v6 = [(TwoLinesContentView *)self viewModel];
    unsigned int v7 = [v6 placeContextViewModel];
    [v8 didTapOnPlaceContextWithViewModel:v7 parentView:self];
  }
}

- (TwoLinesContentViewModel)viewModel
{
  return self->_viewModel;
}

- (PlaceContextViewModelCellDelegate)placeContextViewModelDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_placeContextViewModelDelegate);

  return (PlaceContextViewModelCellDelegate *)WeakRetained;
}

- (void)setPlaceContextViewModelDelegate:(id)a3
{
}

- (BOOL)isParentCellSelected
{
  return self->_isParentCellSelected;
}

- (int)contentViewType
{
  return self->_contentViewType;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_placeContextViewModelDelegate);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_vibrantView, 0);
  objc_storeStrong((id *)&self->_thirdLabelToThirdImageViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_thirdLabelToLayoutGuideLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_thirdLabelImageViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_imageWidthConstraint, 0);
  objc_storeStrong((id *)&self->_imageHeightConstraint, 0);
  objc_storeStrong((id *)&self->_thirdLabelTopConstraint, 0);
  objc_storeStrong((id *)&self->_thirdLabelImageViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_imageCenteredVerticalConstraint, 0);
  objc_storeStrong((id *)&self->_imageVerticalConstraint, 0);
  objc_storeStrong((id *)&self->_minimumHeightConstraint, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_attachment, 0);
  objc_storeStrong((id *)&self->_thirdLabelTap, 0);
  objc_storeStrong((id *)&self->_thirdLabelImageView, 0);
  objc_storeStrong((id *)&self->_leftImageShadowView, 0);
  objc_storeStrong((id *)&self->_leftImageView, 0);
  objc_storeStrong((id *)&self->_debugLabel, 0);
  objc_storeStrong((id *)&self->_thirdTitleLabel, 0);
  objc_storeStrong((id *)&self->_secondTitleLabel, 0);
  objc_storeStrong((id *)&self->_mainTitleLabel, 0);

  objc_storeStrong((id *)&self->_titleLayoutGuide, 0);
}

@end