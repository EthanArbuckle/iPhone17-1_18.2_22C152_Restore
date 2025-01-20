@interface CSDRTCConnectionSetup
+ (id)eventTypeNameFrom:(int64_t)a3;
+ (id)rtcKey:(int64_t)a3;
- (CSDRTCConnectionSetup)init;
@end

@implementation CSDRTCConnectionSetup

+ (id)eventTypeNameFrom:(int64_t)a3
{
  return sub_1003331E8((uint64_t)a1, (uint64_t)a2, a3, (void (*)(uint64_t))sub_100333060);
}

+ (id)rtcKey:(int64_t)a3
{
  return sub_1003331E8((uint64_t)a1, (uint64_t)a2, a3, (void (*)(uint64_t))sub_100333148);
}

- (CSDRTCConnectionSetup)init
{
  return (CSDRTCConnectionSetup *)sub_1002CBFB8();
}

@end