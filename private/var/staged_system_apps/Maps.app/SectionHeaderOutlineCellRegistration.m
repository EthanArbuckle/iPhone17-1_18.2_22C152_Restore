@interface SectionHeaderOutlineCellRegistration
+ (id)sharedRegistration;
@end

@implementation SectionHeaderOutlineCellRegistration

+ (id)sharedRegistration
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100ACCBEC;
  block[3] = &unk_1012E63F0;
  block[4] = a1;
  if (qword_101610788 != -1) {
    dispatch_once(&qword_101610788, block);
  }
  v2 = (void *)qword_101610780;

  return v2;
}

@end