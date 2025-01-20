@interface CSDFaceTimeVideoIDSService
+ (id)sharedInstance;
@end

@implementation CSDFaceTimeVideoIDSService

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007B688;
  block[3] = &unk_1005057B8;
  block[4] = a1;
  if (qword_10058C2A8 != -1) {
    dispatch_once(&qword_10058C2A8, block);
  }
  v2 = (void *)qword_10058C2A0;

  return v2;
}

@end