@interface COSTinkerHealthSharingSetupDelegate
- (BPSBuddyController)presentingController;
- (COSBuddyControllerDelegate)buddyControllerDelegate;
- (COSTinkerHealthSharingSetupDelegate)init;
- (FAFamilyMember)guardianMember;
- (FAFamilyMember)tinkerMember;
- (id)tinkerDevice;
- (void)setBuddyControllerDelegate:(id)a3;
- (void)setPresentingController:(id)a3;
- (void)sharingSetupDidFailWithError:(id)a3;
- (void)sharingSetupDidSucceed;
@end

@implementation COSTinkerHealthSharingSetupDelegate

- (id)tinkerDevice
{
  v0 = +[NRPairedDeviceRegistry sharedInstance];
  v1 = +[NRPairedDeviceRegistry activeDeviceSelectorBlock];
  v2 = [v0 getAllDevicesWithArchivedAltAccountDevicesMatching:v1];
  v3 = [v2 firstObject];

  v4 = [v3 valueForProperty:NRDevicePropertyIsArchived];
  if ([v4 BOOLValue]) {
    v5 = 0;
  }
  else {
    v5 = v3;
  }
  id v6 = v5;

  return v6;
}

- (COSTinkerHealthSharingSetupDelegate)init
{
  v5.receiver = self;
  v5.super_class = (Class)COSTinkerHealthSharingSetupDelegate;
  v2 = [(COSTinkerHealthSharingSetupDelegate *)&v5 init];
  if (v2)
  {
    v3 = [UIApp setupController];
    objc_storeWeak((id *)&v2->_setupController, v3);
  }
  return v2;
}

- (FAFamilyMember)tinkerMember
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupController);
  v3 = [WeakRetained tinkerFamilyMember];

  return (FAFamilyMember *)v3;
}

- (FAFamilyMember)guardianMember
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_setupController);
  v3 = [WeakRetained pairingParentFamilyMember];

  return (FAFamilyMember *)v3;
}

- (void)sharingSetupDidFailWithError:(id)a3
{
  v4 = +[NSBundle bundleWithIdentifier:@"com.apple.HealthUI"];
  id v12 = [v4 localizedStringForKey:@"TINKER_HEALTH_SETUP_FAILED_TITLE" value:&stru_100249230 table:@"HealthUI-Localizable-tinker"];

  objc_super v5 = +[NSBundle bundleWithIdentifier:@"com.apple.HealthUI"];
  id v6 = [v5 localizedStringForKey:@"TINKER_HEALTH_SETUP_FAILED_DEFAULT_MESSAGE" value:&stru_100249230 table:@"HealthUI-Localizable-tinker"];

  if (sub_100008380())
  {

    id v6 = @"Apple Internal: Health Sharing Setup failed. Please file a bug against HealthKit | All with a sysdiagnose from both the watch and phone. You can try to enable Health Sharing later.";
  }
  v7 = +[UIAlertController alertControllerWithTitle:v12 message:v6 preferredStyle:1];
  v8 = +[NSBundle bundleWithIdentifier:@"com.apple.HealthUI"];
  v9 = [v8 localizedStringForKey:@"DISMISS" value:&stru_100249230 table:@"HealthUI-Localizable-tinker"];
  v10 = +[UIAlertAction actionWithTitle:v9 style:0 handler:&stru_100243C20];
  [v7 addAction:v10];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingController);
  [WeakRetained presentViewController:v7 animated:1 completion:0];
}

- (void)sharingSetupDidSucceed
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_buddyControllerDelegate);
  id v3 = objc_loadWeakRetained((id *)&self->_presentingController);
  [WeakRetained buddyControllerDone:v3];
}

- (BPSBuddyController)presentingController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingController);

  return (BPSBuddyController *)WeakRetained;
}

- (void)setPresentingController:(id)a3
{
}

- (COSBuddyControllerDelegate)buddyControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_buddyControllerDelegate);

  return (COSBuddyControllerDelegate *)WeakRetained;
}

- (void)setBuddyControllerDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_buddyControllerDelegate);
  objc_destroyWeak((id *)&self->_presentingController);

  objc_destroyWeak((id *)&self->_setupController);
}

@end