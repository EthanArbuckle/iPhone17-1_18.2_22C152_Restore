@interface PPTRunner
+ (_TtC5Books9PPTRunner)shared;
+ (void)setShared:(id)a3;
- (BOOL)runTestWithName:(id)a3 options:(id)a4;
- (BOOL)testIsRunning;
- (_TtC5Books9PPTRunner)init;
@end

@implementation PPTRunner

+ (_TtC5Books9PPTRunner)shared
{
  if (qword_100B22AE0 != -1) {
    swift_once();
  }
  v2 = (void *)qword_100B75A08;

  return (_TtC5Books9PPTRunner *)v2;
}

+ (void)setShared:(id)a3
{
  uint64_t v3 = qword_100B22AE0;
  id v4 = a3;
  if (v3 != -1) {
    swift_once();
  }
  v5 = (void *)qword_100B75A08;
  qword_100B75A08 = (uint64_t)v4;
}

- (BOOL)runTestWithName:(id)a3 options:(id)a4
{
  uint64_t v5 = sub_1007FDC70();
  v7 = v6;
  uint64_t v8 = sub_1007FDA70();
  v9 = self;
  sub_10043D848(v5, v7, v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 1;
}

- (_TtC5Books9PPTRunner)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books9PPTRunner_currentTestRunner) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books9PPTRunner_testCaseQueue) = (Class)_swiftEmptyArrayStorage;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PPTRunner();
  return [(PPTRunner *)&v3 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

- (BOOL)testIsRunning
{
  return *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books9PPTRunner_currentTestRunner) != 0;
}

@end