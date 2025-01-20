@interface NLWorkoutConfigurationImageGenerator
+ (id)createBlastDoorDataSourceFromData:(id)a3;
+ (id)createImageFromBlastDoorDataSource:(id)a3 scale:(double)a4;
+ (id)createImageFromData:(id)a3;
- (NLWorkoutConfigurationImageGenerator)init;
@end

@implementation NLWorkoutConfigurationImageGenerator

+ (id)createBlastDoorDataSourceFromData:(id)a3
{
  id v3 = a3;
  uint64_t v4 = sub_261B8AC18();
  unint64_t v6 = v5;

  id v7 = _s9WorkoutUI0A27ConfigurationImageGeneratorC25createBlastDoorDataSource4fromSo09WKUIBlasthiJ0CSg10Foundation0I0V_tFZ_0();
  sub_261A340C4(v4, v6);
  return v7;
}

+ (id)createImageFromData:(id)a3
{
  id v3 = a3;
  uint64_t v4 = sub_261B8AC18();
  unint64_t v6 = v5;

  id v7 = _s9WorkoutUI0A27ConfigurationImageGeneratorC06createD04from10Foundation4DataVSgAH_tFZ_0();
  unint64_t v9 = v8;
  sub_261A340C4(v4, v6);
  if (v9 >> 60 == 15)
  {
    v10 = 0;
  }
  else
  {
    v10 = (void *)sub_261B8AC08();
    sub_261A340B0((uint64_t)v7, v9);
  }
  return v10;
}

+ (id)createImageFromBlastDoorDataSource:(id)a3 scale:(double)a4
{
  id v4 = a3;
  unint64_t v5 = _s9WorkoutUI0A27ConfigurationImageGeneratorC06createD04from5scale10Foundation4DataVSgSo013WKUIBlastDoorJ6SourceC_12CoreGraphics7CGFloatVtFZ_0(v4);
  unint64_t v7 = v6;

  if (v7 >> 60 == 15)
  {
    unint64_t v8 = 0;
  }
  else
  {
    unint64_t v8 = (void *)sub_261B8AC08();
    sub_261A340B0((uint64_t)v5, v7);
  }
  return v8;
}

- (NLWorkoutConfigurationImageGenerator)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for WorkoutConfigurationImageGenerator();
  return [(NLWorkoutConfigurationImageGenerator *)&v3 init];
}

@end