@interface CCDRequestSupport
+ (id)userAgentString;
@end

@implementation CCDRequestSupport

+ (id)userAgentString
{
  if (qword_100025638 != -1) {
    dispatch_once(&qword_100025638, &stru_10001CA28);
  }
  v2 = (void *)qword_100025630;

  return v2;
}

@end