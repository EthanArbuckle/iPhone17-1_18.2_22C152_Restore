@interface StackDetailSideBySideItemsCell
- (_TtC10FitnessApp30StackDetailSideBySideItemsCell)initWithCoder:(id)a3;
- (_TtC10FitnessApp30StackDetailSideBySideItemsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)prepareForReuse;
@end

@implementation StackDetailSideBySideItemsCell

- (_TtC10FitnessApp30StackDetailSideBySideItemsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC10FitnessApp30StackDetailSideBySideItemsCell *)sub_10033153C(a3, (uint64_t)a4, v6);
}

- (void)prepareForReuse
{
  v2 = self;
  sub_100332650();
}

- (_TtC10FitnessApp30StackDetailSideBySideItemsCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100332B04();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp30StackDetailSideBySideItemsCell_topLeadingDetailItemView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp30StackDetailSideBySideItemsCell_topTrailingDetailItemView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp30StackDetailSideBySideItemsCell_bottomLeadingDetailItemView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC10FitnessApp30StackDetailSideBySideItemsCell_bottomTrailingDetailItemView);
}

@end