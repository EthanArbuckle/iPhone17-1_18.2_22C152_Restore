@interface SDAirDropEndpointService
- (_TtC16DaemoniOSLibrary24SDAirDropEndpointService)init;
- (id)addClient:(id)a3;
- (id)endpointsChangedHandler;
- (void)nearFieldDidTap;
- (void)removeClientWithToken:(id)a3;
- (void)screenStateChangedWithNotification:(id)a3;
- (void)setEndpointsChangedHandler:(id)a3;
@end

@implementation SDAirDropEndpointService

- (id)endpointsChangedHandler
{
  if (*(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_endpointsChangedHandler))
  {
    uint64_t v2 = *(void *)&self->deviceStatus[OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_endpointsChangedHandler];
    v5[4] = *(Class *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_endpointsChangedHandler);
    v5[5] = v2;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 1107296256;
    v5[2] = sub_10046CE14;
    v5[3] = &unk_1008DBE38;
    v3 = _Block_copy(v5);
    swift_retain();
    swift_release();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)setEndpointsChangedHandler:(id)a3
{
  uint64_t v4 = (uint64_t)_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v5;
    v6 = sub_100484D00;
  }
  else
  {
    v6 = 0;
  }
  v7 = (void (**)(uint64_t))((char *)self
                                     + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_endpointsChangedHandler);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_endpointsChangedHandler);
  *v7 = v6;
  v7[1] = (void (*)(uint64_t))v4;

  sub_1002CA430(v8);
}

- (id)addClient:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_10046D208(v4);

  return v6;
}

- (void)removeClientWithToken:(id)a3
{
  uint64_t v5 = sub_10000A844(&qword_10096C920);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  uint64_t v9 = qword_100969B90;
  id v10 = a3;
  v11 = self;
  id v12 = v10;
  v13 = v11;
  if (v9 != -1) {
    swift_once();
  }
  uint64_t v14 = static AirDropActor.shared;
  uint64_t v15 = sub_10000BAA0((unint64_t *)&qword_1009744A0, (void (*)(uint64_t))type metadata accessor for AirDropActor);
  v16 = (void *)swift_allocObject();
  v16[2] = v14;
  v16[3] = v15;
  v16[4] = v12;
  v16[5] = v13;
  swift_retain();
  sub_10028CFA8((uint64_t)v7, (uint64_t)&unk_100974F78, (uint64_t)v16);
  swift_release();
}

- (void)nearFieldDidTap
{
  uint64_t v2 = self;
  sub_10047FA28();
}

- (void)screenStateChangedWithNotification:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = self;
  sub_10047FB50();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC16DaemoniOSLibrary24SDAirDropEndpointService)init
{
  result = (_TtC16DaemoniOSLibrary24SDAirDropEndpointService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_deviceStatus));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_nearbyAgent));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_bleController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_applicationServiceBrowser));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_bonjourBrowser));
  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_sessionID;
  uint64_t v4 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_1002CA430(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_endpointsChangedHandler));
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary24SDAirDropEndpointService_delegate;

  sub_100261080((uint64_t)v5);
}

@end