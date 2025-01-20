@interface RETrainingScheduler
+ (RETrainingScheduler)schedulerWithBehavior:(unint64_t)a3;
@end

@implementation RETrainingScheduler

+ (RETrainingScheduler)schedulerWithBehavior:(unint64_t)a3
{
  if (a3 > 2)
  {
    v4 = 0;
  }
  else
  {
    v4 = objc_opt_new();
  }
  return (RETrainingScheduler *)v4;
}

@end