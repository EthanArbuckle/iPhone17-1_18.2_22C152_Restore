@interface CRLMultiselectResizeInfo
- (BOOL)isSelectable;
- (BOOL)isSupported;
- (CRLCanvasElementInfo)parentInfo;
- (CRLCanvasInfoGeometry)geometry;
- (Class)editorClass;
- (Class)layoutClass;
- (Class)repClass;
- (NSSet)representedSelectedBoardItems;
- (_TtC8Freeform24CRLMultiselectResizeInfo)init;
- (_TtC8Freeform24CRLMultiselectResizeInfo)initWithParentInfo:(id)a3;
- (void)setGeometry:(id)a3;
- (void)setParentInfo:(id)a3;
- (void)setRepresentedSelectedBoardItems:(id)a3 currentlyLaidOutWith:(id)a4;
@end

@implementation CRLMultiselectResizeInfo

- (_TtC8Freeform24CRLMultiselectResizeInfo)initWithParentInfo:(id)a3
{
  swift_unknownObjectRetain();
  v4 = (_TtC8Freeform24CRLMultiselectResizeInfo *)sub_10081F180((uint64_t)a3);
  swift_unknownObjectRelease();
  return v4;
}

- (CRLCanvasElementInfo)parentInfo
{
  v2 = (void *)swift_unknownObjectRetain();

  return (CRLCanvasElementInfo *)v2;
}

- (void)setParentInfo:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform24CRLMultiselectResizeInfo_parentInfo) = (Class)a3;
  swift_unknownObjectRetain();

  swift_unknownObjectRelease();
}

- (CRLCanvasInfoGeometry)geometry
{
  return (CRLCanvasInfoGeometry *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                          + OBJC_IVAR____TtC8Freeform24CRLMultiselectResizeInfo_geometry));
}

- (void)setGeometry:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform24CRLMultiselectResizeInfo_geometry);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform24CRLMultiselectResizeInfo_geometry) = (Class)a3;
  id v3 = a3;
}

- (BOOL)isSelectable
{
  return 0;
}

- (BOOL)isSupported
{
  return 1;
}

- (Class)layoutClass
{
  sub_10050BF48(0, &qword_101683428);

  return (Class)swift_getObjCClassFromMetadata();
}

- (Class)repClass
{
  Class result = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform24CRLMultiselectResizeInfo_repClass);
  if (result) {
    return (Class)swift_getObjCClassFromMetadata();
  }
  return result;
}

- (Class)editorClass
{
  return 0;
}

- (void)setRepresentedSelectedBoardItems:(id)a3 currentlyLaidOutWith:(id)a4
{
  type metadata accessor for CRLBoardItem(0);
  sub_10060A334();
  uint64_t v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a4;
  v8 = self;
  sub_10081EEBC(v6, v7);

  swift_bridgeObjectRelease();
}

- (NSSet)representedSelectedBoardItems
{
  type metadata accessor for CRLBoardItem(0);
  sub_10060A334();
  swift_bridgeObjectRetain();
  v2.super.isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSSet *)v2.super.isa;
}

- (_TtC8Freeform24CRLMultiselectResizeInfo)init
{
  Class result = (_TtC8Freeform24CRLMultiselectResizeInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform24CRLMultiselectResizeInfo_geometry);
}

@end