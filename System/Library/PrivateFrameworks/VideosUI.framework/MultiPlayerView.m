@interface MultiPlayerView
- (_TtC8VideosUI15MultiPlayerView)initWithCoder:(id)a3;
- (_TtC8VideosUI15MultiPlayerView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)onPanGesture:(id)a3;
- (void)viewPinchedWithGesture:(id)a3;
@end

@implementation MultiPlayerView

- (_TtC8VideosUI15MultiPlayerView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E3334CE8();
  return 0;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1E33351B0();
}

- (void)viewPinchedWithGesture:(id)a3
{
  id v4 = a3;
  v5 = self;
  OUTLINED_FUNCTION_0_25();
  sub_1E3338C00();
}

- (void)onPanGesture:(id)a3
{
  id v4 = a3;
  v5 = self;
  OUTLINED_FUNCTION_0_25();
  sub_1E333926C();
}

- (_TtC8VideosUI15MultiPlayerView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EADEF270);
  OUTLINED_FUNCTION_15_3();
  OUTLINED_FUNCTION_47();
  v3();
  swift_bridgeObjectRelease();
  sub_1E2F6ABF0((uint64_t)self + OBJC_IVAR____TtC8VideosUI15MultiPlayerView_delegate);
  sub_1E2C5FB90(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8VideosUI15MultiPlayerView_didSelectPlayerViewController));
  sub_1E2C5FB90(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8VideosUI15MultiPlayerView_didPinchPlayerViewController));
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EADEF280);
  OUTLINED_FUNCTION_15_3();
  OUTLINED_FUNCTION_47();
  v4();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8VideosUI15MultiPlayerView_layoutEngine);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EADEF290);
  OUTLINED_FUNCTION_15_3();
  OUTLINED_FUNCTION_47();
  v5();
  swift_bridgeObjectRelease();
  swift_release();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI15MultiPlayerView____lazy_storage___panGesture));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI15MultiPlayerView____lazy_storage___adjustmentView));
  swift_release();
  swift_bridgeObjectRelease();
}

@end