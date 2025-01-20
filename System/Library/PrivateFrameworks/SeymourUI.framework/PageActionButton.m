@interface PageActionButton
- (_TtC9SeymourUI16PageActionButton)initWithCoder:(id)a3;
- (_TtC9SeymourUI16PageActionButton)initWithFrame:(CGRect)a3;
@end

@implementation PageActionButton

- (_TtC9SeymourUI16PageActionButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = (char *)self + OBJC_IVAR____TtC9SeymourUI16PageActionButton_buttonState;
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  v7[32] = 3;
  *((unsigned char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC9SeymourUI16PageActionButton_style) = 0;
  __asm { FMOV            V0.2D, #14.0 }
  *(_OWORD *)((char *)&self->super.super.super.super.super.isa
            + OBJC_IVAR____TtC9SeymourUI16PageActionButton_styleProvider) = _Q0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC9SeymourUI16PageActionButton_minimumHeightConstraint) = 0;
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for PageActionButton();
  return -[PageActionButton initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
}

- (_TtC9SeymourUI16PageActionButton)initWithCoder:(id)a3
{
  return (_TtC9SeymourUI16PageActionButton *)sub_23A02EE2C(a3);
}

- (void).cxx_destruct
{
  sub_239E1740C(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC9SeymourUI16PageActionButton_buttonState), *(void *)((char *)&self->super.super.super.super._responderFlags+ OBJC_IVAR____TtC9SeymourUI16PageActionButton_buttonState), *(uint64_t *)((char *)&self->super.super.super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC9SeymourUI16PageActionButton_buttonState), *(uint64_t *)((char *)&self->super.super.super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC9SeymourUI16PageActionButton_buttonState), *((unsigned char *)&self->super.super.super._cachedTraitCollection + OBJC_IVAR____TtC9SeymourUI16PageActionButton_buttonState));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI16PageActionButton_minimumHeightConstraint);
}

@end