@interface AppStoreApplication
+ (_TtC8AppStore19AppStoreApplication)sharedApplication;
- (_TtC8AppStore19AppStoreApplication)init;
- (id)_extendLaunchTest;
@end

@implementation AppStoreApplication

- (_TtC8AppStore19AppStoreApplication)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore19AppStoreApplication_hasConcludedExtendedLaunchTest) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(AppStoreApplication *)&v5 init];
}

- (id)_extendLaunchTest
{
  NSString v2 = String._bridgeToObjectiveC()();

  return v2;
}

+ (_TtC8AppStore19AppStoreApplication)sharedApplication
{
  swift_getObjCClassMetadata();
  v5.receiver = (id)swift_getObjCClassFromMetadata();
  v5.super_class = (Class)&OBJC_METACLASS____TtC8AppStore19AppStoreApplication;
  id v2 = [super sharedApplication];
  v3 = (void *)swift_dynamicCastClassUnconditional();

  return (_TtC8AppStore19AppStoreApplication *)v3;
}

@end