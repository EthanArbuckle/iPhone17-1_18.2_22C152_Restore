@interface WelcomeInteractor
- (_TtC7NewsUI217WelcomeInteractor)init;
- (void)activityObservingApplicationDidBecomeActive;
- (void)dataManager:(id)a3 error:(int64_t)a4;
- (void)dataManager:(id)a3 userType:(int64_t)a4;
- (void)dataManagerFeedPrepared:(id)a3;
- (void)networkReachabilityDidChange:(id)a3;
@end

@implementation WelcomeInteractor

- (_TtC7NewsUI217WelcomeInteractor)init
{
  result = (_TtC7NewsUI217WelcomeInteractor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1DEB1DDEC((uint64_t)self + OBJC_IVAR____TtC7NewsUI217WelcomeInteractor_delegate);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)dataManager:(id)a3 error:(int64_t)a4
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_1DEE953AC();
  swift_unknownObjectRelease();
}

- (void)dataManagerFeedPrepared:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1DEE95460();
  swift_unknownObjectRelease();
}

- (void)dataManager:(id)a3 userType:(int64_t)a4
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_1DEE9554C();
  swift_unknownObjectRelease();
}

- (void)networkReachabilityDidChange:(id)a3
{
  v4 = self;
  swift_unknownObjectRetain();
  sub_1DEE94CEC();
  if (a3)
  {
    if (objc_msgSend(a3, sel_isNetworkReachable)) {
      objc_msgSend(*(id *)((char *)&v4->super.isa + OBJC_IVAR____TtC7NewsUI217WelcomeInteractor_dataManager), sel_beginFetchingUserType);
    }
    swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

- (void)activityObservingApplicationDidBecomeActive
{
}

@end