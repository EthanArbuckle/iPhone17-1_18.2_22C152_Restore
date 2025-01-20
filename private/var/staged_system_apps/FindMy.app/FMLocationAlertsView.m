@interface FMLocationAlertsView
- (_TtC6FindMy20FMLocationAlertsView)initWithCoder:(id)a3;
- (void)handleAction;
- (void)handleFenceTapWithSender:(id)a3;
- (void)handleSecondaryAction;
@end

@implementation FMLocationAlertsView

- (_TtC6FindMy20FMLocationAlertsView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy20FMLocationAlertsView_fencesRow) = (Class)_swiftEmptyArrayStorage;
  *(void *)&self->super.titleLabel[OBJC_IVAR____TtC6FindMy20FMLocationAlertsView_delegate] = 0;
  swift_unknownObjectWeakInit();
  v5 = (char *)self + OBJC_IVAR____TtC6FindMy20FMLocationAlertsView_viewModel;
  uint64_t v6 = type metadata accessor for FMPersonDetailViewModel(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy20FMLocationAlertsView_canSetNotifyMe) = 0;
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy20FMLocationAlertsView_disabled) = 0;
  id v7 = a3;

  result = (_TtC6FindMy20FMLocationAlertsView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)handleAction
{
  v2 = self;
  sub_10038CD04();
}

- (void)handleFenceTapWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10038CE1C(v4);
}

- (void)handleSecondaryAction
{
  v2 = self;
  sub_10038D098();
}

- (void).cxx_destruct
{
}

@end