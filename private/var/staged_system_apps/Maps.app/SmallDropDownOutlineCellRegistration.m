@interface SmallDropDownOutlineCellRegistration
+ (id)sharedRegistration;
@end

@implementation SmallDropDownOutlineCellRegistration

+ (id)sharedRegistration
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100C8AF20;
  block[3] = &unk_1012E63F0;
  block[4] = a1;
  if (qword_101610D40 != -1) {
    dispatch_once(&qword_101610D40, block);
  }
  v2 = (void *)qword_101610D38;

  return v2;
}

@end