@interface UIActivityGetOrderedBuiltinActivitiesFromActivities
@end

@implementation UIActivityGetOrderedBuiltinActivitiesFromActivities

uint64_t ___UIActivityGetOrderedBuiltinActivitiesFromActivities_block_invoke(uint64_t a1, void *a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  v7 = [a2 activityType];
  unint64_t v8 = [v5 indexOfObject:v7];

  v9 = *(void **)(a1 + 32);
  v10 = [v6 activityType];

  unint64_t v11 = [v9 indexOfObject:v10];
  if (v8 < v11) {
    return -1;
  }
  else {
    return v8 > v11;
  }
}

@end