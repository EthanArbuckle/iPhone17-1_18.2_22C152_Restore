@interface MSDOperationBarrier
- (BOOL)activated;
- (MSDOperationBarrier)init;
- (NSCondition)condition;
- (void)activate;
- (void)deactivate;
- (void)setActivated:(BOOL)a3;
- (void)setCondition:(id)a3;
- (void)waitUntilClear;
@end

@implementation MSDOperationBarrier

- (MSDOperationBarrier)init
{
  v6.receiver = self;
  v6.super_class = (Class)MSDOperationBarrier;
  v2 = [(MSDOperationBarrier *)&v6 init];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)NSCondition);
    [(MSDOperationBarrier *)v2 setCondition:v3];

    v4 = [(MSDOperationBarrier *)v2 condition];
    [v4 setName:@"com.apple.msd.operation_barrier"];
  }
  return v2;
}

- (void)waitUntilClear
{
  id v3 = [(MSDOperationBarrier *)self condition];
  [v3 lock];

  if ([(MSDOperationBarrier *)self activated])
  {
    do
    {
      v4 = [(MSDOperationBarrier *)self condition];
      [v4 wait];
    }
    while ([(MSDOperationBarrier *)self activated]);
  }
  id v5 = [(MSDOperationBarrier *)self condition];
  [v5 unlock];
}

- (void)activate
{
  id v3 = [(MSDOperationBarrier *)self condition];
  [v3 lock];

  [(MSDOperationBarrier *)self setActivated:1];
  v4 = [(MSDOperationBarrier *)self condition];
  [v4 broadcast];

  id v5 = [(MSDOperationBarrier *)self condition];
  [v5 unlock];
}

- (void)deactivate
{
  id v3 = [(MSDOperationBarrier *)self condition];
  [v3 lock];

  [(MSDOperationBarrier *)self setActivated:0];
  v4 = [(MSDOperationBarrier *)self condition];
  [v4 broadcast];

  id v5 = [(MSDOperationBarrier *)self condition];
  [v5 unlock];
}

- (BOOL)activated
{
  return self->_activated;
}

- (void)setActivated:(BOOL)a3
{
  self->_activated = a3;
}

- (NSCondition)condition
{
  return self->_condition;
}

- (void)setCondition:(id)a3
{
}

- (void).cxx_destruct
{
}

@end