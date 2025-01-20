@interface NearbyGroupHostIDSService
- (_TtC44com_apple_SharePlay_NearbyInvitationsService25NearbyGroupHostIDSService)init;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
@end

@implementation NearbyGroupHostIDSService

- (_TtC44com_apple_SharePlay_NearbyInvitationsService25NearbyGroupHostIDSService)init
{
  result = (_TtC44com_apple_SharePlay_NearbyInvitationsService25NearbyGroupHostIDSService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService25NearbyGroupHostIDSService_queue));
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)self + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService25NearbyGroupHostIDSService_service);
  swift_release();
  swift_release();
}

- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7
{
  v9 = a5;
  if (a5)
  {
    id v12 = a3;
    id v13 = a4;
    id v14 = a6;
    id v15 = a7;
    v16 = self;
    id v17 = v9;
    v9 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v19 = v18;

    if (a6)
    {
LABEL_3:
      uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v22 = v21;

      goto LABEL_6;
    }
  }
  else
  {
    id v23 = a3;
    id v24 = a4;
    id v25 = a6;
    id v26 = a7;
    v27 = self;
    unint64_t v19 = 0xF000000000000000;
    if (a6) {
      goto LABEL_3;
    }
  }
  uint64_t v20 = 0;
  unint64_t v22 = 0;
LABEL_6:
  specialized NearbyGroupHostIDSService.service(_:account:incomingData:fromID:context:)((uint64_t)v9, v19, v20, v22, a7);
  swift_bridgeObjectRelease();
  outlined consume of Data?((uint64_t)v9, v19);
}

@end