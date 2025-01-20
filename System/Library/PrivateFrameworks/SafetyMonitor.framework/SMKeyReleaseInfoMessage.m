@interface SMKeyReleaseInfoMessage
+ (unint64_t)messageType;
@end

@implementation SMKeyReleaseInfoMessage

+ (unint64_t)messageType
{
  return 15;
}

@end