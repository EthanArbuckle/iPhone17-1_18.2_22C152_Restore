@interface PaymentPassActionWidgetView.Coordinator
- (_TtCV9PassKitUI27PaymentPassActionWidgetView11Coordinator)init;
- (void)callIssuer;
- (void)openBusinessChat;
- (void)openIssuerWebsite;
@end

@implementation PaymentPassActionWidgetView.Coordinator

- (void)callIssuer
{
}

- (void)openIssuerWebsite
{
}

- (void)openBusinessChat
{
}

- (_TtCV9PassKitUI27PaymentPassActionWidgetView11Coordinator)init
{
  result = (_TtCV9PassKitUI27PaymentPassActionWidgetView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_19F48BB68(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCV9PassKitUI27PaymentPassActionWidgetView11Coordinator_call));
  sub_19F48BB68(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCV9PassKitUI27PaymentPassActionWidgetView11Coordinator_website));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtCV9PassKitUI27PaymentPassActionWidgetView11Coordinator_message);

  sub_19F48BB68(v3);
}

@end