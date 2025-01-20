@interface UniqueAnimationKeyMonitor
- (UniqueAnimationKeyMonitor)initWithUniqueAnimationCounter:(id)a3;
- (void)dealloc;
@end

@implementation UniqueAnimationKeyMonitor

- (UniqueAnimationKeyMonitor)initWithUniqueAnimationCounter:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UniqueAnimationKeyMonitor;
  v6 = [(UniqueAnimationKeyMonitor *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_counter, a3);
    v8 = v7;
  }

  return v7;
}

- (void)dealloc
{
  [(UniqueAnimationKeyCounter *)self->_counter didFinishUsingAnimationKey];
  v3.receiver = self;
  v3.super_class = (Class)UniqueAnimationKeyMonitor;
  [(UniqueAnimationKeyMonitor *)&v3 dealloc];
}

- (void).cxx_destruct
{
}

@end