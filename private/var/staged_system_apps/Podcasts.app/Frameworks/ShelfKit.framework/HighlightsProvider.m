@interface HighlightsProvider
- (BOOL)isSharedContentWithContentAdamId:(int64_t)a3;
- (BOOL)isSharedContentWithPageAdamId:(id)a3;
- (_TtC8ShelfKit18HighlightsProvider)init;
- (void)accountDidChange;
- (void)clearSharedItems;
- (void)dealloc;
- (void)highlightCenter:(id)a3 didRemoveHighlights:(id)a4;
- (void)highlightCenterDidAddHighlights:(id)a3;
@end

@implementation HighlightsProvider

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8ShelfKit18HighlightsProvider_highlightCenter);
  v5 = self;
  [v4 setDelegate:0];
  id v6 = [self defaultCenter];
  [v6 removeObserver:v5 name:ACDAccountStoreDidChangeNotification object:0];

  v7.receiver = v5;
  v7.super_class = ObjectType;
  [(HighlightsProvider *)&v7 dealloc];
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8ShelfKit18HighlightsProvider_storeDataProvider);

  swift_release();

  swift_bridgeObjectRelease();
}

- (void)accountDidChange
{
  v2 = self;
  sub_200BC4();
}

- (BOOL)isSharedContentWithContentAdamId:(int64_t)a3
{
  swift_beginAccess();
  v5 = self;
  uint64_t v6 = swift_bridgeObjectRetain();
  LOBYTE(a3) = sub_1FE200(v6, a3);

  swift_bridgeObjectRelease();
  return a3 & 1;
}

- (void)clearSharedItems
{
  v2 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC8ShelfKit18HighlightsProvider_highlightsDisplayedOnCurrentPage);
  swift_beginAccess();
  void *v2 = &_swiftEmptySetSingleton;
  swift_bridgeObjectRelease();
}

- (_TtC8ShelfKit18HighlightsProvider)init
{
  result = (_TtC8ShelfKit18HighlightsProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (BOOL)isSharedContentWithPageAdamId:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_3D7D50();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  objc_super v7 = self;
  v8.value._countAndFlagsBits = v4;
  v8.value._object = v6;
  Swift::Bool v9 = HighlightsProvider.isSharedContent(pageAdamId:)(v8);

  swift_bridgeObjectRelease();
  return v9;
}

- (void)highlightCenterDidAddHighlights:(id)a3
{
  id v4 = a3;
  v5 = self;
  _s8ShelfKit18HighlightsProviderC021highlightCenterDidAddC0yySo011SLHighlightF0CF_0();
}

- (void)highlightCenter:(id)a3 didRemoveHighlights:(id)a4
{
  sub_3D530(0, &qword_4B8858);
  unint64_t v6 = sub_3D8020();
  id v7 = a3;
  Swift::String_optional v8 = self;
  sub_2038C4(v6);

  swift_bridgeObjectRelease();
}

@end