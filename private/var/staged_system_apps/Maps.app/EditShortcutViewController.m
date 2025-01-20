@interface EditShortcutViewController
- (BOOL)_isMapUserShortcut;
- (BOOL)_shouldAllowMeCardWriteback;
- (BOOL)allowsOpenContactAction;
- (BOOL)allowsRefineAction;
- (BOOL)allowsRemoveAction;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)headerNeeded;
- (BOOL)openingContactController;
- (BOOL)shouldAutoSaveEdit;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldReturn:(id)a3;
- (EditShortcutViewController)initWithShortcutEditSession:(id)a3;
- (ShortcutEditSession)shortcutEditSession;
- (ShortcutEditSessionController)sessionController;
- (double)preferredWidth;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_cellForAddress;
- (id)_cellForContactsAtIndexPath:(id)a3;
- (id)_cellForLabel;
- (id)_cellForOpenMeCard;
- (id)_cellForTypeAtIndexPath:(id)a3;
- (id)_cellForWriteToMeCard;
- (id)_configureCellForAddSharingContactAction:(id)a3;
- (id)_editShortcutTypeForIndex:(unint64_t)a3;
- (id)_footerStringForShortcutType:(int64_t)a3;
- (id)_meCardTextForType:(int64_t)a3;
- (id)_sectionForIndex:(unint64_t)a3;
- (id)_shortcutTypes;
- (id)_titleForSection:(int64_t)a3;
- (id)keyCommands;
- (id)preferredFocusEnvironments;
- (id)shortcut;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (int64_t)tableViewStyle;
- (unint64_t)_typeForIndex:(unint64_t)a3;
- (void)_addPersonAction;
- (void)_buildContent;
- (void)_cancelAction:(id)a3;
- (void)_close;
- (void)_doneAction:(id)a3;
- (void)_openContact;
- (void)_refineAction;
- (void)_removeAction;
- (void)_removeContact:(id)a3 fromSection:(int64_t)a4;
- (void)_save;
- (void)_updateWithType:(int64_t)a3;
- (void)didBecomeCurrent;
- (void)didDismissByGesture;
- (void)didEditContactWithAddressAdded:(BOOL)a3;
- (void)handleDismissAction:(id)a3;
- (void)meCardWritebackToggled:(id)a3;
- (void)resetToMapItemType;
- (void)scrollViewDidScroll:(id)a3;
- (void)setOpeningContactController:(BOOL)a3;
- (void)setSessionController:(id)a3;
- (void)setupSubviews;
- (void)shoulDismissForVerticalSwipe_nonUIKitCardsOnly;
- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation EditShortcutViewController

- (EditShortcutViewController)initWithShortcutEditSession:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)EditShortcutViewController;
  v6 = [(EditShortcutViewController *)&v16 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    v8 = [(ContaineeViewController *)v6 cardPresentationController];
    [v8 setPresentedModally:1];

    v9 = [(ContaineeViewController *)v7 cardPresentationController];
    [v9 setTakesAvailableHeight:1];

    objc_storeStrong((id *)&v7->_shortcutEditSession, a3);
    v10 = [(ShortcutEditSession *)v7->_shortcutEditSession shortcut];
    uint64_t v11 = [v10 customName];
    originalShortcutName = v7->_originalShortcutName;
    v7->_originalShortcutName = (NSString *)v11;

    [(EditShortcutViewController *)v7 _buildContent];
    uint64_t v13 = +[AddressBookManager sharedManager];
    sharedManager = v7->_sharedManager;
    v7->_sharedManager = (AddressBookManager *)v13;
  }
  return v7;
}

- (BOOL)allowsOpenContactAction
{
  return ![(EditShortcutViewController *)self _isMapUserShortcut];
}

- (BOOL)allowsRefineAction
{
  return ![(EditShortcutViewController *)self _isMapUserShortcut];
}

- (BOOL)allowsRemoveAction
{
  return [(ShortcutEditSession *)self->_shortcutEditSession alreadySaved];
}

- (BOOL)shouldAutoSaveEdit
{
  if (sub_1000BBB44(self) == 5
    && [(EditShortcutViewController *)self modalPresentationStyle] != (id)2)
  {
    return ![(EditShortcutViewController *)self openingContactController];
  }
  else
  {
    return 0;
  }
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if ("_doneAction:" == a3)
  {
    v8 = [(EditShortcutTitleCell *)self->_editTitleCell titleText];
    BOOL v9 = [v8 length] != 0;
  }
  else
  {
    if ("_addPersonAction" == a3)
    {
      unsigned __int8 v7 = [(EditShortcutViewController *)self allowsAddPersonAction];
    }
    else if ("_refineAction" == a3)
    {
      unsigned __int8 v7 = [(EditShortcutViewController *)self allowsRefineAction];
    }
    else if ("_removeAction" == a3)
    {
      unsigned __int8 v7 = [(EditShortcutViewController *)self allowsRemoveAction];
    }
    else
    {
      v11.receiver = self;
      v11.super_class = (Class)EditShortcutViewController;
      unsigned __int8 v7 = [(EditShortcutViewController *)&v11 canPerformAction:a3 withSender:v6];
    }
    BOOL v9 = v7;
  }

  return v9;
}

- (id)keyCommands
{
  unsigned int v3 = +[LibraryUIUtilities isMyPlacesEnabled];
  v4 = +[NSBundle mainBundle];
  id v5 = v4;
  if (v3) {
    CFStringRef v6 = @"[Shortcut KeyCmd] Unpin";
  }
  else {
    CFStringRef v6 = @"[Shortcut KeyCmd] Remove Favorite";
  }
  unsigned __int8 v7 = [v4 localizedStringForKey:v6 value:@"localized string not found" table:0];

  v22.receiver = self;
  v22.super_class = (Class)EditShortcutViewController;
  v8 = [(ContaineeViewController *)&v22 keyCommands];
  v21 = +[NSBundle mainBundle];
  v20 = [v21 localizedStringForKey:@"[Shortcut KeyCmd] Done" value:@"localized string not found" table:0];
  v19 = +[UIKeyCommand commandWithTitle:v20 image:0 action:"_doneAction:" input:@"\r" modifierFlags:0x100000 propertyList:0];
  v23[0] = v19;
  v18 = +[NSBundle mainBundle];
  BOOL v9 = [v18 localizedStringForKey:@"[Shortcut KeyCmd] Add Person" value:@"localized string not found" table:0];
  v10 = +[UIKeyCommand commandWithTitle:v9 image:0 action:"_addPersonAction" input:@"a" modifierFlags:0x100000 propertyList:0];
  v23[1] = v10;
  objc_super v11 = +[NSBundle mainBundle];
  v12 = [v11 localizedStringForKey:@"[Shortcut KeyCmd] Refine Location" value:@"localized string not found" table:0];
  uint64_t v13 = +[UIKeyCommand commandWithTitle:v12 image:0 action:"_refineAction" input:@"r" modifierFlags:1572864 propertyList:0];
  v23[2] = v13;
  v14 = +[UIKeyCommand commandWithTitle:v7 image:0 action:"_removeAction" input:@"\b" modifierFlags:0x100000 propertyList:0];
  v23[3] = v14;
  v15 = +[NSArray arrayWithObjects:v23 count:4];
  objc_super v16 = [v8 arrayByAddingObjectsFromArray:v15];

  return v16;
}

- (id)preferredFocusEnvironments
{
  v2 = [(SimpleContaineeViewController *)self actionsTableView];
  id v5 = v2;
  unsigned int v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return v3;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)EditShortcutViewController;
  [(SimpleContaineeViewController *)&v6 viewDidLoad];
  unsigned int v3 = [(EditShortcutViewController *)self view];
  [v3 setAccessibilityIdentifier:@"EditShortcutView"];

  v4 = +[UIColor clearColor];
  id v5 = [(EditShortcutViewController *)self view];
  [v5 setBackgroundColor:v4];
}

- (void)setupSubviews
{
  v55.receiver = self;
  v55.super_class = (Class)EditShortcutViewController;
  [(SimpleContaineeViewController *)&v55 setupSubviews];
  unsigned int v3 = [(ContaineeViewController *)self headerView];
  if (sub_1000BBB44(self) == 5)
  {
    if ([(EditShortcutViewController *)self modalPresentationStyle] != (id)2) {
      goto LABEL_6;
    }
    id v4 = objc_alloc((Class)UINavigationItem);
    id v5 = +[NSBundle mainBundle];
    objc_super v6 = [v5 localizedStringForKey:@"[Shortcut] Details" value:@"localized string not found" table:0];
    id v7 = [v4 initWithTitle:v6];

    id v8 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"_cancelAction:"];
    [v7 setLeftBarButtonItem:v8];

    id v9 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"_doneAction:"];
    id v48 = v7;
    [v7 setRightBarButtonItem:v9];

    id v10 = objc_alloc_init((Class)UINavigationBar);
    [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v10 pushNavigationItem:v7 animated:0];
    objc_super v11 = [(ContaineeViewController *)self headerView];
    [v11 addSubview:v10];

    v12 = [v10 topAnchor];
    v53 = [v3 topAnchor];
    v54 = v12;
    v52 = [v12 constraintEqualToAnchor:v53];
    v56[0] = v52;
    uint64_t v13 = [v10 leadingAnchor];
    v50 = [v3 leadingAnchor];
    v51 = v13;
    v49 = [v13 constraintEqualToAnchor:v50];
    v56[1] = v49;
    v14 = [v10 trailingAnchor];
    v15 = [v3 trailingAnchor];
    objc_super v16 = [v14 constraintEqualToAnchor:v15];
    v56[2] = v16;
    v17 = [v10 bottomAnchor];
    v18 = [v3 bottomAnchor];
    v19 = [v17 constraintEqualToAnchor:v18];
    v56[3] = v19;
    +[NSArray arrayWithObjects:v56 count:4];
    v21 = v20 = v3;
    +[NSLayoutConstraint activateConstraints:v21];

    unsigned int v3 = v20;
    objc_super v22 = v48;
  }
  else
  {
    v23 = [ModalCardHeaderView alloc];
    v24 = +[ModalCardHeaderConfiguration defaultModalCardHeaderConfiguration];
    v25 = [(ModalCardHeaderView *)v23 initWithConfiguration:v24];

    [(ModalCardHeaderView *)v25 setUseAdaptiveFont:1];
    [(ModalCardHeaderView *)v25 setTranslatesAutoresizingMaskIntoConstraints:0];
    v26 = +[NSBundle mainBundle];
    v27 = [v26 localizedStringForKey:@"[Shortcut] Details" value:@"localized string not found" table:0];
    [(ModalCardHeaderView *)v25 setTitle:v27];

    v28 = [(ModalCardHeaderView *)v25 leadingButton];
    v29 = sub_100AEBD5C();
    [v28 setTitle:v29 forState:0];

    v30 = [(ModalCardHeaderView *)v25 leadingButton];
    [v30 addTarget:self action:"_cancelAction:" forControlEvents:64];

    v31 = [(ModalCardHeaderView *)v25 trailingButton];
    v32 = sub_100AEBDC4();
    [v31 setTitle:v32 forState:0];

    v33 = [(ModalCardHeaderView *)v25 trailingButton];
    [v33 addTarget:self action:"_doneAction:" forControlEvents:64];

    [v3 addSubview:v25];
    modalHeaderView = self->_modalHeaderView;
    self->_modalHeaderView = v25;
    v19 = v25;

    objc_super v22 = [(ModalCardHeaderView *)v19 topAnchor];
    id v10 = [v3 topAnchor];
    v54 = [v22 constraintEqualToAnchor:v10];
    v57[0] = v54;
    v35 = [(ModalCardHeaderView *)v19 leadingAnchor];
    v52 = [v3 leadingAnchor];
    v53 = v35;
    v51 = [v35 constraintEqualToAnchor:v52];
    v57[1] = v51;
    v36 = [(ModalCardHeaderView *)v19 trailingAnchor];
    v49 = [v3 trailingAnchor];
    v50 = v36;
    v14 = [v36 constraintEqualToAnchor:v49];
    v57[2] = v14;
    v15 = [(ModalCardHeaderView *)v19 bottomAnchor];
    objc_super v16 = [v3 bottomAnchor];
    v17 = [v15 constraintEqualToAnchor:v16];
    v57[3] = v17;
    v18 = +[NSArray arrayWithObjects:v57 count:4];
    +[NSLayoutConstraint activateConstraints:v18];
  }

LABEL_6:
  v37 = [(SimpleContaineeViewController *)self actionsTableView];
  [v37 setAccessibilityIdentifier:@"EditShortcutActionsTable"];

  v38 = [(SimpleContaineeViewController *)self actionsTableView];
  [v38 _setHeaderAndFooterViewsFloat:0];

  v39 = [(SimpleContaineeViewController *)self actionsTableView];
  [v39 registerClass:objc_opt_class() forCellReuseIdentifier:@"EditShortcutActionCell"];

  if (sub_1000BBB44(self) == 5)
  {
    v40 = [(SimpleContaineeViewController *)self actionsTableView];
    [v40 setSeparatorStyle:0];

    v41 = [(EditShortcutViewController *)self view];
    v42 = [v41 widthAnchor];
    LODWORD(v43) = 1144733696;
    v44 = [v42 constraintEqualToConstant:290.0 priority:v43];
    [v44 setActive:1];
  }
  else
  {
    v41 = [(EditShortcutViewController *)self theme];
    v42 = [v41 groupTableViewHairlineColor];
    v44 = [(SimpleContaineeViewController *)self actionsTableView];
    [v44 setSeparatorColor:v42];
  }

  v45 = [(SimpleContaineeViewController *)self actionsTableView];
  [v45 _maps_registerGroupedHeaderView];

  v46 = [(SimpleContaineeViewController *)self actionsTableView];
  [v46 _maps_registerSelectableFooterView];

  v47 = [(SimpleContaineeViewController *)self actionsTableView];
  [v47 registerClass:objc_opt_class() forHeaderFooterViewReuseIdentifier:@"kMacEditShortcutHeaderFooterIdentifier"];
}

- (void)shoulDismissForVerticalSwipe_nonUIKitCardsOnly
{
  v3.receiver = self;
  v3.super_class = (Class)EditShortcutViewController;
  [(ContaineeViewController *)&v3 shoulDismissForVerticalSwipe_nonUIKitCardsOnly];
  if (!self->_dismissed) {
    [(EditShortcutViewController *)self _close];
  }
}

- (void)handleDismissAction:(id)a3
{
}

- (void)didBecomeCurrent
{
  v3.receiver = self;
  v3.super_class = (Class)EditShortcutViewController;
  [(ContaineeViewController *)&v3 didBecomeCurrent];
  [(EditShortcutViewController *)self _buildContent];
  if (![(ShortcutEditSession *)self->_shortcutEditSession didResignTitleFocus]
    && ![(ShortcutEditSession *)self->_shortcutEditSession alreadySaved])
  {
    [(EditShortcutTitleCell *)self->_editTitleCell makeFirstResponder];
  }
}

- (void)resetToMapItemType
{
}

- (void)didEditContactWithAddressAdded:(BOOL)a3
{
  if (!a3) {
    [(EditShortcutViewController *)self resetToMapItemType];
  }
  [(EditShortcutViewController *)self _buildContent];
  double y = CGPointZero.y;
  id v5 = [(SimpleContaineeViewController *)self actionsTableView];
  [v5 setContentOffset:CGPointZero.x, y];
}

- (void)_updateWithType:(int64_t)a3
{
  -[ShortcutEditSession setType:](self->_shortcutEditSession, "setType:");
  if ((unint64_t)a3 > 5
    || ((1 << a3) & 0x2C) == 0
    || +[LibraryUIUtilities isMyPlacesEnabled])
  {
    self->_needsMeCardUpdate = 1;
    [(EditShortcutViewController *)self _buildContent];
    return;
  }
  id v5 = [(EditShortcutViewController *)self shortcut];
  objc_super v6 = [v5 geoMapItem];
  id v7 = [v6 addressObject];
  id v14 = [v7 cnPostalAddress];

  id v8 = v14;
  if (v14)
  {
    switch(a3)
    {
      case 2:
        id v9 = (id *)&CNLabelHome;
        break;
      case 5:
        id v9 = (id *)&CNLabelSchool;
        break;
      case 3:
        id v9 = (id *)&CNLabelWork;
        break;
      default:
        id v10 = 0;
        goto LABEL_16;
    }
    id v10 = *v9;
LABEL_16:
    objc_super v11 = +[CNLabeledValue labeledValueWithLabel:v10 value:v14];
    v12 = [(EditShortcutViewController *)self sessionController];
    uint64_t v13 = [(SimpleContaineeViewController *)self actionsTableView];
    [v12 showMeCardWithAddress:v11 from:v13];

    id v8 = v14;
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)EditShortcutViewController;
  [(SimpleContaineeViewController *)&v4 viewWillAppear:a3];
  [(ModalCardHeaderView *)self->_modalHeaderView setScrollViewOffset:0.0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)EditShortcutViewController;
  [(SimpleContaineeViewController *)&v4 viewWillDisappear:a3];
  if ([(EditShortcutViewController *)self shouldAutoSaveEdit]) {
    [(EditShortcutViewController *)self _save];
  }
}

- (void)_save
{
  if ([(ShortcutEditSession *)self->_shortcutEditSession canBeSaved])
  {
    shortcutEditSession = self->_shortcutEditSession;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10068F62C;
    v4[3] = &unk_1012E7D28;
    v4[4] = self;
    [(ShortcutEditSession *)shortcutEditSession saveWithCompletion:v4];
  }
}

- (double)preferredWidth
{
  if (sub_1000BBB44(self) == 5) {
    return 290.0;
  }
  v4.receiver = self;
  v4.super_class = (Class)EditShortcutViewController;
  [(SimpleContaineeViewController *)&v4 preferredWidth];
  return result;
}

- (BOOL)headerNeeded
{
  return 0;
}

- (int64_t)tableViewStyle
{
  return 2 * (sub_1000BBB44(self) != 5);
}

- (id)shortcut
{
  return [(ShortcutEditSession *)self->_shortcutEditSession shortcut];
}

- (id)_shortcutTypes
{
  unsigned __int8 v2 = +[AddressBookManager addressBookAllowed];
  uint64_t Integer = GEOConfigGetInteger();
  uint64_t v4 = +[EditShortcutType shortcutWithType:1];
  id v5 = (void *)v4;
  if ((v2 & 1) != 0 || Integer != 1)
  {
    id v7 = +[EditShortcutType shortcutWithType:](EditShortcutType, "shortcutWithType:", 2, v4);
    v11[1] = v7;
    id v8 = +[EditShortcutType shortcutWithType:3];
    v11[2] = v8;
    id v9 = +[EditShortcutType shortcutWithType:5];
    v11[3] = v9;
    objc_super v6 = +[NSArray arrayWithObjects:v11 count:4];
  }
  else
  {
    uint64_t v12 = v4;
    objc_super v6 = +[NSArray arrayWithObjects:&v12 count:1];
  }

  return v6;
}

- (id)_editShortcutTypeForIndex:(unint64_t)a3
{
  uint64_t v4 = [(EditShortcutViewController *)self _shortcutTypes];
  if ((unint64_t)[v4 count] <= a3) {
    +[EditShortcutType shortcutWithType:0];
  }
  else {
  id v5 = [v4 objectAtIndexedSubscript:a3];
  }

  return v5;
}

- (BOOL)_isMapUserShortcut
{
  unsigned __int8 v2 = [(EditShortcutViewController *)self shortcut];
  BOOL v3 = [v2 type] == (id)1;

  return v3;
}

- (void)_buildContent
{
  uint64_t v3 = sub_1000BBB44(self);
  id v4 = objc_alloc((Class)NSMutableArray);
  id v5 = +[EditShortcutSection sectionWithType:1];
  objc_super v6 = +[EditShortcutSection sectionWithType:2];
  id v7 = [v4 initWithObjects:v5, v6, 0];

  id v8 = objc_alloc_init((Class)NSMutableArray);
  if (v3 == 5
    && [(EditShortcutViewController *)self allowsOpenContactAction]
    && !+[LibraryUIUtilities isMyPlacesEnabled])
  {
    id v9 = +[EditShortcutSection sectionWithType:5];
    [v7 addObject:v9];
  }
  if (!+[LibraryUIUtilities isMyPlacesEnabled])
  {
    if (![(EditShortcutViewController *)self _isMapUserShortcut]) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  id v10 = [(EditShortcutViewController *)self shortcutEditSession];
  unsigned __int8 v11 = [v10 canChangeType];

  if (v11)
  {
LABEL_9:
    uint64_t v12 = +[EditShortcutSection sectionWithType:3];
    [v7 addObject:v12];
  }
LABEL_10:
  if ([(EditShortcutViewController *)self _shouldAllowMeCardWriteback])
  {
    uint64_t v13 = +[EditShortcutSection sectionWithType:7];
    [v7 addObject:v13];
  }
  if ([(EditShortcutViewController *)self allowsAddPersonAction])
  {
    id v14 = +[EditShortcutSection sectionWithType:4];
    [v7 addObject:v14];
  }
  if (v3 == 5
    && [(EditShortcutViewController *)self allowsOpenContactAction]
    && !+[LibraryUIUtilities isMyPlacesEnabled])
  {
    v15 = objc_alloc_init(SimpleContaineeAction);
    objc_super v16 = +[NSBundle mainBundle];
    v17 = [v16 localizedStringForKey:@"[Shortcut] Open My Card" value:@"localized string not found" table:0];
    [(SimpleContaineeAction *)v15 setTitle:v17];

    [(SimpleContaineeAction *)v15 setGlyph:@"person.circle"];
    [(SimpleContaineeAction *)v15 setAccessibilityIdentifier:@"EditShortcutMeCardActionCell"];
    [(SimpleContaineeAction *)v15 setLabelAccessibilityIdentifier:@"EditShortcutMeCardActionLabel"];
    objc_initWeak(&location, self);
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_100690024;
    v39[3] = &unk_1012E6708;
    objc_copyWeak(&v40, &location);
    [(SimpleContaineeAction *)v15 setAction:v39];
    [v8 addObject:v15];
    objc_destroyWeak(&v40);
    objc_destroyWeak(&location);
  }
  if (!+[LibraryUIUtilities isMyPlacesEnabled])
  {
    if ([(EditShortcutViewController *)self _isMapUserShortcut]) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if ([(ShortcutEditSession *)self->_shortcutEditSession alreadySaved])
  {
    v18 = [(ShortcutEditSession *)self->_shortcutEditSession shortcut];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v20 = [(ShortcutEditSession *)self->_shortcutEditSession shortcut];
      unsigned __int8 v21 = [v20 isHomeWorkOrSchool];

      if (v21)
      {
LABEL_24:
        objc_super v22 = objc_alloc_init(SimpleContaineeAction);
        v23 = +[NSBundle mainBundle];
        v24 = [v23 localizedStringForKey:@"[Shortcut] Refine Location" value:@"localized string not found" table:0];
        [(SimpleContaineeAction *)v22 setTitle:v24];

        [(SimpleContaineeAction *)v22 setGlyph:@"mappin.and.ellipse"];
        [(SimpleContaineeAction *)v22 setGlyphStyle:2];
        [(SimpleContaineeAction *)v22 setAccessibilityIdentifier:@"EditShortcutRefineLocationActionCell"];
        [(SimpleContaineeAction *)v22 setLabelAccessibilityIdentifier:@"EditShortcutRefineLocationActionLabel"];
        objc_initWeak(&location, self);
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472;
        v37[2] = sub_100690068;
        v37[3] = &unk_1012E6708;
        objc_copyWeak(&v38, &location);
        [(SimpleContaineeAction *)v22 setAction:v37];
        [v8 addObject:v22];
        objc_destroyWeak(&v38);
        objc_destroyWeak(&location);
      }
    }
  }
LABEL_25:
  if ([(EditShortcutViewController *)self allowsRemoveAction])
  {
    v25 = objc_alloc_init(SimpleContaineeAction);
    unsigned int v26 = +[LibraryUIUtilities isMyPlacesEnabled];
    v27 = +[NSBundle mainBundle];
    v28 = v27;
    if (v26) {
      CFStringRef v29 = @"[Shortcut] Unpin";
    }
    else {
      CFStringRef v29 = @"[Shortcut] Remove Favorite";
    }
    v30 = [v27 localizedStringForKey:v29 value:@"localized string not found" table:0];
    [(SimpleContaineeAction *)v25 setTitle:v30];

    [(SimpleContaineeAction *)v25 setGlyph:@"trash.circle.fill"];
    [(SimpleContaineeAction *)v25 setGlyphStyle:3];
    [(SimpleContaineeAction *)v25 setStyle:1];
    [(SimpleContaineeAction *)v25 setAccessibilityIdentifier:@"EditShortcutRemoveActionCell"];
    [(SimpleContaineeAction *)v25 setLabelAccessibilityIdentifier:@"EditShortcutRemoveActionLabel"];
    objc_initWeak(&location, self);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1006900AC;
    v35[3] = &unk_1012E6708;
    objc_copyWeak(&v36, &location);
    [(SimpleContaineeAction *)v25 setAction:v35];
    [v8 addObject:v25];
    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
  }
  [(SimpleContaineeViewController *)self setActions:v8];
  if ([v8 count])
  {
    v31 = +[EditShortcutSection sectionWithType:6];
    [v7 addObject:v31];
  }
  v32 = (NSArray *)[v7 copy];
  sections = self->_sections;
  self->_sections = v32;

  v34 = [(SimpleContaineeViewController *)self actionsTableView];
  [v34 reloadData];
}

- (BOOL)_shouldAllowMeCardWriteback
{
  if (!+[LibraryUIUtilities isMyPlacesEnabled])
  {
    char v2 = 0;
    return v2 & 1;
  }
  id v4 = [(EditShortcutViewController *)self shortcut];
  if ([v4 isPersisted] && !self->_needsMeCardUpdate
    || !+[AddressBookManager addressBookAllowed])
  {
    goto LABEL_8;
  }
  unint64_t v5 = (unint64_t)[v4 type];
  if (v5 <= 6)
  {
    if (((1 << v5) & 0x2C) != 0)
    {
      if (!self->_needsMeCardUpdate)
      {
        char v2 = 1;
        goto LABEL_10;
      }
      uint64_t BOOL = GEOConfigGetBOOL();
      char v2 = 1;
      goto LABEL_9;
    }
    if (((1 << v5) & 0x43) != 0)
    {
LABEL_8:
      uint64_t BOOL = 0;
      char v2 = 0;
LABEL_9:
      [v4 setIsMeCardWritebackEnabled:BOOL];
    }
  }
LABEL_10:

  return v2 & 1;
}

- (id)_sectionForIndex:(unint64_t)a3
{
  if ([(NSArray *)self->_sections count] <= a3)
  {
    unint64_t v5 = 0;
  }
  else
  {
    unint64_t v5 = [(NSArray *)self->_sections objectAtIndexedSubscript:a3];
  }

  return v5;
}

- (unint64_t)_typeForIndex:(unint64_t)a3
{
  if ([(NSArray *)self->_sections count] <= a3) {
    return 0;
  }
  unint64_t v5 = [(NSArray *)self->_sections objectAtIndexedSubscript:a3];
  id v6 = [v5 type];

  return (unint64_t)v6;
}

- (void)_removeContact:(id)a3 fromSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(ShortcutEditSession *)self->_shortcutEditSession contacts];
  id v8 = [v7 indexOfObject:v6];

  if (v8 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v9 = +[NSIndexPath indexPathForRow:v8 inSection:a4];
    [(ShortcutEditSession *)self->_shortcutEditSession removeSharing:v6];
    id v10 = [(SimpleContaineeViewController *)self actionsTableView];
    uint64_t v12 = v9;
    unsigned __int8 v11 = +[NSArray arrayWithObjects:&v12 count:1];
    [v10 deleteRowsAtIndexPaths:v11 withRowAnimation:100];

    +[GEOAPPortal captureUserAction:2079 target:253 value:0];
  }
}

- (id)_meCardTextForType:(int64_t)a3
{
  switch(a3)
  {
    case 5:
      uint64_t v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"[Shortcut] School Address Footer";
      goto LABEL_7;
    case 3:
      uint64_t v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"[Shortcut] Work Address Footer";
      goto LABEL_7;
    case 2:
      uint64_t v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"[Shortcut] Home Address Footer";
LABEL_7:
      id v6 = [v3 localizedStringForKey:v5 value:@"localized string not found" table:0];

      goto LABEL_9;
  }
  id v6 = 0;
LABEL_9:

  return v6;
}

- (void)_close
{
  self->_dismissed = 1;
  id v3 = [(EditShortcutViewController *)self sessionController];
  [v3 closeViewController:self];
}

- (void)_cancelAction:(id)a3
{
  if ([(NSString *)self->_originalShortcutName length]) {
    [(ShortcutEditSession *)self->_shortcutEditSession setName:self->_originalShortcutName];
  }

  [(EditShortcutViewController *)self _close];
}

- (void)_doneAction:(id)a3
{
  id v4 = a3;
  if (+[LibraryUIUtilities isMyPlacesEnabled])
  {
    objc_initWeak(&location, self);
    shortcutEditSession = self->_shortcutEditSession;
    id v6 = [(EditShortcutTitleCell *)self->_editTitleCell titleText];
    [(ShortcutEditSession *)shortcutEditSession setName:v6];

    id v7 = self->_shortcutEditSession;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100690774;
    v14[3] = &unk_1012E6998;
    id v8 = &v15;
    objc_copyWeak(&v15, &location);
    [(ShortcutEditSession *)v7 saveWithCompletion:v14];
  }
  else
  {
    objc_initWeak(&location, self);
    id v9 = self->_shortcutEditSession;
    id v10 = [(EditShortcutTitleCell *)self->_editTitleCell titleText];
    [(ShortcutEditSession *)v9 setName:v10];

    unsigned __int8 v11 = self->_shortcutEditSession;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10069094C;
    v12[3] = &unk_1012E6998;
    id v8 = &v13;
    objc_copyWeak(&v13, &location);
    [(ShortcutEditSession *)v11 saveWithCompletion:v12];
  }
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
  +[GEOAPPortal captureUserAction:2053 target:0 value:0];
}

- (void)_removeAction
{
  id v3 = [(EditShortcutViewController *)self sessionController];
  [v3 removeShortcut:self->_shortcutEditSession];

  +[GEOAPPortal captureUserAction:2060 target:253 value:0];
}

- (void)_refineAction
{
  id v3 = [(EditShortcutViewController *)self sessionController];
  [v3 showRefineLocation:self->_shortcutEditSession];

  +[GEOAPPortal captureUserAction:2063 target:253 value:0];
}

- (void)_addPersonAction
{
  id v3 = [(EditShortcutViewController *)self sessionController];
  [v3 showAddContact:self->_shortcutEditSession];

  +[GEOAPPortal captureUserAction:2078 target:253 value:0];
}

- (void)_openContact
{
  id v4 = [(AddressBookManager *)self->_sharedManager meCardPunchOutURL];
  id v3 = +[UIApplication sharedApplication];
  [v3 _maps_openURL:v4];

  [(EditShortcutViewController *)self _close];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NSArray *)self->_sections count];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  unint64_t v7 = [(EditShortcutViewController *)self _typeForIndex:a4];
  if (v7 == 6)
  {
    v11.receiver = self;
    v11.super_class = (Class)EditShortcutViewController;
    int64_t v9 = [(SimpleContaineeViewController *)&v11 tableView:v6 numberOfRowsInSection:a4];
  }
  else
  {
    if (v7 == 4)
    {
      id v8 = [(ShortcutEditSession *)self->_shortcutEditSession contacts];
      int64_t v9 = (int64_t)[v8 count] + 1;
    }
    else
    {
      if (v7 != 3)
      {
        int64_t v9 = 1;
        goto LABEL_9;
      }
      id v8 = [(EditShortcutViewController *)self _shortcutTypes];
      int64_t v9 = (int64_t)[v8 count];
    }
  }
LABEL_9:

  return v9;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  unint64_t v7 = [(EditShortcutViewController *)self _typeForIndex:a4];
  id v8 = [(EditShortcutViewController *)self _titleForSection:a4];
  if (sub_1000BBB44(self) == 5)
  {
    if ([v8 isEqualToString:&stru_101324E70]) {
      int64_t v9 = (MacEditShortcutHeaderFooterView *)objc_alloc_init((Class)UIView);
    }
    else {
      int64_t v9 = [[MacEditShortcutHeaderFooterView alloc] initWithTitle:v8 reuseIdentifier:@"kMacEditShortcutHeaderFooterIdentifier"];
    }
    v17 = v9;
  }
  else
  {
    if (v7 == 2)
    {
      id v10 = [(EditShortcutViewController *)self shortcut];
      unint64_t v11 = (unint64_t)[v10 type];
      if (v11 <= 5 && ((1 << v11) & 0x2C) != 0)
      {
        unsigned __int8 v12 = +[LibraryUIUtilities isMyPlacesEnabled];

        if ((v12 & 1) == 0)
        {
          id v13 = +[NSBundle mainBundle];
          id v14 = [v13 localizedStringForKey:@"[Shortcut] Contact Card" value:@"localized string not found" table:0];

          id v15 = [v6 _maps_groupedHeaderViewWithTitle:v8 buttonTitle:v14 target:self selector:"_openContact"];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_super v16 = v15;
          }
          else {
            objc_super v16 = 0;
          }
          v17 = v16;

          v18 = [@"EditShortcutSectionType" stringByAppendingString:@"Address"];
          [(MacEditShortcutHeaderFooterView *)v17 updateAXIdentifiersWithPrefix:v18];

          goto LABEL_21;
        }
      }
      else
      {
      }
    }
    v19 = [v6 _maps_groupedHeaderViewWithTitle:v8];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v20 = v19;
    }
    else {
      v20 = 0;
    }
    v17 = v20;

    if (v7 <= 7)
    {
      v19 = [@"EditShortcutSectionType" stringByAppendingString:*(&off_1012F41C8 + v7)];
    }
    [(MacEditShortcutHeaderFooterView *)v17 updateAXIdentifiersWithPrefix:v19];
  }
LABEL_21:

  return v17;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v7 = a3;
  if (sub_1000BBB44(self) == 5) {
    goto LABEL_2;
  }
  unint64_t v9 = [(EditShortcutViewController *)self _typeForIndex:a4];
  id v10 = [v7 footerViewForSection:a4];
  if (v9 <= 7)
  {
    id v4 = [@"EditShortcutSectionType" stringByAppendingString:*(&off_1012F41C8 + v9)];
  }
  unint64_t v11 = [v4 stringByAppendingString:@"Footer"];
  [v10 setAccessibilityIdentifier:v11];

  unsigned __int8 v12 = [(EditShortcutViewController *)self tableView:v7 titleForFooterInSection:a4];

  if (v12)
  {
    id v8 = objc_alloc_init((Class)UITableViewHeaderFooterView);
    id v13 = +[UIListContentConfiguration groupedFooterConfiguration];
    id v14 = [(EditShortcutViewController *)self tableView:v7 titleForFooterInSection:a4];
    [v13 setText:v14];

    [v8 setContentConfiguration:v13];
  }
  else
  {
    if (v9 != 7
      || (+[AddressBookManager sharedManager],
          objc_super v16 = objc_claimAutoreleasedReturnValue(),
          [v16 meCard],
          v17 = objc_claimAutoreleasedReturnValue(),
          v17,
          v16,
          !v17))
    {
LABEL_2:
      id v8 = 0;
      goto LABEL_8;
    }
    id v18 = objc_alloc((Class)NSString);
    v19 = +[NSBundle mainBundle];
    v20 = [v19 localizedStringForKey:@"[Shortcut] Contact Card link" value:@"localized string not found" table:0];
    id v13 = [v18 initWithString:v20];

    unsigned __int8 v21 = [(EditShortcutViewController *)self shortcut];
    objc_super v22 = -[EditShortcutViewController _footerStringForShortcutType:](self, "_footerStringForShortcutType:", [v21 type]);

    if (v22)
    {
      v23 = [v7 _maps_footerViewWithTitle:v22 linkText:v13 target:self selector:"_openContact"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v24 = v23;
      }
      else {
        v24 = 0;
      }
      id v8 = v24;
    }
    else
    {
      id v8 = 0;
    }
  }
LABEL_8:

  return v8;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  if (sub_1000BBB44(self) != 5) {
    return UITableViewAutomaticDimension;
  }
  id v6 = [(EditShortcutViewController *)self _titleForSection:a4];
  if ([v6 isEqualToString:&stru_101324E70])
  {
    if ((id)[(EditShortcutViewController *)self _typeForIndex:a4] == (id)1) {
      double v7 = 0.0;
    }
    else {
      double v7 = 14.0;
    }
  }
  else
  {
    double v7 = UITableViewAutomaticDimension;
  }

  return v7;
}

- (id)_titleForSection:(int64_t)a3
{
  switch([(EditShortcutViewController *)self _typeForIndex:a3])
  {
    case 1uLL:
      if (sub_1000BBB44(self) == 5) {
        goto LABEL_3;
      }
      id v10 = +[NSBundle mainBundle];
      id v4 = v10;
      CFStringRef v11 = @"[Shortcut] Label";
      goto LABEL_12;
    case 2uLL:
      CFStringRef v5 = +[NSBundle mainBundle];
      id v4 = [v5 localizedStringForKey:@"[Shortcut] Address" value:@"localized string not found" table:0];

      if (sub_1000BBB44(self) == 5) {
        break;
      }
      id v6 = [(EditShortcutViewController *)self shortcut];
      unint64_t v7 = (unint64_t)[v6 type];

      if (v7 > 5
        || ((1 << v7) & 0x2C) == 0
        || +[LibraryUIUtilities isMyPlacesEnabled])
      {
        break;
      }
      id v8 = +[NSBundle mainBundle];
      uint64_t v9 = [v8 localizedStringForKey:@"[Shortcut] Contact Card" value:@"localized string not found" table:0];

      goto LABEL_13;
    case 3uLL:
      id v10 = +[NSBundle mainBundle];
      id v4 = v10;
      CFStringRef v11 = @"[Shortcut] Type";
      goto LABEL_12;
    case 4uLL:
      id v10 = +[NSBundle mainBundle];
      id v4 = v10;
      CFStringRef v11 = @"[Shortcut] Share ETA";
LABEL_12:
      uint64_t v9 = [(__CFString *)v10 localizedStringForKey:v11 value:@"localized string not found" table:0];
LABEL_13:

      id v4 = (__CFString *)v9;
      break;
    default:
LABEL_3:
      id v4 = &stru_101324E70;
      break;
  }

  return v4;
}

- (id)_footerStringForShortcutType:(int64_t)a3
{
  switch(a3)
  {
    case 5:
      id v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"[Shortcut] Add school to Contact Card footer";
      goto LABEL_7;
    case 3:
      id v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"[Shortcut] Add work to Contact Card footer";
      goto LABEL_7;
    case 2:
      id v3 = +[NSBundle mainBundle];
      id v4 = v3;
      CFStringRef v5 = @"[Shortcut] Add home to Contact Card footer";
LABEL_7:
      id v6 = [v3 localizedStringForKey:v5 value:@"localized string not found" table:0];

      goto LABEL_9;
  }
  id v6 = 0;
LABEL_9:

  return v6;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v7 = a3;
  if (sub_1000BBB44(self) == 5) {
    goto LABEL_2;
  }
  unint64_t v9 = [(EditShortcutViewController *)self _typeForIndex:a4];
  id v10 = [v7 footerViewForSection:a4];
  if (v9 <= 7)
  {
    id v4 = [@"EditShortcutSectionType" stringByAppendingString:*(&off_1012F41C8 + v9)];
  }
  CFStringRef v11 = [v4 stringByAppendingString:@"Footer"];
  [v10 setAccessibilityIdentifier:v11];

  if (v9 == 2)
  {
    if (!+[LibraryUIUtilities isMyPlacesEnabled])
    {
      id v14 = [(EditShortcutViewController *)self shortcut];
      uint64_t v16 = -[EditShortcutViewController _meCardTextForType:](self, "_meCardTextForType:", [v14 type]);
LABEL_16:
      id v8 = (void *)v16;
      goto LABEL_17;
    }
LABEL_2:
    id v8 = 0;
    goto LABEL_18;
  }
  if (v9 != 7)
  {
    if (v9 == 4)
    {
      unsigned int v12 = +[LibraryUIUtilities isMyPlacesEnabled];
      id v13 = +[NSBundle mainBundle];
      id v14 = v13;
      if (v12) {
        CFStringRef v15 = @"[Pin] Share ETA Footer";
      }
      else {
        CFStringRef v15 = @"[Shortcut] Share ETA Footer";
      }
      uint64_t v16 = [v13 localizedStringForKey:v15 value:@"localized string not found" table:0];
      goto LABEL_16;
    }
    goto LABEL_2;
  }
  v17 = +[AddressBookManager sharedManager];
  id v18 = [v17 meCard];

  if (v18) {
    goto LABEL_2;
  }
  id v19 = objc_alloc((Class)NSString);
  v20 = +[NSBundle mainBundle];
  unsigned __int8 v21 = [v20 localizedStringForKey:@"[Shortcut] Contact Card privacy footer" value:@"localized string not found" table:0];
  id v14 = [v19 initWithString:v21];

  objc_super v22 = [(EditShortcutViewController *)self shortcut];
  v23 = -[EditShortcutViewController _footerStringForShortcutType:](self, "_footerStringForShortcutType:", [v22 type]);
  id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v23, v14);

LABEL_17:
LABEL_18:

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  switch(-[EditShortcutViewController _typeForIndex:](self, "_typeForIndex:", [v7 section]))
  {
    case 1uLL:
      id v8 = [(EditShortcutViewController *)self _cellForLabel];
      goto LABEL_11;
    case 2uLL:
      id v8 = [(EditShortcutViewController *)self _cellForAddress];
      goto LABEL_11;
    case 3uLL:
      id v8 = [(EditShortcutViewController *)self _cellForTypeAtIndexPath:v7];
      goto LABEL_11;
    case 4uLL:
      unint64_t v9 = [(ShortcutEditSession *)self->_shortcutEditSession contacts];
      id v10 = [v9 count];
      id v11 = [v7 row];

      if (v10 <= v11)
      {
        id v14 = [v6 dequeueReusableCellWithIdentifier:@"EditShortcutActionCell" forIndexPath:v7];
        unsigned int v12 = [(EditShortcutViewController *)self _configureCellForAddSharingContactAction:v14];
      }
      else
      {
        id v8 = [(EditShortcutViewController *)self _cellForContactsAtIndexPath:v7];
LABEL_11:
        unsigned int v12 = v8;
      }

      return v12;
    case 5uLL:
      id v8 = [(EditShortcutViewController *)self _cellForOpenMeCard];
      goto LABEL_11;
    case 6uLL:
      v15.receiver = self;
      v15.super_class = (Class)EditShortcutViewController;
      id v8 = [(SimpleContaineeViewController *)&v15 tableView:v6 cellForRowAtIndexPath:v7];
      goto LABEL_11;
    case 7uLL:
      id v8 = [(EditShortcutViewController *)self _cellForWriteToMeCard];
      goto LABEL_11;
    default:
      id v8 = [objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:0];
      goto LABEL_11;
  }
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5 = a4;
  unint64_t v6 = -[EditShortcutViewController _typeForIndex:](self, "_typeForIndex:", [v5 section]);
  BOOL v11 = v6 == 3
     || (unint64_t v7 = v6, v6 == 4)
     && (id v8 = [v5 row],
         [(ShortcutEditSession *)self->_shortcutEditSession contacts],
         unint64_t v9 = objc_claimAutoreleasedReturnValue(),
         id v10 = [v9 count],
         v9,
         v8 == v10)
     || v7 == 6;

  return v11;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = -[EditShortcutViewController _typeForIndex:](self, "_typeForIndex:", [v7 section]);
  if (![(EditShortcutViewController *)self _isMapUserShortcut] && v8 == 2)
  {
    unint64_t v9 = [(EditShortcutViewController *)self sessionController];
    [v9 showAddShortcut:self->_shortcutEditSession];

    goto LABEL_4;
  }
  if (v8 == 6)
  {
    v12.receiver = self;
    v12.super_class = (Class)EditShortcutViewController;
    [(SimpleContaineeViewController *)&v12 tableView:v6 didSelectRowAtIndexPath:v7];
    goto LABEL_4;
  }
  if (v8 == 4)
  {
    [(EditShortcutViewController *)self _addPersonAction];
    goto LABEL_4;
  }
  if (v8 != 3)
  {
LABEL_4:
    id v10 = [(SimpleContaineeViewController *)self actionsTableView];
    [v10 deselectRowAtIndexPath:v7 animated:1];
    goto LABEL_5;
  }
  -[EditShortcutViewController _editShortcutTypeForIndex:](self, "_editShortcutTypeForIndex:", [v7 row]);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  unint64_t v11 = (unint64_t)[v10 type];
  if (v11 <= 5
    && ((1 << v11) & 0x2C) != 0
    && !+[LibraryUIUtilities isMyPlacesEnabled])
  {
    objc_initWeak(&location, self);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100691B9C;
    v13[3] = &unk_1012EA2C0;
    objc_copyWeak(&v16, &location);
    id v10 = v10;
    id v14 = v10;
    id v15 = v7;
    +[CNContactStore promptForContactsAccessIfNeededBeforePerforming:v13];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    -[EditShortcutViewController _updateWithType:](self, "_updateWithType:", [v10 type]);
  }
LABEL_5:
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  [a4 section:a3];

  [(EditShortcutViewController *)self _typeForIndex:v5];
}

- (id)_cellForLabel
{
  p_editTitleCell = &self->_editTitleCell;
  editTitleCell = self->_editTitleCell;
  if (editTitleCell)
  {
    [(EditShortcutTitleCell *)editTitleCell updateContent];
    id v5 = *p_editTitleCell;
  }
  else
  {
    id v6 = [EditShortcutTitleCell alloc];
    id v7 = [(EditShortcutViewController *)self shortcut];
    id v5 = [(EditShortcutTitleCell *)v6 initWithShortcut:v7 delegate:self];

    objc_storeStrong((id *)p_editTitleCell, v5);
  }

  return v5;
}

- (id)_cellForTypeAtIndexPath:(id)a3
{
  id v4 = -[EditShortcutViewController _editShortcutTypeForIndex:](self, "_editShortcutTypeForIndex:", [a3 row]);
  id v5 = [EditShortcutTypeCell alloc];
  id v6 = [(EditShortcutViewController *)self shortcut];
  id v7 = [(EditShortcutTypeCell *)v5 initWithShortcut:v6 shortcutType:v4];

  unint64_t v8 = [(EditShortcutViewController *)self shortcut];
  -[EditShortcutTypeCell setChecked:](v7, "setChecked:", [v8 type] == objc_msgSend(v4, "type"));

  return v7;
}

- (id)_cellForContactsAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(ShortcutEditSession *)self->_shortcutEditSession contacts];
  id v6 = [v5 count];
  id v7 = [v4 row];

  if (v6 <= v7)
  {
    id v10 = 0;
  }
  else
  {
    unint64_t v8 = [(ShortcutEditSession *)self->_shortcutEditSession contacts];
    unint64_t v9 = [v8 objectAtIndexedSubscript:[v4 row]];

    id v10 = [[EditShortcutContactCell alloc] initWithStyle:0 reuseIdentifier:0];
    [(EditShortcutContactCell *)v10 setContactValue:v9];
    objc_initWeak(&location, self);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100692040;
    v13[3] = &unk_1012E9340;
    objc_copyWeak(&v16, &location);
    id v11 = v9;
    id v14 = v11;
    id v15 = v4;
    [(EditShortcutContactCell *)v10 setAction:v13];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (id)_configureCellForAddSharingContactAction:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(SimpleContaineeAction);
  id v6 = +[NSBundle mainBundle];
  id v7 = [v6 localizedStringForKey:@"[Shortcut] Add Person" value:@"localized string not found" table:0];
  [(SimpleContaineeAction *)v5 setTitle:v7];

  [(SimpleContaineeAction *)v5 setGlyph:@"person.circle.fill"];
  [(SimpleContaineeAction *)v5 setGlyphStyle:2];
  unint64_t v8 = [(SimpleContaineeViewController *)self configurationForAction:v5];
  [v4 setContentConfiguration:v8];

  [v4 setAccessibilityIdentifier:@"EditShortcutAddPersonCell"];
  unint64_t v9 = [v4 textLabel];
  [v9 setAccessibilityIdentifier:@"EditShortCutAddPersonCellLabel"];

  return v4;
}

- (id)_cellForAddress
{
  if (sub_1000BBB44(self) == 5)
  {
    id v3 = [[MacEditShortcutAddressCell alloc] initWithStyle:0 reuseIdentifier:0];
    id v4 = [(EditShortcutViewController *)self shortcut];
    id v5 = [v4 geoMapItem];
    id v6 = [v5 addressObject];
    id v7 = [v6 fullAddressWithMultiline:1];
    [(MacEditShortcutAddressCell *)v3 setAddress:v7];
  }
  else
  {
    id v8 = objc_alloc((Class)UITableViewCell);
    unint64_t v9 = [&off_1013A81A0 stringValue];
    id v3 = (MacEditShortcutAddressCell *)[v8 initWithStyle:0 reuseIdentifier:v9];

    id v10 = [(MacEditShortcutAddressCell *)v3 textLabel];
    [v10 setNumberOfLines:0];

    id v11 = [(EditShortcutViewController *)self shortcut];
    objc_super v12 = [v11 geoMapItem];
    id v13 = [v12 addressObject];
    id v14 = [v13 fullAddressWithMultiline:1];
    id v15 = [(MacEditShortcutAddressCell *)v3 textLabel];
    [v15 setText:v14];

    if (sub_1000BBB44(self) == 5) {
      +[UIColor labelColor];
    }
    else {
    id v16 = +[UIColor secondaryLabelColor];
    }
    v17 = [(MacEditShortcutAddressCell *)v3 textLabel];
    [v17 setTextColor:v16];

    [(MacEditShortcutAddressCell *)v3 setAccessibilityIdentifier:@"EditShortcutAddressCell"];
    id v4 = [(MacEditShortcutAddressCell *)v3 textLabel];
    [v4 setAccessibilityIdentifier:@"EditShortCutAddressCellLabel"];
  }

  return v3;
}

- (id)_cellForOpenMeCard
{
  id v3 = [EditShortcutMeCardCell alloc];
  id v4 = [&off_1013A81B8 stringValue];
  id v5 = [(EditShortcutMeCardCell *)v3 initWithStyle:0 reuseIdentifier:v4];

  id v6 = [(EditShortcutViewController *)self shortcut];
  id v7 = -[EditShortcutViewController _meCardTextForType:](self, "_meCardTextForType:", [v6 type]);
  [(EditShortcutMeCardCell *)v5 setMeCardString:v7];

  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100692514;
  v9[3] = &unk_1012E6708;
  objc_copyWeak(&v10, &location);
  [(EditShortcutMeCardCell *)v5 setOpenMeCardHandler:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v5;
}

- (id)_cellForWriteToMeCard
{
  id v3 = objc_alloc((Class)UITableViewCell);
  id v4 = [&off_1013A81D0 stringValue];
  id v5 = [v3 initWithStyle:0 reuseIdentifier:v4];

  id v6 = +[AddressBookManager sharedManager];
  id v7 = [v6 meCard];

  id v8 = +[NSBundle mainBundle];
  unint64_t v9 = v8;
  if (v7) {
    CFStringRef v10 = @"[Shortcut] Add to Contact Card";
  }
  else {
    CFStringRef v10 = @"[Shortcut] Create a Contact Card";
  }
  id v11 = [v8 localizedStringForKey:v10 value:@"localized string not found" table:0];
  objc_super v12 = [v5 textLabel];
  [v12 setText:v11];

  id v13 = [objc_alloc((Class)UISwitch) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  id v14 = [(EditShortcutViewController *)self shortcut];
  [v13 setOn:[v14 isMeCardWritebackEnabled]];
  [v13 addTarget:self action:"meCardWritebackToggled:" forControlEvents:4096];
  [v5 setAccessoryView:v13];
  [v5 setAccessibilityIdentifier:@"EditShortcutSaveToMeCardCell"];
  id v15 = [v5 textLabel];
  [v15 setAccessibilityIdentifier:@"EditShortcutSaveToMeCardCellLabel"];

  return v5;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  id v11 = [v9 text];
  [v11 stringByReplacingCharactersInRange:location length:length withString:v10];

  Uuint64_t Integer = GEOConfigGetUInteger();
  id v14 = [v12 length];
  if ((unint64_t)v14 > UInteger)
  {
    uint64_t v15 = [v12 substringWithRange:0, UInteger];

    [v9 setText:v15];
    objc_super v12 = (void *)v15;
  }
  BOOL v16 = (unint64_t)v14 <= UInteger;
  [(ShortcutEditSession *)self->_shortcutEditSession setName:v12];
  BOOL v17 = [v12 length] != 0;
  id v18 = [(ModalCardHeaderView *)self->_modalHeaderView trailingButton];
  [v18 setEnabled:v17];

  return v16;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  [(EditShortcutTitleCell *)self->_editTitleCell resignResponder];
  if ([(EditShortcutViewController *)self shouldAutoSaveEdit])
  {
    shortcutEditSession = self->_shortcutEditSession;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1006928E0;
    v6[3] = &unk_1012E7D28;
    v6[4] = self;
    [(ShortcutEditSession *)shortcutEditSession saveWithCompletion:v6];
  }
  return 1;
}

- (void)scrollViewDidScroll:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)EditShortcutViewController;
  id v4 = a3;
  [(SimpleContaineeViewController *)&v7 scrollViewDidScroll:v4];
  -[ShortcutEditSession setDidResignTitleFocus:](self->_shortcutEditSession, "setDidResignTitleFocus:", 1, v7.receiver, v7.super_class);
  [v4 contentOffset];
  double v6 = v5;

  [(ModalCardHeaderView *)self->_modalHeaderView setScrollViewOffset:v6];
  [(EditShortcutTitleCell *)self->_editTitleCell resignResponder];
}

- (void)didDismissByGesture
{
  id v3 = [(EditShortcutViewController *)self sessionController];
  [v3 presentedViewControllerWasDismissedBySwiping:self];
}

- (void)meCardWritebackToggled:(id)a3
{
  id v4 = a3;
  id v6 = [(EditShortcutViewController *)self shortcut];
  id v5 = [v4 isOn];

  [v6 setIsMeCardWritebackEnabled:v5];
}

- (ShortcutEditSession)shortcutEditSession
{
  return self->_shortcutEditSession;
}

- (ShortcutEditSessionController)sessionController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sessionController);

  return (ShortcutEditSessionController *)WeakRetained;
}

- (void)setSessionController:(id)a3
{
}

- (BOOL)openingContactController
{
  return self->_openingContactController;
}

- (void)setOpeningContactController:(BOOL)a3
{
  self->_openingContactController = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sessionController);
  objc_storeStrong((id *)&self->_shortcutEditSession, 0);
  objc_storeStrong((id *)&self->_originalShortcutName, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_sharedManager, 0);
  objc_storeStrong((id *)&self->_refineCoordinateViewController, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_editTitleCell, 0);

  objc_storeStrong((id *)&self->_modalHeaderView, 0);
}

@end