@interface CMMotionActivity(RTStateTransition)
- (BOOL)isEqual:()RTStateTransition;
@end

@implementation CMMotionActivity(RTStateTransition)

- (BOOL)isEqual:()RTStateTransition
{
  id v4 = a3;
  int v5 = [a1 unknown];
  BOOL v10 = 0;
  if (v5 == [v4 unknown])
  {
    int v6 = [a1 stationary];
    if (v6 == [v4 stationary])
    {
      int v7 = [a1 walking];
      if (v7 == [v4 walking])
      {
        int v8 = [a1 running];
        if (v8 == [v4 running])
        {
          int v9 = [a1 automotive];
          if (v9 == [v4 automotive]) {
            BOOL v10 = 1;
          }
        }
      }
    }
  }

  return v10;
}

@end