@interface NearbySessionsAdvertiserImplementation
- (MRDGroupSessionAdvertiserDelegate)delegate;
- (_TtC12mediaremotedP33_7EE25EE0744654392BDDF6F1DB17E3B438NearbySessionsAdvertiserImplementation)init;
- (_TtC12mediaremotedP33_7EE25EE0744654392BDDF6F1DB17E3B438NearbySessionsAdvertiserImplementation)initWithDelegate:(id)a3;
- (id)assertPublicAdvertisement;
- (void)beginAdvertising;
- (void)beginProxyAdvertisingWithToken:(id)a3;
- (void)collectDiagnostic:(id)a3;
- (void)dealloc;
- (void)endAdvertising;
- (void)endProxyAdvertising;
- (void)setActiveSession:(id)a3 identity:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation NearbySessionsAdvertiserImplementation

- (MRDGroupSessionAdvertiserDelegate)delegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (MRDGroupSessionAdvertiserDelegate *)Strong;
}

- (void)setDelegate:(id)a3
{
}

- (_TtC12mediaremotedP33_7EE25EE0744654392BDDF6F1DB17E3B438NearbySessionsAdvertiserImplementation)initWithDelegate:(id)a3
{
  return (_TtC12mediaremotedP33_7EE25EE0744654392BDDF6F1DB17E3B438NearbySessionsAdvertiserImplementation *)sub_100276A74((uint64_t)a3);
}

- (void)dealloc
{
  v2 = self;
  sub_100276FB4();
}

- (void).cxx_destruct
{
  sub_1001B9788((uint64_t)self+ OBJC_IVAR____TtC12mediaremotedP33_7EE25EE0744654392BDDF6F1DB17E3B438NearbySessionsAdvertiserImplementation_delegate);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12mediaremotedP33_7EE25EE0744654392BDDF6F1DB17E3B438NearbySessionsAdvertiserImplementation_queue));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC12mediaremotedP33_7EE25EE0744654392BDDF6F1DB17E3B438NearbySessionsAdvertiserImplementation_logBuffer);
}

- (void)setActiveSession:(id)a3 identity:(id)a4
{
  swift_unknownObjectRetain();
  id v7 = a4;
  v8 = self;
  sub_1002892F0((uint64_t)a3);
  swift_unknownObjectRelease();
}

- (void)beginAdvertising
{
  v2 = self;
  sub_100278E44();
}

- (void)beginProxyAdvertisingWithToken:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10027B420(v4);
}

- (id)assertPublicAdvertisement
{
  v2 = self;
  sub_10027C514();
  id v4 = v3;

  return v4;
}

- (void)endAdvertising
{
  v2 = self;
  sub_10027D254();
}

- (void)endProxyAdvertising
{
  v2 = self;
  sub_10027D2C4();
}

- (void)collectDiagnostic:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100283D34(a3);
}

- (_TtC12mediaremotedP33_7EE25EE0744654392BDDF6F1DB17E3B438NearbySessionsAdvertiserImplementation)init
{
  result = (_TtC12mediaremotedP33_7EE25EE0744654392BDDF6F1DB17E3B438NearbySessionsAdvertiserImplementation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end