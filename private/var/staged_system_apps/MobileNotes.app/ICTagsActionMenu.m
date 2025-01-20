@interface ICTagsActionMenu
+ (id)menuWithTagSelection:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 viewControllerManager:(id)a6 deferredChildren:(BOOL)a7 delegate:(id)a8 completion:(id)aBlock;
+ (id)menuWithTagSelection:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 viewControllerManager:(id)a6 delegate:(id)a7 completion:(id)a8;
- (ICNAEventReporter)eventReporter;
- (ICTagSelection)tagSelection;
- (ICTagsActionMenu)init;
- (ICTagsActionMenu)initWithTagSelection:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 viewControllerManager:(id)a6 delegate:(id)a7 completion:(id)a8;
- (ICTagsActionMenuDelegate)delegate;
- (ICViewControllerManager)viewControllerManager;
- (UIBarButtonItem)presentingBarButtonItem;
- (UIViewController)presentingViewController;
- (id)completion;
- (id)menuSections;
- (void)setCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPresentingBarButtonItem:(id)a3;
- (void)setPresentingViewController:(id)a3;
@end

@implementation ICTagsActionMenu

- (ICNAEventReporter)eventReporter
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    v4 = (void *)Strong;
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

- (ICTagSelection)tagSelection
{
  return (ICTagSelection *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                   + OBJC_IVAR___ICTagsActionMenu_tagSelection));
}

- (ICTagsActionMenuDelegate)delegate
{
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (ICTagsActionMenuDelegate *)Strong;
}

- (void)setDelegate:(id)a3
{
}

- (ICTagsActionMenu)initWithTagSelection:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 viewControllerManager:(id)a6 delegate:(id)a7 completion:(id)a8
{
  v13 = (uint64_t (*)())_Block_copy(a8);
  if (v13)
  {
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = v13;
    v13 = sub_1002A5318;
  }
  else
  {
    uint64_t v14 = 0;
  }
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  swift_unknownObjectRetain();
  v19 = (ICTagsActionMenu *)sub_1002A5138(v15, (uint64_t)v16, a5, v18, (uint64_t)a7, (uint64_t)v13, v14);
  sub_10002E70C((uint64_t)v13);

  swift_unknownObjectRelease();
  return v19;
}

+ (id)menuWithTagSelection:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 viewControllerManager:(id)a6 delegate:(id)a7 completion:(id)a8
{
  v13 = (uint64_t (*)())_Block_copy(a8);
  if (v13)
  {
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = v13;
    v13 = sub_1002A5318;
  }
  else
  {
    uint64_t v14 = 0;
  }
  id v15 = objc_allocWithZone((Class)swift_getObjCClassMetadata());
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  swift_unknownObjectRetain();
  sub_10002E71C((uint64_t)v13);
  id v20 = sub_1002A5138(v16, (uint64_t)v17, a5, v19, (uint64_t)a7, (uint64_t)v13, v14);
  sub_10002E70C((uint64_t)v13);
  sub_1002A5278();
  v21.super.super.isa = ActionMenuProvider.makeMenu(deferredChildren:)(1).super.super.isa;

  sub_10002E70C((uint64_t)v13);
  swift_unknownObjectRelease();

  return v21.super.super.isa;
}

+ (id)menuWithTagSelection:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5 viewControllerManager:(id)a6 deferredChildren:(BOOL)a7 delegate:(id)a8 completion:(id)aBlock
{
  uint64_t v14 = (uint64_t (*)())_Block_copy(aBlock);
  if (v14)
  {
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = v14;
    uint64_t v14 = sub_1002A5318;
  }
  else
  {
    uint64_t v15 = 0;
  }
  id v16 = objc_allocWithZone((Class)swift_getObjCClassMetadata());
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  swift_unknownObjectRetain();
  sub_10002E71C((uint64_t)v14);
  id v21 = sub_1002A5138(v17, (uint64_t)v18, a5, v20, (uint64_t)a8, (uint64_t)v14, v15);
  sub_10002E70C((uint64_t)v14);
  sub_1002A5278();
  v22.super.super.isa = ActionMenuProvider.makeMenu(deferredChildren:)(a7).super.super.isa;

  sub_10002E70C((uint64_t)v14);
  swift_unknownObjectRelease();

  return v22.super.super.isa;
}

- (id)completion
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR___ICTagsActionMenu_completion))
  {
    uint64_t v2 = *(void *)&self->tagSelection[OBJC_IVAR___ICTagsActionMenu_completion];
    v5[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICTagsActionMenu_completion);
    v5[5] = v2;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 1107296256;
    v5[2] = sub_1002A43E4;
    v5[3] = &unk_100632F38;
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
  v7 = (void (**)(char, uint64_t, uint64_t))((char *)self + OBJC_IVAR___ICTagsActionMenu_completion);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___ICTagsActionMenu_completion);
  ICTagsActionMenu *v7 = v6;
  v7[1] = (void (*)(char, uint64_t, uint64_t))v4;

  sub_10002E70C(v8);
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
                                                                    + OBJC_IVAR___ICTagsActionMenu_presentingBarButtonItem));
}

- (void)setPresentingBarButtonItem:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICTagsActionMenu_presentingBarButtonItem);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICTagsActionMenu_presentingBarButtonItem) = (Class)a3;
  id v3 = a3;
}

- (ICViewControllerManager)viewControllerManager
{
  return (ICViewControllerManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                            + OBJC_IVAR___ICTagsActionMenu_viewControllerManager));
}

- (id)menuSections
{
  uint64_t v2 = self;
  sub_1002A2B08();

  sub_100031418(0, (unint64_t *)&qword_1006A4D30);
  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v3.super.isa;
}

- (ICTagsActionMenu)init
{
  result = (ICTagsActionMenu *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10015E5E8((uint64_t)self + OBJC_IVAR___ICTagsActionMenu_delegate);
  sub_10002E70C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___ICTagsActionMenu_completion));
  swift_unknownObjectWeakDestroy();

  NSArray v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___ICTagsActionMenu_viewControllerManager);
}

@end