@interface ICNoteBrowseNavigationItemConfiguration
- (BOOL)canAddNote;
- (BOOL)canAssignTags;
- (BOOL)canBeShared;
- (BOOL)canDeleteNotes;
- (BOOL)canMoveNotes;
- (BOOL)isAuthenticated;
- (BOOL)isCompactHeight;
- (BOOL)isCompactWidth;
- (BOOL)isEditing;
- (BOOL)isEqual:(id)a3;
- (BOOL)isShared;
- (BOOL)isShowingEmptyState;
- (BOOL)isTrashFolder;
- (BOOL)showsDebugItem;
- (BOOL)updateAnimated:(BOOL)a3;
- (BOOL)usesCustomBackButton;
- (BOOL)usesPlainBarButtonItems;
- (ICNoteBrowseNavigationItemConfiguration)initWithDataSource:(id)a3 delegate:(id)a4;
- (ICNoteBrowseNavigationItemConfigurationDataSource)dataSource;
- (ICNoteBrowseNavigationItemConfigurationDelegate)delegate;
- (ICToolbarSummaryView)summaryView;
- (NSString)navigationTitle;
- (UIBarButtonItem)actionBarButtonItem;
- (UIBarButtonItem)addNoteBarButtonItem;
- (UIBarButtonItem)collaborationBarButtonItem;
- (UIBarButtonItem)customBackBarButtonItem;
- (UIBarButtonItem)debugBarButtonItem;
- (UIBarButtonItem)deleteBarButtonItem;
- (UIBarButtonItem)editBarButtonItem;
- (UIBarButtonItem)lockBarButtonItem;
- (UIBarButtonItem)moveBarButtonItem;
- (UIBarButtonItem)shareBarButtonItem;
- (UIBarButtonItem)sharedBarButtonItem;
- (UIBarButtonItem)summaryBarButtonItem;
- (UIBarButtonItem)tagsBarButtonItem;
- (UINavigationController)navigationController;
- (UINavigationItem)navigationItem;
- (UIViewController)presentingViewController;
- (int64_t)noteContainerViewMode;
- (unint64_t)collectionType;
- (unint64_t)hash;
- (unint64_t)noteCount;
- (unint64_t)selectedNoteCount;
- (void)addNoteAction:(id)a3 event:(id)a4;
- (void)backAction:(id)a3;
- (void)debugAction:(id)a3;
- (void)deleteAction:(id)a3;
- (void)lockAction:(id)a3;
- (void)moveAction:(id)a3;
- (void)reset;
- (void)setActionBarButtonItem:(id)a3;
- (void)setAddNoteBarButtonItem:(id)a3;
- (void)setAuthenticated:(BOOL)a3;
- (void)setCanAddNote:(BOOL)a3;
- (void)setCanAssignTags:(BOOL)a3;
- (void)setCanBeShared:(BOOL)a3;
- (void)setCanDeleteNotes:(BOOL)a3;
- (void)setCanMoveNotes:(BOOL)a3;
- (void)setCollectionType:(unint64_t)a3;
- (void)setCompactHeight:(BOOL)a3;
- (void)setCompactWidth:(BOOL)a3;
- (void)setCustomBackBarButtonItem:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDebugBarButtonItem:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeleteBarButtonItem:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setLockBarButtonItem:(id)a3;
- (void)setMoveBarButtonItem:(id)a3;
- (void)setNoteContainerViewMode:(int64_t)a3;
- (void)setNoteCount:(unint64_t)a3;
- (void)setSelectedNoteCount:(unint64_t)a3;
- (void)setShareBarButtonItem:(id)a3;
- (void)setShared:(BOOL)a3;
- (void)setShowingEmptyState:(BOOL)a3;
- (void)setShowsDebugItem:(BOOL)a3;
- (void)setSummaryBarButtonItem:(id)a3;
- (void)setTagsBarButtonItem:(id)a3;
- (void)setTrashFolder:(BOOL)a3;
- (void)setUsesCustomBackButton:(BOOL)a3;
- (void)setUsesPlainBarButtonItems:(BOOL)a3;
- (void)shareAction:(id)a3;
- (void)tagsAction:(id)a3;
- (void)updateEnabled;
- (void)updateMenus;
- (void)updateNavigationBarAnimated:(BOOL)a3;
- (void)updateTitles;
- (void)updateToolbarAnimated:(BOOL)a3;
@end

@implementation ICNoteBrowseNavigationItemConfiguration

- (ICNoteBrowseNavigationItemConfiguration)initWithDataSource:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ICNoteBrowseNavigationItemConfiguration;
  v8 = [(ICNoteBrowseNavigationItemConfiguration *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_dataSource, v6);
    objc_storeWeak((id *)&v9->_delegate, v7);
    v9->_noteContainerViewMode = -1;
    v9->_collectionType = 0;
  }

  return v9;
}

- (UINavigationItem)navigationItem
{
  v2 = [(ICNoteBrowseNavigationItemConfiguration *)self presentingViewController];
  v3 = [v2 navigationItem];

  return (UINavigationItem *)v3;
}

- (ICToolbarSummaryView)summaryView
{
  v3 = [(ICNoteBrowseNavigationItemConfiguration *)self dataSource];
  v4 = [v3 noteBrowseNavigationitemConfigurationNavigationToolbarSummaryView:self];

  return (ICToolbarSummaryView *)v4;
}

- (UIBarButtonItem)actionBarButtonItem
{
  actionBarButtonItem = self->_actionBarButtonItem;
  if (actionBarButtonItem)
  {
    v3 = actionBarButtonItem;
  }
  else
  {
    if ([(ICNoteBrowseNavigationItemConfiguration *)self usesPlainBarButtonItems]) {
      CFStringRef v5 = @"ellipsis";
    }
    else {
      CFStringRef v5 = @"ellipsis.circle";
    }
    id v6 = +[UIImage systemImageNamed:v5];
    id v7 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithImage:v6 menu:0];
    v8 = self->_actionBarButtonItem;
    self->_actionBarButtonItem = v7;

    v9 = +[NSBundle mainBundle];
    v10 = [v9 localizedStringForKey:@"Manage notes and views" value:&stru_10063F3D8 table:0];
    [(UIBarButtonItem *)self->_actionBarButtonItem setTitle:v10];

    objc_super v11 = +[NSBundle mainBundle];
    v12 = [v11 localizedStringForKey:@"Folder Actions" value:&stru_10063F3D8 table:0];
    [(UIBarButtonItem *)self->_actionBarButtonItem setAccessibilityLabel:v12];

    v13 = +[NSBundle mainBundle];
    v14 = [v13 localizedStringForKey:@"Double tap to show the notes list action menu" value:&stru_10063F3D8 table:0];
    [(UIBarButtonItem *)self->_actionBarButtonItem setAccessibilityHint:v14];

    v3 = self->_actionBarButtonItem;
  }

  return v3;
}

- (UIBarButtonItem)addNoteBarButtonItem
{
  addNoteBarButtonItem = self->_addNoteBarButtonItem;
  if (addNoteBarButtonItem)
  {
    v3 = addNoteBarButtonItem;
  }
  else
  {
    CFStringRef v5 = +[UIImage systemImageNamed:@"square.and.pencil"];
    id v6 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithImage:v5 style:0 target:self action:"addNoteAction:event:"];
    id v7 = self->_addNoteBarButtonItem;
    self->_addNoteBarButtonItem = v6;

    v8 = +[NSBundle mainBundle];
    v9 = [v8 localizedStringForKey:@"New note" value:&stru_10063F3D8 table:0];
    [(UIBarButtonItem *)self->_addNoteBarButtonItem setTitle:v9];

    v10 = +[NSBundle mainBundle];
    objc_super v11 = [v10 localizedStringForKey:@"New note" value:&stru_10063F3D8 table:0];
    [(UIBarButtonItem *)self->_addNoteBarButtonItem setAccessibilityLabel:v11];

    v12 = +[NSBundle mainBundle];
    v13 = [v12 localizedStringForKey:@"Double tap to compose a new note" value:&stru_10063F3D8 table:0];
    [(UIBarButtonItem *)self->_addNoteBarButtonItem setAccessibilityHint:v13];

    v3 = self->_addNoteBarButtonItem;
  }

  return v3;
}

- (UIBarButtonItem)collaborationBarButtonItem
{
  v3 = [(ICNoteBrowseNavigationItemConfiguration *)self dataSource];
  v4 = [v3 noteBrowseNavigationItemConfigurationCollaborationBarButtonItem:self];

  return (UIBarButtonItem *)v4;
}

- (UIBarButtonItem)customBackBarButtonItem
{
  if ([(ICNoteBrowseNavigationItemConfiguration *)self usesCustomBackButton])
  {
    customBackBarButtonItem = self->_customBackBarButtonItem;
    if (!customBackBarButtonItem)
    {
      v4 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:101 target:self action:"backAction:"];
      CFStringRef v5 = self->_customBackBarButtonItem;
      self->_customBackBarButtonItem = v4;

      customBackBarButtonItem = self->_customBackBarButtonItem;
    }
    id v6 = customBackBarButtonItem;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (UIBarButtonItem)debugBarButtonItem
{
  debugBarButtonItem = self->_debugBarButtonItem;
  if (!debugBarButtonItem)
  {
    id v4 = objc_alloc((Class)UIBarButtonItem);
    CFStringRef v5 = +[UIImage systemImageNamed:@"gear"];
    id v6 = (UIBarButtonItem *)[v4 initWithImage:v5 style:0 target:self action:"debugAction:"];
    id v7 = self->_debugBarButtonItem;
    self->_debugBarButtonItem = v6;

    debugBarButtonItem = self->_debugBarButtonItem;
  }
  v8 = debugBarButtonItem;

  return v8;
}

- (UIBarButtonItem)deleteBarButtonItem
{
  deleteBarButtonItem = self->_deleteBarButtonItem;
  if (!deleteBarButtonItem)
  {
    unsigned __int8 v4 = [(ICNoteBrowseNavigationItemConfiguration *)self usesPlainBarButtonItems];
    id v5 = objc_alloc((Class)UIBarButtonItem);
    id v6 = v5;
    if (v4)
    {
      id v7 = +[UIImage ic_systemImageNamed:@"trash"];
      v8 = (UIBarButtonItem *)[v6 initWithImage:v7 style:0 target:self action:"deleteAction:"];
      v9 = self->_deleteBarButtonItem;
      self->_deleteBarButtonItem = v8;
    }
    else
    {
      v10 = (UIBarButtonItem *)[v5 initWithTitle:0 style:0 target:self action:"deleteAction:"];
      id v7 = self->_deleteBarButtonItem;
      self->_deleteBarButtonItem = v10;
    }

    deleteBarButtonItem = self->_deleteBarButtonItem;
  }
  objc_super v11 = deleteBarButtonItem;

  return v11;
}

- (UIBarButtonItem)editBarButtonItem
{
  v2 = [(ICNoteBrowseNavigationItemConfiguration *)self presentingViewController];
  v3 = [v2 editButtonItem];

  return (UIBarButtonItem *)v3;
}

- (UIBarButtonItem)lockBarButtonItem
{
  lockBarButtonItem = self->_lockBarButtonItem;
  if (lockBarButtonItem)
  {
    v3 = lockBarButtonItem;
  }
  else
  {
    id v5 = +[UIImage systemImageNamed:@"lock.open"];
    id v6 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithImage:v5 style:0 target:self action:"lockAction:"];
    id v7 = self->_lockBarButtonItem;
    self->_lockBarButtonItem = v6;

    v8 = +[NSBundle mainBundle];
    v9 = [v8 localizedStringForKey:@"Lock notes" value:&stru_10063F3D8 table:0];
    [(UIBarButtonItem *)self->_lockBarButtonItem setAccessibilityLabel:v9];

    v10 = +[NSBundle mainBundle];
    objc_super v11 = [v10 localizedStringForKey:@"Double tap to lock notes" value:&stru_10063F3D8 table:0];
    [(UIBarButtonItem *)self->_lockBarButtonItem setAccessibilityHint:v11];

    v3 = self->_lockBarButtonItem;
  }

  return v3;
}

- (UIBarButtonItem)moveBarButtonItem
{
  moveBarButtonItem = self->_moveBarButtonItem;
  if (!moveBarButtonItem)
  {
    unsigned __int8 v4 = [(ICNoteBrowseNavigationItemConfiguration *)self usesPlainBarButtonItems];
    id v5 = objc_alloc((Class)UIBarButtonItem);
    id v6 = v5;
    if (v4)
    {
      id v7 = +[UIImage ic_systemImageNamed:@"folder"];
      v8 = (UIBarButtonItem *)[v6 initWithImage:v7 style:0 target:self action:"moveAction:"];
      v9 = self->_moveBarButtonItem;
      self->_moveBarButtonItem = v8;
    }
    else
    {
      v10 = (UIBarButtonItem *)[v5 initWithTitle:0 style:0 target:self action:"moveAction:"];
      id v7 = self->_moveBarButtonItem;
      self->_moveBarButtonItem = v10;
    }

    moveBarButtonItem = self->_moveBarButtonItem;
  }
  objc_super v11 = moveBarButtonItem;

  return v11;
}

- (UIBarButtonItem)shareBarButtonItem
{
  shareBarButtonItem = self->_shareBarButtonItem;
  if (shareBarButtonItem)
  {
    v3 = shareBarButtonItem;
  }
  else
  {
    id v5 = +[UIImage systemImageNamed:@"square.and.arrow.up"];
    id v6 = (UIBarButtonItem *)[objc_alloc((Class)UIBarButtonItem) initWithImage:v5 style:0 target:self action:"shareAction:"];
    id v7 = self->_shareBarButtonItem;
    self->_shareBarButtonItem = v6;

    v8 = +[NSBundle mainBundle];
    v9 = [v8 localizedStringForKey:@"Share" value:&stru_10063F3D8 table:0];
    [(UIBarButtonItem *)self->_shareBarButtonItem setAccessibilityLabel:v9];

    v10 = +[NSBundle mainBundle];
    objc_super v11 = [v10 localizedStringForKey:@"Double tap to show folder sharing options" value:&stru_10063F3D8 table:0];
    [(UIBarButtonItem *)self->_shareBarButtonItem setAccessibilityHint:v11];

    v3 = self->_shareBarButtonItem;
  }

  return v3;
}

- (UIBarButtonItem)summaryBarButtonItem
{
  if (self->_summaryBarButtonItem)
  {
    v3 = [(ICNoteBrowseNavigationItemConfiguration *)self summaryView];
    [(UIBarButtonItem *)self->_summaryBarButtonItem setCustomView:v3];
  }
  else
  {
    id v4 = objc_alloc((Class)UIBarButtonItem);
    v3 = [(ICNoteBrowseNavigationItemConfiguration *)self summaryView];
    id v5 = (UIBarButtonItem *)[v4 initWithCustomView:v3];
    summaryBarButtonItem = self->_summaryBarButtonItem;
    self->_summaryBarButtonItem = v5;
  }
  id v7 = self->_summaryBarButtonItem;

  return v7;
}

- (UIBarButtonItem)tagsBarButtonItem
{
  tagsBarButtonItem = self->_tagsBarButtonItem;
  if (!tagsBarButtonItem)
  {
    unsigned __int8 v4 = [(ICNoteBrowseNavigationItemConfiguration *)self usesPlainBarButtonItems];
    id v5 = objc_alloc((Class)UIBarButtonItem);
    id v6 = +[NSBundle mainBundle];
    id v7 = [v6 localizedStringForKey:@"Tags" value:&stru_10063F3D8 table:0];
    if (v4)
    {
      v8 = +[UIImage ic_systemImageNamed:@"number"];
      v9 = (UIBarButtonItem *)[v5 initWithTitle:v7 image:v8 target:self action:"tagsAction:" menu:0];
      v10 = self->_tagsBarButtonItem;
      self->_tagsBarButtonItem = v9;
    }
    else
    {
      objc_super v11 = (UIBarButtonItem *)[v5 initWithTitle:v7 style:0 target:self action:"tagsAction:"];
      v8 = self->_tagsBarButtonItem;
      self->_tagsBarButtonItem = v11;
    }

    tagsBarButtonItem = self->_tagsBarButtonItem;
  }
  v12 = tagsBarButtonItem;

  return v12;
}

- (void)reset
{
  v4.receiver = self;
  v4.super_class = (Class)ICNoteBrowseNavigationItemConfiguration;
  [(ICNoteBrowseNavigationItemConfiguration *)&v4 reset];
  addNoteBarButtonItem = self->_addNoteBarButtonItem;
  self->_addNoteBarButtonItem = 0;
}

- (BOOL)updateAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(ICNoteBrowseNavigationItemConfiguration *)self needsUpdate];
  if (v5)
  {
    [(ICNoteBrowseNavigationItemConfiguration *)self updateNavigationBarAnimated:v3];
    [(ICNoteBrowseNavigationItemConfiguration *)self updateToolbarAnimated:v3];
    [(ICNoteBrowseNavigationItemConfiguration *)self updateTitles];
    [(ICNoteBrowseNavigationItemConfiguration *)self updateMenus];
    [(ICNoteBrowseNavigationItemConfiguration *)self updateEnabled];
    v7.receiver = self;
    v7.super_class = (Class)ICNoteBrowseNavigationItemConfiguration;
    LOBYTE(v5) = [(ICNoteBrowseNavigationItemConfiguration *)&v7 updateAnimated:v3];
  }
  return v5;
}

- (BOOL)isEditing
{
  v2 = [(ICNoteBrowseNavigationItemConfiguration *)self presentingViewController];
  unsigned __int8 v3 = [v2 isEditing];

  return v3;
}

- (UINavigationController)navigationController
{
  v2 = [(ICNoteBrowseNavigationItemConfiguration *)self presentingViewController];
  unsigned __int8 v3 = [v2 navigationController];

  return (UINavigationController *)v3;
}

- (NSString)navigationTitle
{
  unsigned __int8 v3 = [(ICNoteBrowseNavigationItemConfiguration *)self dataSource];
  objc_super v4 = [v3 noteBrowseNavigationItemConfigurationNavigationTitle:self];

  return (NSString *)v4;
}

- (void)updateNavigationBarAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(ICNoteBrowseNavigationItemConfiguration *)self navigationItem];
  id v6 = [v5 searchController];
  if (![v6 isActive])
  {

LABEL_7:
    unsigned int v8 = [(ICNoteBrowseNavigationItemConfiguration *)self isEditing];
    v9 = [(ICNoteBrowseNavigationItemConfiguration *)self navigationItem];
    v10 = v9;
    if (v8)
    {
      [v9 setHidesBackButton:1 animated:v3];

      objc_super v11 = [(ICNoteBrowseNavigationItemConfiguration *)self navigationItem];
      v12 = [(ICNoteBrowseNavigationItemConfiguration *)self editBarButtonItem];
      v41 = v12;
      v13 = +[NSArray arrayWithObjects:&v41 count:1];
      [v11 setRightBarButtonItems:v13 animated:v3];

LABEL_39:
      return;
    }
    [v9 setHidesBackButton:[self usesCustomBackButton] animated:v3];

    if ([(ICNoteBrowseNavigationItemConfiguration *)self usesCustomBackButton]
      && ([(ICNoteBrowseNavigationItemConfiguration *)self navigationController],
          v14 = objc_claimAutoreleasedReturnValue(),
          [v14 viewControllers],
          v15 = objc_claimAutoreleasedReturnValue(),
          id v16 = [v15 count],
          v15,
          v14,
          (unint64_t)v16 >= 2))
    {
      id v17 = objc_alloc((Class)UIBarButtonItemGroup);
      v18 = [(ICNoteBrowseNavigationItemConfiguration *)self customBackBarButtonItem];
      v40 = v18;
      v19 = +[NSArray arrayWithObjects:&v40 count:1];
      id v20 = [v17 initWithBarButtonItems:v19 representativeItem:0];

      id v39 = v20;
      v21 = +[NSArray arrayWithObjects:&v39 count:1];
      v22 = [(ICNoteBrowseNavigationItemConfiguration *)self navigationItem];
      [v22 setLeadingItemGroups:v21];
    }
    else
    {
      id v20 = [(ICNoteBrowseNavigationItemConfiguration *)self navigationItem];
      [v20 setLeadingItemGroups:&__NSArray0__struct];
    }

    objc_super v11 = +[NSMutableArray array];
    unint64_t v23 = [(ICNoteBrowseNavigationItemConfiguration *)self collectionType];
    if (v23 - 3 < 2)
    {
      v24 = [(ICNoteBrowseNavigationItemConfiguration *)self actionBarButtonItem];
      [v11 addObject:v24];

      if ((id)[(ICNoteBrowseNavigationItemConfiguration *)self noteContainerViewMode] != (id)1
        || [(ICNoteBrowseNavigationItemConfiguration *)self isCompactWidth])
      {
LABEL_35:
        v31 = [(ICNoteBrowseNavigationItemConfiguration *)self navigationItem];
        [v31 _setSupportsTwoLineLargeTitles:1];

        v32 = [(ICNoteBrowseNavigationItemConfiguration *)self navigationItem];
        id v33 = [v11 copy];
        [v32 setRightBarButtonItems:v33 animated:v3];

        LODWORD(v33) = [(ICNoteBrowseNavigationItemConfiguration *)self showsDebugItem];
        v34 = [(ICNoteBrowseNavigationItemConfiguration *)self navigationItem];
        v35 = v34;
        if (v33)
        {
          v36 = [(ICNoteBrowseNavigationItemConfiguration *)self debugBarButtonItem];
          [v35 setLeftBarButtonItem:v36 animated:v3];

          v34 = [(ICNoteBrowseNavigationItemConfiguration *)self navigationItem];
          v35 = v34;
          uint64_t v37 = 1;
        }
        else
        {
          uint64_t v37 = 0;
        }
        [v34 setLeftItemsSupplementBackButton:v37];

        goto LABEL_39;
      }
      v25 = [(ICNoteBrowseNavigationItemConfiguration *)self addNoteBarButtonItem];
      [v11 insertObject:v25 atIndex:0];
    }
    else
    {
      if (v23 == 2)
      {
        uint64_t v26 = [(ICNoteBrowseNavigationItemConfiguration *)self editBarButtonItem];
      }
      else
      {
        if (v23 != 1) {
          goto LABEL_35;
        }
        if ([(ICNoteBrowseNavigationItemConfiguration *)self isTrashFolder]) {
          [(ICNoteBrowseNavigationItemConfiguration *)self editBarButtonItem];
        }
        else {
        v27 = [(ICNoteBrowseNavigationItemConfiguration *)self actionBarButtonItem];
        }
        [v11 ic_addNonNilObject:v27];

        if (![(ICNoteBrowseNavigationItemConfiguration *)self isCompactWidth])
        {
          if ((id)[(ICNoteBrowseNavigationItemConfiguration *)self noteContainerViewMode] == (id)1
            && ![(ICNoteBrowseNavigationItemConfiguration *)self isCompactHeight])
          {
            v28 = [(ICNoteBrowseNavigationItemConfiguration *)self addNoteBarButtonItem];
            [v11 ic_insertNonNilObject:v28 atIndex:0];

            if ([(ICNoteBrowseNavigationItemConfiguration *)self isAuthenticated])
            {
              v29 = [(ICNoteBrowseNavigationItemConfiguration *)self lockBarButtonItem];
              [v11 ic_addNonNilObject:v29];
            }
          }
          if ((id)[(ICNoteBrowseNavigationItemConfiguration *)self noteContainerViewMode] != (id)1) {
            goto LABEL_35;
          }
        }
        if ([(ICNoteBrowseNavigationItemConfiguration *)self canBeShared])
        {
          v30 = [(ICNoteBrowseNavigationItemConfiguration *)self shareBarButtonItem];
          [v11 ic_addNonNilObject:v30];
        }
        if (![(ICNoteBrowseNavigationItemConfiguration *)self isShared]) {
          goto LABEL_35;
        }
        uint64_t v26 = [(ICNoteBrowseNavigationItemConfiguration *)self collaborationBarButtonItem];
      }
      v25 = (void *)v26;
      [v11 ic_addNonNilObject:v26];
    }

    goto LABEL_35;
  }
  int64_t v7 = [(ICNoteBrowseNavigationItemConfiguration *)self noteContainerViewMode];

  if (v7 != 1) {
    goto LABEL_7;
  }
  id v38 = [(ICNoteBrowseNavigationItemConfiguration *)self navigationItem];
  [v38 setRightBarButtonItems:&__NSArray0__struct animated:v3];
}

- (void)updateEnabled
{
  BOOL v3 = [(ICNoteBrowseNavigationItemConfiguration *)self canAddNote];
  objc_super v4 = [(ICNoteBrowseNavigationItemConfiguration *)self addNoteBarButtonItem];
  [v4 setEnabled:v3];

  BOOL v5 = [(ICNoteBrowseNavigationItemConfiguration *)self canDeleteNotes];
  id v6 = [(ICNoteBrowseNavigationItemConfiguration *)self deleteBarButtonItem];
  [v6 setEnabled:v5];

  BOOL v7 = [(ICNoteBrowseNavigationItemConfiguration *)self canMoveNotes];
  unsigned int v8 = [(ICNoteBrowseNavigationItemConfiguration *)self moveBarButtonItem];
  [v8 setEnabled:v7];

  switch([(ICNoteBrowseNavigationItemConfiguration *)self collectionType])
  {
    case 0uLL:
    case 3uLL:
    case 4uLL:
      goto LABEL_2;
    case 1uLL:
      if ([(ICNoteBrowseNavigationItemConfiguration *)self isTrashFolder]) {
        BOOL v9 = 1;
      }
      else {
LABEL_2:
      }
        BOOL v9 = [(ICNoteBrowseNavigationItemConfiguration *)self isEditing];
      goto LABEL_6;
    case 2uLL:
      BOOL v9 = [(ICNoteBrowseNavigationItemConfiguration *)self noteCount] != 0;
LABEL_6:
      id v10 = [(ICNoteBrowseNavigationItemConfiguration *)self editBarButtonItem];
      [v10 setEnabled:v9];

      break;
    default:
      return;
  }
}

- (void)updateMenus
{
  switch([(ICNoteBrowseNavigationItemConfiguration *)self collectionType])
  {
    case 0uLL:
    case 2uLL:
      id v7 = [(ICNoteBrowseNavigationItemConfiguration *)self actionBarButtonItem];
      [v7 setMenu:0];
      goto LABEL_7;
    case 1uLL:
      id v7 = [(ICNoteBrowseNavigationItemConfiguration *)self dataSource];
      BOOL v3 = [(ICNoteBrowseNavigationItemConfiguration *)self actionBarButtonItem];
      uint64_t v4 = [v7 noteBrowseNavigationItemConfigurationNoteContainerActionMenu:self actionBarButtonItem:v3];
      goto LABEL_6;
    case 3uLL:
      id v7 = [(ICNoteBrowseNavigationItemConfiguration *)self dataSource];
      BOOL v3 = [(ICNoteBrowseNavigationItemConfiguration *)self actionBarButtonItem];
      uint64_t v4 = [v7 noteBrowseNavigationItemConfigurationQueryActionMenu:self actionBarButtonItem:v3];
      goto LABEL_6;
    case 4uLL:
      id v7 = [(ICNoteBrowseNavigationItemConfiguration *)self dataSource];
      BOOL v3 = [(ICNoteBrowseNavigationItemConfiguration *)self actionBarButtonItem];
      uint64_t v4 = [v7 noteBrowseNavigationItemConfigurationVirtualSmartFolderActionMenu:self actionBarButtonItem:v3];
LABEL_6:
      BOOL v5 = (void *)v4;
      id v6 = [(ICNoteBrowseNavigationItemConfiguration *)self actionBarButtonItem];
      [v6 setMenu:v5];

LABEL_7:

      break;
    default:
      return;
  }
}

- (void)updateTitles
{
  BOOL v3 = [(ICNoteBrowseNavigationItemConfiguration *)self navigationTitle];
  uint64_t v4 = [(ICNoteBrowseNavigationItemConfiguration *)self navigationItem];
  [v4 setTitle:v3];

  BOOL v5 = [(ICNoteBrowseNavigationItemConfiguration *)self navigationTitle];
  if ([v5 length]) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 2;
  }
  id v7 = [(ICNoteBrowseNavigationItemConfiguration *)self navigationItem];
  [v7 setLargeTitleDisplayMode:v6];

  unint64_t v8 = [(ICNoteBrowseNavigationItemConfiguration *)self selectedNoteCount];
  BOOL v9 = +[NSBundle mainBundle];
  id v10 = v9;
  if (v8) {
    CFStringRef v11 = @"Move";
  }
  else {
    CFStringRef v11 = @"Move All";
  }
  v12 = [v9 localizedStringForKey:v11 value:&stru_10063F3D8 table:0];
  v13 = [(ICNoteBrowseNavigationItemConfiguration *)self moveBarButtonItem];
  [v13 setTitle:v12];

  unint64_t v14 = [(ICNoteBrowseNavigationItemConfiguration *)self selectedNoteCount];
  v15 = +[NSBundle mainBundle];
  id v19 = v15;
  if (v14) {
    CFStringRef v16 = @"Delete";
  }
  else {
    CFStringRef v16 = @"Delete All";
  }
  id v17 = [v15 localizedStringForKey:v16 value:&stru_10063F3D8 table:0];
  v18 = [(ICNoteBrowseNavigationItemConfiguration *)self deleteBarButtonItem];
  [v18 setTitle:v17];
}

- (void)updateToolbarAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(ICNoteBrowseNavigationItemConfiguration *)self isCompactWidth];
  uint64_t v6 = +[UIBarButtonItem flexibleSpaceItem];
  id v7 = [(ICNoteBrowseNavigationItemConfiguration *)self navigationController];
  if ([(ICNoteBrowseNavigationItemConfiguration *)self isEditing])
  {
    unsigned int v8 = [(ICNoteBrowseNavigationItemConfiguration *)self canAssignTags];
    BOOL v9 = [(ICNoteBrowseNavigationItemConfiguration *)self presentingViewController];
    uint64_t v10 = [(ICNoteBrowseNavigationItemConfiguration *)self moveBarButtonItem];
    CFStringRef v11 = (void *)v10;
    if (v8)
    {
      v27[0] = v10;
      v27[1] = v6;
      v12 = [(ICNoteBrowseNavigationItemConfiguration *)self tagsBarButtonItem];
      v27[2] = v12;
      v27[3] = v6;
      v13 = [(ICNoteBrowseNavigationItemConfiguration *)self deleteBarButtonItem];
      v27[4] = v13;
      unint64_t v14 = +[NSArray arrayWithObjects:v27 count:5];
      [v9 setToolbarItems:v14 animated:v3];
    }
    else
    {
      v26[0] = v10;
      v26[1] = v6;
      v12 = [(ICNoteBrowseNavigationItemConfiguration *)self deleteBarButtonItem];
      v26[2] = v12;
      v13 = +[NSArray arrayWithObjects:v26 count:3];
      [v9 setToolbarItems:v13 animated:v3];
    }

    [v7 setToolbarHidden:0 animated:v3];
  }
  else
  {
    if ((id)[(ICNoteBrowseNavigationItemConfiguration *)self noteContainerViewMode] == (id)1
      || [(ICNoteBrowseNavigationItemConfiguration *)self isShowingEmptyState])
    {
      unsigned int v15 = ![(ICNoteBrowseNavigationItemConfiguration *)self isCompactHeight];
    }
    else
    {
      unsigned int v15 = 0;
    }
    CFStringRef v16 = [(ICNoteBrowseNavigationItemConfiguration *)self navigationItem];
    id v17 = [v16 searchController];
    if ([v17 isActive]) {
      uint64_t v18 = 1;
    }
    else {
      uint64_t v18 = v15 & ~v5;
    }

    [v7 setToolbarHidden:v18 animated:v3];
    id v19 = +[NSMutableArray array];
    id v20 = +[UIBarButtonItem flexibleSpaceItem];
    [v19 addObject:v20];

    if ((v18 & 1) == 0)
    {
      v21 = [(ICNoteBrowseNavigationItemConfiguration *)self summaryBarButtonItem];
      [v19 ic_addNonNilObject:v21];
    }
    v22 = +[UIBarButtonItem flexibleSpaceItem];
    [v19 addObject:v22];

    if ((v5 & 1) != 0
      || (id)[(ICNoteBrowseNavigationItemConfiguration *)self noteContainerViewMode] == (id)1
      && [(ICNoteBrowseNavigationItemConfiguration *)self isCompactHeight])
    {
      unint64_t v23 = [(ICNoteBrowseNavigationItemConfiguration *)self addNoteBarButtonItem];
      [v19 addObject:v23];
    }
    v24 = [(ICNoteBrowseNavigationItemConfiguration *)self presentingViewController];
    id v25 = [v19 copy];
    [v24 setToolbarItems:v25 animated:v3];
  }
}

- (void)addNoteAction:(id)a3 event:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ICNoteBrowseNavigationItemConfiguration *)self delegate];
  [v8 noteBrowseNavigationItemConfiguration:self shouldAddNoteFromBarButtonItem:v7 event:v6];
}

- (void)backAction:(id)a3
{
  id v4 = [(ICNoteBrowseNavigationItemConfiguration *)self navigationController];
  id v3 = [v4 popViewControllerAnimated:1];
}

- (void)debugAction:(id)a3
{
  id v4 = a3;
  id v5 = [(ICNoteBrowseNavigationItemConfiguration *)self delegate];
  [v5 noteBrowseNavigationItemConfiguration:self shouldShowDebugViewControllerFromBarButtonItem:v4];
}

- (void)deleteAction:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(ICNoteBrowseNavigationItemConfiguration *)self selectedNoteCount];
  id v6 = [(ICNoteBrowseNavigationItemConfiguration *)self delegate];
  id v7 = v6;
  if (v5) {
    [v6 noteBrowseNavigationItemConfiguration:self shouldDeleteSelectedFromBarButtonItem:v4];
  }
  else {
    [v6 noteBrowseNavigationItemConfiguration:self shouldDeleteAllFromBarButtonItem:v4];
  }
}

- (void)lockAction:(id)a3
{
  id v4 = a3;
  id v5 = [(ICNoteBrowseNavigationItemConfiguration *)self delegate];
  [v5 noteBrowseNavigationItemConfiguration:self shouldLockFromBarButtonItem:v4];
}

- (void)moveAction:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(ICNoteBrowseNavigationItemConfiguration *)self selectedNoteCount];
  id v6 = [(ICNoteBrowseNavigationItemConfiguration *)self delegate];
  id v7 = v6;
  if (v5) {
    [v6 noteBrowseNavigationItemConfiguration:self shouldMoveSelectedFromBarButtonItem:v4];
  }
  else {
    [v6 noteBrowseNavigationItemConfiguration:self shouldMoveAllFromBarButtonItem:v4];
  }
}

- (void)shareAction:(id)a3
{
  id v4 = a3;
  id v5 = [(ICNoteBrowseNavigationItemConfiguration *)self delegate];
  [v5 noteBrowseNavigationItemConfiguration:self shouldShareFromBarButtonItem:v4];
}

- (void)tagsAction:(id)a3
{
  id v4 = a3;
  id v5 = [(ICNoteBrowseNavigationItemConfiguration *)self delegate];
  [v5 noteBrowseNavigationItemConfiguration:self shouldAssignTagsFromBarButtonItem:v4];
}

- (UIViewController)presentingViewController
{
  id v3 = [(ICNoteBrowseNavigationItemConfiguration *)self dataSource];
  id v4 = [v3 noteBrowseNavigationItemConfigurationPresentingViewController:self];

  return (UIViewController *)v4;
}

- (unint64_t)hash
{
  v35 = +[NSNumber numberWithBool:[(ICNoteBrowseNavigationItemConfiguration *)self canAddNote]];
  v36[0] = v35;
  v34 = +[NSNumber numberWithBool:[(ICNoteBrowseNavigationItemConfiguration *)self canAssignTags]];
  v36[1] = v34;
  id v33 = +[NSNumber numberWithBool:[(ICNoteBrowseNavigationItemConfiguration *)self canDeleteNotes]];
  v36[2] = v33;
  v32 = +[NSNumber numberWithBool:[(ICNoteBrowseNavigationItemConfiguration *)self canMoveNotes]];
  v36[3] = v32;
  v31 = +[NSNumber numberWithBool:[(ICNoteBrowseNavigationItemConfiguration *)self canBeShared]];
  v36[4] = v31;
  v30 = +[NSNumber numberWithUnsignedInteger:[(ICNoteBrowseNavigationItemConfiguration *)self collectionType]];
  v36[5] = v30;
  v29 = +[NSNumber numberWithBool:[(ICNoteBrowseNavigationItemConfiguration *)self isAuthenticated]];
  v36[6] = v29;
  v28 = +[NSNumber numberWithBool:[(ICNoteBrowseNavigationItemConfiguration *)self isCompactWidth]];
  v36[7] = v28;
  v27 = +[NSNumber numberWithBool:[(ICNoteBrowseNavigationItemConfiguration *)self isCompactHeight]];
  v36[8] = v27;
  uint64_t v26 = +[NSNumber numberWithBool:[(ICNoteBrowseNavigationItemConfiguration *)self isEditing]];
  v36[9] = v26;
  id v25 = +[NSNumber numberWithBool:[(ICNoteBrowseNavigationItemConfiguration *)self isShowingEmptyState]];
  v36[10] = v25;
  v24 = +[NSNumber numberWithBool:[(ICNoteBrowseNavigationItemConfiguration *)self isShared]];
  v36[11] = v24;
  unint64_t v23 = +[NSNumber numberWithBool:[(ICNoteBrowseNavigationItemConfiguration *)self isTrashFolder]];
  v36[12] = v23;
  v22 = +[NSNumber numberWithInteger:[(ICNoteBrowseNavigationItemConfiguration *)self noteContainerViewMode]];
  v36[13] = v22;
  id v3 = +[NSNumber numberWithUnsignedInteger:[(ICNoteBrowseNavigationItemConfiguration *)self noteCount]];
  v36[14] = v3;
  id v4 = +[NSNumber numberWithUnsignedInteger:[(ICNoteBrowseNavigationItemConfiguration *)self selectedNoteCount]];
  v36[15] = v4;
  id v5 = +[NSNumber numberWithBool:[(ICNoteBrowseNavigationItemConfiguration *)self usesCustomBackButton]];
  v36[16] = v5;
  id v6 = +[NSNumber numberWithBool:[(ICNoteBrowseNavigationItemConfiguration *)self usesPlainBarButtonItems]];
  v36[17] = v6;
  id v7 = +[NSArray arrayWithObjects:v36 count:18];
  if ([v7 count])
  {
    unint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = 31;
    while (1)
    {
      CFStringRef v11 = [v7 objectAtIndexedSubscript:v8];
      if (((unint64_t)[v11 integerValue] & 0x8000000000000000) != 0) {
        break;
      }
      v9 += v10 + v10 * (void)[v11 unsignedIntegerValue];

      ++v8;
      v10 += 31;
      if (v8 >= (unint64_t)[v7 count]) {
        goto LABEL_8;
      }
    }
  }
  uint64_t v9 = 0;
LABEL_8:

  v12 = [(ICNoteBrowseNavigationItemConfiguration *)self navigationTitle];
  unint64_t v20 = sub_1000729F8(v9, v13, v14, v15, v16, v17, v18, v19, (char)v12);

  return v20;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ICNoteBrowseNavigationItemConfiguration *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = [(ICNoteBrowseNavigationItemConfiguration *)self hash];
    BOOL v7 = v6 == (id)[(ICNoteBrowseNavigationItemConfiguration *)v5 hash];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (ICNoteBrowseNavigationItemConfigurationDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (ICNoteBrowseNavigationItemConfigurationDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (ICNoteBrowseNavigationItemConfigurationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICNoteBrowseNavigationItemConfigurationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setActionBarButtonItem:(id)a3
{
}

- (void)setAddNoteBarButtonItem:(id)a3
{
}

- (BOOL)isAuthenticated
{
  return self->_authenticated;
}

- (void)setAuthenticated:(BOOL)a3
{
  self->_authenticated = a3;
}

- (unint64_t)collectionType
{
  return self->_collectionType;
}

- (void)setCollectionType:(unint64_t)a3
{
  self->_collectionType = a3;
}

- (BOOL)canAddNote
{
  return self->_canAddNote;
}

- (void)setCanAddNote:(BOOL)a3
{
  self->_canAddNote = a3;
}

- (BOOL)canDeleteNotes
{
  return self->_canDeleteNotes;
}

- (void)setCanDeleteNotes:(BOOL)a3
{
  self->_canDeleteNotes = a3;
}

- (BOOL)canMoveNotes
{
  return self->_canMoveNotes;
}

- (void)setCanMoveNotes:(BOOL)a3
{
  self->_canMoveNotes = a3;
}

- (BOOL)canAssignTags
{
  return self->_canAssignTags;
}

- (void)setCanAssignTags:(BOOL)a3
{
  self->_canAssignTags = a3;
}

- (BOOL)isCompactWidth
{
  return self->_compactWidth;
}

- (void)setCompactWidth:(BOOL)a3
{
  self->_compactWidth = a3;
}

- (BOOL)isCompactHeight
{
  return self->_compactHeight;
}

- (void)setCompactHeight:(BOOL)a3
{
  self->_compactHeight = a3;
}

- (void)setEditing:(BOOL)a3
{
  self->_editing = a3;
}

- (BOOL)showsDebugItem
{
  return self->_showsDebugItem;
}

- (void)setShowsDebugItem:(BOOL)a3
{
  self->_showsDebugItem = a3;
}

- (void)setDeleteBarButtonItem:(id)a3
{
}

- (void)setLockBarButtonItem:(id)a3
{
}

- (void)setMoveBarButtonItem:(id)a3
{
}

- (void)setShareBarButtonItem:(id)a3
{
}

- (void)setSummaryBarButtonItem:(id)a3
{
}

- (void)setTagsBarButtonItem:(id)a3
{
}

- (int64_t)noteContainerViewMode
{
  return self->_noteContainerViewMode;
}

- (void)setNoteContainerViewMode:(int64_t)a3
{
  self->_noteContainerViewMode = a3;
}

- (unint64_t)noteCount
{
  return self->_noteCount;
}

- (void)setNoteCount:(unint64_t)a3
{
  self->_noteCount = a3;
}

- (unint64_t)selectedNoteCount
{
  return self->_selectedNoteCount;
}

- (void)setSelectedNoteCount:(unint64_t)a3
{
  self->_selectedNoteCount = a3;
}

- (BOOL)canBeShared
{
  return self->_canBeShared;
}

- (void)setCanBeShared:(BOOL)a3
{
  self->_canBeShared = a3;
}

- (BOOL)isShared
{
  return self->_shared;
}

- (void)setShared:(BOOL)a3
{
  self->_shared = a3;
}

- (UIBarButtonItem)sharedBarButtonItem
{
  return self->_sharedBarButtonItem;
}

- (BOOL)isTrashFolder
{
  return self->_trashFolder;
}

- (void)setTrashFolder:(BOOL)a3
{
  self->_trashFolder = a3;
}

- (BOOL)usesCustomBackButton
{
  return self->_usesCustomBackButton;
}

- (void)setUsesCustomBackButton:(BOOL)a3
{
  self->_usesCustomBackButton = a3;
}

- (BOOL)usesPlainBarButtonItems
{
  return self->_usesPlainBarButtonItems;
}

- (void)setUsesPlainBarButtonItems:(BOOL)a3
{
  self->_usesPlainBarButtonItems = a3;
}

- (BOOL)isShowingEmptyState
{
  return self->_showingEmptyState;
}

- (void)setShowingEmptyState:(BOOL)a3
{
  self->_showingEmptyState = a3;
}

- (void)setCustomBackBarButtonItem:(id)a3
{
}

- (void)setDebugBarButtonItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugBarButtonItem, 0);
  objc_storeStrong((id *)&self->_customBackBarButtonItem, 0);
  objc_storeStrong((id *)&self->_sharedBarButtonItem, 0);
  objc_storeStrong((id *)&self->_tagsBarButtonItem, 0);
  objc_storeStrong((id *)&self->_summaryBarButtonItem, 0);
  objc_storeStrong((id *)&self->_shareBarButtonItem, 0);
  objc_storeStrong((id *)&self->_moveBarButtonItem, 0);
  objc_storeStrong((id *)&self->_lockBarButtonItem, 0);
  objc_storeStrong((id *)&self->_deleteBarButtonItem, 0);
  objc_storeStrong((id *)&self->_addNoteBarButtonItem, 0);
  objc_storeStrong((id *)&self->_actionBarButtonItem, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_dataSource);
}

@end