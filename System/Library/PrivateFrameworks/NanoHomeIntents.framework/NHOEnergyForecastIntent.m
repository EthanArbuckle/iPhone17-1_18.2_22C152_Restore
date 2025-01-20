@interface NHOEnergyForecastIntent
- (NHOEnergyForecastIntent)init;
- (NSString)homeIdentifier;
- (NSString)homeName;
- (void)setHomeIdentifier:(id)a3;
- (void)setHomeName:(id)a3;
@end

@implementation NHOEnergyForecastIntent

- (NSString)homeIdentifier
{
  return (NSString *)sub_257300B88(self);
}

- (void)setHomeIdentifier:(id)a3
{
}

- (NSString)homeName
{
  return (NSString *)sub_257300B88(self);
}

- (void)setHomeName:(id)a3
{
}

- (NHOEnergyForecastIntent)init
{
  return (NHOEnergyForecastIntent *)EnergyForecastIntent.init()();
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();
}

@end