@interface TUIGenerativeModelsAvailability
+ (BOOL)isAvailable;
- (TUIGenerativeModelsAvailability)init;
@end

@implementation TUIGenerativeModelsAvailability

+ (BOOL)isAvailable
{
  return sub_18D48CD50() & 1;
}

- (TUIGenerativeModelsAvailability)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(TUIGenerativeModelsAvailability *)&v3 init];
}

@end