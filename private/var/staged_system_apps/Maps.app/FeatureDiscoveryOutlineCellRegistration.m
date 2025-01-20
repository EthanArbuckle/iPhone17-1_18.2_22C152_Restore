@interface FeatureDiscoveryOutlineCellRegistration
+ (id)sharedRegistration;
@end

@implementation FeatureDiscoveryOutlineCellRegistration

+ (id)sharedRegistration
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100A00DB4;
  block[3] = &unk_1012E63F0;
  block[4] = a1;
  if (qword_101610420 != -1) {
    dispatch_once(&qword_101610420, block);
  }
  v2 = (void *)qword_101610418;

  return v2;
}

@end