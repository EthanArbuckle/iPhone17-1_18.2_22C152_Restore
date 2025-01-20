@interface CRLCanvasBackground
- (CGPoint)canvasCenterInCanvasBackgroundLayer:(id)a3;
- (CGPoint)contentOffsetForCanvasBackgroundLayer:(id)a3;
- (CGPoint)originOffsetForCanvasBackgroundLayer:(id)a3;
- (CRLCanvasBackgroundAlignmentProvider)alignmentProvider;
- (CRLInteractiveCanvasController)icc;
- (Class)layerClass;
- (Class)viewClass;
- (_TtC8Freeform19CRLCanvasBackground)init;
- (_TtC8Freeform19CRLCanvasBackground)initWithICC:(id)a3;
- (double)contentsScaleForCanvasBackgroundLayer:(id)a3;
- (void)setIcc:(id)a3;
@end

@implementation CRLCanvasBackground

- (CRLInteractiveCanvasController)icc
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (CRLInteractiveCanvasController *)Strong;
}

- (void)setIcc:(id)a3
{
}

- (_TtC8Freeform19CRLCanvasBackground)initWithICC:(id)a3
{
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CRLCanvasBackground();
  return [(CRLCanvasBackground *)&v5 init];
}

- (Class)layerClass
{
  type metadata accessor for CRLCanvasBackgroundLayer();

  return (Class)swift_getObjCClassFromMetadata();
}

- (Class)viewClass
{
  type metadata accessor for CRLCanvasBackgroundView();

  return (Class)swift_getObjCClassFromMetadata();
}

- (CRLCanvasBackgroundAlignmentProvider)alignmentProvider
{
  return (CRLCanvasBackgroundAlignmentProvider *)0;
}

- (double)contentsScaleForCanvasBackgroundLayer:(id)a3
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (!Strong) {
    return 1.0;
  }
  v6 = (void *)Strong;
  id v7 = a3;
  v8 = self;
  id v9 = [v6 canvas];
  [v9 contentsScale];
  double v11 = v10;

  return v11;
}

- (CGPoint)canvasCenterInCanvasBackgroundLayer:(id)a3
{
  double v3 = 0.0;
  double v4 = 0.0;
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)originOffsetForCanvasBackgroundLayer:(id)a3
{
  double v3 = 0.0;
  double v4 = 0.0;
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)contentOffsetForCanvasBackgroundLayer:(id)a3
{
  double v3 = 0.0;
  double v4 = 0.0;
  result.y = v4;
  result.x = v3;
  return result;
}

- (_TtC8Freeform19CRLCanvasBackground)init
{
  CGPoint result = (_TtC8Freeform19CRLCanvasBackground *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end