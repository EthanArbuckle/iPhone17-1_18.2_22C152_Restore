@interface TTRIVibrantTableCell
- (_TtC27RemindersIntentsUIExtension20TTRIVibrantTableCell)initWithCoder:(id)a3;
- (_TtC27RemindersIntentsUIExtension20TTRIVibrantTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)layoutSubviews;
@end

@implementation TTRIVibrantTableCell

- (void)layoutSubviews
{
  v2 = self;
  sub_10001303C();
}

- (_TtC27RemindersIntentsUIExtension20TTRIVibrantTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    sub_100021998();
    NSString v6 = sub_100021968();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for TTRIVibrantTableCell();
  v7 = [(TTRIVibrantTableCell *)&v9 initWithStyle:a3 reuseIdentifier:v6];

  return v7;
}

- (_TtC27RemindersIntentsUIExtension20TTRIVibrantTableCell)initWithCoder:(id)a3
{
  return (_TtC27RemindersIntentsUIExtension20TTRIVibrantTableCell *)sub_10001327C(self, (uint64_t)a2, (uint64_t)a3, v3, (uint64_t (*)(uint64_t))type metadata accessor for TTRIVibrantTableCell);
}

@end