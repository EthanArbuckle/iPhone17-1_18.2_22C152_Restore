@interface ICSENoteTitleView
+ (id)newNoteTitleView;
- (BOOL)hasMultipleAccounts;
- (ICFolder)folder;
- (ICNote)note;
- (NSArray)alternateConstraintsForAXLargerTextSizes;
- (NSArray)defaultConstraints;
- (NSDictionary)itemTitleAttributes;
- (NSLayoutConstraint)dashLabelZeroWidthConstraint;
- (NSLayoutConstraint)folderIconSpacingZeroWidthConstraint;
- (NSLayoutConstraint)folderIconZeroHeightConstraint;
- (NSLayoutConstraint)folderIconZeroWidthConstraint;
- (NSLayoutConstraint)folderLabelZeroHeightConstraint;
- (NSLayoutConstraint)folderLabelZeroWidthConstraint;
- (UIImageView)arrowImageView;
- (UIImageView)folderIcon;
- (UILabel)accountLabel;
- (UILabel)dashLabel;
- (UILabel)folderLabel;
- (UILabel)noteLabel;
- (id)accessibilityLabel;
- (void)awakeFromNib;
- (void)contentSizeCategoryChanged:(id)a3;
- (void)dealloc;
- (void)setAccountLabel:(id)a3;
- (void)setAlternateConstraintsForAXLargerTextSizes:(id)a3;
- (void)setArrowImageView:(id)a3;
- (void)setDashLabel:(id)a3;
- (void)setDashLabelZeroWidthConstraint:(id)a3;
- (void)setDefaultConstraints:(id)a3;
- (void)setFolder:(id)a3;
- (void)setFolderIcon:(id)a3;
- (void)setFolderIconSpacingZeroWidthConstraint:(id)a3;
- (void)setFolderIconZeroHeightConstraint:(id)a3;
- (void)setFolderIconZeroWidthConstraint:(id)a3;
- (void)setFolderLabel:(id)a3;
- (void)setFolderLabelVisible:(BOOL)a3;
- (void)setFolderLabelZeroHeightConstraint:(id)a3;
- (void)setFolderLabelZeroWidthConstraint:(id)a3;
- (void)setHasMultipleAccounts:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setNote:(id)a3;
- (void)setNote:(id)a3 folder:(id)a4 hasMultipleAccounts:(BOOL)a5;
- (void)setNoteLabel:(id)a3;
- (void)setupLabelsAndIcons;
- (void)updateConstraints;
- (void)updateFonts;
@end

@implementation ICSENoteTitleView

- (void)awakeFromNib
{
  v17.receiver = self;
  v17.super_class = (Class)ICSENoteTitleView;
  [(ICSENoteTitleView *)&v17 awakeFromNib];
  v3 = [(ICSENoteTitleView *)self note];
  v4 = [(ICSENoteTitleView *)self folder];
  [(ICSENoteTitleView *)self setNote:v3 folder:v4 hasMultipleAccounts:0];

  [(ICSENoteTitleView *)self updateFonts];
  v5 = +[UIColor secondaryLabelColor];
  v6 = [(ICSENoteTitleView *)self accountLabel];
  [v6 setTextColor:v5];

  v7 = +[UIColor labelColor];
  v8 = [(ICSENoteTitleView *)self noteLabel];
  [v8 setTextColor:v7];

  v9 = +[UIColor labelColor];
  v10 = [(ICSENoteTitleView *)self folderLabel];
  [v10 setTextColor:v9];

  v11 = +[UIColor tertiaryLabelColor];
  v12 = [(ICSENoteTitleView *)self arrowImageView];
  [v12 setTintColor:v11];

  if (+[UIDevice ic_isVision])
  {
    uint64_t v13 = +[UIColor labelColor];
  }
  else
  {
    if (UIAccessibilityDarkerSystemColorsEnabled()) {
      +[UIColor ICDarkenedTintColor];
    }
    else {
    uint64_t v13 = +[UIColor ICTintColor];
    }
  }
  v14 = (void *)v13;
  v15 = [(ICSENoteTitleView *)self folderIcon];
  [v15 setTintColor:v14];

  v16 = +[NSNotificationCenter defaultCenter];
  [v16 addObserver:self selector:"contentSizeCategoryChanged:" name:UIContentSizeCategoryDidChangeNotification object:0];
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICSENoteTitleView;
  [(ICSENoteTitleView *)&v4 dealloc];
}

- (void)setNote:(id)a3 folder:(id)a4 hasMultipleAccounts:(BOOL)a5
{
  v8 = (ICNote *)a3;
  v9 = (ICFolder *)a4;
  note = self->_note;
  self->_note = v8;
  v11 = v8;

  folder = self->_folder;
  self->_folder = v9;

  self->_hasMultipleAccounts = a5;

  [(ICSENoteTitleView *)self setupLabelsAndIcons];
}

- (void)setupLabelsAndIcons
{
  v3 = [(ICSENoteTitleView *)self note];

  if (v3)
  {
    objc_super v4 = [(ICSENoteTitleView *)self note];
    id v31 = [v4 title];

    v5 = [(ICSENoteTitleView *)self note];
    BOOL v6 = 0;
    v7 = 0;
    int v8 = 1144766464;
    goto LABEL_11;
  }
  id v31 = +[ICNote defaultTitleForEmptyNote];
  v7 = [(ICSENoteTitleView *)self folder];
  if (!v7) {
    goto LABEL_8;
  }
  v9 = [(ICSENoteTitleView *)self folder];
  unsigned __int8 v10 = [v9 isDefaultFolderForAccount];

  if ((v10 & 1) == 0)
  {
    v11 = [(ICSENoteTitleView *)self folder];
    v7 = [v11 localizedTitle];

    if (v7)
    {
      BOOL v6 = [v7 length] != 0;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
    goto LABEL_9;
  }
  BOOL v6 = 0;
  v7 = 0;
LABEL_9:
  v12 = [(ICSENoteTitleView *)self folder];

  if (!v12)
  {
    int v8 = 1148043264;
LABEL_14:
    v15 = +[ICNoteContext sharedContext];
    v16 = [v15 managedObjectContext];
    objc_super v17 = +[ICAccount defaultAccountInContext:v16];

    v14 = [v17 localizedName];

    goto LABEL_15;
  }
  v5 = [(ICSENoteTitleView *)self folder];
  int v8 = 1148043264;
LABEL_11:
  uint64_t v13 = [v5 account];
  v14 = [v13 localizedName];

  if (!v14) {
    goto LABEL_14;
  }
LABEL_15:
  if (![(ICSENoteTitleView *)self hasMultipleAccounts] || !v14)
  {

    v14 = &stru_1000F2510;
  }
  v18 = [(ICSENoteTitleView *)self folder];
  v19 = [v18 systemImageName];
  v20 = +[UIImage ic_systemImageNamed:v19];
  v21 = [(ICSENoteTitleView *)self folderIcon];
  [v21 setImage:v20];

  [(ICSENoteTitleView *)self setFolderLabelVisible:v6];
  v22 = [(ICSENoteTitleView *)self noteLabel];
  [v22 setText:v31];

  v23 = [(ICSENoteTitleView *)self noteLabel];
  LODWORD(v24) = v8;
  [v23 setContentCompressionResistancePriority:0 forAxis:v24];

  v25 = [(ICSENoteTitleView *)self accountLabel];
  [v25 setText:v14];

  v26 = [(ICSENoteTitleView *)self folderLabel];
  [v26 setText:v7];

  v27 = [(ICSENoteTitleView *)self arrowImageView];
  v28 = [v27 image];
  v29 = [v28 imageFlippedForRightToLeftLayoutDirection];
  v30 = [(ICSENoteTitleView *)self arrowImageView];
  [v30 setImage:v29];
}

- (void)setFolderLabelVisible:(BOOL)a3
{
  BOOL v3 = a3;
  float v5 = 1.0;
  if (a3) {
    float v6 = 1.0;
  }
  else {
    float v6 = 999.0;
  }
  v7 = [(ICSENoteTitleView *)self folderLabelZeroWidthConstraint];
  *(float *)&double v8 = v6;
  [v7 setPriority:v8];

  v9 = [(ICSENoteTitleView *)self dashLabelZeroWidthConstraint];
  *(float *)&double v10 = v6;
  [v9 setPriority:v10];

  v11 = [(ICSENoteTitleView *)self folderIconZeroWidthConstraint];
  *(float *)&double v12 = v6;
  [v11 setPriority:v12];

  uint64_t v13 = [(ICSENoteTitleView *)self folderIconSpacingZeroWidthConstraint];
  *(float *)&double v14 = v6;
  [v13 setPriority:v14];

  if (!v3)
  {
    if (ICAccessibilityAccessibilityLargerTextSizesEnabled()) {
      float v5 = 999.0;
    }
    else {
      float v5 = 1.0;
    }
  }
  v15 = [(ICSENoteTitleView *)self folderIconZeroHeightConstraint];
  *(float *)&double v16 = v5;
  [v15 setPriority:v16];

  objc_super v17 = [(ICSENoteTitleView *)self folderLabelZeroHeightConstraint];
  *(float *)&double v18 = v5;
  [v17 setPriority:v18];

  id v19 = [(ICSENoteTitleView *)self folderIcon];
  [v19 setHidden:!v3];
}

- (NSDictionary)itemTitleAttributes
{
  itemTitleAttributes = self->_itemTitleAttributes;
  if (!itemTitleAttributes)
  {
    NSAttributedStringKey v8 = NSForegroundColorAttributeName;
    objc_super v4 = +[UIColor darkGrayColor];
    v9 = v4;
    float v5 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    float v6 = self->_itemTitleAttributes;
    self->_itemTitleAttributes = v5;

    itemTitleAttributes = self->_itemTitleAttributes;
  }

  return itemTitleAttributes;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ICSENoteTitleView;
  -[ICSENoteTitleView setHighlighted:](&v7, "setHighlighted:");
  double v5 = 0.3;
  v6[1] = 3221225472;
  v6[0] = _NSConcreteStackBlock;
  v6[2] = sub_100013ED4;
  v6[3] = &unk_1000EE510;
  if (!v3) {
    double v5 = 1.0;
  }
  v6[4] = self;
  *(double *)&v6[5] = v5;
  +[UIView animateWithDuration:v6 animations:0.15];
}

+ (id)newNoteTitleView
{
  BOOL v3 = +[NSBundle mainBundle];
  objc_super v4 = NSStringFromClass((Class)a1);
  double v5 = [v3 loadNibNamed:v4 owner:a1 options:0];

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
      v11 = *(void **)(*((void *)&v14 + 1) + 8 * v10);
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
  +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "result != ((void *)0)", "+[ICSENoteTitleView newNoteTitleView]", 1, 0, @"Unable to load title view", (void)v14);
  id v12 = 0;
LABEL_12:
  [v12 setTranslatesAutoresizingMaskIntoConstraints:1 v14];

  return v12;
}

- (void)contentSizeCategoryChanged:(id)a3
{
  [(ICSENoteTitleView *)self updateFonts];
  [(ICSENoteTitleView *)self setNeedsUpdateConstraints];

  [(ICSENoteTitleView *)self setNeedsLayout];
}

- (void)updateFonts
{
  BOOL v3 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [v3 _scaledValueForValue:17.0];
  double v5 = floor(v4);

  id v6 = +[UIFont systemFontOfSize:v5 weight:UIFontWeightRegular];
  id v7 = [v6 ic_fontWithSingleLineA];
  id v8 = [(ICSENoteTitleView *)self noteLabel];
  [v8 setFont:v7];

  uint64_t v9 = +[UIFont systemFontOfSize:v5 weight:UIFontWeightRegular];
  uint64_t v10 = [v9 ic_fontWithSingleLineA];
  v11 = [(ICSENoteTitleView *)self folderLabel];
  [v11 setFont:v10];

  id v12 = +[UIFont systemFontOfSize:v5 weight:UIFontWeightRegular];
  uint64_t v13 = [v12 ic_fontWithSingleLineA];
  long long v14 = [(ICSENoteTitleView *)self dashLabel];
  [v14 setFont:v13];

  long long v15 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  long long v16 = [v15 ic_fontWithSingleLineA];
  long long v17 = [(ICSENoteTitleView *)self accountLabel];
  [v17 setFont:v16];

  id v19 = +[UIColor secondaryLabelColor];
  double v18 = [(ICSENoteTitleView *)self accountLabel];
  [v18 setTextColor:v19];
}

- (void)updateConstraints
{
  if (ICAccessibilityAccessibilityLargerTextSizesEnabled())
  {
    BOOL v3 = [(ICSENoteTitleView *)self defaultConstraints];
    +[NSLayoutConstraint deactivateConstraints:v3];

    [(ICSENoteTitleView *)self alternateConstraintsForAXLargerTextSizes];
  }
  else
  {
    double v4 = [(ICSENoteTitleView *)self alternateConstraintsForAXLargerTextSizes];
    +[NSLayoutConstraint deactivateConstraints:v4];

    [(ICSENoteTitleView *)self defaultConstraints];
  double v5 = };
  +[NSLayoutConstraint activateConstraints:v5];

  v6.receiver = self;
  v6.super_class = (Class)ICSENoteTitleView;
  [(ICSENoteTitleView *)&v6 updateConstraints];
}

- (id)accessibilityLabel
{
  BOOL v3 = [(ICSENoteTitleView *)self noteLabel];
  double v4 = [v3 text];
  double v5 = [(ICSENoteTitleView *)self accountLabel];
  id v8 = [v5 text];
  objc_super v6 = __ICAccessibilityStringForVariables();

  return v6;
}

- (ICNote)note
{
  return self->_note;
}

- (void)setNote:(id)a3
{
}

- (ICFolder)folder
{
  return self->_folder;
}

- (void)setFolder:(id)a3
{
}

- (BOOL)hasMultipleAccounts
{
  return self->_hasMultipleAccounts;
}

- (void)setHasMultipleAccounts:(BOOL)a3
{
  self->_hasMultipleAccounts = a3;
}

- (UILabel)accountLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accountLabel);

  return (UILabel *)WeakRetained;
}

- (void)setAccountLabel:(id)a3
{
}

- (UILabel)noteLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_noteLabel);

  return (UILabel *)WeakRetained;
}

- (void)setNoteLabel:(id)a3
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

- (UILabel)folderLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_folderLabel);

  return (UILabel *)WeakRetained;
}

- (void)setFolderLabel:(id)a3
{
}

- (UIImageView)folderIcon
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_folderIcon);

  return (UIImageView *)WeakRetained;
}

- (void)setFolderIcon:(id)a3
{
}

- (NSLayoutConstraint)folderLabelZeroWidthConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_folderLabelZeroWidthConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setFolderLabelZeroWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)dashLabelZeroWidthConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dashLabelZeroWidthConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setDashLabelZeroWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)folderIconZeroWidthConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_folderIconZeroWidthConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setFolderIconZeroWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)folderIconSpacingZeroWidthConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_folderIconSpacingZeroWidthConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setFolderIconSpacingZeroWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)folderIconZeroHeightConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_folderIconZeroHeightConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setFolderIconZeroHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)folderLabelZeroHeightConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_folderLabelZeroHeightConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setFolderLabelZeroHeightConstraint:(id)a3
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

- (UIImageView)arrowImageView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_arrowImageView);

  return (UIImageView *)WeakRetained;
}

- (void)setArrowImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_arrowImageView);
  objc_storeStrong((id *)&self->_alternateConstraintsForAXLargerTextSizes, 0);
  objc_storeStrong((id *)&self->_defaultConstraints, 0);
  objc_destroyWeak((id *)&self->_folderLabelZeroHeightConstraint);
  objc_destroyWeak((id *)&self->_folderIconZeroHeightConstraint);
  objc_destroyWeak((id *)&self->_folderIconSpacingZeroWidthConstraint);
  objc_destroyWeak((id *)&self->_folderIconZeroWidthConstraint);
  objc_destroyWeak((id *)&self->_dashLabelZeroWidthConstraint);
  objc_destroyWeak((id *)&self->_folderLabelZeroWidthConstraint);
  objc_destroyWeak((id *)&self->_folderIcon);
  objc_destroyWeak((id *)&self->_folderLabel);
  objc_destroyWeak((id *)&self->_dashLabel);
  objc_destroyWeak((id *)&self->_noteLabel);
  objc_destroyWeak((id *)&self->_accountLabel);
  objc_storeStrong((id *)&self->_folder, 0);
  objc_storeStrong((id *)&self->_note, 0);

  objc_storeStrong((id *)&self->_itemTitleAttributes, 0);
}

@end