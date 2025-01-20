@interface TwoLinesOutlineCellRegistration
+ (id)sharedRegistration;
@end

@implementation TwoLinesOutlineCellRegistration

+ (id)sharedRegistration
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1008C4434;
  block[3] = &unk_1012E63F0;
  block[4] = a1;
  if (qword_10160FE28 != -1) {
    dispatch_once(&qword_10160FE28, block);
  }
  v2 = (void *)qword_10160FE20;

  return v2;
}

@end