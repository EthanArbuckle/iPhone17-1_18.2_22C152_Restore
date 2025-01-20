@interface UIKitAutocompleteCoordinator
- (_TtC14WorkflowUICore28UIKitAutocompleteCoordinator)init;
@end

@implementation UIKitAutocompleteCoordinator

- (_TtC14WorkflowUICore28UIKitAutocompleteCoordinator)init
{
  return (_TtC14WorkflowUICore28UIKitAutocompleteCoordinator *)UIKitAutocompleteCoordinator.init()();
}

- (void).cxx_destruct
{
  sub_2353709F4((uint64_t)self + OBJC_IVAR____TtC14WorkflowUICore28UIKitAutocompleteCoordinator_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14WorkflowUICore28UIKitAutocompleteCoordinator_responder));
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC14WorkflowUICore28UIKitAutocompleteCoordinator____lazy_storage___accessoryBarView);
}

@end