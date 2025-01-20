@interface CRLiOSPencilToolShapeDecorator
- (NSArray)decoratorOverlayRenderables;
- (_TtC8Freeform30CRLiOSPencilToolShapeDecorator)init;
@end

@implementation CRLiOSPencilToolShapeDecorator

- (_TtC8Freeform30CRLiOSPencilToolShapeDecorator)init
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform30CRLiOSPencilToolShapeDecorator_isHoveredWithObjectEraser) = 0;
  id v3 = objc_allocWithZone((Class)type metadata accessor for CRLiOSPencilHoverToolPreviewer());
  v4 = self;
  v5 = (objc_class *)[v3 init];
  *(Class *)((char *)&v4->super.isa + OBJC_IVAR____TtC8Freeform30CRLiOSPencilToolShapeDecorator_previewHelper) = v5;

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for CRLiOSPencilToolShapeDecorator();
  return [(CRLiOSPencilToolShapeDecorator *)&v7 init];
}

- (void).cxx_destruct
{
}

- (NSArray)decoratorOverlayRenderables
{
  id v3 = self;
  sub_1005057FC((uint64_t *)&unk_101676C10);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_101177E70;
  v5 = *(void **)(*(char **)((char *)&self->super.isa
                           + OBJC_IVAR____TtC8Freeform30CRLiOSPencilToolShapeDecorator_previewHelper)
                + OBJC_IVAR____TtC8Freeform30CRLiOSPencilHoverToolPreviewer_shapeLayer);
  *(void *)(v4 + 32) = v5;
  specialized Array._endMutation()();
  sub_10050BF48(0, (unint64_t *)&qword_10167ACF0);
  v6 = self;
  id v7 = v5;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v9 = [v3 renderablesFromLayers:isa];

  sub_10050BF48(0, (unint64_t *)&qword_101682130);
  static Array._unconditionallyBridgeFromObjectiveC(_:)();

  v10.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v10.super.isa;
}

@end