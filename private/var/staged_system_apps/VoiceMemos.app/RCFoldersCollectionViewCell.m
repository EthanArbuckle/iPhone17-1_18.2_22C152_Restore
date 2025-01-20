@interface RCFoldersCollectionViewCell
- (BOOL)_needsDisclosureAccessory;
- (BOOL)_shouldUseAccessibilityTextLayout;
- (BOOL)enabled;
- (BOOL)isAccessibilityElement;
- (NSString)UUID;
- (NSString)folderName;
- (RCFoldersCollectionViewCell)initWithFrame:(CGRect)a3;
- (RCFoldersCollectionViewCellActionHandler)actionHandler;
- (UIButton)editingMoreOptionsButton;
- (UIColor)currentLabelAccessoryTintColor;
- (UIImage)iconImage;
- (id)_attributedStringForRecordingsCount:(id)a3;
- (id)_defaultCellAccessories;
- (id)_labelAccessoryTintColor;
- (id)_moreOptionsButtonAccessory;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)recordingsCountString;
- (int64_t)displayMode;
- (int64_t)folderType;
- (int64_t)recordingsCount;
- (void)_clearSecondaryAttributedText;
- (void)_setRecordingsCountText:(id)a3;
- (void)_setSecondaryAttributedTextWithRecordingsCount:(id)a3;
- (void)_showEditingMoreOptionsButton;
- (void)_showRecordingsCountLabel;
- (void)_switchToAccessibilityTextLayout:(BOOL)a3;
- (void)_transitionSpecialAccessoryToEditMode;
- (void)configureWithFolderName:(id)a3 recordingsCount:(int64_t)a4 iconImage:(id)a5 UUID:(id)a6 folderType:(int64_t)a7;
- (void)contentSizeChanged;
- (void)restyle;
- (void)setActionHandler:(id)a3;
- (void)setCurrentLabelAccessoryTintColor:(id)a3;
- (void)setDisplayMode:(int64_t)a3;
- (void)setEditingMoreOptionsButton:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFolderName:(id)a3;
- (void)setFolderType:(int64_t)a3;
- (void)setIconImage:(id)a3;
- (void)setRecordingsCount:(int64_t)a3;
- (void)setUUID:(id)a3;
- (void)updateAccessories;
- (void)updateConfigurationUsingState:(id)a3;
@end

@implementation RCFoldersCollectionViewCell

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
  if (a3) {
    double v3 = 1.0;
  }
  else {
    double v3 = 0.5;
  }
  id v4 = [(RCFoldersCollectionViewCell *)self contentView];
  [v4 setAlpha:v3];
}

- (void)setDisplayMode:(int64_t)a3
{
  if (self->_displayMode != a3)
  {
    self->_displayMode = a3;
    if (a3 == 2)
    {
      [(RCFoldersCollectionViewCell *)self _showEditingMoreOptionsButton];
    }
    else if (a3 == 1)
    {
      [(RCFoldersCollectionViewCell *)self _showRecordingsCountLabel];
    }
  }
}

- (void)setFolderName:(id)a3
{
  id v4 = a3;
  id v5 = [(RCFoldersCollectionViewCell *)self contentConfiguration];
  [v5 setText:v4];

  [(RCFoldersCollectionViewCell *)self setContentConfiguration:v5];
}

- (NSString)folderName
{
  v2 = [(RCFoldersCollectionViewCell *)self contentConfiguration];
  double v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setRecordingsCount:(int64_t)a3
{
  self->_recordingsCount = a3;
  if ((id)[(RCFoldersCollectionViewCell *)self displayMode] != (id)2)
  {
    id v4 = [(RCFoldersCollectionViewCell *)self recordingsCountString];
    [(RCFoldersCollectionViewCell *)self _setRecordingsCountText:v4];
  }
}

- (int64_t)recordingsCount
{
  return self->_recordingsCount;
}

- (id)recordingsCountString
{
  v2 = +[NSNumber numberWithInteger:self->_recordingsCount];
  double v3 = +[NSNumberFormatter localizedStringFromNumber:v2 numberStyle:0];

  return v3;
}

- (void)setIconImage:(id)a3
{
  id v4 = a3;
  id v6 = [(RCFoldersCollectionViewCell *)self contentConfiguration];
  id v5 = [v4 imageWithRenderingMode:2];

  [v6 setImage:v5];
  [(RCFoldersCollectionViewCell *)self setContentConfiguration:v6];
}

- (UIImage)iconImage
{
  v2 = [(RCFoldersCollectionViewCell *)self contentConfiguration];
  double v3 = [v2 image];

  return (UIImage *)v3;
}

- (RCFoldersCollectionViewCell)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)RCFoldersCollectionViewCell;
  double v3 = -[RCFoldersCollectionViewCell initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3)
  {
    v3->_enabled = 1;
    id v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v4 selector:"contentSizeChanged" name:UIContentSizeCategoryDidChangeNotification object:0];

    id v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v4 selector:"_boldTextStatusChanged" name:UIAccessibilityBoldTextStatusDidChangeNotification object:0];
  }
  return v4;
}

- (void)configureWithFolderName:(id)a3 recordingsCount:(int64_t)a4 iconImage:(id)a5 UUID:(id)a6 folderType:(int64_t)a7
{
  id v12 = a6;
  id v13 = a5;
  id v14 = a3;
  id v15 = [(RCFoldersCollectionViewCell *)self defaultContentConfiguration];
  [(RCFoldersCollectionViewCell *)self setContentConfiguration:v15];
  [(RCFoldersCollectionViewCell *)self setFolderName:v14];

  [(RCFoldersCollectionViewCell *)self setRecordingsCount:a4];
  [(RCFoldersCollectionViewCell *)self setIconImage:v13];

  [(RCFoldersCollectionViewCell *)self setUUID:v12];
  [(RCFoldersCollectionViewCell *)self setFolderType:a7];
  [(RCFoldersCollectionViewCell *)self updateAccessories];
}

- (void)updateAccessories
{
  id v3 = [(RCFoldersCollectionViewCell *)self _defaultCellAccessories];
  [(RCFoldersCollectionViewCell *)self setAccessories:v3];
}

- (id)_defaultCellAccessories
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = objc_alloc_init((Class)UICellAccessoryReorder);
  [v4 setDisplayedState:1];
  [v3 addObject:v4];
  id v5 = [(RCFoldersCollectionViewCell *)self _moreOptionsButtonAccessory];
  [v3 addObject:v5];
  id v6 = objc_alloc_init((Class)UICellAccessoryDelete);
  [v6 setDisplayedState:1];
  [v3 addObject:v6];
  if (![(RCFoldersCollectionViewCell *)self _shouldUseAccessibilityTextLayout])
  {
    id v7 = objc_alloc((Class)UICellAccessoryLabel);
    objc_super v8 = [(RCFoldersCollectionViewCell *)self recordingsCountString];
    id v9 = [v7 initWithText:v8];

    [v9 setDisplayedState:2];
    v10 = [(RCFoldersCollectionViewCell *)self _labelAccessoryTintColor];
    [(RCFoldersCollectionViewCell *)self setCurrentLabelAccessoryTintColor:v10];
    [v9 setTintColor:v10];
    [v3 addObject:v9];
  }
  if ([(RCFoldersCollectionViewCell *)self _needsDisclosureAccessory])
  {
    id v11 = objc_alloc_init((Class)UICellAccessoryDisclosureIndicator);
    [v11 setDisplayedState:2];
    [v3 addObject:v11];
  }
  id v12 = [v3 copy];

  return v12;
}

- (id)_moreOptionsButtonAccessory
{
  id v3 = +[UIButton buttonWithType:0];
  id v4 = +[UIImage systemImageNamed:@"ellipsis.circle"];
  [v3 setImage:v4 forState:0];

  [v3 setShowsMenuAsPrimaryAction:1];
  id v5 = +[NSBundle mainBundle];
  id v6 = [v5 localizedStringForKey:@"MORE_ACTIONS" value:&stru_100228BC8 table:0];
  [v3 setAccessibilityLabel:v6];

  id v7 = +[UIColor systemBlueColor];
  [v3 setTintColor:v7];

  objc_initWeak(&location, self);
  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  id v13 = sub_10004D68C;
  id v14 = &unk_100221938;
  objc_copyWeak(&v15, &location);
  [v3 _setMenuProvider:&v11];
  id v8 = objc_alloc((Class)UICellAccessoryCustomView);
  id v9 = [v8 initWithCustomView:v3 placement:1 v11, v12, v13, v14];
  [v9 setDisplayedState:1];
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v9;
}

- (void)contentSizeChanged
{
  if ((id)[(RCFoldersCollectionViewCell *)self displayMode] == (id)1)
  {
    [(RCFoldersCollectionViewCell *)self _shouldUseAccessibilityTextLayout];
    [(RCFoldersCollectionViewCell *)self _switchToAccessibilityTextLayout:"_switchToAccessibilityTextLayout:"];
  }
  else if ((id)[(RCFoldersCollectionViewCell *)self displayMode] == (id)2)
  {
    [(RCFoldersCollectionViewCell *)self _showEditingMoreOptionsButton];
  }
}

- (void)_showRecordingsCountLabel
{
  if ([(RCFoldersCollectionViewCell *)self _shouldUseAccessibilityTextLayout])
  {
    id v3 = [(RCFoldersCollectionViewCell *)self recordingsCountString];
    [(RCFoldersCollectionViewCell *)self _setSecondaryAttributedTextWithRecordingsCount:v3];
  }
}

- (void)_showEditingMoreOptionsButton
{
}

- (void)_transitionSpecialAccessoryToEditMode
{
  if ([(RCFoldersCollectionViewCell *)self _shouldUseAccessibilityTextLayout])
  {
    id v3 = [(RCFoldersCollectionViewCell *)self contentConfiguration];
    [v3 setSecondaryAttributedText:0];
    [(RCFoldersCollectionViewCell *)self setContentConfiguration:v3];
  }
}

- (void)updateConfigurationUsingState:(id)a3
{
  v20.receiver = self;
  v20.super_class = (Class)RCFoldersCollectionViewCell;
  id v4 = a3;
  [(RCFoldersCollectionViewCell *)&v20 updateConfigurationUsingState:v4];
  unsigned int v5 = [v4 isEditing];

  if (v5) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 1;
  }
  [(RCFoldersCollectionViewCell *)self setDisplayMode:v6];
  id v7 = [(RCFoldersCollectionViewCell *)self contentConfiguration];
  id v8 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  id v9 = [v7 secondaryTextProperties];
  [v9 setFont:v8];

  LODWORD(v9) = [(RCFoldersCollectionViewCell *)self _shouldUseAccessibilityTextLayout];
  v10 = [v7 textProperties];
  id v11 = v10;
  if (v9)
  {
    [v10 setNumberOfLines:0];

    uint64_t v12 = [v7 textProperties];
    id v13 = v12;
    uint64_t v14 = 0;
  }
  else
  {
    [v10 setNumberOfLines:1];

    uint64_t v12 = [v7 textProperties];
    id v13 = v12;
    uint64_t v14 = 4;
  }
  [v12 setLineBreakMode:v14];

  [(RCFoldersCollectionViewCell *)self setContentConfiguration:v7];
  uint64_t v15 = [(RCFoldersCollectionViewCell *)self _labelAccessoryTintColor];
  uint64_t v16 = [(RCFoldersCollectionViewCell *)self currentLabelAccessoryTintColor];
  uint64_t v17 = v16 | v15;

  v18 = [(RCFoldersCollectionViewCell *)self currentLabelAccessoryTintColor];
  unsigned __int8 v19 = [v18 isEqual:v15];

  if (v17 && (v19 & 1) == 0) {
    [(RCFoldersCollectionViewCell *)self updateAccessories];
  }
}

- (void)_setRecordingsCountText:(id)a3
{
  id v4 = a3;
  if ([(RCFoldersCollectionViewCell *)self _shouldUseAccessibilityTextLayout]) {
    [(RCFoldersCollectionViewCell *)self _setSecondaryAttributedTextWithRecordingsCount:v4];
  }
  else {
    [(RCFoldersCollectionViewCell *)self updateAccessories];
  }
}

- (void)_switchToAccessibilityTextLayout:(BOOL)a3
{
  BOOL v3 = a3;
  [(RCFoldersCollectionViewCell *)self updateAccessories];
  uint64_t v5 = [(RCFoldersCollectionViewCell *)self recordingsCountString];
  id v6 = (id)v5;
  if (v3) {
    [(RCFoldersCollectionViewCell *)self _setSecondaryAttributedTextWithRecordingsCount:v5];
  }
  else {
    [(RCFoldersCollectionViewCell *)self _clearSecondaryAttributedText];
  }
}

- (void)_setSecondaryAttributedTextWithRecordingsCount:(id)a3
{
  id v4 = a3;
  id v6 = [(RCFoldersCollectionViewCell *)self contentConfiguration];
  uint64_t v5 = [(RCFoldersCollectionViewCell *)self _attributedStringForRecordingsCount:v4];

  [v6 setSecondaryAttributedText:v5];
  [(RCFoldersCollectionViewCell *)self setContentConfiguration:v6];
}

- (void)_clearSecondaryAttributedText
{
  id v3 = [(RCFoldersCollectionViewCell *)self contentConfiguration];
  [v3 setSecondaryAttributedText:0];
  [(RCFoldersCollectionViewCell *)self setContentConfiguration:v3];
}

- (id)_attributedStringForRecordingsCount:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[RCRecorderStyleProvider sharedStyleProvider];
  double v6 = 0.0;
  if ([(RCFoldersCollectionViewCell *)self _shouldUseAccessibilityTextLayout])
  {
    [v5 sidebarCollectionViewCellAXHyphenationFactor];
    double v6 = v7;
  }
  id v8 = objc_alloc((Class)NSAttributedString);
  NSAttributedStringDocumentAttributeKey v13 = NSHyphenationFactorDocumentAttribute;
  id v9 = +[NSNumber numberWithDouble:v6];
  uint64_t v14 = v9;
  v10 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  id v11 = [v8 initWithString:v4 attributes:v10];

  return v11;
}

- (BOOL)_shouldUseAccessibilityTextLayout
{
  v2 = +[RCRecorderStyleProvider sharedStyleProvider];
  unsigned __int8 v3 = [v2 isAccessibilityLargerTextSizeEnabled];

  return v3;
}

- (id)_labelAccessoryTintColor
{
  v2 = [(RCFoldersCollectionViewCell *)self contentConfiguration];
  unsigned __int8 v3 = [v2 textProperties];
  id v4 = [v3 resolvedColor];

  uint64_t v5 = +[UIColor labelColor];
  unsigned __int8 v6 = [v4 isEqual:v5];

  if (v6) {
    id v7 = 0;
  }
  else {
    id v7 = v4;
  }

  return v7;
}

- (BOOL)_needsDisclosureAccessory
{
  v2 = +[RCRecorderStyleProvider sharedStyleProvider];
  unsigned __int8 v3 = [v2 sidebarCollectionViewNeedsDisclosureAccessory];

  return v3;
}

- (void)restyle
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  unsigned __int8 v3 = [(RCFoldersCollectionViewCell *)self configurationState];
  unsigned __int8 v4 = [v3 isEditing];

  if (v4)
  {
    uint64_t v5 = [(RCFoldersCollectionViewCell *)self folderName];
    unsigned __int8 v6 = +[NSString stringWithFormat:@"%@", v5];
  }
  else
  {
    id v7 = +[NSBundle mainBundle];
    id v8 = [v7 localizedStringForKey:@"AX_NUMBER_OF_RECORDINGS_IN_FOLDER" value:&stru_100228BC8 table:0];
    uint64_t v5 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, [(RCFoldersCollectionViewCell *)self recordingsCount]);

    id v9 = [(RCFoldersCollectionViewCell *)self folderName];
    unsigned __int8 v6 = +[NSString stringWithFormat:@"%@, %@", v9, v5];
  }

  return v6;
}

- (id)accessibilityValue
{
  return 0;
}

- (NSString)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
}

- (int64_t)folderType
{
  return self->_folderType;
}

- (void)setFolderType:(int64_t)a3
{
  self->_folderType = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (RCFoldersCollectionViewCellActionHandler)actionHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionHandler);

  return (RCFoldersCollectionViewCellActionHandler *)WeakRetained;
}

- (void)setActionHandler:(id)a3
{
}

- (int64_t)displayMode
{
  return self->_displayMode;
}

- (UIButton)editingMoreOptionsButton
{
  return self->_editingMoreOptionsButton;
}

- (void)setEditingMoreOptionsButton:(id)a3
{
}

- (UIColor)currentLabelAccessoryTintColor
{
  return self->_currentLabelAccessoryTintColor;
}

- (void)setCurrentLabelAccessoryTintColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLabelAccessoryTintColor, 0);
  objc_storeStrong((id *)&self->_editingMoreOptionsButton, 0);
  objc_destroyWeak((id *)&self->_actionHandler);

  objc_storeStrong((id *)&self->_UUID, 0);
}

@end