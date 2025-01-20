@interface COSDisplayAndBrightnessController
- (COSDisplayAndBrightnessController)init;
- (NPSDomainAccessor)carouselDomainAccessor;
- (NPSManager)syncManager;
- (PSSpecifier)brightnessSlider;
- (id)activateOnCrownUpValue:(id)a3;
- (id)activateOnWristRaiseValue:(id)a3;
- (id)boldTextEnabled:(id)a3;
- (id)contentSizeCategories;
- (id)specifiers;
- (id)textSize:(id)a3;
- (id)tritiumEnabled:(id)a3;
- (void)_setupWakeSpecifiers:(id)a3;
- (void)_synchronizeDomainWithAccessor:(id)a3 keys:(id)a4 withCompletion:(id)a5;
- (void)dealloc;
- (void)handleDidUnpair;
- (void)setActivateOnCrownUpValue:(id)a3 specifier:(id)a4;
- (void)setActivateOnWristRaiseValue:(id)a3 specifier:(id)a4;
- (void)setBoldTextEnabled:(id)a3 specifier:(id)a4;
- (void)setBrightnessSlider:(id)a3;
- (void)setCarouselDomainAccessor:(id)a3;
- (void)setSyncManager:(id)a3;
- (void)setTextSize:(id)a3 specifier:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation COSDisplayAndBrightnessController

- (COSDisplayAndBrightnessController)init
{
  v18.receiver = self;
  v18.super_class = (Class)COSDisplayAndBrightnessController;
  v2 = [(COSDisplayAndBrightnessController *)&v18 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    syncManager = v2->_syncManager;
    v2->_syncManager = (NPSManager *)v3;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_1000C035C, @"NanoBrightnessCurveChangedNotification", 0, (CFNotificationSuspensionBehavior)0);
    v6 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v6, v2, (CFNotificationCallback)sub_1000C0364, @"NanoAccessibilityDefaultsChanged", 0, (CFNotificationSuspensionBehavior)0);
    v7 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v7, v2, (CFNotificationCallback)sub_1000C03C8, @"NanoPreferredContentSizeChangedNotification", 0, (CFNotificationSuspensionBehavior)0);
    v8 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v8, v2, (CFNotificationCallback)sub_1000C03D0, @"NanoAlwaysOnTimePreferencesChangedNotification", 0, (CFNotificationSuspensionBehavior)0);
    v9 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v9, v2, (CFNotificationCallback)sub_1000C03D8, @"com.apple.nano.disableViewOnWakePreferenceDidChangeNotification", 0, (CFNotificationSuspensionBehavior)0);
    v10 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v10, v2, (CFNotificationCallback)sub_1000C03D8, @"com.apple.Carousel.kDisallowWakeGestureSetting", 0, (CFNotificationSuspensionBehavior)0);
    v11 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v11, v2, (CFNotificationCallback)sub_1000C03D8, @"com.apple.Carousel.gizmoAutoScreenOffSecondsDidChange", 0, (CFNotificationSuspensionBehavior)0);
    v12 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v12, v2, (CFNotificationCallback)sub_1000C03D8, @"com.apple.Carousel.EnableRotateToWakeChangedNotification", 0, (CFNotificationSuspensionBehavior)0);
    v13 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v13, v2, (CFNotificationCallback)sub_1000C03D8, @"CSLSessionsSettingsChangedNotification", 0, (CFNotificationSuspensionBehavior)0);
    v14 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v14, v2, (CFNotificationCallback)sub_1000C03D8, @"CSLOnWakeTimeoutPreferenceChangedNotification", 0, (CFNotificationSuspensionBehavior)0);
    v15 = +[NSNotificationCenter defaultCenter];
    [v15 addObserver:v2 selector:"handleDidUnpair" name:NRPairedDeviceRegistryDeviceDidUnpairNotification object:0];

    v16 = [(COSDisplayAndBrightnessController *)v2 carouselDomainAccessor];
    [(COSDisplayAndBrightnessController *)v2 _synchronizeDomainWithAccessor:v16 keys:0 withCompletion:0];
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)COSDisplayAndBrightnessController;
  [(COSDisplayAndBrightnessController *)&v4 dealloc];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)COSDisplayAndBrightnessController;
  [(COSDisplayAndBrightnessController *)&v4 viewWillAppear:a3];
  [(COSDisplayAndBrightnessController *)self reloadSpecifierID:@"TRITIUM_ID"];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  objc_super v4 = *(void **)&self->BPSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = [(COSDisplayAndBrightnessController *)self loadSpecifiersFromPlistName:@"DisplayAndBrightness-tritium" target:self];
    v6 = [v5 specifierForID:@"BRIGHTNESS_LEVEL_ID"];
    brightnessSlider = self->_brightnessSlider;
    self->_brightnessSlider = v6;

    v8 = self->_brightnessSlider;
    v9 = BPSAccessoryHighlightColor();
    v10 = BPSTintedSymbol();
    uint64_t v11 = PSSliderLeftImageKey;
    [(PSSpecifier *)v8 setProperty:v10 forKey:PSSliderLeftImageKey];

    v12 = self->_brightnessSlider;
    v13 = BPSAccessoryHighlightColor();
    v14 = BPSTintedSymbol();
    uint64_t v15 = PSSliderRightImageKey;
    [(PSSpecifier *)v12 setProperty:v14 forKey:PSSliderRightImageKey];

    v16 = self->_brightnessSlider;
    int v17 = UITableViewDefaultRowHeight;
    LODWORD(v18) = UITableViewDefaultRowHeight;
    v19 = +[NSNumber numberWithFloat:v18];
    uint64_t v20 = PSTableCellHeightKey;
    [(PSSpecifier *)v16 setProperty:v19 forKey:PSTableCellHeightKey];

    v21 = [v5 specifierForID:@"TEXT_SIZE_SLIDER_ID"];
    v22 = [(COSDisplayAndBrightnessController *)self contentSizeCategories];
    v23 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)[v22 count] - 1);
    [v21 setProperty:v23 forKey:PSControlMaximumKey];

    v24 = BPSAccessoryHighlightColor();
    v25 = BPSTintedSymbol();
    [v21 setProperty:v25 forKey:v11];

    v26 = BPSAccessoryHighlightColor();
    uint64_t v27 = BPSTintedSymbol();
    [v21 setProperty:v27 forKey:v15];

    LODWORD(v28) = v17;
    v29 = +[NSNumber numberWithFloat:v28];
    [v21 setProperty:v29 forKey:v20];

    v30 = +[NRPairedDeviceRegistry sharedInstance];
    v31 = [v30 getActivePairedDevice];
    id v32 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"6AABB66B-8E1B-4CAB-8FC4-AC577BA0AFB0"];
    LOBYTE(v27) = [v31 supportsCapability:v32];

    if ((v27 & 1) == 0)
    {
      v33 = [v5 specifierForID:@"TRITIUM_ID"];
      [v5 removeObject:v33];

      v34 = [v5 specifierForID:@"TRITIUM_GROUP_ID"];
      [v5 removeObject:v34];
    }
    [(COSDisplayAndBrightnessController *)self _setupWakeSpecifiers:v5];
    v35 = *(void **)&self->BPSListController_opaque[v3];
    *(void *)&self->BPSListController_opaque[v3] = v5;

    objc_super v4 = *(void **)&self->BPSListController_opaque[v3];
  }

  return v4;
}

- (void)setBoldTextEnabled:(id)a3 specifier:(id)a4
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.Accessibility"];
  [v5 setObject:v4 forKey:@"EnhancedTextLegibilityEnabled"];

  id v6 = [v5 synchronize];
  v7 = objc_opt_new();
  CFStringRef v10 = @"EnhancedTextLegibilityEnabled";
  v8 = +[NSArray arrayWithObjects:&v10 count:1];
  v9 = +[NSSet setWithArray:v8];
  [v7 synchronizeNanoDomain:@"com.apple.Accessibility" keys:v9];
}

- (id)boldTextEnabled:(id)a3
{
  id v3 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.Accessibility"];
  id v4 = [v3 synchronize];
  id v5 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 BOOLForKey:@"EnhancedTextLegibilityEnabled"]);

  return v5;
}

- (id)contentSizeCategories
{
  contentSizeCategories = self->_contentSizeCategories;
  if (contentSizeCategories)
  {
    id v3 = contentSizeCategories;
  }
  else
  {
    id v5 = [objc_alloc((Class)NSArray) initWithObjects:UIContentSizeCategoryExtraSmall, UIContentSizeCategorySmall, UIContentSizeCategoryLarge, UIContentSizeCategoryExtraLarge, UIContentSizeCategoryExtraExtraLarge, UIContentSizeCategoryExtraExtraExtraLarge, UIContentSizeCategoryExtraExtraExtraLarge, UIContentSizeCategoryAccessibilityMedium, 0];
    id v6 = self->_contentSizeCategories;
    self->_contentSizeCategories = v5;

    v7 = BPSGetActiveSetupCompletedDevice();
    if (v7)
    {
      unint64_t v8 = (unint64_t)+[PBBridgeWatchAttributeController sizeFromDevice:v7];
      if (v8 <= 0x13 && ((1 << v8) & 0x86080) != 0)
      {
        v9 = self->_contentSizeCategories;
        v14[0] = UIContentSizeCategoryAccessibilityLarge;
        v14[1] = UIContentSizeCategoryAccessibilityExtraLarge;
        CFStringRef v10 = +[NSArray arrayWithObjects:v14 count:2];
        uint64_t v11 = [(NSArray *)v9 arrayByAddingObjectsFromArray:v10];
        v12 = self->_contentSizeCategories;
        self->_contentSizeCategories = v11;
      }
    }
    id v3 = self->_contentSizeCategories;
  }

  return v3;
}

- (void)setTextSize:(id)a3 specifier:(id)a4
{
  id v5 = [a3 integerValue];
  id v6 = [(COSDisplayAndBrightnessController *)self contentSizeCategories];
  id v11 = [v6 objectAtIndex:v5];

  id v7 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.UIKit"];
  [v7 setObject:v11 forKey:@"UIPreferredContentSizeCategoryName"];
  id v8 = [v7 synchronize];
  v9 = objc_opt_new();
  CFStringRef v10 = +[NSSet setWithObject:@"UIPreferredContentSizeCategoryName"];
  [v9 synchronizeNanoDomain:@"com.apple.UIKit" keys:v10];
}

- (id)textSize:(id)a3
{
  id v4 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.UIKit"];
  id v5 = [v4 synchronize];
  id v6 = [v4 objectForKey:@"UIPreferredContentSizeCategoryName"];
  if (!v6) {
    id v6 = UIContentSizeCategorySmall;
  }
  id v7 = [(COSDisplayAndBrightnessController *)self contentSizeCategories];
  id v8 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v7 indexOfObject:v6]);

  return v8;
}

- (id)tritiumEnabled:(id)a3
{
  BOOL v3 = sub_1000E7FF4();
  id v4 = +[NSBundle mainBundle];
  id v5 = v4;
  if (v3) {
    CFStringRef v6 = @"TRITIUM_ON";
  }
  else {
    CFStringRef v6 = @"TRITIUM_OFF";
  }
  id v7 = [v4 localizedStringForKey:v6 value:&stru_100249230 table:@"DisplayAndBrightness-tritium"];

  return v7;
}

- (void)setActivateOnWristRaiseValue:(id)a3 specifier:(id)a4
{
  unsigned int v5 = [a3 BOOLValue];
  CFStringRef v6 = [(COSDisplayAndBrightnessController *)self carouselDomainAccessor];
  [v6 setBool:v5 ^ 1 forKey:@"kDisallowWakeGestureSetting"];

  id v8 = [(COSDisplayAndBrightnessController *)self carouselDomainAccessor];
  id v7 = +[NSSet setWithObject:@"kDisallowWakeGestureSetting"];
  [(COSDisplayAndBrightnessController *)self _synchronizeDomainWithAccessor:v8 keys:v7 withCompletion:&stru_100246638];
}

- (id)activateOnWristRaiseValue:(id)a3
{
  BOOL v3 = [(COSDisplayAndBrightnessController *)self carouselDomainAccessor];
  unsigned int v4 = [v3 BOOLForKey:@"kDisallowWakeGestureSetting"];

  return +[NSNumber numberWithInt:v4 ^ 1];
}

- (void)setActivateOnCrownUpValue:(id)a3 specifier:(id)a4
{
  id v5 = [a3 BOOLValue];
  CFStringRef v6 = [(COSDisplayAndBrightnessController *)self carouselDomainAccessor];
  [v6 setBool:v5 forKey:@"enableRotateToWake"];

  id v8 = [(COSDisplayAndBrightnessController *)self carouselDomainAccessor];
  id v7 = +[NSSet setWithObject:@"enableRotateToWake"];
  [(COSDisplayAndBrightnessController *)self _synchronizeDomainWithAccessor:v8 keys:v7 withCompletion:0];
}

- (id)activateOnCrownUpValue:(id)a3
{
  char v8 = 0;
  BOOL v3 = [(COSDisplayAndBrightnessController *)self carouselDomainAccessor];
  unsigned int v4 = [v3 BOOLForKey:@"enableRotateToWake" keyExistsAndHasValidFormat:&v8];

  if (v8) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 1;
  }
  CFStringRef v6 = +[NSNumber numberWithInt:v5];

  return v6;
}

- (NPSDomainAccessor)carouselDomainAccessor
{
  carouselDomainAccessor = self->_carouselDomainAccessor;
  if (!carouselDomainAccessor)
  {
    unsigned int v4 = (NPSDomainAccessor *)[objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.Carousel"];
    uint64_t v5 = self->_carouselDomainAccessor;
    self->_carouselDomainAccessor = v4;

    carouselDomainAccessor = self->_carouselDomainAccessor;
  }

  return carouselDomainAccessor;
}

- (void)_synchronizeDomainWithAccessor:(id)a3 keys:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_1000C0074();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = [v8 domain];
    *(_DWORD *)buf = 138412546;
    v22 = v12;
    __int16 v23 = 2112;
    id v24 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "synchronizing %@ %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000C1228;
  v16[3] = &unk_100246688;
  objc_copyWeak(&v20, (id *)buf);
  id v13 = v8;
  id v17 = v13;
  id v14 = v9;
  id v18 = v14;
  id v15 = v10;
  id v19 = v15;
  [v13 synchronizeWithCompletionHandler:v16];

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);
}

- (void)handleDidUnpair
{
  carouselDomainAccessor = self->_carouselDomainAccessor;
  self->_carouselDomainAccessor = 0;
}

- (void)_setupWakeSpecifiers:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[NSBundle mainBundle];
  CFStringRef v6 = [v5 localizedStringForKey:@"WAKE_GROUP_LABEL" value:&stru_100249230 table:@"DisplayAndBrightness-tritium"];
  v25 = +[PSSpecifier groupSpecifierWithName:v6];

  [v4 addObject:v25];
  id v7 = +[NSBundle mainBundle];
  id v8 = [v7 localizedStringForKey:@"WAKE_ON_WRIST_RAISE" value:&stru_100249230 table:@"DisplayAndBrightness-tritium"];
  id v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:"setActivateOnWristRaiseValue:specifier:" get:"activateOnWristRaiseValue:" detail:0 cell:6 edit:0];

  uint64_t v10 = PSIDKey;
  [v9 setProperty:@"WAKE_SCREEN_ON_WRIST_RAISE_SWITCH_ID" forKey:PSIDKey];
  [v4 addObject:v9];
  BOOL v11 = sub_1000E7FF4();
  v12 = @"WAKE_ON_CROWN_UP";
  if (v11) {
    v12 = @"WAKE_ON_CROWN";
  }
  id v13 = v12;
  id v14 = +[NSBundle mainBundle];
  id v15 = [v14 localizedStringForKey:v13 value:&stru_100249230 table:@"DisplayAndBrightness-tritium"];

  v16 = +[PSSpecifier preferenceSpecifierNamed:v15 target:self set:"setActivateOnCrownUpValue:specifier:" get:"activateOnCrownUpValue:" detail:0 cell:6 edit:0];

  [v16 setProperty:@"WAKE_SCREEN_ON_CROWN_UP_SWITCH_ID" forKey:v10];
  [v16 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
  [v4 addObject:v16];
  v30[0] = PSTitleKey;
  id v17 = +[NSBundle mainBundle];
  id v18 = [v17 localizedStringForKey:@"WAKE_DURATION_LABEL" value:&stru_100249230 table:@"DisplayAndBrightness-tritium"];
  v31[0] = v18;
  v31[1] = @"PSLinkCell";
  v30[1] = PSTableCellClassKey;
  v30[2] = PSBundlePathKey;
  v31[2] = @"CompanionWakeSettings";
  v31[3] = &__kCFBooleanTrue;
  v30[3] = PSBundleIsControllerKey;
  v30[4] = PSSearchNanoSettingsBundlePath;
  v31[4] = &__kCFBooleanTrue;
  v30[5] = BPSForbiddenWatchCapabilitiesKey;
  uint64_t v29 = BPSTinkerCapabilityKey;
  id v19 = +[NSArray arrayWithObjects:&v29 count:1];
  v31[5] = v19;
  id v20 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:6];

  v26 = v20;
  CFStringRef v27 = @"items";
  v21 = +[NSArray arrayWithObjects:&v26 count:1];
  double v28 = v21;
  v22 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
  __int16 v23 = +[NSBundle mainBundle];
  id v24 = SpecifiersFromPlist();

  [v4 addObjectsFromArray:v24];
}

- (PSSpecifier)brightnessSlider
{
  return self->_brightnessSlider;
}

- (void)setBrightnessSlider:(id)a3
{
}

- (void)setCarouselDomainAccessor:(id)a3
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
  objc_storeStrong((id *)&self->_carouselDomainAccessor, 0);
  objc_storeStrong((id *)&self->_brightnessSlider, 0);

  objc_storeStrong((id *)&self->_contentSizeCategories, 0);
}

@end