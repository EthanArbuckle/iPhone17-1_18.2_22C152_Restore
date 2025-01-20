@interface KCSharingMessagingdXPCListenerDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC25keychainsharingmessagingd38KCSharingMessagingdXPCListenerDelegate)init;
@end

@implementation KCSharingMessagingdXPCListenerDelegate

- (_TtC25keychainsharingmessagingd38KCSharingMessagingdXPCListenerDelegate)init
{
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_1000181C0(v7);

  return v9 & 1;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25keychainsharingmessagingd38KCSharingMessagingdXPCListenerDelegate_listener));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC25keychainsharingmessagingd38KCSharingMessagingdXPCListenerDelegate_connectionQueue));

  swift_bridgeObjectRelease();
}

@end