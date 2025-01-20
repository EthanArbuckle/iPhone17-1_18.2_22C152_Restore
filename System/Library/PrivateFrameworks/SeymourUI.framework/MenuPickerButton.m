@interface MenuPickerButton
- (_TtC9SeymourUI16MenuPickerButton)initWithCoder:(id)a3;
- (_TtC9SeymourUI16MenuPickerButton)initWithFrame:(CGRect)a3;
- (void)updateConfiguration;
@end

@implementation MenuPickerButton

- (_TtC9SeymourUI16MenuPickerButton)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI16MenuPickerButton *)sub_239EAA820(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI16MenuPickerButton)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC9SeymourUI16MenuPickerButton_textForegroundColor) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC9SeymourUI16MenuPickerButton_textFontDescriptor;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  *(_OWORD *)(v4 + 40) = xmmword_23A8199E0;
  id v5 = a3;

  result = (_TtC9SeymourUI16MenuPickerButton *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (void)updateConfiguration
{
  v2 = self;
  sub_239EAABC8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI16MenuPickerButton_textForegroundColor));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI16MenuPickerButton_textFontDescriptor);
  uint64_t v4 = *(void *)((char *)&self->super.super.super.super._responderFlags
                 + OBJC_IVAR____TtC9SeymourUI16MenuPickerButton_textFontDescriptor);
  id v5 = *(FBSSceneIdentityToken **)((char *)&self->super.super.super.super.__layeringSceneIdentity
                                 + OBJC_IVAR____TtC9SeymourUI16MenuPickerButton_textFontDescriptor);
  uint64_t v6 = *(uint64_t *)((char *)&self->super.super.super._constraintsExceptingSubviewAutoresizingConstraints
                  + OBJC_IVAR____TtC9SeymourUI16MenuPickerButton_textFontDescriptor);
  uint64_t v7 = *(uint64_t *)((char *)&self->super.super.super._cachedTraitCollection
                  + OBJC_IVAR____TtC9SeymourUI16MenuPickerButton_textFontDescriptor);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.super.super._swiftAnimationInfo
                  + OBJC_IVAR____TtC9SeymourUI16MenuPickerButton_textFontDescriptor);

  sub_239EAB4A0(v3, v4, v5, v6, v7, v8);
}

@end