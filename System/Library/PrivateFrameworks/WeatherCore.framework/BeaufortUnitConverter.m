@interface BeaufortUnitConverter
- (_TtC11WeatherCoreP33_30B0A2E57627C8F615A189740ACD299621BeaufortUnitConverter)init;
- (double)baseUnitValueFromValue:(double)a3;
- (double)valueFromBaseUnitValue:(double)a3;
@end

@implementation BeaufortUnitConverter

- (double)valueFromBaseUnitValue:(double)a3
{
  return sub_1B4A56578(a3);
}

- (double)baseUnitValueFromValue:(double)a3
{
  v4 = self;
  double v5 = sub_1B4A565E0(a3);

  return v5;
}

- (_TtC11WeatherCoreP33_30B0A2E57627C8F615A189740ACD299621BeaufortUnitConverter)init
{
  return (_TtC11WeatherCoreP33_30B0A2E57627C8F615A189740ACD299621BeaufortUnitConverter *)sub_1B4A56674();
}

@end