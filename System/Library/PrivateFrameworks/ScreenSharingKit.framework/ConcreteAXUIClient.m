@interface ConcreteAXUIClient
- (_TtC16ScreenSharingKit18ConcreteAXUIClient)init;
- (id)userInterfaceClient:(id)a3 accessQueueForProcessingMessageWithIdentifier:(int64_t)a4;
- (void)connectionWithServiceWasInterruptedForUserInterfaceClient:(id)a3;
@end

@implementation ConcreteAXUIClient

- (_TtC16ScreenSharingKit18ConcreteAXUIClient)init
{
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16ScreenSharingKit18ConcreteAXUIClient_serviceName);
  void *v3 = 0xD000000000000020;
  v3[1] = 0x800000025BC1D340;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16ScreenSharingKit18ConcreteAXUIClient_screenSharingClient) = 0;
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16ScreenSharingKit18ConcreteAXUIClient_interruptionHandler);
  v5 = (objc_class *)type metadata accessor for ConcreteAXUIClient();
  void *v4 = 0;
  v4[1] = 0;
  v7.receiver = self;
  v7.super_class = v5;
  return [(ConcreteAXUIClient *)&v7 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16ScreenSharingKit18ConcreteAXUIClient_screenSharingClient));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16ScreenSharingKit18ConcreteAXUIClient_interruptionHandler);
  sub_25BAC0948(v3);
}

- (id)userInterfaceClient:(id)a3 accessQueueForProcessingMessageWithIdentifier:(int64_t)a4
{
  id v4 = objc_msgSend(self, sel_mainAccessQueue);
  return v4;
}

- (void)connectionWithServiceWasInterruptedForUserInterfaceClient:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_25BB82EB0((uint64_t)a3);
}

@end