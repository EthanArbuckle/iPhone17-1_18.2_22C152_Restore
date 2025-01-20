@interface SMCacheUpdatedMessage
+ (unint64_t)messageType;
@end

@implementation SMCacheUpdatedMessage

+ (unint64_t)messageType
{
  return 6;
}

@end