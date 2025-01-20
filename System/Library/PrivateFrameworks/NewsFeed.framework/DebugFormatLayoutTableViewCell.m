@interface DebugFormatLayoutTableViewCell
- (_TtC8NewsFeedP33_1EBE632DE5501EA5B29FF257955A675730DebugFormatLayoutTableViewCell)initWithCoder:(id)a3;
- (_TtC8NewsFeedP33_1EBE632DE5501EA5B29FF257955A675730DebugFormatLayoutTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation DebugFormatLayoutTableViewCell

- (_TtC8NewsFeedP33_1EBE632DE5501EA5B29FF257955A675730DebugFormatLayoutTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a4)
  {
    sub_1C151E62C();
    a4 = (id)sub_1C151E5EC();
    swift_bridgeObjectRelease();
  }
  v9.receiver = self;
  v9.super_class = ObjectType;
  v7 = [(DebugFormatLayoutTableViewCell *)&v9 initWithStyle:3 reuseIdentifier:a4];

  return v7;
}

- (_TtC8NewsFeedP33_1EBE632DE5501EA5B29FF257955A675730DebugFormatLayoutTableViewCell)initWithCoder:(id)a3
{
  result = (_TtC8NewsFeedP33_1EBE632DE5501EA5B29FF257955A675730DebugFormatLayoutTableViewCell *)sub_1C152040C();
  __break(1u);
  return result;
}

@end