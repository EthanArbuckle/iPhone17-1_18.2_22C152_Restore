@interface JournalNavigationCoordinator
- (void)shouldDismissOnboarding;
@end

@implementation JournalNavigationCoordinator

- (void)shouldDismissOnboarding
{
  uint64_t v3 = sub_100010218(&qword_1007FA1D0);
  __chkstk_darwin(v3 - 8);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  type metadata accessor for MainActor();
  swift_retain_n();
  uint64_t v7 = static MainActor.shared.getter();
  v8 = (void *)swift_allocObject();
  v8[2] = v7;
  v8[3] = &protocol witness table for MainActor;
  v8[4] = self;
  sub_100328A60((uint64_t)v5, (uint64_t)&unk_1007FA9A0, (uint64_t)v8);
  swift_release();
  swift_release();
}

@end