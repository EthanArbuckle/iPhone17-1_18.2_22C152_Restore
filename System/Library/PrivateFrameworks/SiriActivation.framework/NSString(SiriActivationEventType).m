@interface NSString(SiriActivationEventType)
+ (__CFString)stringWithSiriActivationEventType:()SiriActivationEventType;
@end

@implementation NSString(SiriActivationEventType)

+ (__CFString)stringWithSiriActivationEventType:()SiriActivationEventType
{
  if ((unint64_t)(a3 - 1) > 0xB) {
    return @"SiriActivationEventTypeButton";
  }
  else {
    return off_1E6B67E78[a3 - 1];
  }
}

@end