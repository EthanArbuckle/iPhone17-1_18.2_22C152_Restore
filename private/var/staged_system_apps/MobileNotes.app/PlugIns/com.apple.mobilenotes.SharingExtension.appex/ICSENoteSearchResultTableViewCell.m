@interface ICSENoteSearchResultTableViewCell
- (BOOL)showAccountName;
- (ICSETableViewItem)item;
- (NSArray)alternateConstraintsForAXLargerTextSizes;
- (NSArray)defaultConstraints;
- (NSLayoutConstraint)dashContainerZeroWidthConstraint;
- (UIImageView)folderIconView;
- (UIImageView)iconView;
- (UILabel)accountTitleLabel;
- (UILabel)dashLabel;
- (UILabel)dateLabel;
- (UILabel)folderTitleLabel;
- (UILabel)noteTitleLabel;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)awakeFromNib;
- (void)contentSizeCategoryChanged:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setAccountTitleLabel:(id)a3;
- (void)setAlternateConstraintsForAXLargerTextSizes:(id)a3;
- (void)setDashContainerZeroWidthConstraint:(id)a3;
- (void)setDashLabel:(id)a3;
- (void)setDateLabel:(id)a3;
- (void)setDefaultConstraints:(id)a3;
- (void)setFolderIconView:(id)a3;
- (void)setFolderTitleLabel:(id)a3;
- (void)setIconView:(id)a3;
- (void)setItem:(id)a3;
- (void)setNoteTitleLabel:(id)a3;
- (void)setShowAccountName:(BOOL)a3;
- (void)updateConstraints;
- (void)updateFonts;
@end

@implementation ICSENoteSearchResultTableViewCell

- (void)awakeFromNib
{
  v6.receiver = self;
  v6.super_class = (Class)ICSENoteSearchResultTableViewCell;
  [(ICSENoteSearchResultTableViewCell *)&v6 awakeFromNib];
  v3 = +[UIColor secondaryLabelColor];
  v4 = [(ICSENoteSearchResultTableViewCell *)self folderIconView];
  [v4 setTintColor:v3];

  [(ICSENoteSearchResultTableViewCell *)self updateFonts];
  v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"contentSizeCategoryChanged:" name:UIContentSizeCategoryDidChangeNotification object:0];
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICSENoteSearchResultTableViewCell;
  [(ICSENoteSearchResultTableViewCell *)&v4 dealloc];
}

- (void)setItem:(id)a3
{
  id v38 = a3;
  objc_storeStrong((id *)&self->_item, a3);
  v5 = [v38 note];
  if (!v5) {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((note) != nil)", "-[ICSENoteSearchResultTableViewCell setItem:]", 1, 0, @"Expected non-nil value for '%s'", "note");
  }
  objc_super v6 = [v5 folder];
  if (!v6) {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((folder) != nil)", "-[ICSENoteSearchResultTableViewCell setItem:]", 1, 0, @"Expected non-nil value for '%s'", "folder");
  }
  if ([v38 isSelectable]) {
    double v7 = 1.0;
  }
  else {
    double v7 = 0.5;
  }
  v8 = [(ICSENoteSearchResultTableViewCell *)self iconView];
  [v8 setAlpha:v7];

  v9 = +[UIColor labelColor];
  v10 = [(ICSENoteSearchResultTableViewCell *)self iconView];
  [v10 setTintColor:v9];

  v11 = [v38 image];
  v12 = [(ICSENoteSearchResultTableViewCell *)self iconView];
  [v12 setImage:v11];

  v13 = [(ICSENoteSearchResultTableViewCell *)self noteTitleLabel];
  [v13 setAlpha:v7];

  v14 = [v38 title];
  v15 = [(ICSENoteSearchResultTableViewCell *)self noteTitleLabel];
  [v15 setText:v14];

  v16 = [(ICSENoteSearchResultTableViewCell *)self folderIconView];
  [v16 setAlpha:v7];

  if ([v6 isSharedViaICloud]) {
    CFStringRef v17 = @"folder.badge.person.crop";
  }
  else {
    CFStringRef v17 = @"folder";
  }
  v18 = +[UIImage ic_largeSystemImageNamed:v17];
  v19 = [(ICSENoteSearchResultTableViewCell *)self folderIconView];
  [v19 setImage:v18];

  v20 = [(ICSENoteSearchResultTableViewCell *)self folderIconView];
  [v20 setContentMode:1];

  v21 = [(ICSENoteSearchResultTableViewCell *)self folderTitleLabel];
  [v21 setAlpha:v7];

  v22 = [v6 localizedTitle];
  v23 = [(ICSENoteSearchResultTableViewCell *)self folderTitleLabel];
  [v23 setText:v22];

  LODWORD(v23) = [(ICSENoteSearchResultTableViewCell *)self showAccountName];
  v24 = [(ICSENoteSearchResultTableViewCell *)self accountTitleLabel];
  v25 = v24;
  if (v23)
  {
    [v24 setAlpha:v7];

    v26 = [v6 account];
    v27 = [v26 accountName];
    v28 = [(ICSENoteSearchResultTableViewCell *)self accountTitleLabel];
    [v28 setText:v27];

    v29 = [(ICSENoteSearchResultTableViewCell *)self dashContainerZeroWidthConstraint];
    LODWORD(v30) = 1.0;
    [v29 setPriority:v30];

    v31 = [(ICSENoteSearchResultTableViewCell *)self dashLabel];
    [v31 setAlpha:v7];
  }
  else
  {
    [v24 setText:&stru_1000F2510];

    v31 = [(ICSENoteSearchResultTableViewCell *)self dashContainerZeroWidthConstraint];
    LODWORD(v32) = 1148829696;
    [v31 setPriority:v32];
  }

  v33 = [(ICSENoteSearchResultTableViewCell *)self dateLabel];
  [v33 setAlpha:v7];

  v34 = [v38 secondaryTitle];
  v35 = [(ICSENoteSearchResultTableViewCell *)self dateLabel];
  [v35 setText:v34];

  if ((+[UIDevice ic_isVision] & 1) == 0
    && [v38 isChecked])
  {
    if (UIAccessibilityDarkerSystemColorsEnabled()) {
      +[UIColor ICDarkenedTintColor];
    }
    else {
    v36 = +[UIColor ICTintColor];
    }
    v37 = [(ICSENoteSearchResultTableViewCell *)self iconView];
    [v37 setTintColor:v36];
  }
  [v38 seperatorInsets];
  -[ICSENoteSearchResultTableViewCell setSeparatorInset:](self, "setSeparatorInset:");
  [(ICSENoteSearchResultTableViewCell *)self setSeparatorStyle:1];
}

- (void)contentSizeCategoryChanged:(id)a3
{
  [(ICSENoteSearchResultTableViewCell *)self updateFonts];
  [(ICSENoteSearchResultTableViewCell *)self setNeedsUpdateConstraints];

  [(ICSENoteSearchResultTableViewCell *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)ICSENoteSearchResultTableViewCell;
  [(ICSENoteSearchResultTableViewCell *)&v3 layoutSubviews];
  [(ICSENoteSearchResultTableViewCell *)self updateConstraints];
}

- (void)updateConstraints
{
  if (ICAccessibilityAccessibilityLargerTextSizesEnabled())
  {
    objc_super v3 = [(ICSENoteSearchResultTableViewCell *)self defaultConstraints];
    +[NSLayoutConstraint deactivateConstraints:v3];

    [(ICSENoteSearchResultTableViewCell *)self alternateConstraintsForAXLargerTextSizes];
  }
  else
  {
    objc_super v4 = [(ICSENoteSearchResultTableViewCell *)self alternateConstraintsForAXLargerTextSizes];
    +[NSLayoutConstraint deactivateConstraints:v4];

    [(ICSENoteSearchResultTableViewCell *)self defaultConstraints];
  v5 = };
  +[NSLayoutConstraint activateConstraints:v5];

  objc_super v6 = [(ICSENoteSearchResultTableViewCell *)self iconView];
  [v6 setHidden:ICAccessibilityAccessibilityLargerTextSizesEnabled()];

  double v7 = [(ICSENoteSearchResultTableViewCell *)self folderIconView];
  [v7 setHidden:ICAccessibilityAccessibilityLargerTextSizesEnabled()];

  v8.receiver = self;
  v8.super_class = (Class)ICSENoteSearchResultTableViewCell;
  [(ICSENoteSearchResultTableViewCell *)&v8 updateConstraints];
}

- (void)updateFonts
{
  objc_super v3 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [v3 _scaledValueForValue:17.0];
  double v5 = floor(v4);

  objc_super v6 = +[UIFont systemFontOfSize:v5 weight:UIFontWeightMedium];
  double v7 = [v6 ic_fontWithSingleLineA];
  objc_super v8 = [(ICSENoteSearchResultTableViewCell *)self noteTitleLabel];
  [v8 setFont:v7];

  v9 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCaption1];
  v10 = [v9 ic_fontWithSingleLineA];
  v11 = [(ICSENoteSearchResultTableViewCell *)self folderTitleLabel];
  [v11 setFont:v10];

  v12 = +[UIColor secondaryLabelColor];
  v13 = [(ICSENoteSearchResultTableViewCell *)self folderTitleLabel];
  [v13 setTextColor:v12];

  v14 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCaption1];
  v15 = [v14 ic_fontWithSingleLineA];
  v16 = [(ICSENoteSearchResultTableViewCell *)self dashLabel];
  [v16 setFont:v15];

  CFStringRef v17 = +[UIColor secondaryLabelColor];
  v18 = [(ICSENoteSearchResultTableViewCell *)self dashLabel];
  [v18 setTextColor:v17];

  v19 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCaption1];
  v20 = [v19 ic_fontWithSingleLineA];
  v21 = [(ICSENoteSearchResultTableViewCell *)self accountTitleLabel];
  [v21 setFont:v20];

  v22 = +[UIColor secondaryLabelColor];
  v23 = [(ICSENoteSearchResultTableViewCell *)self accountTitleLabel];
  [v23 setTextColor:v22];

  id v25 = +[UIColor secondaryLabelColor];
  v24 = [(ICSENoteSearchResultTableViewCell *)self dateLabel];
  [v24 setTextColor:v25];
}

- (unint64_t)accessibilityTraits
{
  v12.receiver = self;
  v12.super_class = (Class)ICSENoteSearchResultTableViewCell;
  unint64_t v3 = [(ICSENoteSearchResultTableViewCell *)&v12 accessibilityTraits];
  double v4 = [(ICSENoteSearchResultTableViewCell *)self item];
  unsigned int v5 = [v4 isSelectable];

  UIAccessibilityTraits v6 = UIAccessibilityTraitNotEnabled;
  if (v5) {
    UIAccessibilityTraits v6 = 0;
  }
  UIAccessibilityTraits v7 = v6 | v3;
  objc_super v8 = [(ICSENoteSearchResultTableViewCell *)self item];
  unsigned int v9 = [v8 isChecked];

  UIAccessibilityTraits v10 = UIAccessibilityTraitSelected;
  if (!v9) {
    UIAccessibilityTraits v10 = 0;
  }
  return v7 | v10;
}

- (id)accessibilityLabel
{
  unint64_t v3 = [(ICSENoteSearchResultTableViewCell *)self item];
  double v4 = [v3 note];

  if (!v4) {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((note) != nil)", "-[ICSENoteSearchResultTableViewCell accessibilityLabel]", 1, 0, @"Expected non-nil value for '%s'", "note");
  }
  unsigned int v5 = [v4 title];
  UIAccessibilityTraits v6 = [v4 modificationDate];
  UIAccessibilityTraits v7 = [v6 ic_briefFormattedDateForAccessibility];

  objc_super v8 = [(ICSENoteSearchResultTableViewCell *)self accessibilitySharedViaICloudStringForNote:v4];
  if ([v4 isSharedViaICloudFolder])
  {
    unsigned int v9 = 0;
  }
  else
  {
    UIAccessibilityTraits v10 = [v4 folder];
    unsigned int v9 = [v10 title];
  }
  v11 = __ICAccessibilityStringForVariables();

  return v11;
}

- (ICSETableViewItem)item
{
  return self->_item;
}

- (BOOL)showAccountName
{
  return self->_showAccountName;
}

- (void)setShowAccountName:(BOOL)a3
{
  self->_showAccountName = a3;
}

- (UIImageView)iconView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconView);

  return (UIImageView *)WeakRetained;
}

- (void)setIconView:(id)a3
{
}

- (UILabel)noteTitleLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_noteTitleLabel);

  return (UILabel *)WeakRetained;
}

- (void)setNoteTitleLabel:(id)a3
{
}

- (UIImageView)folderIconView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_folderIconView);

  return (UIImageView *)WeakRetained;
}

- (void)setFolderIconView:(id)a3
{
}

- (UILabel)folderTitleLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_folderTitleLabel);

  return (UILabel *)WeakRetained;
}

- (void)setFolderTitleLabel:(id)a3
{
}

- (UILabel)dashLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dashLabel);

  return (UILabel *)WeakRetained;
}

- (void)setDashLabel:(id)a3
{
}

- (UILabel)accountTitleLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accountTitleLabel);

  return (UILabel *)WeakRetained;
}

- (void)setAccountTitleLabel:(id)a3
{
}

- (UILabel)dateLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dateLabel);

  return (UILabel *)WeakRetained;
}

- (void)setDateLabel:(id)a3
{
}

- (NSLayoutConstraint)dashContainerZeroWidthConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dashContainerZeroWidthConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setDashContainerZeroWidthConstraint:(id)a3
{
}

- (NSArray)defaultConstraints
{
  return self->_defaultConstraints;
}

- (void)setDefaultConstraints:(id)a3
{
}

- (NSArray)alternateConstraintsForAXLargerTextSizes
{
  return self->_alternateConstraintsForAXLargerTextSizes;
}

- (void)setAlternateConstraintsForAXLargerTextSizes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateConstraintsForAXLargerTextSizes, 0);
  objc_storeStrong((id *)&self->_defaultConstraints, 0);
  objc_destroyWeak((id *)&self->_dashContainerZeroWidthConstraint);
  objc_destroyWeak((id *)&self->_dateLabel);
  objc_destroyWeak((id *)&self->_accountTitleLabel);
  objc_destroyWeak((id *)&self->_dashLabel);
  objc_destroyWeak((id *)&self->_folderTitleLabel);
  objc_destroyWeak((id *)&self->_folderIconView);
  objc_destroyWeak((id *)&self->_noteTitleLabel);
  objc_destroyWeak((id *)&self->_iconView);

  objc_storeStrong((id *)&self->_item, 0);
}

@end