@interface TLAlertPlaybackPolicy
+ (BOOL)shouldRepeatVibrationForAlert:(id)a3 withPlaybackBackend:(int64_t)a4;
@end

@implementation TLAlertPlaybackPolicy

+ (BOOL)shouldRepeatVibrationForAlert:(id)a3 withPlaybackBackend:(int64_t)a4
{
  id v5 = a3;
  v6 = v5;
  if (a4)
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    v8 = [v5 configuration];
    uint64_t v7 = [v8 shouldRepeat];
  }
  if ([v6 type] == 18) {
    LOBYTE(v7) = 1;
  }

  return v7;
}

@end