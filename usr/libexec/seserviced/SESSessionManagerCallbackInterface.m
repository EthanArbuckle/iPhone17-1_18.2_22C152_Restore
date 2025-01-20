@interface SESSessionManagerCallbackInterface
+ (id)interface;
@end

@implementation SESSessionManagerCallbackInterface

+ (id)interface
{
  if (qword_10045CCB0 != -1) {
    dispatch_once(&qword_10045CCB0, &stru_10040CF30);
  }
  v2 = (void *)qword_10045CCA8;

  return v2;
}

@end