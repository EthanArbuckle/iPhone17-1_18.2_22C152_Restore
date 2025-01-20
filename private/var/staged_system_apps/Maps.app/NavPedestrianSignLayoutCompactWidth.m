@interface NavPedestrianSignLayoutCompactWidth
+ (id)sharedPedestrianSignCompactWidthLayout;
@end

@implementation NavPedestrianSignLayoutCompactWidth

+ (id)sharedPedestrianSignCompactWidthLayout
{
  if (qword_101610DD8 != -1) {
    dispatch_once(&qword_101610DD8, &stru_1013209B8);
  }
  v2 = (void *)qword_101610DD0;

  return v2;
}

@end