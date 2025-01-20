@interface PhotoOptionsPicker
+ (BOOL)_supportsCamera;
+ (BOOL)_supportsPhotoLibrary;
+ (BOOL)supportsSourceType:(int64_t)a3;
+ (int64_t)preferredSourceType;
+ (unint64_t)numberOfSupportedSourceTypes;
- (PhotoOptionsPicker)initWithPresentingViewController:(id)a3 sourceView:(id)a4 delegate:(id)a5;
- (void)_captureUserAction:(int)a3;
- (void)_createAlertController;
- (void)dismissPhotoOptionsWithCompletion:(id)a3;
- (void)presentPhotoOptionsWithPreparationBlock:(id)a3;
@end

@implementation PhotoOptionsPicker

- (PhotoOptionsPicker)initWithPresentingViewController:(id)a3 sourceView:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PhotoOptionsPicker;
  v12 = [(PhotoOptionsPicker *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_presentingViewController, a3);
    objc_storeWeak((id *)&v13->_delegate, v11);
    objc_storeStrong((id *)&v13->_anchoringView, a4);
    [(PhotoOptionsPicker *)v13 _createAlertController];
  }

  return v13;
}

- (void)_createAlertController
{
  v3 = +[UIAlertController alertControllerWithTitle:0 message:0 preferredStyle:0];
  photoOptionsActionSheet = self->_photoOptionsActionSheet;
  self->_photoOptionsActionSheet = v3;

  unsigned int v5 = +[PhotoOptionsPicker _supportsCamera];
  unsigned int v6 = +[PhotoOptionsPicker _supportsPhotoLibrary];
  objc_initWeak(location, self);
  if (v5)
  {
    v7 = +[NSBundle mainBundle];
    v8 = [v7 localizedStringForKey:@"Take New Photo [Report a Problem Photos]" value:@"localized string not found" table:0];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100AB2B7C;
    v24[3] = &unk_101313470;
    objc_copyWeak(&v25, location);
    v24[4] = self;
    id v9 = +[UIAlertAction actionWithTitle:v8 style:0 handler:v24];

    [v9 setAccessibilityIdentifier:@"TakeNewPhotoMenuAction"];
    [(UIAlertController *)self->_photoOptionsActionSheet addAction:v9];

    objc_destroyWeak(&v25);
  }
  if (v6)
  {
    id v10 = +[NSBundle mainBundle];
    id v11 = [v10 localizedStringForKey:@"Choose Existing [Report a Problem Photos]" value:@"localized string not found" table:0];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100AB2BEC;
    v22[3] = &unk_101313470;
    objc_copyWeak(&v23, location);
    v22[4] = self;
    v12 = +[UIAlertAction actionWithTitle:v11 style:0 handler:v22];

    [v12 setAccessibilityIdentifier:@"ChooseExistingPhotoMenuAction"];
    [(UIAlertController *)self->_photoOptionsActionSheet addAction:v12];

    objc_destroyWeak(&v23);
  }
  v13 = +[NSBundle mainBundle];
  v14 = [v13 localizedStringForKey:@"Cancel [Report a Problem Photos]" value:@"localized string not found" table:0];
  v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  v18 = sub_100AB2C5C;
  v19 = &unk_101313470;
  objc_copyWeak(&v21, location);
  v20 = self;
  objc_super v15 = +[UIAlertAction actionWithTitle:v14 style:1 handler:&v16];

  [v15 setAccessibilityIdentifier:@"CancelAction" v16, v17, v18, v19];
  [(UIAlertController *)self->_photoOptionsActionSheet addAction:v15];

  objc_destroyWeak(&v21);
  objc_destroyWeak(location);
}

- (void)presentPhotoOptionsWithPreparationBlock:(id)a3
{
  v18 = (void (**)(id, void *))a3;
  v4 = self->_anchoringView;
  unsigned int v5 = [(UIViewController *)self->_presentingViewController view];
  unsigned int v6 = [(UIAlertController *)self->_photoOptionsActionSheet popoverPresentationController];
  [v6 setSourceView:v5];

  [(UIView *)v4 bounds];
  [v5 convertRect:v4 fromView:];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  objc_super v15 = [(UIAlertController *)self->_photoOptionsActionSheet popoverPresentationController];
  [v15 setSourceRect:v8, v10, v12, v14];

  v16 = [(UIAlertController *)self->_photoOptionsActionSheet popoverPresentationController];
  [v16 setPermittedArrowDirections:3];

  if (v18)
  {
    uint64_t v17 = [(UIAlertController *)self->_photoOptionsActionSheet popoverPresentationController];
    v18[2](v18, v17);
  }
  [(UIViewController *)self->_presentingViewController presentViewController:self->_photoOptionsActionSheet animated:1 completion:0];
}

- (void)dismissPhotoOptionsWithCompletion:(id)a3
{
}

- (void)_captureUserAction:(int)a3
{
}

+ (unint64_t)numberOfSupportedSourceTypes
{
  unsigned int v2 = +[PhotoOptionsPicker _supportsCamera];
  unsigned int v3 = +[PhotoOptionsPicker _supportsPhotoLibrary];
  unint64_t v4 = 1;
  if (v2) {
    unint64_t v4 = 2;
  }
  if (v3) {
    return v4;
  }
  else {
    return v2;
  }
}

+ (int64_t)preferredSourceType
{
  unsigned int v2 = +[PhotoOptionsPicker _supportsCamera];
  unsigned int v3 = +[PhotoOptionsPicker _supportsPhotoLibrary];
  int64_t v4 = 2;
  if (!v3) {
    int64_t v4 = 0;
  }
  if (v2) {
    return v3 ^ 1;
  }
  else {
    return v4;
  }
}

+ (BOOL)_supportsCamera
{
  if (!+[UIImagePickerController isSourceTypeAvailable:1])return 0; {
  unsigned int v2 = +[UIDevice currentDevice];
  }
  BOOL v3 = [v2 userInterfaceIdiom] != (id)5;

  return v3;
}

+ (BOOL)_supportsPhotoLibrary
{
  return +[UIImagePickerController isSourceTypeAvailable:0];
}

+ (BOOL)supportsSourceType:(int64_t)a3
{
  if (a3 == 2) {
    return [a1 _supportsPhotoLibrary];
  }
  if (a3 == 1) {
    return [a1 _supportsCamera];
  }
  return 0;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_anchoringView, 0);

  objc_storeStrong((id *)&self->_photoOptionsActionSheet, 0);
}

@end