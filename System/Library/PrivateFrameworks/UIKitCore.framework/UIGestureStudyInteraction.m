@interface UIGestureStudyInteraction
@end

@implementation UIGestureStudyInteraction

id __50___UIGestureStudyInteraction__handleMetricsEvent___block_invoke(uint64_t a1)
{
  v29[3] = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!v2)
  {
    uint64_t v3 = objc_opt_new();
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    v7 = [*(id *)(a1 + 32) eventName];
    [v6 setValue:v7 forKey:@"gesture_type"];

    v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }
  v28[0] = @"total_duration";
  [*(id *)(a1 + 32) duration];
  v9 = NSNumber;
  double v10 = 0.0;
  double v11 = 0.0;
  if (v8 != 0.0)
  {
    long double v12 = fabs(v8);
    long double v13 = v8 / v12;
    double v14 = log10(v12);
    double v15 = __exp10(2.0 - (double)(int)vcvtpd_s64_f64(v14));
    double v11 = v13 * (round(v12 * v15) / v15);
  }
  v16 = [v9 numberWithDouble:v11];
  v29[0] = v16;
  v28[1] = @"total_movement";
  [*(id *)(a1 + 32) movement];
  v18 = NSNumber;
  if (v17 != 0.0)
  {
    long double v19 = fabs(v17);
    long double v20 = v17 / v19;
    double v21 = log10(v19);
    double v22 = __exp10(2.0 - (double)(int)vcvtpd_s64_f64(v21));
    double v10 = v20 * (round(v19 * v22) / v22);
  }
  v23 = [v18 numberWithDouble:v10];
  v29[1] = v23;
  v28[2] = @"total_touch_count";
  v24 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "observedTouchCount"));
  v29[2] = v24;
  v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:3];
  [v2 addEntriesFromDictionary:v25];

  v26 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return v26;
}

void __66___UIGestureStudyInteraction__reportEventForTriggeredParticipant___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  objc_opt_class();
  v6 = v5;
  if (objc_opt_isKindOfClass())
  {
    id v7 = v5;
    v6 = v7;
    if (!strcmp((const char *)[v7 objCType], "d"))
    {
      [v7 doubleValue];
      v9 = NSNumber;
      if (v8 == 0.0)
      {
        double v14 = 0.0;
      }
      else
      {
        long double v10 = fabs(v8);
        long double v11 = v8 / v10;
        double v12 = log10(v10);
        double v13 = __exp10(2.0 - (double)(int)vcvtpd_s64_f64(v12));
        double v14 = v11 * (round(v10 * v13) / v13);
      }
      v6 = [v9 numberWithDouble:v14];
    }
  }
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v15];
}

@end