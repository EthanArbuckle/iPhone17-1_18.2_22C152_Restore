@interface HDSPWakeDetectionStateMachineContext
+ (id)contextWithType:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)type;
@end

@implementation HDSPWakeDetectionStateMachineContext

+ (id)contextWithType:(unint64_t)a3
{
  v4 = objc_alloc_init((Class)a1);
  v4[4] = a3;

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HDSPWakeDetectionStateMachineContext;
  id result = [(HKSPStateMachineContext *)&v5 copyWithZone:a3];
  *((void *)result + 4) = self->_type;
  return result;
}

- (unint64_t)type
{
  return self->_type;
}

@end