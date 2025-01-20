@interface BottomPlayerManager
- (_TtC5Music19BottomPlayerManager)init;
- (void)routingControllerAvailableRoutesDidChange:(id)a3;
@end

@implementation BottomPlayerManager

- (_TtC5Music19BottomPlayerManager)init
{
  return (_TtC5Music19BottomPlayerManager *)sub_10075584C();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v3 = (char *)self + OBJC_IVAR____TtC5Music19BottomPlayerManager__queues;
  uint64_t v4 = sub_100063814((uint64_t *)&unk_1010B9890);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
}

- (void)routingControllerAvailableRoutesDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100758CDC(v4);
}

@end