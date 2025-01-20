@interface ICImportSERootViewController
- (ICImportNoteProcessor)importNoteProcessor;
- (ICImportSEProgressViewController)progressViewController;
- (ICSERootViewController)rootViewController;
- (NSDate)lastAccessibilityAnnouncementDate;
- (UIAlertController)progressAlertController;
- (void)hideUI;
- (void)importCompletedForNoteProcessor:(id)a3 destinationFolder:(id)a4;
- (void)importNotes;
- (void)importStartedForNoteProcessor:(id)a3;
- (void)progressUpdatedForImportNoteProcessor:(id)a3;
- (void)setImportNoteProcessor:(id)a3;
- (void)setLastAccessibilityAnnouncementDate:(id)a3;
- (void)setProgressAlertController:(id)a3;
- (void)setProgressViewController:(id)a3;
- (void)setRootViewController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation ICImportSERootViewController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)ICImportSERootViewController;
  [(ICImportSERootViewController *)&v5 viewDidLoad];
  v3 = objc_alloc_init(ICImportNoteProcessor);
  [(ICImportSERootViewController *)self setImportNoteProcessor:v3];

  v4 = [(ICImportSERootViewController *)self importNoteProcessor];
  [v4 setDelegate:self];
}

- (void)viewDidAppear:(BOOL)a3
{
  v35.receiver = self;
  v35.super_class = (Class)ICImportSERootViewController;
  [(ICImportSERootViewController *)&v35 viewDidAppear:a3];
  v4 = +[ICNoteContext sharedContext];
  objc_super v5 = [v4 managedObjectContext];
  v6 = +[ICAccount defaultAccountInContext:v5];

  if (v6)
  {
    v7 = +[NSBundle mainBundle];
    v8 = [v7 localizedStringForKey:@"Import to Notes?" value:&stru_1000F2510 table:0];
    v9 = +[NSBundle mainBundle];
    v10 = [v9 localizedStringForKey:@"This file’s notes will be added to an Imported Notes folder. They may look different." value:&stru_1000F2510 table:0];
    v11 = +[UIAlertController alertControllerWithTitle:v8 message:v10 preferredStyle:1];

    v12 = +[NSBundle mainBundle];
    v13 = [v12 localizedStringForKey:@"Import" value:&stru_1000F2510 table:0];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100008648;
    v32[3] = &unk_1000EDFE0;
    v32[4] = self;
    v14 = +[UIAlertAction actionWithTitle:v13 style:0 handler:v32];

    [v11 addAction:v14];
    v15 = +[NSBundle mainBundle];
    v16 = [v15 localizedStringForKey:@"Cancel" value:&stru_1000F2510 table:0];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10000883C;
    v31[3] = &unk_1000EDFE0;
    v31[4] = self;
    v17 = +[UIAlertAction actionWithTitle:v16 style:1 handler:v31];

    [v11 addAction:v17];
    [(ICImportSERootViewController *)self presentViewController:v11 animated:1 completion:0];
  }
  else
  {
    int IsAppleAccountBrandingEnabled = ICInternalSettingsIsAppleAccountBrandingEnabled();
    v19 = +[NSBundle mainBundle];
    v20 = v19;
    if (IsAppleAccountBrandingEnabled) {
      CFStringRef v21 = @"To import to Notes, you’ll need to go to Notes and upgrade your Apple Account.";
    }
    else {
      CFStringRef v21 = @"To import to Notes, you’ll need to go to Notes and upgrade your iCloud account.";
    }
    v11 = [v19 localizedStringForKey:v21 value:&stru_1000F2510 table:0];

    v22 = +[NSBundle mainBundle];
    v23 = [v22 localizedStringForKey:@"Upgrade Your Notes" value:&stru_1000F2510 table:0];
    v24 = +[UIAlertController alertControllerWithTitle:v23 message:v11 preferredStyle:1];

    v25 = +[NSBundle mainBundle];
    v26 = [v25 localizedStringForKey:@"Cancel" value:&stru_1000F2510 table:0];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100008588;
    v34[3] = &unk_1000EDFE0;
    v34[4] = self;
    v27 = +[UIAlertAction actionWithTitle:v26 style:1 handler:v34];

    v28 = +[NSBundle mainBundle];
    v29 = [v28 localizedStringForKey:@"Go to Notes" value:&stru_1000F2510 table:0];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100008590;
    v33[3] = &unk_1000EDFE0;
    v33[4] = self;
    v30 = +[UIAlertAction actionWithTitle:v29 style:0 handler:v33];

    [v24 addAction:v30];
    [v24 addAction:v27];
    [(ICImportSERootViewController *)self presentViewController:v24 animated:1 completion:0];
  }
}

- (void)progressUpdatedForImportNoteProcessor:(id)a3
{
  id v4 = a3;
  if ([v4 state] == (id)1)
  {
    objc_super v5 = +[NSBundle mainBundle];
    v6 = [v5 localizedStringForKey:@"Loading notes to import…" value:&stru_1000F2510 table:0];
  }
  else
  {
    if ([v4 state] != (id)2)
    {
      v6 = 0;
      goto LABEL_10;
    }
    v7 = (char *)[v4 totalNoteImported];
    if (v7 >= [v4 totalNoteFound]) {
      v8 = v7;
    }
    else {
      v8 = v7 + 1;
    }
    objc_super v5 = +[NSBundle mainBundle];
    v9 = [v5 localizedStringForKey:@"Importing note %lu of %lu…" value:&stru_1000F2510 table:0];
    v6 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v8, [v4 totalNoteFound]);
  }
LABEL_10:
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000089E4;
  block[3] = &unk_1000EE008;
  block[4] = self;
  id v13 = v6;
  id v14 = v4;
  id v10 = v4;
  id v11 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)importStartedForNoteProcessor:(id)a3
{
  id v4 = +[NSDate date];
  [(ICImportSERootViewController *)self setLastAccessibilityAnnouncementDate:v4];
}

- (void)importCompletedForNoteProcessor:(id)a3 destinationFolder:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100008C7C;
  v6[3] = &unk_1000EE0E8;
  id v7 = a3;
  v8 = self;
  id v5 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

- (void)hideUI
{
  objc_initWeak(&location, self);
  v3 = [(ICImportSERootViewController *)self rootViewController];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100009178;
  v4[3] = &unk_1000EE110;
  objc_copyWeak(&v5, &location);
  [v3 dismissWithCompletion:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)importNotes
{
  v3 = dispatch_group_create();
  id v24 = objc_alloc_init((Class)NSMutableArray);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v19 = self;
  id v4 = [(ICImportSERootViewController *)self rootViewController];
  id v5 = [v4 extensionContext];
  v6 = [v5 inputItems];

  id obj = v6;
  id v22 = [v6 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v22)
  {
    uint64_t v21 = *(void *)v35;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v35 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = v7;
        v8 = *(void **)(*((void *)&v34 + 1) + 8 * v7);
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        v9 = [v8 attachments];
        id v10 = [v9 countByEnumeratingWithState:&v30 objects:v38 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v31;
          do
          {
            id v13 = 0;
            do
            {
              if (*(void *)v31 != v12) {
                objc_enumerationMutation(v9);
              }
              id v14 = *(void **)(*((void *)&v30 + 1) + 8 * (void)v13);
              v15 = [UTTypeURL identifier];
              unsigned int v16 = [v14 hasItemConformingToTypeIdentifier:v15];

              if (v16)
              {
                dispatch_group_enter(v3);
                v17 = [UTTypeURL identifier];
                v27[0] = _NSConcreteStackBlock;
                v27[1] = 3221225472;
                v27[2] = sub_100009520;
                v27[3] = &unk_1000EE138;
                id v28 = v24;
                v29 = v3;
                [v14 loadItemForTypeIdentifier:v17 options:0 completionHandler:v27];
              }
              id v13 = (char *)v13 + 1;
            }
            while (v11 != v13);
            id v11 = [v9 countByEnumeratingWithState:&v30 objects:v38 count:16];
          }
          while (v11);
        }

        uint64_t v7 = v23 + 1;
      }
      while ((id)(v23 + 1) != v22);
      id v22 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v22);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000095F0;
  block[3] = &unk_1000EE0E8;
  block[4] = v19;
  id v26 = v24;
  id v18 = v24;
  dispatch_group_notify(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (ICSERootViewController)rootViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rootViewController);

  return (ICSERootViewController *)WeakRetained;
}

- (void)setRootViewController:(id)a3
{
}

- (ICImportNoteProcessor)importNoteProcessor
{
  return self->_importNoteProcessor;
}

- (void)setImportNoteProcessor:(id)a3
{
}

- (ICImportSEProgressViewController)progressViewController
{
  return self->_progressViewController;
}

- (void)setProgressViewController:(id)a3
{
}

- (UIAlertController)progressAlertController
{
  return self->_progressAlertController;
}

- (void)setProgressAlertController:(id)a3
{
}

- (NSDate)lastAccessibilityAnnouncementDate
{
  return self->_lastAccessibilityAnnouncementDate;
}

- (void)setLastAccessibilityAnnouncementDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAccessibilityAnnouncementDate, 0);
  objc_storeStrong((id *)&self->_progressAlertController, 0);
  objc_storeStrong((id *)&self->_progressViewController, 0);
  objc_storeStrong((id *)&self->_importNoteProcessor, 0);

  objc_destroyWeak((id *)&self->_rootViewController);
}

@end