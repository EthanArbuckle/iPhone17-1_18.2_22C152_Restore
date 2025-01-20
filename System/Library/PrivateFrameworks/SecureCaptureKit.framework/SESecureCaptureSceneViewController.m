@interface SESecureCaptureSceneViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)requestsIdleTimerDisabled;
- (FBScene)_scene;
- (LCSExtensionDescribing)extensionProvider;
- (SESecureCaptureSceneViewController)initWithCoder:(id)a3;
- (SESecureCaptureSceneViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (SESecureCaptureSceneViewController)initWithProvider:(id)a3;
- (SESecureCaptureSceneViewController)initWithProvider:(id)a3 launchActions:(id)a4;
- (SESecureCaptureSceneViewControllerDelegate)delegate;
- (unint64_t)presentationMode;
- (void)dealloc;
- (void)extensionAppProtectionAssistantShouldShieldDidChange:(id)a3;
- (void)invalidate;
- (void)scene:(id)a3 didReceiveActions:(id)a4;
- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
- (void)sceneContentStateDidChange:(id)a3;
- (void)sceneDidActivate:(id)a3;
- (void)sceneDidDeactivate:(id)a3 withError:(id)a4;
- (void)sceneDidInvalidate:(id)a3;
- (void)sceneLayerManagerDidStartTrackingLayers:(id)a3;
- (void)sceneLayerManagerDidStopTrackingLayers:(id)a3;
- (void)sceneLayerManagerDidUpdateLayers:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExtensionProvider:(id)a3;
- (void)setPresentationMode:(unint64_t)a3;
- (void)viewDidLoad;
@end

@implementation SESecureCaptureSceneViewController

- (FBScene)_scene
{
  return (FBScene *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR___SESecureCaptureSceneViewController_scene));
}

- (unint64_t)presentationMode
{
  if (*(_DWORD *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR___SESecureCaptureSceneViewController__presentationMode) < 3u)
    return *(unsigned int *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR___SESecureCaptureSceneViewController__presentationMode);
  v3 = self;
  unint64_t result = sub_25BF05A58();
  __break(1u);
  return result;
}

- (void)setPresentationMode:(unint64_t)a3
{
  if (a3 == 2) {
    int v3 = 2;
  }
  else {
    int v3 = a3 == 1;
  }
  v4 = self;
  BSDispatchQueueAssertMain();
  sub_25BEF7E50(v3, 0);
}

- (BOOL)requestsIdleTimerDisabled
{
  return *((unsigned char *)&self->super.super.super.isa
         + OBJC_IVAR___SESecureCaptureSceneViewController__requestsIdleTimerDisabled);
}

- (SESecureCaptureSceneViewControllerDelegate)delegate
{
  v2 = (char *)self + OBJC_IVAR___SESecureCaptureSceneViewController_delegate;
  swift_beginAccess();
  int v3 = (void *)MEMORY[0x261178580](v2);
  return (SESecureCaptureSceneViewControllerDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (LCSExtensionDescribing)extensionProvider
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();
  return (LCSExtensionDescribing *)v2;
}

- (void)setExtensionProvider:(id)a3
{
  v4 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___SESecureCaptureSceneViewController_extensionProvider);
  swift_beginAccess();
  id *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (SESecureCaptureSceneViewController)initWithProvider:(id)a3
{
  swift_unknownObjectRetain();
  if ((MEMORY[0x263F8EE78] & 0xC000000000000000) != 0 && sub_25BF059C8()) {
    sub_25BEF60B8(MEMORY[0x263F8EE78]);
  }
  sub_25BEED774(0, &qword_26A5824C8);
  sub_25BEED5A0();
  v5 = (void *)sub_25BF05668();
  swift_bridgeObjectRelease();
  v6 = [(SESecureCaptureSceneViewController *)self initWithProvider:a3 launchActions:v5];

  swift_unknownObjectRelease();
  return v6;
}

- (SESecureCaptureSceneViewController)initWithProvider:(id)a3 launchActions:(id)a4
{
  sub_25BEED774(0, &qword_26A5824C8);
  sub_25BEED5A0();
  uint64_t v4 = sub_25BF05678();
  uint64_t v5 = swift_unknownObjectRetain();
  v6 = (SESecureCaptureSceneViewController *)sub_25BEFF1B0(v5, v4);
  swift_unknownObjectRelease();
  return v6;
}

- (SESecureCaptureSceneViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  _sSo34SESecureCaptureSceneViewControllerC06SecureB3KitE5coderABSgSo7NSCoderC_tcfc_0();
}

- (void)dealloc
{
  sub_25BF05618();
  v4[2] = self;
  id v3 = self;
  sub_25BEF8CD0((uint64_t)sub_25BF008C0, (uint64_t)v4);
  v5.receiver = v3;
  v5.super_class = (Class)SESecureCaptureSceneViewController;
  [(SESecureCaptureSceneViewController *)&v5 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___SESecureCaptureSceneViewController_activatedSceneView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___SESecureCaptureSceneViewController_liveSceneSnapshotView));

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___SESecureCaptureSceneViewController_appProtectionAssistant));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___SESecureCaptureSceneViewController_appProtectionViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___SESecureCaptureSceneViewController____lazy_storage___clientSettingsDiffInspector));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___SESecureCaptureSceneViewController____lazy_storage___queue));
  sub_25BF00914((uint64_t)self + OBJC_IVAR___SESecureCaptureSceneViewController_delegate);
  swift_unknownObjectRelease();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v2 = self;
  BSDispatchQueueAssertMain();
  v3.receiver = v2;
  v3.super_class = (Class)SESecureCaptureSceneViewController;
  [(SESecureCaptureSceneViewController *)&v3 viewDidLoad];
  sub_25BEF9060();
  objc_msgSend(*(id *)((char *)&v2->super.super.super.isa + OBJC_IVAR___SESecureCaptureSceneViewController_appProtectionAssistant), sel_addObserver_, v2);
  sub_25BEF92CC();
}

- (void)invalidate
{
  v2 = self;
  SESecureCaptureSceneViewController.invalidate()();
}

- (SESecureCaptureSceneViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  unint64_t result = (SESecureCaptureSceneViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)sceneDidActivate:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  SESecureCaptureSceneViewController.sceneDidActivate(_:)(v4);
}

- (void)sceneDidInvalidate:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  _sSo34SESecureCaptureSceneViewControllerC06SecureB3KitE18sceneDidInvalidateyySo7FBSceneCF_0();
}

- (void)sceneDidDeactivate:(id)a3 withError:(id)a4
{
  id v6 = a3;
  v7 = self;
  id v8 = a4;
  SESecureCaptureSceneViewController.sceneDidDeactivate(_:withError:)(v6, a4);
}

- (void)sceneContentStateDidChange:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  SESecureCaptureSceneViewController.sceneContentStateDidChange(_:)(v4);
}

- (void)scene:(id)a3 didReceiveActions:(id)a4
{
  sub_25BEED774(0, &qword_26A5824C8);
  sub_25BEED5A0();
  uint64_t v6 = sub_25BF05678();
  id v7 = a3;
  id v8 = self;
  sub_25BEFF5AC(v6);

  swift_bridgeObjectRelease();
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = self;
  _sSo34SESecureCaptureSceneViewControllerC06SecureB3KitE5scene_27didUpdateClientSettingsWith03oldkL017transitionContextySo7FBSceneC_So08FBSScenekL4DiffCSo0rkL0CSo0r10TransitionP0CSgtF_0(v10, v11);
}

- (void)sceneLayerManagerDidUpdateLayers:(id)a3
{
}

- (void)sceneLayerManagerDidStopTrackingLayers:(id)a3
{
}

- (void)sceneLayerManagerDidStartTrackingLayers:(id)a3
{
}

- (void)extensionAppProtectionAssistantShouldShieldDidChange:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  _sSo34SESecureCaptureSceneViewControllerC06SecureB3KitE52extensionAppProtectionAssistantShouldShieldDidChangeyySo012LCSExtensionijK0CF_0();
}

@end