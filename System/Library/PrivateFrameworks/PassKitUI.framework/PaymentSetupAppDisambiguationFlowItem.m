@interface PaymentSetupAppDisambiguationFlowItem
- (_TtC9PassKitUI37PaymentSetupAppDisambiguationFlowItem)init;
- (void)bankAppDisambiguationViewControllerDidManualEntry:(id)a3;
- (void)bankAppDisambiguationViewControllerDidSelectApp:(id)a3;
@end

@implementation PaymentSetupAppDisambiguationFlowItem

- (_TtC9PassKitUI37PaymentSetupAppDisambiguationFlowItem)init
{
  result = (_TtC9PassKitUI37PaymentSetupAppDisambiguationFlowItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI37PaymentSetupAppDisambiguationFlowItem_product));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI37PaymentSetupAppDisambiguationFlowItem_linkedApplication));
  sub_19F482DB0((uint64_t)self + OBJC_IVAR____TtC9PassKitUI37PaymentSetupAppDisambiguationFlowItem_delegate);

  swift_bridgeObjectRelease();
}

- (void)bankAppDisambiguationViewControllerDidSelectApp:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_19F9672B4();
}

- (void)bankAppDisambiguationViewControllerDidManualEntry:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_19F967408();
}

@end