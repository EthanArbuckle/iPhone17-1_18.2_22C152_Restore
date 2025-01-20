@interface NHOIntentLocalization
+ (NSString)actionSetRectangularWidgetText;
+ (NSString)currentLocationEnergyWidgetName;
+ (NSString)electricityRatesWidgetName;
+ (NSString)electricityUsageWidgetName;
+ (NSString)forecastEnergyWidgetName;
+ (NSString)launcherWidgetName;
+ (NSString)smartStackWidgetName;
+ (id)homeSpecificElectricityRatesWidgetNameWithHomeName:(id)a3;
+ (id)homeSpecificElectricityUsageWidgetNameWithHomeName:(id)a3;
+ (id)homeSpecificEnergyWidgetNameWithHomeName:(id)a3;
- (NHOIntentLocalization)init;
@end

@implementation NHOIntentLocalization

+ (NSString)launcherWidgetName
{
  return (NSString *)sub_2573033C0((uint64_t)a1, (uint64_t)a2, &qword_269FE5280);
}

+ (NSString)smartStackWidgetName
{
  return (NSString *)sub_2573033C0((uint64_t)a1, (uint64_t)a2, &qword_269FE5288);
}

+ (NSString)actionSetRectangularWidgetText
{
  return (NSString *)sub_2573033C0((uint64_t)a1, (uint64_t)a2, &qword_269FE5290);
}

+ (NSString)forecastEnergyWidgetName
{
  return (NSString *)sub_2573033C0((uint64_t)a1, (uint64_t)a2, &qword_269FE5298);
}

+ (NSString)currentLocationEnergyWidgetName
{
  return (NSString *)sub_2573033C0((uint64_t)a1, (uint64_t)a2, &qword_269FE52A0);
}

+ (id)homeSpecificEnergyWidgetNameWithHomeName:(id)a3
{
  return sub_25730352C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, 0xD000000000000014, 0x8000000257324140);
}

+ (NSString)electricityUsageWidgetName
{
  return (NSString *)sub_2573033C0((uint64_t)a1, (uint64_t)a2, &qword_269FE52A8);
}

+ (id)homeSpecificElectricityUsageWidgetNameWithHomeName:(id)a3
{
  return sub_25730352C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, 0xD000000000000020, 0x8000000257324160);
}

+ (NSString)electricityRatesWidgetName
{
  return (NSString *)sub_2573033C0((uint64_t)a1, (uint64_t)a2, &qword_269FE52B0);
}

+ (id)homeSpecificElectricityRatesWidgetNameWithHomeName:(id)a3
{
  return sub_25730352C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, 0xD000000000000020, 0x8000000257324190);
}

- (NHOIntentLocalization)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(NHOIntentLocalization *)&v3 init];
}

@end