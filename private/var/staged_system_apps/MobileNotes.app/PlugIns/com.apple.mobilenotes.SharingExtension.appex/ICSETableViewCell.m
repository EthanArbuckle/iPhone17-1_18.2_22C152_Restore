@interface ICSETableViewCell
+ (id)newHeaderCell;
- (BOOL)isAccessibilityElement;
- (BOOL)isCollapsed;
- (BOOL)isCollapsible;
- (ICSETableViewCellDelegate)delegate;
- (ICSETableViewItem)tableViewItem;
- (NSLayoutConstraint)iconViewBaselineConstraint;
- (NSLayoutConstraint)iconViewCenterYConstraintForAXLargerTextSizes;
- (NSLayoutConstraint)iconViewContainerMinHeightConstraint;
- (NSLayoutConstraint)iconViewLeadingConstraint;
- (NSLayoutConstraint)secondaryLabelBaselineConstraint;
- (NSLayoutConstraint)secondaryLabelBelowTitleLabelConstraintForAXLargerTextSizes;
- (NSLayoutConstraint)secondaryLabelCenterVerticallyConstraint;
- (NSLayoutConstraint)secondaryLabelLeadingConstraint;
- (NSLayoutConstraint)secondaryLabelLeadingConstraintForAXLargerTextSizes;
- (NSLayoutConstraint)titleLabelBaselineConstraint;
- (NSLayoutConstraint)titleLabelCenterConstraint;
- (NSLayoutConstraint)titleLabelTopConstraintForAXLargerTextSizes;
- (NSLayoutConstraint)titleLeadingMargin;
- (NSMutableDictionary)storedConstraintPriorities;
- (UIImageView)accessibilityExpansionAccessoryImageView;
- (UIImageView)accountAccessoryImageView;
- (UIImageView)defaultExpansionAccessoryImageView;
- (UIImageView)disclosureAccessoryImageView;
- (UIImageView)expansionAccessoryImageView;
- (UIImageView)iconView;
- (UILabel)secondaryLabel;
- (UILabel)titleLabel;
- (UIView)expandCollapseHitView;
- (id)accessibilityCustomActions;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityUserInputLabels;
- (id)alternateConstraintsForAXLargerTextSizes;
- (id)defaultConstraintsForRegularTextSizes;
- (unint64_t)accessibilityTraits;
- (void)awakeFromNib;
- (void)disableConstraintsBySettingPriority:(id)a3;
- (void)enableConstraintsBySettingPriority:(id)a3;
- (void)expandCollapseTapped:(id)a3;
- (void)prepareForReuse;
- (void)setAccessibilityExpansionAccessoryImageView:(id)a3;
- (void)setAccountAccessoryImageView:(id)a3;
- (void)setCollapsed:(BOOL)a3;
- (void)setCollapsed:(BOOL)a3 animated:(BOOL)a4;
- (void)setCollapsible:(BOOL)a3;
- (void)setDefaultExpansionAccessoryImageView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisclosureAccessoryImageView:(id)a3;
- (void)setExpandCollapseHitView:(id)a3;
- (void)setExpansionAccessoryImageView:(id)a3;
- (void)setIconView:(id)a3;
- (void)setIconViewBaselineConstraint:(id)a3;
- (void)setIconViewCenterYConstraintForAXLargerTextSizes:(id)a3;
- (void)setIconViewContainerMinHeightConstraint:(id)a3;
- (void)setIconViewLeadingConstraint:(id)a3;
- (void)setSecondaryLabel:(id)a3;
- (void)setSecondaryLabelBaselineConstraint:(id)a3;
- (void)setSecondaryLabelBelowTitleLabelConstraintForAXLargerTextSizes:(id)a3;
- (void)setSecondaryLabelCenterVerticallyConstraint:(id)a3;
- (void)setSecondaryLabelLeadingConstraint:(id)a3;
- (void)setSecondaryLabelLeadingConstraintForAXLargerTextSizes:(id)a3;
- (void)setStoredConstraintPriorities:(id)a3;
- (void)setTableViewItem:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleLabelBaselineConstraint:(id)a3;
- (void)setTitleLabelCenterConstraint:(id)a3;
- (void)setTitleLabelTopConstraintForAXLargerTextSizes:(id)a3;
- (void)setTitleLeadingMargin:(id)a3;
- (void)setUpForHeaderItem:(id)a3;
- (void)setUpForTableViewItem:(id)a3;
- (void)updateAccessoryView;
- (void)updateCollapsedDisclosure;
- (void)updateConstraints;
@end

@implementation ICSETableViewCell

- (void)awakeFromNib
{
  v51.receiver = self;
  v51.super_class = (Class)ICSETableViewCell;
  [(ICSETableViewCell *)&v51 awakeFromNib];
  if (qword_1001056E8 != -1) {
    dispatch_once(&qword_1001056E8, &stru_1000EDF70);
  }
  double v3 = *(double *)&qword_1001056E0;
  [(ICSETableViewCell *)self layoutMargins];
  double v5 = v3 - v4;
  [(ICSETableViewCell *)self layoutMargins];
  double v7 = v5 - v6;
  v8 = [(ICSETableViewCell *)self iconViewContainerMinHeightConstraint];
  [v8 setConstant:v7];

  if (+[UIDevice ic_isVision])
  {
    v9 = +[UIColor clearColor];
    [(ICSETableViewCell *)self setBackgroundColor:v9];

    [(ICSETableViewCell *)self setBackgroundView:0];
  }
  else
  {
    v10 = +[UIColor tableCellGroupedBackgroundColor];
    [(ICSETableViewCell *)self setBackgroundColor:v10];

    [(ICSETableViewCell *)self setBackgroundView:0];
    id v11 = objc_alloc_init((Class)UIView);
    v12 = +[UIColor ICTintedSelectionColor];
    [v11 setBackgroundColor:v12];

    [(ICSETableViewCell *)self setSelectedBackgroundView:v11];
  }
  v13 = +[NSMutableDictionary dictionary];
  [(ICSETableViewCell *)self setStoredConstraintPriorities:v13];

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v14 = [(ICSETableViewCell *)self defaultConstraintsForRegularTextSizes];
  id v15 = [v14 countByEnumeratingWithState:&v47 objects:v52 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v48;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v48 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        [v19 priority];
        v20 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
        v21 = [(ICSETableViewCell *)self storedConstraintPriorities];
        v22 = [v19 identifier];
        [v21 setObject:v20 forKeyedSubscript:v22];
      }
      id v16 = [v14 countByEnumeratingWithState:&v47 objects:v52 count:16];
    }
    while (v16);
  }

  id v23 = objc_alloc_init((Class)UIView);
  [(ICSETableViewCell *)self setExpandCollapseHitView:v23];

  v24 = [(ICSETableViewCell *)self expandCollapseHitView];
  [(ICSETableViewCell *)self addSubview:v24];

  v25 = [(ICSETableViewCell *)self expandCollapseHitView];
  [v25 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v25 setUserInteractionEnabled:0];
  id v26 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"expandCollapseTapped:"];
  [v25 addGestureRecognizer:v26];

  v27 = +[NSMutableArray array];
  v28 = [v25 leadingAnchor];
  v29 = [(ICSETableViewCell *)self secondaryLabel];
  v30 = [v29 trailingAnchor];
  v31 = [v28 constraintEqualToAnchor:v30];
  [v27 addObject:v31];

  v32 = [v25 trailingAnchor];
  v33 = [(ICSETableViewCell *)self trailingAnchor];
  v34 = [v32 constraintEqualToAnchor:v33];
  [v27 addObject:v34];

  v35 = [v25 topAnchor];
  v36 = [(ICSETableViewCell *)self topAnchor];
  v37 = [v35 constraintEqualToAnchor:v36];
  [v27 addObject:v37];

  v38 = [v25 bottomAnchor];
  v39 = [(ICSETableViewCell *)self bottomAnchor];
  v40 = [v38 constraintEqualToAnchor:v39];
  [v27 addObject:v40];

  +[NSLayoutConstraint activateConstraints:v27];
  v41 = +[UIColor labelColor];
  v42 = [(ICSETableViewCell *)self titleLabel];
  [v42 setTextColor:v41];

  v43 = +[UIColor secondaryLabelColor];
  v44 = [(ICSETableViewCell *)self secondaryLabel];
  [v44 setTextColor:v43];

  v45 = +[UIColor labelColor];
  v46 = [(ICSETableViewCell *)self iconView];
  [v46 setTintColor:v45];
}

- (void)prepareForReuse
{
  v15.receiver = self;
  v15.super_class = (Class)ICSETableViewCell;
  [(ICSETableViewCell *)&v15 prepareForReuse];
  double v3 = [(ICSETableViewCell *)self titleLabel];
  [v3 setHidden:0];

  double v4 = [(ICSETableViewCell *)self secondaryLabel];
  [v4 setHidden:0];

  double v5 = [(ICSETableViewCell *)self titleLabel];
  [v5 setAlpha:1.0];

  double v6 = [(ICSETableViewCell *)self secondaryLabel];
  [v6 setAlpha:1.0];

  double v7 = [(ICSETableViewCell *)self iconView];
  [v7 setAlpha:1.0];

  v8 = +[UIColor labelColor];
  v9 = [(ICSETableViewCell *)self titleLabel];
  [v9 setTextColor:v8];

  v10 = +[UIColor secondaryLabelColor];
  id v11 = [(ICSETableViewCell *)self secondaryLabel];
  [v11 setTextColor:v10];

  v12 = +[UIColor labelColor];
  v13 = [(ICSETableViewCell *)self iconView];
  [v13 setTintColor:v12];

  if ((+[UIDevice ic_isVision] & 1) == 0)
  {
    v14 = +[UIColor tableCellGroupedBackgroundColor];
    [(ICSETableViewCell *)self setBackgroundColor:v14];
  }
  [(ICSETableViewCell *)self setCollapsible:0];
  [(ICSETableViewCell *)self setCollapsed:0];
}

- (void)setTableViewItem:(id)a3
{
  objc_storeStrong((id *)&self->_tableViewItem, a3);
  id v5 = a3;
  [(ICSETableViewCell *)self setUpForTableViewItem:v5];
}

- (void)setUpForTableViewItem:(id)a3
{
  id v36 = a3;
  double v4 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  id v5 = [v4 ic_fontWithSingleLineA];
  double v6 = [(ICSETableViewCell *)self titleLabel];
  [v6 setFont:v5];

  double v7 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
  v8 = [v7 ic_fontWithSingleLineA];
  v9 = [(ICSETableViewCell *)self secondaryLabel];
  [v9 setFont:v8];

  v10 = [v36 title];
  id v11 = [(ICSETableViewCell *)self titleLabel];
  [v11 setText:v10];

  v12 = [v36 secondaryTitle];
  v13 = [(ICSETableViewCell *)self secondaryLabel];
  [v13 setText:v12];

  v14 = [v36 image];
  objc_super v15 = [(ICSETableViewCell *)self iconView];
  [v15 setImage:v14];

  if ((+[UIDevice ic_isVision] & 1) == 0
    && [v36 isInFolderList])
  {
    id v16 = +[UIColor ICTintColor];
    uint64_t v17 = [(ICSETableViewCell *)self iconView];
    [v17 setTintColor:v16];
  }
  if (([v36 isInFolderList] & 1) != 0
    || ([v36 folder], v18 = objc_claimAutoreleasedReturnValue(), v18, v18))
  {
    double v19 = 34.0;
  }
  else
  {
    double v19 = 22.0;
  }
  v20 = [(ICSETableViewCell *)self titleLeadingMargin];
  [v20 setConstant:v19];

  if (([v36 isAccountHeader] & 1) == 0)
  {
    v21 = [v36 folderListItem];

    if (v21)
    {
      v22 = [v36 folderListItem];
      id v23 = (char *)[v22 level] - 1;

      v24 = [(ICSETableViewCell *)self titleLeadingMargin];
      [v24 setConstant:(double)(unint64_t)v23 * 33.0 + 34.0];

      v25 = [(ICSETableViewCell *)self iconViewLeadingConstraint];
      [v25 setConstant:(double)(unint64_t)v23 * 33.0 + -5.0];
    }
  }
  if ([v36 isAccountPicker]) {
    goto LABEL_11;
  }
  id v26 = [v36 folder];
  if (v26)
  {
  }
  else
  {
    v27 = [v36 account];

    if (!v27)
    {
LABEL_11:
      [(ICSETableViewCell *)self setCollapsible:0];
      goto LABEL_17;
    }
  }
  v28 = [v36 folderListItem];
  -[ICSETableViewCell setCollapsible:](self, "setCollapsible:", [v28 isCollapsible]);

  v29 = [v36 folderListItem];
  -[ICSETableViewCell setCollapsed:](self, "setCollapsed:", [v29 isCollapsed]);

LABEL_17:
  if ([v36 isHeader])
  {
    [(ICSETableViewCell *)self setUpForHeaderItem:v36];
  }
  else
  {
    if ([v36 isSelectable]) {
      double v30 = 1.0;
    }
    else {
      double v30 = 0.5;
    }
    v31 = [(ICSETableViewCell *)self titleLabel];
    [v31 setAlpha:v30];

    v32 = [(ICSETableViewCell *)self secondaryLabel];
    [v32 setAlpha:v30];

    v33 = [(ICSETableViewCell *)self iconView];
    [v33 setAlpha:v30];

    if ((+[UIDevice ic_isVision] & 1) == 0
      && [v36 isChecked])
    {
      if (UIAccessibilityDarkerSystemColorsEnabled()) {
        +[UIColor ICDarkenedTintColor];
      }
      else {
      v34 = +[UIColor ICTintColor];
      }
      v35 = [(ICSETableViewCell *)self iconView];
      [v35 setTintColor:v34];
    }
  }
  [(ICSETableViewCell *)self updateAccessoryView];
}

- (UIImageView)accountAccessoryImageView
{
  accountAccessoryImageView = self->_accountAccessoryImageView;
  if (!accountAccessoryImageView)
  {
    id v4 = objc_alloc((Class)UIImageView);
    id v5 = +[UIImageView ic_defaultListAccessoryViewImage];
    double v6 = (UIImageView *)[v4 initWithImage:v5];
    double v7 = self->_accountAccessoryImageView;
    self->_accountAccessoryImageView = v6;

    v8 = +[UIColor tertiaryLabelColor];
    [(UIImageView *)self->_disclosureAccessoryImageView setTintColor:v8];

    [(UIImageView *)self->_accountAccessoryImageView setContentMode:4];
    accountAccessoryImageView = self->_accountAccessoryImageView;
  }

  return accountAccessoryImageView;
}

- (UIImageView)disclosureAccessoryImageView
{
  disclosureAccessoryImageView = self->_disclosureAccessoryImageView;
  if (!disclosureAccessoryImageView)
  {
    id v4 = objc_alloc((Class)UIImageView);
    id v5 = +[UIImageView ic_defaultListAccessoryViewImage];
    double v6 = (UIImageView *)[v4 initWithImage:v5];
    double v7 = self->_disclosureAccessoryImageView;
    self->_disclosureAccessoryImageView = v6;

    v8 = +[UIColor tertiaryLabelColor];
    [(UIImageView *)self->_disclosureAccessoryImageView setTintColor:v8];

    [(UIImageView *)self->_disclosureAccessoryImageView setContentMode:4];
    disclosureAccessoryImageView = self->_disclosureAccessoryImageView;
  }

  return disclosureAccessoryImageView;
}

- (UIImageView)expansionAccessoryImageView
{
  if (UIAccessibilityShouldDifferentiateWithoutColor()) {
    [(ICSETableViewCell *)self accessibilityExpansionAccessoryImageView];
  }
  else {
  double v3 = [(ICSETableViewCell *)self defaultExpansionAccessoryImageView];
  }
  if (+[UIDevice ic_isVision]) {
    +[UIColor secondaryLabelColor];
  }
  else {
  id v4 = +[UIColor ICTintColor];
  }
  [v3 setTintColor:v4];

  [v3 setContentMode:4];

  return (UIImageView *)v3;
}

- (UIImageView)defaultExpansionAccessoryImageView
{
  defaultExpansionAccessoryImageView = self->_defaultExpansionAccessoryImageView;
  if (!defaultExpansionAccessoryImageView)
  {
    id v4 = objc_alloc((Class)UIImageView);
    id v5 = +[UIImageView ic_defaultListAccessoryViewImage];
    double v6 = (UIImageView *)[v4 initWithImage:v5];
    double v7 = self->_defaultExpansionAccessoryImageView;
    self->_defaultExpansionAccessoryImageView = v6;

    defaultExpansionAccessoryImageView = self->_defaultExpansionAccessoryImageView;
  }

  return defaultExpansionAccessoryImageView;
}

- (UIImageView)accessibilityExpansionAccessoryImageView
{
  accessibilityExpansionAccessoryImageView = self->_accessibilityExpansionAccessoryImageView;
  if (!accessibilityExpansionAccessoryImageView)
  {
    id v4 = objc_alloc((Class)UIImageView);
    id v5 = +[UIImageView ic_accessibilityListAccessoryViewImage];
    double v6 = (UIImageView *)[v4 initWithImage:v5];
    double v7 = self->_accessibilityExpansionAccessoryImageView;
    self->_accessibilityExpansionAccessoryImageView = v6;

    accessibilityExpansionAccessoryImageView = self->_accessibilityExpansionAccessoryImageView;
  }

  return accessibilityExpansionAccessoryImageView;
}

- (void)updateAccessoryView
{
  double v3 = [(ICSETableViewCell *)self tableViewItem];
  id v4 = [v3 note];

  if (v4)
  {
    [(ICSETableViewCell *)self setAccessoryView:0];
    id v8 = [(ICSETableViewCell *)self expandCollapseHitView];
    [v8 setUserInteractionEnabled:0];
  }
  else
  {
    id v5 = [(ICSETableViewCell *)self tableViewItem];
    if ([v5 isHeader]) {
      [(ICSETableViewCell *)self accountAccessoryImageView];
    }
    else {
    id v8 = [(ICSETableViewCell *)self expansionAccessoryImageView];
    }

    if ([(ICSETableViewCell *)self isCollapsible])
    {
      [(ICSETableViewCell *)self setAccessoryView:v8];
    }
    else
    {
      double v6 = [(ICSETableViewCell *)self disclosureAccessoryImageView];
      [(ICSETableViewCell *)self setAccessoryView:v6];
    }
    [(ICSETableViewCell *)self updateCollapsedDisclosure];
    double v7 = [(ICSETableViewCell *)self expandCollapseHitView];
    [v7 setUserInteractionEnabled:[self isCollapsible]];
  }
}

- (void)setCollapsible:(BOOL)a3
{
  if (self->_collapsible != a3)
  {
    self->_collapsible = a3;
    [(ICSETableViewCell *)self updateAccessoryView];
  }
}

- (void)updateCollapsedDisclosure
{
  double v3 = [(ICSETableViewCell *)self accessoryView];

  if (v3)
  {
    unsigned int v4 = [(ICSETableViewCell *)self _shouldReverseLayoutDirection];
    long long v5 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v10.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v10.c = v5;
    *(_OWORD *)&v10.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    if ([(ICSETableViewCell *)self isCollapsible]
      && ![(ICSETableViewCell *)self isCollapsed])
    {
      double v6 = 1.57079633;
      if (v4) {
        double v6 = -1.57079633;
      }
      CGAffineTransformMakeRotation(&v10, v6);
    }
    CGAffineTransform v9 = v10;
    double v7 = [(ICSETableViewCell *)self accessoryView];
    CGAffineTransform v8 = v9;
    [v7 setTransform:&v8];
  }
}

- (void)setCollapsed:(BOOL)a3
{
  if (self->_collapsed != a3)
  {
    self->_collapsed = a3;
    [(ICSETableViewCell *)self updateCollapsedDisclosure];
  }
}

- (void)setCollapsed:(BOOL)a3 animated:(BOOL)a4
{
  if (a4)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100006438;
    v5[3] = &unk_1000EDF98;
    v5[4] = self;
    BOOL v6 = a3;
    +[UIView animateWithDuration:0 delay:v5 usingSpringWithDamping:0 initialSpringVelocity:0.3 options:0.0 animations:1.0 completion:0.0];
  }
  else
  {
    [(ICSETableViewCell *)self setCollapsed:a3];
  }
}

- (void)expandCollapseTapped:(id)a3
{
  uint64_t v4 = [(ICSETableViewCell *)self delegate];

  if (v4)
  {
    long long v5 = [(ICSETableViewCell *)self delegate];
    [v5 tableViewCell:self setCollapsed:[self isCollapsed] ^ 1];
  }
  uint64_t v6 = [(ICSETableViewCell *)self isCollapsed] ^ 1;

  [(ICSETableViewCell *)self setCollapsed:v6 animated:1];
}

- (void)setUpForHeaderItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  ICDynamicCast();
  id v28 = (id)objc_claimAutoreleasedReturnValue();

  long long v5 = +[UIColor secondaryLabelColor];
  uint64_t v6 = +[UIFontMetrics defaultMetrics];
  double v7 = +[UIFont systemFontOfSize:13.0 weight:UIFontWeightRegular];
  CGAffineTransform v8 = [v6 scaledFontForFont:v7];
  CGAffineTransform v9 = [v8 ic_fontWithSingleLineA];

  CGAffineTransform v10 = [(ICSETableViewCell *)self titleLabel];
  [v10 setFont:v9];

  id v11 = [(ICSETableViewCell *)self titleLabel];
  [v11 setTextColor:v5];

  v12 = [(ICSETableViewCell *)self titleLabel];
  v13 = [v12 font];
  v14 = [(ICSETableViewCell *)self secondaryLabel];
  [v14 setFont:v13];

  objc_super v15 = [(ICSETableViewCell *)self secondaryLabel];
  [v15 setTextColor:v5];

  id v16 = [v28 image];
  uint64_t v17 = [(ICSETableViewCell *)self iconView];
  [v17 setImage:v16];

  v18 = [(ICSETableViewCell *)self iconView];
  [v18 setTintColor:v5];

  if ([v28 headerType] == (id)2)
  {
    double v19 = [(ICSETableViewCell *)self titleLeadingMargin];
    [v19 setConstant:7.0];

    v20 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    v21 = [v20 ic_fontWithSingleLineA];
    v22 = [(ICSETableViewCell *)self titleLabel];
    [v22 setFont:v21];

    id v23 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    v24 = [v23 ic_fontWithSingleLineA];
    v25 = [(ICSETableViewCell *)self secondaryLabel];
    [v25 setFont:v24];

LABEL_5:
    goto LABEL_6;
  }
  if ([v28 headerType] == (id)1)
  {
    id v23 = [(ICSETableViewCell *)self titleLeadingMargin];
    [v23 setConstant:0.0];
    goto LABEL_5;
  }
LABEL_6:
  if ((+[UIDevice ic_isVision] & 1) == 0)
  {
    id v26 = [v28 backgroundColor];

    if (v26)
    {
      v27 = [v28 backgroundColor];
      [(ICSETableViewCell *)self setBackgroundColor:v27];
    }
  }
}

+ (id)newHeaderCell
{
  double v3 = +[NSBundle mainBundle];
  id v4 = NSStringFromClass((Class)a1);
  long long v5 = [v3 loadNibNamed:v4 owner:a1 options:0];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v15 != v9) {
        objc_enumerationMutation(v6);
      }
      id v11 = *(void **)(*((void *)&v14 + 1) + 8 * v10);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      if (v8 == (id)++v10)
      {
        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v12 = v11;

    if (v12) {
      goto LABEL_12;
    }
  }
  else
  {
LABEL_9:
  }
  +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "result != ((void *)0)", "+[ICSETableViewCell newHeaderCell]", 1, 0, @"Unable to load sharing extension header cell view", (void)v14);
  id v12 = 0;
LABEL_12:
  [v12 setTranslatesAutoresizingMaskIntoConstraints:1, (void)v14];
  [v12 setNeedsUpdateConstraints];

  return v12;
}

- (void)updateConstraints
{
  if (ICAccessibilityAccessibilityLargerTextSizesEnabled())
  {
    double v3 = [(ICSETableViewCell *)self defaultConstraintsForRegularTextSizes];
    [(ICSETableViewCell *)self disableConstraintsBySettingPriority:v3];

    [(ICSETableViewCell *)self alternateConstraintsForAXLargerTextSizes];
  }
  else
  {
    id v4 = [(ICSETableViewCell *)self alternateConstraintsForAXLargerTextSizes];
    [(ICSETableViewCell *)self disableConstraintsBySettingPriority:v4];

    [(ICSETableViewCell *)self defaultConstraintsForRegularTextSizes];
  long long v5 = };
  [(ICSETableViewCell *)self enableConstraintsBySettingPriority:v5];

  id v6 = [(ICSETableViewCell *)self iconView];
  [v6 setHidden:ICAccessibilityAccessibilityLargerTextSizesEnabled()];

  v7.receiver = self;
  v7.super_class = (Class)ICSETableViewCell;
  [(ICSETableViewCell *)&v7 updateConstraints];
}

- (void)disableConstraintsBySettingPriority:(id)a3
{
  id v3 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v3);
        }
        LODWORD(v5) = 1.0;
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) setPriority:v5];
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)enableConstraintsBySettingPriority:(id)a3
{
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v8);
        long long v10 = [(ICSETableViewCell *)self storedConstraintPriorities];
        long long v11 = [v9 identifier];
        long long v12 = [v10 objectForKeyedSubscript:v11];

        if (v12) {
          uint64_t v14 = (uint64_t)[v12 integerValue];
        }
        else {
          uint64_t v14 = 999;
        }
        *(float *)&double v13 = (float)v14;
        [v9 setPriority:v13];

        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
}

- (id)defaultConstraintsForRegularTextSizes
{
  id v3 = [(ICSETableViewCell *)self iconViewBaselineConstraint];
  v11[0] = v3;
  id v4 = [(ICSETableViewCell *)self titleLabelBaselineConstraint];
  v11[1] = v4;
  id v5 = [(ICSETableViewCell *)self titleLabelCenterConstraint];
  v11[2] = v5;
  id v6 = [(ICSETableViewCell *)self secondaryLabelBaselineConstraint];
  v11[3] = v6;
  uint64_t v7 = [(ICSETableViewCell *)self secondaryLabelLeadingConstraint];
  v11[4] = v7;
  id v8 = [(ICSETableViewCell *)self secondaryLabelCenterVerticallyConstraint];
  v11[5] = v8;
  long long v9 = +[NSArray arrayWithObjects:v11 count:6];

  return v9;
}

- (id)alternateConstraintsForAXLargerTextSizes
{
  id v3 = [(ICSETableViewCell *)self titleLabelTopConstraintForAXLargerTextSizes];
  v9[0] = v3;
  id v4 = [(ICSETableViewCell *)self iconViewCenterYConstraintForAXLargerTextSizes];
  v9[1] = v4;
  id v5 = [(ICSETableViewCell *)self secondaryLabelBelowTitleLabelConstraintForAXLargerTextSizes];
  v9[2] = v5;
  id v6 = [(ICSETableViewCell *)self secondaryLabelLeadingConstraintForAXLargerTextSizes];
  v9[3] = v6;
  uint64_t v7 = +[NSArray arrayWithObjects:v9 count:4];

  return v7;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(ICSETableViewCell *)self tableViewItem];
  unsigned __int8 v4 = [v3 isHeader];

  if (v4)
  {
    id v5 = [(ICSETableViewCell *)self titleLabel];
    id v6 = [v5 text];
    uint64_t v7 = [(ICSETableViewCell *)self secondaryLabel];
    id v8 = [v7 text];
    uint64_t v9 = __ICAccessibilityStringForVariablesSentinel;
    long long v50 = v8;
    v52 = (void *)__ICAccessibilityStringForVariablesSentinel;
    long long v10 = __ICAccessibilityStringForVariables();
    goto LABEL_16;
  }
  long long v11 = [(ICSETableViewCell *)self tableViewItem];
  long long v12 = [v11 note];

  double v13 = [(ICSETableViewCell *)self tableViewItem];
  uint64_t v14 = v13;
  if (v12)
  {
    long long v15 = [v13 note];
    id v5 = [(ICSETableViewCell *)self accessibilitySharedViaICloudStringForNote:v15];
  }
  else
  {
    id v5 = [v13 folder];
    if (v5)
    {
      v25 = [(ICSETableViewCell *)self tableViewItem];
      id v26 = [v25 folder];
      unsigned int v27 = [v26 isSharedViaICloud];

      if (!v27)
      {
        id v5 = 0;
        goto LABEL_6;
      }
      uint64_t v14 = +[NSBundle mainBundle];
      id v5 = [v14 localizedStringForKey:@"Shared folder" value:&stru_1000F2510 table:0];
    }
  }

LABEL_6:
  long long v16 = [(ICSETableViewCell *)self tableViewItem];
  long long v17 = [v16 note];
  unsigned int v18 = [v17 isPasswordProtected];

  if (v18)
  {
    double v19 = +[NSBundle mainBundle];
    id v6 = [v19 localizedStringForKey:@"Locked" value:&stru_1000F2510 table:0];
  }
  else
  {
    id v6 = 0;
  }
  v20 = [(ICSETableViewCell *)self tableViewItem];
  v21 = [v20 note];
  if (v21)
  {
    v22 = [(ICSETableViewCell *)self tableViewItem];
    id v23 = [v22 note];
    v24 = [v23 modificationDate];
    uint64_t v7 = [v24 ic_briefFormattedDateForAccessibility];
  }
  else
  {
    v22 = [(ICSETableViewCell *)self secondaryLabel];
    uint64_t v7 = [v22 text];
  }

  id v8 = [(ICSETableViewCell *)self titleLabel];
  id v28 = [v8 text];
  uint64_t v9 = __ICAccessibilityStringForVariablesSentinel;
  v54 = v7;
  uint64_t v55 = __ICAccessibilityStringForVariablesSentinel;
  long long v50 = v5;
  v52 = v6;
  long long v10 = __ICAccessibilityStringForVariables();

LABEL_16:
  v29 = [(ICSETableViewCell *)self tableViewItem];
  double v30 = [v29 folder];

  if (v30)
  {
    v31 = [(ICSETableViewCell *)self tableViewItem];
    v32 = [v31 folder];

    v33 = [v32 parent];
    v34 = [v33 title];
    id v35 = [v34 length];

    if (v35)
    {
      id v36 = +[NSBundle mainBundle];
      v37 = [v36 localizedStringForKey:@"subfolder of %@" value:&stru_1000F2510 table:0];

      v38 = [v32 parent];
      v39 = [v38 title];
      v40 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v37, v39);

      objc_super v51 = v40;
      uint64_t v53 = v9;
      uint64_t v41 = __ICAccessibilityStringForVariables();

      long long v10 = (void *)v41;
    }
    v42 = [v32 visibleNoteContainerChildren:v51, v53, v54, v55];
    id v43 = [v42 count];

    if (v43)
    {
      v44 = +[NSBundle mainBundle];
      v45 = [v44 localizedStringForKey:@"NUM_SUBFOLDERS_%lu" value:&stru_1000F2510 table:0];

      v46 = [v32 visibleNoteContainerChildren];
      long long v47 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v45, [v46 count]);

      uint64_t v48 = __ICAccessibilityStringForVariables();

      long long v10 = (void *)v48;
    }
  }

  return v10;
}

- (id)accessibilityUserInputLabels
{
  id v3 = [(ICSETableViewCell *)self titleLabel];
  unsigned __int8 v4 = [v3 text];
  v8[0] = v4;
  id v5 = [(ICSETableViewCell *)self accessibilityLabel];
  v8[1] = v5;
  id v6 = +[NSArray arrayWithObjects:v8 count:2];

  return v6;
}

- (unint64_t)accessibilityTraits
{
  v15.receiver = self;
  v15.super_class = (Class)ICSETableViewCell;
  unint64_t v3 = [(ICSETableViewCell *)&v15 accessibilityTraits];
  unsigned __int8 v4 = [(ICSETableViewCell *)self tableViewItem];
  if ([v4 isSelectable])
  {
  }
  else
  {
    id v5 = [(ICSETableViewCell *)self tableViewItem];
    unsigned int v6 = [v5 isHeader];

    UIAccessibilityTraits v7 = UIAccessibilityTraitNotEnabled;
    if (v6) {
      UIAccessibilityTraits v7 = 0;
    }
    v3 |= v7;
  }
  id v8 = [(ICSETableViewCell *)self tableViewItem];
  unsigned int v9 = [v8 isChecked];

  if (v9) {
    UIAccessibilityTraits v10 = UIAccessibilityTraitSelected;
  }
  else {
    UIAccessibilityTraits v10 = 0;
  }
  long long v11 = [(ICSETableViewCell *)self tableViewItem];
  unsigned int v12 = [v11 isHeader];

  UIAccessibilityTraits v13 = UIAccessibilityTraitHeader;
  if (!v12) {
    UIAccessibilityTraits v13 = 0;
  }
  return v10 | v3 | v13;
}

- (id)accessibilityCustomActions
{
  v13.receiver = self;
  v13.super_class = (Class)ICSETableViewCell;
  unint64_t v3 = [(ICSETableViewCell *)&v13 accessibilityCustomActions];
  if ([(ICSETableViewCell *)self isCollapsible])
  {
    id v4 = [v3 mutableCopy];
    if (!v4) {
      id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:1];
    }
    unsigned int v5 = [(ICSETableViewCell *)self isCollapsed];
    unsigned int v6 = +[NSBundle mainBundle];
    UIAccessibilityTraits v7 = v6;
    if (v5) {
      CFStringRef v8 = @"Expand";
    }
    else {
      CFStringRef v8 = @"Collapse";
    }
    unsigned int v9 = [v6 localizedStringForKey:v8 value:&stru_1000F2510 table:0];

    id v10 = [objc_alloc((Class)UIAccessibilityCustomAction) initWithName:v9 target:self selector:"expandCollapseTapped:"];
    [v4 addObject:v10];
    id v11 = [v4 copy];
  }
  else
  {
    id v11 = v3;
  }

  return v11;
}

- (id)accessibilityHint
{
  if ([(ICSETableViewCell *)self isCollapsible])
  {
    unsigned int v3 = [(ICSETableViewCell *)self isCollapsed];
    id v4 = +[NSBundle mainBundle];
    unsigned int v5 = v4;
    if (v3) {
      CFStringRef v6 = @"Use the actions rotor to expand folder";
    }
    else {
      CFStringRef v6 = @"Use the actions rotor to collapse folder";
    }
    UIAccessibilityTraits v7 = [v4 localizedStringForKey:v6 value:&stru_1000F2510 table:0];
  }
  else
  {
    UIAccessibilityTraits v7 = 0;
  }

  return v7;
}

- (ICSETableViewItem)tableViewItem
{
  return self->_tableViewItem;
}

- (ICSETableViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICSETableViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setAccessibilityExpansionAccessoryImageView:(id)a3
{
}

- (void)setAccountAccessoryImageView:(id)a3
{
}

- (void)setDefaultExpansionAccessoryImageView:(id)a3
{
}

- (void)setDisclosureAccessoryImageView:(id)a3
{
}

- (void)setExpansionAccessoryImageView:(id)a3
{
}

- (UIView)expandCollapseHitView
{
  return self->_expandCollapseHitView;
}

- (void)setExpandCollapseHitView:(id)a3
{
}

- (BOOL)isCollapsible
{
  return self->_collapsible;
}

- (BOOL)isCollapsed
{
  return self->_collapsed;
}

- (UILabel)titleLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_titleLabel);

  return (UILabel *)WeakRetained;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)secondaryLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_secondaryLabel);

  return (UILabel *)WeakRetained;
}

- (void)setSecondaryLabel:(id)a3
{
}

- (UIImageView)iconView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconView);

  return (UIImageView *)WeakRetained;
}

- (void)setIconView:(id)a3
{
}

- (NSLayoutConstraint)titleLeadingMargin
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_titleLeadingMargin);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setTitleLeadingMargin:(id)a3
{
}

- (NSLayoutConstraint)iconViewContainerMinHeightConstraint
{
  return self->_iconViewContainerMinHeightConstraint;
}

- (void)setIconViewContainerMinHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)iconViewLeadingConstraint
{
  return self->_iconViewLeadingConstraint;
}

- (void)setIconViewLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)iconViewBaselineConstraint
{
  return self->_iconViewBaselineConstraint;
}

- (void)setIconViewBaselineConstraint:(id)a3
{
}

- (NSLayoutConstraint)titleLabelBaselineConstraint
{
  return self->_titleLabelBaselineConstraint;
}

- (void)setTitleLabelBaselineConstraint:(id)a3
{
}

- (NSLayoutConstraint)titleLabelCenterConstraint
{
  return self->_titleLabelCenterConstraint;
}

- (void)setTitleLabelCenterConstraint:(id)a3
{
}

- (NSLayoutConstraint)secondaryLabelBaselineConstraint
{
  return self->_secondaryLabelBaselineConstraint;
}

- (void)setSecondaryLabelBaselineConstraint:(id)a3
{
}

- (NSLayoutConstraint)secondaryLabelCenterVerticallyConstraint
{
  return self->_secondaryLabelCenterVerticallyConstraint;
}

- (void)setSecondaryLabelCenterVerticallyConstraint:(id)a3
{
}

- (NSLayoutConstraint)secondaryLabelLeadingConstraint
{
  return self->_secondaryLabelLeadingConstraint;
}

- (void)setSecondaryLabelLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)titleLabelTopConstraintForAXLargerTextSizes
{
  return self->_titleLabelTopConstraintForAXLargerTextSizes;
}

- (void)setTitleLabelTopConstraintForAXLargerTextSizes:(id)a3
{
}

- (NSLayoutConstraint)iconViewCenterYConstraintForAXLargerTextSizes
{
  return self->_iconViewCenterYConstraintForAXLargerTextSizes;
}

- (void)setIconViewCenterYConstraintForAXLargerTextSizes:(id)a3
{
}

- (NSLayoutConstraint)secondaryLabelBelowTitleLabelConstraintForAXLargerTextSizes
{
  return self->_secondaryLabelBelowTitleLabelConstraintForAXLargerTextSizes;
}

- (void)setSecondaryLabelBelowTitleLabelConstraintForAXLargerTextSizes:(id)a3
{
}

- (NSLayoutConstraint)secondaryLabelLeadingConstraintForAXLargerTextSizes
{
  return self->_secondaryLabelLeadingConstraintForAXLargerTextSizes;
}

- (void)setSecondaryLabelLeadingConstraintForAXLargerTextSizes:(id)a3
{
}

- (NSMutableDictionary)storedConstraintPriorities
{
  return self->_storedConstraintPriorities;
}

- (void)setStoredConstraintPriorities:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storedConstraintPriorities, 0);
  objc_storeStrong((id *)&self->_secondaryLabelLeadingConstraintForAXLargerTextSizes, 0);
  objc_storeStrong((id *)&self->_secondaryLabelBelowTitleLabelConstraintForAXLargerTextSizes, 0);
  objc_storeStrong((id *)&self->_iconViewCenterYConstraintForAXLargerTextSizes, 0);
  objc_storeStrong((id *)&self->_titleLabelTopConstraintForAXLargerTextSizes, 0);
  objc_storeStrong((id *)&self->_secondaryLabelLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_secondaryLabelCenterVerticallyConstraint, 0);
  objc_storeStrong((id *)&self->_secondaryLabelBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelCenterConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabelBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_iconViewBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_iconViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_iconViewContainerMinHeightConstraint, 0);
  objc_destroyWeak((id *)&self->_titleLeadingMargin);
  objc_destroyWeak((id *)&self->_iconView);
  objc_destroyWeak((id *)&self->_secondaryLabel);
  objc_destroyWeak((id *)&self->_titleLabel);
  objc_storeStrong((id *)&self->_expandCollapseHitView, 0);
  objc_storeStrong((id *)&self->_expansionAccessoryImageView, 0);
  objc_storeStrong((id *)&self->_disclosureAccessoryImageView, 0);
  objc_storeStrong((id *)&self->_defaultExpansionAccessoryImageView, 0);
  objc_storeStrong((id *)&self->_accountAccessoryImageView, 0);
  objc_storeStrong((id *)&self->_accessibilityExpansionAccessoryImageView, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_tableViewItem, 0);
}

@end