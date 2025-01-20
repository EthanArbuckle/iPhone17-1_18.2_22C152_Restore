@interface STDeviceActivityDataSourceInterface
+ (BOOL)hasDataForUserWithAltDSID:(id)a3 userDeviceStates:(id)a4;
+ (NSArray)allLocallyUsedBundleIdentifiers;
+ (NSDictionary)deviceIdentifiersByUserAltDSID;
+ (id)lastUpdatedDateFor:(id)a3;
+ (id)totalWeeklyUsageDuringDateInterval:(id)a3 userAltDSID:(id)a4 error:(id *)a5;
+ (void)downloadRemoteData;
+ (void)refreshAndUploadLocalDataSinceDate:(id)a3 completionHandler:(id)a4;
+ (void)setGenesisDate:(id)a3;
@end

@implementation STDeviceActivityDataSourceInterface

+ (NSDictionary)deviceIdentifiersByUserAltDSID
{
  return +[STDeviceActivityDataSource deviceIdentifiersByUserAltDSID];
}

+ (NSArray)allLocallyUsedBundleIdentifiers
{
  return +[STDeviceActivityDataSource allLocallyUsedBundleIdentifiers];
}

+ (void)setGenesisDate:(id)a3
{
}

+ (id)totalWeeklyUsageDuringDateInterval:(id)a3 userAltDSID:(id)a4 error:(id *)a5
{
  return +[STDeviceActivityDataSource totalWeeklyUsageDuringDateInterval:a3 userAltDSID:a4 error:a5];
}

+ (id)lastUpdatedDateFor:(id)a3
{
  return +[STDeviceActivityDataSource lastUpdatedDateFor:a3];
}

+ (void)refreshAndUploadLocalDataSinceDate:(id)a3 completionHandler:(id)a4
{
}

+ (void)downloadRemoteData
{
}

+ (BOOL)hasDataForUserWithAltDSID:(id)a3 userDeviceStates:(id)a4
{
  return +[STDeviceActivityDataSource hasDataForUserWithAltDSID:a3 userDeviceStates:a4];
}

@end