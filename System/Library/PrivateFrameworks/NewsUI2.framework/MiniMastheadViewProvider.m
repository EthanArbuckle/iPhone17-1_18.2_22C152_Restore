@interface MiniMastheadViewProvider
- (_TtC7NewsUI224MiniMastheadViewProvider)init;
- (id)styleTitleText:(id)a3 styleType:(unint64_t)a4 boundingSize:(CGSize)a5;
- (void)bundleSubscriptionDidExpire:(id)a3;
- (void)feedTitleViewDidTapOnTitleView:(id)a3;
@end

@implementation MiniMastheadViewProvider

- (_TtC7NewsUI224MiniMastheadViewProvider)init
{
  result = (_TtC7NewsUI224MiniMastheadViewProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1DEB1DDEC((uint64_t)self + OBJC_IVAR____TtC7NewsUI224MiniMastheadViewProvider_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7NewsUI224MiniMastheadViewProvider_compactMiniMastheadView));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7NewsUI224MiniMastheadViewProvider_regularMiniMastheadView));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7NewsUI224MiniMastheadViewProvider____lazy_storage___regularContainerTitleView));
  sub_1DEA69764((uint64_t)self + OBJC_IVAR____TtC7NewsUI224MiniMastheadViewProvider_model, (uint64_t (*)(void))type metadata accessor for MiniMastheadModel);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI224MiniMastheadViewProvider_renderer);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI224MiniMastheadViewProvider_layoutAttributesFactory);
  swift_unknownObjectRelease();
}

- (id)styleTitleText:(id)a3 styleType:(unint64_t)a4 boundingSize:(CGSize)a5
{
  int v6 = sub_1DFDFDD20();
  int v8 = v7;
  v9 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI224MiniMastheadViewProvider_compactMiniMastheadView);
  v10 = self;
  id v11 = objc_msgSend(v9, sel_traitCollection);
  id v12 = sub_1DFD03190(v6, v8, v11);

  swift_bridgeObjectRelease();
  return v12;
}

- (void)feedTitleViewDidTapOnTitleView:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1DF46BA50(v4);
}

- (void)bundleSubscriptionDidExpire:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1DF46BBFC(v4);
}

@end