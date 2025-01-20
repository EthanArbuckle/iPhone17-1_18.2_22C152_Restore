@interface RETimePredictor
+ (double)updateInterval;
+ (id)supportedFeatures;
- (id)featureValueForFeature:(id)a3 element:(id)a4 engine:(id)a5 trainingContext:(id)a6;
@end

@implementation RETimePredictor

+ (id)supportedFeatures
{
  v9[3] = *MEMORY[0x263EF8340];
  v2 = [REFeatureSet alloc];
  v3 = +[REFeature isWeekendFeature];
  v4 = +[REFeature dayOfWeekFeature];
  v9[1] = v4;
  v5 = +[REFeature currentTimeFeature];
  v9[2] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:3];
  v7 = [(REFeatureSet *)v2 initWithFeatures:v6];

  return v7;
}

+ (double)updateInterval
{
  return 1800.0;
}

- (id)featureValueForFeature:(id)a3 element:(id)a4 engine:(id)a5 trainingContext:(id)a6
{
  id v7 = a3;
  v8 = [a6 attributeForKey:@"RETrainingContextDateKey"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v8) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  v8 = [MEMORY[0x263EFF910] date];
LABEL_6:
  v9 = [MEMORY[0x263EFF8F0] currentCalendar];
  v10 = +[REFeature isWeekendFeature];
  int v11 = [v7 isEqual:v10];

  if (v11)
  {
    uint64_t v12 = [v9 isDateInWeekend:v8];
LABEL_10:
    uint64_t v15 = +[REFeatureValue featureValueWithInt64:v12];
LABEL_11:
    v16 = (void *)v15;
    goto LABEL_12;
  }
  v13 = +[REFeature dayOfWeekFeature];
  int v14 = [v7 isEqual:v13];

  if (v14)
  {
    uint64_t v12 = [v9 component:512 fromDate:v8];
    goto LABEL_10;
  }
  v18 = +[REFeature currentTimeFeature];
  int v19 = [v7 isEqual:v18];

  if (v19)
  {
    uint64_t v20 = [v9 component:32 fromDate:v8];
    uint64_t v21 = [v9 maximumRangeOfUnit:32];
    uint64_t v15 = +[REFeatureValue featureValueWithDouble:(float)((float)(unint64_t)(v20 - v21) / (float)v22)];
    goto LABEL_11;
  }
  v16 = 0;
LABEL_12:

  return v16;
}

@end