@interface PictureInPicturePresenter
- (_TtC9SeymourUI25PictureInPicturePresenter)init;
- (void)playerViewController:(id)a3 restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:(id)a4;
- (void)playerViewControllerDidStartPictureInPicture:(id)a3;
- (void)playerViewControllerDidStopPictureInPicture:(id)a3;
- (void)playerViewControllerWillStopPictureInPicture:(id)a3;
@end

@implementation PictureInPicturePresenter

- (_TtC9SeymourUI25PictureInPicturePresenter)init
{
  result = (_TtC9SeymourUI25PictureInPicturePresenter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI25PictureInPicturePresenter_sessionClient);
  swift_unknownObjectRelease();
  swift_release();

  v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI25PictureInPicturePresenter_display;

  sub_239C1AE10((uint64_t)v3);
}

- (void)playerViewControllerDidStartPictureInPicture:(id)a3
{
}

- (void)playerViewControllerWillStopPictureInPicture:(id)a3
{
  id v4 = a3;
  v5 = self;
  _s9SeymourUI09PictureInC9PresenterC028playerViewControllerWillStopcdC0yySo08AVPlayergH0CF_0();
}

- (void)playerViewControllerDidStopPictureInPicture:(id)a3
{
}

- (void)playerViewController:(id)a3 restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:(id)a4
{
  uint64_t v7 = sub_23A7FEE28();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  _Block_copy(v11);
  id v12 = a3;
  v13 = self;
  sub_23A7FE928();
  sub_23A7FEE08();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_23A46760C(v12, (char *)v13, (void (**)(void, void))v11);
  _Block_release(v11);
  _Block_release(v11);
}

@end