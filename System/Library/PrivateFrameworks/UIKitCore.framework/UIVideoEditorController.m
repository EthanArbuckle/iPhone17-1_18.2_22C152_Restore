@interface UIVideoEditorController
+ (BOOL)canEditVideoAtPath:(NSString *)videoPath;
- (BOOL)_didRevertStatusBar;
- (BOOL)_isSupportedInterfaceOrientation:(int64_t)a3;
- (NSString)videoPath;
- (NSTimeInterval)videoMaximumDuration;
- (UIImagePickerControllerQualityType)videoQuality;
- (UIVideoEditorController)init;
- (id)_createInitialController;
- (id)_properties;
- (id)_valueForProperty:(id)a3;
- (id)_videoURL;
- (void)_autoDismiss;
- (void)_initializeProperties;
- (void)_removeAllChildren;
- (void)_setProperties:(id)a3;
- (void)_setValue:(id)a3 forProperty:(id)a4;
- (void)_setVideoURL:(id)a3;
- (void)_setupControllers;
- (void)editVideoViewController:(id)a3 didFailWithError:(id)a4;
- (void)editVideoViewController:(id)a3 didTrimVideoWithOptions:(id)a4;
- (void)editVideoViewControllerDidCancel:(id)a3;
- (void)setVideoMaximumDuration:(NSTimeInterval)videoMaximumDuration;
- (void)setVideoPath:(NSString *)videoPath;
- (void)setVideoQuality:(UIImagePickerControllerQualityType)videoQuality;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillUnload;
@end

@implementation UIVideoEditorController

+ (BOOL)canEditVideoAtPath:(NSString *)videoPath
{
  int v4 = MGGetBoolAnswer();
  if (v4)
  {
    LOBYTE(v4) = UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(videoPath);
  }
  return v4;
}

- (UIVideoEditorController)init
{
  v4.receiver = self;
  v4.super_class = (Class)UIVideoEditorController;
  v2 = [(UIViewController *)&v4 init];
  if (v2 && (!MGGetBoolAnswer() || !UIImagePickerLoadPhotoLibraryIfNecessary()))
  {

    return 0;
  }
  return v2;
}

- (void)viewWillUnload
{
  if ([(UIViewController *)self parentViewController]
    && ![(UIViewController *)self presentingViewController])
  {
    *(unsigned char *)&self->_flags &= ~1u;
    [(UIVideoEditorController *)self _removeAllChildren];
  }
  v3.receiver = self;
  v3.super_class = (Class)UIVideoEditorController;
  [(UIViewController *)&v3 viewWillUnload];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if ((*(unsigned char *)&self->_flags & 3) == 0)
  {
    *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFA | 1;
    [(UIVideoEditorController *)self _setupControllers];
    if (([(id)UIApp _viewControllerBasedStatusBarAppearance] & 1) == 0)
    {
      int v5 = objc_msgSend(__UIStatusBarManagerForWindow(-[UINavigationController _window](self, "_window")), "statusBarStyle");
      if (objc_msgSend(__UIStatusBarManagerForWindow(-[UINavigationController _window](self, "_window")), "isStatusBarHidden"))int v6 = -1; {
      else
      }
        int v6 = v5;
      self->_previousStatusBarStyle = v6;
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)UIVideoEditorController;
  [(UINavigationController *)&v7 viewWillAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (([(id)UIApp _viewControllerBasedStatusBarAppearance] & 1) == 0)
  {
    int v5 = [(UINavigationController *)self viewControllers];
    if (![(UIViewController *)self presentedViewController]
      && [(NSArray *)v5 count] >= 2)
    {
      *(unsigned char *)&self->_flags |= 4u;
      uint64_t v6 = objc_msgSend(__UIStatusBarManagerForWindow(-[UINavigationController _window](self, "_window")), "statusBarStyle");
      uint64_t v7 = objc_msgSend(-[NSArray lastObject](v5, "lastObject"), "_imagePickerStatusBarStyle");
      uint64_t previousStatusBarStyle = self->_previousStatusBarStyle;
      BOOL v9 = previousStatusBarStyle != -1 && v6 == v7;
      if (v9 && v6 != previousStatusBarStyle)
      {
        if (v3)
        {
          +[UITransitionView defaultDurationForTransition:2];
          *(float *)&double v11 = v11;
          double v12 = *(float *)&v11;
          uint64_t previousStatusBarStyle = self->_previousStatusBarStyle;
        }
        else
        {
          double v12 = 0.0;
        }
        [(id)UIApp setStatusBarStyle:previousStatusBarStyle duration:v12];
      }
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)UIVideoEditorController;
  [(UINavigationController *)&v13 viewWillDisappear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(UIViewController *)self parentViewController]
    && ![(UIViewController *)self presentingViewController])
  {
    *(unsigned char *)&self->_flags &= ~1u;
    [(UIVideoEditorController *)self _removeAllChildren];
  }
  *(unsigned char *)&self->_flags &= ~4u;
  v5.receiver = self;
  v5.super_class = (Class)UIVideoEditorController;
  [(UINavigationController *)&v5 viewDidDisappear:v3];
}

- (BOOL)_didRevertStatusBar
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (BOOL)_isSupportedInterfaceOrientation:(int64_t)a3
{
  return a3 == 1;
}

- (void)_removeAllChildren
{
  if ([(UINavigationController *)self topViewController])
  {
    if ([(UIViewController *)self presentedViewController])
    {
      *(unsigned char *)&self->_flags |= 2u;
      [(UIViewController *)self dismissViewControllerAnimated:0 completion:0];
      *(unsigned char *)&self->_flags &= ~2u;
    }
    [(UINavigationController *)self setViewControllers:MEMORY[0x1E4F1CBF0]];
    BOOL v3 = [(UIViewController *)self view];
    [(UIView *)v3 layoutSubviews];
  }
}

- (id)_createInitialController
{
  BOOL v3 = objc_msgSend(objc_alloc(NSClassFromString(&cfstr_Pluieditvideov.isa)), "initWithProperties:", -[UIVideoEditorController _properties](self, "_properties"));
  [v3 setDelegate:self];
  return v3;
}

- (void)_setupControllers
{
  id v3 = [(UIVideoEditorController *)self _createInitialController];
  if (v3)
  {
    id v4 = v3;
    [(UIVideoEditorController *)self _removeAllChildren];
    -[UINavigationController setNavigationBarHidden:animated:](self, "setNavigationBarHidden:animated:", [v4 _displaysFullScreen], 0);
    [(UINavigationController *)self pushViewController:v4 animated:0];
  }
}

- (void)_autoDismiss
{
  v2 = [(UIViewController *)self presentingViewController];
  [(UIViewController *)v2 dismissViewControllerAnimated:1 completion:0];
}

- (void)editVideoViewControllerDidCancel:(id)a3
{
  [(UINavigationController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(UINavigationController *)self delegate];
    [v4 videoEditorControllerDidCancel:self];
  }
  else
  {
    [(UIVideoEditorController *)self _autoDismiss];
  }
}

- (void)editVideoViewController:(id)a3 didTrimVideoWithOptions:(id)a4
{
  uint64_t v7 = (void *)[a4 objectForKey:@"UIImagePickerControllerMediaURL"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v8 = [v7 isFileURL];
    if (v8)
    {
      uint64_t v9 = [v7 path];
      LOBYTE(v8) = 1;
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    objc_opt_class();
    LOBYTE(v8) = objc_opt_isKindOfClass();
    if (v8) {
      uint64_t v9 = (uint64_t)v7;
    }
    else {
      uint64_t v9 = 0;
    }
  }
  if (v7) {
    BOOL v10 = (v8 & (v9 == 0)) == 0;
  }
  else {
    BOOL v10 = 0;
  }
  if (!v10)
  {
LABEL_12:
    [(UIVideoEditorController *)self editVideoViewControllerDidCancel:a3];
    return;
  }
  [(UINavigationController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v11 = [(UINavigationController *)self delegate];
    [v11 videoEditorController:self didTrimVideoWithOptions:a4];
  }
  else
  {
    if (!v9) {
      goto LABEL_12;
    }
    [(UINavigationController *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      id v12 = [(UINavigationController *)self delegate];
      [v12 videoEditorController:self didSaveEditedVideoToPath:v9];
    }
    else
    {
      [(UIVideoEditorController *)self _autoDismiss];
    }
  }
}

- (void)editVideoViewController:(id)a3 didFailWithError:(id)a4
{
  [(UINavigationController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v6 = [(UINavigationController *)self delegate];
    [v6 videoEditorController:self didFailWithError:a4];
  }
  else
  {
    [(UIVideoEditorController *)self _autoDismiss];
  }
}

- (NSString)videoPath
{
  id v3 = [(UIVideoEditorController *)self _videoURL];
  if (![v3 isFileURL] || (result = (NSString *)objc_msgSend(v3, "path")) == 0)
  {
    return (NSString *)[(UIVideoEditorController *)self _valueForProperty:@"_UIVideoEditorControllerVideoPath"];
  }
  return result;
}

- (void)setVideoPath:(NSString *)videoPath
{
  -[UIVideoEditorController _setVideoURL:](self, "_setVideoURL:", [MEMORY[0x1E4F1CB10] fileURLWithPath:videoPath isDirectory:0]);
  [(UIVideoEditorController *)self _setValue:videoPath forProperty:@"_UIVideoEditorControllerVideoPath"];
}

- (id)_videoURL
{
  return [(UIVideoEditorController *)self _valueForProperty:@"_UIVideoEditorControllerVideoURL"];
}

- (void)_setVideoURL:(id)a3
{
}

- (NSTimeInterval)videoMaximumDuration
{
  id v2 = [(UIVideoEditorController *)self _valueForProperty:@"UIImagePickerControllerVideoMaximumDuration"];
  [v2 doubleValue];
  return result;
}

- (void)setVideoMaximumDuration:(NSTimeInterval)videoMaximumDuration
{
  uint64_t v4 = [NSNumber numberWithDouble:videoMaximumDuration];
  [(UIVideoEditorController *)self _setValue:v4 forProperty:@"UIImagePickerControllerVideoMaximumDuration"];
}

- (UIImagePickerControllerQualityType)videoQuality
{
  return (uint64_t)(int)objc_msgSend(-[UIVideoEditorController _valueForProperty:](self, "_valueForProperty:", @"UIImagePickerControllerVideoQuality"), "intValue");
}

- (void)setVideoQuality:(UIImagePickerControllerQualityType)videoQuality
{
  uint64_t v4 = [NSNumber numberWithInt:videoQuality];
  [(UIVideoEditorController *)self _setValue:v4 forProperty:@"UIImagePickerControllerVideoQuality"];
}

- (void)_setProperties:(id)a3
{
  properties = self->_properties;
  if (properties != a3)
  {

    self->_properties = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:a3];
  }
}

- (void)_initializeProperties
{
  if (!self->_properties)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1CA60]);
    uint64_t v4 = *MEMORY[0x1E4F1CFC8];
    uint64_t v5 = [NSNumber numberWithInt:1];
    self->_properties = (NSMutableDictionary *)objc_msgSend(v3, "initWithObjectsAndKeys:", v4, @"UIImagePickerControllerAllowsEditing", v5, @"UIImagePickerControllerVideoQuality", objc_msgSend(NSNumber, "numberWithDouble:", 600.0), @"UIImagePickerControllerVideoMaximumDuration", 0);
  }
}

- (id)_properties
{
  properties = self->_properties;
  if (!properties)
  {
    [(UIVideoEditorController *)self _initializeProperties];
    properties = self->_properties;
  }
  uint64_t v4 = (void *)[(NSMutableDictionary *)properties copy];
  return v4;
}

- (void)_setValue:(id)a3 forProperty:(id)a4
{
  properties = self->_properties;
  if (properties)
  {
    if (a3)
    {
LABEL_3:
      [(NSMutableDictionary *)properties setObject:a3 forKey:a4];
      return;
    }
  }
  else
  {
    [(UIVideoEditorController *)self _initializeProperties];
    properties = self->_properties;
    if (a3) {
      goto LABEL_3;
    }
  }
  [(NSMutableDictionary *)properties removeObjectForKey:a4];
}

- (id)_valueForProperty:(id)a3
{
  properties = self->_properties;
  if (!properties)
  {
    [(UIVideoEditorController *)self _initializeProperties];
    properties = self->_properties;
  }
  return (id)[(NSMutableDictionary *)properties objectForKey:a3];
}

@end