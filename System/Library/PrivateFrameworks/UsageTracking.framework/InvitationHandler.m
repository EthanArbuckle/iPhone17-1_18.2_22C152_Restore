@interface InvitationHandler
- (_TtC18UsageTrackingAgent17InvitationHandler)init;
- (void)manager:(id)a3 incomingInvitation:(id)a4;
- (void)manager:(id)a3 receiverDidAcceptInvitation:(id)a4;
- (void)manager:(id)a3 receiverDidDeclineInvitation:(id)a4;
- (void)manager:(id)a3 senderDidCancelInvitation:(id)a4;
@end

@implementation InvitationHandler

- (void)manager:(id)a3 incomingInvitation:(id)a4
{
  v7 = (char *)self + OBJC_IVAR____TtC18UsageTrackingAgent17InvitationHandler_delegate;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v8 = *((void *)v7 + 1);
    uint64_t ObjectType = swift_getObjectType();
    v14[3] = sub_100037850();
    v14[4] = &off_10008B118;
    v14[0] = a3;
    v10 = *(void (**)(void *, id, uint64_t, uint64_t))(v8 + 8);
    id v11 = a3;
    id v12 = a4;
    v13 = self;
    v10(v14, v12, ObjectType, v8);
    swift_unknownObjectRelease();
    sub_10002AE2C((uint64_t)v14);
  }
}

- (void)manager:(id)a3 senderDidCancelInvitation:(id)a4
{
  v7 = (char *)self + OBJC_IVAR____TtC18UsageTrackingAgent17InvitationHandler_delegate;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v8 = *((void *)v7 + 1);
    uint64_t ObjectType = swift_getObjectType();
    v14[3] = sub_100037850();
    v14[4] = &off_10008B118;
    v14[0] = a3;
    v10 = *(void (**)(void *, id, uint64_t, uint64_t))(v8 + 16);
    id v11 = a3;
    id v12 = a4;
    v13 = self;
    v10(v14, v12, ObjectType, v8);
    swift_unknownObjectRelease();
    sub_10002AE2C((uint64_t)v14);
  }
}

- (void)manager:(id)a3 receiverDidAcceptInvitation:(id)a4
{
  v7 = (char *)self + OBJC_IVAR____TtC18UsageTrackingAgent17InvitationHandler_delegate;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v8 = *((void *)v7 + 1);
    uint64_t ObjectType = swift_getObjectType();
    v14[3] = sub_100037850();
    v14[4] = &off_10008B118;
    v14[0] = a3;
    v10 = *(void (**)(void *, id, uint64_t, uint64_t))(v8 + 24);
    id v11 = a3;
    id v12 = a4;
    v13 = self;
    v10(v14, v12, ObjectType, v8);
    swift_unknownObjectRelease();
    sub_10002AE2C((uint64_t)v14);
  }
}

- (void)manager:(id)a3 receiverDidDeclineInvitation:(id)a4
{
  v7 = (char *)self + OBJC_IVAR____TtC18UsageTrackingAgent17InvitationHandler_delegate;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v8 = *((void *)v7 + 1);
    uint64_t ObjectType = swift_getObjectType();
    v14[3] = sub_100037850();
    v14[4] = &off_10008B118;
    v14[0] = a3;
    v10 = *(void (**)(void *, id, uint64_t, uint64_t))(v8 + 32);
    id v11 = a3;
    id v12 = a4;
    v13 = self;
    v10(v14, v12, ObjectType, v8);
    swift_unknownObjectRelease();
    sub_10002AE2C((uint64_t)v14);
  }
}

- (_TtC18UsageTrackingAgent17InvitationHandler)init
{
  *(void *)&self->delegate[OBJC_IVAR____TtC18UsageTrackingAgent17InvitationHandler_delegate] = 0;
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for InvitationHandler();
  return [(InvitationHandler *)&v4 init];
}

- (void).cxx_destruct
{
}

@end