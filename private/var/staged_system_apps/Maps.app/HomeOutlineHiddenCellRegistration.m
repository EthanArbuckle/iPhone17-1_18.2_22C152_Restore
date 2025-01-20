@interface HomeOutlineHiddenCellRegistration
+ (id)sharedRegistration;
@end

@implementation HomeOutlineHiddenCellRegistration

+ (id)sharedRegistration
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1008B5DF8;
  block[3] = &unk_1012E63F0;
  block[4] = a1;
  if (qword_10160FE00 != -1) {
    dispatch_once(&qword_10160FE00, block);
  }
  v2 = (void *)qword_10160FDF8;

  return v2;
}

@end