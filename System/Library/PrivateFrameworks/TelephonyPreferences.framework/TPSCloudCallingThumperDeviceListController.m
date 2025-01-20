@interface TPSCloudCallingThumperDeviceListController
- (TPSCloudCallingThumperController)thumperController;
- (TPSCloudCallingThumperDeviceListController)init;
- (TPSCloudCallingThumperProvisioningURLController)provisioningURLController;
- (id)isDeviceSwitchOn:(id)a3;
- (id)isMainSwitchOn:(id)a3;
- (void)didChangeThumperCallingCapabilitiesForSenderIdentityWithUUID:(id)a3;
- (void)didChangeThumperCallingProvisionalURLForSenderIdentityWithUUID:(id)a3;
- (void)setDeviceSwitchOn:(id)a3 specifier:(id)a4;
- (void)setMainSwitchOn:(id)a3 specifier:(id)a4;
@end

@implementation TPSCloudCallingThumperDeviceListController

- (TPSCloudCallingThumperDeviceListController)init
{
  v4.receiver = self;
  v4.super_class = (Class)TPSCloudCallingThumperDeviceListController;
  v2 = [(TPSCloudCallingDeviceListController *)&v4 init];
  if (v2) {
    [MEMORY[0x1E4FADA88] addDelegate:v2 queue:MEMORY[0x1E4F14428]];
  }
  return v2;
}

- (TPSCloudCallingThumperProvisioningURLController)provisioningURLController
{
  provisioningURLController = self->_provisioningURLController;
  if (!provisioningURLController)
  {
    objc_super v4 = [TPSCloudCallingThumperProvisioningURLController alloc];
    v5 = [(TPSListController *)self subscriptionContext];
    v6 = [(TPSCloudCallingThumperProvisioningURLController *)v4 initWithSubscriptionContext:v5];
    v7 = self->_provisioningURLController;
    self->_provisioningURLController = v6;

    [(TPSCloudCallingURLController *)self->_provisioningURLController setDelegate:self];
    provisioningURLController = self->_provisioningURLController;
  }
  return provisioningURLController;
}

- (TPSCloudCallingThumperController)thumperController
{
  thumperController = self->_thumperController;
  if (!thumperController)
  {
    objc_super v4 = [TPSCloudCallingThumperController alloc];
    v5 = [(TPSListController *)self subscriptionContext];
    v6 = [(TPSCloudCallingThumperController *)v4 initWithSubscriptionContext:v5];
    v7 = self->_thumperController;
    self->_thumperController = v6;

    thumperController = self->_thumperController;
  }
  return thumperController;
}

- (id)isDeviceSwitchOn:(id)a3
{
  objc_super v4 = NSNumber;
  id v5 = a3;
  v6 = [(TPSCloudCallingThumperDeviceListController *)self thumperController];
  v7 = [v6 subscriptionCapabilities];
  v8 = [v5 identifier];

  v9 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(v7, "isThumperCallingAllowedOnSecondaryDeviceWithID:", v8));

  return v9;
}

- (void)setDeviceSwitchOn:(id)a3 specifier:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)TPSCloudCallingThumperDeviceListController;
  id v6 = a4;
  id v7 = a3;
  [(TPSCloudCallingDeviceListController *)&v14 setDeviceSwitchOn:v7 specifier:v6];
  v8 = objc_msgSend(v6, "identifier", v14.receiver, v14.super_class);

  int v9 = [v7 BOOLValue];
  v10 = TPSLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = @"Deactivating";
    if (v9) {
      v11 = @"Activating";
    }
    *(_DWORD *)buf = 138412546;
    v16 = v11;
    __int16 v17 = 2112;
    v18 = v8;
    _os_log_impl(&dword_1E4DD4000, v10, OS_LOG_TYPE_DEFAULT, "%@ Thumper for secondary device with identifier %@", buf, 0x16u);
  }

  if ((v9 & 1) == 0)
  {
    v12 = [(TPSCloudCallingThumperDeviceListController *)self thumperController];
    v13 = [v12 subscriptionCapabilities];
    [v13 setThumperCallingAllowed:0 onSecondaryDeviceWithID:v8];
  }
}

- (id)isMainSwitchOn:(id)a3
{
  v3 = NSNumber;
  objc_super v4 = [(TPSCloudCallingThumperDeviceListController *)self thumperController];
  id v5 = [v4 subscriptionCapabilities];
  id v6 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v5, "isThumperCallingEnabled"));

  return v6;
}

- (void)setMainSwitchOn:(id)a3 specifier:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)TPSCloudCallingThumperDeviceListController;
  id v6 = a3;
  [(TPSCloudCallingDeviceListController *)&v17 setMainSwitchOn:v6 specifier:a4];
  int v7 = objc_msgSend(v6, "BOOLValue", v17.receiver, v17.super_class);

  v8 = TPSLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (v7) {
      int v9 = @"Enabling";
    }
    else {
      int v9 = @"Disabling";
    }
    v10 = [(TPSListController *)self subscriptionContext];
    *(_DWORD *)buf = 138412546;
    uint64_t v19 = v9;
    __int16 v20 = 2112;
    v21 = v10;
    _os_log_impl(&dword_1E4DD4000, v8, OS_LOG_TYPE_DEFAULT, "%@ Thumper for subscription context %@", buf, 0x16u);
  }
  if (v7)
  {
    v11 = [(TPSCloudCallingThumperDeviceListController *)self provisioningURLController];
    int v12 = [v11 shouldEnableCapability];

    if (v12)
    {
      v13 = TPSLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E4DD4000, v13, OS_LOG_TYPE_DEFAULT, "Thumper capability should be enabled, so enabling it directly now", buf, 2u);
      }

      objc_super v14 = [(TPSCloudCallingThumperDeviceListController *)self provisioningURLController];
      [v14 enableCapability];
    }
    else
    {
      [MEMORY[0x1E4FADA88] invalidateAndRefreshThumperCallingProvisioningURL];
      objc_super v14 = [(TPSCloudCallingThumperDeviceListController *)self provisioningURLController];
      v16 = [v14 provisionCapabilityController];
      [(TPSCloudCallingListController *)self presentOrUpdateViewController:v16];
    }
  }
  else
  {
    objc_super v14 = [(TPSCloudCallingThumperDeviceListController *)self thumperController];
    v15 = [v14 subscriptionCapabilities];
    [v15 setThumperCallingEnabled:0];
  }
}

- (void)didChangeThumperCallingCapabilitiesForSenderIdentityWithUUID:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(TPSListController *)self subscriptionContext];
  id v6 = [v5 uuid];
  int v7 = [v4 isEqual:v6];

  if (v7)
  {
    v8 = TPSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_1E4DD4000, v8, OS_LOG_TYPE_DEFAULT, "Thumper calling cabilities changed for subscription context %@.", (uint8_t *)&v9, 0xCu);
    }

    [(TPSCloudCallingThumperDeviceListController *)self reloadSpecifiers];
  }
}

- (void)didChangeThumperCallingProvisionalURLForSenderIdentityWithUUID:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(TPSListController *)self subscriptionContext];
  id v6 = [v5 uuid];
  int v7 = [v4 isEqual:v6];

  if (v7)
  {
    v8 = TPSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      v16 = v5;
      _os_log_impl(&dword_1E4DD4000, v8, OS_LOG_TYPE_DEFAULT, "Thumper calling provisioning URL changed for subscription context %@.", (uint8_t *)&v15, 0xCu);
    }

    int v9 = [(TPSCloudCallingThumperDeviceListController *)self presentedViewController];

    if (v9)
    {
      v10 = [(TPSCloudCallingThumperDeviceListController *)self thumperController];
      uint64_t v11 = [v10 subscriptionCapabilities];

      if (![v11 thumperCallingProvisioningStatus])
      {
        int v12 = TPSLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v15) = 0;
          _os_log_impl(&dword_1E4DD4000, v12, OS_LOG_TYPE_DEFAULT, "We have a presented view controller and Thumper provisioning status is not-allowed, updating the presented controller", (uint8_t *)&v15, 2u);
        }

        v13 = [(TPSCloudCallingThumperDeviceListController *)self provisioningURLController];
        objc_super v14 = [v13 provisionCapabilityController];
        [(TPSCloudCallingListController *)self presentOrUpdateViewController:v14];
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumperController, 0);
  objc_storeStrong((id *)&self->_provisioningURLController, 0);
}

@end