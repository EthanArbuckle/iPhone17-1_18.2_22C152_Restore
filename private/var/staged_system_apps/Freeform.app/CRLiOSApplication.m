@interface CRLiOSApplication
+ (_TtC8Freeform17CRLiOSApplication)sharedApplication;
- (_TtC8Freeform17CRLiOSApplication)init;
- (id)_extendLaunchTest;
@end

@implementation CRLiOSApplication

+ (_TtC8Freeform17CRLiOSApplication)sharedApplication
{
  id v2 = [self sharedApplication];
  type metadata accessor for CRLiOSApplication();
  v3 = (void *)swift_dynamicCastClassUnconditional();

  return (_TtC8Freeform17CRLiOSApplication *)v3;
}

- (id)_extendLaunchTest
{
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v2;
}

- (_TtC8Freeform17CRLiOSApplication)init
{
  NSString v2 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC8Freeform17CRLiOSApplication_kCRLExtendedLaunchTestName);
  *NSString v2 = 0xD000000000000011;
  v2[1] = 0x800000010124DB80;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for CRLiOSApplication();
  return [(CRLiOSApplication *)&v4 init];
}

- (void).cxx_destruct
{
}

@end