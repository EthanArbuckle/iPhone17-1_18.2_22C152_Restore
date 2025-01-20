@interface InlineDrawingCanvasElementController
- (BOOL)_supportsCanvasElements:(id)a3;
- (_TtC8PaperKit36InlineDrawingCanvasElementController)init;
- (void)toolPickerFramesObscuredDidChange:(id)a3;
@end

@implementation InlineDrawingCanvasElementController

- (void)toolPickerFramesObscuredDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  InlineDrawingCanvasElementController.updateToolPickerUI()();
}

- (BOOL)_supportsCanvasElements:(id)a3
{
  return 1;
}

- (_TtC8PaperKit36InlineDrawingCanvasElementController)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&self->delegate[OBJC_IVAR____TtC8PaperKit36InlineDrawingCanvasElementController_delegate] = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC8PaperKit36InlineDrawingCanvasElementController_toolPickerController) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(InlineDrawingCanvasElementController *)&v5 init];
}

- (void).cxx_destruct
{
  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)self + OBJC_IVAR____TtC8PaperKit36InlineDrawingCanvasElementController_delegate);
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8PaperKit36InlineDrawingCanvasElementController_toolPickerController);
}

@end