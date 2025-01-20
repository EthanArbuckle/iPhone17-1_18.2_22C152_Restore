@interface SECUserSession.NearFieldEventDelegate
- (_TtCC10seserviced14SECUserSession22NearFieldEventDelegate)init;
- (void)session:(id)a3 didExpireAuthorizationForApplet:(id)a4;
- (void)session:(id)a3 didReceiveHCIData:(id)a4 forAppletWithIdentifier:(id)a5;
- (void)session:(id)a3 fieldChanged:(BOOL)a4;
@end

@implementation SECUserSession.NearFieldEventDelegate

- (void)session:(id)a3 didReceiveHCIData:(id)a4 forAppletWithIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17 = self;
  uint64_t v11 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v13 = v12;

  uint64_t v14 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v16 = v15;

  sub_1001D3908(v11, v13, v14, v16);
  sub_10006D144(v14, v16);
  sub_10006D144(v11, v13);
}

- (void)session:(id)a3 fieldChanged:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_1001D39E0(a4);
}

- (void)session:(id)a3 didExpireAuthorizationForApplet:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1001D3AA0();
}

- (_TtCC10seserviced14SECUserSession22NearFieldEventDelegate)init
{
  return (_TtCC10seserviced14SECUserSession22NearFieldEventDelegate *)sub_1001CFE04();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();

  swift_release();
}

@end