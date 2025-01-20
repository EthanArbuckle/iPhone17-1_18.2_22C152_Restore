@interface VenueDropDownOutlineCellRegistration
+ (id)sharedRegistration;
@end

@implementation VenueDropDownOutlineCellRegistration

+ (id)sharedRegistration
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10036FFC0;
  block[3] = &unk_1012E63F0;
  block[4] = a1;
  if (qword_10160E9B8 != -1) {
    dispatch_once(&qword_10160E9B8, block);
  }
  v2 = (void *)qword_10160E9B0;

  return v2;
}

@end