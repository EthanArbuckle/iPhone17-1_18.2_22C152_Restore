@interface NTKTimerComplication
+ (double)_durationFromComplication:(id)a3;
+ (int64_t)compareComplication:(id)a3 toComplication:(id)a4;
@end

@implementation NTKTimerComplication

+ (double)_durationFromComplication:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  double v4 = 0.0;
  if (objc_opt_isKindOfClass())
  {
    v5 = [v3 complicationDescriptor];
    v6 = [v5 userInfo];
    v7 = v6;
    if (v6)
    {
      v8 = [v6 objectForKey:@"Duration"];
      v9 = v8;
      if (v8)
      {
        [v8 doubleValue];
        double v4 = v10;
      }
    }
  }

  return v4;
}

+ (int64_t)compareComplication:(id)a3 toComplication:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [(id)objc_opt_class() _durationFromComplication:v6];
  double v8 = v7;

  [(id)objc_opt_class() _durationFromComplication:v5];
  double v10 = v9;

  int64_t v11 = -1;
  if (v8 >= v10) {
    int64_t v11 = 1;
  }
  if (v8 == v10) {
    return 0;
  }
  else {
    return v11;
  }
}

@end