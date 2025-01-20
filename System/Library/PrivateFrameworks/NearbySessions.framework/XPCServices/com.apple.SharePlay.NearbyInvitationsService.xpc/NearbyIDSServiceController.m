@interface NearbyIDSServiceController
- (_TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController)init;
- (void)service:(id)a3 account:(id)a4 incomingData:(id)a5 fromID:(id)a6 context:(id)a7;
@end

@implementation NearbyIDSServiceController

- (_TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController)init
{
  result = (_TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  outlined destroy of weak PeerConnectionDelegate?((uint64_t)self + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_delegate);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)self + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_service);
  outlined destroy of Any?((uint64_t)self + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_firewall, &demangling cache variable for type metadata for FirewallProvider?);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_joinRequestsController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController_queue));
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService26NearbyIDSServiceController____lazy_storage___contactStore);
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

    if (a6) {
      goto LABEL_3;
    }
LABEL_8:
    v20 = 0;
    uint64_t v22 = 0;
    if (a3) {
      goto LABEL_4;
    }
LABEL_9:
    __break(1u);
    return;
  }
  id v24 = a3;
  id v25 = a4;
  id v26 = a6;
  id v27 = a7;
  v28 = self;
  unint64_t v19 = 0xF000000000000000;
  if (!a6) {
    goto LABEL_8;
  }
LABEL_3:
  v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v22 = v21;

  if (!a3) {
    goto LABEL_9;
  }
LABEL_4:
  id v23 = a3;
  specialized NearbyIDSServiceController.handleIncomingMessage(_:account:incomingData:fromIDWithToken:context:)((uint64_t)v9, v19, v20, v22, a7, self);

  swift_bridgeObjectRelease();
  outlined consume of Data?((uint64_t)v9, v19);
}

@end