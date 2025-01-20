@interface WGWidgetEventTracker
+ (id)sharedInstance;
- (WGWidgetEventTracker)init;
- (id)_authenticationProperty;
- (id)_locationProperty;
- (id)_modeProperty;
- (id)_statusProperty;
- (id)_widgetLingerTracker;
- (id)_widgetListLingerTracker;
- (id)_widgetProperty;
- (id)_widgetShownTracker;
- (id)_widgetStatusTracker;
- (id)_widgetToggleContractTracker;
- (id)widgetListShownTracker;
- (id)widgetToggleExpandTracker;
- (void)_lockedStateDidChange;
- (void)_trackWidgetContractEventForWidget:(id)a3;
- (void)_trackWidgetExpandEventForWidget:(id)a3;
- (void)_trackWidgetLingerEventForWidget:(id)a3 withLocation:(unint64_t)a4 authenticated:(BOOL)a5 mode:(int64_t)a6 duration:(double)a7;
- (void)_trackWidgetListLingerEventWithLocation:(unint64_t)a3 authenticated:(BOOL)a4 duration:(double)a5;
- (void)_trackWidgetListShownEventWithLocation:(unint64_t)a3 authenticated:(BOOL)a4;
- (void)_trackWidgetShownEventForWidget:(id)a3 withLocation:(unint64_t)a4 authenticated:(BOOL)a5 mode:(int64_t)a6;
- (void)_trackWidgetStatusEventForWidget:(id)a3 withStatus:(BOOL)a4;
- (void)dealloc;
- (void)widget:(id)a3 didAppearInMode:(int64_t)a4;
- (void)widget:(id)a3 didChangeUserSpecifiedDisplayMode:(int64_t)a4;
- (void)widget:(id)a3 didDisappearInMode:(int64_t)a4;
- (void)widgetListDidAppearAtLocation:(unint64_t)a3 withEnabledWidgets:(id)a4 disabledWidgets:(id)a5;
- (void)widgetListDidDisappearAtLocation:(unint64_t)a3;
- (void)widgetViewDidAppearWithWidget:(id)a3;
- (void)widgetViewDidDisappearWithWidget:(id)a3;
@end

@implementation WGWidgetEventTracker

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__WGWidgetEventTracker_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance___sharedInstance;
  return v2;
}

uint64_t __38__WGWidgetEventTracker_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = (uint64_t)v1;
  return MEMORY[0x270F9A758](v1, v2);
}

- (WGWidgetEventTracker)init
{
  v7.receiver = self;
  v7.super_class = (Class)WGWidgetEventTracker;
  uint64_t v2 = [(WGWidgetEventTracker *)&v7 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    previousWidgetAppearanceDateByIdentifier = v2->_previousWidgetAppearanceDateByIdentifier;
    v2->_previousWidgetAppearanceDateByIdentifier = v3;

    [(WGWidgetEventTracker *)v2 _lockedStateDidChange];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_HandleKeybagLockStatusChanged, @"com.apple.mobile.keybagd.lock_status", 0, CFNotificationSuspensionBehaviorDrop);
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)WGWidgetEventTracker;
  [(WGWidgetEventTracker *)&v4 dealloc];
}

- (void)_lockedStateDidChange
{
  self->_authenticated = MKBGetDeviceLockState() != 1;
}

- (void)widgetListDidAppearAtLocation:(unint64_t)a3 withEnabledWidgets:(id)a4 disabledWidgets:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  self->_location = a3;
  v10 = [MEMORY[0x263EFF910] date];
  v11 = [MEMORY[0x263EFF8F0] currentCalendar];
  v12 = [v11 components:28 fromDate:v10];
  if (([(NSDateComponents *)self->_previousTodayViewAppearDateComponents isEqual:v12] & 1) == 0)
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v23 = v8;
    id v13 = v8;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v29 != v16) {
            objc_enumerationMutation(v13);
          }
          [(WGWidgetEventTracker *)self _trackWidgetStatusEventForWidget:*(void *)(*((void *)&v28 + 1) + 8 * i) withStatus:1];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v15);
    }

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v18 = v9;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v25 != v21) {
            objc_enumerationMutation(v18);
          }
          [(WGWidgetEventTracker *)self _trackWidgetStatusEventForWidget:*(void *)(*((void *)&v24 + 1) + 8 * j) withStatus:0];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v20);
    }

    objc_storeStrong((id *)&self->_previousTodayViewAppearDateComponents, v12);
    id v8 = v23;
  }
  if (!self->_previousTodayViewAppearanceDate)
  {
    objc_storeStrong((id *)&self->_previousTodayViewAppearanceDate, v10);
    [(WGWidgetEventTracker *)self _trackWidgetListShownEventWithLocation:self->_location authenticated:self->_authenticated];
  }
}

- (void)widgetListDidDisappearAtLocation:(unint64_t)a3
{
  previousTodayViewAppearanceDate = self->_previousTodayViewAppearanceDate;
  if (previousTodayViewAppearanceDate)
  {
    [(NSDate *)previousTodayViewAppearanceDate timeIntervalSinceNow];
    [(WGWidgetEventTracker *)self _trackWidgetListLingerEventWithLocation:self->_location authenticated:self->_authenticated duration:-v5];
    v6 = self->_previousTodayViewAppearanceDate;
    self->_previousTodayViewAppearanceDate = 0;

    self->_location = 0;
  }
}

- (void)widgetViewDidAppearWithWidget:(id)a3
{
  self->_location = 4;
  [(WGWidgetEventTracker *)self widget:a3 didAppearInMode:0];
}

- (void)widgetViewDidDisappearWithWidget:(id)a3
{
  self->_location = 0;
}

- (void)widget:(id)a3 didAppearInMode:(int64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    id v10 = v6;
    objc_super v7 = -[NSMutableDictionary objectForKey:](self->_previousWidgetAppearanceDateByIdentifier, "objectForKey:");
    if (!v7)
    {
      [(WGWidgetEventTracker *)self _trackWidgetShownEventForWidget:v10 withLocation:self->_location authenticated:self->_authenticated mode:a4];
      previousWidgetAppearanceDateByIdentifier = self->_previousWidgetAppearanceDateByIdentifier;
      id v9 = [MEMORY[0x263EFF910] date];
      [(NSMutableDictionary *)previousWidgetAppearanceDateByIdentifier setObject:v9 forKey:v10];
    }
  }
  MEMORY[0x270F9A790]();
}

- (void)widget:(id)a3 didDisappearInMode:(int64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    id v11 = v6;
    id v8 = [(NSMutableDictionary *)self->_previousWidgetAppearanceDateByIdentifier objectForKey:v6];
    id v9 = v8;
    if (v8)
    {
      [v8 timeIntervalSinceNow];
      [(WGWidgetEventTracker *)self _trackWidgetLingerEventForWidget:v11 withLocation:self->_location authenticated:self->_authenticated mode:a4 duration:-v10];
      [(NSMutableDictionary *)self->_previousWidgetAppearanceDateByIdentifier removeObjectForKey:v11];
    }

    id v7 = v11;
  }
  MEMORY[0x270F9A758](v6, v7);
}

- (void)widget:(id)a3 didChangeUserSpecifiedDisplayMode:(int64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    if (a4 == 1)
    {
      id v8 = v6;
      id v6 = (id)[(WGWidgetEventTracker *)self _trackWidgetExpandEventForWidget:v6];
    }
    else
    {
      if (a4) {
        goto LABEL_7;
      }
      id v8 = v6;
      id v6 = (id)[(WGWidgetEventTracker *)self _trackWidgetContractEventForWidget:v6];
    }
    id v7 = v8;
  }
LABEL_7:
  MEMORY[0x270F9A758](v6, v7);
}

- (id)_authenticationProperty
{
  v7[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x263F61888];
  v6[0] = MEMORY[0x263EFFA88];
  v6[1] = MEMORY[0x263EFFA80];
  v7[0] = @"true";
  v7[1] = @"false";
  v3 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];
  objc_super v4 = [v2 propertyWithName:@"auth" enumMapping:v3];

  return v4;
}

- (id)_locationProperty
{
  v7[5] = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x263F61888];
  v6[0] = &unk_26D5D4EE8;
  v6[1] = &unk_26D5D4F00;
  v7[0] = @"Unknown";
  v7[1] = @"lock_screen_list";
  void v6[2] = &unk_26D5D4F18;
  v6[3] = &unk_26D5D4F30;
  v7[2] = @"notification_center_list";
  void v7[3] = @"home_screen_list";
  v6[4] = &unk_26D5D4F48;
  v7[4] = @"home_screen_icon";
  v3 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:5];
  objc_super v4 = [v2 propertyWithName:@"location" enumMapping:v3];

  return v4;
}

- (id)_modeProperty
{
  v7[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x263F61888];
  v6[0] = &unk_26D5D4F60;
  v6[1] = &unk_26D5D4F78;
  v7[0] = @"compact";
  v7[1] = @"expanded";
  v3 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];
  objc_super v4 = [v2 propertyWithName:@"mode" enumMapping:v3];

  return v4;
}

- (id)_statusProperty
{
  v7[2] = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)MEMORY[0x263F61888];
  v6[0] = MEMORY[0x263EFFA88];
  v6[1] = MEMORY[0x263EFFA80];
  v7[0] = @"enabled";
  v7[1] = @"disabled";
  v3 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];
  objc_super v4 = [v2 propertyWithName:@"status" enumMapping:v3];

  return v4;
}

- (id)_widgetProperty
{
  return (id)[MEMORY[0x263F61888] freeValuedPropertyWithName:@"widget"];
}

- (id)_widgetLingerTracker
{
  v13[4] = *MEMORY[0x263EF8340];
  widgetLingerTracker = self->_widgetLingerTracker;
  if (!widgetLingerTracker)
  {
    objc_super v4 = [(WGWidgetEventTracker *)self _widgetProperty];
    double v5 = [(WGWidgetEventTracker *)self _locationProperty];
    id v6 = [(WGWidgetEventTracker *)self _authenticationProperty];
    id v7 = [(WGWidgetEventTracker *)self _modeProperty];
    id v8 = objc_alloc(MEMORY[0x263F61880]);
    v13[0] = v4;
    v13[1] = v5;
    v13[2] = v6;
    v13[3] = v7;
    id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:4];
    double v10 = (PETDistributionEventTracker *)[v8 initWithFeatureId:@"Widgets" event:@"widgetLinger" registerProperties:v9];
    id v11 = self->_widgetLingerTracker;
    self->_widgetLingerTracker = v10;

    widgetLingerTracker = self->_widgetLingerTracker;
  }
  return widgetLingerTracker;
}

- (void)_trackWidgetLingerEventForWidget:(id)a3 withLocation:(unint64_t)a4 authenticated:(BOOL)a5 mode:(int64_t)a6 duration:(double)a7
{
  v18[4] = *MEMORY[0x263EF8340];
  if (a3)
  {
    if (a4)
    {
      BOOL v10 = a5;
      id v12 = a3;
      id v13 = [(WGWidgetEventTracker *)self _widgetLingerTracker];
      v18[0] = v12;
      uint64_t v14 = [NSNumber numberWithUnsignedInteger:a4];
      v18[1] = v14;
      uint64_t v15 = [NSNumber numberWithBool:v10];
      v18[2] = v15;
      uint64_t v16 = [NSNumber numberWithInteger:a6];
      v18[3] = v16;
      v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:4];

      [v13 trackEventWithPropertyValues:v17 value:a7];
    }
  }
}

- (id)_widgetShownTracker
{
  v13[4] = *MEMORY[0x263EF8340];
  widgetShownTracker = self->_widgetShownTracker;
  if (!widgetShownTracker)
  {
    objc_super v4 = [(WGWidgetEventTracker *)self _widgetProperty];
    double v5 = [(WGWidgetEventTracker *)self _locationProperty];
    id v6 = [(WGWidgetEventTracker *)self _authenticationProperty];
    id v7 = [(WGWidgetEventTracker *)self _modeProperty];
    id v8 = objc_alloc(MEMORY[0x263F61898]);
    v13[0] = v4;
    v13[1] = v5;
    v13[2] = v6;
    v13[3] = v7;
    id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:4];
    BOOL v10 = (PETScalarEventTracker *)[v8 initWithFeatureId:@"Widgets" event:@"widgetShown" registerProperties:v9];
    id v11 = self->_widgetShownTracker;
    self->_widgetShownTracker = v10;

    widgetShownTracker = self->_widgetShownTracker;
  }
  return widgetShownTracker;
}

- (void)_trackWidgetShownEventForWidget:(id)a3 withLocation:(unint64_t)a4 authenticated:(BOOL)a5 mode:(int64_t)a6
{
  v16[4] = *MEMORY[0x263EF8340];
  if (a3)
  {
    BOOL v7 = a5;
    id v10 = a3;
    id v11 = [(WGWidgetEventTracker *)self _widgetShownTracker];
    v16[0] = v10;
    id v12 = [NSNumber numberWithUnsignedInteger:a4];
    v16[1] = v12;
    id v13 = [NSNumber numberWithBool:v7];
    v16[2] = v13;
    uint64_t v14 = [NSNumber numberWithInteger:a6];
    v16[3] = v14;
    uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:4];

    [v11 trackEventWithPropertyValues:v15];
  }
}

- (id)_widgetStatusTracker
{
  v11[2] = *MEMORY[0x263EF8340];
  widgetStatusTracker = self->_widgetStatusTracker;
  if (!widgetStatusTracker)
  {
    objc_super v4 = [(WGWidgetEventTracker *)self _widgetProperty];
    double v5 = [(WGWidgetEventTracker *)self _statusProperty];
    id v6 = objc_alloc(MEMORY[0x263F61898]);
    v11[0] = v4;
    v11[1] = v5;
    BOOL v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
    id v8 = (PETScalarEventTracker *)[v6 initWithFeatureId:@"Widgets" event:@"widgetStatus" registerProperties:v7];
    id v9 = self->_widgetStatusTracker;
    self->_widgetStatusTracker = v8;

    widgetStatusTracker = self->_widgetStatusTracker;
  }
  return widgetStatusTracker;
}

- (void)_trackWidgetStatusEventForWidget:(id)a3 withStatus:(BOOL)a4
{
  v10[2] = *MEMORY[0x263EF8340];
  if (a3)
  {
    BOOL v4 = a4;
    id v6 = a3;
    BOOL v7 = [(WGWidgetEventTracker *)self _widgetStatusTracker];
    v10[0] = v6;
    id v8 = [NSNumber numberWithBool:v4];
    v10[1] = v8;
    id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];

    [v7 trackEventWithPropertyValues:v9];
  }
}

- (id)_widgetToggleContractTracker
{
  v10[1] = *MEMORY[0x263EF8340];
  widgetToggleContractTracker = self->_widgetToggleContractTracker;
  if (!widgetToggleContractTracker)
  {
    BOOL v4 = [(WGWidgetEventTracker *)self _widgetProperty];
    id v5 = objc_alloc(MEMORY[0x263F61898]);
    v10[0] = v4;
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
    BOOL v7 = (PETScalarEventTracker *)[v5 initWithFeatureId:@"Widgets" event:@"widgetToggleContract" registerProperties:v6];
    id v8 = self->_widgetToggleContractTracker;
    self->_widgetToggleContractTracker = v7;

    widgetToggleContractTracker = self->_widgetToggleContractTracker;
  }
  return widgetToggleContractTracker;
}

- (void)_trackWidgetContractEventForWidget:(id)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v4 = a3;
    id v5 = [(WGWidgetEventTracker *)self _widgetToggleContractTracker];
    v7[0] = v4;
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];

    [v5 trackEventWithPropertyValues:v6];
  }
}

- (id)widgetToggleExpandTracker
{
  v10[1] = *MEMORY[0x263EF8340];
  widgetToggleExpandTracker = self->_widgetToggleExpandTracker;
  if (!widgetToggleExpandTracker)
  {
    id v4 = [(WGWidgetEventTracker *)self _widgetProperty];
    id v5 = objc_alloc(MEMORY[0x263F61898]);
    v10[0] = v4;
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
    BOOL v7 = (PETScalarEventTracker *)[v5 initWithFeatureId:@"Widgets" event:@"widgetToggleExpand" registerProperties:v6];
    id v8 = self->_widgetToggleExpandTracker;
    self->_widgetToggleExpandTracker = v7;

    widgetToggleExpandTracker = self->_widgetToggleExpandTracker;
  }
  return widgetToggleExpandTracker;
}

- (void)_trackWidgetExpandEventForWidget:(id)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  if (a3)
  {
    id v4 = a3;
    id v5 = [(WGWidgetEventTracker *)self widgetToggleExpandTracker];
    v7[0] = v4;
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];

    [v5 trackEventWithPropertyValues:v6];
  }
}

- (id)_widgetListLingerTracker
{
  v11[2] = *MEMORY[0x263EF8340];
  widgetListLingerTracker = self->_widgetListLingerTracker;
  if (!widgetListLingerTracker)
  {
    id v4 = [(WGWidgetEventTracker *)self _locationProperty];
    id v5 = [(WGWidgetEventTracker *)self _authenticationProperty];
    id v6 = objc_alloc(MEMORY[0x263F61880]);
    v11[0] = v4;
    v11[1] = v5;
    BOOL v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
    id v8 = (PETDistributionEventTracker *)[v6 initWithFeatureId:@"Widgets" event:@"widgetListLinger" registerProperties:v7];
    id v9 = self->_widgetListLingerTracker;
    self->_widgetListLingerTracker = v8;

    widgetListLingerTracker = self->_widgetListLingerTracker;
  }
  return widgetListLingerTracker;
}

- (void)_trackWidgetListLingerEventWithLocation:(unint64_t)a3 authenticated:(BOOL)a4 duration:(double)a5
{
  BOOL v6 = a4;
  v12[2] = *MEMORY[0x263EF8340];
  id v8 = [(WGWidgetEventTracker *)self _widgetListLingerTracker];
  id v9 = [NSNumber numberWithUnsignedInteger:a3];
  v12[0] = v9;
  id v10 = [NSNumber numberWithBool:v6];
  v12[1] = v10;
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
  [v8 trackEventWithPropertyValues:v11 value:a5];
}

- (id)widgetListShownTracker
{
  v11[2] = *MEMORY[0x263EF8340];
  widgetListShownTracker = self->_widgetListShownTracker;
  if (!widgetListShownTracker)
  {
    id v4 = [(WGWidgetEventTracker *)self _locationProperty];
    id v5 = [(WGWidgetEventTracker *)self _authenticationProperty];
    id v6 = objc_alloc(MEMORY[0x263F61898]);
    v11[0] = v4;
    v11[1] = v5;
    BOOL v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
    id v8 = (PETScalarEventTracker *)[v6 initWithFeatureId:@"Widgets" event:@"widgetListShown" registerProperties:v7];
    id v9 = self->_widgetListShownTracker;
    self->_widgetListShownTracker = v8;

    widgetListShownTracker = self->_widgetListShownTracker;
  }
  return widgetListShownTracker;
}

- (void)_trackWidgetListShownEventWithLocation:(unint64_t)a3 authenticated:(BOOL)a4
{
  BOOL v4 = a4;
  void v10[2] = *MEMORY[0x263EF8340];
  id v6 = [(WGWidgetEventTracker *)self widgetListShownTracker];
  BOOL v7 = [NSNumber numberWithUnsignedInteger:a3];
  v10[0] = v7;
  id v8 = [NSNumber numberWithBool:v4];
  v10[1] = v8;
  id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
  [v6 trackEventWithPropertyValues:v9];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetToggleExpand, 0);
  objc_storeStrong((id *)&self->_widgetToggleContract, 0);
  objc_storeStrong((id *)&self->_widgetListShownTracker, 0);
  objc_storeStrong((id *)&self->_widgetToggleExpandTracker, 0);
  objc_storeStrong((id *)&self->_widgetToggleContractTracker, 0);
  objc_storeStrong((id *)&self->_widgetListLingerTracker, 0);
  objc_storeStrong((id *)&self->_widgetStatusTracker, 0);
  objc_storeStrong((id *)&self->_widgetShownTracker, 0);
  objc_storeStrong((id *)&self->_widgetLingerTracker, 0);
  objc_storeStrong((id *)&self->_previousWidgetAppearanceDateByIdentifier, 0);
  objc_storeStrong((id *)&self->_previousTodayViewAppearanceDate, 0);
  objc_storeStrong((id *)&self->_previousTodayViewAppearDateComponents, 0);
}

@end