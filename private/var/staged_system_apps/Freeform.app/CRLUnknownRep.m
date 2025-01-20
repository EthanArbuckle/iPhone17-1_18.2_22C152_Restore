@interface CRLUnknownRep
+ (void)presentUnsupportedItemAlertWithLayerHost:(id)a3 forGroup:(BOOL)a4;
- (BOOL)directlyManagesAdditionalPlatformViewOverRenderable;
- (BOOL)handleSingleTapAtPoint:(CGPoint)a3 inputType:(int64_t)a4;
- (BOOL)isAccessibilityElement;
- (_TtC8Freeform13CRLUnknownRep)initWithLayout:(id)a3 canvas:(id)a4;
- (void)drawInContext:(CGContext *)a3;
@end

@implementation CRLUnknownRep

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (BOOL)directlyManagesAdditionalPlatformViewOverRenderable
{
  return 0;
}

- (void)drawInContext:(CGContext *)a3
{
  v4 = a3;
  v5 = self;
  sub_100EC7CDC(v4);
}

- (BOOL)handleSingleTapAtPoint:(CGPoint)a3 inputType:(int64_t)a4
{
  v4 = self;
  v5 = [(CRLCanvasRep *)v4 interactiveCanvasController];
  v6 = [(CRLInteractiveCanvasController *)v5 layerHost];

  if (v6)
  {
    sub_100EC94E0((uint64_t)v6, 0);

    swift_unknownObjectRelease();
  }
  else
  {
    sub_10086134C((uint64_t)&_mh_execute_header, (uint64_t)"handleSingleTap(at:inputType:)", 30, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLUnknownRep.swift", 84, 2, 161, (uint64_t)"invalid nil found when unwrapping value", 39, 2u, (uint64_t)_swiftEmptyArrayStorage);
    sub_1005598CC((uint64_t)_swiftEmptyArrayStorage, (uint64_t)"handleSingleTap(at:inputType:)", 30, 2, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLUnknownRep.swift", 84, 2, 161);
  }
  return v6 != 0;
}

+ (void)presentUnsupportedItemAlertWithLayerHost:(id)a3 forGroup:(BOOL)a4
{
  swift_unknownObjectRetain();
  sub_100EC94E0((uint64_t)a3, a4);

  swift_unknownObjectRelease();
}

- (_TtC8Freeform13CRLUnknownRep)initWithLayout:(id)a3 canvas:(id)a4
{
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform13CRLUnknownRep_sidePadding) = (Class)0x4028000000000000;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform13CRLUnknownRep_topPadding) = (Class)0x4018000000000000;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CRLUnknownRep();
  return [(CRLCanvasRep *)&v7 initWithLayout:a3 canvas:a4];
}

@end