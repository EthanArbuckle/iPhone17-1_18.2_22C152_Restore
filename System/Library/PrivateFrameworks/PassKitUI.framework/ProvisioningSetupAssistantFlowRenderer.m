@interface ProvisioningSetupAssistantFlowRenderer
- (PKUIFlowManagerRendererDelegate)flowDelegate;
- (id)createChildRenderer;
- (id)navViewControllers;
- (id)rootViewController;
- (void)dismissWithViewController:(id)a3 animated:(BOOL)a4;
- (void)presentWithViewController:(id)a3 animated:(BOOL)a4;
- (void)pushWithViewController:(id)a3 animated:(BOOL)a4;
- (void)setFlowDelegate:(id)a3;
- (void)setViewControllers:(id)a3 animated:(BOOL)a4;
@end

@implementation ProvisioningSetupAssistantFlowRenderer

- (PKUIFlowManagerRendererDelegate)flowDelegate
{
  v2 = (void *)MEMORY[0x1A6224F80](self->flowDelegate, a2);

  return (PKUIFlowManagerRendererDelegate *)v2;
}

- (void)setFlowDelegate:(id)a3
{
}

- (void)pushWithViewController:(id)a3 animated:(BOOL)a4
{
  id v5 = a3;
  sub_1A03ADE18();
  sub_19F63DE74(v5, a4);

  swift_release();
}

- (void)presentWithViewController:(id)a3 animated:(BOOL)a4
{
  id v4 = a3;
  sub_1A03ADE18();
  sub_19F63F428(v4);

  swift_release();
}

- (void)dismissWithViewController:(id)a3 animated:(BOOL)a4
{
  id v4 = *(void **)self->navController;
  if (v4) {
    objc_msgSend(v4, sel_dismissWithViewController_animated_, a3, a4);
  }
}

- (id)navViewControllers
{
  swift_beginAccess();
  sub_19F48BAC4(0, (unint64_t *)&qword_1E94A3910);
  sub_1A03AE138();
  v2 = (void *)sub_1A03B4C38();
  swift_bridgeObjectRelease();

  return v2;
}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  sub_19F48BAC4(0, (unint64_t *)&qword_1E94A3910);
  unint64_t v5 = sub_1A03B4C58();
  sub_1A03ADE18();
  sub_19F63E090(v5, v4);
  swift_release();

  swift_bridgeObjectRelease();
}

- (id)createChildRenderer
{
  id v2 = objc_allocWithZone(MEMORY[0x1E4FB19E8]);
  sub_1A03ADE18();
  id v3 = objc_msgSend(v2, sel_init);
  swift_release();

  return v3;
}

- (id)rootViewController
{
  id v2 = *(void **)self->navController;
  if (v2)
  {
    sub_1A03ADE18();
    id v3 = v2;
  }
  else
  {
    id v4 = objc_allocWithZone(MEMORY[0x1E4FB19E8]);
    sub_1A03ADE18();
    id v3 = objc_msgSend(v4, sel_init);
  }
  id v5 = v2;
  swift_release();

  return v3;
}

@end