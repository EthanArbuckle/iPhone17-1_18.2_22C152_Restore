@interface CHOnboardingNavigationController
- (CHOnboardingNavigationController)initWithCoder:(id)a3;
- (CHOnboardingNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (CHOnboardingNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (CHOnboardingNavigationController)initWithRootViewController:(id)a3;
- (id)activePairingDevice;
- (id)buddyControllerDoneAction;
- (id)setupFlowUserInfo;
- (unint64_t)supportedInterfaceOrientations;
- (void)buddyControllerDone:(id)a3;
- (void)buddyControllerDone:(id)a3 nextControllerClass:(Class)a4;
- (void)setBuddyControllerDoneAction:(id)a3;
@end

@implementation CHOnboardingNavigationController

- (id)buddyControllerDoneAction
{
  if (*(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___CHOnboardingNavigationController_buddyControllerDoneAction))
  {
    uint64_t v2 = *(void *)&self->buddyControllerDoneAction[OBJC_IVAR___CHOnboardingNavigationController_buddyControllerDoneAction];
    v5[4] = *(Class *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHOnboardingNavigationController_buddyControllerDoneAction);
    v5[5] = v2;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 1107296256;
    v5[2] = sub_100070394;
    v5[3] = &unk_1008BF498;
    v3 = _Block_copy(v5);
    swift_retain();
    swift_release();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)setBuddyControllerDoneAction:(id)a3
{
  uint64_t v4 = (uint64_t)_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v5;
    v6 = sub_1001A7D48;
  }
  else
  {
    v6 = 0;
  }
  v7 = (uint64_t (**)())((char *)self + OBJC_IVAR___CHOnboardingNavigationController_buddyControllerDoneAction);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR___CHOnboardingNavigationController_buddyControllerDoneAction);
  *v7 = v6;
  v7[1] = (uint64_t (*)())v4;

  sub_10005E5F8(v8);
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (CHOnboardingNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  v7 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR___CHOnboardingNavigationController_buddyControllerDoneAction);
  uint64_t v8 = (objc_class *)type metadata accessor for OnboardingNavigationController();
  void *v7 = 0;
  v7[1] = 0;
  v10.receiver = self;
  v10.super_class = v8;
  return [(CHOnboardingNavigationController *)&v10 initWithNavigationBarClass:a3 toolbarClass:a4];
}

- (CHOnboardingNavigationController)initWithRootViewController:(id)a3
{
  uint64_t v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR___CHOnboardingNavigationController_buddyControllerDoneAction);
  v6 = (objc_class *)type metadata accessor for OnboardingNavigationController();
  *uint64_t v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return [(CHOnboardingNavigationController *)&v8 initWithRootViewController:a3];
}

- (CHOnboardingNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    v6 = (Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR___CHOnboardingNavigationController_buddyControllerDoneAction);
    void *v6 = 0;
    v6[1] = 0;
    id v7 = a4;
    NSString v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = (Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR___CHOnboardingNavigationController_buddyControllerDoneAction);
    void *v9 = 0;
    v9[1] = 0;
    id v10 = a4;
    NSString v8 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for OnboardingNavigationController();
  v11 = [(CHOnboardingNavigationController *)&v13 initWithNibName:v8 bundle:a4];

  return v11;
}

- (CHOnboardingNavigationController)initWithCoder:(id)a3
{
  uint64_t v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR___CHOnboardingNavigationController_buddyControllerDoneAction);
  v6 = (objc_class *)type metadata accessor for OnboardingNavigationController();
  *uint64_t v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return [(CHOnboardingNavigationController *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
  sub_10005E5F8(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR___CHOnboardingNavigationController_buddyControllerDoneAction));
}

- (id)activePairingDevice
{
  return 0;
}

- (id)setupFlowUserInfo
{
  return 0;
}

- (void)buddyControllerDone:(id)a3
{
  v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR___CHOnboardingNavigationController_buddyControllerDoneAction);
  if (v3)
  {
    swift_unknownObjectRetain();
    v6 = self;
    uint64_t v5 = sub_10008A670((uint64_t)v3);
    v3(v5);
    sub_10005E5F8((uint64_t)v3);
    swift_unknownObjectRelease();
  }
}

- (void)buddyControllerDone:(id)a3 nextControllerClass:(Class)a4
{
  uint64_t v4 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR___CHOnboardingNavigationController_buddyControllerDoneAction);
  if (v4)
  {
    swift_unknownObjectRetain();
    id v7 = self;
    uint64_t v6 = sub_10008A670((uint64_t)v4);
    v4(v6);
    sub_10005E5F8((uint64_t)v4);
    swift_unknownObjectRelease();
  }
}

@end