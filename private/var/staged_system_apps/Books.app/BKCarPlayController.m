@interface BKCarPlayController
- (BKCarPlayController)init;
- (void)dealloc;
- (void)templateApplicationScene:(id)a3 didConnectInterfaceController:(id)a4;
- (void)templateApplicationScene:(id)a3 didDisconnectInterfaceController:(id)a4;
- (void)templateWillAppear:(id)a3 animated:(BOOL)a4;
- (void)templateWillDisappear:(id)a3 animated:(BOOL)a4;
@end

@implementation BKCarPlayController

- (void)dealloc
{
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BKCarPlayController_acknowledgementObservation);
  if (v3)
  {
    v4 = self;
    v5 = self;
    swift_unknownObjectRetain();
    id v6 = [v4 defaultCenter];
    [v6 removeObserver:v3];
    swift_unknownObjectRelease();
  }
  else
  {
    v7 = self;
  }
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for CarPlayController();
  [(BKCarPlayController *)&v8 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

- (BKCarPlayController)init
{
  return (BKCarPlayController *)CarPlayController.init()();
}

- (void)templateApplicationScene:(id)a3 didConnectInterfaceController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = self;
  CarPlayController.templateApplicationScene(_:didConnect:)((CPTemplateApplicationScene)v6, (CPInterfaceController)v7);
}

- (void)templateApplicationScene:(id)a3 didDisconnectInterfaceController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = self;
  _s5Books17CarPlayControllerC24templateApplicationScene_022didDisconnectInterfaceD0ySo010CPTemplatefG0C_So011CPInterfaceD0CtF_0();
}

- (void)templateWillAppear:(id)a3 animated:(BOOL)a4
{
  id v5 = a3;
  id v6 = self;
  _s5Books17CarPlayControllerC18templateWillAppear_8animatedySo10CPTemplateC_SbtF_0(v5);
}

- (void)templateWillDisappear:(id)a3 animated:(BOOL)a4
{
  id v5 = a3;
  id v6 = self;
  _s5Books17CarPlayControllerC21templateWillDisappear_8animatedySo10CPTemplateC_SbtF_0(v5);
}

@end