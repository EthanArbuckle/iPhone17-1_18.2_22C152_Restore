@interface NDProxyScoringServiceConnection
+ (NDProxyScoringServiceConnection)sharedInstance;
- (NDProxyScoringServiceConnection)init;
- (void)popInterest;
- (void)pushInterest;
- (void)withScoringService:(id)a3;
@end

@implementation NDProxyScoringServiceConnection

+ (NDProxyScoringServiceConnection)sharedInstance
{
  if (qword_1EBB638F0 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EBB638F8;

  return (NDProxyScoringServiceConnection *)v2;
}

- (NDProxyScoringServiceConnection)init
{
  return (NDProxyScoringServiceConnection *)sub_1E00F6D8C();
}

- (void)withScoringService:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_1E00F7B38((uint64_t)v5, (uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)pushInterest
{
  v2 = self;
  ProxyScoringServiceConnection.pushInterest()();
}

- (void)popInterest
{
  v2 = self;
  ProxyScoringServiceConnection.popInterest()();
}

- (void).cxx_destruct
{
  swift_release();
}

@end