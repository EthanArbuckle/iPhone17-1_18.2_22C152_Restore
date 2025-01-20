@interface RBProcessAppNapState
- (BOOL)isEqual:(id)a3;
- (RBProcessAppNapState)init;
- (id)_initWithProcessAppNapState:(id)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unsigned)encodedState;
- (void)dealloc;
@end

@implementation RBProcessAppNapState

- (RBProcessAppNapState)init
{
  v3.receiver = self;
  v3.super_class = (Class)RBProcessAppNapState;
  return [(RBProcessAppNapState *)&v3 init];
}

- (id)_initWithProcessAppNapState:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RBProcessAppNapState;
  return [(RBProcessAppNapState *)&v4 init];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)RBProcessAppNapState;
  [(RBProcessAppNapState *)&v2 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  return 1;
}

- (unsigned)encodedState
{
  return 0;
}

- (id)description
{
  return &stru_26DA9D688;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  objc_super v4 = +[RBMutableProcessAppNapState allocWithZone:a3];
  return [(RBProcessAppNapState *)v4 _initWithProcessAppNapState:self];
}

@end