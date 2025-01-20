@interface NavSteppingSignLayout
+ (id)sharedSteppingSignLayout;
- (double)shieldViewTopMarginForSign:(id)a3;
@end

@implementation NavSteppingSignLayout

+ (id)sharedSteppingSignLayout
{
  if (qword_101610DB8 != -1) {
    dispatch_once(&qword_101610DB8, &stru_101320978);
  }
  v2 = (void *)qword_101610DB0;

  return v2;
}

- (double)shieldViewTopMarginForSign:(id)a3
{
  return 13.0;
}

@end