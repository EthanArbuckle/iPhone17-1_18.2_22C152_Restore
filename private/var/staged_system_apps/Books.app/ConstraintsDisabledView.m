@interface ConstraintsDisabledView
- (id)initWithCoder:(uint64_t)a3;
- (id)initWithFrame:(double)a3;
@end

@implementation ConstraintsDisabledView

- (id)initWithFrame:(double)a3
{
  v10.receiver = a1;
  v10.super_class = (Class)swift_getObjectType();
  return [super initWithFrame:a2, a3, a4, a5];
}

- (id)initWithCoder:(uint64_t)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)swift_getObjectType();
  return [super initWithCoder:a3];
}

@end