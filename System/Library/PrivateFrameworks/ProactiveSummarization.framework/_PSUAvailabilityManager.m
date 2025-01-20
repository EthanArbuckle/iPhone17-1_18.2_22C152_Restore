@interface _PSUAvailabilityManager
+ (BOOL)areGenerativeModelsAvailableFor:(id)a3;
- (_PSUAvailabilityManager)init;
@end

@implementation _PSUAvailabilityManager

+ (BOOL)areGenerativeModelsAvailableFor:(id)a3
{
  if (a3)
  {
    os_log_type_t v3 = sub_25A9DCF68();
    uint64_t v5 = v4;
  }
  else
  {
    os_log_type_t v3 = OS_LOG_TYPE_DEFAULT;
    uint64_t v5 = 0;
  }
  char v6 = static AvailabilityManager.areGenerativeModelsAvailable(for:)(v3, v5);
  swift_bridgeObjectRelease();
  return v6 & 1;
}

- (_PSUAvailabilityManager)init
{
  return (_PSUAvailabilityManager *)AvailabilityManager.init()();
}

@end