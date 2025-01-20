@interface DeleteButton
- (ASVRoundedButton)deleteButton;
- (_TtC7Measure12DeleteButton)initWithCoder:(id)a3;
- (_TtC7Measure12DeleteButton)initWithFrame:(CGRect)a3;
- (void)setDeleteButton:(id)a3;
- (void)tapDeleteFrom:(id)a3;
@end

@implementation DeleteButton

- (ASVRoundedButton)deleteButton
{
  return (ASVRoundedButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                     + OBJC_IVAR____TtC7Measure12DeleteButton_deleteButton));
}

- (void)setDeleteButton:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure12DeleteButton_deleteButton);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure12DeleteButton_deleteButton) = (Class)a3;
  id v3 = a3;
}

- (_TtC7Measure12DeleteButton)initWithFrame:(CGRect)a3
{
  sub_10007DFCC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC7Measure12DeleteButton)initWithCoder:(id)a3
{
  *(void *)&self->delegate[OBJC_IVAR____TtC7Measure12DeleteButton_delegate] = 0;
  swift_unknownObjectWeakInit();
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure12DeleteButton_isEnabled) = 1;
  id v5 = a3;

  result = (_TtC7Measure12DeleteButton *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10001FE1C((uint64_t)self + OBJC_IVAR____TtC7Measure12DeleteButton_delegate);
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure12DeleteButton_deleteButton);
}

- (void)tapDeleteFrom:(id)a3
{
  id v4 = (char *)self + OBJC_IVAR____TtC7Measure12DeleteButton_delegate;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v5 = *((void *)v4 + 1);
    uint64_t ObjectType = swift_getObjectType();
    v7 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
    id v8 = a3;
    v9 = self;
    v7(ObjectType, v5);
    swift_unknownObjectRelease();
  }
  else
  {
    id v10 = a3;
    v11 = self;
  }
  if (qword_1004C2B40 != -1) {
    swift_once();
  }
  v12._object = (void *)0x8000000100422C50;
  v12._countAndFlagsBits = 0xD000000000000014;
  Log.default(_:isPrivate:)(v12, 0);
}

@end