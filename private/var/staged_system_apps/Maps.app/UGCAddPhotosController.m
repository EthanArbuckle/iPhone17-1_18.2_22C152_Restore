@interface UGCAddPhotosController
- (BOOL)_isValidImageSize:(CGSize)a3;
- (UGCAddPhotosController)initWithPresentingViewController:(id)a3 sourceType:(int64_t)a4 multipleSelectionLimit:(unint64_t)a5 placeQuestionnaire:(id)a6 delegate:(id)a7;
- (id)_resizeImageIfNeeded:(id)a3 imageSize:(CGSize)a4;
- (unint64_t)maximumCount;
- (void)_captureUserAction:(int)a3;
- (void)_handleAddFromCameraWithImageData:(id)a3 mediaInfo:(id)a4;
- (void)_handleAddFromLibraryWithEditingInfoList:(id)a3;
- (void)_imagePickerDidRetake:(id)a3;
- (void)_presentImagePickerWithSourceType:(int64_t)a3;
- (void)_resolveInitialSourceTypeIfNeeded;
- (void)dismissWithCompletion:(id)a3;
- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4;
- (void)imagePickerController:(id)a3 didFinishPickingMultipleMediaWithInfo:(id)a4;
- (void)imagePickerControllerDidCancel:(id)a3;
- (void)photoOptionsPickerDidCancel:(id)a3;
- (void)photoOptionsPickerDidSelectAddFromLibrary:(id)a3;
- (void)photoOptionsPickerDidSelectTakePhoto:(id)a3;
- (void)present;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)setMaximumCount:(unint64_t)a3;
@end

@implementation UGCAddPhotosController

- (UGCAddPhotosController)initWithPresentingViewController:(id)a3 sourceType:(int64_t)a4 multipleSelectionLimit:(unint64_t)a5 placeQuestionnaire:(id)a6 delegate:(id)a7
{
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  v20.receiver = self;
  v20.super_class = (Class)UGCAddPhotosController;
  v16 = [(UGCAddPhotosController *)&v20 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_presentingViewController, a3);
    v17->_initialSourceType = a4;
    objc_storeWeak((id *)&v17->_delegate, v15);
    v17->_multipleSelectionLimit = a5;
    objc_storeStrong((id *)&v17->_placeQuestionnaire, a6);
    [(UGCAddPhotosController *)v17 _resolveInitialSourceTypeIfNeeded];
    v18 = +[NSNotificationCenter defaultCenter];
    [v18 addObserver:v17 selector:"_imagePickerDidRetake:" name:_UIImagePickerControllerUserDidRejectItemNotification object:0];
  }
  return v17;
}

- (void)_resolveInitialSourceTypeIfNeeded
{
  unint64_t v3 = +[PhotoOptionsPicker numberOfSupportedSourceTypes];
  if (self->_initialSourceType) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = v3 == 0;
  }
  if (!v4) {
    self->_initialSourceType = +[PhotoOptionsPicker preferredSourceType];
  }
}

- (void)present
{
  if (+[PhotoOptionsPicker numberOfSupportedSourceTypes])
  {
    if (self->_initialSourceType)
    {
      -[UGCAddPhotosController _presentImagePickerWithSourceType:](self, "_presentImagePickerWithSourceType:");
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      BOOL v4 = [WeakRetained addPhotosControllerRequestsAnchoringView:self];

      v5 = [[PhotoOptionsPicker alloc] initWithPresentingViewController:self->_presentingViewController sourceView:v4 delegate:self];
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_100979700;
      v7[3] = &unk_1013121C8;
      v7[4] = self;
      [(PhotoOptionsPicker *)v5 presentPhotoOptionsWithPreparationBlock:v7];
    }
  }
  else
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 takePhotoController:self didSelectPhotosWithMetadata:&__NSArray0__struct];
  }
}

- (void)_presentImagePickerWithSourceType:(int64_t)a3
{
  v5 = (UIImagePickerController *)objc_alloc_init((Class)UIImagePickerController);
  imagePicker = self->_imagePicker;
  self->_imagePicker = v5;

  [(UIImagePickerController *)self->_imagePicker setDelegate:self];
  if (self->_multipleSelectionLimit >= 2)
  {
    [(UIImagePickerController *)self->_imagePicker _setAllowsMultipleSelection:1];
    [(UIImagePickerController *)self->_imagePicker _setMultipleSelectionLimit:self->_multipleSelectionLimit];
  }
  if (a3 == 2)
  {
    [(UIImagePickerController *)self->_imagePicker setSourceType:0];
    uint64_t v9 = sub_1000BBB44(self->_imagePicker);
    v7 = self->_imagePicker;
    if (v9 == 5)
    {
      [(UIImagePickerController *)v7 setModalPresentationStyle:7];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v11 = [WeakRetained addPhotosControllerRequestsAnchoringView:self];

      v12 = [(UIViewController *)self->_presentingViewController view];
      id v13 = [(UIImagePickerController *)self->_imagePicker popoverPresentationController];
      [v13 setSourceView:v12];

      [v11 bounds];
      [v12 convertRect:v11 fromView:];
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      v22 = [(UIImagePickerController *)self->_imagePicker popoverPresentationController];
      [v22 setSourceRect:v15, v17, v19, v21];

      goto LABEL_10;
    }
    uint64_t v8 = 2;
  }
  else
  {
    if (a3 != 1) {
      goto LABEL_10;
    }
    [(UIImagePickerController *)self->_imagePicker setSourceType:1];
    v7 = self->_imagePicker;
    uint64_t v8 = 0;
  }
  [(UIImagePickerController *)v7 setModalPresentationStyle:v8];
LABEL_10:
  v23 = [(UIImagePickerController *)self->_imagePicker popoverPresentationController];
  [v23 setDelegate:self];

  v24 = [(UIImagePickerController *)self->_imagePicker presentationController];
  [v24 setDelegate:self];

  [(UIImagePickerController *)self->_imagePicker _setImagePickerSavingOptions:6];
  presentingViewController = self->_presentingViewController;
  v26 = self->_imagePicker;

  [(UIViewController *)presentingViewController presentViewController:v26 animated:1 completion:0];
}

- (void)imagePickerControllerDidCancel:(id)a3
{
  BOOL v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:_UIImagePickerControllerUserDidRejectItemNotification object:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained takePhotoControllerDidCancel:self];
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained takePhotoControllerDidCancel:self];
}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 sourceType] == (id)1)
  {
    [(UGCAddPhotosController *)self _captureUserAction:2129];
    uint64_t v8 = [v7 objectForKeyedSubscript:UIImagePickerControllerEditedImage];
    if (!v8)
    {
      uint64_t v8 = [v7 objectForKeyedSubscript:UIImagePickerControllerOriginalImage];
    }
    [(UIImage *)v8 size];
    if (-[UGCAddPhotosController _isValidImageSize:](self, "_isValidImageSize:"))
    {
      GEOConfigGetDouble();
      v10 = UIImageJPEGRepresentation(v8, v9);
      [(UIImage *)v8 size];
      v11 = -[UGCAddPhotosController _resizeImageIfNeeded:imageSize:](self, "_resizeImageIfNeeded:imageSize:", v10);

      if (v11)
      {
        UIImageDataWriteToSavedPhotosAlbum();
        [(UGCAddPhotosController *)self _handleAddFromCameraWithImageData:v11 mediaInfo:v7];
      }
    }
    goto LABEL_12;
  }
  id v12 = [v6 sourceType];
  if (v7
    && !v12
    && ([(UIImagePickerController *)self->_imagePicker _allowsMultipleSelection] & 1) == 0)
  {
    id v13 = v7;
    uint64_t v8 = +[NSArray arrayWithObjects:&v13 count:1];
    [(UGCAddPhotosController *)self _handleAddFromLibraryWithEditingInfoList:v8];
LABEL_12:
  }
}

- (void)imagePickerController:(id)a3 didFinishPickingMultipleMediaWithInfo:(id)a4
{
  id v6 = a4;
  if (![a3 sourceType]) {
    [(UGCAddPhotosController *)self _handleAddFromLibraryWithEditingInfoList:v6];
  }
}

- (void)_handleAddFromLibraryWithEditingInfoList:(id)a3
{
  id v4 = a3;
  id v19 = objc_alloc_init((Class)NSMutableArray);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v4;
  id v5 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(obj);
        }
        CGFloat v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v10 = [v9 objectForKeyedSubscript:UIImagePickerControllerEditedImage];
        if (!v10)
        {
          v10 = [v9 objectForKeyedSubscript:UIImagePickerControllerOriginalImage];
        }
        [(UIImage *)v10 size];
        if (-[UGCAddPhotosController _isValidImageSize:](self, "_isValidImageSize:"))
        {
          GEOConfigGetDouble();
          id v12 = UIImageJPEGRepresentation(v10, v11);
          [(UIImage *)v10 size];
          id v13 = -[UGCAddPhotosController _resizeImageIfNeeded:imageSize:](self, "_resizeImageIfNeeded:imageSize:", v12);

          double v14 = [v9 objectForKeyedSubscript:UIImagePickerControllerPHAsset];
          double v15 = [[UGCPhotoWithMetadata alloc] initWithImageData:v13 PHAsset:v14 sourceType:2];
          if (v15) {
            [v19 addObject:v15];
          }
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v6);
  }

  [(UGCAddPhotosController *)self _captureUserAction:2132];
  double v16 = +[NSNotificationCenter defaultCenter];
  [v16 removeObserver:self name:_UIImagePickerControllerUserDidRejectItemNotification object:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v18 = [v19 copy];
  [WeakRetained takePhotoController:self didSelectPhotosWithMetadata:v18];
}

- (void)_handleAddFromCameraWithImageData:(id)a3 mediaInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[MKLocationManager sharedLocationManager];
  unsigned int v9 = [v8 isLocationServicesPossiblyAvailable];

  if (v9)
  {
    objc_initWeak(&location, self);
    v10 = +[MKLocationManager sharedLocationManager];
    id v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472;
    double v14 = sub_10097A044;
    double v15 = &unk_1013121F0;
    objc_copyWeak(&v18, &location);
    id v16 = v6;
    double v17 = self;
    CGFloat v11 = [v10 singleLocationUpdateWithHandler:&v12];

    [v11 start:v12, v13, v14, v15];
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
}

- (void)_imagePickerDidRetake:(id)a3
{
}

- (BOOL)_isValidImageSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (a3.width * a3.height < (double)(unint64_t)[(GEOPlaceQuestionnaire *)self->_placeQuestionnaire minPixels])return 0; {
  if (width > height)
  }
    double v7 = width / height;
  else {
    double v7 = height / width;
  }
  [(GEOPlaceQuestionnaire *)self->_placeQuestionnaire maxAspectRatio];
  return v7 <= v8;
}

- (id)_resizeImageIfNeeded:(id)a3 imageSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  CFDataRef v7 = (const __CFData *)a3;
  if (width * height > (double)(unint64_t)[(GEOPlaceQuestionnaire *)self->_placeQuestionnaire maxPixels]&& [(GEOPlaceQuestionnaire *)self->_placeQuestionnaire maxPixels])
  {
    if (width > height) {
      double v8 = width / height;
    }
    else {
      double v8 = height / width;
    }
    id v9 = [(GEOPlaceQuestionnaire *)self->_placeQuestionnaire maxPixels];
    v21[0] = kCGImageSourceThumbnailMaxPixelSize;
    v10 = +[NSNumber numberWithInt:(int)sqrt(v8 * (double)(unint64_t)v9)];
    v22[0] = v10;
    v22[1] = kCFBooleanTrue;
    v21[1] = kCGImageSourceCreateThumbnailFromImageAlways;
    v21[2] = kCGImageSourceCreateThumbnailWithTransform;
    v22[2] = kCFBooleanTrue;
    CFDictionaryRef v11 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:3];

    id v12 = CGImageSourceCreateWithData(v7, 0);
    ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(v12, 0, v11);
    if (v12) {
      CFRelease(v12);
    }
    double v14 = (__CFData *)objc_alloc_init((Class)NSMutableData);
    double v15 = CGImageDestinationCreateWithData(v14, @"public.jpeg", 1uLL, 0);
    GEOConfigGetDouble();
    CFStringRef v19 = kCGImageDestinationLossyCompressionQuality;
    id v16 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    double v20 = v16;
    CFDictionaryRef v17 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];

    CGImageDestinationAddImage(v15, ThumbnailAtIndex, v17);
    CGImageDestinationFinalize(v15);
    CFRelease(v15);
    CGImageRelease(ThumbnailAtIndex);
  }
  else
  {
    double v14 = v7;
  }

  return v14;
}

- (void)dismissWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  photoOptionsPicker = self->_photoOptionsPicker;
  if (photoOptionsPicker)
  {
    [(PhotoOptionsPicker *)photoOptionsPicker dismissPhotoOptionsWithCompletion:v4];
  }
  else
  {
    imagePicker = self->_imagePicker;
    if (imagePicker)
    {
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_10097A534;
      v7[3] = &unk_1012E76E8;
      v7[4] = self;
      double v8 = v4;
      [(UIImagePickerController *)imagePicker dismissViewControllerAnimated:1 completion:v7];
    }
    else
    {
      v4[2](v4);
    }
  }
}

- (void)photoOptionsPickerDidCancel:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10097A5F4;
  v3[3] = &unk_1012E5D08;
  v3[4] = self;
  [a3 dismissPhotoOptionsWithCompletion:v3];
}

- (void)photoOptionsPickerDidSelectAddFromLibrary:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10097A678;
  v3[3] = &unk_1012E5D08;
  v3[4] = self;
  [a3 dismissPhotoOptionsWithCompletion:v3];
}

- (void)photoOptionsPickerDidSelectTakePhoto:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10097A734;
  v3[3] = &unk_1012E5D08;
  v3[4] = self;
  [a3 dismissPhotoOptionsWithCompletion:v3];
}

- (void)_captureUserAction:(int)a3
{
}

- (unint64_t)maximumCount
{
  return self->_maximumCount;
}

- (void)setMaximumCount:(unint64_t)a3
{
  self->_maximumCount = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_placeQuestionnaire, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_photoOptionsPicker, 0);

  objc_storeStrong((id *)&self->_imagePicker, 0);
}

@end