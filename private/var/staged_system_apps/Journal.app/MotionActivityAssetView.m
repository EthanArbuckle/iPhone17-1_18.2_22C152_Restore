@interface MotionActivityAssetView
- (_TtC7Journal23MotionActivityAssetView)initWithCoder:(id)a3;
- (_TtC7Journal23MotionActivityAssetView)initWithFrame:(CGRect)a3;
- (void)userInterfaceStyleChanged;
@end

@implementation MotionActivityAssetView

- (_TtC7Journal23MotionActivityAssetView)initWithFrame:(CGRect)a3
{
  return (_TtC7Journal23MotionActivityAssetView *)sub_1000E1E78(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Journal23MotionActivityAssetView)initWithCoder:(id)a3
{
  return (_TtC7Journal23MotionActivityAssetView *)sub_1000E2028(a3);
}

- (void)userInterfaceStyleChanged
{
  v2 = self;
  sub_1000E2818();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal23MotionActivityAssetView_exerciseNameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal23MotionActivityAssetView_workoutDataLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal23MotionActivityAssetView_motionImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal23MotionActivityAssetView_motionActivityAsset));
  sub_10001457C((uint64_t)self + OBJC_IVAR____TtC7Journal23MotionActivityAssetView_latestImageRequestID, &qword_100800950);
}

@end