@interface PushCoordinator
+ (_TtC3asd15PushCoordinator)shared;
+ (void)configurePush;
- (_TtC3asd15PushCoordinator)init;
- (void)registerICloud;
- (void)unregister;
@end

@implementation PushCoordinator

+ (_TtC3asd15PushCoordinator)shared
{
  id v2 = static PushCoordinator.shared.getter();

  return (_TtC3asd15PushCoordinator *)v2;
}

+ (void)configurePush
{
}

- (_TtC3asd15PushCoordinator)init
{
  return (_TtC3asd15PushCoordinator *)sub_10008894C();
}

- (void)registerICloud
{
  id v2 = self;
  PushCoordinator.registerICloud()();
}

- (void)unregister
{
  id v2 = self;
  PushCoordinator.unregister()();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();

  swift_release();
}

@end