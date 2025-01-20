@interface ICLaunchTaskRunner
+ (id)runDelayedLaunchTasksWithDelegate:(id)a3 completionHandler:(id)a4;
- (ICLaunchTaskRunner)init;
@end

@implementation ICLaunchTaskRunner

- (ICLaunchTaskRunner)init
{
  result = (ICLaunchTaskRunner *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___ICLaunchTaskRunner_logger;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR___ICLaunchTaskRunner_delegate;

  sub_10015E5E8((uint64_t)v5);
}

+ (id)runDelayedLaunchTasksWithDelegate:(id)a3 completionHandler:(id)a4
{
  uint64_t v4 = _Block_copy(a4);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = swift_unknownObjectRetain();
  id v7 = _s11MobileNotes16LaunchTaskRunnerC010runDelayedC5Tasks8delegate17completionHandlerAC17CancellationTokenCAA0cdE8Delegate_pSg_ySbYbctFZ_0(v6, (uint64_t)sub_1002584F0, v5);
  swift_unknownObjectRelease();
  swift_release();

  return v7;
}

@end