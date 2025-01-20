@interface ICSidecarInsertMenuController
- (CGRect)presentingSourceRect;
- (ICSidecarInsertMenuController)init;
- (UIView)presentingSourceView;
- (UIViewController)presentingViewController;
- (id)didReceiveItems;
- (id)menu;
- (id)menuDidChange;
- (void)cancel;
- (void)dealloc;
- (void)setDidReceiveItems:(id)a3;
- (void)setMenuDidChange:(id)a3;
- (void)setPresentingSourceRect:(CGRect)a3;
- (void)setPresentingSourceView:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)sidecarDevicesDidChange:(id)a3;
@end

@implementation ICSidecarInsertMenuController

- (UIViewController)presentingViewController
{
  return (UIViewController *)sub_20C010C94((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICSidecarInsertMenuController_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
}

- (UIView)presentingSourceView
{
  return (UIView *)sub_20C010C94((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICSidecarInsertMenuController_presentingSourceView);
}

- (void)setPresentingSourceView:(id)a3
{
}

- (CGRect)presentingSourceRect
{
  v2 = (double *)((char *)self + OBJC_IVAR___ICSidecarInsertMenuController_presentingSourceRect);
  swift_beginAccess();
  double v3 = *v2;
  double v4 = v2[1];
  double v5 = v2[2];
  double v6 = v2[3];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)setPresentingSourceRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v7 = (CGFloat *)((char *)self + OBJC_IVAR___ICSidecarInsertMenuController_presentingSourceRect);
  swift_beginAccess();
  CGFloat *v7 = x;
  v7[1] = y;
  v7[2] = width;
  v7[3] = height;
}

- (ICSidecarInsertMenuController)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  type metadata accessor for SidecarProvider();
  uint64_t v3 = swift_allocObject();
  *(unsigned char *)(v3 + 16) = 0;
  *(void *)(v3 + 24) = 0;
  *(void *)(v3 + 32) = 0;
  double v4 = (ICSidecarInsertMenuController *)sub_20C03FB14(v3, (char *)objc_allocWithZone(ObjectType));
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v4;
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  double v4 = self;
  double v5 = self;
  id v6 = objc_msgSend(v4, sel_defaultCenter);
  objc_msgSend(v6, sel_removeObserver_, v5);

  v7.receiver = v5;
  v7.super_class = ObjectType;
  [(ICSidecarInsertMenuController *)&v7 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)self + OBJC_IVAR___ICSidecarInsertMenuController_serviceProvider);
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_release();
  sub_20BFCDA14(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___ICSidecarInsertMenuController_menuDidChange));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___ICSidecarInsertMenuController_didReceiveItems);

  sub_20BFCDA14(v3);
}

- (id)menuDidChange
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___ICSidecarInsertMenuController_menuDidChange);
  swift_beginAccess();
  if (*v2)
  {
    uint64_t v3 = v2[1];
    aBlock[4] = *v2;
    aBlock[5] = v3;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_20BF982EC;
    aBlock[3] = &block_descriptor_22;
    double v4 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
  }
  else
  {
    double v4 = 0;
  }

  return v4;
}

- (void)setMenuDidChange:(id)a3
{
  double v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    double v4 = sub_20BFD9168;
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = (uint64_t *)((char *)self + OBJC_IVAR___ICSidecarInsertMenuController_menuDidChange);
  swift_beginAccess();
  uint64_t v7 = *v6;
  *id v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_20BFCDA14(v7);
}

- (id)menu
{
  v2 = self;
  inserted = (void *)SidecarInsertMenuController.menu()();

  return inserted;
}

- (void)cancel
{
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = self;
  double v4 = self;
  sub_20C03EBE8((void (*)(void))sub_20C0406CC, v3);

  swift_release();
}

- (id)didReceiveItems
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___ICSidecarInsertMenuController_didReceiveItems);
  swift_beginAccess();
  if (*v2)
  {
    uint64_t v3 = v2[1];
    aBlock[4] = *v2;
    aBlock[5] = v3;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_20C03F084;
    aBlock[3] = &block_descriptor_15;
    double v4 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
  }
  else
  {
    double v4 = 0;
  }

  return v4;
}

- (void)setDidReceiveItems:(id)a3
{
  double v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    double v4 = sub_20C040164;
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = (uint64_t *)((char *)self + OBJC_IVAR___ICSidecarInsertMenuController_didReceiveItems);
  swift_beginAccess();
  uint64_t v7 = *v6;
  *id v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_20BFCDA14(v7);
}

- (void)sidecarDevicesDidChange:(id)a3
{
  uint64_t v4 = sub_20C15F200();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20C15F1D0();
  v8 = self;
  sub_20C03F868();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end