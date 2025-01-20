@interface ICMediaActionMenu
+ (ICMediaActionMenu)menuWithIsCameraAvailable:(BOOL)a3 isLiveTextAvailable:(BOOL)a4 isPasswordProtected:(BOOL)a5 isInSecureScreen:(BOOL)a6 presentingViewController:(id)a7 presentingBarButtonItem:(id)a8 presentingSourceView:(id)a9 deferredChildren:(BOOL)a10 sidecarMenuController:(id)a11 completion:(id)a12;
+ (ICMediaActionMenu)menuWithIsPasswordProtected:(BOOL)a3 isInSecureScreen:(BOOL)a4 presentingViewController:(id)a5 presentingBarButtonItem:(id)a6 presentingSourceView:(id)a7 sidecarMenuController:(id)a8 completion:(id)aBlock;
- (BOOL)hasSidecarMenuItems;
- (BOOL)isCameraAvailable;
- (BOOL)isInSecureScreen;
- (BOOL)isLiveTextAvailable;
- (BOOL)isPasswordProtected;
- (ICMediaActionMenu)init;
- (ICMediaActionMenu)initWithIsCameraAvailable:(BOOL)a3 isLiveTextAvailable:(BOOL)a4 isPasswordProtected:(BOOL)a5 isInSecureScreen:(BOOL)a6 presentingViewController:(id)a7 presentingBarButtonItem:(id)a8 presentingSourceView:(id)a9 sidecarMenuController:(id)a10 completion:(id)aBlock;
- (ICMediaActionMenu)initWithIsPasswordProtected:(BOOL)a3 isInSecureScreen:(BOOL)a4 presentingViewController:(id)a5 presentingBarButtonItem:(id)a6 presentingSourceView:(id)a7 sidecarMenuController:(id)a8 completion:(id)aBlock;
- (ICSidecarInsertMenuController)sidecarMenuController;
- (UIBarButtonItem)presentingBarButtonItem;
- (UIView)presentingSourceView;
- (UIViewController)presentingViewController;
- (id)completion;
- (id)makeMenu;
- (id)menuSections;
- (void)setCompletion:(id)a3;
- (void)setPresentingBarButtonItem:(id)a3;
- (void)setPresentingSourceView:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setSidecarMenuController:(id)a3;
- (void)willShowMenu;
@end

@implementation ICMediaActionMenu

- (BOOL)isCameraAvailable
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___ICMediaActionMenu_isCameraAvailable);
}

- (BOOL)isLiveTextAvailable
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___ICMediaActionMenu_isLiveTextAvailable);
}

- (BOOL)isPasswordProtected
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___ICMediaActionMenu_isPasswordProtected);
}

- (BOOL)isInSecureScreen
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___ICMediaActionMenu_isInSecureScreen);
}

- (UIView)presentingSourceView
{
  return (UIView *)sub_20C010C94((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICMediaActionMenu_presentingSourceView);
}

- (void)setPresentingSourceView:(id)a3
{
}

- (BOOL)hasSidecarMenuItems
{
  v2 = self;
  char v3 = sub_20C01C230();

  return v3 & 1;
}

- (ICSidecarInsertMenuController)sidecarMenuController
{
  return (ICSidecarInsertMenuController *)sub_20C010C94((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICMediaActionMenu_sidecarMenuController);
}

- (void)setSidecarMenuController:(id)a3
{
}

- (ICMediaActionMenu)initWithIsPasswordProtected:(BOOL)a3 isInSecureScreen:(BOOL)a4 presentingViewController:(id)a5 presentingBarButtonItem:(id)a6 presentingSourceView:(id)a7 sidecarMenuController:(id)a8 completion:(id)aBlock
{
  v15 = (uint64_t (*)())_Block_copy(aBlock);
  if (v15)
  {
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = v15;
    v15 = sub_20C01FB68;
  }
  else
  {
    uint64_t v16 = 0;
  }
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  return (ICMediaActionMenu *)MediaActionMenu.init(isPasswordProtected:isInSecureScreen:presentingViewController:presentingBarButtonItem:presentingSourceView:sidecarMenuController:completion:)(a3, a4, v17, a6, a7, a8, (uint64_t)v15, v16);
}

- (ICMediaActionMenu)initWithIsCameraAvailable:(BOOL)a3 isLiveTextAvailable:(BOOL)a4 isPasswordProtected:(BOOL)a5 isInSecureScreen:(BOOL)a6 presentingViewController:(id)a7 presentingBarButtonItem:(id)a8 presentingSourceView:(id)a9 sidecarMenuController:(id)a10 completion:(id)aBlock
{
  v14 = (uint64_t (*)())_Block_copy(aBlock);
  if (v14)
  {
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = v14;
    v14 = sub_20C01FB68;
  }
  else
  {
    uint64_t v15 = 0;
  }
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  id v19 = a10;
  id v20 = (ICMediaActionMenu *)sub_20C01F314(a3, a4, a5, a6, (uint64_t)v16, a8, (uint64_t)a9, (uint64_t)a10, (uint64_t)v14, v15);
  sub_20BFCDA14((uint64_t)v14);

  return v20;
}

+ (ICMediaActionMenu)menuWithIsCameraAvailable:(BOOL)a3 isLiveTextAvailable:(BOOL)a4 isPasswordProtected:(BOOL)a5 isInSecureScreen:(BOOL)a6 presentingViewController:(id)a7 presentingBarButtonItem:(id)a8 presentingSourceView:(id)a9 deferredChildren:(BOOL)a10 sidecarMenuController:(id)a11 completion:(id)a12
{
  v14 = _Block_copy(a12);
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = v15;
    id v17 = sub_20C01FB68;
  }
  else
  {
    id v17 = 0;
    uint64_t v16 = 0;
  }
  id v18 = objc_allocWithZone((Class)type metadata accessor for MediaActionMenu());
  id v19 = a7;
  id v25 = a8;
  id v20 = a9;
  id v21 = a11;
  sub_20BFD8C2C((uint64_t)v17);
  id v22 = sub_20C01F314(a3, a4, a5, a6, (uint64_t)v19, a8, (uint64_t)a9, (uint64_t)a11, (uint64_t)v17, v16);
  sub_20BFCDA14((uint64_t)v17);
  sub_20C01F518();
  v23 = (void *)sub_20C1605A0();

  sub_20BFCDA14((uint64_t)v17);

  return (ICMediaActionMenu *)v23;
}

+ (ICMediaActionMenu)menuWithIsPasswordProtected:(BOOL)a3 isInSecureScreen:(BOOL)a4 presentingViewController:(id)a5 presentingBarButtonItem:(id)a6 presentingSourceView:(id)a7 sidecarMenuController:(id)a8 completion:(id)aBlock
{
  v13 = _Block_copy(aBlock);
  if (v13)
  {
    v14 = v13;
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = v14;
    v34 = sub_20C01FB68;
  }
  else
  {
    v34 = 0;
    uint64_t v15 = 0;
  }
  uint64_t v16 = self;
  id v17 = a5;
  id v18 = a6;
  id v30 = a7;
  id v29 = a8;
  char v31 = objc_msgSend(v16, sel_isCameraAvailable);
  id v28 = a6;
  char v19 = objc_msgSend(self, sel_ic_isLiveTextAvailable);
  id v20 = objc_allocWithZone((Class)type metadata accessor for MediaActionMenu());
  id v21 = v17;
  id v22 = v18;
  id v23 = v30;
  id v24 = v29;
  sub_20BFD8C2C((uint64_t)v34);
  id v25 = sub_20C01F314(v31, v19, a3, a4, (uint64_t)v21, v28, (uint64_t)a7, (uint64_t)a8, (uint64_t)v34, v15);
  sub_20BFCDA14((uint64_t)v34);

  sub_20C01F518();
  v26 = (void *)sub_20C1605A0();

  sub_20BFCDA14((uint64_t)v34);

  return (ICMediaActionMenu *)v26;
}

- (id)completion
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___ICMediaActionMenu_completion);
  swift_beginAccess();
  if (*v2)
  {
    uint64_t v3 = v2[1];
    aBlock[4] = *v2;
    aBlock[5] = v3;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_20C01C598;
    aBlock[3] = &block_descriptor_59_0;
    v4 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_20C01FAAC;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___ICMediaActionMenu_completion);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_20BFCDA14(v7);
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)sub_20C010C94((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICMediaActionMenu_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
}

- (UIBarButtonItem)presentingBarButtonItem
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___ICMediaActionMenu_presentingBarButtonItem);
  swift_beginAccess();
  return (UIBarButtonItem *)*v2;
}

- (void)setPresentingBarButtonItem:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___ICMediaActionMenu_presentingBarButtonItem);
  swift_beginAccess();
  uint64_t v5 = *v4;
  void *v4 = a3;
  id v6 = a3;
}

- (id)menuSections
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AD81370);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_20C17B030;
  v4 = self;
  *(void *)(v3 + 32) = sub_20C01D96C();
  sub_20C162D20();

  sub_20BFCEE58(0, (unint64_t *)&qword_2676BBC20);
  uint64_t v5 = (void *)sub_20C162CE0();
  swift_bridgeObjectRelease();

  return v5;
}

- (void)willShowMenu
{
  uint64_t v3 = (char *)self + OBJC_IVAR___ICMediaActionMenu_presentingViewController;
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x210546B30](v3);
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    self;
    uint64_t v6 = swift_dynamicCastObjCClass();
    if (v6)
    {
      uint64_t v7 = (void *)v6;
      v8 = self;
      objc_msgSend(v7, sel_addNewNoteIfNeeded);
    }
  }
}

- (id)makeMenu
{
  type metadata accessor for MediaActionMenu();
  sub_20C01F518();
  uint64_t v3 = self;
  uint64_t v4 = (void *)sub_20C1605A0();

  return v4;
}

- (ICMediaActionMenu)init
{
  result = (ICMediaActionMenu *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  sub_20BFCDA14(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___ICMediaActionMenu_completion));
  swift_unknownObjectWeakDestroy();
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICMediaActionMenu_presentingBarButtonItem);
}

@end