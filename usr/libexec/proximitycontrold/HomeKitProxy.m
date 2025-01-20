@interface HomeKitProxy
- (_TtC17proximitycontrold12HomeKitProxy)init;
- (void)dealloc;
- (void)home:(id)a3 didAddAccessory:(id)a4;
- (void)home:(id)a3 didAddUser:(id)a4;
- (void)home:(id)a3 didRemoveAccessory:(id)a4;
- (void)home:(id)a3 didRemoveUser:(id)a4;
- (void)homeManager:(id)a3 didAddHome:(id)a4;
- (void)homeManager:(id)a3 didRemoveHome:(id)a4;
- (void)homeManagerDidUpdateHomes:(id)a3;
@end

@implementation HomeKitProxy

- (void)dealloc
{
  v2 = self;
  id v3 = sub_1001F6858();
  NSString v4 = String._bridgeToObjectiveC()();
  [v3 ulog:40 message:v4];

  sub_1000DCD5C();
  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for HomeKitProxy();
  [(HomeKitProxy *)&v5 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  sub_10000F088(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC17proximitycontrold12HomeKitProxy_activationPromise));

  swift_bridgeObjectRelease();
}

- (_TtC17proximitycontrold12HomeKitProxy)init
{
  result = (_TtC17proximitycontrold12HomeKitProxy *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)home:(id)a3 didAddAccessory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1000DE1C8(v6, v7, (uint64_t)&unk_100327100, (uint64_t)sub_1000DF2C8, (uint64_t)&unk_100327118);
}

- (void)home:(id)a3 didRemoveAccessory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1000DE1C8(v6, v7, (uint64_t)&unk_1003270B0, (uint64_t)sub_1000DF240, (uint64_t)&unk_1003270C8);
}

- (void)home:(id)a3 didAddUser:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1000DE1C8(v6, v7, (uint64_t)&unk_100327060, (uint64_t)sub_1000DF1FC, (uint64_t)&unk_100327078);
}

- (void)home:(id)a3 didRemoveUser:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1000DE1C8(v6, v7, (uint64_t)&unk_100327010, (uint64_t)sub_1000DF1B4, (uint64_t)&unk_100327028);
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_1000DEB70();
}

- (void)homeManager:(id)a3 didAddHome:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1000DEE14(v7, (uint64_t)&unk_100326F70, (uint64_t)sub_1000DF134, (uint64_t)&unk_100326F88);
}

- (void)homeManager:(id)a3 didRemoveHome:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1000DEE14(v7, (uint64_t)&unk_100326F20, (uint64_t)sub_1000DF0F8, (uint64_t)&unk_100326F38);
}

@end