@interface FTPreferences
- (NSString)domain;
- (_TtC8FaceTime13FTPreferences)init;
@end

@implementation FTPreferences

- (NSString)domain
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

- (_TtC8FaceTime13FTPreferences)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *((unsigned char *)&self->super.super.isa
  + OBJC_IVAR____TtC8FaceTime13FTPreferences____lazy_storage___enableInterstitialLinkSharingFlow) = 2;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(FTPreferences *)&v5 init];
}

@end