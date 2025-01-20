@interface CRLSceneInfo
- (BOOL)isEqual:(id)a3;
- (BOOL)isSelectable;
- (BOOL)isSupported;
- (CGRect)savedUnscaledRect;
- (CRLCanvasElementInfo)parentInfo;
- (CRLCanvasInfoGeometry)geometry;
- (Class)editorClass;
- (Class)layoutClass;
- (Class)repClass;
- (_TtC8Freeform12CRLSceneInfo)init;
- (int64_t)hash;
- (void)setEditorClass:(Class)a3;
- (void)setParentInfo:(id)a3;
@end

@implementation CRLSceneInfo

- (CGRect)savedUnscaledRect
{
  double v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform12CRLSceneInfo_savedUnscaledRect);
  double v3 = *(double *)&self->name[OBJC_IVAR____TtC8Freeform12CRLSceneInfo_savedUnscaledRect];
  double v4 = *(double *)&self->name[OBJC_IVAR____TtC8Freeform12CRLSceneInfo_savedUnscaledRect + 8];
  double v5 = *(double *)&self->savedUnscaledRect[OBJC_IVAR____TtC8Freeform12CRLSceneInfo_savedUnscaledRect];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    double v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    double v5 = self;
  }
  char v6 = sub_100739278((uint64_t)v8);

  sub_10052E2B0((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  Hasher.init()();
  type metadata accessor for UUID();
  sub_10073A0F4((unint64_t *)&qword_1016770E0, (void (*)(uint64_t))&type metadata accessor for UUID);
  double v3 = self;
  dispatch thunk of Hashable.hash(into:)();
  Swift::Int v4 = Hasher.finalize()();

  return v4;
}

- (BOOL)isSupported
{
  v7 = &type metadata for CRLFeatureFlags;
  unint64_t v8 = sub_1005396A8();
  v6[0] = 17;
  double v3 = self;
  char v4 = isFeatureEnabled(_:)();
  _s8Freeform26AnyCRLCommandChangeContextVwxx_0((uint64_t)v6);

  return v4 & 1;
}

- (CRLCanvasInfoGeometry)geometry
{
  id v2 = [objc_allocWithZone((Class)CRLCanvasInfoGeometry) initWithPosition:*(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform12CRLSceneInfo_savedUnscaledRect) size:*(double *)&self->name[OBJC_IVAR____TtC8Freeform12CRLSceneInfo_savedUnscaledRect] *(double *)&self->name[OBJC_IVAR____TtC8Freeform12CRLSceneInfo_savedUnscaledRect + 8] *(double *)&self->savedUnscaledRect[OBJC_IVAR____TtC8Freeform12CRLSceneInfo_savedUnscaledRect]];

  return (CRLCanvasInfoGeometry *)v2;
}

- (BOOL)isSelectable
{
  return 0;
}

- (Class)layoutClass
{
  sub_10073A0B4();

  return (Class)swift_getObjCClassFromMetadata();
}

- (Class)repClass
{
  type metadata accessor for CRLSceneRep();

  return (Class)swift_getObjCClassFromMetadata();
}

- (CRLCanvasElementInfo)parentInfo
{
  swift_getKeyPath();
  sub_10073A0F4((unint64_t *)&unk_10167D540, (void (*)(uint64_t))type metadata accessor for CRLSceneInfo);
  double v3 = self;
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  char v4 = *(Class *)((char *)&v3->super.isa + OBJC_IVAR____TtC8Freeform12CRLSceneInfo__parentInfo);
  swift_unknownObjectRetain();

  return (CRLCanvasElementInfo *)v4;
}

- (void)setParentInfo:(id)a3
{
  swift_getKeyPath();
  sub_10073A0F4((unint64_t *)&unk_10167D540, (void (*)(uint64_t))type metadata accessor for CRLSceneInfo);
  swift_unknownObjectRetain();
  char v4 = self;
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();

  swift_release();
  swift_unknownObjectRelease();
}

- (Class)editorClass
{
  swift_getKeyPath();
  sub_10073A0F4((unint64_t *)&unk_10167D540, (void (*)(uint64_t))type metadata accessor for CRLSceneInfo);
  double v3 = self;
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  uint64_t v4 = *(uint64_t *)((char *)&v3->super.isa + OBJC_IVAR____TtC8Freeform12CRLSceneInfo__editorClass);

  if (v4) {
    return (Class)swift_getObjCClassFromMetadata();
  }
  else {
    return 0;
  }
}

- (void)setEditorClass:(Class)a3
{
  if (a3) {
    swift_getObjCClassMetadata();
  }
  uint64_t KeyPath = swift_getKeyPath();
  __chkstk_darwin(KeyPath, v5);
  sub_10073A0F4((unint64_t *)&unk_10167D540, (void (*)(uint64_t))type metadata accessor for CRLSceneInfo);
  char v6 = self;
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();

  swift_release();
}

- (_TtC8Freeform12CRLSceneInfo)init
{
  CGRect result = (_TtC8Freeform12CRLSceneInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  double v3 = (char *)self + OBJC_IVAR____TtC8Freeform12CRLSceneInfo_sceneID;
  uint64_t v4 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC8Freeform12CRLSceneInfo___observationRegistrar;
  uint64_t v6 = type metadata accessor for ObservationRegistrar();
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

@end