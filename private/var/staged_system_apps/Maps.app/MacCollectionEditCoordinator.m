@interface MacCollectionEditCoordinator
- (CGRect)sourceRect;
- (CollectionHandler)collection;
- (MacCollectionEditCoordinator)initWithCollection:(id)a3 presentingViewController:(id)a4 sourceView:(id)a5 sourceRect:(CGRect)a6 completion:(id)a7;
- (UIView)sourceView;
- (UIViewController)presentingViewController;
- (id)completion;
- (void)_deleteCollection;
- (void)_dismissDeleteConfirmation;
- (void)_dismissEditor;
- (void)_dismissPhotoPicker;
- (void)_finish;
- (void)_presentDeleteConfirmation;
- (void)_presentEditor;
- (void)_presentPhotoPicker;
- (void)_save;
- (void)_updateTitle;
- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4;
- (void)macCollectionEditViewControllerDelete:(id)a3;
- (void)macCollectionEditViewControllerPickPhoto:(id)a3;
- (void)present;
- (void)presentationControllerWillDismiss:(id)a3;
@end

@implementation MacCollectionEditCoordinator

- (MacCollectionEditCoordinator)initWithCollection:(id)a3 presentingViewController:(id)a4 sourceView:(id)a5 sourceRect:(CGRect)a6 completion:(id)a7
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a7;
  v25.receiver = self;
  v25.super_class = (Class)MacCollectionEditCoordinator;
  v20 = [(MacCollectionEditCoordinator *)&v25 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_collection, a3);
    objc_storeWeak((id *)&v21->_presentingViewController, v17);
    objc_storeWeak((id *)&v21->_sourceView, v18);
    v21->_sourceRect.origin.CGFloat x = x;
    v21->_sourceRect.origin.CGFloat y = y;
    v21->_sourceRect.size.CGFloat width = width;
    v21->_sourceRect.size.CGFloat height = height;
    id v22 = objc_retainBlock(v19);
    id completion = v21->_completion;
    v21->_id completion = v22;
  }
  return v21;
}

- (void)present
{
}

- (void)_finish
{
  if (!self->_finished)
  {
    self->_finished = 1;
    [(MacCollectionEditCoordinator *)self _dismissEditor];
    [(MacCollectionEditCoordinator *)self _dismissDeleteConfirmation];
    [(MacCollectionEditCoordinator *)self _dismissPhotoPicker];
    id completion = self->_completion;
    if (completion)
    {
      v4 = (void (*)(void))*((void *)completion + 2);
      v4();
    }
  }
}

- (void)_presentEditor
{
  v3 = [[MacCollectionEditViewController alloc] initWithCollection:self->_collection delegate:self];
  editViewController = self->_editViewController;
  self->_editViewController = v3;

  [(MacCollectionEditViewController *)self->_editViewController setModalPresentationStyle:7];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceView);
  v6 = [(MacCollectionEditViewController *)self->_editViewController popoverPresentationController];
  [v6 setSourceView:WeakRetained];

  double x = self->_sourceRect.origin.x;
  double y = self->_sourceRect.origin.y;
  double width = self->_sourceRect.size.width;
  double height = self->_sourceRect.size.height;
  v11 = [(MacCollectionEditViewController *)self->_editViewController popoverPresentationController];
  [v11 setSourceRect:x, y, width, height];

  v12 = [(MacCollectionEditViewController *)self->_editViewController popoverPresentationController];
  [v12 setPermittedArrowDirections:12];

  v13 = [(MacCollectionEditViewController *)self->_editViewController popoverPresentationController];
  [v13 setDelegate:self];

  id v14 = objc_loadWeakRetained((id *)&self->_presentingViewController);
  [v14 presentViewController:self->_editViewController animated:1 completion:0];
}

- (void)_dismissEditor
{
  v3 = [(MacCollectionEditViewController *)self->_editViewController presentingViewController];

  if (v3)
  {
    [(MacCollectionEditCoordinator *)self _updateTitle];
    [(MacCollectionEditCoordinator *)self _save];
    v4 = [(MacCollectionEditViewController *)self->_editViewController presentingViewController];
    [v4 dismissViewControllerAnimated:1 completion:0];
  }
  editViewController = self->_editViewController;
  self->_editViewController = 0;
}

- (void)_presentDeleteConfirmation
{
  v2 = self;
  objc_initWeak(&location, self);
  collection = v2->_collection;
  v3 = +[NSArray arrayWithObjects:&collection count:1];
  p_presentingViewController = (id *)&v2->_presentingViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&v2->_presentingViewController);
  uint64_t v6 = sub_1000BBB44(WeakRetained);
  v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  v12 = sub_1008AB9F0;
  v13 = &unk_1012E6998;
  objc_copyWeak(&v14, &location);
  uint64_t v7 = +[UIAlertController _maps_confirmationAlertControllerForDeletingCollections:v3 userInterfaceIdiom:v6 completion:&v10];
  confirmDeleteViewController = v2->_confirmDeleteViewController;
  v2 = (MacCollectionEditCoordinator *)((char *)v2 + 16);
  v2->super.isa = (Class)v7;

  id v9 = objc_loadWeakRetained(p_presentingViewController);
  [v9 presentViewController:v2->super.isa animated:1 completion:v10, v11, v12, v13];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_dismissDeleteConfirmation
{
  v3 = [(UIAlertController *)self->_confirmDeleteViewController presentingViewController];

  if (v3)
  {
    v4 = [(UIAlertController *)self->_confirmDeleteViewController presentingViewController];
    [v4 dismissViewControllerAnimated:1 completion:0];
  }
  confirmDeleteViewController = self->_confirmDeleteViewController;
  self->_confirmDeleteViewController = 0;
}

- (void)_presentPhotoPicker
{
  v3 = (UIImagePickerController *)objc_alloc_init((Class)UIImagePickerController);
  imagePickerController = self->_imagePickerController;
  self->_imagePickerController = v3;

  [(UIImagePickerController *)self->_imagePickerController setDelegate:self];
  [(UIImagePickerController *)self->_imagePickerController setAllowsEditing:1];
  [(UIImagePickerController *)self->_imagePickerController setSourceType:0];
  if (sub_1000BBB44(self->_imagePickerController) == 5)
  {
    [(UIImagePickerController *)self->_imagePickerController setModalPresentationStyle:7];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceView);
    uint64_t v6 = [(UIImagePickerController *)self->_imagePickerController popoverPresentationController];
    [v6 setSourceView:WeakRetained];

    double x = self->_sourceRect.origin.x;
    double y = self->_sourceRect.origin.y;
    double width = self->_sourceRect.size.width;
    double height = self->_sourceRect.size.height;
    uint64_t v11 = [(UIImagePickerController *)self->_imagePickerController popoverPresentationController];
    [v11 setSourceRect:x, y, width, height];
  }
  id v12 = objc_loadWeakRetained((id *)&self->_presentingViewController);
  [v12 presentViewController:self->_imagePickerController animated:1 completion:0];

  +[GEOAPPortal captureUserAction:2074 target:252 value:0];
}

- (void)_dismissPhotoPicker
{
  v3 = [(UIImagePickerController *)self->_imagePickerController presentingViewController];

  if (v3)
  {
    v4 = [(UIImagePickerController *)self->_imagePickerController presentingViewController];
    [v4 dismissViewControllerAnimated:1 completion:0];
  }
  imagePickerController = self->_imagePickerController;
  self->_imagePickerController = 0;
}

- (void)_updateTitle
{
  v5 = [(MacCollectionEditViewController *)self->_editViewController newTitle];
  if ([(NSString *)v5 length])
  {
    v3 = [(CollectionHandler *)self->_collection title];
    if (v3 == v5)
    {
    }
    else
    {
      unsigned __int8 v4 = [(NSString *)v3 isEqual:v5];

      if ((v4 & 1) == 0) {
        [(CollectionHandler *)self->_collection updateTitle:v5];
      }
    }
  }
}

- (void)_save
{
}

- (void)_deleteCollection
{
}

- (void)macCollectionEditViewControllerPickPhoto:(id)a3
{
  [(MacCollectionEditCoordinator *)self _dismissEditor];

  [(MacCollectionEditCoordinator *)self _presentPhotoPicker];
}

- (void)macCollectionEditViewControllerDelete:(id)a3
{
  [(MacCollectionEditCoordinator *)self _dismissEditor];

  [(MacCollectionEditCoordinator *)self _presentDeleteConfirmation];
}

- (void)presentationControllerWillDismiss:(id)a3
{
  editViewController = self->_editViewController;
  id v5 = a3;
  id v6 = [(MacCollectionEditViewController *)editViewController presentationController];

  if (v6 == v5)
  {
    [(MacCollectionEditCoordinator *)self _finish];
  }
}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  id v6 = a4;
  id v5 = [v6 objectForKeyedSubscript:UIImagePickerControllerEditedImage];
  if (!v5)
  {
    id v5 = [v6 objectForKeyedSubscript:UIImagePickerControllerOriginalImage];
  }
  [(CollectionHandler *)self->_collection updateImage:v5];
  [(MacCollectionEditCoordinator *)self _save];
  [(MacCollectionEditCoordinator *)self _finish];
}

- (CollectionHandler)collection
{
  return self->_collection;
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  return (UIViewController *)WeakRetained;
}

- (UIView)sourceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceView);

  return (UIView *)WeakRetained;
}

- (CGRect)sourceRect
{
  double x = self->_sourceRect.origin.x;
  double y = self->_sourceRect.origin.y;
  double width = self->_sourceRect.size.width;
  double height = self->_sourceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)completion
{
  return self->_completion;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_destroyWeak((id *)&self->_sourceView);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_imagePickerController, 0);
  objc_storeStrong((id *)&self->_confirmDeleteViewController, 0);

  objc_storeStrong((id *)&self->_editViewController, 0);
}

@end