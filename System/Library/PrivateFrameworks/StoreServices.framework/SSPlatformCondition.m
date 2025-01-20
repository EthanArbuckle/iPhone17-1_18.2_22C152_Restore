@interface SSPlatformCondition
- (BOOL)evaluateWithContext:(id)a3;
@end

@implementation SSPlatformCondition

- (BOOL)evaluateWithContext:(id)a3
{
  return objc_msgSend(self->super._value, "isEqualToString:", objc_msgSend(a3, "platformName")) ^ (self->super._operator == 1);
}

@end