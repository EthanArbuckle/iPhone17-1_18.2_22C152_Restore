@interface ResultRefinementsController
- (_TtC4Maps27ResultRefinementsController)init;
- (_TtP4Maps35ResultRefinementsControllerDelegate_)delegate;
- (void)refinementBarButtonTappedWithRefinementID:(id)a3 submenuElementID:(id)a4 viewModel:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation ResultRefinementsController

- (_TtP4Maps35ResultRefinementsControllerDelegate_)delegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtP4Maps35ResultRefinementsControllerDelegate_ *)Strong;
}

- (void)setDelegate:(id)a3
{
}

- (void)refinementBarButtonTappedWithRefinementID:(id)a3 submenuElementID:(id)a4 viewModel:(id)a5
{
  uint64_t v8 = sub_1000FF33C((uint64_t *)&unk_1015D5DE0);
  __chkstk_darwin(v8 - 8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for UUID();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  if (a4)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v15 = 0;
  }
  else
  {
    uint64_t v15 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v10, v15, 1, v11);
  id v16 = a5;
  v17 = self;
  sub_1001CC734((uint64_t)v14, v10, (unint64_t)v16);

  sub_1001CD2E0((uint64_t)v10);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

- (_TtC4Maps27ResultRefinementsController)init
{
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ResultRefinementsController();
  return [(ResultRefinementsController *)&v4 init];
}

- (void).cxx_destruct
{
}

@end