@interface SUIdleTracker
- (BOOL)idle;
- (SUIdleTracker)init;
- (SUIdleTracker)initWithName:(id)a3;
- (SUIdleTracker)initWithName:(id)a3 queue:(id)a4 timeoutSeconds:(int64_t)a5 timeoutAction:(id)a6;
- (id)track;
- (id)trackWithName:(id)a3;
- (int64_t)count;
@end

@implementation SUIdleTracker

- (SUIdleTracker)initWithName:(id)a3 queue:(id)a4 timeoutSeconds:(int64_t)a5 timeoutAction:(id)a6
{
  v7 = _Block_copy(a6);
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(swift_allocObject() + 16) = v7;
  id v8 = a4;
  IdleTracker.init(name:queue:timeoutSeconds:timeoutAction:)();
  return result;
}

- (SUIdleTracker)initWithName:(id)a3
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  return (SUIdleTracker *)IdleTracker.init(name:)(v3, v4);
}

- (BOOL)idle
{
  v2 = self;
  char v3 = IdleTracker.idle.getter();

  return v3 & 1;
}

- (int64_t)count
{
  v2 = self;
  int64_t v3 = IdleTracker.count.getter();

  return v3;
}

- (id)track
{
  v2 = self;
  int64_t v3 = (void *)IdleTracker.track()();

  return v3;
}

- (id)trackWithName:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = IdleTracker.track(name:)();

  return v6;
}

- (SUIdleTracker)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  type metadata accessor for DispatchTimeInterval();
  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_5_4();
  v3();
  swift_release();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  id v4 = (char *)self + OBJC_IVAR___SUIdleTracker_lock;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
}

@end