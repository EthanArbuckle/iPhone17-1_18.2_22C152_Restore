@interface FMPlatteredTableViewCell
- (BOOL)isSelected;
- (_TtC6FindMy24FMPlatteredTableViewCell)initWithCoder:(id)a3;
- (_TtC6FindMy24FMPlatteredTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)layoutSubviews;
- (void)setSelected:(BOOL)a3;
@end

@implementation FMPlatteredTableViewCell

- (_TtC6FindMy24FMPlatteredTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC6FindMy24FMPlatteredTableViewCell *)sub_1001CD044(a3, (uint64_t)a4, v6);
}

- (_TtC6FindMy24FMPlatteredTableViewCell)initWithCoder:(id)a3
{
  result = (_TtC6FindMy24FMPlatteredTableViewCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1001CD1D8();
}

- (BOOL)isSelected
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMPlatteredTableViewCell();
  return [(FMPlatteredTableViewCell *)&v3 isSelected];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMPlatteredTableViewCell();
  id v4 = v5.receiver;
  [(FMPlatteredTableViewCell *)&v5 setSelected:v3];
  [v4 setNeedsLayout];
}

@end