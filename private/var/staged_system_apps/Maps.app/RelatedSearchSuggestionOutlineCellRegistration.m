@interface RelatedSearchSuggestionOutlineCellRegistration
+ (id)sharedRegistration;
@end

@implementation RelatedSearchSuggestionOutlineCellRegistration

+ (id)sharedRegistration
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100D0452C;
  block[3] = &unk_1012E63F0;
  block[4] = a1;
  if (qword_101610FA0 != -1) {
    dispatch_once(&qword_101610FA0, block);
  }
  v2 = (void *)qword_101610F98;

  return v2;
}

@end