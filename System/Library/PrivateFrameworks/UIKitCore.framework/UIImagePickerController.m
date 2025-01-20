@interface UIImagePickerController
+ (BOOL)_isMediaTypeAvailable:(id)a3 forSource:(int64_t)a4;
+ (BOOL)_reviewCapturedItems;
+ (BOOL)isCameraDeviceAvailable:(UIImagePickerControllerCameraDevice)cameraDevice;
+ (BOOL)isFlashAvailableForCameraDevice:(UIImagePickerControllerCameraDevice)cameraDevice;
+ (BOOL)isSourceTypeAvailable:(UIImagePickerControllerSourceType)sourceType;
+ (NSArray)availableCaptureModesForCameraDevice:(UIImagePickerControllerCameraDevice)cameraDevice;
+ (NSArray)availableMediaTypesForSourceType:(UIImagePickerControllerSourceType)sourceType;
- (BOOL)_allowsImageEditing;
- (BOOL)_allowsIris;
- (BOOL)_allowsMultipleSelection;
- (BOOL)_convertAutoloopsToGIF;
- (BOOL)_didRevertStatusBar;
- (BOOL)_isCameraCaptureModeValid:(int64_t)a3;
- (BOOL)_isSupportedInterfaceOrientation:(int64_t)a3;
- (BOOL)_onlyShowAutoloops;
- (BOOL)_requiresPickingConfirmation;
- (BOOL)_shouldDelayPresentation;
- (BOOL)_showsFileSizePicker;
- (BOOL)_showsPrompt;
- (BOOL)_sourceTypeIsCamera;
- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (BOOL)showsCameraControls;
- (BOOL)startVideoCapture;
- (CGAffineTransform)cameraViewTransform;
- (Class)photoPickerRequestOptionsClass;
- (NSArray)mediaTypes;
- (NSExtension)photosExtension;
- (NSString)videoExportPreset;
- (NSTimeInterval)videoMaximumDuration;
- (UIImagePickerController)init;
- (UIImagePickerController)initWithCoder:(id)a3;
- (UIImagePickerControllerCameraCaptureMode)cameraCaptureMode;
- (UIImagePickerControllerCameraDevice)cameraDevice;
- (UIImagePickerControllerCameraFlashMode)cameraFlashMode;
- (UIImagePickerControllerImageURLExportPreset)imageExportPreset;
- (UIImagePickerControllerQualityType)videoQuality;
- (UIImagePickerControllerSourceType)sourceType;
- (UIView)cameraOverlayView;
- (_UIRemoteViewController)_containedRemoteViewController;
- (id)_cameraViewController;
- (id)_initWithSourceImageData:(id)a3 cropRect:(CGRect)a4;
- (id)_photoPickerDisplayCompletion;
- (id)_photoPickerPreviewDisplayCompletion;
- (id)_properties;
- (id)_propertiesForPhotoPickerExtension;
- (id)_staticPrompt;
- (id)_targetForPrompt;
- (id)_valueForProperty:(id)a3;
- (int64_t)_preferredModalPresentationStyle;
- (unint64_t)_imagePickerSavingOptions;
- (unint64_t)_multipleSelectionLimit;
- (unint64_t)supportedInterfaceOrientations;
- (void)_autoDismiss;
- (void)_createInitialControllerWithCompletion:(id)a3;
- (void)_handleEndingPhotoPickerPresentationDelay;
- (void)_handleInstantiatedRemoteViewController:(id)a3 request:(id)a4 error:(id)a5 completion:(id)a6;
- (void)_handleMatchingExtension:(id)a3 viewControllerClassName:(id)a4 completion:(id)a5;
- (void)_handlePushViewController:(id)a3;
- (void)_handleTopViewControllerReadyForDisplay:(id)a3;
- (void)_imagePickerDidCancel;
- (void)_imagePickerDidCompleteWithInfo:(id)a3;
- (void)_imagePickerDidCompleteWithInfoArray:(id)a3;
- (void)_initializeProperties;
- (void)_invalidatePhotoPickerServices;
- (void)_populateArchivedChildViewControllers:(id)a3;
- (void)_removeAllChildren;
- (void)_setAllowsImageEditing:(BOOL)a3;
- (void)_setAllowsIris:(BOOL)a3;
- (void)_setAllowsMultipleSelection:(BOOL)a3;
- (void)_setConvertAutoloopsToGIF:(BOOL)a3;
- (void)_setImagePickerSavingOptions:(unint64_t)a3;
- (void)_setMultipleSelectionLimit:(unint64_t)a3;
- (void)_setOnlyShowAutoloops:(BOOL)a3;
- (void)_setPhotoPickerDisplayCompletion:(id)a3;
- (void)_setPhotoPickerPreviewDisplayCompletion:(id)a3;
- (void)_setProperties:(id)a3;
- (void)_setRequiresPickingConfirmation:(BOOL)a3;
- (void)_setShowsFileSizePicker:(BOOL)a3;
- (void)_setShowsPrompt:(BOOL)a3;
- (void)_setStaticPrompt:(id)a3;
- (void)_setTargetForPrompt:(id)a3;
- (void)_setValue:(id)a3 forProperty:(id)a4;
- (void)_setupControllersForCurrentMediaTypes;
- (void)_setupControllersForCurrentSourceTypeWithCompletion:(id)a3;
- (void)_testPerformPreviewOfFirstPhoto;
- (void)_updateCameraCaptureMode;
- (void)_viewControllerPresentationDidInitiate;
- (void)cancelPhotoPicker;
- (void)didDisplayPhotoPickerPreview;
- (void)didDisplayPhotoPickerSourceType:(id)a3;
- (void)didSelectMediaWithInfoDictionary:(id)a3;
- (void)didSelectMultipleMediaItemsWithInfoDictionaries:(id)a3;
- (void)dismissCurrentViewControllerFromPhotoPickerAnimated:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)requestViewControllerFromPhotoPickerWithRequestIdentifier:(id)a3;
- (void)setCameraCaptureMode:(UIImagePickerControllerCameraCaptureMode)cameraCaptureMode;
- (void)setCameraDevice:(UIImagePickerControllerCameraDevice)cameraDevice;
- (void)setCameraFlashMode:(UIImagePickerControllerCameraFlashMode)cameraFlashMode;
- (void)setCameraOverlayView:(UIView *)cameraOverlayView;
- (void)setCameraViewTransform:(CGAffineTransform *)cameraViewTransform;
- (void)setImageExportPreset:(UIImagePickerControllerImageURLExportPreset)imageExportPreset;
- (void)setMediaTypes:(NSArray *)mediaTypes;
- (void)setPhotosExtension:(id)a3;
- (void)setShowsCameraControls:(BOOL)showsCameraControls;
- (void)setSourceType:(UIImagePickerControllerSourceType)sourceType;
- (void)setVideoExportPreset:(NSString *)videoExportPreset;
- (void)setVideoMaximumDuration:(NSTimeInterval)videoMaximumDuration;
- (void)setVideoQuality:(UIImagePickerControllerQualityType)videoQuality;
- (void)stopVideoCapture;
- (void)takePicture;
- (void)updateContentUnavailableConfigurationUsingState:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillUnload;
@end

@implementation UIImagePickerController

+ (BOOL)isSourceTypeAvailable:(UIImagePickerControllerSourceType)sourceType
{
  LOBYTE(v3) = 1;
  if (sourceType > UIImagePickerControllerSourceTypeCamera)
  {
    if (sourceType == UIImagePickerControllerSourceTypeSavedPhotosAlbum || sourceType == 1000) {
      return v3;
    }
LABEL_10:
    LOBYTE(v3) = 0;
    return v3;
  }
  if (sourceType == UIImagePickerControllerSourceTypePhotoLibrary) {
    return v3;
  }
  if (sourceType != UIImagePickerControllerSourceTypeCamera) {
    goto LABEL_10;
  }
  int v3 = MGGetBoolAnswer();
  if (v3) {
    LOBYTE(v3) = MGGetBoolAnswer() ^ 1;
  }
  return v3;
}

+ (BOOL)_isMediaTypeAvailable:(id)a3 forSource:(int64_t)a4
{
  id v6 = a3;
  if ([a1 isSourceTypeAvailable:a4])
  {
    v7 = [(id)*MEMORY[0x1E4F44400] identifier];
    char v8 = [v6 isEqualToString:v7];

    if (v8)
    {
      char v9 = 1;
    }
    else
    {
      v11 = [(id)*MEMORY[0x1E4F44448] identifier];
      int v12 = [v6 isEqualToString:v11];

      if (v12)
      {
        if (a4 == 1) {
          char v9 = MGGetBoolAnswer();
        }
        else {
          char v9 = (a4 & 0xFFFFFFFFFFFFFFFDLL) == 0;
        }
      }
      else
      {
        v13 = [(id)*MEMORY[0x1E4F44420] identifier];
        int v14 = [v6 isEqualToString:v13];

        if (a4 == 1) {
          char v9 = 0;
        }
        else {
          char v9 = v14;
        }
      }
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

+ (BOOL)_reviewCapturedItems
{
  return 1;
}

+ (NSArray)availableMediaTypesForSourceType:(UIImagePickerControllerSourceType)sourceType
{
  v14[2] = *MEMORY[0x1E4F143B8];
  if (objc_msgSend(a1, "isSourceTypeAvailable:"))
  {
    v5 = (void *)*MEMORY[0x1E4F44448];
    id v6 = [(id)*MEMORY[0x1E4F44448] identifier];
    int v7 = [a1 _isMediaTypeAvailable:v6 forSource:sourceType];

    uint64_t v8 = [(id)*MEMORY[0x1E4F44400] identifier];
    char v9 = (void *)v8;
    if (v7)
    {
      v14[0] = v8;
      v10 = [v5 identifier];
      v14[1] = v10;
      v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
    }
    else
    {
      uint64_t v13 = v8;
      v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
    }
  }
  else
  {
    v11 = 0;
  }
  return (NSArray *)v11;
}

+ (BOOL)isCameraDeviceAvailable:(UIImagePickerControllerCameraDevice)cameraDevice
{
  if ((unint64_t)cameraDevice > UIImagePickerControllerCameraDeviceFront) {
    return 0;
  }
  else {
    return MGGetBoolAnswer();
  }
}

+ (NSArray)availableCaptureModesForCameraDevice:(UIImagePickerControllerCameraDevice)cameraDevice
{
  if (cameraDevice == UIImagePickerControllerCameraDeviceFront)
  {
    if (MGGetBoolAnswer())
    {
      int v7 = (void *)MEMORY[0x1E4F1CA48];
      id v6 = [NSNumber numberWithInt:0];
      uint64_t v8 = [NSNumber numberWithInt:1];
      v5 = objc_msgSend(v7, "arrayWithObjects:", v6, v8, 0);

LABEL_8:
      goto LABEL_10;
    }
  }
  else if (cameraDevice == UIImagePickerControllerCameraDeviceRear && MGGetBoolAnswer())
  {
    int v3 = (void *)MEMORY[0x1E4F1CA48];
    v4 = [NSNumber numberWithInt:0];
    v5 = objc_msgSend(v3, "arrayWithObjects:", v4, 0);

    if (!MGGetBoolAnswer()) {
      goto LABEL_10;
    }
    id v6 = [NSNumber numberWithInt:1];
    [v5 addObject:v6];
    goto LABEL_8;
  }
  v5 = 0;
LABEL_10:
  return (NSArray *)v5;
}

+ (BOOL)isFlashAvailableForCameraDevice:(UIImagePickerControllerCameraDevice)cameraDevice
{
  if ((unint64_t)cameraDevice > UIImagePickerControllerCameraDeviceFront) {
    return 0;
  }
  else {
    return MGGetBoolAnswer();
  }
}

- (UIImagePickerController)init
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)UIImagePickerController;
  v2 = [(UIViewController *)&v11 init];
  if (v2)
  {
    if (UIImagePickerLoadPhotoLibraryIfNecessary())
    {
      if ((_MergedGlobals_7_1 & 1) == 0)
      {
        qword_1EB25D4E8 = (uint64_t)dlopen((const char *)[@"/System/Library/Frameworks/PhotosUI.framework/PhotosUI" fileSystemRepresentation], 2);
        if (qword_1EB25D4E8)
        {
          _MergedGlobals_7_1 = 1;
        }
        else
        {
          int v3 = (FILE *)*MEMORY[0x1E4F143C8];
          v4 = dlerror();
          fprintf(v3, "Couldn't load framework: %s\n", v4);
          _MergedGlobals_7_1 = 1;
          if (!qword_1EB25D4E8) {
            goto LABEL_12;
          }
        }
      }
      if (byte_1EB25D4E1)
      {
LABEL_11:
        v2->_sourceType = 0;
        v2->_savingOptions = 2;
        int v7 = [(id)*MEMORY[0x1E4F44400] identifier];
        v12[0] = v7;
        uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
        mediaTypes = v2->_mediaTypes;
        v2->_mediaTypes = (NSArray *)v8;

        [(UIViewController *)v2 _setIgnoreAppSupportedOrientations:1];
        -[UINavigationController setPreferredContentSize:](v2, "setPreferredContentSize:", 320.0, 480.0);
        return v2;
      }
      qword_1EB25D4F0 = (uint64_t)dlopen((const char *)[@"/System/Library/PrivateFrameworks/CameraUI.framework/CameraUI" fileSystemRepresentation], 2);
      if (qword_1EB25D4F0)
      {
        byte_1EB25D4E1 = 1;
        goto LABEL_11;
      }
      v5 = (FILE *)*MEMORY[0x1E4F143C8];
      id v6 = dlerror();
      fprintf(v5, "Couldn't load framework: %s\n", v6);
      byte_1EB25D4E1 = 1;
      if (qword_1EB25D4F0) {
        goto LABEL_11;
      }
    }
LABEL_12:

    return 0;
  }
  return v2;
}

- (UIImagePickerController)initWithCoder:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UIImagePickerController;
  v5 = [(UINavigationController *)&v11 initWithCoder:v4];
  if (v5)
  {
    if (UIImagePickerLoadPhotoLibraryIfNecessary())
    {
      v5->_sourceType = 0;
      if ([v4 containsValueForKey:@"UISourceType"]) {
        v5->_sourceType = [v4 decodeIntegerForKey:@"UISourceType"];
      }
      if ([v4 containsValueForKey:@"UIMediaTypes"])
      {
        uint64_t v6 = [v4 decodeObjectForKey:@"UIMediaTypes"];
        mediaTypes = v5->_mediaTypes;
        v5->_mediaTypes = (NSArray *)v6;
      }
      else
      {
        mediaTypes = [(id)*MEMORY[0x1E4F44400] identifier];
        v12[0] = mediaTypes;
        uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
        char v9 = v5->_mediaTypes;
        v5->_mediaTypes = (NSArray *)v8;
      }
      -[UIImagePickerController _setAllowsImageEditing:](v5, "_setAllowsImageEditing:", [v4 decodeBoolForKey:@"UIAllowsImageEditing"]);
      v5->_savingOptions = 2;
      [(UIViewController *)v5 _setIgnoreAppSupportedOrientations:1];
      -[UINavigationController setPreferredContentSize:](v5, "setPreferredContentSize:", 320.0, 480.0);
    }
    else
    {

      v5 = 0;
    }
  }

  return v5;
}

- (id)_initWithSourceImageData:(id)a3 cropRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  v17[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v16.receiver = self;
  v16.super_class = (Class)UIImagePickerController;
  objc_super v11 = [(UIViewController *)&v16 init];
  if (v11)
  {
    if (UIImagePickerLoadPhotoLibraryIfNecessary())
    {
      objc_storeStrong(&v11->_image, a3);
      v11->_cropRect.origin.CGFloat x = x;
      v11->_cropRect.origin.CGFloat y = y;
      v11->_cropRect.size.CGFloat width = width;
      v11->_cropRect.size.CGFloat height = height;
      v11->_sourceType = 1000;
      int v12 = [(id)*MEMORY[0x1E4F44400] identifier];
      v17[0] = v12;
      uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
      mediaTypes = v11->_mediaTypes;
      v11->_mediaTypes = (NSArray *)v13;

      [(UIImagePickerController *)v11 _setAllowsImageEditing:1];
      v11->_savingOptions = 2;
      [(UIViewController *)v11 _setIgnoreAppSupportedOrientations:1];
      -[UINavigationController setPreferredContentSize:](v11, "setPreferredContentSize:", 320.0, 480.0);
    }
    else
    {

      objc_super v11 = 0;
    }
  }

  return v11;
}

- (void)_populateArchivedChildViewControllers:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UIImagePickerController;
  id v3 = a3;
  [(UIViewController *)&v4 _populateArchivedChildViewControllers:v3];
  objc_msgSend(v3, "removeAllObjects", v4.receiver, v4.super_class);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UIImagePickerController;
  [(UINavigationController *)&v7 encodeWithCoder:v4];
  int64_t sourceType = self->_sourceType;
  if (sourceType) {
    [v4 encodeInteger:sourceType forKey:@"UISourceType"];
  }
  if ([(UIImagePickerController *)self _allowsImageEditing]) {
    objc_msgSend(v4, "encodeBool:forKey:", -[UIImagePickerController _allowsImageEditing](self, "_allowsImageEditing"), @"UIAllowsImageEditing");
  }
  mediaTypes = self->_mediaTypes;
  if (mediaTypes) {
    [v4 encodeObject:mediaTypes forKey:@"UIMediaTypes"];
  }
}

- (void)_updateCameraCaptureMode
{
  if ([(UIImagePickerController *)self sourceType] == UIImagePickerControllerSourceTypeCamera
    && [(NSArray *)self->_mediaTypes count] == 1)
  {
    id v5 = [(NSArray *)self->_mediaTypes objectAtIndex:0];
    id v3 = [(id)*MEMORY[0x1E4F44448] identifier];
    unsigned int v4 = [v5 isEqual:v3];

    [(UIImagePickerController *)self setCameraCaptureMode:v4];
  }
}

- (void)setSourceType:(UIImagePickerControllerSourceType)sourceType
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_sourceType != sourceType)
  {
    if (([(id)objc_opt_class() isSourceTypeAvailable:sourceType] & 1) == 0)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Source type %ld not available", sourceType);
      id v14 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:objc_claimAutoreleasedReturnValue() userInfo:0];
      objc_exception_throw(v14);
    }
    self->_int64_t sourceType = sourceType;
    id v5 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v6 = self->_mediaTypes;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          if ([(id)objc_opt_class() _isMediaTypeAvailable:v11 forSource:self->_sourceType])-[NSArray addObject:](v5, "addObject:", v11); {
        }
          }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }

    if (![(NSArray *)v5 count])
    {
      int v12 = [(id)*MEMORY[0x1E4F44400] identifier];
      [(NSArray *)v5 addObject:v12];
    }
    mediaTypes = self->_mediaTypes;
    self->_mediaTypes = v5;

    if (*(unsigned char *)&self->_imagePickerFlags) {
      [(UIImagePickerController *)self _setupControllersForCurrentSourceTypeWithCompletion:0];
    }
    [(UIImagePickerController *)self _updateCameraCaptureMode];
  }
}

- (UIImagePickerControllerSourceType)sourceType
{
  return self->_sourceType;
}

- (void)setMediaTypes:(NSArray *)mediaTypes
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  unsigned int v4 = mediaTypes;
  if (self->_mediaTypes == v4)
  {
    id v6 = 0;
  }
  else
  {
    UIImagePickerControllerSourceType v5 = [(UIImagePickerController *)self sourceType];
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v7 = v4;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = 0;
      uint64_t v11 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          if ([(id)objc_opt_class() _isMediaTypeAvailable:v13 forSource:v5])
          {
            [v6 addObject:v13];
            ++v10;
          }
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v9);
    }
    else
    {
      uint64_t v10 = 0;
    }

    id v14 = [(id)*MEMORY[0x1E4F44420] identifier];
    if ([v6 containsObject:v14])
    {
      long long v15 = [(id)*MEMORY[0x1E4F44400] identifier];
      char v16 = [v6 containsObject:v15];

      if ((v16 & 1) == 0)
      {
        long long v17 = NSString;
        long long v18 = @"The Live Photo type cannot be specified without the Image media type";
        goto LABEL_23;
      }
    }
    else
    {
    }
    if (!v10)
    {
      long long v17 = NSString;
      UIImagePickerControllerSourceType v20 = v5;
      long long v18 = @"No available types for source %ld";
LABEL_23:
      objc_msgSend(v17, "stringWithFormat:", v18, v20);
      id v19 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:objc_claimAutoreleasedReturnValue() userInfo:0];
      objc_exception_throw(v19);
    }
    objc_storeStrong((id *)&self->_mediaTypes, v6);
    [(UIImagePickerController *)self _updateCameraCaptureMode];
    if (*(unsigned char *)&self->_imagePickerFlags) {
      [(UIImagePickerController *)self _setupControllersForCurrentMediaTypes];
    }
  }
}

- (NSArray)mediaTypes
{
  v2 = (void *)[(NSArray *)self->_mediaTypes copy];
  return (NSArray *)v2;
}

- (BOOL)_allowsMultipleSelection
{
  v2 = [(UIImagePickerController *)self _valueForProperty:@"_UIImagePickerControllerAllowMutipleSelection"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)_setAllowsMultipleSelection:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(UIImagePickerController *)self _setValue:v4 forProperty:@"_UIImagePickerControllerAllowMutipleSelection"];
}

- (unint64_t)_multipleSelectionLimit
{
  v2 = [(UIImagePickerController *)self _valueForProperty:@"_UIImagePickerControllerMultipleSelectionLimit"];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (void)_setMultipleSelectionLimit:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(UIImagePickerController *)self _setValue:v4 forProperty:@"_UIImagePickerControllerMultipleSelectionLimit"];
}

- (BOOL)_requiresPickingConfirmation
{
  v2 = [(UIImagePickerController *)self _valueForProperty:@"_UIImagePickerControllerRequiresPickingConfirmation"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)_setRequiresPickingConfirmation:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(UIImagePickerController *)self _setValue:v4 forProperty:@"_UIImagePickerControllerRequiresPickingConfirmation"];
}

- (BOOL)_showsFileSizePicker
{
  v2 = [(UIImagePickerController *)self _valueForProperty:@"_UIImagePickerControllerShowsFileSizePicker"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)_setShowsFileSizePicker:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(UIImagePickerController *)self _setValue:v4 forProperty:@"_UIImagePickerControllerShowsFileSizePicker"];
}

- (BOOL)_onlyShowAutoloops
{
  v2 = [(UIImagePickerController *)self _valueForProperty:@"_UIImagePickerControllerOnlyShowAutoloopVideos"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)_setOnlyShowAutoloops:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(UIImagePickerController *)self _setValue:v4 forProperty:@"_UIImagePickerControllerOnlyShowAutoloopVideos"];
}

- (BOOL)_convertAutoloopsToGIF
{
  v2 = [(UIImagePickerController *)self _valueForProperty:@"_UIImagePickerControllerConvertAutoloopsToGIF"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)_setConvertAutoloopsToGIF:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(UIImagePickerController *)self _setValue:v4 forProperty:@"_UIImagePickerControllerConvertAutoloopsToGIF"];
}

- (BOOL)_showsPrompt
{
  v2 = [(UIImagePickerController *)self _valueForProperty:@"_UIImagePickerControllerShowsPrompt"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)_setShowsPrompt:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(UIImagePickerController *)self _setValue:v4 forProperty:@"_UIImagePickerControllerShowsPrompt"];
}

- (id)_staticPrompt
{
  return [(UIImagePickerController *)self _valueForProperty:@"_UIImagePickerControllerStaticPrompt"];
}

- (void)_setStaticPrompt:(id)a3
{
}

- (id)_targetForPrompt
{
  return [(UIImagePickerController *)self _valueForProperty:@"_UIImagePickerControllerTargetForPrompt"];
}

- (void)_setTargetForPrompt:(id)a3
{
}

- (BOOL)_allowsIris
{
  v2 = [(UIImagePickerController *)self _valueForProperty:@"_UIImagePickerControllerAllowIris"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)_setAllowsIris:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(UIImagePickerController *)self _setValue:v4 forProperty:@"_UIImagePickerControllerAllowIris"];
}

- (UIImagePickerControllerImageURLExportPreset)imageExportPreset
{
  v2 = [(UIImagePickerController *)self _valueForProperty:@"_UIImagePickerControllerImageURLExportPreset"];
  UIImagePickerControllerImageURLExportPreset v3 = (int)[v2 intValue];

  return v3;
}

- (void)setImageExportPreset:(UIImagePickerControllerImageURLExportPreset)imageExportPreset
{
  id v4 = [NSNumber numberWithInt:imageExportPreset];
  [(UIImagePickerController *)self _setValue:v4 forProperty:@"_UIImagePickerControllerImageURLExportPreset"];
}

- (NSTimeInterval)videoMaximumDuration
{
  v2 = [(UIImagePickerController *)self _valueForProperty:@"UIImagePickerControllerVideoMaximumDuration"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (void)setVideoMaximumDuration:(NSTimeInterval)videoMaximumDuration
{
  id v4 = [NSNumber numberWithDouble:videoMaximumDuration];
  [(UIImagePickerController *)self _setValue:v4 forProperty:@"UIImagePickerControllerVideoMaximumDuration"];
}

- (UIImagePickerControllerQualityType)videoQuality
{
  v2 = [(UIImagePickerController *)self _valueForProperty:@"UIImagePickerControllerVideoQuality"];
  UIImagePickerControllerQualityType v3 = (int)[v2 intValue];

  return v3;
}

- (void)setVideoQuality:(UIImagePickerControllerQualityType)videoQuality
{
  id v4 = [NSNumber numberWithInt:videoQuality];
  [(UIImagePickerController *)self _setValue:v4 forProperty:@"UIImagePickerControllerVideoQuality"];
}

- (NSString)videoExportPreset
{
  return (NSString *)[(UIImagePickerController *)self _valueForProperty:@"_UIImagePickerControllerVideoRemakerQuality"];
}

- (void)setVideoExportPreset:(NSString *)videoExportPreset
{
}

- (void)_setAllowsImageEditing:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIImagePickerController *)self _allowsImageEditing] != a3)
  {
    if (v3)
    {
      UIImagePickerControllerSourceType v5 = [NSClassFromString(&cfstr_Plprivacy.isa) performSelector:sel_sharedInstance];
      if (v5 && (objc_opt_respondsToSelector() & 1) != 0) {
        uint64_t v6 = [v5 isPhotoLibraryModificationAllowed];
      }
      else {
        uint64_t v6 = 1;
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
    id v7 = [NSNumber numberWithBool:v6];
    [(UIImagePickerController *)self _setValue:v7 forProperty:@"UIImagePickerControllerAllowsEditing"];
  }
}

- (BOOL)_allowsImageEditing
{
  v2 = [(UIImagePickerController *)self _valueForProperty:@"UIImagePickerControllerAllowsEditing"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)_setProperties:(id)a3
{
  if (self->_properties != a3)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F1CA60];
    id v5 = a3;
    uint64_t v6 = (NSMutableDictionary *)[[v4 alloc] initWithDictionary:v5];

    properties = self->_properties;
    self->_properties = v6;
  }
}

- (void)_initializeProperties
{
  if (!self->_properties)
  {
    if ([(id)objc_opt_class() isCameraDeviceAvailable:0]) {
      uint64_t v3 = 0;
    }
    else {
      uint64_t v3 = [(id)objc_opt_class() isCameraDeviceAvailable:1];
    }
    id v17 = objc_alloc(MEMORY[0x1E4F1CA60]);
    uint64_t v4 = *MEMORY[0x1E4F1CFC8];
    char v16 = [NSNumber numberWithInt:1];
    uint64_t v15 = *MEMORY[0x1E4F1CFD0];
    long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v18[0] = *MEMORY[0x1E4F1DAB8];
    v18[1] = v5;
    v18[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    uint64_t v6 = [MEMORY[0x1E4F29238] valueWithCGAffineTransform:v18];
    id v7 = [NSNumber numberWithDouble:600.0];
    uint64_t v8 = [NSNumber numberWithInt:v3];
    uint64_t v9 = [NSNumber numberWithInt:0];
    uint64_t v10 = [NSNumber numberWithInt:0];
    uint64_t v11 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend((id)objc_opt_class(), "_reviewCapturedItems"));
    int v12 = [NSNumber numberWithInteger:0];
    uint64_t v13 = (NSMutableDictionary *)objc_msgSend(v17, "initWithObjectsAndKeys:", v4, @"UIImagePickerControllerAllowsEditing", v16, @"UIImagePickerControllerVideoQuality", v15, @"_UIImagePickerControllerShowCameraControls", v6, @"_UIImagePickerControllerCameraViewTransform", v7, @"UIImagePickerControllerVideoMaximumDuration", v8, @"_UIImagePickerControllerCameraDevice", v9, @"_UIImagePickerControllerCameraCaptureMode", v10, @"_UIImagePickerControllerCameraFlashMode", v11,
                                   @"_UIImagePickerControllerReviewCapturedItem",
                                   v4,
                                   @"_UIImagePickerControllerAllowIris",
                                   v12,
                                   @"_UIImagePickerControllerImageURLExportPreset",
                                   0);
    properties = self->_properties;
    self->_properties = v13;
  }
}

- (id)_properties
{
  properties = self->_properties;
  if (!properties)
  {
    [(UIImagePickerController *)self _initializeProperties];
    properties = self->_properties;
  }
  uint64_t v4 = (void *)[(NSMutableDictionary *)properties copy];
  return v4;
}

- (void)_setValue:(id)a3 forProperty:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (!self->_properties) {
    [(UIImagePickerController *)self _initializeProperties];
  }
  BOOL v7 = [(UIImagePickerController *)self _allowsImageEditing];
  properties = self->_properties;
  if (v10) {
    [(NSMutableDictionary *)properties setObject:v10 forKey:v6];
  }
  else {
    [(NSMutableDictionary *)properties removeObjectForKey:v6];
  }
  if (v7 != [(UIImagePickerController *)self _allowsImageEditing])
  {
    uint64_t v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 postNotificationName:@"_UIImagePickerControllerEditabilityChanged" object:self userInfo:0];
  }
}

- (id)_valueForProperty:(id)a3
{
  id v4 = a3;
  properties = self->_properties;
  if (!properties)
  {
    [(UIImagePickerController *)self _initializeProperties];
    properties = self->_properties;
  }
  id v6 = [(NSMutableDictionary *)properties objectForKey:v4];

  return v6;
}

- (void)_setImagePickerSavingOptions:(unint64_t)a3
{
  self->_savingOptions = a3;
}

- (unint64_t)_imagePickerSavingOptions
{
  return self->_savingOptions;
}

- (BOOL)_sourceTypeIsCamera
{
  UIImagePickerControllerSourceType v2 = [(UIImagePickerController *)self sourceType];
  if (v2 != UIImagePickerControllerSourceTypeCamera)
  {
    id v3 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Source type must be UIImagePickerControllerSourceTypeCamera" userInfo:0];
    objc_exception_throw(v3);
  }
  return v2;
}

- (id)_cameraViewController
{
  if ([(UIImagePickerController *)self _sourceTypeIsCamera])
  {
    id v3 = [(UINavigationController *)self viewControllers];
    if ([v3 count])
    {
      id v4 = [v3 objectAtIndex:0];
    }
    else
    {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (BOOL)showsCameraControls
{
  if (![(UIImagePickerController *)self _sourceTypeIsCamera]) {
    return 1;
  }
  if (*(unsigned char *)&self->_imagePickerFlags)
  {
    id v3 = [(UIImagePickerController *)self _cameraViewController];
    char v4 = [v3 _showsCameraControls];
  }
  else
  {
    id v3 = [(UIImagePickerController *)self _valueForProperty:@"_UIImagePickerControllerShowCameraControls"];
    char v4 = [v3 BOOLValue];
  }
  BOOL v5 = v4;

  return v5;
}

- (void)setShowsCameraControls:(BOOL)showsCameraControls
{
  BOOL v3 = showsCameraControls;
  if ([(UIImagePickerController *)self _sourceTypeIsCamera])
  {
    if (*(unsigned char *)&self->_imagePickerFlags)
    {
      id v5 = [(UIImagePickerController *)self _cameraViewController];
      [v5 _setShowsCameraControls:v3];
    }
    else
    {
      id v5 = [NSNumber numberWithBool:v3];
      -[UIImagePickerController _setValue:forProperty:](self, "_setValue:forProperty:");
    }
  }
}

- (UIView)cameraOverlayView
{
  if ([(UIImagePickerController *)self _sourceTypeIsCamera])
  {
    BOOL v3 = [(UIImagePickerController *)self _cameraViewController];
    char v4 = v3;
    if (v3)
    {
      id v5 = [v3 _cameraOverlayView];
    }
    else
    {
      id v5 = [(UIImagePickerController *)self _valueForProperty:@"_UIImagePickerControllerCameraOverlayView"];
      if (!v5)
      {
        id v6 = +[UIWindow _applicationKeyWindow];
        [v6 bounds];
        double v8 = v7;
        double v10 = v9;
        double v12 = v11;
        double v14 = v13;

        id v5 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v8, v10, v12, v14);
        [(UIImagePickerController *)self _setValue:v5 forProperty:@"_UIImagePickerControllerCameraOverlayView"];
      }
    }
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (void)setCameraOverlayView:(UIView *)cameraOverlayView
{
  id v6 = cameraOverlayView;
  if ([(UIImagePickerController *)self _sourceTypeIsCamera])
  {
    char v4 = [(UIImagePickerController *)self _cameraViewController];
    id v5 = v4;
    if (v4) {
      [v4 _setCameraOverlayView:v6];
    }
    else {
      [(UIImagePickerController *)self _setValue:v6 forProperty:@"_UIImagePickerControllerCameraOverlayView"];
    }
  }
}

- (CGAffineTransform)cameraViewTransform
{
  uint64_t v5 = MEMORY[0x1E4F1DAB8];
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->c = v6;
  *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)(v5 + 32);
  result = (CGAffineTransform *)[(UIImagePickerController *)self _sourceTypeIsCamera];
  if (result)
  {
    if (*(unsigned char *)&self->_imagePickerFlags)
    {
      double v10 = [(UIImagePickerController *)self _cameraViewController];
      double v9 = v10;
      if (v10)
      {
        [v10 _cameraViewTransform];
        goto LABEL_8;
      }
    }
    else
    {
      double v8 = [(UIImagePickerController *)self _valueForProperty:@"_UIImagePickerControllerCameraViewTransform"];
      double v9 = v8;
      if (v8)
      {
        [v8 CGAffineTransformValue];
LABEL_8:
        *(_OWORD *)&retstr->a = v11;
        *(_OWORD *)&retstr->c = v12;
        *(_OWORD *)&retstr->tCGFloat x = v13;

        return result;
      }
    }
    long long v12 = 0u;
    long long v13 = 0u;
    long long v11 = 0u;
    goto LABEL_8;
  }
  return result;
}

- (void)setCameraViewTransform:(CGAffineTransform *)cameraViewTransform
{
  if ([(UIImagePickerController *)self _sourceTypeIsCamera])
  {
    if (*(unsigned char *)&self->_imagePickerFlags)
    {
      long long v6 = [(UIImagePickerController *)self _cameraViewController];
      long long v7 = *(_OWORD *)&cameraViewTransform->c;
      long long v8 = *(_OWORD *)&cameraViewTransform->a;
      long long v9 = v7;
      long long v10 = *(_OWORD *)&cameraViewTransform->tx;
      [v6 _setCameraViewTransform:&v8];
    }
    else
    {
      long long v5 = *(_OWORD *)&cameraViewTransform->c;
      long long v8 = *(_OWORD *)&cameraViewTransform->a;
      long long v9 = v5;
      long long v10 = *(_OWORD *)&cameraViewTransform->tx;
      long long v6 = [MEMORY[0x1E4F29238] valueWithCGAffineTransform:&v8];
      [(UIImagePickerController *)self _setValue:v6 forProperty:@"_UIImagePickerControllerCameraViewTransform"];
    }
  }
}

- (void)takePicture
{
  if ([(UIImagePickerController *)self _sourceTypeIsCamera])
  {
    id v3 = [(UIImagePickerController *)self _cameraViewController];
    [v3 _takePicture];
  }
}

- (BOOL)startVideoCapture
{
  BOOL v3 = [(UIImagePickerController *)self _sourceTypeIsCamera];
  if (v3)
  {
    char v4 = [(UIImagePickerController *)self _cameraViewController];
    char v5 = [v4 _startVideoCapture];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (void)stopVideoCapture
{
  if ([(UIImagePickerController *)self _sourceTypeIsCamera])
  {
    id v3 = [(UIImagePickerController *)self _cameraViewController];
    [v3 _stopVideoCapture];
  }
}

- (UIImagePickerControllerCameraDevice)cameraDevice
{
  if (![(UIImagePickerController *)self _sourceTypeIsCamera]) {
    return 0;
  }
  if (*(unsigned char *)&self->_imagePickerFlags)
  {
    id v3 = [(UIImagePickerController *)self _cameraViewController];
    UIImagePickerControllerCameraDevice v4 = [v3 _cameraDevice];
  }
  else
  {
    id v3 = [(UIImagePickerController *)self _valueForProperty:@"_UIImagePickerControllerCameraDevice"];
    UIImagePickerControllerCameraDevice v4 = (int)[v3 intValue];
  }

  return v4;
}

- (void)setCameraDevice:(UIImagePickerControllerCameraDevice)cameraDevice
{
  if ([(UIImagePickerController *)self _sourceTypeIsCamera]
    && [(id)objc_opt_class() isCameraDeviceAvailable:cameraDevice])
  {
    if (*(unsigned char *)&self->_imagePickerFlags)
    {
      id v5 = [(UIImagePickerController *)self _cameraViewController];
      [v5 _setCameraDevice:cameraDevice];
    }
    else
    {
      id v5 = [NSNumber numberWithInt:cameraDevice];
      -[UIImagePickerController _setValue:forProperty:](self, "_setValue:forProperty:");
    }
  }
}

- (UIImagePickerControllerCameraCaptureMode)cameraCaptureMode
{
  if (![(UIImagePickerController *)self _sourceTypeIsCamera]) {
    return 0;
  }
  if (*(unsigned char *)&self->_imagePickerFlags)
  {
    id v3 = [(UIImagePickerController *)self _cameraViewController];
    UIImagePickerControllerCameraCaptureMode v4 = [v3 _cameraCaptureMode];
  }
  else
  {
    id v3 = [(UIImagePickerController *)self _valueForProperty:@"_UIImagePickerControllerCameraCaptureMode"];
    UIImagePickerControllerCameraCaptureMode v4 = (int)[v3 intValue];
  }

  return v4;
}

- (BOOL)_isCameraCaptureModeValid:(int64_t)a3
{
  mediaTypes = self->_mediaTypes;
  UIImagePickerControllerCameraCaptureMode v4 = MediaTypeForCameraCaptureMode(a3);
  LOBYTE(mediaTypes) = [(NSArray *)mediaTypes containsObject:v4];

  return (char)mediaTypes;
}

- (void)setCameraCaptureMode:(UIImagePickerControllerCameraCaptureMode)cameraCaptureMode
{
  if ([(UIImagePickerController *)self _sourceTypeIsCamera])
  {
    if (![(UIImagePickerController *)self _isCameraCaptureModeValid:cameraCaptureMode])
    {
      MediaTypeForCameraCaptureMode(cameraCaptureMode);
      [NSString stringWithFormat:@"cameraCaptureMode %ld not available because mediaTypes does contain %@", cameraCaptureMode, objc_claimAutoreleasedReturnValue()];
      id v5 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:objc_claimAutoreleasedReturnValue() userInfo:0];
      objc_exception_throw(v5);
    }
    if (*(unsigned char *)&self->_imagePickerFlags)
    {
      id v6 = [(UIImagePickerController *)self _cameraViewController];
      [v6 _setCameraCaptureMode:cameraCaptureMode];
    }
    else
    {
      id v6 = [NSNumber numberWithInt:cameraCaptureMode];
      -[UIImagePickerController _setValue:forProperty:](self, "_setValue:forProperty:");
    }
  }
}

- (UIImagePickerControllerCameraFlashMode)cameraFlashMode
{
  if (![(UIImagePickerController *)self _sourceTypeIsCamera]) {
    return 0;
  }
  if (*(unsigned char *)&self->_imagePickerFlags)
  {
    id v3 = [(UIImagePickerController *)self _cameraViewController];
    UIImagePickerControllerCameraFlashMode v4 = [v3 _cameraFlashMode];
  }
  else
  {
    id v3 = [(UIImagePickerController *)self _valueForProperty:@"_UIImagePickerControllerCameraFlashMode"];
    UIImagePickerControllerCameraFlashMode v4 = (int)[v3 intValue];
  }

  return v4;
}

- (void)setCameraFlashMode:(UIImagePickerControllerCameraFlashMode)cameraFlashMode
{
  if ([(UIImagePickerController *)self _sourceTypeIsCamera])
  {
    if (*(unsigned char *)&self->_imagePickerFlags)
    {
      id v5 = [(UIImagePickerController *)self _cameraViewController];
      [v5 _setCameraFlashMode:cameraFlashMode];
    }
    else
    {
      id v5 = [NSNumber numberWithInt:cameraFlashMode];
      -[UIImagePickerController _setValue:forProperty:](self, "_setValue:forProperty:");
    }
  }
}

- (void)_viewControllerPresentationDidInitiate
{
  if ([(UIImagePickerController *)self _shouldDelayPresentation]
    && !self->_photoPickerDidStartDelayingPresentation)
  {
    self->_photoPickerDidStartDelayingPresentation = 1;
    self->_photoPickerDidEndDelayingPresentation = 0;
    [(UIViewController *)self _beginDelayingPresentation:&__block_literal_global_132 cancellationHandler:3.0];
    if (!self->_photoPickerIsPreheating)
    {
      self->_photoPickerIsPreheating = 1;
      v3[0] = MEMORY[0x1E4F143A8];
      v3[1] = 3221225472;
      v3[2] = __65__UIImagePickerController__viewControllerPresentationDidInitiate__block_invoke_2;
      v3[3] = &unk_1E52D9F70;
      v3[4] = self;
      [(UIImagePickerController *)self _setupControllersForCurrentSourceTypeWithCompletion:v3];
    }
  }
}

uint64_t __65__UIImagePickerController__viewControllerPresentationDidInitiate__block_invoke()
{
  return 1;
}

uint64_t __65__UIImagePickerController__viewControllerPresentationDidInitiate__block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 1514) = 0;
  return result;
}

- (void)viewWillUnload
{
  uint64_t v3 = [(UIViewController *)self parentViewController];
  if (v3)
  {
    UIImagePickerControllerCameraFlashMode v4 = (void *)v3;
    id v5 = [(UIViewController *)self presentingViewController];

    if (!v5)
    {
      *(unsigned char *)&self->_imagePickerFlags &= ~1u;
      [(UIImagePickerController *)self _removeAllChildren];
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)UIImagePickerController;
  [(UIViewController *)&v6 viewWillUnload];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if ((*(unsigned char *)&self->_imagePickerFlags & 3) == 0)
  {
    *(unsigned char *)&self->_imagePickerFlags = *(unsigned char *)&self->_imagePickerFlags & 0xFA | 1;
    if (!self->_photoPickerIsPreheating)
    {
      id v5 = [(UINavigationController *)self viewControllers];
      uint64_t v6 = [v5 count];

      if (!v6)
      {
        if (self->_photoPickerPreheatedViewController)
        {
          -[UIImagePickerController _handleTopViewControllerReadyForDisplay:](self, "_handleTopViewControllerReadyForDisplay:");
          photoPickerPreheatedViewController = self->_photoPickerPreheatedViewController;
          self->_photoPickerPreheatedViewController = 0;
        }
        else
        {
          -[UIImagePickerController _setupControllersForCurrentSourceTypeWithCompletion:](self, "_setupControllersForCurrentSourceTypeWithCompletion:");
        }
      }
    }
    if (([(id)UIApp _viewControllerBasedStatusBarAppearance] & 1) == 0)
    {
      long long v8 = [(UINavigationController *)self _window];
      long long v9 = __UIStatusBarManagerForWindow(v8);
      int v10 = [v9 statusBarStyle];

      long long v11 = __UIStatusBarManagerForWindow(0);
      LODWORD(v9) = [v11 isStatusBarHidden];

      if (v9) {
        int v12 = -1;
      }
      else {
        int v12 = v10;
      }
      self->_previousStatusBarStyle = v12;
      long long v13 = [(UINavigationController *)self _window];
      double v14 = __UIStatusBarManagerForWindow(v13);
      char v15 = [v14 isStatusBarHidden];

      self->_previousStatusBarHidden = v15;
    }
  }
  v16.receiver = self;
  v16.super_class = (Class)UIImagePickerController;
  [(UINavigationController *)&v16 viewWillAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(id)UIApp _viewControllerBasedStatusBarAppearance]) {
    goto LABEL_9;
  }
  id v5 = [(UINavigationController *)self viewControllers];
  uint64_t v6 = +[UIDevice currentDevice];
  uint64_t v7 = [v6 userInterfaceIdiom];

  if ((v7 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    long long v8 = [(UIViewController *)self presentedViewController];
    if (v8)
    {
LABEL_4:

      goto LABEL_5;
    }
    if ((unint64_t)[v5 count] >= 2)
    {
      *(unsigned char *)&self->_imagePickerFlags |= 4u;
      long long v13 = [(UINavigationController *)self _window];
      double v14 = __UIStatusBarManagerForWindow(v13);
      uint64_t v15 = [v14 statusBarStyle];

      long long v8 = [v5 lastObject];
      uint64_t v16 = [v8 _imagePickerStatusBarStyle];
      uint64_t previousStatusBarStyle = self->_previousStatusBarStyle;
      if (previousStatusBarStyle != -1 && v15 == v16 && v15 != previousStatusBarStyle)
      {
        if (v3)
        {
          +[UITransitionView defaultDurationForTransition:2];
          uint64_t previousStatusBarStyle = self->_previousStatusBarStyle;
        }
        else
        {
          double v18 = 0.0;
        }
        [(id)UIApp setStatusBarStyle:previousStatusBarStyle duration:v18];
      }
      goto LABEL_4;
    }
  }
LABEL_5:
  long long v9 = +[UIDevice currentDevice];
  uint64_t v10 = [v9 userInterfaceIdiom];

  if ((v10 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    long long v11 = [(UIViewController *)self presentedViewController];

    if (!v11)
    {
      int v12 = [[UIStatusBarHideAnimationParameters alloc] initWithDefaultParameters];
      [(UIStatusBarHideAnimationParameters *)v12 setHideAnimation:0];
      [(id)UIApp setStatusBarHidden:self->_previousStatusBarHidden animationParameters:v12];
    }
  }

LABEL_9:
  v19.receiver = self;
  v19.super_class = (Class)UIImagePickerController;
  [(UINavigationController *)&v19 viewWillDisappear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(UIViewController *)self parentViewController];
  if (v5)
  {
  }
  else
  {
    uint64_t v6 = [(UIViewController *)self presentingViewController];

    if (!v6)
    {
      *(unsigned char *)&self->_imagePickerFlags &= ~1u;
      [(UIImagePickerController *)self _invalidatePhotoPickerServices];
      [(UIImagePickerController *)self _setPhotoPickerDisplayCompletion:0];
      [(UIImagePickerController *)self _setPhotoPickerPreviewDisplayCompletion:0];
      [(UIImagePickerController *)self setPhotosExtension:0];
      self->_photoPickerIsPreheating = 0;
      photoPickerPreheatedViewController = self->_photoPickerPreheatedViewController;
      self->_photoPickerPreheatedViewController = 0;

      self->_photoPickerDidStartDelayingPresentation = 0;
      self->_photoPickerDidEndDelayingPresentation = 0;
      [(UIImagePickerController *)self _removeAllChildren];
    }
  }
  *(unsigned char *)&self->_imagePickerFlags &= ~4u;
  v8.receiver = self;
  v8.super_class = (Class)UIImagePickerController;
  [(UINavigationController *)&v8 viewDidDisappear:v3];
}

- (BOOL)_didRevertStatusBar
{
  return (*(unsigned char *)&self->_imagePickerFlags >> 2) & 1;
}

- (BOOL)_isSupportedInterfaceOrientation:(int64_t)a3
{
  if ([(UIImagePickerController *)self sourceType] != UIImagePickerControllerSourceTypeCamera) {
    return 1;
  }
  UIImagePickerControllerCameraFlashMode v4 = +[UIDevice currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  return a3 == 1 || (v5 & 0xFFFFFFFFFFFFFFFBLL) == 1;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  if ([(UIImagePickerController *)self sourceType] != UIImagePickerControllerSourceTypeCamera) {
    return 1;
  }
  UIImagePickerControllerCameraFlashMode v4 = +[UIDevice currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  return a3 == 1 || (v5 & 0xFFFFFFFFFFFFFFFBLL) == 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  if ([(UIImagePickerController *)self sourceType] == UIImagePickerControllerSourceTypeCamera
    && (+[UIDevice currentDevice],
        UIImagePickerControllerSourceType v2 = objc_claimAutoreleasedReturnValue(),
        uint64_t v3 = [v2 userInterfaceIdiom],
        v2,
        (v3 & 0xFFFFFFFFFFFFFFFBLL) != 1))
  {
    return 2;
  }
  else
  {
    return 30;
  }
}

- (void)updateContentUnavailableConfigurationUsingState:(id)a3
{
}

- (void)_removeAllChildren
{
  uint64_t v3 = [(UINavigationController *)self topViewController];

  if (v3)
  {
    UIImagePickerControllerCameraFlashMode v4 = [(UIViewController *)self presentedViewController];

    if (v4)
    {
      *(unsigned char *)&self->_imagePickerFlags |= 2u;
      [(UIViewController *)self dismissViewControllerAnimated:0 completion:0];
      *(unsigned char *)&self->_imagePickerFlags &= ~2u;
    }
    id v6 = [(UINavigationController *)self topViewController];
    [(UINavigationController *)self setViewControllers:MEMORY[0x1E4F1CBF0]];
    if (objc_opt_respondsToSelector()) {
      [v6 performSelector:sel__removedAsTopViewController];
    }
    uint64_t v5 = [(UIViewController *)self view];
    [v5 layoutSubviews];
  }
}

- (BOOL)_shouldDelayPresentation
{
  return (self->_sourceType & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (void)_createInitialControllerWithCompletion:(id)a3
{
  v28[1] = *MEMORY[0x1E4F143B8];
  UIImagePickerControllerCameraFlashMode v4 = (void (**)(id, _UIImagePickerPlaceholderViewController *, void))a3;
  int64_t sourceType = self->_sourceType;
  if (sourceType > 1)
  {
    if (sourceType == 1000)
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      id v17 = objc_alloc(NSClassFromString(&cfstr_Pluiimageviewc.isa));
      id image = self->_image;
      double x = self->_cropRect.origin.x;
      double y = self->_cropRect.origin.y;
      double width = self->_cropRect.size.width;
      double height = self->_cropRect.size.height;
      if (isKindOfClass) {
        long long v23 = (_UIImagePickerPlaceholderViewController *)objc_msgSend(v17, "initWithImageData:cropRect:", image, x, y, width, height);
      }
      else {
        long long v23 = (_UIImagePickerPlaceholderViewController *)objc_msgSend(v17, "initWithUIImage:cropRect:", image, x, y, width, height);
      }
      uint64_t v7 = v23;
      [(UIViewController *)v23 _setImagePickerMediaTypes:self->_mediaTypes];
      v4[2](v4, v7, 0);
      goto LABEL_17;
    }
    if (sourceType != 2) {
      goto LABEL_18;
    }
    objc_super v8 = @"PUUIMomentsGridViewController";
LABEL_9:
    uint64_t v7 = objc_alloc_init(_UIImagePickerPlaceholderViewController);
    long long v9 = [(UIImagePickerController *)self _valueForProperty:@"_UIImagePickerControllerHidesPlaceholderNavigationBar"];
    -[_UIImagePickerPlaceholderViewController setHidesPlaceholderNavigationBar:](v7, "setHidesPlaceholderNavigationBar:", [v9 BOOLValue]);

    uint64_t v10 = +[UIColor systemBackgroundColor];
    long long v11 = [(UIViewController *)v7 view];
    [v11 setBackgroundColor:v10];

    v4[2](v4, v7, 1);
    uint64_t v27 = *MEMORY[0x1E4F28290];
    v28[0] = @"com.apple.mobileslideshow.photo-picker";
    int v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
    id v26 = 0;
    long long v13 = [MEMORY[0x1E4F28C70] extensionsWithMatchingAttributes:v12 error:&v26];
    id v14 = v26;
    if ([v13 count])
    {
      uint64_t v15 = [v13 firstObject];
      [(UIImagePickerController *)self setPhotosExtension:v15];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __66__UIImagePickerController__createInitialControllerWithCompletion___block_invoke;
      v24[3] = &unk_1E52E8658;
      v25 = v4;
      [(UIImagePickerController *)self _handleMatchingExtension:v15 viewControllerClassName:v8 completion:v24];
    }
    else
    {
      NSLog(&cfstr_Uiimagepickerc_62.isa, v14);
    }

    goto LABEL_17;
  }
  if (!sourceType)
  {
    objc_super v8 = @"PUUIAlbumListViewController";
    goto LABEL_9;
  }
  if (sourceType == 1)
  {
    id v6 = [(UIImagePickerController *)self _properties];
    uint64_t v7 = (_UIImagePickerPlaceholderViewController *)[objc_alloc(NSClassFromString(&cfstr_Camimagepicker.isa)) initWithInitialImagePickerProperties:v6];
    [(UIViewController *)v7 _setImagePickerMediaTypes:self->_mediaTypes];
    v4[2](v4, v7, 0);

LABEL_17:
  }
LABEL_18:
}

uint64_t __66__UIImagePickerController__createInitialControllerWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_handleMatchingExtension:(id)a3 viewControllerClassName:(id)a4 completion:(id)a5
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = [(UIImagePickerController *)self _propertiesForPhotoPickerExtension];
  int v12 = objc_msgSend(objc_alloc(-[UIImagePickerController photoPickerRequestOptionsClass](self, "photoPickerRequestOptionsClass")), "initWithRequestedClassName:photoPickerProperties:", v9, v11);
  id v13 = objc_alloc(MEMORY[0x1E4F28D78]);
  id v14 = [(id)*MEMORY[0x1E4F44408] identifier];
  uint64_t v15 = (void *)[v13 initWithItem:v12 typeIdentifier:v14];

  id v16 = objc_alloc_init(MEMORY[0x1E4F28C80]);
  v25[0] = v15;
  id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  [v16 setAttachments:v17];

  objc_initWeak(&location, self);
  id v24 = v16;
  double v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __87__UIImagePickerController__handleMatchingExtension_viewControllerClassName_completion___block_invoke;
  v20[3] = &unk_1E52E8680;
  objc_copyWeak(&v22, &location);
  id v19 = v10;
  id v21 = v19;
  [v8 instantiateViewControllerWithInputItems:v18 connectionHandler:v20];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __87__UIImagePickerController__handleMatchingExtension_viewControllerClassName_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v7 = (id *)(a1 + 40);
  id v8 = a4;
  id v9 = a3;
  id v10 = a2;
  id WeakRetained = objc_loadWeakRetained(v7);
  [WeakRetained _handleInstantiatedRemoteViewController:v9 request:v10 error:v8 completion:*(void *)(a1 + 32)];
}

- (void)_handleInstantiatedRemoteViewController:(id)a3 request:(id)a4 error:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v10)
  {
    id v14 = v11;
    uint64_t v15 = [(UIImagePickerController *)self photosExtension];
    id v16 = [v15 _extensionContextForUUID:v14];

    [v16 performSelector:sel_setDelegate_ withObject:self];
    [v16 performSelector:sel_setRequestIdentifier_ withObject:v14];
    [v10 performSelector:sel_setHostExtensionContext_ withObject:v16];
    if (objc_opt_respondsToSelector()) {
      [v10 _setImagePickerMediaTypes:self->_mediaTypes];
    }
    if (objc_opt_respondsToSelector()) {
      [v10 performSelector:sel_setDelegate_ withObject:self];
    }
    id v17 = [(UIViewController *)self view];
    [v17 frame];
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;

    id v26 = [v10 view];
    objc_msgSend(v26, "setFrame:", v19, v21, v23, v25);
    if (dyld_program_sdk_at_least())
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __92__UIImagePickerController__handleInstantiatedRemoteViewController_request_error_completion___block_invoke_3;
      block[3] = &unk_1E52E3968;
      id v36 = v13;
      id v34 = v10;
      v35 = self;
      dispatch_async(MEMORY[0x1E4F14428], block);

      uint64_t v27 = v36;
    }
    else
    {
      id v31 = v14;
      id v32 = v11;
      uint64_t v27 = [(UIViewController *)self traitCollection];
      [v10 setOverrideTraitCollection:v27];
      [(UIViewController *)self _contentOverlayInsets];
      objc_msgSend(v10, "_setContentOverlayInsets:");
      objc_initWeak(location, self);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __92__UIImagePickerController__handleInstantiatedRemoteViewController_request_error_completion___block_invoke;
      aBlock[3] = &unk_1E52E86A8;
      id v38 = v12;
      id v40 = v13;
      id v28 = v10;
      id v39 = v28;
      objc_copyWeak(&v41, location);
      v29 = _Block_copy(aBlock);
      v30 = _Block_copy(v29);
      [v28 performSelector:sel_performTraitCollectionUpdateWithCompletion_ withObject:v30];

      objc_destroyWeak(&v41);
      objc_destroyWeak(location);
      id v11 = v32;
      id v14 = v31;
    }
  }
  if (v12) {
    NSLog(&cfstr_Uiimagepickerc_64.isa, v12);
  }
}

void __92__UIImagePickerController__handleInstantiatedRemoteViewController_request_error_completion___block_invoke(uint64_t a1, void *a2)
{
  if (([a2 BOOLValue] & 1) == 0) {
    NSLog(&cfstr_Uiimagepickerc_63.isa, *(void *)(a1 + 32));
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__UIImagePickerController__handleInstantiatedRemoteViewController_request_error_completion___block_invoke_2;
  block[3] = &unk_1E52DDC68;
  id v5 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  objc_copyWeak(&v6, (id *)(a1 + 56));
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v6);
}

void __92__UIImagePickerController__handleInstantiatedRemoteViewController_request_error_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _handleEndingPhotoPickerPresentationDelay];
}

uint64_t __92__UIImagePickerController__handleInstantiatedRemoteViewController_request_error_completion___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  UIImagePickerControllerSourceType v2 = *(void **)(a1 + 40);
  return [v2 _handleEndingPhotoPickerPresentationDelay];
}

- (id)_propertiesForPhotoPickerExtension
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = [(UIImagePickerController *)self _properties];
  id v5 = [v3 dictionaryWithDictionary:v4];

  id v6 = [(UIImagePickerController *)self mediaTypes];
  [v5 setObject:v6 forKey:@"_UIImagePickerControllerMediaTypes"];

  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[UIImagePickerController _allowsMultipleSelection](self, "_allowsMultipleSelection"));
  [v5 setObject:v7 forKey:@"_UIImagePickerControllerAllowMutipleSelection"];

  [v5 removeObjectForKey:@"_UIImagePickerControllerCameraViewTransform"];
  unint64_t v8 = [(UIImagePickerController *)self _imagePickerSavingOptions];
  id v9 = [NSNumber numberWithUnsignedInteger:v8];
  [v5 setObject:v9 forKey:@"_UIImagePickerSavingOptions"];

  UIImagePickerControllerSourceType v10 = [(UIImagePickerController *)self sourceType];
  id v11 = [NSNumber numberWithInteger:v10];
  [v5 setObject:v11 forKey:@"_UIImagePickerControllerSourceType"];

  id v12 = NSTemporaryDirectory();
  [v5 setObject:v12 forKey:@"_UIImagePickerControllerTemporaryDirectoryUrl"];

  id v13 = [(UIViewController *)self modalPresentationStyle];
  uint64_t v27 = 0;
  id v28 = (double *)&v27;
  uint64_t v29 = 0x3010000000;
  v30 = &unk_186D7DBA7;
  long long v31 = *MEMORY[0x1E4F1DB30];
  objc_initWeak(&location, self);
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  double v22 = __61__UIImagePickerController__propertiesForPhotoPickerExtension__block_invoke;
  double v23 = &unk_1E52E86D0;
  v25[1] = v13;
  double v24 = &v27;
  objc_copyWeak(v25, &location);
  id v14 = (void (**)(void))_Block_copy(&v20);
  if (pthread_main_np() == 1) {
    v14[2](v14);
  }
  else {
    dispatch_sync(MEMORY[0x1E4F14428], v14);
  }
  uint64_t v15 = objc_msgSend(NSNumber, "numberWithDouble:", v28[4], v20, v21, v22, v23, v24);
  [v5 setObject:v15 forKey:@"_UIImagePickerControllerViewWidth"];

  id v16 = [NSNumber numberWithDouble:v28[5]];
  [v5 setObject:v16 forKey:@"_UIImagePickerControllerViewHeight"];

  id v17 = [NSNumber numberWithInteger:v13];
  [v5 setObject:v17 forKey:@"_UIImagePickerControllerModalPresentationStyle"];

  [v5 removeObjectForKey:@"_UIImagePickerControllerCameraOverlayView"];
  double v18 = (void *)[v5 copy];

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v27, 8);

  return v18;
}

void __61__UIImagePickerController__propertiesForPhotoPickerExtension__block_invoke(uint64_t a1)
{
  UIImagePickerControllerSourceType v2 = +[UIDevice currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1 && *(void *)(a1 + 48) == 7)
  {
    uint64_t v4 = 0x407E000000000000;
    uint64_t v5 = 0x4074000000000000;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v7 = [WeakRetained view];
    [v7 frame];
    uint64_t v5 = v8;
    uint64_t v4 = v9;
  }
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  *(void *)(v10 + 32) = v5;
  *(void *)(v10 + 40) = v4;
}

- (Class)photoPickerRequestOptionsClass
{
  photoPickerRequestOptionsClass = self->_photoPickerRequestOptionsClass;
  if (!photoPickerRequestOptionsClass)
  {
    photoPickerRequestOptionsClass = NSClassFromString(&cfstr_Puphotopickerr.isa);
    self->_photoPickerRequestOptionsClass = photoPickerRequestOptionsClass;
  }
  return photoPickerRequestOptionsClass;
}

- (id)_photoPickerDisplayCompletion
{
  UIImagePickerControllerSourceType v2 = _Block_copy(self->_photoPickerDisplayCompletion);
  return v2;
}

- (void)_setPhotoPickerDisplayCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  id photoPickerDisplayCompletion = self->_photoPickerDisplayCompletion;
  self->_id photoPickerDisplayCompletion = v4;
}

- (id)_photoPickerPreviewDisplayCompletion
{
  UIImagePickerControllerSourceType v2 = _Block_copy(self->_photoPickerPreviewDisplayCompletion);
  return v2;
}

- (void)_setPhotoPickerPreviewDisplayCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  id photoPickerPreviewDisplayCompletion = self->_photoPickerPreviewDisplayCompletion;
  self->_id photoPickerPreviewDisplayCompletion = v4;
}

- (void)_invalidatePhotoPickerServices
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  UIImagePickerControllerSourceType v2 = [(UINavigationController *)self viewControllers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v7 performSelector:sel_invalidate];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)_testPerformPreviewOfFirstPhoto
{
  id v2 = [(UINavigationController *)self topViewController];
  if (objc_opt_respondsToSelector()) {
    [v2 performSelector:sel_performPhotoPickerPreviewOfFirstAsset];
  }
}

- (void)cancelPhotoPicker
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __44__UIImagePickerController_cancelPhotoPicker__block_invoke;
  v2[3] = &unk_1E52DC308;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E4F14428], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __44__UIImagePickerController_cancelPhotoPicker__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _imagePickerDidCancel];
}

- (void)dismissCurrentViewControllerFromPhotoPickerAnimated:(id)a3
{
  id v4 = a3;
  char v5 = [v4 BOOLValue];
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__UIImagePickerController_dismissCurrentViewControllerFromPhotoPickerAnimated___block_invoke;
  aBlock[3] = &unk_1E52E7E68;
  objc_copyWeak(&v10, &location);
  char v11 = v5;
  id v6 = (void (**)(void))_Block_copy(aBlock);
  if (pthread_main_np() == 1)
  {
    v6[2](v6);
  }
  else
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __79__UIImagePickerController_dismissCurrentViewControllerFromPhotoPickerAnimated___block_invoke_2;
    v7[3] = &unk_1E52DA040;
    long long v8 = v6;
    dispatch_async(MEMORY[0x1E4F14428], v7);
  }
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __79__UIImagePickerController_dismissCurrentViewControllerFromPhotoPickerAnimated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = (id)[WeakRetained popViewControllerAnimated:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t __79__UIImagePickerController_dismissCurrentViewControllerFromPhotoPickerAnimated___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestViewControllerFromPhotoPickerWithRequestIdentifier:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(UIImagePickerController *)self _propertiesForPhotoPickerExtension];
  id v6 = objc_msgSend(objc_alloc(-[UIImagePickerController photoPickerRequestOptionsClass](self, "photoPickerRequestOptionsClass")), "initWithRequestedIdentifier:photoPickerProperties:", v4, v5);
  id v7 = objc_alloc(MEMORY[0x1E4F28D78]);
  long long v8 = [(id)*MEMORY[0x1E4F44408] identifier];
  long long v9 = (void *)[v7 initWithItem:v6 typeIdentifier:v8];

  id v10 = objc_alloc_init(MEMORY[0x1E4F28C80]);
  v18[0] = v9;
  char v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  [v10 setAttachments:v11];

  objc_initWeak(&location, self);
  id v12 = [(UIImagePickerController *)self photosExtension];
  id v17 = v10;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __85__UIImagePickerController_requestViewControllerFromPhotoPickerWithRequestIdentifier___block_invoke;
  void v14[3] = &unk_1E52E8720;
  objc_copyWeak(&v15, &location);
  [v12 instantiateViewControllerWithInputItems:v13 connectionHandler:v14];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __85__UIImagePickerController_requestViewControllerFromPhotoPickerWithRequestIdentifier___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __85__UIImagePickerController_requestViewControllerFromPhotoPickerWithRequestIdentifier___block_invoke_2;
  v12[3] = &unk_1E52E86F8;
  objc_copyWeak(&v13, v10);
  [WeakRetained _handleInstantiatedRemoteViewController:v8 request:v7 error:v9 completion:v12];

  objc_destroyWeak(&v13);
}

void __85__UIImagePickerController_requestViewControllerFromPhotoPickerWithRequestIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handlePushViewController:v3];
}

- (void)_handlePushViewController:(id)a3
{
}

- (void)didDisplayPhotoPickerSourceType:(id)a3
{
  id v4 = (void *)[a3 integerValue];
  char v5 = [(UIImagePickerController *)self _photoPickerDisplayCompletion];

  objc_initWeak(&location, self);
  if (v5)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__UIImagePickerController_didDisplayPhotoPickerSourceType___block_invoke;
    block[3] = &unk_1E52DF528;
    objc_copyWeak(v10, &location);
    v10[1] = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);
    id v6 = v10;
  }
  else
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __59__UIImagePickerController_didDisplayPhotoPickerSourceType___block_invoke_2;
    v7[3] = &unk_1E52DC308;
    objc_copyWeak(&v8, &location);
    dispatch_async(MEMORY[0x1E4F14428], v7);
    id v6 = &v8;
  }
  objc_destroyWeak(v6);
  objc_destroyWeak(&location);
}

void __59__UIImagePickerController_didDisplayPhotoPickerSourceType___block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v5 = [WeakRetained _photoPickerDisplayCompletion];

  if (v5) {
    v5[2](v5, *(void *)(a1 + 40));
  }
  id v4 = objc_loadWeakRetained(v2);
  [v4 _handleEndingPhotoPickerPresentationDelay];
}

void __59__UIImagePickerController_didDisplayPhotoPickerSourceType___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleEndingPhotoPickerPresentationDelay];
}

- (void)_handleEndingPhotoPickerPresentationDelay
{
  if (self->_photoPickerDidStartDelayingPresentation && !self->_photoPickerDidEndDelayingPresentation)
  {
    [(UIViewController *)self _endDelayingPresentation];
    self->_photoPickerDidEndDelayingPresentation = 1;
  }
}

- (void)didDisplayPhotoPickerPreview
{
  id v3 = [(UIImagePickerController *)self _photoPickerPreviewDisplayCompletion];

  if (v3)
  {
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __55__UIImagePickerController_didDisplayPhotoPickerPreview__block_invoke;
    v4[3] = &unk_1E52DC308;
    objc_copyWeak(&v5, &location);
    dispatch_async(MEMORY[0x1E4F14428], v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __55__UIImagePickerController_didDisplayPhotoPickerPreview__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = [WeakRetained _photoPickerPreviewDisplayCompletion];

  id v2 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t))(v3 + 16))(v3);
    id v2 = (void *)v3;
  }
}

- (void)didSelectMediaWithInfoDictionary:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__UIImagePickerController_didSelectMediaWithInfoDictionary___block_invoke;
  block[3] = &unk_1E52D9960;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __60__UIImagePickerController_didSelectMediaWithInfoDictionary___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _imagePickerDidCompleteWithInfo:*(void *)(a1 + 32)];
}

- (void)didSelectMultipleMediaItemsWithInfoDictionaries:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__UIImagePickerController_didSelectMultipleMediaItemsWithInfoDictionaries___block_invoke;
  block[3] = &unk_1E52D9960;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __75__UIImagePickerController_didSelectMultipleMediaItemsWithInfoDictionaries___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _imagePickerDidCompleteWithInfoArray:*(void *)(a1 + 32)];
}

- (void)_setupControllersForCurrentSourceTypeWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __79__UIImagePickerController__setupControllersForCurrentSourceTypeWithCompletion___block_invoke;
  v6[3] = &unk_1E52E8748;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(UIImagePickerController *)self _createInitialControllerWithCompletion:v6];
}

void __79__UIImagePickerController__setupControllersForCurrentSourceTypeWithCompletion___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v10 = a2;
  if (v10)
  {
    id v6 = [*(id *)(a1 + 32) _existingView];

    id v7 = *(id **)(a1 + 32);
    if (v6) {
      BOOL v8 = 0;
    }
    else {
      BOOL v8 = a3 == 0;
    }
    if (v8) {
      objc_storeStrong(v7 + 190, a2);
    }
    else {
      [v7 _handleTopViewControllerReadyForDisplay:v10];
    }
  }
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(void))(v9 + 16))();
  }
}

- (void)_handleTopViewControllerReadyForDisplay:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(UIImagePickerController *)self _removeAllChildren];
  -[UINavigationController setNavigationBarHidden:animated:](self, "setNavigationBarHidden:animated:", [v4 _displaysFullScreen], 0);
  v6[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

  [(UINavigationController *)self setViewControllers:v5 animated:0];
}

- (void)_setupControllersForCurrentMediaTypes
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(UINavigationController *)self viewControllers];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) _setImagePickerMediaTypes:self->_mediaTypes];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
  BOOL v8 = [(UIViewController *)self presentedViewController];
  [v8 _setImagePickerMediaTypes:self->_mediaTypes];
}

- (int64_t)_preferredModalPresentationStyle
{
  if ([(UIImagePickerController *)self sourceType] == UIImagePickerControllerSourceTypeCamera) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)UIImagePickerController;
  return [(UIViewController *)&v4 _preferredModalPresentationStyle];
}

- (_UIRemoteViewController)_containedRemoteViewController
{
  id v2 = [(UINavigationController *)self topViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (_UIRemoteViewController *)v3;
}

- (void)_autoDismiss
{
  id v2 = [(UIViewController *)self presentingViewController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (void)_imagePickerDidCancel
{
  id v3 = [(UINavigationController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 imagePickerControllerDidCancel:self];
  }
  else {
    [(UIImagePickerController *)self _autoDismiss];
  }
}

- (void)_imagePickerDidCompleteWithInfo:(id)a3
{
  id v10 = a3;
  if (!v10)
  {
    [(UIImagePickerController *)self _imagePickerDidCancel];
    goto LABEL_16;
  }
  objc_super v4 = [(UINavigationController *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      [(UIImagePickerController *)self _autoDismiss];
      goto LABEL_15;
    }
    uint64_t v5 = [v10 objectForKey:@"UIImagePickerControllerMediaType"];
    uint64_t v6 = [(id)*MEMORY[0x1E4F44400] identifier];
    int v7 = [v5 isEqualToString:v6];

    if (!v7)
    {
      [(UIImagePickerController *)self _imagePickerDidCancel];

      goto LABEL_15;
    }
    if ([(UIImagePickerController *)self _allowsImageEditing])
    {
      BOOL v8 = [v10 objectForKey:@"UIImagePickerControllerEditedImage"];
      long long v9 = (void *)[v10 mutableCopy];
      [v9 removeObjectForKey:@"UIImagePickerControllerMediaType"];
      [v9 removeObjectForKey:@"UIImagePickerControllerEditedImage"];
      if (v8)
      {
LABEL_9:
        [v4 imagePickerController:self didFinishPickingImage:v8 editingInfo:v9];

LABEL_14:
        goto LABEL_15;
      }
    }
    else
    {
      BOOL v8 = [v10 objectForKey:@"UIImagePickerControllerOriginalImage"];
      long long v9 = 0;
      if (v8) {
        goto LABEL_9;
      }
    }
    [(UIImagePickerController *)self _imagePickerDidCancel];
    goto LABEL_14;
  }
  [v4 imagePickerController:self didFinishPickingMediaWithInfo:v10];
LABEL_15:

LABEL_16:
}

- (void)_imagePickerDidCompleteWithInfoArray:(id)a3
{
  id v6 = a3;
  if ([v6 count])
  {
    objc_super v4 = [v6 objectAtIndex:0];
    [(UIImagePickerController *)self _imagePickerDidCompleteWithInfo:v4];
  }
  if (v6)
  {
    uint64_t v5 = [(UINavigationController *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v5 performSelector:sel_imagePickerController_didFinishPickingMultipleMediaWithInfo_ withObject:self withObject:v6];
    }
    else {
      [(UIImagePickerController *)self _autoDismiss];
    }
  }
  else
  {
    [(UIImagePickerController *)self _imagePickerDidCancel];
  }
}

- (NSExtension)photosExtension
{
  return self->_photosExtension;
}

- (void)setPhotosExtension:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photosExtension, 0);
  objc_storeStrong((id *)&self->_photoPickerPreheatedViewController, 0);
  objc_storeStrong(&self->_photoPickerPreviewDisplayCompletion, 0);
  objc_storeStrong(&self->_photoPickerDisplayCompletion, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_mediaTypes, 0);
  objc_storeStrong(&self->_image, 0);
}

@end