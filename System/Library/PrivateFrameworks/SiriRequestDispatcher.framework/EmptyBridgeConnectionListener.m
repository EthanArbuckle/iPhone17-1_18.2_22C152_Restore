@interface EmptyBridgeConnectionListener
- (_TtC21SiriRequestDispatcher29EmptyBridgeConnectionListener)init;
- (_TtC21SiriRequestDispatcher29EmptyBridgeConnectionListener)initWithBridgeName:(id)a3 machService:(id)a4 withServiceInterface:(id)a5 withDelegateInterface:(id)a6;
- (void)notifyClientWithBlock:(id)a3;
- (void)resumeConnectionWithBridgeProxy:(id)a3;
@end

@implementation EmptyBridgeConnectionListener

- (_TtC21SiriRequestDispatcher29EmptyBridgeConnectionListener)initWithBridgeName:(id)a3 machService:(id)a4 withServiceInterface:(id)a5 withDelegateInterface:(id)a6
{
  sub_1C9E42898();
  sub_1C9E42898();
  id v8 = a5;
  id v9 = a6;
  return (_TtC21SiriRequestDispatcher29EmptyBridgeConnectionListener *)sub_1C9E27544();
}

- (void)resumeConnectionWithBridgeProxy:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1C9E42C78();

  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v5);
}

- (void)notifyClientWithBlock:(id)a3
{
  v3 = _Block_copy(a3);
  *(void *)(swift_allocObject() + 16) = v3;
  swift_release();
}

- (_TtC21SiriRequestDispatcher29EmptyBridgeConnectionListener)init
{
}

@end