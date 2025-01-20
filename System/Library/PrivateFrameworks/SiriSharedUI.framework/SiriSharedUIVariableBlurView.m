@interface SiriSharedUIVariableBlurView
- (_TtC12SiriSharedUI28SiriSharedUIVariableBlurView)initWithCoder:(id)a3;
- (_TtC12SiriSharedUI28SiriSharedUIVariableBlurView)initWithFrame:(CGRect)a3;
- (_TtC12SiriSharedUI28SiriSharedUIVariableBlurView)initWithMaskImageName:(id)a3;
- (void)layoutSubviews;
@end

@implementation SiriSharedUIVariableBlurView

- (_TtC12SiriSharedUI28SiriSharedUIVariableBlurView)initWithMaskImageName:(id)a3
{
  return (_TtC12SiriSharedUI28SiriSharedUIVariableBlurView *)SiriSharedUIVariableBlurView.init(maskImageName:)();
}

- (_TtC12SiriSharedUI28SiriSharedUIVariableBlurView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC12SiriSharedUI28SiriSharedUIVariableBlurView_backdropLayer;
  id v6 = objc_allocWithZone(MEMORY[0x263F15758]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC12SiriSharedUI28SiriSharedUIVariableBlurView *)sub_20CA83348();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SiriSharedUIVariableBlurView();
  v2 = (char *)v4.receiver;
  [(SiriSharedUIVariableBlurView *)&v4 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC12SiriSharedUI28SiriSharedUIVariableBlurView_backdropLayer];
  objc_msgSend(v2, sel_bounds, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setFrame_);
}

- (_TtC12SiriSharedUI28SiriSharedUIVariableBlurView)initWithFrame:(CGRect)a3
{
  result = (_TtC12SiriSharedUI28SiriSharedUIVariableBlurView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12SiriSharedUI28SiriSharedUIVariableBlurView_backdropLayer));
}

@end