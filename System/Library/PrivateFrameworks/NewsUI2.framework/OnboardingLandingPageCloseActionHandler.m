@interface OnboardingLandingPageCloseActionHandler
- (_TtC7NewsUI239OnboardingLandingPageCloseActionHandler)init;
- (void)handleCloseActionOnPresenter:(id)a3;
@end

@implementation OnboardingLandingPageCloseActionHandler

- (void)handleCloseActionOnPresenter:(id)a3
{
  if (MEMORY[0x1E01EFB70]((char *)self + OBJC_IVAR____TtC7NewsUI239OnboardingLandingPageCloseActionHandler_delegate, a2))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    v4 = self;
    sub_1DFDEF540();
    swift_unknownObjectRelease();

    swift_unknownObjectRelease();
  }
}

- (_TtC7NewsUI239OnboardingLandingPageCloseActionHandler)init
{
  result = (_TtC7NewsUI239OnboardingLandingPageCloseActionHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end