@interface ICSEFolderSearchResultTableViewCell
- (BOOL)showAccountName;
- (ICSETableViewItem)item;
- (NSArray)alternateConstraintsForAXLargerTextSizes;
- (NSArray)defaultConstraints;
- (UIImageView)folderIconView;
- (UILabel)accountTitleLabel;
- (UILabel)folderTitleLabel;
- (void)awakeFromNib;
- (void)contentSizeCategoryChanged:(id)a3;
- (void)dealloc;
- (void)setAccountTitleLabel:(id)a3;
- (void)setAlternateConstraintsForAXLargerTextSizes:(id)a3;
- (void)setDefaultConstraints:(id)a3;
- (void)setFolderIconView:(id)a3;
- (void)setFolderTitleLabel:(id)a3;
- (void)setItem:(id)a3;
- (void)setShowAccountName:(BOOL)a3;
- (void)updateConstraints;
- (void)updateFonts;
@end

@implementation ICSEFolderSearchResultTableViewCell

- (void)awakeFromNib
{
  v7.receiver = self;
  v7.super_class = (Class)ICSEFolderSearchResultTableViewCell;
  [(ICSEFolderSearchResultTableViewCell *)&v7 awakeFromNib];
  if (+[UIDevice ic_isVision])
  {
    uint64_t v3 = +[UIColor labelColor];
  }
  else
  {
    if (UIAccessibilityDarkerSystemColorsEnabled()) {
      +[UIColor ICDarkenedTintColor];
    }
    else {
    uint64_t v3 = +[UIColor ICTintColor];
    }
  }
  v4 = (void *)v3;
  v5 = [(ICSEFolderSearchResultTableViewCell *)self folderIconView];
  [v5 setTintColor:v4];

  [(ICSEFolderSearchResultTableViewCell *)self updateFonts];
  [(ICSEFolderSearchResultTableViewCell *)self setAccessoryType:1];
  v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"contentSizeCategoryChanged:" name:UIContentSizeCategoryDidChangeNotification object:0];
}

- (void)dealloc
{
  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICSEFolderSearchResultTableViewCell;
  [(ICSEFolderSearchResultTableViewCell *)&v4 dealloc];
}

- (void)setItem:(id)a3
{
  id v19 = a3;
  objc_storeStrong((id *)&self->_item, a3);
  if ([v19 isSelectable]) {
    double v5 = 1.0;
  }
  else {
    double v5 = 0.5;
  }
  v6 = [(ICSEFolderSearchResultTableViewCell *)self accountTitleLabel];
  [v6 setAlpha:v5];

  objc_super v7 = [(ICSEFolderSearchResultTableViewCell *)self folderTitleLabel];
  [v7 setAlpha:v5];

  v8 = [(ICSEFolderSearchResultTableViewCell *)self folderIconView];
  [v8 setAlpha:v5];

  v9 = [v19 folder];
  if (!v9) {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((folder) != nil)", "-[ICSEFolderSearchResultTableViewCell setItem:]", 1, 0, @"Expected non-nil value for '%s'", "folder");
  }
  v10 = [v9 systemImageName];
  v11 = +[UIImage ic_largeSystemImageNamed:v10];
  v12 = [(ICSEFolderSearchResultTableViewCell *)self folderIconView];
  [v12 setImage:v11];

  v13 = [(ICSEFolderSearchResultTableViewCell *)self folderIconView];
  [v13 setContentMode:1];

  v14 = [v19 title];
  v15 = [(ICSEFolderSearchResultTableViewCell *)self folderTitleLabel];
  [v15 setText:v14];

  unsigned int v16 = [(ICSEFolderSearchResultTableViewCell *)self showAccountName];
  if (v16)
  {
    v15 = [v9 account];
    v17 = [v15 accountName];
  }
  else
  {
    v17 = &stru_1000F2510;
  }
  v18 = [(ICSEFolderSearchResultTableViewCell *)self accountTitleLabel];
  [v18 setText:v17];

  if (v16)
  {
  }
  [v19 seperatorInsets];
  -[ICSEFolderSearchResultTableViewCell setSeparatorInset:](self, "setSeparatorInset:");
  [(ICSEFolderSearchResultTableViewCell *)self setSeparatorStyle:1];
}

- (void)contentSizeCategoryChanged:(id)a3
{
  [(ICSEFolderSearchResultTableViewCell *)self updateFonts];
  [(ICSEFolderSearchResultTableViewCell *)self setNeedsUpdateConstraints];

  [(ICSEFolderSearchResultTableViewCell *)self setNeedsLayout];
}

- (void)updateConstraints
{
  if (ICAccessibilityAccessibilityLargerTextSizesEnabled())
  {
    uint64_t v3 = [(ICSEFolderSearchResultTableViewCell *)self defaultConstraints];
    +[NSLayoutConstraint deactivateConstraints:v3];

    [(ICSEFolderSearchResultTableViewCell *)self alternateConstraintsForAXLargerTextSizes];
  }
  else
  {
    objc_super v4 = [(ICSEFolderSearchResultTableViewCell *)self alternateConstraintsForAXLargerTextSizes];
    +[NSLayoutConstraint deactivateConstraints:v4];

    [(ICSEFolderSearchResultTableViewCell *)self defaultConstraints];
  double v5 = };
  +[NSLayoutConstraint activateConstraints:v5];

  v6 = [(ICSEFolderSearchResultTableViewCell *)self folderIconView];
  [v6 setHidden:ICAccessibilityAccessibilityLargerTextSizesEnabled()];

  v7.receiver = self;
  v7.super_class = (Class)ICSEFolderSearchResultTableViewCell;
  [(ICSEFolderSearchResultTableViewCell *)&v7 updateConstraints];
}

- (void)updateFonts
{
  uint64_t v3 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [v3 _scaledValueForValue:17.0];
  double v5 = floor(v4);

  v6 = +[UIFont systemFontOfSize:v5 weight:UIFontWeightMedium];
  objc_super v7 = objc_msgSend(v6, "ic_fontWithSingleLineA");
  v8 = [(ICSEFolderSearchResultTableViewCell *)self folderTitleLabel];
  [v8 setFont:v7];

  v9 = +[UIFont preferredFontForTextStyle:UIFontTextStyleCaption1];
  v10 = [v9 ic_fontWithSingleLineA];
  v11 = [(ICSEFolderSearchResultTableViewCell *)self accountTitleLabel];
  [v11 setFont:v10];

  if (ICAccessibilityAccessibilityLargerTextSizesEnabled()) {
    +[UIColor labelColor];
  }
  else {
  id v13 = +[UIColor secondaryLabelColor];
  }
  v12 = [(ICSEFolderSearchResultTableViewCell *)self accountTitleLabel];
  [v12 setTextColor:v13];
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

- (UILabel)accountTitleLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accountTitleLabel);

  return (UILabel *)WeakRetained;
}

- (void)setAccountTitleLabel:(id)a3
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
  objc_destroyWeak((id *)&self->_accountTitleLabel);
  objc_destroyWeak((id *)&self->_folderTitleLabel);
  objc_destroyWeak((id *)&self->_folderIconView);

  objc_storeStrong((id *)&self->_item, 0);
}

@end