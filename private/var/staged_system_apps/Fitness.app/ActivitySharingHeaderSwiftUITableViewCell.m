@interface ActivitySharingHeaderSwiftUITableViewCell
- (_TtC10FitnessApp41ActivitySharingHeaderSwiftUITableViewCell)initWithCoder:(id)a3;
- (_TtC10FitnessApp41ActivitySharingHeaderSwiftUITableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation ActivitySharingHeaderSwiftUITableViewCell

- (_TtC10FitnessApp41ActivitySharingHeaderSwiftUITableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ActivitySharingHeaderSwiftUITableViewCell();
  v7 = [(ActivitySharingHeaderSwiftUITableViewCell *)&v9 initWithStyle:a3 reuseIdentifier:v6];

  return v7;
}

- (_TtC10FitnessApp41ActivitySharingHeaderSwiftUITableViewCell)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ActivitySharingHeaderSwiftUITableViewCell();
  return [(ActivitySharingHeaderSwiftUITableViewCell *)&v5 initWithCoder:a3];
}

@end