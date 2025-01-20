@interface JSDrivenViewController
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (NSString)title;
- (UIBarButtonItem)accessibilityContextBarButtonItem;
- (UIColor)viewBackgroundColor;
- (UIViewController)childViewControllerForStatusBarStyle;
- (_TtC16MusicApplication22JSDrivenViewController)init;
- (_TtC16MusicApplication22JSDrivenViewController)initWithCoder:(id)a3;
- (_TtC16MusicApplication22JSDrivenViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)contentScrollView;
- (int64_t)preferredStatusBarStyle;
- (void)dealloc;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)setTitle:(id)a3;
- (void)setViewBackgroundColor:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation JSDrivenViewController

- (_TtC16MusicApplication22JSDrivenViewController)init
{
  return (_TtC16MusicApplication22JSDrivenViewController *)JSDrivenViewController.init()();
}

- (_TtC16MusicApplication22JSDrivenViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  _s16MusicApplication22JSDrivenViewControllerC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)dealloc
{
  v2 = self;
  JSDrivenViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22JSDrivenViewController_componentController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22JSDrivenViewController_contentViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22JSDrivenViewController_pageHeaderContentViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22JSDrivenViewController_promotionalParallaxViewController));
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication22JSDrivenViewController_ppt_onContentIsReady));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22JSDrivenViewController_presentationSegue));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22JSDrivenViewController_pushSegue));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22JSDrivenViewController_offlineMessageView));
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22JSDrivenViewController_artistRadioStationController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22JSDrivenViewController_browseContentItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22JSDrivenViewController____lazy_storage___contextualActionsButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22JSDrivenViewController_cancelBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22JSDrivenViewController_contextBarButtonItem));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_1A538((uint64_t)self + OBJC_IVAR____TtC16MusicApplication22JSDrivenViewController_metricsPageProperties, (uint64_t *)&unk_DC5B70);
}

- (UIViewController)childViewControllerForStatusBarStyle
{
  return (UIViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                     + OBJC_IVAR____TtC16MusicApplication22JSDrivenViewController_contentViewController));
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  JSDrivenViewController.preferredContentSizeDidChange(forChildContentContainer:)(a3);
  swift_unknownObjectRelease();
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  v9.is_nil = (char)v6;
  v7 = v6;
  v9.value.super.isa = (Class)a3;
  JSDrivenViewController.traitCollectionDidChange(_:)(v9);
}

- (void)viewDidLoad
{
  v2 = self;
  JSDrivenViewController.viewDidLoad()();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  JSDrivenViewController.viewDidLayoutSubviews()();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  JSDrivenViewController.viewWillAppear(_:)(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  JSDrivenViewController.viewDidAppear(_:)(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  JSDrivenViewController.viewWillDisappear(_:)(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  JSDrivenViewController.viewDidDisappear(_:)(a3);
}

- (NSString)title
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for JSDrivenViewController();
  id v2 = v7.receiver;
  id v3 = [(JSDrivenViewController *)&v7 title];
  if (v3)
  {
    v4 = v3;
    sub_AB6510();

    NSString v5 = sub_AB64D0();
    swift_bridgeObjectRelease();
  }
  else
  {

    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- (void)setTitle:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_AB6510();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  objc_super v7 = self;
  JSDrivenViewController.title.setter(v4, v6);
}

- (UIColor)viewBackgroundColor
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for JSDrivenViewController();
  id v2 = [(JSDrivenViewController *)&v4 viewBackgroundColor];

  return v2;
}

- (void)setViewBackgroundColor:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for JSDrivenViewController();
  id v4 = a3;
  uint64_t v5 = (char *)v8.receiver;
  [(JSDrivenViewController *)&v8 setViewBackgroundColor:v4];
  id v6 = *(id *)&v5[OBJC_IVAR____TtC16MusicApplication22JSDrivenViewController_contentViewController];
  id v7 = [v5 viewBackgroundColor];
  [v6 setViewBackgroundColor:v7];
}

- (void)willMoveToParentViewController:(id)a3
{
  id v5 = a3;
  id v6 = self;
  v9.is_nil = (char)v6;
  id v7 = v6;
  v9.value.super.super.isa = (Class)a3;
  JSDrivenViewController.willMove(toParent:)(v9);
}

- (int64_t)preferredStatusBarStyle
{
  id v3 = (void **)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication22JSDrivenViewController_promotionalParallaxViewController);
  swift_beginAccess();
  id v4 = *v3;
  if (!v4) {
    return (int64_t)[*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication22JSDrivenViewController_contentViewController) preferredStatusBarStyle];
  }
  id v5 = self;
  id v6 = v4;
  int64_t v7 = PromotionalParallaxViewController.preferredStatusBarStyle.getter();

  return v7;
}

- (id)contentScrollView
{
  id v2 = [*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication22JSDrivenViewController_contentViewController) contentScrollView];

  return v2;
}

- (UIBarButtonItem)accessibilityContextBarButtonItem
{
  return (UIBarButtonItem *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                    + OBJC_IVAR____TtC16MusicApplication22JSDrivenViewController_contextBarButtonItem));
}

- (_TtC16MusicApplication22JSDrivenViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC16MusicApplication22JSDrivenViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end