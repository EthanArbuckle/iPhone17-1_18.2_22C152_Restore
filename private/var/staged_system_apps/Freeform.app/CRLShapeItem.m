@interface CRLShapeItem
- (BOOL)allowedToBeDragAndDropped;
- (BOOL)allowsChangeShape;
- (BOOL)allowsParentGroupToBeResizedWithoutAspectRatioLock;
- (BOOL)canAspectRatioLockBeChangedByUser;
- (BOOL)canCopyStyle;
- (BOOL)isFreehandDrawingShape;
- (BOOL)isLine;
- (BOOL)isOpenPath;
- (BOOL)isSelectable;
- (BOOL)isTailEndOnLeftBestGuess;
- (BOOL)isTreatedAsFillForFreehandDrawing;
- (BOOL)pathIsOpen;
- (BOOL)supportsFill;
- (BOOL)supportsResize;
- (CRLFill)fill;
- (CRLLineEnd)headLineEnd;
- (CRLLineEnd)tailLineEnd;
- (CRLPathSource)pathSource;
- (CRLShadow)shadow;
- (Class)editorClass;
- (Class)layoutClass;
- (Class)repClass;
- (NSString)crlaxLocalizedName;
- (NSString)localizedAccessibilityDescriptionPlaceholder;
- (NSString)localizedName;
- (double)strokePatternOffsetDistance;
- (void)p_onBoard:(id)a3 setPositionerCalculatedSize:(CGSize)a4;
- (void)setFill:(id)a3;
- (void)setHeadLineEnd:(id)a3;
- (void)setPathSource:(id)a3;
- (void)setShadow:(id)a3;
- (void)setStrokePatternOffsetDistance:(double)a3;
- (void)setTailLineEnd:(id)a3;
@end

@implementation CRLShapeItem

- (void)p_onBoard:(id)a3 setPositionerCalculatedSize:(CGSize)a4
{
  v19.receiver = self;
  v19.super_class = (Class)_TtC8Freeform12CRLShapeItem;
  -[CRLBoardItem p_onBoard:setPositionerCalculatedSize:](&v19, "p_onBoard:setPositionerCalculatedSize:", a3, a4.width, a4.height);
  v5 = [(CRLShapeItem *)self pathSource];
  [v5 naturalSize];
  double v7 = v6;
  double v9 = v8;
  v10 = [(CRLBoardItemBase *)self geometry];
  [v10 size];
  double v12 = v11;
  double v14 = v13;

  if (v7 != v12 || v9 != v14)
  {
    v16 = [(CRLShapeItem *)self pathSource];
    id v17 = [v16 copy];

    v18 = [(CRLBoardItemBase *)self geometry];
    [v18 size];
    [v17 setNaturalSize:];

    [(CRLShapeItem *)self setPathSource:v17];
  }
}

- (BOOL)isSelectable
{
  return 1;
}

- (Class)layoutClass
{
  sub_10050BF48(0, &qword_10168E4C0);

  return (Class)swift_getObjCClassFromMetadata();
}

- (Class)repClass
{
  sub_10050BF48(0, &qword_10168E4B8);

  return (Class)swift_getObjCClassFromMetadata();
}

- (Class)editorClass
{
  sub_10050BF48(0, (unint64_t *)&qword_101686A40);

  return (Class)swift_getObjCClassFromMetadata();
}

- (BOOL)allowedToBeDragAndDropped
{
  v2 = *(uint64_t (**)(uint64_t))(**(void **)((char *)&self->super.super.super.super.isa
                                                       + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData)
                                         + 312);
  v3 = self;
  uint64_t v4 = swift_retain();
  LOBYTE(v2) = v2(v4);

  swift_release();
  return (v2 & 1) == 0;
}

- (BOOL)supportsResize
{
  v2 = self;
  char v3 = sub_100A9AB20();

  return v3 & 1;
}

- (CRLShadow)shadow
{
  v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.super.isa) + 0x4C0);
  char v3 = self;
  if (v2())
  {

    uint64_t v4 = 0;
  }
  else
  {
    v5 = *(uint64_t (**)(uint64_t))(**(void **)((char *)&v3->super.super.super.super.isa
                                                         + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData)
                                           + 384);
    uint64_t v6 = swift_retain();
    uint64_t v4 = (void *)v5(v6);

    swift_release();
  }

  return (CRLShadow *)v4;
}

- (void)setShadow:(id)a3
{
  uint64_t v4 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.super.isa) + 0x4C0);
  id v6 = a3;
  v5 = self;
  if (v4())
  {
    sub_10086134C((uint64_t)&_mh_execute_header, (uint64_t)"shadow", 6, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeItem.swift", 83, 2, 65, (uint64_t)"Should not try to set a shadow on a shape in a freehand drawing.", 64, 2u, (uint64_t)_swiftEmptyArrayStorage);
    sub_1005598CC((uint64_t)_swiftEmptyArrayStorage, (uint64_t)"shadow", 6, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeItem.swift", 83, 2, 65);
  }
  else
  {
    sub_10088B0DC(v6);
  }
}

- (NSString)localizedName
{
  return (NSString *)sub_100A9D9B8(self, (uint64_t)a2, (SEL *)&selRef_inferredAccessibilityDescriptionNoShapeNames, (void (*)(uint64_t, void))sub_10088BE6C);
}

- (NSString)localizedAccessibilityDescriptionPlaceholder
{
  return (NSString *)sub_100A9D9B8(self, (uint64_t)a2, (SEL *)&selRef_inferredLocalizedAccessibilityDescriptionPlaceholder, (void (*)(uint64_t, void))sub_10088C380);
}

- (NSString)crlaxLocalizedName
{
  return (NSString *)sub_100A9D9B8(self, (uint64_t)a2, (SEL *)&selRef_inferredAccessibilityDescription, (void (*)(uint64_t, void))sub_10088BE6C);
}

- (CRLPathSource)pathSource
{
  uint64_t v3 = **(void **)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData);
  result = (CRLPathSource *)swift_conformsToProtocol2();
  if (result)
  {
    v5 = *(uint64_t (**)(uint64_t))(v3 + 704);
    id v6 = self;
    uint64_t v7 = swift_retain();
    double v8 = (void *)v5(v7);

    swift_release();
    return (CRLPathSource *)v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)setPathSource:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100A9AF5C((uint64_t)v4);
}

- (BOOL)isLine
{
  return sub_100A9DD1C(self, (uint64_t)a2, (SEL *)&selRef_isLineSegment);
}

- (BOOL)isOpenPath
{
  v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.super.isa) + 0x490);
  uint64_t v3 = self;
  if (v2())
  {

    return 1;
  }
  else
  {
    v5 = (void *)(*(uint64_t (**)(void))((swift_isaMask & (uint64_t)v3->super.super.super.super.isa) + 0x478))();
    unsigned __int8 v6 = [v5 isClosed];

    return v6 ^ 1;
  }
}

- (BOOL)pathIsOpen
{
  return sub_100A9DD1C(self, (uint64_t)a2, (SEL *)&selRef_isOpen);
}

- (CRLFill)fill
{
  v2 = self;
  uint64_t v3 = (void *)sub_100A9B204();

  return (CRLFill *)v3;
}

- (void)setFill:(id)a3
{
  id v5 = a3;
  unsigned __int8 v6 = self;
  sub_100A9B548(a3);
}

- (BOOL)isFreehandDrawingShape
{
  v2 = self;
  sub_100A9B8C4();

  return 0;
}

- (BOOL)isTreatedAsFillForFreehandDrawing
{
  v2 = self;
  BOOL v3 = sub_100A9B9CC();

  return v3;
}

- (CRLLineEnd)headLineEnd
{
  v2 = self;
  BOOL v3 = (void *)sub_100A9BC64();

  return (CRLLineEnd *)v3;
}

- (void)setHeadLineEnd:(id)a3
{
  id v5 = a3;
  unsigned __int8 v6 = self;
  sub_100A9BE98(a3);
}

- (CRLLineEnd)tailLineEnd
{
  v2 = self;
  BOOL v3 = (void *)sub_100A9C2F4();

  return (CRLLineEnd *)v3;
}

- (void)setTailLineEnd:(id)a3
{
  id v5 = a3;
  unsigned __int8 v6 = self;
  sub_100A9C528(a3);
}

- (BOOL)isTailEndOnLeftBestGuess
{
  uint64_t v3 = swift_allocObject();
  *(unsigned char *)(v3 + 16) = 0;
  id v4 = self;
  swift_retain();
  sub_100888194((uint64_t)sub_100AA0F2C, v3);
  swift_release();
  swift_beginAccess();
  LOBYTE(self) = *(unsigned char *)(v3 + 16);

  swift_release();
  return (char)self;
}

- (BOOL)canAspectRatioLockBeChangedByUser
{
  v2 = self;
  char v3 = sub_100A9ABEC();

  return v3 & 1;
}

- (BOOL)allowsParentGroupToBeResizedWithoutAspectRatioLock
{
  v2 = self;
  char v3 = sub_100A9AD14();

  return v3 & 1;
}

- (double)strokePatternOffsetDistance
{
  uint64_t v3 = type metadata accessor for CRLShapeItemCRDTData.ShapeStyleData(0);
  __chkstk_darwin(v3, v4);
  unsigned __int8 v6 = (char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = **(void **)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData);
  uint64_t v8 = swift_conformsToProtocol2();
  if (v8)
  {
    uint64_t v10 = v8;
    double v11 = *(void (**)(uint64_t, uint64_t))(v8 + 16);
    double v12 = self;
    swift_retain();
    v11(v7, v10);
    swift_release();
    sub_1005057FC(&qword_101689320);
    CRRegister.wrappedValue.getter();
    float v13 = *(float *)&v14[3];
    sub_100AA0E64((uint64_t)v6, type metadata accessor for CRLShapeItemCRDTData.ShapeStyleData);

    return v13;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)setStrokePatternOffsetDistance:(double)a3
{
  uint64_t v3 = self;
  sub_100A9CA1C();
}

- (BOOL)canCopyStyle
{
  v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.super.isa) + 0x4C0);
  uint64_t v3 = self;
  if (v2())
  {

    return 0;
  }
  else
  {
    int v5 = (*(unsigned __int8 (**)(void))((swift_isaMask & (uint64_t)v3->super.super.super.super.isa) + 0x440))();

    return v5 != 6;
  }
}

- (BOOL)supportsFill
{
  return 1;
}

- (BOOL)allowsChangeShape
{
  v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.super.isa) + 0x490);
  uint64_t v3 = self;
  if (v2())
  {

    return 0;
  }
  else
  {
    uint64_t v5 = (*(uint64_t (**)(void))((swift_isaMask & (uint64_t)v3->super.super.super.super.isa) + 0x478))();
    id v6 = [(id)v5 bezierPath];

    LOBYTE(v5) = [v6 isLineSegment];
    return v5 ^ 1;
  }
}

@end