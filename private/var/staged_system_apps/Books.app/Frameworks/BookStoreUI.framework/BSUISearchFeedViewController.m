@interface BSUISearchFeedViewController
- (BOOL)bc_analyticsVisibilityOfSelf;
- (BOOL)bc_navBarVisible;
- (BOOL)handleActionForObject:(id)a3 withName:(id)a4 arguments:(id)a5;
- (Class)jsaFeedControllerClass;
- (UIEdgeInsets)navigationBarMetricsLayoutMargins;
- (_TtC11BookStoreUI28BSUISearchFeedViewController)initWithCoder:(id)a3;
- (_TtC11BookStoreUI28BSUISearchFeedViewController)initWithFeedContent:(id)a3 manager:(id)a4 factory:(id)a5;
- (_TtC11BookStoreUI28BSUISearchFeedViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC11BookStoreUI28BSUISearchFeedViewController)initWithOptions:(id)a3;
- (void)bc_setNavBarVisible:(BOOL)a3;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)feedController:(id)a3 dismissKeyboard:(id)a4;
- (void)feedController:(id)a3 wantsToPresentCardsWithCardArray:(id)a4 focusedIndex:(unint64_t)a5 animated:(BOOL)a6 options:(id)a7 completion:(id)a8;
- (void)feedController:(id)a3 wantsToUpdateSearchText:(id)a4;
- (void)navigationBarItemsDidUpdate:(id)a3 hasItems:(BOOL)a4;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation BSUISearchFeedViewController

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for BSUISearchFeedViewController();
  swift_unknownObjectRetain();
  id v7 = v8.receiver;
  -[BSUIFeedViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  [v7 _updateNavigationLayoutMetrics];
  swift_unknownObjectRelease();
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  objc_super v8 = _Block_copy(a5);
  if (v8)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v8;
    objc_super v8 = sub_7AFB0;
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = a3;
  v11 = self;
  sub_790A4(v10, a4, (uint64_t)v8, v9);
  sub_77710((uint64_t)v8);
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = sub_7AFB0;
  }
  else
  {
    uint64_t v7 = 0;
  }
  objc_super v8 = self;
  sub_79358(a3, (uint64_t)v6, v7);
  sub_77710((uint64_t)v6);
}

- (BOOL)bc_analyticsVisibilityOfSelf
{
  v2 = self;
  v3 = [(BSUIFeedViewController *)v2 navigationItem];
  v4 = [(UINavigationItem *)v3 searchController];

  if (v4
    && (id v5 = [(UISearchController *)v4 presentedViewController],
        v4,
        v5))
  {

    return 0;
  }
  else
  {
    v8.receiver = v2;
    v8.super_class = (Class)type metadata accessor for BSUISearchFeedViewController();
    BOOL v6 = [(BSUISearchFeedViewController *)&v8 bc_analyticsVisibilityOfSelf];
  }
  return v6;
}

- (BOOL)bc_navBarVisible
{
  v2 = self;
  unsigned __int8 v3 = sub_796F4();

  return v3 & 1;
}

- (void)bc_setNavBarVisible:(BOOL)a3
{
  BOOL v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for BSUISearchFeedViewController();
  [(BSUISearchFeedViewController *)&v4 bc_setNavBarVisible:v3];
}

- (Class)jsaFeedControllerClass
{
  sub_63BF0(0, &qword_3C7C50);

  return (Class)swift_getObjCClassFromMetadata();
}

- (void)feedController:(id)a3 dismissKeyboard:(id)a4
{
  BOOL v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    BOOL v6 = sub_7AFA8;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a3;
  uint64_t v9 = self;
  sub_79840((uint64_t)v8, (uint64_t)v6, v7);
  sub_77710((uint64_t)v6);
}

- (void)feedController:(id)a3 wantsToPresentCardsWithCardArray:(id)a4 focusedIndex:(unint64_t)a5 animated:(BOOL)a6 options:(id)a7 completion:(id)a8
{
  v12 = _Block_copy(a8);
  sub_63BAC(&qword_3C7C58);
  uint64_t v13 = sub_2E4640();
  uint64_t v14 = sub_2E4350();
  if (v12)
  {
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = v12;
    v12 = sub_7AF98;
  }
  else
  {
    uint64_t v15 = 0;
  }
  id v16 = a3;
  v17 = self;
  sub_79B4C((uint64_t)v16, v13, a5, a6, v14, v12, v15);
  sub_77710((uint64_t)v12);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)feedController:(id)a3 wantsToUpdateSearchText:(id)a4
{
  uint64_t v6 = sub_2E4420();
  unint64_t v8 = v7;
  id v9 = a3;
  id v10 = self;
  if ((sub_79ECC(v6, v8) & 1) == 0)
  {
    v11 = (uint64_t *)&v10->super.TUIFeedViewController_opaque[OBJC_IVAR____TtC11BookStoreUI28BSUISearchFeedViewController_pendingSearchText];
    uint64_t *v11 = v6;
    v11[1] = v8;
  }

  swift_bridgeObjectRelease();
}

- (UIEdgeInsets)navigationBarMetricsLayoutMargins
{
  v2 = self;
  double v3 = sub_7A20C();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  double v10 = v3;
  double v11 = v5;
  double v12 = v7;
  double v13 = v9;
  result.right = v13;
  result.bottom = v12;
  result.left = v11;
  result.top = v10;
  return result;
}

- (BOOL)handleActionForObject:(id)a3 withName:(id)a4 arguments:(id)a5
{
  if (a3)
  {
    id v8 = a4;
    id v9 = a5;
    double v10 = self;
    swift_unknownObjectRetain();
    sub_2E4B80();
    swift_unknownObjectRelease();
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v11 = 0;
    uint64_t v13 = 0;
    if (a5) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v14 = 0;
    goto LABEL_8;
  }
  memset(v20, 0, sizeof(v20));
  id v15 = a4;
  id v16 = a5;
  v17 = self;
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v11 = sub_2E4420();
  uint64_t v13 = v12;

  if (!a5) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v14 = (objc_class *)sub_2E4350();

LABEL_8:
  unsigned __int8 v18 = sub_7A3E8((uint64_t)v20, v11, v13, v14);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_7AF00((uint64_t)v20);
  return v18 & 1;
}

- (void)navigationBarItemsDidUpdate:(id)a3 hasItems:(BOOL)a4
{
  id v6 = a3;
  double v7 = self;
  sub_7A734((uint64_t)v6, a4);
}

- (_TtC11BookStoreUI28BSUISearchFeedViewController)initWithFeedContent:(id)a3 manager:(id)a4 factory:(id)a5
{
  id v9 = &self->super.TUIFeedViewController_opaque[OBJC_IVAR____TtC11BookStoreUI28BSUISearchFeedViewController_pendingSearchText];
  double v10 = (objc_class *)type metadata accessor for BSUISearchFeedViewController();
  *(void *)id v9 = 0;
  *((void *)v9 + 1) = 0;
  v12.receiver = self;
  v12.super_class = v10;
  return [(BSUISearchFeedViewController *)&v12 initWithFeedContent:a3 manager:a4 factory:a5];
}

- (_TtC11BookStoreUI28BSUISearchFeedViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_2E4420();
    id v6 = &self->super.TUIFeedViewController_opaque[OBJC_IVAR____TtC11BookStoreUI28BSUISearchFeedViewController_pendingSearchText];
    *(void *)id v6 = 0;
    *((void *)v6 + 1) = 0;
    id v7 = a4;
    NSString v8 = sub_2E43E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v9 = &self->super.TUIFeedViewController_opaque[OBJC_IVAR____TtC11BookStoreUI28BSUISearchFeedViewController_pendingSearchText];
    *(void *)id v9 = 0;
    *((void *)v9 + 1) = 0;
    id v10 = a4;
    NSString v8 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for BSUISearchFeedViewController();
  uint64_t v11 = [(BSUISearchFeedViewController *)&v13 initWithNibName:v8 bundle:a4];

  return v11;
}

- (_TtC11BookStoreUI28BSUISearchFeedViewController)initWithCoder:(id)a3
{
  double v5 = &self->super.TUIFeedViewController_opaque[OBJC_IVAR____TtC11BookStoreUI28BSUISearchFeedViewController_pendingSearchText];
  id v6 = (objc_class *)type metadata accessor for BSUISearchFeedViewController();
  *(void *)double v5 = 0;
  *((void *)v5 + 1) = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return [(BSUISearchFeedViewController *)&v8 initWithCoder:a3];
}

- (_TtC11BookStoreUI28BSUISearchFeedViewController)initWithOptions:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_2E4350();
  }
  else {
    uint64_t v3 = 0;
  }
  return (_TtC11BookStoreUI28BSUISearchFeedViewController *)BSUISearchFeedViewController.init(options:)(v3);
}

- (void).cxx_destruct
{
}

@end