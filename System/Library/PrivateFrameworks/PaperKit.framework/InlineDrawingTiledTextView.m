@interface InlineDrawingTiledTextView
- (BOOL)selectionInteraction:(id)a3 canPerformAction:(SEL)a4 withSender:(id)a5 inAttachment:(id)a6;
- (_TtC8PaperKit26InlineDrawingTiledTextView)initWithCoder:(id)a3;
- (id)initInScrollView:(id)a3 sixChannelBlending:(BOOL)a4 defaultDrawingClass:(Class)a5 readOnly:(BOOL)a6;
- (void)didMoveToWindow;
- (void)selectionInteractionDidPaste:(id)a3 atPoint:(CGPoint)a4 inAttachment:(id)a5;
@end

@implementation InlineDrawingTiledTextView

- (void)didMoveToWindow
{
  v2 = self;
  InlineDrawingTiledTextView.didMoveToWindow()();
}

- (BOOL)selectionInteraction:(id)a3 canPerformAction:(SEL)a4 withSender:(id)a5 inAttachment:(id)a6
{
  id v8 = a3;
  swift_unknownObjectRetain();
  id v9 = a6;
  v10 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  specialized InlineDrawingTiledTextView.selectionInteraction(_:canPerformAction:withSender:inAttachment:)();
  char v12 = v11;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v14);
  return v12 & 1;
}

- (void)selectionInteractionDidPaste:(id)a3 atPoint:(CGPoint)a4 inAttachment:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v13 = a3;
  id v9 = (_TtC8PaperKit26InlineDrawingTiledTextView *)a5;
  v10 = self;
  specialized InlineDrawingTiledTextView.inlineDrawingCanvasElementControllerCurrentAttachment(_:)();
  if (v11)
  {
    char v12 = v11;
    specialized InlineDrawingTextAttachmentView.selectionInteractionDidPaste(_:at:in:)(x, y);

    id v9 = v10;
    v10 = v12;
  }
}

- (id)initInScrollView:(id)a3 sixChannelBlending:(BOOL)a4 defaultDrawingClass:(Class)a5 readOnly:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a4;
  uint64_t v11 = OBJC_IVAR____TtC8PaperKit26InlineDrawingTiledTextView_inlineDrawingCanvasElementController;
  id v12 = objc_allocWithZone((Class)type metadata accessor for InlineDrawingCanvasElementController());
  id v13 = a3;
  uint64_t v14 = self;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v11) = (Class)objc_msgSend(v12, sel_init);

  v17.receiver = v14;
  v17.super_class = (Class)type metadata accessor for InlineDrawingTiledTextView();
  id v15 = [(PKTiledView *)&v17 initInScrollView:v13 sixChannelBlending:v8 defaultDrawingClass:a5 readOnly:v6];

  return v15;
}

- (_TtC8PaperKit26InlineDrawingTiledTextView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8PaperKit26InlineDrawingTiledTextView_inlineDrawingCanvasElementController;
  id v6 = objc_allocWithZone((Class)type metadata accessor for InlineDrawingCanvasElementController());
  id v7 = a3;
  BOOL v8 = self;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  v11.receiver = v8;
  v11.super_class = (Class)type metadata accessor for InlineDrawingTiledTextView();
  id v9 = [(InlineDrawingTiledTextView *)&v11 initWithCoder:v7];

  return v9;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit26InlineDrawingTiledTextView_inlineDrawingCanvasElementController));
}

@end