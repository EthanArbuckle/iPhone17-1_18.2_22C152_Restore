@interface FullScreenMotionActivityView
- (_TtC7Journal28FullScreenMotionActivityView)initWithCoder:(id)a3;
- (_TtC7Journal28FullScreenMotionActivityView)initWithFrame:(CGRect)a3;
@end

@implementation FullScreenMotionActivityView

- (_TtC7Journal28FullScreenMotionActivityView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = OBJC_IVAR____TtC7Journal28FullScreenMotionActivityView_motionActivityView;
  type metadata accessor for MotionActivityGridView();
  id v9 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v10 = self;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)[v9 init];
  *(Class *)((char *)&v10->super.super.super.isa
           + OBJC_IVAR____TtC7Journal28FullScreenMotionActivityView_motionActivityAsset) = 0;

  v12.receiver = v10;
  v12.super_class = (Class)type metadata accessor for FullScreenMotionActivityView();
  return -[FullScreenMotionActivityView initWithFrame:](&v12, "initWithFrame:", x, y, width, height);
}

- (_TtC7Journal28FullScreenMotionActivityView)initWithCoder:(id)a3
{
  return (_TtC7Journal28FullScreenMotionActivityView *)sub_100513444(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal28FullScreenMotionActivityView_motionActivityView));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7Journal28FullScreenMotionActivityView_motionActivityAsset);
}

@end