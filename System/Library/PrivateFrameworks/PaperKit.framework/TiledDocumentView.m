@interface TiledDocumentView
- (_TtC8PaperKit17TiledDocumentView)initWithCoder:(id)a3;
- (id)attachments;
- (id)initInScrollView:(id)a3;
- (id)initInScrollView:(id)a3 sixChannelBlending:(BOOL)a4 defaultDrawingClass:(Class)a5 readOnly:(BOOL)a6;
- (void)_canvasView:(id)a3 didCompleteRefinementEntry:(id)a4;
- (void)didMoveToWindow;
@end

@implementation TiledDocumentView

- (id)initInScrollView:(id)a3
{
  return TiledDocumentView.init(in:)(a3);
}

- (_TtC8PaperKit17TiledDocumentView)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized TiledDocumentView.init(coder:)();
}

- (void)didMoveToWindow
{
  v2 = self;
  TiledDocumentView.didMoveToWindow()();
}

- (id)attachments
{
  v2 = self;
  TiledDocumentView.attachments()();

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PKAttachment);
  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return v3.super.isa;
}

- (void)_canvasView:(id)a3 didCompleteRefinementEntry:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  specialized TiledDocumentView._canvasView(_:didCompleteRefinementEntry:)(v7);
}

- (id)initInScrollView:(id)a3 sixChannelBlending:(BOOL)a4 defaultDrawingClass:(Class)a5 readOnly:(BOOL)a6
{
  id v6 = a3;
  id result = (id)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)self + OBJC_IVAR____TtC8PaperKit17TiledDocumentView_currentPaperView);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit17TiledDocumentView_canvasElementController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit17TiledDocumentView_toolPicker));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit17TiledDocumentView_selectionInteractionDelegate));
  swift_bridgeObjectRelease();
}

@end