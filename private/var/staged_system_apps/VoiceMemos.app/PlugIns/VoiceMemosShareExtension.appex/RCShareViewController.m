@interface RCShareViewController
- (NSURL)temporaryDirectoryURL;
- (RCShareTableViewController)tableViewController;
- (RCSharedAudioFileInfo)sharedAudioFileInfo;
- (UIBarButtonItem)cancelButtonItem;
- (UIBarButtonItem)doneButtonItem;
- (UINavigationController)navigationController;
- (void)_didLoadFileInPlaceWithFileInfo:(id)a3;
- (void)_loadFirstConformingAttachment:(id)a3;
- (void)_removeTemporaryAudioFileIfNeeded;
- (void)cancel;
- (void)loadFileRepresentation;
- (void)loadView;
- (void)save;
- (void)setCancelButtonItem:(id)a3;
- (void)setDoneButtonItem:(id)a3;
- (void)setNavigationController:(id)a3;
- (void)setSharedAudioFileInfo:(id)a3;
- (void)setTableViewController:(id)a3;
- (void)setTemporaryDirectoryURL:(id)a3;
- (void)setupViews;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation RCShareViewController

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)RCShareViewController;
  [(RCShareViewController *)&v3 loadView];
  [(RCShareViewController *)self setupViews];
  [(RCShareViewController *)self loadFileRepresentation];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RCShareViewController;
  [(RCShareViewController *)&v4 viewDidDisappear:a3];
  [(RCShareViewController *)self _removeTemporaryAudioFileIfNeeded];
}

- (void)_loadFirstConformingAttachment:(id)a3
{
  id v4 = a3;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v5 = [(RCShareViewController *)self extensionContext];
  v6 = [v5 inputItems];

  id v7 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v28;
    uint64_t v21 = *(void *)v28;
    id v22 = v4;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        v12 = [v11 attachments:v21];
        id v13 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v24;
          while (2)
          {
            for (j = 0; j != v14; j = (char *)j + 1)
            {
              if (*(void *)v24 != v15) {
                objc_enumerationMutation(v12);
              }
              v17 = *(void **)(*((void *)&v23 + 1) + 8 * (void)j);
              v18 = [v17 rc_supportedFileTypesRepresented];
              v19 = [v18 firstObject];

              if (v19)
              {
                id v4 = v22;
                id v20 = [v17 loadFileRepresentationForTypeIdentifier:v19 completionHandler:v22];

                goto LABEL_18;
              }
            }
            id v14 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }

        uint64_t v9 = v21;
      }
      id v8 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
      id v4 = v22;
    }
    while (v8);
  }
LABEL_18:
}

- (void)loadFileRepresentation
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100001940;
  v2[3] = &unk_1000041C0;
  v2[4] = self;
  [(RCShareViewController *)self _loadFirstConformingAttachment:v2];
}

- (void)setupViews
{
  objc_super v3 = [[RCShareTableViewController alloc] initWithStyle:1];
  tableViewController = self->_tableViewController;
  self->_tableViewController = v3;

  v5 = (UINavigationController *)[objc_alloc((Class)UINavigationController) initWithRootViewController:self->_tableViewController];
  navigationController = self->_navigationController;
  self->_navigationController = v5;

  id v7 = objc_alloc((Class)UIBarButtonItem);
  id v8 = RCLocalizedFrameworkString();
  uint64_t v9 = (UIBarButtonItem *)[v7 initWithTitle:v8 style:0 target:self action:"cancel"];
  cancelButtonItem = self->_cancelButtonItem;
  self->_cancelButtonItem = v9;

  id v11 = objc_alloc((Class)UIBarButtonItem);
  v12 = RCLocalizedFrameworkString();
  id v13 = (UIBarButtonItem *)[v11 initWithTitle:v12 style:2 target:self action:"save"];
  doneButtonItem = self->_doneButtonItem;
  self->_doneButtonItem = v13;

  [(UIBarButtonItem *)self->_doneButtonItem setEnabled:0];
  uint64_t v15 = self->_cancelButtonItem;
  v16 = [(RCShareTableViewController *)self->_tableViewController navigationItem];
  [v16 setLeftBarButtonItem:v15];

  v17 = self->_doneButtonItem;
  v18 = [(RCShareTableViewController *)self->_tableViewController navigationItem];
  [v18 setRightBarButtonItem:v17];

  [(RCShareViewController *)self addChildViewController:self->_navigationController];
  v19 = [(RCShareViewController *)self view];
  id v20 = [(UINavigationController *)self->_navigationController view];
  [v19 addSubview:v20];

  [(UINavigationController *)self->_navigationController didMoveToParentViewController:self];
  uint64_t v21 = [(UINavigationController *)self->_navigationController view];
  [v21 setTranslatesAutoresizingMaskIntoConstraints:0];

  v42 = [(RCShareViewController *)self view];
  v40 = [v42 topAnchor];
  v41 = [(UINavigationController *)self->_navigationController view];
  v39 = [v41 topAnchor];
  v38 = [v40 constraintEqualToAnchor:v39];
  v43[0] = v38;
  v37 = [(RCShareViewController *)self view];
  v35 = [v37 bottomAnchor];
  v36 = [(UINavigationController *)self->_navigationController view];
  v34 = [v36 bottomAnchor];
  v33 = [v35 constraintEqualToAnchor:v34];
  v43[1] = v33;
  v32 = [(RCShareViewController *)self view];
  id v22 = [v32 leftAnchor];
  long long v23 = [(UINavigationController *)self->_navigationController view];
  long long v24 = [v23 leftAnchor];
  long long v25 = [v22 constraintEqualToAnchor:v24];
  v43[2] = v25;
  long long v26 = [(RCShareViewController *)self view];
  long long v27 = [v26 rightAnchor];
  long long v28 = [(UINavigationController *)self->_navigationController view];
  long long v29 = [v28 rightAnchor];
  long long v30 = [v27 constraintEqualToAnchor:v29];
  v43[3] = v30;
  v31 = +[NSArray arrayWithObjects:v43 count:4];
  +[NSLayoutConstraint activateConstraints:v31];
}

- (void)_didLoadFileInPlaceWithFileInfo:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100002028;
  v4[3] = &unk_1000041E8;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)_removeTemporaryAudioFileIfNeeded
{
  id v3 = [(RCShareViewController *)self temporaryDirectoryURL];
  if (v3)
  {
    id v4 = +[NSFileManager defaultManager];
    id v8 = 0;
    unsigned __int8 v5 = [v4 removeItemAtURL:v3 error:&v8];
    id v6 = v8;
    if (v5)
    {
      [(RCShareViewController *)self setTemporaryDirectoryURL:0];
    }
    else
    {
      id v7 = OSLogForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_1000025A4((uint64_t)v6, v7);
      }
    }
  }
}

- (void)cancel
{
  [(RCShareViewController *)self _removeTemporaryAudioFileIfNeeded];
  id v4 = +[NSError errorWithDomain:NSCocoaErrorDomain code:3072 userInfo:0];
  id v3 = [(RCShareViewController *)self extensionContext];
  [v3 cancelRequestWithError:v4];
}

- (void)save
{
  id v3 = [(RCShareViewController *)self sharedAudioFileInfo];
  id v4 = v3;
  if (v3)
  {
    unsigned __int8 v5 = [v3 fileName];
    id v6 = [(RCShareViewController *)self tableViewController];
    id v7 = [v6 voiceMemoTitleText];
    id v8 = [v7 text];

    if (v8 && ([v8 isEqualToString:&stru_1000042C8] & 1) == 0)
    {
      id v9 = v8;

      unsigned __int8 v5 = v9;
    }
    v10 = [v4 url];
    id v11 = [v4 creationDate];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100002364;
    v12[3] = &unk_1000041C0;
    v12[4] = self;
    +[RCSavedRecordingsModel importRecordingWithSourceAudioURL:v10 name:v5 date:v11 completionHandler:v12];
  }
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
}

- (RCShareTableViewController)tableViewController
{
  return self->_tableViewController;
}

- (void)setTableViewController:(id)a3
{
}

- (UIBarButtonItem)cancelButtonItem
{
  return self->_cancelButtonItem;
}

- (void)setCancelButtonItem:(id)a3
{
}

- (UIBarButtonItem)doneButtonItem
{
  return self->_doneButtonItem;
}

- (void)setDoneButtonItem:(id)a3
{
}

- (RCSharedAudioFileInfo)sharedAudioFileInfo
{
  return self->_sharedAudioFileInfo;
}

- (void)setSharedAudioFileInfo:(id)a3
{
}

- (NSURL)temporaryDirectoryURL
{
  return self->_temporaryDirectoryURL;
}

- (void)setTemporaryDirectoryURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temporaryDirectoryURL, 0);
  objc_storeStrong((id *)&self->_sharedAudioFileInfo, 0);
  objc_storeStrong((id *)&self->_doneButtonItem, 0);
  objc_storeStrong((id *)&self->_cancelButtonItem, 0);
  objc_storeStrong((id *)&self->_tableViewController, 0);

  objc_storeStrong((id *)&self->_navigationController, 0);
}

@end