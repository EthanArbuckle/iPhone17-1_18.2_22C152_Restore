@interface TTRIListDetailEmblemsTableCell
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldEndEditing:(id)a3;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (_TtC9Reminders30TTRIListDetailEmblemsTableCell)initWithCoder:(id)a3;
- (_TtC9Reminders30TTRIListDetailEmblemsTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)cancelEmojiSelection;
- (void)textFieldDidEndEditing:(id)a3;
@end

@implementation TTRIListDetailEmblemsTableCell

- (_TtC9Reminders30TTRIListDetailEmblemsTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC9Reminders30TTRIListDetailEmblemsTableCell *)sub_1006028EC(a3, (uint64_t)a4, v6);
}

- (_TtC9Reminders30TTRIListDetailEmblemsTableCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100604050();
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  CGFloat width = a3.width;
  uint64_t v6 = self;
  TTRListAppearanceGridView.height(forWidth:)();
  double v8 = v7;

  double v9 = width;
  double v10 = v8;
  result.height = v10;
  result.CGFloat width = v9;
  return result;
}

- (void)cancelEmojiSelection
{
  v2 = self;
  sub_1006035DC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders30TTRIListDetailEmblemsTableCell_gridView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders30TTRIListDetailEmblemsTableCell_emojiBadgeView));
  sub_1000499D4((uint64_t)self + OBJC_IVAR____TtC9Reminders30TTRIListDetailEmblemsTableCell_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders30TTRIListDetailEmblemsTableCell____lazy_storage___emojiTextField));

  swift_unknownObjectWeakDestroy();
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
  id v10 = a3;
  v11 = self;
  LOBYTE(v7) = sub_100604118(v7, v9);

  swift_bridgeObjectRelease();
  return v7 & 1;
}

- (void)textFieldDidEndEditing:(id)a3
{
  if ((*((unsigned char *)&self->super.super.super.super.isa
        + OBJC_IVAR____TtC9Reminders30TTRIListDetailEmblemsTableCell_emojiWasSelected) & 1) == 0
    && swift_unknownObjectWeakLoadStrong())
  {
    id v5 = a3;
    uint64_t v6 = self;
    sub_100602060((uint64_t)v6);

    swift_unknownObjectRelease();
  }
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  return 1;
}

@end