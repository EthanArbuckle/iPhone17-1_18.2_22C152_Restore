@interface SiriSharedUIDropletContainerView
- (CGAffineTransform)transform;
- (CGPoint)center;
- (CGRect)bounds;
- (CGRect)frame;
- (CGSize)intrinsicContentSize;
- (UIView)contentView;
- (_TtC12SiriSharedUI32SiriSharedUIDropletContainerView)initWithCoder:(id)a3;
- (_TtC12SiriSharedUI32SiriSharedUIDropletContainerView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)removeFromSuperview;
- (void)setBounds:(CGRect)a3;
- (void)setCenter:(CGPoint)a3;
- (void)setContentView:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setTransform:(CGAffineTransform *)a3;
@end

@implementation SiriSharedUIDropletContainerView

- (CGSize)intrinsicContentSize
{
  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC12SiriSharedUI32SiriSharedUIDropletContainerView_contentView);
  if (v2)
  {
    objc_msgSend(v2, sel_intrinsicContentSize);
  }
  else
  {
    double v4 = *MEMORY[0x263F83C20];
    double v3 = *MEMORY[0x263F83C20];
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (_TtC12SiriSharedUI32SiriSharedUIDropletContainerView)initWithCoder:(id)a3
{
  id v3 = a3;
  _s12SiriSharedUI0aB22UIDropletContainerViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (UIView)contentView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                           + OBJC_IVAR____TtC12SiriSharedUI32SiriSharedUIDropletContainerView_contentView));
}

- (void)setContentView:(id)a3
{
  double v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC12SiriSharedUI32SiriSharedUIDropletContainerView_contentView);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12SiriSharedUI32SiriSharedUIDropletContainerView_contentView) = (Class)a3;
  id v6 = a3;
  v5 = self;
  sub_20CA7C604(v4);
}

- (CGRect)frame
{
  sub_20CA7DF1C(self, (uint64_t)a2, (SEL *)&selRef_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
}

- (CGRect)bounds
{
  sub_20CA7DF1C(self, (uint64_t)a2, (SEL *)&selRef_bounds);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
}

- (CGPoint)center
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SiriSharedUIDropletContainerView();
  [(SiriSharedUIDropletContainerView *)&v4 center];
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setCenter:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SiriSharedUIDropletContainerView();
  id v5 = v6.receiver;
  -[SiriSharedUIDropletContainerView setCenter:](&v6, sel_setCenter_, x, y);
  sub_20CA7E26C();
}

- (CGAffineTransform)transform
{
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for SiriSharedUIDropletContainerView();
  CGPoint result = (CGAffineTransform *)[(CGAffineTransform *)&v10 transform];
  long long v5 = v8;
  long long v6 = v9;
  *(_OWORD *)&retstr->a = v7;
  *(_OWORD *)&retstr->c = v5;
  *(_OWORD *)&retstr->tdouble x = v6;
  return result;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  long long v6 = *(_OWORD *)&a3->c;
  long long v7 = *(_OWORD *)&a3->a;
  tdouble x = a3->tx;
  tdouble y = a3->ty;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for SiriSharedUIDropletContainerView();
  id v5 = v11.receiver;
  v8[0] = v7;
  v8[1] = v6;
  CGFloat v9 = tx;
  CGFloat v10 = ty;
  [(SiriSharedUIDropletContainerView *)&v11 setTransform:v8];
  sub_20CA7E478();
}

- (void)removeFromSuperview
{
  double v2 = self;
  sub_20CA7E618();
}

- (void)layoutSubviews
{
  double v2 = self;
  sub_20CA7E738();
}

- (_TtC12SiriSharedUI32SiriSharedUIDropletContainerView)initWithFrame:(CGRect)a3
{
  CGPoint result = (_TtC12SiriSharedUI32SiriSharedUIDropletContainerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  double v3 = (char *)self + OBJC_IVAR____TtC12SiriSharedUI32SiriSharedUIDropletContainerView_id;
  uint64_t v4 = sub_20CA81D88();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12SiriSharedUI32SiriSharedUIDropletContainerView_fresnelView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12SiriSharedUI32SiriSharedUIDropletContainerView_shadowView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12SiriSharedUI32SiriSharedUIDropletContainerView_hostingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12SiriSharedUI32SiriSharedUIDropletContainerView_contentLightEffect));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12SiriSharedUI32SiriSharedUIDropletContainerView_edgeLightInsideEffect));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12SiriSharedUI32SiriSharedUIDropletContainerView_edgeLightOutsideEffect));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12SiriSharedUI32SiriSharedUIDropletContainerView_rimHighlightEffect));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12SiriSharedUI32SiriSharedUIDropletContainerView_latencyEffect));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12SiriSharedUI32SiriSharedUIDropletContainerView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12SiriSharedUI32SiriSharedUIDropletContainerView_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12SiriSharedUI32SiriSharedUIDropletContainerView_contentLightEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12SiriSharedUI32SiriSharedUIDropletContainerView_shimmerEffectView));
  id v5 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC12SiriSharedUI32SiriSharedUIDropletContainerView_snippetBackgroundView);
}

@end