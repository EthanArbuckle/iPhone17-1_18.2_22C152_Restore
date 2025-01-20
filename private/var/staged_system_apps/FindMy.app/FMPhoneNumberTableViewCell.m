@interface FMPhoneNumberTableViewCell
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (_TtC6FindMy26FMPhoneNumberTableViewCell)initWithCoder:(id)a3;
- (_TtC6FindMy26FMPhoneNumberTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)textFieldDidChangeWithSender:(id)a3;
- (void)textFieldDidEndEditing:(id)a3 reason:(int64_t)a4;
- (void)textViewDidChange:(id)a3;
@end

@implementation FMPhoneNumberTableViewCell

- (void)textFieldDidChangeWithSender:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC6FindMy26FMPhoneNumberTableViewCell_delegate;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v5 = *((void *)v4 + 1);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(id, uint64_t, uint64_t))(v5 + 8))(a3, ObjectType, v5);
    id v7 = a3;
    v8 = self;
    swift_unknownObjectRelease();
  }
  else
  {
    id v9 = a3;
    v10 = self;
  }
  sub_10008421C();
}

- (void)textFieldDidEndEditing:(id)a3 reason:(int64_t)a4
{
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC6FindMy26FMPhoneNumberTableViewCell_delegate;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v6 = *((void *)v5 + 1);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(id, uint64_t, uint64_t))(v6 + 8))(a3, ObjectType, v6);
    swift_unknownObjectRelease();
  }
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v11 = v10;
  id v12 = a3;
  v13 = self;
  LOBYTE(length) = sub_10008457C((uint64_t)v12, location, length, v9, v11);

  swift_bridgeObjectRelease();
  return length & 1;
}

- (void)textViewDidChange:(id)a3
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v5 = Strong;
    unsigned __int8 v6 = [Strong respondsToSelector:"textViewDidChange:"];
    id v7 = a3;
    v8 = self;
    if (v6) {
      [v5 textViewDidChange:v7];
    }
    swift_unknownObjectRelease();
  }
  else
  {
    id v9 = a3;
    unint64_t v10 = self;
  }
  sub_10008421C();
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (!Strong)
  {
    id v16 = a3;
    v17 = self;
LABEL_6:
    unsigned __int8 v15 = 0;
    goto LABEL_7;
  }
  unint64_t v10 = Strong;
  unsigned __int8 v11 = [Strong respondsToSelector:"textView:shouldChangeTextInRange:replacementText:"];
  id v12 = a3;
  v13 = self;
  if ((v11 & 1) == 0)
  {
    swift_unknownObjectRelease();
    goto LABEL_6;
  }
  NSString v14 = String._bridgeToObjectiveC()();
  unsigned __int8 v15 = [v10 textView:v12 shouldChangeTextInRange:location length:length replacementText:v14];
  swift_unknownObjectRelease();

LABEL_7:
  sub_10008421C();

  swift_bridgeObjectRelease();
  return v15;
}

- (_TtC6FindMy26FMPhoneNumberTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC6FindMy26FMPhoneNumberTableViewCell *)sub_10008498C(a3, (uint64_t)a4, v6);
}

- (_TtC6FindMy26FMPhoneNumberTableViewCell)initWithCoder:(id)a3
{
  return (_TtC6FindMy26FMPhoneNumberTableViewCell *)sub_100084B4C(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMPhoneNumberTableViewCell_textField));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMPhoneNumberTableViewCell_textView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMPhoneNumberTableViewCell_placeHolderLabel));
  sub_100068760((uint64_t)self + OBJC_IVAR____TtC6FindMy26FMPhoneNumberTableViewCell_delegate);
  sub_100068760((uint64_t)self + OBJC_IVAR____TtC6FindMy26FMPhoneNumberTableViewCell_textViewDelegate);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end