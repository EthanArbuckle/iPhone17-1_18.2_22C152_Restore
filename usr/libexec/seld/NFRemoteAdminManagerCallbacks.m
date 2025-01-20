@interface NFRemoteAdminManagerCallbacks
+ (id)interface;
@end

@implementation NFRemoteAdminManagerCallbacks

+ (id)interface
{
  if (qword_1000603D0 != -1) {
    dispatch_once(&qword_1000603D0, &stru_100058820);
  }
  v2 = (void *)qword_1000603C8;

  return v2;
}

@end