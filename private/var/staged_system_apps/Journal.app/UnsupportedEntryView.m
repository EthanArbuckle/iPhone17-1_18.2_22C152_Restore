@interface UnsupportedEntryView
- (_TtC7Journal20UnsupportedEntryView)initWithCoder:(id)a3;
- (_TtC7Journal20UnsupportedEntryView)initWithFrame:(CGRect)a3;
@end

@implementation UnsupportedEntryView

- (_TtC7Journal20UnsupportedEntryView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for UnsupportedEntryView();
  v7 = -[UnsupportedEntryView initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
  sub_1002BD8B4();

  return v7;
}

- (_TtC7Journal20UnsupportedEntryView)initWithCoder:(id)a3
{
  return 0;
}

@end