@interface COSGizmoOrientationController
+ (id)wristChoice;
- (COSGizmoOrientationController)init;
- (NPSDomainAccessor)domainAccessor;
- (NPSManager)syncManager;
- (id)specifiers;
- (void)dealloc;
- (void)handleDidUnpair;
- (void)setDomainAccessor:(id)a3;
- (void)setSyncManager:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation COSGizmoOrientationController

- (COSGizmoOrientationController)init
{
  v8.receiver = self;
  v8.super_class = (Class)COSGizmoOrientationController;
  v2 = [(COSGizmoOrientationController *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    syncManager = v2->_syncManager;
    v2->_syncManager = (NPSManager *)v3;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_10004D234, @"NanoOrientationSettingChangedNotification", 0, (CFNotificationSuspensionBehavior)0);
    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v2 selector:"handleDidUnpair" name:NRPairedDeviceRegistryDeviceDidUnpairNotification object:0];
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:NRPairedDeviceRegistryDeviceDidUnpairNotification object:0];

  v5.receiver = self;
  v5.super_class = (Class)COSGizmoOrientationController;
  [(COSGizmoOrientationController *)&v5 dealloc];
}

- (NPSDomainAccessor)domainAccessor
{
  domainAccessor = self->_domainAccessor;
  if (!domainAccessor)
  {
    v4 = (NPSDomainAccessor *)[objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.nano"];
    objc_super v5 = self->_domainAccessor;
    self->_domainAccessor = v4;

    domainAccessor = self->_domainAccessor;
  }

  return domainAccessor;
}

- (void)handleDidUnpair
{
  domainAccessor = self->_domainAccessor;
  self->_domainAccessor = 0;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->BPSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    objc_super v5 = [(COSGizmoOrientationController *)self loadSpecifiersFromPlistName:@"GizmoOrientation" target:self];
    v6 = [(COSGizmoOrientationController *)self domainAccessor];
    id v7 = [v6 synchronize];
    unsigned int v8 = [v6 BOOLForKey:@"wornOnRightArm"];
    v9 = [v5 specifierForID:@"WRIST_CHOICE_ID"];
    if (v8) {
      CFStringRef v10 = @"RIGHT_HAND_ID";
    }
    else {
      CFStringRef v10 = @"LEFT_HAND_ID";
    }
    v11 = [v5 specifierForID:v10];
    uint64_t v12 = PSRadioGroupCheckedSpecifierKey;
    [v9 setProperty:v11 forKey:PSRadioGroupCheckedSpecifierKey];
    unsigned int v13 = [v6 BOOLForKey:@"invertUI"];
    v14 = [v5 specifierForID:@"ORIENTATION_CHOICE_ID"];
    if (v13) {
      CFStringRef v15 = @"LISA_ON_LEFT_ID";
    }
    else {
      CFStringRef v15 = @"LISA_ON_RIGHT_ID";
    }
    v16 = [v5 specifierForID:v15];
    [v14 setProperty:v16 forKey:v12];
    if (+[HKHeartRhythmAvailability isElectrocardiogramSupportedOnAnyWatch])
    {
      v17 = +[NSBundle bundleForClass:objc_opt_class()];
      v18 = [v17 localizedStringForKey:@"WRIST_CINNAMON_FOOTER" value:&stru_100249230 table:@"WatchOrientation-cinnamon"];
      [v14 setProperty:v18 forKey:PSFooterTextGroupKey];
    }
    v19 = *(void **)&self->BPSListController_opaque[v3];
    *(void *)&self->BPSListController_opaque[v3] = v5;

    v4 = *(void **)&self->BPSListController_opaque[v3];
  }

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(COSGizmoOrientationController *)self indexForIndexPath:v6];
  v9 = [*(id *)&self->BPSListController_opaque[OBJC_IVAR___PSListController__specifiers] objectAtIndex:v8];
  CFStringRef v10 = [(COSGizmoOrientationController *)self domainAccessor];
  v11 = [v9 identifier];
  unsigned int v12 = [v11 isEqualToString:@"LEFT_HAND_ID"];

  if (v12)
  {
    CFStringRef v13 = @"wornOnRightArm";
    [v10 setBool:0 forKey:@"wornOnRightArm"];
    uint64_t v14 = 1;
LABEL_5:
    +[PBBridgeCAReporter recordUserInitiatedDeviceWristChange:v14];
LABEL_11:
    id v22 = [v10 synchronize];
    syncManager = self->_syncManager;
    CFStringRef v29 = v13;
    v24 = +[NSArray arrayWithObjects:&v29 count:1];
    v25 = +[NSSet setWithArray:v24];
    [(NPSManager *)syncManager synchronizeNanoDomain:@"com.apple.nano" keys:v25];

    goto LABEL_12;
  }
  CFStringRef v15 = [v9 identifier];
  unsigned int v16 = [v15 isEqualToString:@"RIGHT_HAND_ID"];

  if (v16)
  {
    CFStringRef v13 = @"wornOnRightArm";
    [v10 setBool:1 forKey:@"wornOnRightArm"];
    uint64_t v14 = 2;
    goto LABEL_5;
  }
  v17 = [v9 identifier];
  unsigned int v18 = [v17 isEqualToString:@"LISA_ON_LEFT_ID"];

  if (v18)
  {
    CFStringRef v13 = @"invertUI";
    [v10 setBool:1 forKey:@"invertUI"];
    uint64_t v19 = 2;
LABEL_10:
    +[PBBridgeCAReporter recordUserInitiatedDeviceOrientationChange:v19];
    goto LABEL_11;
  }
  v20 = [v9 identifier];
  unsigned int v21 = [v20 isEqualToString:@"LISA_ON_RIGHT_ID"];

  if (v21)
  {
    CFStringRef v13 = @"invertUI";
    [v10 setBool:0 forKey:@"invertUI"];
    uint64_t v19 = 1;
    goto LABEL_10;
  }
LABEL_12:
  [(COSGizmoOrientationController *)self reloadSpecifiers];
  id WeakRetained = objc_loadWeakRetained((id *)&self->BPSListController_opaque[OBJC_IVAR___PSViewController__parentController]);
  v27 = [(COSGizmoOrientationController *)self specifier];
  [WeakRetained reloadSpecifier:v27];

  v28.receiver = self;
  v28.super_class = (Class)COSGizmoOrientationController;
  [(COSGizmoOrientationController *)&v28 tableView:v7 didSelectRowAtIndexPath:v6];
}

+ (id)wristChoice
{
  id v2 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.nano"];
  id v3 = [v2 synchronize];
  unsigned int v4 = [v2 BOOLForKey:@"wornOnRightArm"];
  objc_super v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v6 = v5;
  if (v4) {
    CFStringRef v7 = @"RIGHT_HAND";
  }
  else {
    CFStringRef v7 = @"LEFT_HAND";
  }
  id v8 = [v5 localizedStringForKey:v7 value:&stru_100249230 table:@"GizmoOrientation"];

  return v8;
}

- (void)setDomainAccessor:(id)a3
{
}

- (NPSManager)syncManager
{
  return self->_syncManager;
}

- (void)setSyncManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncManager, 0);

  objc_storeStrong((id *)&self->_domainAccessor, 0);
}

@end