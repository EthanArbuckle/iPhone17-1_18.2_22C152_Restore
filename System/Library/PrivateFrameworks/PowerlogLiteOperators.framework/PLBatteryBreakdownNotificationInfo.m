@interface PLBatteryBreakdownNotificationInfo
+ (double)representativeDisplayPower;
- (BOOL)isFirstParty;
- (NSString)bundleID;
- (PLBatteryBreakdownNotificationInfo)initWithEntry:(id)a3;
- (double)activeEnergy;
- (double)baseEnergy;
- (double)bgWakingNSEDuration;
- (double)calculateActiveEnergyForNSEDuration:(double)a3 andCount:(unint64_t)a4 withNominalEnergy:(double)a5;
- (double)displayEnergy;
- (double)fgWakingNSEDuration;
- (double)nonWakingNSEDuration;
- (double)notificationEnergy;
- (id)description;
- (int)notificationType;
- (unint64_t)bgWakingCount;
- (unint64_t)fgWakingCount;
- (unint64_t)localCount;
- (unint64_t)nonWakingCount;
- (void)combineWith:(id)a3;
- (void)setBgWakingCount:(unint64_t)a3;
- (void)setBgWakingNSEDuration:(double)a3;
- (void)setBundleID:(id)a3;
- (void)setFgWakingCount:(unint64_t)a3;
- (void)setFgWakingNSEDuration:(double)a3;
- (void)setIsFirstParty:(BOOL)a3;
- (void)setLocalCount:(unint64_t)a3;
- (void)setNonWakingCount:(unint64_t)a3;
- (void)setNonWakingNSEDuration:(double)a3;
- (void)setNotificationType:(int)a3;
@end

@implementation PLBatteryBreakdownNotificationInfo

- (PLBatteryBreakdownNotificationInfo)initWithEntry:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"NotificationBundleID"];
  if (!v5) {
    goto LABEL_14;
  }
  uint64_t v6 = [v4 objectForKeyedSubscript:@"NotificationType"];
  if (!v6) {
    goto LABEL_10;
  }
  v7 = (void *)v6;
  uint64_t v8 = [v4 objectForKeyedSubscript:@"BgWakingCount"];
  if (!v8)
  {

LABEL_10:
    goto LABEL_11;
  }
  v9 = (void *)v8;
  v10 = [v4 objectForKeyedSubscript:@"BgWakingNSEDuration"];

  if (!v10)
  {
LABEL_11:
    v5 = 0;
    goto LABEL_14;
  }
  v27.receiver = self;
  v27.super_class = (Class)PLBatteryBreakdownNotificationInfo;
  v11 = [(PLBatteryBreakdownNotificationInfo *)&v27 init];
  if (v11)
  {
    v12 = [v4 objectForKeyedSubscript:@"NotificationBundleID"];
    [(PLBatteryBreakdownNotificationInfo *)v11 setBundleID:v12];

    v13 = [(PLBatteryBreakdownNotificationInfo *)v11 bundleID];
    -[PLBatteryBreakdownNotificationInfo setIsFirstParty:](v11, "setIsFirstParty:", [v13 hasPrefix:@"com.apple."]);

    v14 = [v4 objectForKeyedSubscript:@"NotificationType"];
    -[PLBatteryBreakdownNotificationInfo setNotificationType:](v11, "setNotificationType:", [v14 intValue]);

    if (![(PLBatteryBreakdownNotificationInfo *)v11 notificationType]
      || [(PLBatteryBreakdownNotificationInfo *)v11 notificationType] == -1)
    {
      [(PLBatteryBreakdownNotificationInfo *)v11 setBgWakingCount:0];
      [(PLBatteryBreakdownNotificationInfo *)v11 setBgWakingNSEDuration:0.0];
      [(PLBatteryBreakdownNotificationInfo *)v11 setFgWakingCount:0];
      [(PLBatteryBreakdownNotificationInfo *)v11 setFgWakingNSEDuration:0.0];
      [(PLBatteryBreakdownNotificationInfo *)v11 setNonWakingCount:0];
      [(PLBatteryBreakdownNotificationInfo *)v11 setNonWakingNSEDuration:0.0];
      v21 = [v4 objectForKeyedSubscript:@"BgWakingCount"];
      int v22 = [v21 intValue];
      v23 = [v4 objectForKeyedSubscript:@"FgWakingCount"];
      int v24 = [v23 intValue] + v22;
      v25 = [v4 objectForKeyedSubscript:@"NonWakingCount"];
      -[PLBatteryBreakdownNotificationInfo setLocalCount:](v11, "setLocalCount:", (int)(v24 + [v25 intValue]));
    }
    else
    {
      v15 = [v4 objectForKeyedSubscript:@"BgWakingCount"];
      -[PLBatteryBreakdownNotificationInfo setBgWakingCount:](v11, "setBgWakingCount:", (int)[v15 intValue]);

      v16 = [v4 objectForKeyedSubscript:@"BgWakingNSEDuration"];
      [v16 doubleValue];
      -[PLBatteryBreakdownNotificationInfo setBgWakingNSEDuration:](v11, "setBgWakingNSEDuration:");

      v17 = [v4 objectForKeyedSubscript:@"FgWakingCount"];
      -[PLBatteryBreakdownNotificationInfo setFgWakingCount:](v11, "setFgWakingCount:", (int)[v17 intValue]);

      v18 = [v4 objectForKeyedSubscript:@"FgWakingNSEDuration"];
      [v18 doubleValue];
      -[PLBatteryBreakdownNotificationInfo setFgWakingNSEDuration:](v11, "setFgWakingNSEDuration:");

      v19 = [v4 objectForKeyedSubscript:@"NonWakingCount"];
      -[PLBatteryBreakdownNotificationInfo setNonWakingCount:](v11, "setNonWakingCount:", (int)[v19 intValue]);

      v20 = [v4 objectForKeyedSubscript:@"NonWakingNSEDuration"];
      [v20 doubleValue];
      -[PLBatteryBreakdownNotificationInfo setNonWakingNSEDuration:](v11, "setNonWakingNSEDuration:");

      [(PLBatteryBreakdownNotificationInfo *)v11 setLocalCount:0];
    }
  }
  self = v11;
  v5 = self;
LABEL_14:

  return v5;
}

- (id)description
{
  v3 = NSString;
  unint64_t v4 = [(PLBatteryBreakdownNotificationInfo *)self fgWakingCount];
  [(PLBatteryBreakdownNotificationInfo *)self fgWakingNSEDuration];
  uint64_t v6 = v5;
  unint64_t v7 = [(PLBatteryBreakdownNotificationInfo *)self bgWakingCount];
  [(PLBatteryBreakdownNotificationInfo *)self bgWakingNSEDuration];
  uint64_t v9 = v8;
  unint64_t v10 = [(PLBatteryBreakdownNotificationInfo *)self nonWakingCount];
  [(PLBatteryBreakdownNotificationInfo *)self nonWakingNSEDuration];
  uint64_t v12 = v11;
  unint64_t v13 = [(PLBatteryBreakdownNotificationInfo *)self localCount];
  [(PLBatteryBreakdownNotificationInfo *)self activeEnergy];
  uint64_t v15 = v14;
  [(PLBatteryBreakdownNotificationInfo *)self baseEnergy];
  uint64_t v17 = v16;
  [(PLBatteryBreakdownNotificationInfo *)self displayEnergy];
  return (id)[v3 stringWithFormat:@"FG Wake: %zu %.2fs, BG Wake: %zu %.2fs, Non-Wake: %zu %.2fs, Local: %zu, active: %.2f, base: %.2f, disp: %.2f", v4, v6, v7, v9, v10, v12, v13, v15, v17, v18];
}

- (void)combineWith:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    -[PLBatteryBreakdownNotificationInfo setBgWakingCount:](self, "setBgWakingCount:", -[PLBatteryBreakdownNotificationInfo bgWakingCount](self, "bgWakingCount") + [v4 bgWakingCount]);
    [v4 bgWakingNSEDuration];
    double v6 = v5;
    [(PLBatteryBreakdownNotificationInfo *)self bgWakingNSEDuration];
    [(PLBatteryBreakdownNotificationInfo *)self setBgWakingNSEDuration:v6 + v7];
    -[PLBatteryBreakdownNotificationInfo setFgWakingCount:](self, "setFgWakingCount:", -[PLBatteryBreakdownNotificationInfo fgWakingCount](self, "fgWakingCount") + [v4 fgWakingCount]);
    [v4 fgWakingNSEDuration];
    double v9 = v8;
    [(PLBatteryBreakdownNotificationInfo *)self fgWakingNSEDuration];
    [(PLBatteryBreakdownNotificationInfo *)self setFgWakingNSEDuration:v9 + v10];
    -[PLBatteryBreakdownNotificationInfo setNonWakingCount:](self, "setNonWakingCount:", -[PLBatteryBreakdownNotificationInfo nonWakingCount](self, "nonWakingCount") + [v4 nonWakingCount]);
    [v4 nonWakingNSEDuration];
    double v12 = v11;
    [(PLBatteryBreakdownNotificationInfo *)self nonWakingNSEDuration];
    [(PLBatteryBreakdownNotificationInfo *)self setNonWakingNSEDuration:v12 + v13];
    uint64_t v14 = [v4 localCount];

    unint64_t v15 = [(PLBatteryBreakdownNotificationInfo *)self localCount] + v14;
    [(PLBatteryBreakdownNotificationInfo *)self setLocalCount:v15];
  }
}

- (double)activeEnergy
{
  [(PLBatteryBreakdownNotificationInfo *)self fgWakingNSEDuration];
  double v3 = 0.1;
  [(PLBatteryBreakdownNotificationInfo *)self calculateActiveEnergyForNSEDuration:[(PLBatteryBreakdownNotificationInfo *)self fgWakingCount] andCount:v4 withNominalEnergy:0.1];
  double v6 = v5;
  [(PLBatteryBreakdownNotificationInfo *)self bgWakingNSEDuration];
  [(PLBatteryBreakdownNotificationInfo *)self calculateActiveEnergyForNSEDuration:[(PLBatteryBreakdownNotificationInfo *)self bgWakingCount] andCount:v7 withNominalEnergy:0.1];
  double v9 = v8;
  [(PLBatteryBreakdownNotificationInfo *)self nonWakingNSEDuration];
  [(PLBatteryBreakdownNotificationInfo *)self calculateActiveEnergyForNSEDuration:[(PLBatteryBreakdownNotificationInfo *)self nonWakingCount] andCount:v10 withNominalEnergy:0.1];
  double v12 = v11;
  if ([(PLBatteryBreakdownNotificationInfo *)self isFirstParty])
  {
    double v13 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"com.apple.MobileSMS", @"com.apple.mobilemail", @"com.apple.mobilecal", 0);
    uint64_t v14 = [(PLBatteryBreakdownNotificationInfo *)self bundleID];
    int v15 = [v13 containsObject:v14];

    if (v15) {
      double v3 = 1.0;
    }
    else {
      double v3 = 0.2;
    }
  }
  [(PLBatteryBreakdownNotificationInfo *)self calculateActiveEnergyForNSEDuration:[(PLBatteryBreakdownNotificationInfo *)self localCount] andCount:0.0 withNominalEnergy:v3];
  return v6 + 0.0 + v9 + v12 + v16;
}

- (double)calculateActiveEnergyForNSEDuration:(double)a3 andCount:(unint64_t)a4 withNominalEnergy:(double)a5
{
  if (a3 > 0.0)
  {
    double v5 = a3 / 3600.0;
    a5 = 750.0;
    return v5 * a5;
  }
  if (a4)
  {
    double v5 = (double)a4;
    return v5 * a5;
  }
  return 0.0;
}

- (double)baseEnergy
{
  unint64_t v3 = [(PLBatteryBreakdownNotificationInfo *)self fgWakingCount];
  return (double)([(PLBatteryBreakdownNotificationInfo *)self bgWakingCount] + v3) * 0.416666667;
}

- (double)displayEnergy
{
  +[PLBatteryBreakdownNotificationInfo representativeDisplayPower];
  return v3 * ((double)[(PLBatteryBreakdownNotificationInfo *)self fgWakingCount] * 0.00277777778);
}

- (double)notificationEnergy
{
  [(PLBatteryBreakdownNotificationInfo *)self baseEnergy];
  double v4 = v3;
  [(PLBatteryBreakdownNotificationInfo *)self activeEnergy];
  double v6 = v4 + v5;
  [(PLBatteryBreakdownNotificationInfo *)self displayEnergy];
  return v6 + v7;
}

+ (double)representativeDisplayPower
{
  if (_MergedGlobals_110 != -1) {
    dispatch_once(&_MergedGlobals_110, &__block_literal_global_50);
  }
  return *(double *)&qword_1EBD5C640;
}

void __64__PLBatteryBreakdownNotificationInfo_representativeDisplayPower__block_invoke()
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F92BB8];
  v1 = [NSString stringWithFormat:@"SELECT AVG(%@) AS %@ FROM %@ WHERE %@=%@ AND %@>0 LIMIT %d", *MEMORY[0x1E4F92BB8], *MEMORY[0x1E4F92BB8], @"%@", *MEMORY[0x1E4F92BC0], @"%d", *MEMORY[0x1E4F92BB8], 100];
  uint64_t v2 = *MEMORY[0x1E4F92BB0];
  double v3 = [MEMORY[0x1E4F92968] entryKeyForType:*MEMORY[0x1E4F92D30] andName:*MEMORY[0x1E4F92BB0]];
  double v4 = objc_msgSend(NSString, "stringWithFormat:", v1, v3, 10);
  double v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v4;
    _os_log_debug_impl(&dword_1D2690000, v5, OS_LOG_TYPE_DEBUG, "displayPower: running query %@", buf, 0xCu);
  }

  double v6 = [MEMORY[0x1E4F92AD0] sharedCore];
  double v7 = [v6 storage];
  double v8 = [v7 entriesForKey:v3 withQuery:v4];

  double v9 = [v8 firstObject];
  double v10 = v9;
  if (v9)
  {
    double v11 = [v9 objectForKeyedSubscript:v0];
    [v11 doubleValue];
    double v13 = v12 / 1000.0;
  }
  else
  {
    double v13 = 0.0;
  }
  uint64_t v14 = [MEMORY[0x1E4F92968] entryKeyForType:*MEMORY[0x1E4F92D38] andName:v2];

  int v15 = objc_msgSend(NSString, "stringWithFormat:", v1, v14, 56);

  double v16 = PLLogCommon();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v15;
    _os_log_debug_impl(&dword_1D2690000, v16, OS_LOG_TYPE_DEBUG, "dynamicDisplayPower: running query %@", buf, 0xCu);
  }

  uint64_t v17 = [MEMORY[0x1E4F92AD0] sharedCore];
  uint64_t v18 = [v17 storage];
  v19 = [v18 entriesForKey:v14 withQuery:v15];

  v20 = [v19 firstObject];

  if (v20)
  {
    v21 = [v20 objectForKeyedSubscript:v0];
    [v21 doubleValue];
    double v23 = v22 / 1000.0;
  }
  else
  {
    double v23 = 0.0;
  }
  *(double *)&qword_1EBD5C640 = v13 + v23;
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBundleID:(id)a3
{
}

- (BOOL)isFirstParty
{
  return self->_isFirstParty;
}

- (void)setIsFirstParty:(BOOL)a3
{
  self->_isFirstParty = a3;
}

- (int)notificationType
{
  return self->_notificationType;
}

- (void)setNotificationType:(int)a3
{
  self->_notificationType = a3;
}

- (unint64_t)bgWakingCount
{
  return self->_bgWakingCount;
}

- (void)setBgWakingCount:(unint64_t)a3
{
  self->_bgWakingCount = a3;
}

- (double)bgWakingNSEDuration
{
  return self->_bgWakingNSEDuration;
}

- (void)setBgWakingNSEDuration:(double)a3
{
  self->_bgWakingNSEDuration = a3;
}

- (unint64_t)fgWakingCount
{
  return self->_fgWakingCount;
}

- (void)setFgWakingCount:(unint64_t)a3
{
  self->_fgWakingCount = a3;
}

- (double)fgWakingNSEDuration
{
  return self->_fgWakingNSEDuration;
}

- (void)setFgWakingNSEDuration:(double)a3
{
  self->_fgWakingNSEDuration = a3;
}

- (unint64_t)nonWakingCount
{
  return self->_nonWakingCount;
}

- (void)setNonWakingCount:(unint64_t)a3
{
  self->_nonWakingCount = a3;
}

- (double)nonWakingNSEDuration
{
  return self->_nonWakingNSEDuration;
}

- (void)setNonWakingNSEDuration:(double)a3
{
  self->_nonWakingNSEDuration = a3;
}

- (unint64_t)localCount
{
  return self->_localCount;
}

- (void)setLocalCount:(unint64_t)a3
{
  self->_localCount = a3;
}

- (void).cxx_destruct
{
}

@end