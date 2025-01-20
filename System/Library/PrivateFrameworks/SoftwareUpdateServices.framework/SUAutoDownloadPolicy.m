@interface SUAutoDownloadPolicy
- (BOOL)allowExpensiveNetwork;
- (BOOL)batteryPolicySatisfied;
- (BOOL)is5GDownloadAllowed;
- (BOOL)isDownloadAllowableForCellular;
- (BOOL)isPowerRequired;
- (SUAutoDownloadPolicy)initWithDescriptor:(id)a3;
- (id)computAutoDownloadEndDateFromDate:(id)a3;
- (id)computeTimeOfWifiOnlyPeriodEndFromDate:(id)a3;
- (id)createSpaceOptions;
- (unint64_t)wifiOnlyPeriodInDays;
@end

@implementation SUAutoDownloadPolicy

- (BOOL)isPowerRequired
{
  return 0;
}

- (BOOL)batteryPolicySatisfied
{
  return 1;
}

- (id)createSpaceOptions
{
  v9 = [(SUDefaultDownloadPolicy *)self descriptor];
  if (v9)
  {
    v10 = objc_alloc_init(SUSpacePurgeOptions);
    [(SUSpacePurgeOptions *)v10 setNeededBytes:+[SUUtility totalDiskSpaceForUpdate:v9]];
    [(SUSpacePurgeOptions *)v10 setEnableAppOffload:0];
    [(SUSpacePurgeOptions *)v10 setEnableCacheDelete:1];
    [(SUSpacePurgeOptions *)v10 setCacheDeleteUrgency:4];
  }
  else
  {
    SULogInfo(@"Unable to create space options for null descriptor", v2, v3, v4, v5, v6, v7, v8, v12);
    v10 = 0;
  }

  return v10;
}

- (SUAutoDownloadPolicy)initWithDescriptor:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUAutoDownloadPolicy;
  uint64_t v3 = [(SUDefaultDownloadPolicy *)&v6 initWithDescriptor:a3];
  uint64_t v4 = v3;
  if (v3)
  {
    v3->super._cellularCapable = 0;
    [(SUDefaultDownloadPolicy *)v3 setCarrierPolicy:0];
  }
  return v4;
}

- (BOOL)isDownloadAllowableForCellular
{
  SULogInfo(@"Cellular download not allowable due to SUAutoDownloadPolicy", (uint64_t)a2, v2, v3, v4, v5, v6, v7, vars0);
  return 0;
}

- (BOOL)allowExpensiveNetwork
{
  SULogInfo(@"Expensive network download not allowable due to SUAutoDownloadPolicy", (uint64_t)a2, v2, v3, v4, v5, v6, v7, vars0);
  return 0;
}

- (BOOL)is5GDownloadAllowed
{
  return 0;
}

- (unint64_t)wifiOnlyPeriodInDays
{
  return 7;
}

- (id)computAutoDownloadEndDateFromDate:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x263EFF910] date];
  }
  uint64_t v6 = v5;
  uint64_t v7 = +[SUUtility addToDate:v5 numberOfDays:90];

  return v7;
}

- (id)computeTimeOfWifiOnlyPeriodEndFromDate:(id)a3
{
  id v4 = a3;
  id v5 = +[SUUtility addToDate:v4 numberOfDays:[(SUAutoDownloadPolicy *)self wifiOnlyPeriodInDays]];

  return v5;
}

@end