@interface FMEditableMessageTableViewCell
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (_TtC6FindMy30FMEditableMessageTableViewCell)initWithCoder:(id)a3;
- (_TtC6FindMy30FMEditableMessageTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)textViewDidChange:(id)a3;
@end

@implementation FMEditableMessageTableViewCell

- (void)textViewDidChange:(id)a3
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    v6 = Strong;
    if ([Strong respondsToSelector:"textViewDidChange:"])
    {
      id v7 = a3;
      v8 = self;
      [v6 textViewDidChange:v7];
    }
    swift_unknownObjectRelease();
  }
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    v10 = Strong;
    if ([Strong respondsToSelector:"textView:shouldChangeTextInRange:replacementText:"])
    {
      id v11 = a3;
      v12 = self;
      NSString v13 = String._bridgeToObjectiveC()();
      unsigned __int8 v14 = [v10 textView:v11 shouldChangeTextInRange:location length:length replacementText:v13];

      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();

      return v14;
    }
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  return 0;
}

- (_TtC6FindMy30FMEditableMessageTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC6FindMy30FMEditableMessageTableViewCell *)sub_100387A7C(a3, (uint64_t)a4, v6);
}

- (_TtC6FindMy30FMEditableMessageTableViewCell)initWithCoder:(id)a3
{
  return (_TtC6FindMy30FMEditableMessageTableViewCell *)sub_100387BC8(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy30FMEditableMessageTableViewCell_textView));
  v3 = (char *)self + OBJC_IVAR____TtC6FindMy30FMEditableMessageTableViewCell_delegate;

  sub_100068760((uint64_t)v3);
}

@end