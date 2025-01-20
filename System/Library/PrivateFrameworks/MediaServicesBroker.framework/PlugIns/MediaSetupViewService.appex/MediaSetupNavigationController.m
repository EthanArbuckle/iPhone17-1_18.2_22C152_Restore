@interface MediaSetupNavigationController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (BOOL)presentationControllerShouldDismiss:(id)a3;
- (MediaSetupNavigationController)initWithCoder:(id)a3;
- (MediaSetupNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (MediaSetupNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (MediaSetupNavigationController)initWithRootViewController:(id)a3;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (void)_willAppearInRemoteViewController;
- (void)beginRequestWithExtensionContext:(id)a3;
- (void)presentationControllerDidAttemptToDismiss:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)presentationControllerWillDismiss:(id)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation MediaSetupNavigationController

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v4 = a3;
  v8 = self;
  v5 = sub_100029850();
  os_log_type_t v6 = sub_100029A90();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Begin extension request", v7, 2u);
    swift_slowDealloc();
  }

  sub_1000116E0(v4);
}

- (void)_willAppearInRemoteViewController
{
  v2 = self;
  sub_100011F54();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100012304();
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___MediaSetupNavigationController_setupSession);
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___MediaSetupNavigationController_setupSession) = 0;
  v5 = self;

  *((unsigned char *)&v5->super.super.super.super.isa + OBJC_IVAR___MediaSetupNavigationController_waiting) = 0;
  sub_100011364();
  v6.receiver = v5;
  v6.super_class = (Class)type metadata accessor for MediaSetupNavigationController();
  [(MediaSetupNavigationController *)&v6 viewWillDisappear:v3];
}

- (MediaSetupNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  if (!a3)
  {
    uint64_t ObjCClassMetadata = 0;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0;
    return (MediaSetupNavigationController *)sub_100012670(ObjCClassMetadata, v6);
  }
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = swift_getObjCClassMetadata();
  return (MediaSetupNavigationController *)sub_100012670(ObjCClassMetadata, v6);
}

- (MediaSetupNavigationController)initWithRootViewController:(id)a3
{
  id v3 = a3;
  id v4 = (MediaSetupNavigationController *)sub_100017834((uint64_t)v3);

  return v4;
}

- (MediaSetupNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_100029960();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (MediaSetupNavigationController *)sub_1000128A8(v5, v7, a4);
}

- (MediaSetupNavigationController)initWithCoder:(id)a3
{
  return (MediaSetupNavigationController *)sub_100012AC4(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___MediaSetupNavigationController_serviceAccount));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___MediaSetupNavigationController_setupSession));
  sub_1000101B8(*(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___MediaSetupNavigationController_stepContext), *(void *)&self->hostBundleID[OBJC_IVAR___MediaSetupNavigationController_stepContext], *(void *)&self->hostBundleID[OBJC_IVAR___MediaSetupNavigationController_stepContext + 8], *(void **)&self->serviceAccount[OBJC_IVAR___MediaSetupNavigationController_stepContext], *(void *)&self->setupSession[OBJC_IVAR___MediaSetupNavigationController_stepContext], *(void *)&self->stepContext[OBJC_IVAR___MediaSetupNavigationController_stepContext], *(void *)&self->stepContext[OBJC_IVAR___MediaSetupNavigationController_stepContext + 8], *(void *)&self->stepContext[OBJC_IVAR___MediaSetupNavigationController_stepContext + 16]);
  id v3 = (char *)self + OBJC_IVAR___MediaSetupNavigationController_log;
  uint64_t v4 = sub_100029870();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___MediaSetupNavigationController_vcAccountMismatch));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___MediaSetupNavigationController_vcAddToHome));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___MediaSetupNavigationController_vcMultiHomeCustomize));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___MediaSetupNavigationController_vcLearnMore));
  uint64_t v5 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___MediaSetupNavigationController_vcSoftwareUpdate);
}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_100017ADC(0xD00000000000002DLL, 0x800000010002C090);
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_100017ADC(0xD000000000000024, 0x800000010002C060);
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  LOBYTE(self) = sub_1000179A0();

  return self & 1;
}

- (void)presentationControllerWillDismiss:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_100017ADC(0xD000000000000025, 0x800000010002C000);
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return 2;
}

+ (id)_exportedInterface
{
  return sub_100015ADC((uint64_t)a1, (uint64_t)a2, &protocolRef_MSRemoteViewServiceProtocol);
}

+ (id)_remoteViewControllerInterface
{
  return sub_100015ADC((uint64_t)a1, (uint64_t)a2, &protocolRef_MSViewServiceHostProtocol);
}

@end