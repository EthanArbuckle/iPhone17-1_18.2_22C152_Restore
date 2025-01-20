@interface TiledTextView
- (PKLinedPaper)linedPaper;
- (_TtC8PaperKit13TiledTextView)initWithCoder:(id)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)initInScrollView:(id)a3 sixChannelBlending:(BOOL)a4 defaultDrawingClass:(Class)a5 readOnly:(BOOL)a6;
- (void)_canvasView:(id)a3 didCompleteRefinementEntry:(id)a4;
- (void)didMoveToWindow;
- (void)setLinedPaper:(id)a3;
@end

@implementation TiledTextView

- (void)didMoveToWindow
{
  v2 = self;
  TiledTextView.didMoveToWindow()();
}

- (id)initInScrollView:(id)a3 sixChannelBlending:(BOOL)a4 defaultDrawingClass:(Class)a5 readOnly:(BOOL)a6
{
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  id v10 = a3;
  id v11 = specialized TiledTextView.init(in:sixChannelBlending:defaultDrawing:readOnly:)((uint64_t)v10, a4, ObjCClassMetadata, a6);

  return v11;
}

- (void)setLinedPaper:(id)a3
{
  id v4 = a3;
  v5 = self;
  TiledTextView.linedPaper.setter(v4);
}

- (PKLinedPaper)linedPaper
{
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8PaperKit13TiledTextView_paperLinedPaper);
  if (v3)
  {
    id v4 = self;
    v5 = v3;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)type metadata accessor for TiledTextView();
    v6 = self;
    v5 = [(PKTiledView *)&v9 linedPaper];
  }
  v7 = v3;

  return v5;
}

- (void)_canvasView:(id)a3 didCompleteRefinementEntry:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  specialized TiledTextView._canvasView(_:didCompleteRefinementEntry:)(v7);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v8 = a4;
  objc_super v9 = self;
  v15.value.super.isa = (Class)a4;
  TiledTextView.hitTest(_:with:)(v10, (CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), v15);
  v12 = v11;

  return v12;
}

- (_TtC8PaperKit13TiledTextView)initWithCoder:(id)a3
{
  return (_TtC8PaperKit13TiledTextView *)TiledTextView.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit13TiledTextView_paperLinedPaper));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit13TiledTextView_canvasElementController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit13TiledTextView_selectionInteractionDelegate));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit13TiledTextView____lazy_storage___imageWandTipController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit13TiledTextView____lazy_storage___canvasGenerationToolOverlayController));
  outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)self + OBJC_IVAR____TtC8PaperKit13TiledTextView_magicGenerativePlaygroundTokenProvider, (uint64_t *)&demangling cache variable for type metadata for MagicGenerativePlaygroundTokenProvider?);
  outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)self + OBJC_IVAR____TtC8PaperKit13TiledTextView_magicGenerativePlaygroundContainerStateObserver, (uint64_t *)&demangling cache variable for type metadata for MagicGenerativePlaygroundContainerStateObserver?);
}

@end