@interface CanvasElementDrawingView
- (BOOL)_handleSingleTapAtDrawingLocation:(CGPoint)a3;
- (BOOL)_handleSingleTapAtDrawingLocation:(CGPoint)a3 fromTapStroke:(BOOL)a4;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)hitByTouchLocation:(CGPoint)a3 bounds:(CGRect)a4;
- (BOOL)hitChrome:(CGPoint)a3 isStylus:(BOOL)a4;
- (BOOL)isAtEndOfDocument;
- (BOOL)resignFirstResponder;
- (BOOL)updateHeightAfterDrawing;
- (CGAffineTransform)drawingTransform;
- (NSArray)additionalStrokes;
- (PKTiledView)tiledView;
- (UIView)attachmentContainerView;
- (_TtC8PaperKit24CanvasElementDrawingView)initWithCoder:(id)a3;
- (_TtC8PaperKit24CanvasElementDrawingView)initWithFrame:(CGRect)a3 drawing:(id)a4;
- (double)heightFromDrawing:(id)a3 delta:(double)a4;
- (id)hitMiniMenu:(CGPoint)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)inlineViewAtPoint:(CGPoint)a3;
- (void)beganStroke:(id)a3;
- (void)cancelledStroke:(id)a3;
- (void)didBeginDrawing;
- (void)didEndDrawing;
- (void)didMoveToWindow;
- (void)displayLinkUpdateLiveDrawing;
- (void)drawingDidChangeVisibleStrokes:(BOOL)a3;
- (void)drawingDidEraseStrokes:(id)a3;
- (void)endedStroke:(id)a3;
- (void)eraserMovedToLocation:(CGPoint)a3;
- (void)layoutSubviews;
- (void)proofreadingView:(id)a3 willPresentStringsForProofreadingItem:(id)a4;
- (void)selectionDidChange;
- (void)setAdditionalStrokes:(id)a3;
- (void)setAttachmentChromeVisible:(BOOL)a3 animated:(BOOL)a4 highlightBackground:(BOOL)a5;
- (void)updateDrawingHeight:(double)a3;
- (void)updateFrameForTextContainer;
@end

@implementation CanvasElementDrawingView

- (_TtC8PaperKit24CanvasElementDrawingView)initWithFrame:(CGRect)a3 drawing:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v9 = type metadata accessor for PKDrawing();
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = a4;
  static PKDrawing._unconditionallyBridgeFromObjectiveC(_:)();

  return (_TtC8PaperKit24CanvasElementDrawingView *)CanvasElementDrawingView.init(frame:drawing:)((uint64_t)v11, x, y, width, height);
}

- (_TtC8PaperKit24CanvasElementDrawingView)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized CanvasElementDrawingView.init(coder:)();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v8 = a4;
  uint64_t v9 = self;
  v15.value.super.isa = (Class)a4;
  CanvasElementDrawingView.hitTest(_:with:)(v10, (CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), v15);
  id v12 = v11;

  return v12;
}

- (void)didMoveToWindow
{
  v2 = self;
  CanvasElementDrawingView.didMoveToWindow()();
}

- (void)layoutSubviews
{
  v2 = self;
  CanvasElementDrawingView.layoutSubviews()();
}

- (BOOL)_handleSingleTapAtDrawingLocation:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v5 = self;
  Swift::Bool v6 = CanvasElementDrawingView._handleSingleTap(atDrawingLocation:)((CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x));

  return v6;
}

- (BOOL)_handleSingleTapAtDrawingLocation:(CGPoint)a3 fromTapStroke:(BOOL)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v7 = self;
  Swift::Bool v8 = CanvasElementDrawingView._handleSingleTap(atDrawingLocation:fromTapStroke:)((CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), a4);

  return v8;
}

- (void)eraserMovedToLocation:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v5 = self;
  CanvasElementDrawingView.eraserMoved(toLocation:)((CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x));
}

- (NSArray)additionalStrokes
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CanvasElementDrawingView();
  id v2 = v7.receiver;
  id v3 = [(PKAttachmentView *)&v7 additionalStrokes];
  if (v3)
  {
    v4 = v3;
    type metadata accessor for PKStroke();
    static Array._unconditionallyBridgeFromObjectiveC(_:)();

    v5.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {

    v5.super.isa = 0;
  }
  return (NSArray *)v5.super.isa;
}

- (void)setAdditionalStrokes:(id)a3
{
  isa = a3;
  if (a3)
  {
    type metadata accessor for PKStroke();
    static Array._unconditionallyBridgeFromObjectiveC(_:)();
    NSArray v5 = self;
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    Swift::Bool v6 = self;
  }
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CanvasElementDrawingView();
  [(PKAttachmentView *)&v7 setAdditionalStrokes:isa];

  CanvasElementDrawingView.additionalStrokes.didset();
}

- (BOOL)canBecomeFirstResponder
{
  id v3 = (void *)MEMORY[0x210550400]((char *)self + OBJC_IVAR____TtC8PaperKit24CanvasElementDrawingView_canvasElementView, a2);
  if (!v3) {
    return 0;
  }
  v4 = v3;
  uint64_t v5 = (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v3) + 0x88))();
  if (v5)
  {
    Swift::Bool v6 = (void *)v5;
    objc_super v7 = self;
    unsigned __int8 v8 = objc_msgSend(v6, sel_canBecomeFirstResponder);

    v4 = v6;
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (BOOL)becomeFirstResponder
{
  id v2 = self;
  CanvasElementDrawingView.becomeFirstResponder()((uint64_t)&unk_26C153018, (uint64_t)partial apply for closure #1 in CanvasElementDrawingView.becomeFirstResponder(), (uint64_t)&block_descriptor_28);

  return 0;
}

- (BOOL)resignFirstResponder
{
  id v2 = self;
  CanvasElementDrawingView.becomeFirstResponder()((uint64_t)&unk_26C152FC8, (uint64_t)partial apply for closure #1 in CanvasElementDrawingView.resignFirstResponder(), (uint64_t)&block_descriptor_11);

  return 0;
}

- (PKTiledView)tiledView
{
  id v3 = (void *)MEMORY[0x210550400]((char *)self + OBJC_IVAR____TtC8PaperKit24CanvasElementDrawingView_canvasElementView, a2);
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = (void *)MEMORY[0x263F8EED0];
    Swift::Bool v6 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v3) + 0x88))();
    objc_super v7 = self;

    if (v6)
    {
      v4 = (void *)(*(uint64_t (**)(void))((*v5 & *v6) + 0x320))();
    }
    else
    {

      v4 = 0;
    }
  }
  return (PKTiledView *)v4;
}

- (void)drawingDidChangeVisibleStrokes:(BOOL)a3
{
  v4 = self;
  CanvasElementDrawingView.drawingDidChangeVisibleStrokes(_:)(a3);
}

- (id)inlineViewAtPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v5 = self;
  CanvasElementDrawingView.inlineView(at:)(v6, (CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x));
  unsigned __int8 v8 = v7;

  return v8;
}

- (CGAffineTransform)drawingTransform
{
  v4 = self;
  CanvasElementDrawingView.drawingTransform.getter(v8);

  long long v6 = v8[1];
  long long v7 = v8[2];
  *(_OWORD *)&retstr->a = v8[0];
  *(_OWORD *)&retstr->c = v6;
  *(_OWORD *)&retstr->tCGFloat x = v7;
  return result;
}

- (void)didBeginDrawing
{
  id v2 = self;
  CanvasElementDrawingView.didBeginDrawing()();
}

- (void)didEndDrawing
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CanvasElementDrawingView();
  id v2 = (char *)v6.receiver;
  [(PKAttachmentView *)&v6 didEndDrawing];
  id v3 = (char *)MEMORY[0x210550400](&v2[OBJC_IVAR____TtC8PaperKit24CanvasElementDrawingView_canvasElementView]);
  if (v3)
  {
    uint64_t v5 = v3;
    (*(void (**)(char *, uint64_t))((*MEMORY[0x263F8EED0] & *(void *)v3) + 0x2C8))(v3, v4);

    id v2 = v5;
  }
}

- (void)beganStroke:(id)a3
{
}

- (void)cancelledStroke:(id)a3
{
}

- (void)displayLinkUpdateLiveDrawing
{
  id v2 = self;
  CanvasElementDrawingView.displayLinkUpdateLiveDrawing()();
}

- (void)drawingDidEraseStrokes:(id)a3
{
  type metadata accessor for PKStroke();
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = self;
  CanvasElementDrawingView.drawingDidEraseStrokes(_:)((Swift::OpaquePointer)v4);

  swift_bridgeObjectRelease();
}

- (void)endedStroke:(id)a3
{
}

- (void)selectionDidChange
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CanvasElementDrawingView();
  id v2 = (char *)v6.receiver;
  [(PKAttachmentView *)&v6 selectionDidChange];
  id v3 = (char *)MEMORY[0x210550400](&v2[OBJC_IVAR____TtC8PaperKit24CanvasElementDrawingView_canvasElementView]);
  if (v3)
  {
    uint64_t v5 = v3;
    (*(void (**)(char *, uint64_t))((*MEMORY[0x263F8EED0] & *(void *)v3) + 0x2B8))(v3, v4);

    id v2 = v5;
  }
}

- (void)updateFrameForTextContainer
{
  id v2 = self;
  CanvasElementDrawingView.updateFrameForTextContainer()();
}

- (BOOL)isAtEndOfDocument
{
  id v2 = self;
  char v3 = CanvasElementDrawingView.isAtEndOfDocument.getter();

  return v3 & 1;
}

- (BOOL)hitByTouchLocation:(CGPoint)a3 bounds:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v8 = a3.y;
  CGFloat v9 = a3.x;
  uint64_t v10 = self;
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  Swift::Bool v11 = CanvasElementDrawingView.hit(byTouchLocation:bounds:)((CGPoint)__PAIR128__(*(unint64_t *)&v8, *(unint64_t *)&v9), v13);

  return v11;
}

- (BOOL)updateHeightAfterDrawing
{
  return 0;
}

- (double)heightFromDrawing:(id)a3 delta:(double)a4
{
  uint64_t v7 = type metadata accessor for PKDrawing();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = a3;
  id v12 = self;
  static PKDrawing._unconditionallyBridgeFromObjectiveC(_:)();

  CanvasElementDrawingView.height(from:delta:)(a4);
  double v14 = v13;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14;
}

- (void)updateDrawingHeight:(double)a3
{
  uint64_t v5 = (void *)MEMORY[0x210550400]((char *)self + OBJC_IVAR____TtC8PaperKit24CanvasElementDrawingView_canvasElementView, a2);
  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x263F8EED0];
    id v12 = v5;
    uint64_t v7 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v5) + 0x88))();
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void (**)(double))((*v6 & *v7) + 0x5B8);
      uint64_t v10 = self;
      v9(a3);

      id v11 = v8;
    }
    else
    {
      id v11 = v12;
    }
  }
}

- (UIView)attachmentContainerView
{
  id v2 = self;
  id v3 = CanvasElementDrawingView.attachmentContainerView.getter();

  return (UIView *)v3;
}

- (id)hitMiniMenu:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v5 = self;
  CanvasElementDrawingView.hitMiniMenu(_:)(v6, (CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x));
  uint64_t v8 = v7;

  return v8;
}

- (BOOL)hitChrome:(CGPoint)a3 isStylus:(BOOL)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v7 = self;
  Swift::Bool v8 = CanvasElementDrawingView.hitChrome(_:isStylus:)((CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), a4);

  return v8;
}

- (void)setAttachmentChromeVisible:(BOOL)a3 animated:(BOOL)a4 highlightBackground:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  uint64_t v9 = (void *)MEMORY[0x210550400]((char *)self + OBJC_IVAR____TtC8PaperKit24CanvasElementDrawingView_canvasElementView, a2);
  if (v9)
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EED0];
    id v16 = v9;
    id v11 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v9) + 0x88))();
    if (v11)
    {
      id v12 = v11;
      double v13 = *(void (**)(BOOL, BOOL, BOOL))((*v10 & *v11) + 0x618);
      double v14 = self;
      v13(v7, v6, v5);

      UIEvent_optional v15 = v12;
    }
    else
    {
      UIEvent_optional v15 = v16;
    }
  }
}

- (void)proofreadingView:(id)a3 willPresentStringsForProofreadingItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  Swift::Bool v8 = self;
  CanvasElementDrawingView.proofreadingView(_:willPresentStringsFor:)((uint64_t)v6, v7);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit24CanvasElementDrawingView_liveStreamingDisplayLink));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit24CanvasElementDrawingView_liveErasingDrawing));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8PaperKit24CanvasElementDrawingView_mathRecognitionDelegate);
}

@end