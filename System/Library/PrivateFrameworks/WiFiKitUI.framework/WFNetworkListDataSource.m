@interface WFNetworkListDataSource
- (WFNetworkListDataSource)init;
- (void)setAssociationHandler:(id)a3;
- (void)setInfoButtonHandler:(id)a3;
- (void)setOtherNetworkTapHandler:(id)a3;
- (void)setPendingDeletingNetworksChangedCallback:(id)a3;
- (void)setScanning:(BOOL)a3;
- (void)setUnconfiguredNetworksSectionTitleDelegate:(id)a3;
- (void)startEditingPreferredNetworks;
- (void)switchToScanList;
- (void)updateCurrentNetwork:(id)a3;
- (void)updateCurrentNetworkConfig:(id)a3;
- (void)updateEditablePreferredNetworks:(id)a3;
- (void)updateManagedPreferredNetworks:(id)a3;
- (void)updateScanResults:(id)a3;
@end

@implementation WFNetworkListDataSource

- (void)updateCurrentNetworkConfig:(id)a3
{
  id v5 = a3;
  v6 = self;
  NetworkListDataSource.updateCurrentNetworkConfig(newConfig:)((WFNetworkRowConfig_optional *)a3);
}

- (void)updateCurrentNetwork:(id)a3
{
  swift_unknownObjectRetain();
  id v5 = self;
  NetworkListDataSource.updateCurrentNetwork(newCurrentNetwork:)((uint64_t)a3);
  swift_unknownObjectRelease();
}

- (void)updateScanResults:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268109278);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___WFNetworkListDataSource_scanResults) = (Class)sub_2258825A8();
  v4 = self;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_22585DA1C();

  swift_bridgeObjectRelease();
}

- (void)setScanning:(BOOL)a3
{
  v4 = self;
  NetworkListDataSource.updateScanning(newState:)(a3);
}

- (void)setOtherNetworkTapHandler:(id)a3
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
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___WFNetworkListDataSource_otherNetworkTapHandler);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_225858008(v7);
}

- (void)setInfoButtonHandler:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_22586A530;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___WFNetworkListDataSource_infoButtonTapHandler);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_225858008(v7);
}

- (void)setAssociationHandler:(id)a3
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
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___WFNetworkListDataSource_associationHandler);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_225858008(v7);
}

- (void)setPendingDeletingNetworksChangedCallback:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_22586A514;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___WFNetworkListDataSource_pendingDeletingNetworksChangedCallback);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_225858008(v7);
}

- (void)setUnconfiguredNetworksSectionTitleDelegate:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_22586A50C;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___WFNetworkListDataSource_unconfiguredNetworksSectionTitleDelegate);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_225858008(v7);
}

- (void)updateManagedPreferredNetworks:(id)a3
{
}

- (void)updateEditablePreferredNetworks:(id)a3
{
}

- (void)startEditingPreferredNetworks
{
  v2 = self;
  NetworkListDataSource.startEditingPreferredNetworks()();
}

- (void)switchToScanList
{
  v2 = self;
  NetworkListDataSource.switchToScanList()();
}

- (WFNetworkListDataSource)init
{
  return (WFNetworkListDataSource *)NetworkListDataSource.init()();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___WFNetworkListDataSource__currentNetwork;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681091C8);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = (char *)self + OBJC_IVAR___WFNetworkListDataSource__currentNetworkRowConfig;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681091C0);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = (char *)self + OBJC_IVAR___WFNetworkListDataSource__listMode;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681091B8);
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  v9 = (char *)self + OBJC_IVAR___WFNetworkListDataSource__knownNetworks;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681091B0);
  v11 = *(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8);
  v11(v9, v10);
  v11((char *)self + OBJC_IVAR___WFNetworkListDataSource__phNetworks, v10);
  v11((char *)self + OBJC_IVAR___WFNetworkListDataSource__publicNetworks, v10);
  v11((char *)self + OBJC_IVAR___WFNetworkListDataSource__infraNetworks, v10);
  v11((char *)self + OBJC_IVAR___WFNetworkListDataSource__adhocNetworks, v10);
  v11((char *)self + OBJC_IVAR___WFNetworkListDataSource__unConfiguredNetworks, v10);
  v11((char *)self + OBJC_IVAR___WFNetworkListDataSource__managedPreferredNetworks, v10);
  v11((char *)self + OBJC_IVAR___WFNetworkListDataSource__editablePreferredNetworks, v10);
  v12 = (char *)self + OBJC_IVAR___WFNetworkListDataSource__isScanning;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268109400);
  (*(void (**)(char *, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
  v14 = (char *)self + OBJC_IVAR___WFNetworkListDataSource__unconfiguredNetworksSectionTitle;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2681091A0);
  (*(void (**)(char *, uint64_t))(*(void *)(v15 - 8) + 8))(v14, v15);
  swift_bridgeObjectRelease();
  sub_225858008(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WFNetworkListDataSource_networkTapHandler));
  sub_225858008(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WFNetworkListDataSource_infoButtonTapHandler));
  sub_225858008(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WFNetworkListDataSource_associationHandler));
  sub_225858008(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR___WFNetworkListDataSource_pendingDeletingNetworksChangedCallback));
  sub_225858008(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WFNetworkListDataSource_otherNetworkTapHandler));
  sub_225858008(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR___WFNetworkListDataSource_unconfiguredNetworksSectionTitleDelegate));
  swift_bridgeObjectRelease();
}

@end