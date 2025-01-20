@interface SectionHeaderView
+ (BOOL)shouldStackWithTitle:(id)a3 actionTitle:(id)a4 availableWidth:(double)a5 traitCollection:(id)a6;
+ (NSString)reuseIdentifier;
+ (double)_titleBottomMargin;
+ (double)_topMarginWhenFirstNonEmptySection:(BOOL)a3 traitCollection:(id)a4;
+ (double)estimatedHeight;
+ (double)heightWhenFirstNonEmptySection:(BOOL)a3 title:(id)a4 actionTitle:(id)a5 availableWidth:(double)a6 traitCollection:(id)a7;
+ (id)_actionFontWithTraitCollection:(id)a3;
+ (id)_effectiveTraitCollectionWithTraitCollection:(id)a3;
+ (id)_maximumContentSizeCategory;
+ (id)_titleFontWithTraitCollection:(id)a3;
- (BOOL)_defaultShouldShowBottomHairline;
- (BOOL)firstNonEmptySection;
- (BOOL)showsBottomHairline;
- (BOOL)updateConstraintsWithAvailableWidthWithoutMargins:(double)a3;
- (HairlineView)bottomHairlineView;
- (MKVibrantLabel)label;
- (MapsThemeButton)actionButton;
- (NSString)actionTitle;
- (NSString)title;
- (SectionHeaderView)init;
- (SectionHeaderView)initWithTitle:(id)a3 isFirstNonEmptySection:(BOOL)a4;
- (UIFocusGuide)focusGuide;
- (double)firstNonEmptySectionTopMargin;
- (id)actionHandler;
- (void)_contentSizeChanged:(id)a3;
- (void)_didTapActionButton;
- (void)_setConstraintsByStacking:(BOOL)a3;
- (void)_updateFonts;
- (void)_updateTopConstraint;
- (void)clearContents;
- (void)layoutSubviews;
- (void)setAccessibilityIdentifiersWithBaseString:(id)a3;
- (void)setActionButton:(id)a3;
- (void)setActionHandler:(id)a3;
- (void)setActionTitle:(id)a3;
- (void)setActionTitle:(id)a3 completionHandler:(id)a4;
- (void)setBottomHairlineView:(id)a3;
- (void)setFirstNonEmptySection:(BOOL)a3;
- (void)setFirstNonEmptySection:(BOOL)a3 topMargin:(double)a4;
- (void)setFirstNonEmptySectionTopMargin:(double)a3;
- (void)setFocusGuide:(id)a3;
- (void)setLabel:(id)a3;
- (void)setShowsBottomHairline:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SectionHeaderView

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SectionHeaderView;
  [(MapsThemeView *)&v13 traitCollectionDidChange:v4];
  v5 = [(SectionHeaderView *)self traitCollection];
  v6 = [v5 preferredContentSizeCategory];
  v7 = [v4 preferredContentSizeCategory];
  if (sub_1000E93B0(v6, v7))
  {

LABEL_4:
    [(SectionHeaderView *)self _updateFonts];
    [(SectionHeaderView *)self _updateTopConstraint];
    goto LABEL_5;
  }
  v8 = [(SectionHeaderView *)self traitCollection];
  [v8 displayScale];
  double v10 = v9;
  [v4 displayScale];
  double v12 = v11;

  if (v10 != v12) {
    goto LABEL_4;
  }
LABEL_5:
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)SectionHeaderView;
  [(SectionHeaderView *)&v6 layoutSubviews];
  v3 = [(SectionHeaderView *)self layoutMarginsGuide];
  [v3 layoutFrame];
  unsigned int v4 = [(SectionHeaderView *)self updateConstraintsWithAvailableWidthWithoutMargins:CGRectGetWidth(v7)];

  if (v4)
  {
    v5.receiver = self;
    v5.super_class = (Class)SectionHeaderView;
    [(SectionHeaderView *)&v5 layoutSubviews];
  }
}

- (BOOL)updateConstraintsWithAvailableWidthWithoutMargins:(double)a3
{
  if (a3 > 0.0)
  {
    objc_super v5 = [(SectionHeaderView *)self title];
    if ([v5 length])
    {
      objc_super v6 = [(SectionHeaderView *)self actionTitle];
      id v7 = [v6 length];

      if (v7)
      {
        [(MKVibrantLabel *)self->_label intrinsicContentSize];
        double v9 = v8 + 8.0;
        [(MapsThemeButton *)self->_actionButton intrinsicContentSize];
        BOOL v11 = v9 + v10 > a3;
        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  BOOL v11 = 0;
LABEL_7:
  BOOL stacking = self->_stacking;
  if (stacking != v11) {
    [(SectionHeaderView *)self _setConstraintsByStacking:v11];
  }
  return stacking != v11;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)actionTitle
{
  return self->_actionTitle;
}

- (void)_setConstraintsByStacking:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_constraints) {
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
  }
  self->_BOOL stacking = v3;
  [(SectionHeaderView *)self topAnchor];
  objc_super v5 = v79 = v3;
  objc_super v6 = [(MKVibrantLabel *)self->_label topAnchor];
  LODWORD(v7) = 1132068864;
  double v8 = [v5 constraintEqualToAnchor:v6 constant:0.0 priority:v7];
  topConstraint = self->_topConstraint;
  self->_topConstraint = v8;

  [(SectionHeaderView *)self _updateTopConstraint];
  v83[0] = self->_topConstraint;
  v75 = [(MKVibrantLabel *)self->_label leadingAnchor];
  v77 = [(SectionHeaderView *)self layoutMarginsGuide];
  v73 = [v77 leadingAnchor];
  v71 = [v75 constraintEqualToAnchor:v73];
  v83[1] = v71;
  v67 = [self->_bottomHairlineView leadingAnchor];
  v69 = [(SectionHeaderView *)self layoutMarginsGuide];
  v65 = [v69 leadingAnchor];
  v63 = [v67 constraintEqualToAnchor:v65];
  v83[2] = v63;
  v61 = [self->_bottomHairlineView trailingAnchor];
  v59 = [(SectionHeaderView *)self trailingAnchor];
  v56 = [v61 constraintEqualToAnchor:v59];
  v83[3] = v56;
  v54 = [self->_bottomHairlineView bottomAnchor];
  v53 = [(SectionHeaderView *)self bottomAnchor];
  v52 = [v54 constraintEqualToAnchor:v53];
  v83[4] = v52;
  v51 = [(UIFocusGuide *)self->_focusGuide topAnchor];
  v50 = [(MapsThemeButton *)self->_actionButton topAnchor];
  v49 = [v51 constraintEqualToAnchor:v50 constant:-1.0];
  v83[5] = v49;
  v48 = [(UIFocusGuide *)self->_focusGuide bottomAnchor];
  double v10 = [(MapsThemeButton *)self->_actionButton bottomAnchor];
  BOOL v11 = [v48 constraintEqualToAnchor:v10 constant:1.0];
  v83[6] = v11;
  double v12 = [(UIFocusGuide *)self->_focusGuide leadingAnchor];
  objc_super v13 = [(SectionHeaderView *)self leadingAnchor];
  v14 = [v12 constraintEqualToAnchor:v13];
  v83[7] = v14;
  v15 = [(UIFocusGuide *)self->_focusGuide trailingAnchor];
  v16 = [(SectionHeaderView *)self trailingAnchor];
  v17 = [v15 constraintEqualToAnchor:v16];
  v83[8] = v17;
  v18 = +[NSArray arrayWithObjects:v83 count:9];
  v19 = +[NSMutableArray arrayWithArray:v18];
  constraints = self->_constraints;
  self->_constraints = v19;

  if (v79)
  {
    v21 = objc_opt_class();
    v22 = [(SectionHeaderView *)self traitCollection];
    uint64_t v57 = [v21 _effectiveTraitCollectionWithTraitCollection:v22];

    uint64_t v23 = [(id)objc_opt_class() _actionFontWithTraitCollection:v57];
    v24 = [(SectionHeaderView *)self traitCollection];
    [v24 displayScale];
    v80 = (void *)v23;
    +[UILabel _maps_maximumHeightWithFont:numberOfLines:displayScale:](UILabel, "_maps_maximumHeightWithFont:numberOfLines:displayScale:", v23, 1);
    double v26 = v25 + 8.0;

    v55 = self->_constraints;
    v27 = [(MKVibrantLabel *)self->_label bottomAnchor];
    uint64_t v28 = [(SectionHeaderView *)self bottomAnchor];
    [(id)objc_opt_class() _titleBottomMargin];
    v76 = (void *)v28;
    v78 = v27;
    v74 = [v27 constraintEqualToAnchor:v28 constant:-v29 - v26];
    v82[0] = v74;
    v30 = [(MKVibrantLabel *)self->_label trailingAnchor];
    v70 = [(SectionHeaderView *)self layoutMarginsGuide];
    [v70 trailingAnchor];
    v68 = v72 = v30;
    v66 = [v30 constraintLessThanOrEqualToAnchor:];
    v82[1] = v66;
    v31 = [(MapsThemeButton *)self->_actionButton lastBaselineAnchor];
    v62 = [(MKVibrantLabel *)self->_label lastBaselineAnchor];
    v64 = v31;
    v60 = [v31 constraintEqualToAnchor:v62 constant:v26];
    v82[2] = v60;
    v32 = [(MapsThemeButton *)self->_actionButton leadingAnchor];
    v33 = [(SectionHeaderView *)self layoutMarginsGuide];
    v34 = [v33 leadingAnchor];
    v35 = [v32 constraintEqualToAnchor:v34];
    v82[3] = v35;
    v36 = [(MapsThemeButton *)self->_actionButton trailingAnchor];
    v37 = [(SectionHeaderView *)self layoutMarginsGuide];
    v38 = [v37 trailingAnchor];
    v39 = [v36 constraintLessThanOrEqualToAnchor:v38];
    v82[4] = v39;
    v40 = +[NSArray arrayWithObjects:v82 count:5];
    [(NSMutableArray *)v55 addObjectsFromArray:v40];

    v41 = (void *)v57;
  }
  else
  {
    v58 = self->_constraints;
    v41 = [(MKVibrantLabel *)self->_label bottomAnchor];
    uint64_t v42 = [(SectionHeaderView *)self bottomAnchor];
    [(id)objc_opt_class() _titleBottomMargin];
    v80 = (void *)v42;
    v78 = [v41 constraintEqualToAnchor:v42 constant:-v43];
    v81[0] = v78;
    v44 = [(MapsThemeButton *)self->_actionButton leadingAnchor];
    v74 = [(MKVibrantLabel *)self->_label trailingAnchor];
    v76 = v44;
    v72 = [v44 constraintGreaterThanOrEqualToAnchor:v74 constant:8.0];
    v81[1] = v72;
    v45 = [(MapsThemeButton *)self->_actionButton trailingAnchor];
    v68 = [(SectionHeaderView *)self layoutMarginsGuide];
    [v68 trailingAnchor];
    v66 = v70 = v45;
    v64 = [v45 constraintEqualToAnchor:];
    v81[2] = v64;
    v46 = [(MapsThemeButton *)self->_actionButton lastBaselineAnchor];
    v60 = [(MKVibrantLabel *)self->_label lastBaselineAnchor];
    v62 = v46;
    v32 = [v46 constraintEqualToAnchor:v60];
    v81[3] = v32;
    v33 = [(MapsThemeButton *)self->_actionButton bottomAnchor];
    v34 = [(MKVibrantLabel *)self->_label bottomAnchor];
    LODWORD(v47) = 1132068864;
    v35 = [v33 constraintEqualToAnchor:v34 constant:0.0 priority:v47];
    v81[4] = v35;
    v36 = +[NSArray arrayWithObjects:v81 count:5];
    [(NSMutableArray *)v58 addObjectsFromArray:v36];
  }

  +[NSLayoutConstraint activateConstraints:self->_constraints];
}

- (void)_updateTopConstraint
{
  BOOL v3 = objc_opt_class();
  unsigned int v4 = [(SectionHeaderView *)self traitCollection];
  id v8 = [v3 _effectiveTraitCollectionWithTraitCollection:v4];

  [objc_opt_class() _topMarginWhenFirstNonEmptySection:[self firstNonEmptySection] traitCollection:v8];
  double v6 = v5;
  if (self->_firstNonEmptySection)
  {
    [(SectionHeaderView *)self firstNonEmptySectionTopMargin];
    double v6 = v6 + v7;
  }
  [(NSLayoutConstraint *)self->_topConstraint setConstant:-v6];
}

- (BOOL)firstNonEmptySection
{
  return self->_firstNonEmptySection;
}

+ (double)_topMarginWhenFirstNonEmptySection:(BOOL)a3 traitCollection:(id)a4
{
  if (a3)
  {
    unsigned int v4 = +[UIScreen mainScreen];
    if (sub_1000BBB44(v4) == 1) {
      double v5 = 3.0;
    }
    else {
      double v5 = 1.0;
    }
  }
  else
  {
    double v6 = +[UIDevice currentDevice];
    id v7 = [v6 userInterfaceIdiom];

    if (v7 == (id)5) {
      return 24.0;
    }
    else {
      return 26.0;
    }
  }
  return v5;
}

+ (double)_titleBottomMargin
{
  v2 = +[UIDevice currentDevice];
  id v3 = [v2 userInterfaceIdiom];

  double result = 10.0;
  if (v3 == (id)5) {
    return 4.0;
  }
  return result;
}

- (void)setTitle:(id)a3
{
  unsigned int v4 = (NSString *)a3;
  double v5 = v4;
  BOOL v11 = v4;
  if (self->_title != v4 || (v6 = [(NSString *)v4 isEqualToString:v4], double v5 = v11, (v6 & 1) == 0))
  {
    id v7 = (NSString *)[(NSString *)v5 copy];
    title = self->_title;
    self->_title = v7;

    double v9 = self->_title;
    double v10 = [(SectionHeaderView *)self label];
    [v10 setText:v9];

    double v5 = v11;
  }
}

- (void)setShowsBottomHairline:(BOOL)a3
{
  if (self->_showsBottomHairline != a3)
  {
    self->_showsBottomHairline = a3;
    BOOL v3 = !a3;
    id v4 = [(SectionHeaderView *)self bottomHairlineView];
    [v4 setHidden:v3];
  }
}

- (HairlineView)bottomHairlineView
{
  return self->_bottomHairlineView;
}

- (void)setFirstNonEmptySection:(BOOL)a3
{
  if (self->_firstNonEmptySection != a3)
  {
    self->_firstNonEmptySection = a3;
    [(SectionHeaderView *)self _updateTopConstraint];
  }
}

- (void)setActionHandler:(id)a3
{
}

- (void)_updateFonts
{
  BOOL v3 = objc_opt_class();
  id v4 = [(SectionHeaderView *)self traitCollection];
  id v10 = [v3 _effectiveTraitCollectionWithTraitCollection:v4];

  double v5 = [(id)objc_opt_class() _titleFontWithTraitCollection:v10];
  unsigned __int8 v6 = [(SectionHeaderView *)self label];
  [v6 setFont:v5];

  id v7 = [(id)objc_opt_class() _actionFontWithTraitCollection:v10];
  id v8 = [(SectionHeaderView *)self actionButton];
  double v9 = [v8 titleLabel];
  [v9 setFont:v7];
}

- (MKVibrantLabel)label
{
  return self->_label;
}

+ (id)_effectiveTraitCollectionWithTraitCollection:(id)a3
{
  id v4 = a3;
  double v5 = [a1 _maximumContentSizeCategory];
  unsigned __int8 v6 = [v4 _maps_traitCollectionByClampingContentSizeCategoryWithMinimumContentSizeCategory:0 maximumContentSizeCategory:v5];

  return v6;
}

+ (id)_maximumContentSizeCategory
{
  return UIContentSizeCategoryAccessibilityLarge;
}

- (SectionHeaderView)init
{
  v20.receiver = self;
  v20.super_class = (Class)SectionHeaderView;
  v2 = [(SectionHeaderView *)&v20 init];
  if (v2)
  {
    BOOL v3 = +[UIColor clearColor];
    [(SectionHeaderView *)v2 setBackgroundColor:v3];

    [(SectionHeaderView *)v2 _mapsui_resetLayoutMarginsWithPreservesSuperview:1];
    id v4 = (MKVibrantLabel *)[objc_alloc((Class)MKVibrantLabel) initWithStyle:1];
    label = v2->_label;
    v2->_label = v4;

    unsigned __int8 v6 = +[UIColor clearColor];
    [(MKVibrantLabel *)v2->_label setBackgroundColor:v6];

    [(MKVibrantLabel *)v2->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SectionHeaderView *)v2 addSubview:v2->_label];
    uint64_t v7 = +[MapsThemeButton buttonWithType:0];
    actionButton = v2->_actionButton;
    v2->_actionButton = (MapsThemeButton *)v7;

    LODWORD(v9) = 1144750080;
    [(MapsThemeButton *)v2->_actionButton setContentHuggingPriority:0 forAxis:v9];
    [(MapsThemeButton *)v2->_actionButton setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v10) = 1144750080;
    [(MapsThemeButton *)v2->_actionButton setContentCompressionResistancePriority:0 forAxis:v10];
    [(MapsThemeButton *)v2->_actionButton setTitleColorProvider:&stru_1012F0CD8];
    -[MapsThemeButton _setTouchInsets:](v2->_actionButton, "_setTouchInsets:", -7.0, -7.0, -7.0, -7.0);
    BOOL v11 = [(SectionHeaderView *)v2 actionButton];
    [v11 addTarget:v2 action:"_didTapActionButton" forControlEvents:0x2000];

    [(SectionHeaderView *)v2 addSubview:v2->_actionButton];
    [(MapsThemeButton *)v2->_actionButton setHidden:1];
    double v12 = objc_alloc_init(HairlineView);
    bottomHairlineView = v2->_bottomHairlineView;
    v2->_bottomHairlineView = v12;

    [v2->_bottomHairlineView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SectionHeaderView *)v2 addSubview:v2->_bottomHairlineView];
    unsigned int v14 = [(SectionHeaderView *)v2 _defaultShouldShowBottomHairline];
    v2->_showsBottomHairline = v14;
    [v2->_bottomHairlineView setHidden:v14 ^ 1];
    v15 = (UIFocusGuide *)objc_alloc_init((Class)UIFocusGuide);
    focusGuide = v2->_focusGuide;
    v2->_focusGuide = v15;

    v21 = v2->_actionButton;
    v17 = +[NSArray arrayWithObjects:&v21 count:1];
    [(UIFocusGuide *)v2->_focusGuide setPreferredFocusEnvironments:v17];

    [(SectionHeaderView *)v2 addLayoutGuide:v2->_focusGuide];
    [(SectionHeaderView *)v2 _updateFonts];
    [(SectionHeaderView *)v2 _setConstraintsByStacking:0];
    v18 = +[NSNotificationCenter defaultCenter];
    [v18 addObserver:v2 selector:"_contentSizeChanged:" name:UIContentSizeCategoryDidChangeNotification object:0];
  }
  return v2;
}

- (void)setActionTitle:(id)a3
{
  id v4 = (NSString *)a3;
  double v5 = v4;
  double v12 = v4;
  if (self->_actionTitle != v4
    || (v6 = [(NSString *)v4 isEqualToString:v4], double v5 = v12, (v6 & 1) == 0))
  {
    uint64_t v7 = (NSString *)[(NSString *)v5 copy];
    actionTitle = self->_actionTitle;
    self->_actionTitle = v7;

    double v9 = [(SectionHeaderView *)self actionButton];
    [v9 setTitle:self->_actionTitle forState:0];

    BOOL v10 = self->_actionTitle == 0;
    BOOL v11 = [(SectionHeaderView *)self actionButton];
    [v11 setHidden:v10];

    double v5 = v12;
  }
}

- (MapsThemeButton)actionButton
{
  return self->_actionButton;
}

- (BOOL)_defaultShouldShowBottomHairline
{
  return sub_1000BBB44(self) != 5;
}

+ (id)_titleFontWithTraitCollection:(id)a3
{
  id v3 = a3;
  if ([v3 userInterfaceIdiom] == (id)5) {
    +[UIFont system17Tall];
  }
  else {
  id v4 = +[UIFont system15SemiboldCompatibleWithTraitCollection:v3];
  }

  return v4;
}

+ (id)_actionFontWithTraitCollection:(id)a3
{
  id v3 = a3;
  if ([v3 userInterfaceIdiom] == (id)5) {
    +[UIFont system17Tall];
  }
  else {
  id v4 = +[UIFont system15CompatibleWithTraitCollection:v3];
  }

  return v4;
}

- (double)firstNonEmptySectionTopMargin
{
  return self->_firstNonEmptySectionTopMargin;
}

+ (double)estimatedHeight
{
  return 54.0;
}

+ (NSString)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (double)heightWhenFirstNonEmptySection:(BOOL)a3 title:(id)a4 actionTitle:(id)a5 availableWidth:(double)a6 traitCollection:(id)a7
{
  BOOL v10 = a3;
  id v12 = a5;
  id v13 = a4;
  unsigned int v14 = [a1 _effectiveTraitCollectionWithTraitCollection:a7];
  v15 = [a1 _titleFontWithTraitCollection:v14];
  [v14 _maps_displayScaleOrMainScreenScale];
  +[UILabel _maps_maximumHeightWithFont:numberOfLines:displayScale:](UILabel, "_maps_maximumHeightWithFont:numberOfLines:displayScale:", v15, 1);
  double v17 = v16;
  unsigned int v18 = [a1 shouldStackWithTitle:v13 actionTitle:v12 availableWidth:v14 traitCollection:a6];

  if (v18) {
    double v19 = v17 * 2.0 + 8.0;
  }
  else {
    double v19 = v17;
  }
  [a1 _topMarginWhenFirstNonEmptySection:v10 traitCollection:v14];
  double v21 = v19 + v20;
  [(id)objc_opt_class() _titleBottomMargin];
  double v23 = v21 + v22;

  return v23;
}

+ (BOOL)shouldStackWithTitle:(id)a3 actionTitle:(id)a4 availableWidth:(double)a5 traitCollection:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (a5 > 0.0 && [v10 length] && objc_msgSend(v11, "length"))
  {
    uint64_t v13 = [a1 _effectiveTraitCollectionWithTraitCollection:v12];

    unsigned int v14 = [a1 _titleFontWithTraitCollection:v13];
    v15 = [a1 _actionFontWithTraitCollection:v13];
    NSAttributedStringKey v26 = NSFontAttributeName;
    v27 = v14;
    double v16 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    [v10 sizeWithAttributes:v16];
    double v18 = v17;

    NSAttributedStringKey v24 = NSFontAttributeName;
    double v25 = v15;
    double v19 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    [v11 sizeWithAttributes:v19];
    double v21 = v20;

    BOOL v22 = a5 + -32.0 < v18 + 8.0 + v21;
    id v12 = (id)v13;
  }
  else
  {
    BOOL v22 = 0;
  }

  return v22;
}

- (void)clearContents
{
  [(SectionHeaderView *)self setTitle:0];
  [(SectionHeaderView *)self setActionTitle:0];
  [(SectionHeaderView *)self setActionHandler:0];
  [(SectionHeaderView *)self setFirstNonEmptySection:0];
  [(SectionHeaderView *)self setFirstNonEmptySectionTopMargin:0.0];
  BOOL v3 = [(SectionHeaderView *)self _defaultShouldShowBottomHairline];

  [(SectionHeaderView *)self setShowsBottomHairline:v3];
}

- (void)setAccessibilityIdentifiersWithBaseString:(id)a3
{
  id v4 = a3;
  double v5 = [v4 stringByAppendingString:@"Section"];
  [(SectionHeaderView *)self setAccessibilityIdentifier:v5];

  unsigned __int8 v6 = [v4 stringByAppendingString:@"Action"];
  uint64_t v7 = [(SectionHeaderView *)self actionButton];
  [v7 setAccessibilityIdentifier:v6];

  id v9 = [v4 stringByAppendingString:@"Title"];

  id v8 = [(SectionHeaderView *)self label];
  [v8 setAccessibilityIdentifier:v9];
}

- (void)_contentSizeChanged:(id)a3
{
  [(SectionHeaderView *)self invalidateIntrinsicContentSize];

  [(SectionHeaderView *)self setNeedsLayout];
}

- (void)setFirstNonEmptySection:(BOOL)a3 topMargin:(double)a4
{
  if (self->_firstNonEmptySection != a3) {
    self->_firstNonEmptySection = a3;
  }
  if (self->_firstNonEmptySectionTopMargin != a4)
  {
    self->_firstNonEmptySectionTopMargin = a4;
    [(SectionHeaderView *)self _updateTopConstraint];
  }
}

- (void)_didTapActionButton
{
  BOOL v3 = [(SectionHeaderView *)self actionHandler];

  if (v3)
  {
    id v4 = [(SectionHeaderView *)self actionHandler];
    v4[2]();
  }
}

- (SectionHeaderView)initWithTitle:(id)a3 isFirstNonEmptySection:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(SectionHeaderView *)self init];
  id v8 = v7;
  if (v7)
  {
    [(SectionHeaderView *)v7 setTitle:v6];
    [(SectionHeaderView *)v8 setFirstNonEmptySection:v4];
  }

  return v8;
}

- (void)setActionTitle:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  [(SectionHeaderView *)self setActionTitle:a3];
  [(SectionHeaderView *)self setActionHandler:v6];
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (BOOL)showsBottomHairline
{
  return self->_showsBottomHairline;
}

- (void)setLabel:(id)a3
{
}

- (void)setActionButton:(id)a3
{
}

- (void)setBottomHairlineView:(id)a3
{
}

- (UIFocusGuide)focusGuide
{
  return self->_focusGuide;
}

- (void)setFocusGuide:(id)a3
{
}

- (void)setFirstNonEmptySectionTopMargin:(double)a3
{
  self->_firstNonEmptySectionTopMargin = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusGuide, 0);
  objc_storeStrong((id *)&self->_bottomHairlineView, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_actionTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_constraints, 0);

  objc_storeStrong((id *)&self->_topConstraint, 0);
}

@end