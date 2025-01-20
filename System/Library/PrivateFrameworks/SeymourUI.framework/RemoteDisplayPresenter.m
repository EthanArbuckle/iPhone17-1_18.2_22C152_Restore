@interface RemoteDisplayPresenter
- (_TtC9SeymourUI22RemoteDisplayPresenter)init;
- (void)playerViewController:(id)a3 restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:(id)a4;
- (void)playerViewControllerDidStartPictureInPicture:(id)a3;
- (void)playerViewControllerDidStopPictureInPicture:(id)a3;
- (void)playerViewControllerWillStopPictureInPicture:(id)a3;
@end

@implementation RemoteDisplayPresenter

- (_TtC9SeymourUI22RemoteDisplayPresenter)init
{
  result = (_TtC9SeymourUI22RemoteDisplayPresenter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_23A04AEF4((uint64_t)self + OBJC_IVAR____TtC9SeymourUI22RemoteDisplayPresenter_state, type metadata accessor for RemoteDisplayPresenter.State);
  swift_release();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI22RemoteDisplayPresenter_sessionClient);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI22RemoteDisplayPresenter_storefrontLocalizer);
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI22RemoteDisplayPresenter_display;

  sub_239C1AE10((uint64_t)v3);
}

- (void)playerViewControllerDidStartPictureInPicture:(id)a3
{
  id v4 = a3;
  v5 = self;
  _s9SeymourUI22RemoteDisplayPresenterC037playerViewControllerDidStartPictureInK0yySo08AVPlayergH0CF_0();
}

- (void)playerViewControllerWillStopPictureInPicture:(id)a3
{
  uint64_t v5 = sub_23A7FB9B8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_23A7FEE28();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = a3;
  v14 = self;
  sub_23A7FE928();
  sub_23A7FEE08();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  swift_getObjectType();
  sub_23A7FB9A8();
  sub_23A053D6C((unint64_t *)&unk_268A14DE0, MEMORY[0x263F6B428]);
  sub_23A7FDB18();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)playerViewControllerDidStopPictureInPicture:(id)a3
{
  uint64_t v5 = sub_23A7FEE28();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = a3;
  uint64_t v10 = self;
  sub_23A7FE928();
  sub_23A7FEE08();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_23A04CD7C();
}

- (void)playerViewController:(id)a3 restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_23A05372C((uint64_t)v8, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);
}

@end