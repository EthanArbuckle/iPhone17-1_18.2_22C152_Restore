@interface ICLaunchTaskCancellationToken
- (ICLaunchTaskCancellationToken)init;
- (void)cancel;
@end

@implementation ICLaunchTaskCancellationToken

- (void)cancel
{
  v2 = self;
  Task.cancel()();
}

- (ICLaunchTaskCancellationToken)init
{
  result = (ICLaunchTaskCancellationToken *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end