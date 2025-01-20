@interface COSTinkerAppStoreAuthHelperContext
- (ACAccount)satelliteAppStoreAccount;
- (AKDevice)satelliteAKDevice;
- (UIViewController)presentingViewController;
- (void)setPresentingViewController:(id)a3;
- (void)setSatelliteAKDevice:(id)a3;
- (void)setSatelliteAppStoreAccount:(id)a3;
@end

@implementation COSTinkerAppStoreAuthHelperContext

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (ACAccount)satelliteAppStoreAccount
{
  return self->_satelliteAppStoreAccount;
}

- (void)setSatelliteAppStoreAccount:(id)a3
{
}

- (AKDevice)satelliteAKDevice
{
  return self->_satelliteAKDevice;
}

- (void)setSatelliteAKDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_satelliteAKDevice, 0);
  objc_storeStrong((id *)&self->_satelliteAppStoreAccount, 0);

  objc_destroyWeak((id *)&self->_presentingViewController);
}

@end