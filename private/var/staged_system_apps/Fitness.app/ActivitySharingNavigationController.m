@interface ActivitySharingNavigationController
- (_TtC10FitnessApp35ActivitySharingNavigationController)initWithCoder:(id)a3;
- (_TtC10FitnessApp35ActivitySharingNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC10FitnessApp35ActivitySharingNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC10FitnessApp35ActivitySharingNavigationController)initWithRootViewController:(id)a3;
- (void)handleActivitySharingURL:(id)a3;
- (void)scrollToTop;
@end

@implementation ActivitySharingNavigationController

- (void)scrollToTop
{
  v2 = *(char **)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC10FitnessApp35ActivitySharingNavigationController_viewController)
     + qword_1009511E8;
  long long v3 = *((_OWORD *)v2 + 1);
  v14[0] = *(_OWORD *)v2;
  v14[1] = v3;
  long long v4 = *((_OWORD *)v2 + 5);
  long long v6 = *((_OWORD *)v2 + 2);
  long long v5 = *((_OWORD *)v2 + 3);
  v14[4] = *((_OWORD *)v2 + 4);
  v14[5] = v4;
  v14[2] = v6;
  v14[3] = v5;
  long long v7 = *((_OWORD *)v2 + 9);
  long long v9 = *((_OWORD *)v2 + 6);
  long long v8 = *((_OWORD *)v2 + 7);
  v14[8] = *((_OWORD *)v2 + 8);
  v14[9] = v7;
  v14[6] = v9;
  v14[7] = v8;
  long long v11 = *((_OWORD *)v2 + 11);
  long long v10 = *((_OWORD *)v2 + 12);
  long long v12 = *((_OWORD *)v2 + 10);
  uint64_t v15 = *((void *)v2 + 26);
  v14[11] = v11;
  v14[12] = v10;
  v14[10] = v12;
  v13 = self;
  sub_10006296C((uint64_t)v14);
  sub_100185C20();
  sub_10004B370((uint64_t)v14);
}

- (_TtC10FitnessApp35ActivitySharingNavigationController)initWithCoder:(id)a3
{
  result = (_TtC10FitnessApp35ActivitySharingNavigationController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC10FitnessApp35ActivitySharingNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  result = (_TtC10FitnessApp35ActivitySharingNavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC10FitnessApp35ActivitySharingNavigationController)initWithRootViewController:(id)a3
{
  id v3 = a3;
  result = (_TtC10FitnessApp35ActivitySharingNavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC10FitnessApp35ActivitySharingNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC10FitnessApp35ActivitySharingNavigationController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp35ActivitySharingNavigationController_viewController));
}

- (void)handleActivitySharingURL:(id)a3
{
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  long long v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  long long v8 = *(char **)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC10FitnessApp35ActivitySharingNavigationController_viewController)
     + qword_1009511E8;
  long long v9 = *((_OWORD *)v8 + 1);
  v20[0] = *(_OWORD *)v8;
  v20[1] = v9;
  long long v10 = *((_OWORD *)v8 + 5);
  long long v12 = *((_OWORD *)v8 + 2);
  long long v11 = *((_OWORD *)v8 + 3);
  v20[4] = *((_OWORD *)v8 + 4);
  v20[5] = v10;
  v20[2] = v12;
  v20[3] = v11;
  long long v13 = *((_OWORD *)v8 + 9);
  long long v15 = *((_OWORD *)v8 + 6);
  long long v14 = *((_OWORD *)v8 + 7);
  v20[8] = *((_OWORD *)v8 + 8);
  v20[9] = v13;
  v20[6] = v15;
  v20[7] = v14;
  long long v17 = *((_OWORD *)v8 + 11);
  long long v16 = *((_OWORD *)v8 + 12);
  long long v18 = *((_OWORD *)v8 + 10);
  uint64_t v21 = *((void *)v8 + 26);
  v20[11] = v17;
  v20[12] = v16;
  v20[10] = v18;
  v19 = self;
  sub_10006296C((uint64_t)v20);
  sub_100185D64(v7);
  sub_10004B370((uint64_t)v20);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end