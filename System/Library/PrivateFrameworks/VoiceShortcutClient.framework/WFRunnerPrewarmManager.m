@interface WFRunnerPrewarmManager
+ (WFRunnerPrewarmManager)sharedManager;
- (WFRunnerConnection)connection;
- (WFRunnerPrewarmManager)init;
- (void)prewarmRunnerWithHostIfNecessary:(id)a3;
- (void)reset;
- (void)setConnection:(id)a3;
@end

@implementation WFRunnerPrewarmManager

+ (WFRunnerPrewarmManager)sharedManager
{
  id v2 = static RunnerPrewarmManager.shared.getter();
  return (WFRunnerPrewarmManager *)v2;
}

- (WFRunnerConnection)connection
{
  id v2 = RunnerPrewarmManager.connection.getter();
  return (WFRunnerConnection *)v2;
}

- (void)setConnection:(id)a3
{
  id v5 = a3;
  v6 = self;
  RunnerPrewarmManager.connection.setter(a3);
}

- (void)prewarmRunnerWithHostIfNecessary:(id)a3
{
  swift_unknownObjectRetain();
  id v5 = self;
  sub_1B3C79590((uint64_t)a3);
  swift_unknownObjectRelease();
}

- (void)reset
{
  id v2 = self;
  sub_1B3C79DCC();
}

- (WFRunnerPrewarmManager)init
{
  return (WFRunnerPrewarmManager *)RunnerPrewarmManager.init()();
}

- (void).cxx_destruct
{
}

@end