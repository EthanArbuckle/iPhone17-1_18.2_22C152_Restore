@interface SportsSessionObserver
- (_TtC7NewsUI221SportsSessionObserver)init;
- (void)bundleSubscriptionDidChange:(id)a3 previousBundleSubscription:(id)a4;
- (void)bundleSubscriptionDidExpire:(id)a3;
- (void)bundleSubscriptionDidSubscribe:(id)a3;
- (void)pushUserSubscriptionContextData;
- (void)subscriptionController:(id)a3 didAddTags:(id)a4 changeTags:(id)a5 moveTags:(id)a6 removeTags:(id)a7 subscriptionType:(unint64_t)a8;
- (void)userInfoDidChangeSportsUserID:(id)a3;
@end

@implementation SportsSessionObserver

- (void)userInfoDidChangeSportsUserID:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1DE95BF94(v4);
  sub_1DE962578(v4);
}

- (_TtC7NewsUI221SportsSessionObserver)init
{
  result = (_TtC7NewsUI221SportsSessionObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI221SportsSessionObserver_aggregateStateModeProvider);
  swift_unknownObjectRelease();

  swift_release();
}

- (void)bundleSubscriptionDidChange:(id)a3 previousBundleSubscription:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1DFDE84B0();
  *(void *)(swift_allocObject() + 16) = v6;
  id v9 = v6;
  sub_1DFDE87E0();
  swift_release();
  swift_release();
  *(void *)(swift_allocObject() + 16) = v9;
  id v10 = v9;
  sub_1DFDE8450();

  swift_release();
}

- (void)bundleSubscriptionDidExpire:(id)a3
{
}

- (void)bundleSubscriptionDidSubscribe:(id)a3
{
}

- (void)pushUserSubscriptionContextData
{
  v2 = self;
  sub_1DE957B0C();
}

- (void)subscriptionController:(id)a3 didAddTags:(id)a4 changeTags:(id)a5 moveTags:(id)a6 removeTags:(id)a7 subscriptionType:(unint64_t)a8
{
  if (a4)
  {
    sub_1DFDFE5D0();
    if (!a5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (a5) {
LABEL_3:
  }
    sub_1DFDFE5D0();
LABEL_4:
  if (a6) {
    sub_1DFDFE5D0();
  }
  if (a7) {
    sub_1DFDFE5D0();
  }
  id v13 = a3;
  v14 = self;
  if (v13)
  {
    v15 = v14;
    sub_1DFDE84B0();
    *(void *)(swift_allocObject() + 16) = v13;
    id v16 = v13;
    sub_1DFDE87E0();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
  }
  else
  {
    __break(1u);
  }
}

@end