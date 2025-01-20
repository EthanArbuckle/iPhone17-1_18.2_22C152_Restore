@interface Application
- (Application)init;
- (NSString)description;
- (void)applicationDidBecomeActive:(id)a3;
- (void)applicationDidFinishLaunching:(id)a3;
- (void)applicationDidReceiveMemoryWarning:(id)a3;
- (void)applicationWillResignActive:(id)a3;
@end

@implementation Application

- (Application)init
{
  return (Application *)sub_1000C0BB4();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_release();
}

- (void)applicationDidBecomeActive:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_1001F6790();
  NSString v7 = String._bridgeToObjectiveC()();
  [v6 ulog:40 message:v7];
}

- (void)applicationDidFinishLaunching:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_1001F6790();
  NSString v7 = String._bridgeToObjectiveC()();
  [v6 ulog:40 message:v7];
}

- (void)applicationDidReceiveMemoryWarning:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_1001F6790();
  NSString v7 = String._bridgeToObjectiveC()();
  [v6 ulog:40 message:v7];
}

- (void)applicationWillResignActive:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_1001F6790();
  NSString v7 = String._bridgeToObjectiveC()();
  [v6 ulog:40 message:v7];
}

- (NSString)description
{
  v2 = self;
  sub_1000C2478();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

@end