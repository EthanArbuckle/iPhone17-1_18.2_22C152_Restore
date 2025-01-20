@interface NSError(STWorkoutError)
+ (uint64_t)st_startWorkoutErrorWithCode:()STWorkoutError;
@end

@implementation NSError(STWorkoutError)

+ (uint64_t)st_startWorkoutErrorWithCode:()STWorkoutError
{
  return [a1 errorWithDomain:@"com.apple.siri.health.Error" code:a3 userInfo:0];
}

@end