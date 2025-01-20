@interface ObjcSingleFireEvent
- (BOOL)hasFired;
- (_TtC20PreviewsFoundationOS19ObjcSingleFireEvent)init;
- (void)addObserver:(id)a3;
- (void)cancel;
- (void)fire;
@end

@implementation ObjcSingleFireEvent

- (void)fire
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC20PreviewsFoundationOS19ObjcSingleFireEvent_event);
  v3 = self;
  sub_25A50207C(v2);
}

- (void)cancel
{
  uint64_t v2 = self;
  SingleFireEvent.cancel()();
}

- (void)addObserver:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC20PreviewsFoundationOS19ObjcSingleFireEvent_event);
  _Block_copy(v4);
  v6 = self;
  sub_25A501E7C(v5, (void (**)(void))v4, &v8);
  uint64_t v7 = v8;
  if (v8)
  {
    sub_25A502680((uint64_t)&v8);
    sub_25A3901A8(v7);
  }
  _Block_release(v4);
}

- (BOOL)hasFired
{
  uint64_t v2 = (*(void **)((char *)&self->super.isa + OBJC_IVAR____TtC20PreviewsFoundationOS19ObjcSingleFireEvent_event))[2];
  v3 = self;
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 32));
  sub_25A4C4AE4((unint64_t *)(v2 + 16), &v6);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 32));
  unint64_t v4 = v6;
  swift_release();
  sub_25A4C5098(v4);

  return v4 == 0;
}

- (_TtC20PreviewsFoundationOS19ObjcSingleFireEvent)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = OBJC_IVAR____TtC20PreviewsFoundationOS19ObjcSingleFireEvent_event;
  type metadata accessor for SingleFireEvent();
  uint64_t v5 = (objc_class *)swift_allocObject();
  unint64_t v6 = self;
  SingleFireEvent.init(description:)(0, 0);
  *(Class *)((char *)&self->super.isa + v4) = v5;

  v8.receiver = v6;
  v8.super_class = ObjectType;
  return [(ObjcSingleFireEvent *)&v8 init];
}

- (void).cxx_destruct
{
}

@end