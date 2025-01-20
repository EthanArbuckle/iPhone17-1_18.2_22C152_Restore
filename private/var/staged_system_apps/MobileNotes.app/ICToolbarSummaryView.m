@interface ICToolbarSummaryView
+ (id)buttonTitleTextAttributesTransformerWithTextStyle:(id)a3;
+ (id)lockNowButtonConfigurationShowingAsFooter:(BOOL)a3;
+ (id)primaryLabelFontShowingAsFooter:(BOOL)a3;
+ (id)secondaryLabelFontShowingAsFooter:(BOOL)a3;
+ (id)syncActionButtonConfigurationWithTitle:(id)a3 showingAsFooter:(BOOL)a4;
- (BOOL)countsHidden;
- (BOOL)isAccessibilityElement;
- (BOOL)isLockNowHidden;
- (BOOL)isShowingAsFooter;
- (BOOL)isSyncActivityVisible;
- (CGPoint)accessibilityActivationPoint;
- (ICProgressIndicatorTracker)progressIndicatorTracker;
- (ICQInAppMessage)syncMessage;
- (ICToolbarSummaryView)initWithFrame:(CGRect)a3;
- (ICToolbarSummaryViewDelegate)delegate;
- (NSArray)summaryComponents;
- (NSLayoutConstraint)bottomConstraint;
- (NSLayoutConstraint)topConstraint;
- (NSLayoutConstraint)widthConstraint;
- (NSString)summary;
- (NSString)summaryAccessibilityLabel;
- (UIActivityIndicatorView)activityIndicatorView;
- (UIButton)lockNowButton;
- (UIButton)syncActionButton;
- (UILabel)summaryLabel;
- (UILabel)syncSubtitleLabel;
- (UILabel)syncTitleLabel;
- (UIStackView)rootStackView;
- (UIStackView)syncStackView;
- (double)availableWidth;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)buttonElement;
- (unint64_t)totalFolderCount;
- (unint64_t)totalInvitationsCount;
- (unint64_t)totalNoteCount;
- (void)dealloc;
- (void)enumerateAccessibleSubviewsWithBlock:(id)a3;
- (void)setAvailableWidth:(double)a3;
- (void)setBottomConstraint:(id)a3;
- (void)setCountsHidden:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setLockNowHidden:(BOOL)a3;
- (void)setProgressIndicatorTracker:(id)a3;
- (void)setShowingAsFooter:(BOOL)a3;
- (void)setSyncActivityVisible:(BOOL)a3;
- (void)setSyncMessage:(id)a3;
- (void)setTopConstraint:(id)a3;
- (void)setTotalFolderCount:(unint64_t)a3;
- (void)setTotalInvitationsCount:(unint64_t)a3;
- (void)setTotalNoteCount:(unint64_t)a3;
- (void)setWidthConstraint:(id)a3;
- (void)update;
- (void)updateConstraints;
- (void)updateSyncActivityIndicator;
@end

@implementation ICToolbarSummaryView

- (ICToolbarSummaryView)initWithFrame:(CGRect)a3
{
  v39.receiver = self;
  v39.super_class = (Class)ICToolbarSummaryView;
  v3 = -[ICToolbarSummaryView initWithFrame:](&v39, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_lockNowHidden = 1;
    v5 = [(ICToolbarSummaryView *)v3 rootStackView];
    [(ICToolbarSummaryView *)v4 addSubview:v5];

    v6 = [(ICToolbarSummaryView *)v4 activityIndicatorView];
    [(ICToolbarSummaryView *)v4 addSubview:v6];

    v38 = [(ICToolbarSummaryView *)v4 rootStackView];
    v37 = [v38 topAnchor];
    v36 = [(ICToolbarSummaryView *)v4 topAnchor];
    uint64_t v7 = [v37 constraintEqualToAnchor:v36];
    topConstraint = v4->_topConstraint;
    v4->_topConstraint = (NSLayoutConstraint *)v7;

    v40[0] = v7;
    v35 = [(ICToolbarSummaryView *)v4 rootStackView];
    v34 = [v35 bottomAnchor];
    v33 = [(ICToolbarSummaryView *)v4 bottomAnchor];
    uint64_t v9 = [v34 constraintEqualToAnchor:v33];
    bottomConstraint = v4->_bottomConstraint;
    v4->_bottomConstraint = (NSLayoutConstraint *)v9;

    v40[1] = v9;
    v32 = [(ICToolbarSummaryView *)v4 rootStackView];
    v31 = [v32 leadingAnchor];
    v30 = [(ICToolbarSummaryView *)v4 leadingAnchor];
    v29 = [v31 constraintEqualToAnchor:v30];
    v40[2] = v29;
    v28 = [(ICToolbarSummaryView *)v4 rootStackView];
    v27 = [v28 trailingAnchor];
    v26 = [(ICToolbarSummaryView *)v4 trailingAnchor];
    v25 = [v27 constraintEqualToAnchor:v26];
    v40[3] = v25;
    v11 = [(UIActivityIndicatorView *)v4->_activityIndicatorView centerYAnchor];
    v12 = [(ICToolbarSummaryView *)v4 rootStackView];
    v13 = [v12 centerYAnchor];
    v14 = [v11 constraintEqualToAnchor:v13];
    v40[4] = v14;
    v15 = [(UIActivityIndicatorView *)v4->_activityIndicatorView trailingAnchor];
    v16 = [(ICToolbarSummaryView *)v4 rootStackView];
    v17 = [v16 leadingAnchor];
    v18 = [v15 constraintEqualToAnchor:v17 constant:-10.0];
    v40[5] = v18;
    v19 = +[NSArray arrayWithObjects:v40 count:6];
    +[NSLayoutConstraint activateConstraints:v19];

    v20 = [(ICToolbarSummaryView *)v4 rootStackView];
    v21 = [v20 widthAnchor];
    uint64_t v22 = [v21 constraintLessThanOrEqualToConstant:0.0];
    widthConstraint = v4->_widthConstraint;
    v4->_widthConstraint = (NSLayoutConstraint *)v22;
  }
  return v4;
}

- (void)dealloc
{
  v3 = [(ICToolbarSummaryView *)self progressIndicatorTracker];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)ICToolbarSummaryView;
  [(ICToolbarSummaryView *)&v4 dealloc];
}

- (void)updateConstraints
{
  v15.receiver = self;
  v15.super_class = (Class)ICToolbarSummaryView;
  [(ICToolbarSummaryView *)&v15 updateConstraints];
  [(ICToolbarSummaryView *)self availableWidth];
  double v4 = v3;
  v5 = [(ICToolbarSummaryView *)self widthConstraint];
  [v5 setConstant:v4];

  v6 = [(ICToolbarSummaryView *)self widthConstraint];
  [v6 constant];
  BOOL v8 = v7 > 0.0;
  uint64_t v9 = [(ICToolbarSummaryView *)self widthConstraint];
  [v9 setActive:v8];

  LODWORD(v8) = [(ICToolbarSummaryView *)self isShowingAsFooter];
  v10 = [(ICToolbarSummaryView *)self topConstraint];
  v11 = v10;
  if (v8)
  {
    [v10 setConstant:40.0];

    v12 = [(ICToolbarSummaryView *)self bottomConstraint];
    v13 = v12;
    double v14 = -40.0;
  }
  else
  {
    [v10 setConstant:0.0];

    v12 = [(ICToolbarSummaryView *)self bottomConstraint];
    v13 = v12;
    double v14 = 0.0;
  }
  [v12 setConstant:v14];
}

+ (id)primaryLabelFontShowingAsFooter:(BOOL)a3
{
  double v3 = (id *)&UIFontTextStyleHeadline;
  if (!a3) {
    double v3 = (id *)&UIFontTextStyleCaption2;
  }
  id v4 = *v3;
  v5 = +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:UIContentSizeCategoryMedium];
  v6 = +[UIFont preferredFontForTextStyle:v4 compatibleWithTraitCollection:v5];

  double v7 = [v6 ic_fontWithSingleLineA];

  return v7;
}

+ (id)secondaryLabelFontShowingAsFooter:(BOOL)a3
{
  double v3 = &UIFontTextStyleFootnote;
  if (!a3) {
    double v3 = &UIFontTextStyleCaption2;
  }
  id v4 = +[UIFont preferredFontForTextStyle:*v3];
  v5 = [v4 ic_fontWithSingleLineA];

  return v5;
}

+ (id)buttonTitleTextAttributesTransformerWithTextStyle:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10009E660;
  v6[3] = &unk_100627290;
  id v7 = a3;
  id v3 = v7;
  id v4 = objc_retainBlock(v6);

  return v4;
}

- (UILabel)summaryLabel
{
  summaryLabel = self->_summaryLabel;
  if (!summaryLabel)
  {
    id v4 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    v5 = self->_summaryLabel;
    self->_summaryLabel = v4;

    [(UILabel *)self->_summaryLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)self->_summaryLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)self->_summaryLabel setMaximumContentSizeCategory:UIContentSizeCategoryMedium];
    v6 = +[UIColor labelColor];
    [(UILabel *)self->_summaryLabel setTextColor:v6];

    [(UILabel *)self->_summaryLabel setShowsLargeContentViewer:1];
    [(UILabel *)self->_summaryLabel setAccessibilityIdentifier:@"note count label"];
    summaryLabel = self->_summaryLabel;
  }

  return summaryLabel;
}

- (UILabel)syncTitleLabel
{
  syncTitleLabel = self->_syncTitleLabel;
  if (!syncTitleLabel)
  {
    id v4 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    v5 = self->_syncTitleLabel;
    self->_syncTitleLabel = v4;

    [(UILabel *)self->_syncTitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)self->_syncTitleLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)self->_syncTitleLabel setMaximumContentSizeCategory:UIContentSizeCategoryMedium];
    v6 = +[UIColor labelColor];
    [(UILabel *)self->_syncTitleLabel setTextColor:v6];

    [(UILabel *)self->_syncTitleLabel setShowsLargeContentViewer:1];
    [(UILabel *)self->_syncTitleLabel setAccessibilityIdentifier:@"sync title label"];
    [(UILabel *)self->_syncTitleLabel setHidden:1];
    syncTitleLabel = self->_syncTitleLabel;
  }

  return syncTitleLabel;
}

- (UILabel)syncSubtitleLabel
{
  syncSubtitleLabel = self->_syncSubtitleLabel;
  if (!syncSubtitleLabel)
  {
    id v4 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    v5 = self->_syncSubtitleLabel;
    self->_syncSubtitleLabel = v4;

    [(UILabel *)self->_syncSubtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)self->_syncSubtitleLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)self->_syncSubtitleLabel setMaximumContentSizeCategory:UIContentSizeCategoryMedium];
    v6 = +[UIColor secondaryLabelColor];
    [(UILabel *)self->_syncSubtitleLabel setTextColor:v6];

    [(UILabel *)self->_syncSubtitleLabel setTextAlignment:1];
    [(UILabel *)self->_syncSubtitleLabel setShowsLargeContentViewer:1];
    [(UILabel *)self->_syncSubtitleLabel setAccessibilityIdentifier:@"sync subtitle label"];
    syncSubtitleLabel = self->_syncSubtitleLabel;
  }

  return syncSubtitleLabel;
}

- (UIButton)syncActionButton
{
  syncActionButton = self->_syncActionButton;
  if (!syncActionButton)
  {
    objc_initWeak(&location, self);
    v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    double v14 = sub_10009EBB4;
    objc_super v15 = &unk_100627240;
    objc_copyWeak(&v16, &location);
    id v4 = +[UIAction actionWithHandler:&v12];
    v5 = [objc_opt_class() syncActionButtonConfigurationWithTitle:&stru_10063F3D8 showingAsFooter:0 v12 v13 v14 v15];
    v6 = +[UIButton buttonWithConfiguration:v5 primaryAction:v4];
    id v7 = self->_syncActionButton;
    self->_syncActionButton = v6;

    [(UIButton *)self->_syncActionButton setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v8) = 1148846080;
    [(UIButton *)self->_syncActionButton setContentCompressionResistancePriority:0 forAxis:v8];
    uint64_t v9 = [(UIButton *)self->_syncActionButton titleLabel];
    [v9 setAdjustsFontForContentSizeCategory:1];

    v10 = [(UIButton *)self->_syncActionButton titleLabel];
    [v10 setMaximumContentSizeCategory:UIContentSizeCategoryMedium];

    [(UIButton *)self->_syncActionButton setShowsLargeContentViewer:1];
    [(UIButton *)self->_syncActionButton setHidden:1];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
    syncActionButton = self->_syncActionButton;
  }

  return syncActionButton;
}

+ (id)syncActionButtonConfigurationWithTitle:(id)a3 showingAsFooter:(BOOL)a4
{
  v6 = (id *)&UIFontTextStyleFootnote;
  if (!a4) {
    v6 = (id *)&UIFontTextStyleCaption2;
  }
  id v7 = *v6;
  id v8 = a3;
  uint64_t v9 = +[UIButtonConfiguration borderlessButtonConfiguration];
  [v9 setTitle:v8];

  v10 = [a1 buttonTitleTextAttributesTransformerWithTextStyle:v7];

  [v9 setTitleTextAttributesTransformer:v10];
  [v9 setContentInsets:NSDirectionalEdgeInsetsZero.top, NSDirectionalEdgeInsetsZero.leading, NSDirectionalEdgeInsetsZero.bottom, NSDirectionalEdgeInsetsZero.trailing];
  [v9 setButtonSize:2];

  return v9;
}

- (UIStackView)syncStackView
{
  syncStackView = self->_syncStackView;
  if (!syncStackView)
  {
    id v4 = objc_alloc((Class)UIStackView);
    v5 = [(ICToolbarSummaryView *)self syncSubtitleLabel];
    v11[0] = v5;
    v6 = [(ICToolbarSummaryView *)self syncActionButton];
    v11[1] = v6;
    id v7 = +[NSArray arrayWithObjects:v11 count:2];
    id v8 = (UIStackView *)[v4 initWithArrangedSubviews:v7];
    uint64_t v9 = self->_syncStackView;
    self->_syncStackView = v8;

    [(UIStackView *)self->_syncStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)self->_syncStackView setAxis:0];
    [(UIStackView *)self->_syncStackView setDistribution:0];
    [(UIStackView *)self->_syncStackView setAlignment:3];
    [(UIStackView *)self->_syncStackView setSpacing:0.0];
    [(UIStackView *)self->_syncStackView setHidden:1];
    syncStackView = self->_syncStackView;
  }

  return syncStackView;
}

- (UIButton)lockNowButton
{
  lockNowButton = self->_lockNowButton;
  if (!lockNowButton)
  {
    objc_initWeak(&location, self);
    v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    uint64_t v13 = sub_10009F008;
    double v14 = &unk_100627240;
    objc_copyWeak(&v15, &location);
    id v4 = +[UIAction actionWithHandler:&v11];
    v5 = [objc_opt_class() lockNowButtonConfigurationShowingAsFooter:0 v11, v12, v13, v14];
    v6 = +[UIButton buttonWithConfiguration:v5 primaryAction:v4];
    id v7 = self->_lockNowButton;
    self->_lockNowButton = v6;

    [(UIButton *)self->_lockNowButton setTranslatesAutoresizingMaskIntoConstraints:0];
    id v8 = [(UIButton *)self->_lockNowButton titleLabel];
    [v8 setAdjustsFontForContentSizeCategory:1];

    uint64_t v9 = [(UIButton *)self->_lockNowButton titleLabel];
    [v9 setMaximumContentSizeCategory:UIContentSizeCategoryMedium];

    [(UIButton *)self->_lockNowButton setShowsLargeContentViewer:1];
    [(UIButton *)self->_lockNowButton setHidden:1];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
    lockNowButton = self->_lockNowButton;
  }

  return lockNowButton;
}

+ (id)lockNowButtonConfigurationShowingAsFooter:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (id *)&UIFontTextStyleHeadline;
  if (!a3) {
    v5 = (id *)&UIFontTextStyleCaption2;
  }
  id v6 = *v5;
  id v7 = +[UIButtonConfiguration borderlessButtonConfiguration];
  id v8 = +[NSBundle mainBundle];
  uint64_t v9 = [v8 localizedStringForKey:@"Lock Now" value:&stru_10063F3D8 table:0];
  [v7 setTitle:v9];

  v10 = [a1 buttonTitleTextAttributesTransformerWithTextStyle:v6];

  [v7 setTitleTextAttributesTransformer:v10];
  v11 = +[UIImage systemImageNamed:@"lock.open.fill"];
  [v7 setImage:v11];

  uint64_t v12 = [a1 primaryLabelFontShowingAsFooter:v3];
  uint64_t v13 = +[UIImageSymbolConfiguration configurationWithFont:v12 scale:1];
  [v7 setPreferredSymbolConfigurationForImage:v13];

  [v7 setImagePlacement:8];
  [v7 setImagePadding:2.0];
  [v7 setContentInsets:NSDirectionalEdgeInsetsZero.top, NSDirectionalEdgeInsetsZero.leading, NSDirectionalEdgeInsetsZero.bottom, NSDirectionalEdgeInsetsZero.trailing];
  [v7 setButtonSize:2];
  double v14 = +[NSBundle mainBundle];
  id v15 = [v14 localizedStringForKey:@"Double tap to lock all notes." value:&stru_10063F3D8 table:0];
  [v7 setAccessibilityHint:v15];

  return v7;
}

- (UIStackView)rootStackView
{
  rootStackView = self->_rootStackView;
  if (!rootStackView)
  {
    id v4 = objc_alloc((Class)UIStackView);
    v5 = [(ICToolbarSummaryView *)self summaryLabel];
    v13[0] = v5;
    id v6 = [(ICToolbarSummaryView *)self syncTitleLabel];
    v13[1] = v6;
    id v7 = [(ICToolbarSummaryView *)self syncStackView];
    v13[2] = v7;
    id v8 = [(ICToolbarSummaryView *)self lockNowButton];
    v13[3] = v8;
    uint64_t v9 = +[NSArray arrayWithObjects:v13 count:4];
    v10 = (UIStackView *)[v4 initWithArrangedSubviews:v9];
    v11 = self->_rootStackView;
    self->_rootStackView = v10;

    [(UIStackView *)self->_rootStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)self->_rootStackView setAxis:1];
    [(UIStackView *)self->_rootStackView setDistribution:0];
    [(UIStackView *)self->_rootStackView setAlignment:3];
    [(UIStackView *)self->_rootStackView setSpacing:0.0];
    rootStackView = self->_rootStackView;
  }

  return rootStackView;
}

- (UIActivityIndicatorView)activityIndicatorView
{
  activityIndicatorView = self->_activityIndicatorView;
  if (!activityIndicatorView)
  {
    if (+[UIDevice ic_isVision]) {
      uint64_t v4 = 3;
    }
    else {
      uint64_t v4 = 100;
    }
    v5 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:v4];
    id v6 = self->_activityIndicatorView;
    self->_activityIndicatorView = v5;

    [(UIActivityIndicatorView *)self->_activityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(ICToolbarSummaryView *)self addSubview:self->_activityIndicatorView];
    activityIndicatorView = self->_activityIndicatorView;
  }

  return activityIndicatorView;
}

- (NSArray)summaryComponents
{
  if ([(ICToolbarSummaryView *)self countsHidden])
  {
    id v3 = &__NSArray0__struct;
  }
  else
  {
    uint64_t v4 = +[NSMutableArray array];
    if ([(ICToolbarSummaryView *)self totalInvitationsCount])
    {
      v5 = +[NSBundle mainBundle];
      id v6 = [v5 localizedStringForKey:@"%lu Invitations" value:&stru_10063F3D8 table:0];
      id v7 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, [(ICToolbarSummaryView *)self totalInvitationsCount]);

      [v4 addObject:v7];
    }
    id v8 = +[NSBundle mainBundle];
    uint64_t v9 = [v8 localizedStringForKey:@"%lu Notes" value:&stru_10063F3D8 table:0];
    v10 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, [(ICToolbarSummaryView *)self totalNoteCount]);

    [v4 addObject:v10];
    if ([(ICToolbarSummaryView *)self totalFolderCount])
    {
      v11 = +[NSBundle mainBundle];
      uint64_t v12 = [v11 localizedStringForKey:@"%lu Folders" value:&stru_10063F3D8 table:0];
      uint64_t v13 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v12, [(ICToolbarSummaryView *)self totalFolderCount]);

      [v4 addObject:v13];
    }
    id v3 = [v4 copy];
  }

  return (NSArray *)v3;
}

- (NSString)summary
{
  v2 = [(ICToolbarSummaryView *)self summaryComponents];
  id v3 = [v2 componentsJoinedByString:@" · "];

  return (NSString *)v3;
}

- (NSString)summaryAccessibilityLabel
{
  v2 = [(ICToolbarSummaryView *)self summaryComponents];
  id v3 = [v2 componentsJoinedByString:@", "];

  return (NSString *)v3;
}

- (void)update
{
  [(ICToolbarSummaryView *)self setNeedsUpdateConstraints];
  [(ICToolbarSummaryView *)self updateConstraintsIfNeeded];
  id v3 = [objc_opt_class() primaryLabelFontShowingAsFooter:[self isShowingAsFooter]];
  uint64_t v4 = [(ICToolbarSummaryView *)self summaryLabel];
  [v4 setFont:v3];

  if ([(ICToolbarSummaryView *)self isLockNowHidden]
    && ([(ICToolbarSummaryView *)self syncMessage],
        v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    unsigned int v6 = [(ICToolbarSummaryView *)self isShowingAsFooter];
    id v7 = [(ICToolbarSummaryView *)self rootStackView];
    id v8 = [(ICToolbarSummaryView *)self summaryLabel];
    if (v6)
    {
      [v7 setCustomSpacing:v8 afterView:10.0];

      uint64_t v9 = [(ICToolbarSummaryView *)self summary];
      v10 = [(ICToolbarSummaryView *)self summaryLabel];
      [v10 setText:v9];

      v11 = [(ICToolbarSummaryView *)self summaryAccessibilityLabel];
      uint64_t v12 = [(ICToolbarSummaryView *)self summaryLabel];
      [v12 setAccessibilityLabel:v11];

      uint64_t v13 = [(ICToolbarSummaryView *)self summaryLabel];
      [v13 setHidden:0];

      double v14 = [objc_opt_class() secondaryLabelFontShowingAsFooter:[self isShowingAsFooter]];
      id v15 = [(ICToolbarSummaryView *)self syncTitleLabel];
      [v15 setFont:v14];

      id v16 = [(ICToolbarSummaryView *)self syncMessage];
      v17 = [v16 title];
      v18 = [(ICToolbarSummaryView *)self syncTitleLabel];
      [v18 setText:v17];

      v19 = [(ICToolbarSummaryView *)self syncTitleLabel];
      v20 = v19;
      uint64_t v21 = 0;
    }
    else
    {
      [v7 setCustomSpacing:v8 afterView:0.0];

      v34 = [(ICToolbarSummaryView *)self syncMessage];
      v35 = [v34 title];
      v36 = [(ICToolbarSummaryView *)self summaryLabel];
      [v36 setText:v35];

      v37 = [(ICToolbarSummaryView *)self syncMessage];
      v38 = [v37 title];
      objc_super v39 = [(ICToolbarSummaryView *)self summaryLabel];
      [v39 setAccessibilityLabel:v38];

      v19 = [(ICToolbarSummaryView *)self syncTitleLabel];
      v20 = v19;
      uint64_t v21 = 1;
    }
    [v19 setHidden:v21];

    v40 = [objc_opt_class() secondaryLabelFontShowingAsFooter:[self isShowingAsFooter]];
    v41 = [(ICToolbarSummaryView *)self syncSubtitleLabel];
    [v41 setFont:v40];

    v42 = [(ICToolbarSummaryView *)self syncMessage];
    v43 = [v42 subTitle];
    v44 = [(ICToolbarSummaryView *)self syncSubtitleLabel];
    [v44 setText:v43];

    v45 = [(ICToolbarSummaryView *)self syncMessage];
    v46 = [v45 subTitle];
    v47 = [(ICToolbarSummaryView *)self syncSubtitleLabel];
    [v47 setAccessibilityLabel:v46];

    v48 = [(ICToolbarSummaryView *)self syncMessage];
    v49 = [v48 actions];
    v33 = [v49 firstObject];

    v50 = [(ICToolbarSummaryView *)self syncSubtitleLabel];
    v51 = v50;
    if (v33)
    {
      [v50 setNumberOfLines:1];

      v52 = objc_opt_class();
      v53 = [v33 title];
      v54 = [v52 syncActionButtonConfigurationWithTitle:v53 showingAsFooter:[self isShowingAsFooter]];
      v55 = [(ICToolbarSummaryView *)self syncActionButton];
      [v55 setConfiguration:v54];

      v56 = [(ICToolbarSummaryView *)self syncActionButton];
      [v56 setHidden:0];

      v57 = [(ICToolbarSummaryView *)self syncSubtitleLabel];
      [v57 intrinsicContentSize];
      double v59 = v58;
      v60 = [(ICToolbarSummaryView *)self syncActionButton];
      [v60 intrinsicContentSize];
      double v62 = v59 + v61;

      [(ICToolbarSummaryView *)self availableWidth];
      if (v62 <= v63 + -42.0)
      {
        v67 = [(ICToolbarSummaryView *)self syncMessage];
        v68 = [v67 subTitle];
        v69 = +[NSString stringWithFormat:@"%@ · ", v68];
        v70 = [(ICToolbarSummaryView *)self syncSubtitleLabel];
        [v70 setText:v69];

        v71 = [(ICToolbarSummaryView *)self syncMessage];
        v72 = [v71 subTitle];
        v73 = [(ICToolbarSummaryView *)self syncSubtitleLabel];
        [v73 setAccessibilityLabel:v72];

        v64 = [(ICToolbarSummaryView *)self syncStackView];
        v65 = v64;
        uint64_t v66 = 0;
      }
      else
      {
        v64 = [(ICToolbarSummaryView *)self syncStackView];
        v65 = v64;
        uint64_t v66 = 1;
      }
      [v64 setAxis:v66];
    }
    else
    {
      [v50 setNumberOfLines:2];

      v65 = [(ICToolbarSummaryView *)self syncActionButton];
      [v65 setHidden:1];
    }

    v74 = [(ICToolbarSummaryView *)self syncStackView];
    [v74 setHidden:0];

    v75 = [(ICToolbarSummaryView *)self lockNowButton];
    [v75 setHidden:1];
  }
  else
  {
    uint64_t v22 = [(ICToolbarSummaryView *)self rootStackView];
    v23 = [(ICToolbarSummaryView *)self summaryLabel];
    [v22 setCustomSpacing:v23 afterView:0.0];

    v24 = [(ICToolbarSummaryView *)self summary];
    v25 = [(ICToolbarSummaryView *)self summaryLabel];
    [v25 setText:v24];

    v26 = [(ICToolbarSummaryView *)self summaryAccessibilityLabel];
    v27 = [(ICToolbarSummaryView *)self summaryLabel];
    [v27 setAccessibilityLabel:v26];

    v28 = [(ICToolbarSummaryView *)self syncTitleLabel];
    [v28 setHidden:1];

    v29 = [(ICToolbarSummaryView *)self syncStackView];
    [v29 setHidden:1];

    v30 = [objc_opt_class() lockNowButtonConfigurationShowingAsFooter:[self isShowingAsFooter]];
    v31 = [(ICToolbarSummaryView *)self lockNowButton];
    [v31 setConfiguration:v30];

    BOOL v32 = [(ICToolbarSummaryView *)self isLockNowHidden];
    v33 = [(ICToolbarSummaryView *)self lockNowButton];
    [v33 setHidden:v32];
  }

  if ([(ICToolbarSummaryView *)self isSyncActivityVisible])
  {
    v76 = [[ICICloudProgressIndicatorTracker alloc] initWithDelegate:self];
    [(ICToolbarSummaryView *)self setProgressIndicatorTracker:v76];

    [(ICToolbarSummaryView *)self updateSyncActivityIndicator];
  }
  else
  {
    v77 = [(ICToolbarSummaryView *)self progressIndicatorTracker];
    [v77 invalidate];

    [(ICToolbarSummaryView *)self setProgressIndicatorTracker:0];
  }
}

- (void)updateSyncActivityIndicator
{
  if ([(ICToolbarSummaryView *)self isSyncActivityVisible]
    && ([(ICToolbarSummaryView *)self progressIndicatorTracker],
        id v3 = objc_claimAutoreleasedReturnValue(),
        unsigned int v4 = [v3 progressIndicatorShouldAnimate],
        v3,
        v4))
  {
    id v5 = [(ICToolbarSummaryView *)self activityIndicatorView];
    [v5 startAnimating];
  }
  else
  {
    id v5 = [(ICToolbarSummaryView *)self activityIndicatorView];
    [v5 stopAnimating];
  }
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = sub_1000A00E4;
  uint64_t v12 = sub_1000A00F4;
  id v13 = +[NSMutableArray array];
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  char v7 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000A00FC;
  v5[3] = &unk_100627CB0;
  v5[4] = &v8;
  v5[5] = v6;
  [(ICToolbarSummaryView *)self enumerateAccessibleSubviewsWithBlock:v5];
  id v3 = [(id)v9[5] componentsJoinedByString:@", "];
  _Block_object_dispose(v6, 8);
  _Block_object_dispose(&v8, 8);

  return v3;
}

- (id)accessibilityHint
{
  v2 = [(ICToolbarSummaryView *)self buttonElement];
  id v3 = [v2 accessibilityHint];

  return v3;
}

- (CGPoint)accessibilityActivationPoint
{
  id v3 = [(ICToolbarSummaryView *)self buttonElement];
  unsigned int v4 = v3;
  if (v3)
  {
    [v3 accessibilityActivationPoint];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)ICToolbarSummaryView;
    [(ICToolbarSummaryView *)&v11 accessibilityActivationPoint];
  }
  double v7 = v5;
  double v8 = v6;

  double v9 = v7;
  double v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (id)buttonElement
{
  uint64_t v7 = 0;
  double v8 = &v7;
  uint64_t v9 = 0x3032000000;
  double v10 = sub_1000A00E4;
  objc_super v11 = sub_1000A00F4;
  id v12 = 0;
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  char v6 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000A0354;
  v4[3] = &unk_100627CB0;
  v4[4] = &v7;
  v4[5] = v5;
  [(ICToolbarSummaryView *)self enumerateAccessibleSubviewsWithBlock:v4];
  id v2 = (id)v8[5];
  _Block_object_dispose(v5, 8);
  _Block_object_dispose(&v7, 8);

  return v2;
}

- (void)enumerateAccessibleSubviewsWithBlock:(id)a3
{
  unsigned int v4 = (uint64_t (**)(id, void))a3;
  [(ICToolbarSummaryView *)self _accessibleSubviews];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v11 != v8) {
        objc_enumerationMutation(v5);
      }
      if (v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9))) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (ICToolbarSummaryViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICToolbarSummaryViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)totalFolderCount
{
  return self->_totalFolderCount;
}

- (void)setTotalFolderCount:(unint64_t)a3
{
  self->_totalFolderCount = a3;
}

- (unint64_t)totalNoteCount
{
  return self->_totalNoteCount;
}

- (void)setTotalNoteCount:(unint64_t)a3
{
  self->_totalNoteCount = a3;
}

- (unint64_t)totalInvitationsCount
{
  return self->_totalInvitationsCount;
}

- (void)setTotalInvitationsCount:(unint64_t)a3
{
  self->_totalInvitationsCount = a3;
}

- (BOOL)countsHidden
{
  return self->_countsHidden;
}

- (void)setCountsHidden:(BOOL)a3
{
  self->_countsHidden = a3;
}

- (BOOL)isLockNowHidden
{
  return self->_lockNowHidden;
}

- (void)setLockNowHidden:(BOOL)a3
{
  self->_lockNowHidden = a3;
}

- (BOOL)isSyncActivityVisible
{
  return self->_syncActivityVisible;
}

- (void)setSyncActivityVisible:(BOOL)a3
{
  self->_syncActivityVisible = a3;
}

- (ICQInAppMessage)syncMessage
{
  return self->_syncMessage;
}

- (void)setSyncMessage:(id)a3
{
}

- (BOOL)isShowingAsFooter
{
  return self->_showingAsFooter;
}

- (void)setShowingAsFooter:(BOOL)a3
{
  self->_showingAsFooter = a3;
}

- (double)availableWidth
{
  return self->_availableWidth;
}

- (void)setAvailableWidth:(double)a3
{
  self->_availableWidth = a3;
}

- (ICProgressIndicatorTracker)progressIndicatorTracker
{
  return self->_progressIndicatorTracker;
}

- (void)setProgressIndicatorTracker:(id)a3
{
}

- (NSLayoutConstraint)topConstraint
{
  return self->_topConstraint;
}

- (void)setTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)bottomConstraint
{
  return self->_bottomConstraint;
}

- (void)setBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)widthConstraint
{
  return self->_widthConstraint;
}

- (void)setWidthConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widthConstraint, 0);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_progressIndicatorTracker, 0);
  objc_storeStrong((id *)&self->_syncMessage, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_rootStackView, 0);
  objc_storeStrong((id *)&self->_lockNowButton, 0);
  objc_storeStrong((id *)&self->_syncStackView, 0);
  objc_storeStrong((id *)&self->_syncActionButton, 0);
  objc_storeStrong((id *)&self->_syncSubtitleLabel, 0);
  objc_storeStrong((id *)&self->_syncTitleLabel, 0);

  objc_storeStrong((id *)&self->_summaryLabel, 0);
}

@end