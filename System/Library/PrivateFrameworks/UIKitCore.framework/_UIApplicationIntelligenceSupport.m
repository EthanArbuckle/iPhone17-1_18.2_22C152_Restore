@interface _UIApplicationIntelligenceSupport
+ (Class)remoteContextWrapperClass;
+ (_UIApplicationIntelligenceSupport)sharedInstance;
+ (void)collectRemoteContent:(id)a3 inVisibleRect:(CGRect)a4 withRemoteContextWrapper:(id)a5;
+ (void)collectRemoteContentForRootViews:(id)a3 withRemoteContextWrapper:(id)a4;
+ (void)collectRemoteContentForWindowHostingScene:(id)a3 inVisibleRect:(CGRect)a4 withRemoteContextWrapper:(id)a5;
- (_UIApplicationIntelligenceSupport)init;
- (int64_t)applicationState;
- (void)connectedScenesUpdated;
- (void)setApplicationState:(int64_t)a3;
@end

@implementation _UIApplicationIntelligenceSupport

- (void)setApplicationState:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____UIApplicationIntelligenceSupport_applicationState) = (Class)a3;
  sub_186A1E3FC();
  v4 = self;
  sub_186A1E3DC();
  sub_1855C9C50();
  sub_186A1E3CC();

  swift_release();
}

- (void)connectedScenesUpdated
{
  sub_186A1E3FC();
  v3 = self;
  sub_186A1E3DC();
  sub_1855C9C50();
  sub_186A1E3CC();

  swift_release();
}

- (int64_t)applicationState
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____UIApplicationIntelligenceSupport_applicationState);
}

+ (_UIApplicationIntelligenceSupport)sharedInstance
{
  if (qword_1EB256A40 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EB256A70;
  return (_UIApplicationIntelligenceSupport *)v2;
}

- (_UIApplicationIntelligenceSupport)init
{
  return (_UIApplicationIntelligenceSupport *)sub_1858B56DC();
}

+ (Class)remoteContextWrapperClass
{
  sub_186A1DAEC();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void).cxx_destruct
{
}

+ (void)collectRemoteContent:(id)a3 inVisibleRect:(CGRect)a4 withRemoteContextWrapper:(id)a5
{
}

+ (void)collectRemoteContentForRootViews:(id)a3 withRemoteContextWrapper:(id)a4
{
  sub_1853B985C(0, (unint64_t *)&qword_1E8FAFDD0);
  unint64_t v5 = sub_186A1EB3C();
  swift_unknownObjectRetain();
  sub_185ACEE50(v5, (uint64_t)a4);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

+ (void)collectRemoteContentForWindowHostingScene:(id)a3 inVisibleRect:(CGRect)a4 withRemoteContextWrapper:(id)a5
{
}

@end