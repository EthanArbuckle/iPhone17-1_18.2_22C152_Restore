@interface APGlobalState
+ (void)createWithTimerXPCActivity:(id)a3 database:(id)a4;
+ (void)startWorkCoordinator;
- (APGlobalState)init;
@end

@implementation APGlobalState

+ (void)createWithTimerXPCActivity:(id)a3 database:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  sub_10000AE6C(v5, v6);
}

+ (void)startWorkCoordinator
{
  if (qword_10028D2C8)
  {
    swift_retain();
    sub_10019AE60();
    swift_release();
  }
  else
  {
    __break(1u);
  }
}

- (APGlobalState)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for GlobalState();
  return [(APGlobalState *)&v3 init];
}

@end