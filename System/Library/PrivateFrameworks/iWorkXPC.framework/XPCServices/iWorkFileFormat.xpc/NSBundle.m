@interface NSBundle
+ (id)tsu_resourcesBundle;
@end

@implementation NSBundle

+ (id)tsu_resourcesBundle
{
  if (qword_1001EB978 != -1) {
    dispatch_once(&qword_1001EB978, &stru_1001CE258);
  }
  v2 = (void *)qword_1001EB970;
  return v2;
}

@end