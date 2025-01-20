@interface CollectionPicker
- (CollectionPicker)initWithCollectionEditSession:(id)a3 sourceView:(id)a4 sourceRect:(CGRect)a5;
- (CollectionPickerDelegate)delegate;
- (CollectionSaveSession)editSession;
- (id)alertController;
- (id)collectionPickerContaineeViewController;
- (void)_collectionPickerDismissedAfterSelectingCollection:(id)a3 parentVC:(id)a4;
- (void)cleanControllers;
- (void)collectionPickerContaineeViewController:(id)a3 selectCollection:(id)a4;
- (void)collectionPickerContaineeViewControllerCancelTapped:(id)a3;
- (void)collectionPickerViewController:(id)a3 selectCollection:(id)a4;
- (void)collectionPickerViewController:(id)a3 unselectCollection:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setEditSession:(id)a3;
- (void)viewControllerToPresentIfContainee:(id)a3 ifAlertController:(id)a4;
@end

@implementation CollectionPicker

- (CollectionPicker)initWithCollectionEditSession:(id)a3 sourceView:(id)a4 sourceRect:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v12 = a3;
  id v13 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CollectionPicker;
  v14 = [(CollectionPicker *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_editSession, a3);
    objc_storeStrong((id *)&v15->_sourceView, a4);
    v15->_sourceRect.origin.CGFloat x = x;
    v15->_sourceRect.origin.CGFloat y = y;
    v15->_sourceRect.size.CGFloat width = width;
    v15->_sourceRect.size.CGFloat height = height;
  }

  return v15;
}

- (void)viewControllerToPresentIfContainee:(id)a3 ifAlertController:(id)a4
{
  v11 = (void (**)(id, void *))a3;
  v6 = (void (**)(id, void *))a4;
  v7 = +[UIDevice currentDevice];
  id v8 = [v7 userInterfaceIdiom];

  if (v6 && self->_sourceView && (v8 != (id)6 ? (BOOL v9 = v8 == (id)1) : (BOOL v9 = 1), v9))
  {
    v10 = [(CollectionPicker *)self alertController];
    v6[2](v6, v10);
  }
  else
  {
    if (!v11) {
      goto LABEL_12;
    }
    v10 = [(CollectionPicker *)self collectionPickerContaineeViewController];
    v11[2](v11, v10);
  }

LABEL_12:
}

- (id)collectionPickerContaineeViewController
{
  collectionPickerContaineeController = self->_collectionPickerContaineeController;
  if (!collectionPickerContaineeController)
  {
    v4 = [[_TtC4Maps39CollectionPickerContaineeViewController alloc] initWithCollectionEditSession:self->_editSession];
    v5 = self->_collectionPickerContaineeController;
    self->_collectionPickerContaineeController = v4;

    [(CollectionPickerContaineeViewController *)self->_collectionPickerContaineeController setDelegate:self];
    collectionPickerContaineeController = self->_collectionPickerContaineeController;
  }

  return collectionPickerContaineeController;
}

- (id)alertController
{
  alertController = self->_alertController;
  if (!alertController)
  {
    if (!self->_pickerViewController)
    {
      v4 = [[CollectionPickerViewController alloc] initWithCollectionEditSession:self->_editSession];
      pickerViewController = self->_pickerViewController;
      self->_pickerViewController = v4;

      [(CollectionPickerViewController *)self->_pickerViewController setDelegate:self];
    }
    v6 = [(CollectionEditSession *)self->_editSession selectedObjectSet];
    id v7 = [v6 count];

    id v8 = +[NSBundle mainBundle];
    BOOL v9 = v8;
    if ((unint64_t)v7 <= 1) {
      CFStringRef v10 = @"[Collection] Alert's title";
    }
    else {
      CFStringRef v10 = @"[Collection] Alert's title (plural)";
    }
    v11 = [v8 localizedStringForKey:v10 value:@"localized string not found" table:0];

    id v12 = +[UIAlertController alertControllerWithTitle:0 message:v11 preferredStyle:0];
    sourceView = self->_sourceView;
    v14 = [(UIAlertController *)v12 popoverPresentationController];
    [v14 setSourceView:sourceView];

    double x = self->_sourceRect.origin.x;
    double y = self->_sourceRect.origin.y;
    double width = self->_sourceRect.size.width;
    double height = self->_sourceRect.size.height;
    v19 = [(UIAlertController *)v12 popoverPresentationController];
    [v19 setSourceRect:x, y, width, height];

    [(UIAlertController *)v12 setContentViewController:self->_pickerViewController];
    v20 = [(UIAlertController *)v12 view];
    [v20 setAccessibilityIdentifier:@"CollectionPickerAlert"];

    objc_initWeak(&location, self);
    v21 = +[NSBundle mainBundle];
    v22 = [v21 localizedStringForKey:@"[Collection] Alert's cancel button title" value:@"localized string not found" table:0];
    v26 = _NSConcreteStackBlock;
    uint64_t v27 = 3221225472;
    v28 = sub_1003F182C;
    v29 = &unk_1012E8EB8;
    objc_copyWeak(&v30, &location);
    v23 = +[UIAlertAction actionWithTitle:v22 style:1 handler:&v26];

    [v23 setAccessibilityIdentifier:@"CollectionPickerCancelAction" v26, v27, v28, v29];
    [(UIAlertController *)v12 addAction:v23];
    v24 = self->_alertController;
    self->_alertController = v12;

    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);

    alertController = self->_alertController;
  }

  return alertController;
}

- (void)cleanControllers
{
  alertController = self->_alertController;
  self->_alertController = 0;

  pickerViewController = self->_pickerViewController;
  self->_pickerViewController = 0;

  collectionPickerContaineeController = self->_collectionPickerContaineeController;
  self->_collectionPickerContaineeController = 0;
}

- (void)_collectionPickerDismissedAfterSelectingCollection:(id)a3 parentVC:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1003F1B60;
  v23[3] = &unk_1012E5D58;
  id v8 = v6;
  id v24 = v8;
  v25 = self;
  BOOL v9 = objc_retainBlock(v23);
  if ([(CollectionSaveSession *)self->_editSession canRenameSelectedObjectInCollection:v8])
  {
    [(CollectionSaveSession *)self->_editSession mapItem];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1003F1BF0;
    v20[3] = &unk_1012E8EE0;
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    v22 = v9;
    id v10 = v21;
    v11 = +[UIViewController _maps_viewControllerForRenamingMapItem:v10 saveHandler:v20 cancelHandler:0];
    dispatch_time_t v12 = dispatch_time(0, 500000000);
    v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    v16 = sub_1003F1C38;
    objc_super v17 = &unk_1012E5D58;
    id v18 = v7;
    id v19 = v11;
    id v13 = v11;
    dispatch_after(v12, (dispatch_queue_t)&_dispatch_main_q, &v14);
  }
  else
  {
    ((void (*)(void *))v9[2])(v9);
  }
  [(CollectionPicker *)self cleanControllers];
}

- (void)collectionPickerViewController:(id)a3 selectCollection:(id)a4
{
  id v5 = a4;
  id v6 = [(UIAlertController *)self->_alertController presentingViewController];
  alertController = self->_alertController;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1003F1D18;
  v10[3] = &unk_1012E66E0;
  v10[4] = self;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  [(UIAlertController *)alertController dismissViewControllerAnimated:1 completion:v10];
}

- (void)collectionPickerViewController:(id)a3 unselectCollection:(id)a4
{
  [(UIAlertController *)self->_alertController dismissViewControllerAnimated:1 completion:0];
  [(CollectionPicker *)self cleanControllers];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained collectionPickerClosed:self];
}

- (void)collectionPickerContaineeViewController:(id)a3 selectCollection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 presentingViewController];
  [v6 handleDismissAction:0];
  id v9 = [v6 transitionCoordinator];

  if (v9)
  {
    id v10 = [v6 transitionCoordinator];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1003F1EBC;
    v11[3] = &unk_1012E8F08;
    v11[4] = self;
    id v12 = v7;
    id v13 = v8;
    [v10 animateAlongsideTransition:0 completion:v11];
  }
  else
  {
    [(CollectionPicker *)self _collectionPickerDismissedAfterSelectingCollection:v7 parentVC:v8];
  }
}

- (void)collectionPickerContaineeViewControllerCancelTapped:(id)a3
{
  [a3 handleDismissAction:0];
  [(CollectionPicker *)self cleanControllers];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained collectionPickerClosed:self];
}

- (CollectionPickerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CollectionPickerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CollectionSaveSession)editSession
{
  return self->_editSession;
}

- (void)setEditSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editSession, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_storeStrong((id *)&self->_collectionPickerContaineeController, 0);
  objc_storeStrong((id *)&self->_alertController, 0);

  objc_storeStrong((id *)&self->_pickerViewController, 0);
}

@end