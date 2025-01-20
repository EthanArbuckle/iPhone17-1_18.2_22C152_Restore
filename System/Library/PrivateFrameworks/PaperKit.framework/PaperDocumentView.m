@interface PaperDocumentView
- (BOOL)canBecomeFirstResponder;
- (_TtC8PaperKit17PaperDocumentView)initWithCoder:(id)a3;
- (_TtC8PaperKit17PaperDocumentView)initWithFrame:(CGRect)a3;
- (id)axCurrentPageView;
- (id)axDetectedFormElements;
- (id)pdfView:(id)a3 overlayViewForPage:(id)a4;
- (void)annotationPropertiesChanged:(id)a3;
- (void)annotationsChanged:(id)a3;
- (void)axTapOnShapeView:(id)a3;
- (void)dealloc;
- (void)didMoveToSuperview;
- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4;
- (void)documentPickerWasCancelled:(id)a3;
- (void)layoutSubviews;
- (void)pageDidScroll:(id)a3;
- (void)pdfSelectionChanged:(id)a3;
- (void)pdfView:(id)a3 willDisplayOverlayView:(id)a4 forPage:(id)a5;
- (void)pdfView:(id)a3 willEndDisplayingOverlayView:(id)a4 forPage:(id)a5;
- (void)toolPickerIsRulerActiveDidChange:(id)a3;
- (void)toolPickerSelectedToolDidChange:(id)a3;
- (void)toolPickerSelectedToolItemDidChange:(id)a3;
- (void)toolPickerVisibilityDidChange:(id)a3;
@end

@implementation PaperDocumentView

- (_TtC8PaperKit17PaperDocumentView)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized PaperDocumentView.init(coder:)();
}

- (void)dealloc
{
  v2 = self;
  PaperDocumentView.__deallocating_deinit();
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC8PaperKit17PaperDocumentView_viewUUID;
  uint64_t v4 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)self + OBJC_IVAR____TtC8PaperKit17PaperDocumentView_pageOverlayViewProvider);
  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)self + OBJC_IVAR____TtC8PaperKit17PaperDocumentView_delegate);
  outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)self + OBJC_IVAR____TtC8PaperKit17PaperDocumentView_dataModelInitialState, (uint64_t *)&demangling cache variable for type metadata for Capsule<PaperDocument>?);
  v5 = (char *)self + OBJC_IVAR____TtC8PaperKit17PaperDocumentView_dataModel;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Capsule<PaperDocument>);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit17PaperDocumentView_documentDelegate));
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit17PaperDocumentView____lazy_storage___paperDocumentViewProxy));

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)self + OBJC_IVAR____TtC8PaperKit17PaperDocumentView_updateDocAsset, &demangling cache variable for type metadata for CRAsset?);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  v7 = (char *)self + OBJC_IVAR____TtC8PaperKit17PaperDocumentView_changedDeadline;
  uint64_t v8 = type metadata accessor for ContinuousClock.Instant();
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  swift_bridgeObjectRelease();
  swift_release();
  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)self + OBJC_IVAR____TtC8PaperKit17PaperDocumentView_liveStreamMessenger);
  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)self + OBJC_IVAR____TtC8PaperKit17PaperDocumentView_participantDetailsDataSource);
  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)self + OBJC_IVAR____TtC8PaperKit17PaperDocumentView_textualContextProvider);
  swift_release();
  swift_bridgeObjectRelease();
  outlined consume of (@escaping @callee_guaranteed (@guaranteed [NSAttributedStringKey : Any], @unowned _NSRange, @unowned UnsafeMutablePointer<ObjCBool>) -> ())?(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8PaperKit17PaperDocumentView_docScanDismissBlock));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit17PaperDocumentView__rulerHostingDelegate));
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectRelease();
}

- (void)layoutSubviews
{
  v2 = self;
  PaperDocumentView.layoutSubviews()();
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)toolPickerSelectedToolDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  PaperDocumentView.updateTiledViewInk(for:)(v4);
}

- (void)toolPickerSelectedToolItemDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  PaperDocumentView.updateTiledViewInk(for:)(v4);
}

- (void)toolPickerIsRulerActiveDidChange:(id)a3
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8PaperKit17PaperDocumentView_tiledView);
  if (v3)
  {
    id v5 = a3;
    uint64_t v6 = self;
    id v7 = v3;
    objc_msgSend(v7, sel_setRulerEnabled_, objc_msgSend(v5, sel_isRulerActive));
  }
  else
  {
    __break(1u);
  }
}

- (void)toolPickerVisibilityDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v6 = self;
  if ((objc_msgSend(v4, sel_isVisible) & 1) == 0)
  {
    id v5 = *(Class *)((char *)&v6->super.super.super.isa + OBJC_IVAR____TtC8PaperKit17PaperDocumentView_tiledView);
    if (!v5)
    {
      __break(1u);
      return;
    }
    objc_msgSend(v5, sel_setRulerEnabled_, 0);
  }
}

- (id)axDetectedFormElements
{
  v2 = self;
  id v3 = (_TtC8PaperKit17PaperDocumentView *)PaperDocumentView.currentPageCanvas.getter();
  if (v3)
  {
    id v4 = v3;
    AnyCanvas.formFieldElements.getter();

    v2 = v4;
  }

  type metadata accessor for AnyCanvasElementView();
  v5.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return v5.super.isa;
}

- (id)axCurrentPageView
{
  v2 = self;
  id v3 = PaperDocumentView.axCurrentPageView()();

  return v3;
}

- (void)axTapOnShapeView:(id)a3
{
  id v4 = a3;
  NSArray v5 = self;
  PaperDocumentView.axTapOnShapeView(_:)(v4);
}

- (void)pdfSelectionChanged:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = self;
  PaperDocumentView.pdfSelectionChanged(_:)();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)annotationPropertiesChanged:(id)a3
{
}

- (void)annotationsChanged:(id)a3
{
}

- (id)pdfView:(id)a3 overlayViewForPage:(id)a4
{
  uint64_t v6 = (PDFView *)a3;
  id v7 = (PDFPage *)a4;
  uint64_t v8 = self;
  PaperDocumentView.pdfView(_:overlayViewFor:)(v9, v6, v7);
  v11 = v10;

  return v11;
}

- (void)pdfView:(id)a3 willDisplayOverlayView:(id)a4 forPage:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  specialized PaperDocumentView.pdfView(_:willDisplayOverlayView:for:)(v10);
}

- (void)pdfView:(id)a3 willEndDisplayingOverlayView:(id)a4 forPage:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  specialized PaperDocumentView.pdfView(_:willEndDisplayingOverlayView:for:)(v10);
}

- (void)didMoveToSuperview
{
  v2 = self;
  PaperDocumentView.didMoveToSuperview()();
}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  type metadata accessor for URL();
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  _ = (UIDocumentPickerViewController *)a3;
  id v7 = self;
  PaperDocumentView.documentPicker(_:didPickDocumentsAt:)(_, (Swift::OpaquePointer)v6);
  swift_bridgeObjectRelease();
}

- (void)documentPickerWasCancelled:(id)a3
{
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC8PaperKit17PaperDocumentView_delegate;
  swift_beginAccess();
  if (MEMORY[0x210550400](v5))
  {
    uint64_t v6 = *((void *)v5 + 1);
    uint64_t ObjectType = swift_getObjectType();
    id v8 = a3;
    id v9 = self;
    BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
    (*(void (**)(_TtC8PaperKit17PaperDocumentView *, id, BOOL, uint64_t, uint64_t))(v6 + 40))(v9, v8, !IsReduceMotionEnabled, ObjectType, v6);

    swift_unknownObjectRelease();
  }
}

- (void)pageDidScroll:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  id v8 = (char *)self + OBJC_IVAR____TtC8PaperKit17PaperDocumentView_delegate;
  swift_beginAccess();
  if (MEMORY[0x210550400](v8))
  {
    uint64_t v9 = *((void *)v8 + 1);
    swift_getObjectType();
    id v10 = *(void (**)(void))(v9 + 96);
    v11 = self;
    v10();

    swift_unknownObjectRelease();
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC8PaperKit17PaperDocumentView)initWithFrame:(CGRect)a3
{
  result = (_TtC8PaperKit17PaperDocumentView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end