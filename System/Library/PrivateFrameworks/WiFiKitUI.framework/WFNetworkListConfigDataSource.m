@interface WFNetworkListConfigDataSource
- (WFNetworkListConfigDataSource)init;
- (void)setAskToJoinMode:(int64_t)a3;
- (void)setAskToJoinModeTapHandler:(id)a3;
- (void)setAutoInstantHotspotOption:(int64_t)a3;
- (void)setAutoInstantHotspotTapHandler:(id)a3;
- (void)setAutoUnlockEnabled:(BOOL)a3;
- (void)setDataUsageHidden:(BOOL)a3;
- (void)setDataUsageTapHandler:(id)a3;
- (void)setIsCellularDevice:(BOOL)a3;
- (void)setIsChinaDevice:(BOOL)a3;
- (void)setNetworkModificationRestriction:(BOOL)a3;
- (void)setPowerModificationRestriction:(BOOL)a3;
- (void)setPowerState:(unint64_t)a3;
- (void)setPowerToggleHandler:(id)a3;
- (void)setUserAutoJoinEnabled:(BOOL)a3;
- (void)setWAPIEnabled:(BOOL)a3;
- (void)setWAPISwitchHandler:(id)a3;
- (void)setWAPISwitchHidden:(BOOL)a3;
@end

@implementation WFNetworkListConfigDataSource

- (void)setNetworkModificationRestriction:(BOOL)a3
{
  v4 = self;
  NetworkListConfigDataSource.setNetworkModificationRestriction(_:)(a3);
}

- (void)setPowerModificationRestriction:(BOOL)a3
{
  v4 = self;
  NetworkListConfigDataSource.setPowerModificationRestriction(_:)(a3);
}

- (void)setPowerState:(unint64_t)a3
{
  v4 = self;
  NetworkListConfigDataSource.setPowerState(_:)(a3);
}

- (void)setAskToJoinMode:(int64_t)a3
{
  v4 = self;
  NetworkListConfigDataSource.setAskToJoinOption(_:)(a3);
}

- (void)setAutoInstantHotspotOption:(int64_t)a3
{
  v4 = self;
  NetworkListConfigDataSource.setAutoInstantHotspotOption(_:)(a3);
}

- (void)setAutoInstantHotspotTapHandler:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_22586EF84;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___WFNetworkListConfigDataSource_autoInstantHotspotTapHandler);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_225858008(v7);
}

- (void)setAskToJoinModeTapHandler:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_22586EF84;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___WFNetworkListConfigDataSource_askToJoinModeTapHandler);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_225858008(v7);
}

- (void)setWAPISwitchHandler:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_22586EF6C;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___WFNetworkListConfigDataSource_WAPISwitchHandler);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_225858008(v7);
}

- (void)setDataUsageTapHandler:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_225856E88;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___WFNetworkListConfigDataSource_dataUsageTapHandler);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_225858008(v7);
}

- (void)setIsChinaDevice:(BOOL)a3
{
  v4 = self;
  NetworkListConfigDataSource.setIsChinaDevice(_:)(a3);
}

- (void)setIsCellularDevice:(BOOL)a3
{
  v4 = self;
  NetworkListConfigDataSource.setIsCellularDevice(_:)(a3);
}

- (void)setAutoUnlockEnabled:(BOOL)a3
{
  v4 = self;
  NetworkListConfigDataSource.setAutoUnlockEnabled(_:)(a3);
}

- (void)setWAPIEnabled:(BOOL)a3
{
  v4 = self;
  NetworkListConfigDataSource.setWAPIEnabled(_:)(a3);
}

- (void)setUserAutoJoinEnabled:(BOOL)a3
{
  v4 = self;
  NetworkListConfigDataSource.setUserAutoJoinEnabled(_:)(a3);
}

- (void)setDataUsageHidden:(BOOL)a3
{
  v4 = self;
  NetworkListConfigDataSource.setDataUsageHidden(_:)(a3);
}

- (void)setWAPISwitchHidden:(BOOL)a3
{
  v4 = self;
  NetworkListConfigDataSource.setWAPISwitchHidden(_:)(a3);
}

- (void)setPowerToggleHandler:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_22586A51C;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___WFNetworkListConfigDataSource_powerToggleHandler);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_225858008(v7);
}

- (WFNetworkListConfigDataSource)init
{
  return (WFNetworkListConfigDataSource *)NetworkListConfigDataSource.init()();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___WFNetworkListConfigDataSource__powerOn;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109400);
  uint64_t v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v6 = (char *)self + OBJC_IVAR___WFNetworkListConfigDataSource__powerState;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109300);
  (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  v5((char *)self + OBJC_IVAR___WFNetworkListConfigDataSource__dataUsageHidden, v4);
  v5((char *)self + OBJC_IVAR___WFNetworkListConfigDataSource__WAPISwitchHidden, v4);
  v5((char *)self + OBJC_IVAR___WFNetworkListConfigDataSource__WAPIEnabled, v4);
  v8 = (char *)self + OBJC_IVAR___WFNetworkListConfigDataSource__askToJoinMode;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681092F8);
  (*(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  v10 = (char *)self + OBJC_IVAR___WFNetworkListConfigDataSource__autoInstantHotspotOption;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681092F0);
  (*(void (**)(char *, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  v5((char *)self + OBJC_IVAR___WFNetworkListConfigDataSource__networkModificationRestrictionOn, v4);
  v5((char *)self + OBJC_IVAR___WFNetworkListConfigDataSource__powerModificationRestrictionOn, v4);
  sub_225858008(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR___WFNetworkListConfigDataSource_autoInstantHotspotTapHandler));
  sub_225858008(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WFNetworkListConfigDataSource_askToJoinModeTapHandler));
  sub_225858008(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WFNetworkListConfigDataSource_WAPISwitchHandler));
  sub_225858008(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WFNetworkListConfigDataSource_dataUsageTapHandler));
  uint64_t v12 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WFNetworkListConfigDataSource_powerToggleHandler);
  sub_225858008(v12);
}

@end