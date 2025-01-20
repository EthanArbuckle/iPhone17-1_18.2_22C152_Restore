@interface APNSManager
+ (_TtC15icloudmailagent11APNSManager)sharedInstance;
- (_TtC15icloudmailagent11APNSManager)init;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)dealloc;
- (void)start;
@end

@implementation APNSManager

+ (_TtC15icloudmailagent11APNSManager)sharedInstance
{
  if (qword_100063E70 != -1) {
    swift_once();
  }
  v2 = (void *)qword_100067990;

  return (_TtC15icloudmailagent11APNSManager *)v2;
}

- (_TtC15icloudmailagent11APNSManager)init
{
  return (_TtC15icloudmailagent11APNSManager *)sub_10000BB74();
}

- (void)start
{
  v2 = self;
  sub_10000C03C();
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  sub_10000CCEC();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  [(APNSManager *)&v5 dealloc];
}

- (void).cxx_destruct
{
  sub_10000E03C((uint64_t)self + OBJC_IVAR____TtC15icloudmailagent11APNSManager_delegate);

  swift_bridgeObjectRelease();
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  v4 = a4;
  if (a4)
  {
    id v6 = a3;
    v7 = self;
    id v8 = v4;
    v4 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v10 = v9;
  }
  else
  {
    id v11 = a3;
    v12 = self;
    unint64_t v10 = 0xF000000000000000;
  }
  sub_10000D790((uint64_t)v4, v10);
  sub_100009000((uint64_t)v4, v10);
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_10000DA4C(a4);
}

@end