@interface KCSharingMessagingdInvitationManagerDelegate
- (_TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate)init;
- (void)manager:(id)a3 incomingInvitation:(id)a4;
- (void)manager:(id)a3 receiverDidAcceptInvitation:(id)a4;
- (void)manager:(id)a3 receiverDidDeclineInvitation:(id)a4;
- (void)manager:(id)a3 senderDidCancelInvitation:(id)a4;
@end

@implementation KCSharingMessagingdInvitationManagerDelegate

- (_TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate)init
{
}

- (void)manager:(id)a3 incomingInvitation:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = self;
  sub_100014C50(v6);
}

- (void)manager:(id)a3 senderDidCancelInvitation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_100014FD8(v7);
}

- (void)manager:(id)a3 receiverDidAcceptInvitation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_100015194(v7, "receiver did accept invite %@");
}

- (void)manager:(id)a3 receiverDidDeclineInvitation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_100015194(v7, "receiver did decline invite %@");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate_manager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate_daemonConnection));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25keychainsharingmessagingd44KCSharingMessagingdInvitationManagerDelegate_queue));

  swift_bridgeObjectRelease();
}

@end