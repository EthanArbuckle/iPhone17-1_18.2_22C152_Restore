@interface JSRestrictionsController
- (JSValue)areMoviesRestricted;
- (JSValue)areMusicVideosRestricted;
- (JSValue)isExplicitContentRestricted;
- (JSValue)isSocialDisabled;
- (JSValue)isSubscriptionContentRestricted;
- (JSValue)isTVRestricted;
- (_TtC7MusicUI24JSRestrictionsController)init;
- (void)setAreMusicVideosRestricted:(id)a3;
@end

@implementation JSRestrictionsController

- (JSValue)isExplicitContentRestricted
{
  v2 = self;
  v3 = (void *)sub_2294D28CC();

  return (JSValue *)v3;
}

- (JSValue)areMusicVideosRestricted
{
  v2 = self;
  v3 = (void *)sub_2294D2924();

  return (JSValue *)v3;
}

- (void)setAreMusicVideosRestricted:(id)a3
{
  id v4 = a3;
  v5 = self;
}

- (JSValue)isTVRestricted
{
  v2 = self;
  v3 = (void *)sub_2294D29F4();

  return (JSValue *)v3;
}

- (JSValue)areMoviesRestricted
{
  v2 = self;
  v3 = (void *)sub_2294D2A4C();

  return (JSValue *)v3;
}

- (JSValue)isSocialDisabled
{
  v2 = self;
  v3 = (void *)sub_2294D2AA4();

  return (JSValue *)v3;
}

- (JSValue)isSubscriptionContentRestricted
{
  v2 = self;
  v3 = (void *)sub_2294D2AFC();

  return (JSValue *)v3;
}

- (_TtC7MusicUI24JSRestrictionsController)init
{
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7MusicUI24JSRestrictionsController_restrictionsController));

  swift_release();
}

@end