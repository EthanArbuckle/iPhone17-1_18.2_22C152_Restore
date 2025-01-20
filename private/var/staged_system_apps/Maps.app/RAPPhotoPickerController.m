@interface RAPPhotoPickerController
- (BOOL)isPicking;
- (RAPPhoto)photo;
- (RAPPhotoPickerController)init;
- (RAPPhotoPickerController)initWithInitialPhoto:(id)a3;
- (UIView)anchoringView;
- (UIViewController)presentingViewController;
- (int64_t)overriddenInterfaceStyle;
- (void)_cancel;
- (void)_clearImagePicker;
- (void)_endPicking;
- (void)_instrument;
- (void)_invokeChangeHandlers;
- (void)_presentPhotoOptions;
- (void)_presentViewController:(id)a3;
- (void)_proceedWithSourceType:(int64_t)a3;
- (void)addObserver:(id)a3 changeHandler:(id)a4;
- (void)clearSelectedPhoto;
- (void)dealloc;
- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4;
- (void)imagePickerControllerDidCancel:(id)a3;
- (void)photoOptionsPickerDidCancel:(id)a3;
- (void)photoOptionsPickerDidSelectAddFromLibrary:(id)a3;
- (void)photoOptionsPickerDidSelectTakePhoto:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setAnchoringView:(id)a3;
- (void)setOverriddenInterfaceStyle:(int64_t)a3;
- (void)setPresentingViewController:(id)a3;
- (void)startPicking;
- (void)startPickingWithSourceType:(int64_t)a3;
@end

@implementation RAPPhotoPickerController

- (void)addObserver:(id)a3 changeHandler:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  observers = self->_observers;
  if (!observers)
  {
    v8 = +[NSMapTable weakToStrongObjectsMapTable];
    v9 = self->_observers;
    self->_observers = v8;

    observers = self->_observers;
  }
  id v10 = [v6 copy];
  [(NSMapTable *)observers setObject:v10 forKey:v11];
}

- (void)removeObserver:(id)a3
{
}

- (void)_invokeChangeHandlers
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = self->_observers;
  id v4 = [(NSMapTable *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_observers, "objectForKey:", v8, (void)v10);
        v9 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue();
        ((void (**)(void, RAPPhotoPickerController *, uint64_t))v9)[2](v9, self, v8);
      }
      id v5 = [(NSMapTable *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (RAPPhotoPickerController)init
{
  return [(RAPPhotoPickerController *)self initWithInitialPhoto:0];
}

- (RAPPhotoPickerController)initWithInitialPhoto:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RAPPhotoPickerController;
  uint64_t v6 = [(RAPPhotoPickerController *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photo, a3);
    v7->_overriddenInterfaceStyle = 0;
  }

  return v7;
}

- (void)dealloc
{
  [(RAPPhotoPickerController *)self _clearImagePicker];
  v3.receiver = self;
  v3.super_class = (Class)RAPPhotoPickerController;
  [(RAPPhotoPickerController *)&v3 dealloc];
}

- (void)clearSelectedPhoto
{
  photo = self->_photo;
  self->_photo = 0;
}

- (void)_clearImagePicker
{
  [(UIImagePickerController *)self->_imagePicker setDelegate:0];
  objc_super v3 = [(UIImagePickerController *)self->_imagePicker popoverPresentationController];
  [v3 setDelegate:0];

  id v4 = [(UIImagePickerController *)self->_imagePicker presentationController];
  [v4 setDelegate:0];

  imagePicker = self->_imagePicker;
  self->_imagePicker = 0;
}

- (void)startPicking
{
  if (!self->_picking)
  {
    self->_picking = 1;
    [(RAPPhotoPickerController *)self _presentPhotoOptions];
    [(RAPPhotoPickerController *)self _instrument];
  }
}

- (void)startPickingWithSourceType:(int64_t)a3
{
  if (a3)
  {
    if (a3 == 2)
    {
      [(RAPPhotoPickerController *)self _proceedWithSourceType:0];
    }
    else if (a3 == 1)
    {
      [(RAPPhotoPickerController *)self _proceedWithSourceType:1];
    }
  }
  else
  {
    [(RAPPhotoPickerController *)self startPicking];
  }
}

- (void)_presentPhotoOptions
{
  objc_super v3 = [[PhotoOptionsPicker alloc] initWithPresentingViewController:self->_presentingViewController sourceView:self->_anchoringView delegate:self];
  photoOptionsPicker = self->_photoOptionsPicker;
  self->_photoOptionsPicker = v3;

  id v5 = self->_photoOptionsPicker;

  [(PhotoOptionsPicker *)v5 presentPhotoOptionsWithPreparationBlock:0];
}

- (void)_proceedWithSourceType:(int64_t)a3
{
  if (a3 == 1)
  {
    AVAuthorizationStatus v5 = +[AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    BOOL v7 = v5 == AVAuthorizationStatusAuthorized || v5 == AVAuthorizationStatusNotDetermined;
    if (v5) {
      BOOL v8 = v5 == AVAuthorizationStatusAuthorized;
    }
    else {
      BOOL v8 = 1;
    }
    if (!v8)
    {
      objc_super v9 = +[NSBundle mainBundle];
      id v44 = [v9 localizedStringForKey:@"No Access to Camera" value:@"localized string not found" table:0];

      long long v10 = +[NSBundle mainBundle];
      long long v11 = v10;
      CFStringRef v12 = @"To take a photo, go to Settings > Privacy & Security > Camera and enable access for Maps.";
LABEL_30:
      v18 = [v10 localizedStringForKey:v12 value:@"localized string not found" table:0];

      goto LABEL_31;
    }
  }
  else
  {
    PHAuthorizationStatus v13 = +[PHPhotoLibrary authorizationStatus];
    BOOL v7 = v13 == PHAuthorizationStatusAuthorized || v13 == PHAuthorizationStatusNotDetermined;
    if (v13) {
      BOOL v15 = v13 == PHAuthorizationStatusAuthorized;
    }
    else {
      BOOL v15 = 1;
    }
    if (!v15)
    {
      v19 = +[NSBundle mainBundle];
      id v44 = [v19 localizedStringForKey:@"No Access to Photos" value:@"localized string not found" table:0];

      long long v10 = +[NSBundle mainBundle];
      long long v11 = v10;
      CFStringRef v12 = @"To attach a photo to the report, go to Settings > Privacy & Security > Photos and enable access for Maps.";
      goto LABEL_30;
    }
  }
  if (!v7)
  {
    id v44 = 0;
    v18 = 0;
LABEL_31:
    v20 = [(RAPPhotoPickerController *)self presentingViewController];
    v21 = +[NSBundle mainBundle];
    v22 = [v21 localizedStringForKey:@"OK [Alert dismissal]" value:@"localized string not found" table:0];
    [v20 _maps_presentSimpleAlertWithTitle:v44 message:v18 dismissalActionTitle:v22];

    [(RAPPhotoPickerController *)self _endPicking];

    return;
  }
  p_imagePicker = &self->_imagePicker;
  v17 = [(UIImagePickerController *)self->_imagePicker presentingViewController];

  if (!v17)
  {
    v23 = [(RAPPhotoPickerController *)self presentingViewController];
    if (!v23)
    {
      [(RAPPhotoPickerController *)self _endPicking];
LABEL_47:

      return;
    }
    id v24 = objc_alloc_init((Class)UIImagePickerController);
    [v24 setDelegate:self];
    if (!a3)
    {
      v25 = [UTTypeImage identifier];
      v45 = v25;
      v26 = +[NSArray arrayWithObjects:&v45 count:1];
      [v24 setMediaTypes:v26];
    }
    [v24 setSourceType:a3];
    objc_storeStrong((id *)&self->_imagePicker, v24);
    v27 = *p_imagePicker;
    if (a3 == 1)
    {
      uint64_t v28 = 0;
    }
    else
    {
      uint64_t v29 = sub_1000BBB44(v27);
      v27 = *p_imagePicker;
      if (v29 == 5)
      {
        [(UIImagePickerController *)v27 setModalPresentationStyle:7];
        presentingViewController = self->_presentingViewController;
        v31 = self->_anchoringView;
        v32 = [(UIViewController *)presentingViewController view];
        v33 = [(UIImagePickerController *)self->_imagePicker popoverPresentationController];
        [v33 setSourceView:v32];

        [(UIView *)v31 bounds];
        [v32 convertRect:v31 fromView:];
        double v35 = v34;
        double v37 = v36;
        double v39 = v38;
        double v41 = v40;
        v42 = [(UIImagePickerController *)self->_imagePicker popoverPresentationController];

        [v42 setSourceRect:v35, v37, v39, v41];
LABEL_44:
        v43 = [(UIImagePickerController *)self->_imagePicker presentationController];
        [v43 setDelegate:self];

        [v24 setOverrideUserInterfaceStyle:self->_overriddenInterfaceStyle];
        [(RAPPhotoPickerController *)self _presentViewController:v24];
        if (a3 != 1) {
          sub_100899D70();
        }

        goto LABEL_47;
      }
      uint64_t v28 = 2;
    }
    [(UIImagePickerController *)v27 setModalPresentationStyle:v28];
    goto LABEL_44;
  }

  [(RAPPhotoPickerController *)self _endPicking];
}

- (void)_endPicking
{
  self->_picking = 0;
  photoOptionsPicker = self->_photoOptionsPicker;
  self->_photoOptionsPicker = 0;

  [(RAPPhotoPickerController *)self _invokeChangeHandlers];
}

- (void)_presentViewController:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100B12FE4;
  v4[3] = &unk_1012E5D58;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

- (void)_instrument
{
  v2 = [(RAPPhotoPickerController *)self presentingViewController];
  if ([v2 conformsToProtocol:&OBJC_PROTOCOL___RAPInstrumentableTarget]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v5 = v3;

  if ([v5 analyticTarget])
  {
    id v4 = +[MKMapService sharedService];
    [v4 captureUserAction:10115 onTarget:[v5 analyticTarget] eventValue:0];
  }
}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v7 objectForKeyedSubscript:UIImagePickerControllerOriginalImage];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100B13340;
  v25[3] = &unk_101318068;
  v25[4] = self;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v26 = v8;
  objc_super v9 = objc_retainBlock(v25);
  long long v10 = [v7 objectForKeyedSubscript:UIImagePickerControllerPHAsset];

  if (v10)
  {
    id v11 = [v7 objectForKeyedSubscript:UIImagePickerControllerPHAsset];
    CFStringRef v12 = [v11 location];
    PHAuthorizationStatus v13 = [v11 creationDate];
    ((void (*)(void *, void *, void *))v9[2])(v9, v12, v13);
  }
  else
  {
    if ([v6 sourceType] != (id)1
      || (+[MKLocationManager sharedLocationManager],
          v14 = objc_claimAutoreleasedReturnValue(),
          unsigned int v15 = [v14 isLocationServicesPossiblyAvailable],
          v14,
          !v15))
    {
      ((void (*)(void *, void, void))v9[2])(v9, 0, 0);
      goto LABEL_8;
    }
    v16 = +[NSDate date];
    v17 = +[MKLocationManager sharedLocationManager];
    v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472;
    v21 = sub_100B13434;
    v22 = &unk_101318090;
    id v23 = v16;
    id v24 = v9;
    id v11 = v16;
    v18 = [v17 singleLocationUpdateWithHandler:&v19];

    [v18 start:v19, v20, v21, v22];
  }

LABEL_8:
}

- (void)imagePickerControllerDidCancel:(id)a3
{
}

- (void)presentationControllerDidDismiss:(id)a3
{
  self->_picking = 0;
  [(RAPPhotoPickerController *)self _invokeChangeHandlers];

  [(RAPPhotoPickerController *)self _clearImagePicker];
}

- (void)_cancel
{
  self->_picking = 0;
  [(RAPPhotoPickerController *)self _invokeChangeHandlers];
  imagePicker = self->_imagePicker;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100B13510;
  v4[3] = &unk_1012E5D08;
  v4[4] = self;
  [(UIImagePickerController *)imagePicker dismissViewControllerAnimated:1 completion:v4];
}

- (void)photoOptionsPickerDidSelectTakePhoto:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100B1358C;
  v3[3] = &unk_1012E5D08;
  v3[4] = self;
  [a3 dismissPhotoOptionsWithCompletion:v3];
}

- (void)photoOptionsPickerDidSelectAddFromLibrary:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100B1360C;
  v3[3] = &unk_1012E5D08;
  v3[4] = self;
  [a3 dismissPhotoOptionsWithCompletion:v3];
}

- (void)photoOptionsPickerDidCancel:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100B1368C;
  v3[3] = &unk_1012E5D08;
  v3[4] = self;
  [a3 dismissPhotoOptionsWithCompletion:v3];
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
}

- (UIView)anchoringView
{
  return self->_anchoringView;
}

- (void)setAnchoringView:(id)a3
{
}

- (RAPPhoto)photo
{
  return self->_photo;
}

- (BOOL)isPicking
{
  return self->_picking;
}

- (int64_t)overriddenInterfaceStyle
{
  return self->_overriddenInterfaceStyle;
}

- (void)setOverriddenInterfaceStyle:(int64_t)a3
{
  self->_overriddenInterfaceStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photo, 0);
  objc_storeStrong((id *)&self->_anchoringView, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_photoOptionsPicker, 0);
  objc_storeStrong((id *)&self->_imagePicker, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end