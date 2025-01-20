@interface CapsuleButton
- (_TtC9SeymourUI13CapsuleButton)initWithCoder:(id)a3;
- (_TtC9SeymourUI13CapsuleButton)initWithFrame:(CGRect)a3;
- (void)updateConfiguration;
@end

@implementation CapsuleButton

- (_TtC9SeymourUI13CapsuleButton)initWithCoder:(id)a3
{
  result = (_TtC9SeymourUI13CapsuleButton *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (void)updateConfiguration
{
  v2 = self;
  sub_23A376D94();
}

- (_TtC9SeymourUI13CapsuleButton)initWithFrame:(CGRect)a3
{
  result = (_TtC9SeymourUI13CapsuleButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_239E12CCC(*(void **)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC9SeymourUI13CapsuleButton_fontDescriptor), *(void *)((char *)&self->super.super.super.super._responderFlags+ OBJC_IVAR____TtC9SeymourUI13CapsuleButton_fontDescriptor), *(void **)((char *)&self->super.super.super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC9SeymourUI13CapsuleButton_fontDescriptor), *(uint64_t *)((char *)&self->super.super.super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC9SeymourUI13CapsuleButton_fontDescriptor), *(uint64_t *)((char *)&self->super.super.super._cachedTraitCollection+ OBJC_IVAR____TtC9SeymourUI13CapsuleButton_fontDescriptor), *(uint64_t *)((char *)&self->super.super.super._swiftAnimationInfo+ OBJC_IVAR____TtC9SeymourUI13CapsuleButton_fontDescriptor));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI13CapsuleButton_normalBackgroundColor));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI13CapsuleButton_normalForegroundColor);
}

@end