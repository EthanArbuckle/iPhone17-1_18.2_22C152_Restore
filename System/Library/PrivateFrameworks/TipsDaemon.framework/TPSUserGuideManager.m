@interface TPSUserGuideManager
+ (id)userGuides;
- (TPSUserGuideManager)init;
@end

@implementation TPSUserGuideManager

+ (id)userGuides
{
  _s10TipsDaemon16UserGuideManagerC10userGuidesSay0A4Core0cD0CGyFZ_0();
  sub_1E451B798();
  v2 = (void *)sub_1E451B938();
  swift_bridgeObjectRelease();

  return v2;
}

- (TPSUserGuideManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(TPSUserGuideManager *)&v3 init];
}

@end