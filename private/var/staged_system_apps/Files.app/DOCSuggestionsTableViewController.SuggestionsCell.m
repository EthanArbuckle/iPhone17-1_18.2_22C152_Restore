@interface DOCSuggestionsTableViewController.SuggestionsCell
- (_TtCC5Files33DOCSuggestionsTableViewControllerP33_2E368D64BBCB136E81D511D6E5A68E0E15SuggestionsCell)initWithCoder:(id)a3;
- (_TtCC5Files33DOCSuggestionsTableViewControllerP33_2E368D64BBCB136E81D511D6E5A68E0E15SuggestionsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation DOCSuggestionsTableViewController.SuggestionsCell

- (_TtCC5Files33DOCSuggestionsTableViewControllerP33_2E368D64BBCB136E81D511D6E5A68E0E15SuggestionsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  v9.super_class = (Class)type metadata accessor for DOCSuggestionsTableViewController.SuggestionsCell();
  v7 = [(DOCSuggestionsTableViewController.SuggestionsCell *)&v9 initWithStyle:a3 reuseIdentifier:v6];

  return v7;
}

- (_TtCC5Files33DOCSuggestionsTableViewControllerP33_2E368D64BBCB136E81D511D6E5A68E0E15SuggestionsCell)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCSuggestionsTableViewController.SuggestionsCell();
  return [(DOCSuggestionsTableViewController.SuggestionsCell *)&v5 initWithCoder:a3];
}

@end