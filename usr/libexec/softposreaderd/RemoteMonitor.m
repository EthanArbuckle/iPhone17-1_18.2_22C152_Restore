@interface RemoteMonitor
- (_TtC14softposreaderd13RemoteMonitor)init;
- (void)signalWithEvent:(unsigned __int16)a3 component:(unsigned __int8)a4 origin:(unsigned __int8)a5 details:(id)a6 reply:(id)a7;
@end

@implementation RemoteMonitor

- (void)signalWithEvent:(unsigned __int16)a3 component:(unsigned __int8)a4 origin:(unsigned __int8)a5 details:(id)a6 reply:(id)a7
{
  uint64_t v8 = a5;
  uint64_t v9 = a4;
  uint64_t v10 = a3;
  v12 = _Block_copy(a7);
  if (a6) {
    a6 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  _Block_copy(v12);
  v13 = self;
  sub_1000091C0(v10, v9, v8, (unint64_t)a6, (uint64_t)v13, (uint64_t)v12);
  _Block_release(v12);
  _Block_release(v12);

  swift_bridgeObjectRelease();
}

- (_TtC14softposreaderd13RemoteMonitor)init
{
  result = (_TtC14softposreaderd13RemoteMonitor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end