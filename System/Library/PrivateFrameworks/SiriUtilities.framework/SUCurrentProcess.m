@interface SUCurrentProcess
+ (SUCurrentProcess)default;
- (SUCurrentProcess)init;
- (SUIdleTracker)idleTracker;
- (void)setIdleTracker:(id)a3;
@end

@implementation SUCurrentProcess

- (SUIdleTracker)idleTracker
{
  v2 = self;
  v3 = (void *)CurrentProcess.idleTracker.getter();

  return (SUIdleTracker *)v3;
}

- (void)setIdleTracker:(id)a3
{
  id v5 = a3;
  v6 = self;
  CurrentProcess.idleTracker.setter(a3);
}

+ (SUCurrentProcess)default
{
  v2 = (void *)static CurrentProcess.default.getter();

  return (SUCurrentProcess *)v2;
}

- (SUCurrentProcess)init
{
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();
}

@end