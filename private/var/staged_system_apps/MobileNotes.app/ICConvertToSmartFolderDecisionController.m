@interface ICConvertToSmartFolderDecisionController
- (BOOL)skipAlerts;
- (ICConvertToSmartFolderDecision)decision;
- (ICConvertToSmartFolderDecisionController)initWithSourceFolder:(id)a3 presentingViewController:(id)a4;
- (ICFolder)sourceFolder;
- (NSString)tagDisplayText;
- (UIBarButtonItem)presentingBarButtonItem;
- (UIView)folderSourceView;
- (UIViewController)presentingViewController;
- (void)convertToSmartFolderWithCompletion:(id)a3;
- (void)performDecisionWithCompletion:(id)a3;
- (void)setDecision:(id)a3;
- (void)setFolderSourceView:(id)a3;
- (void)setPresentingBarButtonItem:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setSkipAlerts:(BOOL)a3;
- (void)setSourceFolder:(id)a3;
- (void)showConfirmationAlertWithCompletion:(id)a3;
- (void)showPreventionAlertWithCompletion:(id)a3;
@end

@implementation ICConvertToSmartFolderDecisionController

- (ICConvertToSmartFolderDecisionController)initWithSourceFolder:(id)a3 presentingViewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ICConvertToSmartFolderDecisionController;
  v9 = [(ICConvertToSmartFolderDecisionController *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sourceFolder, a3);
    v11 = [[ICConvertToSmartFolderDecision alloc] initWithSourceFolder:v7];
    decision = v10->_decision;
    v10->_decision = v11;

    objc_storeStrong((id *)&v10->_presentingViewController, a4);
  }

  return v10;
}

- (void)performDecisionWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(ICConvertToSmartFolderDecisionController *)self decision];
  id v6 = [v5 type];

  if (v6 == (id)2)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000E8368;
    v10[3] = &unk_100625988;
    id v11 = v4;
    [(ICConvertToSmartFolderDecisionController *)self showPreventionAlertWithCompletion:v10];
    id v7 = v11;
    goto LABEL_6;
  }
  if (v6 == (id)1)
  {
    id v8 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = [(ICConvertToSmartFolderDecisionController *)self decision];
      *(_DWORD *)buf = 138412290;
      v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Unable to convert to smart folder with decision: %@", buf, 0xCu);
    }
    if (v4) {
      (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
    }
  }
  else if (!v6)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000E8338;
    v12[3] = &unk_100629310;
    v12[4] = self;
    id v13 = v4;
    [(ICConvertToSmartFolderDecisionController *)self showConfirmationAlertWithCompletion:v12];
    id v7 = v13;
LABEL_6:
  }
}

- (void)convertToSmartFolderWithCompletion:(id)a3
{
  v51 = (void (**)(id, void *, void *))a3;
  id v4 = [(ICConvertToSmartFolderDecisionController *)self sourceFolder];
  uint64_t v5 = [v4 account];

  id v6 = [(ICConvertToSmartFolderDecisionController *)self tagDisplayText];
  id v7 = +[ICHashtag hashtagWithDisplayText:v6 account:v5 createIfNecessary:1];

  id v8 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = [(ICConvertToSmartFolderDecisionController *)self sourceFolder];
    v10 = [v9 ic_loggingIdentifier];
    id v11 = [v7 ic_loggingDescription];
    *(_DWORD *)buf = 138412546;
    v60 = v10;
    __int16 v61 = 2112;
    v62 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Hashtag for conversion of manual folder (%@) to smart folder: %@", buf, 0x16u);
  }
  id v12 = objc_alloc((Class)ICTagSelection);
  id v13 = [(ICConvertToSmartFolderDecisionController *)self sourceFolder];
  objc_super v14 = [v13 managedObjectContext];
  v15 = [v7 objectID];
  v16 = +[NSSet ic_setFromNonNilObject:v15];
  id v17 = [v12 initWithManagedObjectContext:v14 includedObjectIDs:v16];

  v49 = v17;
  v48 = +[ICQuery queryForNotesMatchingTagSelection:v17];
  v50 = (void *)v5;
  v18 = +[ICFolder smartFolderWithQuery:account:](ICFolder, "smartFolderWithQuery:account:");
  v19 = [(ICConvertToSmartFolderDecisionController *)self sourceFolder];
  v46 = [v19 title];

  v47 = v18;
  [v18 setParent:0];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v20 = [(ICConvertToSmartFolderDecisionController *)self sourceFolder];
  v21 = [v20 visibleNotesIncludingChildFolders];

  id obj = v21;
  id v53 = [v21 countByEnumeratingWithState:&v54 objects:v58 count:16];
  if (v53)
  {
    uint64_t v22 = *(void *)v55;
    v23 = "com.apple.notes";
    do
    {
      for (i = 0; i != v53; i = (char *)i + 1)
      {
        if (*(void *)v55 != v22) {
          objc_enumerationMutation(obj);
        }
        v25 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        v26 = os_log_create(v23, "CoreData");
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          v27 = [v25 ic_loggingIdentifier];
          v28 = [(ICConvertToSmartFolderDecisionController *)self sourceFolder];
          [v28 ic_loggingIdentifier];
          uint64_t v29 = v22;
          v30 = self;
          v31 = v23;
          v33 = v32 = v7;
          *(_DWORD *)buf = 138412546;
          v60 = v27;
          __int16 v61 = 2112;
          v62 = v33;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Re-parenting note (%@) to default folder because its parent (%@) is being converted to a smart folder", buf, 0x16u);

          id v7 = v32;
          v23 = v31;
          self = v30;
          uint64_t v22 = v29;
        }
        id v34 = [v25 addHashtagToNoteBodyIfMissing:v7];
        v35 = [(ICConvertToSmartFolderDecisionController *)self sourceFolder];
        v36 = [v35 account];
        v37 = [v36 defaultFolder];
        [v25 setFolder:v37];

        [v25 updateChangeCountWithReason:@"Moved to default folder"];
      }
      id v53 = [obj countByEnumeratingWithState:&v54 objects:v58 count:16];
    }
    while (v53);
  }

  v38 = [(ICConvertToSmartFolderDecisionController *)self sourceFolder];
  [v38 markForDeletion];

  v39 = +[ICFolder deduplicatingTitle:v46 account:v50];
  [v47 setTitle:v39];
  [v7 updateChangeCountWithReason:@"Created smart folder"];
  [v47 updateChangeCountWithReason:@"Created smart folder"];
  v40 = [(ICConvertToSmartFolderDecisionController *)self sourceFolder];
  v41 = [v40 managedObjectContext];
  [v41 ic_save];

  v42 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
  {
    v43 = [(ICConvertToSmartFolderDecisionController *)self sourceFolder];
    v44 = [v43 ic_loggingIdentifier];
    v45 = [v47 ic_loggingDescription];
    *(_DWORD *)buf = 138412546;
    v60 = v44;
    __int16 v61 = 2112;
    v62 = v45;
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "Successfully converted (%@) to smart folder: %@", buf, 0x16u);
  }
  if (v51) {
    v51[2](v51, v47, v7);
  }
}

- (void)showConfirmationAlertWithCompletion:(id)a3
{
  id v4 = a3;
  if (![(ICConvertToSmartFolderDecisionController *)self skipAlerts])
  {
    uint64_t v5 = +[NSBundle mainBundle];
    id v6 = [v5 localizedStringForKey:@"Convert to Smart Folder" value:&stru_10063F3D8 table:0];

    id v7 = +[NSBundle mainBundle];
    id v8 = [v7 localizedStringForKey:@"“%@” will be added to each note and this folder will be turned into a Smart Folder. This can’t be undone." value:&stru_10063F3D8 table:0];
    v9 = [(ICConvertToSmartFolderDecisionController *)self tagDisplayText];
    v10 = [v9 ic_withHashtagPrefix];
    id v11 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, v10);

    id v12 = +[NSBundle mainBundle];
    id v13 = [v12 localizedStringForKey:@"Cancel" value:&stru_10063F3D8 table:0];

    objc_super v14 = +[NSBundle mainBundle];
    v15 = [v14 localizedStringForKey:@"Convert" value:&stru_10063F3D8 table:0];

    v16 = +[UIAlertController alertControllerWithTitle:v6 message:v11 preferredStyle:0];
    id v17 = [(ICConvertToSmartFolderDecisionController *)self folderSourceView];

    if (v17)
    {
      v18 = [(ICConvertToSmartFolderDecisionController *)self folderSourceView];
      v19 = [v16 popoverPresentationController];
      [v19 setSourceView:v18];
    }
    else
    {
      v20 = [(ICConvertToSmartFolderDecisionController *)self presentingBarButtonItem];

      if (!v20)
      {
LABEL_9:
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472;
        v27[2] = sub_1000E8D20;
        v27[3] = &unk_1006264C8;
        id v21 = v4;
        id v28 = v21;
        uint64_t v22 = +[UIAlertAction actionWithTitle:v13 style:1 handler:v27];
        [v16 addAction:v22];
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_1000E8D3C;
        v25[3] = &unk_1006264C8;
        id v26 = v21;
        v23 = +[UIAlertAction actionWithTitle:v15 style:0 handler:v25];
        [v16 addAction:v23];
        id v24 = v16;
        performBlockOnMainThread();

        goto LABEL_10;
      }
      v18 = [(ICConvertToSmartFolderDecisionController *)self presentingBarButtonItem];
      v19 = [v16 popoverPresentationController];
      [v19 setBarButtonItem:v18];
    }

    goto LABEL_9;
  }
  if (v4) {
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }
LABEL_10:
}

- (void)showPreventionAlertWithCompletion:(id)a3
{
  id v14 = a3;
  if ([(ICConvertToSmartFolderDecisionController *)self skipAlerts])
  {
    id v4 = v14;
    if (!v14) {
      goto LABEL_14;
    }
    (*((void (**)(id))v14 + 2))(v14);
  }
  else
  {
    uint64_t v5 = +[NSBundle mainBundle];
    id v6 = [v5 localizedStringForKey:@"Can’t Convert Folder" value:&stru_10063F3D8 table:0];

    id v7 = [(ICConvertToSmartFolderDecisionController *)self decision];
    id v8 = [v7 additionalStep];

    switch((unint64_t)v8)
    {
      case 0uLL:
      case 1uLL:
      case 2uLL:
        if (v14) {
          (*((void (**)(void))v14 + 2))();
        }
        goto LABEL_7;
      case 3uLL:
        v10 = +[NSBundle mainBundle];
        id v11 = v10;
        CFStringRef v12 = @"Shared folders can’t be turned into Smart Folders.";
        goto LABEL_11;
      case 4uLL:
        v10 = +[NSBundle mainBundle];
        id v11 = v10;
        CFStringRef v12 = @"Folders with subfolders can’t be turned into Smart Folders.";
        goto LABEL_11;
      case 5uLL:
      case 6uLL:
        v10 = +[NSBundle mainBundle];
        id v11 = v10;
        CFStringRef v12 = @"Folders containing shared or locked notes can’t be turned into Smart Folders.";
LABEL_11:
        v9 = [v10 localizedStringForKey:v12 value:&stru_10063F3D8 table:0];

        break;
      default:
LABEL_7:
        v9 = 0;
        break;
    }
    id v13 = [(ICConvertToSmartFolderDecisionController *)self presentingViewController];
    +[UIAlertController ic_showAlertWithTitle:v6 message:v9 viewController:v13];
  }
  id v4 = v14;
LABEL_14:
}

- (NSString)tagDisplayText
{
  v2 = [(ICConvertToSmartFolderDecisionController *)self sourceFolder];
  v3 = [v2 title];
  id v4 = [v3 ic_trimmedString];
  uint64_t v5 = [v4 ic_whitespaceAndNewlineCoalescedString];

  id v6 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  id v7 = [v5 ic_stringByReplacingCharactersInSet:v6 withString:@"-"];

  return (NSString *)v7;
}

- (ICFolder)sourceFolder
{
  return self->_sourceFolder;
}

- (void)setSourceFolder:(id)a3
{
}

- (ICConvertToSmartFolderDecision)decision
{
  return self->_decision;
}

- (void)setDecision:(id)a3
{
}

- (BOOL)skipAlerts
{
  return self->_skipAlerts;
}

- (void)setSkipAlerts:(BOOL)a3
{
  self->_skipAlerts = a3;
}

- (UIView)folderSourceView
{
  return self->_folderSourceView;
}

- (void)setFolderSourceView:(id)a3
{
}

- (UIBarButtonItem)presentingBarButtonItem
{
  return self->_presentingBarButtonItem;
}

- (void)setPresentingBarButtonItem:(id)a3
{
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_presentingBarButtonItem, 0);
  objc_storeStrong((id *)&self->_folderSourceView, 0);
  objc_storeStrong((id *)&self->_decision, 0);

  objc_storeStrong((id *)&self->_sourceFolder, 0);
}

@end