@interface ICFolderCreationController
- (ICFilterSelection)filterSelection;
- (ICFolderCreationController)initWithViewController:(id)a3 creationApproach:(int64_t)a4;
- (ICFolderCreationController)initWithViewController:(id)a3 noteContainer:(id)a4 creationApproach:(int64_t)a5;
- (ICFolderCreationController)initWithViewController:(id)a3 noteContainer:(id)a4 smartFolderQuery:(id)a5 folderTitle:(id)a6 creationApproach:(int64_t)a7;
- (ICNAEventReporter)eventReporter;
- (ICNoteContainer)noteContainer;
- (ICQuery)smartFolderQuery;
- (NSManagedObjectContext)viewContext;
- (NSString)folderTitle;
- (UIAlertController)editTitleAlert;
- (UIMenu)menu;
- (UIViewController)viewController;
- (id)accountMenuWithAccounts:(id)a3;
- (id)sortDescriptorForDefaultAccountFirstWithKey:(id)a3 defaultAccount:(id)a4;
- (int64_t)creationApproach;
- (void)_icaxAnnounceCreatedFolder:(id)a3;
- (void)createFolderInAccount:(id)a3 noteContainer:(id)a4 smartFolderQuery:(id)a5 folderTitle:(id)a6 completionHandler:(id)a7;
- (void)editTitleTextFieldChanged:(id)a3;
- (void)eventReporterLostSession:(id)a3;
- (void)promptToAddFolderAllowingSmartFolder:(BOOL)a3 withCompletionHandler:(id)a4;
- (void)promptToAddFolderToAccount:(id)a3 allowsSmartFolder:(BOOL)a4 noteContainer:(id)a5 completionHandler:(id)a6;
- (void)promptToEnterNewFolderTitleWithAccount:(id)a3 completionHandler:(id)a4;
- (void)setEditTitleAlert:(id)a3;
- (void)setEventReporter:(id)a3;
- (void)setFilterSelection:(id)a3;
- (void)setFolderTitle:(id)a3;
- (void)setNoteContainer:(id)a3;
- (void)setSmartFolderQuery:(id)a3;
- (void)setViewContext:(id)a3;
- (void)showFolderComposerWithAccount:(id)a3 completion:(id)a4;
- (void)showFolderDepthLimitAlert;
@end

@implementation ICFolderCreationController

- (ICFolderCreationController)initWithViewController:(id)a3 noteContainer:(id)a4 smartFolderQuery:(id)a5 folderTitle:(id)a6 creationApproach:(int64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v22.receiver = self;
  v22.super_class = (Class)ICFolderCreationController;
  v16 = [(ICFolderCreationController *)&v22 init];
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_viewController, v12);
    objc_storeStrong((id *)&v17->_noteContainer, a4);
    objc_storeStrong((id *)&v17->_smartFolderQuery, a5);
    objc_storeStrong((id *)&v17->_folderTitle, a6);
    v17->_creationApproach = a7;
    v18 = +[ICNoteContext sharedContext];
    uint64_t v19 = [v18 managedObjectContext];
    viewContext = v17->_viewContext;
    v17->_viewContext = (NSManagedObjectContext *)v19;
  }
  return v17;
}

- (void)setFolderTitle:(id)a3
{
}

- (ICFolderCreationController)initWithViewController:(id)a3 noteContainer:(id)a4 creationApproach:(int64_t)a5
{
  return [(ICFolderCreationController *)self initWithViewController:a3 noteContainer:a4 smartFolderQuery:0 folderTitle:0 creationApproach:a5];
}

- (ICFolderCreationController)initWithViewController:(id)a3 creationApproach:(int64_t)a4
{
  return [(ICFolderCreationController *)self initWithViewController:a3 noteContainer:0 smartFolderQuery:0 folderTitle:0 creationApproach:a4];
}

- (ICNAEventReporter)eventReporter
{
  if (!self->_eventReporter)
  {
    if (+[ICNAEventReporter isOptedInForAnalytics])
    {
      v3 = [(ICFolderCreationController *)self viewController];
      v4 = [v3 viewIfLoaded];

      if (v4)
      {
        id v5 = objc_alloc((Class)ICNAEventReporter);
        v6 = (objc_class *)objc_opt_class();
        v7 = NSStringFromClass(v6);
        v8 = [(ICFolderCreationController *)self viewController];
        v9 = [v8 view];
        v10 = (ICNAEventReporter *)[v5 initWithSubTrackerName:v7 view:v9];
        eventReporter = self->_eventReporter;
        self->_eventReporter = v10;

        id v12 = +[NSNotificationCenter defaultCenter];
        [v12 addObserver:self selector:"eventReporterLostSession:" name:ICNAEventReporterLostSessionNotification object:self->_eventReporter];
      }
    }
  }
  id v13 = self->_eventReporter;

  return v13;
}

- (void)eventReporterLostSession:(id)a3
{
  eventReporter = self->_eventReporter;
  self->_eventReporter = 0;
  id v5 = a3;

  id v8 = +[NSNotificationCenter defaultCenter];
  uint64_t v6 = ICNAEventReporterLostSessionNotification;
  v7 = [v5 object];

  [v8 removeObserver:self name:v6 object:v7];
}

- (UIMenu)menu
{
  v3 = [(ICFolderCreationController *)self viewContext];
  v4 = +[ICAccount defaultAccountInContext:v3];
  id v5 = [(ICFolderCreationController *)self sortDescriptorForDefaultAccountFirstWithKey:@"accountNameForAccountListSorting" defaultAccount:v4];

  uint64_t v6 = [(ICFolderCreationController *)self viewContext];
  v7 = +[ICAccount allActiveAccountsInContext:v6];
  id v13 = v5;
  id v8 = +[NSArray arrayWithObjects:&v13 count:1];
  v9 = [v7 sortedArrayUsingDescriptors:v8];

  if ([v9 count])
  {
    if ([v9 count] != (id)1)
    {
      v10 = [(ICFolderCreationController *)self accountMenuWithAccounts:v9];
      goto LABEL_8;
    }
  }
  else
  {
    v11 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1004D4BC0(v11);
    }
  }
  v10 = 0;
LABEL_8:

  return (UIMenu *)v10;
}

- (void)promptToAddFolderAllowingSmartFolder:(BOOL)a3 withCompletionHandler:(id)a4
{
  BOOL v4 = a3;
  id v14 = (void (**)(void))a4;
  uint64_t v6 = [(ICFolderCreationController *)self noteContainer];
  unsigned int v7 = [v6 isModernCustomFolder];

  if (!v7)
  {
    id v12 = [(ICFolderCreationController *)self noteContainer];
    if (v12)
    {
      id v13 = [(ICFolderCreationController *)self noteContainer];
      [v13 noteContainerAccount];
    }
    else
    {
      id v13 = [(ICFolderCreationController *)self viewContext];
      +[ICAccount defaultAccountInContext:v13];
    uint64_t v11 = };

    v9 = 0;
    goto LABEL_10;
  }
  objc_opt_class();
  id v8 = [(ICFolderCreationController *)self noteContainer];
  v9 = ICCheckedDynamicCast();

  id v10 = [v9 depth];
  if (v10 < +[ICFolder folderDepthLimit])
  {
    uint64_t v11 = [v9 account];
LABEL_10:
    [(ICFolderCreationController *)self promptToAddFolderToAccount:v11 allowsSmartFolder:v4 noteContainer:v9 completionHandler:v14];

    v9 = (void *)v11;
    goto LABEL_11;
  }
  [(ICFolderCreationController *)self showFolderDepthLimitAlert];
  if (v14) {
    v14[2]();
  }
LABEL_11:
}

- (id)sortDescriptorForDefaultAccountFirstWithKey:(id)a3 defaultAccount:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [a4 valueForKey:v5];
  unsigned int v7 = v6;
  if (a4 && v6)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100054FF4;
    v10[3] = &unk_1006263D8;
    id v11 = v6;
    id v8 = +[NSSortDescriptor sortDescriptorWithKey:v5 ascending:1 comparator:v10];
  }
  else
  {
    id v8 = +[NSSortDescriptor sortDescriptorWithKey:v5 ascending:1];
  }

  return v8;
}

- (id)accountMenuWithAccounts:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100055174;
  v6[3] = &unk_100626428;
  v6[4] = self;
  v3 = [a3 ic_compactMap:v6];
  BOOL v4 = +[UIMenu menuWithChildren:v3];

  return v4;
}

- (void)promptToAddFolderToAccount:(id)a3 allowsSmartFolder:(BOOL)a4 noteContainer:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (v11 || !a4)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100055484;
    v19[3] = &unk_100626450;
    v19[4] = self;
    id v20 = v10;
    id v21 = v11;
    id v22 = v12;
    [(ICFolderCreationController *)self promptToEnterNewFolderTitleWithAccount:v20 completionHandler:v19];
  }
  else
  {
    objc_initWeak(&location, self);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100055510;
    v13[3] = &unk_100626478;
    objc_copyWeak(&v17, &location);
    id v14 = v10;
    id v15 = 0;
    id v16 = v12;
    [(ICFolderCreationController *)self showFolderComposerWithAccount:v14 completion:v13];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

- (void)createFolderInAccount:(id)a3 noteContainer:(id)a4 smartFolderQuery:(id)a5 folderTitle:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = (void (**)(id, void *))a7;
  if ([v15 length]
    && ([(ICFolderCreationController *)self viewController],
        id v17 = objc_claimAutoreleasedReturnValue(),
        v17,
        v17))
  {
    if (v12) {
      goto LABEL_5;
    }
    +[ICNoteContext enableLocalAccount];
    v18 = +[ICNoteContext sharedContext];
    [v18 addOrDeleteLocalAccountIfNecessary];

    uint64_t v19 = +[ICNoteContext sharedContext];
    [v19 save];

    id v20 = [(ICFolderCreationController *)self viewContext];
    id v12 = +[ICAccount localAccountInContext:v20];

    if (v12)
    {
LABEL_5:
      objc_opt_class();
      id v21 = ICDynamicCast();
      id v45 = v14;
      id v46 = v13;
      if (v14)
      {
        id v22 = +[ICFolder smartFolderWithQuery:v14 account:v12];
      }
      else
      {
        id v22 = +[ICFolder newFolderInAccount:v12];
      }
      v23 = v22;
      v24 = +[ICFolder deduplicatingTitle:v15 forFolder:v22 forNewFolderParent:v21 ofAccount:v12];
      [v23 setTitle:v24];

      v25 = +[NSDate now];
      [v23 setDateForLastTitleModification:v25];

      if (v21)
      {
        v26 = [v12 identifier];
        v27 = [v21 account];
        v28 = [v27 identifier];

        if ([v28 isEqualToString:v26]) {
          [v23 setParent:v21];
        }
      }
      id v48 = 0;
      unsigned __int8 v29 = [v23 isTitleValid:v15 error:&v48];
      id v30 = v48;
      if (v29)
      {
        id v31 = [v23 persistCreateActivityEventForObject:v23 inParentObject:v21];
        [v23 updateChangeCountWithReason:@"Created folder"];
        v32 = +[ICNoteContext sharedContext];
        [v32 save];

        if (v16) {
          v16[2](v16, v23);
        }
        id v47 = v23;
        ICAccessibilityPerformBlockOnMainThreadAfterDelay();
        v33 = [(ICFolderCreationController *)self eventReporter];
        int64_t v34 = [(ICFolderCreationController *)self creationApproach];
        v35 = [(ICFolderCreationController *)self filterSelection];
        [v33 submitFolderCreateEventForModernFolder:v47 creationApproach:v34 filterSelection:v35];

        v36 = +[NSNotificationCenter defaultCenter];
        v37 = [v47 objectID];
        [v36 postNotificationName:@"ICFolderCreationControllerFolderWasCreatedNotification" object:v37];
      }
      else
      {
        v38 = [(ICFolderCreationController *)self viewController];
        v39 = [v30 userInfo];
        [v39 objectForKeyedSubscript:NSLocalizedDescriptionKey];
        v44 = v21;
        v41 = v40 = v30;
        v42 = [v40 userInfo];
        v43 = [v42 objectForKeyedSubscript:NSLocalizedRecoverySuggestionErrorKey];
        [v38 ic_showSingleButtonAlertWithTitle:v41 message:v43];

        id v30 = v40;
        id v21 = v44;

        +[ICFolder deleteFolder:v23];
        if (v16) {
          v16[2](v16, 0);
        }
      }

      id v14 = v45;
      id v13 = v46;
    }
    else
    {
      +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICFolderCreationController createFolderInAccount:noteContainer:smartFolderQuery:folderTitle:completionHandler:]", 1, 0, @"Unable to determine or create account");
      if (v16) {
        v16[2](v16, 0);
      }
      id v12 = 0;
    }
  }
  else if (v16)
  {
    v16[2](v16, 0);
  }
}

- (void)promptToEnterNewFolderTitleWithAccount:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(ICFolderCreationController *)self viewController];

  if (v6)
  {
    unsigned int v7 = +[NSBundle mainBundle];
    id v21 = [v7 localizedStringForKey:@"New Folder" value:&stru_10063F3D8 table:0];

    id v8 = +[NSBundle mainBundle];
    id v20 = [v8 localizedStringForKey:@"Enter a name for this folder." value:&stru_10063F3D8 table:0];

    v9 = +[ICDismissableAlertController alertControllerWithTitle:v21 message:v20 preferredStyle:1];
    [(ICFolderCreationController *)self setEditTitleAlert:v9];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100055E5C;
    v29[3] = &unk_1006264A0;
    v29[4] = self;
    [v9 addTextFieldWithConfigurationHandler:v29];
    id v10 = +[NSBundle mainBundle];
    id v11 = [v10 localizedStringForKey:@"Cancel" value:&stru_10063F3D8 table:0];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100055F4C;
    v27[3] = &unk_1006264C8;
    id v12 = v5;
    id v28 = v12;
    id v13 = +[UIAlertAction actionWithTitle:v11 style:1 handler:v27];

    [v9 addAction:v13];
    [v9 setDismissAction:v13];
    id v14 = +[NSBundle mainBundle];
    id v15 = [v14 localizedStringForKey:@"Save" value:&stru_10063F3D8 table:0];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100055F68;
    v24[3] = &unk_1006264F0;
    id v16 = v9;
    id v25 = v16;
    id v26 = v12;
    id v17 = +[UIAlertAction actionWithTitle:v15 style:0 handler:v24];

    [v17 setEnabled:0];
    [v16 addAction:v17];
    [v16 setPreferredAction:v17];
    v18 = [(ICFolderCreationController *)self viewController];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100056004;
    v22[3] = &unk_100625AF0;
    id v23 = v16;
    id v19 = v16;
    [v18 presentViewController:v19 animated:1 completion:v22];
  }
  else if (v5)
  {
    (*((void (**)(id, const __CFString *))v5 + 2))(v5, &stru_10063F3D8);
  }
}

- (void)editTitleTextFieldChanged:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  ICDynamicCast();
  id v22 = (id)objc_claimAutoreleasedReturnValue();

  id v5 = [v22 text];
  objc_opt_class();
  uint64_t v6 = [(ICFolderCreationController *)self editTitleAlert];
  unsigned int v7 = [v6 actions];
  id v8 = [v7 objectAtIndex:1];
  v9 = ICDynamicCast();

  if (v22)
  {
    id v10 = [(ICFolderCreationController *)self editTitleAlert];

    if (v10)
    {
      id v11 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
      id v12 = [v5 stringByTrimmingCharactersInSet:v11];

      [v9 setEnabled:[v12 length] != 0];
      objc_opt_class();
      id v13 = [v9 safeValueForKey:@"_representer"];
      id v14 = ICDynamicCast();

      if ([v9 isEnabled])
      {
        UIAccessibilityTraits v15 = UIAccessibilityTraitNotEnabled;
        unint64_t v16 = (unint64_t)[v14 accessibilityTraits] & ~v15;
      }
      else
      {
        unint64_t v17 = (unint64_t)[v14 accessibilityTraits];
        unint64_t v16 = UIAccessibilityTraitNotEnabled | v17;
      }
      [v14 setAccessibilityTraits:v16];
    }
  }
  v18 = +[ICFolder stringByScrubbingStringForFolderName:v5];
  if (([v5 isEqualToString:v18] & 1) == 0)
  {
    id v19 = (char *)[v22 selectionRange];
    uint64_t v21 = v20;
    [v22 setText:v18];
    if (&v19[v21] < [v18 length]) {
      [v22 setSelectionRange:v19, v21];
    }
  }
}

- (void)showFolderDepthLimitAlert
{
  v3 = [(ICFolderCreationController *)self viewController];

  if (v3)
  {
    id v4 = +[NSBundle mainBundle];
    id v10 = [v4 localizedStringForKey:@"Can’t add folder" value:&stru_10063F3D8 table:0];

    id v5 = (char *)+[ICFolder folderDepthLimit] + 1;
    uint64_t v6 = +[NSBundle mainBundle];
    unsigned int v7 = [v6 localizedStringForKey:@"FOLDER_DEPTH_LIMIT_MESSAGE_%lu" value:&stru_10063F3D8 table:0];

    id v8 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, v5);
    v9 = [(ICFolderCreationController *)self viewController];
    +[UIAlertController ic_showAlertWithTitle:v10 message:v8 viewController:v9];
  }
}

- (void)showFolderComposerWithAccount:(id)a3 completion:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  unsigned int v7 = [(ICFolderCreationController *)self viewController];

  if (v7)
  {
    id v8 = [ICFolderComposerViewController alloc];
    v9 = [(ICFolderCreationController *)self folderTitle];
    id v10 = [(ICFolderCreationController *)self smartFolderQuery];
    id v11 = [(ICFolderComposerViewController *)v8 initWithAccount:v14 folderTitle:v9 smartFolderQuery:v10 completion:v6];

    id v12 = [(ICFolderComposerViewController *)v11 ic_embedInNavigationControllerForModalPresentation];
    id v13 = [(ICFolderCreationController *)self viewController];
    [v13 presentViewController:v12 animated:1 completion:0];
  }
}

- (void)_icaxAnnounceCreatedFolder:(id)a3
{
  id v3 = a3;
  id v4 = +[NSBundle mainBundle];
  id v7 = [v4 localizedStringForKey:@"Created folder: %@" value:&stru_10063F3D8 table:0];

  id v5 = [v3 title];

  id v6 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, v5);

  ICAccessibilityPostAnnouncementNotification();
}

- (UIViewController)viewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);

  return (UIViewController *)WeakRetained;
}

- (int64_t)creationApproach
{
  return self->_creationApproach;
}

- (void)setEventReporter:(id)a3
{
}

- (NSManagedObjectContext)viewContext
{
  return self->_viewContext;
}

- (void)setViewContext:(id)a3
{
}

- (ICNoteContainer)noteContainer
{
  return self->_noteContainer;
}

- (void)setNoteContainer:(id)a3
{
}

- (ICQuery)smartFolderQuery
{
  return self->_smartFolderQuery;
}

- (void)setSmartFolderQuery:(id)a3
{
}

- (NSString)folderTitle
{
  return self->_folderTitle;
}

- (ICFilterSelection)filterSelection
{
  return self->_filterSelection;
}

- (void)setFilterSelection:(id)a3
{
}

- (UIAlertController)editTitleAlert
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_editTitleAlert);

  return (UIAlertController *)WeakRetained;
}

- (void)setEditTitleAlert:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_editTitleAlert);
  objc_storeStrong((id *)&self->_filterSelection, 0);
  objc_storeStrong((id *)&self->_folderTitle, 0);
  objc_storeStrong((id *)&self->_smartFolderQuery, 0);
  objc_storeStrong((id *)&self->_noteContainer, 0);
  objc_storeStrong((id *)&self->_viewContext, 0);
  objc_storeStrong((id *)&self->_eventReporter, 0);

  objc_destroyWeak((id *)&self->_viewController);
}

@end