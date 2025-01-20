@interface FavoriteCollectionHandler
+ (NSString)FavoriteCollectionIdentifier;
+ (NSString)title;
+ (void)setTitle:(id)a3;
- (BOOL)beingModified;
- (BOOL)canAddContent;
- (BOOL)canDelete;
- (BOOL)canDeleteContent;
- (BOOL)canEditImage;
- (BOOL)canEditTitle;
- (BOOL)canShare;
- (BOOL)containsItem:(id)a3;
- (BOOL)isFavoriteCollection;
- (NSArray)storeSubscriptionTypes;
- (NSString)title;
- (NSURL)sharingURL;
- (UIImage)_glyphImage;
- (UIImage)glyphImage;
- (UIImage)image;
- (_TtC4Maps25FavoriteCollectionHandler)init;
- (_TtC4Maps25FavoriteCollectionHandler)initWithCollection:(id)a3;
- (int64_t)contentType;
- (int64_t)handlerType;
- (void)addObjects:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)removeObjects:(id)a3 completion:(id)a4;
- (void)setStoreSubscriptionTypes:(id)a3;
- (void)set_glyphImage:(id)a3;
- (void)storeDidChangeWithTypes:(id)a3;
- (void)updateTitle:(id)a3 forMapItem:(id)a4 completion:(id)a5;
@end

@implementation FavoriteCollectionHandler

+ (NSString)FavoriteCollectionIdentifier
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

- (BOOL)isFavoriteCollection
{
  return 1;
}

- (_TtC4Maps25FavoriteCollectionHandler)init
{
  return (_TtC4Maps25FavoriteCollectionHandler *)FavoriteCollectionHandler.init()();
}

+ (NSString)title
{
  if (qword_1015CBFC8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

+ (void)setTitle:(id)a3
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = v4;
  if (qword_1015CBFC8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  *(void *)&static FavoriteCollectionHandler.title = v3;
  *((void *)&static FavoriteCollectionHandler.title + 1) = v5;
  swift_bridgeObjectRelease();
}

- (NSString)title
{
  uint64_t v2 = qword_1015CBFC8;
  uint64_t v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  swift_beginAccess();
  swift_bridgeObjectRetain();

  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v4;
}

- (UIImage)glyphImage
{
  uint64_t v2 = self;
  id v3 = FavoriteCollectionHandler._glyphImage.getter();

  return (UIImage *)v3;
}

- (UIImage)_glyphImage
{
  uint64_t v2 = self;
  id v3 = FavoriteCollectionHandler._glyphImage.getter();

  return (UIImage *)v3;
}

- (void)set_glyphImage:(id)a3
{
  id v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC4Maps25FavoriteCollectionHandler____lazy_storage____glyphImage);
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC4Maps25FavoriteCollectionHandler____lazy_storage____glyphImage) = (Class)a3;
  id v4 = a3;

  sub_10010B3BC(v3);
}

- (UIImage)image
{
  return (UIImage *)0;
}

- (int64_t)handlerType
{
  return 0;
}

- (int64_t)contentType
{
  return 1;
}

- (BOOL)canDelete
{
  return 0;
}

- (BOOL)canAddContent
{
  return 1;
}

- (BOOL)canDeleteContent
{
  return 1;
}

- (BOOL)canEditImage
{
  return 0;
}

- (BOOL)canEditTitle
{
  return 0;
}

- (BOOL)canShare
{
  uint64_t v2 = self;
  if (GEOConfigGetBOOL())
  {
    unsigned __int8 v3 = [(CollectionHandler *)v2 isEmpty];

    return v3 ^ 1;
  }
  else
  {

    return 0;
  }
}

- (NSURL)sharingURL
{
  uint64_t v3 = sub_1000FF33C((uint64_t *)&unk_1015D5160);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v8 = (char *)&v18 - v7;
  v9 = self;
  id v10 = [(CollectionHandler *)v9 sharingURLFromContainedMapItems];
  if (v10)
  {
    v11 = v10;
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v12 = type metadata accessor for URL();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v5, 0, 1, v12);
  }
  else
  {
    uint64_t v12 = type metadata accessor for URL();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v5, 1, 1, v12);
  }
  sub_1002CDD10((uint64_t)v5, (uint64_t)v8);

  type metadata accessor for URL();
  uint64_t v13 = *(void *)(v12 - 8);
  v15 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v8, 1, v12) != 1)
  {
    URL._bridgeToObjectiveC()(v14);
    v15 = v16;
    (*(void (**)(char *, uint64_t))(v13 + 8))(v8, v12);
  }

  return (NSURL *)v15;
}

- (BOOL)beingModified
{
  return *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC4Maps25FavoriteCollectionHandler_modficationCount) > 0;
}

- (void)dealloc
{
  type metadata accessor for MapsSyncStore();
  uint64_t v3 = self;
  uint64_t v4 = (void *)static MapsSyncStore.sharedStore.getter();
  uint64_t v5 = v3;
  dispatch thunk of MapsSyncStore.unsubscribe(_:)();

  v6.receiver = v5;
  v6.super_class = (Class)type metadata accessor for FavoriteCollectionHandler();
  [(FavoriteCollectionHandler *)&v6 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_10010B3BC(*(id *)((char *)&self->super.super.isa
                      + OBJC_IVAR____TtC4Maps25FavoriteCollectionHandler____lazy_storage____glyphImage));

  swift_bridgeObjectRelease();
}

- (BOOL)containsItem:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for FavoriteCollectionHandler();
  id v4 = a3;
  id v5 = v8.receiver;
  id v6 = [(CollectionHandler *)&v8 itemForMapItem:v4];

  if (v6) {
  return v6 != 0;
  }
}

- (void)addObjects:(id)a3 completion:(id)a4
{
  id v5 = _Block_copy(a4);
  uint64_t v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  if (v5)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v5;
    id v5 = sub_1002C6810;
  }
  else
  {
    uint64_t v7 = 0;
  }
  objc_super v8 = self;
  FavoriteCollectionHandler.add(_:completion:)(v6, (uint64_t)v5, v7);
  sub_10006C5D8((uint64_t)v5);
  swift_bridgeObjectRelease();
}

- (void)removeObjects:(id)a3 completion:(id)a4
{
  id v5 = _Block_copy(a4);
  uint64_t v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  if (v5)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v5;
    id v5 = sub_1002C6810;
  }
  else
  {
    uint64_t v7 = 0;
  }
  objc_super v8 = self;
  FavoriteCollectionHandler.remove(_:completion:)(v6, (uint64_t)v5, v7);
  sub_10006C5D8((uint64_t)v5);
  swift_bridgeObjectRelease();
}

- (void)updateTitle:(id)a3 forMapItem:(id)a4 completion:(id)a5
{
  uint64_t v7 = (void (*)(id))_Block_copy(a5);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  if (v7)
  {
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v7;
    uint64_t v7 = (void (*)(id))sub_1001225E4;
  }
  else
  {
    uint64_t v11 = 0;
  }
  id v12 = a4;
  uint64_t v13 = self;
  FavoriteCollectionHandler.updateTitle(_:for:completion:)(v8, v10, (uint64_t)v12, v7, v11);
  sub_10006C5D8((uint64_t)v7);

  swift_bridgeObjectRelease();
}

- (NSArray)storeSubscriptionTypes
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1000FF33C(&qword_1015CD300);
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (void)setStoreSubscriptionTypes:(id)a3
{
  sub_1000FF33C(&qword_1015CD300);
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC4Maps25FavoriteCollectionHandler_storeSubscriptionTypes);
  swift_beginAccess();
  *id v5 = v4;
  swift_bridgeObjectRelease();
}

- (void)storeDidChangeWithTypes:(id)a3
{
  uint64_t v3 = self;
  _s4Maps25FavoriteCollectionHandlerC14storeDidChange5typesySaySSG_tF_0();
}

- (_TtC4Maps25FavoriteCollectionHandler)initWithCollection:(id)a3
{
  swift_unknownObjectRetain();
  result = (_TtC4Maps25FavoriteCollectionHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end