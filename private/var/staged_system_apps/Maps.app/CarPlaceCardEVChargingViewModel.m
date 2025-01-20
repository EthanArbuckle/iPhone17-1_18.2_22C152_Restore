@interface CarPlaceCardEVChargingViewModel
- (BOOL)hasSummaryInfo;
- (BOOL)isActive;
- (NSAttributedString)summaryDescription;
- (NSString)summaryTitle;
- (_TtC4Maps31CarPlaceCardEVChargingViewModel)init;
- (_TtC4Maps31CarPlaceCardEVChargingViewModel)initWithMapItem:(id)a3 virtualGarageService:(id)a4;
- (_TtC4Maps31CarPlaceCardEVChargingViewModel)initWithMapItemIdentifier:(id)a3 plugs:(id)a4 initialAggregatedAvailabilityInfo:(id)a5 virtualGarageService:(id)a6;
- (_TtP4Maps39CarPlaceCardEVChargingViewModelObserver_)observer;
- (void)evChargerAvailabilityDownloader:(id)a3 didDownloadAvailabilityWithPlugs:(id)a4;
- (void)setIsActive:(BOOL)a3;
- (void)setObserver:(id)a3;
- (void)setSummaryDescription:(id)a3;
- (void)setSummaryTitle:(id)a3;
@end

@implementation CarPlaceCardEVChargingViewModel

- (BOOL)hasSummaryInfo
{
  return *(void *)&self->sections[OBJC_IVAR____TtC4Maps31CarPlaceCardEVChargingViewModel_summaryTitle]
      && *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps31CarPlaceCardEVChargingViewModel_summaryDescription) != 0;
}

- (NSString)summaryTitle
{
  if (*(void *)&self->sections[OBJC_IVAR____TtC4Maps31CarPlaceCardEVChargingViewModel_summaryTitle])
  {
    swift_bridgeObjectRetain();
    NSString v2 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v2 = 0;
  }

  return (NSString *)v2;
}

- (void)setSummaryTitle:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC4Maps31CarPlaceCardEVChargingViewModel_summaryTitle);
  uint64_t *v6 = v4;
  v6[1] = v5;

  swift_bridgeObjectRelease();
}

- (NSAttributedString)summaryDescription
{
  return (NSAttributedString *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                       + OBJC_IVAR____TtC4Maps31CarPlaceCardEVChargingViewModel_summaryDescription));
}

- (void)setSummaryDescription:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps31CarPlaceCardEVChargingViewModel_summaryDescription);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps31CarPlaceCardEVChargingViewModel_summaryDescription) = (Class)a3;
  id v3 = a3;
}

- (_TtP4Maps39CarPlaceCardEVChargingViewModelObserver_)observer
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtP4Maps39CarPlaceCardEVChargingViewModelObserver_ *)Strong;
}

- (void)setObserver:(id)a3
{
}

- (BOOL)isActive
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps31CarPlaceCardEVChargingViewModel_isActive);
}

- (void)setIsActive:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC4Maps31CarPlaceCardEVChargingViewModel_isActive) = a3;
  [self->super.isa.availabilityRefresher setIsActive:];
}

- (_TtC4Maps31CarPlaceCardEVChargingViewModel)initWithMapItem:(id)a3 virtualGarageService:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  return (_TtC4Maps31CarPlaceCardEVChargingViewModel *)CarPlaceCardEVChargingViewModel.init(mapItem:virtualGarageService:)(v5, a4);
}

- (_TtC4Maps31CarPlaceCardEVChargingViewModel)initWithMapItemIdentifier:(id)a3 plugs:(id)a4 initialAggregatedAvailabilityInfo:(id)a5 virtualGarageService:(id)a6
{
  sub_100100830(0, &qword_1015CF8C0);
  uint64_t v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  return (_TtC4Maps31CarPlaceCardEVChargingViewModel *)CarPlaceCardEVChargingViewModel.init(mapItemIdentifier:plugs:initialAggregatedAvailabilityInfo:virtualGarageService:)(v10, v9, a5, a6);
}

- (_TtC4Maps31CarPlaceCardEVChargingViewModel)init
{
  result = (_TtC4Maps31CarPlaceCardEVChargingViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps31CarPlaceCardEVChargingViewModel_summaryDescription));
  sub_100123CE4((uint64_t)self + OBJC_IVAR____TtC4Maps31CarPlaceCardEVChargingViewModel_observer);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps31CarPlaceCardEVChargingViewModel_mapItemIdentifier));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps31CarPlaceCardEVChargingViewModel_initialAggregatedAvailabilityInfo));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps31CarPlaceCardEVChargingViewModel_virtualGarageService));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps31CarPlaceCardEVChargingViewModel_availabilityRefresher));
  id v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC4Maps31CarPlaceCardEVChargingViewModel____lazy_storage___chargerSymbolString);

  sub_10010B3BC(v3);
}

- (void)evChargerAvailabilityDownloader:(id)a3 didDownloadAvailabilityWithPlugs:(id)a4
{
  sub_100100830(0, &qword_1015CF8C0);
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  v8 = self;
  sub_10014F828(v6);

  swift_bridgeObjectRelease();
}

@end