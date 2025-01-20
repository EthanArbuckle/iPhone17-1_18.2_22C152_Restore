@interface ICTableActionMenu
+ (ICTableActionMenu)menuWithTableAttachmentViewController:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 completion:(id)a6;
+ (ICTableActionMenu)menuWithTableAttachmentViewController:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 deferredChildren:(BOOL)a6 completion:(id)a7;
- (ICTableActionMenu)init;
- (ICTableActionMenu)initWithTableAttachmentViewController:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 completion:(id)a6;
- (ICTableAttachmentViewController)tableAttachmentViewController;
- (UIBarButtonItem)presentingBarButtonItem;
- (UIViewController)presentingViewController;
- (id)completion;
- (id)makeMenu;
- (id)menuSections;
- (void)setCompletion:(id)a3;
- (void)setPresentingBarButtonItem:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setTableAttachmentViewController:(id)a3;
@end

@implementation ICTableActionMenu

- (ICTableAttachmentViewController)tableAttachmentViewController
{
  return (ICTableAttachmentViewController *)sub_20C010C94((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICTableActionMenu_tableAttachmentViewController);
}

- (void)setTableAttachmentViewController:(id)a3
{
}

- (ICTableActionMenu)initWithTableAttachmentViewController:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 completion:(id)a6
{
  v9 = (uint64_t (*)())_Block_copy(a6);
  if (v9)
  {
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = v9;
    v9 = sub_20C0481EC;
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = (ICTableActionMenu *)sub_20C047B9C((uint64_t)a3, (uint64_t)v12, a5, (uint64_t)v9, v10);
  sub_20BFCDA14((uint64_t)v9);

  return v14;
}

+ (ICTableActionMenu)menuWithTableAttachmentViewController:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 deferredChildren:(BOOL)a6 completion:(id)a7
{
  uint64_t v10 = (uint64_t (*)())_Block_copy(a7);
  if (v10)
  {
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v10;
    uint64_t v10 = sub_20C0481EC;
  }
  else
  {
    uint64_t v11 = 0;
  }
  id v12 = objc_allocWithZone((Class)type metadata accessor for TableActionMenu());
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  sub_20BFD8C2C((uint64_t)v10);
  id v16 = sub_20C047B9C((uint64_t)a3, (uint64_t)v14, a5, (uint64_t)v10, v11);
  sub_20BFCDA14((uint64_t)v10);
  sub_20C047D24();
  v17 = (void *)sub_20C1605A0();

  sub_20BFCDA14((uint64_t)v10);

  return (ICTableActionMenu *)v17;
}

+ (ICTableActionMenu)menuWithTableAttachmentViewController:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 completion:(id)a6
{
  v9 = (uint64_t (*)())_Block_copy(a6);
  if (v9)
  {
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = v9;
    v9 = sub_20C0481EC;
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = objc_allocWithZone((Class)type metadata accessor for TableActionMenu());
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  sub_20BFD8C2C((uint64_t)v9);
  id v15 = sub_20C047B9C((uint64_t)a3, (uint64_t)v13, a5, (uint64_t)v9, v10);
  sub_20BFCDA14((uint64_t)v9);
  sub_20C047D24();
  id v16 = (void *)sub_20C1605A0();

  sub_20BFCDA14((uint64_t)v9);

  return (ICTableActionMenu *)v16;
}

- (id)completion
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___ICTableActionMenu_completion);
  swift_beginAccess();
  if (*v2)
  {
    uint64_t v3 = v2[1];
    aBlock[4] = *v2;
    aBlock[5] = v3;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_20C01C598;
    aBlock[3] = &block_descriptor_30;
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
  v4 = (uint64_t (*)())_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_20C0481EC;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___ICTableActionMenu_completion);
  swift_beginAccess();
  uint64_t v7 = *v6;
  uint64_t *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_20BFCDA14(v7);
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)sub_20C010C94((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICTableActionMenu_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
}

- (UIBarButtonItem)presentingBarButtonItem
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___ICTableActionMenu_presentingBarButtonItem);
  swift_beginAccess();
  return (UIBarButtonItem *)*v2;
}

- (void)setPresentingBarButtonItem:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___ICTableActionMenu_presentingBarButtonItem);
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
  *(void *)(v3 + 32) = sub_20C046CB8();
  sub_20C162D20();

  sub_20C048174();
  uint64_t v5 = (void *)sub_20C162CE0();
  swift_bridgeObjectRelease();

  return v5;
}

- (id)makeMenu
{
  type metadata accessor for TableActionMenu();
  sub_20C047D24();
  uint64_t v3 = self;
  v4 = (void *)sub_20C1605A0();

  return v4;
}

- (ICTableActionMenu)init
{
  result = (ICTableActionMenu *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  sub_20BFCDA14(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___ICTableActionMenu_completion));
  swift_unknownObjectWeakDestroy();
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICTableActionMenu_presentingBarButtonItem);
}

@end