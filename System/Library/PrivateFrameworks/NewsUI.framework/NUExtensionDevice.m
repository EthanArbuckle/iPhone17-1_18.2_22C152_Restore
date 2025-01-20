@interface NUExtensionDevice
- (BOOL)isSplitScreen;
- (NUExtensionDevice)initWithScreen:(id)a3 hostViewController:(id)a4;
- (UIScreen)screen;
- (UIViewController)hostViewController;
@end

@implementation NUExtensionDevice

- (NUExtensionDevice)initWithScreen:(id)a3 hostViewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NUExtensionDevice;
  v9 = [(NUExtensionDevice *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_screen, a3);
    objc_storeWeak((id *)&v10->_hostViewController, v8);
  }

  return v10;
}

- (BOOL)isSplitScreen
{
  v3 = [(NUExtensionDevice *)self hostViewController];
  v4 = [v3 view];
  v5 = [v4 window];
  [v5 frame];
  double Width = CGRectGetWidth(v10);
  id v7 = [(NUExtensionDevice *)self screen];
  [v7 bounds];
  BOOL v8 = Width != CGRectGetWidth(v11);

  return v8;
}

- (UIScreen)screen
{
  return self->_screen;
}

- (UIViewController)hostViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);

  return (UIViewController *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hostViewController);

  objc_storeStrong((id *)&self->_screen, 0);
}

@end