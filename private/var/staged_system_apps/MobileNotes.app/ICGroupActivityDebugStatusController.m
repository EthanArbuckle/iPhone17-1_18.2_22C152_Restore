@interface ICGroupActivityDebugStatusController
+ (ICGroupActivityDebugStatusController)sharedController;
+ (void)setUp;
- (ICGroupActivityDebugStatusController)init;
@end

@implementation ICGroupActivityDebugStatusController

+ (ICGroupActivityDebugStatusController)sharedController
{
  if (qword_10069B088 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1006CE2A0;

  return (ICGroupActivityDebugStatusController *)v2;
}

+ (void)setUp
{
  if (qword_10069B088 != -1) {
    swift_once();
  }
}

- (ICGroupActivityDebugStatusController)init
{
  result = (ICGroupActivityDebugStatusController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___ICGroupActivityDebugStatusController__states;
  uint64_t v4 = sub_10002F214(&qword_1006A7F58);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end