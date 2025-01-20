@interface SavingsDashboardMessageSource
- (_TtC9PassKitUI29SavingsDashboardMessageSource)init;
- (void)dealloc;
- (void)didUpdatePaymentFundingSources:(id)a3 accountIdentifier:(id)a4;
- (void)discoveryService:(id)a3 dialogRequestsChangedForPlacement:(id)a4;
- (void)discoveryServiceDidReceiveUpdatedDiscoveryEngagementMessages:(id)a3;
- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4;
@end

@implementation SavingsDashboardMessageSource

- (void)dealloc
{
  v2 = self;
  sub_19FD00DD8();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC9PassKitUI29SavingsDashboardMessageSource__messages;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1E94B7B10);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI29SavingsDashboardMessageSource_transactionProvider));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI29SavingsDashboardMessageSource_accountService));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI29SavingsDashboardMessageSource_discoveryService));
  sub_19F48BB68(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC9PassKitUI29SavingsDashboardMessageSource_presentActionSheet));
  v5 = (char *)self + OBJC_IVAR____TtC9PassKitUI29SavingsDashboardMessageSource__presentContactSupport;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E949CE50);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);

  swift_release();
  sub_19F48BB68(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC9PassKitUI29SavingsDashboardMessageSource_presentDestinationWithConfiguration));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (_TtC9PassKitUI29SavingsDashboardMessageSource)init
{
  result = (_TtC9PassKitUI29SavingsDashboardMessageSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)discoveryService:(id)a3 dialogRequestsChangedForPlacement:(id)a4
{
  if (a4)
  {
    uint64_t v6 = sub_1A03B4988();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  id v9 = a3;
  v10 = self;
  sub_19FD0F4F8(v6, v8);

  swift_bridgeObjectRelease();
}

- (void)discoveryServiceDidReceiveUpdatedDiscoveryEngagementMessages:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_19FD0F870();
}

- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4
{
  if (a3)
  {
    uint64_t v6 = sub_1A03B4988();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  id v9 = a4;
  v10 = self;
  sub_19FD0E64C(v6, v8, a4);

  swift_bridgeObjectRelease();
}

- (void)didUpdatePaymentFundingSources:(id)a3 accountIdentifier:(id)a4
{
  if (a3)
  {
    sub_19F48BAC4(0, (unint64_t *)&qword_1E94AF5D0);
    sub_1A03B4C58();
  }
  if (a4)
  {
    a4 = (id)sub_1A03B4988();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v8 = self;
  sub_19FD0FB54((uint64_t)a4, v7);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end