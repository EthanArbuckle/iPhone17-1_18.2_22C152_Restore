@interface ClientServerInstance
- (void)createSessionWith:(int64_t)a3;
- (void)destroySessionFor:(int64_t)a3;
- (void)getServiceNameFor:(int64_t)a3 completion:(id)a4;
- (void)getTailspinSessionIDFor:(int64_t)a3 reply:(id)a4;
- (void)requestMessageFor:(int64_t)a3 category:(unsigned int)a4 type:(unsigned __int16)a5 reply:(id)a6;
- (void)sendWithMessage:(id)a3 with:(unsigned int)a4 and:(unsigned __int16)a5 for:(int64_t)a6;
- (void)setWithConfiguration:(id)a3 for:(int64_t)a4;
- (void)setWithServiceType:(unsigned __int16)a3 for:(int64_t)a4;
- (void)startSessionFor:(int64_t)a3;
- (void)stopSessionFor:(int64_t)a3;
- (void)validateFor:(int64_t)a3 completion:(id)a4;
@end

@implementation ClientServerInstance

- (void)createSessionWith:(int64_t)a3
{
}

- (void)setWithServiceType:(unsigned __int16)a3 for:(int64_t)a4
{
  swift_retain();
  sub_1000071D4(a3, a4);

  swift_release();
}

- (void)getServiceNameFor:(int64_t)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  swift_retain();
  sub_100008B74(a3, (uint64_t)sub_10000C618, v6, (uint64_t)&unk_100045950, (uint64_t)sub_10000C688, (uint64_t)&unk_100045968);
  swift_release();

  swift_release();
}

- (void)setWithConfiguration:(id)a3 for:(int64_t)a4
{
  uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  swift_retain();
  sub_100008154(v5, a4);
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)validateFor:(int64_t)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  swift_retain();
  sub_100008B74(a3, (uint64_t)sub_10000C548, v6, (uint64_t)&unk_100045810, (uint64_t)sub_10000C568, (uint64_t)&unk_100045828);
  swift_release();

  swift_release();
}

- (void)startSessionFor:(int64_t)a3
{
}

- (void)sendWithMessage:(id)a3 with:(unsigned int)a4 and:(unsigned __int16)a5 for:(int64_t)a6
{
  int v7 = a5;
  uint64_t v9 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  swift_retain();
  sub_10000964C(v9, a4, v7, a6);
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)stopSessionFor:(int64_t)a3
{
}

- (void)destroySessionFor:(int64_t)a3
{
}

- (void)requestMessageFor:(int64_t)a3 category:(unsigned int)a4 type:(unsigned __int16)a5 reply:(id)a6
{
  int v6 = a5;
  uint64_t v9 = _Block_copy(a6);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  swift_retain();
  sub_10000B068(a3, a4, v6, (uint64_t)sub_10000C498, v10);
  swift_release();

  swift_release();
}

- (void)getTailspinSessionIDFor:(int64_t)a3 reply:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  swift_retain();
  sub_10000B958(a3, (uint64_t)sub_10000C46C, v6);
  swift_release();

  swift_release();
}

@end