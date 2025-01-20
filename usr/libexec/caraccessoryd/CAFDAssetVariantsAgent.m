@interface CAFDAssetVariantsAgent
- (NSString)domain;
- (_TtC13caraccessoryd22CAFDAssetVariantsAgent)init;
- (_TtC13caraccessoryd22CAFDAssetVariantsAgent)initWithCarManager:(id)a3 sessionStatus:(id)a4;
- (void)accessoryDidUpdate:(id)a3 receivedAllValues:(BOOL)a4;
- (void)carDidUpdateAccessories:(id)a3;
- (void)carManager:(id)a3 didUpdateCurrentCar:(id)a4;
- (void)clusterThemeManager:(id)a3 didUpdateExtraAssetsURL:(id)a4;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
@end

@implementation CAFDAssetVariantsAgent

- (_TtC13caraccessoryd22CAFDAssetVariantsAgent)initWithCarManager:(id)a3 sessionStatus:(id)a4
{
  return (_TtC13caraccessoryd22CAFDAssetVariantsAgent *)CAFDAssetVariantsAgent.init(carManager:sessionStatus:)(a3, a4);
}

- (_TtC13caraccessoryd22CAFDAssetVariantsAgent)init
{
  result = (_TtC13caraccessoryd22CAFDAssetVariantsAgent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_vehicleResources));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_clusterThemeManager));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_assetExtrasURL);
}

- (void)carManager:(id)a3 didUpdateCurrentCar:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  specialized CAFDAssetVariantsAgent.carManager(_:didUpdateCurrentCar:)(a4);
}

- (void)carDidUpdateAccessories:(id)a3
{
  id v4 = a3;
  v5 = self;
  CAFDAssetVariantsAgent.carDidUpdateAccessories(_:)(v4);
}

- (void)clusterThemeManager:(id)a3 didUpdateExtraAssetsURL:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  v9 = self;
  CAFDAssetVariantsAgent.assetExtrasURL.willset(a4);
  v10 = *(Class *)((char *)&v9->super.isa + OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_assetExtrasURL);
  *(Class *)((char *)&v9->super.isa + OBJC_IVAR____TtC13caraccessoryd22CAFDAssetVariantsAgent_assetExtrasURL) = (Class)a4;
  id v11 = v7;

  swift_beginAccess();
  uint64_t v12 = swift_bridgeObjectRetain();
  specialized Sequence.forEach(_:)(v12);

  swift_bridgeObjectRelease();
}

- (void)accessoryDidUpdate:(id)a3 receivedAllValues:(BOOL)a4
{
  id v5 = a3;
  id v6 = self;
  specialized CAFDAssetVariantsAgent.accessoryDidUpdate(_:receivedAllValues:)();
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  specialized CAFDAssetVariantsAgent.listener(_:didReceive:withContext:)(v8);

  swift_unknownObjectRelease();
}

- (NSString)domain
{
  type metadata accessor for CAUVariantsService();
  static CAUVariantsService.domain.getter();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

@end