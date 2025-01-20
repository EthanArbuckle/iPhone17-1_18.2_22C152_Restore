@interface FriendsSetupCoordinator
- (BOOL)friendsSetupViewControllerShouldTransitionToCloudKitSignInPhase:(id)a3;
- (_TtC10FitnessApp23FriendsSetupCoordinator)init;
- (_TtC10FitnessApp23FriendsSetupCoordinator)initWithFriendManager:(id)a3 friendListSectionManager:(id)a4;
- (void)applicationDidBecomeActive;
- (void)dealloc;
- (void)friendsSetupViewController:(id)a3 didCompletePhase:(int64_t)a4;
- (void)friendsSetupViewControllerDidCompleteSetup:(id)a3;
@end

@implementation FriendsSetupCoordinator

- (_TtC10FitnessApp23FriendsSetupCoordinator)initWithFriendManager:(id)a3 friendListSectionManager:(id)a4
{
  sub_10005C840(a3, a4);
  return result;
}

- (void)applicationDidBecomeActive
{
  v2 = self;
  sub_100018CDC();
}

- (void)dealloc
{
  v2 = self;
  v3 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(v3, v2);

  id v4 = [self defaultCenter];
  [v4 removeObserver:v2];

  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for FriendsSetupCoordinator();
  [(FriendsSetupCoordinator *)&v5 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp23FriendsSetupCoordinator_friendListSectionManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp23FriendsSetupCoordinator_nanoSystemSettingsManager));
  sub_10008DB18((uint64_t)self + OBJC_IVAR____TtC10FitnessApp23FriendsSetupCoordinator_lastPhoneCloudKitAccountFetchTimestamp, (uint64_t *)&unk_10095B890);
  sub_10008DB18((uint64_t)self + OBJC_IVAR____TtC10FitnessApp23FriendsSetupCoordinator_lastWatchCloudKitAccountFetchTimestamp, (uint64_t *)&unk_10095B890);
  v3 = (char *)self + OBJC_IVAR____TtC10FitnessApp23FriendsSetupCoordinator__activitySharingIsSetup;
  uint64_t v4 = sub_1000AFA94(&qword_1009687D0);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_super v5 = (char *)self + OBJC_IVAR____TtC10FitnessApp23FriendsSetupCoordinator__setupPhase;
  uint64_t v6 = sub_1000AFA94(&qword_1009687C8);
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

- (_TtC10FitnessApp23FriendsSetupCoordinator)init
{
  result = (_TtC10FitnessApp23FriendsSetupCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (BOOL)friendsSetupViewControllerShouldTransitionToCloudKitSignInPhase:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  LOBYTE(self) = sub_10069DD90();

  return (self & 1) == 0;
}

- (void)friendsSetupViewController:(id)a3 didCompletePhase:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  sub_10069E7C8(a4);
}

- (void)friendsSetupViewControllerDidCompleteSetup:(id)a3
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v4 = self;
  static Published.subscript.setter();
}

@end