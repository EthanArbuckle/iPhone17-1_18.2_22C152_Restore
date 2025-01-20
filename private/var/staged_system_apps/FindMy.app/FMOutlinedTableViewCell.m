@interface FMOutlinedTableViewCell
- (_TtC6FindMy23FMOutlinedTableViewCell)initWithCoder:(id)a3;
- (_TtC6FindMy23FMOutlinedTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)layoutSubviews;
@end

@implementation FMOutlinedTableViewCell

- (_TtC6FindMy23FMOutlinedTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC6FindMy23FMOutlinedTableViewCell *)sub_1003ECE8C(a3, (uint64_t)a4, v6);
}

- (_TtC6FindMy23FMOutlinedTableViewCell)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC6FindMy23FMOutlinedTableViewCell_outlineLayer;
  id v6 = objc_allocWithZone((Class)CAShapeLayer);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)[v6 init];
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy23FMOutlinedTableViewCell_disableOutline) = 0;

  result = (_TtC6FindMy23FMOutlinedTableViewCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1003ED100();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy23FMOutlinedTableViewCell_outlineLayer));
}

@end