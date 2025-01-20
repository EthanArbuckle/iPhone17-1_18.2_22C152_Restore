@interface SmallButtonOutlineCellRegistration
+ (id)sharedRegistration;
@end

@implementation SmallButtonOutlineCellRegistration

+ (id)sharedRegistration
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100B1DCE8;
  block[3] = &unk_1012E63F0;
  block[4] = a1;
  if (qword_101610840 != -1) {
    dispatch_once(&qword_101610840, block);
  }
  v2 = (void *)qword_101610838;

  return v2;
}

@end