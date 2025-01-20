@interface FMSubtitleLabel
- (NSString)accessibilityLabel;
- (_TtC6FindMy15FMSubtitleLabel)initWithCoder:(id)a3;
- (_TtC6FindMy15FMSubtitleLabel)initWithFrame:(CGRect)a3;
@end

@implementation FMSubtitleLabel

- (_TtC6FindMy15FMSubtitleLabel)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for FMSubtitleLabel();
  return -[FMSubtitleLabel initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (NSString)accessibilityLabel
{
  v2 = self;
  sub_1003EE668();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- (_TtC6FindMy15FMSubtitleLabel)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMSubtitleLabel();
  return [(FMSubtitleLabel *)&v5 initWithCoder:a3];
}

@end