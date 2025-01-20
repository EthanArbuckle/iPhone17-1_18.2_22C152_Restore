@interface PlatformContentController
+ (NSString)ImportLibraryNotification;
+ (NSString)ImportLibraryNotificationKeyPath;
- (BOOL)isMigrationPossible;
- (MTMigrationPresenter)migrationPresenter;
- (_TtC8Podcasts25PlatformContentController)init;
- (void)performMigrationIfNecessaryWithOptionKeyDown:(BOOL)a3 :(id)a4;
- (void)setMigrationPresenter:(id)a3;
- (void)syncablePlayheadDidChangeForEpisodeUuid:(id)a3 isSignificant:(BOOL)a4;
@end

@implementation PlatformContentController

- (void)performMigrationIfNecessaryWithOptionKeyDown:(BOOL)a3 :(id)a4
{
  v5 = _Block_copy(a4);
  _Block_copy(v5);
  uint64_t v6 = qword_1005F5AA0;
  v7 = self;
  v8 = v7;
  if (v6 != -1)
  {
    swift_once();
    v7 = v8;
  }
  sub_100009FF4((uint64_t)v7, (uint64_t)v5);
  _Block_release(v5);
  _Block_release(v5);
}

- (void)setMigrationPresenter:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC8Podcasts25PlatformContentController_platformImpl;
  swift_beginAccess();
  uint64_t v6 = *((void *)v5 + 3);
  uint64_t v7 = *((void *)v5 + 4);
  sub_100055EF0((uint64_t)v5, v6);
  v8 = *(void (**)(id, uint64_t, uint64_t))(v7 + 24);
  swift_unknownObjectRetain_n();
  v9 = self;
  v8(a3, v6, v7);
  swift_endAccess();

  swift_unknownObjectRelease();
}

- (_TtC8Podcasts25PlatformContentController)init
{
  return (_TtC8Podcasts25PlatformContentController *)sub_100010B20();
}

- (BOOL)isMigrationPossible
{
  return 0;
}

+ (NSString)ImportLibraryNotification
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

+ (NSString)ImportLibraryNotificationKeyPath
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

- (MTMigrationPresenter)migrationPresenter
{
  NSString v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts25PlatformContentController_platformImpl);
  swift_beginAccess();
  sub_100041A98(v2, v2[3]);
  v3 = (void *)swift_unknownObjectRetain();

  return (MTMigrationPresenter *)v3;
}

- (void)syncablePlayheadDidChangeForEpisodeUuid:(id)a3 isSignificant:(BOOL)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_1002B9A2C();
}

- (void).cxx_destruct
{
}

@end