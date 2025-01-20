@interface CLWorkoutRecorderAvailability
+ (BOOL)isSupportedForHardware:(int)a3;
+ (BOOL)isSupportedWithExplicitDisable:(BOOL)a3 withIHAOverride:(BOOL)a4 withIHAOptIn:(BOOL)a5 withHwSupport:(BOOL)a6;
@end

@implementation CLWorkoutRecorderAvailability

+ (BOOL)isSupportedForHardware:(int)a3
{
  return ((a3 - 37) > 0x26) | (0x1F9FFF9FC0uLL >> (a3 - 37)) & 1;
}

+ (BOOL)isSupportedWithExplicitDisable:(BOOL)a3 withIHAOverride:(BOOL)a4 withIHAOptIn:(BOOL)a5 withHwSupport:(BOOL)a6
{
  return (a4 || a5) & ~a3 & a6;
}

@end