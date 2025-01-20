@interface SearchResultOutlineCellRegistration
+ (id)sharedRegistration;
@end

@implementation SearchResultOutlineCellRegistration

+ (id)sharedRegistration
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100D67CD8;
  block[3] = &unk_1012E63F0;
  block[4] = a1;
  if (qword_101611150 != -1) {
    dispatch_once(&qword_101611150, block);
  }
  v2 = (void *)qword_101611148;

  return v2;
}

@end