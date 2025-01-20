@interface PDSetBehavior
- (PDSetBehavior)init;
- (id)value;
- (void)setValue:(id)a3;
@end

@implementation PDSetBehavior

- (PDSetBehavior)init
{
  v3.receiver = self;
  v3.super_class = (Class)PDSetBehavior;
  return [(PDAnimateBehavior *)&v3 init];
}

- (void)setValue:(id)a3
{
}

- (id)value
{
  return self->mValue;
}

- (void).cxx_destruct
{
}

@end