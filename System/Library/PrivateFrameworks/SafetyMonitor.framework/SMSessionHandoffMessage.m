@interface SMSessionHandoffMessage
+ (unint64_t)messageType;
@end

@implementation SMSessionHandoffMessage

+ (unint64_t)messageType
{
  return 8;
}

@end