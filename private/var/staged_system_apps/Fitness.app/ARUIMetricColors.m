@interface ARUIMetricColors
+ (id)intervalColors;
+ (id)metricColorsForWorkout:(id)a3;
+ (id)mindfulnessColors;
+ (id)pacerColors;
+ (id)raceAheadColors;
+ (id)raceBehindColors;
@end

@implementation ARUIMetricColors

+ (id)metricColorsForWorkout:(id)a3
{
  id v3 = a3;
  id v4 = sub_1004A4E6C(v3);

  return v4;
}

+ (id)pacerColors
{
  id v2 = sub_1004A4CB4();

  return v2;
}

+ (id)intervalColors
{
  id v2 = sub_1004A4944();

  return v2;
}

+ (id)raceAheadColors
{
  id v2 = sub_1004A4AFC();

  return v2;
}

+ (id)raceBehindColors
{
  id v2 = sub_1004A54A8();

  return v2;
}

+ (id)mindfulnessColors
{
  id v2 = sub_1004A52F0();

  return v2;
}

@end