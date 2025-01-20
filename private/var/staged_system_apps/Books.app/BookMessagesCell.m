@interface BookMessagesCell
- (_TtC5Books16BookMessagesCell)initWithCoder:(id)a3;
- (_TtC5Books16BookMessagesCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation BookMessagesCell

- (_TtC5Books16BookMessagesCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    sub_1007FDC70();
    NSString v6 = sub_1007FDC30();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for BookMessagesCell();
  v7 = [(BookMessagesCell *)&v9 initWithStyle:a3 reuseIdentifier:v6];

  return v7;
}

- (_TtC5Books16BookMessagesCell)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for BookMessagesCell();
  return [(BookMessagesCell *)&v5 initWithCoder:a3];
}

@end