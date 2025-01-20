@interface BMSyncPolicy
+ (double)minimumTimeBetweenSyncsAttemptsForTransport:(unint64_t)a3;
+ (double)minimumTimeBetweenSyncsForTransport:(unint64_t)a3;
@end

@implementation BMSyncPolicy

+ (double)minimumTimeBetweenSyncsForTransport:(unint64_t)a3
{
  double result = dbl_100053DF0[a3 == 3];
  if (a3 == 2) {
    return 3600.0;
  }
  return result;
}

+ (double)minimumTimeBetweenSyncsAttemptsForTransport:(unint64_t)a3
{
  double result = dbl_100053DF0[a3 == 3];
  if (a3 == 2) {
    return 3600.0;
  }
  return result;
}

@end