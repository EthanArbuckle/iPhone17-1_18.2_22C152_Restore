@interface STWeeklyReportUserNotificationContext
+ (BOOL)supportsSecureCoding;
- (NSData)weeklyReportData;
- (NSNumber)totalUsage;
- (NSString)notificationBodyKey;
- (STWeeklyReportUserNotificationContext)init;
- (STWeeklyReportUserNotificationContext)initWithCoder:(id)a3;
- (double)deltaScreenTimeUsage;
- (void)customizeNotificationContent:(id)a3 withCompletionBlock:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setDeltaScreenTimeUsage:(double)a3;
- (void)setDeltaScreenTimeUsage:(double)a3 totalUsage:(id)a4;
- (void)setNotificationBodyKey:(id)a3;
- (void)setTotalUsage:(id)a3;
- (void)setWeeklyReportData:(id)a3;
@end

@implementation STWeeklyReportUserNotificationContext

- (STWeeklyReportUserNotificationContext)init
{
  v6.receiver = self;
  v6.super_class = (Class)STWeeklyReportUserNotificationContext;
  v2 = [(STUserNotificationContext *)&v6 initWithIdentifier:@"weekly_usage_report"];
  v3 = v2;
  if (v2)
  {
    notificationBodyKey = v2->_notificationBodyKey;
    v2->_notificationBodyKey = (NSString *)@"WeeklyReportNotificationDefaultBody";
  }
  return v3;
}

- (STWeeklyReportUserNotificationContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)STWeeklyReportUserNotificationContext;
  v5 = [(STUserNotificationContext *)&v14 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"weeklyReportData"];
    weeklyReportData = v5->_weeklyReportData;
    v5->_weeklyReportData = (NSData *)v6;

    [v4 decodeDoubleForKey:@"deltaScreenTimeUsage"];
    v5->_deltaScreenTimeUsage = v8;
    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"totalUsage"];
    totalUsage = v5->_totalUsage;
    v5->_totalUsage = (NSNumber *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"notificationBodyKey"];
    notificationBodyKey = v5->_notificationBodyKey;
    v5->_notificationBodyKey = (NSString *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STWeeklyReportUserNotificationContext;
  id v4 = a3;
  [(STUserNotificationContext *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_weeklyReportData, @"weeklyReportData", v5.receiver, v5.super_class);
  [v4 encodeDouble:@"deltaScreenTimeUsage" forKey:self->_deltaScreenTimeUsage];
  [v4 encodeObject:self->_totalUsage forKey:@"totalUsage"];
  [v4 encodeObject:self->_notificationBodyKey forKey:@"notificationBodyKey"];
}

- (void)setDeltaScreenTimeUsage:(double)a3 totalUsage:(id)a4
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  [(STWeeklyReportUserNotificationContext *)self setDeltaScreenTimeUsage:a3];
  [(STWeeklyReportUserNotificationContext *)self setTotalUsage:v6];
  v7 = objc_opt_new();
  [v7 setAllowedUnits:96];
  [v7 setUnitsStyle:3];
  [v6 doubleValue];
  double v9 = v8;

  v10 = objc_opt_new();
  [v10 setSecond:(uint64_t)(v9 / 7.0)];
  uint64_t v11 = [v7 stringFromDateComponents:v10];
  if (a3 >= 0.05 && a3 <= 2.0)
  {
    notificationBodyKey = self->_notificationBodyKey;
    self->_notificationBodyKey = (NSString *)@"WeeklyReportNotificationPositiveDeltaBody";

    v17 = (void *)MEMORY[0x1E4F28EE0];
    v18 = [NSNumber numberWithDouble:a3];
    v19 = [v17 localizedStringFromNumber:v18 numberStyle:3];

    v26[0] = v19;
    v26[1] = v11;
    v20 = (void *)MEMORY[0x1E4F1C978];
    v21 = v26;
LABEL_9:
    v22 = [v20 arrayWithObjects:v21 count:2];
    [(STUserNotificationContext *)self setLocalizedUserNotificationBodyArguments:v22];

    goto LABEL_10;
  }
  if (a3 <= -0.05 && a3 >= -0.9)
  {
    v13 = self->_notificationBodyKey;
    self->_notificationBodyKey = (NSString *)@"WeeklyReportNotificationNegativeDeltaBody";

    objc_super v14 = (void *)MEMORY[0x1E4F28EE0];
    v15 = [NSNumber numberWithDouble:-a3];
    v19 = [v14 localizedStringFromNumber:v15 numberStyle:3];

    v25[0] = v19;
    v25[1] = v11;
    v20 = (void *)MEMORY[0x1E4F1C978];
    v21 = v25;
    goto LABEL_9;
  }
  v23 = self->_notificationBodyKey;
  if ((uint64_t)(v9 / 7.0) <= 59)
  {
    self->_notificationBodyKey = (NSString *)@"WeeklyReportNotificationLessThanOneMinute";

    goto LABEL_11;
  }
  self->_notificationBodyKey = (NSString *)@"WeeklyReportNotificationDefaultBody";

  v24 = v11;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  [(STUserNotificationContext *)self setLocalizedUserNotificationBodyArguments:v19];
LABEL_10:

LABEL_11:
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)customizeNotificationContent:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __90__STWeeklyReportUserNotificationContext_customizeNotificationContent_withCompletionBlock___block_invoke;
  v11[3] = &unk_1E6BC6F40;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  v10.receiver = self;
  v10.super_class = (Class)STWeeklyReportUserNotificationContext;
  id v8 = v7;
  id v9 = v6;
  [(STUserNotificationContext *)&v10 customizeNotificationContent:v9 withCompletionBlock:v11];
}

uint64_t __90__STWeeklyReportUserNotificationContext_customizeNotificationContent_withCompletionBlock___block_invoke(uint64_t a1)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v2 = [NSString localizedUserNotificationStringForKey:@"WeeklyReportNotificationTitle" arguments:0];
  [*(id *)(a1 + 32) setTitle:v2];

  v3 = NSString;
  id v4 = [*(id *)(a1 + 40) notificationBodyKey];
  objc_super v5 = [*(id *)(a1 + 40) localizedUserNotificationBodyArguments];
  id v6 = [v3 localizedUserNotificationStringForKey:v4 arguments:v5];
  [*(id *)(a1 + 32) setBody:v6];

  [*(id *)(a1 + 32) setCategoryIdentifier:@"com.apple.screentime.weekly-usage-report"];
  id v7 = [*(id *)(a1 + 40) weeklyReportData];

  if (v7)
  {
    v13 = @"weeklyReportData";
    id v8 = [*(id *)(a1 + 40) weeklyReportData];
    v14[0] = v8;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    [*(id *)(a1 + 32) setUserInfo:v9];
  }
  objc_super v10 = objc_opt_new();
  [v10 setScheme:@"prefs"];
  [v10 setPath:@"root=SCREEN_TIME&path=SCREEN_TIME_SUMMARY"];
  [v10 setFragment:@"WEEK"];
  uint64_t v11 = [v10 URL];

  [*(id *)(a1 + 32) setDefaultActionURL:v11];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (NSData)weeklyReportData
{
  return self->_weeklyReportData;
}

- (void)setWeeklyReportData:(id)a3
{
}

- (double)deltaScreenTimeUsage
{
  return self->_deltaScreenTimeUsage;
}

- (void)setDeltaScreenTimeUsage:(double)a3
{
  self->_deltaScreenTimeUsage = a3;
}

- (NSNumber)totalUsage
{
  return self->_totalUsage;
}

- (void)setTotalUsage:(id)a3
{
}

- (NSString)notificationBodyKey
{
  return self->_notificationBodyKey;
}

- (void)setNotificationBodyKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationBodyKey, 0);
  objc_storeStrong((id *)&self->_totalUsage, 0);
  objc_storeStrong((id *)&self->_weeklyReportData, 0);
}

@end