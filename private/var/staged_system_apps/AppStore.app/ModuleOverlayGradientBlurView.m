@interface ModuleOverlayGradientBlurView
- (_TtC8AppStore29ModuleOverlayGradientBlurView)initWithCoder:(id)a3;
- (_TtC8AppStore29ModuleOverlayGradientBlurView)initWithEffect:(id)a3;
- (void)layoutSubviews;
@end

@implementation ModuleOverlayGradientBlurView

- (_TtC8AppStore29ModuleOverlayGradientBlurView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8AppStore29ModuleOverlayGradientBlurView_effectVisibilityThreshold) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC8AppStore29ModuleOverlayGradientBlurView_alignment;
  uint64_t v6 = enum case for HeroCarouselItemOverlay.DisplayOptions.Placement.leading(_:);
  uint64_t v7 = type metadata accessor for HeroCarouselItemOverlay.DisplayOptions.Placement();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 104))(v5, v6, v7);
  id v8 = a3;

  result = (_TtC8AppStore29ModuleOverlayGradientBlurView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v2 = (char *)v6.receiver;
  [(ModuleOverlayGradientBlurView *)&v6 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC8AppStore29ModuleOverlayGradientBlurView_overlayView];
  LayoutMarginsAware<>.layoutFrame.getter();
  [v3 setFrame:v6.receiver, v6.super_class];
  v4 = *(void **)&v2[OBJC_IVAR____TtC8AppStore29ModuleOverlayGradientBlurView_plusDarkerView];
  LayoutMarginsAware<>.layoutFrame.getter();
  [v4 setFrame:];
  v5 = *(void **)&v2[OBJC_IVAR____TtC8AppStore29ModuleOverlayGradientBlurView_gradientMaskView];
  LayoutMarginsAware<>.layoutFrame.getter();
  [v5 setFrame:];
  sub_1006DD500();
}

- (_TtC8AppStore29ModuleOverlayGradientBlurView)initWithEffect:(id)a3
{
  id v3 = a3;
  result = (_TtC8AppStore29ModuleOverlayGradientBlurView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29ModuleOverlayGradientBlurView_overlayView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29ModuleOverlayGradientBlurView_plusDarkerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29ModuleOverlayGradientBlurView_gradientMaskView));
  id v3 = (char *)self + OBJC_IVAR____TtC8AppStore29ModuleOverlayGradientBlurView_alignment;
  uint64_t v4 = type metadata accessor for HeroCarouselItemOverlay.DisplayOptions.Placement();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end