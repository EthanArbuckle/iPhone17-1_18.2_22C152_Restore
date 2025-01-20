@interface MOOnboardingManagerUI
- (_TtC28MomentsOnboardingAndSettings21MOOnboardingManagerUI)init;
- (id)createSheetOnboardingViewController;
- (id)createSheetOnboardingViewControllerWith:(id)a3;
@end

@implementation MOOnboardingManagerUI

- (id)createSheetOnboardingViewController
{
  v3 = (objc_class *)type metadata accessor for MOOnboardingNavigationController();
  v4 = (char *)objc_allocWithZone(v3);
  v5 = &v4[OBJC_IVAR____TtC28MomentsOnboardingAndSettings32MOOnboardingNavigationController_onboardingDelegate];
  *(void *)&v4[OBJC_IVAR____TtC28MomentsOnboardingAndSettings32MOOnboardingNavigationController_onboardingDelegate] = 0;
  swift_beginAccess();
  *(void *)v5 = 0;
  v6 = self;
  swift_unknownObjectRelease();
  id v7 = objc_allocWithZone((Class)type metadata accessor for MOOnboardingViewController());
  v8 = MOOnboardingViewController.init()();
  (*(void (**)(void))((*MEMORY[0x263F8EED0] & *v8) + 0x88))(0);
  v11.receiver = v4;
  v11.super_class = v3;
  v9 = [(MOOnboardingManagerUI *)&v11 initWithRootViewController:v8];

  return v9;
}

- (id)createSheetOnboardingViewControllerWith:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  id v6 = specialized MOOnboardingManagerUI.createSheetOnboardingViewController(with:)((uint64_t)a3);
  swift_unknownObjectRelease();

  return v6;
}

- (_TtC28MomentsOnboardingAndSettings21MOOnboardingManagerUI)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MOOnboardingManagerUI();
  return [(MOOnboardingManagerUI *)&v3 init];
}

@end