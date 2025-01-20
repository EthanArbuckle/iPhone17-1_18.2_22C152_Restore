@interface FMEmailTableViewCell
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (_TtC6FindMy20FMEmailTableViewCell)initWithCoder:(id)a3;
- (_TtC6FindMy20FMEmailTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)textFieldDidChangeWithSender:(id)a3;
- (void)textFieldDidEndEditing:(id)a3 reason:(int64_t)a4;
- (void)textViewDidChange:(id)a3;
@end

@implementation FMEmailTableViewCell

- (void)textFieldDidChangeWithSender:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC6FindMy20FMEmailTableViewCell_delegate;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v5 = *((void *)v4 + 1);
    uint64_t ObjectType = swift_getObjectType();
    v7 = *(void (**)(id, uint64_t, uint64_t))(v5 + 8);
    id v8 = a3;
    v9 = self;
    v7(v8, ObjectType, v5);
    swift_unknownObjectRelease();
  }
  else
  {
    id v10 = a3;
    v11 = self;
  }
  sub_1003CBDE0();
}

- (void)textFieldDidEndEditing:(id)a3 reason:(int64_t)a4
{
  v6 = (char *)self + OBJC_IVAR____TtC6FindMy20FMEmailTableViewCell_delegate;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v7 = *((void *)v6 + 1);
    uint64_t ObjectType = swift_getObjectType();
    v9 = *(void (**)(id, uint64_t, uint64_t))(v7 + 8);
    id v10 = a3;
    v11 = self;
    v9(v10, ObjectType, v7);

    swift_unknownObjectRelease();
  }
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  v12 = (char *)self + OBJC_IVAR____TtC6FindMy20FMEmailTableViewCell_delegate;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v23 = v9;
    uint64_t v13 = *((void *)v12 + 1);
    uint64_t ObjectType = swift_getObjectType();
    v22 = *(uint64_t (**)(id, NSUInteger, NSUInteger, uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 16);
    uint64_t v15 = v11;
    id v16 = a3;
    v17 = self;
    char v18 = v22(v16, location, length, v23, v15, ObjectType, v13);
    swift_unknownObjectRelease();
  }
  else
  {
    id v19 = a3;
    v20 = self;
    char v18 = 0;
  }
  sub_1003CBDE0();

  swift_bridgeObjectRelease();
  return v18 & 1;
}

- (void)textViewDidChange:(id)a3
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v5 = Strong;
    unsigned __int8 v6 = [Strong respondsToSelector:"textViewDidChange:"];
    id v7 = a3;
    id v8 = self;
    if (v6) {
      [v5 textViewDidChange:v7];
    }
    swift_unknownObjectRelease();
  }
  else
  {
    id v9 = a3;
    uint64_t v10 = self;
  }
  sub_1003CBDE0();
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
  uint64_t v10 = Strong;
  unsigned __int8 v11 = [Strong respondsToSelector:"textView:shouldChangeTextInRange:replacementText:"];
  id v12 = a3;
  uint64_t v13 = self;
  if ((v11 & 1) == 0)
  {
    swift_unknownObjectRelease();
    goto LABEL_6;
  }
  NSString v14 = String._bridgeToObjectiveC()();
  unsigned __int8 v15 = [v10 textView:v12 shouldChangeTextInRange:location length:length replacementText:v14];
  swift_unknownObjectRelease();

LABEL_7:
  sub_1003CBDE0();

  swift_bridgeObjectRelease();
  return v15;
}

- (_TtC6FindMy20FMEmailTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC6FindMy20FMEmailTableViewCell *)sub_1003CC478(a3, (uint64_t)a4, v6);
}

- (_TtC6FindMy20FMEmailTableViewCell)initWithCoder:(id)a3
{
  return (_TtC6FindMy20FMEmailTableViewCell *)sub_1003CC638(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy20FMEmailTableViewCell_textField));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy20FMEmailTableViewCell_textView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy20FMEmailTableViewCell_placeHolderLabel));
  sub_100068760((uint64_t)self + OBJC_IVAR____TtC6FindMy20FMEmailTableViewCell_delegate);
  sub_100068760((uint64_t)self + OBJC_IVAR____TtC6FindMy20FMEmailTableViewCell_textViewDelegate);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end