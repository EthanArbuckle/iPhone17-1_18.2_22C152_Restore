@interface DebugFormatSnapshotContentView
+ (Class)layerClass;
- (_TtC8NewsFeed30DebugFormatSnapshotContentView)initWithCoder:(id)a3;
- (_TtC8NewsFeed30DebugFormatSnapshotContentView)initWithFrame:(CGRect)a3;
@end

@implementation DebugFormatSnapshotContentView

+ (Class)layerClass
{
  sub_1C03C959C();
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC8NewsFeed30DebugFormatSnapshotContentView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  return -[DebugFormatSnapshotContentView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC8NewsFeed30DebugFormatSnapshotContentView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(DebugFormatSnapshotContentView *)&v5 initWithCoder:a3];
}

@end