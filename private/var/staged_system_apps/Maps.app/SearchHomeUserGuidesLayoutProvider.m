@interface SearchHomeUserGuidesLayoutProvider
- (_TtC4Maps34SearchHomeUserGuidesLayoutProvider)init;
- (id)cellClasses;
- (id)cellForRowAtIndexPath:(id)a3 collectionView:(id)a4 item:(id)a5;
- (id)cellReuseIdentifier;
- (id)isDeletable;
- (id)isShareable;
- (id)layoutSectionWithLayoutEnvironment:(id)a3 estimatedHeaderHeight:(double)a4 estimatedFooterHeight:(double)a5 deletionBlock:(id)a6 objectsCount:(unint64_t)a7 mapsTheme:(id)a8;
- (id)shareHandler;
- (int64_t)type;
- (void)setIsDeletable:(id)a3;
- (void)setIsShareable:(id)a3;
- (void)setShareHandler:(id)a3;
@end

@implementation SearchHomeUserGuidesLayoutProvider

- (id)isDeletable
{
  return sub_100186D88((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC4Maps34SearchHomeUserGuidesLayoutProvider_isDeletable, (uint64_t)&unk_1012DBAB8);
}

- (void)setIsDeletable:(id)a3
{
  uint64_t v4 = (uint64_t)_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v5;
    v6 = sub_1001882DC;
  }
  else
  {
    v6 = 0;
  }
  v7 = (uint64_t (**)())((char *)self + OBJC_IVAR____TtC4Maps34SearchHomeUserGuidesLayoutProvider_isDeletable);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps34SearchHomeUserGuidesLayoutProvider_isDeletable);
  *v7 = v6;
  v7[1] = (uint64_t (*)())v4;

  sub_10006C5D8(v8);
}

- (id)shareHandler
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps34SearchHomeUserGuidesLayoutProvider_shareHandler))
  {
    uint64_t v2 = *(void *)&self->isDeletable[OBJC_IVAR____TtC4Maps34SearchHomeUserGuidesLayoutProvider_shareHandler];
    v5[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps34SearchHomeUserGuidesLayoutProvider_shareHandler);
    v5[5] = v2;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 1107296256;
    v5[2] = sub_100186BF8;
    v5[3] = &unk_1012DBA68;
    v3 = _Block_copy(v5);
    swift_retain();
    swift_release();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)setShareHandler:(id)a3
{
  uint64_t v4 = (uint64_t)_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v5;
    v6 = sub_1001882E0;
  }
  else
  {
    v6 = 0;
  }
  v7 = (void (**)())((char *)self + OBJC_IVAR____TtC4Maps34SearchHomeUserGuidesLayoutProvider_shareHandler);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps34SearchHomeUserGuidesLayoutProvider_shareHandler);
  *v7 = v6;
  v7[1] = (void (*)())v4;

  sub_10006C5D8(v8);
}

- (id)isShareable
{
  return sub_100186D88((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC4Maps34SearchHomeUserGuidesLayoutProvider_isShareable, (uint64_t)&unk_1012DBA18);
}

- (void)setIsShareable:(id)a3
{
  uint64_t v4 = (uint64_t)_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v5;
    v6 = sub_1001882DC;
  }
  else
  {
    v6 = 0;
  }
  v7 = (uint64_t (**)())((char *)self + OBJC_IVAR____TtC4Maps34SearchHomeUserGuidesLayoutProvider_isShareable);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps34SearchHomeUserGuidesLayoutProvider_isShareable);
  *v7 = v6;
  v7[1] = (uint64_t (*)())v4;

  sub_10006C5D8(v8);
}

- (_TtC4Maps34SearchHomeUserGuidesLayoutProvider)init
{
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps34SearchHomeUserGuidesLayoutProvider_isDeletable);
  void *v3 = 0;
  v3[1] = 0;
  uint64_t v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps34SearchHomeUserGuidesLayoutProvider_shareHandler);
  *uint64_t v4 = 0;
  v4[1] = 0;
  uint64_t v5 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps34SearchHomeUserGuidesLayoutProvider_isShareable);
  v6 = (objc_class *)type metadata accessor for SearchHomeUserGuidesLayoutProvider();
  *uint64_t v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return [(SearchHomeUserGuidesLayoutProvider *)&v8 init];
}

- (void).cxx_destruct
{
  sub_10006C5D8(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC4Maps34SearchHomeUserGuidesLayoutProvider_isDeletable));
  sub_10006C5D8(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC4Maps34SearchHomeUserGuidesLayoutProvider_shareHandler));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps34SearchHomeUserGuidesLayoutProvider_isShareable);

  sub_10006C5D8(v3);
}

- (id)cellClasses
{
  sub_1000FF33C((uint64_t *)&unk_1015D1500);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_100F5CF70;
  *(void *)(v2 + 32) = sub_100100830(0, &qword_1015CE178);
  sub_1000FF33C((uint64_t *)&unk_1015D1510);
  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v3.super.isa;
}

- (id)cellReuseIdentifier
{
  uint64_t v2 = self;
  id v3 = [(SearchHomeUserGuidesLayoutProvider *)v2 description];
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v4;
}

- (int64_t)type
{
  return 7;
}

- (id)cellForRowAtIndexPath:(id)a3 collectionView:(id)a4 item:(id)a5
{
  uint64_t v7 = type metadata accessor for IndexPath();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = &v15[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a4;
  swift_unknownObjectRetain();
  v12 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  id v13 = sub_10018766C((uint64_t)v10, v11, (uint64_t)v15);

  sub_1000FF22C((uint64_t)v15);
  (*(void (**)(unsigned char *, uint64_t))(v8 + 8))(v10, v7);

  return v13;
}

- (id)layoutSectionWithLayoutEnvironment:(id)a3 estimatedHeaderHeight:(double)a4 estimatedFooterHeight:(double)a5 deletionBlock:(id)a6 objectsCount:(unint64_t)a7 mapsTheme:(id)a8
{
  v12 = _Block_copy(a6);
  if (v12)
  {
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = v12;
    v12 = sub_100118770;
  }
  else
  {
    uint64_t v13 = 0;
  }
  swift_unknownObjectRetain();
  id v14 = a8;
  v15 = self;
  v16 = sub_100187AE8((uint64_t)a3, (uint64_t)v12, v13, a4);
  sub_10006C5D8((uint64_t)v12);
  swift_unknownObjectRelease();

  return v16;
}

@end