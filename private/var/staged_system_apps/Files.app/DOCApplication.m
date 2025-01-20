@interface DOCApplication
- (BOOL)runTest:(id)a3 options:(id)a4;
- (_TtC5Files14DOCApplication)init;
- (id)_extendLaunchTest;
- (void)tabbedBrowserViewController:(id)a3 didFinishInitialLoad:(BOOL)a4 ofTab:(unint64_t)a5;
@end

@implementation DOCApplication

- (id)_extendLaunchTest
{
  NSString v2 = String._bridgeToObjectiveC()();

  return v2;
}

- (void)tabbedBrowserViewController:(id)a3 didFinishInitialLoad:(BOOL)a4 ofTab:(unint64_t)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v9 = self;
  sub_100047D5C(v6, a5);
}

- (_TtC5Files14DOCApplication)init
{
  NSString v2 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Files14DOCApplication_currentTestName);
  *NSString v2 = 0;
  v2[1] = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Files14DOCApplication_finishedLaunchTest) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Files14DOCApplication_localDomainRootForQLTests) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Files14DOCApplication_loadedTabs) = (Class)_swiftEmptyArrayStorage;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCApplication();
  return [(DOCApplication *)&v4 init];
}

- (BOOL)runTest:(id)a3 options:(id)a4
{
  uint64_t v4 = (uint64_t)a4;
  if (!a3)
  {
    uint64_t v6 = 0;
    id v8 = 0;
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v8 = v7;
  if (v4) {
LABEL_3:
  }
    uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
LABEL_4:
  v9 = self;
  char v10 = sub_10012AFA0(v6, v8, v4);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10 & 1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files14DOCApplication_localDomainRootForQLTests));

  swift_bridgeObjectRelease();
}

@end