@interface SLCollaborationAttributionView
- (BOOL)automaticallyAdjustsMaxWidthToFitBounds;
- (CGSize)intrinsicContentSize;
- (SLCollaborationAttributionView)initWithCoder:(id)a3;
- (SLCollaborationAttributionView)initWithFrame:(CGRect)a3;
- (SLCollaborationAttributionView)initWithHighlight:(id)a3 variant:(int64_t)a4;
- (SLCollaborationAttributionView)initWithServiceProxyClass:(Class)a3 maxWidth:(double)a4;
- (SLCollaborationAttributionView)initWithVariant:(int64_t)a3;
- (SLCollaborationAttributionViewDelegate)delegate;
- (id)makePlaceholderSlotContentForStyle:(id)a3;
- (void)layoutSubviews;
- (void)remoteContentIsLoadedValueChanged;
- (void)renderRemoteContentForLayerContextID:(int64_t)a3 style:(id)a4 yield:(id)a5;
- (void)setAutomaticallyAdjustsMaxWidthToFitBounds:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)tintColorDidChange;
- (void)traitCollectionDidChange:(id)a3;
- (void)updatePlaceHolderSymbolScale:(int64_t)a3 weight:(int64_t)a4 pointSize:(double)a5;
@end

@implementation SLCollaborationAttributionView

- (CGSize)intrinsicContentSize
{
  v2 = self;
  [(SLRemoteView *)v2 maxWidth];
  double v4 = v3;
  id v5 = [(SLRemoteView *)v2 maxWidth];
  double v6 = (*(double (**)(id))((*MEMORY[0x1E4FBC8C8] & (uint64_t)v2->super.super.super.super.super.isa) + 0x150))(v5);

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (SLCollaborationAttributionViewDelegate)delegate
{
  v2 = (char *)self + OBJC_IVAR___SLCollaborationAttributionView_delegate;
  swift_beginAccess();
  double v3 = (void *)MEMORY[0x19F392140](v2);
  return (SLCollaborationAttributionViewDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)automaticallyAdjustsMaxWidthToFitBounds
{
  v2 = (BOOL *)self + OBJC_IVAR___SLCollaborationAttributionView_automaticallyAdjustsMaxWidthToFitBounds;
  swift_beginAccess();
  return *v2;
}

- (void)setAutomaticallyAdjustsMaxWidthToFitBounds:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (char *)self + OBJC_IVAR___SLCollaborationAttributionView_automaticallyAdjustsMaxWidthToFitBounds;
  swift_beginAccess();
  char v6 = *v5;
  *id v5 = v3;
  if ((v6 & 1) == 0 && v3) {
    [(SLCollaborationAttributionView *)self setNeedsLayout];
  }
}

- (SLCollaborationAttributionView)initWithHighlight:(id)a3 variant:(int64_t)a4
{
  id v5 = a3;
  char v6 = (SLCollaborationAttributionView *)specialized CollaborationAttributionView.init(highlight:variant:)(v5, a4);

  return v6;
}

- (SLCollaborationAttributionView)initWithVariant:(int64_t)a3
{
  return (SLCollaborationAttributionView *)CollaborationAttributionView.init(variant:)(a3);
}

- (SLCollaborationAttributionView)initWithCoder:(id)a3
{
  return 0;
}

- (void)layoutSubviews
{
  v2 = self;
  CollaborationAttributionView.layoutSubviews()();
}

- (void)updatePlaceHolderSymbolScale:(int64_t)a3 weight:(int64_t)a4 pointSize:(double)a5
{
  double v8 = self;
  CollaborationAttributionView.updatePlaceholderSymbol(scale:weight:pointSize:)(a3, a4, a5);
}

- (void)tintColorDidChange
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CollaborationAttributionView();
  id v2 = v6.receiver;
  [(SLCollaborationAttributionView *)&v6 tintColorDidChange];
  id v3 = objc_msgSend(v2, sel_slotView, v6.receiver, v6.super_class);
  id v4 = objc_msgSend(v2, sel_tintColor);
  objc_msgSend(v3, sel_setTintColor_, v4);

  id v5 = objc_msgSend(v2, sel_slotView);
  objc_msgSend(v5, sel__updateContent);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  objc_super v6 = self;
  v9.is_nil = (char)v6;
  double v7 = v6;
  v9.value.super.isa = (Class)a3;
  CollaborationAttributionView.traitCollectionDidChange(_:)(v9);
}

- (id)makePlaceholderSlotContentForStyle:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = CollaborationAttributionView.makePlaceholderSlotContent(for:)(v4);

  return v6;
}

- (void)renderRemoteContentForLayerContextID:(int64_t)a3 style:(id)a4 yield:(id)a5
{
  double v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = a4;
  v11 = self;
  CollaborationAttributionView.renderRemoteContent(forLayerContextID:style:yield:)(a3, v10, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned UISSlotAnyContent) -> (@unowned ObjCBool), v9);

  swift_release();
}

- (void)remoteContentIsLoadedValueChanged
{
  id v4 = self;
  if ([(SLRemoteView *)v4 remoteContentIsLoaded])
  {
    id v2 = (void (*)(void))(*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)v4->super.super.super.super.super.isa)
                                              + 0xA0))();
    if (v2)
    {
      uint64_t v3 = (uint64_t)v2;
      v2();
      outlined consume of (@escaping @callee_guaranteed () -> ())?(v3);
    }
  }
}

- (SLCollaborationAttributionView)initWithServiceProxyClass:(Class)a3 maxWidth:(double)a4
{
  CGSize result = (SLCollaborationAttributionView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (SLCollaborationAttributionView)initWithFrame:(CGRect)a3
{
  CGSize result = (SLCollaborationAttributionView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  outlined destroy of weak CollaborationAttributionViewDelegate?((uint64_t)self + OBJC_IVAR___SLCollaborationAttributionView_delegate);
  outlined consume of (@escaping @callee_guaranteed () -> ())?(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                                                                          + OBJC_IVAR___SLCollaborationAttributionView_remoteContentDidLoad));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___SLCollaborationAttributionView_highlight));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___SLCollaborationAttributionView_placeholderGlyphConfiguration));
  swift_bridgeObjectRelease();
}

@end