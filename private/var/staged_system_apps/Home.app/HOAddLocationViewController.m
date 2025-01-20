@interface HOAddLocationViewController
- (BOOL)shouldShowFullWallpaperSection;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (BOOL)textFieldShouldClear:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (HFHomeBuilder)homeBuilder;
- (HOAddLocationViewController)init;
- (HOAddLocationViewController)initWithCoder:(id)a3;
- (HOAddLocationViewController)initWithName:(id)a3 delegate:(id)a4;
- (HOAddLocationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (HOAddLocationViewController)initWithStyle:(int64_t)a3;
- (HOAddLocationViewControllerDelegate)delegate;
- (HUEditableTextCell)nameCell;
- (HUTableViewDiffableDataSource)diffableDataSource;
- (HUWallpaperPickerInlineViewController)wallpaperPickerViewController;
- (NSString)editedName;
- (UIBarButtonItem)savedButtonBarItem;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 rowIdentifier:(id)a5;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (void)applySnapshotWithAnimation:(BOOL)a3;
- (void)cancelButtonPressed:(id)a3;
- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4;
- (void)nameCellTextChanged:(id)a3;
- (void)presentWallpaperEditingViewControllerWithImage:(id)a3 wallpaper:(id)a4;
- (void)saveButtonPressed:(id)a3;
- (void)setDiffableDataSource:(id)a3;
- (void)setEditedName:(id)a3;
- (void)setHomeBuilder:(id)a3;
- (void)setNameCell:(id)a3;
- (void)setNavigationBarVisibility;
- (void)setSavedButtonBarItem:(id)a3;
- (void)setShouldShowFullWallpaperSection:(BOOL)a3;
- (void)setWallpaperPickerViewController:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)textFieldDidChange:(id)a3;
- (void)updateCell:(id)a3 forIndexPath:(id)a4 animated:(BOOL)a5;
- (void)updateWallpaper:(id)a3 image:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)wallpaperEditing:(id)a3 didFinishWithWallpaper:(id)a4 image:(id)a5;
- (void)wallpaperEditingDidCancel:(id)a3;
- (void)wallpaperPicker:(id)a3 didReceiveDroppedImage:(id)a4;
- (void)wallpaperPicker:(id)a3 didSelectWallpaper:(id)a4 withImage:(id)a5;
- (void)wallpaperPickerDidFinish:(id)a3 wallpaper:(id)a4 image:(id)a5;
- (void)wallpaperPickerRequestOpenWallpaperEditor:(id)a3;
- (void)wallpaperThumbnailCell:(id)a3 didReceiveDroppedImage:(id)a4;
@end

@implementation HOAddLocationViewController

- (HOAddLocationViewController)initWithName:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HOAddLocationViewController;
  v8 = [(HOAddLocationViewController *)&v15 initWithStyle:1];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v7);
    v10 = (HFHomeBuilder *)[objc_alloc((Class)HFHomeBuilder) initWithExistingObject:0 inHome:0];
    homeBuilder = v9->_homeBuilder;
    v9->_homeBuilder = v10;

    v12 = (NSString *)[v6 copy];
    editedName = v9->_editedName;
    v9->_editedName = v12;

    v9->_shouldShowFullWallpaperSection = 1;
  }

  return v9;
}

- (HOAddLocationViewController)init
{
  v4 = +[NSAssertionHandler currentHandler];
  v5 = NSStringFromSelector("init");
  [v4 handleFailureInMethod:a2 object:self file:@"HOAddLocationViewController.m" lineNumber:72 description:@"%s is unavailable; use %@ instead"];
    "-[HOAddLocationViewController init]",
    v5);

  return 0;
}

- (HOAddLocationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6 = +[NSAssertionHandler currentHandler];
  id v7 = NSStringFromSelector("init");
  [v6 handleFailureInMethod:a2 object:self file:@"HOAddLocationViewController.m" lineNumber:77 description:@"%s is unavailable; use %@ instead"];
    "-[HOAddLocationViewController initWithNibName:bundle:]",
    v7);

  return 0;
}

- (HOAddLocationViewController)initWithCoder:(id)a3
{
  v5 = +[NSAssertionHandler currentHandler];
  id v6 = NSStringFromSelector("init");
  [v5 handleFailureInMethod:a2 object:self file:@"HOAddLocationViewController.m" lineNumber:82 description:@"%s is unavailable; use %@ instead"];
    "-[HOAddLocationViewController initWithCoder:]",
    v6);

  return 0;
}

- (HOAddLocationViewController)initWithStyle:(int64_t)a3
{
  v5 = +[NSAssertionHandler currentHandler];
  id v6 = NSStringFromSelector("init");
  [v5 handleFailureInMethod:a2 object:self file:@"HOAddLocationViewController.m" lineNumber:87 description:@"%s is unavailable; use %@ instead"];
    "-[HOAddLocationViewController initWithStyle:]",
    v6);

  return 0;
}

- (void)viewDidLoad
{
  v31.receiver = self;
  v31.super_class = (Class)HOAddLocationViewController;
  [(HOAddLocationViewController *)&v31 viewDidLoad];
  [(HOAddLocationViewController *)self setNavigationBarVisibility];
  v3 = [(HOAddLocationViewController *)self tableView];
  [v3 setRowHeight:UITableViewAutomaticDimension];

  v4 = [(HOAddLocationViewController *)self tableView];
  [v4 setEstimatedRowHeight:44.0];

  v5 = [(HOAddLocationViewController *)self tableView];
  [v5 _setSectionContentInsetFollowsLayoutMargins:1];

  id v6 = sub_10000FA68(@"HOAddLocationTitle");
  [(HOAddLocationViewController *)self setTitle:v6];

  v32[0] = objc_opt_class();
  v32[1] = objc_opt_class();
  v32[2] = objc_opt_class();
  v32[3] = objc_opt_class();
  v32[4] = objc_opt_class();
  v32[5] = objc_opt_class();
  id v7 = +[NSArray arrayWithObjects:v32 count:6];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10000FC54;
  v30[3] = &unk_1000C1C58;
  v30[4] = self;
  [v7 na_each:v30];
  v8 = [(HOAddLocationViewController *)self tableView];
  uint64_t v9 = objc_opt_class();
  v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  [v8 registerClass:v9 forHeaderFooterViewReuseIdentifier:v11];

  if (+[HUWallpaperPickerInlineViewController useWallpaperPickerCell])
  {
    id v12 = objc_alloc_init((Class)HUWallpaperPickerInlineViewController);
    [(HOAddLocationViewController *)self setWallpaperPickerViewController:v12];
  }
  id v13 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:3 target:self action:"saveButtonPressed:"];
  v14 = [(HOAddLocationViewController *)self navigationItem];
  [v14 setRightBarButtonItem:v13];

  objc_super v15 = [(HOAddLocationViewController *)self navigationItem];
  v16 = [v15 rightBarButtonItem];
  [v16 setStyle:2];

  v17 = [(HOAddLocationViewController *)self navigationItem];
  v18 = [v17 rightBarButtonItem];
  [v18 setAccessibilityIdentifier:@"Home.HomeSettings.AddHome.Save"];

  id v19 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"cancelButtonPressed:"];
  v20 = [(HOAddLocationViewController *)self navigationItem];
  [v20 setLeftBarButtonItem:v19];

  v21 = [(HOAddLocationViewController *)self navigationItem];
  v22 = [v21 leftBarButtonItem];
  [v22 setAccessibilityIdentifier:@"Home.HomeSettings.AddHome.Cancel"];

  v23 = [(HOAddLocationViewController *)self navigationItem];
  v24 = [v23 rightBarButtonItem];
  [v24 setEnabled:0];

  id v25 = objc_alloc((Class)HUTableViewDiffableDataSource);
  v26 = [(HOAddLocationViewController *)self tableView];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10000FCC4;
  v29[3] = &unk_1000C1C80;
  v29[4] = self;
  v27 = (HUTableViewDiffableDataSource *)[v25 initWithTableView:v26 cellProvider:v29 delegate:self];
  diffableDataSource = self->_diffableDataSource;
  self->_diffableDataSource = v27;

  [(HOAddLocationViewController *)self applySnapshotWithAnimation:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HOAddLocationViewController;
  [(HOAddLocationViewController *)&v4 viewWillAppear:a3];
  [(HOAddLocationViewController *)self setNavigationBarVisibility];
}

- (void)viewDidAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)HOAddLocationViewController;
  [(HOAddLocationViewController *)&v11 viewDidAppear:a3];
  objc_super v4 = sub_10000FA68(@"HOAddLocationPlaceholderTitle");
  v5 = [(HOAddLocationViewController *)self nameCell];
  id v6 = [v5 textField];
  [v6 setPlaceholder:v4];

  id v7 = [(HOAddLocationViewController *)self nameCell];
  v8 = [v7 textField];
  [v8 becomeFirstResponder];

  uint64_t v9 = [(HOAddLocationViewController *)self nameCell];
  [v9 setAccessibilityIdentifier:@"Home.HomeSettings.AddHome.HomeName"];

  v10 = +[NSNotificationCenter defaultCenter];
  [v10 addObserver:self selector:"textFieldDidChange:" name:UITextFieldTextDidChangeNotification object:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HOAddLocationViewController;
  [(HOAddLocationViewController *)&v5 viewWillDisappear:1];
  objc_super v4 = [(HOAddLocationViewController *)self view];
  [v4 endEditing:1];
}

- (void)saveButtonPressed:(id)a3
{
  id v4 = a3;
  objc_super v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v34 = objc_opt_class();
    __int16 v35 = 2080;
    v36 = "-[HOAddLocationViewController saveButtonPressed:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(%@:%s) Save button pressed.", buf, 0x16u);
  }

  id v6 = [(HOAddLocationViewController *)self editedName];
  id v7 = +[HFUtilities sanitizeUserEnteredHomeKitName:v6];

  v8 = [(HOAddLocationViewController *)self nameCell];
  uint64_t v9 = [v8 textField];
  [v9 setText:v7];

  v10 = [(HOAddLocationViewController *)self homeBuilder];
  [v10 setName:v7];

  objc_super v11 = [(HOAddLocationViewController *)self navigationItem];
  id v12 = [v11 rightBarButtonItem];
  [(HOAddLocationViewController *)self setSavedButtonBarItem:v12];

  id v13 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
  id v14 = [objc_alloc((Class)UIBarButtonItem) initWithCustomView:v13];
  objc_super v15 = [(HOAddLocationViewController *)self navigationItem];
  [v15 setRightBarButtonItem:v14];

  [v13 startAnimating];
  v16 = [(HOAddLocationViewController *)self nameCell];
  v17 = [v16 textField];
  [v17 resignFirstResponder];

  id v18 = [objc_alloc((Class)UIBarButtonItem) initWithCustomView:v13];
  id v19 = [(HOAddLocationViewController *)self navigationItem];
  [v19 setRightBarButtonItem:v18];

  v20 = [(HOAddLocationViewController *)self nameCell];
  v21 = [v20 textField];
  [v21 resignFirstResponder];

  v22 = [(HOAddLocationViewController *)self homeBuilder];
  v23 = [v22 commitItem];

  objc_initWeak((id *)buf, self);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1000102A8;
  v32[3] = &unk_1000C1CA8;
  v32[4] = self;
  id v24 = [v23 addCompletionBlock:v32];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100010318;
  v31[3] = &unk_1000C1CD0;
  v31[4] = self;
  id v25 = [v23 addSuccessBlock:v31];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000103AC;
  v28[3] = &unk_1000C1D20;
  objc_copyWeak(&v30, (id *)buf);
  id v26 = v7;
  id v29 = v26;
  id v27 = [v23 addFailureBlock:v28];

  objc_destroyWeak(&v30);
  objc_destroyWeak((id *)buf);
}

- (void)cancelButtonPressed:(id)a3
{
  id v4 = [(HOAddLocationViewController *)self delegate];
  [v4 addLocationViewController:self didFinishWithHome:0];
}

- (void)nameCellTextChanged:(id)a3
{
  id v9 = a3;
  id v4 = [v9 text];
  if (v4)
  {
    objc_super v5 = [v9 text];
    uint64_t v6 = [v5 isEqualToString:&stru_1000C7D40] ^ 1;
  }
  else
  {
    uint64_t v6 = 0;
  }

  id v7 = [(HOAddLocationViewController *)self navigationItem];
  v8 = [v7 rightBarButtonItem];
  [v8 setEnabled:v6];

  [(HOAddLocationViewController *)self setModalInPresentation:v6];
}

- (void)applySnapshotWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init((Class)NSDiffableDataSourceSnapshot);
  v12[0] = off_1000DBEC0;
  v12[1] = off_1000DBEC8;
  uint64_t v6 = +[NSArray arrayWithObjects:v12 count:2];
  [v5 appendSectionsWithIdentifiers:v6];

  objc_super v11 = off_1000DBED0;
  id v7 = +[NSArray arrayWithObjects:&v11 count:1];
  [v5 appendItemsWithIdentifiers:v7 intoSectionWithIdentifier:off_1000DBEC0];

  v8 = objc_opt_new();
  if ([(HOAddLocationViewController *)self shouldShowFullWallpaperSection])
  {
    if (+[HUWallpaperPickerInlineViewController useWallpaperPickerCell])
    {
      id v9 = &off_1000DBEF0;
    }
    else
    {
      if (+[UIImagePickerController isSourceTypeAvailable:1])
      {
        [v8 addObject:off_1000DBED8];
      }
      [v8 addObject:off_1000DBEE0];
      id v9 = &off_1000DBEE8;
    }
    [v8 addObject:*v9];
  }
  [v5 appendItemsWithIdentifiers:v8 intoSectionWithIdentifier:off_1000DBEC8];
  v10 = [(HOAddLocationViewController *)self diffableDataSource];
  [v10 applySnapshot:v5 animatingDifferences:v3];
}

- (void)updateCell:(id)a3 forIndexPath:(id)a4 animated:(BOOL)a5
{
  id v7 = a4;
  v8 = [(HOAddLocationViewController *)self diffableDataSource];
  id v9 = [v8 itemIdentifierForIndexPath:v7];

  LODWORD(v7) = [v9 isEqualToString:off_1000DBEF0];
  if (v7)
  {
    v10 = [(HOAddLocationViewController *)self homeBuilder];
    objc_super v11 = [v10 wallpaperBuilder];
    id v12 = [v11 wallpaperEditCollectionFuture];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000108E8;
    v14[3] = &unk_1000C1D48;
    v14[4] = self;
    BOOL v15 = a5;
    id v13 = [v12 addSuccessBlock:v14];
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 rowIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v10 isEqualToString:off_1000DBED0])
  {
    objc_super v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    id v13 = [v8 dequeueReusableCellWithIdentifier:v12 forIndexPath:v9];

    id v14 = [v13 textField];
    [v14 setAutocapitalizationType:1];

    BOOL v15 = [v13 textField];
    [v15 setClearButtonMode:3];

    v16 = [v13 textField];
    [v16 setDelegate:self];

    v17 = [(HOAddLocationViewController *)self editedName];
    id v18 = [v13 textField];
    [v18 setText:v17];

    [(HOAddLocationViewController *)self setNameCell:v13];
    id v19 = [(HOAddLocationViewController *)self nameCell];
    v20 = [v19 textField];
    [v20 addTarget:self action:"nameCellTextChanged:" forControlEvents:917504];

LABEL_5:
    goto LABEL_11;
  }
  if ([v10 isEqualToString:off_1000DBEF0])
  {
    v21 = (objc_class *)objc_opt_class();
    v22 = NSStringFromClass(v21);
    id v13 = [v8 dequeueReusableCellWithIdentifier:v22 forIndexPath:v9];

    v23 = [(HOAddLocationViewController *)self wallpaperPickerViewController];
    [v13 setViewController:v23];

    id v24 = +[HFWallpaperManager sharedInstance];
    id v25 = [v24 allNamedWallpapersForWallpaperCollectionType:0];
    id v26 = [(HOAddLocationViewController *)self wallpaperPickerViewController];
    [v26 setNamedWallpapers:v25];

    id v27 = +[HFWallpaperManager sharedInstance];
    v28 = [v27 allNamedWallpaperThumbnailsForWallpaperCollectionType:0];
    id v29 = [(HOAddLocationViewController *)self wallpaperPickerViewController];
    [v29 setNamedWallpaperThumbnails:v28];

    id v30 = [(HOAddLocationViewController *)self wallpaperPickerViewController];
    [v8 frame];
    [v30 setImageSizeToFitWidth:3 forNumberOfWallpapers:v31];

    id v19 = [(HOAddLocationViewController *)self wallpaperPickerViewController];
    [v19 setDelegate:self];
    goto LABEL_5;
  }
  if ([v10 isEqualToString:off_1000DBED8])
  {
    v32 = (objc_class *)objc_opt_class();
    v33 = NSStringFromClass(v32);
    id v13 = [v8 dequeueReusableCellWithIdentifier:v33 forIndexPath:v9];

    uint64_t v34 = sub_10000FA68(@"HOAddLocationTakePhotoTitle");
    __int16 v35 = [v13 textLabel];
    [v35 setText:v34];

    [v13 setDisabled:[UIImagePickerController isSourceTypeAvailable:1] ^ 1];
    CFStringRef v36 = @"Home.HomeSettings.AddHome.TakePhoto";
LABEL_10:
    [v13 setAccessibilityIdentifier:v36];
    goto LABEL_11;
  }
  if ([v10 isEqualToString:off_1000DBEE0])
  {
    v37 = (objc_class *)objc_opt_class();
    v38 = NSStringFromClass(v37);
    id v13 = [v8 dequeueReusableCellWithIdentifier:v38 forIndexPath:v9];

    [v13 setAccessoryType:1];
    [v13 setHideIcon:1];
    v39 = sub_10000FA68(@"HOAddLocationChooseWallpaperTitle");
    [v13 setTitleText:v39];

    CFStringRef v36 = @"Home.HomeSettings.AddHome.ChooseFromExisting";
    goto LABEL_10;
  }
  if ([v10 isEqualToString:off_1000DBEE8])
  {
    v41 = (objc_class *)objc_opt_class();
    v42 = NSStringFromClass(v41);
    v43 = [v8 dequeueReusableCellWithIdentifier:v42 forIndexPath:v9];

    [v43 setAccessibilityIdentifier:@"Home.HomeSettings.AddHome.WallpaperThumbnail"];
    [v43 setDelegate:self];
    v44 = +[UIScreen mainScreen];
    [v44 bounds];
    double v46 = v45;
    v47 = +[UIScreen mainScreen];
    [v47 bounds];
    double v49 = v46 / v48;

    [v43 setImageSize:round(v49 * 244.0)];
    v50 = [(HOAddLocationViewController *)self homeBuilder];
    v51 = [v50 wallpaperBuilder];
    v52 = [v51 wallpaperEditCollectionFuture];
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = sub_100010F64;
    v54[3] = &unk_1000C1D70;
    id v13 = v43;
    id v55 = v13;
    id v53 = [v52 addSuccessBlock:v54];
  }
  else
  {
    id v13 = 0;
  }
LABEL_11:
  [(HOAddLocationViewController *)self updateCell:v13 forIndexPath:v9 animated:0];

  return v13;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  id v7 = [(HOAddLocationViewController *)self diffableDataSource];
  id v8 = [v7 itemIdentifierForIndexPath:v6];

  if ([v8 isEqualToString:off_1000DBED8])
  {
    id v9 = objc_alloc_init((Class)UIImagePickerController);
    [v9 setDelegate:self];
    [v9 setSourceType:1];
    [(HOAddLocationViewController *)self presentViewController:v9 animated:1 completion:0];
LABEL_7:

    goto LABEL_8;
  }
  if ([v8 isEqualToString:off_1000DBEE0])
  {
    id v10 = objc_alloc((Class)HUWallpaperPickerViewController);
    objc_super v11 = HULocalizedString();
    id v9 = [v10 initWithCollectionType:0 namedSectionTitle:v11 delegate:self];

    id v12 = [(HOAddLocationViewController *)self navigationController];
    [v12 pushViewController:v9 animated:1];

    goto LABEL_7;
  }
  if ([v8 isEqualToString:off_1000DBEE8])
  {
    id v9 = [(HOAddLocationViewController *)self homeBuilder];
    id v13 = [v9 wallpaperBuilder];
    id v14 = [v13 wallpaperEditCollectionFuture];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000111E4;
    v16[3] = &unk_1000C1D70;
    v16[4] = self;
    id v15 = [v14 addSuccessBlock:v16];

    goto LABEL_7;
  }
LABEL_8:
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(HOAddLocationViewController *)self diffableDataSource];
  id v7 = [v6 itemIdentifierForIndexPath:v5];

  BOOL v8 = ([v7 isEqualToString:off_1000DBEF0] & 1) == 0
    && (+[UIImagePickerController isSourceTypeAvailable:](UIImagePickerController, "isSourceTypeAvailable:", 1)|| ([v7 isEqualToString:off_1000DBED8] & 1) == 0);

  return v8;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  id v7 = +[UIListContentConfiguration groupedHeaderConfiguration];
  BOOL v8 = [(HOAddLocationViewController *)self diffableDataSource];
  id v9 = [v8 sectionIdentifierForIndex:a4];

  if ([v9 isEqualToString:off_1000DBEC0])
  {
    id v10 = @"HOAddLocationNameSection";
LABEL_5:
    objc_super v11 = sub_10000FA68(v10);
    [v7 setText:v11];
    goto LABEL_7;
  }
  if ([v9 isEqualToString:off_1000DBEC8])
  {
    id v10 = @"HOAddLocationWallpaperSectionTitle";
    goto LABEL_5;
  }
  objc_super v11 = v7;
  id v7 = 0;
LABEL_7:

  id v12 = (objc_class *)objc_opt_class();
  id v13 = NSStringFromClass(v12);
  id v14 = [v6 dequeueReusableHeaderFooterViewWithIdentifier:v13];

  [v14 setContentConfiguration:v7];

  return v14;
}

- (void)textFieldDidChange:(id)a3
{
  id v5 = [a3 object];
  id v4 = [v5 text];
  [(HOAddLocationViewController *)self setEditedName:v4];
}

- (BOOL)textFieldShouldClear:(id)a3
{
  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = a3;
  id v5 = [v4 text];
  id v6 = +[HFUtilities sanitizeUserEnteredHomeKitName:v5];
  [(HOAddLocationViewController *)self setEditedName:v6];

  [v4 resignFirstResponder];
  return 1;
}

- (void)wallpaperPickerDidFinish:(id)a3 wallpaper:(id)a4 image:(id)a5
{
  [(HOAddLocationViewController *)self updateWallpaper:a4 image:a5];
  id v7 = [(HOAddLocationViewController *)self navigationController];
  id v6 = [v7 popToViewController:self animated:1];
}

- (void)wallpaperThumbnailCell:(id)a3 didReceiveDroppedImage:(id)a4
{
  id v5 = a4;
  id v8 = +[NSUUID UUID];
  id v6 = [v8 UUIDString];
  id v7 = +[HFWallpaper customWallpaperWithAssetIdentifier:v6];
  [(HOAddLocationViewController *)self updateWallpaper:v7 image:v5];
}

- (void)wallpaperPicker:(id)a3 didReceiveDroppedImage:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSUUID UUID];
  id v9 = [v8 UUIDString];
  id v16 = +[HFWallpaper customWallpaperWithAssetIdentifier:v9];

  [v7 setOriginalCustomImage:v6];
  id v10 = [(HOAddLocationViewController *)self homeBuilder];
  objc_super v11 = [v10 wallpaperBuilder];
  [v11 setWallpaper:v16 image:v6];

  id v12 = [(HOAddLocationViewController *)self diffableDataSource];
  id v13 = [v12 indexPathForItemIdentifier:off_1000DBEF0];

  id v14 = [(HOAddLocationViewController *)self tableView];
  id v15 = [v14 cellForRowAtIndexPath:v13];
  [(HOAddLocationViewController *)self updateCell:v15 forIndexPath:v13 animated:1];
}

- (void)wallpaperPicker:(id)a3 didSelectWallpaper:(id)a4 withImage:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v10 = [(HOAddLocationViewController *)self homeBuilder];
  id v9 = [v10 wallpaperBuilder];
  [v9 setWallpaper:v8 image:v7];
}

- (void)wallpaperPickerRequestOpenWallpaperEditor:(id)a3
{
  id v4 = [(HOAddLocationViewController *)self homeBuilder];
  id v5 = [v4 wallpaperBuilder];
  id v6 = [v5 wallpaperEditCollectionFuture];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100011930;
  v8[3] = &unk_1000C1D70;
  v8[4] = self;
  id v7 = [v6 addSuccessBlock:v8];
}

- (void)wallpaperEditing:(id)a3 didFinishWithWallpaper:(id)a4 image:(id)a5
{
  [(HOAddLocationViewController *)self updateWallpaper:a4 image:a5];

  [(HOAddLocationViewController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)wallpaperEditingDidCancel:(id)a3
{
}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  id v5 = a4;
  [(HOAddLocationViewController *)self dismissViewControllerAnimated:1 completion:0];
  id v6 = [v5 objectForKeyedSubscript:UIImagePickerControllerOriginalImage];

  UIImageWriteToSavedPhotosAlbum(v6, 0, 0, 0);
  id v7 = objc_alloc((Class)HFWallpaper);
  id v8 = +[NSUUID UUID];
  id v9 = [v8 UUIDString];
  id v10 = [v7 initWithType:1 assetIdentifier:v9 cropInfo:0];

  objc_super v11 = +[HFWallpaperManager sharedInstance];
  id v12 = [v11 processOriginalImageFromWallpaper:v10 originalImage:v6];

  [(HOAddLocationViewController *)self presentWallpaperEditingViewControllerWithImage:v12 wallpaper:v10];
}

- (void)presentWallpaperEditingViewControllerWithImage:(id)a3 wallpaper:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)HUWallpaperEditingViewController) initWithWallpaper:v6 image:v7 delegate:self];

  [(HOAddLocationViewController *)self presentViewController:v8 animated:1 completion:0];
}

- (void)updateWallpaper:(id)a3 image:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HOAddLocationViewController *)self homeBuilder];
  id v9 = [v8 wallpaperBuilder];
  [v9 setWallpaper:v7 image:v6];

  id v12 = [(HOAddLocationViewController *)self diffableDataSource];
  id v10 = [(HOAddLocationViewController *)self diffableDataSource];
  objc_super v11 = [v10 snapshot];
  [v12 applySnapshotUsingReloadData:v11];
}

- (void)setNavigationBarVisibility
{
  BOOL v3 = [(HOAddLocationViewController *)self navigationController];
  [v3 setNavigationBarHidden:0 animated:1];

  id v4 = [(HOAddLocationViewController *)self navigationItem];
  [v4 setHidesBackButton:0];

  id v5 = [(HOAddLocationViewController *)self navigationController];
  id v6 = [v5 navigationBar];
  id v7 = +[UIColor systemBackgroundColor];
  [v6 setBarTintColor:v7];

  id v9 = [(HOAddLocationViewController *)self navigationController];
  id v8 = [v9 navigationBar];
  [v8 _setHidesShadow:0];
}

- (HOAddLocationViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HOAddLocationViewControllerDelegate *)WeakRetained;
}

- (HFHomeBuilder)homeBuilder
{
  return self->_homeBuilder;
}

- (void)setHomeBuilder:(id)a3
{
}

- (UIBarButtonItem)savedButtonBarItem
{
  return self->_savedButtonBarItem;
}

- (void)setSavedButtonBarItem:(id)a3
{
}

- (HUWallpaperPickerInlineViewController)wallpaperPickerViewController
{
  return self->_wallpaperPickerViewController;
}

- (void)setWallpaperPickerViewController:(id)a3
{
}

- (HUEditableTextCell)nameCell
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_nameCell);

  return (HUEditableTextCell *)WeakRetained;
}

- (void)setNameCell:(id)a3
{
}

- (NSString)editedName
{
  return self->_editedName;
}

- (void)setEditedName:(id)a3
{
}

- (BOOL)shouldShowFullWallpaperSection
{
  return self->_shouldShowFullWallpaperSection;
}

- (void)setShouldShowFullWallpaperSection:(BOOL)a3
{
  self->_shouldShowFullWallpaperSection = a3;
}

- (HUTableViewDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)setDiffableDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_editedName, 0);
  objc_destroyWeak((id *)&self->_nameCell);
  objc_storeStrong((id *)&self->_wallpaperPickerViewController, 0);
  objc_storeStrong((id *)&self->_savedButtonBarItem, 0);
  objc_storeStrong((id *)&self->_homeBuilder, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end