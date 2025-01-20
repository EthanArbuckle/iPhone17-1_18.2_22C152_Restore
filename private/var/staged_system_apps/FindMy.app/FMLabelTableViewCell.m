@interface FMLabelTableViewCell
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (_TtC6FindMy20FMLabelTableViewCell)initWithCoder:(id)a3;
- (_TtC6FindMy20FMLabelTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)returnKeyPressedWithSender:(id)a3;
- (void)textFieldDidChangeWithSender:(id)a3;
@end

@implementation FMLabelTableViewCell

- (_TtC6FindMy20FMLabelTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC6FindMy20FMLabelTableViewCell *)sub_100382A54(a3, (uint64_t)a4, v6);
}

- (_TtC6FindMy20FMLabelTableViewCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy20FMLabelTableViewCell_textField) = 0;
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC6FindMy20FMLabelTableViewCell_characterLimit;
  *(void *)uint64_t v5 = 0;
  v5[8] = 1;
  *(void *)&self->textField[OBJC_IVAR____TtC6FindMy20FMLabelTableViewCell_delegate] = 0;
  swift_unknownObjectWeakInit();
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy20FMLabelTableViewCell_textFieldIsEnabled) = 0;
  id v6 = a3;

  result = (_TtC6FindMy20FMLabelTableViewCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)textFieldDidChangeWithSender:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1003832B8(v4);
}

- (void)returnKeyPressedWithSender:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_100383720();
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v11 = v10;
  id v12 = a3;
  v13 = self;
  LOBYTE(length) = sub_100383448(v12, location, length, v9, v11);

  swift_bridgeObjectRelease();
  return length & 1;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy20FMLabelTableViewCell_textField));
  v3 = (char *)self + OBJC_IVAR____TtC6FindMy20FMLabelTableViewCell_delegate;

  sub_100068760((uint64_t)v3);
}

@end