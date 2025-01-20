@interface SUSSoftwareUpdateTitleCell
+ (int64_t)cellStyle;
- (NSLayoutConstraint)updateStatusLabelVerticalConstraint;
- (PSWebContainerView)releaseNotesSummaryView;
- (SUSSoftwareUpdateTitleCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (SUSSoftwareUpdateTitleCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5 updateIcon:(id)a6 showLearnMore:(BOOL)a7 delegate:(id)a8;
- (SUSSoftwareUpdateTitleCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5 updateIcon:(id)a6 showLearnMore:(BOOL)a7 showSplomboNotes:(BOOL)a8 delegate:(id)a9;
- (SUSUISoftwareUpdateTitleCellDelegate)delegate;
- (UIImage)gearBackgroundImage;
- (UILabel)learnMoreLabel;
- (UILabel)splomboNotes;
- (UILabel)updateNameLabel;
- (UILabel)updateStatusLabel;
- (UIProgressView)progressBar;
- (double)preferredHeightWithTable:(id)a3;
- (id)configureUpdateIcon;
- (id)newLearnMoreLabel;
- (id)newProgressBar;
- (id)newSoftwareUpdateAnimatedIconWithFrame:(CGRect)a3;
- (id)newSplomboNotesLabel;
- (id)newUpdateStatusLabel;
- (int)progressDisplayStyle;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)configureAnimatedGearViewFromImageSize:(CGSize)a3;
- (void)configureImageView;
- (void)configureProgressBar:(BOOL)a3;
- (void)configureReleaseNotesSummaryView:(BOOL)a3;
- (void)configureUpdateImageViewFromImageSize:(CGSize)a3;
- (void)configureUpdateLabelsStackViewConstraints;
- (void)configureUpdateNameLabel:(BOOL)a3;
- (void)configureUpdateStatusLabel:(BOOL)a3;
- (void)handleLearnMoreTap:(id)a3;
- (void)layoutSubviews;
- (void)setAnimatingGearView:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setLearnMoreText:(id)a3;
- (void)setProgress:(float)a3;
- (void)setProgressDisplayStyle:(int)a3;
- (void)setPublisherText:(id)a3;
- (void)setReleaseNotesSummary:(id)a3;
- (void)setStatusMessage:(id)a3;
- (void)setStatusMessage:(id)a3 symbolizingError:(BOOL)a4;
- (void)setUpdateIcon:(id)a3;
- (void)setUpdateName:(id)a3;
- (void)setUpdateStatusLabelVerticalConstraint:(id)a3;
- (void)setupViews;
- (void)updateConstraints;
- (void)updateProgressTintColor;
@end

@implementation SUSSoftwareUpdateTitleCell

+ (int64_t)cellStyle
{
  return 3;
}

- (SUSSoftwareUpdateTitleCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v13 = self;
  SEL v12 = a2;
  int64_t v11 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v9 = 0;
  objc_storeStrong(&v9, a5);
  v5 = v13;
  v13 = 0;
  v13 = [(SUSSoftwareUpdateTitleCell *)v5 initWithStyle:v11 reuseIdentifier:location specifier:v9 updateIcon:0 showLearnMore:1 showSplomboNotes:0 delegate:0];
  v8 = v13;
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong((id *)&v13, 0);
  return v8;
}

- (SUSSoftwareUpdateTitleCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5 updateIcon:(id)a6 showLearnMore:(BOOL)a7 delegate:(id)a8
{
  v22 = self;
  SEL v21 = a2;
  int64_t v20 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v18 = 0;
  objc_storeStrong(&v18, a5);
  id v17 = 0;
  objc_storeStrong(&v17, a6);
  BOOL v16 = a7;
  id v15 = 0;
  objc_storeStrong(&v15, a8);
  v8 = v22;
  v22 = 0;
  v22 = [(SUSSoftwareUpdateTitleCell *)v8 initWithStyle:v20 reuseIdentifier:location specifier:v18 updateIcon:v17 showLearnMore:v16 showSplomboNotes:0 delegate:v15];
  v14 = v22;
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong((id *)&v22, 0);
  return v14;
}

- (SUSSoftwareUpdateTitleCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5 updateIcon:(id)a6 showLearnMore:(BOOL)a7 showSplomboNotes:(BOOL)a8 delegate:(id)a9
{
  v26 = self;
  SEL v25 = a2;
  int64_t v24 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v22 = 0;
  objc_storeStrong(&v22, a5);
  id v21 = 0;
  objc_storeStrong(&v21, a6);
  BOOL v20 = a7;
  BOOL v19 = a8;
  id v18 = 0;
  objc_storeStrong(&v18, a9);
  id v9 = v26;
  v26 = 0;
  v17.receiver = v9;
  v17.super_class = (Class)SUSSoftwareUpdateTitleCell;
  v26 = [(PSTableCell *)&v17 initWithStyle:v24 reuseIdentifier:location specifier:v22];
  objc_storeStrong((id *)&v26, v26);
  if (v26)
  {
    objc_storeWeak((id *)&v26->_delegate, v18);
    [(SUSSoftwareUpdateTitleCell *)v26 setSelectionStyle:0];
    -[SUSSoftwareUpdateTitleCell setHoverStyle:](v26, "setHoverStyle:");
    objc_storeStrong((id *)&v26->_updateIcon, v21);
    v26->_showLearnMoreButton = v20;
    objc_storeStrong((id *)&v26->_updateIconContraints, 0);
    v26->_showSplomboNotes = v19;
    [(SUSSoftwareUpdateTitleCell *)v26 setupViews];
    id v12 = (id)[(SUSSoftwareUpdateTitleCell *)v26 detailTextLabel];
    [v12 setHidden:1];
  }
  int64_t v11 = v26;
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong((id *)&v26, 0);
  return v11;
}

- (void)updateConstraints
{
  v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)SUSSoftwareUpdateTitleCell;
  [(SUSSoftwareUpdateTitleCell *)&v2 updateConstraints];
}

- (double)preferredHeightWithTable:(id)a3
{
  v51 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(SUSSoftwareUpdateTitleCell *)v51 bounds];
  double v49 = v3;
  id v35 = (id)[MEMORY[0x263F82B60] mainScreen];
  [v35 bounds];
  double v36 = v4;

  CGSizeMake_0();
  double v47 = v5;
  double v48 = v6;
  if (v51->_learnMoreLabel)
  {
    -[UILabel sizeThatFits:](v51->_learnMoreLabel, "sizeThatFits:", v5, v6);
    double v34 = v7 + 20.0;
  }
  else
  {
    double v34 = 0.0;
  }
  if (v51->_splomboNotes)
  {
    -[UILabel sizeThatFits:](v51->_splomboNotes, "sizeThatFits:", v47, v48);
    double v33 = v8 + 8.0;
  }
  else
  {
    double v33 = 0.0;
  }
  id v30 = (id)[(PSWebContainerView *)v51->_releaseNotesSummaryView webView];
  id v29 = (id)[v30 scrollView];
  [v29 contentOffset];
  double v45 = v9;
  double v46 = v10;

  [(PSWebContainerView *)v51->_releaseNotesSummaryView heightForWidth:v49 - 0.0];
  double v44 = v11;
  id v32 = (id)[(PSWebContainerView *)v51->_releaseNotesSummaryView webView];
  id v31 = (id)[v32 scrollView];
  objc_msgSend(v31, "setContentOffset:", v45, v46);

  -[UILabel sizeThatFits:](v51->_updateNameLabel, "sizeThatFits:", v47, v48);
  double v43 = v12;
  v42[8] = 0;
  *(void *)v42 = v51->_progressStyle == 0;
  if (v51->_progressStyle)
  {
    -[UIProgressView sizeThatFits:](v51->_progressBar, "sizeThatFits:", v47, v48);
    *(double *)&v42[1] = v13 + 3.0;
  }
  -[UILabel sizeThatFits:](v51->_updateStatusLabel, "sizeThatFits:", v47, v48);
  double v41 = v14 + 3.0;
  v27 = [(UIImageView *)v51->_imageView image];
  [(UIImage *)v27 size];
  double v28 = v15;

  double v40 = v43 + *(double *)&v42[1] + v41;
  if (v40 < v28) {
    double v40 = v28;
  }
  double v39 = v44;
  if (v44 > v36 / 2.0 - 26.0 - v40 - v34 - v33) {
    double v39 = v36 / 2.0 - 26.0 - v40 - v34 - v33;
  }
  if (v39 < v36 / 4.0) {
    double v39 = v36 / 4.0;
  }
  if (v39 >= v44)
  {
    double v39 = v44;
    id v21 = (id)[(id)*MEMORY[0x263F83300] preferredContentSizeCategory];
    char v37 = 0;
    char v22 = 1;
    if (([v21 isEqualToString:*MEMORY[0x263F83430]] & 1) == 0)
    {
      id v38 = (id)[(id)*MEMORY[0x263F83300] preferredContentSizeCategory];
      char v37 = 1;
      char v22 = [v38 isEqualToString:*MEMORY[0x263F83400]];
    }
    if (v37) {

    }
    if (v22) {
      double v39 = v44 + 20.0;
    }
    id v18 = (id)[(PSWebContainerView *)v51->_releaseNotesSummaryView webView];
    id v17 = (id)[v18 scrollView];
    [v17 setScrollEnabled:0];

    id v20 = (id)[(PSWebContainerView *)v51->_releaseNotesSummaryView webView];
    id v19 = (id)[v20 scrollView];
    [v19 setBounces:0];
  }
  else
  {
    id v24 = (id)[(PSWebContainerView *)v51->_releaseNotesSummaryView webView];
    id v23 = (id)[v24 scrollView];
    [v23 setScrollEnabled:1];

    id v26 = (id)[(PSWebContainerView *)v51->_releaseNotesSummaryView webView];
    id v25 = (id)[v26 scrollView];
    [v25 setBounces:1];
  }
  objc_storeStrong(location, 0);
  return v39 + v40 + v34 + v33 + 26.0;
}

- (void)layoutSubviews
{
  double v9 = self;
  SEL v8 = a2;
  BOOL v7 = 0;
  double v3 = (NSString *)(id)[(id)*MEMORY[0x263F83300] preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);

  BOOL v7 = IsAccessibilityCategory;
  [(SUSSoftwareUpdateTitleCell *)v9 configureUpdateNameLabel:IsAccessibilityCategory];
  [(SUSSoftwareUpdateTitleCell *)v9 configureUpdateStatusLabel:IsAccessibilityCategory];
  id v5 = (id)[(SUSSoftwareUpdateTitleCell *)v9 contentView];
  [v5 bringSubviewToFront:v9->_imageView];

  if (v9->_animatedGearView)
  {
    id v2 = (id)[(SUSSoftwareUpdateTitleCell *)v9 contentView];
    [v2 bringSubviewToFront:v9->_animatedGearView];
  }
  v6.receiver = v9;
  v6.super_class = (Class)SUSSoftwareUpdateTitleCell;
  [(PSTableCell *)&v6 layoutSubviews];
}

- (void)setupViews
{
  double v11 = self;
  SEL v10 = a2;
  [(SUSSoftwareUpdateTitleCell *)self configureImageView];
  id v3 = (id)[MEMORY[0x263F82670] currentDevice];
  BOOL v4 = [v3 userInterfaceIdiom] == 1;

  BOOL v9 = v4;
  id location = (id)[(id)*MEMORY[0x263F83300] preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)location);
  BOOL v6 = 0;
  if (v4) {
    BOOL v6 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)location, (UIContentSizeCategory)*MEMORY[0x263F83468]) == NSOrderedDescending;
  }
  else {
    BOOL v6 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)location, (UIContentSizeCategory)*MEMORY[0x263F83470]) == NSOrderedDescending;
  }
  [(SUSSoftwareUpdateTitleCell *)v11 configureUpdateLabelsStackViewConstraints];
  char v2 = 1;
  if (!IsAccessibilityCategory) {
    char v2 = v6;
  }
  [(SUSSoftwareUpdateTitleCell *)v11 configureReleaseNotesSummaryView:v2 & 1];
  v5.receiver = v11;
  v5.super_class = (Class)SUSSoftwareUpdateTitleCell;
  [(SUSSoftwareUpdateTitleCell *)&v5 updateConstraints];
  objc_storeStrong(&location, 0);
}

- (void)configureImageView
{
  double v13 = self;
  location[1] = (id)a2;
  location[0] = [(SUSSoftwareUpdateTitleCell *)self configureUpdateIcon];
  char v10 = 0;
  if (v13->_updateIcon)
  {
    updateIcon = v13->_updateIcon;
  }
  else
  {
    double v11 = [(SUSSoftwareUpdateTitleCell *)v13 gearBackgroundImage];
    char v10 = 1;
    updateIcon = v11;
  }
  [location[0] setImage:updateIcon];
  if (v10) {

  }
  id v8 = (id)[(SUSSoftwareUpdateTitleCell *)v13 contentView];
  [v8 addSubview:location[0]];

  objc_storeStrong((id *)&v13->_imageView, location[0]);
  if (v13->_updateIcon)
  {
    BOOL v7 = [(UIImageView *)v13->_imageView image];
    [(UIImage *)v7 size];
    -[SUSSoftwareUpdateTitleCell configureUpdateImageViewFromImageSize:](v13, "configureUpdateImageViewFromImageSize:", v2, v3);
  }
  else
  {
    BOOL v6 = [(UIImageView *)v13->_imageView image];
    [(UIImage *)v6 size];
    -[SUSSoftwareUpdateTitleCell configureAnimatedGearViewFromImageSize:](v13, "configureAnimatedGearViewFromImageSize:", v4, v5);
  }
  [(UIImageView *)v13->_imageView setAccessibilityIdentifier:@"SUSSoftwareUpdateTitleCellIcon"];
  objc_storeStrong(location, 0);
}

- (void)configureAnimatedGearViewFromImageSize:(CGSize)a3
{
  v37[8] = *MEMORY[0x263EF8340];
  double v3 = -[SUSSoftwareUpdateTitleCell newSoftwareUpdateAnimatedIconWithFrame:](self, "newSoftwareUpdateAnimatedIconWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  animatedGearView = self->_animatedGearView;
  self->_animatedGearView = v3;

  [(SUSSoftwareUpdateAnimatedIcon *)self->_animatedGearView setTranslatesAutoresizingMaskIntoConstraints:0];
  id v32 = (id)[(SUSSoftwareUpdateTitleCell *)self contentView];
  [v32 addSubview:self->_animatedGearView];

  double height = a3.height;
  double width = a3.width;
  if (a3.width == 0.0 || (double v5 = a3.height, a3.height == 0.0))
  {
    double v5 = 60.0;
    double width = 60.0;
    double height = 60.0;
  }
  id v31 = (id)[(SUSSoftwareUpdateAnimatedIcon *)self->_animatedGearView widthAnchor];
  id v30 = (id)[v31 constraintEqualToConstant:width];
  v37[0] = v30;
  id v29 = (id)[(SUSSoftwareUpdateAnimatedIcon *)self->_animatedGearView heightAnchor];
  id v28 = (id)[v29 constraintEqualToConstant:height];
  v37[1] = v28;
  id v27 = (id)[(SUSSoftwareUpdateAnimatedIcon *)self->_animatedGearView leadingAnchor];
  id v26 = (id)[(SUSSoftwareUpdateTitleCell *)self contentView];
  id v25 = (id)[v26 leadingAnchor];
  id v24 = (id)objc_msgSend(v27, "constraintEqualToAnchor:constant:");
  v37[2] = v24;
  id v23 = (id)[(SUSSoftwareUpdateAnimatedIcon *)self->_animatedGearView topAnchor];
  id v22 = (id)[(SUSSoftwareUpdateTitleCell *)self contentView];
  id v21 = (id)[v22 topAnchor];
  id v20 = (id)objc_msgSend(v23, "constraintEqualToAnchor:constant:", 17.0);
  v37[3] = v20;
  id v19 = (id)[(UIImageView *)self->_imageView widthAnchor];
  id v18 = (id)[v19 constraintEqualToConstant:width];
  v37[4] = v18;
  id v17 = (id)[(UIImageView *)self->_imageView heightAnchor];
  id v16 = (id)[v17 constraintEqualToConstant:height];
  v37[5] = v16;
  id v15 = (id)[(UIImageView *)self->_imageView leadingAnchor];
  id v14 = (id)[(SUSSoftwareUpdateTitleCell *)self contentView];
  id v13 = (id)[v14 leadingAnchor];
  id v12 = (id)objc_msgSend(v15, "constraintEqualToAnchor:constant:", 17.0);
  v37[6] = v12;
  id v11 = (id)[(UIImageView *)self->_imageView topAnchor];
  id v10 = (id)[(SUSSoftwareUpdateTitleCell *)self contentView];
  id v9 = (id)[v10 topAnchor];
  id v8 = (id)objc_msgSend(v11, "constraintEqualToAnchor:constant:", 17.0);
  v37[7] = v8;
  BOOL v6 = (NSArray *)(id)[MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:8];
  updateIconContraints = self->_updateIconContraints;
  self->_updateIconContraints = v6;

  [MEMORY[0x263F08938] activateConstraints:self->_updateIconContraints];
}

- (void)configureUpdateImageViewFromImageSize:(CGSize)a3
{
  v22[4] = *MEMORY[0x263EF8340];
  double width = a3.width;
  double height = a3.height;
  if (a3.width == 0.0 || (double v3 = a3.height, a3.height == 0.0))
  {
    double v3 = 60.0;
    double width = 60.0;
    double height = 60.0;
  }
  id v18 = (id)[(UIImageView *)self->_imageView widthAnchor];
  id v17 = (id)[v18 constraintEqualToConstant:width];
  v22[0] = v17;
  id v16 = (id)[*(id *)((char *)&self->super.super.super.super.super.isa+ *(int *)(v6 + 3140)) heightAnchor];
  id v15 = (id)[v16 constraintEqualToConstant:height];
  v22[1] = v15;
  id v14 = (id)[*(id *)((char *)&self->super.super.super.super.super.isa+ *(int *)(v6 + 3140)) leadingAnchor];
  id v13 = (id)[(SUSSoftwareUpdateTitleCell *)self contentView];
  id v12 = (id)[v13 leadingAnchor];
  id v11 = (id)objc_msgSend(v14, "constraintEqualToAnchor:constant:");
  v22[2] = v11;
  id v10 = (id)[*(id *)((char *)&self->super.super.super.super.super.isa+ *(int *)(v6 + 3140)) topAnchor];
  id v9 = (id)[(SUSSoftwareUpdateTitleCell *)self contentView];
  id v8 = (id)[v9 topAnchor];
  id v7 = (id)objc_msgSend(v10, "constraintEqualToAnchor:constant:", 17.0);
  v22[3] = v7;
  double v4 = (NSArray *)(id)[MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];
  updateIconContraints = self->_updateIconContraints;
  self->_updateIconContraints = v4;

  [MEMORY[0x263F08938] activateConstraints:self->_updateIconContraints];
}

- (id)configureUpdateIcon
{
  v5[2] = self;
  v5[1] = (id)a2;
  id v2 = objc_alloc(MEMORY[0x263F82828]);
  v5[0] = (id)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v5[0] sizeToFit];
  [v5[0] setTranslatesAutoresizingMaskIntoConstraints:0];
  id v4 = v5[0];
  objc_storeStrong(v5, 0);
  return v4;
}

- (void)configureUpdateLabelsStackViewConstraints
{
  v28[3] = *MEMORY[0x263EF8340];
  id v25 = (NSString *)(id)[(id)*MEMORY[0x263F83300] preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v25);

  if (!self->_updateLabelsStackView)
  {
    id v2 = (UIStackView *)objc_alloc_init(MEMORY[0x263F82BF8]);
    updateLabelsStackView = self->_updateLabelsStackView;
    self->_updateLabelsStackView = v2;

    [(UIStackView *)self->_updateLabelsStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)self->_updateLabelsStackView setAxis:1];
  }
  id v24 = (id)[(SUSSoftwareUpdateTitleCell *)self contentView];
  [v24 addSubview:self->_updateLabelsStackView];

  if (self->_updateLabelsConstraints)
  {
    [MEMORY[0x263F08938] deactivateConstraints:self->_updateLabelsConstraints];
    [(NSMutableArray *)self->_updateLabelsConstraints removeAllObjects];
  }
  else
  {
    id v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    updateLabelsConstraints = self->_updateLabelsConstraints;
    self->_updateLabelsConstraints = v4;
  }
  id v12 = self->_updateLabelsConstraints;
  id v23 = (id)[(UIStackView *)self->_updateLabelsStackView topAnchor];
  id v22 = (id)[(UIImageView *)self->_imageView topAnchor];
  id v21 = (id)objc_msgSend(v23, "constraintEqualToAnchor:");
  v28[0] = v21;
  id v20 = (id)[(UIStackView *)self->_updateLabelsStackView leadingAnchor];
  id v19 = (id)[(UIImageView *)self->_imageView trailingAnchor];
  id v18 = (id)objc_msgSend(v20, "constraintEqualToAnchor:constant:", 12.0);
  v28[1] = v18;
  id v17 = (id)[(UIStackView *)self->_updateLabelsStackView trailingAnchor];
  id v16 = (id)[(SUSSoftwareUpdateTitleCell *)self contentView];
  id v15 = (id)[v16 trailingAnchor];
  id v14 = (id)objc_msgSend(v17, "constraintEqualToAnchor:constant:", -12.0);
  v28[2] = v14;
  id v13 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:3];
  -[NSMutableArray addObjectsFromArray:](v12, "addObjectsFromArray:");

  if (self->_progressStyle)
  {
    [(UIStackView *)self->_updateLabelsStackView setDistribution:4];
    LODWORD(v6) = 1148846080;
    [(UIStackView *)self->_updateLabelsStackView setContentHuggingPriority:1 forAxis:v6];
    id v8 = self->_updateLabelsConstraints;
    id v11 = (id)[(UIStackView *)self->_updateLabelsStackView bottomAnchor];
    id v10 = (id)[(UIImageView *)self->_imageView bottomAnchor];
    id v9 = (id)objc_msgSend(v11, "constraintGreaterThanOrEqualToAnchor:");
    -[NSMutableArray addObject:](v8, "addObject:");
  }
  else
  {
    [(UIStackView *)self->_updateLabelsStackView setDistribution:2];
    [(UIStackView *)self->_updateLabelsStackView setSpacing:3.0];
    LODWORD(v7) = 1132068864;
    [(UIStackView *)self->_updateLabelsStackView setContentHuggingPriority:1 forAxis:v7];
  }
  [(SUSSoftwareUpdateTitleCell *)self configureUpdateNameLabel:IsAccessibilityCategory];
  [(SUSSoftwareUpdateTitleCell *)self configureUpdateStatusLabel:IsAccessibilityCategory];
  [(SUSSoftwareUpdateTitleCell *)self configureProgressBar:IsAccessibilityCategory];
  [(UIStackView *)self->_updateLabelsStackView layoutSubviews];
  [MEMORY[0x263F08938] activateConstraints:self->_updateLabelsConstraints];
}

- (void)configureUpdateNameLabel:(BOOL)a3
{
  id v9 = self;
  SEL v8 = a2;
  BOOL v7 = a3;
  id location = (id)[MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835D0]];
  if (!v9->_updateNameLabel)
  {
    double v3 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    updateNameLabel = v9->_updateNameLabel;
    v9->_updateNameLabel = v3;

    [(UILabel *)v9->_updateNameLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v5) = 1148846080;
    [(UILabel *)v9->_updateNameLabel setContentHuggingPriority:1 forAxis:v5];
    [(UILabel *)v9->_updateNameLabel setNumberOfLines:0];
    [(UILabel *)v9->_updateNameLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v9->_updateNameLabel setFont:location];
    [(UIStackView *)v9->_updateLabelsStackView addArrangedSubview:v9->_updateNameLabel];
  }
  [(UILabel *)v9->_updateNameLabel setAccessibilityIdentifier:@"SUSSoftwareUpdateTitleCellUpdateName"];
  objc_storeStrong(&location, 0);
}

- (void)configureUpdateStatusLabel:(BOOL)a3
{
  if (!self->_updateStatusLabel)
  {
    double v3 = [(SUSSoftwareUpdateTitleCell *)self newUpdateStatusLabel];
    updateStatusLabel = self->_updateStatusLabel;
    self->_updateStatusLabel = v3;

    [(UILabel *)self->_updateStatusLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v5) = 1148846080;
    [(UILabel *)self->_updateStatusLabel setContentHuggingPriority:1 forAxis:v5];
    [(UIStackView *)self->_updateLabelsStackView addArrangedSubview:self->_updateStatusLabel];
  }
  [(UILabel *)self->_updateStatusLabel setAccessibilityIdentifier:@"SUSSoftwareUpdateTitleCellUpdateStatus"];
}

- (void)configureReleaseNotesSummaryView:(BOOL)a3
{
  v178[2] = *MEMORY[0x263EF8340];
  v169 = self;
  SEL v168 = a2;
  BOOL v167 = a3;
  if (!self->_releaseNotesSummaryView)
  {
    double v3 = (PSWebContainerView *)objc_alloc_init(MEMORY[0x263F5FD20]);
    releaseNotesSummaryView = v169->_releaseNotesSummaryView;
    v169->_releaseNotesSummaryView = v3;
  }
  if (!v169->_learnMoreLabel && (PSIsRunningInAssistant() & 1) == 0 && v169->_showLearnMoreButton)
  {
    uint64_t v5 = [(SUSSoftwareUpdateTitleCell *)v169 newLearnMoreLabel];
    learnMoreLabel = v169->_learnMoreLabel;
    v169->_learnMoreLabel = (UILabel *)v5;
  }
  if (!v169->_splomboNotes && v169->_showSplomboNotes)
  {
    uint64_t v7 = [(SUSSoftwareUpdateTitleCell *)v169 newSplomboNotesLabel];
    splomboNotes = v169->_splomboNotes;
    v169->_splomboNotes = (UILabel *)v7;
  }
  if (v169->_learnMoreLabel && v169->_splomboNotes)
  {
    id v124 = objc_alloc(MEMORY[0x263F82E00]);
    CGRectMake();
    v165[1] = v9;
    v165[2] = v10;
    v165[3] = v11;
    v165[4] = v12;
    id v166 = (id)objc_msgSend(v124, "initWithFrame:", *(double *)&v9, *(double *)&v10, *(double *)&v11, *(double *)&v12);
    id v126 = (id)[v166 heightAnchor];
    id v125 = (id)[v126 constraintEqualToConstant:10.0];
    [v125 setActive:1];

    id v127 = objc_alloc(MEMORY[0x263F82E00]);
    CGRectMake();
    v164[1] = v13;
    v164[2] = v14;
    v164[3] = v15;
    v164[4] = v16;
    v165[0] = (id)objc_msgSend(v127, "initWithFrame:", *(double *)&v13, *(double *)&v14, *(double *)&v15, *(double *)&v16);
    id v129 = (id)[v165[0] heightAnchor];
    id v128 = (id)[v129 constraintEqualToConstant:10.0];
    [v128 setActive:1];

    id v130 = objc_alloc(MEMORY[0x263F82E00]);
    CGRectMake();
    v163[1] = v17;
    v163[2] = v18;
    v163[3] = v19;
    v163[4] = v20;
    v164[0] = (id)objc_msgSend(v130, "initWithFrame:", *(double *)&v17, *(double *)&v18, *(double *)&v19, *(double *)&v20);
    id v132 = (id)[v164[0] widthAnchor];
    id v131 = (id)[v132 constraintEqualToConstant:8.0];
    [v131 setActive:1];

    id v133 = objc_alloc(MEMORY[0x263F82BF8]);
    v178[0] = v164[0];
    v178[1] = v169->_learnMoreLabel;
    id v134 = (id)objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v178);
    v163[0] = (id)objc_msgSend(v133, "initWithArrangedSubviews:");

    [v163[0] setTranslatesAutoresizingMaskIntoConstraints:0];
    [v163[0] setAutoresizesSubviews:0];
    objc_msgSend(v163[0], "setAxis:");
    objc_msgSend(v163[0], "setAlignment:");
    [v163[0] setDistribution:0];
    id v135 = objc_alloc(MEMORY[0x263F82E00]);
    CGRectMake();
    v161[1] = v21;
    v161[2] = v22;
    v161[3] = v23;
    v161[4] = v24;
    id v162 = (id)objc_msgSend(v135, "initWithFrame:", *(double *)&v21, *(double *)&v22, *(double *)&v23, *(double *)&v24);
    id v137 = (id)[v162 heightAnchor];
    id v136 = (id)[v137 constraintEqualToConstant:4.0];
    [v136 setActive:1];

    id v138 = objc_alloc(MEMORY[0x263F82E00]);
    CGRectMake();
    v160[1] = v25;
    v160[2] = v26;
    v160[3] = v27;
    v160[4] = v28;
    v161[0] = (id)objc_msgSend(v138, "initWithFrame:", *(double *)&v25, *(double *)&v26, *(double *)&v27, *(double *)&v28);
    id v140 = (id)[v161[0] heightAnchor];
    id v139 = (id)[v140 constraintEqualToConstant:4.0];
    [v139 setActive:1];

    id v141 = objc_alloc(MEMORY[0x263F82E00]);
    CGRectMake();
    v159[1] = v29;
    v159[2] = v30;
    v159[3] = v31;
    v159[4] = v32;
    v160[0] = (id)objc_msgSend(v141, "initWithFrame:", *(double *)&v29, *(double *)&v30, *(double *)&v31, *(double *)&v32);
    id v143 = (id)[v160[0] widthAnchor];
    id v142 = (id)[v143 constraintEqualToConstant:8.0];
    [v142 setActive:1];

    id v144 = objc_alloc(MEMORY[0x263F82BF8]);
    v177[0] = v160[0];
    v177[1] = v169->_splomboNotes;
    id v145 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v177 count:2];
    v159[0] = (id)objc_msgSend(v144, "initWithArrangedSubviews:");

    [v159[0] setTranslatesAutoresizingMaskIntoConstraints:0];
    [v159[0] setAutoresizesSubviews:0];
    [v159[0] setAxis:0];
    [v159[0] setAlignment:1];
    [v159[0] setDistribution:0];
    id v146 = objc_alloc(MEMORY[0x263F82BF8]);
    v176[0] = v169->_releaseNotesSummaryView;
    v176[1] = v161[0];
    v176[2] = v159[0];
    v176[3] = v165[0];
    v176[4] = v163[0];
    v176[5] = v166;
    id v147 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v176 count:6];
    uint64_t v33 = objc_msgSend(v146, "initWithArrangedSubviews:");
    releaseNotesStackView = v169->_releaseNotesStackView;
    v169->_releaseNotesStackView = (UIStackView *)v33;

    objc_storeStrong(v159, 0);
    objc_storeStrong(v160, 0);
    objc_storeStrong(v161, 0);
    objc_storeStrong(&v162, 0);
    objc_storeStrong(v163, 0);
    objc_storeStrong(v164, 0);
    objc_storeStrong(v165, 0);
    objc_storeStrong(&v166, 0);
  }
  else if (v169->_learnMoreLabel)
  {
    id v111 = objc_alloc(MEMORY[0x263F82E00]);
    CGRectMake();
    v157[1] = v35;
    v157[2] = v36;
    v157[3] = v37;
    v157[4] = v38;
    id v158 = (id)objc_msgSend(v111, "initWithFrame:", *(double *)&v35, *(double *)&v36, *(double *)&v37, *(double *)&v38);
    id v113 = (id)[v158 heightAnchor];
    id v112 = (id)[v113 constraintEqualToConstant:10.0];
    [v112 setActive:1];

    id v114 = objc_alloc(MEMORY[0x263F82E00]);
    CGRectMake();
    v156[1] = v39;
    v156[2] = v40;
    v156[3] = v41;
    v156[4] = v42;
    v157[0] = (id)objc_msgSend(v114, "initWithFrame:", *(double *)&v39, *(double *)&v40, *(double *)&v41, *(double *)&v42);
    id v116 = (id)[v157[0] heightAnchor];
    id v115 = (id)[v116 constraintEqualToConstant:10.0];
    [v115 setActive:1];

    id v117 = objc_alloc(MEMORY[0x263F82E00]);
    CGRectMake();
    v155[1] = v43;
    v155[2] = v44;
    v155[3] = v45;
    v155[4] = v46;
    v156[0] = (id)objc_msgSend(v117, "initWithFrame:", *(double *)&v43, *(double *)&v44, *(double *)&v45, *(double *)&v46);
    id v119 = (id)[v156[0] widthAnchor];
    id v118 = (id)[v119 constraintEqualToConstant:8.0];
    [v118 setActive:1];

    id v120 = objc_alloc(MEMORY[0x263F82BF8]);
    v175[0] = v156[0];
    v175[1] = v169->_learnMoreLabel;
    id v121 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v175 count:2];
    v155[0] = (id)objc_msgSend(v120, "initWithArrangedSubviews:");

    [v155[0] setTranslatesAutoresizingMaskIntoConstraints:0];
    [v155[0] setAutoresizesSubviews:0];
    objc_msgSend(v155[0], "setAxis:");
    [v155[0] setAlignment:1];
    [v155[0] setDistribution:0];
    id v122 = objc_alloc(MEMORY[0x263F82BF8]);
    v174[0] = v169->_releaseNotesSummaryView;
    v174[1] = v157[0];
    v174[2] = v155[0];
    v174[3] = v158;
    id v123 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v174 count:4];
    uint64_t v47 = objc_msgSend(v122, "initWithArrangedSubviews:");
    double v48 = v169->_releaseNotesStackView;
    v169->_releaseNotesStackView = (UIStackView *)v47;

    objc_storeStrong(v155, 0);
    objc_storeStrong(v156, 0);
    objc_storeStrong(v157, 0);
    objc_storeStrong(&v158, 0);
  }
  else if (v169->_splomboNotes)
  {
    id v98 = objc_alloc(MEMORY[0x263F82E00]);
    CGRectMake();
    v153[1] = v49;
    v153[2] = v50;
    v153[3] = v51;
    v153[4] = v52;
    id v154 = (id)objc_msgSend(v98, "initWithFrame:", *(double *)&v49, *(double *)&v50, *(double *)&v51, *(double *)&v52);
    id v100 = (id)[v154 heightAnchor];
    id v99 = (id)[v100 constraintEqualToConstant:4.0];
    [v99 setActive:1];

    id v101 = objc_alloc(MEMORY[0x263F82E00]);
    CGRectMake();
    v152[1] = v53;
    v152[2] = v54;
    v152[3] = v55;
    v152[4] = v56;
    v153[0] = (id)objc_msgSend(v101, "initWithFrame:", *(double *)&v53, *(double *)&v54, *(double *)&v55, *(double *)&v56);
    id v103 = (id)[v153[0] heightAnchor];
    id v102 = (id)[v103 constraintEqualToConstant:4.0];
    [v102 setActive:1];

    id v104 = objc_alloc(MEMORY[0x263F82E00]);
    CGRectMake();
    v151[1] = v57;
    v151[2] = v58;
    v151[3] = v59;
    v151[4] = v60;
    v152[0] = (id)objc_msgSend(v104, "initWithFrame:", *(double *)&v57, *(double *)&v58, *(double *)&v59, *(double *)&v60);
    id v106 = (id)[v152[0] widthAnchor];
    id v105 = (id)[v106 constraintEqualToConstant:8.0];
    [v105 setActive:1];

    id v107 = objc_alloc(MEMORY[0x263F82BF8]);
    v173[0] = v152[0];
    v173[1] = v169->_splomboNotes;
    id v108 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v173 count:2];
    v151[0] = (id)objc_msgSend(v107, "initWithArrangedSubviews:");

    [v151[0] setTranslatesAutoresizingMaskIntoConstraints:0];
    [v151[0] setAutoresizesSubviews:0];
    objc_msgSend(v151[0], "setAxis:");
    [v151[0] setAlignment:1];
    [v151[0] setDistribution:0];
    id v109 = objc_alloc(MEMORY[0x263F82BF8]);
    v172[0] = v169->_releaseNotesSummaryView;
    v172[1] = v153[0];
    v172[2] = v151[0];
    v172[3] = v154;
    id v110 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v172 count:4];
    uint64_t v61 = objc_msgSend(v109, "initWithArrangedSubviews:");
    v62 = v169->_releaseNotesStackView;
    v169->_releaseNotesStackView = (UIStackView *)v61;

    objc_storeStrong(v151, 0);
    objc_storeStrong(v152, 0);
    objc_storeStrong(v153, 0);
    objc_storeStrong(&v154, 0);
  }
  else
  {
    id v96 = objc_alloc(MEMORY[0x263F82BF8]);
    v171 = v169->_releaseNotesSummaryView;
    id v97 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v171 count:1];
    uint64_t v63 = objc_msgSend(v96, "initWithArrangedSubviews:");
    v64 = v169->_releaseNotesStackView;
    v169->_releaseNotesStackView = (UIStackView *)v63;
  }
  [(UIStackView *)v169->_releaseNotesStackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)v169->_releaseNotesStackView setAutoresizesSubviews:0];
  -[UIStackView setAxis:](v169->_releaseNotesStackView, "setAxis:");
  [(UIStackView *)v169->_releaseNotesStackView setAlignment:1];
  [(UIStackView *)v169->_releaseNotesStackView setDistribution:0];
  [(UIStackView *)v169->_releaseNotesStackView setLayoutMarginsRelativeArrangement:1];
  id v83 = (id)[(SUSSoftwareUpdateTitleCell *)v169 contentView];
  [v83 addSubview:v169->_releaseNotesStackView];

  id v87 = (id)[(UIStackView *)v169->_releaseNotesStackView leadingAnchor];
  id v86 = (id)[(SUSSoftwareUpdateTitleCell *)v169 contentView];
  id v85 = (id)[v86 leadingAnchor];
  id v84 = (id)objc_msgSend(v87, "constraintEqualToAnchor:constant:", 8.0);
  [v84 setActive:1];

  id v91 = (id)[(UIStackView *)v169->_releaseNotesStackView trailingAnchor];
  id v90 = (id)[(SUSSoftwareUpdateTitleCell *)v169 contentView];
  id v89 = (id)[v90 trailingAnchor];
  id v88 = (id)objc_msgSend(v91, "constraintEqualToAnchor:constant:", -8.0);
  [v88 setActive:1];

  id v95 = (id)[(UIStackView *)v169->_releaseNotesStackView bottomAnchor];
  id v94 = (id)[(SUSSoftwareUpdateTitleCell *)v169 contentView];
  id v93 = (id)[v94 bottomAnchor];
  id v92 = (id)objc_msgSend(v95, "constraintEqualToAnchor:");
  [v92 setActive:1];

  if (v167) {
    v65 = v169->_releaseNotesStackView;
  }
  else {
    v65 = v169->_releaseNotesSummaryView;
  }
  v150 = v65;
  id v69 = (id)[(UIStackView *)v65 topAnchor];
  id v68 = (id)[(UIStackView *)v169->_updateLabelsStackView bottomAnchor];
  id v149 = (id)objc_msgSend(v69, "constraintEqualToAnchor:constant:");

  LODWORD(v66) = 1144750080;
  [v149 setPriority:v66];
  [v149 setActive:1];
  id v71 = (id)[(UIStackView *)v150 topAnchor];
  id v70 = (id)[(UIImageView *)v169->_imageView bottomAnchor];
  id v148 = (id)objc_msgSend(v71, "constraintGreaterThanOrEqualToAnchor:constant:", 4.0);

  LODWORD(v67) = 1148846080;
  [v148 setPriority:v67];
  [v148 setActive:1];
  id v75 = (id)[(PSWebContainerView *)v169->_releaseNotesSummaryView leadingAnchor];
  id v74 = (id)[(SUSSoftwareUpdateTitleCell *)v169 contentView];
  id v73 = (id)[v74 leadingAnchor];
  id v72 = (id)objc_msgSend(v75, "constraintEqualToAnchor:constant:", 8.0);
  [v72 setActive:1];

  id v79 = (id)[(PSWebContainerView *)v169->_releaseNotesSummaryView trailingAnchor];
  id v78 = (id)[(SUSSoftwareUpdateTitleCell *)v169 contentView];
  id v77 = (id)[v78 trailingAnchor];
  id v76 = (id)objc_msgSend(v79, "constraintEqualToAnchor:constant:", -8.0);
  [v76 setActive:1];

  [(PSWebContainerView *)v169->_releaseNotesSummaryView setAccessibilityIdentifier:@"SUSSoftwareUpdateTitleCellReleaseNotesSummary"];
  v80 = v169->_releaseNotesSummaryView;
  id v82 = (id)[(PSWebContainerView *)v80 webView];
  id v170 = v82;
  id v81 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v170 count:1];
  -[PSWebContainerView setAccessibilityElements:](v80, "setAccessibilityElements:");

  [(PSWebContainerView *)v169->_releaseNotesSummaryView setAccessibilityContainerType:4];
  objc_storeStrong(&v148, 0);
  objc_storeStrong(&v149, 0);
  objc_storeStrong((id *)&v150, 0);
}

- (void)configureProgressBar:(BOOL)a3
{
  if (!self->_progressBar)
  {
    double v3 = [(SUSSoftwareUpdateTitleCell *)self newProgressBar];
    progressBar = self->_progressBar;
    self->_progressBar = v3;

    if (self->_progressStyle)
    {
      [(UIStackView *)self->_updateLabelsStackView addArrangedSubview:self->_progressBar];
      [(UIProgressView *)self->_progressBar setAlpha:1.0];
      [(UIProgressView *)self->_progressBar setHidden:0];
    }
    else
    {
      [(UIProgressView *)self->_progressBar removeFromSuperview];
      [(UIProgressView *)self->_progressBar setAlpha:0.0];
      [(UIProgressView *)self->_progressBar setHidden:1];
    }
  }
  [(SUSSoftwareUpdateTitleCell *)self updateProgressTintColor];
  [(UIProgressView *)self->_progressBar setAccessibilityIdentifier:@"SUSSoftwareUpdateTitleCellProgressBar"];
}

- (void)updateProgressTintColor
{
  if (self->_progressStyle == 2)
  {
    progressBar = self->_progressBar;
    id v5 = (id)[MEMORY[0x263F825C8] grayColor];
    -[UIProgressView setProgressTintColor:](progressBar, "setProgressTintColor:");
  }
  else if (self->_progressStyle == 1)
  {
    id v2 = self->_progressBar;
    id v3 = (id)[(SUSSoftwareUpdateTitleCell *)self tintColor];
    -[UIProgressView setProgressTintColor:](v2, "setProgressTintColor:");
  }
}

- (void)setProgressDisplayStyle:(int)a3
{
  id v20 = self;
  SEL v19 = a2;
  int v18 = a3;
  if (self->_progressStyle != a3)
  {
    v20->_progressStyle = v18;
    [(SUSSoftwareUpdateTitleCell *)v20 updateProgressTintColor];
    if (v20->_progressStyle)
    {
      [(UIStackView *)v20->_updateLabelsStackView addArrangedSubview:v20->_progressBar];
      [(UIProgressView *)v20->_progressBar setAlpha:1.0];
      [(UIProgressView *)v20->_progressBar setHidden:0];
    }
    else
    {
      [(UIProgressView *)v20->_progressBar removeFromSuperview];
      [(UIProgressView *)v20->_progressBar setAlpha:0.0];
      [(UIProgressView *)v20->_progressBar setHidden:1];
    }
    [(SUSSoftwareUpdateTitleCell *)v20 configureUpdateLabelsStackViewConstraints];
    id v3 = (id)[(SUSSoftwareUpdateTitleCell *)v20 superview];
    BOOL v5 = v3 != 0;

    if (v5)
    {
      [(SUSSoftwareUpdateTitleCell *)v20 layoutIfNeeded];
      id v4 = (void *)MEMORY[0x263F82E00];
      uint64_t v12 = MEMORY[0x263EF8330];
      int v13 = -1073741824;
      int v14 = 0;
      id v15 = __54__SUSSoftwareUpdateTitleCell_setProgressDisplayStyle___block_invoke;
      id v16 = &unk_264E07438;
      id v17 = v20;
      uint64_t v6 = MEMORY[0x263EF8330];
      int v7 = -1073741824;
      int v8 = 0;
      id v9 = __54__SUSSoftwareUpdateTitleCell_setProgressDisplayStyle___block_invoke_2;
      id v10 = &unk_264E07460;
      id v11 = v20;
      [v4 animateWithDuration:&v12 animations:&v6 completion:0.3];
      objc_storeStrong((id *)&v11, 0);
      objc_storeStrong((id *)&v17, 0);
    }
    else
    {
      [(SUSSoftwareUpdateTitleCell *)v20 setNeedsUpdateConstraints];
    }
  }
}

uint64_t __54__SUSSoftwareUpdateTitleCell_setProgressDisplayStyle___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

uint64_t __54__SUSSoftwareUpdateTitleCell_setProgressDisplayStyle___block_invoke_2(uint64_t result)
{
  uint64_t v1 = result;
  if (!*(_DWORD *)(*(void *)(result + 32) + 1192))
  {
    [*(id *)(result + 32) setNeedsUpdateConstraints];
    [*(id *)(v1 + 32) updateConstraintsIfNeeded];
    return [*(id *)(v1 + 32) layoutIfNeeded];
  }
  return result;
}

- (int)progressDisplayStyle
{
  return self->_progressStyle;
}

- (void)setProgress:(float)a3
{
}

- (id)newSoftwareUpdateAnimatedIconWithFrame:(CGRect)a3
{
  return -[SUSSoftwareUpdateAnimatedIcon initWithFrame:]([SUSSoftwareUpdateAnimatedIcon alloc], "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)setReleaseNotesSummary:(id)a3
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [NSString alloc];
  id v8 = (id)objc_msgSend(v3, "initWithData:encoding:", location[0]);
  id v4 = +[SUSReleaseNotesProcessor sharedInstance];
  id v7 = [(SUSReleaseNotesProcessor *)v4 normalizeHtmlReleaseNotes:v8];

  releaseNotesSummaryView = v10->_releaseNotesSummaryView;
  id v6 = (id)[v7 dataUsingEncoding:4];
  -[PSWebContainerView setContent:](releaseNotesSummaryView, "setContent:");

  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)setUpdateName:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(UILabel *)v4->_updateNameLabel setText:location[0]];
  objc_storeStrong(location, 0);
}

- (void)setStatusMessage:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(UILabel *)v4->_updateStatusLabel setText:location[0]];
  objc_storeStrong(location, 0);
}

- (void)setStatusMessage:(id)a3 symbolizingError:(BOOL)a4
{
  uint64_t v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(UILabel *)v12->_updateStatusLabel setText:location[0]];
  updateStatusLabel = v12->_updateStatusLabel;
  char v9 = 0;
  char v7 = 0;
  if (a4)
  {
    id v10 = (id)[MEMORY[0x263F825C8] systemRedColor];
    char v9 = 1;
    id v4 = v10;
  }
  else
  {
    id v8 = (id)[MEMORY[0x263F825C8] labelColor];
    char v7 = 1;
    id v4 = v8;
  }
  -[UILabel setTextColor:](updateStatusLabel, "setTextColor:", v4, v4);
  if (v7) {

  }
  if (v9) {
  objc_storeStrong(location, 0);
  }
}

- (void)setLearnMoreText:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(UILabel *)v4->_learnMoreLabel setText:location[0]];
  objc_storeStrong(location, 0);
}

- (void)setPublisherText:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
}

- (void)setAnimatingGearView:(BOOL)a3
{
  if (self->_animatedGearView) {
    [(SUSSoftwareUpdateAnimatedIcon *)self->_animatedGearView setAnimating:a3];
  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (a4 && v6->_animatingGearView) {
    [(SUSSoftwareUpdateTitleCell *)v6 setAnimatingGearView:1];
  }
  objc_storeStrong(location, 0);
}

- (void)setUpdateIcon:(id)a3
{
  id v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (([(UIImage *)v16->_updateIcon isEqual:location[0]] & 1) == 0 && (v16->_updateIcon || location[0]))
  {
    objc_storeStrong((id *)&v16->_updateIcon, location[0]);
    if (v16->_updateIconContraints) {
      [MEMORY[0x263F08938] deactivateConstraints:v16->_updateIconContraints];
    }
    if (v16->_animatedGearView)
    {
      [(SUSSoftwareUpdateAnimatedIcon *)v16->_animatedGearView removeFromSuperview];
      objc_storeStrong((id *)&v16->_animatedGearView, 0);
    }
    imageView = v16->_imageView;
    char v13 = 0;
    if (v16->_updateIcon)
    {
      updateIcon = v16->_updateIcon;
    }
    else
    {
      int v14 = [(SUSSoftwareUpdateTitleCell *)v16 gearBackgroundImage];
      char v13 = 1;
      updateIcon = v14;
    }
    [(UIImageView *)imageView setImage:updateIcon];
    if (v13) {

    }
    if (v16->_updateIcon)
    {
      char v9 = v16;
      id v10 = [(UIImageView *)v16->_imageView image];
      [(UIImage *)v10 size];
      -[SUSSoftwareUpdateTitleCell configureUpdateImageViewFromImageSize:](v9, "configureUpdateImageViewFromImageSize:", v3, v4);
    }
    else
    {
      char v7 = v16;
      id v8 = [(UIImageView *)v16->_imageView image];
      [(UIImage *)v8 size];
      -[SUSSoftwareUpdateTitleCell configureAnimatedGearViewFromImageSize:](v7, "configureAnimatedGearViewFromImageSize:", v5, v6);
    }
  }
  objc_storeStrong(location, 0);
}

- (UIImage)gearBackgroundImage
{
  v6[2] = self;
  v6[1] = (id)a2;
  double v3 = (void *)MEMORY[0x263F827E8];
  id v4 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6[0] = (id)objc_msgSend(v3, "imageNamed:inBundle:", @"PreferencesIconBackground");

  id v5 = v6[0];
  objc_storeStrong(v6, 0);
  return (UIImage *)v5;
}

- (id)newProgressBar
{
  v12[2] = self;
  v12[1] = (id)a2;
  v12[0] = (id)[objc_alloc(MEMORY[0x263F82AF0]) initWithProgressViewStyle:0];
  [v12[0] setTranslatesAutoresizingMaskIntoConstraints:0];
  [v12[0] setClipsToBounds:1];
  id v4 = v12[0];
  CGAffineTransformMakeScale(&v11, 1.0, 0.75);
  [v4 setTransform:&v11];
  id v5 = v12[0];
  id v7 = (id)[v12[0] heightAnchor];
  id v6 = (id)[v7 constraintEqualToConstant:6.0];
  objc_msgSend(v5, "addConstraint:");

  id v8 = (id)[v12[0] layer];
  [v12[0] bounds];
  [v8 setCornerRadius:v2 / 2.0];

  id v9 = (id)[v12[0] layer];
  [v9 setMasksToBounds:1];

  id v10 = v12[0];
  objc_storeStrong(v12, 0);
  return v10;
}

- (id)newUpdateStatusLabel
{
  v7[2] = self;
  v7[1] = (id)a2;
  id v2 = objc_alloc(MEMORY[0x263F828E0]);
  v7[0] = (id)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v7[0] setTranslatesAutoresizingMaskIntoConstraints:0];
  id v4 = v7[0];
  id v5 = (id)[MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835B8]];
  objc_msgSend(v4, "setFont:");

  [v7[0] setNumberOfLines:2];
  [v7[0] setLineBreakMode:0];
  id v6 = v7[0];
  objc_storeStrong(v7, 0);
  return v6;
}

- (id)newSplomboNotesLabel
{
  v15[1] = *MEMORY[0x263EF8340];
  v13[2] = self;
  v13[1] = (id)a2;
  id v2 = objc_alloc(MEMORY[0x263F828E0]);
  v13[0] = (id)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  id v4 = v13[0];
  id v5 = (id)[MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
  objc_msgSend(v4, "setFont:");

  [v13[0] setNumberOfLines:2];
  [v13[0] setLineBreakMode:0];
  [v13[0] setTranslatesAutoresizingMaskIntoConstraints:0];
  id v6 = objc_alloc(MEMORY[0x263F089B8]);
  id v10 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v9 = (id)[v10 localizedStringForKey:@"SPLOMBO_UPDATE_INFO" value:&stru_26EF052F8 table:@"Software Update"];
  uint64_t v14 = *MEMORY[0x263F81500];
  id v8 = (id)[MEMORY[0x263F825C8] labelColor];
  v15[0] = v8;
  id v7 = (id)[NSDictionary dictionaryWithObjects:v15 forKeys:&v14 count:1];
  id v12 = (id)objc_msgSend(v6, "initWithString:attributes:", v9);

  [v13[0] setAttributedText:v12];
  [v13[0] setAccessibilityIdentifier:@"SUSSoftwareUpdateTitleCellSplomboNotes"];
  id v11 = v13[0];
  objc_storeStrong(&v12, 0);
  objc_storeStrong(v13, 0);
  return v11;
}

- (id)newLearnMoreLabel
{
  v19[1] = *MEMORY[0x263EF8340];
  id v17 = self;
  v16[1] = (id)a2;
  id v2 = objc_alloc(MEMORY[0x263F828E0]);
  v16[0] = (id)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v16[0] setTranslatesAutoresizingMaskIntoConstraints:0];
  id v5 = v16[0];
  id v6 = (id)[MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83580]];
  objc_msgSend(v5, "setFont:");

  objc_msgSend(v16[0], "setNumberOfLines:");
  [v16[0] setLineBreakMode:2];
  [v16[0] setTranslatesAutoresizingMaskIntoConstraints:0];
  id v7 = objc_alloc(MEMORY[0x263F089B8]);
  id v11 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v10 = (id)[v11 localizedStringForKey:@"LEARN_MORE_LINK" value:&stru_26EF052F8 table:@"Software Update"];
  uint64_t v18 = *MEMORY[0x263F81500];
  id v9 = (id)[MEMORY[0x263F825C8] systemBlueColor];
  v19[0] = v9;
  id v8 = (id)[NSDictionary dictionaryWithObjects:v19 forKeys:&v18 count:1];
  id v15 = (id)objc_msgSend(v7, "initWithString:attributes:", v10);

  [v16[0] setUserInteractionEnabled:1];
  id v12 = v16[0];
  id v3 = objc_alloc(MEMORY[0x263F82CB0]);
  id v13 = (id)[v3 initWithTarget:v17 action:sel_handleLearnMoreTap_];
  objc_msgSend(v12, "addGestureRecognizer:");

  [v16[0] setAttributedText:v15];
  [v16[0] setAccessibilityIdentifier:@"SUSSoftwareUpdateTitleCellLearnMore"];
  id v14 = v16[0];
  objc_storeStrong(&v15, 0);
  objc_storeStrong(v16, 0);
  return v14;
}

- (void)handleLearnMoreTap:(id)a3
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id WeakRetained = objc_loadWeakRetained((id *)&v9->_delegate);
  char v6 = 0;
  char v5 = 0;
  if (WeakRetained)
  {
    id v7 = objc_loadWeakRetained((id *)&v9->_delegate);
    char v6 = 1;
    char v5 = objc_opt_respondsToSelector();
  }
  if (v6) {

  }
  if (v5)
  {
    id v3 = objc_loadWeakRetained((id *)&v9->_delegate);
    [v3 titleCell:v9 learnMoreButtonTapped:v9->_learnMoreLabel];
  }
  objc_storeStrong(location, 0);
}

- (UIProgressView)progressBar
{
  return self->_progressBar;
}

- (UILabel)updateNameLabel
{
  return self->_updateNameLabel;
}

- (UILabel)updateStatusLabel
{
  return self->_updateStatusLabel;
}

- (UILabel)learnMoreLabel
{
  return self->_learnMoreLabel;
}

- (UILabel)splomboNotes
{
  return self->_splomboNotes;
}

- (PSWebContainerView)releaseNotesSummaryView
{
  return self->_releaseNotesSummaryView;
}

- (NSLayoutConstraint)updateStatusLabelVerticalConstraint
{
  return self->_updateStatusLabelVerticalConstraint;
}

- (void)setUpdateStatusLabelVerticalConstraint:(id)a3
{
}

- (SUSUISoftwareUpdateTitleCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUSUISoftwareUpdateTitleCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end