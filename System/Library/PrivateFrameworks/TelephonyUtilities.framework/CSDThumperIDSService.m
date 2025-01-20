@interface CSDThumperIDSService
+ (id)sharedInstance;
@end

@implementation CSDThumperIDSService

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10014B22C;
  block[3] = &unk_1005057B8;
  block[4] = a1;
  if (qword_10058C470 != -1) {
    dispatch_once(&qword_10058C470, block);
  }
  v2 = (void *)qword_10058C468;

  return v2;
}

@end