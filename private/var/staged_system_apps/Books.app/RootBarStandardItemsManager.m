@interface RootBarStandardItemsManager
- (_TtC5Books27RootBarStandardItemsManager)init;
- (void)loadFromCache;
- (void)processBagItems:(id)a3;
@end

@implementation RootBarStandardItemsManager

- (void)processBagItems:(id)a3
{
  type metadata accessor for RootBarItem();
  uint64_t v4 = sub_1007FDFF0();
  v5 = self;
  RootBarStandardItemsManager.processBagItems(_:)((Swift::OpaquePointer)v4);

  swift_bridgeObjectRelease();
}

- (void)loadFromCache
{
  v2 = self;
  RootBarStandardItemsManager.loadFromCache()();
}

- (_TtC5Books27RootBarStandardItemsManager)init
{
  result = (_TtC5Books27RootBarStandardItemsManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC5Books27RootBarStandardItemsManager__items;
  uint64_t v4 = sub_100058D18((uint64_t *)&unk_100B43890);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Books27RootBarStandardItemsManager____lazy_storage___bag));
  _s5Books15CurrentPageViewVwxx_0((uint64_t)self + OBJC_IVAR____TtC5Books27RootBarStandardItemsManager_cacheManager);
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books27RootBarStandardItemsManager_cacheAccessQueue);
}

@end