@interface RoundedButton
- (BOOL)isHighlighted;
- (UIColor)backgroundColor;
- (_TtC9SeymourUI13RoundedButton)initWithCoder:(id)a3;
- (_TtC9SeymourUI13RoundedButton)initWithFrame:(CGRect)a3;
- (void)handleTimer:(id)a3;
- (void)handleTouchDown:(id)a3;
- (void)handleTouchUp:(id)a3;
- (void)setAttributedTitle:(id)a3 forState:(unint64_t)a4;
- (void)setBackgroundColor:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setImage:(id)a3 forState:(unint64_t)a4;
- (void)setTitle:(id)a3 forState:(unint64_t)a4;
- (void)textSizeChanged:(id)a3;
- (void)tintColorDidChange;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation RoundedButton

- (UIColor)backgroundColor
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for RoundedButton();
  v2 = [(RoundedButton *)&v4 backgroundColor];

  return v2;
}

- (void)setBackgroundColor:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for RoundedButton();
  id v4 = a3;
  v5 = (char *)v8.receiver;
  [(RoundedButton *)&v8 setBackgroundColor:v4];
  if (objc_msgSend(v5, sel_tintAdjustmentMode, v8.receiver, v8.super_class) == (id)2)
  {
  }
  else
  {
    id v6 = objc_msgSend(v5, sel_backgroundColor);
    v7 = *(void **)&v5[OBJC_IVAR____TtC9SeymourUI13RoundedButton_undimmedBackgroundColor];
    *(void *)&v5[OBJC_IVAR____TtC9SeymourUI13RoundedButton_undimmedBackgroundColor] = v6;

    id v4 = v7;
  }
}

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RoundedButton();
  return [(RoundedButton *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  id v4 = self;
  sub_23A3CDD04(a3);
}

- (_TtC9SeymourUI13RoundedButton)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI13RoundedButton *)sub_23A3CDE80(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI13RoundedButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A3CF974();
}

- (void)setImage:(id)a3 forState:(unint64_t)a4
{
}

- (void)setTitle:(id)a3 forState:(unint64_t)a4
{
  if (a3)
  {
    sub_23A7FF988();
    id v6 = self;
    v7 = (void *)sub_23A7FF948();
  }
  else
  {
    objc_super v8 = self;
    v7 = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for RoundedButton();
  [(RoundedButton *)&v9 setTitle:v7 forState:a4];

  sub_23A3CEBC0();
  swift_bridgeObjectRelease();
}

- (void)setAttributedTitle:(id)a3 forState:(unint64_t)a4
{
}

- (void)tintColorDidChange
{
  v2 = self;
  sub_23A3CE270();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_23A3CE444(a3);
}

- (void)textSizeChanged:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A12320);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_23A7F5F18();
    uint64_t v8 = sub_23A7F5F48();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = sub_23A7F5F48();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC9SeymourUI13RoundedButton_lastFont);
  uint64_t v11 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                   + OBJC_IVAR____TtC9SeymourUI13RoundedButton_lastSymbolScale);
  char v12 = *((unsigned char *)&self->super.super.super.super._responderFlags
        + OBJC_IVAR____TtC9SeymourUI13RoundedButton_lastSymbolScale);
  v13 = self;
  id v14 = v10;
  sub_23A3CE678(v10, v11, v12, 0);

  sub_239F72774((uint64_t)v7);
}

- (void)handleTimer:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC9SeymourUI13RoundedButton_shouldShowHighlight) = 1;
  [(RoundedButton *)self setHighlighted:1];
}

- (void)handleTouchDown:(id)a3
{
  uint64_t v5 = self;
  id v6 = a3;
  v7 = self;
  uint64_t v8 = (objc_class *)objc_msgSend(v5, sel_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_, v7, sel_handleTimer_, 0, 0, 0.12);
  id v9 = *(Class *)((char *)&v7->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI13RoundedButton_highlightTimer);
  *(Class *)((char *)&v7->super.super.super.super.super.isa + OBJC_IVAR____TtC9SeymourUI13RoundedButton_highlightTimer) = v8;
}

- (void)handleTouchUp:(id)a3
{
}

- (void).cxx_destruct
{
  sub_23A1492D0(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC9SeymourUI13RoundedButton_currentState), *(void *)((char *)&self->super.super.super.super._responderFlags+ OBJC_IVAR____TtC9SeymourUI13RoundedButton_currentState));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI13RoundedButton_indefiniteSpinner));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC9SeymourUI13RoundedButton_defaults);
  id v4 = *(void **)((char *)&self->super.super.super.super._responderFlags
                + OBJC_IVAR____TtC9SeymourUI13RoundedButton_defaults);
  uint64_t v5 = *(FBSSceneIdentityToken **)((char *)&self->super.super.super.super.__layeringSceneIdentity
                                 + OBJC_IVAR____TtC9SeymourUI13RoundedButton_defaults);
  id v6 = *(NSMutableArray **)((char *)&self->super.super.super._constraintsExceptingSubviewAutoresizingConstraints
                          + OBJC_IVAR____TtC9SeymourUI13RoundedButton_defaults);

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI13RoundedButton_highlightTimer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI13RoundedButton_lastFont));
  v7 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI13RoundedButton_undimmedBackgroundColor);
}

@end