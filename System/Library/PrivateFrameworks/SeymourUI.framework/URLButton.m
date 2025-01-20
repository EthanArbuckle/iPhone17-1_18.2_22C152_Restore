@interface URLButton
- (_TtC9SeymourUI9URLButton)initWithCoder:(id)a3;
- (_TtC9SeymourUI9URLButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)textSizeChanged:(id)a3;
- (void)tintColorDidChange;
@end

@implementation URLButton

- (_TtC9SeymourUI9URLButton)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI9URLButton *)sub_239E7C5DC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI9URLButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_239E7D7AC();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_239E7CA84();
}

- (void)tintColorDidChange
{
  v2 = self;
  sub_239E7CD20();
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
  v10 = *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC9SeymourUI9URLButton_lastFont);
  uint64_t v11 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                   + OBJC_IVAR____TtC9SeymourUI9URLButton_lastSymbolScale);
  char v12 = *((unsigned char *)&self->super.super.super.super._responderFlags + OBJC_IVAR____TtC9SeymourUI9URLButton_lastSymbolScale);
  v13 = self;
  id v14 = v10;
  sub_239E7CF1C(v10, v11, v12);

  sub_239C25128((uint64_t)v7, &qword_268A12320);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.__layeringSceneIdentity
                     + OBJC_IVAR____TtC9SeymourUI9URLButton_defaults));
  swift_bridgeObjectRelease();

  sub_239C25128((uint64_t)self + OBJC_IVAR____TtC9SeymourUI9URLButton_url, &qword_26AF5F090);
}

@end