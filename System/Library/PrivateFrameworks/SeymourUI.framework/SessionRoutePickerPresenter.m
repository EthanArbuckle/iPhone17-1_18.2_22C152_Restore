@interface SessionRoutePickerPresenter
- (_TtC9SeymourUI27SessionRoutePickerPresenter)init;
- (void)routingController:(id)a3 didFailToPickRouteWithError:(id)a4;
- (void)routingControllerAvailableRoutesDidChange:(id)a3;
@end

@implementation SessionRoutePickerPresenter

- (_TtC9SeymourUI27SessionRoutePickerPresenter)init
{
  result = (_TtC9SeymourUI27SessionRoutePickerPresenter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI27SessionRoutePickerPresenter_sessionClient);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI27SessionRoutePickerPresenter_remoteParticipantClient);
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_23A24BBBC((uint64_t)self + OBJC_IVAR____TtC9SeymourUI27SessionRoutePickerPresenter_sessionOrigin, MEMORY[0x263F684F0]);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9SeymourUI27SessionRoutePickerPresenter_passwordController));
  sub_23A24BBBC((uint64_t)self + OBJC_IVAR____TtC9SeymourUI27SessionRoutePickerPresenter_currentSelection, type metadata accessor for SessionRoutePickerPresenter.SelectionState);
  sub_23A24BBBC((uint64_t)self + OBJC_IVAR____TtC9SeymourUI27SessionRoutePickerPresenter_targetSelection, type metadata accessor for SessionRoutePickerPresenter.SelectionState);
  v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI27SessionRoutePickerPresenter_display;

  sub_239C1AE10((uint64_t)v3);
}

- (void)routingControllerAvailableRoutesDidChange:(id)a3
{
  uint64_t v5 = sub_23A7FEE28();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = a3;
  v10 = self;
  sub_23A7FE868();
  sub_23A7FEE08();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_23A2445A8();
}

- (void)routingController:(id)a3 didFailToPickRouteWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  uint64_t v7 = self;
  sub_23A24B368();
}

@end