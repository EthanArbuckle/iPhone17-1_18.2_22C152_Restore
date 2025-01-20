@interface SESSessionManagerInterface
+ (id)interface;
@end

@implementation SESSessionManagerInterface

+ (id)interface
{
  if (qword_10045CCA0 != -1) {
    dispatch_once(&qword_10045CCA0, &stru_10040CF10);
  }
  v2 = (void *)qword_10045CC98;

  return v2;
}

@end