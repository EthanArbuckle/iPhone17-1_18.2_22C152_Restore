@interface LineHistoryCell
- (_TtC7Measure15LineHistoryCell)initWithCoder:(id)a3;
- (_TtC7Measure15LineHistoryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation LineHistoryCell

- (_TtC7Measure15LineHistoryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  v9.super_class = (Class)type metadata accessor for LineHistoryCell();
  v7 = [(BaseLineHistoryCell *)&v9 initWithStyle:a3 reuseIdentifier:v6];

  return v7;
}

- (_TtC7Measure15LineHistoryCell)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for LineHistoryCell();
  return [(BaseLineHistoryCell *)&v5 initWithCoder:a3];
}

@end