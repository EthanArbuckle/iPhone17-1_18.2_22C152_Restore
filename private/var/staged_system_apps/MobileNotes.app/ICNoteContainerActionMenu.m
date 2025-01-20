@interface ICNoteContainerActionMenu
+ (id)menuWithNoteContainer:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 viewControllerManager:(id)a6 completion:(id)a7;
+ (id)menuWithNoteContainer:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 viewControllerManager:(id)a6 deferredChildren:(BOOL)a7 completion:(id)a8;
+ (id)menuWithVirtualSmartFolder:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 viewControllerManager:(id)a6 completion:(id)a7;
+ (id)menuWithVirtualSmartFolder:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 viewControllerManager:(id)a6 deferredChildren:(BOOL)a7 completion:(id)a8;
- (ICAccount)account;
- (ICFolder)folder;
- (ICNAEventReporter)eventReporter;
- (ICNoteContainer)noteContainer;
- (ICNoteContainerActionMenu)init;
- (ICNoteContainerActionMenu)initWithNoteContainer:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 viewControllerManager:(id)a6 completion:(id)a7;
- (ICNoteContainerActionMenu)initWithVirtualSmartFolder:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 viewControllerManager:(id)a6 completion:(id)a7;
- (ICViewControllerManager)viewControllerManager;
- (ICVirtualSmartFolderItemIdentifier)recentlyDeletedMathNotesFolder;
- (ICVirtualSmartFolderItemIdentifier)virtualSmartFolder;
- (NSManagedObjectContext)context;
- (UIBarButtonItem)presentingBarButtonItem;
- (UIViewController)presentingViewController;
- (id)completion;
- (id)debugSectionMenu;
- (id)mainSectionMenu;
- (id)menuSections;
- (id)smartFolderSectionMenu;
- (void)setCompletion:(id)a3;
- (void)setContext:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setRecentlyDeletedMathNotesFolder:(id)a3;
- (void)setViewControllerManager:(id)a3;
@end

@implementation ICNoteContainerActionMenu

- (ICAccount)account
{
  return (ICAccount *)sub_10036E640((uint64_t)self);
}

- (NSManagedObjectContext)context
{
  return (NSManagedObjectContext *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                           + OBJC_IVAR___ICNoteContainerActionMenu_context));
}

- (void)setContext:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICNoteContainerActionMenu_context);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICNoteContainerActionMenu_context) = (Class)a3;
  id v3 = a3;
}

- (ICNAEventReporter)eventReporter
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v4 = (void *)Strong;
    self;
    uint64_t v5 = swift_dynamicCastObjCClass();
    if (v5)
    {
      v6 = (void *)v5;
      v7 = self;
      id v8 = [v6 eventReporter];
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return (ICNAEventReporter *)v8;
}

- (ICFolder)folder
{
  return (ICFolder *)sub_10036E640((uint64_t)self);
}

- (ICVirtualSmartFolderItemIdentifier)recentlyDeletedMathNotesFolder
{
  return (ICVirtualSmartFolderItemIdentifier *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                       + OBJC_IVAR___ICNoteContainerActionMenu_recentlyDeletedMathNotesFolder));
}

- (void)setRecentlyDeletedMathNotesFolder:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICNoteContainerActionMenu_recentlyDeletedMathNotesFolder);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICNoteContainerActionMenu_recentlyDeletedMathNotesFolder) = (Class)a3;
  id v3 = a3;
}

- (ICNoteContainer)noteContainer
{
  return (ICNoteContainer *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                    + OBJC_IVAR___ICNoteContainerActionMenu_noteContainer));
}

- (ICViewControllerManager)viewControllerManager
{
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (ICViewControllerManager *)Strong;
}

- (void)setViewControllerManager:(id)a3
{
}

- (ICVirtualSmartFolderItemIdentifier)virtualSmartFolder
{
  return (ICVirtualSmartFolderItemIdentifier *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                       + OBJC_IVAR___ICNoteContainerActionMenu_virtualSmartFolder));
}

- (ICNoteContainerActionMenu)initWithNoteContainer:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 viewControllerManager:(id)a6 completion:(id)a7
{
  v11 = (uint64_t (*)())_Block_copy(a7);
  if (v11)
  {
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = v11;
    v11 = sub_1002A5318;
  }
  else
  {
    uint64_t v12 = 0;
  }
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v17 = (ICNoteContainerActionMenu *)sub_10036F86C(v13, (uint64_t)v14, a5, (uint64_t)v16, (uint64_t)v11, v12);
  sub_10002E70C((uint64_t)v11);

  return v17;
}

+ (id)menuWithNoteContainer:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 viewControllerManager:(id)a6 completion:(id)a7
{
  v11 = (uint64_t (*)())_Block_copy(a7);
  if (v11)
  {
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = v11;
    v11 = sub_1002A5318;
  }
  else
  {
    uint64_t v12 = 0;
  }
  v24 = *(uint64_t (**)(id, id, id, id, uint64_t (*)(), uint64_t))(swift_getObjCClassMetadata() + 240);
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = v13;
  id v18 = v14;
  id v19 = v15;
  id v20 = v16;
  sub_10002E71C((uint64_t)v11);
  v21 = (void *)v24(v17, v18, a5, v20, v11, v12);
  type metadata accessor for NoteContainerActionMenu();
  sub_10036FBF4();
  v22.super.super.isa = ActionMenuProvider.makeMenu(deferredChildren:)(1).super.super.isa;

  sub_10002E70C((uint64_t)v11);

  return v22.super.super.isa;
}

+ (id)menuWithNoteContainer:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 viewControllerManager:(id)a6 deferredChildren:(BOOL)a7 completion:(id)a8
{
  uint64_t v12 = (uint64_t (*)())_Block_copy(a8);
  if (v12)
  {
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = v12;
    uint64_t v12 = sub_1002A5318;
  }
  else
  {
    uint64_t v13 = 0;
  }
  v25 = *(uint64_t (**)(id, id, id, id, uint64_t (*)(), uint64_t))(swift_getObjCClassMetadata() + 240);
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = v14;
  id v19 = v15;
  id v20 = v16;
  id v21 = v17;
  sub_10002E71C((uint64_t)v12);
  UIMenu v22 = (void *)v25(v18, v19, a5, v21, v12, v13);
  type metadata accessor for NoteContainerActionMenu();
  sub_10036FBF4();
  v23.super.super.isa = ActionMenuProvider.makeMenu(deferredChildren:)(a7).super.super.isa;

  sub_10002E70C((uint64_t)v12);

  return v23.super.super.isa;
}

- (ICNoteContainerActionMenu)initWithVirtualSmartFolder:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 viewControllerManager:(id)a6 completion:(id)a7
{
  v11 = (uint64_t (*)())_Block_copy(a7);
  if (v11)
  {
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = v11;
    v11 = sub_1002A5318;
  }
  else
  {
    uint64_t v12 = 0;
  }
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = (ICNoteContainerActionMenu *)sub_10036FA14(v13, (uint64_t)v14, a5, (uint64_t)v16, (uint64_t)v11, v12);
  sub_10002E70C((uint64_t)v11);

  return v17;
}

+ (id)menuWithVirtualSmartFolder:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 viewControllerManager:(id)a6 completion:(id)a7
{
  v11 = (uint64_t (*)())_Block_copy(a7);
  if (v11)
  {
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = v11;
    v11 = sub_1002A5318;
  }
  else
  {
    uint64_t v12 = 0;
  }
  v24 = *(uint64_t (**)(id, id, id, id, uint64_t (*)(), uint64_t))(swift_getObjCClassMetadata() + 248);
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = v13;
  id v18 = v14;
  id v19 = v15;
  id v20 = v16;
  sub_10002E71C((uint64_t)v11);
  id v21 = (void *)v24(v17, v18, a5, v20, v11, v12);
  type metadata accessor for NoteContainerActionMenu();
  sub_10036FBF4();
  v22.super.super.isa = ActionMenuProvider.makeMenu(deferredChildren:)(1).super.super.isa;

  sub_10002E70C((uint64_t)v11);

  return v22.super.super.isa;
}

+ (id)menuWithVirtualSmartFolder:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 viewControllerManager:(id)a6 deferredChildren:(BOOL)a7 completion:(id)a8
{
  uint64_t v12 = (uint64_t (*)())_Block_copy(a8);
  if (v12)
  {
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = v12;
    uint64_t v12 = sub_1002A5318;
  }
  else
  {
    uint64_t v13 = 0;
  }
  v25 = *(uint64_t (**)(id, id, id, id, uint64_t (*)(), uint64_t))(swift_getObjCClassMetadata() + 248);
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = v14;
  id v19 = v15;
  id v20 = v16;
  id v21 = v17;
  sub_10002E71C((uint64_t)v12);
  UIMenu v22 = (void *)v25(v18, v19, a5, v21, v12, v13);
  type metadata accessor for NoteContainerActionMenu();
  sub_10036FBF4();
  v23.super.super.isa = ActionMenuProvider.makeMenu(deferredChildren:)(a7).super.super.isa;

  sub_10002E70C((uint64_t)v12);

  return v23.super.super.isa;
}

- (UIViewController)presentingViewController
{
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UIViewController *)Strong;
}

- (void)setPresentingViewController:(id)a3
{
}

- (UIBarButtonItem)presentingBarButtonItem
{
  return (UIBarButtonItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                    + OBJC_IVAR___ICNoteContainerActionMenu_presentingBarButtonItem));
}

- (id)completion
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR___ICNoteContainerActionMenu_completion))
  {
    uint64_t v2 = *(void *)&self->context[OBJC_IVAR___ICNoteContainerActionMenu_completion];
    v5[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICNoteContainerActionMenu_completion);
    v5[5] = v2;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 1107296256;
    v5[2] = sub_1002A43E4;
    v5[3] = &unk_100637700;
    id v3 = _Block_copy(v5);
    swift_retain();
    swift_release();
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (void)setCompletion:(id)a3
{
  uint64_t v4 = (uint64_t)_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v5;
    v6 = sub_100262970;
  }
  else
  {
    v6 = 0;
  }
  v7 = (void (**)(char, uint64_t, uint64_t))((char *)self + OBJC_IVAR___ICNoteContainerActionMenu_completion);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___ICNoteContainerActionMenu_completion);
  ICNoteContainerActionMenu *v7 = v6;
  v7[1] = (void (*)(char, uint64_t, uint64_t))v4;

  sub_10002E70C(v8);
}

- (id)menuSections
{
  uint64_t v2 = self;
  sub_10036BB18();

  sub_100031418(0, (unint64_t *)&qword_1006A4D30);
  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v3.super.isa;
}

- (id)mainSectionMenu
{
  uint64_t v2 = self;
  id v3 = sub_10036BE04();

  return v3;
}

- (id)smartFolderSectionMenu
{
  uint64_t v2 = self;
  id v3 = sub_10036BD34();

  return v3;
}

- (id)debugSectionMenu
{
  uint64_t v2 = self;
  v3.super.super.isa = sub_10036BFFC().super.super.isa;

  return v3.super.super.isa;
}

- (ICNoteContainerActionMenu)init
{
  result = (ICNoteContainerActionMenu *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();

  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___ICNoteContainerActionMenu_completion);

  sub_10002E70C(v3);
}

@end