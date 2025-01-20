@interface ASXPCActivityManager
+ (_TtC3asd20ASXPCActivityManager)shared;
- (_TtC3asd20ASXPCActivityManager)init;
- (void)registerWithActivity:(int64_t)a3;
@end

@implementation ASXPCActivityManager

+ (_TtC3asd20ASXPCActivityManager)shared
{
  id v2 = static ASXPCActivityManager.shared.getter();

  return (_TtC3asd20ASXPCActivityManager *)v2;
}

- (void)registerWithActivity:(int64_t)a3
{
  v4 = self;
  ASXPCActivityManager.register(activity:)(a3);
}

- (_TtC3asd20ASXPCActivityManager)init
{
}

- (void).cxx_destruct
{
}

@end