@interface RDDaemonController
- (_TtC7remindd18RDDaemonController)init;
- (id)syncChangeTrackingPerformerWithReason:(id)a3 errorHandler:(id)a4;
- (id)syncDebugPerformerWithErrorHandler:(id)a3;
- (id)syncDebugPerformerWithReason:(id)a3 errorHandler:(id)a4;
- (id)syncIndexingPerformerWithReason:(id)a3 errorHandler:(id)a4;
- (id)syncStorePerformerWithReason:(id)a3 errorHandler:(id)a4;
- (id)syncSyncInterfacePerformerWithReason:(id)a3 errorHandler:(id)a4;
- (void)asyncDebugPerformerWithReason:(id)a3 loadHandler:(id)a4 errorHandler:(id)a5;
- (void)asyncIndexingPerformerWithReason:(id)a3 loadHandler:(id)a4 errorHandler:(id)a5;
- (void)asyncStorePerformerWithReason:(id)a3 loadHandler:(id)a4 errorHandler:(id)a5;
- (void)asyncSyncInterfacePerformerWithReason:(id)a3 loadHandler:(id)a4 errorHandler:(id)a5;
@end

@implementation RDDaemonController

- (id)syncChangeTrackingPerformerWithReason:(id)a3 errorHandler:(id)a4
{
  return sub_100541244(self, (int)a2, (int)a3, a4, (uint64_t (*)(void))sub_1005414F4);
}

- (id)syncDebugPerformerWithReason:(id)a3 errorHandler:(id)a4
{
  return sub_100541244(self, (int)a2, (int)a3, a4, (uint64_t (*)(void))sub_1005416A8);
}

- (id)syncDebugPerformerWithErrorHandler:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  v6 = (void *)sub_1005416A8((uint64_t)v5, (uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);

  return v6;
}

- (void)asyncDebugPerformerWithReason:(id)a3 loadHandler:(id)a4 errorHandler:(id)a5
{
  v7 = _Block_copy(a4);
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  *(void *)(swift_allocObject() + 16) = v8;
  v10 = self;
  sub_10054185C((void (*)(uint64_t))sub_100243D7C, v9, (void (*)(id))sub_10011C2EC);

  swift_release();

  swift_release();
}

- (id)syncStorePerformerWithReason:(id)a3 errorHandler:(id)a4
{
  return sub_100541244(self, (int)a2, (int)a3, a4, (uint64_t (*)(void))sub_100541A48);
}

- (void)asyncStorePerformerWithReason:(id)a3 loadHandler:(id)a4 errorHandler:(id)a5
{
}

- (id)syncSyncInterfacePerformerWithReason:(id)a3 errorHandler:(id)a4
{
  return sub_100541244(self, (int)a2, (int)a3, a4, (uint64_t (*)(void))sub_100541BFC);
}

- (void)asyncSyncInterfacePerformerWithReason:(id)a3 loadHandler:(id)a4 errorHandler:(id)a5
{
}

- (id)syncIndexingPerformerWithReason:(id)a3 errorHandler:(id)a4
{
  return sub_100541244(self, (int)a2, (int)a3, a4, (uint64_t (*)(void))sub_100541DA4);
}

- (void)asyncIndexingPerformerWithReason:(id)a3 loadHandler:(id)a4 errorHandler:(id)a5
{
}

- (_TtC7remindd18RDDaemonController)init
{
  result = (_TtC7remindd18RDDaemonController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  sub_10012227C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7remindd18RDDaemonController_clientIdentity), *(void *)&self->xpcDaemon[OBJC_IVAR____TtC7remindd18RDDaemonController_clientIdentity], *(void *)&self->xpcDaemon[OBJC_IVAR____TtC7remindd18RDDaemonController_clientIdentity + 8], *(void *)&self->clientIdentity[OBJC_IVAR____TtC7remindd18RDDaemonController_clientIdentity], *(void *)&self->clientIdentity[OBJC_IVAR____TtC7remindd18RDDaemonController_clientIdentity + 8], *(unsigned int *)&self->clientIdentity[OBJC_IVAR____TtC7remindd18RDDaemonController_clientIdentity + 16] | ((unint64_t)*(unsigned __int16 *)&self->clientIdentity[OBJC_IVAR____TtC7remindd18RDDaemonController_clientIdentity + 20] << 32));
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7remindd18RDDaemonController_storeContainerToken);
}

@end