@interface TZDLogging
+ (BOOL)canLogMessageAtLevel:(int64_t)a3;
@end

@implementation TZDLogging

+ (BOOL)canLogMessageAtLevel:(int64_t)a3
{
  v4 = +[TZPreferencesController sharedPreferencesController];
  int64_t v5 = [v4 loggingLevel];

  return v5 >= a3;
}

@end