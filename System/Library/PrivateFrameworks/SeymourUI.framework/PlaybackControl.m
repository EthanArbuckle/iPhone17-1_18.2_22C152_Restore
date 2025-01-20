@interface PlaybackControl
- (BOOL)isEnabled;
- (BOOL)isHighlighted;
- (CGSize)intrinsicContentSize;
- (_TtC9SeymourUI15PlaybackControl)initWithCoder:(id)a3;
- (_TtC9SeymourUI15PlaybackControl)initWithFrame:(CGRect)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation PlaybackControl

- (BOOL)isEnabled
{
  return sub_239EC56A4(self, (uint64_t)a2, (SEL *)&selRef_isEnabled);
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for PlaybackControl();
  id v4 = v7.receiver;
  [(PlaybackControl *)&v7 setEnabled:v3];
  unsigned int v5 = objc_msgSend(v4, sel_isEnabled, v7.receiver, v7.super_class);
  double v6 = 0.5;
  if (v5) {
    double v6 = 1.0;
  }
  objc_msgSend(v4, sel_setAlpha_, v6);
}

- (BOOL)isHighlighted
{
  return sub_239EC56A4(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  id v4 = self;
  sub_239EC5738(a3);
}

- (_TtC9SeymourUI15PlaybackControl)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_239EC6738();
}

- (CGSize)intrinsicContentSize
{
  double v2 = *(double *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC9SeymourUI15PlaybackControl_width);
  objc_msgSend(*(id *)(*(char **)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC9SeymourUI15PlaybackControl_transitionView)+ OBJC_IVAR____TtC9SeymourUI29PlaybackControlTransitionView_widthConstraint), sel_constant);
  if (v2 > v3) {
    double v3 = v2;
  }
  double v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

- (_TtC9SeymourUI15PlaybackControl)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC9SeymourUI15PlaybackControl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super._responderFlags
                     + OBJC_IVAR____TtC9SeymourUI15PlaybackControl_layout));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI15PlaybackControl_transitionView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI15PlaybackControl_imageViewWidthConstraint));
  double v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI15PlaybackControl_widthConstraint);
}

@end