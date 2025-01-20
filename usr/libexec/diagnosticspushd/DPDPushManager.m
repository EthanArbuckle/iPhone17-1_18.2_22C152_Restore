@interface DPDPushManager
+ (id)sharedInstance;
- (DPDPushManager)init;
- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connectionDidReconnect:(id)a3;
@end

@implementation DPDPushManager

+ (id)sharedInstance
{
  if (qword_100020A50 != -1) {
    swift_once();
  }
  v2 = (void *)qword_100021150;

  return v2;
}

- (DPDPushManager)init
{
  sub_100005758();
  return result;
}

- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_1000066FC(a3);
}

- (void)connectionDidReconnect:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_1000069D8(a3);
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
  sub_100006C8C(a3, (uint64_t)v4, v10);
  sub_100008908((uint64_t)v4, v10);
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_100006FD8((uint64_t)a4);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___DPDPushManager_connection);
}

@end