@interface SSMetricsAppInstallEvent
+ (id)_stringForInstallStatus:(unint64_t)a3;
+ (id)_stringForInstallType:(unint64_t)a3;
+ (unint64_t)_installStatusForString:(id)a3;
+ (unint64_t)_installTypeForString:(id)a3;
- (BOOL)requiresDiagnosticSendingPermission;
- (NSString)buildVersion;
- (NSString)bundleID;
- (NSString)hardwareType;
- (NSString)installError;
- (SSMetricsAppInstallEvent)init;
- (id)description;
- (int64_t)jobID;
- (unint64_t)installStatus;
- (unint64_t)installType;
- (void)setBuildVersion:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setHardwareType:(id)a3;
- (void)setInstallError:(id)a3;
- (void)setInstallStatus:(unint64_t)a3;
- (void)setInstallType:(unint64_t)a3;
- (void)setJobID:(int64_t)a3;
@end

@implementation SSMetricsAppInstallEvent

- (SSMetricsAppInstallEvent)init
{
  v5.receiver = self;
  v5.super_class = (Class)SSMetricsAppInstallEvent;
  v2 = [(SSMetricsMutableEvent *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(SSMetricsMutableEvent *)v2 setProperty:&unk_1EF9A9930 forBodyKey:@"clientId"];
    [(SSMetricsMutableEvent *)v3 setEventType:@"appInstall"];
    [(SSMetricsMutableEvent *)v3 setTopic:@"xp_amp_app_install"];
  }
  return v3;
}

- (NSString)buildVersion
{
  return (NSString *)[(SSMetricsMutableEvent *)self propertyForBodyKey:@"buildVersion"];
}

- (NSString)bundleID
{
  return (NSString *)[(SSMetricsMutableEvent *)self propertyForBodyKey:@"bundleId"];
}

- (NSString)hardwareType
{
  return (NSString *)[(SSMetricsMutableEvent *)self propertyForBodyKey:@"hardwareType"];
}

- (NSString)installError
{
  return (NSString *)[(SSMetricsMutableEvent *)self propertyForBodyKey:@"installError"];
}

- (unint64_t)installStatus
{
  v3 = objc_opt_class();
  v4 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"installStatus"];
  unint64_t v5 = [v3 _installStatusForString:v4];

  return v5;
}

- (unint64_t)installType
{
  v3 = objc_opt_class();
  v4 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"installType"];
  unint64_t v5 = [v3 _installTypeForString:v4];

  return v5;
}

- (int64_t)jobID
{
  v2 = [(SSMetricsMutableEvent *)self propertyForBodyKey:@"jobId"];
  int64_t v3 = [v2 longLongValue];

  return v3;
}

- (void)setBuildVersion:(id)a3
{
}

- (void)setBundleID:(id)a3
{
}

- (void)setHardwareType:(id)a3
{
}

- (void)setInstallError:(id)a3
{
}

- (void)setInstallStatus:(unint64_t)a3
{
  id v4 = [(id)objc_opt_class() _stringForInstallStatus:a3];
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"installStatus"];
}

- (void)setInstallType:(unint64_t)a3
{
  id v4 = [(id)objc_opt_class() _stringForInstallType:a3];
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"installType"];
}

- (void)setJobID:(int64_t)a3
{
  id v4 = [NSNumber numberWithLongLong:a3];
  [(SSMetricsMutableEvent *)self setProperty:v4 forBodyKey:@"jobId"];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v12.receiver = self;
  v12.super_class = (Class)SSMetricsAppInstallEvent;
  id v4 = [(SSMetricsAppInstallEvent *)&v12 description];
  [v3 appendString:v4];

  unint64_t v5 = [(SSMetricsAppInstallEvent *)self buildVersion];
  [v3 appendFormat:@"\nbuildVersion = %@", v5];

  v6 = [(SSMetricsAppInstallEvent *)self bundleID];
  [v3 appendFormat:@"\nbundleID = %@", v6];

  v7 = [(SSMetricsAppInstallEvent *)self hardwareType];
  [v3 appendFormat:@"\nhardwareType = %@", v7];

  v8 = [(SSMetricsAppInstallEvent *)self installError];
  [v3 appendFormat:@"\ninstallError = %@", v8];

  v9 = objc_msgSend((id)objc_opt_class(), "_stringForInstallStatus:", -[SSMetricsAppInstallEvent installStatus](self, "installStatus"));
  [v3 appendFormat:@"\ninstallStatus = %@", v9];

  v10 = objc_msgSend((id)objc_opt_class(), "_stringForInstallType:", -[SSMetricsAppInstallEvent installType](self, "installType"));
  [v3 appendFormat:@"\ninstallType = %@", v10];

  objc_msgSend(v3, "appendFormat:", @"\njobID = %lld", -[SSMetricsAppInstallEvent jobID](self, "jobID"));
  return v3;
}

- (BOOL)requiresDiagnosticSendingPermission
{
  return 1;
}

+ (unint64_t)_installStatusForString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Cancelled"])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"Failed"])
  {
    unint64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"FailedAssetBlocked"])
  {
    unint64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"FailedDownloadRemoved"])
  {
    unint64_t v4 = 5;
  }
  else if ([v3 isEqualToString:@"FailedInstallVerification"])
  {
    unint64_t v4 = 6;
  }
  else if ([v3 isEqualToString:@"FailedKeepSafeHarborContainer"])
  {
    unint64_t v4 = 7;
  }
  else if ([v3 isEqualToString:@"FailedPermanently"])
  {
    unint64_t v4 = 8;
  }
  else if ([v3 isEqualToString:@"Started"])
  {
    unint64_t v4 = 0;
  }
  else
  {
    unint64_t v4 = [v3 isEqualToString:@"Succeeded"];
  }

  return v4;
}

+ (unint64_t)_installTypeForString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AutoStoreQueue"])
  {
    unint64_t v4 = 7;
  }
  else if ([v3 isEqualToString:@"AutoUpdate"])
  {
    unint64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"External"])
  {
    unint64_t v4 = 0;
  }
  else if ([v3 isEqualToString:@"Internal"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"ManualUpdate"])
  {
    unint64_t v4 = 5;
  }
  else if ([v3 isEqualToString:@"PerDevice"])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"Restore"])
  {
    unint64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"RestoreDemoted"])
  {
    unint64_t v4 = 9;
  }
  else if ([v3 isEqualToString:@"StoreQueue"])
  {
    unint64_t v4 = 6;
  }
  else if ([v3 isEqualToString:@"VPP"])
  {
    unint64_t v4 = 8;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

+ (id)_stringForInstallStatus:(unint64_t)a3
{
  if (a3 > 8) {
    return @"Cancelled";
  }
  else {
    return off_1E5BAE398[a3];
  }
}

+ (id)_stringForInstallType:(unint64_t)a3
{
  if (a3 > 9) {
    return @"AutoStoreQueue";
  }
  else {
    return off_1E5BAE3E0[a3];
  }
}

@end