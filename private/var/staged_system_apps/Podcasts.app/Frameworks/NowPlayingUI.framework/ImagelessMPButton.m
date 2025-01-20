@interface ImagelessMPButton
- (_TtC12NowPlayingUIP33_20B7ED5F4C86462350B4C8940E4EFBD517ImagelessMPButton)initWithCoder:(id)a3;
- (_TtC12NowPlayingUIP33_20B7ED5F4C86462350B4C8940E4EFBD517ImagelessMPButton)initWithFrame:(CGRect)a3;
@end

@implementation ImagelessMPButton

- (_TtC12NowPlayingUIP33_20B7ED5F4C86462350B4C8940E4EFBD517ImagelessMPButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ImagelessMPButton();
  return -[ImagelessMPButton initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC12NowPlayingUIP33_20B7ED5F4C86462350B4C8940E4EFBD517ImagelessMPButton)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ImagelessMPButton();
  return [(ImagelessMPButton *)&v5 initWithCoder:a3];
}

@end