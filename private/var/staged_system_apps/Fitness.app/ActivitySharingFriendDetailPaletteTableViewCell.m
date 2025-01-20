@interface ActivitySharingFriendDetailPaletteTableViewCell
- (_TtC10FitnessApp47ActivitySharingFriendDetailPaletteTableViewCell)initWithCoder:(id)a3;
- (_TtC10FitnessApp47ActivitySharingFriendDetailPaletteTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation ActivitySharingFriendDetailPaletteTableViewCell

- (_TtC10FitnessApp47ActivitySharingFriendDetailPaletteTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC10FitnessApp47ActivitySharingFriendDetailPaletteTableViewCell *)sub_1002C13E8(a3, (uint64_t)a4, v6);
}

- (_TtC10FitnessApp47ActivitySharingFriendDetailPaletteTableViewCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10FitnessApp47ActivitySharingFriendDetailPaletteTableViewCell_activitySummaryProvider) = 0;
  id v4 = a3;

  result = (_TtC10FitnessApp47ActivitySharingFriendDetailPaletteTableViewCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp47ActivitySharingFriendDetailPaletteTableViewCell_activitySummaryProvider));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC10FitnessApp47ActivitySharingFriendDetailPaletteTableViewCell_paletteViewController);
}

@end