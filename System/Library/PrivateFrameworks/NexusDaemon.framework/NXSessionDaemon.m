@interface NXSessionDaemon
- (NSString)description;
- (_TtC11NexusDaemon15NXSessionDaemon)init;
- (void)dealloc;
- (void)session:(id)a3 receivedInvitationAcceptFromID:(id)a4;
- (void)session:(id)a3 receivedInvitationCancelFromID:(id)a4;
- (void)session:(id)a3 receivedInvitationDeclineFromID:(id)a4;
- (void)sessionEnded:(id)a3 withReason:(unsigned int)a4 error:(id)a5;
- (void)sessionStarted:(id)a3;
@end

@implementation NXSessionDaemon

- (void)dealloc
{
  v2 = self;
  sub_257BCF598();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_257B90964(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11NexusDaemon15NXSessionDaemon_connectionEndedHandler));
  swift_release();

  v3 = (char *)self + OBJC_IVAR____TtC11NexusDaemon15NXSessionDaemon_endpoint;
  uint64_t v4 = sub_257C0A100();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  sub_257B90964(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11NexusDaemon15NXSessionDaemon_invalidationHandler));
  v5 = (char *)self + OBJC_IVAR____TtC11NexusDaemon15NXSessionDaemon__messageContext;
  uint64_t v6 = sub_257C0A2B0();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  sub_257B90964(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC11NexusDaemon15NXSessionDaemon_serverEventHandler));

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11NexusDaemon15NXSessionDaemon__needsNexusBluetoothAdvertiser));
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v7 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11NexusDaemon15NXSessionDaemon__securityStream);
}

- (NSString)description
{
  v2 = self;
  sub_257BCF9DC();
  sub_257C0AA40();

  swift_bridgeObjectRelease();
  v3 = (void *)sub_257C0A9F0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)sessionStarted:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_257BD9B54(v4);
}

- (void)sessionEnded:(id)a3 withReason:(unsigned int)a4 error:(id)a5
{
  id v8 = a3;
  v9 = self;
  id v10 = a5;
  sub_257BD9F70(v8, a4, a5);
}

- (void)session:(id)a3 receivedInvitationAcceptFromID:(id)a4
{
  sub_257BDA624(self, (uint64_t)a2, a3, (uint64_t)a4, "IDS invitation accepted: sessionID=%s, fromID=%s", 1);
}

- (void)session:(id)a3 receivedInvitationDeclineFromID:(id)a4
{
  sub_257BDA624(self, (uint64_t)a2, a3, (uint64_t)a4, "IDS invitation declined: sessionID=%s, fromID=%s", 0);
}

- (void)session:(id)a3 receivedInvitationCancelFromID:(id)a4
{
  sub_257BDA624(self, (uint64_t)a2, a3, (uint64_t)a4, "IDS invitation canceled: sessionID=%s, fromID=%s", 0);
}

- (_TtC11NexusDaemon15NXSessionDaemon)init
{
  result = (_TtC11NexusDaemon15NXSessionDaemon *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end