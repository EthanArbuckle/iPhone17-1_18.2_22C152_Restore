@interface GKSupportedTransportVersionCacheObject
+ (id)fetchRequest;
@end

@implementation GKSupportedTransportVersionCacheObject

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:@"SupportedTransportVersion"];
}

@end