@interface RERecoveryTextProvider
+ (id)twoMinuteTextProviderWithLocalizedBPMNumberString:(id)a3;
+ (id)workoutEndTextProviderWithLocalizedBPMNumberString:(id)a3;
@end

@implementation RERecoveryTextProvider

+ (id)workoutEndTextProviderWithLocalizedBPMNumberString:(id)a3
{
  RERaiseInternalException();

  return +[CLKSimpleTextProvider textProviderWithText:&stru_8440];
}

+ (id)twoMinuteTextProviderWithLocalizedBPMNumberString:(id)a3
{
  RERaiseInternalException();

  return +[CLKSimpleTextProvider textProviderWithText:&stru_8440];
}

@end