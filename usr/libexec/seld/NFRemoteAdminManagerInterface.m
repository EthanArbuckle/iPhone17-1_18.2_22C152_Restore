@interface NFRemoteAdminManagerInterface
+ (id)interface;
@end

@implementation NFRemoteAdminManagerInterface

+ (id)interface
{
  if (qword_1000603C0 != -1) {
    dispatch_once(&qword_1000603C0, &stru_100058800);
  }
  v2 = (void *)qword_1000603B8;

  return v2;
}

@end