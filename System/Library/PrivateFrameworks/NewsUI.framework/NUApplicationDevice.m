@interface NUApplicationDevice
- (BOOL)isSplitScreen;
- (NUApplicationDevice)initWithApplication:(id)a3 screen:(id)a4;
- (UIApplication)application;
- (UIScreen)screen;
@end

@implementation NUApplicationDevice

- (NUApplicationDevice)initWithApplication:(id)a3 screen:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NUApplicationDevice;
  v9 = [(NUApplicationDevice *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_application, a3);
    objc_storeStrong((id *)&v10->_screen, a4);
  }

  return v10;
}

- (BOOL)isSplitScreen
{
  v3 = [(NUApplicationDevice *)self application];
  v4 = [v3 keyWindow];
  [v4 frame];
  double Width = CGRectGetWidth(v9);
  v6 = [(NUApplicationDevice *)self screen];
  [v6 bounds];
  BOOL v7 = Width != CGRectGetWidth(v10);

  return v7;
}

- (UIApplication)application
{
  return self->_application;
}

- (UIScreen)screen
{
  return self->_screen;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screen, 0);

  objc_storeStrong((id *)&self->_application, 0);
}

@end