@interface CSDFaceTimeAudioIDSService
+ (id)sharedInstance;
@end

@implementation CSDFaceTimeAudioIDSService

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10013C294;
  block[3] = &unk_1005057B8;
  block[4] = a1;
  if (qword_10058C460 != -1) {
    dispatch_once(&qword_10058C460, block);
  }
  v2 = (void *)qword_10058C458;

  return v2;
}

@end