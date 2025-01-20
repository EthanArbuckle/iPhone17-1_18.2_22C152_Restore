@interface MindfulnessSessionDetailSideBySideItemsCell
- (_TtC10FitnessApp43MindfulnessSessionDetailSideBySideItemsCell)initWithCoder:(id)a3;
- (_TtC10FitnessApp43MindfulnessSessionDetailSideBySideItemsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)prepareForReuse;
@end

@implementation MindfulnessSessionDetailSideBySideItemsCell

- (_TtC10FitnessApp43MindfulnessSessionDetailSideBySideItemsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC10FitnessApp43MindfulnessSessionDetailSideBySideItemsCell *)sub_10045FBA8(a3, (uint64_t)a4, v6);
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1004609E4();
}

- (_TtC10FitnessApp43MindfulnessSessionDetailSideBySideItemsCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100460C6C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp43MindfulnessSessionDetailSideBySideItemsCell_leadingDetailItemView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp43MindfulnessSessionDetailSideBySideItemsCell_trailingDetailItemView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC10FitnessApp43MindfulnessSessionDetailSideBySideItemsCell_bottomDetailItemView);
}

@end