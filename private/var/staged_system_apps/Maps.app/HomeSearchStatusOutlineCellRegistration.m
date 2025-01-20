@interface HomeSearchStatusOutlineCellRegistration
+ (id)sharedRegistration;
@end

@implementation HomeSearchStatusOutlineCellRegistration

+ (id)sharedRegistration
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003934B4;
  block[3] = &unk_1012E63F0;
  block[4] = a1;
  if (qword_10160E9E8 != -1) {
    dispatch_once(&qword_10160E9E8, block);
  }
  v2 = (void *)qword_10160E9E0;

  return v2;
}

@end