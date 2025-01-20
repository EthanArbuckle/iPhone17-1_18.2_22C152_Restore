@interface UIWebFileUploadPanel
- (BOOL)_shouldMediaCaptureOpenMediaDevice;
- (BOOL)_string:(id)a3 hasPrefixCaseInsensitive:(id)a4;
- (BOOL)_willMultipleSelectionDelegateBeCalled;
- (BOOL)allowMultipleFiles;
- (BOOL)isUsingCamera;
- (NSArray)mimeTypes;
- (UIWebDocumentView)documentView;
- (UIWebFileUploadPanel)initWithResultListener:(id)a3 configuration:(id)a4 documentView:(id)a5;
- (UIWebFileUploadPanelDelegate)delegate;
- (WebOpenPanelResultListener)resultListener;
- (id)_UTIsForMIMETypes;
- (id)_cameraButtonLabel;
- (id)_displayStringForPhotos:(unint64_t)a3 videos:(unint64_t)a4;
- (id)_documentPickerMenuMediaTypes;
- (id)_mediaTypesForPickerSourceType:(int64_t)a3;
- (id)_photoPickerWithSourceType:(int64_t)a3;
- (int64_t)mediaCaptureType;
- (void)_adjustMediaCaptureType;
- (void)_cancel;
- (void)_chooseFilename:(id)a3 displayString:(id)a4 iconImage:(id)a5;
- (void)_chooseFilenames:(id)a3 displayString:(id)a4 iconImage:(id)a5;
- (void)_dismissDisplayAnimated:(BOOL)a3;
- (void)_dispatchDidDismiss;
- (void)_presentForCurrentInterfaceIdiom:(id)a3;
- (void)_presentFullscreenViewController:(id)a3 animated:(BOOL)a4;
- (void)_presentPopoverWithContentViewController:(id)a3 animated:(BOOL)a4;
- (void)_processMediaInfoDictionaries:(id)a3 atIndex:(unint64_t)a4 processedResults:(id)a5 processedImageCount:(unint64_t)a6 processedVideoCount:(unint64_t)a7 successBlock:(id)a8 failureBlock:(id)a9;
- (void)_processMediaInfoDictionaries:(id)a3 successBlock:(id)a4 failureBlock:(id)a5;
- (void)_showDocumentPickerMenu;
- (void)_showPhotoPickerWithSourceType:(int64_t)a3;
- (void)_uploadItemForImageData:(id)a3 imageName:(id)a4 successBlock:(id)a5 failureBlock:(id)a6;
- (void)_uploadItemForJPEGRepresentationOfImage:(id)a3 successBlock:(id)a4 failureBlock:(id)a5;
- (void)_uploadItemFromMediaInfo:(id)a3 successBlock:(id)a4 failureBlock:(id)a5;
- (void)dealloc;
- (void)dismiss;
- (void)documentMenu:(id)a3 didPickDocumentPicker:(id)a4;
- (void)documentMenuWasCancelled:(id)a3;
- (void)documentPicker:(id)a3 didPickDocumentAtURL:(id)a4;
- (void)documentPickerWasCancelled:(id)a3;
- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4;
- (void)imagePickerController:(id)a3 didFinishPickingMultipleMediaWithInfo:(id)a4;
- (void)imagePickerControllerDidCancel:(id)a3;
- (void)present;
- (void)setAllowMultipleFiles:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDocumentView:(id)a3;
- (void)setIsUsingCamera:(BOOL)a3;
- (void)setMediaCaptureType:(int64_t)a3;
- (void)setMimeTypes:(id)a3;
- (void)setResultListener:(id)a3;
@end

@implementation UIWebFileUploadPanel

- (UIWebFileUploadPanel)initWithResultListener:(id)a3 configuration:(id)a4 documentView:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)UIWebFileUploadPanel;
  v8 = [(UIViewController *)&v10 init];
  if (v8)
  {
    -[UIWebFileUploadPanel setMimeTypes:](v8, "setMimeTypes:", [a4 objectForKey:*MEMORY[0x1E4FB6E60]]);
    [(UIWebFileUploadPanel *)v8 setDocumentView:a5];
    [(UIWebFileUploadPanel *)v8 setResultListener:a3];
    -[UIWebFileUploadPanel setAllowMultipleFiles:](v8, "setAllowMultipleFiles:", [a4 objectForKey:*MEMORY[0x1E4FB6E50]] != 0);
    [(UIWebFileUploadPanel *)v8 setIsUsingCamera:0];
    -[UIWebFileUploadPanel setMediaCaptureType:](v8, "setMediaCaptureType:", objc_msgSend((id)objc_msgSend(a4, "objectForKey:", *MEMORY[0x1E4FB6E58]), "integerValue"));
  }
  return v8;
}

- (void)dealloc
{
  [(UIWebFileUploadPanel *)self setMimeTypes:0];
  [(UIWebFileUploadPanel *)self setDocumentView:0];
  [(UIWebFileUploadPanel *)self setResultListener:0];
  [(UIDocumentMenuViewController *)self->_documentMenuController setDelegate:0];

  [(UINavigationController *)self->_imagePicker setDelegate:0];
  self->_presentationViewController = 0;
  [(UIPopoverController *)self->_presentationPopover setDelegate:0];

  v3.receiver = self;
  v3.super_class = (Class)UIWebFileUploadPanel;
  [(UIViewController *)&v3 dealloc];
}

- (void)_dispatchDidDismiss
{
  if (objc_opt_respondsToSelector())
  {
    delegate = self->_delegate;
    [(UIWebFileUploadPanelDelegate *)delegate fileUploadPanelDidDismiss:self];
  }
}

- (void)_cancel
{
  WebThreadLock();
  [(WebOpenPanelResultListener *)self->_resultListener cancel];
  [(UIWebFileUploadPanel *)self _dispatchDidDismiss];
}

- (void)_chooseFilename:(id)a3 displayString:(id)a4 iconImage:(id)a5
{
  WebThreadLock();
  -[WebOpenPanelResultListener chooseFilename:displayString:iconImage:](self->_resultListener, "chooseFilename:displayString:iconImage:", a3, a4, [a5 CGImage]);
  [(UIWebFileUploadPanel *)self _dispatchDidDismiss];
}

- (void)_chooseFilenames:(id)a3 displayString:(id)a4 iconImage:(id)a5
{
  WebThreadLock();
  -[WebOpenPanelResultListener chooseFilenames:displayString:iconImage:](self->_resultListener, "chooseFilenames:displayString:iconImage:", a3, a4, [a5 CGImage]);
  [(UIWebFileUploadPanel *)self _dispatchDidDismiss];
}

- (void)_adjustMediaCaptureType
{
  if (!+[UIImagePickerController isCameraDeviceAvailable:1])
  {
    BOOL v3 = +[UIImagePickerController isCameraDeviceAvailable:0];
    int64_t v4 = 0;
    if (!v3) {
      goto LABEL_7;
    }
  }
  if (!+[UIImagePickerController isCameraDeviceAvailable:1])self->_mediaCaptureType = 2; {
  if (!+[UIImagePickerController isCameraDeviceAvailable:0])
  }
  {
    int64_t v4 = 1;
LABEL_7:
    self->_mediaCaptureType = v4;
  }
}

- (BOOL)_shouldMediaCaptureOpenMediaDevice
{
  return self->_mediaCaptureType
      && +[UIImagePickerController isSourceTypeAvailable:1];
}

- (BOOL)_string:(id)a3 hasPrefixCaseInsensitive:(id)a4
{
  return [a3 rangeOfString:a4 options:9] != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)_UTIsForMIMETypes
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)[MEMORY[0x1E4F1CA80] set];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  int64_t v4 = [(UIWebFileUploadPanel *)self mimeTypes];
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    v8 = (void *)*MEMORY[0x1E4F44448];
    v9 = (void *)*MEMORY[0x1E4F44400];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        BOOL v12 = [(UIWebFileUploadPanel *)self _string:v11 hasPrefixCaseInsensitive:@"image/"];
        v13 = v9;
        if (!v12)
        {
          BOOL v14 = [(UIWebFileUploadPanel *)self _string:v11 hasPrefixCaseInsensitive:@"video/"];
          v13 = v8;
          if (!v14) {
            continue;
          }
        }
        objc_msgSend(v3, "addObject:", objc_msgSend(v13, "identifier"));
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
  return (id)[v3 allObjects];
}

- (id)_mediaTypesForPickerSourceType:(int64_t)a3
{
  id v4 = [(UIWebFileUploadPanel *)self _UTIsForMIMETypes];
  if ([v4 count]) {
    return v4;
  }
  return +[UIImagePickerController availableMediaTypesForSourceType:a3];
}

- (id)_documentPickerMenuMediaTypes
{
  id v2 = [(UIWebFileUploadPanel *)self _UTIsForMIMETypes];
  if ([v2 count]) {
    return v2;
  }
  else {
    return &unk_1ED3EFAE8;
  }
}

- (id)_photoPickerWithSourceType:(int64_t)a3
{
  uint64_t v5 = objc_alloc_init(UIImagePickerController);
  [(UIImagePickerController *)v5 setSourceType:a3];
  [(UIImagePickerController *)v5 setAllowsEditing:0];
  [(UINavigationController *)v5 setDelegate:self];
  [(UIViewController *)v5 setModalPresentationStyle:0];
  [(UIImagePickerController *)v5 _setAllowsMultipleSelection:self->_allowMultipleFiles];
  [(UIImagePickerController *)v5 setMediaTypes:[(UIWebFileUploadPanel *)self _mediaTypesForPickerSourceType:a3]];
  int64_t mediaCaptureType = self->_mediaCaptureType;
  if (mediaCaptureType) {
    [(UIImagePickerController *)v5 setCameraDevice:mediaCaptureType == 1];
  }
  return v5;
}

- (void)_showPhotoPickerWithSourceType:(int64_t)a3
{
  self->_imagePicker = (UIImagePickerController *)-[UIWebFileUploadPanel _photoPickerWithSourceType:](self, "_photoPickerWithSourceType:");
  BOOL IsSmallScreen = UIWebCurrentUserInterfaceIdiomIsSmallScreen();
  imagePicker = self->_imagePicker;
  if (a3 == 1 || IsSmallScreen)
  {
    [(UIWebFileUploadPanel *)self _presentFullscreenViewController:imagePicker animated:1];
  }
  else
  {
    [(UIWebFileUploadPanel *)self _presentPopoverWithContentViewController:imagePicker animated:1];
  }
}

- (id)_cameraButtonLabel
{
  if (!+[UIImagePickerController isSourceTypeAvailable:1])return 0; {
  id v3 = [(UIWebFileUploadPanel *)self _mediaTypesForPickerSourceType:1];
  }
  int v4 = objc_msgSend(v3, "containsObject:", objc_msgSend((id)*MEMORY[0x1E4F44400], "identifier"));
  int v5 = objc_msgSend(v3, "containsObject:", objc_msgSend((id)*MEMORY[0x1E4F44448], "identifier"));
  if (v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (v5) {
      v8 = @"Take Video";
    }
    else {
      v8 = @"Take Photo";
    }
  }
  else
  {
    v8 = @"Take Photo or Video";
  }
  return _UINSLocalizedStringWithDefaultValue(v8, v8);
}

- (void)_showDocumentPickerMenu
{
  id v3 = [[UIDocumentMenuViewController alloc] _initIgnoringApplicationEntitlementForImportOfTypes:[(UIWebFileUploadPanel *)self _documentPickerMenuMediaTypes]];
  self->_documentMenuController = v3;
  [(UIDocumentMenuViewController *)v3 setDelegate:self];
  id v4 = _UINSLocalizedStringWithDefaultValue(@"Photo Library", @"Photo Library");
  documentMenuController = self->_documentMenuController;
  BOOL v6 = +[UIImage systemImageNamed:@"rectangle.on.rectangle"];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __47__UIWebFileUploadPanel__showDocumentPickerMenu__block_invoke;
  v12[3] = &unk_1E52DC580;
  v12[4] = self;
  [(UIDocumentMenuViewController *)documentMenuController addOptionWithTitle:v4 image:v6 order:0 handler:v12];
  if (+[UIImagePickerController isSourceTypeAvailable:1])
  {
    id v7 = [(UIWebFileUploadPanel *)self _cameraButtonLabel];
    if (v7)
    {
      id v8 = v7;
      v9 = self->_documentMenuController;
      objc_super v10 = +[UIImage systemImageNamed:@"camera.fill"];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __47__UIWebFileUploadPanel__showDocumentPickerMenu__block_invoke_2;
      v11[3] = &unk_1E52DC580;
      v11[4] = self;
      [(UIDocumentMenuViewController *)v9 addOptionWithTitle:v8 image:v10 order:0 handler:v11];
    }
  }
  [(UIWebFileUploadPanel *)self _presentForCurrentInterfaceIdiom:self->_documentMenuController];
}

uint64_t __47__UIWebFileUploadPanel__showDocumentPickerMenu__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showPhotoPickerWithSourceType:0];
}

uint64_t __47__UIWebFileUploadPanel__showDocumentPickerMenu__block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1033) = 1;
  return [*(id *)(a1 + 32) _showPhotoPickerWithSourceType:1];
}

- (void)_presentForCurrentInterfaceIdiom:(id)a3
{
  if (UIWebCurrentUserInterfaceIdiomIsSmallScreen())
  {
    [(UIWebFileUploadPanel *)self _presentFullscreenViewController:a3 animated:1];
  }
  else
  {
    [(UIWebFileUploadPanel *)self _presentPopoverWithContentViewController:a3 animated:1];
  }
}

- (void)_presentPopoverWithContentViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  [(UIWebFileUploadPanel *)self _dismissDisplayAnimated:a4];
  id v7 = [[UIPopoverController alloc] initWithContentViewController:a3];
  self->_presentationPopover = v7;
  [(UIPopoverController *)v7 setDelegate:self];
  presentationPopover = self->_presentationPopover;
  v15.origin.double x = self->_interactionPoint.x;
  v15.origin.double y = self->_interactionPoint.y;
  v15.size.double width = 1.0;
  v15.size.double height = 1.0;
  CGRect v16 = CGRectIntegral(v15);
  double x = v16.origin.x;
  double y = v16.origin.y;
  double width = v16.size.width;
  double height = v16.size.height;
  v13 = [(UIWebFileUploadPanel *)self documentView];
  -[UIPopoverController presentPopoverFromRect:inView:permittedArrowDirections:animated:](presentationPopover, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", v13, 15, v4, x, y, width, height);
}

- (void)_presentFullscreenViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  [(UIWebFileUploadPanel *)self _dismissDisplayAnimated:a4];
  id v7 = +[UIViewController _viewControllerForFullScreenPresentationFromView:[(UIWebFileUploadPanel *)self documentView]];
  self->_presentationViewController = v7;
  [(UIViewController *)v7 presentViewController:a3 animated:v4 completion:0];
}

- (void)present
{
  self->_interactionElement = (DOMNode *)[(UIWebDocumentView *)[(UIWebFileUploadPanel *)self documentView] interactionElement];
  [(UIWebDocumentView *)[(UIWebFileUploadPanel *)self documentView] interactionLocation];
  self->_interactionPoint.double x = v3;
  self->_interactionPoint.double y = v4;
  if ([(UIWebFileUploadPanel *)self _shouldMediaCaptureOpenMediaDevice])
  {
    [(UIWebFileUploadPanel *)self _adjustMediaCaptureType];
    self->_isUsingCamera = 1;
    [(UIWebFileUploadPanel *)self _showPhotoPickerWithSourceType:1];
  }
  else
  {
    [(UIWebFileUploadPanel *)self _showDocumentPickerMenu];
  }
}

- (void)dismiss
{
  [(UIWebFileUploadPanel *)self _dismissDisplayAnimated:0];
  [(UIWebFileUploadPanel *)self _cancel];
}

- (void)documentMenu:(id)a3 didPickDocumentPicker:(id)a4
{
  [a4 setDelegate:self];
  [a4 setModalPresentationStyle:0];
  [(UIWebFileUploadPanel *)self _presentForCurrentInterfaceIdiom:a4];
}

- (void)documentMenuWasCancelled:(id)a3
{
  [(UIWebFileUploadPanel *)self _dismissDisplayAnimated:1];
  [(UIWebFileUploadPanel *)self _cancel];
}

- (void)documentPicker:(id)a3 didPickDocumentAtURL:(id)a4
{
  [(UIWebFileUploadPanel *)self _dismissDisplayAnimated:1];
  uint64_t v6 = [a4 path];
  uint64_t v7 = [a4 lastPathComponent];
  id v8 = (void *)[a4 pathExtension];
  if ([v8 length])
  {
    v9 = (void *)[MEMORY[0x1E4F442D8] typeWithFilenameExtension:v8];
    if ([v9 conformsToType:*MEMORY[0x1E4F44400]])
    {
      id v10 = iconForImageFile((const __CFURL *)a4);
    }
    else if ([v9 conformsToType:*MEMORY[0x1E4F44448]])
    {
      id v10 = iconForVideoFile(a4);
    }
    else
    {
      id v10 = fallbackIconForFile((uint64_t)a4);
    }
    id v11 = v10;
  }
  else
  {
    id v11 = 0;
  }
  [(UIWebFileUploadPanel *)self _chooseFilename:v6 displayString:v7 iconImage:v11];
}

- (void)documentPickerWasCancelled:(id)a3
{
  [(UIWebFileUploadPanel *)self _dismissDisplayAnimated:1];
  [(UIWebFileUploadPanel *)self _cancel];
}

- (void)_dismissDisplayAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  presentationPopover = self->_presentationPopover;
  if (presentationPopover)
  {
    [(UIPopoverController *)presentationPopover dismissPopoverAnimated:a3];
    [(UIPopoverController *)self->_presentationPopover setDelegate:0];

    self->_presentationPopover = 0;
  }
  presentationViewController = self->_presentationViewController;
  if (presentationViewController)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __48__UIWebFileUploadPanel__dismissDisplayAnimated___block_invoke;
    v7[3] = &unk_1E52DC580;
    v7[4] = self;
    [(UIViewController *)presentationViewController dismissViewControllerAnimated:v3 completion:v7];
  }
}

uint64_t __48__UIWebFileUploadPanel__dismissDisplayAnimated___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 992) = 0;
  return result;
}

- (id)_displayStringForPhotos:(unint64_t)a3 videos:(unint64_t)a4
{
  if (!(a4 | a3)) {
    return 0;
  }
  unint64_t v4 = a4;
  unint64_t v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  objc_msgSend(v6, "setLocale:", objc_msgSend(MEMORY[0x1E4F1CA20], "currentLocale"));
  uint64_t v7 = 1;
  [v6 setGeneratesDecimalNumbers:1];
  [v6 setNumberStyle:1];
  if (v5)
  {
    if (v5 == 1)
    {
      id v8 = _UINSLocalizedStringWithDefaultValue(@"1 Photo", @"1 Photo");
    }
    else
    {
      uint64_t v10 = objc_msgSend(v6, "stringFromNumber:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v5));
      id v8 = (id)[NSString stringWithFormat:_UINSLocalizedStringWithDefaultValue(@"%@ Photos", @"%@ Photos", v10];
    }
    unint64_t v5 = (unint64_t)v8;
    uint64_t v7 = 2;
  }
  if (v4 == 1)
  {
    id v11 = _UINSLocalizedStringWithDefaultValue(@"1 Video", @"1 Video");
LABEL_13:
    unint64_t v4 = (unint64_t)v11;
    goto LABEL_14;
  }
  if (v4)
  {
    uint64_t v12 = objc_msgSend(v6, "stringFromNumber:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v4));
    id v11 = (id)[NSString stringWithFormat:_UINSLocalizedStringWithDefaultValue(@"%@ Videos", @"%@ Videos", v12];
    goto LABEL_13;
  }
  --v7;
LABEL_14:
  if (v7 == 1)
  {
    if (v5) {
      v13 = (void *)v5;
    }
    else {
      v13 = (void *)v4;
    }
  }
  else if (v7 == 2)
  {
    v13 = (void *)[NSString stringWithFormat:_UINSLocalizedStringWithDefaultValue(@"%@ and %@", @"%@ and %@", v5, v4];
  }
  else
  {
    v13 = 0;
  }
  return (id)[v13 lowercaseString];
}

- (void)_processMediaInfoDictionaries:(id)a3 successBlock:(id)a4 failureBlock:(id)a5
{
}

- (void)_processMediaInfoDictionaries:(id)a3 atIndex:(unint64_t)a4 processedResults:(id)a5 processedImageCount:(unint64_t)a6 processedVideoCount:(unint64_t)a7 successBlock:(id)a8 failureBlock:(id)a9
{
  if ([a3 count] == a4)
  {
    id v16 = [(UIWebFileUploadPanel *)self _displayStringForPhotos:a6 videos:a7];
    long long v17 = (void (*)(id, id, id))*((void *)a8 + 2);
    v17(a8, a5, v16);
  }
  else
  {
    uint64_t v18 = [a3 objectAtIndex:a4];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __145__UIWebFileUploadPanel__processMediaInfoDictionaries_atIndex_processedResults_processedImageCount_processedVideoCount_successBlock_failureBlock___block_invoke;
    v19[3] = &unk_1E52EEB40;
    v19[4] = a5;
    v19[5] = self;
    v19[10] = a6;
    v19[11] = a4 + 1;
    v19[6] = a3;
    v19[7] = a8;
    v19[8] = a9;
    v19[9] = a7;
    [(UIWebFileUploadPanel *)self _uploadItemFromMediaInfo:v18 successBlock:v19 failureBlock:a9];
  }
}

uint64_t __145__UIWebFileUploadPanel__processMediaInfoDictionaries_atIndex_processedResults_processedImageCount_processedVideoCount_successBlock_failureBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 72);
  uint64_t v5 = v4 + [a2 isVideo];
  uint64_t v6 = *(void *)(a1 + 80);
  uint64_t v7 = v6 + ([a2 isVideo] ^ 1);
  [*(id *)(a1 + 32) addObject:a2];
  return [*(id *)(a1 + 40) _processMediaInfoDictionaries:*(void *)(a1 + 48) atIndex:*(void *)(a1 + 88) processedResults:*(void *)(a1 + 32) processedImageCount:v7 processedVideoCount:v5 successBlock:*(void *)(a1 + 56) failureBlock:*(void *)(a1 + 64)];
}

- (void)_uploadItemForImageData:(id)a3 imageName:(id)a4 successBlock:(id)a5 failureBlock:(id)a6
{
  uint64_t v9 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "_webkit_createTemporaryDirectoryWithTemplatePrefix:", @"UIWebFileUpload"), "stringByAppendingPathComponent:", a4);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v12 = 0;
    [a3 writeToFile:v9 options:1 error:&v12];
    if (v12)
    {
      NSLog(&cfstr_WebfileuploadE.isa, v12);
      (*((void (**)(id))a6 + 2))(a6);
    }
    else
    {
      (*((void (**)(id, _UIWebImageUploadItem *))a5 + 2))(a5, [(_UIWebFileUploadItem *)[_UIWebImageUploadItem alloc] initWithFilePath:v10]);
    }
  }
  else
  {
    NSLog(&cfstr_WebfileuploadF.isa);
    id v11 = (void (*)(id))*((void *)a6 + 2);
    v11(a6);
  }
}

- (void)_uploadItemForJPEGRepresentationOfImage:(id)a3 successBlock:(id)a4 failureBlock:(id)a5
{
  global_queue = dispatch_get_global_queue(0, 0);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __90__UIWebFileUploadPanel__uploadItemForJPEGRepresentationOfImage_successBlock_failureBlock___block_invoke;
  v10[3] = &unk_1E52EEB68;
  v10[4] = a3;
  v10[5] = self;
  v10[6] = a5;
  v10[7] = a4;
  dispatch_async(global_queue, v10);
}

uint64_t __90__UIWebFileUploadPanel__uploadItemForJPEGRepresentationOfImage_successBlock_failureBlock___block_invoke(uint64_t a1)
{
  id v2 = _UIImageJPEGRepresentation(*(void **)(a1 + 32), 0, 0.8);
  if (v2)
  {
    id v3 = v2;
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v4 = *(void *)(a1 + 56);
    uint64_t v6 = *(void **)(a1 + 40);
    return [v6 _uploadItemForImageData:v3 imageName:@"image.jpg" successBlock:v4 failureBlock:v5];
  }
  else
  {
    NSLog(&cfstr_WebfileuploadF_0.isa);
    id v8 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v8();
  }
}

- (void)_uploadItemFromMediaInfo:(id)a3 successBlock:(id)a4 failureBlock:(id)a5
{
  uint64_t v9 = [a3 objectForKey:@"UIImagePickerControllerMediaType"];
  uint64_t v10 = (void *)[MEMORY[0x1E4F442D8] _typeWithIdentifier:v9 allowUndeclared:1];
  if ([v10 conformsToType:*MEMORY[0x1E4F44448]])
  {
    id v11 = (void *)[a3 objectForKey:@"UIImagePickerControllerMediaURL"];
    if ([v11 isFileURL])
    {
      uint64_t v12 = [_UIWebVideoUploadItem alloc];
      v13 = v11;
LABEL_8:
      id v16 = -[_UIWebFileUploadItem initWithFilePath:](v12, "initWithFilePath:", [v13 path]);
      long long v17 = (void (*)(id, _UIWebVideoUploadItem *))*((void *)a4 + 2);
      v17(a4, v16);
      return;
    }
    NSLog(&cfstr_WebfileuploadE_0.isa);
    goto LABEL_19;
  }
  if (([v10 conformsToType:*MEMORY[0x1E4F44400]] & 1) == 0)
  {
    NSLog(&cfstr_WebfileuploadU.isa, v10);
LABEL_19:
    long long v19 = (void (*)(id))*((void *)a5 + 2);
    v19(a5);
    return;
  }
  BOOL v14 = (void *)[a3 objectForKeyedSubscript:@"UIImagePickerControllerImageURL"];
  if (v14)
  {
    CGRect v15 = v14;
    if ([v14 isFileURL])
    {
      uint64_t v12 = [_UIWebImageUploadItem alloc];
      v13 = v15;
      goto LABEL_8;
    }
    NSLog(&cfstr_Wkfileuploadpa.isa);
    goto LABEL_19;
  }
  uint64_t v18 = [a3 objectForKey:@"UIImagePickerControllerOriginalImage"];
  if (!v18)
  {
    NSLog(&cfstr_WebfileuploadE_1.isa);
    goto LABEL_19;
  }
  [(UIWebFileUploadPanel *)self _uploadItemForJPEGRepresentationOfImage:v18 successBlock:a4 failureBlock:a5];
}

- (BOOL)_willMultipleSelectionDelegateBeCalled
{
  return self->_allowMultipleFiles && !self->_isUsingCamera;
}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  if (![(UIWebFileUploadPanel *)self _willMultipleSelectionDelegateBeCalled])
  {
    [(UIWebFileUploadPanel *)self _dismissDisplayAnimated:1];
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObject:a4];
    v7[4] = self;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __76__UIWebFileUploadPanel_imagePickerController_didFinishPickingMediaWithInfo___block_invoke;
    v8[3] = &unk_1E52EEBB8;
    v8[4] = self;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __76__UIWebFileUploadPanel_imagePickerController_didFinishPickingMediaWithInfo___block_invoke_3;
    v7[3] = &unk_1E52DC580;
    [(UIWebFileUploadPanel *)self _processMediaInfoDictionaries:v6 successBlock:v8 failureBlock:v7];
  }
}

void __76__UIWebFileUploadPanel_imagePickerController_didFinishPickingMediaWithInfo___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = (void *)[a2 objectAtIndex:0];
  uint64_t v6 = [v5 displayImage];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__UIWebFileUploadPanel_imagePickerController_didFinishPickingMediaWithInfo___block_invoke_2;
  v7[3] = &unk_1E52EEB90;
  v7[4] = *(void *)(a1 + 32);
  void v7[5] = v5;
  v7[6] = a3;
  v7[7] = v6;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __76__UIWebFileUploadPanel_imagePickerController_didFinishPickingMediaWithInfo___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) filePath];
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  return [v2 _chooseFilename:v3 displayString:v4 iconImage:v5];
}

void __76__UIWebFileUploadPanel_imagePickerController_didFinishPickingMediaWithInfo___block_invoke_3(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__UIWebFileUploadPanel_imagePickerController_didFinishPickingMediaWithInfo___block_invoke_4;
  block[3] = &unk_1E52DC580;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __76__UIWebFileUploadPanel_imagePickerController_didFinishPickingMediaWithInfo___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancel];
}

- (void)imagePickerController:(id)a3 didFinishPickingMultipleMediaWithInfo:(id)a4
{
  [(UIWebFileUploadPanel *)self _dismissDisplayAnimated:1];
  v6[4] = self;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __84__UIWebFileUploadPanel_imagePickerController_didFinishPickingMultipleMediaWithInfo___block_invoke;
  v7[3] = &unk_1E52EEBB8;
  v7[4] = self;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __84__UIWebFileUploadPanel_imagePickerController_didFinishPickingMultipleMediaWithInfo___block_invoke_3;
  v6[3] = &unk_1E52DC580;
  [(UIWebFileUploadPanel *)self _processMediaInfoDictionaries:a4 successBlock:v7 failureBlock:v6];
}

void __84__UIWebFileUploadPanel_imagePickerController_didFinishPickingMultipleMediaWithInfo___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [a2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(a2);
        }
        uint64_t v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v12 filePath]) {
          objc_msgSend(v6, "addObject:", objc_msgSend(v12, "filePath"));
        }
        if (!v9) {
          uint64_t v9 = [v12 displayImage];
        }
      }
      uint64_t v8 = [a2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
  else
  {
    uint64_t v9 = 0;
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __84__UIWebFileUploadPanel_imagePickerController_didFinishPickingMultipleMediaWithInfo___block_invoke_2;
  v13[3] = &unk_1E52EEB90;
  v13[4] = *(void *)(a1 + 32);
  v13[5] = v6;
  v13[6] = a3;
  v13[7] = v9;
  dispatch_async(MEMORY[0x1E4F14428], v13);
}

uint64_t __84__UIWebFileUploadPanel_imagePickerController_didFinishPickingMultipleMediaWithInfo___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _chooseFilenames:*(void *)(a1 + 40) displayString:*(void *)(a1 + 48) iconImage:*(void *)(a1 + 56)];
}

void __84__UIWebFileUploadPanel_imagePickerController_didFinishPickingMultipleMediaWithInfo___block_invoke_3(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__UIWebFileUploadPanel_imagePickerController_didFinishPickingMultipleMediaWithInfo___block_invoke_4;
  block[3] = &unk_1E52DC580;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __84__UIWebFileUploadPanel_imagePickerController_didFinishPickingMultipleMediaWithInfo___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancel];
}

- (void)imagePickerControllerDidCancel:(id)a3
{
  [(UIWebFileUploadPanel *)self _dismissDisplayAnimated:1];
  [(UIWebFileUploadPanel *)self _cancel];
}

- (NSArray)mimeTypes
{
  return self->_mimeTypes;
}

- (void)setMimeTypes:(id)a3
{
}

- (UIWebDocumentView)documentView
{
  return self->_documentView;
}

- (void)setDocumentView:(id)a3
{
  self->_documentView = (UIWebDocumentView *)a3;
}

- (WebOpenPanelResultListener)resultListener
{
  return self->_resultListener;
}

- (void)setResultListener:(id)a3
{
}

- (BOOL)allowMultipleFiles
{
  return self->_allowMultipleFiles;
}

- (void)setAllowMultipleFiles:(BOOL)a3
{
  self->_allowMultipleFiles = a3;
}

- (BOOL)isUsingCamera
{
  return self->_isUsingCamera;
}

- (void)setIsUsingCamera:(BOOL)a3
{
  self->_isUsingCamera = a3;
}

- (UIWebFileUploadPanelDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (UIWebFileUploadPanelDelegate *)a3;
}

- (int64_t)mediaCaptureType
{
  return self->_mediaCaptureType;
}

- (void)setMediaCaptureType:(int64_t)a3
{
  self->_int64_t mediaCaptureType = a3;
}

@end