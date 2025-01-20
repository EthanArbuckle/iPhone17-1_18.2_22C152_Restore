@interface CRLiOSPencilHoverGestureHandler
- (_TtC8Freeform31CRLiOSPencilHoverGestureHandler)init;
- (_TtC8Freeform31CRLiOSPencilHoverGestureHandler)initWithInteractiveCanvasController:(id)a3 pencilMediator:(id)a4;
- (void)handleHoverGesture:(id)a3;
- (void)removeHoverEffect;
@end

@implementation CRLiOSPencilHoverGestureHandler

- (_TtC8Freeform31CRLiOSPencilHoverGestureHandler)initWithInteractiveCanvasController:(id)a3 pencilMediator:(id)a4
{
  id v4 = a3;
  swift_unknownObjectRetain();
  v5 = (_TtC8Freeform31CRLiOSPencilHoverGestureHandler *)sub_100AE9100();

  swift_unknownObjectRelease();
  return v5;
}

- (void)handleHoverGesture:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100AE77F4(v4);
}

- (void)removeHoverEffect
{
  v2 = self;
  sub_100AE8304();
}

- (_TtC8Freeform31CRLiOSPencilHoverGestureHandler)init
{
  result = (_TtC8Freeform31CRLiOSPencilHoverGestureHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  sub_100523398((uint64_t)self + OBJC_IVAR____TtC8Freeform31CRLiOSPencilHoverGestureHandler_pencilMediator);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform31CRLiOSPencilHoverGestureHandler_hoverRepManager));
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform31CRLiOSPencilHoverGestureHandler_pencilHoverStates);
}

@end