@interface NADeallocationSentinel
- (NADeallocationSentinel)initWithTargetObject:(id)a3 finalizer:(id)a4;
- (NADeallocationTracer)tracer;
- (id)finalizer;
- (id)targetObject;
- (void)dealloc;
- (void)tracerIsDeallocating;
@end

@implementation NADeallocationSentinel

- (NADeallocationSentinel)initWithTargetObject:(id)a3 finalizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NADeallocationSentinel;
  v8 = [(NADeallocationSentinel *)&v14 init];
  v9 = v8;
  if (v8)
  {
    v8->_targetObject = v6;
    uint64_t v10 = MEMORY[0x1BA99CF00](v7);
    id finalizer = v9->_finalizer;
    v9->_id finalizer = (id)v10;

    v12 = [[NADeallocationTracer alloc] initWithDelegate:v9];
    objc_setAssociatedObject(v6, v9, v12, (void *)1);
    objc_storeWeak((id *)&v9->_tracer, v12);
  }
  return v9;
}

- (void)dealloc
{
  v3 = [(NADeallocationSentinel *)self tracer];

  if (v3)
  {
    v4 = [(NADeallocationSentinel *)self tracer];
    [v4 setDelegate:0];

    v5 = [(NADeallocationSentinel *)self targetObject];
    objc_setAssociatedObject(v5, self, 0, (void *)1);
  }
  v6.receiver = self;
  v6.super_class = (Class)NADeallocationSentinel;
  [(NADeallocationSentinel *)&v6 dealloc];
}

- (void)tracerIsDeallocating
{
  v4 = [(NADeallocationSentinel *)self finalizer];
  v3 = [(NADeallocationSentinel *)self targetObject];
  v4[2](v4, v3);
}

- (id)targetObject
{
  return self->_targetObject;
}

- (id)finalizer
{
  return self->_finalizer;
}

- (NADeallocationTracer)tracer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tracer);
  return (NADeallocationTracer *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tracer);
  objc_storeStrong(&self->_finalizer, 0);
}

@end