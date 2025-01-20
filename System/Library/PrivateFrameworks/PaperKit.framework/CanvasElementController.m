@interface CanvasElementController
- (BOOL)_supportsCanvasElements:(id)a3;
- (BOOL)_toolPicker:(id)a3 shouldChangeSelectedToolColor:(id)a4;
- (_TtC8PaperKit23CanvasElementController)init;
- (id)_toolPickerCurrentSelectionColor:(id)a3;
- (void)_toolPicker:(id)a3 didChangeColor:(id)a4;
- (void)_toolPickerDidChangePosition:(id)a3 fromPosition:(int64_t)a4 toPosition:(int64_t)a5;
- (void)_toolPickerDidChangeScaleFactor:(id)a3;
- (void)_toolPickerDidInvokeAddTextBox:(id)a3;
- (void)_toolPickerDidInvokeInsertSticker:(id)a3 fromItemProvider:(id)a4;
- (void)toolPickerSelectedToolItemDidChange:(id)a3;
@end

@implementation CanvasElementController

- (_TtC8PaperKit23CanvasElementController)init
{
  return (_TtC8PaperKit23CanvasElementController *)CanvasElementController.init()();
}

- (void)toolPickerSelectedToolItemDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  CanvasElementController.toolPickerSelectedToolItemDidChange(_:)((PKToolPicker)v4);
}

- (void)_toolPickerDidChangePosition:(id)a3 fromPosition:(int64_t)a4 toPosition:(int64_t)a5
{
  id v6 = a3;
  v7 = self;
  CanvasElementController.updateToolPickerContextualEditingView()();
}

- (void)_toolPicker:(id)a3 didChangeColor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  specialized CanvasElementController._toolPicker(_:didChange:)(a4);
}

- (BOOL)_supportsCanvasElements:(id)a3
{
  return 1;
}

- (BOOL)_toolPicker:(id)a3 shouldChangeSelectedToolColor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  unsigned __int8 v9 = objc_msgSend(objc_msgSend(v6, sel__selectionContext), sel_selectionMask);
  swift_unknownObjectRelease();
  if ((v9 & 4) != 0)
  {
    unsigned __int8 v11 = objc_msgSend(objc_msgSend(v6, sel__selectionContext), sel_colorSwatchesVisible);

    swift_unknownObjectRelease();
    char v10 = v11 ^ 1;
  }
  else
  {

    char v10 = 1;
  }

  return v10;
}

- (id)_toolPickerCurrentSelectionColor:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = (void *)specialized CanvasElementController._toolPickerCurrentSelectionColor(_:)();

  return v6;
}

- (void)_toolPickerDidChangeScaleFactor:(id)a3
{
  id v4 = a3;
  v5 = self;
  CanvasElementController.updateToolPickerContextualEditingView()();
}

- (void)_toolPickerDidInvokeAddTextBox:(id)a3
{
  id v4 = a3;
  v5 = self;
  specialized CanvasElementController._toolPickerDidInvokeAddTextBox(_:)();
}

- (void)_toolPickerDidInvokeInsertSticker:(id)a3 fromItemProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  specialized CanvasElementController._toolPickerDidInvokeInsertSticker(_:from:)((uint64_t)v7);
}

- (void).cxx_destruct
{
  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)self + OBJC_IVAR____TtC8PaperKit23CanvasElementController_delegate);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8PaperKit23CanvasElementController_signatureStyleController));

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8PaperKit23CanvasElementController_editingContainerView);
}

@end