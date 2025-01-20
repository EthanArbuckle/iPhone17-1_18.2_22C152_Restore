@interface NHOElectricityUsageIntent
- (NHOElectricityUsageIntent)init;
- (NSString)homeID;
- (NSString)homeName;
- (void)setHomeID:(id)a3;
- (void)setHomeName:(id)a3;
@end

@implementation NHOElectricityUsageIntent

- (NSString)homeID
{
  return (NSString *)sub_257300B88(self);
}

- (void)setHomeID:(id)a3
{
}

- (NSString)homeName
{
  return (NSString *)sub_257300B88(self);
}

- (void)setHomeName:(id)a3
{
}

- (NHOElectricityUsageIntent)init
{
  return (NHOElectricityUsageIntent *)ElectricityUsageIntent.init()();
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();
}

@end