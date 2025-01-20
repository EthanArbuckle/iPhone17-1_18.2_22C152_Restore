@interface UVObjCSingleFireEvent
- (BOOL)hasFired;
- (UVObjCSingleFireEvent)init;
- (void)addObserver:(id)a3;
- (void)cancel;
- (void)fire;
@end

@implementation UVObjCSingleFireEvent

- (UVObjCSingleFireEvent)init
{
  v6.receiver = self;
  v6.super_class = (Class)UVObjCSingleFireEvent;
  v2 = [(UVObjCSingleFireEvent *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(_TtC20PreviewsFoundationOS19ObjcSingleFireEvent);
    event = v2->_event;
    v2->_event = v3;
  }
  return v2;
}

- (void)fire
{
}

- (void)cancel
{
}

- (void)addObserver:(id)a3
{
}

- (BOOL)hasFired
{
  return [(ObjcSingleFireEvent *)self->_event hasFired];
}

- (void).cxx_destruct
{
}

@end