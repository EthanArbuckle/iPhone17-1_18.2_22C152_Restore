@interface COSDNDController
- (COSDNDController)init;
- (NPSDomainAccessor)domainAccessor;
- (NPSManager)npsManager;
- (__CFDateFormatter)timeFormatter;
- (id)doNotDisturbMirrorState:(id)a3;
- (id)doNotDisturbWorkoutState:(id)a3;
- (id)specifiers;
- (void)dealloc;
- (void)setDoNotDisturbMirrorState:(id)a3 specifier:(id)a4;
- (void)setDomainAccessor:(id)a3;
- (void)setNpsManager:(id)a3;
- (void)setTimeFormatter:(__CFDateFormatter *)a3;
- (void)setWorkoutDoNotDisturbState:(id)a3 specifier:(id)a4;
@end

@implementation COSDNDController

- (COSDNDController)init
{
  v11.receiver = self;
  v11.super_class = (Class)COSDNDController;
  v2 = [(COSDNDController *)&v11 init];
  if (v2)
  {
    v3 = +[PBBGatewayManager sharedManager];
    [v3 loadDNDState];

    uint64_t v4 = objc_opt_new();
    npsManager = v2->_npsManager;
    v2->_npsManager = (NPSManager *)v4;

    id v6 = objc_alloc((Class)NPSDomainAccessor);
    v7 = (NPSDomainAccessor *)[v6 initWithDomain:BPSDNDDomainKey];
    domainAccessor = v2->_domainAccessor;
    v2->_domainAccessor = v7;
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_1000E2570, BPSWorkoutDNDStateChangedNotification, 0, (CFNotificationSuspensionBehavior)0);
  return v2;
}

- (void)dealloc
{
  timeFormatter = self->_timeFormatter;
  if (timeFormatter) {
    CFRelease(timeFormatter);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, BPSWorkoutDNDStateChangedNotification, 0);
  v5.receiver = self;
  v5.super_class = (Class)COSDNDController;
  [(COSDNDController *)&v5 dealloc];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  uint64_t v4 = *(void **)&self->BPSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    objc_super v5 = [(COSDNDController *)self loadSpecifiersFromPlistName:@"DoNotDisturb" target:self];
    id v6 = [(NPSDomainAccessor *)self->_domainAccessor synchronize];
    v7 = [UIApp activeWatch];
    id v8 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"E2FB408E-3F1C-4F55-89DE-A25CDF6D4C39"];
    v49 = v7;
    unsigned int v9 = [v7 supportsCapability:v8];

    v10 = [v5 specifierForID:@"DND_WORKOUT_ID"];
    if (v9)
    {
      objc_super v11 = +[NSBundle bundleForClass:objc_opt_class()];
      v12 = [v11 localizedStringForKey:@"FOOTER_WORKOUT_DND" value:&stru_100249230 table:@"DoNotDisturb"];
      v13 = +[NSString stringWithFormat:v12];

      [v10 setProperty:v13 forKey:PSFooterTextGroupKey];
    }
    else
    {
      [v5 removeObject:v10];

      v10 = [v5 specifierForID:@"WORKOUT_DND_ID"];
      [v5 removeObject:v10];
    }

    v48 = v5;
    v47 = [v5 specifierForID:@"DND_ID"];
    v14 = +[NSBundle bundleForClass:objc_opt_class()];
    v15 = +[PBBGatewayManager sharedManager];
    if ([v15 repeatedCalls]) {
      CFStringRef v16 = @"YES";
    }
    else {
      CFStringRef v16 = @"NO";
    }
    uint64_t v46 = [v14 localizedStringForKey:v16 value:&stru_100249230 table:@"DoNotDisturb"];

    v17 = +[PBBGatewayManager sharedManager];
    id v18 = [v17 doNotDisturbPrivilegedSenderType];

    v19 = +[NSBundle bundleForClass:objc_opt_class()];
    v20 = [v19 localizedStringForKey:@"NO_ONE" value:&stru_100249230 table:@"DoNotDisturb"];

    switch((unint64_t)v18)
    {
      case 1uLL:
        v21 = +[NSBundle bundleForClass:objc_opt_class()];
        v22 = v21;
        CFStringRef v23 = @"EVERYONE";
        goto LABEL_12;
      case 3uLL:
        v21 = +[NSBundle bundleForClass:objc_opt_class()];
        v22 = v21;
        CFStringRef v23 = @"FAVORITES";
        goto LABEL_12;
      case 4uLL:
        v21 = +[NSBundle bundleForClass:objc_opt_class()];
        v22 = v21;
        CFStringRef v23 = @"CONTACTS";
LABEL_12:
        uint64_t v24 = [v21 localizedStringForKey:v23 value:&stru_100249230 table:@"DoNotDisturb"];
        goto LABEL_14;
      case 5uLL:
        v22 = +[PBBGatewayManager sharedManager];
        uint64_t v24 = [v22 allowedGroupName];
LABEL_14:
        v25 = (void *)v24;

        v20 = v25;
        break;
      default:
        break;
    }
    v26 = +[PBBGatewayManager sharedManager];
    unsigned int v27 = [v26 isScheduled];

    if (v27)
    {
      timeFormatter = self->_timeFormatter;
      if (timeFormatter) {
        CFRelease(timeFormatter);
      }
      uint64_t v45 = v3;
      CFLocaleRef v29 = CFLocaleCopyCurrent();
      self->_timeFormatter = CFDateFormatterCreate(0, v29, kCFDateFormatterNoStyle, kCFDateFormatterShortStyle);
      if (v29) {
        CFRelease(v29);
      }
      id v30 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
      v31 = self->_timeFormatter;
      v32 = +[PBBGatewayManager sharedManager];
      v33 = [v32 dndFromComponents];
      StringWithDate = (void *)CFDateFormatterCreateStringWithDate(0, v31, (CFDateRef)[v30 dateFromComponents:v33]);

      v35 = self->_timeFormatter;
      v36 = +[PBBGatewayManager sharedManager];
      v37 = [v36 dndToComponents];
      v38 = (__CFString *)CFDateFormatterCreateStringWithDate(0, v35, (CFDateRef)[v30 dateFromComponents:v37]);

      v39 = +[NSBundle bundleForClass:objc_opt_class()];
      v40 = [v39 localizedStringForKey:@"FOOTER_SCHEDULE" value:&stru_100249230 table:@"DoNotDisturb"];
      v41 = (void *)v46;
      v42 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v40, StringWithDate, v38, v20, v46);

      uint64_t v3 = v45;
    }
    else
    {
      id v30 = +[NSBundle bundleForClass:objc_opt_class()];
      StringWithDate = [v30 localizedStringForKey:@"FOOTER_NO_SCHEDULE" value:&stru_100249230 table:@"DoNotDisturb"];
      v41 = (void *)v46;
      v42 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", StringWithDate, v20, v46);
    }

    [v47 setProperty:v42 forKey:PSFooterTextGroupKey];
    v43 = *(void **)&self->BPSListController_opaque[v3];
    *(void *)&self->BPSListController_opaque[v3] = v48;

    uint64_t v4 = *(void **)&self->BPSListController_opaque[v3];
  }

  return v4;
}

- (void)setDoNotDisturbMirrorState:(id)a3 specifier:(id)a4
{
  domainAccessor = self->_domainAccessor;
  id v14 = a4;
  id v7 = [a3 BOOLValue];
  uint64_t v8 = BPSMirrorDNDKey;
  [(NPSDomainAccessor *)domainAccessor setBool:v7 forKey:BPSMirrorDNDKey];
  id v9 = [(NPSDomainAccessor *)self->_domainAccessor synchronize];
  npsManager = self->_npsManager;
  uint64_t v11 = BPSDNDDomainKey;
  v12 = +[NSSet setWithObject:v8];
  [(NPSManager *)npsManager synchronizeNanoDomain:v11 keys:v12];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, BPSMirrorDNDStateChangedNotification, 0, 0, 0);
  [(COSDNDController *)self reloadSpecifier:v14 animated:1];
}

- (id)doNotDisturbMirrorState:(id)a3
{
  id v4 = [(NPSDomainAccessor *)self->_domainAccessor synchronize];
  char v9 = 0;
  unsigned int v5 = [(NPSDomainAccessor *)self->_domainAccessor BOOLForKey:BPSMirrorDNDKey keyExistsAndHasValidFormat:&v9];
  if (v9) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 1;
  }
  id v7 = +[NSNumber numberWithBool:v6];

  return v7;
}

- (void)setWorkoutDoNotDisturbState:(id)a3 specifier:(id)a4
{
  domainAccessor = self->_domainAccessor;
  id v6 = [a3 BOOLValue];
  uint64_t v7 = BPSWorkoutDNDKey;
  [(NPSDomainAccessor *)domainAccessor setBool:v6 forKey:BPSWorkoutDNDKey];
  id v8 = [(NPSDomainAccessor *)self->_domainAccessor synchronize];
  npsManager = self->_npsManager;
  uint64_t v10 = BPSDNDDomainKey;
  uint64_t v11 = +[NSSet setWithObject:v7];
  [(NPSManager *)npsManager synchronizeNanoDomain:v10 keys:v11];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v13 = (const __CFString *)BPSWorkoutDNDStateChangedNotification;

  CFNotificationCenterPostNotification(DarwinNotifyCenter, v13, 0, 0, 0);
}

- (id)doNotDisturbWorkoutState:(id)a3
{
  id v4 = [(NPSDomainAccessor *)self->_domainAccessor synchronize];
  char v9 = 0;
  unsigned int v5 = [(NPSDomainAccessor *)self->_domainAccessor BOOLForKey:BPSWorkoutDNDKey keyExistsAndHasValidFormat:&v9];
  if (v9) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = +[NSNumber numberWithBool:v6];

  return v7;
}

- (NPSManager)npsManager
{
  return self->_npsManager;
}

- (void)setNpsManager:(id)a3
{
}

- (__CFDateFormatter)timeFormatter
{
  return self->_timeFormatter;
}

- (void)setTimeFormatter:(__CFDateFormatter *)a3
{
  self->_timeFormatter = a3;
}

- (NPSDomainAccessor)domainAccessor
{
  return self->_domainAccessor;
}

- (void)setDomainAccessor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainAccessor, 0);

  objc_storeStrong((id *)&self->_npsManager, 0);
}

@end