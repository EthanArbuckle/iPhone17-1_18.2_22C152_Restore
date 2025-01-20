@interface UWBAlishaSession
- (void)session:(id)a3 didUpdateHealthStatus:(int64_t)a4;
- (void)session:(id)a3 relayDCKMessage:(id)a4;
@end

@implementation UWBAlishaSession

- (void).cxx_destruct
{
  swift_release();

  swift_release();
}

- (void)session:(id)a3 relayDCKMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11 = self;
  uint64_t v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v10 = v9;

  sub_1002062E4(v8, v10);
  sub_10006D144(v8, v10);
}

- (void)session:(id)a3 didUpdateHealthStatus:(int64_t)a4
{
  id v6 = a3;
  id v7 = self;
  sub_100206484(a4);
}

@end