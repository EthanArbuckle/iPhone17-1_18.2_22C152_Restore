@interface TransitLineContext
- (BOOL)chromeDidClearMapSelection;
- (BOOL)chromeDidSelectTransitLineMarker:(id)a3;
- (BOOL)isShowingLineWithIdentifier:(id)a3;
- (BOOL)isShowingLineWithLabelMarker:(id)a3;
- (BOOL)isShowingLineWithLineItem:(id)a3;
- (ChromeViewController)chromeViewController;
- (GEOMapServiceTraits)loadingTraits;
- (GEOTransitLineItem)lineItem;
- (LineCardViewController)lineCardViewController;
- (TransitLineDisambiguationViewController)disambiguationViewController;
- (VKLabelMarker)labelMarker;
- (_TtC4Maps18TransitLineContext)init;
- (_TtC4Maps18TransitLineContext)initWithLabelMarker:(id)a3 preferredLayout:(unint64_t)a4;
- (_TtC4Maps18TransitLineContext)initWithLineItem:(id)a3;
- (id)desiredCards;
- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)containeeViewControllerGoToPreviousState:(id)a3 withSender:(id)a4;
- (void)disambiguateSelectedLineFor:(id)a3 completion:(id)a4;
- (void)enterStackInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)lineCardViewController:(id)a3 displayMapRegion:(id)a4;
- (void)lineCardViewController:(id)a3 doDirectionItem:(id)a4;
- (void)lineCardViewController:(id)a3 openURL:(id)a4;
- (void)lineCardViewController:(id)a3 selectMapItem:(id)a4;
- (void)prepareLineCardViewControllerForFirstUse;
- (void)selectLineFor:(id)a3 zoomToMapRegion:(BOOL)a4;
- (void)selectLineWithLine:(id)a3 zoomToMapRegion:(BOOL)a4;
- (void)setChromeViewController:(id)a3;
- (void)setDisambiguationViewController:(id)a3;
- (void)setLabelMarker:(id)a3;
- (void)setLineCardViewController:(id)a3;
- (void)setLineItem:(id)a3;
@end

@implementation TransitLineContext

- (BOOL)chromeDidSelectTransitLineMarker:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1001E3A04(v4);

  return self & 1;
}

- (BOOL)chromeDidClearMapSelection
{
  v2 = self;
  unsigned __int8 v3 = sub_1001E3AE8();

  return v3 & 1;
}

- (void)lineCardViewController:(id)a3 doDirectionItem:(id)a4
{
  v6 = self;
  id v12 = a3;
  id v7 = a4;
  id v8 = [(TransitLineContext *)v6 iosBasedChromeViewController];
  if (v8)
  {
    v9 = v8;
    id v10 = [v8 appCoordinator];

    if (v10)
    {
      sub_1000EFC40((uint64_t)_swiftEmptyArrayStorage);
      Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      [v10 enterRoutePlanningWithDirectionItem:v7 withUserInfo:isa];

      id v7 = v10;
      v6 = (_TtC4Maps18TransitLineContext *)isa;
    }
  }
}

- (void)lineCardViewController:(id)a3 selectMapItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_1001F83E0((uint64_t)a4);
}

- (void)lineCardViewController:(id)a3 displayMapRegion:(id)a4
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps18TransitLineContext_chromeViewController);
  if (v4)
  {
    v11 = self;
    id v7 = (_TtC4Maps18TransitLineContext *)a3;
    id v8 = (_TtC4Maps18TransitLineContext *)a4;
    v9 = (_TtC4Maps18TransitLineContext *)[v4 mapCameraController];
    if (v9)
    {
      if (!v8)
      {
        __break(1u);
        return;
      }
      id v10 = v9;
      [(TransitLineContext *)v9 displayMapRegion:v8 animated:1 completion:0];

      id v7 = v8;
      id v8 = v11;
      v11 = v10;
    }
  }
}

- (void)lineCardViewController:(id)a3 openURL:(id)a4
{
  uint64_t v7 = sub_1000FF33C((uint64_t *)&unk_1015D5160);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v10 = type metadata accessor for URL();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 0, 1, v10);
  }
  else
  {
    uint64_t v11 = type metadata accessor for URL();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v9, 1, 1, v11);
  }
  id v12 = a3;
  v13 = self;
  sub_1001F8508((uint64_t)v9);

  sub_1001F8698((uint64_t)v9);
}

- (ChromeViewController)chromeViewController
{
  return (ChromeViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                         + OBJC_IVAR____TtC4Maps18TransitLineContext_chromeViewController));
}

- (void)setChromeViewController:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps18TransitLineContext_chromeViewController);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps18TransitLineContext_chromeViewController) = (Class)a3;
  id v3 = a3;
}

- (GEOTransitLineItem)lineItem
{
  v2 = (void *)swift_unknownObjectRetain();

  return (GEOTransitLineItem *)v2;
}

- (void)setLineItem:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps18TransitLineContext_lineItem) = (Class)a3;
  swift_unknownObjectRetain();

  swift_unknownObjectRelease();
}

- (VKLabelMarker)labelMarker
{
  return (VKLabelMarker *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                  + OBJC_IVAR____TtC4Maps18TransitLineContext_labelMarker));
}

- (void)setLabelMarker:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps18TransitLineContext_labelMarker);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps18TransitLineContext_labelMarker) = (Class)a3;
  id v3 = a3;
}

- (LineCardViewController)lineCardViewController
{
  return (LineCardViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                           + OBJC_IVAR____TtC4Maps18TransitLineContext_lineCardViewController));
}

- (void)setLineCardViewController:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps18TransitLineContext_lineCardViewController);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps18TransitLineContext_lineCardViewController) = (Class)a3;
  id v3 = a3;
}

- (_TtC4Maps18TransitLineContext)initWithLineItem:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = (_TtC4Maps18TransitLineContext *)sub_100242110((uint64_t)a3);
  swift_unknownObjectRelease();
  return v4;
}

- (_TtC4Maps18TransitLineContext)initWithLabelMarker:(id)a3 preferredLayout:(unint64_t)a4
{
  id v4 = a3;
  v5 = (_TtC4Maps18TransitLineContext *)sub_10024219C(v4);

  return v5;
}

- (BOOL)isShowingLineWithLabelMarker:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_100240078(v4);

  return self & 1;
}

- (BOOL)isShowingLineWithLineItem:(id)a3
{
  return 0;
}

- (BOOL)isShowingLineWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_100240284(v4);

  return self & 1;
}

- (GEOMapServiceTraits)loadingTraits
{
  v2 = self;
  sub_10024047C();
  id v4 = v3;

  return (GEOMapServiceTraits *)v4;
}

- (void)selectLineFor:(id)a3 zoomToMapRegion:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = self;
  sub_1002405A4(v6, v4);
}

- (void)selectLineWithLine:(id)a3 zoomToMapRegion:(BOOL)a4
{
  BOOL v4 = a4;
  swift_unknownObjectRetain();
  uint64_t v7 = self;
  sub_10024109C(a3, v4);
  swift_unknownObjectRelease();
}

- (void)prepareLineCardViewControllerForFirstUse
{
  v2 = self;
  sub_10024173C();
}

- (TransitLineDisambiguationViewController)disambiguationViewController
{
  return (TransitLineDisambiguationViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                            + OBJC_IVAR____TtC4Maps18TransitLineContext_disambiguationViewController));
}

- (void)setDisambiguationViewController:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps18TransitLineContext_disambiguationViewController);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps18TransitLineContext_disambiguationViewController) = (Class)a3;
  id v3 = a3;
}

- (void)disambiguateSelectedLineFor:(id)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  v9 = self;
  sub_100241A58(v8, (uint64_t)sub_1001DB674, v7);

  swift_release();
}

- (_TtC4Maps18TransitLineContext)init
{
  result = (_TtC4Maps18TransitLineContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps18TransitLineContext_disambiguationViewController);
}

- (id)desiredCards
{
  v2 = self;
  id v3 = sub_100242CF0();

  if (v3)
  {
    sub_1000FF33C((uint64_t *)&unk_1015CE7A0);
    v4.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.Class isa = 0;
  }

  return v4.super.isa;
}

- (void)enterStackInChromeViewController:(id)a3 withAnimation:(id)a4
{
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = self;
  v12[4] = sub_1002433A0;
  v12[5] = v7;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_10008C380;
  v12[3] = &unk_1012DF0D0;
  id v8 = _Block_copy(v12);
  v9 = self;
  id v10 = a3;
  id v11 = a4;
  swift_release();
  [v11 addPreparation:v8];
  _Block_release(v8);
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a3;
  *(void *)(v7 + 24) = self;
  v14[4] = sub_100243360;
  v14[5] = v7;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 1107296256;
  v14[2] = sub_10008C380;
  v14[3] = &unk_1012DF080;
  id v8 = _Block_copy(v14);
  id v9 = a3;
  id v10 = self;
  id v11 = v9;
  id v12 = v10;
  id v13 = a4;
  swift_release();
  [v13 addPreparation:v8];
  _Block_release(v8);
}

- (void)containeeViewControllerGoToPreviousState:(id)a3 withSender:(id)a4
{
  NSArray v4 = a3;
  if (a4)
  {
    id v6 = a3;
    uint64_t v7 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    id v8 = a3;
    id v9 = self;
  }
  id v10 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps18TransitLineContext_chromeViewController);
  if (v10)
  {
    id v11 = v10;
    if ([(TransitLineContext *)v11 isTopContext:self]) {
      [(TransitLineContext *)v11 popContext:self animated:1 completion:0];
    }

    NSArray v4 = self;
  }
  else
  {
    id v11 = self;
  }

  sub_1001189D4((uint64_t)v12);
}

@end