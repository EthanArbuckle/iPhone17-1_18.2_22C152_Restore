@interface IssueViewerViewController
- (UINavigationItem)navigationItem;
- (UIViewController)childViewControllerForStatusBarHidden;
- (_TtC12NewsArticles25IssueViewerViewController)initWithCoder:(id)a3;
- (_TtC12NewsArticles25IssueViewerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)viewingLocation;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation IssueViewerViewController

- (UIViewController)childViewControllerForStatusBarHidden
{
  return (UIViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                     + OBJC_IVAR____TtC12NewsArticles25IssueViewerViewController_contentViewController));
}

- (UINavigationItem)navigationItem
{
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12NewsArticles25IssueViewerViewController_contentViewController);
  if (v3)
  {
    v4 = (UINavigationItem *)objc_msgSend(v3, sel_navigationItem);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)swift_getObjectType();
    v4 = [(IssueViewerViewController *)&v7 navigationItem];
  }
  v5 = v4;
  return v5;
}

- (_TtC12NewsArticles25IssueViewerViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1BF76B548();
}

- (_TtC12NewsArticles25IssueViewerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC12NewsArticles25IssueViewerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles25IssueViewerViewController_contentViewControllerFactory);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles25IssueViewerViewController_styler);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles25IssueViewerViewController_sceneStateManager);
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles25IssueViewerViewController_contentViewController));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC12NewsArticles25IssueViewerViewController_afterLoad);
  sub_1BF4C35A0(v3);
}

- (void)viewDidLoad
{
  v2 = self;
  IssueViewerViewController.viewDidLoad()();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  id v4 = v8.receiver;
  [(IssueViewerViewController *)&v8 viewWillAppear:v3];
  id v5 = objc_msgSend(v4, sel_navigationController, v8.receiver, v8.super_class);
  if (v5)
  {
    v6 = v5;
    id v7 = objc_msgSend(v5, sel_navigationBar);

    objc_msgSend(v7, sel_setPrefersLargeTitles_, 0);
  }
  sub_1BF7DDBA8();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = (char *)v7.receiver;
  [(IssueViewerViewController *)&v7 viewDidAppear:v3];
  __swift_project_boxed_opaque_existential_1(&v4[OBJC_IVAR____TtC12NewsArticles25IssueViewerViewController_sceneStateManager], *(void *)&v4[OBJC_IVAR____TtC12NewsArticles25IssueViewerViewController_sceneStateManager + 24]);
  sub_1BF76B7E0(&qword_1EA157B78, v5, (void (*)(uint64_t))type metadata accessor for IssueViewerViewController);
  sub_1BF7DDEC8();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = v7.receiver;
  [(IssueViewerViewController *)&v7 viewWillDisappear:v3];
  if (objc_msgSend(v4, sel_isMovingFromParentViewController, v7.receiver, v7.super_class))
  {
    id v5 = objc_msgSend(v4, sel_navigationController);
    if (v5)
    {
      id v6 = v5;
      objc_msgSend(v5, sel_setToolbarHidden_animated_, 1, 1);

      id v4 = v6;
    }
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v4 = self;
  IssueViewerViewController.viewDidDisappear(_:)(a3);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  id v6 = self;
  v9.is_nil = (char)v6;
  objc_super v7 = v6;
  v9.value.super.isa = (Class)a3;
  IssueViewerViewController.traitCollectionDidChange(_:)(v9);
}

- (unint64_t)viewingLocation
{
  return 2;
}

@end