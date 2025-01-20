@interface NHOWidgetKind
+ (NSString)Accessory;
+ (NSString)ActionSets;
+ (NSString)ElectricityRates;
+ (NSString)ElectricityUsage;
+ (NSString)Energy;
+ (NSString)Launcher;
+ (NSString)SmartStack;
- (NHOWidgetKind)init;
@end

@implementation NHOWidgetKind

+ (NSString)Launcher
{
  v2 = (void *)sub_2573217E8();

  return (NSString *)v2;
}

+ (NSString)Energy
{
  v2 = (void *)sub_2573217E8();

  return (NSString *)v2;
}

+ (NSString)Accessory
{
  v2 = (void *)sub_2573217E8();

  return (NSString *)v2;
}

+ (NSString)ActionSets
{
  v2 = (void *)sub_2573217E8();

  return (NSString *)v2;
}

+ (NSString)SmartStack
{
  v2 = (void *)sub_2573217E8();

  return (NSString *)v2;
}

+ (NSString)ElectricityUsage
{
  v2 = (void *)sub_2573217E8();

  return (NSString *)v2;
}

+ (NSString)ElectricityRates
{
  v2 = (void *)sub_2573217E8();

  return (NSString *)v2;
}

- (NHOWidgetKind)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for NHOIntentConstants.WidgetKind();
  return [(NHOWidgetKind *)&v3 init];
}

@end