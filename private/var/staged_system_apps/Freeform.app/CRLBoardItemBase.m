@interface CRLBoardItemBase
- (BOOL)aspectRatioLocked;
- (BOOL)canBeGrouped;
- (BOOL)crl_isEqualValue:(id)a3;
- (BOOL)enableDefaultFloatingEffect;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSupported;
- (BOOL)locked;
- (BOOL)needsDownload;
- (CRLCanvasInfoGeometry)geometry;
- (CRLShadow)shadow;
- (NSArray)stringContentForSearch;
- (NSString)accessibilityDescription;
- (NSUUID)id;
- (NSUUID)parentUUID;
- (_TtC8Freeform16CRLBoardItemBase)init;
- (_TtC8Freeform17CRLBoardDataStore)store;
- (id)getReferencedAssetIDsWithIncludeChildren:(BOOL)a3;
- (int64_t)hash;
- (void)setAccessibilityDescription:(id)a3;
- (void)setAspectRatioLocked:(BOOL)a3;
- (void)setGeometry:(id)a3;
- (void)setLocked:(BOOL)a3;
- (void)setShadow:(id)a3;
@end

@implementation CRLBoardItemBase

- (_TtC8Freeform17CRLBoardDataStore)store
{
  return (_TtC8Freeform17CRLBoardDataStore *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                     + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_store));
}

- (NSUUID)id
{
  uint64_t v3 = type metadata accessor for UUID();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(void (**)(uint64_t))(**(void **)((char *)&self->super.super.isa
                                                    + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData)
                                      + 256);
  v9 = self;
  uint64_t v10 = swift_retain();
  v8(v10);

  swift_release();
  v11.super.isa = UUID._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);

  return (NSUUID *)v11.super.isa;
}

- (NSUUID)parentUUID
{
  uint64_t v3 = sub_1005057FC((uint64_t *)&unk_101674520);
  __chkstk_darwin(v3 - 8, v4);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(void (**)(uint64_t))(**(void **)((char *)&self->super.super.isa
                                                    + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData)
                                      + 264);
  v8 = self;
  uint64_t v9 = swift_retain();
  v7(v9);

  swift_release();
  uint64_t v10 = type metadata accessor for UUID();
  uint64_t v11 = *(void *)(v10 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v6, 1, v10) != 1)
  {
    Class isa = UUID._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v6, v10);
  }

  return (NSUUID *)isa;
}

- (CRLCanvasInfoGeometry)geometry
{
  v2 = *(uint64_t (**)(uint64_t))(**(void **)((char *)&self->super.super.isa
                                                       + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData)
                                         + 288);
  uint64_t v3 = self;
  uint64_t v4 = swift_retain();
  uint64_t v5 = (void *)v2(v4);

  swift_release();

  return (CRLCanvasInfoGeometry *)v5;
}

- (void)setGeometry:(id)a3
{
  id v5 = a3;
  uint64_t v4 = self;
  sub_10088AA40(v5);
}

- (BOOL)locked
{
  v2 = *(uint64_t (**)(uint64_t))(**(void **)((char *)&self->super.super.isa
                                                       + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData)
                                         + 312);
  uint64_t v3 = self;
  uint64_t v4 = swift_retain();
  LOBYTE(v2) = v2(v4);

  swift_release();
  return v2 & 1;
}

- (void)setLocked:(BOOL)a3
{
  uint64_t v4 = self;
  sub_10088AC8C(a3);
}

- (BOOL)canBeGrouped
{
  v2 = *(uint64_t (**)(uint64_t))(**(void **)((char *)&self->super.super.isa
                                                       + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData)
                                         + 312);
  uint64_t v3 = self;
  uint64_t v4 = swift_retain();
  LOBYTE(v2) = v2(v4);

  swift_release();
  return (v2 & 1) == 0;
}

- (BOOL)aspectRatioLocked
{
  v2 = *(uint64_t (**)(uint64_t))(**(void **)((char *)&self->super.super.isa
                                                       + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData)
                                         + 336);
  uint64_t v3 = self;
  uint64_t v4 = swift_retain();
  LOBYTE(v2) = v2(v4);

  swift_release();
  return v2 & 1;
}

- (void)setAspectRatioLocked:(BOOL)a3
{
  uint64_t v4 = self;
  sub_10088AEB4(a3);
}

- (NSString)accessibilityDescription
{
  v2 = *(void (**)(uint64_t))(**(void **)((char *)&self->super.super.isa
                                                    + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData)
                                      + 360);
  uint64_t v3 = self;
  uint64_t v4 = swift_retain();
  v2(v4);

  swift_release();
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v5;
}

- (void)setAccessibilityDescription:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  v7 = self;
  sub_10088B368(v4, v6);

  swift_bridgeObjectRelease();
}

- (CRLShadow)shadow
{
  v2 = *(uint64_t (**)(uint64_t))(**(void **)((char *)&self->super.super.isa
                                                       + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData)
                                         + 384);
  uint64_t v3 = self;
  uint64_t v4 = swift_retain();
  uint64_t v5 = (void *)v2(v4);

  swift_release();

  return (CRLShadow *)v5;
}

- (void)setShadow:(id)a3
{
  id v6 = a3;
  uint64_t v5 = self;
  sub_10088B0DC(a3);
}

- (BOOL)enableDefaultFloatingEffect
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  return sub_1008914BC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))sub_1008910C8);
}

- (BOOL)crl_isEqualValue:(id)a3
{
  return sub_1008914BC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))sub_10088A820);
}

- (int64_t)hash
{
  v2 = self;
  Swift::Int v3 = sub_100891580();

  return v3;
}

- (id)getReferencedAssetIDsWithIncludeChildren:(BOOL)a3
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData);
  uint64_t v4 = *(uint64_t (**)(uint64_t))(*(void *)v3 + 568);
  uint64_t v5 = self;
  uint64_t v6 = swift_retain();
  uint64_t v7 = v4(v6);
  uint64_t v8 = (*(uint64_t (**)(void))(*(void *)v3 + 576))();
  uint64_t v9 = sub_100C2F3F4(v7);
  swift_bridgeObjectRelease();
  uint64_t v10 = sub_100CDCB64((uint64_t)v9);
  swift_bridgeObjectRelease();
  uint64_t v11 = sub_100C2F3F4(v8);
  swift_bridgeObjectRelease();
  uint64_t v12 = sub_100CDCB64((uint64_t)v11);
  swift_bridgeObjectRelease();
  sub_100ED8C0C(v12, v10);

  swift_release();
  type metadata accessor for UUID();
  sub_100895630((unint64_t *)&qword_1016770E0, (void (*)(uint64_t))&type metadata accessor for UUID);
  v13.super.Class isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v13.super.isa;
}

- (BOOL)isSupported
{
  unint64_t v2 = (*(void **)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData))[3];
  return sub_1002094A4() >= v2;
}

- (BOOL)needsDownload
{
  unint64_t v2 = self;
  char v3 = sub_1008864EC();

  return v3 & 1;
}

- (NSArray)stringContentForSearch
{
  unint64_t v2 = self;
  sub_10088A634();

  v3.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (_TtC8Freeform16CRLBoardItemBase)init
{
  result = (_TtC8Freeform16CRLBoardItemBase *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end