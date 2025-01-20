@interface PaperDocumentInlineView
- (_TtC8PaperKit23PaperDocumentInlineView)initWithCoder:(id)a3;
- (_TtC8PaperKit23PaperDocumentInlineView)initWithFrame:(CGRect)a3;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)toolPickerWillShow:(id)a3;
@end

@implementation PaperDocumentInlineView

- (void)layoutSubviews
{
  v2 = self;
  PaperDocumentInlineView.layoutSubviews()();
}

- (_TtC8PaperKit23PaperDocumentInlineView)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized PaperDocumentInlineView.init(coder:)();
}

- (void)didMoveToWindow
{
  v2 = self;
  PaperDocumentInlineView.didMoveToWindow()();
}

- (void)toolPickerWillShow:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  PaperDocumentInlineView.toolPickerWillShow(_:)();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC8PaperKit23PaperDocumentInlineView)initWithFrame:(CGRect)a3
{
  result = (_TtC8PaperKit23PaperDocumentInlineView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)self + OBJC_IVAR____TtC8PaperKit23PaperDocumentInlineView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit23PaperDocumentInlineView_toolPicker));
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit23PaperDocumentInlineView_crContext));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit23PaperDocumentInlineView_paperDocumentView));
  swift_unknownObjectWeakDestroy();
  outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)self + OBJC_IVAR____TtC8PaperKit23PaperDocumentInlineView_temporaryPaperDocument, (uint64_t *)&demangling cache variable for type metadata for Capsule<PaperDocument>?);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  id v3 = (char *)self + OBJC_IVAR____TtC8PaperKit23PaperDocumentInlineView_textualContextProvider;
  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)v3);
}

@end