@interface FTLivePhotoIDSService
+ (FTIDSService)sharedInstance;
@end

@implementation FTLivePhotoIDSService

+ (FTIDSService)sharedInstance
{
  id v2 = sub_10003AB9C();

  return (FTIDSService *)v2;
}

@end