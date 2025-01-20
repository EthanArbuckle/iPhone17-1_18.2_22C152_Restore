@interface SMSessionStartInfoMessage
+ (unint64_t)messageType;
@end

@implementation SMSessionStartInfoMessage

+ (unint64_t)messageType
{
  return 13;
}

@end