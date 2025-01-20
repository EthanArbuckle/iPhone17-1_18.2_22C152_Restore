@interface SMKeyReleaseInfoRequestMessage
+ (unint64_t)messageType;
@end

@implementation SMKeyReleaseInfoRequestMessage

+ (unint64_t)messageType
{
  return 14;
}

@end