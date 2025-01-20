@interface ICFolderOutlineCollectionViewCell
+ (NSManagedObjectContext)legacyWorkerContext;
+ (NSManagedObjectContext)modernWorkerContext;
+ (OS_dispatch_queue)updateCountsQueue;
- (BOOL)_accessibilityOnlyComparesByXAxis;
- (BOOL)allowsEditing;
- (BOOL)allowsExpandCollapse;
- (BOOL)allowsReordering;
- (BOOL)forceDisabledAppearance;
- (BOOL)hasDisclosureIndicator;
- (BOOL)hasGroupInset;
- (BOOL)isAccessibilityElement;
- (BOOL)isRecentlyCreated;
- (BOOL)isSmartFolder;
- (BOOL)shouldIndentNoteCount;
- (BOOL)shouldUseAccompaniedSidebarCellConfiguration;
- (BOOL)showsCheckmark;
- (BOOL)showsNoteCount;
- (ICAccessibilityCustomActionsDelegate)accessibilityCustomActionsDelegate;
- (ICFolderOutlineCollectionViewCell)initWithFrame:(CGRect)a3;
- (ICNAViewController)presentingViewController;
- (ICNoteContainer)noteContainer;
- (ICVirtualSmartFolderItemIdentifier)virtualSmartFolder;
- (NSNumber)noteCount;
- (NSNumber)subfoldersCount;
- (NoteCollectionObject)noteCollection;
- (UIButton)actionButton;
- (UIButton)unsupportedFolderButton;
- (id)accessibilityCustomActions;
- (id)accessibilityDragSourceDescriptors;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)createActionMenu;
- (id)unsupportedFolderInfoButtonTapHandler;
- (unint64_t)accessibilityTraits;
- (void)onUnsupportedFolderInfoPressed:(id)a3;
- (void)setAccessibilityCustomActionsDelegate:(id)a3;
- (void)setActionButton:(id)a3;
- (void)setAllowsExpandCollapse:(BOOL)a3;
- (void)setForceDisabledAppearance:(BOOL)a3;
- (void)setHasDisclosureIndicator:(BOOL)a3;
- (void)setHasGroupInset:(BOOL)a3;
- (void)setNoteCollection:(id)a3;
- (void)setNoteContainer:(id)a3;
- (void)setNoteCount:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setRecentlyCreated:(BOOL)a3;
- (void)setShouldIndentNoteCount:(BOOL)a3;
- (void)setShowsCheckmark:(BOOL)a3;
- (void)setShowsNoteCount:(BOOL)a3;
- (void)setSubfoldersCount:(id)a3;
- (void)setUnsupportedFolderButton:(id)a3;
- (void)setUnsupportedFolderInfoButtonTapHandler:(id)a3;
- (void)setVirtualSmartFolder:(id)a3;
- (void)updateAccessories;
- (void)updateAccessoriesUsingState:(id)a3;
- (void)updateActionMenu;
- (void)updateBackgroundConfigurationUsingState:(id)a3;
- (void)updateConfigurationUsingState:(id)a3;
- (void)updateContentConfigurationUsingState:(id)a3;
- (void)updateNoteCount;
- (void)updateSubfolderCount;
@end

@implementation ICFolderOutlineCollectionViewCell

- (ICFolderOutlineCollectionViewCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICFolderOutlineCollectionViewCell;
  v3 = -[ICFolderOutlineCollectionViewCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_showsNoteCount = 1;
    v3->_allowsExpandCollapse = 1;
    [(ICFolderOutlineCollectionViewCell *)v3 setAutomaticallyUpdatesContentConfiguration:0];
  }
  return v4;
}

- (void)setRecentlyCreated:(BOOL)a3
{
  BOOL v3 = a3;
  self->_recentlyCreated = a3;
  [(ICFolderOutlineCollectionViewCell *)self setNeedsUpdateConfiguration];
  if (v3) {
    dispatchMainAfterDelay();
  }
}

- (void)setNoteCollection:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_noteCollection, a3);
  if (v7)
  {
    noteContainer = self->_noteContainer;
    self->_noteContainer = 0;

    virtualSmartFolder = self->_virtualSmartFolder;
    self->_virtualSmartFolder = 0;
  }
  [(ICFolderOutlineCollectionViewCell *)self ic_annotateWithNoteCollection:v7];
  [(ICFolderOutlineCollectionViewCell *)self updateTextAndStatus];
  [(ICFolderOutlineCollectionViewCell *)self updateSubfolderCount];
  [(ICFolderOutlineCollectionViewCell *)self updateNoteCount];
}

- (void)setNoteContainer:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_noteContainer, a3);
  if (v7)
  {
    noteCollection = self->_noteCollection;
    self->_noteCollection = 0;

    virtualSmartFolder = self->_virtualSmartFolder;
    self->_virtualSmartFolder = 0;
  }
  [(ICFolderOutlineCollectionViewCell *)self ic_annotateWithNoteContainer:v7];
  [(ICFolderOutlineCollectionViewCell *)self updateTextAndStatus];
  [(ICFolderOutlineCollectionViewCell *)self updateSubfolderCount];
  [(ICFolderOutlineCollectionViewCell *)self updateNoteCount];
}

- (void)setVirtualSmartFolder:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_virtualSmartFolder, a3);
  if (v7)
  {
    noteCollection = self->_noteCollection;
    self->_noteCollection = 0;

    noteContainer = self->_noteContainer;
    self->_noteContainer = 0;
  }
  [(ICFolderOutlineCollectionViewCell *)self updateTextAndStatus];
  [(ICFolderOutlineCollectionViewCell *)self updateSubfolderCount];
  [(ICFolderOutlineCollectionViewCell *)self updateNoteCount];
}

- (void)setShowsCheckmark:(BOOL)a3
{
  self->_showsCheckmark = a3;
  [(ICFolderOutlineCollectionViewCell *)self updateAccessories];
}

- (void)updateSubfolderCount
{
  BOOL v3 = [(id)objc_opt_class() updateCountsQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B43FC;
  block[3] = &unk_100625AF0;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)updateNoteCount
{
  BOOL v3 = [(id)objc_opt_class() updateCountsQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B498C;
  block[3] = &unk_100625AF0;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)updateConfigurationUsingState:(id)a3
{
  id v4 = a3;
  if (([v4 isReordering] & 1) == 0)
  {
    [(ICFolderOutlineCollectionViewCell *)self updateAccessoriesUsingState:v4];
    [(ICFolderOutlineCollectionViewCell *)self updateSubfolderCount];
  }
  [(ICFolderOutlineCollectionViewCell *)self updateContentConfigurationUsingState:v4];
  [(ICFolderOutlineCollectionViewCell *)self updateBackgroundConfigurationUsingState:v4];
}

- (void)updateAccessories
{
  id v3 = [(ICFolderOutlineCollectionViewCell *)self configurationState];
  [(ICFolderOutlineCollectionViewCell *)self updateAccessoriesUsingState:v3];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = [(ICFolderOutlineCollectionViewCell *)self noteCollection];
  if (v3) {
    [(ICFolderOutlineCollectionViewCell *)self noteCollection];
  }
  else {
  id v4 = [(ICFolderOutlineCollectionViewCell *)self noteContainer];
  }
  v5 = [v4 titleForTableViewCell];

  objc_super v6 = [(ICFolderOutlineCollectionViewCell *)self virtualSmartFolder];
  id v7 = [v6 title];

  unsigned int v8 = [(ICFolderOutlineCollectionViewCell *)self isSmartFolder];
  v9 = @"Smart Folder";
  if (!v8) {
    v9 = 0;
  }
  v10 = v9;
  v11 = [(ICFolderOutlineCollectionViewCell *)self noteContainer];
  v12 = 0;
  if ([v11 isSharedViaICloud])
  {
    v13 = [(ICFolderOutlineCollectionViewCell *)self noteContainer];
    v12 = [v13 shareDescription];
  }
  v14 = __ICAccessibilityStringForVariables();

  return v14;
}

- (id)accessibilityValue
{
  id v3 = +[NSBundle mainBundle];
  id v4 = [v3 localizedStringForKey:@"Subfolder of %@" value:&stru_10063F3D8 table:0];

  objc_opt_class();
  v5 = [(ICFolderOutlineCollectionViewCell *)self noteContainer];
  objc_super v6 = ICDynamicCast();

  id v7 = [v6 parent];
  unsigned int v8 = [v7 title];

  if (v8)
  {
    v9 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v4, v8);
  }
  else
  {
    v9 = 0;
  }
  if ([(ICFolderOutlineCollectionViewCell *)self showsNoteCount])
  {
    v10 = +[NSBundle mainBundle];
    v11 = [v10 localizedStringForKey:@"ICAX_NUM_NOTES_%lu" value:&stru_10063F3D8 table:0];

    v12 = [(ICFolderOutlineCollectionViewCell *)self noteCount];
    v13 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v11, [v12 unsignedIntValue]);
  }
  else
  {
    v13 = 0;
  }
  v14 = [(ICFolderOutlineCollectionViewCell *)self subfoldersCount];
  unsigned int v15 = [v14 unsignedIntValue];

  if (v15)
  {
    v16 = +[NSBundle mainBundle];
    v17 = [v16 localizedStringForKey:@"NUM_SUBFOLDERS_%lu" value:&stru_10063F3D8 table:0];

    v18 = [(ICFolderOutlineCollectionViewCell *)self subfoldersCount];
    v19 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v17, [v18 unsignedIntValue]);
  }
  else
  {
    v19 = 0;
  }
  v20 = __ICAccessibilityStringForVariables();

  return v20;
}

- (unint64_t)accessibilityTraits
{
  v8.receiver = self;
  v8.super_class = (Class)ICFolderOutlineCollectionViewCell;
  unint64_t v3 = [(ICFolderOutlineCollectionViewCell *)&v8 accessibilityTraits];
  unsigned int v4 = [(ICFolderOutlineCollectionViewCell *)self isSelected];
  UIAccessibilityTraits v5 = UIAccessibilityTraitSelected;
  if (!v4) {
    UIAccessibilityTraits v5 = 0;
  }
  unint64_t v6 = v5 | v3;
  if (![(ICFolderOutlineCollectionViewCell *)self allowsEditing]
    && [(ICFolderOutlineCollectionViewCell *)self isEditing])
  {
    v6 |= UIAccessibilityTraitNotEnabled;
  }
  return v6;
}

- (id)accessibilityDragSourceDescriptors
{
  if ([(ICFolderOutlineCollectionViewCell *)self allowsEditing])
  {
    v5.receiver = self;
    v5.super_class = (Class)ICFolderOutlineCollectionViewCell;
    unint64_t v3 = [(ICFolderOutlineCollectionViewCell *)&v5 accessibilityDragSourceDescriptors];
  }
  else
  {
    unint64_t v3 = 0;
  }

  return v3;
}

- (id)accessibilityCustomActions
{
  unint64_t v3 = [(ICFolderOutlineCollectionViewCell *)self accessibilityCustomActionsDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    objc_super v5 = [(ICFolderOutlineCollectionViewCell *)self noteContainer];
    if (v5) {
      [(ICFolderOutlineCollectionViewCell *)self noteContainer];
    }
    else {
    id v7 = [(ICFolderOutlineCollectionViewCell *)self noteCollection];
    }
    objc_super v8 = [v7 objectID];

    v9 = [(ICFolderOutlineCollectionViewCell *)self accessibilityCustomActionsDelegate];
    unint64_t v6 = [v9 customAccessibilityActionsForObjectID:v8 galleryView:0];
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)_accessibilityOnlyComparesByXAxis
{
  return 1;
}

+ (OS_dispatch_queue)updateCountsQueue
{
  if (qword_1006AA1C8 != -1) {
    dispatch_once(&qword_1006AA1C8, &stru_100628718);
  }
  v2 = (void *)qword_1006AA1D0;

  return (OS_dispatch_queue *)v2;
}

+ (NSManagedObjectContext)modernWorkerContext
{
  if (qword_1006AA1D8 != -1) {
    dispatch_once(&qword_1006AA1D8, &stru_100628738);
  }
  v2 = (void *)qword_1006AA1E0;

  return (NSManagedObjectContext *)v2;
}

+ (NSManagedObjectContext)legacyWorkerContext
{
  if (qword_1006AA1E8 != -1) {
    dispatch_once(&qword_1006AA1E8, &stru_100628758);
  }
  v2 = (void *)qword_1006AA1F0;

  return (NSManagedObjectContext *)v2;
}

- (void)updateAccessoriesUsingState:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[NSMutableArray array];
  if ([(ICFolderOutlineCollectionViewCell *)self showsCheckmark])
  {
    id v6 = objc_alloc_init((Class)UICellAccessoryCheckmark);
    [v6 setDisplayedState:2];
    [v5 addObject:v6];
  }
  if (![(ICFolderOutlineCollectionViewCell *)self showsNoteCount]
    || (ICAccessibilityAccessibilityLargerTextSizesEnabled() & 1) != 0
    || ([(ICFolderOutlineCollectionViewCell *)self noteContainer],
        id v7 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v8 = [v7 isUnsupported],
        v7,
        (v8 & 1) != 0))
  {
    int v9 = 0;
  }
  else
  {
    v43 = [(ICFolderOutlineCollectionViewCell *)self noteCount];
    if (v43)
    {
      v44 = [(ICFolderOutlineCollectionViewCell *)self noteCount];
      v45 = +[NSString localizedStringWithFormat:@"%@", v44];
    }
    else
    {
      v45 = &stru_10063F3D8;
    }

    id v46 = [objc_alloc((Class)UICellAccessoryLabel) initWithText:v45];
    [v46 setDisplayedState:2];
    [v5 addObject:v46];

    int v9 = 1;
  }
  if ([(ICFolderOutlineCollectionViewCell *)self allowsExpandCollapse])
  {
    v10 = [(ICFolderOutlineCollectionViewCell *)self subfoldersCount];
    if ([v10 unsignedIntValue])
    {
      v11 = [(ICFolderOutlineCollectionViewCell *)self noteContainer];
      unsigned __int8 v12 = [v11 isUnsupported];

      if ((v12 & 1) == 0)
      {
        id v13 = objc_alloc_init((Class)UICellAccessoryOutlineDisclosure);
        [v13 setStyle:2];
        id v14 = v13;
LABEL_15:
        [v14 setDisplayedState:2];
LABEL_19:
        [v5 addObject:v13];

        goto LABEL_20;
      }
    }
    else
    {
    }
  }
  if ([(ICFolderOutlineCollectionViewCell *)self hasDisclosureIndicator])
  {
    unsigned int v15 = [(ICFolderOutlineCollectionViewCell *)self noteContainer];
    unsigned __int8 v16 = [v15 isUnsupported];

    if (v16) {
      goto LABEL_20;
    }
    id v14 = objc_alloc_init((Class)UICellAccessoryDisclosureIndicator);
    id v13 = v14;
    goto LABEL_15;
  }
  if (v9 && [(ICFolderOutlineCollectionViewCell *)self shouldIndentNoteCount])
  {
    id v17 = objc_alloc((Class)UICellAccessoryCustomView);
    v18 = objc_opt_new();
    id v13 = [v17 initWithCustomView:v18 placement:1];

    [v13 setDisplayedState:2];
    v19 = (objc_class *)objc_opt_class();
    v20 = UICellAccessoryPositionAfterAccessoryOfClass(v19);
    [v13 setPosition:v20];

    [v13 setReservedLayoutWidth:UICellAccessoryStandardDimensionDisclosure];
    goto LABEL_19;
  }
LABEL_20:
  id v21 = [(ICFolderOutlineCollectionViewCell *)self noteContainer];
  if ([v21 isUnsupported])
  {
    v22 = [(ICFolderOutlineCollectionViewCell *)self unsupportedFolderInfoButtonTapHandler];

    if (!v22) {
      goto LABEL_26;
    }
    v23 = [(ICFolderOutlineCollectionViewCell *)self unsupportedFolderButton];

    if (!v23)
    {
      v24 = +[UIButtonConfiguration plainButtonConfiguration];
      v25 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
      v26 = +[UIImageSymbolConfiguration configurationWithFont:v25];

      v27 = +[UIImage systemImageNamed:@"info.circle" withConfiguration:v26];
      [v24 setImage:v27];

      v28 = +[NSBundle mainBundle];
      v29 = [v28 localizedStringForKey:@"Unsupported Folder Info" value:&stru_10063F3D8 table:0];
      [v24 setAccessibilityLabel:v29];

      objc_initWeak(&location, self);
      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472;
      v54[2] = sub_1000B5EDC;
      v54[3] = &unk_100627240;
      objc_copyWeak(&v55, &location);
      v30 = +[UIAction actionWithHandler:v54];
      v31 = +[UIButton buttonWithConfiguration:v24 primaryAction:v30];
      [(ICFolderOutlineCollectionViewCell *)self setUnsupportedFolderButton:v31];

      objc_destroyWeak(&v55);
      objc_destroyWeak(&location);
    }
    id v32 = objc_alloc((Class)UICellAccessoryCustomView);
    v33 = [(ICFolderOutlineCollectionViewCell *)self unsupportedFolderButton];
    id v21 = [v32 initWithCustomView:v33 placement:1];

    [v21 setDisplayedState:2];
    [v5 addObject:v21];
  }

LABEL_26:
  if ([(ICFolderOutlineCollectionViewCell *)self allowsReordering])
  {
    id v34 = objc_alloc_init((Class)UICellAccessoryReorder);
    [v34 setDisplayedState:1];
    [v5 addObject:v34];
  }
  if ([(ICFolderOutlineCollectionViewCell *)self allowsEditing])
  {
    v35 = [(ICFolderOutlineCollectionViewCell *)self noteContainer];
    if ([v35 isUnsupported])
    {
LABEL_39:

      goto LABEL_40;
    }
    unsigned int v36 = [(ICFolderOutlineCollectionViewCell *)self isEditing];

    if (v36)
    {
      v37 = +[UIFont ic_preferredFontForBodyTextWithMaximumContentSizeCategory:UIContentSizeCategoryExtraExtraExtraLarge];
      v35 = +[UIImageSymbolConfiguration configurationWithFont:v37];

      v38 = +[UIImage systemImageNamed:@"ellipsis.circle" withConfiguration:v35];
      v39 = [(ICFolderOutlineCollectionViewCell *)self actionButton];

      if (v39)
      {
        v40 = [(ICFolderOutlineCollectionViewCell *)self actionButton];
        v41 = [v40 configuration];

        [v41 setImage:v38];
        v42 = [(ICFolderOutlineCollectionViewCell *)self actionButton];
        [v42 setConfiguration:v41];
      }
      else
      {
        v41 = +[UIButtonConfiguration plainButtonConfiguration];
        [v41 setImage:v38];
        [v41 setContentInsets:NSDirectionalEdgeInsetsZero.top, NSDirectionalEdgeInsetsZero.leading, NSDirectionalEdgeInsetsZero.bottom, NSDirectionalEdgeInsetsZero.trailing];
        v47 = +[NSBundle mainBundle];
        v48 = [v47 localizedStringForKey:@"Folder Actions" value:&stru_10063F3D8 table:0];
        [v41 setAccessibilityLabel:v48];

        v49 = +[UIButton buttonWithConfiguration:v41 primaryAction:0];
        [(ICFolderOutlineCollectionViewCell *)self setActionButton:v49];

        v42 = [(ICFolderOutlineCollectionViewCell *)self actionButton];
        [v42 setShowsMenuAsPrimaryAction:1];
      }

      [(ICFolderOutlineCollectionViewCell *)self updateActionMenu];
      id v50 = objc_alloc((Class)UICellAccessoryCustomView);
      v51 = [(ICFolderOutlineCollectionViewCell *)self actionButton];
      id v52 = [v50 initWithCustomView:v51 placement:1];

      [v52 setDisplayedState:1];
      [v5 addObject:v52];

      goto LABEL_39;
    }
  }
LABEL_40:
  id v53 = [v5 copy];
  [(ICFolderOutlineCollectionViewCell *)self setAccessories:v53];
}

- (id)createActionMenu
{
  unint64_t v3 = [(ICFolderOutlineCollectionViewCell *)self ic_viewControllerManager];
  id v4 = [(ICFolderOutlineCollectionViewCell *)self presentingViewController];

  if (v4)
  {
    objc_super v5 = [(ICFolderOutlineCollectionViewCell *)self noteContainer];

    if (v5)
    {
      id v6 = [(ICFolderOutlineCollectionViewCell *)self noteContainer];
      id v7 = [(ICFolderOutlineCollectionViewCell *)self presentingViewController];
      uint64_t v8 = +[ICNoteContainerActionMenu menuWithNoteContainer:v6 presentingViewController:v7 presentingBarButtonItem:0 viewControllerManager:v3 completion:0];
LABEL_6:
      v10 = (void *)v8;

      goto LABEL_8;
    }
    int v9 = [(ICFolderOutlineCollectionViewCell *)self virtualSmartFolder];

    if (v9)
    {
      id v6 = [(ICFolderOutlineCollectionViewCell *)self virtualSmartFolder];
      id v7 = [(ICFolderOutlineCollectionViewCell *)self presentingViewController];
      uint64_t v8 = +[ICNoteContainerActionMenu menuWithVirtualSmartFolder:v6 presentingViewController:v7 presentingBarButtonItem:0 viewControllerManager:v3 completion:0];
      goto LABEL_6;
    }
  }
  v10 = 0;
LABEL_8:

  return v10;
}

- (void)updateActionMenu
{
  id v4 = [(ICFolderOutlineCollectionViewCell *)self createActionMenu];
  unint64_t v3 = [(ICFolderOutlineCollectionViewCell *)self actionButton];
  [v3 setMenu:v4];
}

- (void)onUnsupportedFolderInfoPressed:(id)a3
{
  id v9 = a3;
  id v4 = [(ICFolderOutlineCollectionViewCell *)self noteContainer];
  if (v4) {
    [(ICFolderOutlineCollectionViewCell *)self noteContainer];
  }
  else {
  objc_super v5 = [(ICFolderOutlineCollectionViewCell *)self noteCollection];
  }
  id v6 = [v5 objectID];

  id v7 = [(ICFolderOutlineCollectionViewCell *)self unsupportedFolderInfoButtonTapHandler];

  if (v7)
  {
    uint64_t v8 = [(ICFolderOutlineCollectionViewCell *)self unsupportedFolderInfoButtonTapHandler];
    ((void (**)(void, void *, id))v8)[2](v8, v6, v9);
  }
}

- (BOOL)allowsEditing
{
  objc_opt_class();
  unint64_t v3 = [(ICFolderOutlineCollectionViewCell *)self noteContainer];
  id v4 = ICDynamicCast();

  if (v4)
  {
    self = 0;
    switch([v4 folderType])
    {
      case 0u:
        LODWORD(self) = [v4 isDefaultFolderForAccount] ^ 1;
        break;
      case 1u:
      case 3u:
        break;
      case 2u:
        LOBYTE(self) = 1;
        break;
      default:
        goto LABEL_4;
    }
  }
  else
  {
LABEL_4:
    self = [(ICFolderOutlineCollectionViewCell *)self virtualSmartFolder];

    LOBYTE(self) = self != 0;
  }

  return (char)self;
}

- (BOOL)isSmartFolder
{
  objc_opt_class();
  unint64_t v3 = [(ICFolderOutlineCollectionViewCell *)self noteContainer];
  id v4 = ICDynamicCast();

  if (v4) {
    BOOL v5 = [v4 folderType] == 2;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)allowsReordering
{
  objc_opt_class();
  unint64_t v3 = [(ICFolderOutlineCollectionViewCell *)self noteContainer];
  id v4 = ICDynamicCast();

  if (v4 && [(ICFolderOutlineCollectionViewCell *)self allowsEditing]) {
    unsigned __int8 v5 = [v4 isMovable];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)shouldUseAccompaniedSidebarCellConfiguration
{
  v2 = [(ICFolderOutlineCollectionViewCell *)self traitCollection];
  BOOL v3 = [v2 _splitViewControllerContext] == (id)2;

  return v3;
}

- (void)updateContentConfigurationUsingState:(id)a3
{
  id v52 = a3;
  if ([(ICFolderOutlineCollectionViewCell *)self hasGroupInset])
  {
    id v4 = +[UIListContentConfiguration subtitleCellConfiguration];
    unsigned __int8 v5 = +[UIColor secondaryLabelColor];
    id v6 = [v4 secondaryTextProperties];
    [v6 setColor:v5];
  }
  else
  {
    if ([(ICFolderOutlineCollectionViewCell *)self shouldUseAccompaniedSidebarCellConfiguration])
    {
      +[UIListContentConfiguration accompaniedSidebarSubtitleCellConfiguration];
    }
    else
    {
      +[UIListContentConfiguration sidebarSubtitleCellConfiguration];
    id v4 = };
  }
  if (+[UIDevice ic_isVision]
    && [v52 cellDropState] == (id)2)
  {
    [v52 setCellDropState:1];
  }
  if ([(ICFolderOutlineCollectionViewCell *)self forceDisabledAppearance]
    || [v52 isEditing]
    && ![(ICFolderOutlineCollectionViewCell *)self allowsEditing]
    || ([(ICFolderOutlineCollectionViewCell *)self noteContainer],
        id v7 = objc_claimAutoreleasedReturnValue(),
        unsigned int v8 = [v7 isUnsupported],
        v7,
        v8))
  {
    [v52 setDisabled:1];
    unint64_t v9 = [(ICFolderOutlineCollectionViewCell *)self accessibilityTraits];
    [(ICFolderOutlineCollectionViewCell *)self setAccessibilityTraits:UIAccessibilityTraitNotEnabled | v9];
  }
  [v4 setTextToSecondaryTextHorizontalPadding:0.0];
  [v4 setTextToSecondaryTextVerticalPadding:0.0];
  uint64_t v10 = ICAccessibilityAccessibilityLargerTextSizesEnabled() ^ 1;
  v11 = [(ICFolderOutlineCollectionViewCell *)self noteContainer];
  unsigned __int8 v12 = [v11 titleForTableViewCell];
  id v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    unsigned int v15 = [(ICFolderOutlineCollectionViewCell *)self noteCollection];
    unsigned __int8 v16 = [v15 titleForTableViewCell];
    id v17 = v16;
    if (v16)
    {
      id v14 = v16;
    }
    else
    {
      v18 = [(ICFolderOutlineCollectionViewCell *)self virtualSmartFolder];
      id v14 = [v18 title];
    }
  }

  [v4 setText:v14];
  v19 = +[UIFont ic_preferredSingleLineAFontForTextStyle:UIFontTextStyleBody];
  v20 = [v4 textProperties];
  [v20 setFont:v19];

  id v21 = [v4 textProperties];
  [v21 setNumberOfLines:v10];

  v22 = [(ICFolderOutlineCollectionViewCell *)self noteContainer];
  LODWORD(v20) = [v22 isSharedRootObject];

  if (v20)
  {
    v23 = [(ICFolderOutlineCollectionViewCell *)self noteContainer];
    v24 = [v23 shareDescription];
  }
  else
  {
    v24 = 0;
  }
  if (![(ICFolderOutlineCollectionViewCell *)self showsNoteCount]
    || !ICAccessibilityAccessibilityLargerTextSizesEnabled())
  {
LABEL_28:
    if (!v24) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  v25 = [(ICFolderOutlineCollectionViewCell *)self noteCount];
  v26 = v25;
  if (v24)
  {
    uint64_t v27 = [(__CFString *)v24 stringByAppendingFormat:@"\n%@", v25];

    v24 = (__CFString *)v27;
    goto LABEL_28;
  }
  uint64_t v41 = [v25 stringValue];
  v42 = (void *)v41;
  v43 = @" ";
  if (v41) {
    v43 = (__CFString *)v41;
  }
  v24 = v43;

LABEL_29:
  [v4 setSecondaryText:v24];
  v28 = +[UIFont ic_preferredSingleLineAFontForTextStyle:UIFontTextStyleCaption1];
  v29 = [v4 secondaryTextProperties];
  [v29 setFont:v28];

  v30 = [v4 secondaryTextProperties];
  [v30 setNumberOfLines:v10];

  v31 = [v4 secondaryTextProperties];
  [v31 setAdjustsFontSizeToFitWidth:0];

LABEL_30:
  if ((ICAccessibilityAccessibilityLargerTextSizesEnabled() & 1) == 0)
  {
    id v32 = [(ICFolderOutlineCollectionViewCell *)self virtualSmartFolder];
    v33 = [v32 systemImageName];
    id v34 = v33;
    if (v33)
    {
      id v35 = v33;
    }
    else
    {
      objc_opt_class();
      unsigned int v36 = [(ICFolderOutlineCollectionViewCell *)self noteContainer];
      v37 = ICDynamicCast();
      v38 = [v37 systemImageName];
      v39 = v38;
      if (v38)
      {
        id v40 = v38;
      }
      else
      {
        id v40 = +[ICFolder defaultSystemImageName];
      }
      id v35 = v40;
    }
    v44 = +[UIImage ic_systemImageNamed:v35];
    [v4 setImage:v44];
  }
  if (+[UIDevice ic_isVision])
  {
    v45 = [(ICFolderOutlineCollectionViewCell *)self traitCollection];
    id v46 = [v45 userInterfaceLevel];

    if (v46 == (id)1)
    {
      if ([v52 isDisabled]) {
        +[UIColor secondaryLabelColor];
      }
      else {
      v47 = +[UIColor labelColor];
      }
      v48 = [v4 textProperties];
      [v48 setColor:v47];

      if ([v52 isDisabled]) {
        +[UIColor secondaryLabelColor];
      }
      else {
      v49 = +[UIColor labelColor];
      }
      id v50 = [v4 imageProperties];
      [v50 setTintColor:v49];
    }
  }
  v51 = [v4 updatedConfigurationForState:v52];
  [(ICFolderOutlineCollectionViewCell *)self setContentConfiguration:v51];
}

- (void)updateBackgroundConfigurationUsingState:(id)a3
{
  id v9 = a3;
  if ([(ICFolderOutlineCollectionViewCell *)self hasGroupInset])
  {
    uint64_t v4 = +[UIBackgroundConfiguration _listInsetGroupedCellConfiguration];
  }
  else
  {
    if ([(ICFolderOutlineCollectionViewCell *)self shouldUseAccompaniedSidebarCellConfiguration])
    {
      +[UIBackgroundConfiguration listAccompaniedSidebarCellConfiguration];
    }
    else
    {
      +[UIBackgroundConfiguration listSidebarCellConfiguration];
    uint64_t v4 = };
  }
  unsigned __int8 v5 = (void *)v4;
  if ([(ICFolderOutlineCollectionViewCell *)self isRecentlyCreated]
    && ([v9 isSelected] & 1) == 0)
  {
    [v9 setSwiped:1];
    id v6 = +[UIBackgroundConfiguration listSidebarCellConfiguration];
    id v7 = [v6 updatedConfigurationForState:v9];
    unsigned int v8 = [v7 backgroundColor];
    [v5 setBackgroundColor:v8];
  }
  else
  {
    [v5 updatedConfigurationForState:v9];
    v5 = id v6 = v5;
  }

  [(ICFolderOutlineCollectionViewCell *)self setBackgroundConfiguration:v5];
}

- (NoteCollectionObject)noteCollection
{
  return self->_noteCollection;
}

- (ICNoteContainer)noteContainer
{
  return self->_noteContainer;
}

- (ICVirtualSmartFolderItemIdentifier)virtualSmartFolder
{
  return self->_virtualSmartFolder;
}

- (BOOL)forceDisabledAppearance
{
  return self->_forceDisabledAppearance;
}

- (void)setForceDisabledAppearance:(BOOL)a3
{
  self->_forceDisabledAppearance = a3;
}

- (BOOL)allowsExpandCollapse
{
  return self->_allowsExpandCollapse;
}

- (void)setAllowsExpandCollapse:(BOOL)a3
{
  self->_allowsExpandCollapse = a3;
}

- (BOOL)hasGroupInset
{
  return self->_hasGroupInset;
}

- (void)setHasGroupInset:(BOOL)a3
{
  self->_hasGroupInset = a3;
}

- (BOOL)hasDisclosureIndicator
{
  return self->_hasDisclosureIndicator;
}

- (void)setHasDisclosureIndicator:(BOOL)a3
{
  self->_hasDisclosureIndicator = a3;
}

- (BOOL)shouldIndentNoteCount
{
  return self->_shouldIndentNoteCount;
}

- (void)setShouldIndentNoteCount:(BOOL)a3
{
  self->_shouldIndentNoteCount = a3;
}

- (BOOL)showsNoteCount
{
  return self->_showsNoteCount;
}

- (void)setShowsNoteCount:(BOOL)a3
{
  self->_showsNoteCount = a3;
}

- (BOOL)showsCheckmark
{
  return self->_showsCheckmark;
}

- (id)unsupportedFolderInfoButtonTapHandler
{
  return self->_unsupportedFolderInfoButtonTapHandler;
}

- (void)setUnsupportedFolderInfoButtonTapHandler:(id)a3
{
}

- (BOOL)isRecentlyCreated
{
  return self->_recentlyCreated;
}

- (ICAccessibilityCustomActionsDelegate)accessibilityCustomActionsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessibilityCustomActionsDelegate);

  return (ICAccessibilityCustomActionsDelegate *)WeakRetained;
}

- (void)setAccessibilityCustomActionsDelegate:(id)a3
{
}

- (ICNAViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  return (ICNAViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (NSNumber)subfoldersCount
{
  return self->_subfoldersCount;
}

- (void)setSubfoldersCount:(id)a3
{
}

- (NSNumber)noteCount
{
  return self->_noteCount;
}

- (void)setNoteCount:(id)a3
{
}

- (UIButton)actionButton
{
  return self->_actionButton;
}

- (void)setActionButton:(id)a3
{
}

- (UIButton)unsupportedFolderButton
{
  return self->_unsupportedFolderButton;
}

- (void)setUnsupportedFolderButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unsupportedFolderButton, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_noteCount, 0);
  objc_storeStrong((id *)&self->_subfoldersCount, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_destroyWeak((id *)&self->_accessibilityCustomActionsDelegate);
  objc_storeStrong(&self->_unsupportedFolderInfoButtonTapHandler, 0);
  objc_storeStrong((id *)&self->_virtualSmartFolder, 0);
  objc_storeStrong((id *)&self->_noteContainer, 0);

  objc_storeStrong((id *)&self->_noteCollection, 0);
}

@end