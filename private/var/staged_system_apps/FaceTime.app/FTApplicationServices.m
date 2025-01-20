@interface FTApplicationServices
+ (id)sharedInstance;
@end

@implementation FTApplicationServices

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001A768;
  block[3] = &unk_1000A20B0;
  block[4] = a1;
  if (qword_1000BC1D0 != -1) {
    dispatch_once(&qword_1000BC1D0, block);
  }
  v2 = (void *)qword_1000BC1C8;

  return v2;
}

@end