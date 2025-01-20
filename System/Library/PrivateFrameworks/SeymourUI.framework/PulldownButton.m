@interface PulldownButton
- (BOOL)isHighlighted;
- (_TtC9SeymourUI14PulldownButton)initWithCoder:(id)a3;
- (_TtC9SeymourUI14PulldownButton)initWithFrame:(CGRect)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)tintColorDidChange;
@end

@implementation PulldownButton

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PulldownButton();
  return [(PulldownButton *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for PulldownButton();
  id v4 = v7.receiver;
  [(PulldownButton *)&v7 setHighlighted:v3];
  unsigned int v5 = objc_msgSend(v4, sel_isHighlighted, v7.receiver, v7.super_class);
  double v6 = 0.4;
  if (!v5) {
    double v6 = 1.0;
  }
  objc_msgSend(v4, sel_setAlpha_, v6);
}

- (_TtC9SeymourUI14PulldownButton)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI14PulldownButton *)sub_23A346CC0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI14PulldownButton)initWithCoder:(id)a3
{
  unsigned int v5 = (char *)self + OBJC_IVAR____TtC9SeymourUI14PulldownButton_appearance;
  double v6 = self;
  id v7 = a3;
  id v8 = objc_msgSend(v6, sel_secondaryLabelColor);
  id v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F825C8]), sel_initWithRed_green_blue_alpha_, 0.650980392, 1.0, 0.0, 1.0);
  v10 = (void *)*MEMORY[0x263F83570];
  *(void *)unsigned int v5 = v8;
  *((void *)v5 + 1) = v9;
  *((void *)v5 + 2) = 0;
  *((void *)v5 + 3) = 0;
  *((void *)v5 + 4) = v10;
  *(_OWORD *)(v5 + 40) = xmmword_23A819B80;
  uint64_t v11 = MEMORY[0x263F8EE88];
  *((void *)v5 + 7) = 1;
  *((void *)v5 + 8) = v11;
  v12 = (char *)self + OBJC_IVAR____TtC9SeymourUI14PulldownButton_attributedTitle;
  uint64_t v13 = sub_23A7F6258();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 1, 1, v13);
  id v14 = v10;

  result = (_TtC9SeymourUI14PulldownButton *)sub_23A800DD8();
  __break(1u);
  return result;
}

- (void)tintColorDidChange
{
  v2 = self;
  sub_23A3472D0();
}

- (void).cxx_destruct
{
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI14PulldownButton_appearance);
  id v4 = *(FBSSceneIdentityToken **)((char *)&self->super.super.super.super.__layeringSceneIdentity
                                 + OBJC_IVAR____TtC9SeymourUI14PulldownButton_appearance);
  uint64_t v5 = *(uint64_t *)((char *)&self->super.super.super._constraintsExceptingSubviewAutoresizingConstraints
                  + OBJC_IVAR____TtC9SeymourUI14PulldownButton_appearance);
  double v6 = *(UITraitCollection **)((char *)&self->super.super.super._cachedTraitCollection
                             + OBJC_IVAR____TtC9SeymourUI14PulldownButton_appearance);
  uint64_t v7 = *(uint64_t *)((char *)&self->super.super.super._swiftAnimationInfo
                  + OBJC_IVAR____TtC9SeymourUI14PulldownButton_appearance);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.super.super._traitChangeRegistry
                  + OBJC_IVAR____TtC9SeymourUI14PulldownButton_appearance);
  uint64_t v9 = *(uint64_t *)((char *)&self->super.super.super._layerRetained
                  + OBJC_IVAR____TtC9SeymourUI14PulldownButton_appearance);
  objc_release(*(id *)((char *)&self->super.super.super.super._responderFlags
                     + OBJC_IVAR____TtC9SeymourUI14PulldownButton_appearance));

  sub_239E12CCC(v4, v5, v6, v7, v8, v9);
  sub_239C25128((uint64_t)self + OBJC_IVAR____TtC9SeymourUI14PulldownButton_attributedTitle, &qword_268A11568);
  v10 = *(Class *)((char *)&self->super.super.super.super.super.isa
                 + OBJC_IVAR____TtC9SeymourUI14PulldownButton_textColor);
}

@end