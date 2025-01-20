@interface TransitDirectionsStepView
+ (double)estimatedHeightForListItem:(id)a3;
+ (id)reuseIdentifierForItem:(id)a3;
- (BOOL)_isProminentItemType:(int64_t)a3;
- (BOOL)isHighlighted;
- (BOOL)useNavigationMetrics;
- (HairlineView)separatorView;
- (NSString)description;
- (NSString)reuseIdentifier;
- (TransitDirectionsCell)cell;
- (TransitDirectionsListItem)transitListItem;
- (TransitDirectionsStepView)initWithFrame:(CGRect)a3;
- (TransitDirectionsStepViewSelectionDelegate)selectionDelegate;
- (UILayoutGuide)bottomSpacingLayoutGuide;
- (UILayoutGuide)contentLayoutGuide;
- (UILayoutGuide)leadingAccessoryLayoutGuide;
- (UIView)trailingView;
- (double)_alphaForCurrentNavigationState;
- (double)_trailingGuideToContentViewDistance;
- (double)bottomSpacerHeight;
- (double)leadingInstructionMargin;
- (id)_initialConstraints;
- (id)viewForHitTesting;
- (int64_t)navigationState;
- (unint64_t)displayOptions;
- (void)_createSubviews;
- (void)_invalidateConstraints;
- (void)_setTrailingGuideToContentViewDistance:(double)a3;
- (void)_stepViewHighlighted:(id)a3;
- (void)_stepViewSelected:(id)a3;
- (void)_stepViewUnhighlighted:(id)a3;
- (void)_updateBottomSpacer;
- (void)_updateConstraints;
- (void)_updateVisibilityForItemFromDisplayOptions;
- (void)configureWithItem:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setCell:(id)a3;
- (void)setDisplayOptions:(unint64_t)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setLeadingInstructionMargin:(double)a3;
- (void)setNavigationState:(int64_t)a3;
- (void)setSelectionDelegate:(id)a3;
- (void)setTrailingView:(id)a3;
- (void)setUseNavigationMetrics:(BOOL)a3;
@end

@implementation TransitDirectionsStepView

- (NSString)reuseIdentifier
{
  v3 = objc_opt_class();
  v4 = [(TransitDirectionsStepView *)self transitListItem];
  v5 = [v3 reuseIdentifierForItem:v4];

  return (NSString *)v5;
}

+ (id)reuseIdentifierForItem:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    unint64_t v5 = (unint64_t)[v3 type];
    if (v5 >= 0x12)
    {
      v6 = +[NSString stringWithFormat:@"Unknown (%ld)", v5];
    }
    else
    {
      v6 = off_1012FE6F0[v5];
    }
    v7 = +[NSString stringWithFormat:@"%@-%p", v6, v4];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)description
{
  v7.receiver = self;
  v7.super_class = (Class)TransitDirectionsStepView;
  id v3 = [(TransitDirectionsStepView *)&v7 description];
  v4 = [(TransitDirectionsStepView *)self transitListItem];
  unint64_t v5 = +[NSString stringWithFormat:@"%@; item: %@", v3, v4];

  return (NSString *)v5;
}

- (TransitDirectionsStepView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)TransitDirectionsStepView;
  id v3 = -[TransitDirectionsStepView initWithFrame:](&v10, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (objc_class *)objc_opt_class();
    unint64_t v5 = NSStringFromClass(v4);
    [(TransitDirectionsStepView *)v3 setAccessibilityIdentifier:v5];

    v3->_trailingGuideToContentViewDistance = 16.0;
    [(TransitDirectionsStepView *)v3 _createSubviews];
    v6 = [(TransitDirectionsStepView *)v3 _initialConstraints];
    +[NSLayoutConstraint activateConstraints:v6];

    [(TransitDirectionsStepView *)v3 _updateConstraints];
    objc_super v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v3 selector:"_contentSizeCategoryDidChange" name:UIContentSizeCategoryDidChangeNotification object:0];

    v8 = v3;
  }

  return v3;
}

- (void)dealloc
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)TransitDirectionsStepView;
  [(TransitDirectionsStepView *)&v4 dealloc];
}

- (void)prepareForReuse
{
  self->_displayOptions = 0;
}

- (void)configureWithItem:(id)a3
{
  id v5 = a3;
  transitListItem = self->_transitListItem;
  unint64_t v10 = (unint64_t)v5;
  id v7 = transitListItem;
  v8 = (void *)v10;
  if (v10 | (unint64_t)v7)
  {
    unsigned __int8 v9 = [(id)v10 isEqual:v7];

    v8 = (void *)v10;
    if ((v9 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_transitListItem, a3);
      [(TransitDirectionsStepView *)self _updateBottomSpacer];
      [(TransitDirectionsStepView *)self _updateVisibilityForItemFromDisplayOptions];
      v8 = (void *)v10;
    }
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)TransitDirectionsStepView;
  [(TransitDirectionsStepView *)&v3 layoutSubviews];
  [(TransitDirectionsStepView *)self bounds];
  -[UIControl setFrame:](self->_backgroundControlForHitTesting, "setFrame:");
}

- (void)_createSubviews
{
  objc_super v3 = +[UIColor clearColor];
  [(TransitDirectionsStepView *)self setBackgroundColor:v3];

  [(TransitDirectionsStepView *)self setOpaque:0];
  id v4 = objc_alloc((Class)UIControl);
  [(TransitDirectionsStepView *)self bounds];
  id v5 = [v4 initWithFrame:];
  backgroundControlForHitTesting = self->_backgroundControlForHitTesting;
  self->_backgroundControlForHitTesting = v5;

  [(UIControl *)self->_backgroundControlForHitTesting setAutoresizingMask:18];
  [(TransitDirectionsStepView *)self addSubview:self->_backgroundControlForHitTesting];
  [(UIControl *)self->_backgroundControlForHitTesting addTarget:self action:"_stepViewHighlighted:" forControlEvents:1];
  [(UIControl *)self->_backgroundControlForHitTesting addTarget:self action:"_stepViewUnhighlighted:" forControlEvents:32];
  [(UIControl *)self->_backgroundControlForHitTesting addTarget:self action:"_stepViewUnhighlighted:" forControlEvents:256];
  [(UIControl *)self->_backgroundControlForHitTesting addTarget:self action:"_stepViewSelected:" forControlEvents:64];
  id v7 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  leadingAccessoryLayoutGuide = self->_leadingAccessoryLayoutGuide;
  self->_leadingAccessoryLayoutGuide = v7;

  [(TransitDirectionsStepView *)self addLayoutGuide:self->_leadingAccessoryLayoutGuide];
  unsigned __int8 v9 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  contentLayoutGuide = self->_contentLayoutGuide;
  self->_contentLayoutGuide = v9;

  [(TransitDirectionsStepView *)self addLayoutGuide:self->_contentLayoutGuide];
  v11 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  trailingContentLayoutGuide = self->_trailingContentLayoutGuide;
  self->_trailingContentLayoutGuide = v11;

  [(TransitDirectionsStepView *)self addLayoutGuide:self->_trailingContentLayoutGuide];
  v13 = (UILayoutGuide *)objc_alloc_init((Class)UILayoutGuide);
  bottomSpacingLayoutGuide = self->_bottomSpacingLayoutGuide;
  self->_bottomSpacingLayoutGuide = v13;

  v15 = self->_bottomSpacingLayoutGuide;

  [(TransitDirectionsStepView *)self addLayoutGuide:v15];
}

- (id)viewForHitTesting
{
  return self->_backgroundControlForHitTesting;
}

- (void)setLeadingInstructionMargin:(double)a3
{
  double v3 = floor(a3);
  if (v3 != self->_leadingInstructionMargin)
  {
    self->_leadingInstructionMargin = v3;
    -[NSLayoutConstraint setConstant:](self->_leadingAccessoryLayoutGuideWidthConstraint, "setConstant:");
  }
}

- (void)setUseNavigationMetrics:(BOOL)a3
{
  if (self->_useNavigationMetrics != a3) {
    self->_useNavigationMetrics = a3;
  }
}

- (void)setNavigationState:(int64_t)a3
{
  if (self->_navigationState != a3)
  {
    self->_navigationState = a3;
    [(TransitDirectionsStepView *)self _alphaForCurrentNavigationState];
    -[TransitDirectionsStepView _updateNavigationStateAlpha:](self, "_updateNavigationStateAlpha:");
  }
}

- (double)_alphaForCurrentNavigationState
{
  double v2 = 1.0;
  if ((self->_displayOptions & 2) == 0)
  {
    int64_t v3 = [(TransitDirectionsStepView *)self navigationState];
    if ((unint64_t)(v3 - 1) <= 4) {
      return dbl_100F72710[v3 - 1];
    }
  }
  return v2;
}

- (void)setDisplayOptions:(unint64_t)a3
{
  unint64_t displayOptions = self->_displayOptions;
  if (displayOptions != a3)
  {
    self->_unint64_t displayOptions = a3;
    char v5 = displayOptions ^ a3;
    if (((displayOptions ^ a3) & 2) != 0)
    {
      [(TransitDirectionsStepView *)self _alphaForCurrentNavigationState];
      -[TransitDirectionsStepView _updateNavigationStateAlpha:](self, "_updateNavigationStateAlpha:");
    }
    if ((v5 & 4) != 0)
    {
      [(TransitDirectionsStepView *)self _updateVisibilityForItemFromDisplayOptions];
    }
  }
}

- (void)_updateVisibilityForItemFromDisplayOptions
{
  BOOL v3 = (self->_displayOptions & 4) != 0
    && [(TransitDirectionsListItem *)self->_transitListItem shouldHideInExpandedDisplayStyle];
  [(TransitDirectionsStepView *)self setHidden:v3];

  [(TransitDirectionsStepView *)self _updateBottomSpacer];
}

- (HairlineView)separatorView
{
  separatorView = self->_separatorView;
  if (!separatorView)
  {
    id v4 = [(TransitDirectionsStepView *)self _maps_addHairlineAtBottomWithMargin:0.0];
    char v5 = self->_separatorView;
    self->_separatorView = v4;

    separatorView = self->_separatorView;
  }

  return separatorView;
}

- (id)_initialConstraints
{
  v73 = +[NSMutableArray array];
  BOOL v3 = [(UILayoutGuide *)self->_leadingAccessoryLayoutGuide widthAnchor];
  id v4 = [v3 constraintEqualToConstant:0.0];
  [v4 _maps_withIdentifier:@"leadingAccessoryLayoutGuideWidthConstraint"];
  char v5 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  leadingAccessoryLayoutGuideWidthConstraint = self->_leadingAccessoryLayoutGuideWidthConstraint;
  self->_leadingAccessoryLayoutGuideWidthConstraint = v5;

  id v7 = [(UILayoutGuide *)self->_bottomSpacingLayoutGuide heightAnchor];
  [(TransitDirectionsStepView *)self bottomSpacerHeight];
  v8 = [v7 constraintEqualToConstant:];
  [v8 _maps_withIdentifier:@"bottomSpacingLayoutGuideHeight"];
  unsigned __int8 v9 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  bottomSpacingLayoutGuideHeightConstraint = self->_bottomSpacingLayoutGuideHeightConstraint;
  self->_bottomSpacingLayoutGuideHeightConstraint = v9;

  v11 = [(UILayoutGuide *)self->_trailingContentLayoutGuide widthAnchor];
  v12 = [v11 constraintEqualToConstant:0.0];
  [v12 _maps_withIdentifier:@"trailingContentLayoutGuideWidth"];
  v13 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  trailingContentLayoutGuideWidthConstraint = self->_trailingContentLayoutGuideWidthConstraint;
  self->_trailingContentLayoutGuideWidthConstraint = v13;

  v15 = [(TransitDirectionsStepView *)self trailingAnchor];
  v16 = [(UILayoutGuide *)self->_trailingContentLayoutGuide trailingAnchor];
  [(TransitDirectionsStepView *)self _trailingGuideToContentViewDistance];
  v17 = [v15 constraintEqualToAnchor:v16];
  [v17 _maps_withIdentifier:@"contentViewTrailingToTrailingContentTrailing"];
  v18 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  trailingGuideToContentViewConstraint = self->_trailingGuideToContentViewConstraint;
  self->_trailingGuideToContentViewConstraint = v18;

  v72 = [(UILayoutGuide *)self->_leadingAccessoryLayoutGuide leadingAnchor];
  v71 = [(TransitDirectionsStepView *)self leadingAnchor];
  v70 = [v72 constraintEqualToAnchor:v71];
  v69 = [v70 _maps_withIdentifier:@"leadingAccessoryLayoutLeadingToContentViewLeading"];
  v74[0] = v69;
  v68 = [(UILayoutGuide *)self->_leadingAccessoryLayoutGuide topAnchor];
  v67 = [(TransitDirectionsStepView *)self topAnchor];
  v66 = [v68 constraintEqualToAnchor:v67];
  v65 = [v66 _maps_withIdentifier:@"leadingAccessoryLayoutTopToContentViewTop"];
  v74[1] = v65;
  v64 = [(UILayoutGuide *)self->_leadingAccessoryLayoutGuide bottomAnchor];
  v63 = [(TransitDirectionsStepView *)self bottomAnchor];
  v62 = [v64 constraintEqualToAnchor:v63];
  v61 = [v62 _maps_withIdentifier:@"leadingAccessoryLayoutBottomToContentViewBottom"];
  v20 = self->_leadingAccessoryLayoutGuideWidthConstraint;
  v74[2] = v61;
  v74[3] = v20;
  v60 = [(UILayoutGuide *)self->_contentLayoutGuide leadingAnchor];
  v59 = [(UILayoutGuide *)self->_leadingAccessoryLayoutGuide trailingAnchor];
  v58 = [v60 constraintEqualToAnchor:v59];
  v57 = [v58 _maps_withIdentifier:@"contentLayoutLeadingToLeadingLayoutLeading"];
  v74[4] = v57;
  v56 = [(UILayoutGuide *)self->_contentLayoutGuide topAnchor];
  v55 = [(TransitDirectionsStepView *)self topAnchor];
  v54 = [v56 constraintEqualToAnchor:v55];
  v53 = [v54 _maps_withIdentifier:@"contentLayoutTopToContentViewTop"];
  v74[5] = v53;
  v52 = [(UILayoutGuide *)self->_contentLayoutGuide bottomAnchor];
  v51 = [(UILayoutGuide *)self->_bottomSpacingLayoutGuide topAnchor];
  v49 = [v52 constraintEqualToAnchor:v51];
  v48 = [v49 _maps_withIdentifier:@"contentLayoutBottomToBottomSpacingTop"];
  v74[6] = v48;
  v47 = [(UILayoutGuide *)self->_trailingContentLayoutGuide leadingAnchor];
  v46 = [(UILayoutGuide *)self->_contentLayoutGuide trailingAnchor];
  v45 = [v47 constraintEqualToAnchor:v46];
  v44 = [v45 _maps_withIdentifier:@"trailingContentLeadingToContentLeading"];
  v74[7] = v44;
  v43 = [(UILayoutGuide *)self->_trailingContentLayoutGuide topAnchor];
  v42 = [(TransitDirectionsStepView *)self topAnchor];
  v41 = [v43 constraintEqualToAnchor:v42];
  v40 = [v41 _maps_withIdentifier:@"trailingContentTopToContentViewTop"];
  v74[8] = v40;
  v39 = [(UILayoutGuide *)self->_trailingContentLayoutGuide bottomAnchor];
  v38 = [(TransitDirectionsStepView *)self bottomAnchor];
  v37 = [v39 constraintEqualToAnchor:v38];
  v36 = [v37 _maps_withIdentifier:@"trailingContentBottomToContentViewBottom"];
  v21 = self->_trailingGuideToContentViewConstraint;
  v74[9] = v36;
  v74[10] = v21;
  v74[11] = self->_trailingContentLayoutGuideWidthConstraint;
  v50 = [(UILayoutGuide *)self->_bottomSpacingLayoutGuide leadingAnchor];
  v35 = [(TransitDirectionsStepView *)self leadingAnchor];
  v34 = [v50 constraintEqualToAnchor:v35];
  v22 = [v34 _maps_withIdentifier:@"bottomSpacingLeadingToContentViewLeading"];
  v74[12] = v22;
  v23 = [(UILayoutGuide *)self->_bottomSpacingLayoutGuide trailingAnchor];
  v24 = [(TransitDirectionsStepView *)self trailingAnchor];
  v25 = [v23 constraintEqualToAnchor:v24];
  v26 = [v25 _maps_withIdentifier:@"bottomSpacingTrailingToContentViewTrailing"];
  v74[13] = v26;
  v27 = [(UILayoutGuide *)self->_bottomSpacingLayoutGuide bottomAnchor];
  v28 = [(TransitDirectionsStepView *)self bottomAnchor];
  v29 = [v27 constraintEqualToAnchor:v28];
  v30 = [v29 _maps_withIdentifier:@"bottomSpacingBottomToContentViewBottom"];
  v31 = self->_bottomSpacingLayoutGuideHeightConstraint;
  v74[14] = v30;
  v74[15] = v31;
  v32 = +[NSArray arrayWithObjects:v74 count:16];
  [v73 addObjectsFromArray:v32];

  return v73;
}

- (void)_updateConstraints
{
  [(GCDTimer *)self->_constraintInvalidationTimer invalidate];
  constraintInvalidationTimer = self->_constraintInvalidationTimer;
  self->_constraintInvalidationTimer = 0;

  [(TransitDirectionsStepView *)self _updateBottomSpacer];

  [(TransitDirectionsStepView *)self invalidateIntrinsicContentSize];
}

- (void)_updateBottomSpacer
{
  [(TransitDirectionsStepView *)self bottomSpacerHeight];
  UIRoundToViewScale();
  double v4 = v3;
  [(NSLayoutConstraint *)self->_bottomSpacingLayoutGuideHeightConstraint constant];
  if (vabdd_f64(v4, v5) > 2.22044605e-16)
  {
    bottomSpacingLayoutGuideHeightConstraint = self->_bottomSpacingLayoutGuideHeightConstraint;
    [(NSLayoutConstraint *)bottomSpacingLayoutGuideHeightConstraint setConstant:v4];
  }
}

- (void)_invalidateConstraints
{
  if (!self->_constraintInvalidationTimer)
  {
    objc_initWeak(&location, self);
    id v3 = &_dispatch_main_q;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100884888;
    v6[3] = &unk_1012E7638;
    objc_copyWeak(&v7, &location);
    double v4 = +[GCDTimer scheduledTimerWithTimeInterval:&_dispatch_main_q queue:v6 block:0.0];
    constraintInvalidationTimer = self->_constraintInvalidationTimer;
    self->_constraintInvalidationTimer = v4;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (void)setTrailingView:(id)a3
{
  double v5 = (UIView *)a3;
  p_trailingView = &self->_trailingView;
  trailingView = self->_trailingView;
  if (trailingView != v5)
  {
    [(UIView *)trailingView removeFromSuperview];
    objc_storeStrong((id *)&self->_trailingView, a3);
    [(UIView *)*p_trailingView _mapkit_fittingSize];
    -[NSLayoutConstraint setConstant:](self->_trailingContentLayoutGuideWidthConstraint, "setConstant:");
    if (*p_trailingView)
    {
      -[TransitDirectionsStepView addSubview:](self, "addSubview:");
      v28 = [(UIView *)*p_trailingView topAnchor];
      v27 = [(UILayoutGuide *)self->_trailingContentLayoutGuide topAnchor];
      v26 = [v28 constraintGreaterThanOrEqualToAnchor:v27];
      v25 = [v26 _maps_withIdentifier:@"trailingViewTopToTrailingLayoutTop"];
      v29[0] = v25;
      v24 = [(UIView *)*p_trailingView bottomAnchor];
      v23 = [(UILayoutGuide *)self->_trailingContentLayoutGuide bottomAnchor];
      v22 = [v24 constraintLessThanOrEqualToAnchor:v23];
      v21 = [v22 _maps_withIdentifier:@"trailingViewBottomToTrailingLayoutBottom"];
      v29[1] = v21;
      v20 = [(UIView *)*p_trailingView leadingAnchor];
      v19 = [(UILayoutGuide *)self->_trailingContentLayoutGuide leadingAnchor];
      v18 = [v20 constraintEqualToAnchor:v19];
      v17 = [v18 _maps_withIdentifier:@"trailingViewLeadingToTrailingLayoutLeading"];
      v29[2] = v17;
      v8 = [(UIView *)*p_trailingView trailingAnchor];
      unsigned __int8 v9 = [(UILayoutGuide *)self->_trailingContentLayoutGuide trailingAnchor];
      unint64_t v10 = [v8 constraintEqualToAnchor:v9];
      v11 = [v10 _maps_withIdentifier:@"trailingViewTrailingToTrailingLayoutTrailing"];
      v29[3] = v11;
      v12 = [(UIView *)*p_trailingView centerYAnchor];
      v13 = [(UILayoutGuide *)self->_trailingContentLayoutGuide centerYAnchor];
      v14 = [v12 constraintEqualToAnchor:v13];
      v15 = [v14 _maps_withIdentifier:@"trailingViewCenterYToTrailingLayoutCenterY"];
      v29[4] = v15;
      v16 = +[NSArray arrayWithObjects:v29 count:5];
      +[NSLayoutConstraint activateConstraints:v16];
    }
  }
}

- (void)_setTrailingGuideToContentViewDistance:(double)a3
{
  self->_trailingGuideToContentViewDistance = a3;
  -[NSLayoutConstraint setConstant:](self->_trailingGuideToContentViewConstraint, "setConstant:");
}

+ (double)estimatedHeightForListItem:(id)a3
{
  id v3 = a3;
  double v4 = 20.0;
  if ([v3 type] == (id)5) {
    goto LABEL_4;
  }
  double v5 = 13.0;
  if ([v3 type] != (id)6)
  {
    double v4 = 70.0;
LABEL_4:
    v6 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    [v6 _mapkit_scaledValueForValue:v4];
    double v5 = v7;
  }
  return v5;
}

- (void)_stepViewHighlighted:(id)a3
{
  id v4 = [(TransitDirectionsStepView *)self selectionDelegate];
  [v4 stepViewHighlighted:self];
}

- (void)_stepViewUnhighlighted:(id)a3
{
  id v4 = [(TransitDirectionsStepView *)self selectionDelegate];
  [v4 stepViewUnhighlighted:self];
}

- (void)_stepViewSelected:(id)a3
{
  id v4 = [(TransitDirectionsStepView *)self selectionDelegate];
  [v4 stepViewSelected:self];
}

- (BOOL)_isProminentItemType:(int64_t)a3
{
  return ((unint64_t)a3 < 0x12) & (0x230Fu >> a3);
}

- (double)bottomSpacerHeight
{
  id v3 = [(TransitDirectionsStepView *)self transitListItem];
  id v4 = [v3 nextItem];

  if (([(TransitDirectionsStepView *)self displayOptions] & 4) != 0 && v4)
  {
    do
    {
      if (![v4 shouldHideInExpandedDisplayStyle]) {
        break;
      }
      uint64_t v5 = [v4 nextItem];

      id v4 = (void *)v5;
    }
    while (v5);
  }
  id v6 = [v4 type];
  if ([(TransitDirectionsStepView *)self _isProminentItemType:v6])
  {
    double v7 = [(TransitDirectionsStepView *)self traitCollection];
    BOOL v8 = [v7 userInterfaceIdiom] == (id)5;
    double v9 = 16.0;
LABEL_7:
    double v10 = 10.0;
LABEL_8:
    if (v8) {
      double v11 = v10;
    }
    else {
      double v11 = v9;
    }
LABEL_13:
  }
  else
  {
    double v11 = 0.0;
    switch((unint64_t)v6)
    {
      case 0xAuLL:
      case 0xFuLL:
        double v7 = [(TransitDirectionsStepView *)self traitCollection];
        [v7 userInterfaceIdiom];
        goto LABEL_13;
      case 0xDuLL:
        double v7 = [(TransitDirectionsStepView *)self traitCollection];
        BOOL v8 = [v7 userInterfaceIdiom] == (id)5;
        double v9 = 14.0;
        goto LABEL_7;
      case 0x10uLL:
        double v7 = [(TransitDirectionsStepView *)self traitCollection];
        BOOL v8 = [v7 userInterfaceIdiom] == (id)5;
        double v9 = 7.0;
        double v10 = 5.0;
        goto LABEL_8;
      default:
        break;
    }
  }

  return v11;
}

- (TransitDirectionsListItem)transitListItem
{
  return self->_transitListItem;
}

- (double)leadingInstructionMargin
{
  return self->_leadingInstructionMargin;
}

- (UIView)trailingView
{
  return self->_trailingView;
}

- (BOOL)useNavigationMetrics
{
  return self->_useNavigationMetrics;
}

- (int64_t)navigationState
{
  return self->_navigationState;
}

- (unint64_t)displayOptions
{
  return self->_displayOptions;
}

- (double)_trailingGuideToContentViewDistance
{
  return self->_trailingGuideToContentViewDistance;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (void)setHighlighted:(BOOL)a3
{
  self->_highlighted = a3;
}

- (TransitDirectionsCell)cell
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cell);

  return (TransitDirectionsCell *)WeakRetained;
}

- (void)setCell:(id)a3
{
}

- (TransitDirectionsStepViewSelectionDelegate)selectionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionDelegate);

  return (TransitDirectionsStepViewSelectionDelegate *)WeakRetained;
}

- (void)setSelectionDelegate:(id)a3
{
}

- (UILayoutGuide)leadingAccessoryLayoutGuide
{
  return self->_leadingAccessoryLayoutGuide;
}

- (UILayoutGuide)contentLayoutGuide
{
  return self->_contentLayoutGuide;
}

- (UILayoutGuide)bottomSpacingLayoutGuide
{
  return self->_bottomSpacingLayoutGuide;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomSpacingLayoutGuide, 0);
  objc_storeStrong((id *)&self->_contentLayoutGuide, 0);
  objc_storeStrong((id *)&self->_leadingAccessoryLayoutGuide, 0);
  objc_destroyWeak((id *)&self->_selectionDelegate);
  objc_destroyWeak((id *)&self->_cell);
  objc_storeStrong((id *)&self->_trailingView, 0);
  objc_storeStrong((id *)&self->_backgroundControlForHitTesting, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_constraintInvalidationTimer, 0);
  objc_storeStrong((id *)&self->_trailingGuideToContentViewConstraint, 0);
  objc_storeStrong((id *)&self->_trailingContentLayoutGuideWidthConstraint, 0);
  objc_storeStrong((id *)&self->_trailingContentLayoutGuide, 0);
  objc_storeStrong((id *)&self->_bottomSpacingLayoutGuideHeightConstraint, 0);
  objc_storeStrong((id *)&self->_leadingAccessoryLayoutGuideWidthConstraint, 0);

  objc_storeStrong((id *)&self->_transitListItem, 0);
}

@end