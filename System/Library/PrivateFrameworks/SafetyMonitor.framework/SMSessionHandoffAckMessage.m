@interface SMSessionHandoffAckMessage
+ (unint64_t)messageType;
@end

@implementation SMSessionHandoffAckMessage

+ (unint64_t)messageType
{
  return 9;
}

@end