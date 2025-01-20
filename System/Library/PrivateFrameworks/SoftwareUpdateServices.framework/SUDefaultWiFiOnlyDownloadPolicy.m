@interface SUDefaultWiFiOnlyDownloadPolicy
+ (unint64_t)wifiOnlyPeriodInDaysForUpdate:(id)a3;
- (BOOL)allowExpensiveNetwork;
- (BOOL)isDownloadAllowableForCellular;
- (SUDefaultWiFiOnlyDownloadPolicy)initWithDescriptor:(id)a3;
@end

@implementation SUDefaultWiFiOnlyDownloadPolicy

+ (unint64_t)wifiOnlyPeriodInDaysForUpdate:(id)a3
{
  if ([a3 updateType] == 3) {
    return 0;
  }
  else {
    return 7;
  }
}

- (SUDefaultWiFiOnlyDownloadPolicy)initWithDescriptor:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUDefaultWiFiOnlyDownloadPolicy;
  v3 = [(SUDefaultDownloadPolicy *)&v6 initWithDescriptor:a3];
  v4 = v3;
  if (v3)
  {
    v3->super._cellularCapable = 0;
    [(SUDefaultDownloadPolicy *)v3 setCarrierPolicy:0];
  }
  return v4;
}

- (BOOL)isDownloadAllowableForCellular
{
  SULogInfo(@"Cellular download not allowable due to SUDefaultWiFiOnlyDownloadPolicy", (uint64_t)a2, v2, v3, v4, v5, v6, v7, vars0);
  return 0;
}

- (BOOL)allowExpensiveNetwork
{
  SULogInfo(@"Expensive network download not allowable due to SUDefaultWiFiOnlyDownloadPolicy", (uint64_t)a2, v2, v3, v4, v5, v6, v7, vars0);
  return 0;
}

@end