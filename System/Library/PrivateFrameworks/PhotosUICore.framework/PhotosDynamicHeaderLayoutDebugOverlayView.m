@interface PhotosDynamicHeaderLayoutDebugOverlayView
- (CGRect)clippingRect;
- (NSCopying)userData;
- (_TtC12PhotosUICoreP33_D2105462B28C8B244908FEC7DAEF9E2941PhotosDynamicHeaderLayoutDebugOverlayView)initWithCoder:(id)a3;
- (_TtC12PhotosUICoreP33_D2105462B28C8B244908FEC7DAEF9E2941PhotosDynamicHeaderLayoutDebugOverlayView)initWithFrame:(CGRect)a3;
- (void)becomeReusable;
- (void)layoutSubviews;
- (void)setClippingRect:(CGRect)a3;
- (void)setUserData:(id)a3;
@end

@implementation PhotosDynamicHeaderLayoutDebugOverlayView

- (_TtC12PhotosUICoreP33_D2105462B28C8B244908FEC7DAEF9E2941PhotosDynamicHeaderLayoutDebugOverlayView)initWithFrame:(CGRect)a3
{
}

- (_TtC12PhotosUICoreP33_D2105462B28C8B244908FEC7DAEF9E2941PhotosDynamicHeaderLayoutDebugOverlayView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AA195FE4();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AA194794();
}

- (NSCopying)userData
{
  v2 = (void *)swift_unknownObjectRetain();
  return (NSCopying *)v2;
}

- (void)setUserData:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12PhotosUICoreP33_D2105462B28C8B244908FEC7DAEF9E2941PhotosDynamicHeaderLayoutDebugOverlayView_userData) = (Class)a3;
  swift_unknownObjectRetain_n();
  v4 = self;
  swift_unknownObjectRelease();
  sub_1AA194EB0();
}

- (CGRect)clippingRect
{
  double v2 = *(double *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC12PhotosUICoreP33_D2105462B28C8B244908FEC7DAEF9E2941PhotosDynamicHeaderLayoutDebugOverlayView_clippingRect);
  double v3 = *(double *)((char *)&self->super.super._responderFlags
                 + OBJC_IVAR____TtC12PhotosUICoreP33_D2105462B28C8B244908FEC7DAEF9E2941PhotosDynamicHeaderLayoutDebugOverlayView_clippingRect);
  double v4 = *(double *)((char *)&self->super.super.__layeringSceneIdentity
                 + OBJC_IVAR____TtC12PhotosUICoreP33_D2105462B28C8B244908FEC7DAEF9E2941PhotosDynamicHeaderLayoutDebugOverlayView_clippingRect);
  double v5 = *(double *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints
                 + OBJC_IVAR____TtC12PhotosUICoreP33_D2105462B28C8B244908FEC7DAEF9E2941PhotosDynamicHeaderLayoutDebugOverlayView_clippingRect);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setClippingRect:(CGRect)a3
{
  *(CGRect *)((char *)&self->super.super.super.isa
            + OBJC_IVAR____TtC12PhotosUICoreP33_D2105462B28C8B244908FEC7DAEF9E2941PhotosDynamicHeaderLayoutDebugOverlayView_clippingRect) = a3;
}

- (void)becomeReusable
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12PhotosUICoreP33_D2105462B28C8B244908FEC7DAEF9E2941PhotosDynamicHeaderLayoutDebugOverlayView_userData) = 0;
  self;
  swift_unknownObjectRelease();
  sub_1AA194EB0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICoreP33_D2105462B28C8B244908FEC7DAEF9E2941PhotosDynamicHeaderLayoutDebugOverlayView_boundsIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICoreP33_D2105462B28C8B244908FEC7DAEF9E2941PhotosDynamicHeaderLayoutDebugOverlayView_mainContentIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICoreP33_D2105462B28C8B244908FEC7DAEF9E2941PhotosDynamicHeaderLayoutDebugOverlayView_safeAreaIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICoreP33_D2105462B28C8B244908FEC7DAEF9E2941PhotosDynamicHeaderLayoutDebugOverlayView_floatingAreaIndicator));
  sub_1A9E7AC98((uint64_t)self+ OBJC_IVAR____TtC12PhotosUICoreP33_D2105462B28C8B244908FEC7DAEF9E2941PhotosDynamicHeaderLayoutDebugOverlayView_insets, (unint64_t *)&unk_1E981CCF0, (unint64_t *)&unk_1E981CCE0);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

@end