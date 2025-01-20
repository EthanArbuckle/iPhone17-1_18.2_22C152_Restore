@interface COSProfileInstallHelper
- (COSProfileInstallHelper)init;
- (COSProfileTargetDeviceListViewController)deviceSelectorController;
- (NRDevice)currentActiveDevice;
- (UIViewController)presentFromController;
- (id)_lastActiveTraditionallyPairedDevices;
- (id)completionBlock;
- (void)_didEnterBackground:(id)a3;
- (void)selectDeviceIfNecessaryWithCompletionBlock:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setCurrentActiveDevice:(id)a3;
- (void)setDeviceSelectorController:(id)a3;
- (void)setPresentFromController:(id)a3;
@end

@implementation COSProfileInstallHelper

- (COSProfileInstallHelper)init
{
  v5.receiver = self;
  v5.super_class = (Class)COSProfileInstallHelper;
  v2 = [(COSProfileInstallHelper *)&v5 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"_didEnterBackground:" name:UIApplicationDidEnterBackgroundNotification object:0];
  }
  return v2;
}

- (void)selectDeviceIfNecessaryWithCompletionBlock:(id)a3
{
  v4 = (void (**)(id, uint64_t))a3;
  objc_super v5 = pbb_bridge_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[COSProfileInstallHelper selectDeviceIfNecessaryWithCompletionBlock:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v6 = [(COSProfileInstallHelper *)self _lastActiveTraditionallyPairedDevices];
  currentActiveDevice = self->_currentActiveDevice;
  self->_currentActiveDevice = v6;

  v8 = sub_100033778();
  v9 = pbb_bridge_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_currentActiveDevice) {
      CFStringRef v10 = @"YES";
    }
    else {
      CFStringRef v10 = @"NO";
    }
    id v11 = [v8 count];
    *(_DWORD *)buf = 136315650;
    v18 = "-[COSProfileInstallHelper selectDeviceIfNecessaryWithCompletionBlock:]";
    __int16 v19 = 2114;
    CFStringRef v20 = v10;
    __int16 v21 = 2050;
    id v22 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: hasActiveDevice %{public}@; numberOfSatelliteDevices %{public}lu",
      buf,
      0x20u);
  }

  if ([v8 count])
  {
    [(COSProfileInstallHelper *)self setCompletionBlock:v4];
    objc_initWeak((id *)buf, self);
    v12 = [[COSProfileTargetDeviceListViewController alloc] initWithActiveDevice:self->_currentActiveDevice otherDevices:v8];
    deviceSelectorController = self->_deviceSelectorController;
    self->_deviceSelectorController = v12;

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000A3508;
    v15[3] = &unk_100243810;
    objc_copyWeak(&v16, (id *)buf);
    [(COSProfileTargetDeviceListViewController *)self->_deviceSelectorController setCompletionBlock:v15];
    v14 = [[COSNavigationController alloc] initWithRootViewController:self->_deviceSelectorController];
    [(UIViewController *)self->_presentFromController presentViewController:v14 animated:1 completion:0];

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v4[2](v4, 1);
  }
}

- (id)_lastActiveTraditionallyPairedDevices
{
  v2 = sub_100005DC4();
  v3 = [v2 sortedArrayUsingComparator:&stru_100245CB8];

  v4 = [v3 lastObject];

  return v4;
}

- (void)_didEnterBackground:(id)a3
{
  v4 = [(COSProfileInstallHelper *)self deviceSelectorController];

  if (v4)
  {
    objc_super v5 = pbb_bridge_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Dismissing profile device selector because Bridge was backgrounded.", v7, 2u);
    }

    v6 = [(COSProfileInstallHelper *)self deviceSelectorController];
    [v6 dismissViewControllerAnimated:1 completion:0];

    [(COSProfileInstallHelper *)self setDeviceSelectorController:0];
    [(COSProfileInstallHelper *)self setCompletionBlock:0];
  }
}

- (UIViewController)presentFromController
{
  return (UIViewController *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPresentFromController:(id)a3
{
}

- (id)completionBlock
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setCompletionBlock:(id)a3
{
}

- (NRDevice)currentActiveDevice
{
  return (NRDevice *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCurrentActiveDevice:(id)a3
{
}

- (COSProfileTargetDeviceListViewController)deviceSelectorController
{
  return (COSProfileTargetDeviceListViewController *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDeviceSelectorController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceSelectorController, 0);
  objc_storeStrong((id *)&self->_currentActiveDevice, 0);
  objc_storeStrong(&self->_completionBlock, 0);

  objc_storeStrong((id *)&self->_presentFromController, 0);
}

@end