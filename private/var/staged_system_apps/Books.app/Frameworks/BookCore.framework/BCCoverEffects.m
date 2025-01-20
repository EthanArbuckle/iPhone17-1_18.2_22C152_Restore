@interface BCCoverEffects
+ (id)sharedInstance;
@end

@implementation BCCoverEffects

+ (id)sharedInstance
{
  if (qword_345C20 != -1) {
    dispatch_once(&qword_345C20, &stru_2C8348);
  }
  v2 = (void *)qword_345C18;

  return v2;
}

@end