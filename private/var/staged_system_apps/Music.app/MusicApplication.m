@interface MusicApplication
+ (id)_defaultContentSizeCategory;
- (MusicApplication)init;
- (id)_extendLaunchTest;
@end

@implementation MusicApplication

- (MusicApplication)init
{
  return (MusicApplication *)Application.init()();
}

- (id)_extendLaunchTest
{
  NSString v2 = String._bridgeToObjectiveC()();

  return v2;
}

+ (id)_defaultContentSizeCategory
{
  swift_getObjCClassMetadata();
  UIContentSizeCategory v2 = static Application._defaultContentSizeCategory()();

  return v2;
}

- (void).cxx_destruct
{
  id v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MusicApplication__hasWipedDonation);
  swift_bridgeObjectRelease();
}

@end