@interface ICCreateSmartFolderActivity
- (ICCreateSmartFolderActivity)initWithTagSelection:(id)a3 presentingViewController:(id)a4 eventReporter:(id)a5;
- (ICFolderCreationController)folderCreationController;
- (ICNAEventReporter)eventReporter;
- (ICTagSelection)tagSelection;
- (NSAttributedString)footerAttributedString;
- (UIViewController)presentingViewController;
- (id)activityImage;
- (id)activityTitle;
- (id)activityType;
- (void)performActivityWithCompletion:(id)a3;
- (void)setEventReporter:(id)a3;
- (void)setFolderCreationController:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setTagSelection:(id)a3;
@end

@implementation ICCreateSmartFolderActivity

- (ICCreateSmartFolderActivity)initWithTagSelection:(id)a3 presentingViewController:(id)a4 eventReporter:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ICCreateSmartFolderActivity;
  v12 = [(ICCreateSmartFolderActivity *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_tagSelection, a3);
    objc_storeWeak((id *)&v13->_presentingViewController, v10);
    objc_storeStrong((id *)&v13->_eventReporter, a5);
  }

  return v13;
}

- (NSAttributedString)footerAttributedString
{
  id v2 = objc_alloc((Class)NSMutableAttributedString);
  v3 = +[NSBundle mainBundle];
  v4 = [v3 localizedStringForKey:@"Use Smart Folders to automatically organize notes by tags. " value:&stru_10063F3D8 table:0];
  NSAttributedStringKey v18 = NSForegroundColorAttributeName;
  v5 = +[UIColor secondaryLabelColor];
  v19 = v5;
  v6 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  id v7 = [v2 initWithString:v4 attributes:v6];

  id v8 = objc_alloc((Class)NSAttributedString);
  id v9 = +[NSBundle mainBundle];
  id v10 = [v9 localizedStringForKey:@"Learn More…" value:&stru_10063F3D8 table:0];
  NSAttributedStringKey v16 = NSLinkAttributeName;
  id v11 = +[ICAppURLUtilities appURLForShowSmartFoldersHelp];
  v17 = v11;
  v12 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  id v13 = [v8 initWithString:v10 attributes:v12];

  [v7 appendAttributedString:v13];
  id v14 = [v7 copy];

  return (NSAttributedString *)v14;
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:@"gearshape"];
}

- (id)activityTitle
{
  id v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"Create Smart Folder" value:&stru_10063F3D8 table:0];

  return v3;
}

- (id)activityType
{
  return @"com.apple.mobilenotes.createsmartfolder";
}

- (void)performActivityWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(ICCreateSmartFolderActivity *)self presentingViewController];

  if (v5)
  {
    v6 = [(ICCreateSmartFolderActivity *)self tagSelection];
    id v7 = +[ICQuery queryForNotesMatchingTagSelection:v6];

    id v8 = [(ICCreateSmartFolderActivity *)self tagSelection];
    id v9 = [v8 smartFolderTitle];
    id v10 = +[ICNoteContext sharedContext];
    id v11 = [v10 managedObjectContext];
    v12 = +[ICAccount defaultAccountInContext:v11];
    id v13 = +[ICFolder deduplicatingTitle:v9 account:v12];

    id v14 = [ICFolderCreationController alloc];
    objc_super v15 = [(ICCreateSmartFolderActivity *)self presentingViewController];
    NSAttributedStringKey v16 = [(ICFolderCreationController *)v14 initWithViewController:v15 noteContainer:0 smartFolderQuery:v7 folderTitle:v13 creationApproach:2];
    [(ICCreateSmartFolderActivity *)self setFolderCreationController:v16];

    id v17 = objc_alloc((Class)ICFilterSelection);
    NSAttributedStringKey v18 = [(ICCreateSmartFolderActivity *)self tagSelection];
    id v19 = [v17 initWithFilterTypeSelection:v18];
    v20 = [(ICCreateSmartFolderActivity *)self folderCreationController];
    [v20 setFilterSelection:v19];

    v21 = [(ICCreateSmartFolderActivity *)self folderCreationController];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000E4DC8;
    v23[3] = &unk_100629738;
    v23[4] = self;
    id v24 = v4;
    [v21 promptToAddFolderAllowingSmartFolder:1 withCompletionHandler:v23];
  }
  else
  {
    [(ICCreateSmartFolderActivity *)self activityDidFinish:0];
    if (v4)
    {
      v22 = [(ICCreateSmartFolderActivity *)self activityType];
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v22);
    }
  }
}

- (ICTagSelection)tagSelection
{
  return self->_tagSelection;
}

- (void)setTagSelection:(id)a3
{
}

- (ICNAEventReporter)eventReporter
{
  return self->_eventReporter;
}

- (void)setEventReporter:(id)a3
{
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (ICFolderCreationController)folderCreationController
{
  return self->_folderCreationController;
}

- (void)setFolderCreationController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folderCreationController, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_eventReporter, 0);

  objc_storeStrong((id *)&self->_tagSelection, 0);
}

@end