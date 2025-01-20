@interface STDeviceDowntimeUserNotificationContext
+ (BOOL)supportsSecureCoding;
- (NSString)localizedUserNotificationBodyKey;
- (STDeviceDowntimeUserNotificationContext)init;
- (STDeviceDowntimeUserNotificationContext)initWithCoder:(id)a3;
- (id)destinations;
- (id)notificationBundleIdentifier;
- (void)customizeNotificationContent:(id)a3 withCompletionBlock:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setEndDateComponents:(id)a3 referenceDate:(id)a4;
- (void)setEndDateComponents:(id)a3 referenceDate:(id)a4 locale:(id)a5;
- (void)setLocalizedUserNotificationBodyKey:(id)a3;
@end

@implementation STDeviceDowntimeUserNotificationContext

- (STDeviceDowntimeUserNotificationContext)init
{
  v3.receiver = self;
  v3.super_class = (Class)STDeviceDowntimeUserNotificationContext;
  return [(STUserNotificationContext *)&v3 initWithIdentifier:@"device_downtime"];
}

- (STDeviceDowntimeUserNotificationContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STDeviceDowntimeUserNotificationContext;
  v5 = [(STUserNotificationContext *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedUserNotificationBodyKey"];
    localizedUserNotificationBodyKey = v5->_localizedUserNotificationBodyKey;
    v5->_localizedUserNotificationBodyKey = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STDeviceDowntimeUserNotificationContext;
  id v4 = a3;
  [(STUserNotificationContext *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_localizedUserNotificationBodyKey, @"localizedUserNotificationBodyKey", v5.receiver, v5.super_class);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setEndDateComponents:(id)a3 referenceDate:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F1CA20];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 currentLocale];
  [(STDeviceDowntimeUserNotificationContext *)self setEndDateComponents:v8 referenceDate:v7 locale:v9];
}

- (void)setEndDateComponents:(id)a3 referenceDate:(id)a4 locale:(id)a5
{
  id v44 = a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  [v9 setLocale:v8];
  v43 = [v9 nextDateAfterDate:v7 matchingComponents:v44 options:1024];
  v10 = objc_opt_new();
  [v10 setLocale:v8];
  [v10 setFormattingContext:5];
  v11 = [MEMORY[0x1E4F28C10] dateFormatFromTemplate:@"j" options:0 locale:v8];
  if ([v11 containsString:@"H"])
  {

    v12 = @"jmm";
  }
  else
  {
    char v13 = [v11 containsString:@"k"];

    v12 = @"jmm";
    if ((v13 & 1) == 0 && ![v44 minute]) {
      v12 = @"j";
    }
  }
  [v10 setLocalizedDateFormatFromTemplate:v12];
  v14 = v43;
  v41 = [v10 stringFromDate:v43];
  v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v41, 0);
  uint64_t v16 = [v44 weekday];
  v17 = [v9 components:608 fromDate:v7];
  uint64_t v18 = [v17 weekday];
  if (v16 == v18)
  {
    id v19 = v8;
    id v20 = v43;
    v21 = objc_opt_new();
    [v21 setLocale:v19];

    [v21 setLocalizedDateFormatFromTemplate:@"J"];
    v22 = [v21 stringFromDate:v20];

    uint64_t v23 = [v22 integerValue];
    v24 = @"DeviceDowntimeNotificationBody";
    if (v23 == 1) {
      v24 = @"DeviceDowntimeNotificationBody1AMPM";
    }
    v25 = v24;
  }
  else
  {
    uint64_t v26 = v18;
    id v40 = v7;
    uint64_t v27 = [v9 maximumRangeOfUnit:512];
    if (v26 == v28) {
      uint64_t v29 = v27;
    }
    else {
      uint64_t v29 = v26 + 1;
    }
    uint64_t v39 = v29;
    id v30 = v8;
    id v31 = v43;
    v32 = objc_opt_new();
    [v32 setLocale:v30];

    [v32 setLocalizedDateFormatFromTemplate:@"J"];
    v33 = [v32 stringFromDate:v31];

    uint64_t v34 = [v33 integerValue];
    if (v16 == v39)
    {
      v35 = @"DeviceDowntimeNotificationBodyTomorrow";
      if (v34 == 1) {
        v35 = @"DeviceDowntimeNotificationBody1AMPMTomorrow";
      }
      v25 = v35;
    }
    else
    {
      v36 = @"DeviceDowntimeNotificationBodyWeekdayFormat";
      if (v34 == 1) {
        v36 = @"DeviceDowntimeNotificationBody1AMPMWeekdayFormat";
      }
      v25 = v36;
      v37 = [v9 weekdaySymbols];
      v38 = [v37 objectAtIndexedSubscript:v16 - 1];

      [v15 addObject:v38];
    }
    id v7 = v40;
    v14 = v43;
  }
  [(STDeviceDowntimeUserNotificationContext *)self setLocalizedUserNotificationBodyKey:v25];
  [(STUserNotificationContext *)self setLocalizedUserNotificationBodyArguments:v15];
}

- (void)customizeNotificationContent:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __92__STDeviceDowntimeUserNotificationContext_customizeNotificationContent_withCompletionBlock___block_invoke;
  v11[3] = &unk_1E6BC6F40;
  id v12 = v6;
  char v13 = self;
  id v14 = v7;
  v10.receiver = self;
  v10.super_class = (Class)STDeviceDowntimeUserNotificationContext;
  id v8 = v7;
  id v9 = v6;
  [(STUserNotificationContext *)&v10 customizeNotificationContent:v9 withCompletionBlock:v11];
}

uint64_t __92__STDeviceDowntimeUserNotificationContext_customizeNotificationContent_withCompletionBlock___block_invoke(uint64_t a1)
{
  v2 = NSString;
  objc_super v3 = [*(id *)(a1 + 40) localizedUserNotificationBodyKey];
  id v4 = [*(id *)(a1 + 40) localizedUserNotificationBodyArguments];
  objc_super v5 = [v2 localizedUserNotificationStringForKey:v3 arguments:v4];
  [*(id *)(a1 + 32) setBody:v5];

  [*(id *)(a1 + 32) setShouldHideDate:1];
  [*(id *)(a1 + 32) setShouldIgnoreDoNotDisturb:1];
  [*(id *)(a1 + 32) setShouldSuppressDefaultAction:1];
  [*(id *)(a1 + 32) setShouldSuppressScreenLightUp:1];
  id v6 = [MEMORY[0x1E4F44610] iconForSystemImageNamed:@"hourglass.tophalf.fill"];
  [*(id *)(a1 + 32) setIcon:v6];

  [*(id *)(a1 + 32) setSound:0];
  [*(id *)(a1 + 32) setCategoryIdentifier:@"com.apple.screentime.downtime"];
  id v7 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v7();
}

- (id)destinations
{
  return &unk_1F349EC68;
}

- (id)notificationBundleIdentifier
{
  return @"com.apple.ScreenTimeDowntimeNotifications";
}

- (NSString)localizedUserNotificationBodyKey
{
  return self->_localizedUserNotificationBodyKey;
}

- (void)setLocalizedUserNotificationBodyKey:(id)a3
{
}

- (void).cxx_destruct
{
}

@end