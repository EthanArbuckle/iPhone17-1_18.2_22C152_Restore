@interface JSSplitWidgetViewController
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (CGSize)preferredContentSize;
- (_TtC16MusicApplication27JSSplitWidgetViewController)initWithCoder:(id)a3;
- (_TtC16MusicApplication27JSSplitWidgetViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)music_viewInheritedLayoutInsetsDidChange;
- (void)setPreferredContentSize:(CGSize)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation JSSplitWidgetViewController

- (_TtC16MusicApplication27JSSplitWidgetViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  _s16MusicApplication27JSSplitWidgetViewControllerC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)viewDidLoad
{
  v2 = self;
  JSSplitWidgetViewController.viewDidLoad()();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  JSSplitWidgetViewController.viewDidLayoutSubviews()();
}

- (void)music_viewInheritedLayoutInsetsDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v2 = v5.receiver;
  [(JSSplitWidgetViewController *)&v5 music_viewInheritedLayoutInsetsDidChange];
  sub_DBAB0();
  id v3 = [v2 view];
  if (v3)
  {
    v4 = v3;
    [v3 setNeedsLayout];
  }
  else
  {
    __break(1u);
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  v9.is_nil = (char)v6;
  v7 = v6;
  v9.value.super.isa = (Class)a3;
  JSSplitWidgetViewController.traitCollectionDidChange(_:)(v9);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  JSSplitWidgetViewController.viewWillTransition(to:with:)(a4, width, height);
  swift_unknownObjectRelease();
}

- (CGSize)preferredContentSize
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  [(JSSplitWidgetViewController *)&v4 preferredContentSize];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  ObjectType = (objc_class *)swift_getObjectType();
  v13.receiver = self;
  v13.super_class = ObjectType;
  v7 = self;
  [(JSSplitWidgetViewController *)&v13 preferredContentSize];
  double v9 = v8;
  double v11 = v10;
  v12.receiver = v7;
  v12.super_class = ObjectType;
  -[JSSplitWidgetViewController setPreferredContentSize:](&v12, "setPreferredContentSize:", width, height);
  sub_DCF64(v9, v11);
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(JSSplitWidgetViewController *)&v5 viewWillAppear:v3];
  sub_DD1F0(v3);
}

- (void)viewDidAppear:(BOOL)a3
{
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(JSSplitWidgetViewController *)&v5 viewWillDisappear:v3];
  sub_DD1F0(v3 | 0x40);
}

- (void)viewDidDisappear:(BOOL)a3
{
}

- (_TtC16MusicApplication27JSSplitWidgetViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  CGSize result = (_TtC16MusicApplication27JSSplitWidgetViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27JSSplitWidgetViewController_splitWidgetViewModel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27JSSplitWidgetViewController____lazy_storage___containerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27JSSplitWidgetViewController_leftContentViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication27JSSplitWidgetViewController_rightContentViewController));

  swift_bridgeObjectRelease();
}

@end