@interface STSetupAssistantPosedDeviceViewController
- (BOOL)_isRTL;
- (BOOL)isiPad;
- (STSetupAssistantPosedDeviceViewController)initWithCoder:(id)a3;
- (STSetupAssistantPosedDeviceViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIImageView)deviceWithScreenImageView;
- (id)_deviceWithScreenImage;
- (id)_setupGenericImage;
- (int64_t)deviceSize;
- (void)_stSetupAssistantPosedDeviceViewControllerCommonInit;
- (void)setDeviceWithScreenImageView:(id)a3;
- (void)viewDidLoad;
@end

@implementation STSetupAssistantPosedDeviceViewController

- (STSetupAssistantPosedDeviceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)STSetupAssistantPosedDeviceViewController;
  v4 = [(STSetupAssistantPosedDeviceViewController *)&v6 initWithNibName:a3 bundle:a4];
  [(STSetupAssistantPosedDeviceViewController *)v4 _stSetupAssistantPosedDeviceViewControllerCommonInit];
  return v4;
}

- (STSetupAssistantPosedDeviceViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STSetupAssistantPosedDeviceViewController;
  v3 = [(STSetupAssistantPosedDeviceViewController *)&v5 initWithCoder:a3];
  [(STSetupAssistantPosedDeviceViewController *)v3 _stSetupAssistantPosedDeviceViewControllerCommonInit];
  return v3;
}

- (void)_stSetupAssistantPosedDeviceViewControllerCommonInit
{
  CFStringRef v3 = (const __CFString *)MGGetStringAnswer();
  self->_isiPad = CFEqual(v3, @"iPad");
  if (v3) {
    CFRelease(v3);
  }
  int v4 = MGGetSInt32Answer();
  self->_deviceSize = 0;
  int64_t v5 = 1;
  switch(v4)
  {
    case 9:
      goto LABEL_10;
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 16:
    case 17:
      goto LABEL_11;
    case 15:
      int64_t v5 = 3;
      goto LABEL_10;
    case 18:
      int64_t v5 = 4;
      goto LABEL_10;
    case 19:
      int64_t v5 = 5;
      goto LABEL_10;
    case 20:
      int64_t v5 = 6;
      goto LABEL_10;
    default:
      if (v4 != 5) {
        goto LABEL_11;
      }
      int64_t v5 = 2;
LABEL_10:
      self->_deviceSize = v5;
LABEL_11:
      int64_t v6 = 6;
      uint64_t v7 = MGGetProductType();
      if (v7 <= 2080700390)
      {
        if (v7 <= 1371389548)
        {
          if (v7 == 341800273) {
            goto LABEL_27;
          }
          uint64_t v8 = 1353145733;
          goto LABEL_21;
        }
        if (v7 != 1371389549)
        {
          uint64_t v8 = 2001966017;
LABEL_21:
          if (v7 != v8) {
            return;
          }
          goto LABEL_27;
        }
        goto LABEL_25;
      }
      if (v7 <= 3599094682)
      {
        if (v7 == 2080700391)
        {
          int64_t v6 = 7;
          goto LABEL_27;
        }
        if (v7 != 2722529672) {
          return;
        }
LABEL_25:
        int64_t v6 = 8;
        goto LABEL_27;
      }
      if (v7 != 3599094683 && v7 != 3801472101)
      {
        uint64_t v8 = 3863625342;
        goto LABEL_21;
      }
LABEL_27:
      self->_deviceSize = v6;
      return;
  }
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)STSetupAssistantPosedDeviceViewController;
  [(STSetupAssistantPosedDeviceViewController *)&v6 viewDidLoad];
  CFStringRef v3 = [(STSetupAssistantPosedDeviceViewController *)self _deviceWithScreenImage];
  int v4 = [(STSetupAssistantPosedDeviceViewController *)self deviceWithScreenImageView];
  [v4 setImage:v3];

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int64_t v5 = 0;
    _os_log_impl(&dword_225B06000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "STUI:: STSetupAssistantPosedDeviceViewController.viewDidLoad", v5, 2u);
  }
}

- (id)_deviceWithScreenImage
{
  v2 = (void *)MEMORY[0x263F827E8];
  CFStringRef v3 = [(STSetupAssistantPosedDeviceViewController *)self _setupGenericImage];
  int v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int64_t v5 = [v2 imageNamed:v3 inBundle:v4];

  return v5;
}

- (id)_setupGenericImage
{
  BOOL v3 = [(STSetupAssistantPosedDeviceViewController *)self isiPad];
  int64_t v4 = [(STSetupAssistantPosedDeviceViewController *)self deviceSize];
  if (v3)
  {
    if (v4 == 6) {
      return @"Setup Image Ipad Pro";
    }
    else {
      return @"Setup Image Ipad";
    }
  }
  else if ((unint64_t)(v4 - 1) > 7)
  {
    return @"Setup Image Iphone 7";
  }
  else
  {
    return off_264768460[v4 - 1];
  }
}

- (BOOL)_isRTL
{
  v2 = (void *)MEMORY[0x263F82E00];
  BOOL v3 = [(STSetupAssistantPosedDeviceViewController *)self view];
  LOBYTE(v2) = objc_msgSend(v2, "userInterfaceLayoutDirectionForSemanticContentAttribute:", objc_msgSend(v3, "semanticContentAttribute")) == 1;

  return (char)v2;
}

- (BOOL)isiPad
{
  return self->_isiPad;
}

- (int64_t)deviceSize
{
  return self->_deviceSize;
}

- (UIImageView)deviceWithScreenImageView
{
  return (UIImageView *)objc_getProperty(self, a2, 992, 1);
}

- (void)setDeviceWithScreenImageView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end