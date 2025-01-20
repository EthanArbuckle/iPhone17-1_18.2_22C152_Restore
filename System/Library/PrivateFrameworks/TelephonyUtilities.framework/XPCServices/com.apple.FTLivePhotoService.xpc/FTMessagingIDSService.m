@interface FTMessagingIDSService
+ (FTIDSService)sharedInstance;
@end

@implementation FTMessagingIDSService

+ (FTIDSService)sharedInstance
{
  id v2 = sub_100010678();

  return (FTIDSService *)v2;
}

@end