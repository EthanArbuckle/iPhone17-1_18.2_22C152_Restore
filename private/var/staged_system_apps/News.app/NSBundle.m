@interface NSBundle
+ (id)fr_feldsparInternalExtrasBundle;
@end

@implementation NSBundle

+ (id)fr_feldsparInternalExtrasBundle
{
  if (qword_1000EE140 != -1) {
    dispatch_once(&qword_1000EE140, &stru_1000C9428);
  }
  v2 = (void *)qword_1000EE148;

  return v2;
}

@end