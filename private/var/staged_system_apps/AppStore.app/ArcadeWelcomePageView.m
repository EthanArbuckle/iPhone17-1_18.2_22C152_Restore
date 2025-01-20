@interface ArcadeWelcomePageView
@end

@implementation ArcadeWelcomePageView

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore21ArcadeWelcomePageView_arcadeWelcomeContentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore21ArcadeWelcomePageView_familyButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore21ArcadeWelcomePageView_continueButton));
  v3 = (char *)self + OBJC_IVAR____TtC8AppStore21ArcadeWelcomePageView_delegate;

  sub_100092F18((uint64_t)v3);
}

@end