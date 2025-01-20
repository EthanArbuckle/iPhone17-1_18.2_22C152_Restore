@interface SummaryCoordinator
- (_TtC10FitnessApp18SummaryCoordinator)init;
- (void)dealloc;
- (void)logCardConfigurationAnalytics;
- (void)pregnancyModelDidChangeWithProvider:(id)a3 model:(id)a4;
@end

@implementation SummaryCoordinator

- (void)logCardConfigurationAnalytics
{
  v2 = self;
  sub_1000219D4();
}

- (void)pregnancyModelDidChangeWithProvider:(id)a3 model:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_10008A680(0x31u);
}

- (void)dealloc
{
  v2 = self;
  sub_100447AB8();
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10FitnessApp18SummaryCoordinator_ringsCardFactory);
  v4 = *(void **)&self->internalQueue[OBJC_IVAR____TtC10FitnessApp18SummaryCoordinator_ringsCardFactory];

  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10FitnessApp18SummaryCoordinator_friendsCardsFactory);
  id v6 = *(void **)&self->context[OBJC_IVAR____TtC10FitnessApp18SummaryCoordinator_friendsCardsFactory];
  id v7 = *(void **)&self->ringsCardFactory[OBJC_IVAR____TtC10FitnessApp18SummaryCoordinator_friendsCardsFactory];
  v8 = *(void **)&self->ringsCardFactory[OBJC_IVAR____TtC10FitnessApp18SummaryCoordinator_friendsCardsFactory + 8];
  v9 = *(void **)&self->ringsCardFactory[OBJC_IVAR____TtC10FitnessApp18SummaryCoordinator_friendsCardsFactory + 16];

  swift_release();
  v10 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10FitnessApp18SummaryCoordinator_metricsCardFactory);
  v11 = *(void **)&self->internalQueue[OBJC_IVAR____TtC10FitnessApp18SummaryCoordinator_metricsCardFactory];

  v12 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10FitnessApp18SummaryCoordinator_historyCardFactory);
  v13 = *(void **)&self->internalQueue[OBJC_IVAR____TtC10FitnessApp18SummaryCoordinator_historyCardFactory];
  v14 = *(void **)&self->context[OBJC_IVAR____TtC10FitnessApp18SummaryCoordinator_historyCardFactory];
  v15 = *(void **)&self->ringsCardFactory[OBJC_IVAR____TtC10FitnessApp18SummaryCoordinator_historyCardFactory + 8];
  v16 = *(void **)&self->ringsCardFactory[OBJC_IVAR____TtC10FitnessApp18SummaryCoordinator_historyCardFactory + 16];
  v17 = *(void **)&self->friendsCardsFactory[OBJC_IVAR____TtC10FitnessApp18SummaryCoordinator_historyCardFactory];

  swift_release();
  sub_10044C634((uint64_t)self + OBJC_IVAR____TtC10FitnessApp18SummaryCoordinator_awardCardFactory);

  sub_10044C688((uint64_t)self + OBJC_IVAR____TtC10FitnessApp18SummaryCoordinator_fitnessPlusCardFactory);
  swift_release();
  swift_release();
  v18 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10FitnessApp18SummaryCoordinator_trendsCardFactory);
  v19 = *(void **)&self->internalQueue[OBJC_IVAR____TtC10FitnessApp18SummaryCoordinator_trendsCardFactory];
  v20 = *(void **)&self->context[OBJC_IVAR____TtC10FitnessApp18SummaryCoordinator_trendsCardFactory];

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10019B9F8((uint64_t)self + OBJC_IVAR____TtC10FitnessApp18SummaryCoordinator_delegate);
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
}

- (_TtC10FitnessApp18SummaryCoordinator)init
{
  result = (_TtC10FitnessApp18SummaryCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end